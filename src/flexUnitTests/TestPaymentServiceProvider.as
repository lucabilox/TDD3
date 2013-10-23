package flexUnitTests
{
	import flexunit.framework.Assert;

	public class TestPaymentServiceProvider
	{		
		private static var psp:PaymentServiceProvider;
		
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
			psp = new PaymentServiceProvider();
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testParseRequestNotNull():void
		{
			var request:RequestObject = new RequestObject();
			Assert.assertNotNull(psp.parseRequest(request));
		}
		
		[Test]
		public function testParseEmptyRequest():void
		{
			var request:RequestObject = new RequestObject();
			var responseXML:XML = psp.parseRequest(request);
			
			Assert.assertEquals(responseXML.success.toString(), "0");
			Assert.assertEquals(responseXML.error_message.toString(), Constants.ERROR_EMPTY);
		}
		
		[Test]
		public function testValidApplicationID():void
		{
			var request:RequestObject = new RequestObject();
			request.application_id = "dds" ;
			var responseXML:XML = psp.parseRequest(request);
			
			Assert.assertEquals(responseXML.success.toString(), "1");
			
		}
		
		[Test]
		public function testInvalidApplicationID():void
		{
			var request:RequestObject = new RequestObject();
			request.application_id = "dsfds" ;
			var responseXML:XML = psp.parseRequest(request);
			
			Assert.assertEquals(responseXML.success.toString(), "0");
			Assert.assertEquals(responseXML.error_message.toString(), Constants.ERROR_APPLICATION_ID);
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
			
			//Assert.assertEquals(responseXML.success.toString(), "1");	
		}
		
		
	}
}