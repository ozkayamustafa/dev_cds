@AbapCatalog.sqlViewName: 'ZMO_000_V_CDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Eğitim'
define view zmo_000_cds_ddl as select from ekko
 inner join ekpo on ekko.ebeln = ekpo.ebeln
    inner join mara on ekpo.matnr = mara.matnr
    inner join makt on mara.matnr = makt.matnr
                      and makt.spras = $session.system_language
    inner join lfa1 on ekko.lifnr = lfa1.lifnr
{
    ekpo.ebeln,
    ekpo.ebelp,
    ekpo.matnr,
    makt.maktx,
    ekpo.werks,
    ekpo.lgort,
    ekpo.meins,
    lfa1.lifnr,
    lfa1.adrnr,
    concat_with_space(lfa1.stras,lfa1.mcod3,2) as Satici_adresi
    
}
