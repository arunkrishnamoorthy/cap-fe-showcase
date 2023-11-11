using service1 as service from '../../srv/service';

annotate service1.RootEntities with @(
    UI.SelectionFields: [
        country_code,
        region_country_code,
        validFrom,
        validTo,
    ]
);