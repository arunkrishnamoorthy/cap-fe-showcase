### SAP Fiori Elements showcase using CAP

The original tutorial provided by SAP:
https://github.com/SAP-samples/fiori-elements-feature-showcase/blob/main/README.md#general-features

This repository is developed to practice the features of the SAP Fiori elements show case using the CAP. 


#### Getting Started 

The base template contains the data modelling and the service definition.

//TODO: A branch is supposed to be created only containing the CAP related changes. 

<blockquote>
Note:
This was originally created in the <strong>main</strong> branch and later all the codes are commited to the main branch losing the cap service template. For the starting point use template use the branch: <b>Step1: list-report</b>. This branch should contains the CAP Service definition and the List report template. 
</blockquote>


#### Step 1: Generate list report application 

The branch "step1-listreport" contains the changes, where an ui application is generated using the template with the basic annotations. Once the UI is created for the step1, merge the code to the branch using the following command. 

git command: git push --set-upstream origin step1-listreport


#### Step2 : Enabling the draft. 

the branch "step2-configure-draft" has the changes to enable the draft annotation. 
To enable the draft to the entityset we need to add the annotation @odata.draft.enabled: true. This activates the create and the draft functionality. For V4, i remember reading somewhere that the draft is mandatory and we cannot have create wihtout draft. This needs to be verified. 


### Step3 : Replace Standard i18n texts

this branch "step3-replace-texts" has the changes to add the enhanceI18n property to the manifest of the respective target where the custom texts needs to be replaced. 

the variables of the standard texts can be found in the below links and can be used in the custom18n properties file to replace the standard texts. 

https://sapui5.hana.ondemand.com/#/topic/b8cb649973534f08a6047692f8c6830d

### Step 4: Custom Action 

this branch "step4-custom-action" has the implementation logic for implementing an custom actions in the list report page. 
The details of the implementation is maintained as comments in the controller where the custom action logic is implemented.   

in the folder path app->feshowcase->ext->customaction->CustomAction.js - the logic is implemented. 
in the manifest.json file, in the controlConfiguration setting of the line item annotation, the config are made to render custom button on the UI. 

### Step 5: Adding filter conditions 

To add filters to the ui, add the selections fields annotation to the CDS file. 

```cds
using service1 as service from '../../srv/service';

annotate service1.RootEntities with @(
    UI.SelectionFields: [
        country_code,
        region_country_code,
        validFrom,
        validTo,
    ]
);
```

### Step 6: Add default values to the filter

To add default values to the filter, make use of the SelectionVariant UI annotation. With this selection variant 
annotation, you can set default values as parameter and as select options. 

```
UI.SelectionVariant: {
        Parameters: [
            {
                $Type: 'UI.Parameter',
                PropertyName: 'validFrom',
                PropertyValue: '20230101'
            }
        ],
        SelectOptions: [
            {
                PropertyName: 'country_code',
                Ranges: [
                    {
                        Sign: #I,
                        Option: #EQ,
                        Low: 'DE',
                        High: ''
                    }
                ]
            }
        ]
    }
```

Help Links: 
https://sapui5.hana.ondemand.com/sdk/#/topic/f27ad7bc1f9c4b0d947b1fb18c37e94c.html


### Step 7: Hide filters 

By adding field control to the entity, the display of the fields can be controlled. To hide an element from the UI there are two possible annotation. 

1. @UI.Hidden  -> Hides the element throughout (Selection Field, Table, Forms)
2. @UI.HiddenFilter -> Hides the element only at the Filterbar. (Selection Fields)

Adding field control to the annotation. By adding the hidden filter annotation, the fields, 
validFrom and validTo are not available for selection in the adapt filters. 

An import point to note here. this only hides the ui from the display. If suppose we have a default value specified to the
fields as in the previous step, the value is still added to the filter when the get request is triggered. Since this will be a hidden filter user won't be able to overwrite the value. 

```
using service1 as service from '../../srv/service';

annotate service.RootEntities {
    validFrom @UI.HiddenFilter;
    validTo @UI.HiddenFilter;
}
```
