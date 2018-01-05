@isTest
private class ParkLocatorTest {
	@isTest static void testCallout() {
		// This causes a fake response to be generated
		System.Test.setMock(WebServiceMock.class, new ParkServiceMock());
		// Call the method that invokes a callout
		List<String> result = ParkLocator.country('Germany');
		// Verify that a fake result is returned
		System.assertEquals(new List<String>{'Park1'}, result);
	}
}