using {sap.fe.featureShowcase as persistence} from '../db/schema';
using {sap.common as common} from '../db/common';


service service1 @(path: '/srv1') {
    entity RootEntities as select from persistence.RootEntities actions {
        action changeCriticality ( newCriticality: Integer);
        action changeProgress (newProgress: Integer);
        action resetEntities();
    }
    action unboundAction(input : String);
    action criticalAction();

    entity ChildEntities1       as projection on persistence.ChildEntities1;
    entity ChildEntities2       as projection on persistence.ChildEntities2;
    entity ChildEntities3       as projection on persistence.ChildEntities3;
    entity ChartDataEntities    as projection on persistence.ChartDataEntities;
    entity GrandChildEntities   as projection on persistence.GrandChildEntities;

    entity RootEntityVariants   as projection on persistence.RootEntityVariants;
    entity Contacts             as projection on persistence.Contacts;
    entity Countries             as projection on common.Countries;
    entity Currencies            as projection on common.Currencies;
    entity Criticality           as projection on common.Criticality;
    entity UnitOfMeasureCodeList as projection on common.UnitOfMeasureCodeList;

    // Draft is disabled for the Semantic Keys entityset
    @odata.draft.enabled: false
    entity RootEntitySemanticKeys as select from RootEntities {
        stringProperty
    }
}