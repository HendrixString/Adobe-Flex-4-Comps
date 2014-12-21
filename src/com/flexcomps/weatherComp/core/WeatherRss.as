package com.flexcomps.weatherComp.core
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.system.System;
	import flash.utils.ByteArray;
	import flash.utils.unescapeMultiByte;
	
	public class WeatherRss
	{
		public var cb_onComplete:						Function			=	null;
		public var cb_onError:							Function			=	null;
		
		private var _xml:										XML						=	null;
		
		private var _ul:										URLLoader			=	null;
		private var _ur:										URLRequest		=	null;
		
		private var _mrWeatherData:					WeatherData	=	null;
		
		public function WeatherRss()
		{
			_ur												=	new URLRequest("http://weather.yahooapis.com/forecastrss?w=1967461&u=c");
			var rh:	URLRequestHeader	=	new URLRequestHeader("Content-Type", "application/xml; charset=utf-8");
			
			_ur.method 								= URLRequestMethod.GET;
			//_ur.requestHeaders.push(rh);
			
			_ul												=	new URLLoader();
			
			_ul.addEventListener(Event.COMPLETE, 				onComplete);
			_ul.addEventListener(IOErrorEvent.IO_ERROR, onError);
			
			_ul.dataFormat 						= URLLoaderDataFormat.TEXT;
			
			_mrWeatherData						=	new WeatherData();
		}
		
		public function load():void
		{
			_ul.load(_ur);
		}
		
		private function onComplete(event:Event):void
		{
			try{
				_xml														=	new XML(_ul.data);
			}
			catch(err:Error){
				trace("Weather: xml error" + err);
				onError();
				return;
			}
			
			var xmlns:						Namespace 	= _xml.namespace("yweather")
				
			var xmlAtmosphere:		XMLList			=	_xml.channel.xmlns::atmosphere;				
				
			var xmlNowCondition:	XMLList			=	_xml.channel.item.xmlns::condition;
			
			var xml5DaysWeather:	XMLList			=	_xml.channel.item.xmlns::forecast;
			
			_mrWeatherData.clear();
			
			for(var ix:uint	=	0; ix < xml5DaysWeather.length(); ix++)
			{
				var dailyWeather:DailyWeather = new DailyWeather(xml5DaysWeather[ix].@low, xml5DaysWeather[ix].@high, xml5DaysWeather[ix].@code, xml5DaysWeather[ix].@day, xml5DaysWeather[ix].@text);
				
				_mrWeatherData.addDailyWeather(dailyWeather);
			}
			
			_mrWeatherData.nowWeather	=	new DailyWeather(xmlNowCondition.@temp, xmlNowCondition.@temp, xmlNowCondition.@code, "Now", xmlNowCondition.@text, xmlAtmosphere.@humidity);
			
			if(cb_onComplete is Function)
				cb_onComplete();
		}
				
		private function onError(event:IOErrorEvent	=	null):void
		{
			if(cb_onError is Function)
				cb_onError();
		}
		
		public function get compliedDataProvider():Object
		{
			return _mrWeatherData;
		}

		public function get mrWeatherData():WeatherData
		{
			return _mrWeatherData;
		}
				
	}
}