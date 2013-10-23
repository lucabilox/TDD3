package
{
	import Array;
	
	import flash.display.Sprite;
	
	import flexUnitTests.TestPaymentServiceProvider;
	import flexUnitTests.TestSecurityKeyValidatorVersion1;
	
	import flexunit.flexui.FlexUnitTestRunnerUIAS;
	
	public class FlexUnitApplication extends Sprite
	{
		public function FlexUnitApplication()
		{
			onCreationComplete();
		}
		
		private function onCreationComplete():void
		{
			var testRunner:FlexUnitTestRunnerUIAS=new FlexUnitTestRunnerUIAS();
			testRunner.portNumber=8765; 
			this.addChild(testRunner); 
			testRunner.runWithFlexUnit4Runner(currentRunTestSuite(), "TDD3");
		}
		
		public function currentRunTestSuite():Array
		{
			var testsToRun:Array = new Array();
			testsToRun.push(flexUnitTests.TestSecurityKeyValidatorVersion1);
			testsToRun.push(flexUnitTests.TestPaymentServiceProvider);
			return testsToRun;
		}
	}
}