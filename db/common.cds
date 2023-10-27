// In the common.cds definition file, the applciation requried common types, aspects, extensions of standard aspects
// or types are included. 

// The following details are exposed from the Common CDS Entity. 
// User - User Unique ID
// Managed - Aspect to capture changed by user name and time.
// Country - Country / Region Detail
// CodeList - Aspect for the code list(value help) with name and description
// sap - reference to all aspects and types in the @sap/cds/common defined in sap namespace. 


using { User, managed,sap, Country, sap.common.CodeList  } from '@sap/cds/common';

// Extend existing type.
// The sap common currencies already has fields, code, symbol and minorUnit. In
// addition to these, the following three properties are included.
extend sap.common.Currencies with {
    numericCode: Integer;
    exponent: Integer;
    minor: String;
}

// The entity country does not have regions in the standard @sap/cds/common. 
// below is the code to extend the country with regions. 

entity sap.common.Regions : CodeList {
    key code: String(10) @title : '{i18n>region}';
    key country : Country;
}

type sap.common.Region: Association to sap.common.Regions;

extend entity sap.common.Countries with {
    regions: Composition of many sap.common.Regions on regions.country = $self;
}

// Code lists

entity sap.common.Criticality: CodeList {
    key code : Integer default 0;
}

entity sap.common.UnitOfMeasureCodeList: CodeList {
    key code: String(30);
}

type sap.common.UnitOfMeasure: Association to sap.common.UnitOfMeasureCodeList;
