class AppPaths {

  // Params keys
  static const organIdParam = 'organId';
  static const alterationIdParam = 'alterationId';

  // Fixed locations
  static const language = '/language';
  static const presentation = '/presentation';
  static const organs = '/organs';
  static const viewer = '/viewer';
  static const settings = '/settings';

  // Dynamic Locations

  static String organ(String organId) => '$organs/${Uri.encodeComponent(organId)}';
  
  static String normal(String organId) => '${organ(organId)}/normal';
  
  static String alterations(String organId) => '${organ(organId)}/alterations';
  
  static String alterationsDetail(String organId, String alterationId) => 
    '${alterations(organId)}/${Uri.encodeComponent(alterationId)}';


}


