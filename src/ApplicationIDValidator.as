package
{
	public class ApplicationIDValidator
	{
		private static var applicationIdList:Vector.<String> = new <String>[
			"dds",
			"pps",
			"bws"
		];
		private static var _applicationIDValidator:ApplicationIDValidator;
		
		public function ApplicationIDValidator()
		{
		}
		
		public static function getInstance():ApplicationIDValidator
		{
			if (_applicationIDValidator == null)
			{
				_applicationIDValidator = new ApplicationIDValidator();
			}
			return _applicationIDValidator;
		}

		public function isValidApplicationID(appID:String):Boolean
		{
			return applicationIdList.indexOf(appID) > -1;
		}
		
	}
}