package com.flexcomps.weatherComp.core.dictionaries
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;

	public class CodeClassifier
	{
		[Embed(source="com/flexcomps/weatherComp/assets/icons/05.png")]
		static public var i_5:Class;
		
		[Embed(source="com/flexcomps/weatherComp/assets/icons/04.png")]
		static private var i_4:Class;
		
		[Embed(source="com/flexcomps/weatherComp/assets/icons/03.png")]
		static private var i_3:Class;
		
		[Embed(source="com/flexcomps/weatherComp/assets/icons/02.png")]
		static private var i_2:Class;
		
		[Embed(source="com/flexcomps/weatherComp/assets/icons/01.png")]
		static private var i_1:Class;
		
		[Embed(source="com/flexcomps/weatherComp/assets/icons/10.png")]
		static private var i_10:Class;
		
		[Embed(source="com/flexcomps/weatherComp/assets/icons/11.png")]
		static private var i_11:Class;
		
		[Embed(source="com/flexcomps/weatherComp/assets/icons/19.png")]
		static private var i_19:Class;
		
		[Embed(source="com/flexcomps/weatherComp/assets/icons/23.png")]
		static private var i_23:Class;
		
		[Embed(source="com/flexcomps/weatherComp/assets/icons/36.png")]
		static private var i_36:Class;
		
		[Embed(source="com/flexcomps/weatherComp/assets/icons/37.png")]
		static private var i_37:Class;
		
		[Embed(source="com/flexcomps/weatherComp/assets/icons/38.png")]
		static private var i_38:Class;
		
		static public var IMG_CLASSIFY_PARTLY_CLOUDY:				Bitmap 			= new i_5() as Bitmap;//"com/flexcomps/weatherComp/assets/icons/05.png";
		static public var IMG_CLASSIFY_PARTLY_CLOUDY_NIGHT:	Bitmap 			= new i_5() as Bitmap;//"com/flexcomps/weatherComp/assets/icons/05.png";
		static public var IMG_CLASSIFY_PARTLY_SUNNY:				Bitmap 			= new i_4() as Bitmap;//"com/flexcomps/weatherComp/assets/icons/04.png";
		static public var IMG_CLASSIFY_CLOUDY:							Bitmap 			= new i_3() as Bitmap;//"com/flexcomps/weatherComp/assets/icons/03.png";
		static public var IMG_CLASSIFY_CLOUDY_NIGHT:				Bitmap 			= new i_3() as Bitmap;//"roComps/roWeatherComp/assets/icons/03.png";
		static public var IMG_CLASSIFY_SUNNY:								Bitmap 			= new i_1() as Bitmap;//"roComps/roWeatherComp/assets/icons/01.png";
		static public var IMG_CLASSIFY_NIGHT_CLEAR:					Bitmap 			= new i_10() as Bitmap;//"roComps/roWeatherComp/assets/icons/10.png";
		static public var IMG_CLASSIFY_RAINY:								Bitmap 			= new i_11() as Bitmap;//"roComps/roWeatherComp/assets/icons/11.png";
		static public var IMG_CLASSIFY_SNOW:								Bitmap 			= new i_19() as Bitmap;//"roComps/roWeatherComp/assets/icons/19.png";
		static public var IMG_CLASSIFY_STORM:								Bitmap 			= new i_38() as Bitmap;//"roComps/roWeatherComp/assets/icons/38.png";
		static public var IMG_CLASSIFY_WINDY:								Bitmap 			= new i_36() as Bitmap;//"roComps/roWeatherComp/assets/icons/36.png";
		static public var IMG_CLASSIFY_COLD:								Bitmap 			= new i_2() as Bitmap;//"roComps/roWeatherComp/assets/icons/02.png";
		static public var IMG_CLASSIFY_HAIL:								Bitmap 			= new i_23() as Bitmap;//"roComps/roWeatherComp/assets/icons/23.png";
		static public var IMG_CLASSIFY_FOG:									Bitmap 			= new i_37() as Bitmap;//"roComps/roWeatherComp/assets/icons/37.png";
		static public var IMG_CLASSIFY_NOT_AVAILABLE:				Bitmap 			= null;
		
		static public var DESC_CLASSIFY_PARTLY_CLOUDY:			String 			= "מעונן חלקית";
		static public var DESC_CLASSIFY_PARTLY_CLOUDY_NIGHT:String 			= "מעונן חלקית";
		static public var DESC_CLASSIFY_PARTLY_SUNNY:				String 			= "שמש חלקי";
		static public var DESC_CLASSIFY_CLOUDY:							String 			= "מעונן";
		static public var DESC_CLASSIFY_CLOUDY_NIGHT:				String 			= "מעונן";
		static public var DESC_CLASSIFY_SUNNY:							String 			= "שמש";
		static public var DESC_CLASSIFY_NIGHT_CLEAR:				String 			= "בהיר";
		static public var DESC_CLASSIFY_RAINY:							String 			= "גשום";
		static public var DESC_CLASSIFY_SNOW:								String 			= "שלג";
		static public var DESC_CLASSIFY_STORM:							String 			= "סערה";
		static public var DESC_CLASSIFY_WINDY:							String 			= "רוחות";
		static public var DESC_CLASSIFY_COLD:								String 			= "קרה";
		static public var DESC_CLASSIFY_HAIL:								String 			= "ברד";
		static public var DESC_CLASSIFY_FOG:								String 			= "ערפל";
		static public var DESC_CLASSIFY_rain_and_sleet:			String 			= "גשם וברד";
		static public var DESC_CLASSIFY_rain_and_snow:			String 			= "גשם ושלג";
		static public var DESC_CLASSIFY_HOT:								String 			= "עומס חום";
		static public var DESC_CLASSIFY_NOT_AVAILABLE:			String 			= "";
		
		
		static public var conditionCodesIconClassifier: 		Dictionary	=	createIconDic();
		static public var conditionCodesDescClassifier: 		Dictionary	=	createDescDic();

		public static function classifyWeatherCodeIcon($code:	uint):Object
		{
			return conditionCodesIconClassifier[YahooCodesDic.yahooConditionCodes[$code]];
		}
		
		public static function classifyWeatherCodeDesc($code:	uint):String
		{
			return conditionCodesDescClassifier[YahooCodesDic.yahooConditionCodes[$code]];
		}
		
		private static function createDescDic():Dictionary
		{
			var dic:	Dictionary = new Dictionary();
			
			dic["tornado"]		 						 = DESC_CLASSIFY_STORM;
			dic["tropical storm"]		 			 = DESC_CLASSIFY_STORM;
			dic["hurricane"]		 					 = DESC_CLASSIFY_STORM;
			dic["severe thunderstorms"]		 = DESC_CLASSIFY_STORM;
			dic["thunderstorms"]					 = DESC_CLASSIFY_STORM;
			dic["mixed rain and snow"]     = DESC_CLASSIFY_rain_and_snow;
			dic["mixed rain and sleet"]    = DESC_CLASSIFY_rain_and_sleet;
			dic["mixed snow and sleet"]    = DESC_CLASSIFY_SNOW;
			dic["freezing drizzle"]        = DESC_CLASSIFY_COLD;
			dic["drizzle"]								 = DESC_CLASSIFY_RAINY;
			dic["freezing rain"]			 		 = DESC_CLASSIFY_RAINY;
			dic["showers"]								 = DESC_CLASSIFY_RAINY;
			dic["showers"]								 = DESC_CLASSIFY_RAINY;
			dic["snow flurries"]		 			 = DESC_CLASSIFY_SNOW;
			dic["light snow showers"]			 = DESC_CLASSIFY_SNOW;
			dic["blowing snow"]						 = DESC_CLASSIFY_SNOW;
			dic["snow"]										 = DESC_CLASSIFY_SNOW;
			dic["hail"]										 = DESC_CLASSIFY_HAIL;
			dic["sleet"]									 = DESC_CLASSIFY_HAIL;
			dic["dust"]										 = DESC_CLASSIFY_FOG;
			dic["foggy"]									 = DESC_CLASSIFY_FOG;
			dic["haze"]										 = DESC_CLASSIFY_FOG;
			dic["smoky"]									 = DESC_CLASSIFY_FOG;
			dic["blustery"]								 = DESC_CLASSIFY_WINDY;
			dic["windy"]									 = DESC_CLASSIFY_WINDY;
			dic["cold"]										 = DESC_CLASSIFY_COLD;
			dic["cloudy"]									 = DESC_CLASSIFY_CLOUDY;
			dic["mostly cloudy (night)"]	 = DESC_CLASSIFY_CLOUDY;
			dic["mostly cloudy (day)"]		 = DESC_CLASSIFY_CLOUDY_NIGHT;
			dic["partly cloudy (night)"]	 = DESC_CLASSIFY_PARTLY_CLOUDY_NIGHT;
			dic["partly cloudy (day)"]		 = DESC_CLASSIFY_PARTLY_CLOUDY;
			dic["clear (night)"]					 = DESC_CLASSIFY_NIGHT_CLEAR;
			dic["sunny"]									 = DESC_CLASSIFY_SUNNY;
			dic["fair (night)"]						 = DESC_CLASSIFY_NIGHT_CLEAR;// mostly clear
			dic["fair (day)"]							 = DESC_CLASSIFY_SUNNY; // mostly sunny
			dic["mixed rain and hail"]		 = DESC_CLASSIFY_RAINY;
			dic["hot"]										 = DESC_CLASSIFY_HOT;
			dic["isolated thunderstorms"]	 = DESC_CLASSIFY_STORM;
			dic["scattered thunderstorms"] = DESC_CLASSIFY_STORM;
			dic["scattered thunderstorms"] = DESC_CLASSIFY_STORM;
			dic["scattered showers"]			 = DESC_CLASSIFY_RAINY;
			dic["heavy snow"]							 = DESC_CLASSIFY_SNOW;
			dic["scattered snow showers"]	 = DESC_CLASSIFY_SNOW;
			dic["heavy snow"]							 = DESC_CLASSIFY_SNOW;
			dic["partly cloudy"]					 = DESC_CLASSIFY_PARTLY_CLOUDY;
			dic["thundershowers"]					 = DESC_CLASSIFY_STORM;
			dic["snow showers"]						 = DESC_CLASSIFY_SNOW;
			dic["isolated thundershowers"] = DESC_CLASSIFY_STORM;
			dic["not available"]					 = DESC_CLASSIFY_NOT_AVAILABLE;
			
			return dic;
		}

		private static function createIconDic():Dictionary
		{
			var dic:	Dictionary = new Dictionary();
			
			dic["tornado"]		 						 = IMG_CLASSIFY_STORM;
			dic["tropical storm"]		 			 = IMG_CLASSIFY_STORM;
			dic["hurricane"]		 					 = IMG_CLASSIFY_STORM;
			dic["severe thunderstorms"]		 = IMG_CLASSIFY_STORM;
			dic["thunderstorms"]					 = IMG_CLASSIFY_STORM;
			dic["mixed rain and snow"]     = IMG_CLASSIFY_SNOW;
			dic["mixed rain and sleet"]    = IMG_CLASSIFY_RAINY;
			dic["mixed snow and sleet"]    = IMG_CLASSIFY_SNOW;
			dic["freezing drizzle"]        = IMG_CLASSIFY_RAINY;
			dic["drizzle"]								 = IMG_CLASSIFY_RAINY;
			dic["freezing rain"]			 		 = IMG_CLASSIFY_RAINY;
			dic["showers"]								 = IMG_CLASSIFY_RAINY;
			dic["showers"]								 = IMG_CLASSIFY_RAINY;
			dic["snow flurries"]		 			 = IMG_CLASSIFY_SNOW;
			dic["light snow showers"]			 = IMG_CLASSIFY_SNOW;
			dic["blowing snow"]						 = IMG_CLASSIFY_SNOW;
			dic["snow"]										 = IMG_CLASSIFY_SNOW;
			dic["hail"]										 = IMG_CLASSIFY_HAIL;
			dic["sleet"]									 = IMG_CLASSIFY_RAINY;
			dic["dust"]										 = IMG_CLASSIFY_FOG;
			dic["foggy"]									 = IMG_CLASSIFY_FOG;
			dic["haze"]										 = IMG_CLASSIFY_FOG;
			dic["smoky"]									 = IMG_CLASSIFY_FOG;
			dic["blustery"]								 = IMG_CLASSIFY_WINDY;
			dic["windy"]									 = IMG_CLASSIFY_WINDY;
			dic["cold"]										 = IMG_CLASSIFY_COLD;
			dic["cloudy"]									 = IMG_CLASSIFY_CLOUDY;
			dic["mostly cloudy (night)"]	 = IMG_CLASSIFY_CLOUDY;
			dic["mostly cloudy (day)"]		 = IMG_CLASSIFY_CLOUDY_NIGHT;
			dic["partly cloudy (night)"]	 = IMG_CLASSIFY_PARTLY_CLOUDY_NIGHT;
			dic["partly cloudy (day)"]		 = IMG_CLASSIFY_PARTLY_CLOUDY;
			dic["clear (night)"]					 = IMG_CLASSIFY_NIGHT_CLEAR;
			dic["sunny"]									 = IMG_CLASSIFY_SUNNY;
			dic["fair (night)"]						 = IMG_CLASSIFY_NIGHT_CLEAR;// mostly clear
			dic["fair (day)"]							 = IMG_CLASSIFY_SUNNY; // mostly sunny
			dic["mixed rain and hail"]		 = IMG_CLASSIFY_RAINY;
			dic["hot"]										 = IMG_CLASSIFY_SUNNY;
			dic["isolated thunderstorms"]	 = IMG_CLASSIFY_STORM;
			dic["scattered thunderstorms"] = IMG_CLASSIFY_STORM;
			dic["scattered thunderstorms"] = IMG_CLASSIFY_STORM;
			dic["scattered showers"]			 = IMG_CLASSIFY_RAINY;
			dic["heavy snow"]							 = IMG_CLASSIFY_SNOW;
			dic["scattered snow showers"]	 = IMG_CLASSIFY_SNOW;
			dic["heavy snow"]							 = IMG_CLASSIFY_SNOW;
			dic["partly cloudy"]					 = IMG_CLASSIFY_PARTLY_CLOUDY;
			dic["thundershowers"]					 = IMG_CLASSIFY_STORM;
			dic["snow showers"]						 = IMG_CLASSIFY_SNOW;
			dic["isolated thundershowers"] = IMG_CLASSIFY_STORM;
			dic["not available"]					 = IMG_CLASSIFY_NOT_AVAILABLE;
			
			return dic;
		}

	}
}