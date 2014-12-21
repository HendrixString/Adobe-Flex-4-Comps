package com.flexcomps.weatherComp.core.dictionaries
{
	import flash.utils.Dictionary;
	
	public class YahooCodesDic
	{
		static public var yahooConditionCodes:Dictionary	=	createDic();
		
		private static function createDic():Dictionary
		{
			var dic:	Dictionary = new Dictionary();
			
			dic[0] 		= "tornado";
			dic[1] 		= "tropical storm";
			dic[2] 		= "hurricane";
			dic[3] 		= "severe thunderstorms";
			dic[4] 		= "thunderstorms";
			dic[5] 		= "mixed rain and snow";
			dic[6] 		= "mixed rain and sleet";
			dic[7] 		= "mixed snow and sleet";
			dic[8] 		= "freezing drizzle";
			dic[9] 		= "drizzle";
			dic[10] 	= "freezing rain";
			dic[11] 	= "showers";
			dic[12] 	= "showers";
			dic[13] 	= "snow flurries";
			dic[14] 	= "light snow showers";
			dic[15] 	= "blowing snow";
			dic[16] 	= "snow";
			dic[17] 	= "hail";
			dic[18] 	= "sleet";
			dic[19] 	= "dust";
			dic[20] 	= "foggy";
			dic[21] 	= "haze";
			dic[22] 	= "smoky";
			dic[23] 	= "blustery";
			dic[24] 	= "windy";
			dic[25] 	= "cold";
			dic[26] 	= "cloudy";
			dic[27] 	= "mostly cloudy (night)";
			dic[28] 	= "mostly cloudy (day)";
			dic[29] 	= "partly cloudy (night)";
			dic[30] 	= "partly cloudy (day)";
			dic[31] 	= "clear (night)";
			dic[32] 	= "sunny";
			dic[33] 	= "fair (night)";// mostly clear
			dic[34] 	= "fair (day)"; // mostly sunny
			dic[35] 	= "mixed rain and hail";
			dic[36] 	= "hot";
			dic[37] 	= "isolated thunderstorms";
			dic[38] 	= "scattered thunderstorms";
			dic[39] 	= "scattered thunderstorms";
			dic[40] 	= "scattered showers";
			dic[41] 	= "heavy snow";
			dic[42] 	= "scattered snow showers";
			dic[43] 	= "heavy snow";
			dic[44] 	= "partly cloudy";
			dic[45] 	= "thundershowers";
			dic[46] 	= "snow showers";
			dic[47] 	= "isolated thundershowers";
			dic[3200] = "not available";

			return dic;
		}
	}
}