package
{
	public class SecurityKeyValidatorVersion2 implements ISecurityKeyValidator
	{
		public function SecurityKeyValidatorVersion2()
		{
		}
		
		public function validate(req:RequestObject):Boolean
		{
			return false;
		}
	}
}