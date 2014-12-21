package com.flexcomps.virtualKeyboard
{
	public class KeyTranslation
	{
		public var code: uint;
		public var value: String;
		
		public function KeyTranslation(code: uint, value: String)
		{
			this.code = code;
			this.value = value;
		}
	}
}