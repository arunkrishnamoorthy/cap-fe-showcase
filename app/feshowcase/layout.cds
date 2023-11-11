using service1 as service from '../../srv/service';

annotate service1.RootEntities with @(
    UI.SelectionFields: [
        country_code,
        region_country_code,
        validFrom,
        validTo,
    ],
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
);

