/**
* @author Ben Edwards (ben@cloudinit.nz)
* @description Controller for the SLDSPageMessages component
**/
public with sharing class SLDSPageMessagesController {
    
    // CONSTRUCTOR
    public SLDSPageMessagesController() {}
        
    /**
    *   @author Ben Edwards (ben@cloudinit.nz)
    *   @description Build a map of each alert style to the list of errors for that style
    *   @return Map of alert style to list of errors for that style
    **/
    public Map<String, List<String>> getAllPageMessagesMap() {

        Map<String, List<String>> allPageMessagesMap = new Map<String, List<String>>();

        // Iterate over each alert message
        for (ApexPages.Message apexPageMessage :ApexPages.getMessages()) {

            // Get the alert style for the message
            String alertTheme = severityToThemeMap.get(apexPageMessage.getSeverity());

            // If the map already contains an error for this style
            if (allPageMessagesMap.containsKey(alertTheme)) {

                // Get the existing list
                List<String> existingErrors = allPageMessagesMap.get(alertTheme);

                // Add the new error
                existingErrors.add(apexPageMessage.getDetail());

                // Put back into the map
                allPageMessagesMap.put(alertTheme, existingErrors);
            }
            // Otherwise, it doesn't yet exist
            else {

                allPageMessagesMap.put(alertTheme, new List<String>{apexPageMessage.getDetail()});
            }
        }

        return allPageMessagesMap;
    }

    /**
    *   @author Ben Edwards (ben@cloudinit.nz)
    *   @description Manage a map of ApexPages.Severity options to the Bootstrap alert style
    *   @return Map of ApexPages severity to Bootstrap alert style
    **/
    @testVisible
    private static final Map<ApexPages.Severity, String> severityToThemeMap = new Map<ApexPages.Severity, String> {
        ApexPages.Severity.CONFIRM  => 'success',
        ApexPages.Severity.ERROR    => 'error',
        ApexPages.Severity.FATAL    => 'error',
        ApexPages.Severity.INFO     => '',
        ApexPages.Severity.WARNING  => ''
    };
}