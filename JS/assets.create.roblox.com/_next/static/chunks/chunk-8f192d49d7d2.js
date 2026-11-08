;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f2d9bbe7-3467-610b-6694-ab26ce2c3f46")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 605050, 665591, e => {
    "use strict";
    var t = e.i(601362),
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
        return new(n || (n = Promise))(function(r, s) {
            function o(e) {
                try {
                    a(i.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function l(e) {
                try {
                    a(i.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function a(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, l)
            }
            a((i = i.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var n, i, r, s = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = l(0), o.throw = l(1), o.return = l(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function l(l) {
            return function(a) {
                var u = [l, a];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (s = 0)), s;) try {
                    if (n = 1, i && (r = 2 & u[0] ? i.return : u[0] ? i.throw || ((r = i.return) && r.call(i), 0) : i.next) && !(r = r.call(i, u[1])).done) return r;
                    switch (i = 0, r && (u = [2 & u[0], r.value]), u[0]) {
                        case 0:
                        case 1:
                            r = u;
                            break;
                        case 4:
                            return s.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            s.label++, i = u[1], u = [0];
                            continue;
                        case 7:
                            u = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = s.trys).length > 0 && r[r.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === u[0] && (!r || u[1] > r[0] && u[1] < r[3])) {
                                s.label = u[1];
                                break
                            }
                            if (6 === u[0] && s.label < r[1]) {
                                s.label = r[1], r = u;
                                break
                            }
                            if (r && s.label < r[2]) {
                                s.label = r[2], s.ops.push(u);
                                break
                            }
                            r[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    u = t.call(e, s)
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

    function o(e) {
        return e
    }

    function l(e) {
        return e
    }

    function a(e) {
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

    function u(e) {
        var n;
        return null == (n = e) ? n : {
            key: n.key,
            metadata: (0, t.exists)(n, "metadata") ? n.metadata : void 0
        }
    }

    function c(e) {
        return e
    }

    function d(e) {
        var n;
        return null == (n = e) ? n : {
            selectStatus: n.selectStatus,
            reasons: n.reasons.map(c),
            indicator: (0, t.exists)(n, "indicator") ? n.indicator : void 0,
            engagedPlayersCount: (0, t.exists)(n, "engagedPlayersCount") ? n.engagedPlayersCount : void 0,
            engagedPlayersUpdatedAt: (0, t.exists)(n, "engagedPlayersUpdatedAt") ? null === n.engagedPlayersUpdatedAt ? null : new Date(n.engagedPlayersUpdatedAt) : void 0,
            thresholdTrigger: n.thresholdTrigger,
            thresholdReset: n.thresholdReset,
            gracePeriodDays: n.gracePeriodDays,
            publishedToGatedAudience: n.publishedToGatedAudience,
            reasonsMetadata: n.reasonsMetadata,
            underReview: (0, t.exists)(n, "underReview") ? n.underReview : void 0,
            ownerEveryoneTierWithoutSubscription: n.ownerEveryoneTierWithoutSubscription,
            activeAllowlists: (0, t.exists)(n, "activeAllowlists") ? null === n.activeAllowlists ? null : n.activeAllowlists.map(o) : void 0
        }
    }

    function v(e) {
        return e
    }

    function h(e) {
        return e
    }

    function p(e) {
        var n;
        return null == (n = e) ? n : {
            key: n.key,
            metadata: (0, t.exists)(n, "metadata") ? n.metadata : void 0
        }
    }

    function f(e) {
        return e
    }

    function w(e) {
        var t;
        return null == (t = e) ? t : {
            tier: f(t.tier),
            isRequired: t.isRequired
        }
    }

    function y(e) {
        var t;
        return null == (t = e) ? t : {
            id: v(t.id),
            isCompleted: t.isCompleted,
            isEnabled: t.isEnabled,
            tierRequirements: t.tierRequirements.map(w)
        }
    }

    function C(e) {
        var t;
        return null == (t = e) ? t : {
            id: t.id,
            universeId: t.universeId,
            allowlistType: o(t.allowlistType),
            status: t.status,
            createdTime: new Date(t.createdTime),
            updatedTime: new Date(t.updatedTime)
        }
    }

    function m(e, t) {
        return null == e ? e : {
            universeId: e.universeId,
            records: e.records.map(C)
        }
    }

    function b(e, n) {
        return null == e ? e : {
            status: e.status,
            amount: (0, t.exists)(e, "amount") ? e.amount : void 0,
            paidAt: (0, t.exists)(e, "paidAt") ? null === e.paidAt ? null : new Date(e.paidAt) : void 0,
            refundAvailableAt: (0, t.exists)(e, "refundAvailableAt") ? null === e.refundAvailableAt ? null : new Date(e.refundAvailableAt) : void 0,
            refundPeriodDays: (0, t.exists)(e, "refundPeriodDays") ? e.refundPeriodDays : void 0,
            canView: e.canView,
            canPay: e.canPay,
            forceGroupFunds: e.forceGroupFunds
        }
    }
    var g = function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        return i(n, e), n.prototype.coreContentBatchGetUniversePublishEligibilityRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.coreContentBatchGetUniversePublishEligibilityRequest || void 0 === e.coreContentBatchGetUniversePublishEligibilityRequest) throw new t.RequiredError("coreContentBatchGetUniversePublishEligibilityRequest", "Required parameter requestParameters.coreContentBatchGetUniversePublishEligibilityRequest was null or undefined when calling coreContentBatchGetUniversePublishEligibility.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/universe-eligibility/batch",
                                schemaPath: "/v1/universe-eligibility/batch",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeIds: e.universeIds
                                    }
                                }(e.coreContentBatchGetUniversePublishEligibilityRequest)
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    universeEligibilities: (0, t.mapValues)(e.universeEligibilities, d)
                                }
                            })]
                    }
                })
            })
        }, n.prototype.coreContentBatchGetUniversePublishEligibility = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentBatchGetUniversePublishEligibilityRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.coreContentEnrollAllowlistSelfEnrollmentRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.coreContentEnrollAllowlistSelfEnrollmentRequest || void 0 === e.coreContentEnrollAllowlistSelfEnrollmentRequest) throw new t.RequiredError("coreContentEnrollAllowlistSelfEnrollmentRequest", "Required parameter requestParameters.coreContentEnrollAllowlistSelfEnrollmentRequest was null or undefined when calling coreContentEnrollAllowlistSelfEnrollment.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/allowlist-self-enrollment",
                                schemaPath: "/v1/allowlist-self-enrollment",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId
                                    }
                                }(e.coreContentEnrollAllowlistSelfEnrollmentRequest)
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return m(e)
                            })]
                    }
                })
            })
        }, n.prototype.coreContentEnrollAllowlistSelfEnrollment = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentEnrollAllowlistSelfEnrollmentRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.coreContentGetAllowlistSelfEnrollmentEligibilityRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling coreContentGetAllowlistSelfEnrollmentEligibility.");
                            return i = {}, void 0 !== e.universeId && (i.universeId = e.universeId), r = {}, [4, this.request({
                                path: "/v1/allowlist-self-enrollment-eligibility",
                                schemaPath: "/v1/allowlist-self-enrollment-eligibility",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    isEligible: e.isEligible
                                }
                            })]
                    }
                })
            })
        }, n.prototype.coreContentGetAllowlistSelfEnrollmentEligibility = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentGetAllowlistSelfEnrollmentEligibilityRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.coreContentGetCreatorEligibilityRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling coreContentGetCreatorEligibility.");
                            return i = {}, r = {}, [4, this.request({
                                path: "/v1/creator-eligibility/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/creator-eligibility/{userId}",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    creatorEligibility: e.creatorEligibility.map(v),
                                    creatorTier: f(e.creatorTier),
                                    ageBracket: e.ageBracket,
                                    warnings: e.warnings.map(h),
                                    warningMetadata: e.warningMetadata,
                                    allowlistTier: e.allowlistTier.map(f),
                                    everyoneTierWithoutSubscription: e.everyoneTierWithoutSubscription,
                                    countryCode: e.countryCode
                                }
                            })]
                    }
                })
            })
        }, n.prototype.coreContentGetCreatorEligibility = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentGetCreatorEligibilityRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.coreContentGetCreatorPublishPermissionsRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling coreContentGetCreatorPublishPermissions.");
                            return i = {}, r = {}, [4, this.request({
                                path: "/v2/user/{userId}/publish-permissions".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v2/user/{userId}/publish-permissions",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    currentTier: f(e.currentTier),
                                    tierOrder: e.tierOrder.map(f),
                                    requirements: e.requirements.map(y),
                                    ageBracket: e.ageBracket,
                                    countryCode: e.countryCode,
                                    hasExemptSubscription: (0, t.exists)(e, "hasExemptSubscription") ? e.hasExemptSubscription : void 0,
                                    notices: e.notices.map(p)
                                }
                            })]
                    }
                })
            })
        }, n.prototype.coreContentGetCreatorPublishPermissions = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentGetCreatorPublishPermissionsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.coreContentGetRealtimeSelectStatusForUniverseRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling coreContentGetRealtimeSelectStatusForUniverse.");
                            return i = {}, r = {}, [4, this.request({
                                path: "/v1/universe-eligibility/{universeId}/realtime-select-status".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universe-eligibility/{universeId}/realtime-select-status",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    selectStatus: e.selectStatus,
                                    reasons: e.reasons.map(c)
                                }
                            })]
                    }
                })
            })
        }, n.prototype.coreContentGetRealtimeSelectStatusForUniverse = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentGetRealtimeSelectStatusForUniverseRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.coreContentGetUniverseAgeEstimationStatusRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling coreContentGetUniverseAgeEstimationStatus.");
                            return i = {}, r = {}, [4, this.request({
                                path: "/v2/universe/{universeId}/age-estimation-status".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v2/universe/{universeId}/age-estimation-status",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    isAgeEstimationVerified: e.isAgeEstimationVerified,
                                    canInvitePlaytesters: e.canInvitePlaytesters
                                }
                            })]
                    }
                })
            })
        }, n.prototype.coreContentGetUniverseAgeEstimationStatus = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentGetUniverseAgeEstimationStatusRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.coreContentGetUniverseAudienceReachRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling coreContentGetUniverseAudienceReach.");
                            return i = {}, r = {}, [4, this.request({
                                path: "/v2/universe/{universeId}/audience-reach".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v2/universe/{universeId}/audience-reach",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                var n, i, r;
                                return null == e ? e : {
                                    universeAudienceReach: e.universeAudienceReach,
                                    creatorReach: null == (n = e.creatorReach) ? n : {
                                        creatorTier: f(n.creatorTier),
                                        isGroupOwned: n.isGroupOwned,
                                        isCreator: n.isCreator,
                                        canManage: n.canManage
                                    },
                                    contentMaturity: null == (i = e.contentMaturity) ? i : {
                                        displayName: (0, t.exists)(i, "displayName") ? i.displayName : void 0,
                                        minimumAge: i.minimumAge,
                                        descriptors: i.descriptors,
                                        contentMaturity: i.contentMaturity,
                                        isUnrated: i.isUnrated
                                    },
                                    refundablePublishingFee: b(e.refundablePublishingFee),
                                    expeditedPublishingFee: b(e.expeditedPublishingFee),
                                    highlyEngagedPlayers: null == (r = e.highlyEngagedPlayers) ? r : {
                                        status: r.status,
                                        engagedPlayersCount: r.engagedPlayersCount,
                                        updatedAt: (0, t.exists)(r, "updatedAt") ? null === r.updatedAt ? null : new Date(r.updatedAt) : void 0,
                                        thresholdTrigger: r.thresholdTrigger,
                                        thresholdReset: r.thresholdReset,
                                        graceDeadline: (0, t.exists)(r, "graceDeadline") ? null === r.graceDeadline ? null : new Date(r.graceDeadline) : void 0,
                                        thresholdBarColor: r.thresholdBarColor
                                    },
                                    notices: e.notices.map(u)
                                }
                            })]
                    }
                })
            })
        }, n.prototype.coreContentGetUniverseAudienceReach = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentGetUniverseAudienceReachRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.coreContentGetUniverseChipStatusRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling coreContentGetUniverseChipStatus.");
                            return i = {}, r = {}, [4, this.request({
                                path: "/v2/universe/{universeId}/chip-status".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v2/universe/{universeId}/chip-status",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    chipStatus: e.chipStatus,
                                    iconName: e.iconName,
                                    translatedStatus: e.translatedStatus,
                                    variant: e.variant
                                }
                            })]
                    }
                })
            })
        }, n.prototype.coreContentGetUniverseChipStatus = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentGetUniverseChipStatusRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.coreContentGetUniverseCreatorEligibilityRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling coreContentGetUniverseCreatorEligibility.");
                            return i = {}, r = {}, [4, this.request({
                                path: "/v1/universe-eligibility/{universeId}/creator-eligibility".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universe-eligibility/{universeId}/creator-eligibility",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    creatorTier: f(e.creatorTier)
                                }
                            })]
                    }
                })
            })
        }, n.prototype.coreContentGetUniverseCreatorEligibility = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentGetUniverseCreatorEligibilityRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.coreContentNotifyUniversePublicPublishRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.coreContentNotifyUniversePublicPublishRequest || void 0 === e.coreContentNotifyUniversePublicPublishRequest) throw new t.RequiredError("coreContentNotifyUniversePublicPublishRequest", "Required parameter requestParameters.coreContentNotifyUniversePublicPublishRequest was null or undefined when calling coreContentNotifyUniversePublicPublish.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/universe-eligibility/notify-public-publish",
                                schemaPath: "/v1/universe-eligibility/notify-public-publish",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId
                                    }
                                }(e.coreContentNotifyUniversePublicPublishRequest)
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.VoidApiResponse(o)]
                    }
                })
            })
        }, n.prototype.coreContentNotifyUniversePublicPublish = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentNotifyUniversePublicPublishRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, n
    }(t.BaseAPI);
    (function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(n, e), n.prototype.internalCoreContentEnqueueSafetyCheckRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.internalCoreContentEnqueueSafetyCheckRequest || void 0 === e.internalCoreContentEnqueueSafetyCheckRequest) throw new t.RequiredError("internalCoreContentEnqueueSafetyCheckRequest", "Required parameter requestParameters.internalCoreContentEnqueueSafetyCheckRequest was null or undefined when calling internalCoreContentEnqueueSafetyCheck.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/internal/safety-check/enqueue",
                                schemaPath: "/v1/internal/safety-check/enqueue",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        sfcType: e.sfcType,
                                        idempotencyToken: e.idempotencyToken
                                    }
                                }(e.internalCoreContentEnqueueSafetyCheckRequest)
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.VoidApiResponse(o)]
                    }
                })
            })
        }, n.prototype.internalCoreContentEnqueueSafetyCheck = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentEnqueueSafetyCheckRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, n.prototype.internalCoreContentGetUniverseAllowlistRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling internalCoreContentGetUniverseAllowlist.");
                            return i = {}, r = {}, [4, this.request({
                                path: "/v1/internal/universe-allowlist/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/internal/universe-allowlist/{universeId}",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return m(e)
                            })]
                    }
                })
            })
        }, n.prototype.internalCoreContentGetUniverseAllowlist = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentGetUniverseAllowlistRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.internalCoreContentHandleUniverseAllowlistDecisionWebhookRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/internal/moderation/universe-allowlist/decision",
                                schemaPath: "/v1/internal/moderation/universe-allowlist/decision",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        annotations: void 0 === e.annotations ? void 0 : null === e.annotations ? null : e.annotations.map(a),
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
                                }(e.internalCoreContentHandleUniverseAllowlistDecisionWebhookRequest)
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return m(e)
                            })]
                    }
                })
            })
        }, n.prototype.internalCoreContentHandleUniverseAllowlistDecisionWebhook = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentHandleUniverseAllowlistDecisionWebhookRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.internalCoreContentInvestigateUniverseRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, l;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling internalCoreContentInvestigateUniverse.");
                            return i = {}, r = {}, [4, this.request({
                                path: "/v1/internal/investigation/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/internal/investigation/{universeId}",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return l = s.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                var n, i, r, s, l;
                                return null == e ? e : {
                                    universeEligibility: null == (n = e.universeEligibility) ? n : {
                                        selectStatus: n.selectStatus,
                                        reasons: n.reasons.map(c),
                                        indicator: (0, t.exists)(n, "indicator") ? n.indicator : void 0,
                                        engagedPlayersCount: (0, t.exists)(n, "engagedPlayersCount") ? n.engagedPlayersCount : void 0,
                                        engagedPlayersUpdatedAt: (0, t.exists)(n, "engagedPlayersUpdatedAt") ? null === n.engagedPlayersUpdatedAt ? null : new Date(n.engagedPlayersUpdatedAt) : void 0,
                                        thresholdTrigger: n.thresholdTrigger,
                                        thresholdReset: n.thresholdReset,
                                        gracePeriodDays: n.gracePeriodDays,
                                        publishedToGatedAudience: n.publishedToGatedAudience,
                                        reasonsMetadata: n.reasonsMetadata,
                                        underReview: (0, t.exists)(n, "underReview") ? n.underReview : void 0,
                                        ownerEveryoneTierWithoutSubscription: n.ownerEveryoneTierWithoutSubscription,
                                        activeAllowlists: (0, t.exists)(n, "activeAllowlists") ? null === n.activeAllowlists ? null : n.activeAllowlists.map(o) : void 0
                                    },
                                    creatorPublishPermissions: null == (i = e.creatorPublishPermissions) ? i : {
                                        currentTier: f(i.currentTier),
                                        tierOrder: i.tierOrder.map(f),
                                        requirements: i.requirements.map(y),
                                        ageBracket: i.ageBracket,
                                        countryCode: i.countryCode,
                                        hasExemptSubscription: (0, t.exists)(i, "hasExemptSubscription") ? i.hasExemptSubscription : void 0,
                                        notices: i.notices.map(p)
                                    },
                                    effectiveCreatorTier: f(e.effectiveCreatorTier),
                                    contentCatalog: null == (r = e.contentCatalog) ? r : {
                                        hasQppEligibility: (0, t.exists)(r, "hasQppEligibility") ? r.hasQppEligibility : void 0,
                                        creatorPublishEligibility: (0, t.exists)(r, "creatorPublishEligibility") ? r.creatorPublishEligibility : void 0
                                    },
                                    publishFee: null == (s = e.publishFee) ? s : {
                                        hasDeposit: s.hasDeposit,
                                        createdTime: (0, t.exists)(s, "createdTime") ? null === s.createdTime ? null : new Date(s.createdTime) : void 0
                                    },
                                    expeditedFee: null == (l = e.expeditedFee) ? l : {
                                        hasDeposit: l.hasDeposit,
                                        createdTime: (0, t.exists)(l, "createdTime") ? null === l.createdTime ? null : new Date(l.createdTime) : void 0
                                    },
                                    temporaryExpeditedFeeBypassStatus: (0, t.exists)(e, "temporaryExpeditedFeeBypassStatus") ? e.temporaryExpeditedFeeBypassStatus : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.internalCoreContentInvestigateUniverse = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentInvestigateUniverseRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.internalCoreContentListAllowlistsRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.internalCoreContentListAllowlistsRequest || void 0 === e.internalCoreContentListAllowlistsRequest) throw new t.RequiredError("internalCoreContentListAllowlistsRequest", "Required parameter requestParameters.internalCoreContentListAllowlistsRequest was null or undefined when calling internalCoreContentListAllowlists.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/internal/universe-allowlist/list",
                                schemaPath: "/v1/internal/universe-allowlist/list",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        allowlistType: e.allowlistType,
                                        status: e.status,
                                        exclusiveStartTimeUtcMs: e.exclusiveStartTimeUtcMs,
                                        inclusiveEndTimeUtcMs: e.inclusiveEndTimeUtcMs,
                                        limit: e.limit,
                                        cursor: e.cursor
                                    }
                                }(e.internalCoreContentListAllowlistsRequest)
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    records: e.records.map(C),
                                    nextCursor: (0, t.exists)(e, "nextCursor") ? e.nextCursor : void 0,
                                    hasMore: e.hasMore
                                }
                            })]
                    }
                })
            })
        }, n.prototype.internalCoreContentListAllowlists = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentListAllowlistsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.internalCoreContentPromoteUniverseCreatorPublishEligibilityRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest || void 0 === e.internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest) throw new t.RequiredError("internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest", "Required parameter requestParameters.internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest was null or undefined when calling internalCoreContentPromoteUniverseCreatorPublishEligibility.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/internal/universe-eligibility/promote-creator-publish-eligibility",
                                schemaPath: "/v1/internal/universe-eligibility/promote-creator-publish-eligibility",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId
                                    }
                                }(e.internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest)
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.VoidApiResponse(o)]
                    }
                })
            })
        }, n.prototype.internalCoreContentPromoteUniverseCreatorPublishEligibility = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentPromoteUniverseCreatorPublishEligibilityRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, n.prototype.internalCoreContentRevokeUniverseAllowlistRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling internalCoreContentRevokeUniverseAllowlist.");
                            if (null === e.internalCoreContentRevokeUniverseAllowlistRequest || void 0 === e.internalCoreContentRevokeUniverseAllowlistRequest) throw new t.RequiredError("internalCoreContentRevokeUniverseAllowlistRequest", "Required parameter requestParameters.internalCoreContentRevokeUniverseAllowlistRequest was null or undefined when calling internalCoreContentRevokeUniverseAllowlist.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/internal/universe-allowlist/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/internal/universe-allowlist/{universeId}",
                                method: "PATCH",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        allowlistTypes: e.allowlistTypes.map(l)
                                    }
                                }(e.internalCoreContentRevokeUniverseAllowlistRequest)
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return m(e)
                            })]
                    }
                })
            })
        }, n.prototype.internalCoreContentRevokeUniverseAllowlist = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentRevokeUniverseAllowlistRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.internalCoreContentUpdateSelectEligibilityRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.internalCoreContentUpdateSelectEligibilityRequest || void 0 === e.internalCoreContentUpdateSelectEligibilityRequest) throw new t.RequiredError("internalCoreContentUpdateSelectEligibilityRequest", "Required parameter requestParameters.internalCoreContentUpdateSelectEligibilityRequest was null or undefined when calling internalCoreContentUpdateSelectEligibility.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/internal/universe-eligibility/select",
                                schemaPath: "/v1/internal/universe-eligibility/select",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        qppHighWater: e.qppHighWater,
                                        creatorEligibilityTier: e.creatorEligibilityTier,
                                        forceUpsert: e.forceUpsert
                                    }
                                }(e.internalCoreContentUpdateSelectEligibilityRequest)
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.VoidApiResponse(o)]
                    }
                })
            })
        }, n.prototype.internalCoreContentUpdateSelectEligibility = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentUpdateSelectEligibilityRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, n.prototype.internalCoreContentUpsertUniverseAllowlistRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, o;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.internalCoreContentUpsertUniverseAllowlistRequest || void 0 === e.internalCoreContentUpsertUniverseAllowlistRequest) throw new t.RequiredError("internalCoreContentUpsertUniverseAllowlistRequest", "Required parameter requestParameters.internalCoreContentUpsertUniverseAllowlistRequest was null or undefined when calling internalCoreContentUpsertUniverseAllowlist.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/internal/universe-allowlist",
                                schemaPath: "/v1/internal/universe-allowlist",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        allowlistTypes: e.allowlistTypes.map(l)
                                    }
                                }(e.internalCoreContentUpsertUniverseAllowlistRequest)
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return m(e)
                            })]
                    }
                })
            })
        }, n.prototype.internalCoreContentUpsertUniverseAllowlist = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentUpsertUniverseAllowlistRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    })(t.BaseAPI), e.s(["AgeBracketEnum", 0, {
        Unknown: "Unknown",
        Under13: "Under13",
        Between13And18: "Between13And18",
        Over18: "Over18"
    }, "AudienceReachNoticeKeyEnum", 0, {
        UnderReview: "underReview",
        ExpeditedPending: "expeditedPending",
        ExpeditedCompleted: "expeditedCompleted",
        Restricted: "restricted",
        DiscoveryBlocked: "discoveryBlocked",
        Unrated: "unrated",
        PublishingTierAtRisk: "publishingTierAtRisk",
        ExpandReach: "expandReach",
        ThresholdAtRisk: "thresholdAtRisk",
        ExpeditedUpsell: "expeditedUpsell",
        AllowlistSelfEnrollment: "allowlistSelfEnrollment",
        PublishingFeeUpsell: "publishingFeeUpsell"
    }, "CoreContentApi", 0, g, "CreatorEligibilityEnum", 0, {
        AgeEstimationVerified: "AgeEstimationVerified",
        IdVerified: "IdVerified",
        HasRobloxPremium: "HasRobloxPremium",
        Has2SvEnabled: "Has2SVEnabled",
        ModerationStatusOk: "ModerationStatusOk",
        HasActiveSubscription: "HasActiveSubscription",
        PhoneVerified: "PhoneVerified"
    }, "CreatorNoticeKeyEnum", 0, {
        ParentLinkExpiration: "parentLinkExpiration",
        PlusEligibility: "plusEligibility",
        CurrentTierAllowlisted: "currentTierAllowlisted",
        PlusGrantGracePeriod: "plusGrantGracePeriod",
        PlusGrantEndingSoon: "plusGrantEndingSoon",
        PlusGrantExpired: "plusGrantExpired"
    }, "CreatorTierEnum", 0, {
        Blocked: "Blocked",
        Private: "Private",
        Trusted: "Trusted",
        Everyone: "Everyone"
    }, "HighlyEngagedPlayersStatusEnum", 0, {
        Eligible: "Eligible",
        NotEligible: "NotEligible",
        NotApplicable: "NotApplicable",
        Exempt: "Exempt"
    }, "PublishingFeeStatusEnum", 0, {
        NotAvailable: "NotAvailable",
        NotSubmitted: "NotSubmitted",
        Paid: "Paid",
        Exempt: "Exempt",
        Refunded: "Refunded"
    }, "ReasonEnum", 0, {
        Threshold: "Threshold",
        CreatorEligibility: "CreatorEligibility",
        Audience: "Audience"
    }, "SelectStatusEnum", 0, {
        Eligible: "Eligible",
        NotEligible: "NotEligible",
        NotApplicable: "NotApplicable"
    }, "UniverseAudienceReachEnum", 0, {
        AllAges: "AllAges",
        Ages5Plus: "Ages5Plus",
        Ages9Plus: "Ages9Plus",
        Ages13Plus: "Ages13Plus",
        Ages16Plus: "Ages16Plus",
        Ages16PlusAndTrustedFriends: "Ages16PlusAndTrustedFriends",
        Ages17Plus: "Ages17Plus",
        Ages18Plus: "Ages18Plus",
        PersonalUse: "PersonalUse",
        Private: "Private"
    }], 665591);
    let R = new g((0, e.i(272593).createClientConfiguration)("core-content", "bedev2"));
    e.s(["default", 0, R], 605050)
}]);

//# debugId=f2d9bbe7-3467-610b-6694-ab26ce2c3f46
//# sourceMappingURL=17fbir18ozegn.js.map