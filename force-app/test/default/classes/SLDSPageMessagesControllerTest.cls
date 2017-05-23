/**
* @author Ben Edwards (ben@cloudinit.nz)
* @description Test class for the SLDSPageMessagesController
**/
@isTest
private class SLDSPageMessagesControllerTest {
	
	/**
    *   @author Ben Edwards (ben@cloudinit.nz)
    *   @description Very simple test to cover the SLDSPageMessagesController
    **/
    @isTest
    static void testSLDSPageMessagesController() {

    	// Instantiate the controler
    	SLDSPageMessagesController testCon = new SLDSPageMessagesController();

    	// Create an error message
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Test error message'));
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Test error message 2'));

        // Create another error message
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Test successful message'));

        // Get the error message map
        Map<String, List<String>> errorMessageMap = testCon.getAllPageMessagesMap();

        // Assert that two errors exist for the appropriate label
        system.assertEquals(
            2,
            errorMessageMap.get(SLDSPageMessagesController.severityToThemeMap.get(ApexPages.Severity.ERROR)).size(),
            'There should be 2 ERROR messages.'
        );

        system.assertEquals(
            1,
            errorMessageMap.get(SLDSPageMessagesController.severityToThemeMap.get(ApexPages.Severity.CONFIRM)).size(),
            'There should be 1 CONFIRM message.'
        );
    }

}