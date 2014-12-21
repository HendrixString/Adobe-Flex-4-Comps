package com.flexcomps.virtualKeyboard
{
	import spark.components.supportClasses.ButtonBase;

	public class Key
	{
		public var code: uint;
		public var button: ButtonBase;
		public var shiftable: Boolean;
		public var char: String;
		public var shiftChar: String;
		
		public function Key(code: uint, button: ButtonBase, shiftable: Boolean = true, 
												char: String = null, shiftChar: String = null)
		{
			this.code				= code;
			this.button			= button;
			this.shiftable	= shiftable;
			this.char				= char;
			this.shiftChar	= shiftChar;
		}
	}
}