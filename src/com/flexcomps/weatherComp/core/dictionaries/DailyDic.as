package com.flexcomps.weatherComp.core.dictionaries
{
  import flash.utils.Dictionary;
  
  public class DailyDic
  {
    static public var daysToInteger:  Dictionary  = createDicDaysToInteger();
    static public var daysEngToHeb:   Dictionary  = createDicDaysEngToHeb();
    
    private static function createDicDaysToInteger():Dictionary
    {
      var dic:Dictionary = new Dictionary();
      
      dic["Sun"]  = 0;
      dic["Mon"]  = 1;
      dic["Tue"]  = 2;
      dic["Wed"]  = 3;
      dic["Thu"]  = 4;
      dic["Fri"]  = 5;
      dic["Sat"]  = 6;
      
      return dic;
    }
    
    private static function createDicDaysEngToHeb():Dictionary
    {
      var dic:Dictionary = new Dictionary();
      
      dic["Sun"]  = "ראשון";
      dic["Mon"]  = "שני";
      dic["Tue"]  = "שלישי";
      dic["Wed"]  = "רביעי";
      dic["Thu"]  = "חמישי";
      dic["Fri"]  = "שישי";
      dic["Sat"]  = "שבת";
      
      return dic;
    }
    
  }
}