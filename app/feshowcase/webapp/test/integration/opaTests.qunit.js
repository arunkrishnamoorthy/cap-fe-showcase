sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'demo/fe/showcase/feshowcase/test/integration/FirstJourney',
		'demo/fe/showcase/feshowcase/test/integration/pages/RootEntitiesList',
		'demo/fe/showcase/feshowcase/test/integration/pages/RootEntitiesObjectPage',
		'demo/fe/showcase/feshowcase/test/integration/pages/ChildEntities1ObjectPage'
    ],
    function(JourneyRunner, opaJourney, RootEntitiesList, RootEntitiesObjectPage, ChildEntities1ObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('demo/fe/showcase/feshowcase') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRootEntitiesList: RootEntitiesList,
					onTheRootEntitiesObjectPage: RootEntitiesObjectPage,
					onTheChildEntities1ObjectPage: ChildEntities1ObjectPage
                }
            },
            opaJourney.run
        );
    }
);