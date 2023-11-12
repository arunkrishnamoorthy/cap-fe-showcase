using service1 as service from '../../srv/service';

annotate service.RootEntities with {
    contact @( Common: {
        Text: contact.name,
        TextArrangement : #TextOnly,
        ValueList : {
            Label: 'Contacts',
            $Type : 'Common.ValueListType',
            CollectionPath : 'Contacts',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    ValueListProperty: 'ID',
                    LocalDataProperty: 'contact_ID'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'city'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'street'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'country_code'
                }
            ]
        },
    });

    region @(
        Common: {
            Text : 'region.name',
            TextArrangement : #TextFirst,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Regions',
                Parameters: [
                    {
                        $Type: 'Common.ValueListParameterInOut',
                        LocalDataProperty: region_code,
                        ValueListProperty: 'code'
                    },
                    {
                        $Type: 'Common.ValueListParameterOut',
                        LocalDataProperty: region.name,
                        ValueListProperty: 'name'
                    },
                    {
                        $Type               : 'Common.ValueListParameterFilterOnly',
                        ValueListProperty   : 'country_code',
                    },
                    {
                        $Type: 'Common.ValueListParameterIn',
                        LocalDataProperty: country_code,
                        ValueListProperty: 'country_code'
                    }
                    
                ]
            }
        }
    )
}