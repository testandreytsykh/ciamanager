@isTest
private class AnimalLocatorTest {
	@isTest static void testGetCallout() {
		System.Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
		String actualValue = AnimalLocator.getAnimalNameById(1);
		String expectedValue = 'chicken';
		System.assertEquals(actualValue, expectedValue);
	}
}