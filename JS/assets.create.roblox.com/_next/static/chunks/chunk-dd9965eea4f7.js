;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "98a09db9-d3a2-6cc9-99eb-3945816dd677")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 974184, e => {
    "use strict";
    var t = e.i(415858),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function a(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function a() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
    }

    function r(e, t, n, a) {
        return new(n || (n = Promise))(function(r, i) {
            function o(e) {
                try {
                    s(a.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function c(e) {
                try {
                    s(a.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, c)
            }
            s((a = a.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var n, a, r, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = c(0), o.throw = c(1), o.return = c(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function c(c) {
            return function(s) {
                var u = [c, s];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (i = 0)), i;) try {
                    if (n = 1, a && (r = 2 & u[0] ? a.return : u[0] ? a.throw || ((r = a.return) && r.call(a), 0) : a.next) && !(r = r.call(a, u[1])).done) return r;
                    switch (a = 0, r && (u = [2 & u[0], r.value]), u[0]) {
                        case 0:
                        case 1:
                            r = u;
                            break;
                        case 4:
                            return i.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            i.label++, a = u[1], u = [0];
                            continue;
                        case 7:
                            u = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === u[0] && (!r || u[1] > r[0] && u[1] < r[3])) {
                                i.label = u[1];
                                break
                            }
                            if (6 === u[0] && i.label < r[1]) {
                                i.label = r[1], r = u;
                                break
                            }
                            if (r && i.label < r[2]) {
                                i.label = r[2], i.ops.push(u);
                                break
                            }
                            r[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    u = t.call(e, i)
                } catch (e) {
                    u = [6, e], a = 0
                } finally {
                    n = r = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function o(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.u)(n, "id") ? n.id : void 0,
            agreementId: (0, t.u)(n, "agreementId") ? n.agreementId : void 0,
            transition: (0, t.u)(n, "transition") ? n.transition : void 0,
            startStatus: (0, t.u)(n, "startStatus") ? n.startStatus : void 0,
            endStatus: (0, t.u)(n, "endStatus") ? n.endStatus : void 0,
            enableMonetization: (0, t.u)(n, "enableMonetization") ? n.enableMonetization : void 0,
            notes: (0, t.u)(n, "notes") ? n.notes : void 0,
            createdAt: (0, t.u)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.u)(n, "updatedAt") ? new Date(n.updatedAt) : void 0
        }
    }

    function c(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.u)(n, "id") ? n.id : void 0,
            accountId: (0, t.u)(n, "accountId") ? n.accountId : void 0,
            ipFamilyId: (0, t.u)(n, "ipFamilyId") ? n.ipFamilyId : void 0,
            agreementId: (0, t.u)(n, "agreementId") ? n.agreementId : void 0,
            candidateId: (0, t.u)(n, "candidateId") ? n.candidateId : void 0,
            candidateType: (0, t.u)(n, "candidateType") ? n.candidateType : void 0,
            status: (0, t.u)(n, "status") ? n.status : void 0,
            discoveredAt: (0, t.u)(n, "discoveredAt") ? new Date(n.discoveredAt) : void 0,
            updatedAt: (0, t.u)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
            dau7DayBucket: (0, t.u)(n, "dau7DayBucket") ? n.dau7DayBucket : void 0,
            universeContentMaturity: (0, t.u)(n, "universeContentMaturity") ? n.universeContentMaturity : void 0,
            creatorLifetimeVisitBucket: (0, t.u)(n, "creatorLifetimeVisitBucket") ? n.creatorLifetimeVisitBucket : void 0,
            creatorL90EarningsBucket: (0, t.u)(n, "creatorL90EarningsBucket") ? n.creatorL90EarningsBucket : void 0
        }
    }

    function s(e) {
        if (void 0 !== e) return null === e ? null : {
            contentId: e.contentId,
            contentType: e.contentType
        }
    }

    function u(e) {
        var t;
        return null == (t = e) ? t : {
            contentId: t.contentId,
            contentType: t.contentType
        }
    }

    function d(e, n) {
        return null == e ? e : {
            changeRequestSubstatusType: (0, t.u)(e, "changeRequestSubstatusType") ? e.changeRequestSubstatusType : void 0,
            expiresAtTime: (0, t.u)(e, "expiresAtTime") ? null === e.expiresAtTime ? null : new Date(e.expiresAtTime) : void 0
        }
    }

    function l(e, n) {
        return null == e ? e : {
            changeRequestSubstatusType: (0, t.u)(e, "changeRequestSubstatusType") ? e.changeRequestSubstatusType : void 0,
            expiresAtTime: (0, t.u)(e, "expiresAtTime") ? null === e.expiresAtTime ? null : new Date(e.expiresAtTime) : void 0
        }
    }

    function g(e, n) {
        return null == e ? e : {
            ipRemovalAttestationStatus: (0, t.u)(e, "ipRemovalAttestationStatus") ? e.ipRemovalAttestationStatus : void 0,
            expiresAtTime: (0, t.u)(e, "expiresAtTime") ? null === e.expiresAtTime ? null : new Date(e.expiresAtTime) : void 0
        }
    }

    function m(e) {
        return e
    }

    function p(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.u)(n, "id") ? n.id : void 0,
            accountId: (0, t.u)(n, "accountId") ? n.accountId : void 0,
            licenseId: (0, t.u)(n, "licenseId") ? n.licenseId : void 0,
            targetAccountId: (0, t.u)(n, "targetAccountId") ? n.targetAccountId : void 0,
            status: (0, t.u)(n, "status") ? n.status : void 0,
            statusExpireAt: (0, t.u)(n, "statusExpireAt") ? null === n.statusExpireAt ? null : new Date(n.statusExpireAt) : void 0,
            terminatesAt: (0, t.u)(n, "terminatesAt") ? null === n.terminatesAt ? null : new Date(n.terminatesAt) : void 0,
            disputeReasons: (0, t.u)(n, "disputeReasons") ? null === n.disputeReasons ? null : n.disputeReasons.map(m) : void 0,
            createdAt: (0, t.u)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.u)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
            enableMonetization: (0, t.u)(n, "enableMonetization") ? n.enableMonetization : void 0,
            creatorLifetimeVisitBucket: (0, t.u)(n, "creatorLifetimeVisitBucket") ? n.creatorLifetimeVisitBucket : void 0,
            activeChangeRequest: (0, t.u)(n, "activeChangeRequest") ? d(n.activeChangeRequest) : void 0,
            conditionalChangeRequest: (0, t.u)(n, "conditionalChangeRequest") ? l(n.conditionalChangeRequest) : void 0,
            startTime: (0, t.u)(n, "startTime") ? null === n.startTime ? null : new Date(n.startTime) : void 0,
            endTime: (0, t.u)(n, "endTime") ? null === n.endTime ? null : new Date(n.endTime) : void 0,
            ipRemovalAttestation: (0, t.u)(n, "ipRemovalAttestation") ? g(n.ipRemovalAttestation) : void 0
        }
    }

    function h(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.u)(n, "id") ? n.id : void 0,
            agreementId: (0, t.u)(n, "agreementId") ? n.agreementId : void 0,
            contentType: (0, t.u)(n, "contentType") ? n.contentType : void 0,
            contentId: (0, t.u)(n, "contentId") ? n.contentId : void 0,
            createdAt: (0, t.u)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.u)(n, "updatedAt") ? new Date(n.updatedAt) : void 0
        }
    }

    function v(e, n) {
        return null == e ? e : {
            assetIds: (0, t.u)(e, "assetIds") ? e.assetIds : void 0,
            accessContext: (0, t.u)(e, "accessContext") ? e.accessContext : void 0
        }
    }

    function I(e) {
        if (void 0 !== e) return null === e ? null : {
            revenueTargetType: e.revenueTargetType,
            revenueTargetId: e.revenueTargetId,
            universeId: e.universeId
        }
    }

    function f(e) {
        var n;
        return null == (n = e) ? n : {
            questionId: (0, t.u)(n, "questionId") ? n.questionId : void 0,
            answer: (0, t.u)(n, "answer") ? n.answer : void 0
        }
    }

    function w(e, n) {
        var a, r;
        return null == e ? e : {
            minMax: (0, t.u)(e, "minMax") ? null == (a = e.minMax) ? a : {
                minDays: (0, t.u)(a, "minDays") ? a.minDays : void 0,
                maxDays: (0, t.u)(a, "maxDays") ? a.maxDays : void 0
            } : void 0,
            dateRange: (0, t.u)(e, "dateRange") ? null == (r = e.dateRange) ? r : {
                startTime: (0, t.u)(r, "startTime") ? null === r.startTime ? null : new Date(r.startTime) : void 0,
                endTime: (0, t.u)(r, "endTime") ? null === r.endTime ? null : new Date(r.endTime) : void 0
            } : void 0
        }
    }

    function y(e, n) {
        return null == e ? e : {
            durationType: (0, t.u)(e, "durationType") ? e.durationType : void 0,
            timeBounds: (0, t.u)(e, "timeBounds") ? w(e.timeBounds) : void 0
        }
    }

    function A(e, n) {
        return null == e ? e : {
            reselling: (0, t.u)(e, "reselling") ? e.reselling : void 0,
            minimumCreatorEarningsBucket: (0, t.u)(e, "minimumCreatorEarningsBucket") ? e.minimumCreatorEarningsBucket : void 0
        }
    }

    function R(e, n) {
        return null == e ? e : {
            name: (0, t.u)(e, "name") ? e.name : void 0,
            description: (0, t.u)(e, "description") ? e.description : void 0,
            contentStandardsDocumentId: (0, t.u)(e, "contentStandardsDocumentId") ? e.contentStandardsDocumentId : void 0,
            contentStandardScope: (0, t.u)(e, "contentStandardScope") ? e.contentStandardScope : void 0,
            submittedAt: (0, t.u)(e, "submittedAt") ? new Date(e.submittedAt) : void 0
        }
    }

    function C(e, n) {
        return null == e ? e : {
            id: (0, t.u)(e, "id") ? e.id : void 0,
            accountId: (0, t.u)(e, "accountId") ? e.accountId : void 0,
            listingId: (0, t.u)(e, "listingId") ? e.listingId : void 0,
            listingName: (0, t.u)(e, "listingName") ? e.listingName : void 0,
            name: (0, t.u)(e, "name") ? e.name : void 0,
            description: (0, t.u)(e, "description") ? e.description : void 0,
            royaltyRate: (0, t.u)(e, "royaltyRate") ? e.royaltyRate : void 0,
            dau7DayThreshold: (0, t.u)(e, "dau7DayThreshold") ? e.dau7DayThreshold : void 0,
            creatorDau7DayThreshold: (0, t.u)(e, "creatorDau7DayThreshold") ? e.creatorDau7DayThreshold : void 0,
            maxAgeRating: (0, t.u)(e, "maxAgeRating") ? e.maxAgeRating : void 0,
            countries: (0, t.u)(e, "countries") ? e.countries : void 0,
            visibility: (0, t.u)(e, "visibility") ? e.visibility : void 0,
            contentStandardsDocumentId: (0, t.u)(e, "contentStandardsDocumentId") ? e.contentStandardsDocumentId : void 0,
            contentStandardsScope: (0, t.u)(e, "contentStandardsScope") ? e.contentStandardsScope : void 0,
            contentStandardAnswers: (0, t.u)(e, "contentStandardAnswers") ? null === e.contentStandardAnswers ? null : e.contentStandardAnswers.map(f) : void 0,
            createdAt: (0, t.u)(e, "createdAt") ? new Date(e.createdAt) : void 0,
            updatedAt: (0, t.u)(e, "updatedAt") ? new Date(e.updatedAt) : void 0,
            archived: (0, t.u)(e, "archived") ? e.archived : void 0,
            enableMonetization: (0, t.u)(e, "enableMonetization") ? e.enableMonetization : void 0,
            moderationStatus: (0, t.u)(e, "moderationStatus") ? e.moderationStatus : void 0,
            licenseDuration: (0, t.u)(e, "licenseDuration") ? y(e.licenseDuration) : void 0,
            licenseType: (0, t.u)(e, "licenseType") ? e.licenseType : void 0,
            licenseTerms: (0, t.u)(e, "licenseTerms") ? A(e.licenseTerms) : void 0,
            averageIphResponseTimeSeconds: (0, t.u)(e, "averageIphResponseTimeSeconds") ? e.averageIphResponseTimeSeconds : void 0,
            pendingEdits: (0, t.u)(e, "pendingEdits") ? R(e.pendingEdits) : void 0,
            hasPendingEdits: (0, t.u)(e, "hasPendingEdits") ? e.hasPendingEdits : void 0
        }
    }

    function T(e, n) {
        return null == e ? e : {
            avgResponseTimeSeconds90D: (0, t.u)(e, "avgResponseTimeSeconds90D") ? e.avgResponseTimeSeconds90D : void 0,
            medianResponseTimeSeconds90D: (0, t.u)(e, "medianResponseTimeSeconds90D") ? e.medianResponseTimeSeconds90D : void 0,
            responseCount90D: (0, t.u)(e, "responseCount90D") ? e.responseCount90D : void 0
        }
    }

    function q(e, n) {
        return null == e ? e : {
            id: (0, t.u)(e, "id") ? e.id : void 0,
            accountId: (0, t.u)(e, "accountId") ? e.accountId : void 0,
            ipFamilyId: (0, t.u)(e, "ipFamilyId") ? e.ipFamilyId : void 0,
            name: (0, t.u)(e, "name") ? e.name : void 0,
            description: (0, t.u)(e, "description") ? e.description : void 0,
            status: (0, t.u)(e, "status") ? e.status : void 0,
            statusReason: (0, t.u)(e, "statusReason") ? e.statusReason : void 0,
            visibility: (0, t.u)(e, "visibility") ? e.visibility : void 0,
            thumbnailAssetIds: (0, t.u)(e, "thumbnailAssetIds") ? e.thumbnailAssetIds : void 0,
            createdAt: (0, t.u)(e, "createdAt") ? new Date(e.createdAt) : void 0,
            updatedAt: (0, t.u)(e, "updatedAt") ? new Date(e.updatedAt) : void 0,
            archived: (0, t.u)(e, "archived") ? e.archived : void 0,
            responseTimeMetrics: (0, t.u)(e, "responseTimeMetrics") ? T(e.responseTimeMetrics) : void 0
        }
    }

    function S(e, n) {
        return null == e ? e : {
            revenueTargetsCount: (0, t.u)(e, "revenueTargetsCount") ? e.revenueTargetsCount : void 0,
            maxRevenueTargets: (0, t.u)(e, "maxRevenueTargets") ? e.maxRevenueTargets : void 0
        }
    }

    function b(e) {
        var n, a;
        return null == (n = e) ? n : {
            id: (0, t.u)(n, "id") ? n.id : void 0,
            accountId: (0, t.u)(n, "accountId") ? n.accountId : void 0,
            licenseId: (0, t.u)(n, "licenseId") ? n.licenseId : void 0,
            targetAccountId: (0, t.u)(n, "targetAccountId") ? n.targetAccountId : void 0,
            status: (0, t.u)(n, "status") ? n.status : void 0,
            statusExpireAt: (0, t.u)(n, "statusExpireAt") ? null === n.statusExpireAt ? null : new Date(n.statusExpireAt) : void 0,
            terminatesAt: (0, t.u)(n, "terminatesAt") ? null === n.terminatesAt ? null : new Date(n.terminatesAt) : void 0,
            disputeReasons: (0, t.u)(n, "disputeReasons") ? null === n.disputeReasons ? null : n.disputeReasons.map(m) : void 0,
            createdAt: (0, t.u)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.u)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
            enableMonetization: (0, t.u)(n, "enableMonetization") ? n.enableMonetization : void 0,
            creatorLifetimeVisitBucket: (0, t.u)(n, "creatorLifetimeVisitBucket") ? n.creatorLifetimeVisitBucket : void 0,
            activeChangeRequest: (0, t.u)(n, "activeChangeRequest") ? d(n.activeChangeRequest) : void 0,
            conditionalChangeRequest: (0, t.u)(n, "conditionalChangeRequest") ? l(n.conditionalChangeRequest) : void 0,
            startTime: (0, t.u)(n, "startTime") ? null === n.startTime ? null : new Date(n.startTime) : void 0,
            endTime: (0, t.u)(n, "endTime") ? null === n.endTime ? null : new Date(n.endTime) : void 0,
            ipRemovalAttestation: (0, t.u)(n, "ipRemovalAttestation") ? g(n.ipRemovalAttestation) : void 0,
            license: (0, t.u)(n, "license") ? C(n.license) : void 0,
            listing: (0, t.u)(n, "listing") ? q(n.listing) : void 0,
            agreementTargets: (0, t.u)(n, "agreementTargets") ? null === n.agreementTargets ? null : n.agreementTargets.map(h) : void 0,
            revenueTargetCounts: (0, t.u)(n, "revenueTargetCounts") ? S(n.revenueTargetCounts) : void 0,
            contentBadgeCounts: (0, t.u)(n, "contentBadgeCounts") ? null == (a = n.contentBadgeCounts) ? a : {
                officialCount: (0, t.u)(a, "officialCount") ? a.officialCount : void 0,
                licensedCount: (0, t.u)(a, "licensedCount") ? a.licensedCount : void 0,
                noBadgeCount: (0, t.u)(a, "noBadgeCount") ? a.noBadgeCount : void 0
            } : void 0
        }
    }

    function P(e) {
        var n;
        return null == (n = e) ? n : {
            revenueTargetType: (0, t.u)(n, "revenueTargetType") ? n.revenueTargetType : void 0,
            revenueTargetId: (0, t.u)(n, "revenueTargetId") ? n.revenueTargetId : void 0,
            universeId: (0, t.u)(n, "universeId") ? n.universeId : void 0,
            agreements: (0, t.u)(n, "agreements") ? null === n.agreements ? null : n.agreements.map(b) : void 0
        }
    }

    function L(e) {
        return e
    }

    function B(e) {
        return e
    }

    function k(e) {
        if (void 0 !== e) return null === e ? null : {
            contentType: e.contentType,
            contentId: e.contentId,
            badges: e.badges.map(B)
        }
    }

    function D(e) {
        var n;
        return null == (n = e) ? n : {
            contentType: (0, t.u)(n, "contentType") ? n.contentType : void 0,
            contentId: (0, t.u)(n, "contentId") ? n.contentId : void 0,
            reason: (0, t.u)(n, "reason") ? n.reason : void 0
        }
    }

    function U(e) {
        if (void 0 !== e) return null === e ? null : {
            revenueTargetType: e.revenueTargetType,
            revenueTargetId: e.revenueTargetId
        }
    }

    function x(e) {
        var n, a, r;
        return null == (n = e) ? n : {
            value: (0, t.u)(n, "value") ? null == (a = n.value) ? a : {
                agreementId: (0, t.u)(a, "agreementId") ? a.agreementId : void 0,
                status: (0, t.u)(a, "status") ? a.status : void 0
            } : void 0,
            error: (0, t.u)(n, "error") ? null == (r = n.error) ? r : {
                agreementId: (0, t.u)(r, "agreementId") ? r.agreementId : void 0,
                code: (0, t.u)(r, "code") ? r.code : void 0,
                message: (0, t.u)(r, "message") ? r.message : void 0
            } : void 0
        }
    }

    function E(e) {
        var n;
        return null == (n = e) ? n : {
            agreementCandidateId: (0, t.u)(n, "agreementCandidateId") ? n.agreementCandidateId : void 0,
            outcome: (0, t.u)(n, "outcome") ? n.outcome : void 0,
            error: (0, t.u)(n, "error") ? n.error : void 0,
            retryable: (0, t.u)(n, "retryable") ? n.retryable : void 0,
            agreementId: (0, t.u)(n, "agreementId") ? n.agreementId : void 0
        }
    }

    function G(e) {
        var n;
        return null == (n = e) ? n : {
            contentType: (0, t.u)(n, "contentType") ? n.contentType : void 0,
            contentId: (0, t.u)(n, "contentId") ? n.contentId : void 0,
            badges: (0, t.u)(n, "badges") ? null === n.badges ? null : n.badges.map(L) : void 0,
            agreementId: (0, t.u)(n, "agreementId") ? n.agreementId : void 0,
            updatedAt: (0, t.u)(n, "updatedAt") ? null === n.updatedAt ? null : new Date(n.updatedAt) : void 0
        }
    }

    function _(e) {
        if (void 0 !== e) return null === e ? null : {
            questionId: e.questionId,
            answer: e.answer
        }
    }

    function M(e) {
        if (void 0 !== e) return null === e ? null : {
            durationType: e.durationType,
            timeBounds: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    minMax: function(e) {
                        if (void 0 !== e) return null === e ? null : {
                            minDays: e.minDays,
                            maxDays: e.maxDays
                        }
                    }(e.minMax)
                }
            }(e.timeBounds)
        }
    }

    function z(e, t) {
        return null == e ? e : {
            scopeId: e.scopeId,
            scopeType: e.scopeType
        }
    }

    function O(e, n) {
        return null == e ? e : {
            lifetimeVisitBucket: (0, t.u)(e, "lifetimeVisitBucket") ? e.lifetimeVisitBucket : void 0
        }
    }

    function F(e) {
        var n;
        return null == (n = e) ? n : {
            key: (0, t.u)(n, "key") ? n.key : void 0,
            title: (0, t.u)(n, "title") ? n.title : void 0,
            text: (0, t.u)(n, "text") ? n.text : void 0
        }
    }

    function H(e, n) {
        return null == e ? e : {
            counts: (0, t.u)(e, "counts") ? e.counts : void 0
        }
    }

    function j(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.u)(n, "id") ? n.id : void 0,
            accountId: (0, t.u)(n, "accountId") ? n.accountId : void 0,
            listingId: (0, t.u)(n, "listingId") ? n.listingId : void 0,
            listingName: (0, t.u)(n, "listingName") ? n.listingName : void 0,
            name: (0, t.u)(n, "name") ? n.name : void 0,
            description: (0, t.u)(n, "description") ? n.description : void 0,
            royaltyRate: (0, t.u)(n, "royaltyRate") ? n.royaltyRate : void 0,
            dau7DayThreshold: (0, t.u)(n, "dau7DayThreshold") ? n.dau7DayThreshold : void 0,
            creatorDau7DayThreshold: (0, t.u)(n, "creatorDau7DayThreshold") ? n.creatorDau7DayThreshold : void 0,
            maxAgeRating: (0, t.u)(n, "maxAgeRating") ? n.maxAgeRating : void 0,
            countries: (0, t.u)(n, "countries") ? n.countries : void 0,
            visibility: (0, t.u)(n, "visibility") ? n.visibility : void 0,
            contentStandardsDocumentId: (0, t.u)(n, "contentStandardsDocumentId") ? n.contentStandardsDocumentId : void 0,
            contentStandardsScope: (0, t.u)(n, "contentStandardsScope") ? n.contentStandardsScope : void 0,
            contentStandardAnswers: (0, t.u)(n, "contentStandardAnswers") ? null === n.contentStandardAnswers ? null : n.contentStandardAnswers.map(f) : void 0,
            createdAt: (0, t.u)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.u)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
            archived: (0, t.u)(n, "archived") ? n.archived : void 0,
            enableMonetization: (0, t.u)(n, "enableMonetization") ? n.enableMonetization : void 0,
            moderationStatus: (0, t.u)(n, "moderationStatus") ? n.moderationStatus : void 0,
            licenseDuration: (0, t.u)(n, "licenseDuration") ? y(n.licenseDuration) : void 0,
            licenseType: (0, t.u)(n, "licenseType") ? n.licenseType : void 0,
            licenseTerms: (0, t.u)(n, "licenseTerms") ? A(n.licenseTerms) : void 0,
            averageIphResponseTimeSeconds: (0, t.u)(n, "averageIphResponseTimeSeconds") ? n.averageIphResponseTimeSeconds : void 0,
            pendingEdits: (0, t.u)(n, "pendingEdits") ? R(n.pendingEdits) : void 0,
            hasPendingEdits: (0, t.u)(n, "hasPendingEdits") ? n.hasPendingEdits : void 0
        }
    }

    function N(e) {
        var n;
        return null == (n = e) ? n : {
            universeId: (0, t.u)(n, "universeId") ? n.universeId : void 0,
            universeName: (0, t.u)(n, "universeName") ? n.universeName : void 0,
            rootPlaceId: (0, t.u)(n, "rootPlaceId") ? n.rootPlaceId : void 0,
            description: (0, t.u)(n, "description") ? n.description : void 0,
            creatorType: (0, t.u)(n, "creatorType") ? n.creatorType : void 0,
            creatorTargetId: (0, t.u)(n, "creatorTargetId") ? n.creatorTargetId : void 0
        }
    }

    function V(e) {
        var n;
        return null == (n = e) ? n : {
            licenseId: (0, t.u)(n, "licenseId") ? n.licenseId : void 0,
            listingId: (0, t.u)(n, "listingId") ? n.listingId : void 0,
            listingName: (0, t.u)(n, "listingName") ? n.listingName : void 0,
            creatorName: (0, t.u)(n, "creatorName") ? n.creatorName : void 0,
            licenses: (0, t.u)(n, "licenses") ? null === n.licenses ? null : n.licenses.map(j) : void 0,
            licenseName: (0, t.u)(n, "licenseName") ? n.licenseName : void 0,
            ipFamilyName: (0, t.u)(n, "ipFamilyName") ? n.ipFamilyName : void 0,
            recommendationReason: (0, t.u)(n, "recommendationReason") ? n.recommendationReason : void 0,
            score: (0, t.u)(n, "score") ? n.score : void 0,
            rank: (0, t.u)(n, "rank") ? n.rank : void 0,
            thumbnailAssetIds: (0, t.u)(n, "thumbnailAssetIds") ? n.thumbnailAssetIds : void 0,
            topUniverses: (0, t.u)(n, "topUniverses") ? null === n.topUniverses ? null : n.topUniverses.map(N) : void 0
        }
    }

    function J(e) {
        var n, a;
        return null == (n = e) ? n : {
            id: (0, t.u)(n, "id") ? n.id : void 0,
            agreementId: (0, t.u)(n, "agreementId") ? n.agreementId : void 0,
            contentType: (0, t.u)(n, "contentType") ? n.contentType : void 0,
            contentId: (0, t.u)(n, "contentId") ? n.contentId : void 0,
            createdAt: (0, t.u)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.u)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
            universeMetrics: (0, t.u)(n, "universeMetrics") ? null == (a = n.universeMetrics) ? a : {
                dau7DayBucket: (0, t.u)(a, "dau7DayBucket") ? a.dau7DayBucket : void 0,
                creatorDau7DayBucket: (0, t.u)(a, "creatorDau7DayBucket") ? a.creatorDau7DayBucket : void 0,
                universeContentMaturity: (0, t.u)(a, "universeContentMaturity") ? a.universeContentMaturity : void 0,
                averageDau7Day: (0, t.u)(a, "averageDau7Day") ? a.averageDau7Day : void 0
            } : void 0
        }
    }

    function W(e, n) {
        return null == e ? e : {
            id: (0, t.u)(e, "id") ? e.id : void 0,
            accountId: (0, t.u)(e, "accountId") ? e.accountId : void 0,
            licenseId: (0, t.u)(e, "licenseId") ? e.licenseId : void 0,
            targetAccountId: (0, t.u)(e, "targetAccountId") ? e.targetAccountId : void 0,
            status: (0, t.u)(e, "status") ? e.status : void 0,
            statusExpireAt: (0, t.u)(e, "statusExpireAt") ? null === e.statusExpireAt ? null : new Date(e.statusExpireAt) : void 0,
            terminatesAt: (0, t.u)(e, "terminatesAt") ? null === e.terminatesAt ? null : new Date(e.terminatesAt) : void 0,
            disputeReasons: (0, t.u)(e, "disputeReasons") ? null === e.disputeReasons ? null : e.disputeReasons.map(m) : void 0,
            createdAt: (0, t.u)(e, "createdAt") ? new Date(e.createdAt) : void 0,
            updatedAt: (0, t.u)(e, "updatedAt") ? new Date(e.updatedAt) : void 0,
            enableMonetization: (0, t.u)(e, "enableMonetization") ? e.enableMonetization : void 0,
            creatorLifetimeVisitBucket: (0, t.u)(e, "creatorLifetimeVisitBucket") ? e.creatorLifetimeVisitBucket : void 0,
            activeChangeRequest: (0, t.u)(e, "activeChangeRequest") ? d(e.activeChangeRequest) : void 0,
            conditionalChangeRequest: (0, t.u)(e, "conditionalChangeRequest") ? l(e.conditionalChangeRequest) : void 0,
            startTime: (0, t.u)(e, "startTime") ? null === e.startTime ? null : new Date(e.startTime) : void 0,
            endTime: (0, t.u)(e, "endTime") ? null === e.endTime ? null : new Date(e.endTime) : void 0,
            ipRemovalAttestation: (0, t.u)(e, "ipRemovalAttestation") ? g(e.ipRemovalAttestation) : void 0,
            license: (0, t.u)(e, "license") ? C(e.license) : void 0,
            listing: (0, t.u)(e, "listing") ? q(e.listing) : void 0,
            activityLog: (0, t.u)(e, "activityLog") ? null === e.activityLog ? null : e.activityLog.map(o) : void 0,
            agreementTargets: (0, t.u)(e, "agreementTargets") ? null === e.agreementTargets ? null : e.agreementTargets.map(J) : void 0,
            revenueTargetCounts: (0, t.u)(e, "revenueTargetCounts") ? S(e.revenueTargetCounts) : void 0
        }
    }

    function K(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.u)(n, "id") ? n.id : void 0,
            accountId: (0, t.u)(n, "accountId") ? n.accountId : void 0,
            ipFamilyId: (0, t.u)(n, "ipFamilyId") ? n.ipFamilyId : void 0,
            ipFamilyName: (0, t.u)(n, "ipFamilyName") ? n.ipFamilyName : void 0,
            candidateId: (0, t.u)(n, "candidateId") ? n.candidateId : void 0,
            candidateType: (0, t.u)(n, "candidateType") ? n.candidateType : void 0,
            assetId: (0, t.u)(n, "assetId") ? n.assetId : void 0,
            bundleId: (0, t.u)(n, "bundleId") ? n.bundleId : void 0,
            archived: (0, t.u)(n, "archived") ? n.archived : void 0,
            status: (0, t.u)(n, "status") ? n.status : void 0,
            discoveredAt: (0, t.u)(n, "discoveredAt") ? new Date(n.discoveredAt) : void 0,
            agreementId: (0, t.u)(n, "agreementId") ? n.agreementId : void 0,
            linkedAgreementStatus: (0, t.u)(n, "linkedAgreementStatus") ? n.linkedAgreementStatus : void 0,
            dau7DayBucket: (0, t.u)(n, "dau7DayBucket") ? n.dau7DayBucket : void 0,
            creatorLifetimeVisitBucket: (0, t.u)(n, "creatorLifetimeVisitBucket") ? n.creatorLifetimeVisitBucket : void 0,
            contentMaturity: (0, t.u)(n, "contentMaturity") ? n.contentMaturity : void 0,
            experienceName: (0, t.u)(n, "experienceName") ? n.experienceName : void 0,
            experienceCreatorType: (0, t.u)(n, "experienceCreatorType") ? n.experienceCreatorType : void 0,
            candidateContentCreatorType: (0, t.u)(n, "candidateContentCreatorType") ? n.candidateContentCreatorType : void 0,
            creatorName: (0, t.u)(n, "creatorName") ? n.creatorName : void 0,
            priceRobux: (0, t.u)(n, "priceRobux") ? n.priceRobux : void 0,
            isOnSale: (0, t.u)(n, "isOnSale") ? n.isOnSale : void 0,
            favoriteCount: (0, t.u)(n, "favoriteCount") ? n.favoriteCount : void 0,
            saleCount: (0, t.u)(n, "saleCount") ? n.saleCount : void 0,
            creatorEarningsBucket: (0, t.u)(n, "creatorEarningsBucket") ? n.creatorEarningsBucket : void 0,
            avatarCategory: (0, t.u)(n, "avatarCategory") ? n.avatarCategory : void 0
        }
    }

    function Q(e, n) {
        return null == e ? e : {
            agreements: (0, t.u)(e, "agreements") ? null === e.agreements ? null : e.agreements.map(b) : void 0,
            nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function Y(e, n) {
        return null == e ? e : {
            licenses: (0, t.u)(e, "licenses") ? null === e.licenses ? null : e.licenses.map(j) : void 0,
            nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function X(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.u)(n, "id") ? n.id : void 0,
            accountId: (0, t.u)(n, "accountId") ? n.accountId : void 0,
            ipFamilyId: (0, t.u)(n, "ipFamilyId") ? n.ipFamilyId : void 0,
            name: (0, t.u)(n, "name") ? n.name : void 0,
            description: (0, t.u)(n, "description") ? n.description : void 0,
            status: (0, t.u)(n, "status") ? n.status : void 0,
            statusReason: (0, t.u)(n, "statusReason") ? n.statusReason : void 0,
            visibility: (0, t.u)(n, "visibility") ? n.visibility : void 0,
            thumbnailAssetIds: (0, t.u)(n, "thumbnailAssetIds") ? n.thumbnailAssetIds : void 0,
            createdAt: (0, t.u)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.u)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
            archived: (0, t.u)(n, "archived") ? n.archived : void 0,
            responseTimeMetrics: (0, t.u)(n, "responseTimeMetrics") ? T(n.responseTimeMetrics) : void 0
        }
    }

    function Z(e, n) {
        return null == e ? e : {
            listings: (0, t.u)(e, "listings") ? null === e.listings ? null : e.listings.map(X) : void 0,
            nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function $(e) {
        var n;
        return null == (n = e) ? n : {
            id: n.id,
            accountId: n.accountId,
            targetAccountId: n.targetAccountId,
            ipFamilyId: n.ipFamilyId,
            scope: z(n.scope),
            status: (0, t.u)(n, "status") ? n.status : void 0,
            createdAt: (0, t.u)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.u)(n, "updatedAt") ? new Date(n.updatedAt) : void 0
        }
    }

    function ee(e, n) {
        return null == e ? e : {
            officialAgreements: (0, t.u)(e, "officialAgreements") ? null === e.officialAgreements ? null : e.officialAgreements.map($) : void 0,
            nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function et(e) {
        var n, a;
        return null == (n = e) ? n : {
            id: (0, t.u)(n, "id") ? n.id : void 0,
            listingId: (0, t.u)(n, "listingId") ? n.listingId : void 0,
            listingName: (0, t.u)(n, "listingName") ? n.listingName : void 0,
            name: (0, t.u)(n, "name") ? n.name : void 0,
            description: (0, t.u)(n, "description") ? n.description : void 0,
            visibility: (0, t.u)(n, "visibility") ? n.visibility : void 0,
            countries: (0, t.u)(n, "countries") ? n.countries : void 0,
            licenseDuration: (0, t.u)(n, "licenseDuration") ? null == (a = n.licenseDuration) ? a : {
                durationType: (0, t.u)(a, "durationType") ? a.durationType : void 0,
                timeBounds: (0, t.u)(a, "timeBounds") ? w(a.timeBounds) : void 0
            } : void 0,
            maxAgeRating: (0, t.u)(n, "maxAgeRating") ? n.maxAgeRating : void 0,
            createdAt: (0, t.u)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.u)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
            licenseType: (0, t.u)(n, "licenseType") ? n.licenseType : void 0,
            licenseTerms: (0, t.u)(n, "licenseTerms") ? A(n.licenseTerms) : void 0
        }
    }

    function en(e, n) {
        return null == e ? e : {
            licenses: (0, t.u)(e, "licenses") ? null === e.licenses ? null : e.licenses.map(et) : void 0,
            nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function ea(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.u)(n, "id") ? n.id : void 0,
            name: (0, t.u)(n, "name") ? n.name : void 0,
            description: (0, t.u)(n, "description") ? n.description : void 0,
            status: (0, t.u)(n, "status") ? n.status : void 0,
            visibility: (0, t.u)(n, "visibility") ? n.visibility : void 0,
            thumbnailAssetIds: (0, t.u)(n, "thumbnailAssetIds") ? n.thumbnailAssetIds : void 0,
            createdAt: (0, t.u)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.u)(n, "updatedAt") ? new Date(n.updatedAt) : void 0
        }
    }

    function er(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.u)(n, "id") ? n.id : void 0,
            accountId: (0, t.u)(n, "accountId") ? n.accountId : void 0,
            ipFamilyId: (0, t.u)(n, "ipFamilyId") ? n.ipFamilyId : void 0,
            candidateId: (0, t.u)(n, "candidateId") ? n.candidateId : void 0,
            candidateType: (0, t.u)(n, "candidateType") ? n.candidateType : void 0,
            status: (0, t.u)(n, "status") ? n.status : void 0,
            licenseId: (0, t.u)(n, "licenseId") ? n.licenseId : void 0,
            agreementId: (0, t.u)(n, "agreementId") ? n.agreementId : void 0,
            createdAt: (0, t.u)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.u)(n, "updatedAt") ? new Date(n.updatedAt) : void 0
        }
    }

    function ei(e) {
        var n;
        return null == (n = e) ? n : {
            revenueTargetType: (0, t.u)(n, "revenueTargetType") ? n.revenueTargetType : void 0,
            revenueTargetId: (0, t.u)(n, "revenueTargetId") ? n.revenueTargetId : void 0,
            iphEarningsRobux: (0, t.u)(n, "iphEarningsRobux") ? n.iphEarningsRobux : void 0,
            creatorEarningsRobux: (0, t.u)(n, "creatorEarningsRobux") ? n.creatorEarningsRobux : void 0,
            transactionCount: (0, t.u)(n, "transactionCount") ? n.transactionCount : void 0
        }
    }

    function eo(e) {
        var n;
        return null == (n = e) ? n : {
            revenueTargetType: (0, t.u)(n, "revenueTargetType") ? n.revenueTargetType : void 0,
            revenueTargetId: (0, t.u)(n, "revenueTargetId") ? n.revenueTargetId : void 0
        }
    }

    function ec(e, n) {
        return null == e ? e : {
            revenueTargets: (0, t.u)(e, "revenueTargets") ? null === e.revenueTargets ? null : e.revenueTargets.map(eo) : void 0,
            nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function es(e) {
        var n;
        return null == (n = e) ? n : {
            contentType: (0, t.u)(n, "contentType") ? n.contentType : void 0,
            contentId: (0, t.u)(n, "contentId") ? n.contentId : void 0
        }
    }

    function eu(e, n) {
        return null == e ? e : {
            content: (0, t.u)(e, "content") ? null === e.content ? null : e.content.map(es) : void 0
        }
    }

    function ed(e) {
        if (void 0 !== e) return null === e ? null : {
            contentType: e.contentType,
            contentId: e.contentId
        }
    }
    var el = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.agreementCandidatesBatchPromoteAgreementCandidatesRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesBatchPromoteAgreementCandidates.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreement_candidates:batchPromote".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/agreement_candidates:batchPromote",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            licenseId: e.licenseId,
                                            enableMonetization: e.enableMonetization,
                                            agreementCandidateIds: e.agreementCandidateIds
                                        }
                                    }(e.agreementCandidatesBatchPromoteAgreementCandidatesRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        results: (0, t.u)(e, "results") ? null === e.results ? null : e.results.map(E) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesBatchPromoteAgreementCandidates = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementCandidatesBatchPromoteAgreementCandidatesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesGetAgreementCandidateByIdRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesGetAgreementCandidateById.");
                                if (null === e.agreementCandidateId || void 0 === e.agreementCandidateId) throw new t.w("agreementCandidateId", "Required parameter requestParameters.agreementCandidateId was null or undefined when calling agreementCandidatesGetAgreementCandidateById.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementCandidateId", "}"), encodeURIComponent(String(e.agreementCandidateId))),
                                    schemaPath: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesGetAgreementCandidateById = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementCandidatesGetAgreementCandidateByIdRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesGetCreatorLifetimeMetricsForAgreementCandidateRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesGetCreatorLifetimeMetricsForAgreementCandidate.");
                                if (null === e.agreementCandidateId || void 0 === e.agreementCandidateId) throw new t.w("agreementCandidateId", "Required parameter requestParameters.agreementCandidateId was null or undefined when calling agreementCandidatesGetCreatorLifetimeMetricsForAgreementCandidate.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement-candidate/{agreementCandidateId}/creator-lifetime-metrics".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementCandidateId", "}"), encodeURIComponent(String(e.agreementCandidateId))),
                                    schemaPath: "/v1/account/{accountId}/agreement-candidate/{agreementCandidateId}/creator-lifetime-metrics",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesGetCreatorLifetimeMetricsForAgreementCandidate = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementCandidatesGetCreatorLifetimeMetricsForAgreementCandidateRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesGetExperienceOverviewByAgreementCandidateRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesGetExperienceOverviewByAgreementCandidate.");
                                if (null === e.agreementCandidateId || void 0 === e.agreementCandidateId) throw new t.w("agreementCandidateId", "Required parameter requestParameters.agreementCandidateId was null or undefined when calling agreementCandidatesGetExperienceOverviewByAgreementCandidate.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}/experience_overview".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementCandidateId", "}"), encodeURIComponent(String(e.agreementCandidateId))),
                                    schemaPath: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}/experience_overview",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        status: (0, t.u)(e, "status") ? e.status : void 0,
                                        version: (0, t.u)(e, "version") ? e.version : void 0,
                                        sections: (0, t.u)(e, "sections") ? null === e.sections ? null : e.sections.map(F) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesGetExperienceOverviewByAgreementCandidate = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementCandidatesGetExperienceOverviewByAgreementCandidateRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesGetPlacefileImagesByAgreementCandidateRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesGetPlacefileImagesByAgreementCandidate.");
                                if (null === e.agreementCandidateId || void 0 === e.agreementCandidateId) throw new t.w("agreementCandidateId", "Required parameter requestParameters.agreementCandidateId was null or undefined when calling agreementCandidatesGetPlacefileImagesByAgreementCandidate.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}/placefile_images".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementCandidateId", "}"), encodeURIComponent(String(e.agreementCandidateId))),
                                    schemaPath: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}/placefile_images",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        assetIds: (0, t.u)(e, "assetIds") ? e.assetIds : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesGetPlacefileImagesByAgreementCandidate = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementCandidatesGetPlacefileImagesByAgreementCandidateRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesIgnoreAgreementCandidateRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesIgnoreAgreementCandidate.");
                                if (null === e.agreementCandidateId || void 0 === e.agreementCandidateId) throw new t.w("agreementCandidateId", "Required parameter requestParameters.agreementCandidateId was null or undefined when calling agreementCandidatesIgnoreAgreementCandidate.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}/ignore".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementCandidateId", "}"), encodeURIComponent(String(e.agreementCandidateId))),
                                    schemaPath: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}/ignore",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            reason: e.reason
                                        }
                                    }(e.agreementCandidatesIgnoreAgreementCandidateRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesIgnoreAgreementCandidate = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementCandidatesIgnoreAgreementCandidateRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesListAgreementCandidatesByAccountRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesListAgreementCandidatesByAccount.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.filter && (a.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement_candidates".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/agreement_candidates",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        agreementCandidates: (0, t.u)(e, "agreementCandidates") ? null === e.agreementCandidates ? null : e.agreementCandidates.map(c) : void 0,
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesListAgreementCandidatesByAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementCandidatesListAgreementCandidatesByAccountRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesListIndexedAgreementCandidatesByAccountRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesListIndexedAgreementCandidatesByAccount.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.archived && (a.archived = e.archived), void 0 !== e.ipFamilyId && (a.ipFamilyId = e.ipFamilyId), e.dau7DayBucket && (a.dau7DayBucket = e.dau7DayBucket), e.creatorLifetimeVisitBucket && (a.creatorLifetimeVisitBucket = e.creatorLifetimeVisitBucket), e.contentMaturity && (a.contentMaturity = e.contentMaturity), void 0 !== e.offerStatus && (a.offerStatus = e.offerStatus), void 0 !== e.sortBy && (a.sortBy = e.sortBy), void 0 !== e.sortDirection && (a.sortDirection = e.sortDirection), void 0 !== e.candidateType && (a.candidateType = e.candidateType), e.creatorEarningsBucket && (a.creatorEarningsBucket = e.creatorEarningsBucket), e.avatarCategory && (a.avatarCategory = e.avatarCategory), void 0 !== e.priceMin && (a.priceMin = e.priceMin), void 0 !== e.priceMax && (a.priceMax = e.priceMax), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/matches".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/matches",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        agreementCandidates: (0, t.u)(e, "agreementCandidates") ? null === e.agreementCandidates ? null : e.agreementCandidates.map(K) : void 0,
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesListIndexedAgreementCandidatesByAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementCandidatesListIndexedAgreementCandidatesByAccountRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesPromoteAgreementCandidateRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesPromoteAgreementCandidate.");
                                if (null === e.agreementCandidateId || void 0 === e.agreementCandidateId) throw new t.w("agreementCandidateId", "Required parameter requestParameters.agreementCandidateId was null or undefined when calling agreementCandidatesPromoteAgreementCandidate.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}/promote".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementCandidateId", "}"), encodeURIComponent(String(e.agreementCandidateId))),
                                    schemaPath: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}/promote",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            licenseId: e.licenseId,
                                            enableMonetization: e.enableMonetization,
                                            promotionType: e.promotionType,
                                            feedbackText: e.feedbackText
                                        }
                                    }(e.agreementCandidatesPromoteAgreementCandidateRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return p(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesPromoteAgreementCandidate = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementCandidatesPromoteAgreementCandidateRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        eg = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.agreementsAcceptAgreementDisputeRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsAcceptAgreementDispute.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsAcceptAgreementDispute.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/accept_dispute".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/accept_dispute",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsAcceptAgreementDispute = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsAcceptAgreementDisputeRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsAcceptAgreementOfferRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsAcceptAgreementOffer.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsAcceptAgreementOffer.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/accept_offer".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/accept_offer",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsAcceptAgreementOffer = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsAcceptAgreementOfferRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsAcknowledgeCompletedChangeRequestRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsAcknowledgeCompletedChangeRequest.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsAcknowledgeCompletedChangeRequest.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/acknowledge_completed_change_request".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/acknowledge_completed_change_request",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsAcknowledgeCompletedChangeRequest = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsAcknowledgeCompletedChangeRequestRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsActivateAcceptedAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsActivateAcceptedAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsActivateAcceptedAgreement.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/activate".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/activate",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsActivateAcceptedAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsActivateAcceptedAgreementRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsApproveConditionalChangeRequestRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsApproveConditionalChangeRequest.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsApproveConditionalChangeRequest.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/approve_conditional_change_request".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/approve_conditional_change_request",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsApproveConditionalChangeRequest = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsApproveConditionalChangeRequestRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsApproveLicenseApplicationRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsApproveLicenseApplication.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsApproveLicenseApplication.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/approve".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/approve",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsApproveLicenseApplication = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsApproveLicenseApplicationRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsArchiveUnsuccessfulOfferRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsArchiveUnsuccessfulOffer.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsArchiveUnsuccessfulOffer.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/archive_unsuccessful_offer".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/archive_unsuccessful_offer",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsArchiveUnsuccessfulOffer = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsArchiveUnsuccessfulOfferRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsAttestIpRemovalRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsAttestIpRemoval.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsAttestIpRemoval.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/attest_ip_removal".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/attest_ip_removal",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsAttestIpRemoval = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsAttestIpRemovalRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsBatchGetAgreementStatusByIdsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsBatchGetAgreementStatusByIds.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreements/ids".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/agreements/ids",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            agreementIds: e.agreementIds
                                        }
                                    }(e.agreementsBatchGetAgreementStatusByIdsRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        results: (0, t.u)(e, "results") ? null === e.results ? null : e.results.map(x) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsBatchGetAgreementStatusByIds = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsBatchGetAgreementStatusByIdsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsBatchGetAgreementsByRevenueTargetsForCreatorRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.creatorType || void 0 === e.creatorType) throw new t.w("creatorType", "Required parameter requestParameters.creatorType was null or undefined when calling agreementsBatchGetAgreementsByRevenueTargetsForCreator.");
                                if (null === e.creatorId || void 0 === e.creatorId) throw new t.w("creatorId", "Required parameter requestParameters.creatorId was null or undefined when calling agreementsBatchGetAgreementsByRevenueTargetsForCreator.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/creator_type/{creatorType}/creator_id/{creatorId}/agreements/by-revenue-targets".replace("{".concat("creatorType", "}"), encodeURIComponent(String(e.creatorType))).replace("{".concat("creatorId", "}"), encodeURIComponent(String(e.creatorId))),
                                    schemaPath: "/v1/creator_type/{creatorType}/creator_id/{creatorId}/agreements/by-revenue-targets",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            revenueTargets: e.revenueTargets.map(I)
                                        }
                                    }(e.agreementsBatchGetAgreementsByRevenueTargetsForCreatorRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        results: (0, t.u)(e, "results") ? null === e.results ? null : e.results.map(P) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsBatchGetAgreementsByRevenueTargetsForCreator = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsBatchGetAgreementsByRevenueTargetsForCreatorRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsCancelAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsCancelAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsCancelAgreement.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/cancel".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/cancel",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            reason: e.reason
                                        }
                                    }(e.agreementsCancelAgreementRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsCancelAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsCancelAgreementRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsCompleteChangeRequestRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsCompleteChangeRequest.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsCompleteChangeRequest.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/complete_change_request".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/complete_change_request",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsCompleteChangeRequest = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsCompleteChangeRequestRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsCompleteConditionalChangeRequestRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsCompleteConditionalChangeRequest.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsCompleteConditionalChangeRequest.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/complete_conditional_change_request".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/complete_conditional_change_request",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsCompleteConditionalChangeRequest = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsCompleteConditionalChangeRequestRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsCreateInternalLicenseAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsCreateInternalLicenseAgreement.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/internal_license_agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/internal_license_agreements",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            ipFamilyId: e.ipFamilyId,
                                            contentType: e.contentType,
                                            contentId: e.contentId,
                                            badges: e.badges.map(B)
                                        }
                                    }(e.agreementsCreateInternalLicenseAgreementRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    var n, a;
                                    return null == e ? e : {
                                        agreement: (0, t.u)(e, "agreement") ? null == (n = e.agreement) ? n : {
                                            id: (0, t.u)(n, "id") ? n.id : void 0,
                                            accountId: (0, t.u)(n, "accountId") ? n.accountId : void 0,
                                            licenseId: (0, t.u)(n, "licenseId") ? n.licenseId : void 0,
                                            targetAccountId: (0, t.u)(n, "targetAccountId") ? n.targetAccountId : void 0,
                                            status: (0, t.u)(n, "status") ? n.status : void 0,
                                            statusExpireAt: (0, t.u)(n, "statusExpireAt") ? null === n.statusExpireAt ? null : new Date(n.statusExpireAt) : void 0,
                                            terminatesAt: (0, t.u)(n, "terminatesAt") ? null === n.terminatesAt ? null : new Date(n.terminatesAt) : void 0,
                                            disputeReasons: (0, t.u)(n, "disputeReasons") ? null === n.disputeReasons ? null : n.disputeReasons.map(m) : void 0,
                                            createdAt: (0, t.u)(n, "createdAt") ? new Date(n.createdAt) : void 0,
                                            updatedAt: (0, t.u)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
                                            enableMonetization: (0, t.u)(n, "enableMonetization") ? n.enableMonetization : void 0,
                                            creatorLifetimeVisitBucket: (0, t.u)(n, "creatorLifetimeVisitBucket") ? n.creatorLifetimeVisitBucket : void 0,
                                            activeChangeRequest: (0, t.u)(n, "activeChangeRequest") ? d(n.activeChangeRequest) : void 0,
                                            conditionalChangeRequest: (0, t.u)(n, "conditionalChangeRequest") ? l(n.conditionalChangeRequest) : void 0,
                                            startTime: (0, t.u)(n, "startTime") ? null === n.startTime ? null : new Date(n.startTime) : void 0,
                                            endTime: (0, t.u)(n, "endTime") ? null === n.endTime ? null : new Date(n.endTime) : void 0,
                                            ipRemovalAttestation: (0, t.u)(n, "ipRemovalAttestation") ? g(n.ipRemovalAttestation) : void 0
                                        } : void 0,
                                        contentBadge: (0, t.u)(e, "contentBadge") ? null == (a = e.contentBadge) ? a : {
                                            contentType: (0, t.u)(a, "contentType") ? a.contentType : void 0,
                                            contentId: (0, t.u)(a, "contentId") ? a.contentId : void 0,
                                            badges: (0, t.u)(a, "badges") ? null === a.badges ? null : a.badges.map(L) : void 0,
                                            agreementId: (0, t.u)(a, "agreementId") ? a.agreementId : void 0,
                                            updatedAt: (0, t.u)(a, "updatedAt") ? null === a.updatedAt ? null : new Date(a.updatedAt) : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsCreateInternalLicenseAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsCreateInternalLicenseAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsDisputeAgreementOfferRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsDisputeAgreementOffer.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsDisputeAgreementOffer.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/dispute_offer".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/dispute_offer",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            disputeReason: e.disputeReason
                                        }
                                    }(e.agreementsDisputeAgreementOfferRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsDisputeAgreementOffer = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsDisputeAgreementOfferRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsEnableMonetizationRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsEnableMonetization.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsEnableMonetization.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/enable_monetization".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/enable_monetization",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsEnableMonetization = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsEnableMonetizationRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsGetAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsGetAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsGetAgreement.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return W(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsGetAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsGetAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsGetAgreementCountByStatusAndAccountRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsGetAgreementCountByStatusAndAccount.");
                                return a = {}, void 0 !== e.statuses && (a.statuses = e.statuses), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreements/count".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/agreements/count",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return H(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsGetAgreementCountByStatusAndAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsGetAgreementCountByStatusAndAccountRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsGetAgreementCountByStatusAndTargetAccountRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsGetAgreementCountByStatusAndTargetAccount.");
                                return a = {}, void 0 !== e.statuses && (a.statuses = e.statuses), r = {}, [4, this.request({
                                    path: "/v1/agreements/{accountId}/creator_agreements/count".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/agreements/{accountId}/creator_agreements/count",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return H(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsGetAgreementCountByStatusAndTargetAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsGetAgreementCountByStatusAndTargetAccountRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsGetCreatorAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsGetCreatorAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsGetCreatorAgreement.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/creator_agreement/{agreementId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/creator_agreement/{agreementId}",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return W(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsGetCreatorAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsGetCreatorAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsGetCreatorLifetimeMetricsForAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsGetCreatorLifetimeMetricsForAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsGetCreatorLifetimeMetricsForAgreement.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/creator-lifetime-metrics".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/creator-lifetime-metrics",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsGetCreatorLifetimeMetricsForAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsGetCreatorLifetimeMetricsForAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsGetCreatorPitchImagesByAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsGetCreatorPitchImagesByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsGetCreatorPitchImagesByAgreement.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/creator_agreement/{agreementId}/pitch_images".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/creator_agreement/{agreementId}/pitch_images",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsGetCreatorPitchImagesByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsGetCreatorPitchImagesByAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsGetPitchImagesByAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsGetPitchImagesByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsGetPitchImagesByAgreement.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/pitch_images".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/pitch_images",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsGetPitchImagesByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsGetPitchImagesByAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsInitiateChangeRequestRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsInitiateChangeRequest.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsInitiateChangeRequest.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/initiate_change_request".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/initiate_change_request",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            changeRequestReason: e.changeRequestReason
                                        }
                                    }(e.agreementsInitiateChangeRequestRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        status: (0, t.u)(e, "status") ? e.status : void 0,
                                        reason: (0, t.u)(e, "reason") ? e.reason : void 0,
                                        rejectionMessage: (0, t.u)(e, "rejectionMessage") ? e.rejectionMessage : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsInitiateChangeRequest = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsInitiateChangeRequestRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementActivitiesByAccountRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, c;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListAgreementActivitiesByAccount.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsListAgreementActivitiesByAccount.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/activities".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/activities",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return c = i.sent(), [2, new t.H(c, function(e) {
                                    return null == e ? e : {
                                        activities: (0, t.u)(e, "activities") ? null === e.activities ? null : e.activities.map(o) : void 0,
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementActivitiesByAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsListAgreementActivitiesByAccountRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementTargetsByAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListAgreementTargetsByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsListAgreementTargetsByAgreement.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/targets".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/targets",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        targets: (0, t.u)(e, "targets") ? null === e.targets ? null : e.targets.map(h) : void 0,
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementTargetsByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsListAgreementTargetsByAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementsByAccountRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListAgreementsByAccount.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.filter && (a.filter = e.filter), void 0 !== e.licenseTypes && (a.licenseTypes = e.licenseTypes), void 0 !== e.statuses && (a.statuses = e.statuses), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/agreements",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return Q(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementsByAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsListAgreementsByAccountRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementsByCreatorRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.creatorId || void 0 === e.creatorId) throw new t.w("creatorId", "Required parameter requestParameters.creatorId was null or undefined when calling agreementsListAgreementsByCreator.");
                                if (null === e.creatorType || void 0 === e.creatorType) throw new t.w("creatorType", "Required parameter requestParameters.creatorType was null or undefined when calling agreementsListAgreementsByCreator.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.filter && (a.filter = e.filter), void 0 !== e.licenseTypes && (a.licenseTypes = e.licenseTypes), void 0 !== e.statuses && (a.statuses = e.statuses), r = {}, [4, this.request({
                                    path: "/v1/creator_type/{creatorType}/creator_id/{creatorId}/agreements".replace("{".concat("creatorId", "}"), encodeURIComponent(String(e.creatorId))).replace("{".concat("creatorType", "}"), encodeURIComponent(String(e.creatorType))),
                                    schemaPath: "/v1/creator_type/{creatorType}/creator_id/{creatorId}/agreements",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return Q(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementsByCreator = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsListAgreementsByCreatorRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementsByLicenseRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListAgreementsByLicense.");
                                if (null === e.licenseId || void 0 === e.licenseId) throw new t.w("licenseId", "Required parameter requestParameters.licenseId was null or undefined when calling agreementsListAgreementsByLicense.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.filter && (a.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/license/{licenseId}/agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("licenseId", "}"), encodeURIComponent(String(e.licenseId))),
                                    schemaPath: "/v1/account/{accountId}/license/{licenseId}/agreements",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        agreements: (0, t.u)(e, "agreements") ? null === e.agreements ? null : e.agreements.map(p) : void 0,
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementsByLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsListAgreementsByLicenseRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementsByTargetAccountRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListAgreementsByTargetAccount.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.filter && (a.filter = e.filter), void 0 !== e.licenseTypes && (a.licenseTypes = e.licenseTypes), void 0 !== e.statuses && (a.statuses = e.statuses), r = {}, [4, this.request({
                                    path: "/v1/agreements/{accountId}/creator_agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/agreements/{accountId}/creator_agreements",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return Q(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementsByTargetAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsListAgreementsByTargetAccountRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsListContentBadgesByAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListContentBadgesByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsListContentBadgesByAgreement.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/content-badges".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/content-badges",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        contentBadges: (0, t.u)(e, "contentBadges") ? null === e.contentBadges ? null : e.contentBadges.map(G) : void 0,
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListContentBadgesByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsListContentBadgesByAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsListHydratedAgreementTargetsByAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListHydratedAgreementTargetsByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsListHydratedAgreementTargetsByAgreement.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/hydrated-targets".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/hydrated-targets",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        targets: (0, t.u)(e, "targets") ? null === e.targets ? null : e.targets.map(J) : void 0,
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListHydratedAgreementTargetsByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsListHydratedAgreementTargetsByAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsListRevenueTargetEarningsByAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListRevenueTargetEarningsByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsListRevenueTargetEarningsByAgreement.");
                                return a = {}, void 0 !== e.startDate && (a.startDate = e.startDate), void 0 !== e.endDate && (a.endDate = e.endDate), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/revenue-target-earnings".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/revenue-target-earnings",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        revenueTargetEarnings: (0, t.u)(e, "revenueTargetEarnings") ? null === e.revenueTargetEarnings ? null : e.revenueTargetEarnings.map(ei) : void 0,
                                        earningsDataThroughTime: (0, t.u)(e, "earningsDataThroughTime") ? null === e.earningsDataThroughTime ? null : new Date(e.earningsDataThroughTime) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListRevenueTargetEarningsByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsListRevenueTargetEarningsByAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsListRevenueTargetsByAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListRevenueTargetsByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsListRevenueTargetsByAgreement.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/revenue-targets".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/revenue-targets",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return ec(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListRevenueTargetsByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsListRevenueTargetsByAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsRejectAgreementDisputeRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsRejectAgreementDispute.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsRejectAgreementDispute.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/reject_dispute".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/reject_dispute",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsRejectAgreementDispute = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsRejectAgreementDisputeRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsRejectConditionalChangeRequestRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsRejectConditionalChangeRequest.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsRejectConditionalChangeRequest.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/reject_conditional_change_request".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/reject_conditional_change_request",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsRejectConditionalChangeRequest = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsRejectConditionalChangeRequestRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsRejectLicenseApplicationRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsRejectLicenseApplication.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsRejectLicenseApplication.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/reject".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/reject",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            feedback: e.feedback
                                        }
                                    }(e.agreementsRejectLicenseApplicationRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.agreementsRejectLicenseApplication = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsRejectLicenseApplicationRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsSetContentBadgesRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsSetContentBadges.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsSetContentBadges.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/content-badges".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/content-badges",
                                    method: "PUT",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            contentBadges: e.contentBadges.map(k)
                                        }
                                    }(e.agreementsSetContentBadgesRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        contentBadges: (0, t.u)(e, "contentBadges") ? null === e.contentBadges ? null : e.contentBadges.map(G) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsSetContentBadges = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsSetContentBadgesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.agreementsUpdateCreatorPitchImagesByAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsUpdateCreatorPitchImagesByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsUpdateCreatorPitchImagesByAgreement.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/creator_agreement/{agreementId}/pitch_images".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/creator_agreement/{agreementId}/pitch_images",
                                    method: "PUT",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            pitchImageAssetIds: e.pitchImageAssetIds
                                        }
                                    }(e.agreementsUpdateCreatorPitchImagesByAgreementRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsUpdateCreatorPitchImagesByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsUpdateCreatorPitchImagesByAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        em = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.creatorGetMarketplaceEarningsBucketRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.creatorType || void 0 === e.creatorType) throw new t.w("creatorType", "Required parameter requestParameters.creatorType was null or undefined when calling creatorGetMarketplaceEarningsBucket.");
                                if (null === e.creatorId || void 0 === e.creatorId) throw new t.w("creatorId", "Required parameter requestParameters.creatorId was null or undefined when calling creatorGetMarketplaceEarningsBucket.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/creator_type/{creatorType}/creator_id/{creatorId}/marketplace-earnings-bucket".replace("{".concat("creatorType", "}"), encodeURIComponent(String(e.creatorType))).replace("{".concat("creatorId", "}"), encodeURIComponent(String(e.creatorId))),
                                    schemaPath: "/v1/creator_type/{creatorType}/creator_id/{creatorId}/marketplace-earnings-bucket",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        creatorEarningsBucket: (0, t.u)(e, "creatorEarningsBucket") ? e.creatorEarningsBucket : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.creatorGetMarketplaceEarningsBucket = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.creatorGetMarketplaceEarningsBucketRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        ep = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.earningsExportEarningsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling earningsExportEarnings.");
                                return a = {}, void 0 !== e.startDate && (a.startDate = e.startDate), void 0 !== e.endDate && (a.endDate = e.endDate), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/earnings/export".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/earnings/export",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.y(o)]
                        }
                    })
                })
            }, n.prototype.earningsExportEarnings = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.earningsExportEarningsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        eh = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.lLMModerationModerateMessageRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/llm-moderation/moderate-message",
                                    schemaPath: "/v1/llm-moderation/moderate-message",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            message: e.message
                                        }
                                    }(e.lLMModerationModerateMessageRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        status: (0, t.u)(e, "status") ? e.status : void 0,
                                        reason: (0, t.u)(e, "reason") ? e.reason : void 0,
                                        rejectionMessage: (0, t.u)(e, "rejectionMessage") ? e.rejectionMessage : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.lLMModerationModerateMessage = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.lLMModerationModerateMessageRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        ev = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.licensesApplyToLicenseRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.licenseId || void 0 === e.licenseId) throw new t.w("licenseId", "Required parameter requestParameters.licenseId was null or undefined when calling licensesApplyToLicense.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/license/{licenseId}/apply".replace("{".concat("licenseId", "}"), encodeURIComponent(String(e.licenseId))),
                                    schemaPath: "/v1/license/{licenseId}/apply",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            enableMonetization: e.enableMonetization,
                                            pitch: e.pitch,
                                            targets: e.targets.map(s),
                                            startTime: void 0 === e.startTime ? void 0 : null === e.startTime ? null : e.startTime.toISOString(),
                                            endTime: void 0 === e.endTime ? void 0 : null === e.endTime ? null : e.endTime.toISOString(),
                                            revenueTargets: void 0 === e.revenueTargets ? void 0 : null === e.revenueTargets ? null : e.revenueTargets.map(U),
                                            pitchImageAssetIds: e.pitchImageAssetIds
                                        }
                                    }(e.licensesApplyToLicenseRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return p(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesApplyToLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.licensesApplyToLicenseRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.licensesArchiveLicenseRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling licensesArchiveLicense.");
                                if (null === e.licenseId || void 0 === e.licenseId) throw new t.w("licenseId", "Required parameter requestParameters.licenseId was null or undefined when calling licensesArchiveLicense.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/license/{licenseId}/archive".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("licenseId", "}"), encodeURIComponent(String(e.licenseId))),
                                    schemaPath: "/v1/account/{accountId}/license/{licenseId}/archive",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, n.prototype.licensesArchiveLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.licensesArchiveLicenseRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.licensesCreateLicenseRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling licensesCreateLicense.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/licenses".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/licenses",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            listingId: e.listingId,
                                            name: e.name,
                                            description: e.description,
                                            royaltyRate: e.royaltyRate,
                                            dau7DayThreshold: e.dau7DayThreshold,
                                            creatorDau7DayThreshold: e.creatorDau7DayThreshold,
                                            maxAgeRating: e.maxAgeRating,
                                            countries: e.countries,
                                            visibility: e.visibility,
                                            enableMonetization: e.enableMonetization,
                                            licenseDuration: M(e.licenseDuration),
                                            contentStandardsDocumentId: e.contentStandardsDocumentId,
                                            contentStandardScope: e.contentStandardScope,
                                            contentStandardAnswers: void 0 === e.contentStandardAnswers ? void 0 : null === e.contentStandardAnswers ? null : e.contentStandardAnswers.map(_),
                                            licenseType: e.licenseType,
                                            licenseTerms: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    reselling: e.reselling,
                                                    minimumCreatorEarningsBucket: e.minimumCreatorEarningsBucket
                                                }
                                            }(e.licenseTerms)
                                        }
                                    }(e.licensesCreateLicenseRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return j(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesCreateLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.licensesCreateLicenseRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.licensesGetLicenseRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling licensesGetLicense.");
                                if (null === e.licenseId || void 0 === e.licenseId) throw new t.w("licenseId", "Required parameter requestParameters.licenseId was null or undefined when calling licensesGetLicense.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/license/{licenseId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("licenseId", "}"), encodeURIComponent(String(e.licenseId))),
                                    schemaPath: "/v1/account/{accountId}/license/{licenseId}",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return j(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesGetLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.licensesGetLicenseRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.licensesGetPublicLicenseRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.licenseId || void 0 === e.licenseId) throw new t.w("licenseId", "Required parameter requestParameters.licenseId was null or undefined when calling licensesGetPublicLicense.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/license/{licenseId}".replace("{".concat("licenseId", "}"), encodeURIComponent(String(e.licenseId))),
                                    schemaPath: "/v1/license/{licenseId}",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return j(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesGetPublicLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.licensesGetPublicLicenseRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.licensesListEligibleContentsByLicenseRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.licenseId || void 0 === e.licenseId) throw new t.w("licenseId", "Required parameter requestParameters.licenseId was null or undefined when calling licensesListEligibleContentsByLicense.");
                                return a = {}, void 0 !== e.contentType && (a.contentType = e.contentType), void 0 !== e.creatorId && (a.creatorId = e.creatorId), void 0 !== e.creatorType && (a.creatorType = e.creatorType), void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/license/{licenseId}/eligible_contents".replace("{".concat("licenseId", "}"), encodeURIComponent(String(e.licenseId))),
                                    schemaPath: "/v1/license/{licenseId}/eligible_contents",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        agreementContents: (0, t.u)(e, "agreementContents") ? null === e.agreementContents ? null : e.agreementContents.map(u) : void 0,
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.licensesListEligibleContentsByLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.licensesListEligibleContentsByLicenseRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.licensesListLicensesByListingRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling licensesListLicensesByListing.");
                                if (null === e.listingId || void 0 === e.listingId) throw new t.w("listingId", "Required parameter requestParameters.listingId was null or undefined when calling licensesListLicensesByListing.");
                                return a = {}, void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.pageSize && (a.pageSize = e.pageSize), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/listing/{listingId}/licenses".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/account/{accountId}/listing/{listingId}/licenses",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return Y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesListLicensesByListing = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.licensesListLicensesByListingRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.licensesListPublicLicensesRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return a = {}, void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.filter && (a.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/licenses",
                                    schemaPath: "/v1/licenses",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return Y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesListPublicLicenses = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.licensesListPublicLicensesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.licensesListPublicLicensesByListingRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.listingId || void 0 === e.listingId) throw new t.w("listingId", "Required parameter requestParameters.listingId was null or undefined when calling licensesListPublicLicensesByListing.");
                                return a = {}, void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.pageSize && (a.pageSize = e.pageSize), r = {}, [4, this.request({
                                    path: "/v1/listing/{listingId}/licenses".replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/listing/{listingId}/licenses",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return Y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesListPublicLicensesByListing = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.licensesListPublicLicensesByListingRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.licensesListPublicLicensesByListingUnauthenticatedRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.listingId || void 0 === e.listingId) throw new t.w("listingId", "Required parameter requestParameters.listingId was null or undefined when calling licensesListPublicLicensesByListingUnauthenticated.");
                                return a = {}, void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.pageSize && (a.pageSize = e.pageSize), r = {}, [4, this.request({
                                    path: "/v1/listing/{listingId}/public-licenses".replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/listing/{listingId}/public-licenses",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return en(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesListPublicLicensesByListingUnauthenticated = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.licensesListPublicLicensesByListingUnauthenticatedRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.licensesListPublicLicensesUnauthenticatedRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return a = {}, void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.filter && (a.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/public-licenses",
                                    schemaPath: "/v1/public-licenses",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return en(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesListPublicLicensesUnauthenticated = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.licensesListPublicLicensesUnauthenticatedRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.licensesUpdateLicenseRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling licensesUpdateLicense.");
                                if (null === e.licenseId || void 0 === e.licenseId) throw new t.w("licenseId", "Required parameter requestParameters.licenseId was null or undefined when calling licensesUpdateLicense.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/license/{licenseId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("licenseId", "}"), encodeURIComponent(String(e.licenseId))),
                                    schemaPath: "/v1/account/{accountId}/license/{licenseId}",
                                    method: "PUT",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            description: e.description,
                                            royaltyRate: e.royaltyRate,
                                            dau7DayThreshold: e.dau7DayThreshold,
                                            creatorDau7DayThreshold: e.creatorDau7DayThreshold,
                                            maxAgeRating: e.maxAgeRating,
                                            countries: e.countries,
                                            visibility: e.visibility,
                                            enableMonetization: e.enableMonetization,
                                            licenseDuration: M(e.licenseDuration),
                                            licenseTerms: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    reselling: e.reselling,
                                                    minimumCreatorEarningsBucket: e.minimumCreatorEarningsBucket
                                                }
                                            }(e.licenseTerms),
                                            contentStandardsDocumentId: e.contentStandardsDocumentId,
                                            contentStandardScope: e.contentStandardScope,
                                            contentStandardAnswers: void 0 === e.contentStandardAnswers ? void 0 : null === e.contentStandardAnswers ? null : e.contentStandardAnswers.map(_)
                                        }
                                    }(e.licensesUpdateLicenseRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return j(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesUpdateLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.licensesUpdateLicenseRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        eI = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.licensingDocumentsUploadLicensingDocumentRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o, c;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling licensingDocumentsUploadLicensingDocument.");
                                return a = {}, r = {}, o = (0, t.I)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.file && o.append("file", e.file), [4, this.request({
                                    path: "/v1/account/{accountId}/licensing_documents".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/licensing_documents",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: o
                                }, n)];
                            case 1:
                                return c = i.sent(), [2, new t.H(c, function(e) {
                                    return null == e ? e : {
                                        id: (0, t.u)(e, "id") ? e.id : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.licensingDocumentsUploadLicensingDocument = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.licensingDocumentsUploadLicensingDocumentRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        ef = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.listingsCreateListingRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling listingsCreateListing.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/listings".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/listings",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            ipFamilyId: e.ipFamilyId,
                                            name: e.name,
                                            description: e.description,
                                            thumbnailAssetIds: e.thumbnailAssetIds
                                        }
                                    }(e.listingsCreateListingRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return X(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsCreateListing = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.listingsCreateListingRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.listingsGetListingRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling listingsGetListing.");
                                if (null === e.listingId || void 0 === e.listingId) throw new t.w("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsGetListing.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/listing/{listingId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/account/{accountId}/listing/{listingId}",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return X(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsGetListing = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.listingsGetListingRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.listingsGetListingShowcaseContentRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling listingsGetListingShowcaseContent.");
                                if (null === e.listingId || void 0 === e.listingId) throw new t.w("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsGetListingShowcaseContent.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/listing/{listingId}/showcase-content".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/account/{accountId}/listing/{listingId}/showcase-content",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return eu(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsGetListingShowcaseContent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.listingsGetListingShowcaseContentRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.listingsGetPublicListingRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.listingId || void 0 === e.listingId) throw new t.w("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsGetPublicListing.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/listing/{listingId}".replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/listing/{listingId}",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return X(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsGetPublicListing = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.listingsGetPublicListingRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.listingsGetPublicListingShowcaseContentRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.listingId || void 0 === e.listingId) throw new t.w("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsGetPublicListingShowcaseContent.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/public-listing/{listingId}/showcase-content".replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/public-listing/{listingId}/showcase-content",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return eu(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsGetPublicListingShowcaseContent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.listingsGetPublicListingShowcaseContentRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.listingsGetPublicListingUnauthenticatedRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.listingId || void 0 === e.listingId) throw new t.w("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsGetPublicListingUnauthenticated.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/public-listing/{listingId}".replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/public-listing/{listingId}",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return ea(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsGetPublicListingUnauthenticated = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.listingsGetPublicListingUnauthenticatedRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.listingsListListingsByAccountRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling listingsListListingsByAccount.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/listings".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/listings",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return Z(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsListListingsByAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.listingsListListingsByAccountRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.listingsListPublicListingsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/listings",
                                    schemaPath: "/v1/listings",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return Z(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsListPublicListings = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.listingsListPublicListingsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.listingsListPublicListingsUnauthenticatedRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/public-listings",
                                    schemaPath: "/v1/public-listings",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        listings: (0, t.u)(e, "listings") ? null === e.listings ? null : e.listings.map(ea) : void 0,
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.listingsListPublicListingsUnauthenticated = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.listingsListPublicListingsUnauthenticatedRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.listingsListShowcaseEligibleContentByListingRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling listingsListShowcaseEligibleContentByListing.");
                                if (null === e.listingId || void 0 === e.listingId) throw new t.w("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsListShowcaseEligibleContentByListing.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/listing/{listingId}/showcase-eligible-content".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/account/{accountId}/listing/{listingId}/showcase-eligible-content",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        content: (0, t.u)(e, "content") ? null === e.content ? null : e.content.map(es) : void 0,
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.listingsListShowcaseEligibleContentByListing = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.listingsListShowcaseEligibleContentByListingRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.listingsReplaceListingShowcaseContentRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling listingsReplaceListingShowcaseContent.");
                                if (null === e.listingId || void 0 === e.listingId) throw new t.w("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsReplaceListingShowcaseContent.");
                                if (null === e.ifMatch || void 0 === e.ifMatch) throw new t.w("ifMatch", "Required parameter requestParameters.ifMatch was null or undefined when calling listingsReplaceListingShowcaseContent.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", void 0 !== e.ifMatch && null !== e.ifMatch && (r["If-Match"] = String(e.ifMatch)), [4, this.request({
                                    path: "/v1/account/{accountId}/listing/{listingId}/showcase-content".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/account/{accountId}/listing/{listingId}/showcase-content",
                                    method: "PUT",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            content: e.content.map(ed)
                                        }
                                    }(e.listingsReplaceListingShowcaseContentRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return eu(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsReplaceListingShowcaseContent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.listingsReplaceListingShowcaseContentRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.listingsUpdateListingRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling listingsUpdateListing.");
                                if (null === e.listingId || void 0 === e.listingId) throw new t.w("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsUpdateListing.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/listing/{listingId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/account/{accountId}/listing/{listingId}",
                                    method: "PUT",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            description: e.description,
                                            thumbnailAssetIds: e.thumbnailAssetIds
                                        }
                                    }(e.listingsUpdateListingRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return X(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsUpdateListing = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.listingsUpdateListingRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        ew = (function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            a(n, e), n.prototype.officialAgreementsCancelOfficialAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling officialAgreementsCancelOfficialAgreement.");
                                if (null === e.officialAgreementId || void 0 === e.officialAgreementId) throw new t.w("officialAgreementId", "Required parameter requestParameters.officialAgreementId was null or undefined when calling officialAgreementsCancelOfficialAgreement.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/official_agreements/{officialAgreementId}/cancel".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("officialAgreementId", "}"), encodeURIComponent(String(e.officialAgreementId))),
                                    schemaPath: "/v1/account/{accountId}/official_agreements/{officialAgreementId}/cancel",
                                    method: "POST",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return $(e)
                                })]
                        }
                    })
                })
            }, n.prototype.officialAgreementsCancelOfficialAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.officialAgreementsCancelOfficialAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.officialAgreementsCreateOfficialAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling officialAgreementsCreateOfficialAgreement.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/official_agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/official_agreements",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            ipFamilyId: e.ipFamilyId,
                                            scope: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    scopeId: e.scopeId,
                                                    scopeType: e.scopeType
                                                }
                                            }(e.scope)
                                        }
                                    }(e.officialAgreementsCreateOfficialAgreementRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        id: e.id,
                                        accountId: e.accountId,
                                        targetAccountId: e.targetAccountId,
                                        ipFamilyId: e.ipFamilyId,
                                        scope: z(e.scope),
                                        status: (0, t.u)(e, "status") ? e.status : void 0,
                                        createdAt: (0, t.u)(e, "createdAt") ? new Date(e.createdAt) : void 0,
                                        updatedAt: (0, t.u)(e, "updatedAt") ? new Date(e.updatedAt) : void 0,
                                        result: (0, t.u)(e, "result") ? e.result : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.officialAgreementsCreateOfficialAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.officialAgreementsCreateOfficialAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.officialAgreementsListOfficialAgreementsByAccountRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling officialAgreementsListOfficialAgreementsByAccount.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.status && (a.status = e.status), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/official_agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/official_agreements",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return ee(e)
                                })]
                        }
                    })
                })
            }, n.prototype.officialAgreementsListOfficialAgreementsByAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.officialAgreementsListOfficialAgreementsByAccountRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.officialAgreementsListOfficialAgreementsByTargetAccountRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling officialAgreementsListOfficialAgreementsByTargetAccount.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.status && (a.status = e.status), r = {}, [4, this.request({
                                    path: "/v1/official_agreements/{accountId}/creator_agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/official_agreements/{accountId}/creator_agreements",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return ee(e)
                                })]
                        }
                    })
                })
            }, n.prototype.officialAgreementsListOfficialAgreementsByTargetAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.officialAgreementsListOfficialAgreementsByTargetAccountRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.officialAgreementsRespondToOfficialAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling officialAgreementsRespondToOfficialAgreement.");
                                if (null === e.officialAgreementId || void 0 === e.officialAgreementId) throw new t.w("officialAgreementId", "Required parameter requestParameters.officialAgreementId was null or undefined when calling officialAgreementsRespondToOfficialAgreement.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/official_agreements/{accountId}/creator_agreements/{officialAgreementId}/response".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("officialAgreementId", "}"), encodeURIComponent(String(e.officialAgreementId))),
                                    schemaPath: "/v1/official_agreements/{accountId}/creator_agreements/{officialAgreementId}/response",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            action: e.action,
                                            disputeReason: e.disputeReason
                                        }
                                    }(e.officialAgreementsRespondToOfficialAgreementRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    var n;
                                    return null == e ? e : {
                                        status: (0, t.u)(e, "status") ? e.status : void 0,
                                        reason: (0, t.u)(e, "reason") ? e.reason : void 0,
                                        rejectionMessage: (0, t.u)(e, "rejectionMessage") ? e.rejectionMessage : void 0,
                                        officialAgreement: (0, t.u)(e, "officialAgreement") ? null == (n = e.officialAgreement) ? n : {
                                            id: n.id,
                                            accountId: n.accountId,
                                            targetAccountId: n.targetAccountId,
                                            ipFamilyId: n.ipFamilyId,
                                            scope: z(n.scope),
                                            status: (0, t.u)(n, "status") ? n.status : void 0,
                                            createdAt: (0, t.u)(n, "createdAt") ? new Date(n.createdAt) : void 0,
                                            updatedAt: (0, t.u)(n, "updatedAt") ? new Date(n.updatedAt) : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.officialAgreementsRespondToOfficialAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.officialAgreementsRespondToOfficialAgreementRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }
        }(t._), function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.recommendationsGetLicenseRecommendationsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/recommendations/license-recommendations",
                                    schemaPath: "/v1/recommendations/license-recommendations",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            creatorId: e.creatorId,
                                            creatorType: e.creatorType,
                                            universeIds: e.universeIds,
                                            includeFeatured: e.includeFeatured
                                        }
                                    }(e.recommendationsGetLicenseRecommendationsRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        requestId: (0, t.u)(e, "requestId") ? e.requestId : void 0,
                                        recommendations: (0, t.u)(e, "recommendations") ? null === e.recommendations ? null : e.recommendations.map(V) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.recommendationsGetLicenseRecommendations = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.recommendationsGetLicenseRecommendationsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._)),
        ey = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.requestedScanCandidatesCreateRequestedScanCandidateRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling requestedScanCandidatesCreateRequestedScanCandidate.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/requested_scan_candidates".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/requested_scan_candidates",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            accountId: e.accountId,
                                            ipFamilyId: e.ipFamilyId,
                                            candidateId: e.candidateId,
                                            candidateType: e.candidateType,
                                            licenseId: e.licenseId
                                        }
                                    }(e.requestedScanCandidatesCreateRequestedScanCandidateRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return er(e)
                                })]
                        }
                    })
                })
            }, n.prototype.requestedScanCandidatesCreateRequestedScanCandidate = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.requestedScanCandidatesCreateRequestedScanCandidateRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.requestedScanCandidatesListRequestedScanCandidatesByAccountRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling requestedScanCandidatesListRequestedScanCandidatesByAccount.");
                                return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.filter && (a.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/requested_scan_candidates".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/requested_scan_candidates",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        candidates: (0, t.u)(e, "candidates") ? null === e.candidates ? null : e.candidates.map(er) : void 0,
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0,
                                        numScanRequestsToday: (0, t.u)(e, "numScanRequestsToday") ? e.numScanRequestsToday : void 0,
                                        numScanRequestsLimit: (0, t.u)(e, "numScanRequestsLimit") ? e.numScanRequestsLimit : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.requestedScanCandidatesListRequestedScanCandidatesByAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.requestedScanCandidatesListRequestedScanCandidatesByAccountRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.requestedScanCandidatesValidateIpFamilyRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling requestedScanCandidatesValidateIpFamily.");
                                if (null === e.ipFamilyId || void 0 === e.ipFamilyId) throw new t.w("ipFamilyId", "Required parameter requestParameters.ipFamilyId was null or undefined when calling requestedScanCandidatesValidateIpFamily.");
                                return a = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/requested_scan_candidates/{ipFamilyId}/validate".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("ipFamilyId", "}"), encodeURIComponent(String(e.ipFamilyId))),
                                    schemaPath: "/v1/account/{accountId}/requested_scan_candidates/{ipFamilyId}/validate",
                                    method: "GET",
                                    headers: r,
                                    query: a
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        validity: (0, t.u)(e, "validity") ? e.validity : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.requestedScanCandidatesValidateIpFamily = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.requestedScanCandidatesValidateIpFamilyRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.requestedScanCandidatesValidateRequestedScanRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var a, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling requestedScanCandidatesValidateRequestedScan.");
                                return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/requested_scan_candidates/validate".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/requested_scan_candidates/validate",
                                    method: "POST",
                                    headers: r,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            ipFamilyId: e.ipFamilyId,
                                            candidateId: e.candidateId,
                                            candidateType: e.candidateType
                                        }
                                    }(e.requestedScanCandidatesValidateRequestedScanRequest)
                                }, n)];
                            case 1:
                                return o = i.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        validity: (0, t.u)(e, "validity") ? e.validity : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.requestedScanCandidatesValidateRequestedScan = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.requestedScanCandidatesValidateRequestedScanRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._);
    (function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        a(n, e), n.prototype.settingsGetFlagsRaw = function(e) {
            return r(this, void 0, void 0, function() {
                var n, a, r;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, a = {}, [4, this.request({
                                path: "/v1/flags",
                                schemaPath: "/v1/flags",
                                method: "GET",
                                headers: a,
                                query: n
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new t.H(r)]
                    }
                })
            })
        }, n.prototype.settingsGetFlags = function(e) {
            return r(this, void 0, void 0, function() {
                return i(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.settingsGetFlagsRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    })(t._),
    function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        a(n, e), n.prototype.toolboxInitiateAgreementTerminationRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var a, r, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling toolboxInitiateAgreementTermination.");
                            return a = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/agreement/{agreementId}/initiate_termination".replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                schemaPath: "/v1/agreement/{agreementId}/initiate_termination",
                                method: "POST",
                                headers: r,
                                query: a,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        reason: e.reason
                                    }
                                }(e.toolboxInitiateAgreementTerminationRequest)
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.V(o)]
                    }
                })
            })
        }, n.prototype.toolboxInitiateAgreementTermination = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.toolboxInitiateAgreementTerminationRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, n.prototype.toolboxListAgreementsByAccountToolboxRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var a, r, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.accountId || void 0 === e.accountId) throw new t.w("accountId", "Required parameter requestParameters.accountId was null or undefined when calling toolboxListAgreementsByAccountToolbox.");
                            return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.filter && (a.filter = e.filter), r = {}, [4, this.request({
                                path: "/v1/toolbox/account/{accountId}/agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                schemaPath: "/v1/toolbox/account/{accountId}/agreements",
                                method: "GET",
                                headers: r,
                                query: a
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return Q(e)
                            })]
                    }
                })
            })
        }, n.prototype.toolboxListAgreementsByAccountToolbox = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.toolboxListAgreementsByAccountToolboxRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.toolboxListAgreementsByContentRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var a, r, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.contentType || void 0 === e.contentType) throw new t.w("contentType", "Required parameter requestParameters.contentType was null or undefined when calling toolboxListAgreementsByContent.");
                            if (null === e.contentId || void 0 === e.contentId) throw new t.w("contentId", "Required parameter requestParameters.contentId was null or undefined when calling toolboxListAgreementsByContent.");
                            return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), void 0 !== e.filter && (a.filter = e.filter), r = {}, [4, this.request({
                                path: "/v1/toolbox/content/{contentType}/{contentId}/agreements".replace("{".concat("contentType", "}"), encodeURIComponent(String(e.contentType))).replace("{".concat("contentId", "}"), encodeURIComponent(String(e.contentId))),
                                schemaPath: "/v1/toolbox/content/{contentType}/{contentId}/agreements",
                                method: "GET",
                                headers: r,
                                query: a
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return Q(e)
                            })]
                    }
                })
            })
        }, n.prototype.toolboxListAgreementsByContent = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.toolboxListAgreementsByContentRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.toolboxListRevenueTargetsByAgreementToolboxRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var a, r, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.agreementId || void 0 === e.agreementId) throw new t.w("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling toolboxListRevenueTargetsByAgreementToolbox.");
                            return a = {}, void 0 !== e.pageSize && (a.pageSize = e.pageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), r = {}, [4, this.request({
                                path: "/v1/toolbox/agreement/{agreementId}/revenue-targets".replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                schemaPath: "/v1/toolbox/agreement/{agreementId}/revenue-targets",
                                method: "GET",
                                headers: r,
                                query: a
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return ec(e)
                            })]
                    }
                })
            })
        }, n.prototype.toolboxListRevenueTargetsByAgreementToolbox = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.toolboxListRevenueTargetsByAgreementToolboxRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(t._), e.s(["b", 0, {
        NoOfferSent: "NoOfferSent",
        HasAgreement: "HasAgreement"
    }, "g", 0, {
        DiscoveredAt: "DiscoveredAt",
        Dau7DayBucket: "Dau7DayBucket",
        CreatorLifetimeVisitBucket: "CreatorLifetimeVisitBucket",
        ContentMaturity: "ContentMaturity",
        Price: "Price",
        FavoriteCount: "FavoriteCount",
        SaleCount: "SaleCount"
    }, "G", 0, {
        Asc: "Asc",
        Desc: "Desc"
    }, "V", 0, {
        Offer: "Offer",
        Conditional: "Conditional"
    }, "N", 0, {
        Pending: "Pending",
        Approved: "Approved",
        Rejected: "Rejected"
    }, "U", 0, {
        Universe: "Universe",
        Collectible: "Collectible"
    }, "i", 0, el, "Y", 0, {
        Pending: "Pending",
        Active: "Active",
        Disputed: "Disputed",
        Archived: "Archived",
        Unsuccessful: "Unsuccessful",
        Inquired: "Inquired",
        Terminated: "Terminated",
        None: "None",
        Invalid: "Invalid",
        Accepted: "Accepted",
        Expired: "Expired",
        Cancelled: "Cancelled",
        ConditionalOffer: "ConditionalOffer",
        Draft: "Draft"
    }, "D", 0, {
        ApproveApplication: "ApproveApplication",
        RejectApplication: "RejectApplication",
        AcceptOffer: "AcceptOffer",
        DisputeOffer: "DisputeOffer",
        AcceptDispute: "AcceptDispute",
        RejectDispute: "RejectDispute",
        ArchiveUnsuccessfulOffer: "ArchiveUnsuccessfulOffer",
        Terminate: "Terminate",
        InitiateChangeRequest: "InitiateChangeRequest",
        CompleteChangeRequest: "CompleteChangeRequest",
        Apply: "Apply",
        Offer: "Offer",
        EnableMonetization: "EnableMonetization",
        InitiateTermination: "InitiateTermination",
        AcknowledgeCompletedChangeRequest: "AcknowledgeCompletedChangeRequest",
        ExpireChangeRequest: "ExpireChangeRequest",
        ArchiveApplication: "ArchiveApplication",
        ActivateAcceptedAgreement: "ActivateAcceptedAgreement",
        CreatorAttestIpRemoval: "CreatorAttestIpRemoval",
        Expire: "Expire",
        CancelAcceptedAgreement: "CancelAcceptedAgreement",
        CancelApplication: "CancelApplication",
        ScannerResultFound: "ScannerResultFound",
        ActivateInquiredAgreement: "ActivateInquiredAgreement",
        ExpireAttestation: "ExpireAttestation",
        ScannerResultNotFound: "ScannerResultNotFound",
        EarlyActivateAcceptedAgreement: "EarlyActivateAcceptedAgreement",
        IphInitiateConditionalChangeRequest: "IphInitiateConditionalChangeRequest",
        CreatorCompleteConditionalChangeRequest: "CreatorCompleteConditionalChangeRequest",
        IphApproveConditionalChangeRequest: "IphApproveConditionalChangeRequest",
        IphRejectConditionalChangeRequest: "IphRejectConditionalChangeRequest",
        ExpireConditionalChangeRequest: "ExpireConditionalChangeRequest",
        PitchImagePendingModeration: "PitchImagePendingModeration",
        PitchImageApproved: "PitchImageApproved",
        PitchImageRejected: "PitchImageRejected",
        PitchImageRevised: "PitchImageRevised",
        RegisterRevenueTarget: "RegisterRevenueTarget"
    }, "$", 0, eg, "W", 0, function(e) {
        var n;
        return null == (n = e) ? n : {
            failureReason: (0, t.u)(n, "failureReason") ? n.failureReason : void 0,
            errorMessage: (0, t.u)(n, "errorMessage") ? n.errorMessage : void 0,
            errorCategory: (0, t.u)(n, "errorCategory") ? n.errorCategory : void 0,
            rejectedContent: (0, t.u)(n, "rejectedContent") ? null === n.rejectedContent ? null : n.rejectedContent.map(D) : void 0
        }
    }, "E", 0, {
        Invalid: "Invalid",
        Body: "Body",
        Clothing: "Clothing",
        Accessories: "Accessories",
        Animation: "Animation",
        Makeup: "Makeup",
        Backgrounds: "Backgrounds",
        FullBodies: "FullBodies",
        Hair: "Hair",
        Heads: "Heads",
        Shirts: "Shirts",
        TShirts: "TShirts",
        Sweaters: "Sweaters",
        Jackets: "Jackets",
        Pants: "Pants",
        DressesAndSkirts: "DressesAndSkirts",
        Bodysuits: "Bodysuits",
        Shorts: "Shorts",
        Shoes: "Shoes",
        ClassicShirts: "ClassicShirts",
        ClassicTShirts: "ClassicTShirts",
        ClassicPants: "ClassicPants",
        HeadAccessories: "HeadAccessories",
        FaceAccessories: "FaceAccessories",
        NeckAccessories: "NeckAccessories",
        ShoulderAccessories: "ShoulderAccessories",
        FrontAccessories: "FrontAccessories",
        BackAccessories: "BackAccessories",
        WaistAccessories: "WaistAccessories",
        Gear: "Gear",
        AnimationBundles: "AnimationBundles",
        Emotes: "Emotes",
        Torso: "Torso",
        Arms: "Arms",
        Legs: "Legs",
        RightArm: "RightArm",
        LeftArm: "LeftArm",
        LeftLeg: "LeftLeg",
        RightLeg: "RightLeg",
        Head: "Head",
        DynamicHead: "DynamicHead",
        HairAccessory: "HairAccessory",
        TShirtAccessory: "TShirtAccessory",
        ShirtAccessory: "ShirtAccessory",
        PantsAccessory: "PantsAccessory",
        JacketAccessory: "JacketAccessory",
        SweaterAccessory: "SweaterAccessory",
        ShortsAccessory: "ShortsAccessory",
        LeftShoeAccessory: "LeftShoeAccessory",
        RightShoeAccessory: "RightShoeAccessory",
        DressSkirtAccessory: "DressSkirtAccessory",
        TShirt: "TShirt",
        Shirt: "Shirt",
        ClassicPantsAsset: "ClassicPantsAsset",
        Hat: "Hat",
        Face: "Face",
        FaceAccessory: "FaceAccessory",
        EyebrowAccessory: "EyebrowAccessory",
        EyelashAccessory: "EyelashAccessory",
        NeckAccessory: "NeckAccessory",
        ShoulderAccessory: "ShoulderAccessory",
        FrontAccessory: "FrontAccessory",
        BackAccessory: "BackAccessory",
        WaistAccessory: "WaistAccessory",
        GenericAnimation: "GenericAnimation",
        ClimbAnimation: "ClimbAnimation",
        DeathAnimation: "DeathAnimation",
        FallAnimation: "FallAnimation",
        IdleAnimation: "IdleAnimation",
        JumpAnimation: "JumpAnimation",
        RunAnimation: "RunAnimation",
        SwimAnimation: "SwimAnimation",
        WalkAnimation: "WalkAnimation",
        PoseAnimation: "PoseAnimation",
        EmoteAnimation: "EmoteAnimation",
        MoodAnimation: "MoodAnimation",
        FaceMakeup: "FaceMakeup",
        LipMakeup: "LipMakeup",
        EyeMakeup: "EyeMakeup",
        AvatarBackground: "AvatarBackground",
        BodyPartsBundle: "BodyPartsBundle",
        DynamicHeadBundle: "DynamicHeadBundle",
        ShoesBundle: "ShoesBundle",
        AvatarAnimationsBundle: "AvatarAnimationsBundle"
    }, "t", 0, {
        Licensed: "Licensed",
        Official: "Official"
    }, "P", 0, {
        Universe: "Universe",
        Collectible: "Collectible"
    }, "H", 0, {
        None: "None",
        NoLongerPlanningToUseIp: "NoLongerPlanningToUseIp",
        NotReadyForProposedDates: "NotReadyForProposedDates"
    }, "L", 0, {
        None: "None",
        CreatorActionRequired: "CreatorActionRequired",
        IphActionRequired: "IphActionRequired"
    }, "v", 0, {
        Yes: "Yes",
        No: "No",
        NotApplicable: "NotApplicable"
    }, "w", 0, function(e) {
        return e
    }, "l", 0, {
        Universe: "Universe",
        User: "User",
        Group: "Group"
    }, "r", 0, em, "e", 0, {
        Invalid: "Invalid",
        Small: "Small",
        Medium: "Medium",
        Large: "Large",
        VeryLarge: "VeryLarge",
        NotApplicable: "NotApplicable",
        BelowMinimum: "BelowMinimum"
    }, "X", 0, {
        User: "User",
        Group: "Group"
    }, "h", 0, {
        None: "None",
        Small: "Small",
        Large: "Large"
    }, "A", 0, {
        IPNotUsed: "IPNotUsed",
        IPRemoved: "IPRemoved",
        FairUse: "FairUse"
    }, "Z", 0, ep, "k", 0, {
        None: "None",
        Pending: "Pending",
        Attested: "Attested",
        NotAttested: "NotAttested"
    }, "j", 0, eh, "O", 0, {
        Perpetual: "Perpetual",
        TimeLimited: "TimeLimited"
    }, "m", 0, {
        Approved: "Approved",
        Pending: "Pending",
        Rejected: "Rejected",
        Archived: "Archived"
    }, "c", 0, {
        FullExperience: "FullExperience",
        CollaborationInExperienceSale: "CollaborationInExperienceSale",
        MarketplaceSale: "MarketplaceSale",
        InternalLicense: "InternalLicense"
    }, "o", 0, {
        Private: "Private",
        Public: "Public"
    }, "s", 0, ev, "n", 0, eI, "f", 0, {
        Small: "Small",
        Medium: "Medium",
        Large: "Large"
    }, "J", 0, {
        Pending: "Pending",
        Approved: "Approved",
        Rejected: "Rejected",
        Archived: "Archived",
        Invalid: "Invalid",
        Published: "Published"
    }, "Q", 0, {
        Private: "Private",
        Public: "Public",
        Unlisted: "Unlisted"
    }, "u", 0, ef, "F", 0, {
        Accepted: "Accepted",
        Rejected: "Rejected"
    }, "_", 0, ew, "K", 0, {
        None: "None",
        NegotiationIntent: "NegotiationIntent",
        FinancialRequest: "FinancialRequest",
        InappropriateLanguage: "InappropriateLanguage",
        HarassingLegalThreat: "HarassingLegalThreat",
        HarmfulContent: "HarmfulContent",
        ExternalContactRequest: "ExternalContactRequest",
        LowQualityInput: "LowQualityInput",
        GeneralViolation: "GeneralViolation",
        NotLicenseCompliance: "NotLicenseCompliance",
        RequiresCoreGameplayChange: "RequiresCoreGameplayChange",
        BugOrTechnicalIssue: "BugOrTechnicalIssue"
    }, "p", 0, ey, "I", 0, {
        Invalid: "Invalid",
        Allowed: "Allowed",
        Disallowed: "Disallowed",
        NotApplicable: "NotApplicable"
    }, "q", 0, {
        Universe: "Universe",
        GamePass: "GamePass",
        DeveloperProduct: "DeveloperProduct",
        Collectible: "Collectible",
        DeveloperSubscription: "DeveloperSubscription"
    }, "x", 0, {
        None: "None",
        Minimal: "Minimal",
        Mild: "Mild",
        Moderate: "Moderate",
        Restricted: "Restricted"
    }])
}]);

//# debugId=98a09db9-d3a2-6cc9-99eb-3945816dd677
//# sourceMappingURL=3i6am2295klif.js.map