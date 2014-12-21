package com.flexcomps.weatherComp.core
{
	import com.flexcomps.weatherComp.core.dictionaries.CodeClassifier;
	import com.flexcomps.weatherComp.core.dictionaries.DailyDic;
	
	import flash.display.Bitmap;

	public class DailyWeather
	{
		public var tempLow:						uint; 
		public var tempHigh:					uint;
		public var weatherCode:				uint;
		
		public var weatherDescYahoo:	String;
		
		public var weatherDescHeb:		String;
		public var weatherDescIcon:		Object;
		
		public var humidity:					uint;
		
		private var _day:         		String;
		private var _dayHeb:         	String;
		private var _integerDay:			uint;

		
		public function DailyWeather($tempLow: uint, $tempHigh: uint, $weatherCode: uint, $day: String, $weatherDescYahoo:String, $humidity:uint = 0)
		{
			tempHigh 					= $tempHigh;
			tempLow	 					= $tempLow;
			weatherCode				=	$weatherCode;
			day								= $day;
			weatherDescYahoo	= $weatherDescYahoo;
			humidity					=	$humidity;
			
			weatherDescHeb		=	CodeClassifier.classifyWeatherCodeDesc(weatherCode);
			weatherDescIcon		=	CodeClassifier.classifyWeatherCodeIcon(weatherCode);
			
			trace();
		}

		public function get day():String	{
			return _day;
		}
		public function set day(value: String):void	{
			_day 				= value;
			_dayHeb			=	DailyDic.daysEngToHeb[_day];
			_integerDay = DailyDic.daysToInteger[_day];
		}

		public function get integerDay():uint
		{
			return _integerDay;
		}

		public function get dayHeb():String
		{
			return _dayHeb;
		}


	}
}