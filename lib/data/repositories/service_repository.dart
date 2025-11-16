import 'package:oncall_lab/core/services/supabase_service.dart';
import 'package:oncall_lab/data/models/service_category_model.dart';
import 'package:oncall_lab/data/models/service_model.dart';
import 'package:oncall_lab/data/models/laboratory_service_model.dart';
import 'package:oncall_lab/data/models/doctor_service_model.dart';

class ServiceRepository {
  /// Get all service categories
  Future<List<ServiceCategoryModel>> getServiceCategories() async {
    final data = await supabase
        .from('service_categories')
        .select()
        .order('type, name');

    return (data as List)
        .map((json) => ServiceCategoryModel.fromJson(json))
        .toList();
  }

  /// Get services by category
  Future<List<ServiceModel>> getServicesByCategory(String categoryId) async {
    final data = await supabase
        .from('services')
        .select('*, service_categories(*)')
        .eq('category_id', categoryId)
        .eq('is_active', true)
        .order('name');

    return (data as List).map((json) => ServiceModel.fromJson(json)).toList();
  }

  /// Get all direct services (ultrasounds, ECG, nursing)
  Future<List<Map<String, dynamic>>> getDirectServices() async {
    final data = await supabase.rpc('get_direct_services');
    return List<Map<String, dynamic>>.from(data);
  }

  /// Get services offered by a laboratory
  Future<List<LaboratoryServiceModel>> getLaboratoryServices(
      String laboratoryId) async {
    final data = await supabase
        .from('laboratory_services')
        .select('*, services(*, service_categories(*))')
        .eq('laboratory_id', laboratoryId)
        .eq('is_available', true)
        .order('services(name)');

    return (data as List)
        .map((json) => LaboratoryServiceModel.fromJson(json))
        .toList();
  }

  /// Get doctors who offer a specific service
  Future<List<Map<String, dynamic>>> getDoctorsForService(
      String serviceId) async {
    final data = await supabase.rpc('get_doctors_for_service', params: {
      'p_service_id': serviceId,
    });

    return List<Map<String, dynamic>>.from(data);
  }

  /// Search services
  Future<List<Map<String, dynamic>>> searchServices(String searchTerm) async {
    final data = await supabase.rpc('search_services', params: {
      'p_search_term': searchTerm,
    });

    return List<Map<String, dynamic>>.from(data);
  }

  /// Get a specific service by ID
  Future<ServiceModel> getServiceById(String serviceId) async {
    final data = await supabase
        .from('services')
        .select('*, service_categories(*)')
        .eq('id', serviceId)
        .single();

    return ServiceModel.fromJson(data);
  }

  /// Get a specific laboratory service
  Future<LaboratoryServiceModel> getLaboratoryService(
      String laboratoryServiceId) async {
    final data = await supabase
        .from('laboratory_services')
        .select('*, services(*, service_categories(*))')
        .eq('id', laboratoryServiceId)
        .single();

    return LaboratoryServiceModel.fromJson(data);
  }

  /// Get a specific doctor service
  Future<DoctorServiceModel> getDoctorService(String doctorServiceId) async {
    final data = await supabase
        .from('doctor_services')
        .select('*, services(*, service_categories(*))')
        .eq('id', doctorServiceId)
        .single();

    return DoctorServiceModel.fromJson(data);
  }
}
