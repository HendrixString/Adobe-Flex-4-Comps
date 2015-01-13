package com.flexcomps.bitmapButton
{
  
  import com.flexcomps.bitmapButton.BitmapButtonSkin;
  
  import org.osmf.layout.ScaleMode;
  
  import spark.components.Button;
  
  public class BitmapButton extends Button
  {
    private var _srcDown:     Object;
    private var _srcUp:       Object;
    private var _srcOver:     Object;
    private var _srcDisabled: Object;
		private var _scaleMode:String = ScaleMode.STRETCH;

    public function BitmapButton()
    {
      super();
      
      _srcDown      = null;
      _srcUp        = null;
      _srcOver      = null;
      _srcDisabled  = null;
      
      setStyle("skinClass", BitmapButtonSkin);
      
      autoRepeat = false;
    }
    
		public function get scaleMode():String {	return _scaleMode;	}
		public function set scaleMode(value:String):void
		{
			_scaleMode = value;
		}

    public function get srcDown(): Object {
      return _srcDown;
    }
    public function set srcDown(value: Object): void {
      _srcDown = value;
    }
    
    public function get srcUp(): Object {
      return _srcUp;
    }
    public function set srcUp(value: Object): void {
      _srcUp = value;
    }
    
    public function get srcOver(): Object {
      return _srcOver;
    }
    public function set srcOver(value: Object): void {
      _srcOver = value;
    }
    
    public function get srcDisabled(): Object {
      return _srcDisabled;
    }
    public function set srcDisabled(value: Object): void {
      _srcDisabled = value;
    }
    
    public function get smoothing(): Boolean {
      return false;
    }
  }
}