package com.flexcomps.cameraDisplay.core
{
  import com.mreshet.flascc.ezbar.newQrScanner;
  import com.mreshet.flascc.ezbar.scan;
  
  import com.flexcomps.cameraDisplay.core.CameraController;
  
  import flash.display.BitmapData;
  import flash.events.Event;
  import flash.geom.Matrix;
  
  /**
   * @author Tomer Shalev
   */
  public class QRController
  {
    static public const STATUS_READING:	String 									= "STATUS_READING";
    static public const STATUS_IDLE:		String 									= "STATUS_IDLE";
    
    private var _scanner:								uint 										= 0;
    
    private var _flagStatus:						String									=	STATUS_IDLE;
    
    private var _flagScannerActive:			Boolean									=	false;
    
    /**
     * callback for successful detection
     */
    public 	var onSuccessDetectQR:			Function								=	null;
    
    /**
     * callback for failed detection
     */
    public 	var onFailedDetectQR:				Function								=	null;		
    
    public function QRController()
    {
      _flagStatus			=	STATUS_IDLE;
    }
    
    public function startQRReading():void
    {
      _flagScannerActive = true;
    }
    
    public function stopQRReading():void
    {
      _flagScannerActive = false;
    }
    
    public function init():void
    {			
      com.mreshet.flascc.ezbar.CModule.rootSprite = this;
      com.mreshet.flascc.ezbar.CModule.startAsync();			
      
      _scanner 																		= com.mreshet.flascc.ezbar.newQrScanner();			
    }
    
    static public function isSuccessCode(code:String):Boolean
    {
      return (code.search("ERROR") < 0);
    }
    
    public function detectQR(bd:BitmapData):String
    {
      if(_flagStatus == STATUS_READING)
        return null;
      
      _flagStatus				=	STATUS_READING;
      
      com.mreshet.flascc.ezbar.start(_scanner, bd.width, bd.height);
      
      var code: String 	= com.mreshet.flascc.ezbar.scan(_scanner, bd, bd);
      
      if (code.search("ERROR") < 0)	{
        com.mreshet.flascc.ezbar.stop(_scanner);
        
        if(onSuccessDetectQR is Function)
          onSuccessDetectQR(code);
      }
      else {
        if(onFailedDetectQR is Function)
          onFailedDetectQR(code);
      }
      
      _flagStatus				=	STATUS_IDLE;
      
      return code;
    }
    
  }
  
}