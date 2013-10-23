package flexUnitTests
{
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertTrue;

	public class TestSecurityKeyValidatorVersion1
	{		
		private static var secKeyValidator:SecurityKeyValidatorVersion1;
		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
			var request:RequestObject = new RequestObject();
			secKeyValidator = new SecurityKeyValidatorVersion1();
			request.application_id = "dds" ;
			request.order_id = "1234567890";
			request.cc_type = "VISA";
			request.cc_beholder = "Miguel Bilotta Perez";
			request.cc_number = "4321765409874321";
			request.cc_expiry_month = "12";
			request.cc_expiry_year = "2020";
			request.cc_cvv = "456";
			request.charge_amount = "30.50";
			request.api_version = "1" ;
			request.security_key = "d1VM41243"
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testIsValidSecurityKeyVersion1():void
		{
			var request:RequestObject = new RequestObject();
			request.application_id = "dds" ;
			request.order_id = "1234567890";
			request.cc_type = "VISA";
			request.cc_beholder = "Miguel Bilotta Perez";
			request.cc_number = "4321765409874321";
			request.cc_expiry_month = "12";
			request.cc_expiry_year = "2020";
			request.cc_cvv = "456";
			request.charge_amount = "30.50";
			request.api_version = "1" ;
			request.security_key = "d1VM41243"
			
			Assert.assertTrue(secKeyValidator.validate(request));	
		}
		
		[Test]
		public function testIsInvalidSecurityKeyVersion1():void
		{
			var request:RequestObject = new RequestObject();
			request.application_id = "pps" ;
			request.order_id = "6546457890";
			request.cc_type = "AMEX";
			request.cc_beholder = "Santos Bilotta Perez";
			request.cc_number = "9876765409874321";
			request.cc_expiry_month = "03";
			request.cc_expiry_year = "4020";
			request.cc_cvv = "543";
			request.charge_amount = "11.00";
			request.api_version = "1" ;
			request.security_key = "d1VM41243"
			
			Assert.assertFalse(secKeyValidator.validate(request));	
		}
	}
}