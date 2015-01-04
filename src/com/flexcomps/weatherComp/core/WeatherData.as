package com.flexcomps.weatherComp.core
{
  public class WeatherData
  {
    private var _dailyWeathers: Vector.<DailyWeather> = null;
    private var _nowWeather:    DailyWeather          = null;
    
    private var _leastIndex:    int = -1;
    
    public function WeatherData()
    {
      _dailyWeathers  = new Vector.<DailyWeather>(7);
    }
    
    public function addDailyWeather($dailyWeather:  DailyWeather):void
    {
      _dailyWeathers[$dailyWeather.integerDay] = $dailyWeather;
    }
    
    public function clear():void
    {
      for(var ix:uint = 0; ix < _dailyWeathers.length; ix++)
        _dailyWeathers[ix] = null;
    }
    
    public function get nowWeather():DailyWeather {
      return _nowWeather;
    }
    public function set nowWeather(value:DailyWeather):void {
      _nowWeather = value;
    }
    
    public function get dailyWeathers():Vector.<DailyWeather>
    {
      return _dailyWeathers;
    }
    
    public function get leastIndex():int
    {
      if(_leastIndex == -1) {
        for(var ix:uint = 0; ix < _dailyWeathers.length; ix++) {
          if(_dailyWeathers[ix] != null){
            _leastIndex = ix;
            break;
          }
        }
      }
      
      return _leastIndex;
    }
    
  }
}