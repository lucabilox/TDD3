package
{
	
	public class PaymentServiceProvider
	{
		public var applicationIdList:Vector.<String>;
		
		public function PaymentServiceProvider()
		{
			
		}
		
		public function parseRequest(req:RequestObject):XML
		{
			if(areMissingParameters(req))
			{
				return createErrorResponse(Constants.ERROR_EMPTY);
			}
			else if(!ApplicationIDValidator.getInstance().isValidApplicationID(req.application_id))
			{
				return createErrorResponse(Constants.ERROR_APPLICATION_ID);
			}
			else
			{
				return createSuccessResponse();
			}
		}
		
		private function areMissingParameters(request:RequestObject):Boolean
		{
			var areMissing:Boolean = false;
			
			if (request.application_id == null)
			{
				areMissing = true;
			}
			
			return areMissing
		}
		
		private function createSuccessResponse():XML
		{
			var response:XML =<xml>
							<success>1</success>
							<transaction_id></transaction_id>
							</xml>;

			return response;
		}
		
		private function createErrorResponse(errorType:String):XML
		{
			var response:XML =<xml>
							<success>0</success>
							<transaction_id></transaction_id>
							<error_message></error_message>
							</xml>;
			
			response.error_message.appendChild(errorType);
			
			return response;
		}
		
		
	}
}

/*application_id ( 32 characters ) : Our system will accept payments from different apps, so we need to keep track of this.
	
order_id ( 32 characters ) : App order ID , to be able to trace the payment back, and for the IPN ( read below ).
		
cc_type ( 16 characters ) : One of ( VISA | MASTERCARD | AMEX )

cc_beholder ( 64 characters )

cc_number ( 16 digits )

cc_expiry_month ( 2 digits )

cc_expiry_year ( 2 digits )

cc_cvv ( 7 digits )

charge_amount ( 12 digits , dot separated decimals )

charge_currency ( 3 digits ) : Optional parameter, ISO 4217 http://en.wikipedia.org/wiki/ISO_4217 , Default EUR

security_key ( 32 characters ) : The requests include a code to ensure they are real transaction requests.
	
ipn_endpoint : optional, URL where our system will notify of the payment success before printing the output. Explained below. This feature can be considered an extended feature, and delivered in a second "release".
		
api_version ( integer ) : represents the api version used. [1-2]*/