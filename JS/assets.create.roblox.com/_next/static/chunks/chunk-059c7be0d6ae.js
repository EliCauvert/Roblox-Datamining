;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "af111de2-3c5a-c5f7-4227-00865c661420")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 940194, e => {
    "use strict";
    var t = e.i(677753),
        i = function(e, t) {
            return (i = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i])
            })(e, t)
        };

    function n(e, t, i, n) {
        return new(i || (i = Promise))(function(o, r) {
            function s(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function a(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function u(e) {
                var t;
                e.done ? o(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(s, a)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var i, n, o, r = {
                label: 0,
                sent: function() {
                    if (1 & o[0]) throw o[1];
                    return o[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = a(0), s.throw = a(1), s.return = a(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function a(a) {
            return function(u) {
                var c = [a, u];
                if (i) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, c[0] && (r = 0)), r;) try {
                    if (i = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                    switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                        case 0:
                        case 1:
                            o = c;
                            break;
                        case 4:
                            return r.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = c[1], c = [0];
                            continue;
                        case 7:
                            c = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(o = (o = r.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                r.label = c[1];
                                break
                            }
                            if (6 === c[0] && r.label < o[1]) {
                                r.label = o[1], o = c;
                                break
                            }
                            if (o && r.label < o[2]) {
                                r.label = o[2], r.ops.push(c);
                                break
                            }
                            o[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    c = t.call(e, r)
                } catch (e) {
                    c = [6, e], n = 0
                } finally {
                    i = o = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function r(e, i) {
        return null == e ? e : {
            presence: (0, t.exists)(e, "presence") ? e.presence : void 0,
            hasAlcohol: (0, t.exists)(e, "hasAlcohol") ? e.hasAlcohol : void 0
        }
    }

    function s(e, i) {
        return null == e ? e : {
            realism: (0, t.exists)(e, "realism") ? e.realism : void 0,
            level: (0, t.exists)(e, "level") ? e.level : void 0,
            hasBlood: (0, t.exists)(e, "hasBlood") ? e.hasBlood : void 0
        }
    }

    function a(e, i) {
        return null == e ? e : {
            type: (0, t.exists)(e, "type") ? e.type : void 0,
            hasCrudeHumor: (0, t.exists)(e, "hasCrudeHumor") ? e.hasCrudeHumor : void 0
        }
    }

    function u(e, i) {
        return null == e ? e : {
            hasFear: (0, t.exists)(e, "hasFear") ? e.hasFear : void 0,
            frequency: (0, t.exists)(e, "frequency") ? e.frequency : void 0,
            intensity: (0, t.exists)(e, "intensity") ? e.intensity : void 0
        }
    }

    function c(e, i) {
        return null == e ? e : {
            hasFreeFormUserCreation: (0, t.exists)(e, "hasFreeFormUserCreation") ? e.hasFreeFormUserCreation : void 0,
            presence: (0, t.exists)(e, "presence") ? e.presence : void 0
        }
    }

    function d(e, i) {
        return null == e ? e : {
            type: (0, t.exists)(e, "type") ? e.type : void 0,
            hasGambling: (0, t.exists)(e, "hasGambling") ? e.hasGambling : void 0
        }
    }

    function l(e, i) {
        return null == e ? e : {
            type: (0, t.exists)(e, "type") ? e.type : void 0,
            hasRomance: (0, t.exists)(e, "hasRomance") ? e.hasRomance : void 0
        }
    }

    function v(e, i) {
        return null == e ? e : {
            hasSocialHangout: (0, t.exists)(e, "hasSocialHangout") ? e.hasSocialHangout : void 0,
            presence: (0, t.exists)(e, "presence") ? e.presence : void 0
        }
    }

    function p(e, i) {
        return null == e ? e : {
            presence: (0, t.exists)(e, "presence") ? e.presence : void 0,
            hasStrongLanguage: (0, t.exists)(e, "hasStrongLanguage") ? e.hasStrongLanguage : void 0
        }
    }

    function m(e, i) {
        return null == e ? e : {
            intensity: (0, t.exists)(e, "intensity") ? e.intensity : void 0,
            frequency: (0, t.exists)(e, "frequency") ? e.frequency : void 0,
            hasViolence: (0, t.exists)(e, "hasViolence") ? e.hasViolence : void 0
        }
    }

    function g(e, i) {
        return null == e ? e : {
            ageRecommendation: (0, t.exists)(e, "ageRecommendation") ? e.ageRecommendation : void 0,
            blood: (0, t.exists)(e, "blood") ? s(e.blood) : void 0,
            violence: (0, t.exists)(e, "violence") ? m(e.violence) : void 0,
            alcohol: (0, t.exists)(e, "alcohol") ? r(e.alcohol) : void 0,
            crudeHumor: (0, t.exists)(e, "crudeHumor") ? a(e.crudeHumor) : void 0,
            romance: (0, t.exists)(e, "romance") ? l(e.romance) : void 0,
            gambling: (0, t.exists)(e, "gambling") ? d(e.gambling) : void 0,
            strongLanguage: (0, t.exists)(e, "strongLanguage") ? p(e.strongLanguage) : void 0,
            fear: (0, t.exists)(e, "fear") ? u(e.fear) : void 0,
            socialHangout: (0, t.exists)(e, "socialHangout") ? v(e.socialHangout) : void 0,
            freeFormUserCreation: (0, t.exists)(e, "freeFormUserCreation") ? c(e.freeFormUserCreation) : void 0
        }
    }

    function h(e) {
        if (void 0 !== e) return null === e ? null : {
            labelId: e.labelId,
            targetId: e.targetId,
            targetType: e.targetType,
            values: e.values,
            attributes: e.attributes,
            fromNameLs: e.fromNameLs,
            typeLs: e.typeLs,
            omitAlignment: e.omitAlignment,
            rawLs: e.rawLs
        }
    }

    function y(e, i) {
        return null == e ? e : {
            type: (0, t.exists)(e, "Type") ? e.Type : void 0,
            sourceID: (0, t.exists)(e, "SourceID") ? e.SourceID : void 0,
            contentID: (0, t.exists)(e, "ContentID") ? e.ContentID : void 0,
            catalogID: (0, t.exists)(e, "CatalogID") ? e.CatalogID : void 0,
            catalog: (0, t.exists)(e, "Catalog") ? e.Catalog : void 0,
            mediaType: (0, t.exists)(e, "MediaType") ? e.MediaType : void 0,
            eTag: (0, t.exists)(e, "ETag") ? e.ETag : void 0,
            attributes: (0, t.exists)(e, "Attributes") ? e.Attributes : void 0
        }
    }

    function f(e, i) {
        return null == e ? e : {
            creatorOverratedAgeRecommendation: (0, t.exists)(e, "creatorOverratedAgeRecommendation") ? e.creatorOverratedAgeRecommendation : void 0
        }
    }

    function b(e) {
        var i;
        return null == (i = e) ? i : {
            descriptorName: (0, t.exists)(i, "descriptorName") ? i.descriptorName : void 0,
            reasoning: (0, t.exists)(i, "reasoning") ? i.reasoning : void 0
        }
    }

    function R(e) {
        var i, n, o, r;
        return null == (i = e) ? i : {
            regionalPolicy: (0, t.exists)(i, "regionalPolicy") ? null == (n = i.regionalPolicy) ? n : {
                region: (0, t.exists)(n, "region") ? null == (o = n.region) ? o : {
                    countryCode: (0, t.exists)(o, "countryCode") ? o.countryCode : void 0
                } : void 0,
                contentPolicy: (0, t.exists)(n, "contentPolicy") ? n.contentPolicy : void 0,
                ageRange: (0, t.exists)(n, "ageRange") ? null == (r = n.ageRange) ? r : {
                    minAgeInclusive: (0, t.exists)(r, "minAgeInclusive") ? r.minAgeInclusive : void 0,
                    maxAgeInclusive: (0, t.exists)(r, "maxAgeInclusive") ? r.maxAgeInclusive : void 0
                } : void 0
            } : void 0,
            compliance: (0, t.exists)(i, "compliance") ? i.compliance : void 0
        }
    }

    function x(e) {
        if (void 0 !== e) return null === e ? null : {
            decisionId: e.decisionId,
            reasons: e.reasons,
            associatedEntity: e.associatedEntity,
            deciderId: e.deciderId,
            deciderType: e.deciderType,
            idempotencyKey: e.idempotencyKey,
            ticketId: e.ticketId,
            runId: e.runId,
            correlationId: e.correlationId,
            annotations: void 0 === e.annotations ? void 0 : e.annotations.map(h),
            custom: e.custom
        }
    }

    function I(e) {
        var i;
        return null == (i = e) ? i : {
            displayName: (0, t.exists)(i, "displayName") ? i.displayName : void 0,
            minimumAge: (0, t.exists)(i, "minimumAge") ? i.minimumAge : void 0,
            displayNameWithHeaderShort: (0, t.exists)(i, "displayNameWithHeaderShort") ? i.displayNameWithHeaderShort : void 0,
            minimumAgeDisplay: (0, t.exists)(i, "minimumAgeDisplay") ? i.minimumAgeDisplay : void 0,
            contentMaturity: (0, t.exists)(i, "contentMaturity") ? i.contentMaturity : void 0,
            igrsRating: (0, t.exists)(i, "igrsRating") ? i.igrsRating : void 0,
            igrsRatingDisplayMessage: (0, t.exists)(i, "igrsRatingDisplayMessage") ? i.igrsRatingDisplayMessage : void 0
        }
    }

    function w(e) {
        if (void 0 !== e) return null === e ? null : {
            displayName: e.displayName,
            minimumAge: e.minimumAge,
            displayNameWithHeaderShort: e.displayNameWithHeaderShort,
            minimumAgeDisplay: e.minimumAgeDisplay,
            contentMaturity: e.contentMaturity,
            igrsRating: e.igrsRating,
            igrsRatingDisplayMessage: e.igrsRatingDisplayMessage
        }
    }

    function A(e, i) {
        return null == e ? e : {
            ageRecommendation: (0, t.exists)(e, "ageRecommendation") ? I(e.ageRecommendation) : void 0
        }
    }

    function D(e, i) {
        return null == e ? e : {
            name: (0, t.exists)(e, "name") ? e.name : void 0,
            displayName: (0, t.exists)(e, "displayName") ? e.displayName : void 0,
            complianceApiSupported: (0, t.exists)(e, "complianceApiSupported") ? e.complianceApiSupported : void 0,
            iconUrl: (0, t.exists)(e, "iconUrl") ? e.iconUrl : void 0
        }
    }

    function C(e) {
        var i;
        return null == (i = e) ? i : {
            dimensionName: (0, t.exists)(i, "dimensionName") ? i.dimensionName : void 0,
            dimensionValue: (0, t.exists)(i, "dimensionValue") ? i.dimensionValue : void 0
        }
    }

    function T(e) {
        if (void 0 !== e) return null === e ? null : {
            dimensionName: e.dimensionName,
            dimensionValue: e.dimensionValue
        }
    }

    function S(e) {
        var i, n;
        return null == (i = e) ? i : {
            name: (0, t.exists)(i, "name") ? i.name : void 0,
            followsComplianceApiNull: (0, t.exists)(i, "followsComplianceApiNull") ? i.followsComplianceApiNull : void 0,
            followsComplianceApiValue: (0, t.exists)(i, "followsComplianceApiValue") ? i.followsComplianceApiValue : void 0,
            experienceDescriptor: (0, t.exists)(i, "experienceDescriptor") ? D(i.experienceDescriptor) : void 0,
            experienceDescriptorDimensionUsages: (0, t.exists)(i, "experienceDescriptorDimensionUsages") ? i.experienceDescriptorDimensionUsages.map(C) : void 0,
            contains: (0, t.exists)(i, "contains") ? i.contains : void 0,
            ageRange: (0, t.exists)(i, "ageRange") ? null == (n = i.ageRange) ? n : {
                minAgeInclusive: (0, t.exists)(n, "minAgeInclusive") ? n.minAgeInclusive : void 0,
                maxAgeInclusive: (0, t.exists)(n, "maxAgeInclusive") ? n.maxAgeInclusive : void 0
            } : void 0,
            descriptorDisplayName: (0, t.exists)(i, "descriptorDisplayName") ? i.descriptorDisplayName : void 0,
            ageRangeDisplayName: (0, t.exists)(i, "ageRangeDisplayName") ? i.ageRangeDisplayName : void 0
        }
    }

    function P(e) {
        if (void 0 !== e) return null === e ? null : {
            name: e.name,
            followsComplianceApiNull: e.followsComplianceApiNull,
            followsComplianceApiValue: e.followsComplianceApiValue,
            experienceDescriptor: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    name: e.name,
                    displayName: e.displayName,
                    complianceApiSupported: e.complianceApiSupported,
                    iconUrl: e.iconUrl
                }
            }(e.experienceDescriptor),
            experienceDescriptorDimensionUsages: void 0 === e.experienceDescriptorDimensionUsages ? void 0 : e.experienceDescriptorDimensionUsages.map(T),
            contains: e.contains,
            ageRange: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    minAgeInclusive: e.minAgeInclusive,
                    maxAgeInclusive: e.maxAgeInclusive
                }
            }(e.ageRange),
            descriptorDisplayName: e.descriptorDisplayName,
            ageRangeDisplayName: e.ageRangeDisplayName
        }
    }

    function N(e, i) {
        return null == e ? e : {
            items: (0, t.exists)(e, "items") ? e.items.map(S) : void 0
        }
    }

    function O(e, i) {
        return null == e ? e : {
            ageRecommendationSummary: (0, t.exists)(e, "ageRecommendationSummary") ? A(e.ageRecommendationSummary) : void 0,
            experienceDescriptorUsages: (0, t.exists)(e, "experienceDescriptorUsages") ? N(e.experienceDescriptorUsages) : void 0
        }
    }

    function E(e) {
        var i;
        return null == (i = e) ? i : {
            ageRecommendationDetails: (0, t.exists)(i, "ageRecommendationDetails") ? O(i.ageRecommendationDetails) : void 0,
            universeId: (0, t.exists)(i, "universeId") ? i.universeId : void 0
        }
    }

    function U(e) {
        var i;
        return null == (i = e) ? i : {
            universeId: (0, t.exists)(i, "universeId") ? i.universeId : void 0,
            isEligible: (0, t.exists)(i, "isEligible") ? i.isEligible : void 0,
            details: (0, t.exists)(i, "details") ? i.details : void 0
        }
    }

    function q(e) {
        if (void 0 !== e) return null === e ? null : {
            universeId: e.universeId,
            isEligible: e.isEligible,
            details: e.details
        }
    }

    function G(e) {
        if (void 0 !== e) return null === e ? null : {
            labelId: e.labelId,
            targetId: e.targetId,
            targetType: e.targetType,
            values: e.values,
            attributes: e.attributes,
            fromNameLs: e.fromNameLs,
            typeLs: e.typeLs,
            rawLs: e.rawLs
        }
    }

    function M(e) {
        var i;
        return null == (i = e) ? i : {
            countryCode: (0, t.exists)(i, "countryCode") ? i.countryCode : void 0,
            countryName: (0, t.exists)(i, "countryName") ? i.countryName : void 0
        }
    }

    function L(e) {
        var i;
        return null == (i = e) ? i : {
            userId: (0, t.exists)(i, "userId") ? i.userId : void 0,
            userIsEligible: (0, t.exists)(i, "userIsEligible") ? i.userIsEligible : void 0,
            displayText: (0, t.exists)(i, "displayText") ? i.displayText : void 0,
            ineligibilityReason: (0, t.exists)(i, "ineligibilityReason") ? i.ineligibilityReason : void 0
        }
    }

    function B(e) {
        var i;
        return null == (i = e) ? i : {
            creatorOverratedAgeRecommendation: (0, t.exists)(i, "creatorOverratedAgeRecommendation") ? I(i.creatorOverratedAgeRecommendation) : void 0,
            allowedCreatorOverratedAgeRecommendations: (0, t.exists)(i, "allowedCreatorOverratedAgeRecommendations") ? i.allowedCreatorOverratedAgeRecommendations.map(I) : void 0
        }
    }

    function k(e) {
        var i;
        return null == (i = e) ? i : {
            name: (0, t.exists)(i, "name") ? i.name : void 0,
            followsComplianceApi: (0, t.exists)(i, "followsComplianceApi") ? i.followsComplianceApi : void 0,
            descriptor: (0, t.exists)(i, "descriptor") ? D(i.descriptor) : void 0,
            descriptorDimensionUsages: (0, t.exists)(i, "descriptorDimensionUsages") ? i.descriptorDimensionUsages.map(C) : void 0,
            contains: (0, t.exists)(i, "contains") ? i.contains : void 0
        }
    }

    function _(e) {
        var i;
        return null == (i = e) ? i : {
            descriptorName: (0, t.exists)(i, "descriptorName") ? i.descriptorName : void 0,
            reasoning: (0, t.exists)(i, "reasoning") ? i.reasoning : void 0
        }
    }

    function V(e) {
        var i;
        return null == (i = e) ? i : {
            countryCode: (0, t.exists)(i, "countryCode") ? i.countryCode : void 0,
            experienceDescriptorUsages: (0, t.exists)(i, "experienceDescriptorUsages") ? i.experienceDescriptorUsages.map(S) : void 0,
            countryDisplayName: (0, t.exists)(i, "countryDisplayName") ? i.countryDisplayName : void 0
        }
    }

    function H(e) {
        var i;
        return null == (i = e) ? i : {
            displayName: (0, t.exists)(i, "displayName") ? i.displayName : void 0,
            minimumAge: (0, t.exists)(i, "minimumAge") ? i.minimumAge : void 0,
            displayNameWithHeaderShort: (0, t.exists)(i, "displayNameWithHeaderShort") ? i.displayNameWithHeaderShort : void 0,
            minimumAgeDisplay: (0, t.exists)(i, "minimumAgeDisplay") ? i.minimumAgeDisplay : void 0,
            contentMaturity: (0, t.exists)(i, "contentMaturity") ? i.contentMaturity : void 0,
            igrsRating: (0, t.exists)(i, "igrsRating") ? i.igrsRating : void 0,
            igrsRatingDisplayMessage: (0, t.exists)(i, "igrsRatingDisplayMessage") ? i.igrsRatingDisplayMessage : void 0
        }
    }

    function J(e) {
        var i;
        return null == (i = e) ? i : {
            dimensionName: (0, t.exists)(i, "dimensionName") ? i.dimensionName : void 0,
            dimensionValue: (0, t.exists)(i, "dimensionValue") ? i.dimensionValue : void 0
        }
    }

    function j(e) {
        var i, n, o;
        return null == (i = e) ? i : {
            name: (0, t.exists)(i, "name") ? i.name : void 0,
            followsComplianceApiNull: (0, t.exists)(i, "followsComplianceApiNull") ? i.followsComplianceApiNull : void 0,
            followsComplianceApiValue: (0, t.exists)(i, "followsComplianceApiValue") ? i.followsComplianceApiValue : void 0,
            experienceDescriptor: (0, t.exists)(i, "experienceDescriptor") ? null == (n = i.experienceDescriptor) ? n : {
                name: (0, t.exists)(n, "name") ? n.name : void 0,
                displayName: (0, t.exists)(n, "displayName") ? n.displayName : void 0,
                complianceApiSupported: (0, t.exists)(n, "complianceApiSupported") ? n.complianceApiSupported : void 0,
                iconUrl: (0, t.exists)(n, "iconUrl") ? n.iconUrl : void 0
            } : void 0,
            experienceDescriptorDimensionUsages: (0, t.exists)(i, "experienceDescriptorDimensionUsages") ? i.experienceDescriptorDimensionUsages.map(J) : void 0,
            contains: (0, t.exists)(i, "contains") ? i.contains : void 0,
            ageRange: (0, t.exists)(i, "ageRange") ? null == (o = i.ageRange) ? o : {
                minAgeInclusive: (0, t.exists)(o, "minAgeInclusive") ? o.minAgeInclusive : void 0,
                maxAgeInclusive: (0, t.exists)(o, "maxAgeInclusive") ? o.maxAgeInclusive : void 0
            } : void 0,
            descriptorDisplayName: (0, t.exists)(i, "descriptorDisplayName") ? i.descriptorDisplayName : void 0,
            ageRangeDisplayName: (0, t.exists)(i, "ageRangeDisplayName") ? i.ageRangeDisplayName : void 0
        }
    }

    function W(e, i) {
        return null == e ? e : {
            items: (0, t.exists)(e, "items") ? e.items.map(j) : void 0
        }
    }

    function F(e, i) {
        return null == e ? e : {
            contentId: (0, t.exists)(e, "contentId") ? e.contentId : void 0,
            widthPx: (0, t.exists)(e, "widthPx") ? e.widthPx : void 0,
            heightPx: (0, t.exists)(e, "heightPx") ? e.heightPx : void 0,
            aspectRatio: (0, t.exists)(e, "aspectRatio") ? e.aspectRatio : void 0,
            contentSource: (0, t.exists)(e, "contentSource") ? e.contentSource : void 0
        }
    }

    function z(e) {
        var i, n, o, r;
        return null == (i = e) ? i : {
            sourceType: (0, t.exists)(i, "sourceType") ? i.sourceType : void 0,
            source: (0, t.exists)(i, "source") ? i.source : void 0,
            rating: (0, t.exists)(i, "rating") ? i.rating : void 0,
            fullIconVariant: (0, t.exists)(i, "fullIconVariant") ? F(i.fullIconVariant) : void 0,
            minimizedIconVariant: (0, t.exists)(i, "minimizedIconVariant") ? F(i.minimizedIconVariant) : void 0,
            localizedDescriptorStrings: (0, t.exists)(i, "localizedDescriptorStrings") ? i.localizedDescriptorStrings : void 0,
            universeId: (0, t.exists)(i, "universeId") ? i.universeId : void 0,
            iarc: (0, t.exists)(i, "iarc") ? null == (n = i.iarc) ? n : {
                raid: (0, t.exists)(n, "raid") ? n.raid : void 0,
                ageId: (0, t.exists)(n, "ageId") ? n.ageId : void 0,
                productId: (0, t.exists)(n, "productId") ? n.productId : void 0,
                interactiveElementsStrings: (0, t.exists)(n, "interactiveElementsStrings") ? n.interactiveElementsStrings : void 0
            } : void 0,
            contentMaturity: (0, t.exists)(i, "contentMaturity") ? null == (o = i.contentMaturity) ? o : {
                creatorOverrides: (0, t.exists)(o, "creatorOverrides") ? o.creatorOverrides : void 0
            } : void 0,
            vng: (0, t.exists)(i, "vng") ? null == (r = i.vng) ? r : {
                minimumAge: (0, t.exists)(r, "minimumAge") ? r.minimumAge : void 0
            } : void 0
        }
    }

    function Y(e) {
        var i;
        return null == (i = e) ? i : {
            name: (0, t.exists)(i, "name") ? i.name : void 0,
            iarcId: (0, t.exists)(i, "iarcId") ? i.iarcId : void 0
        }
    }

    function K(e) {
        var i;
        return null == (i = e) ? i : {
            descriptorName: (0, t.exists)(i, "descriptorName") ? i.descriptorName : void 0,
            reasoning: (0, t.exists)(i, "reasoning") ? i.reasoning : void 0
        }
    }

    function Q(e) {
        var i;
        return null == (i = e) ? i : {
            countryCode: (0, t.exists)(i, "countryCode") ? i.countryCode : void 0,
            experienceDescriptorUsages: (0, t.exists)(i, "experienceDescriptorUsages") ? i.experienceDescriptorUsages.map(j) : void 0,
            countryDisplayName: (0, t.exists)(i, "countryDisplayName") ? i.countryDisplayName : void 0
        }
    }

    function X(e) {
        var i;
        return null == (i = e) ? i : {
            interactiveElementID: (0, t.exists)(i, "interactiveElementID") ? i.interactiveElementID : void 0,
            interactiveElementText: (0, t.exists)(i, "interactiveElementText") ? i.interactiveElementText : void 0,
            localizedDisplayText: (0, t.exists)(i, "localizedDisplayText") ? i.localizedDisplayText : void 0
        }
    }

    function Z(e) {
        var i;
        return null == (i = e) ? i : {
            descriptorID: (0, t.exists)(i, "descriptorID") ? i.descriptorID : void 0,
            descriptorText: (0, t.exists)(i, "descriptorText") ? i.descriptorText : void 0,
            localizedDisplayText: (0, t.exists)(i, "localizedDisplayText") ? i.localizedDisplayText : void 0
        }
    }

    function $(e) {
        var i;
        return null == (i = e) ? i : {
            ratingAuthorityID: (0, t.exists)(i, "ratingAuthorityID") ? i.ratingAuthorityID : void 0,
            ratingAuthorityShortText: (0, t.exists)(i, "ratingAuthorityShortText") ? i.ratingAuthorityShortText : void 0,
            localizedDisplayText: (0, t.exists)(i, "localizedDisplayText") ? i.localizedDisplayText : void 0,
            ageRatingID: (0, t.exists)(i, "ageRatingID") ? i.ageRatingID : void 0,
            ageRatingShortText: (0, t.exists)(i, "ageRatingShortText") ? i.ageRatingShortText : void 0,
            ageRatingIconUrl: (0, t.exists)(i, "ageRatingIconUrl") ? i.ageRatingIconUrl : void 0,
            numericLevel: (0, t.exists)(i, "numericLevel") ? i.numericLevel : void 0,
            descriptorList: (0, t.exists)(i, "descriptorList") ? i.descriptorList.map(Z) : void 0,
            locked: (0, t.exists)(i, "locked") ? i.locked : void 0,
            interactiveElementList: (0, t.exists)(i, "interactiveElementList") ? i.interactiveElementList.map(X) : void 0,
            localizedRegionText: (0, t.exists)(i, "localizedRegionText") ? i.localizedRegionText : void 0
        }
    }

    function ee(e) {
        var i, n;
        return null == (i = e) ? i : {
            productId: (0, t.exists)(i, "productId") ? i.productId : void 0,
            certId: (0, t.exists)(i, "certId") ? i.certId : void 0,
            relevantDescriptors: (0, t.exists)(i, "relevantDescriptors") ? i.relevantDescriptors : void 0,
            iarcProduct: (0, t.exists)(i, "iarcProduct") ? null == (n = i.iarcProduct) ? n : {
                interactiveElementList: (0, t.exists)(n, "interactiveElementList") ? n.interactiveElementList.map(X) : void 0,
                ratingList: (0, t.exists)(n, "ratingList") ? n.ratingList.map($) : void 0,
                ratingLogicVersion: (0, t.exists)(n, "ratingLogicVersion") ? n.ratingLogicVersion : void 0,
                orcVersion: (0, t.exists)(n, "orcVersion") ? n.orcVersion : void 0,
                descriptors: (0, t.exists)(n, "descriptors") ? n.descriptors.map(Y) : void 0
            } : void 0
        }
    }
    var et = function(e) {
        function h() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            i(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(h, e), h.prototype.v1AgeRecommendationsUniverseIdGetRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1AgeRecommendationsUniverseIdGet.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/age-recommendations/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/age-recommendations/{universeId}",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    ageRecommendationDetails: (0, t.exists)(e, "ageRecommendationDetails") ? g(e.ageRecommendationDetails) : void 0,
                                    creatorOverrides: (0, t.exists)(e, "creatorOverrides") ? f(e.creatorOverrides) : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1AgeRecommendationsUniverseIdGet = function(e, t) {
            return n(this, void 0, void 0, function() {
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1AgeRecommendationsUniverseIdGetRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1ContentSuitabilityUniverseIdGetRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, h, y;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1ContentSuitabilityUniverseIdGet.");
                            return n = {}, h = {}, [4, this.request({
                                path: "/v1/content-suitability/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/content-suitability/{universeId}",
                                method: "GET",
                                headers: h,
                                query: n
                            }, i)];
                        case 1:
                            return y = o.sent(), [2, new t.JSONApiResponse(y, function(e) {
                                var i, n, o, h, y, x;
                                return null == e ? e : {
                                    contentSuitability: (0, t.exists)(e, "contentSuitability") ? null == (i = e.contentSuitability) ? i : {
                                        universeId: (0, t.exists)(i, "universeId") ? i.universeId : void 0,
                                        ageRecommendationDetails: (0, t.exists)(i, "ageRecommendationDetails") ? g(i.ageRecommendationDetails) : void 0,
                                        nonCompliantRegions: (0, t.exists)(i, "nonCompliantRegions") ? null == (n = i.nonCompliantRegions) ? n : {
                                            regions: (0, t.exists)(n, "regions") ? n.regions.map(R) : void 0,
                                            paidItemTrading: (0, t.exists)(n, "paidItemTrading") ? null == (o = n.paidItemTrading) ? o : {
                                                status: (0, t.exists)(o, "status") ? o.status : void 0,
                                                hasPaidItemTrading: (0, t.exists)(o, "hasPaidItemTrading") ? o.hasPaidItemTrading : void 0
                                            } : void 0,
                                            paidRandomItems: (0, t.exists)(n, "paidRandomItems") ? null == (h = n.paidRandomItems) ? h : {
                                                status: (0, t.exists)(h, "status") ? h.status : void 0,
                                                hasPaidRandomItems: (0, t.exists)(h, "hasPaidRandomItems") ? h.hasPaidRandomItems : void 0
                                            } : void 0
                                        } : void 0,
                                        moderation: (0, t.exists)(i, "moderation") ? null == (y = i.moderation) ? y : {
                                            status: (0, t.exists)(y, "status") ? y.status : void 0,
                                            decisions: (0, t.exists)(y, "decisions") ? null == (x = y.decisions) ? x : {
                                                blood: (0, t.exists)(x, "blood") ? s(x.blood) : void 0,
                                                violence: (0, t.exists)(x, "violence") ? m(x.violence) : void 0,
                                                alcohol: (0, t.exists)(x, "alcohol") ? r(x.alcohol) : void 0,
                                                crudeHumor: (0, t.exists)(x, "crudeHumor") ? a(x.crudeHumor) : void 0,
                                                romance: (0, t.exists)(x, "romance") ? l(x.romance) : void 0,
                                                gambling: (0, t.exists)(x, "gambling") ? d(x.gambling) : void 0,
                                                strongLanguage: (0, t.exists)(x, "strongLanguage") ? p(x.strongLanguage) : void 0,
                                                fear: (0, t.exists)(x, "fear") ? u(x.fear) : void 0,
                                                socialHangout: (0, t.exists)(x, "socialHangout") ? v(x.socialHangout) : void 0,
                                                freeFormUserCreation: (0, t.exists)(x, "freeFormUserCreation") ? c(x.freeFormUserCreation) : void 0
                                            } : void 0,
                                            moderatorReasoning: (0, t.exists)(y, "moderatorReasoning") ? y.moderatorReasoning.map(b) : void 0
                                        } : void 0,
                                        creatorOverrides: (0, t.exists)(i, "creatorOverrides") ? f(i.creatorOverrides) : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1ContentSuitabilityUniverseIdGet = function(e, t) {
            return n(this, void 0, void 0, function() {
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1ContentSuitabilityUniverseIdGetRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1MetadataGetRaw = function(e) {
            return n(this, void 0, void 0, function() {
                var i, n, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/metadata",
                                schemaPath: "/v1/metadata",
                                method: "GET",
                                headers: n,
                                query: i
                            }, e)];
                        case 1:
                            return r = o.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    isSurfacingGuidelinesForUserEnabled: (0, t.exists)(e, "isSurfacingGuidelinesForUserEnabled") ? e.isSurfacingGuidelinesForUserEnabled : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1MetadataGet = function(e) {
            return n(this, void 0, void 0, function() {
                return o(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1MetadataGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, h.prototype.v1ModerationApplySequestrationBypassHookPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/moderation/apply-sequestration-bypass-hook",
                                schemaPath: "/v1/moderation/apply-sequestration-bypass-hook",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: x(e.moderationDecisionHookRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s)]
                    }
                })
            })
        }, h.prototype.v1ModerationApplySequestrationBypassHookPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1ModerationApplySequestrationBypassHookPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1ModerationDecisionWebhookPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/moderation/decision-webhook",
                                schemaPath: "/v1/moderation/decision-webhook",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: x(e.moderationDecisionHookRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s)]
                    }
                })
            })
        }, h.prototype.v1ModerationDecisionWebhookPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1ModerationDecisionWebhookPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1ModerationGracePeriodDecisionHookPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/moderation/grace-period-decision-hook",
                                schemaPath: "/v1/moderation/grace-period-decision-hook",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: x(e.moderationDecisionHookRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s)]
                    }
                })
            })
        }, h.prototype.v1ModerationGracePeriodDecisionHookPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1ModerationGracePeriodDecisionHookPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1ModerationModeratorLabelSubmissionHookPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/moderation/moderator-label-submission-hook",
                                schemaPath: "/v1/moderation/moderator-label-submission-hook",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: x(e.moderationDecisionHookRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s)]
                    }
                })
            })
        }, h.prototype.v1ModerationModeratorLabelSubmissionHookPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1ModerationModeratorLabelSubmissionHookPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1ModerationPatchCatalogContentWebhookPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/moderation/patch-catalog-content-webhook",
                                schemaPath: "/v1/moderation/patch-catalog-content-webhook",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: x(e.moderationDecisionHookRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, h.prototype.v1ModerationPatchCatalogContentWebhookPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1ModerationPatchCatalogContentWebhookPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1ModerationSfcCreateContentMaturityTicketDecisionHookPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/moderation/sfc-create-content-maturity-ticket-decision-hook",
                                schemaPath: "/v1/moderation/sfc-create-content-maturity-ticket-decision-hook",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: x(e.moderationDecisionHookRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s)]
                    }
                })
            })
        }, h.prototype.v1ModerationSfcCreateContentMaturityTicketDecisionHookPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1ModerationSfcCreateContentMaturityTicketDecisionHookPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1ModerationUpdateCatalogContentWebhookPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/moderation/update-catalog-content-webhook",
                                schemaPath: "/v1/moderation/update-catalog-content-webhook",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: x(e.moderationDecisionHookRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, h.prototype.v1ModerationUpdateCatalogContentWebhookPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1ModerationUpdateCatalogContentWebhookPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1AgeRecommendationPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/age-recommendation",
                                schemaPath: "/v1beta1/age-recommendation",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId
                                    }
                                }(e.v1Beta1GetAgeRecommendationsRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                var i;
                                return null == e ? e : {
                                    ageRecommendationDetails: (0, t.exists)(e, "ageRecommendationDetails") ? null == (i = e.ageRecommendationDetails) ? i : {
                                        summary: (0, t.exists)(i, "summary") ? A(i.summary) : void 0,
                                        descriptorUsages: (0, t.exists)(i, "descriptorUsages") ? i.descriptorUsages.map(k) : void 0
                                    } : void 0,
                                    contentLanguage: (0, t.exists)(e, "contentLanguage") ? e.contentLanguage : void 0,
                                    headerDisplayName: (0, t.exists)(e, "headerDisplayName") ? e.headerDisplayName : void 0,
                                    headerDisplayNameShort: (0, t.exists)(e, "headerDisplayNameShort") ? e.headerDisplayNameShort : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1beta1AgeRecommendationPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1AgeRecommendationPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1BuildGeneratedRatingPreviewPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/build-generated-rating/preview",
                                schemaPath: "/v1beta1/build-generated-rating/preview",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        localeCode: e.localeCode
                                    }
                                }(e.v1Beta1PreviewBuildGeneratedRatingRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    ageRecommendationDetails: (0, t.exists)(e, "ageRecommendationDetails") ? O(e.ageRecommendationDetails) : void 0,
                                    restrictedCountries: (0, t.exists)(e, "restrictedCountries") ? e.restrictedCountries.map(V) : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1beta1BuildGeneratedRatingPreviewPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1BuildGeneratedRatingPreviewPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1BuildGeneratedRatingSubmitPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/build-generated-rating/submit",
                                schemaPath: "/v1beta1/build-generated-rating/submit",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId
                                    }
                                }(e.v1Beta1SubmitBuildGeneratedRatingRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s)]
                    }
                })
            })
        }, h.prototype.v1beta1BuildGeneratedRatingSubmitPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1BuildGeneratedRatingSubmitPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1ContextualPlayabilityPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/contextual-playability",
                                schemaPath: "/v1beta1/contextual-playability",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        countryCode: e.countryCode,
                                        userId: e.userId
                                    }
                                }(e.v1Beta1GetContextualPlayabilityRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    reasonBlocked: (0, t.exists)(e, "reasonBlocked") ? e.reasonBlocked : void 0,
                                    reasonDisplayText: (0, t.exists)(e, "reasonDisplayText") ? e.reasonDisplayText : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1beta1ContextualPlayabilityPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1ContextualPlayabilityPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1CountriesGetRaw = function(e) {
            return n(this, void 0, void 0, function() {
                var i, n, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1beta1/countries",
                                schemaPath: "/v1beta1/countries",
                                method: "GET",
                                headers: n,
                                query: i
                            }, e)];
                        case 1:
                            return r = o.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    countries: (0, t.exists)(e, "countries") ? e.countries.map(M) : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1beta1CountriesGet = function(e) {
            return n(this, void 0, void 0, function() {
                return o(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1beta1CountriesGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1CreatorControlsAgeRestrictionUniverseIdGetRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1beta1CreatorControlsAgeRestrictionUniverseIdGet.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1beta1/creator-controls-age-restriction/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1beta1/creator-controls-age-restriction/{universeId}",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                var i;
                                return null == e ? e : {
                                    ageRestriction: (0, t.exists)(e, "ageRestriction") ? null == (i = e.ageRestriction) ? i : {
                                        minimumAge: (0, t.exists)(i, "minimumAge") ? i.minimumAge : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1beta1CreatorControlsAgeRestrictionUniverseIdGet = function(e, t) {
            return n(this, void 0, void 0, function() {
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1CreatorControlsAgeRestrictionUniverseIdGetRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1CreatorControlsAgeRestrictionUniverseIdPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1beta1CreatorControlsAgeRestrictionUniverseIdPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/creator-controls-age-restriction/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1beta1/creator-controls-age-restriction/{universeId}",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        ageRestriction: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                minimumAge: e.minimumAge
                                            }
                                        }(e.ageRestriction)
                                    }
                                }(e.v1Beta1SaveCreatorControlsAgeRestrictionRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s)]
                    }
                })
            })
        }, h.prototype.v1beta1CreatorControlsAgeRestrictionUniverseIdPost = function(e, t) {
            return n(this, void 0, void 0, function() {
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1CreatorControlsAgeRestrictionUniverseIdPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1CreatorControlsGeoRestrictionUniverseIdGetRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1beta1CreatorControlsGeoRestrictionUniverseIdGet.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1beta1/creator-controls-geo-restriction/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1beta1/creator-controls-geo-restriction/{universeId}",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                var i;
                                return null == e ? e : {
                                    geoRestriction: (0, t.exists)(e, "geoRestriction") ? null == (i = e.geoRestriction) ? i : {
                                        restrictedCountries: (0, t.exists)(i, "restrictedCountries") ? i.restrictedCountries : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1beta1CreatorControlsGeoRestrictionUniverseIdGet = function(e, t) {
            return n(this, void 0, void 0, function() {
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1CreatorControlsGeoRestrictionUniverseIdGetRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1CreatorControlsGeoRestrictionUniverseIdPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1beta1CreatorControlsGeoRestrictionUniverseIdPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/creator-controls-geo-restriction/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1beta1/creator-controls-geo-restriction/{universeId}",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        geoRestriction: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                restrictedCountries: e.restrictedCountries
                                            }
                                        }(e.geoRestriction)
                                    }
                                }(e.v1Beta1SaveCreatorControlsGeoRestrictionRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s)]
                    }
                })
            })
        }, h.prototype.v1beta1CreatorControlsGeoRestrictionUniverseIdPost = function(e, t) {
            return n(this, void 0, void 0, function() {
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1CreatorControlsGeoRestrictionUniverseIdPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1CreatorOverridesPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/creator-overrides",
                                schemaPath: "/v1beta1/creator-overrides",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        creatorOverrides: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                creatorOverratedAgeRecommendation: w(e.creatorOverratedAgeRecommendation),
                                                allowedCreatorOverratedAgeRecommendations: void 0 === e.allowedCreatorOverratedAgeRecommendations ? void 0 : e.allowedCreatorOverratedAgeRecommendations.map(w)
                                            }
                                        }(e.creatorOverrides)
                                    }
                                }(e.v1Beta1SaveCreatorOverridesRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s)]
                    }
                })
            })
        }, h.prototype.v1beta1CreatorOverridesPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1CreatorOverridesPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1DetailedGuidelinesPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/detailed-guidelines",
                                schemaPath: "/v1beta1/detailed-guidelines",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId
                                    }
                                }(e.v1Beta1GetDetailedGuidelinesRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                var i;
                                return null == e ? e : {
                                    ageRecommendationDetails: (0, t.exists)(e, "ageRecommendationDetails") ? O(e.ageRecommendationDetails) : void 0,
                                    restrictedCountries: (0, t.exists)(e, "restrictedCountries") ? e.restrictedCountries.map(V) : void 0,
                                    contentLanguage: (0, t.exists)(e, "contentLanguage") ? e.contentLanguage : void 0,
                                    moderation: (0, t.exists)(e, "moderation") ? null == (i = e.moderation) ? i : {
                                        moderationStatus: (0, t.exists)(i, "moderationStatus") ? i.moderationStatus : void 0,
                                        creatorUsages: (0, t.exists)(i, "creatorUsages") ? N(i.creatorUsages) : void 0,
                                        moderatorUsages: (0, t.exists)(i, "moderatorUsages") ? N(i.moderatorUsages) : void 0,
                                        moderatorReasoning: (0, t.exists)(i, "moderatorReasoning") ? i.moderatorReasoning.map(_) : void 0
                                    } : void 0,
                                    creatorOverrides: (0, t.exists)(e, "creatorOverrides") ? B(e.creatorOverrides) : void 0,
                                    submitBy: (0, t.exists)(e, "submitBy") ? e.submitBy : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1beta1DetailedGuidelinesPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1DetailedGuidelinesPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1ExperienceDescriptorsSavePostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/experience-descriptors/save",
                                schemaPath: "/v1beta1/experience-descriptors/save",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        decisionId: e.decisionId,
                                        decisionEventId: e.decisionEventId,
                                        idempotencyKey: e.idempotencyKey,
                                        reasons: e.reasons,
                                        associatedEntity: e.associatedEntity,
                                        deciderId: e.deciderId,
                                        deciderType: e.deciderType,
                                        ticketId: e.ticketId,
                                        annotations: void 0 === e.annotations ? void 0 : e.annotations.map(G),
                                        rawLs: e.rawLs,
                                        category: e.category,
                                        runId: e.runId,
                                        user: e.user,
                                        report: e.report,
                                        appeal: e.appeal,
                                        content: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                id: e.id,
                                                type: e.type,
                                                updateTime: e.updateTime,
                                                custom: e.custom,
                                                userId: e.userId,
                                                locale: e.locale,
                                                contentType: e.contentType,
                                                mediaType: e.mediaType
                                            }
                                        }(e.content),
                                        custom: e.custom
                                    }
                                }(e.v1Beta1SaveExperienceDescriptorUsagesWebhookRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s)]
                    }
                })
            })
        }, h.prototype.v1beta1ExperienceDescriptorsSavePost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1ExperienceDescriptorsSavePostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1IncreaseMaturityAllUniverseEligibilityGetRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/increase-maturity/all-universe-eligibility",
                                schemaPath: "/v1beta1/increase-maturity/all-universe-eligibility",
                                method: "GET",
                                headers: r,
                                query: n,
                                body: e.body
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    universeEligibilities: (0, t.exists)(e, "universeEligibilities") ? e.universeEligibilities.map(U) : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1beta1IncreaseMaturityAllUniverseEligibilityGet = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1IncreaseMaturityAllUniverseEligibilityGetRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1IncreaseMaturityUniverseEligibilityPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/increase-maturity/universe-eligibility",
                                schemaPath: "/v1beta1/increase-maturity/universe-eligibility",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeEligibilities: void 0 === e.universeEligibilities ? void 0 : e.universeEligibilities.map(q)
                                    }
                                }(e.v1Beta1SetUniverseAgeUpEligibilityRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    failedUniverseIds: (0, t.exists)(e, "failedUniverseIds") ? e.failedUniverseIds : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1beta1IncreaseMaturityUniverseEligibilityPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1IncreaseMaturityUniverseEligibilityPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1IncreaseMaturityUniverseEligibilityUniverseIdGetRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1beta1IncreaseMaturityUniverseEligibilityUniverseIdGet.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/increase-maturity/universe-eligibility/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1beta1/increase-maturity/universe-eligibility/{universeId}",
                                method: "GET",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId
                                    }
                                }(e.v1Beta1GetUniverseAgeUpEligibilityRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    universeEligibility: (0, t.exists)(e, "universeEligibility") ? U(e.universeEligibility) : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1beta1IncreaseMaturityUniverseEligibilityUniverseIdGet = function(e, t) {
            return n(this, void 0, void 0, function() {
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1IncreaseMaturityUniverseEligibilityUniverseIdGetRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1MultiAgeRecommendationPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/multi-age-recommendation",
                                schemaPath: "/v1beta1/multi-age-recommendation",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeIds: e.universeIds
                                    }
                                }(e.v1Beta1MultiGetAgeRecommendationRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    ageRecommendationDetailsByUniverse: (0, t.exists)(e, "ageRecommendationDetailsByUniverse") ? e.ageRecommendationDetailsByUniverse.map(E) : void 0,
                                    headerDisplayName: (0, t.exists)(e, "headerDisplayName") ? e.headerDisplayName : void 0,
                                    headerDisplayNameShort: (0, t.exists)(e, "headerDisplayNameShort") ? e.headerDisplayNameShort : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1beta1MultiAgeRecommendationPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1MultiAgeRecommendationPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1MultiCreatorEligibilityPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/multi-creator-eligibility",
                                schemaPath: "/v1beta1/multi-creator-eligibility",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        action: e.action,
                                        userIds: e.userIds,
                                        universeId: e.universeId
                                    }
                                }(e.v1Beta1MultiGetCreatorEligibilityRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    eligibilityByCreator: (0, t.exists)(e, "eligibilityByCreator") ? e.eligibilityByCreator.map(L) : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1beta1MultiCreatorEligibilityPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1MultiCreatorEligibilityPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1SimplifiedRatingSubmitPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/simplified-rating/submit",
                                schemaPath: "/v1beta1/simplified-rating/submit",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId
                                    }
                                }(e.v1Beta1SubmitSimplifiedRatingRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s)]
                    }
                })
            })
        }, h.prototype.v1beta1SimplifiedRatingSubmitPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1SimplifiedRatingSubmitPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v1beta1TriageModerationPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1beta1/triage-moderation",
                                schemaPath: "/v1beta1/triage-moderation",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        submitterId: e.submitterId,
                                        usages: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                items: void 0 === e.items ? void 0 : e.items.map(P)
                                            }
                                        }(e.usages),
                                        uncontainedDescriptorNames: e.uncontainedDescriptorNames,
                                        priorityOverride: e.priorityOverride,
                                        bypassTopTrustedCheck: e.bypassTopTrustedCheck,
                                        useEgsData: e.useEgsData,
                                        eventTags: e.eventTags,
                                        placeId: e.placeId
                                    }
                                }(e.v1Beta1TriageSubmissionModerationRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    createdTicketId: (0, t.exists)(e, "createdTicketId") ? e.createdTicketId : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v1beta1TriageModerationPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v1beta1TriageModerationPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v2beta1BatchRatingDisplayPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v2beta1/batch-rating-display",
                                schemaPath: "/v2beta1/batch-rating-display",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeIds: e.universeIds
                                    }
                                }(e.v2Beta1BatchGetRatingDisplayRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    displayRating: (0, t.exists)(e, "displayRating") ? e.displayRating.map(z) : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v2beta1BatchRatingDisplayPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v2beta1BatchRatingDisplayPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v2beta1DetailedGuidelinesPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v2beta1/detailed-guidelines",
                                schemaPath: "/v2beta1/detailed-guidelines",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId
                                    }
                                }(e.v2Beta1GetDetailedGuidelinesRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                var i, n, o, r;
                                return null == e ? e : {
                                    ageRecommendationDetails: (0, t.exists)(e, "ageRecommendationDetails") ? null == (i = e.ageRecommendationDetails) ? i : {
                                        ageRecommendationSummary: (0, t.exists)(i, "ageRecommendationSummary") ? null == (n = i.ageRecommendationSummary) ? n : {
                                            ageRecommendation: (0, t.exists)(n, "ageRecommendation") ? H(n.ageRecommendation) : void 0
                                        } : void 0,
                                        experienceDescriptorUsages: (0, t.exists)(i, "experienceDescriptorUsages") ? W(i.experienceDescriptorUsages) : void 0
                                    } : void 0,
                                    restrictedCountries: (0, t.exists)(e, "restrictedCountries") ? e.restrictedCountries.map(Q) : void 0,
                                    contentLanguage: (0, t.exists)(e, "contentLanguage") ? e.contentLanguage : void 0,
                                    moderation: (0, t.exists)(e, "moderation") ? null == (o = e.moderation) ? o : {
                                        moderationStatus: (0, t.exists)(o, "moderationStatus") ? o.moderationStatus : void 0,
                                        creatorUsages: (0, t.exists)(o, "creatorUsages") ? W(o.creatorUsages) : void 0,
                                        moderatorUsages: (0, t.exists)(o, "moderatorUsages") ? W(o.moderatorUsages) : void 0,
                                        moderatorReasoning: (0, t.exists)(o, "moderatorReasoning") ? o.moderatorReasoning.map(K) : void 0
                                    } : void 0,
                                    creatorOverrides: (0, t.exists)(e, "creatorOverrides") ? null == (r = e.creatorOverrides) ? r : {
                                        creatorOverratedAgeRecommendation: (0, t.exists)(r, "creatorOverratedAgeRecommendation") ? H(r.creatorOverratedAgeRecommendation) : void 0,
                                        allowedCreatorOverratedAgeRecommendations: (0, t.exists)(r, "allowedCreatorOverratedAgeRecommendations") ? r.allowedCreatorOverratedAgeRecommendations.map(H) : void 0
                                    } : void 0,
                                    submitBy: (0, t.exists)(e, "submitBy") ? e.submitBy : void 0,
                                    robloxProducts: (0, t.exists)(e, "robloxProducts") ? e.robloxProducts.map(ee) : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v2beta1DetailedGuidelinesPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v2beta1DetailedGuidelinesPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h.prototype.v2beta1RatingDisplayPostRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v2beta1/rating-display",
                                schemaPath: "/v2beta1/rating-display",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId
                                    }
                                }(e.v2Beta1GetRatingDisplayRequest)
                            }, i)];
                        case 1:
                            return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    displayRating: (0, t.exists)(e, "displayRating") ? z(e.displayRating) : void 0
                                }
                            })]
                    }
                })
            })
        }, h.prototype.v2beta1RatingDisplayPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.v2beta1RatingDisplayPostRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, h
    }(t.BaseAPI);
    e.s(["ExperienceGuidelinesServiceAPIApi", 0, et, "V1Beta1CreatorEligibilityAction", 0, {
        Invalid: "CREATOR_ELIGIBILITY_ACTION_INVALID",
        Collaboration: "CREATOR_ELIGIBILITY_ACTION_COLLABORATION",
        UniversePlaceDownload: "CREATOR_ELIGIBILITY_ACTION_UNIVERSE_PLACE_DOWNLOAD"
    }, "V1Beta1CreatorOverridesFromJSON", 0, B, "V1Beta1IneligibilityReason", 0, {
        Invalid: "INELIGIBILITY_REASON_INVALID",
        None: "INELIGIBILITY_REASON_NONE",
        AgeRestricted: "INELIGIBILITY_REASON_AGE_RESTRICTED",
        AgeNotVerified: "INELIGIBILITY_REASON_AGE_NOT_VERIFIED"
    }, "V1Beta1ModerationStatus", 0, {
        Invalid: "MODERATION_STATUS_INVALID",
        Approved: "MODERATION_STATUS_APPROVED",
        Rejected: "MODERATION_STATUS_REJECTED",
        NotReviewed: "MODERATION_STATUS_NOT_REVIEWED",
        Unreviewable: "MODERATION_STATUS_UNREVIEWABLE",
        ProhibitedContent: "MODERATION_STATUS_PROHIBITED_CONTENT"
    }, "V2Beta1ModerationStatus", 0, {
        Invalid: "MODERATION_STATUS_INVALID",
        Approved: "MODERATION_STATUS_APPROVED",
        Rejected: "MODERATION_STATUS_REJECTED",
        NotReviewed: "MODERATION_STATUS_NOT_REVIEWED",
        Unreviewable: "MODERATION_STATUS_UNREVIEWABLE",
        ProhibitedContent: "MODERATION_STATUS_PROHIBITED_CONTENT"
    }])
}]);

//# debugId=af111de2-3c5a-c5f7-4227-00865c661420
//# sourceMappingURL=1pizhk8zkocjv.js.map