;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "2899f9d0-622b-f9ba-c547-e6c2929b8d24")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 976544, e => {
    "use strict";
    var i = e.i(677753),
        s = function(e, i) {
            return (s = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, i) {
                e.__proto__ = i
            } || function(e, i) {
                for (var s in i) Object.prototype.hasOwnProperty.call(i, s) && (e[s] = i[s])
            })(e, i)
        };

    function t(e, i) {
        if ("function" != typeof i && null !== i) throw TypeError("Class extends value " + String(i) + " is not a constructor or null");

        function t() {
            this.constructor = e
        }
        s(e, i), e.prototype = null === i ? Object.create(i) : (t.prototype = i.prototype, new t)
    }
    var n = function() {
        return (n = Object.assign || function(e) {
            for (var i, s = 1, t = arguments.length; s < t; s++)
                for (var n in i = arguments[s]) Object.prototype.hasOwnProperty.call(i, n) && (e[n] = i[n]);
            return e
        }).apply(this, arguments)
    };

    function r(e, i, s, t) {
        return new(s || (s = Promise))(function(n, r) {
            function o(e) {
                try {
                    u(t.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function a(e) {
                try {
                    u(t.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function u(e) {
                var i;
                e.done ? n(e.value) : ((i = e.value) instanceof s ? i : new s(function(e) {
                    e(i)
                })).then(o, a)
            }
            u((t = t.apply(e, i || [])).next())
        })
    }

    function o(e, i) {
        var s, t, n, r = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = a(0), o.throw = a(1), o.return = a(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function a(a) {
            return function(u) {
                var d = [a, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, d[0] && (r = 0)), r;) try {
                    if (s = 1, t && (n = 2 & d[0] ? t.return : d[0] ? t.throw || ((n = t.return) && n.call(t), 0) : t.next) && !(n = n.call(t, d[1])).done) return n;
                    switch (t = 0, n && (d = [2 & d[0], n.value]), d[0]) {
                        case 0:
                        case 1:
                            n = d;
                            break;
                        case 4:
                            return r.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            r.label++, t = d[1], d = [0];
                            continue;
                        case 7:
                            d = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = r.trys).length > 0 && n[n.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === d[0] && (!n || d[1] > n[0] && d[1] < n[3])) {
                                r.label = d[1];
                                break
                            }
                            if (6 === d[0] && r.label < n[1]) {
                                r.label = n[1], n = d;
                                break
                            }
                            if (n && r.label < n[2]) {
                                r.label = n[2], r.ops.push(d);
                                break
                            }
                            n[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    d = i.call(e, r)
                } catch (e) {
                    d = [6, e], t = 0
                } finally {
                    s = n = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function a(e) {
        var s;
        return null == (s = e) ? s : {
            dimensionDisplayName: (0, i.exists)(s, "dimensionDisplayName") ? s.dimensionDisplayName : void 0,
            dimensionValueDisplayName: (0, i.exists)(s, "dimensionValueDisplayName") ? s.dimensionValueDisplayName : void 0
        }
    }

    function u(e) {
        var s, t;
        return null == (s = e) ? s : {
            name: (0, i.exists)(s, "name") ? s.name : void 0,
            followsComplianceApi: (0, i.exists)(s, "followsComplianceApi") ? s.followsComplianceApi : void 0,
            descriptor: (0, i.exists)(s, "descriptor") ? null == (t = s.descriptor) ? t : {
                name: (0, i.exists)(t, "name") ? t.name : void 0,
                displayName: (0, i.exists)(t, "displayName") ? t.displayName : void 0,
                complianceApiSupported: (0, i.exists)(t, "complianceApiSupported") ? t.complianceApiSupported : void 0
            } : void 0,
            descriptorDimensionUsages: (0, i.exists)(s, "descriptorDimensionUsages") ? null === s.descriptorDimensionUsages ? null : s.descriptorDimensionUsages.map(a) : void 0
        }
    }

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            attributes: e.attributes,
            from_name_ls: e.fromNameLs,
            label_id: e.labelId,
            omit_alignment: e.omitAlignment,
            raw_ls: e.rawLs,
            target_id: e.targetId,
            target_type: e.targetType,
            type_ls: e.typeLs,
            values: e.values
        }
    }

    function l(e) {
        var s;
        return null == (s = e) ? s : {
            questionId: (0, i.exists)(s, "questionId") ? s.questionId : void 0,
            value: (0, i.exists)(s, "value") ? s.value : void 0
        }
    }

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            questionId: e.questionId,
            value: e.value
        }
    }

    function p(e) {
        var s;
        return null == (s = e) ? s : {
            url: (0, i.exists)(s, "url") ? s.url : void 0,
            altText: (0, i.exists)(s, "altText") ? s.altText : void 0
        }
    }

    function v(e) {
        var s;
        return null == (s = e) ? s : {
            url: (0, i.exists)(s, "url") ? s.url : void 0,
            altText: (0, i.exists)(s, "altText") ? s.altText : void 0
        }
    }

    function m(e) {
        var s;
        return null == (s = e) ? s : {
            title: (0, i.exists)(s, "title") ? s.title : void 0,
            text: (0, i.exists)(s, "text") ? s.text : void 0,
            images: (0, i.exists)(s, "images") ? s.images.map(p) : void 0,
            videos: (0, i.exists)(s, "videos") ? s.videos.map(v) : void 0
        }
    }

    function h(e, s) {
        return null == e ? e : {
            title: (0, i.exists)(e, "title") ? e.title : void 0,
            text: (0, i.exists)(e, "text") ? e.text : void 0,
            images: (0, i.exists)(e, "images") ? e.images.map(p) : void 0,
            videos: (0, i.exists)(e, "videos") ? e.videos.map(v) : void 0,
            examples: (0, i.exists)(e, "examples") ? e.examples.map(m) : void 0
        }
    }

    function f(e) {
        return function e(s, t) {
            if (null == s) return s;
            if (!t) {
                var r, o, a, u, d, l;
                if ("CheckBoxQuestion" === s.type) {
                    return o = !0, null == (r = s) ? r : n(n({}, e(r, o)), {
                        options: (0, i.exists)(r, "options") ? r.options.map(I) : void 0
                    })
                }
                if ("RadioButtonQuestion" === s.type) {
                    return u = !0, null == (a = s) ? a : n(n({}, e(a, u)), {
                        options: (0, i.exists)(a, "options") ? a.options.map(T) : void 0
                    })
                }
                if ("TextBoxQuestion" === s.type) {
                    return l = !0, null == (d = s) ? d : n(n({}, e(d, l)), {
                        validationType: (0, i.exists)(d, "validationType") ? d.validationType : void 0,
                        maxInputLength: (0, i.exists)(d, "maxInputLength") ? d.maxInputLength : void 0
                    })
                }
            }
            return {
                id: (0, i.exists)(s, "id") ? s.id : void 0,
                text: (0, i.exists)(s, "text") ? s.text : void 0,
                metadata: (0, i.exists)(s, "metadata") ? s.metadata : void 0,
                helpInfo: (0, i.exists)(s, "helpInfo") ? h(s.helpInfo) : void 0,
                type: s.type
            }
        }(e, !1)
    }

    function x(e) {
        var s;
        return null == (s = e) ? s : {
            id: (0, i.exists)(s, "id") ? s.id : void 0,
            name: (0, i.exists)(s, "name") ? s.name : void 0,
            description: (0, i.exists)(s, "description") ? s.description : void 0,
            questions: (0, i.exists)(s, "questions") ? s.questions.map(f) : void 0,
            metadata: (0, i.exists)(s, "metadata") ? s.metadata : void 0
        }
    }

    function I(e) {
        var s;
        return null == (s = e) ? s : {
            id: (0, i.exists)(s, "id") ? s.id : void 0,
            text: (0, i.exists)(s, "text") ? s.text : void 0,
            metadata: (0, i.exists)(s, "metadata") ? s.metadata : void 0,
            helpInfo: (0, i.exists)(s, "helpInfo") ? h(s.helpInfo) : void 0,
            childQuestions: (0, i.exists)(s, "childQuestions") ? s.childQuestions.map(f) : void 0,
            childSections: (0, i.exists)(s, "childSections") ? s.childSections.map(x) : void 0
        }
    }

    function y(e) {
        var s;
        return null == (s = e) ? s : {
            name: (0, i.exists)(s, "name") ? s.name : void 0,
            displayName: (0, i.exists)(s, "displayName") ? s.displayName : void 0,
            complianceApiSupported: (0, i.exists)(s, "complianceApiSupported") ? s.complianceApiSupported : void 0,
            iconUrl: (0, i.exists)(s, "iconUrl") ? s.iconUrl : void 0,
            localeCode: (0, i.exists)(s, "localeCode") ? s.localeCode : void 0
        }
    }

    function b(e) {
        var s;
        return null == (s = e) ? s : {
            dimensionName: (0, i.exists)(s, "dimensionName") ? s.dimensionName : void 0,
            dimensionValueName: (0, i.exists)(s, "dimensionValueName") ? s.dimensionValueName : void 0,
            label: (0, i.exists)(s, "label") ? s.label : void 0
        }
    }

    function w(e) {
        var s;
        return null == (s = e) ? s : {
            name: (0, i.exists)(s, "name") ? s.name : void 0,
            contains: (0, i.exists)(s, "contains") ? s.contains : void 0,
            followsComplianceApi: (0, i.exists)(s, "followsComplianceApi") ? s.followsComplianceApi : void 0,
            label: (0, i.exists)(s, "label") ? s.label : void 0,
            dimensionUsages: (0, i.exists)(s, "dimensionUsages") ? s.dimensionUsages.map(b) : void 0
        }
    }

    function g(e, s) {
        return null == e ? e : {
            answers: (0, i.exists)(e, "answers") ? e.answers.map(l) : void 0
        }
    }

    function q(e) {
        var s;
        return null == (s = e) ? s : {
            descriptorID: (0, i.exists)(s, "descriptorID") ? s.descriptorID : void 0,
            descriptorText: (0, i.exists)(s, "descriptorText") ? s.descriptorText : void 0,
            localizedDisplayText: (0, i.exists)(s, "localizedDisplayText") ? s.localizedDisplayText : void 0
        }
    }

    function R(e) {
        var s;
        return null == (s = e) ? s : {
            interactiveElementID: (0, i.exists)(s, "interactiveElementID") ? s.interactiveElementID : void 0,
            interactiveElementText: (0, i.exists)(s, "interactiveElementText") ? s.interactiveElementText : void 0,
            localizedDisplayText: (0, i.exists)(s, "localizedDisplayText") ? s.localizedDisplayText : void 0
        }
    }

    function S(e) {
        var s;
        return null == (s = e) ? s : {
            ratingAuthorityID: (0, i.exists)(s, "ratingAuthorityID") ? s.ratingAuthorityID : void 0,
            ratingAuthorityShortText: (0, i.exists)(s, "ratingAuthorityShortText") ? s.ratingAuthorityShortText : void 0,
            localizedRegionText: (0, i.exists)(s, "localizedRegionText") ? s.localizedRegionText : void 0,
            localizedDisplayText: (0, i.exists)(s, "localizedDisplayText") ? s.localizedDisplayText : void 0,
            ageRatingID: (0, i.exists)(s, "ageRatingID") ? s.ageRatingID : void 0,
            ageRatingShortText: (0, i.exists)(s, "ageRatingShortText") ? s.ageRatingShortText : void 0,
            ageRatingIconUrl: (0, i.exists)(s, "ageRatingIconUrl") ? s.ageRatingIconUrl : void 0,
            numericLevel: (0, i.exists)(s, "numericLevel") ? s.numericLevel : void 0,
            descriptorList: (0, i.exists)(s, "descriptorList") ? s.descriptorList.map(q) : void 0,
            locked: (0, i.exists)(s, "locked") ? s.locked : void 0,
            interactiveElementList: (0, i.exists)(s, "interactiveElementList") ? s.interactiveElementList.map(R) : void 0
        }
    }

    function A(e) {
        var s;
        return null == (s = e) ? s : {
            countryCode: s.countryCode,
            reasons: s.reasons,
            displayCountryName: (0, i.exists)(s, "displayCountryName") ? s.displayCountryName : void 0,
            displayDescriptorName: (0, i.exists)(s, "displayDescriptorName") ? s.displayDescriptorName : void 0,
            displayAgeRangeName: (0, i.exists)(s, "displayAgeRangeName") ? s.displayAgeRangeName : void 0
        }
    }

    function P(e) {
        var s, t;
        return null == (s = e) ? s : {
            productId: (0, i.exists)(s, "productId") ? s.productId : void 0,
            relevantDescriptors: (0, i.exists)(s, "relevantDescriptors") ? s.relevantDescriptors : void 0,
            iarcProduct: (0, i.exists)(s, "iarcProduct") ? null == (t = s.iarcProduct) ? t : {
                interactiveElementList: (0, i.exists)(t, "interactiveElementList") ? t.interactiveElementList.map(R) : void 0,
                ratingList: (0, i.exists)(t, "ratingList") ? t.ratingList.map(S) : void 0,
                ratingLogicVersion: (0, i.exists)(t, "ratingLogicVersion") ? t.ratingLogicVersion : void 0,
                orcVersion: (0, i.exists)(t, "orcVersion") ? t.orcVersion : void 0
            } : void 0
        }
    }

    function U(e) {
        return e
    }

    function T(e) {
        var s;
        return null == (s = e) ? s : {
            id: (0, i.exists)(s, "id") ? s.id : void 0,
            text: (0, i.exists)(s, "text") ? s.text : void 0,
            metadata: (0, i.exists)(s, "metadata") ? s.metadata : void 0,
            helpInfo: (0, i.exists)(s, "helpInfo") ? h(s.helpInfo) : void 0,
            childQuestions: (0, i.exists)(s, "childQuestions") ? s.childQuestions.map(f) : void 0,
            childSections: (0, i.exists)(s, "childSections") ? s.childSections.map(x) : void 0
        }
    }

    function C(e) {
        var s;
        return null == (s = e) ? s : {
            questionId: (0, i.exists)(s, "questionId") ? s.questionId : void 0,
            reasons: (0, i.exists)(s, "reasons") ? s.reasons.map(U) : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var E = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return t(s, e), s.prototype.questionnairesGetAdditionalQuestionnaireRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling questionnairesGetAdditionalQuestionnaire.");
                                return t = {}, void 0 !== e.localeCode && (t.localeCode = e.localeCode), n = {}, [4, this.request({
                                    path: "/v2/questionnaires/additional/universes/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/questionnaires/additional/universes/{universeId}",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    var s;
                                    return null == e ? e : {
                                        questionnaire: (0, i.exists)(e, "questionnaire") ? null == (s = e.questionnaire) ? s : {
                                            id: (0, i.exists)(s, "id") ? s.id : void 0,
                                            name: (0, i.exists)(s, "name") ? s.name : void 0,
                                            description: (0, i.exists)(s, "description") ? s.description : void 0,
                                            sections: (0, i.exists)(s, "sections") ? s.sections.map(x) : void 0
                                        } : void 0,
                                        localeCode: (0, i.exists)(e, "localeCode") ? e.localeCode : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.questionnairesGetAdditionalQuestionnaire = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.questionnairesGetAdditionalQuestionnaireRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(i.BaseAPI),
        G = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return t(s, e), s.prototype.responsesGetActiveAdditionalResponseRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling responsesGetActiveAdditionalResponse.");
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v2/responses/{universeId}/additional".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/responses/{universeId}/additional",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        questionnaireId: (0, i.exists)(e, "questionnaireId") ? e.questionnaireId : void 0,
                                        response: (0, i.exists)(e, "response") ? g(e.response) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.responsesGetActiveAdditionalResponse = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesGetActiveAdditionalResponseRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.responsesGetAdditionalLatestSubmissionRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling responsesGetAdditionalLatestSubmission.");
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v2/responses/{universeId}/submissions/additional/latest".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/responses/{universeId}/submissions/additional/latest",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    var s;
                                    return null == e ? e : {
                                        questionnaireId: (0, i.exists)(e, "questionnaireId") ? e.questionnaireId : void 0,
                                        submission: (0, i.exists)(e, "submission") ? null == (s = e.submission) ? s : {
                                            submissionId: (0, i.exists)(s, "submissionId") ? s.submissionId : void 0,
                                            response: (0, i.exists)(s, "response") ? g(s.response) : void 0,
                                            submissionDate: (0, i.exists)(s, "submissionDate") ? new Date(s.submissionDate) : void 0,
                                            submmittedByUserId: (0, i.exists)(s, "submmittedByUserId") ? s.submmittedByUserId : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.responsesGetAdditionalLatestSubmission = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesGetAdditionalLatestSubmissionRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.responsesPreviewMultiQuestionnaireRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.previewSubmissionsRequestBody || void 0 === e.previewSubmissionsRequestBody) throw new i.RequiredError("previewSubmissionsRequestBody", "Required parameter requestParameters.previewSubmissionsRequestBody was null or undefined when calling responsesPreviewMultiQuestionnaire.");
                                return t = {}, void 0 !== e.localeCode && (t.localeCode = e.localeCode), (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/responses/preview",
                                    schemaPath: "/v2/responses/preview",
                                    method: "POST",
                                    headers: n,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            universeId: e.universeId,
                                            questionnaireIds: e.questionnaireIds
                                        }
                                    }(e.previewSubmissionsRequestBody)
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    var s, t, n;
                                    return null == e ? e : {
                                        robloxProducts: (0, i.exists)(e, "robloxProducts") ? e.robloxProducts.map(P) : void 0,
                                        contentDescriptorUsages: (0, i.exists)(e, "contentDescriptorUsages") ? e.contentDescriptorUsages.map(w) : void 0,
                                        restrictedCountries: (0, i.exists)(e, "restrictedCountries") ? e.restrictedCountries.map(A) : void 0,
                                        referencedContentDescriptors: (0, i.exists)(e, "referencedContentDescriptors") ? e.referencedContentDescriptors.map(y) : void 0,
                                        ageRecommendationDetails: (0, i.exists)(e, "ageRecommendationDetails") ? null == (s = e.ageRecommendationDetails) ? s : {
                                            summary: (0, i.exists)(s, "summary") ? null == (t = s.summary) ? t : {
                                                ageRecommendation: (0, i.exists)(t, "ageRecommendation") ? null == (n = t.ageRecommendation) ? n : {
                                                    displayName: (0, i.exists)(n, "displayName") ? n.displayName : void 0,
                                                    minimumAge: (0, i.exists)(n, "minimumAge") ? n.minimumAge : void 0
                                                } : void 0
                                            } : void 0,
                                            descriptorUsages: (0, i.exists)(s, "descriptorUsages") ? s.descriptorUsages.map(u) : void 0
                                        } : void 0,
                                        contentLanguage: (0, i.exists)(e, "contentLanguage") ? e.contentLanguage : void 0,
                                        userInfoMessage: (0, i.exists)(e, "userInfoMessage") ? e.userInfoMessage : void 0,
                                        userWarningMessage: (0, i.exists)(e, "userWarningMessage") ? e.userWarningMessage : void 0,
                                        userErrorMessage: (0, i.exists)(e, "userErrorMessage") ? e.userErrorMessage : void 0,
                                        disableSubmitButton: (0, i.exists)(e, "disableSubmitButton") ? e.disableSubmitButton : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.responsesPreviewMultiQuestionnaire = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesPreviewMultiQuestionnaireRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.responsesPublishRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.publishRequestBody || void 0 === e.publishRequestBody) throw new i.RequiredError("publishRequestBody", "Required parameter requestParameters.publishRequestBody was null or undefined when calling responsesPublish.");
                                return t = {}, void 0 !== e.localeCode && (t.localeCode = e.localeCode), (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/responses/publish",
                                    schemaPath: "/v2/responses/publish",
                                    method: "POST",
                                    headers: n,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            universeId: e.universeId,
                                            questionnaireIds: e.questionnaireIds
                                        }
                                    }(e.publishRequestBody)
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r)]
                        }
                    })
                })
            }, s.prototype.responsesPublish = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesPublishRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.responsesSubmitResponseRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling responsesSubmitResponse.");
                                return t = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/responses/{universeId}/submissions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/responses/{universeId}/submissions",
                                    method: "POST",
                                    headers: n,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            questionnaireId: e.questionnaireId,
                                            response: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    answers: void 0 === e.answers ? void 0 : e.answers.map(c)
                                                }
                                            }(e.response)
                                        }
                                    }(e.submitResponseRequestBody)
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        submissionId: (0, i.exists)(e, "submissionId") ? e.submissionId : void 0,
                                        isValid: (0, i.exists)(e, "isValid") ? e.isValid : void 0,
                                        failures: (0, i.exists)(e, "failures") ? e.failures.map(C) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.responsesSubmitResponse = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesSubmitResponseRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.responsesUnderEighteenHumanSubmissionWebhookRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.underEighteenHumanSubmissionWebhookRequestBody || void 0 === e.underEighteenHumanSubmissionWebhookRequestBody) throw new i.RequiredError("underEighteenHumanSubmissionWebhookRequestBody", "Required parameter requestParameters.underEighteenHumanSubmissionWebhookRequestBody was null or undefined when calling responsesUnderEighteenHumanSubmissionWebhook.");
                                return t = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/responses/under-eighteen-human-submission-webhook",
                                    schemaPath: "/v2/responses/under-eighteen-human-submission-webhook",
                                    method: "POST",
                                    headers: n,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            annotations: void 0 === e.annotations ? void 0 : null === e.annotations ? null : e.annotations.map(d),
                                            appeal: e.appeal,
                                            associated_entity: e.associatedEntity,
                                            category: e.category,
                                            content: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    content_type: e.contentType,
                                                    custom: e.custom,
                                                    id: e.id,
                                                    locale: e.locale,
                                                    media_type: e.mediaType,
                                                    type: e.type,
                                                    update_time: void 0 === e.updateTime ? void 0 : null === e.updateTime ? null : e.updateTime.toISOString(),
                                                    user_id: e.userId
                                                }
                                            }(e.content),
                                            correlation_id: e.correlationId,
                                            custom: e.custom,
                                            decider_id: e.deciderId,
                                            decider_type: e.deciderType,
                                            decision_event_id: e.decisionEventId,
                                            decision_id: e.decisionId,
                                            idempotency_key: e.idempotencyKey,
                                            labels: e.labels,
                                            media: e.media,
                                            raw_ls: e.rawLs,
                                            reasons: e.reasons,
                                            report: e.report,
                                            run_id: e.runId,
                                            team: e.team,
                                            ticket_id: e.ticketId,
                                            ticket_priority: e.ticketPriority,
                                            universe: e.universe,
                                            user: e.user
                                        }
                                    }(e.underEighteenHumanSubmissionWebhookRequestBody)
                                }, s)];
                            case 1:
                                return r = o.sent(), this.isJsonMime(r.headers.get("content-type")) ? [2, new i.JSONApiResponse(r)] : [2, new i.TextApiResponse(r)]
                        }
                    })
                })
            }, s.prototype.responsesUnderEighteenHumanSubmissionWebhook = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesUnderEighteenHumanSubmissionWebhookRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(i.BaseAPI);
    e.s(["QuestionnairesApi", 0, E, "ResponsesApi", 0, G])
}, 21290, e => {
    "use strict";
    var i = e.i(677753),
        s = function(e, i) {
            return (s = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, i) {
                e.__proto__ = i
            } || function(e, i) {
                for (var s in i) Object.prototype.hasOwnProperty.call(i, s) && (e[s] = i[s])
            })(e, i)
        };

    function t(e, i) {
        if ("function" != typeof i && null !== i) throw TypeError("Class extends value " + String(i) + " is not a constructor or null");

        function t() {
            this.constructor = e
        }
        s(e, i), e.prototype = null === i ? Object.create(i) : (t.prototype = i.prototype, new t)
    }
    var n = function() {
        return (n = Object.assign || function(e) {
            for (var i, s = 1, t = arguments.length; s < t; s++)
                for (var n in i = arguments[s]) Object.prototype.hasOwnProperty.call(i, n) && (e[n] = i[n]);
            return e
        }).apply(this, arguments)
    };

    function r(e, i, s, t) {
        return new(s || (s = Promise))(function(n, r) {
            function o(e) {
                try {
                    u(t.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function a(e) {
                try {
                    u(t.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function u(e) {
                var i;
                e.done ? n(e.value) : ((i = e.value) instanceof s ? i : new s(function(e) {
                    e(i)
                })).then(o, a)
            }
            u((t = t.apply(e, i || [])).next())
        })
    }

    function o(e, i) {
        var s, t, n, r = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = a(0), o.throw = a(1), o.return = a(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function a(a) {
            return function(u) {
                var d = [a, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, d[0] && (r = 0)), r;) try {
                    if (s = 1, t && (n = 2 & d[0] ? t.return : d[0] ? t.throw || ((n = t.return) && n.call(t), 0) : t.next) && !(n = n.call(t, d[1])).done) return n;
                    switch (t = 0, n && (d = [2 & d[0], n.value]), d[0]) {
                        case 0:
                        case 1:
                            n = d;
                            break;
                        case 4:
                            return r.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            r.label++, t = d[1], d = [0];
                            continue;
                        case 7:
                            d = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = r.trys).length > 0 && n[n.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === d[0] && (!n || d[1] > n[0] && d[1] < n[3])) {
                                r.label = d[1];
                                break
                            }
                            if (6 === d[0] && r.label < n[1]) {
                                r.label = n[1], n = d;
                                break
                            }
                            if (n && r.label < n[2]) {
                                r.label = n[2], r.ops.push(d);
                                break
                            }
                            n[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    d = i.call(e, r)
                } catch (e) {
                    d = [6, e], t = 0
                } finally {
                    s = n = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function a(e) {
        var s;
        return null == (s = e) ? s : {
            dimensionDisplayName: (0, i.exists)(s, "dimensionDisplayName") ? s.dimensionDisplayName : void 0,
            dimensionValueDisplayName: (0, i.exists)(s, "dimensionValueDisplayName") ? s.dimensionValueDisplayName : void 0
        }
    }

    function u(e) {
        var s, t;
        return null == (s = e) ? s : {
            name: (0, i.exists)(s, "name") ? s.name : void 0,
            followsComplianceApi: (0, i.exists)(s, "followsComplianceApi") ? s.followsComplianceApi : void 0,
            descriptor: (0, i.exists)(s, "descriptor") ? null == (t = s.descriptor) ? t : {
                name: (0, i.exists)(t, "name") ? t.name : void 0,
                displayName: (0, i.exists)(t, "displayName") ? t.displayName : void 0,
                complianceApiSupported: (0, i.exists)(t, "complianceApiSupported") ? t.complianceApiSupported : void 0
            } : void 0,
            descriptorDimensionUsages: (0, i.exists)(s, "descriptorDimensionUsages") ? null === s.descriptorDimensionUsages ? null : s.descriptorDimensionUsages.map(a) : void 0
        }
    }

    function d(e) {
        var s;
        return null == (s = e) ? s : {
            questionId: (0, i.exists)(s, "questionId") ? s.questionId : void 0,
            value: (0, i.exists)(s, "value") ? s.value : void 0
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            questionId: e.questionId,
            value: e.value
        }
    }

    function c(e) {
        var s;
        return null == (s = e) ? s : {
            url: (0, i.exists)(s, "url") ? s.url : void 0,
            altText: (0, i.exists)(s, "altText") ? s.altText : void 0
        }
    }

    function p(e) {
        var s;
        return null == (s = e) ? s : {
            url: (0, i.exists)(s, "url") ? s.url : void 0,
            altText: (0, i.exists)(s, "altText") ? s.altText : void 0
        }
    }

    function v(e) {
        var s;
        return null == (s = e) ? s : {
            title: (0, i.exists)(s, "title") ? s.title : void 0,
            text: (0, i.exists)(s, "text") ? s.text : void 0,
            images: (0, i.exists)(s, "images") ? s.images.map(c) : void 0,
            videos: (0, i.exists)(s, "videos") ? s.videos.map(p) : void 0
        }
    }

    function m(e, s) {
        return null == e ? e : {
            title: (0, i.exists)(e, "title") ? e.title : void 0,
            text: (0, i.exists)(e, "text") ? e.text : void 0,
            images: (0, i.exists)(e, "images") ? e.images.map(c) : void 0,
            videos: (0, i.exists)(e, "videos") ? e.videos.map(p) : void 0,
            examples: (0, i.exists)(e, "examples") ? e.examples.map(v) : void 0
        }
    }

    function h(e) {
        return function e(s, t) {
            if (null == s) return s;
            if (!t) {
                var r, o, a, u, d, l;
                if ("CheckBoxQuestion" === s.type) {
                    return o = !0, null == (r = s) ? r : n(n({}, e(r, o)), {
                        options: (0, i.exists)(r, "options") ? r.options.map(x) : void 0
                    })
                }
                if ("RadioButtonQuestion" === s.type) {
                    return u = !0, null == (a = s) ? a : n(n({}, e(a, u)), {
                        options: (0, i.exists)(a, "options") ? a.options.map(U) : void 0
                    })
                }
                if ("TextBoxQuestion" === s.type) {
                    return l = !0, null == (d = s) ? d : n(n({}, e(d, l)), {
                        validationType: (0, i.exists)(d, "validationType") ? d.validationType : void 0,
                        maxInputLength: (0, i.exists)(d, "maxInputLength") ? d.maxInputLength : void 0
                    })
                }
            }
            return {
                id: (0, i.exists)(s, "id") ? s.id : void 0,
                text: (0, i.exists)(s, "text") ? s.text : void 0,
                metadata: (0, i.exists)(s, "metadata") ? s.metadata : void 0,
                helpInfo: (0, i.exists)(s, "helpInfo") ? m(s.helpInfo) : void 0,
                type: s.type
            }
        }(e, !1)
    }

    function f(e) {
        var s;
        return null == (s = e) ? s : {
            id: (0, i.exists)(s, "id") ? s.id : void 0,
            name: (0, i.exists)(s, "name") ? s.name : void 0,
            description: (0, i.exists)(s, "description") ? s.description : void 0,
            questions: (0, i.exists)(s, "questions") ? s.questions.map(h) : void 0,
            metadata: (0, i.exists)(s, "metadata") ? s.metadata : void 0
        }
    }

    function x(e) {
        var s;
        return null == (s = e) ? s : {
            id: (0, i.exists)(s, "id") ? s.id : void 0,
            text: (0, i.exists)(s, "text") ? s.text : void 0,
            metadata: (0, i.exists)(s, "metadata") ? s.metadata : void 0,
            helpInfo: (0, i.exists)(s, "helpInfo") ? m(s.helpInfo) : void 0,
            childQuestions: (0, i.exists)(s, "childQuestions") ? s.childQuestions.map(h) : void 0,
            childSections: (0, i.exists)(s, "childSections") ? s.childSections.map(f) : void 0
        }
    }

    function I(e) {
        var s;
        return null == (s = e) ? s : {
            name: (0, i.exists)(s, "name") ? s.name : void 0,
            displayName: (0, i.exists)(s, "displayName") ? s.displayName : void 0,
            complianceApiSupported: (0, i.exists)(s, "complianceApiSupported") ? s.complianceApiSupported : void 0,
            iconUrl: (0, i.exists)(s, "iconUrl") ? s.iconUrl : void 0,
            localeCode: (0, i.exists)(s, "localeCode") ? s.localeCode : void 0
        }
    }

    function y(e) {
        var s;
        return null == (s = e) ? s : {
            dimensionName: (0, i.exists)(s, "dimensionName") ? s.dimensionName : void 0,
            dimensionValueName: (0, i.exists)(s, "dimensionValueName") ? s.dimensionValueName : void 0,
            label: (0, i.exists)(s, "label") ? s.label : void 0
        }
    }

    function b(e) {
        var s;
        return null == (s = e) ? s : {
            name: (0, i.exists)(s, "name") ? s.name : void 0,
            contains: (0, i.exists)(s, "contains") ? s.contains : void 0,
            followsComplianceApi: (0, i.exists)(s, "followsComplianceApi") ? s.followsComplianceApi : void 0,
            label: (0, i.exists)(s, "label") ? s.label : void 0,
            dimensionUsages: (0, i.exists)(s, "dimensionUsages") ? s.dimensionUsages.map(y) : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function w(e, s) {
        return null == e ? e : {
            answers: (0, i.exists)(e, "answers") ? e.answers.map(d) : void 0
        }
    }

    function g(e) {
        if (void 0 !== e) return null === e ? null : {
            answers: void 0 === e.answers ? void 0 : e.answers.map(l)
        }
    }

    function q(e, s) {
        return null == e ? e : {
            questionnaireId: (0, i.exists)(e, "questionnaireId") ? e.questionnaireId : void 0,
            isOverEighteenQuestionnaire: (0, i.exists)(e, "isOverEighteenQuestionnaire") ? e.isOverEighteenQuestionnaire : void 0
        }
    }

    function R(e) {
        var s;
        return null == (s = e) ? s : {
            submissionId: (0, i.exists)(s, "submissionId") ? s.submissionId : void 0,
            response: (0, i.exists)(s, "response") ? w(s.response) : void 0,
            submissionDate: (0, i.exists)(s, "submissionDate") ? new Date(s.submissionDate) : void 0,
            submmittedByUserId: (0, i.exists)(s, "submmittedByUserId") ? s.submmittedByUserId : void 0
        }
    }

    function S(e) {
        var s;
        return null == (s = e) ? s : {
            id: (0, i.exists)(s, "id") ? s.id : void 0,
            universeId: (0, i.exists)(s, "universeId") ? s.universeId : void 0,
            robloxQuestionnaireId: (0, i.exists)(s, "robloxQuestionnaireId") ? s.robloxQuestionnaireId : void 0,
            iarcQuestionnaireId: (0, i.exists)(s, "iarcQuestionnaireId") ? s.iarcQuestionnaireId : void 0,
            robloxSubmissionId: (0, i.exists)(s, "robloxSubmissionId") ? s.robloxSubmissionId : void 0,
            iarcSubmissionId: (0, i.exists)(s, "iarcSubmissionId") ? s.iarcSubmissionId : void 0,
            externalState: (0, i.exists)(s, "externalState") ? s.externalState : void 0,
            internalState: (0, i.exists)(s, "internalState") ? s.internalState : void 0,
            error: (0, i.exists)(s, "error") ? s.error : void 0,
            createdUtc: (0, i.exists)(s, "createdUtc") ? new Date(s.createdUtc) : void 0,
            updatedUtc: (0, i.exists)(s, "updatedUtc") ? new Date(s.updatedUtc) : void 0,
            retryCount: (0, i.exists)(s, "retryCount") ? s.retryCount : void 0
        }
    }

    function A(e) {
        var s;
        return null == (s = e) ? s : {
            countryCode: s.countryCode,
            reasons: s.reasons,
            displayCountryName: (0, i.exists)(s, "displayCountryName") ? s.displayCountryName : void 0,
            displayDescriptorName: (0, i.exists)(s, "displayDescriptorName") ? s.displayDescriptorName : void 0,
            displayAgeRangeName: (0, i.exists)(s, "displayAgeRangeName") ? s.displayAgeRangeName : void 0
        }
    }

    function P(e) {
        return e
    }

    function U(e) {
        var s;
        return null == (s = e) ? s : {
            id: (0, i.exists)(s, "id") ? s.id : void 0,
            text: (0, i.exists)(s, "text") ? s.text : void 0,
            metadata: (0, i.exists)(s, "metadata") ? s.metadata : void 0,
            helpInfo: (0, i.exists)(s, "helpInfo") ? m(s.helpInfo) : void 0,
            childQuestions: (0, i.exists)(s, "childQuestions") ? s.childQuestions.map(h) : void 0,
            childSections: (0, i.exists)(s, "childSections") ? s.childSections.map(f) : void 0
        }
    }

    function T(e) {
        var s;
        return null == (s = e) ? s : {
            questionId: (0, i.exists)(s, "questionId") ? s.questionId : void 0,
            reasons: (0, i.exists)(s, "reasons") ? s.reasons.map(P) : void 0
        }
    }
    var C = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return t(s, e), s.prototype.eligibilityGetUniverseEligibilityRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling eligibilityGetUniverseEligibility.");
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/eligibility/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/eligibility/{universeId}",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        eligibility: (0, i.exists)(e, "eligibility") ? e.eligibility : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.eligibilityGetUniverseEligibility = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.eligibilityGetUniverseEligibilityRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(i.BaseAPI),
        E = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return t(s, e), s.prototype.metadataGetUniverseMetadataStatusRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling metadataGetUniverseMetadataStatus.");
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/metadata/{universeId}/status".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/metadata/{universeId}/status",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        status: (0, i.exists)(e, "status") ? e.status : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.metadataGetUniverseMetadataStatus = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.metadataGetUniverseMetadataStatusRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(i.BaseAPI),
        G = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return t(s, e), s.prototype.questionnairesGetLatestQuestionnaireIdRaw = function(e) {
                return r(this, void 0, void 0, function() {
                    var s, t, n;
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return s = {}, t = {}, [4, this.request({
                                    path: "/v1/questionnaires/latest",
                                    schemaPath: "/v1/questionnaires/latest",
                                    method: "GET",
                                    headers: t,
                                    query: s
                                }, e)];
                            case 1:
                                return n = r.sent(), [2, new i.JSONApiResponse(n, function(e) {
                                    return q(e)
                                })]
                        }
                    })
                })
            }, s.prototype.questionnairesGetLatestQuestionnaireId = function(e) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.questionnairesGetLatestQuestionnaireIdRaw(e)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, s.prototype.questionnairesGetLatestQuestionnaireIdForUniverseRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling questionnairesGetLatestQuestionnaireIdForUniverse.");
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/questionnaires/{universeId}/latest".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/questionnaires/{universeId}/latest",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    return q(e)
                                })]
                        }
                    })
                })
            }, s.prototype.questionnairesGetLatestQuestionnaireIdForUniverse = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.questionnairesGetLatestQuestionnaireIdForUniverseRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.questionnairesGetQuestionnaireByIdRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.questionnaireId || void 0 === e.questionnaireId) throw new i.RequiredError("questionnaireId", "Required parameter requestParameters.questionnaireId was null or undefined when calling questionnairesGetQuestionnaireById.");
                                return t = {}, void 0 !== e.localeCode && (t.localeCode = e.localeCode), n = {}, [4, this.request({
                                    path: "/v1/questionnaires/{questionnaireId}".replace("{".concat("questionnaireId", "}"), encodeURIComponent(String(e.questionnaireId))),
                                    schemaPath: "/v1/questionnaires/{questionnaireId}",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    var s;
                                    return null == e ? e : {
                                        questionnaire: (0, i.exists)(e, "questionnaire") ? null == (s = e.questionnaire) ? s : {
                                            id: (0, i.exists)(s, "id") ? s.id : void 0,
                                            name: (0, i.exists)(s, "name") ? s.name : void 0,
                                            description: (0, i.exists)(s, "description") ? s.description : void 0,
                                            sections: (0, i.exists)(s, "sections") ? s.sections.map(f) : void 0
                                        } : void 0,
                                        localeCode: (0, i.exists)(e, "localeCode") ? e.localeCode : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.questionnairesGetQuestionnaireById = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.questionnairesGetQuestionnaireByIdRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.questionnairesGetQuestionnaireStatusForUserRaw = function(e) {
                return r(this, void 0, void 0, function() {
                    var s, t, n;
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return s = {}, t = {}, [4, this.request({
                                    path: "/v1/questionnaires/status",
                                    schemaPath: "/v1/questionnaires/status",
                                    method: "GET",
                                    headers: t,
                                    query: s
                                }, e)];
                            case 1:
                                return n = r.sent(), [2, new i.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        isEnabled: (0, i.exists)(e, "isEnabled") ? e.isEnabled : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.questionnairesGetQuestionnaireStatusForUser = function(e) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.questionnairesGetQuestionnaireStatusForUserRaw(e)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, s
        }(i.BaseAPI),
        N = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return t(s, e), s.prototype.responsesGetActiveResponseRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling responsesGetActiveResponse.");
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/responses/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/responses/{universeId}",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        questionnaireId: (0, i.exists)(e, "questionnaireId") ? e.questionnaireId : void 0,
                                        response: (0, i.exists)(e, "response") ? w(e.response) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.responsesGetActiveResponse = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesGetActiveResponseRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.responsesGetLatestSubmissionRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling responsesGetLatestSubmission.");
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/responses/{universeId}/submissions/latest".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/responses/{universeId}/submissions/latest",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        questionnaireId: (0, i.exists)(e, "questionnaireId") ? e.questionnaireId : void 0,
                                        submission: (0, i.exists)(e, "submission") ? R(e.submission) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.responsesGetLatestSubmission = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesGetLatestSubmissionRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.responsesGetQuestionnairePublishStatusRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling responsesGetQuestionnairePublishStatus.");
                                if (null === e.submissionId || void 0 === e.submissionId) throw new i.RequiredError("submissionId", "Required parameter requestParameters.submissionId was null or undefined when calling responsesGetQuestionnairePublishStatus.");
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/responses/{universeId}/submissions/{submissionId}/status".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("submissionId", "}"), encodeURIComponent(String(e.submissionId))),
                                    schemaPath: "/v1/responses/{universeId}/submissions/{submissionId}/status",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    return S(e)
                                })]
                        }
                    })
                })
            }, s.prototype.responsesGetQuestionnairePublishStatus = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesGetQuestionnairePublishStatusRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.responsesGetQuestionnairePublishStatusListRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling responsesGetQuestionnairePublishStatusList.");
                                return t = {}, void 0 !== e.pageSize && (t.pageSize = e.pageSize), void 0 !== e.cursor && (t.cursor = e.cursor), n = {}, [4, this.request({
                                    path: "/v1/responses/{universeId}/submissions/statuses".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/responses/{universeId}/submissions/statuses",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        statuses: (0, i.exists)(e, "statuses") ? e.statuses.map(S) : void 0,
                                        nextCursor: (0, i.exists)(e, "nextCursor") ? e.nextCursor : void 0,
                                        hasMore: (0, i.exists)(e, "hasMore") ? e.hasMore : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.responsesGetQuestionnairePublishStatusList = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesGetQuestionnairePublishStatusListRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.responsesGetSubmissionRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling responsesGetSubmission.");
                                if (null === e.submissionId || void 0 === e.submissionId) throw new i.RequiredError("submissionId", "Required parameter requestParameters.submissionId was null or undefined when calling responsesGetSubmission.");
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/responses/{universeId}/submissions/{submissionId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("submissionId", "}"), encodeURIComponent(String(e.submissionId))),
                                    schemaPath: "/v1/responses/{universeId}/submissions/{submissionId}",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        submission: (0, i.exists)(e, "submission") ? R(e.submission) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.responsesGetSubmission = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesGetSubmissionRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.responsesGetSubmissionsRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling responsesGetSubmissions.");
                                return t = {}, void 0 !== e.exclusiveStartKey && (t.exclusiveStartKey = e.exclusiveStartKey), void 0 !== e.count && (t.count = e.count), n = {}, [4, this.request({
                                    path: "/v1/responses/{universeId}/submissions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/responses/{universeId}/submissions",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        submissions: (0, i.exists)(e, "submissions") ? e.submissions.map(R) : void 0,
                                        lastEvaluatedKey: (0, i.exists)(e, "lastEvaluatedKey") ? e.lastEvaluatedKey : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.responsesGetSubmissions = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesGetSubmissionsRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.responsesPreviewDescriptorsRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.previewSubmissionRequestBody || void 0 === e.previewSubmissionRequestBody) throw new i.RequiredError("previewSubmissionRequestBody", "Required parameter requestParameters.previewSubmissionRequestBody was null or undefined when calling responsesPreviewDescriptors.");
                                return t = {}, void 0 !== e.localeCode && (t.localeCode = e.localeCode), (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/responses/preview",
                                    schemaPath: "/v1/responses/preview",
                                    method: "POST",
                                    headers: n,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            universeId: e.universeId,
                                            questionnaireId: e.questionnaireId,
                                            response: g(e.response)
                                        }
                                    }(e.previewSubmissionRequestBody)
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    var s, t, n;
                                    return null == e ? e : {
                                        contentDescriptorUsages: (0, i.exists)(e, "contentDescriptorUsages") ? e.contentDescriptorUsages.map(b) : void 0,
                                        restrictedCountries: (0, i.exists)(e, "restrictedCountries") ? e.restrictedCountries.map(A) : void 0,
                                        referencedContentDescriptors: (0, i.exists)(e, "referencedContentDescriptors") ? e.referencedContentDescriptors.map(I) : void 0,
                                        ageRecommendationDetails: (0, i.exists)(e, "ageRecommendationDetails") ? null == (s = e.ageRecommendationDetails) ? s : {
                                            summary: (0, i.exists)(s, "summary") ? null == (t = s.summary) ? t : {
                                                ageRecommendation: (0, i.exists)(t, "ageRecommendation") ? null == (n = t.ageRecommendation) ? n : {
                                                    displayName: (0, i.exists)(n, "displayName") ? n.displayName : void 0,
                                                    minimumAge: (0, i.exists)(n, "minimumAge") ? n.minimumAge : void 0
                                                } : void 0
                                            } : void 0,
                                            descriptorUsages: (0, i.exists)(s, "descriptorUsages") ? s.descriptorUsages.map(u) : void 0
                                        } : void 0,
                                        contentLanguage: (0, i.exists)(e, "contentLanguage") ? e.contentLanguage : void 0,
                                        userInfoMessage: (0, i.exists)(e, "userInfoMessage") ? e.userInfoMessage : void 0,
                                        userWarningMessage: (0, i.exists)(e, "userWarningMessage") ? e.userWarningMessage : void 0,
                                        userErrorMessage: (0, i.exists)(e, "userErrorMessage") ? e.userErrorMessage : void 0,
                                        disableSubmitButton: (0, i.exists)(e, "disableSubmitButton") ? e.disableSubmitButton : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.responsesPreviewDescriptors = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesPreviewDescriptorsRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.responsesSaveActiveResponseRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling responsesSaveActiveResponse.");
                                if (null === e.saveActiveResponseRequestBody || void 0 === e.saveActiveResponseRequestBody) throw new i.RequiredError("saveActiveResponseRequestBody", "Required parameter requestParameters.saveActiveResponseRequestBody was null or undefined when calling responsesSaveActiveResponse.");
                                return t = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/responses/{universeId}/submissions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/responses/{universeId}/submissions",
                                    method: "PUT",
                                    headers: n,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            questionnaireId: e.questionnaireId,
                                            response: g(e.response)
                                        }
                                    }(e.saveActiveResponseRequestBody)
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r)]
                        }
                    })
                })
            }, s.prototype.responsesSaveActiveResponse = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesSaveActiveResponseRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.responsesSubmitResponseRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling responsesSubmitResponse.");
                                return t = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/responses/{universeId}/submissions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/responses/{universeId}/submissions",
                                    method: "POST",
                                    headers: n,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            questionnaireId: e.questionnaireId,
                                            response: g(e.response)
                                        }
                                    }(e.submitResponseRequestBody)
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        submissionId: (0, i.exists)(e, "submissionId") ? e.submissionId : void 0,
                                        contentDescriptorUsages: (0, i.exists)(e, "contentDescriptorUsages") ? e.contentDescriptorUsages.map(b) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.responsesSubmitResponse = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesSubmitResponseRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.responsesValidateResponseRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.validateResponseRequestBody || void 0 === e.validateResponseRequestBody) throw new i.RequiredError("validateResponseRequestBody", "Required parameter requestParameters.validateResponseRequestBody was null or undefined when calling responsesValidateResponse.");
                                return t = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/responses/validate",
                                    schemaPath: "/v1/responses/validate",
                                    method: "POST",
                                    headers: n,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            questionnaireId: e.questionnaireId,
                                            response: g(e.response)
                                        }
                                    }(e.validateResponseRequestBody)
                                }, s)];
                            case 1:
                                return r = o.sent(), [2, new i.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        isValid: (0, i.exists)(e, "isValid") ? e.isValid : void 0,
                                        failures: (0, i.exists)(e, "failures") ? e.failures.map(T) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.responsesValidateResponse = function(e, i) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.responsesValidateResponseRaw(e, i)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(i.BaseAPI);
    e.s(["EligibilityApi", 0, C, "EligibilityType", 0, {
        None: "None",
        Allowed: "Allowed",
        Required: "Required"
    }, "MetadataApi", 0, E, "MetadataStatus", 0, {
        Invalid: "Invalid",
        Incomplete: "Incomplete",
        Complete: "Complete"
    }, "QuestionnairesApi", 0, G, "ResponsesApi", 0, N, "TextBoxValidationType", 0, {
        Invalid: "Invalid",
        Email: "Email"
    }])
}, 892438, e => {
    "use strict";
    var i = e.i(677753),
        s = function(e, i) {
            return (s = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, i) {
                e.__proto__ = i
            } || function(e, i) {
                for (var s in i) Object.prototype.hasOwnProperty.call(i, s) && (e[s] = i[s])
            })(e, i)
        };

    function t(e, i, s, t) {
        return new(s || (s = Promise))(function(n, r) {
            function o(e) {
                try {
                    u(t.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function a(e) {
                try {
                    u(t.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function u(e) {
                var i;
                e.done ? n(e.value) : ((i = e.value) instanceof s ? i : new s(function(e) {
                    e(i)
                })).then(o, a)
            }
            u((t = t.apply(e, i || [])).next())
        })
    }

    function n(e, i) {
        var s, t, n, r = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = a(0), o.throw = a(1), o.return = a(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function a(a) {
            return function(u) {
                var d = [a, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, d[0] && (r = 0)), r;) try {
                    if (s = 1, t && (n = 2 & d[0] ? t.return : d[0] ? t.throw || ((n = t.return) && n.call(t), 0) : t.next) && !(n = n.call(t, d[1])).done) return n;
                    switch (t = 0, n && (d = [2 & d[0], n.value]), d[0]) {
                        case 0:
                        case 1:
                            n = d;
                            break;
                        case 4:
                            return r.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            r.label++, t = d[1], d = [0];
                            continue;
                        case 7:
                            d = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = r.trys).length > 0 && n[n.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === d[0] && (!n || d[1] > n[0] && d[1] < n[3])) {
                                r.label = d[1];
                                break
                            }
                            if (6 === d[0] && r.label < n[1]) {
                                r.label = n[1], n = d;
                                break
                            }
                            if (n && r.label < n[2]) {
                                r.label = n[2], r.ops.push(d);
                                break
                            }
                            n[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    d = i.call(e, r)
                } catch (e) {
                    d = [6, e], t = 0
                } finally {
                    s = n = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function r(e) {
        var s;
        return null == (s = e) ? s : {
            universeId: (0, i.exists)(s, "universeId") ? s.universeId : void 0,
            type: (0, i.exists)(s, "type") ? s.type : void 0,
            createTime: (0, i.exists)(s, "createTime") ? s.createTime : void 0,
            details: (0, i.exists)(s, "details") ? s.details : void 0,
            id: (0, i.exists)(s, "id") ? s.id : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var o = function(e) {
        function o() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, i) {
            if ("function" != typeof i && null !== i) throw TypeError("Class extends value " + String(i) + " is not a constructor or null");

            function t() {
                this.constructor = e
            }
            s(e, i), e.prototype = null === i ? Object.create(i) : (t.prototype = i.prototype, new t)
        }(o, e), o.prototype.v1UniversesUniverseIdIarcActivitiesGetRaw = function(e, s) {
            return t(this, void 0, void 0, function() {
                var t, o, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdIarcActivitiesGet.");
                            return t = {}, void 0 !== e.pageSize && (t.pageSize = e.pageSize), void 0 !== e.pageToken && (t.pageToken = e.pageToken), o = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/iarcActivities".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/iarcActivities",
                                method: "GET",
                                headers: o,
                                query: t
                            }, s)];
                        case 1:
                            return a = n.sent(), [2, new i.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    iarcActivities: (0, i.exists)(e, "iarcActivities") ? e.iarcActivities.map(r) : void 0,
                                    nextPageToken: (0, i.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, o.prototype.v1UniversesUniverseIdIarcActivitiesGet = function(e, i) {
            return t(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.v1UniversesUniverseIdIarcActivitiesGetRaw(e, i)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, o.prototype.v1UniversesUniverseIdIarcActivitiesIdGetRaw = function(e, s) {
            return t(this, void 0, void 0, function() {
                var t, o, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new i.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdIarcActivitiesIdGet.");
                            if (null === e.id || void 0 === e.id) throw new i.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling v1UniversesUniverseIdIarcActivitiesIdGet.");
                            return t = {}, o = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/iarcActivities/{id}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                schemaPath: "/v1/universes/{universeId}/iarcActivities/{id}",
                                method: "GET",
                                headers: o,
                                query: t
                            }, s)];
                        case 1:
                            return a = n.sent(), [2, new i.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    iarcActivity: (0, i.exists)(e, "iarcActivity") ? r(e.iarcActivity) : void 0
                                }
                            })]
                    }
                })
            })
        }, o.prototype.v1UniversesUniverseIdIarcActivitiesIdGet = function(e, i) {
            return t(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.v1UniversesUniverseIdIarcActivitiesIdGetRaw(e, i)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, o
    }(i.BaseAPI);
    e.s(["IarcActivityServiceAPIApi", 0, o])
}]);

//# debugId=2899f9d0-622b-f9ba-c547-e6c2929b8d24
//# sourceMappingURL=1dut4f6rscod7.js.map