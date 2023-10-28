sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'demo.fe.showcase.feshowcase',
            componentId: 'RootEntitiesList',
            contextPath: '/RootEntities'
        },
        CustomPageDefinitions
    );
});