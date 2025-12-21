const String appName = 'Madwell Pro';

//PLACE YOUR ADMIN PANEL DOMAIN HERE
const String domain = 'https://madwell.madwell.pro'; //demo

const String baseUrl = "$domain/partner/api/v1/";

const bool isDemoMode = true;

//if you do not want user to select another country rather than default country,
//then make below variable true
const bool allowOnlySingleCountry = false;

const String defaultCountryCode = 'CM';

const Map<String, dynamic> dateAndTimeSetting = {
  "dateFormat": "dd/MM/yyyy",
  "use24HourFormat": true,
};
