const String appName = 'eDemand Provider';

//PLACE YOUR ADMIN PANEL DOMAIN HERE
const String domain = 'https://edemand.wrteam.me'; //demo

const String baseUrl = "$domain/partner/api/v1/";

const bool isDemoMode = true;

//if you do not want user to select another country rather than default country,
//then make below variable true
const bool allowOnlySingleCountry = false;

const String defaultCountryCode = 'IN';

const Map<String, dynamic> dateAndTimeSetting = {
  "dateFormat": "dd/MM/yyyy",
  "use24HourFormat": false,
};
