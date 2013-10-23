package
{
	public class SecurityKeyValidatorVersion1 implements ISecurityKeyValidator
	{
		private var requestParameters:Array;
		
		public function SecurityKeyValidatorVersion1()
		{
			init();
		}
		
		private function init():void
		{
			requestParameters = new Array();
			requestParameters.push("application_id");
			requestParameters.push("order_id");
			requestParameters.push("cc_type");
			requestParameters.push("cc_beholder");
			requestParameters.push("cc_number");
			requestParameters.push("cc_expiry_month");
			requestParameters.push("cc_expiry_year");
			requestParameters.push("cc_cvv");
			requestParameters.push("charge_amount");
		}
		
		public function validate(request:RequestObject):Boolean
		{
			var validateString:String = "";
			
			for (var i:int = 0; i < requestParameters.length; i++) 
			{
				validateString += (request[requestParameters[i]] as String).charAt(0);
			}
			
			return (validateString == request.security_key);
		}
	}
}