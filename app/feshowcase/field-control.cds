using service1 as service from '../../srv/service';

annotate service.RootEntities {
    validFrom @UI.HiddenFilter;
    validTo @UI.HiddenFilter;
}