public with sharing class ParkLocator {
	public static List<String> country(String countryName){
		//ParkService parkService = new ParkService();
		ParkService.ParksImplPort parksImplPort = new ParkService.ParksImplPort();
	 	return parksImplPort.byCountry(countryName);
	}
}