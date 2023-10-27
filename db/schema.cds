using {
    sap,
    cuid,
    managed,
    sap.common.CodeList as CodeList,
    Currency,
    Country
} from '@sap/cds/common';

using {
    sap.common.Region,
    sap.common.UnitOfMeasure,
    sap.common.Criticality
} from './common.cds';

namespace sap.fe.showcase;

aspect rootBasis : {
    // Integer  
    integerValue: Integer;
    forecaseValue: Integer;
    targetValue: Integer default 30;
    dimensions: Integer;
    criticality_code: Integer;

    // Decimals 
    starsValue: Decimal;
    fieldWithUom: Decimal(16,3);
    fieldWithPrice: Decimal(16,3);

    // units 
    uom: UnitOfMeasure;
    isoCurrency: Currency;

    // String 
    stringProperty: String;
    imageWithUrl: String;
    fieldWithCriticality: String;
    fieldWithURL: String;
    fieldWithURLText: String;
    email: String;
    telephone: String;

    description: String(1000);
    description_customgrowing: String(1000);


    // Date timestamp 
    validFrom: Date;
    validTo: Date;
    time: Time;
    timeStamp: Timestamp;

    // Aspect 
    country: Country;
    region: Region;

    // Boolean
    deletePossible: Boolean;
    updateHidden: Boolean;

    // Association
    contact: Association to one Contacts;
    criticality: Association to one Criticality on criticality.code = criticality_code;
}

entity Contacts : cuid {
    name                        : String;
    phone                       : String;
    building                    : String;
    country                     : Country;
    street                      : String;
    city                        : String;
    postCode                    : String;
    addressLabel                : String;
    photoUrl                    : String;
}

// Root Entity
entity RootEntities: cuid, managed, rootBasis {
    childEntities1              : Composition of many ChildEntities1
                                    on childEntities1.parent = $self;
    childEntity2                : Association to one ChildEntities2;
    childEntities3              : Composition of many ChildEntities3
                                    on childEntities3.parent = $self;
    chartEntities               : Composition of many ChartDataEntities
                                    on chartEntities.parent = $self;
}

// Variant of Root Entity 
entity RootEntitiesVariant: cuid, managed, rootBasis { }

// Child Entity 1:
entity ChildEntities1: cuid {
    parent: Association to one RootEntities;
    field: String;
    fieldWithPercent: Decimal(5,2);
    booleanProperty: Boolean default false;
    criticalityValue: Association to one Criticality;
    grandChildren: Composition of many GrandChildEntities on 
                            grandChildren.parent = $self;
}

entity GrandChildEntities: cuid {
    parent: Association to one ChildEntities1;
    field: String;
}

entity ChildEntities2 : cuid {
    stringProperty              : String;
    integerProperty             : Integer;
    decimalProperty             : Decimal(5, 3);
    country                     : Country;
}

entity ChildEntities3 : cuid {
    parent                      : Association to one RootEntities;
    field                       : String;
}

entity ChartDataEntities: cuid {
    parent: Association to one RootEntities;
    criticality: Association to one Criticality;
    integerValue: Integer;
    integerValueWithUOM: Integer;
    uom: UnitOfMeasure;
    forecaseValue: Integer;
    targetValue: Integer default 30;
    dimensions: Integer;
    areaChartToleranceUpperBoundValue: Integer default 90;
    areaChartToleranceLowerBoundValue: Integer default 80;
    areaChartDeviationUpperBoundValue: Integer default 50;
    areaChartDeviationLowerBoundValue: Integer default 0;
}