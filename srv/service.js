const cds = require('@sap/cds');

module.exports = async (srv) => {

    const { RootEntities } = srv.entities;

    srv.on("changeProgress", RootEntities, async (req) => {
        const integerValue = req.data.newProgress, 
              headerID = req.params[0].ID;
        return UPDATE(RootEntities,headerID).with({integerValue});
    });

}