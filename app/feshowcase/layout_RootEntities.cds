using service1 as service from '../../srv/service';

annotate service.RootEntities with @(
     UI.FilterFacets: [
        {
            Target  : '@UI.FieldGroup#validperiod',
            Label   : 'Validity Grouping'
        }
    ],
);

/**
 * Field Group annotation
 */
 annotate service.RootEntities with @(
    UI.FieldGroup #validperiod  : {
        Data: [
            {Value: 'validFrom'},
            {Value: 'validTo'}
        ]
    }
 );
