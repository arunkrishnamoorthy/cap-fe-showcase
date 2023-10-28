sap.ui.define([
    "sap/m/MessageToast"
], function (MessageToast) {
    'use strict';

    return {
        /**
         * This action was implemented from the guide. 
         * in the ext folder, a js file was created 
         * in the manifest.json, in the settings section of the entity, controlConfiguration, the 
         * action is added to the line item annotation. It was specified which controller method, 
         * text of the button, enable and visible properties are set. 
         * In the controller logic, using the editFlow api, invokeAction function, the functions are
         * called via the fiori elements. 
         * this invokeAction, requires the following properties. 
         * 1. contexts: the context of the record that is to call the action 
         * 2. model: instance of the odata model 
         * 3. label: -> This is a label, that has to be displayed, if the action requires a parameter and the d
         *              label is shown in the parameters dialog
         * 4. invocationGrouping: Specifies how actions are called. Possible values 
         *              a: ChangeSet -> pull all action calls in one changeset 
         *              b: Isolated  -> Each call has it's own Changeset
         * 
         * Note: the this handler, has the method getSelectedContexts() which returns context of all selected records 
         * from the table. And getModel() method returns the instance of the OData Model. 
         * 
         * Now, using the invokeAction, the fiori element controller, look for the metadata of the action provided,
         * in this case "changeProgress". If the action has parameters, the invokeAction methods opens a dialog with 
         * input field for the parameters that are applicable for the actions. In this case "new Progress". 
         * after we enter the value and click on save, the firoi elements applications takes the value in the new progress
         * and trigger the function import. We do not have to call it explicitly.
         *
         */
        changeProgress: function (oEvent) {
            let sAction = "service1.changeProgress";
            let mParameters = {
                contexts: this.getSelectedContexts()[0],
                model: this.getModel(),
                label: 'Confirm',
                invocationGrouping: "ChangeSet"
            };
            this.editFlow.invokeAction(sAction, mParameters);
            
            // To be Enhanced here: 
            // 1. The event handler to capture the execution results of the odata call and validate if the 
            // call is success or failure. 
            // 2. Message handling using message manager 
            // 3. Refersh the table to update the modified values 
        }
    };
});
