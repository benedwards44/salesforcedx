/**
* @author Ben Edwards (ben@cloudinit.nz)
* @description Controller for the DXDemo page
**/
public with sharing class DXDemoController {
	
	/**
    *   @author Ben Edwards (ben@cloudinit.nz)
    *   @description The new contact to create
    **/
	public Contact newContact {

		get {

			if (newContact == null) {

				newContact = new Contact();
			}
			return newContact;
		}
		set;
	}

	/**
    *   @author Ben Edwards (ben@cloudinit.nz)
    *   @description Page method to create the contact
    **/
    public void createContact() {

    	try {

    		// Insert the contact
    		insert newContact;

    		// Add a success message
    		ApexPages.addMessage(new ApexPages.Message(
    			ApexPages.Severity.CONFIRM, 
    			'Successfully created contact: &nbsp;<strong>' + newContact.FirstName + ' ' + newcontact.LastName + '</strong>'
    		));

    		// On success, null the contact to instantiate a new one
    		newContact = null;
    	}
    	catch (Exception ex) {

    		// Just dump the exception into the page messages and return
    		// to the user
    		ApexPages.addMessages(ex);
    	}
    }
}