# salesforcedx
Example code for a Salesforce DX project

This framework has been copied from the Salesforce example:
https://github.com/forcedotcom/sfdx-simple

## Set Up the Developer Workspace

Our first goal is to set up a developer workspace which we'll use to modify our application. It starts by cloning the repository. Use the command ...

    git clone https://github.com/forcedotcom/sfdx-simple.git


## Steps

Authorize to your Developer Hub org.

    sfdx force:auth:web:login -d -a "Hub Org"

If you already have an authorized Developer Hub, set it as the workspace default:

    sfdx force:config:set defaultdevhubusername=<username|alias>

Create a scratch org.

    sfdx force:org:create -s -f config/workspace-scratch-def.json

If you want to use an existing scratch org, set it as the workspace default:

    sfdx force:config:set defaultausername=<username|alias>

Push your source.

    sfdx force:source:push

Run your tests.

    sfdx force:apex:test:run
    sfdx force:apex:test:report -i <id>

Open the scratch org.

    sfdx force:org:open --path one/one.app

## Description of Files and Directories  

* **sfdx-workspace.json**: Required by Salesforce DX. Configures your project workspace.  Use this file to specify the parameters that affect your Salesforce development project.
* **config/workspace-scratch-def.json**: Sample file that shows how to define the shape of a scratch org.  You reference this file when you create your workspace scratch org with the force:org:create command.   
* **force-app**: Directory that contains the source for the sample Force.com app and tests.   
* **.project**:  Required by the Eclipse IDE.  Describes the Eclipse project. 
