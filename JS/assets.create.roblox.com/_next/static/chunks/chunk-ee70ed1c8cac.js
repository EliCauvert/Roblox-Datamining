;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "a21f94f8-c496-1e3e-75d0-34c53c78143c")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 518962, e => {
    "use strict";
    var t = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function i() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
    }

    function r(e, t, n, i) {
        return new(n || (n = Promise))(function(r, a) {
            function s(e) {
                try {
                    c(i.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function o(e) {
                try {
                    c(i.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function c(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(s, o)
            }
            c((i = i.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var n, i, r, a = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = o(0), s.throw = o(1), s.return = o(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function o(o) {
            return function(c) {
                var u = [o, c];
                if (n) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, u[0] && (a = 0)), a;) try {
                    if (n = 1, i && (r = 2 & u[0] ? i.return : u[0] ? i.throw || ((r = i.return) && r.call(i), 0) : i.next) && !(r = r.call(i, u[1])).done) return r;
                    switch (i = 0, r && (u = [2 & u[0], r.value]), u[0]) {
                        case 0:
                        case 1:
                            r = u;
                            break;
                        case 4:
                            return a.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            a.label++, i = u[1], u = [0];
                            continue;
                        case 7:
                            u = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = a.trys).length > 0 && r[r.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === u[0] && (!r || u[1] > r[0] && u[1] < r[3])) {
                                a.label = u[1];
                                break
                            }
                            if (6 === u[0] && a.label < r[1]) {
                                a.label = r[1], r = u;
                                break
                            }
                            if (r && a.label < r[2]) {
                                a.label = r[2], a.ops.push(u);
                                break
                            }
                            r[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    u = t.call(e, a)
                } catch (e) {
                    u = [6, e], i = 0
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

    function s(e) {
        if (void 0 !== e) return null === e ? null : {
            revenueTargetType: e.revenueTargetType,
            revenueTargetId: e.revenueTargetId
        }
    }

    function o(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            agreementId: (0, t.exists)(n, "agreementId") ? n.agreementId : void 0,
            transition: (0, t.exists)(n, "transition") ? n.transition : void 0,
            startStatus: (0, t.exists)(n, "startStatus") ? n.startStatus : void 0,
            endStatus: (0, t.exists)(n, "endStatus") ? n.endStatus : void 0,
            enableMonetization: (0, t.exists)(n, "enableMonetization") ? n.enableMonetization : void 0,
            notes: (0, t.exists)(n, "notes") ? n.notes : void 0,
            createdAt: (0, t.exists)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.exists)(n, "updatedAt") ? new Date(n.updatedAt) : void 0
        }
    }

    function c(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            accountId: (0, t.exists)(n, "accountId") ? n.accountId : void 0,
            ipFamilyId: (0, t.exists)(n, "ipFamilyId") ? n.ipFamilyId : void 0,
            agreementId: (0, t.exists)(n, "agreementId") ? n.agreementId : void 0,
            candidateId: (0, t.exists)(n, "candidateId") ? n.candidateId : void 0,
            candidateType: (0, t.exists)(n, "candidateType") ? n.candidateType : void 0,
            status: (0, t.exists)(n, "status") ? n.status : void 0,
            discoveredAt: (0, t.exists)(n, "discoveredAt") ? new Date(n.discoveredAt) : void 0,
            updatedAt: (0, t.exists)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
            dau7DayBucket: (0, t.exists)(n, "dau7DayBucket") ? n.dau7DayBucket : void 0,
            universeContentMaturity: (0, t.exists)(n, "universeContentMaturity") ? n.universeContentMaturity : void 0,
            creatorLifetimeVisitBucket: (0, t.exists)(n, "creatorLifetimeVisitBucket") ? n.creatorLifetimeVisitBucket : void 0
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            contentId: e.contentId,
            contentType: e.contentType
        }
    }

    function d(e) {
        var t;
        return null == (t = e) ? t : {
            contentId: t.contentId,
            contentType: t.contentType
        }
    }

    function l(e, n) {
        return null == e ? e : {
            changeRequestSubstatusType: (0, t.exists)(e, "changeRequestSubstatusType") ? e.changeRequestSubstatusType : void 0,
            expiresAtTime: (0, t.exists)(e, "expiresAtTime") ? null === e.expiresAtTime ? null : new Date(e.expiresAtTime) : void 0
        }
    }

    function g(e, n) {
        return null == e ? e : {
            changeRequestSubstatusType: (0, t.exists)(e, "changeRequestSubstatusType") ? e.changeRequestSubstatusType : void 0,
            expiresAtTime: (0, t.exists)(e, "expiresAtTime") ? null === e.expiresAtTime ? null : new Date(e.expiresAtTime) : void 0
        }
    }

    function m(e, n) {
        return null == e ? e : {
            ipRemovalAttestationStatus: (0, t.exists)(e, "ipRemovalAttestationStatus") ? e.ipRemovalAttestationStatus : void 0,
            expiresAtTime: (0, t.exists)(e, "expiresAtTime") ? null === e.expiresAtTime ? null : new Date(e.expiresAtTime) : void 0
        }
    }

    function p(e) {
        return e
    }

    function h(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            accountId: (0, t.exists)(n, "accountId") ? n.accountId : void 0,
            licenseId: (0, t.exists)(n, "licenseId") ? n.licenseId : void 0,
            targetAccountId: (0, t.exists)(n, "targetAccountId") ? n.targetAccountId : void 0,
            status: (0, t.exists)(n, "status") ? n.status : void 0,
            statusExpireAt: (0, t.exists)(n, "statusExpireAt") ? null === n.statusExpireAt ? null : new Date(n.statusExpireAt) : void 0,
            terminatesAt: (0, t.exists)(n, "terminatesAt") ? null === n.terminatesAt ? null : new Date(n.terminatesAt) : void 0,
            disputeReasons: (0, t.exists)(n, "disputeReasons") ? null === n.disputeReasons ? null : n.disputeReasons.map(p) : void 0,
            createdAt: (0, t.exists)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.exists)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
            enableMonetization: (0, t.exists)(n, "enableMonetization") ? n.enableMonetization : void 0,
            creatorLifetimeVisitBucket: (0, t.exists)(n, "creatorLifetimeVisitBucket") ? n.creatorLifetimeVisitBucket : void 0,
            activeChangeRequest: (0, t.exists)(n, "activeChangeRequest") ? l(n.activeChangeRequest) : void 0,
            conditionalChangeRequest: (0, t.exists)(n, "conditionalChangeRequest") ? g(n.conditionalChangeRequest) : void 0,
            startTime: (0, t.exists)(n, "startTime") ? null === n.startTime ? null : new Date(n.startTime) : void 0,
            endTime: (0, t.exists)(n, "endTime") ? null === n.endTime ? null : new Date(n.endTime) : void 0,
            ipRemovalAttestation: (0, t.exists)(n, "ipRemovalAttestation") ? m(n.ipRemovalAttestation) : void 0
        }
    }

    function v(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            agreementId: (0, t.exists)(n, "agreementId") ? n.agreementId : void 0,
            contentType: (0, t.exists)(n, "contentType") ? n.contentType : void 0,
            contentId: (0, t.exists)(n, "contentId") ? n.contentId : void 0,
            createdAt: (0, t.exists)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.exists)(n, "updatedAt") ? new Date(n.updatedAt) : void 0
        }
    }

    function I(e, n) {
        return null == e ? e : {
            assetIds: (0, t.exists)(e, "assetIds") ? e.assetIds : void 0,
            accessContext: (0, t.exists)(e, "accessContext") ? e.accessContext : void 0
        }
    }

    function f(e) {
        if (void 0 !== e) return null === e ? null : {
            revenueTargetType: e.revenueTargetType,
            revenueTargetId: e.revenueTargetId
        }
    }

    function w(e) {
        var n;
        return null == (n = e) ? n : {
            questionId: (0, t.exists)(n, "questionId") ? n.questionId : void 0,
            answer: (0, t.exists)(n, "answer") ? n.answer : void 0
        }
    }

    function R(e, n) {
        var i, r;
        return null == e ? e : {
            minMax: (0, t.exists)(e, "minMax") ? null == (i = e.minMax) ? i : {
                minDays: (0, t.exists)(i, "minDays") ? i.minDays : void 0,
                maxDays: (0, t.exists)(i, "maxDays") ? i.maxDays : void 0
            } : void 0,
            dateRange: (0, t.exists)(e, "dateRange") ? null == (r = e.dateRange) ? r : {
                startTime: (0, t.exists)(r, "startTime") ? null === r.startTime ? null : new Date(r.startTime) : void 0,
                endTime: (0, t.exists)(r, "endTime") ? null === r.endTime ? null : new Date(r.endTime) : void 0
            } : void 0
        }
    }

    function y(e, n) {
        return null == e ? e : {
            durationType: (0, t.exists)(e, "durationType") ? e.durationType : void 0,
            timeBounds: (0, t.exists)(e, "timeBounds") ? R(e.timeBounds) : void 0
        }
    }

    function A(e, n) {
        return null == e ? e : {
            reselling: (0, t.exists)(e, "reselling") ? e.reselling : void 0,
            minimumCreatorEarningsBucket: (0, t.exists)(e, "minimumCreatorEarningsBucket") ? e.minimumCreatorEarningsBucket : void 0
        }
    }

    function q(e, n) {
        return null == e ? e : {
            name: (0, t.exists)(e, "name") ? e.name : void 0,
            description: (0, t.exists)(e, "description") ? e.description : void 0,
            contentStandardsDocumentId: (0, t.exists)(e, "contentStandardsDocumentId") ? e.contentStandardsDocumentId : void 0,
            contentStandardScope: (0, t.exists)(e, "contentStandardScope") ? e.contentStandardScope : void 0,
            submittedAt: (0, t.exists)(e, "submittedAt") ? new Date(e.submittedAt) : void 0
        }
    }

    function T(e, n) {
        return null == e ? e : {
            id: (0, t.exists)(e, "id") ? e.id : void 0,
            accountId: (0, t.exists)(e, "accountId") ? e.accountId : void 0,
            listingId: (0, t.exists)(e, "listingId") ? e.listingId : void 0,
            listingName: (0, t.exists)(e, "listingName") ? e.listingName : void 0,
            name: (0, t.exists)(e, "name") ? e.name : void 0,
            description: (0, t.exists)(e, "description") ? e.description : void 0,
            royaltyRate: (0, t.exists)(e, "royaltyRate") ? e.royaltyRate : void 0,
            dau7DayThreshold: (0, t.exists)(e, "dau7DayThreshold") ? e.dau7DayThreshold : void 0,
            creatorDau7DayThreshold: (0, t.exists)(e, "creatorDau7DayThreshold") ? e.creatorDau7DayThreshold : void 0,
            maxAgeRating: (0, t.exists)(e, "maxAgeRating") ? e.maxAgeRating : void 0,
            countries: (0, t.exists)(e, "countries") ? e.countries : void 0,
            visibility: (0, t.exists)(e, "visibility") ? e.visibility : void 0,
            contentStandardsDocumentId: (0, t.exists)(e, "contentStandardsDocumentId") ? e.contentStandardsDocumentId : void 0,
            contentStandardsScope: (0, t.exists)(e, "contentStandardsScope") ? e.contentStandardsScope : void 0,
            contentStandardAnswers: (0, t.exists)(e, "contentStandardAnswers") ? null === e.contentStandardAnswers ? null : e.contentStandardAnswers.map(w) : void 0,
            createdAt: (0, t.exists)(e, "createdAt") ? new Date(e.createdAt) : void 0,
            updatedAt: (0, t.exists)(e, "updatedAt") ? new Date(e.updatedAt) : void 0,
            archived: (0, t.exists)(e, "archived") ? e.archived : void 0,
            enableMonetization: (0, t.exists)(e, "enableMonetization") ? e.enableMonetization : void 0,
            moderationStatus: (0, t.exists)(e, "moderationStatus") ? e.moderationStatus : void 0,
            licenseDuration: (0, t.exists)(e, "licenseDuration") ? y(e.licenseDuration) : void 0,
            licenseType: (0, t.exists)(e, "licenseType") ? e.licenseType : void 0,
            licenseTerms: (0, t.exists)(e, "licenseTerms") ? A(e.licenseTerms) : void 0,
            averageIphResponseTimeSeconds: (0, t.exists)(e, "averageIphResponseTimeSeconds") ? e.averageIphResponseTimeSeconds : void 0,
            pendingEdits: (0, t.exists)(e, "pendingEdits") ? q(e.pendingEdits) : void 0,
            hasPendingEdits: (0, t.exists)(e, "hasPendingEdits") ? e.hasPendingEdits : void 0
        }
    }

    function C(e, n) {
        return null == e ? e : {
            avgResponseTimeSeconds90D: (0, t.exists)(e, "avgResponseTimeSeconds90D") ? e.avgResponseTimeSeconds90D : void 0,
            medianResponseTimeSeconds90D: (0, t.exists)(e, "medianResponseTimeSeconds90D") ? e.medianResponseTimeSeconds90D : void 0,
            responseCount90D: (0, t.exists)(e, "responseCount90D") ? e.responseCount90D : void 0
        }
    }

    function x(e, n) {
        return null == e ? e : {
            id: (0, t.exists)(e, "id") ? e.id : void 0,
            accountId: (0, t.exists)(e, "accountId") ? e.accountId : void 0,
            ipFamilyId: (0, t.exists)(e, "ipFamilyId") ? e.ipFamilyId : void 0,
            name: (0, t.exists)(e, "name") ? e.name : void 0,
            description: (0, t.exists)(e, "description") ? e.description : void 0,
            status: (0, t.exists)(e, "status") ? e.status : void 0,
            statusReason: (0, t.exists)(e, "statusReason") ? e.statusReason : void 0,
            visibility: (0, t.exists)(e, "visibility") ? e.visibility : void 0,
            thumbnailAssetIds: (0, t.exists)(e, "thumbnailAssetIds") ? e.thumbnailAssetIds : void 0,
            createdAt: (0, t.exists)(e, "createdAt") ? new Date(e.createdAt) : void 0,
            updatedAt: (0, t.exists)(e, "updatedAt") ? new Date(e.updatedAt) : void 0,
            archived: (0, t.exists)(e, "archived") ? e.archived : void 0,
            responseTimeMetrics: (0, t.exists)(e, "responseTimeMetrics") ? C(e.responseTimeMetrics) : void 0
        }
    }

    function S(e, n) {
        return null == e ? e : {
            revenueTargetsCount: (0, t.exists)(e, "revenueTargetsCount") ? e.revenueTargetsCount : void 0,
            maxRevenueTargets: (0, t.exists)(e, "maxRevenueTargets") ? e.maxRevenueTargets : void 0
        }
    }

    function b(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            accountId: (0, t.exists)(n, "accountId") ? n.accountId : void 0,
            licenseId: (0, t.exists)(n, "licenseId") ? n.licenseId : void 0,
            targetAccountId: (0, t.exists)(n, "targetAccountId") ? n.targetAccountId : void 0,
            status: (0, t.exists)(n, "status") ? n.status : void 0,
            statusExpireAt: (0, t.exists)(n, "statusExpireAt") ? null === n.statusExpireAt ? null : new Date(n.statusExpireAt) : void 0,
            terminatesAt: (0, t.exists)(n, "terminatesAt") ? null === n.terminatesAt ? null : new Date(n.terminatesAt) : void 0,
            disputeReasons: (0, t.exists)(n, "disputeReasons") ? null === n.disputeReasons ? null : n.disputeReasons.map(p) : void 0,
            createdAt: (0, t.exists)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.exists)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
            enableMonetization: (0, t.exists)(n, "enableMonetization") ? n.enableMonetization : void 0,
            creatorLifetimeVisitBucket: (0, t.exists)(n, "creatorLifetimeVisitBucket") ? n.creatorLifetimeVisitBucket : void 0,
            activeChangeRequest: (0, t.exists)(n, "activeChangeRequest") ? l(n.activeChangeRequest) : void 0,
            conditionalChangeRequest: (0, t.exists)(n, "conditionalChangeRequest") ? g(n.conditionalChangeRequest) : void 0,
            startTime: (0, t.exists)(n, "startTime") ? null === n.startTime ? null : new Date(n.startTime) : void 0,
            endTime: (0, t.exists)(n, "endTime") ? null === n.endTime ? null : new Date(n.endTime) : void 0,
            ipRemovalAttestation: (0, t.exists)(n, "ipRemovalAttestation") ? m(n.ipRemovalAttestation) : void 0,
            license: (0, t.exists)(n, "license") ? T(n.license) : void 0,
            listing: (0, t.exists)(n, "listing") ? x(n.listing) : void 0,
            agreementTargets: (0, t.exists)(n, "agreementTargets") ? null === n.agreementTargets ? null : n.agreementTargets.map(v) : void 0,
            revenueTargetCounts: (0, t.exists)(n, "revenueTargetCounts") ? S(n.revenueTargetCounts) : void 0
        }
    }

    function P(e) {
        var n;
        return null == (n = e) ? n : {
            revenueTargetType: (0, t.exists)(n, "revenueTargetType") ? n.revenueTargetType : void 0,
            revenueTargetId: (0, t.exists)(n, "revenueTargetId") ? n.revenueTargetId : void 0,
            agreements: (0, t.exists)(n, "agreements") ? null === n.agreements ? null : n.agreements.map(b) : void 0
        }
    }

    function L(e) {
        var n;
        return null == (n = e) ? n : {
            contentType: (0, t.exists)(n, "contentType") ? n.contentType : void 0,
            contentId: (0, t.exists)(n, "contentId") ? n.contentId : void 0,
            reason: (0, t.exists)(n, "reason") ? n.reason : void 0
        }
    }

    function E(e) {
        if (void 0 !== e) return null === e ? null : {
            revenueTargetType: e.revenueTargetType,
            revenueTargetId: e.revenueTargetId
        }
    }

    function B(e) {
        var n, i, r;
        return null == (n = e) ? n : {
            value: (0, t.exists)(n, "value") ? null == (i = n.value) ? i : {
                agreementId: (0, t.exists)(i, "agreementId") ? i.agreementId : void 0,
                status: (0, t.exists)(i, "status") ? i.status : void 0
            } : void 0,
            error: (0, t.exists)(n, "error") ? null == (r = n.error) ? r : {
                agreementId: (0, t.exists)(r, "agreementId") ? r.agreementId : void 0,
                code: (0, t.exists)(r, "code") ? r.code : void 0,
                message: (0, t.exists)(r, "message") ? r.message : void 0
            } : void 0
        }
    }

    function D(e) {
        if (void 0 !== e) return null === e ? null : {
            questionId: e.questionId,
            answer: e.answer
        }
    }

    function k(e) {
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

    function U(e, n) {
        return null == e ? e : {
            lifetimeVisitBucket: (0, t.exists)(e, "lifetimeVisitBucket") ? e.lifetimeVisitBucket : void 0
        }
    }

    function O(e, n) {
        return null == e ? e : {
            counts: (0, t.exists)(e, "counts") ? e.counts : void 0
        }
    }

    function G(e) {
        var n;
        return null == (n = e) ? n : {
            universeId: (0, t.exists)(n, "universeId") ? n.universeId : void 0,
            universeName: (0, t.exists)(n, "universeName") ? n.universeName : void 0,
            rootPlaceId: (0, t.exists)(n, "rootPlaceId") ? n.rootPlaceId : void 0,
            description: (0, t.exists)(n, "description") ? n.description : void 0,
            creatorType: (0, t.exists)(n, "creatorType") ? n.creatorType : void 0,
            creatorTargetId: (0, t.exists)(n, "creatorTargetId") ? n.creatorTargetId : void 0
        }
    }

    function N(e) {
        var n;
        return null == (n = e) ? n : {
            licenseId: (0, t.exists)(n, "licenseId") ? n.licenseId : void 0,
            listingId: (0, t.exists)(n, "listingId") ? n.listingId : void 0,
            licenseName: (0, t.exists)(n, "licenseName") ? n.licenseName : void 0,
            ipFamilyName: (0, t.exists)(n, "ipFamilyName") ? n.ipFamilyName : void 0,
            recommendationReason: (0, t.exists)(n, "recommendationReason") ? n.recommendationReason : void 0,
            score: (0, t.exists)(n, "score") ? n.score : void 0,
            rank: (0, t.exists)(n, "rank") ? n.rank : void 0,
            thumbnailAssetIds: (0, t.exists)(n, "thumbnailAssetIds") ? n.thumbnailAssetIds : void 0,
            topUniverses: (0, t.exists)(n, "topUniverses") ? null === n.topUniverses ? null : n.topUniverses.map(G) : void 0
        }
    }

    function _(e) {
        var n, i;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            agreementId: (0, t.exists)(n, "agreementId") ? n.agreementId : void 0,
            contentType: (0, t.exists)(n, "contentType") ? n.contentType : void 0,
            contentId: (0, t.exists)(n, "contentId") ? n.contentId : void 0,
            createdAt: (0, t.exists)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.exists)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
            universeMetrics: (0, t.exists)(n, "universeMetrics") ? null == (i = n.universeMetrics) ? i : {
                dau7DayBucket: (0, t.exists)(i, "dau7DayBucket") ? i.dau7DayBucket : void 0,
                creatorDau7DayBucket: (0, t.exists)(i, "creatorDau7DayBucket") ? i.creatorDau7DayBucket : void 0,
                universeContentMaturity: (0, t.exists)(i, "universeContentMaturity") ? i.universeContentMaturity : void 0,
                averageDau7Day: (0, t.exists)(i, "averageDau7Day") ? i.averageDau7Day : void 0
            } : void 0
        }
    }

    function M(e, n) {
        return null == e ? e : {
            id: (0, t.exists)(e, "id") ? e.id : void 0,
            accountId: (0, t.exists)(e, "accountId") ? e.accountId : void 0,
            licenseId: (0, t.exists)(e, "licenseId") ? e.licenseId : void 0,
            targetAccountId: (0, t.exists)(e, "targetAccountId") ? e.targetAccountId : void 0,
            status: (0, t.exists)(e, "status") ? e.status : void 0,
            statusExpireAt: (0, t.exists)(e, "statusExpireAt") ? null === e.statusExpireAt ? null : new Date(e.statusExpireAt) : void 0,
            terminatesAt: (0, t.exists)(e, "terminatesAt") ? null === e.terminatesAt ? null : new Date(e.terminatesAt) : void 0,
            disputeReasons: (0, t.exists)(e, "disputeReasons") ? null === e.disputeReasons ? null : e.disputeReasons.map(p) : void 0,
            createdAt: (0, t.exists)(e, "createdAt") ? new Date(e.createdAt) : void 0,
            updatedAt: (0, t.exists)(e, "updatedAt") ? new Date(e.updatedAt) : void 0,
            enableMonetization: (0, t.exists)(e, "enableMonetization") ? e.enableMonetization : void 0,
            creatorLifetimeVisitBucket: (0, t.exists)(e, "creatorLifetimeVisitBucket") ? e.creatorLifetimeVisitBucket : void 0,
            activeChangeRequest: (0, t.exists)(e, "activeChangeRequest") ? l(e.activeChangeRequest) : void 0,
            conditionalChangeRequest: (0, t.exists)(e, "conditionalChangeRequest") ? g(e.conditionalChangeRequest) : void 0,
            startTime: (0, t.exists)(e, "startTime") ? null === e.startTime ? null : new Date(e.startTime) : void 0,
            endTime: (0, t.exists)(e, "endTime") ? null === e.endTime ? null : new Date(e.endTime) : void 0,
            ipRemovalAttestation: (0, t.exists)(e, "ipRemovalAttestation") ? m(e.ipRemovalAttestation) : void 0,
            license: (0, t.exists)(e, "license") ? T(e.license) : void 0,
            listing: (0, t.exists)(e, "listing") ? x(e.listing) : void 0,
            activityLog: (0, t.exists)(e, "activityLog") ? null === e.activityLog ? null : e.activityLog.map(o) : void 0,
            agreementTargets: (0, t.exists)(e, "agreementTargets") ? null === e.agreementTargets ? null : e.agreementTargets.map(_) : void 0,
            revenueTargetCounts: (0, t.exists)(e, "revenueTargetCounts") ? S(e.revenueTargetCounts) : void 0
        }
    }

    function z(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            accountId: (0, t.exists)(n, "accountId") ? n.accountId : void 0,
            ipFamilyId: (0, t.exists)(n, "ipFamilyId") ? n.ipFamilyId : void 0,
            ipFamilyName: (0, t.exists)(n, "ipFamilyName") ? n.ipFamilyName : void 0,
            candidateId: (0, t.exists)(n, "candidateId") ? n.candidateId : void 0,
            candidateType: (0, t.exists)(n, "candidateType") ? n.candidateType : void 0,
            archived: (0, t.exists)(n, "archived") ? n.archived : void 0,
            status: (0, t.exists)(n, "status") ? n.status : void 0,
            discoveredAt: (0, t.exists)(n, "discoveredAt") ? new Date(n.discoveredAt) : void 0,
            agreementId: (0, t.exists)(n, "agreementId") ? n.agreementId : void 0,
            linkedAgreementStatus: (0, t.exists)(n, "linkedAgreementStatus") ? n.linkedAgreementStatus : void 0,
            dau7DayBucket: (0, t.exists)(n, "dau7DayBucket") ? n.dau7DayBucket : void 0,
            creatorLifetimeVisitBucket: (0, t.exists)(n, "creatorLifetimeVisitBucket") ? n.creatorLifetimeVisitBucket : void 0,
            contentMaturity: (0, t.exists)(n, "contentMaturity") ? n.contentMaturity : void 0,
            experienceName: (0, t.exists)(n, "experienceName") ? n.experienceName : void 0,
            experienceCreatorType: (0, t.exists)(n, "experienceCreatorType") ? n.experienceCreatorType : void 0,
            candidateContentCreatorType: (0, t.exists)(n, "candidateContentCreatorType") ? n.candidateContentCreatorType : void 0,
            creatorName: (0, t.exists)(n, "creatorName") ? n.creatorName : void 0
        }
    }

    function F(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            accountId: (0, t.exists)(n, "accountId") ? n.accountId : void 0,
            listingId: (0, t.exists)(n, "listingId") ? n.listingId : void 0,
            listingName: (0, t.exists)(n, "listingName") ? n.listingName : void 0,
            name: (0, t.exists)(n, "name") ? n.name : void 0,
            description: (0, t.exists)(n, "description") ? n.description : void 0,
            royaltyRate: (0, t.exists)(n, "royaltyRate") ? n.royaltyRate : void 0,
            dau7DayThreshold: (0, t.exists)(n, "dau7DayThreshold") ? n.dau7DayThreshold : void 0,
            creatorDau7DayThreshold: (0, t.exists)(n, "creatorDau7DayThreshold") ? n.creatorDau7DayThreshold : void 0,
            maxAgeRating: (0, t.exists)(n, "maxAgeRating") ? n.maxAgeRating : void 0,
            countries: (0, t.exists)(n, "countries") ? n.countries : void 0,
            visibility: (0, t.exists)(n, "visibility") ? n.visibility : void 0,
            contentStandardsDocumentId: (0, t.exists)(n, "contentStandardsDocumentId") ? n.contentStandardsDocumentId : void 0,
            contentStandardsScope: (0, t.exists)(n, "contentStandardsScope") ? n.contentStandardsScope : void 0,
            contentStandardAnswers: (0, t.exists)(n, "contentStandardAnswers") ? null === n.contentStandardAnswers ? null : n.contentStandardAnswers.map(w) : void 0,
            createdAt: (0, t.exists)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.exists)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
            archived: (0, t.exists)(n, "archived") ? n.archived : void 0,
            enableMonetization: (0, t.exists)(n, "enableMonetization") ? n.enableMonetization : void 0,
            moderationStatus: (0, t.exists)(n, "moderationStatus") ? n.moderationStatus : void 0,
            licenseDuration: (0, t.exists)(n, "licenseDuration") ? y(n.licenseDuration) : void 0,
            licenseType: (0, t.exists)(n, "licenseType") ? n.licenseType : void 0,
            licenseTerms: (0, t.exists)(n, "licenseTerms") ? A(n.licenseTerms) : void 0,
            averageIphResponseTimeSeconds: (0, t.exists)(n, "averageIphResponseTimeSeconds") ? n.averageIphResponseTimeSeconds : void 0,
            pendingEdits: (0, t.exists)(n, "pendingEdits") ? q(n.pendingEdits) : void 0,
            hasPendingEdits: (0, t.exists)(n, "hasPendingEdits") ? n.hasPendingEdits : void 0
        }
    }

    function j(e, n) {
        return null == e ? e : {
            agreements: (0, t.exists)(e, "agreements") ? null === e.agreements ? null : e.agreements.map(b) : void 0,
            nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function J(e, n) {
        return null == e ? e : {
            licenses: (0, t.exists)(e, "licenses") ? null === e.licenses ? null : e.licenses.map(F) : void 0,
            nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function V(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            accountId: (0, t.exists)(n, "accountId") ? n.accountId : void 0,
            ipFamilyId: (0, t.exists)(n, "ipFamilyId") ? n.ipFamilyId : void 0,
            name: (0, t.exists)(n, "name") ? n.name : void 0,
            description: (0, t.exists)(n, "description") ? n.description : void 0,
            status: (0, t.exists)(n, "status") ? n.status : void 0,
            statusReason: (0, t.exists)(n, "statusReason") ? n.statusReason : void 0,
            visibility: (0, t.exists)(n, "visibility") ? n.visibility : void 0,
            thumbnailAssetIds: (0, t.exists)(n, "thumbnailAssetIds") ? n.thumbnailAssetIds : void 0,
            createdAt: (0, t.exists)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.exists)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
            archived: (0, t.exists)(n, "archived") ? n.archived : void 0,
            responseTimeMetrics: (0, t.exists)(n, "responseTimeMetrics") ? C(n.responseTimeMetrics) : void 0
        }
    }

    function H(e, n) {
        return null == e ? e : {
            listings: (0, t.exists)(e, "listings") ? null === e.listings ? null : e.listings.map(V) : void 0,
            nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function K(e, n) {
        return null == e ? e : {
            scopeId: (0, t.exists)(e, "scopeId") ? e.scopeId : void 0,
            scopeType: (0, t.exists)(e, "scopeType") ? e.scopeType : void 0
        }
    }

    function Q(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            accountId: (0, t.exists)(n, "accountId") ? n.accountId : void 0,
            targetAccountId: (0, t.exists)(n, "targetAccountId") ? n.targetAccountId : void 0,
            ipFamilyId: (0, t.exists)(n, "ipFamilyId") ? n.ipFamilyId : void 0,
            scope: (0, t.exists)(n, "scope") ? K(n.scope) : void 0,
            status: (0, t.exists)(n, "status") ? n.status : void 0,
            createdAt: (0, t.exists)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.exists)(n, "updatedAt") ? new Date(n.updatedAt) : void 0
        }
    }

    function Y(e, n) {
        return null == e ? e : {
            officialAgreements: (0, t.exists)(e, "officialAgreements") ? null === e.officialAgreements ? null : e.officialAgreements.map(Q) : void 0,
            nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function W(e) {
        var n, i;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            listingId: (0, t.exists)(n, "listingId") ? n.listingId : void 0,
            listingName: (0, t.exists)(n, "listingName") ? n.listingName : void 0,
            name: (0, t.exists)(n, "name") ? n.name : void 0,
            description: (0, t.exists)(n, "description") ? n.description : void 0,
            visibility: (0, t.exists)(n, "visibility") ? n.visibility : void 0,
            countries: (0, t.exists)(n, "countries") ? n.countries : void 0,
            licenseDuration: (0, t.exists)(n, "licenseDuration") ? null == (i = n.licenseDuration) ? i : {
                durationType: (0, t.exists)(i, "durationType") ? i.durationType : void 0,
                timeBounds: (0, t.exists)(i, "timeBounds") ? R(i.timeBounds) : void 0
            } : void 0,
            maxAgeRating: (0, t.exists)(n, "maxAgeRating") ? n.maxAgeRating : void 0,
            createdAt: (0, t.exists)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.exists)(n, "updatedAt") ? new Date(n.updatedAt) : void 0,
            licenseType: (0, t.exists)(n, "licenseType") ? n.licenseType : void 0,
            licenseTerms: (0, t.exists)(n, "licenseTerms") ? A(n.licenseTerms) : void 0
        }
    }

    function X(e, n) {
        return null == e ? e : {
            licenses: (0, t.exists)(e, "licenses") ? null === e.licenses ? null : e.licenses.map(W) : void 0,
            nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function Z(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            name: (0, t.exists)(n, "name") ? n.name : void 0,
            description: (0, t.exists)(n, "description") ? n.description : void 0,
            status: (0, t.exists)(n, "status") ? n.status : void 0,
            visibility: (0, t.exists)(n, "visibility") ? n.visibility : void 0,
            thumbnailAssetIds: (0, t.exists)(n, "thumbnailAssetIds") ? n.thumbnailAssetIds : void 0,
            createdAt: (0, t.exists)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.exists)(n, "updatedAt") ? new Date(n.updatedAt) : void 0
        }
    }

    function $(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            accountId: (0, t.exists)(n, "accountId") ? n.accountId : void 0,
            ipFamilyId: (0, t.exists)(n, "ipFamilyId") ? n.ipFamilyId : void 0,
            candidateId: (0, t.exists)(n, "candidateId") ? n.candidateId : void 0,
            candidateType: (0, t.exists)(n, "candidateType") ? n.candidateType : void 0,
            status: (0, t.exists)(n, "status") ? n.status : void 0,
            licenseId: (0, t.exists)(n, "licenseId") ? n.licenseId : void 0,
            agreementId: (0, t.exists)(n, "agreementId") ? n.agreementId : void 0,
            createdAt: (0, t.exists)(n, "createdAt") ? new Date(n.createdAt) : void 0,
            updatedAt: (0, t.exists)(n, "updatedAt") ? new Date(n.updatedAt) : void 0
        }
    }

    function ee(e) {
        var n;
        return null == (n = e) ? n : {
            revenueTargetType: (0, t.exists)(n, "revenueTargetType") ? n.revenueTargetType : void 0,
            revenueTargetId: (0, t.exists)(n, "revenueTargetId") ? n.revenueTargetId : void 0,
            iphEarningsRobux: (0, t.exists)(n, "iphEarningsRobux") ? n.iphEarningsRobux : void 0,
            creatorEarningsRobux: (0, t.exists)(n, "creatorEarningsRobux") ? n.creatorEarningsRobux : void 0,
            transactionCount: (0, t.exists)(n, "transactionCount") ? n.transactionCount : void 0
        }
    }

    function et(e) {
        var n;
        return null == (n = e) ? n : {
            revenueTargetType: (0, t.exists)(n, "revenueTargetType") ? n.revenueTargetType : void 0,
            revenueTargetId: (0, t.exists)(n, "revenueTargetId") ? n.revenueTargetId : void 0
        }
    }

    function en(e, n) {
        return null == e ? e : {
            revenueTargets: (0, t.exists)(e, "revenueTargets") ? null === e.revenueTargets ? null : e.revenueTargets.map(et) : void 0,
            nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function ei(e) {
        var n;
        return null == (n = e) ? n : {
            contentType: (0, t.exists)(n, "contentType") ? n.contentType : void 0,
            contentId: (0, t.exists)(n, "contentId") ? n.contentId : void 0
        }
    }

    function er(e, n) {
        return null == e ? e : {
            content: (0, t.exists)(e, "content") ? null === e.content ? null : e.content.map(ei) : void 0
        }
    }

    function ea(e) {
        if (void 0 !== e) return null === e ? null : {
            contentType: e.contentType,
            contentId: e.contentId
        }
    }

    function es(e, n) {
        return null == e ? e : {
            agreementId: (0, t.exists)(e, "agreementId") ? e.agreementId : void 0,
            revenueTargets: (0, t.exists)(e, "revenueTargets") ? null === e.revenueTargets ? null : e.revenueTargets.map(et) : void 0
        }
    }
    var eo = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.agreementCandidatesGetAgreementCandidateByIdRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesGetAgreementCandidateById.");
                                if (null === e.agreementCandidateId || void 0 === e.agreementCandidateId) throw new t.RequiredError("agreementCandidateId", "Required parameter requestParameters.agreementCandidateId was null or undefined when calling agreementCandidatesGetAgreementCandidateById.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementCandidateId", "}"), encodeURIComponent(String(e.agreementCandidateId))),
                                    schemaPath: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesGetAgreementCandidateById = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesGetCreatorLifetimeMetricsForAgreementCandidate.");
                                if (null === e.agreementCandidateId || void 0 === e.agreementCandidateId) throw new t.RequiredError("agreementCandidateId", "Required parameter requestParameters.agreementCandidateId was null or undefined when calling agreementCandidatesGetCreatorLifetimeMetricsForAgreementCandidate.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement-candidate/{agreementCandidateId}/creator-lifetime-metrics".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementCandidateId", "}"), encodeURIComponent(String(e.agreementCandidateId))),
                                    schemaPath: "/v1/account/{accountId}/agreement-candidate/{agreementCandidateId}/creator-lifetime-metrics",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesGetCreatorLifetimeMetricsForAgreementCandidate = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
            }, n.prototype.agreementCandidatesGetPlacefileImagesByAgreementCandidateRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesGetPlacefileImagesByAgreementCandidate.");
                                if (null === e.agreementCandidateId || void 0 === e.agreementCandidateId) throw new t.RequiredError("agreementCandidateId", "Required parameter requestParameters.agreementCandidateId was null or undefined when calling agreementCandidatesGetPlacefileImagesByAgreementCandidate.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}/placefile_images".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementCandidateId", "}"), encodeURIComponent(String(e.agreementCandidateId))),
                                    schemaPath: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}/placefile_images",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        assetIds: (0, t.exists)(e, "assetIds") ? e.assetIds : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesGetPlacefileImagesByAgreementCandidate = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesIgnoreAgreementCandidate.");
                                if (null === e.agreementCandidateId || void 0 === e.agreementCandidateId) throw new t.RequiredError("agreementCandidateId", "Required parameter requestParameters.agreementCandidateId was null or undefined when calling agreementCandidatesIgnoreAgreementCandidate.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}/ignore".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementCandidateId", "}"), encodeURIComponent(String(e.agreementCandidateId))),
                                    schemaPath: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}/ignore",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            reason: e.reason
                                        }
                                    }(e.agreementCandidatesIgnoreAgreementCandidateRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesIgnoreAgreementCandidate = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesListAgreementCandidatesByAccount.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.filter && (i.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement_candidates".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/agreement_candidates",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        agreementCandidates: (0, t.exists)(e, "agreementCandidates") ? null === e.agreementCandidates ? null : e.agreementCandidates.map(c) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesListAgreementCandidatesByAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesListIndexedAgreementCandidatesByAccount.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.archived && (i.archived = e.archived), void 0 !== e.ipFamilyId && (i.ipFamilyId = e.ipFamilyId), e.dau7DayBucket && (i.dau7DayBucket = e.dau7DayBucket), e.creatorLifetimeVisitBucket && (i.creatorLifetimeVisitBucket = e.creatorLifetimeVisitBucket), e.contentMaturity && (i.contentMaturity = e.contentMaturity), void 0 !== e.offerStatus && (i.offerStatus = e.offerStatus), void 0 !== e.sortBy && (i.sortBy = e.sortBy), void 0 !== e.sortDirection && (i.sortDirection = e.sortDirection), void 0 !== e.candidateType && (i.candidateType = e.candidateType), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/matches".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/matches",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        agreementCandidates: (0, t.exists)(e, "agreementCandidates") ? null === e.agreementCandidates ? null : e.agreementCandidates.map(z) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesListIndexedAgreementCandidatesByAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementCandidatesPromoteAgreementCandidate.");
                                if (null === e.agreementCandidateId || void 0 === e.agreementCandidateId) throw new t.RequiredError("agreementCandidateId", "Required parameter requestParameters.agreementCandidateId was null or undefined when calling agreementCandidatesPromoteAgreementCandidate.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}/promote".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementCandidateId", "}"), encodeURIComponent(String(e.agreementCandidateId))),
                                    schemaPath: "/v1/account/{accountId}/agreement_candidate/{agreementCandidateId}/promote",
                                    method: "POST",
                                    headers: r,
                                    query: i,
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
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return h(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementCandidatesPromoteAgreementCandidate = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
        }(t.BaseAPI),
        ec = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.agreementsAcceptAgreementDisputeRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsAcceptAgreementDispute.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsAcceptAgreementDispute.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/accept_dispute".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/accept_dispute",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsAcceptAgreementDispute = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsAcceptAgreementOffer.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsAcceptAgreementOffer.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/accept_offer".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/accept_offer",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsAcceptAgreementOffer = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsAcknowledgeCompletedChangeRequest.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsAcknowledgeCompletedChangeRequest.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/acknowledge_completed_change_request".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/acknowledge_completed_change_request",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsAcknowledgeCompletedChangeRequest = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsActivateAcceptedAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsActivateAcceptedAgreement.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/activate".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/activate",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsActivateAcceptedAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsApproveConditionalChangeRequest.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsApproveConditionalChangeRequest.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/approve_conditional_change_request".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/approve_conditional_change_request",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsApproveConditionalChangeRequest = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsApproveLicenseApplication.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsApproveLicenseApplication.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/approve".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/approve",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsApproveLicenseApplication = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsArchiveUnsuccessfulOffer.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsArchiveUnsuccessfulOffer.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/archive_unsuccessful_offer".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/archive_unsuccessful_offer",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsArchiveUnsuccessfulOffer = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsAttestIpRemoval.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsAttestIpRemoval.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/attest_ip_removal".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/attest_ip_removal",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsAttestIpRemoval = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsBatchGetAgreementStatusByIds.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreements/ids".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/agreements/ids",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            agreementIds: e.agreementIds
                                        }
                                    }(e.agreementsBatchGetAgreementStatusByIdsRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        results: (0, t.exists)(e, "results") ? null === e.results ? null : e.results.map(B) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsBatchGetAgreementStatusByIds = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.creatorType || void 0 === e.creatorType) throw new t.RequiredError("creatorType", "Required parameter requestParameters.creatorType was null or undefined when calling agreementsBatchGetAgreementsByRevenueTargetsForCreator.");
                                if (null === e.creatorId || void 0 === e.creatorId) throw new t.RequiredError("creatorId", "Required parameter requestParameters.creatorId was null or undefined when calling agreementsBatchGetAgreementsByRevenueTargetsForCreator.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/creator_type/{creatorType}/creator_id/{creatorId}/agreements/by-revenue-targets".replace("{".concat("creatorType", "}"), encodeURIComponent(String(e.creatorType))).replace("{".concat("creatorId", "}"), encodeURIComponent(String(e.creatorId))),
                                    schemaPath: "/v1/creator_type/{creatorType}/creator_id/{creatorId}/agreements/by-revenue-targets",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            revenueTargets: e.revenueTargets.map(f)
                                        }
                                    }(e.agreementsBatchGetAgreementsByRevenueTargetsForCreatorRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        results: (0, t.exists)(e, "results") ? null === e.results ? null : e.results.map(P) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsBatchGetAgreementsByRevenueTargetsForCreator = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsCancelAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsCancelAgreement.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/cancel".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/cancel",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            reason: e.reason
                                        }
                                    }(e.agreementsCancelAgreementRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsCancelAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsCompleteChangeRequest.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsCompleteChangeRequest.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/complete_change_request".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/complete_change_request",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsCompleteChangeRequest = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsCompleteConditionalChangeRequest.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsCompleteConditionalChangeRequest.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/complete_conditional_change_request".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/complete_conditional_change_request",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsCompleteConditionalChangeRequest = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsCompleteConditionalChangeRequestRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsDisputeAgreementOfferRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsDisputeAgreementOffer.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsDisputeAgreementOffer.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/dispute_offer".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/dispute_offer",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            disputeReason: e.disputeReason
                                        }
                                    }(e.agreementsDisputeAgreementOfferRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsDisputeAgreementOffer = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsEnableMonetization.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsEnableMonetization.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/enable_monetization".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/enable_monetization",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsEnableMonetization = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsGetAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsGetAgreement.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return M(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsGetAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsGetAgreementCountByStatusAndAccount.");
                                return i = {}, void 0 !== e.statuses && (i.statuses = e.statuses), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreements/count".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/agreements/count",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsGetAgreementCountByStatusAndAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsGetAgreementCountByStatusAndTargetAccount.");
                                return i = {}, void 0 !== e.statuses && (i.statuses = e.statuses), r = {}, [4, this.request({
                                    path: "/v1/agreements/{accountId}/creator_agreements/count".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/agreements/{accountId}/creator_agreements/count",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsGetAgreementCountByStatusAndTargetAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsGetCreatorAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsGetCreatorAgreement.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/creator_agreement/{agreementId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/creator_agreement/{agreementId}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return M(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsGetCreatorAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsGetCreatorLifetimeMetricsForAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsGetCreatorLifetimeMetricsForAgreement.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/creator-lifetime-metrics".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/creator-lifetime-metrics",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsGetCreatorLifetimeMetricsForAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsGetCreatorPitchImagesByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsGetCreatorPitchImagesByAgreement.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/creator_agreement/{agreementId}/pitch_images".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/creator_agreement/{agreementId}/pitch_images",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsGetCreatorPitchImagesByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsGetPitchImagesByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsGetPitchImagesByAgreement.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/pitch_images".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/pitch_images",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsGetPitchImagesByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsInitiateChangeRequest.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsInitiateChangeRequest.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/initiate_change_request".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/initiate_change_request",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            changeRequestReason: e.changeRequestReason
                                        }
                                    }(e.agreementsInitiateChangeRequestRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        status: (0, t.exists)(e, "status") ? e.status : void 0,
                                        reason: (0, t.exists)(e, "reason") ? e.reason : void 0,
                                        rejectionMessage: (0, t.exists)(e, "rejectionMessage") ? e.rejectionMessage : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsInitiateChangeRequest = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListAgreementActivitiesByAccount.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsListAgreementActivitiesByAccount.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/activities".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/activities",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        activities: (0, t.exists)(e, "activities") ? null === e.activities ? null : e.activities.map(o) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementActivitiesByAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListAgreementTargetsByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsListAgreementTargetsByAgreement.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/targets".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/targets",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        targets: (0, t.exists)(e, "targets") ? null === e.targets ? null : e.targets.map(v) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementTargetsByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListAgreementsByAccount.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.filter && (i.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/agreements",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return j(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementsByAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.creatorId || void 0 === e.creatorId) throw new t.RequiredError("creatorId", "Required parameter requestParameters.creatorId was null or undefined when calling agreementsListAgreementsByCreator.");
                                if (null === e.creatorType || void 0 === e.creatorType) throw new t.RequiredError("creatorType", "Required parameter requestParameters.creatorType was null or undefined when calling agreementsListAgreementsByCreator.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.filter && (i.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/creator_type/{creatorType}/creator_id/{creatorId}/agreements".replace("{".concat("creatorId", "}"), encodeURIComponent(String(e.creatorId))).replace("{".concat("creatorType", "}"), encodeURIComponent(String(e.creatorType))),
                                    schemaPath: "/v1/creator_type/{creatorType}/creator_id/{creatorId}/agreements",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return j(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementsByCreator = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListAgreementsByLicense.");
                                if (null === e.licenseId || void 0 === e.licenseId) throw new t.RequiredError("licenseId", "Required parameter requestParameters.licenseId was null or undefined when calling agreementsListAgreementsByLicense.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.filter && (i.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/license/{licenseId}/agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("licenseId", "}"), encodeURIComponent(String(e.licenseId))),
                                    schemaPath: "/v1/account/{accountId}/license/{licenseId}/agreements",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        agreements: (0, t.exists)(e, "agreements") ? null === e.agreements ? null : e.agreements.map(h) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementsByLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListAgreementsByTargetAccount.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.filter && (i.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/agreements/{accountId}/creator_agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/agreements/{accountId}/creator_agreements",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return j(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListAgreementsByTargetAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
            }, n.prototype.agreementsListHydratedAgreementTargetsByAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListHydratedAgreementTargetsByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsListHydratedAgreementTargetsByAgreement.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/hydrated-targets".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/hydrated-targets",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        targets: (0, t.exists)(e, "targets") ? null === e.targets ? null : e.targets.map(_) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListHydratedAgreementTargetsByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListRevenueTargetEarningsByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsListRevenueTargetEarningsByAgreement.");
                                return i = {}, void 0 !== e.startDate && (i.startDate = e.startDate), void 0 !== e.endDate && (i.endDate = e.endDate), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/revenue-target-earnings".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/revenue-target-earnings",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        revenueTargetEarnings: (0, t.exists)(e, "revenueTargetEarnings") ? null === e.revenueTargetEarnings ? null : e.revenueTargetEarnings.map(ee) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListRevenueTargetEarningsByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsListRevenueTargetsByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsListRevenueTargetsByAgreement.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/revenue-targets".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/revenue-targets",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return en(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsListRevenueTargetsByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsRejectAgreementDispute.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsRejectAgreementDispute.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/reject_dispute".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/reject_dispute",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsRejectAgreementDispute = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsRejectConditionalChangeRequest.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsRejectConditionalChangeRequest.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/reject_conditional_change_request".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/reject_conditional_change_request",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsRejectConditionalChangeRequest = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsRejectLicenseApplication.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsRejectLicenseApplication.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/agreement/{agreementId}/reject".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/agreement/{agreementId}/reject",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            feedback: e.feedback
                                        }
                                    }(e.agreementsRejectLicenseApplicationRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.agreementsRejectLicenseApplication = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementsRejectLicenseApplicationRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.agreementsUpdateCreatorPitchImagesByAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling agreementsUpdateCreatorPitchImagesByAgreement.");
                                if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling agreementsUpdateCreatorPitchImagesByAgreement.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/creator_agreement/{agreementId}/pitch_images".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                    schemaPath: "/v1/account/{accountId}/creator_agreement/{agreementId}/pitch_images",
                                    method: "PUT",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            pitchImageAssetIds: e.pitchImageAssetIds
                                        }
                                    }(e.agreementsUpdateCreatorPitchImagesByAgreementRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementsUpdateCreatorPitchImagesByAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
        }(t.BaseAPI),
        eu = (function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            i(n, e), n.prototype.creatorGetMarketplaceEarningsBucketRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.creatorType || void 0 === e.creatorType) throw new t.RequiredError("creatorType", "Required parameter requestParameters.creatorType was null or undefined when calling creatorGetMarketplaceEarningsBucket.");
                                if (null === e.creatorId || void 0 === e.creatorId) throw new t.RequiredError("creatorId", "Required parameter requestParameters.creatorId was null or undefined when calling creatorGetMarketplaceEarningsBucket.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/creator_type/{creatorType}/creator_id/{creatorId}/marketplace-earnings-bucket".replace("{".concat("creatorType", "}"), encodeURIComponent(String(e.creatorType))).replace("{".concat("creatorId", "}"), encodeURIComponent(String(e.creatorId))),
                                    schemaPath: "/v1/creator_type/{creatorType}/creator_id/{creatorId}/marketplace-earnings-bucket",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        creatorEarningsBucket: (0, t.exists)(e, "creatorEarningsBucket") ? e.creatorEarningsBucket : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.creatorGetMarketplaceEarningsBucket = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
            }
        }(t.BaseAPI), function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.earningsExportEarningsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling earningsExportEarnings.");
                                return i = {}, void 0 !== e.startDate && (i.startDate = e.startDate), void 0 !== e.endDate && (i.endDate = e.endDate), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/earnings/export".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/earnings/export",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.BlobApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.earningsExportEarnings = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
        }(t.BaseAPI)),
        ed = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.lLMModerationModerateMessageRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/llm-moderation/moderate-message",
                                    schemaPath: "/v1/llm-moderation/moderate-message",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            message: e.message
                                        }
                                    }(e.lLMModerationModerateMessageRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        status: (0, t.exists)(e, "status") ? e.status : void 0,
                                        reason: (0, t.exists)(e, "reason") ? e.reason : void 0,
                                        rejectionMessage: (0, t.exists)(e, "rejectionMessage") ? e.rejectionMessage : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.lLMModerationModerateMessage = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(n) {
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
        }(t.BaseAPI),
        el = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.licensesApplyToLicenseRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.licenseId || void 0 === e.licenseId) throw new t.RequiredError("licenseId", "Required parameter requestParameters.licenseId was null or undefined when calling licensesApplyToLicense.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/license/{licenseId}/apply".replace("{".concat("licenseId", "}"), encodeURIComponent(String(e.licenseId))),
                                    schemaPath: "/v1/license/{licenseId}/apply",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            enableMonetization: e.enableMonetization,
                                            pitch: e.pitch,
                                            targets: e.targets.map(u),
                                            startTime: void 0 === e.startTime ? void 0 : null === e.startTime ? null : e.startTime.toISOString(),
                                            endTime: void 0 === e.endTime ? void 0 : null === e.endTime ? null : e.endTime.toISOString(),
                                            revenueTargets: void 0 === e.revenueTargets ? void 0 : null === e.revenueTargets ? null : e.revenueTargets.map(E),
                                            pitchImageAssetIds: e.pitchImageAssetIds
                                        }
                                    }(e.licensesApplyToLicenseRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return h(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesApplyToLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling licensesArchiveLicense.");
                                if (null === e.licenseId || void 0 === e.licenseId) throw new t.RequiredError("licenseId", "Required parameter requestParameters.licenseId was null or undefined when calling licensesArchiveLicense.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/license/{licenseId}/archive".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("licenseId", "}"), encodeURIComponent(String(e.licenseId))),
                                    schemaPath: "/v1/account/{accountId}/license/{licenseId}/archive",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.VoidApiResponse(s)]
                        }
                    })
                })
            }, n.prototype.licensesArchiveLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling licensesCreateLicense.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/licenses".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/licenses",
                                    method: "POST",
                                    headers: r,
                                    query: i,
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
                                            licenseDuration: k(e.licenseDuration),
                                            contentStandardsDocumentId: e.contentStandardsDocumentId,
                                            contentStandardScope: e.contentStandardScope,
                                            contentStandardAnswers: void 0 === e.contentStandardAnswers ? void 0 : null === e.contentStandardAnswers ? null : e.contentStandardAnswers.map(D),
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
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return F(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesCreateLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling licensesGetLicense.");
                                if (null === e.licenseId || void 0 === e.licenseId) throw new t.RequiredError("licenseId", "Required parameter requestParameters.licenseId was null or undefined when calling licensesGetLicense.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/license/{licenseId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("licenseId", "}"), encodeURIComponent(String(e.licenseId))),
                                    schemaPath: "/v1/account/{accountId}/license/{licenseId}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return F(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesGetLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.licenseId || void 0 === e.licenseId) throw new t.RequiredError("licenseId", "Required parameter requestParameters.licenseId was null or undefined when calling licensesGetPublicLicense.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/license/{licenseId}".replace("{".concat("licenseId", "}"), encodeURIComponent(String(e.licenseId))),
                                    schemaPath: "/v1/license/{licenseId}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return F(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesGetPublicLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.licenseId || void 0 === e.licenseId) throw new t.RequiredError("licenseId", "Required parameter requestParameters.licenseId was null or undefined when calling licensesListEligibleContentsByLicense.");
                                return i = {}, void 0 !== e.contentType && (i.contentType = e.contentType), void 0 !== e.creatorId && (i.creatorId = e.creatorId), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/license/{licenseId}/eligible_contents".replace("{".concat("licenseId", "}"), encodeURIComponent(String(e.licenseId))),
                                    schemaPath: "/v1/license/{licenseId}/eligible_contents",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        agreementContents: (0, t.exists)(e, "agreementContents") ? null === e.agreementContents ? null : e.agreementContents.map(d) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.licensesListEligibleContentsByLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling licensesListLicensesByListing.");
                                if (null === e.listingId || void 0 === e.listingId) throw new t.RequiredError("listingId", "Required parameter requestParameters.listingId was null or undefined when calling licensesListLicensesByListing.");
                                return i = {}, void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.pageSize && (i.pageSize = e.pageSize), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/listing/{listingId}/licenses".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/account/{accountId}/listing/{listingId}/licenses",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return J(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesListLicensesByListing = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.filter && (i.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/licenses",
                                    schemaPath: "/v1/licenses",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return J(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesListPublicLicenses = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.listingId || void 0 === e.listingId) throw new t.RequiredError("listingId", "Required parameter requestParameters.listingId was null or undefined when calling licensesListPublicLicensesByListing.");
                                return i = {}, void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.pageSize && (i.pageSize = e.pageSize), r = {}, [4, this.request({
                                    path: "/v1/listing/{listingId}/licenses".replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/listing/{listingId}/licenses",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return J(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesListPublicLicensesByListing = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.listingId || void 0 === e.listingId) throw new t.RequiredError("listingId", "Required parameter requestParameters.listingId was null or undefined when calling licensesListPublicLicensesByListingUnauthenticated.");
                                return i = {}, void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.pageSize && (i.pageSize = e.pageSize), r = {}, [4, this.request({
                                    path: "/v1/listing/{listingId}/public-licenses".replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/listing/{listingId}/public-licenses",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return X(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesListPublicLicensesByListingUnauthenticated = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.filter && (i.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/public-licenses",
                                    schemaPath: "/v1/public-licenses",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return X(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesListPublicLicensesUnauthenticated = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling licensesUpdateLicense.");
                                if (null === e.licenseId || void 0 === e.licenseId) throw new t.RequiredError("licenseId", "Required parameter requestParameters.licenseId was null or undefined when calling licensesUpdateLicense.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/license/{licenseId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("licenseId", "}"), encodeURIComponent(String(e.licenseId))),
                                    schemaPath: "/v1/account/{accountId}/license/{licenseId}",
                                    method: "PUT",
                                    headers: r,
                                    query: i,
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
                                            licenseDuration: k(e.licenseDuration),
                                            licenseTerms: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    reselling: e.reselling,
                                                    minimumCreatorEarningsBucket: e.minimumCreatorEarningsBucket
                                                }
                                            }(e.licenseTerms),
                                            contentStandardsDocumentId: e.contentStandardsDocumentId,
                                            contentStandardScope: e.contentStandardScope,
                                            contentStandardAnswers: void 0 === e.contentStandardAnswers ? void 0 : null === e.contentStandardAnswers ? null : e.contentStandardAnswers.map(D)
                                        }
                                    }(e.licensesUpdateLicenseRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return F(e)
                                })]
                        }
                    })
                })
            }, n.prototype.licensesUpdateLicense = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
        }(t.BaseAPI),
        eg = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.licensingDocumentsUploadLicensingDocumentRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling licensingDocumentsUploadLicensingDocument.");
                                return i = {}, r = {}, s = (0, t.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.file && s.append("file", e.file), [4, this.request({
                                    path: "/v1/account/{accountId}/licensing_documents".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/licensing_documents",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: s
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        id: (0, t.exists)(e, "id") ? e.id : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.licensingDocumentsUploadLicensingDocument = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
        }(t.BaseAPI),
        em = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.listingsCreateListingRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling listingsCreateListing.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/listings".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/listings",
                                    method: "POST",
                                    headers: r,
                                    query: i,
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
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return V(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsCreateListing = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling listingsGetListing.");
                                if (null === e.listingId || void 0 === e.listingId) throw new t.RequiredError("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsGetListing.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/listing/{listingId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/account/{accountId}/listing/{listingId}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return V(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsGetListing = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling listingsGetListingShowcaseContent.");
                                if (null === e.listingId || void 0 === e.listingId) throw new t.RequiredError("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsGetListingShowcaseContent.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/listing/{listingId}/showcase-content".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/account/{accountId}/listing/{listingId}/showcase-content",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return er(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsGetListingShowcaseContent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.listingId || void 0 === e.listingId) throw new t.RequiredError("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsGetPublicListing.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/listing/{listingId}".replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/listing/{listingId}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return V(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsGetPublicListing = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.listingId || void 0 === e.listingId) throw new t.RequiredError("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsGetPublicListingShowcaseContent.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/public-listing/{listingId}/showcase-content".replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/public-listing/{listingId}/showcase-content",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return er(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsGetPublicListingShowcaseContent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.listingId || void 0 === e.listingId) throw new t.RequiredError("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsGetPublicListingUnauthenticated.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/public-listing/{listingId}".replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/public-listing/{listingId}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return Z(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsGetPublicListingUnauthenticated = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling listingsListListingsByAccount.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/listings".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/listings",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return H(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsListListingsByAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/listings",
                                    schemaPath: "/v1/listings",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return H(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsListPublicListings = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/public-listings",
                                    schemaPath: "/v1/public-listings",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        listings: (0, t.exists)(e, "listings") ? null === e.listings ? null : e.listings.map(Z) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.listingsListPublicListingsUnauthenticated = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling listingsListShowcaseEligibleContentByListing.");
                                if (null === e.listingId || void 0 === e.listingId) throw new t.RequiredError("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsListShowcaseEligibleContentByListing.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/listing/{listingId}/showcase-eligible-content".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/account/{accountId}/listing/{listingId}/showcase-eligible-content",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        content: (0, t.exists)(e, "content") ? null === e.content ? null : e.content.map(ei) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.listingsListShowcaseEligibleContentByListing = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling listingsReplaceListingShowcaseContent.");
                                if (null === e.listingId || void 0 === e.listingId) throw new t.RequiredError("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsReplaceListingShowcaseContent.");
                                if (null === e.ifMatch || void 0 === e.ifMatch) throw new t.RequiredError("ifMatch", "Required parameter requestParameters.ifMatch was null or undefined when calling listingsReplaceListingShowcaseContent.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", void 0 !== e.ifMatch && null !== e.ifMatch && (r["If-Match"] = String(e.ifMatch)), [4, this.request({
                                    path: "/v1/account/{accountId}/listing/{listingId}/showcase-content".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/account/{accountId}/listing/{listingId}/showcase-content",
                                    method: "PUT",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            content: e.content.map(ea)
                                        }
                                    }(e.listingsReplaceListingShowcaseContentRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return er(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsReplaceListingShowcaseContent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling listingsUpdateListing.");
                                if (null === e.listingId || void 0 === e.listingId) throw new t.RequiredError("listingId", "Required parameter requestParameters.listingId was null or undefined when calling listingsUpdateListing.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/listing/{listingId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("listingId", "}"), encodeURIComponent(String(e.listingId))),
                                    schemaPath: "/v1/account/{accountId}/listing/{listingId}",
                                    method: "PUT",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            description: e.description,
                                            thumbnailAssetIds: e.thumbnailAssetIds
                                        }
                                    }(e.listingsUpdateListingRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return V(e)
                                })]
                        }
                    })
                })
            }, n.prototype.listingsUpdateListing = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
        }(t.BaseAPI),
        ep = (function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            i(n, e), n.prototype.officialAgreementsCancelOfficialAgreementRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling officialAgreementsCancelOfficialAgreement.");
                                if (null === e.officialAgreementId || void 0 === e.officialAgreementId) throw new t.RequiredError("officialAgreementId", "Required parameter requestParameters.officialAgreementId was null or undefined when calling officialAgreementsCancelOfficialAgreement.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/official_agreements/{officialAgreementId}/cancel".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("officialAgreementId", "}"), encodeURIComponent(String(e.officialAgreementId))),
                                    schemaPath: "/v1/account/{accountId}/official_agreements/{officialAgreementId}/cancel",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return Q(e)
                                })]
                        }
                    })
                })
            }, n.prototype.officialAgreementsCancelOfficialAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling officialAgreementsCreateOfficialAgreement.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/official_agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/official_agreements",
                                    method: "POST",
                                    headers: r,
                                    query: i,
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
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return Q(e)
                                })]
                        }
                    })
                })
            }, n.prototype.officialAgreementsCreateOfficialAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling officialAgreementsListOfficialAgreementsByAccount.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.status && (i.status = e.status), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/official_agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/official_agreements",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return Y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.officialAgreementsListOfficialAgreementsByAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling officialAgreementsListOfficialAgreementsByTargetAccount.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.status && (i.status = e.status), r = {}, [4, this.request({
                                    path: "/v1/official_agreements/{accountId}/creator_agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/official_agreements/{accountId}/creator_agreements",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return Y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.officialAgreementsListOfficialAgreementsByTargetAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling officialAgreementsRespondToOfficialAgreement.");
                                if (null === e.officialAgreementId || void 0 === e.officialAgreementId) throw new t.RequiredError("officialAgreementId", "Required parameter requestParameters.officialAgreementId was null or undefined when calling officialAgreementsRespondToOfficialAgreement.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/official_agreements/{accountId}/creator_agreements/{officialAgreementId}/response".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("officialAgreementId", "}"), encodeURIComponent(String(e.officialAgreementId))),
                                    schemaPath: "/v1/official_agreements/{accountId}/creator_agreements/{officialAgreementId}/response",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            action: e.action,
                                            disputeReason: e.disputeReason
                                        }
                                    }(e.officialAgreementsRespondToOfficialAgreementRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    var n;
                                    return null == e ? e : {
                                        status: (0, t.exists)(e, "status") ? e.status : void 0,
                                        reason: (0, t.exists)(e, "reason") ? e.reason : void 0,
                                        rejectionMessage: (0, t.exists)(e, "rejectionMessage") ? e.rejectionMessage : void 0,
                                        officialAgreement: (0, t.exists)(e, "officialAgreement") ? null == (n = e.officialAgreement) ? n : {
                                            id: (0, t.exists)(n, "id") ? n.id : void 0,
                                            accountId: (0, t.exists)(n, "accountId") ? n.accountId : void 0,
                                            targetAccountId: (0, t.exists)(n, "targetAccountId") ? n.targetAccountId : void 0,
                                            ipFamilyId: (0, t.exists)(n, "ipFamilyId") ? n.ipFamilyId : void 0,
                                            scope: (0, t.exists)(n, "scope") ? K(n.scope) : void 0,
                                            status: (0, t.exists)(n, "status") ? n.status : void 0,
                                            createdAt: (0, t.exists)(n, "createdAt") ? new Date(n.createdAt) : void 0,
                                            updatedAt: (0, t.exists)(n, "updatedAt") ? new Date(n.updatedAt) : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.officialAgreementsRespondToOfficialAgreement = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
        }(t.BaseAPI), function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.recommendationsGetLicenseRecommendationsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/recommendations/license-recommendations",
                                    schemaPath: "/v1/recommendations/license-recommendations",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            creatorId: e.creatorId,
                                            creatorType: e.creatorType,
                                            universeIds: e.universeIds
                                        }
                                    }(e.recommendationsGetLicenseRecommendationsRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        requestId: (0, t.exists)(e, "requestId") ? e.requestId : void 0,
                                        recommendations: (0, t.exists)(e, "recommendations") ? null === e.recommendations ? null : e.recommendations.map(N) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.recommendationsGetLicenseRecommendations = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(n) {
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
        }(t.BaseAPI)),
        eh = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.requestedScanCandidatesCreateRequestedScanCandidateRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling requestedScanCandidatesCreateRequestedScanCandidate.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/requested_scan_candidates".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/requested_scan_candidates",
                                    method: "POST",
                                    headers: r,
                                    query: i,
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
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return $(e)
                                })]
                        }
                    })
                })
            }, n.prototype.requestedScanCandidatesCreateRequestedScanCandidate = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling requestedScanCandidatesListRequestedScanCandidatesByAccount.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.filter && (i.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/requested_scan_candidates".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/requested_scan_candidates",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        candidates: (0, t.exists)(e, "candidates") ? null === e.candidates ? null : e.candidates.map($) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0,
                                        numScanRequestsToday: (0, t.exists)(e, "numScanRequestsToday") ? e.numScanRequestsToday : void 0,
                                        numScanRequestsLimit: (0, t.exists)(e, "numScanRequestsLimit") ? e.numScanRequestsLimit : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.requestedScanCandidatesListRequestedScanCandidatesByAccount = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling requestedScanCandidatesValidateIpFamily.");
                                if (null === e.ipFamilyId || void 0 === e.ipFamilyId) throw new t.RequiredError("ipFamilyId", "Required parameter requestParameters.ipFamilyId was null or undefined when calling requestedScanCandidatesValidateIpFamily.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/account/{accountId}/requested_scan_candidates/{ipFamilyId}/validate".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("ipFamilyId", "}"), encodeURIComponent(String(e.ipFamilyId))),
                                    schemaPath: "/v1/account/{accountId}/requested_scan_candidates/{ipFamilyId}/validate",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        validity: (0, t.exists)(e, "validity") ? e.validity : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.requestedScanCandidatesValidateIpFamily = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
                    var i, r, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling requestedScanCandidatesValidateRequestedScan.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/account/{accountId}/requested_scan_candidates/validate".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                    schemaPath: "/v1/account/{accountId}/requested_scan_candidates/validate",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            ipFamilyId: e.ipFamilyId,
                                            candidateId: e.candidateId,
                                            candidateType: e.candidateType
                                        }
                                    }(e.requestedScanCandidatesValidateRequestedScanRequest)
                                }, n)];
                            case 1:
                                return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        validity: (0, t.exists)(e, "validity") ? e.validity : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.requestedScanCandidatesValidateRequestedScan = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(n) {
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
        }(t.BaseAPI),
        ev = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.settingsGetFlagsRaw = function(e) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/flags",
                                    schemaPath: "/v1/flags",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, e)];
                            case 1:
                                return r = a.sent(), [2, new t.JSONApiResponse(r)]
                        }
                    })
                })
            }, n.prototype.settingsGetFlags = function(e) {
                return r(this, void 0, void 0, function() {
                    return a(this, function(t) {
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
            }, n
        }(t.BaseAPI);
    (function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(n, e), n.prototype.toolboxAddRevenueTargetsToolboxRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling toolboxAddRevenueTargetsToolbox.");
                            return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/toolbox/agreement/{agreementId}/revenue-targets".replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                schemaPath: "/v1/toolbox/agreement/{agreementId}/revenue-targets",
                                method: "PATCH",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        revenueTargets: e.revenueTargets.map(s)
                                    }
                                }(e.toolboxAddRevenueTargetsToolboxRequest)
                            }, n)];
                        case 1:
                            return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return es(e)
                            })]
                    }
                })
            })
        }, n.prototype.toolboxAddRevenueTargetsToolbox = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.toolboxAddRevenueTargetsToolboxRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.toolboxDeleteRevenueTargetsToolboxRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling toolboxDeleteRevenueTargetsToolbox.");
                            return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/toolbox/agreement/{agreementId}/revenue-targets".replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                schemaPath: "/v1/toolbox/agreement/{agreementId}/revenue-targets",
                                method: "DELETE",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        revenueTargets: e.revenueTargets.map(s),
                                        reason: e.reason
                                    }
                                }(e.toolboxDeleteRevenueTargetsToolboxRequest)
                            }, n)];
                        case 1:
                            return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return es(e)
                            })]
                    }
                })
            })
        }, n.prototype.toolboxDeleteRevenueTargetsToolbox = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.toolboxDeleteRevenueTargetsToolboxRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.toolboxInitiateAgreementTerminationRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling toolboxInitiateAgreementTermination.");
                            return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/agreement/{agreementId}/initiate_termination".replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                schemaPath: "/v1/agreement/{agreementId}/initiate_termination",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        reason: e.reason
                                    }
                                }(e.toolboxInitiateAgreementTerminationRequest)
                            }, n)];
                        case 1:
                            return s = a.sent(), [2, new t.VoidApiResponse(s)]
                    }
                })
            })
        }, n.prototype.toolboxInitiateAgreementTermination = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(n) {
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
                var i, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.accountId || void 0 === e.accountId) throw new t.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling toolboxListAgreementsByAccountToolbox.");
                            return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.filter && (i.filter = e.filter), r = {}, [4, this.request({
                                path: "/v1/toolbox/account/{accountId}/agreements".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                schemaPath: "/v1/toolbox/account/{accountId}/agreements",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return j(e)
                            })]
                    }
                })
            })
        }, n.prototype.toolboxListAgreementsByAccountToolbox = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(n) {
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
        }, n.prototype.toolboxListRevenueTargetsByAgreementToolboxRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.agreementId || void 0 === e.agreementId) throw new t.RequiredError("agreementId", "Required parameter requestParameters.agreementId was null or undefined when calling toolboxListRevenueTargetsByAgreementToolbox.");
                            return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), r = {}, [4, this.request({
                                path: "/v1/toolbox/agreement/{agreementId}/revenue-targets".replace("{".concat("agreementId", "}"), encodeURIComponent(String(e.agreementId))),
                                schemaPath: "/v1/toolbox/agreement/{agreementId}/revenue-targets",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return en(e)
                            })]
                    }
                })
            })
        }, n.prototype.toolboxListRevenueTargetsByAgreementToolbox = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(n) {
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
    })(t.BaseAPI), e.s(["AgreementCandidateIndexOfferStatusFilter", 0, {
        NoOfferSent: "NoOfferSent",
        HasAgreement: "HasAgreement"
    }, "AgreementCandidateIndexSortBy", 0, {
        DiscoveredAt: "DiscoveredAt",
        Dau7DayBucket: "Dau7DayBucket",
        CreatorLifetimeVisitBucket: "CreatorLifetimeVisitBucket",
        ContentMaturity: "ContentMaturity"
    }, "AgreementCandidateIndexSortDirection", 0, {
        Asc: "Asc",
        Desc: "Desc"
    }, "AgreementCandidatePromotionType", 0, {
        Offer: "Offer",
        Conditional: "Conditional"
    }, "AgreementCandidateStatus", 0, {
        Pending: "Pending",
        Approved: "Approved",
        Rejected: "Rejected"
    }, "AgreementCandidateType", 0, {
        Universe: "Universe",
        Collectible: "Collectible"
    }, "AgreementCandidatesApi", 0, eo, "AgreementStatus", 0, {
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
    }, "AgreementTransition", 0, {
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
    }, "AgreementsApi", 0, ec, "ApiErrorResponseFromJSON", 0, function(e) {
        var n;
        return null == (n = e) ? n : {
            failureReason: (0, t.exists)(n, "failureReason") ? n.failureReason : void 0,
            errorMessage: (0, t.exists)(n, "errorMessage") ? n.errorMessage : void 0,
            errorCategory: (0, t.exists)(n, "errorCategory") ? n.errorCategory : void 0,
            rejectedContent: (0, t.exists)(n, "rejectedContent") ? null === n.rejectedContent ? null : n.rejectedContent.map(L) : void 0
        }
    }, "CancellationReason", 0, {
        None: "None",
        NoLongerPlanningToUseIp: "NoLongerPlanningToUseIp",
        NotReadyForProposedDates: "NotReadyForProposedDates"
    }, "ChangeRequestSubstatusType", 0, {
        None: "None",
        CreatorActionRequired: "CreatorActionRequired",
        IphActionRequired: "IphActionRequired"
    }, "ContentStandardAnswer", 0, {
        Yes: "Yes",
        No: "No",
        NotApplicable: "NotApplicable"
    }, "ContentStandardAnswerFromJSON", 0, function(e) {
        return e
    }, "ContentType", 0, {
        Universe: "Universe",
        User: "User",
        Group: "Group"
    }, "CreatorEarningsBucket", 0, {
        Invalid: "Invalid",
        Small: "Small",
        Medium: "Medium",
        Large: "Large",
        VeryLarge: "VeryLarge",
        NotApplicable: "NotApplicable"
    }, "CreatorType", 0, {
        User: "User",
        Group: "Group"
    }, "DauBucket", 0, {
        None: "None",
        Small: "Small",
        Large: "Large"
    }, "DisputeReason", 0, {
        IPNotUsed: "IPNotUsed",
        IPRemoved: "IPRemoved",
        FairUse: "FairUse"
    }, "EarningsApi", 0, eu, "IpRemovalAttestationStatus", 0, {
        None: "None",
        Pending: "Pending",
        Attested: "Attested",
        NotAttested: "NotAttested"
    }, "LLMModerationApi", 0, ed, "LicenseDurationType", 0, {
        Perpetual: "Perpetual",
        TimeLimited: "TimeLimited"
    }, "LicenseModerationStatus", 0, {
        Approved: "Approved",
        Pending: "Pending",
        Rejected: "Rejected",
        Archived: "Archived"
    }, "LicenseType", 0, {
        FullExperience: "FullExperience",
        CollaborationInExperienceSale: "CollaborationInExperienceSale",
        MarketplaceSale: "MarketplaceSale"
    }, "LicenseVisibility", 0, {
        Private: "Private",
        Public: "Public"
    }, "LicensesApi", 0, el, "LicensingDocumentsApi", 0, eg, "LifetimeVisitBucket", 0, {
        Small: "Small",
        Medium: "Medium",
        Large: "Large"
    }, "ListingStatus", 0, {
        Pending: "Pending",
        Approved: "Approved",
        Rejected: "Rejected",
        Archived: "Archived",
        Invalid: "Invalid",
        Published: "Published"
    }, "ListingVisibility", 0, {
        Private: "Private",
        Public: "Public",
        Unlisted: "Unlisted"
    }, "ListingsApi", 0, em, "ModerationStatus", 0, {
        Accepted: "Accepted",
        Rejected: "Rejected"
    }, "RecommendationsApi", 0, ep, "RejectionReason", 0, {
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
    }, "RequestedScanCandidatesApi", 0, eh, "ResellingPermission", 0, {
        Invalid: "Invalid",
        Allowed: "Allowed",
        Disallowed: "Disallowed",
        NotApplicable: "NotApplicable"
    }, "RevenueTargetType", 0, {
        Universe: "Universe",
        GamePass: "GamePass",
        DeveloperProduct: "DeveloperProduct",
        Collectible: "Collectible",
        DeveloperSubscription: "DeveloperSubscription"
    }, "SettingsApi", 0, ev, "UniverseContentMaturity", 0, {
        None: "None",
        Minimal: "Minimal",
        Mild: "Mild",
        Moderate: "Moderate",
        Restricted: "Restricted"
    }])
}]);

//# debugId=a21f94f8-c496-1e3e-75d0-34c53c78143c
//# sourceMappingURL=2boa65p4y1_0c.js.map