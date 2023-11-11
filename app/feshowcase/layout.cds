using service1 as service from '../../srv/service';

annotate service1.RootEntities with @(
    UI.SelectionFields: [
        fieldWithPrice,
        validFrom,
        validTo,
    ]
);