sap.ui.define(["sap/ui/model/Filter", "sap/ui/model/FilterOperator"], function(Filter, FilterOperator) {
    "use strict";
    return {
        CustomFilterFunction: function(sValue) {
            switch (sValue) {
                case "0":
                        return new Filter({ path: "starsValue", operator: FilterOperator.LT, value1: 100 });
                case "1":
                        return new Filter({
                        filters: [
                            new Filter({ path: "starsValue", operator: FilterOperator.GT, value1: 100 }),
                            new Filter({ path: "starsValue", operator: FilterOperator.LT, value1: 500 })
                        ],
                        and: true
                    });
                case "2":
                        return new Filter({ path: "starsValue", operator: FilterOperator.GT, value1: 500 });
            }
        }
    };
});
