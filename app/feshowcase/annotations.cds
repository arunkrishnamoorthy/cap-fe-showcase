using service1 as service from '../../srv/service';

annotate service.RootEntities with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'integerValue',
            Value : integerValue,
        },
        {
            $Type : 'UI.DataField',
            Label : 'forecastValue',
            Value : forecastValue,
        },
        {
            $Type : 'UI.DataField',
            Label : 'targetValue',
            Value : targetValue,
        },
        {
            $Type : 'UI.DataField',
            Label : 'dimensions',
            Value : dimensions,
        },
        {
            $Type : 'UI.DataField',
            Label : 'criticality_code',
            Value : criticality_code,
        },
    ]
);
annotate service.RootEntities with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'integerValue',
                Value : integerValue,
            },
            {
                $Type : 'UI.DataField',
                Label : 'forecastValue',
                Value : forecastValue,
            },
            {
                $Type : 'UI.DataField',
                Label : 'targetValue',
                Value : targetValue,
            },
            {
                $Type : 'UI.DataField',
                Label : 'dimensions',
                Value : dimensions,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality_code',
                Value : criticality_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'starsValue',
                Value : starsValue,
            },
            {
                $Type : 'UI.DataField',
                Label : 'fieldWithUom',
                Value : fieldWithUom,
            },
            {
                $Type : 'UI.DataField',
                Label : 'fieldWithPrice',
                Value : fieldWithPrice,
            },
            {
                $Type : 'UI.DataField',
                Label : 'uom_code',
                Value : uom_code,
            },
            {
                $Type : 'UI.DataField',
                Value : isoCurrency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'stringProperty',
                Value : stringProperty,
            },
            {
                $Type : 'UI.DataField',
                Label : 'imageUrl',
                Value : imageUrl,
            },
            {
                $Type : 'UI.DataField',
                Label : 'fieldWithCriticality',
                Value : fieldWithCriticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'fieldWithURL',
                Value : fieldWithURL,
            },
            {
                $Type : 'UI.DataField',
                Label : 'fieldWithURLText',
                Value : fieldWithURLText,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'telephone',
                Value : telephone,
            },
            {
                $Type : 'UI.DataField',
                Label : 'description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'description_customgrowing',
                Value : description_customgrowing,
            },
            {
                $Type : 'UI.DataField',
                Label : 'validFrom',
                Value : validFrom,
            },
            {
                $Type : 'UI.DataField',
                Label : 'validTo',
                Value : validTo,
            },
            {
                $Type : 'UI.DataField',
                Label : 'time',
                Value : time,
            },
            {
                $Type : 'UI.DataField',
                Label : 'timeStamp',
                Value : timeStamp,
            },
            {
                $Type : 'UI.DataField',
                Value : country_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'region_code',
                Value : region_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'region_country_code',
                Value : region_country_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'deletePossible',
                Value : deletePossible,
            },
            {
                $Type : 'UI.DataField',
                Label : 'updateHidden',
                Value : updateHidden,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
