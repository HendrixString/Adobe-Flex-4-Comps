package com.flexcomps.cameraDisplay.core
{
  import flash.display.BitmapData;
  import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.StatusEvent;
  import flash.geom.Matrix;
  import flash.media.Camera;
  import flash.media.Video;
  
  import mx.core.UIComponent;
  
  /**
   * a controller for mananging camera input
   * @author Tomer Shalev
   * 
   */
  public class CameraController
  {
    static public const STATUS_PAUSE:     String                    = "STATUS_PAUSE";
    static public const STATUS_RESUME:    String                    = "STATUS_RESUME";
    
    protected var _video:                 Video                     = null;
    protected var _camera:                Camera                    = null;
    
    protected var _streamFPS:             int                       = 15;
    protected var _streamW:               int                       = 1024;
    protected var _streamH:               int                       = 1024;
    protected var _workW:                 int                       = 0;
    protected var _workH:                 int                       = 0;
    protected var _downScaleRatio:        Number                    = 0.33;
    
    private var _cameraBufferWork:        BitmapData                = null;
    
    protected var _matCameraWork:         Matrix                    = null;
    
    private var _cameraBuffer:            BitmapData                = null;
    
    protected var _matIdentity:           Matrix                    = null;
    
    public var container:                 Sprite                    = null;
    
    public var onNewVideoFrame:           Function                  = null;
    public var onCameraUpdate:            Function                  = null;
    
    public function CameraController()
    {
      _matIdentity    = new Matrix();
      _matCameraWork  = new Matrix();
      
    }
    
    public function init():void
    {
      _camera                 = flash.media.Camera.getCamera();
      
      if(_camera == null) {
        notifyUpdate("Camera Controller: No camera found!!");
        return;
      }
      
      _camera.addEventListener(StatusEvent.STATUS, onStatus);
      
      _camera.setMode(_streamW, _streamH, _streamFPS, true);
      _camera.setQuality(0, 100);
      
      _video                  = new Video(_camera.width, _camera.height);
      _video.attachCamera(_camera);
      
      _cameraBuffer           = new BitmapData(_streamW, _streamH, false, 0x0);
      
      _workW                                      = _downScaleRatio * _streamW;
      _workH                                      = _downScaleRatio * _streamH;
      
      _cameraBufferWork                           = new BitmapData(_workW, _workH, false, 0x0);
      
      _matCameraWork.scale(_downScaleRatio, _downScaleRatio);
      
      notifyUpdate("Camera is inited successfully!!");
    }
    
    public function startVideoCapture():void
    {
      if(container && _video.parent!=container)
        container.addChild(_video);
      
      if(_camera) {
        trace(Event.VIDEO_FRAME)
        _camera.addEventListener(Event.VIDEO_FRAME, onVideoFrame);
      }
    }
    
    public function stopVideoCapture():void
    {
      if(_camera)
        _camera.removeEventListener(Event.VIDEO_FRAME, onVideoFrame);
    }
    
    protected function onStatus(event:StatusEvent):void
    {
      notifyUpdate(event.toString());
    }
    
    protected function onVideoFrame(e:Event = null):void
    {     
      notifyUpdate("new video frame captured");
      
      var m:  Matrix      = new Matrix();
      
      m.scale(-1, 1);
      m.translate(_cameraBuffer.width , 0);
      
      _cameraBuffer.draw(_video, m, null, null, null, false);
      
      if(onNewVideoFrame is Function)
        onNewVideoFrame(_cameraBuffer);
      
      _cameraBufferWork.draw(_video, _matCameraWork, null, null, null, false);
    }
    
    protected function notifyUpdate(obj:Object):void
    {
      if(onCameraUpdate is Function)
        onCameraUpdate(obj.toString());
    }
    
    public function getLatestBitmap(highQuality:Boolean = true):BitmapData
    {
      return highQuality ? _cameraBuffer : null;
    }
    
    public function get streamFPS():int { return _streamFPS;  }
    public function set streamFPS(value:int):void
    {
      _streamFPS = value;
    }
    
    public function get streamW():int { return _streamW;  }
    public function set streamW(value:int):void
    {
      _streamW = value;
    }
    
    public function get streamH():int { return _streamH;  }
    public function set streamH(value:int):void
    {
      _streamH = value;
    }
    
    /**
     * down scale ratio for work buffer
     */
    public function get downScaleRatio():Number { return _downScaleRatio; }
    public function set downScaleRatio(value:Number):void
    {
      _downScaleRatio = value;
    }
    
    /**
     *  a low res bitmapdata for processing 
     */
    public function get cameraBufferWork():BitmapData
    {
      return _cameraBufferWork;
    }
    
    public function get cameraBuffer():BitmapData
    {
      return _cameraBuffer;
    }
    
    
  }
  
}