package
{
	public class SecurityKeyValidator
	{
		public function SecurityKeyValidator()
		{
		}
		
		private static var apiVersionList:Vector.<String> = new <String>[
			"1",
			"2"
		];
		
		private static var _securityKeyValidator:SecurityKeyValidator;
		
		
		public static function getInstance():SecurityKeyValidator
		{
			if (_securityKeyValidator == null)
			{
				_securityKeyValidator = new SecurityKeyValidator();
			}
			return _securityKeyValidator;
		}
		
		public function isValidApiVersion(apiVersion :String):Boolean
		{
			return apiVersionList.indexOf(apiVersion) > -1;
		}
		
	}
}