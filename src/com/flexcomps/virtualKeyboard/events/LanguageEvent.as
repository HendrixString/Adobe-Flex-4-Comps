package com.flexcomps.virtualKeyboard.events
{
  import flash.events.Event;
  
  public class LanguageEvent extends Event
  {
    protected var _language: String;
    
    public static const LANGUAGE_CHANGED: String = "LANGUAGE_CHANGED";
    
    public static const HE: String = "Hebrew";
    public static const EN: String = "English";
    
    public function LanguageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false,
                                  language: String = "")
    {
      _language = language;
      super(type, bubbles, cancelable);
    }
    
    public function get language(): String {
      return _language;
    }
  }
}