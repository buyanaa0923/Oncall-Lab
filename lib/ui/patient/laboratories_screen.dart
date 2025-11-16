import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:oncall_lab/core/constants/app_colors.dart';
import 'package:oncall_lab/core/services/supabase_service.dart';
import 'package:oncall_lab/ui/patient/laboratory_detail_screen_new.dart';

class LaboratoriesScreen extends StatefulWidget {
  final String? preSelectedServiceId;
  final String? serviceName;

  const LaboratoriesScreen({
    super.key,
    this.preSelectedServiceId,
    this.serviceName,
  });

  @override
  State<LaboratoriesScreen> createState() => _LaboratoriesScreenState();
}

class _LaboratoriesScreenState extends State<LaboratoriesScreen> {
  List<Map<String, dynamic>> laboratories = [];
  List<Map<String, dynamic>> filteredLaboratories = [];
  bool isLoading = true;
  String? errorMessage;
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    _loadLaboratories();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadLaboratories() async {
    try {
      // If a service is pre-selected, only load laboratories offering that service
      if (widget.preSelectedServiceId != null) {
        final data = await supabase
            .from('laboratory_services')
            .select('laboratories(*)')
            .eq('service_id', widget.preSelectedServiceId!)
            .eq('is_available', true);

        final labs = data
            .map((item) => item['laboratories'] as Map<String, dynamic>)
            .toList();

        setState(() {
          laboratories = labs;
          filteredLaboratories = labs;
          isLoading = false;
        });
      } else {
        // Load all laboratories
        final data = await supabase
            .from('laboratories')
            .select()
            .order('name');

        final labs = List<Map<String, dynamic>>.from(data);
        setState(() {
          laboratories = labs;
          filteredLaboratories = labs;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.serviceName != null
            ? 'Laboratories - ${widget.serviceName}'
            : 'Laboratories'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: AppColors.error, size: 48),
              const SizedBox(height: 16),
              Text(
                'Unable to load laboratories',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.grey),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    errorMessage = null;
                    isLoading = true;
                  });
                  _loadLaboratories();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (laboratories.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Iconsax.buildings, size: 60, color: AppColors.grey),
            SizedBox(height: 12),
            Text(
              'No laboratories available right now',
              style: TextStyle(
                color: AppColors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadLaboratories,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        itemCount: filteredLaboratories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearchBar(),
                if (filteredLaboratories.isEmpty) ...[
                  const SizedBox(height: 24),
                  _buildEmptyResult(),
                ] else
                  const SizedBox(height: 16),
              ],
            );
          }
          final lab = filteredLaboratories[index - 1];
          final isLast = index == filteredLaboratories.length;
          return Column(
            children: [
              _buildLabCard(lab),
              if (!isLast) const SizedBox(height: 12),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search laboratories...',
        prefixIcon: const Icon(Iconsax.search_normal_1, color: AppColors.primary),
        suffixIcon: _query.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.close, color: AppColors.grey),
                onPressed: () {
                  _searchController.clear();
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: AppColors.grey.withOpacity(0.1),
      ),
    );
  }

  Widget _buildLabCard(Map<String, dynamic> laboratory) {
    return _LaboratoryCard(
      laboratory: laboratory,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LaboratoryDetailScreenNew(
              laboratory: laboratory,
              preSelectedServiceId: widget.preSelectedServiceId,
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyResult() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Icon(Icons.search_off, color: AppColors.grey, size: 42),
          const SizedBox(height: 8),
          Text(
            'No laboratories match "$_query".',
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.grey),
          ),
        ],
      ),
    );
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim().toLowerCase();
    setState(() {
      _query = query;
      if (query.isEmpty) {
        filteredLaboratories = List<Map<String, dynamic>>.from(laboratories);
      } else {
        filteredLaboratories = laboratories.where((lab) {
          final name = (lab['name'] ?? '').toString().toLowerCase();
          final address = (lab['address'] ?? '').toString().toLowerCase();
          return name.contains(query) || address.contains(query);
        }).toList();
      }
    });
  }
}

class _LaboratoryCard extends StatelessWidget {
  const _LaboratoryCard({
    required this.laboratory,
    required this.onTap,
  });

  final Map<String, dynamic> laboratory;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final name = laboratory['name'] as String? ?? 'Laboratory';
    final address = laboratory['address'] as String? ?? 'Address not provided';
    final phone = laboratory['phone_number'] as String?;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.primary.withOpacity(0.15),
              child: const Icon(
                Iconsax.buildings,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    address,
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 13,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (phone != null && phone.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.phone, size: 14, color: AppColors.grey),
                        const SizedBox(width: 6),
                        Text(
                          phone,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const Icon(Iconsax.arrow_right_3, color: AppColors.grey),
          ],
        ),
      ),
    );
  }
}
