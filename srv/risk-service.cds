using { riskmanagement as rm } from '../db/schema';

@path : 'service/risk'
service RiskService
{
    annotate Mitigations with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    annotate Risks with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    @odata.draft.enabled
    entity Risks as
        projection on rm.Risks;

    @odata.draft.enabled
    entity Mitigations as
        projection on rm.Mitigations;

    @readonly
    entity BusinessPartners as
        projection on rm.BusinessPartners;

}

annotate RiskService with @requires :
[
    'authenticated-user',
    'jborovik'
];
