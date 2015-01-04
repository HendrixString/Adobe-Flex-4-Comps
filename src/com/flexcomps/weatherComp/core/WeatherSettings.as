package com.flexcomps.weatherComp.core
{
  public class WeatherSettings
  {
    private static var ONE_MINUTE:                  uint = 1000*60; 
    private static var TEN_MINUTES:                 uint = ONE_MINUTE*10; 
    private static var ONE_HOUR:                    uint = ONE_MINUTE*60; 
    
    //public static var WEATHER_UPDATE_TIME_INTERVAL: uint = 1000*3;    
    public static var WEATHER_UPDATE_TIME_INTERVAL: uint = TEN_MINUTES;   
    
  }
}