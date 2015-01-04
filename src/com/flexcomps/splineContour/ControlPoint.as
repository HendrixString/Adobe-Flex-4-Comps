package com.flexcomps.splineContour
{
  import flash.display.BitmapData;
  import flash.display.Shape;
  import flash.events.Event;
  import flash.events.MouseEvent;
  import flash.geom.Matrix;
  import flash.geom.Point;
  import flash.geom.Rectangle;
  
  import mx.events.FlexEvent;
  
  import spark.core.SpriteVisualElement;
  
  public class ControlPoint extends SpriteVisualElement
  {
    private var _thickness:   uint;
    private var _color:       uint;
    private var _mouseDown:   Boolean;
    private var _mouseLastXY: Point;
    private var _delta:       Point;
    
    private var _bmpIconUp:   BitmapData;
    private var _bmpIconDown: BitmapData;
    
    private var _shp:         Shape;
    private var _bound:       Rectangle
    
    public var cb_onUpdate:   Function  = null;;  
    
    public function ControlPoint($w:Number, $h:Number, $thickness:uint = 1, $color:uint = 0x000000)
    {
      super();
      
      width         = $w;
      height        = $h;
      
      _mouseDown    = false;
      
      _thickness    = $thickness;
      _color        = $color;
      
      buttonMode    = true;
      
      _bound        = new Rectangle(0,0,$w,$h);
      
      addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }
    
    public function update($w:Number = 0, $h:Number = 0, $thickness:uint = 1, $color:uint = 0x000000, $state:String = "up"):void
    {
      if(_shp == null)
        return;
      
      width         = $w == 0 ? width   : $w;
      height        = $h == 0 ? height  : $h;
      
      if(_bmpIconUp!=null && _bmpIconDown!=null) {
        _shp.graphics.clear();
        
        if($state == "up")
          _shp.graphics.beginBitmapFill(_bmpIconUp, new Matrix(), false, true);
        else
          _shp.graphics.beginBitmapFill(_bmpIconDown, new Matrix(), false, true);
        _shp.graphics.drawRect(0,0,_bmpIconUp.width, _bmpIconUp.height);
        _shp.graphics.endFill();
        
        return;
      }
      
      graphics.clear();
      graphics.lineStyle($thickness, $color);
      graphics.beginFill(0x00, 0.5)
      graphics.drawRect(0, 0, $w, $h);
      graphics.endFill();
    }
    
    protected function onAddedToStage(event:Event):void
    {
      addEventListener(MouseEvent.MOUSE_OVER,   onMouseOver);
      addEventListener(MouseEvent.MOUSE_MOVE,   onMouseMove);
      addEventListener(MouseEvent.MOUSE_OUT,    onMouseOut);
      addEventListener(MouseEvent.MOUSE_DOWN,   onMouseDown);
      addEventListener(MouseEvent.MOUSE_UP,     onMouseUp);
      
      if(_bmpIconUp) {
        _shp = new Shape();
        addChild(_shp);
        _shp.x -= _bmpIconUp.width / 2;
        _shp.y -= _bmpIconUp.width / 2;
      }
      
      update(width, height);
    }
    
    protected function onMouseMove(event:MouseEvent):void
    {
      if (_mouseDown == false)
        return;
      
      if (_mouseLastXY  ==  null) {
        _mouseLastXY  = new Point();
        _delta        = new Point();
      }
      else  {
        _delta.x      = _mouseLastXY.x - event.stageX;
        _delta.y      = _mouseLastXY.y - event.stageY;
      }
      
      //trace(_delta.x + "x" + _delta.y);
      
      _mouseLastXY.x  = event.stageX;
      _mouseLastXY.y  = event.stageY;
      
      startDrag(false, _bound);
      
      //x    -= _delta.x;
      //y    -= _delta.y;
      
      if(cb_onUpdate is Function)
        cb_onUpdate();
    }
    
    protected function onMouseOut(event:MouseEvent):void
    {
      update(width, height);
    }
    
    protected function onMouseUp(event:MouseEvent):void
    {
      _mouseDown  = false;
      
      event.target.stopDrag();
      
      update(width, height);
    }
    
    protected function onMouseDown(event:MouseEvent):void
    {
      _mouseDown  = true;
      
      update(width, height,1, 0xFF0000, "down");
    }
    
    protected function onMouseOver(event:MouseEvent):void
    {
      update(width, height,1, 0x00FF00, "up");
    }
    
    public function get bmpIconUp():                    BitmapData  { return _bmpIconUp;    }
    public function set bmpIconUp(value:BitmapData):    void        { _bmpIconUp = value;   }
    public function get bmpIconDown():                  BitmapData  { return _bmpIconDown;  }
    public function set bmpIconDown(value:BitmapData):  void        { _bmpIconDown = value; }
    
    public function get bound():Rectangle { return _bound;  }
    public function set bound(value:Rectangle):void { _bound = value; }
    
  }
}