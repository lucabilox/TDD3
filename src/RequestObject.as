package
{
									
	public class RequestObject
	{
		public var application_id:String; //( 32 characters ) : Our system will accept payments from different apps, so we need to keep track of this.
		public var order_id:String; //( 32 characters ) : App order ID , to be able to trace the payment back, and for the IPN ( read below ).
		public var cc_type:String; //( 16 characters ) : One of ( VISA | MASTERCARD | AMEX )
		public var cc_beholder:String; //( 64 characters ) 
		public var cc_number:String; //( 16 digits )
		public var cc_expiry_month:String; //( 2 digits )
		public var cc_expiry_year:String; //( 2 digits )
		public var cc_cvv:String; //( 7 digits )
		public var charge_amount:String; //( 12 digits , dot separated decimals )
		public var charge_currency:String; //( 3 digits ) : Optional parameter, ISO 4217 http://en.wikipedia.org/wiki/ISO_4217 , Default EUR
		public var security_key:String; //( 32 characters ) : The requests include a code to ensure they are real transaction requests.
		public var ipn_endpoint:String;// : optional, URL where our system will notify of the payment success before printing the output. Explained below. This feature can be considered an extended feature, and delivered in a second "release".
		public var api_version:String; //( integer ) : represents the api version used. [1-2]

		public function RequestObject()
		{
			
		}
	}
}