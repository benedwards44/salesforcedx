/**
* @author Ben Edwards (ben@cloudinit.nz)
* @description Test class for the DXDemoController
**/
@isTest
public class DXDemoControllerTest {
	
	/**
    *   @author Ben Edwards (ben@cloudinit.nz)
    *   @description Simple test case to create a contact from the page
    **/
	@isTest
	static void testCreateContactSuccess () {

		// Instatiate the controller
		DXDemoController testController = new DXDemoController();

		// Create a test contact
		testController.newContact.FirstName = 'Snoop';
		testController.newContact.LastName = 'Diggity Dog';
		testController.newContact.Email = 'snoop@doggpound.com';

		// Save the contact
		testController.createContact();

		// Assert the contact is created
		system.assertEquals(1, [SELECT count() FROM Contact], 'There should be 1 Contact created.');
	}


	/**
    *   @author Ben Edwards (ben@cloudinit.nz)
    *   @description Simple test case to create a contact but fail the insert
    **/
	@isTest
	static void testCreateContactFailure () {

		// Instatiate the controller
		DXDemoController testController = new DXDemoController();

		// Save the contact, without setting any values
		testController.createContact();

		// Assert the contact is created
		system.assertEquals(0, [SELECT count() FROM Contact], 'There should be no Contacts created.');

	}

}