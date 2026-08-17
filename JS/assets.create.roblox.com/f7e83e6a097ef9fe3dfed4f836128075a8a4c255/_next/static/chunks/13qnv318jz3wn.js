;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "c4749507-6342-969f-b69d-707c4eed71f7")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 261482, 858148, 966956, 719743, 477749, e => {
    "use strict";
    var t, s = e.i(157310),
        r = e.i(721281),
        i = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var s in t) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s])
            })(e, t)
        };

    function a(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function s() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (s.prototype = t.prototype, new s)
    }

    function o(e, t, s, r) {
        return new(s || (s = Promise))(function(i, n) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    n(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    n(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function u(e, t) {
        var s, r, i, n = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var d = [o, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, d[0] && (n = 0)), n;) try {
                    if (s = 1, r && (i = 2 & d[0] ? r.return : d[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, d[1])).done) return i;
                    switch (r = 0, i && (d = [2 & d[0], i.value]), d[0]) {
                        case 0:
                        case 1:
                            i = d;
                            break;
                        case 4:
                            return n.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            n.label++, r = d[1], d = [0];
                            continue;
                        case 7:
                            d = n.ops.pop(), n.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = n.trys).length > 0 && i[i.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                n = 0;
                                continue
                            }
                            if (3 === d[0] && (!i || d[1] > i[0] && d[1] < i[3])) {
                                n.label = d[1];
                                break
                            }
                            if (6 === d[0] && n.label < i[1]) {
                                n.label = i[1], i = d;
                                break
                            }
                            if (i && n.label < i[2]) {
                                n.label = i[2], n.ops.push(d);
                                break
                            }
                            i[2] && n.ops.pop(), n.trys.pop();
                            continue
                    }
                    d = t.call(e, n)
                } catch (e) {
                    d = [6, e], r = 0
                } finally {
                    s = i = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            label_id: e.labelId,
            target_id: e.targetId,
            target_type: e.targetType,
            values: e.values,
            attributes: e.attributes,
            from_name_ls: e.fromNameLs,
            type_ls: e.typeLs,
            omit_alignment: e.omitAlignment,
            raw_ls: e.rawLs
        }
    }

    function l(e) {
        var t, s;
        return null == (t = e) ? t : {
            virtualPurchasingProductId: (0, i.exists)(t, "virtualPurchasingProductId") ? t.virtualPurchasingProductId : void 0,
            virtualPurchasingProductType: (0, i.exists)(t, "virtualPurchasingProductType") ? t.virtualPurchasingProductType : void 0,
            virtualPurchasingProductTargetId: (0, i.exists)(t, "virtualPurchasingProductTargetId") ? t.virtualPurchasingProductTargetId : void 0,
            universalProductIdentifier: (0, i.exists)(t, "universalProductIdentifier") ? null == (s = t.universalProductIdentifier) ? s : {
                namespace: (0, i.exists)(s, "namespace") ? s.namespace : void 0,
                targetIdentifier: (0, i.exists)(s, "targetIdentifier") ? s.targetIdentifier : void 0
            } : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function c(e) {
        var t, s, r;
        return null == (t = e) ? t : {
            bonus: (0, i.exists)(t, "bonus") ? l(t.bonus) : void 0,
            gamePassPayload: (0, i.exists)(t, "gamePassPayload") ? null == (s = t.gamePassPayload) ? s : {
                rootPlaceId: (0, i.exists)(s, "rootPlaceId") ? s.rootPlaceId : void 0,
                gamePassDisplayName: (0, i.exists)(s, "gamePassDisplayName") ? s.gamePassDisplayName : void 0,
                experienceDisplayName: (0, i.exists)(s, "experienceDisplayName") ? s.experienceDisplayName : void 0,
                gamePassDisplayImageUrl: (0, i.exists)(s, "gamePassDisplayImageUrl") ? s.gamePassDisplayImageUrl : void 0,
                experienceImageUrl: (0, i.exists)(s, "experienceImageUrl") ? s.experienceImageUrl : void 0,
                experienceRatingText: (0, i.exists)(s, "experienceRatingText") ? s.experienceRatingText : void 0
            } : void 0,
            avatarItemPayload: (0, i.exists)(t, "avatarItemPayload") ? null == (r = t.avatarItemPayload) ? r : {
                assetId: (0, i.exists)(r, "assetId") ? r.assetId : void 0,
                displayName: (0, i.exists)(r, "displayName") ? r.displayName : void 0,
                thumbnailUrl: (0, i.exists)(r, "thumbnailUrl") ? r.thumbnailUrl : void 0,
                hasThumbnailUrl: (0, i.exists)(r, "hasThumbnailUrl") ? r.hasThumbnailUrl : void 0,
                creatorName: (0, i.exists)(r, "creatorName") ? r.creatorName : void 0,
                hasCreatorName: (0, i.exists)(r, "hasCreatorName") ? r.hasCreatorName : void 0,
                creatorIsVerified: (0, i.exists)(r, "creatorIsVerified") ? r.creatorIsVerified : void 0,
                hasCreatorIsVerified: (0, i.exists)(r, "hasCreatorIsVerified") ? r.hasCreatorIsVerified : void 0,
                backgroundImageUrl: (0, i.exists)(r, "backgroundImageUrl") ? r.backgroundImageUrl : void 0,
                hasBackgroundImageUrl: (0, i.exists)(r, "hasBackgroundImageUrl") ? r.hasBackgroundImageUrl : void 0,
                thumbnailAnimatedUrl: (0, i.exists)(r, "thumbnailAnimatedUrl") ? r.thumbnailAnimatedUrl : void 0,
                hasThumbnailAnimatedUrl: (0, i.exists)(r, "hasThumbnailAnimatedUrl") ? r.hasThumbnailAnimatedUrl : void 0
            } : void 0,
            offeringType: (0, i.exists)(t, "offeringType") ? t.offeringType : void 0,
            expirationTimestampMs: (0, i.exists)(t, "expirationTimestampMs") ? t.expirationTimestampMs : void 0
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            productNamespace: e.productNamespace,
            productId: e.productId,
            bonusPoliciesName: e.bonusPoliciesName
        }
    }

    function v(e) {
        var t, s;
        return null == (t = e) ? t : {
            key: (0, i.exists)(t, "key") ? null == (s = t.key) ? s : {
                productNamespace: (0, i.exists)(s, "productNamespace") ? s.productNamespace : void 0,
                productId: (0, i.exists)(s, "productId") ? s.productId : void 0,
                bonusPoliciesName: (0, i.exists)(s, "bonusPoliciesName") ? s.bonusPoliciesName : void 0,
                hasBonusPoliciesName: (0, i.exists)(s, "hasBonusPoliciesName") ? s.hasBonusPoliciesName : void 0
            } : void 0,
            displayableBonuses: (0, i.exists)(t, "displayableBonuses") ? null === t.displayableBonuses ? null : t.displayableBonuses.map(c) : void 0
        }
    }

    function m(e, t) {
        return null == e ? e : {
            selectedDisplayableBonuses: (0, i.exists)(e, "selectedDisplayableBonuses") ? null === e.selectedDisplayableBonuses ? null : e.selectedDisplayableBonuses.map(c) : void 0
        }
    }
    var h = i.BaseAPI;

    function f() {
        return null !== h && h.apply(this, arguments) || this
    }
    a(f, h), f.prototype.paymentsBonusModerationApplyBonusModerationDecisionRaw = function(e, t) {
        return o(this, void 0, void 0, function() {
            var s, r, n;
            return u(this, function(a) {
                switch (a.label) {
                    case 0:
                        return s = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                            path: "/v1/moderation-decision",
                            schemaPath: "/v1/moderation-decision",
                            method: "POST",
                            headers: r,
                            query: s,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    decision_id: e.decisionId,
                                    decision_event_id: e.decisionEventId,
                                    idempotency_key: e.idempotencyKey,
                                    reasons: e.reasons,
                                    associated_entity: e.associatedEntity,
                                    decider_id: e.deciderId,
                                    decider_type: e.deciderType,
                                    labels: e.labels,
                                    ticket_id: e.ticketId,
                                    annotations: void 0 === e.annotations ? void 0 : null === e.annotations ? null : e.annotations.map(d),
                                    raw_ls: e.rawLs,
                                    category: e.category,
                                    run_id: e.runId,
                                    correlation_id: e.correlationId,
                                    user: e.user,
                                    report: e.report,
                                    appeal: e.appeal,
                                    media: e.media,
                                    content: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            id: e.id,
                                            type: e.type,
                                            update_time: e.updateTime,
                                            custom: e.custom,
                                            user_id: e.userId,
                                            locale: e.locale,
                                            content_type: e.contentType,
                                            media_type: e.mediaType
                                        }
                                    }(e.content),
                                    custom: e.custom
                                }
                            }(e.paymentsBonusModerationApplyBonusModerationDecisionRequest)
                        }, t)];
                    case 1:
                        return n = a.sent(), [2, new i.JSONApiResponse(n)]
                }
            })
        })
    }, f.prototype.paymentsBonusModerationApplyBonusModerationDecision = function() {
        return o(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), u(this, function(s) {
                switch (s.label) {
                    case 0:
                        return [4, this.paymentsBonusModerationApplyBonusModerationDecisionRaw(e, t)];
                    case 1:
                        return [4, s.sent().value()];
                    case 2:
                        return [2, s.sent()]
                }
            })
        })
    }, f.prototype.paymentsBonusModerationFixBonusOptInStatusRaw = function(e, t) {
        return o(this, void 0, void 0, function() {
            var s, r, n;
            return u(this, function(a) {
                switch (a.label) {
                    case 0:
                        return s = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                            path: "/v1/fix-bonus-opt-in-status",
                            schemaPath: "/v1/fix-bonus-opt-in-status",
                            method: "POST",
                            headers: r,
                            query: s,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    gamePassId: e.gamePassId
                                }
                            }(e.paymentsBonusModerationFixBonusOptInStatusRequest)
                        }, t)];
                    case 1:
                        return n = a.sent(), [2, new i.JSONApiResponse(n)]
                }
            })
        })
    }, f.prototype.paymentsBonusModerationFixBonusOptInStatus = function() {
        return o(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), u(this, function(s) {
                switch (s.label) {
                    case 0:
                        return [4, this.paymentsBonusModerationFixBonusOptInStatusRaw(e, t)];
                    case 1:
                        return [4, s.sent().value()];
                    case 2:
                        return [2, s.sent()]
                }
            })
        })
    };
    var g = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(t, e), t.prototype.paymentsBonusServiceCreateOrUpdateBonusOptInStatusRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var s, r, n;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return s = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/opt-in-status",
                                    schemaPath: "/v1/opt-in-status",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            virtualPurchasingProductType: e.virtualPurchasingProductType,
                                            virtualPurchasingProductTargetId: e.virtualPurchasingProductTargetId,
                                            isOptedIn: e.isOptedIn
                                        }
                                    }(e.paymentsBonusServiceCreateOrUpdateBonusOptInStatusRequest)
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new i.JSONApiResponse(n)]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceCreateOrUpdateBonusOptInStatus = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), u(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.paymentsBonusServiceCreateOrUpdateBonusOptInStatusRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetBonusOptInInfoRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var s, r, n;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return s = {}, void 0 !== e.productType && (s.productType = e.productType), void 0 !== e.productTargetId && (s.productTargetId = e.productTargetId), r = {}, [4, this.request({
                                    path: "/v1/opt-in-status",
                                    schemaPath: "/v1/opt-in-status",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new i.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        isBonusOptedIn: (0, i.exists)(e, "isBonusOptedIn") ? e.isBonusOptedIn : void 0,
                                        isEligible: (0, i.exists)(e, "isEligible") ? e.isEligible : void 0,
                                        moderationStatus: (0, i.exists)(e, "moderationStatus") ? e.moderationStatus : void 0,
                                        isBonusOptInVisible: (0, i.exists)(e, "isBonusOptInVisible") ? e.isBonusOptInVisible : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetBonusOptInInfo = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), u(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.paymentsBonusServiceGetBonusOptInInfoRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetBonusSessionRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var s, r, n;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return s = {}, void 0 !== e.paymentSessionId && (s.paymentSessionId = e.paymentSessionId), r = {}, [4, this.request({
                                    path: "/v1/bonus-sessions",
                                    schemaPath: "/v1/bonus-sessions",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new i.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        selectedBonuses: (0, i.exists)(e, "selectedBonuses") ? null === e.selectedBonuses ? null : e.selectedBonuses.map(l) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetBonusSession = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), u(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.paymentsBonusServiceGetBonusSessionRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetOrCreateBonusSessionRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var s, r, n;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return s = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/bonus-sessions",
                                    schemaPath: "/v1/bonus-sessions",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            paymentSessionId: e.paymentSessionId,
                                            productBonusKeys: void 0 === e.productBonusKeys ? void 0 : null === e.productBonusKeys ? null : e.productBonusKeys.map(p)
                                        }
                                    }(e.paymentsBonusServiceGetOrCreateBonusSessionRequest)
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new i.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        selectedDisplayableBonuses: (0, i.exists)(e, "selectedDisplayableBonuses") ? null === e.selectedDisplayableBonuses ? null : e.selectedDisplayableBonuses.map(c) : void 0,
                                        created: (0, i.exists)(e, "created") ? e.created : void 0,
                                        productDisplayableBonuses: (0, i.exists)(e, "productDisplayableBonuses") ? null === e.productDisplayableBonuses ? null : e.productDisplayableBonuses.map(v) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetOrCreateBonusSession = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), u(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.paymentsBonusServiceGetOrCreateBonusSessionRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetPaymentBonusByCheckoutSessionIdRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var s, r, n;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.checkoutSessionId || void 0 === e.checkoutSessionId) throw new i.RequiredError("checkoutSessionId", "Required parameter requestParameters.checkoutSessionId was null or undefined when calling paymentsBonusServiceGetPaymentBonusByCheckoutSessionId.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/checkout-session/{checkoutSessionId}/payment-bonus".replace("{".concat("checkoutSessionId", "}"), encodeURIComponent(String(e.checkoutSessionId))),
                                    schemaPath: "/v1/checkout-session/{checkoutSessionId}/payment-bonus",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new i.JSONApiResponse(n, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetPaymentBonusByCheckoutSessionId = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return u(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.paymentsBonusServiceGetPaymentBonusByCheckoutSessionIdRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetPaymentBonusByPaymentSessionIdRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var s, r, n;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.paymentSessionId || void 0 === e.paymentSessionId) throw new i.RequiredError("paymentSessionId", "Required parameter requestParameters.paymentSessionId was null or undefined when calling paymentsBonusServiceGetPaymentBonusByPaymentSessionId.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/payment-session/{paymentSessionId}/payment-bonus".replace("{".concat("paymentSessionId", "}"), encodeURIComponent(String(e.paymentSessionId))),
                                    schemaPath: "/v1/payment-session/{paymentSessionId}/payment-bonus",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new i.JSONApiResponse(n, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetPaymentBonusByPaymentSessionId = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return u(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.paymentsBonusServiceGetPaymentBonusByPaymentSessionIdRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceHandleGameJoinEventRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var s, r, n;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return s = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/handle-game-join-event",
                                    schemaPath: "/v1/handle-game-join-event",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            gamePassId: e.gamePassId,
                                            rootPlaceId: e.rootPlaceId,
                                            checkoutSessionId: e.checkoutSessionId,
                                            paymentSessionId: e.paymentSessionId
                                        }
                                    }(e.paymentsBonusServiceHandleGameJoinEventRequest)
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new i.JSONApiResponse(n)]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceHandleGameJoinEvent = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), u(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.paymentsBonusServiceHandleGameJoinEventRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(i.BaseAPI),
        I = e.i(272593),
        P = ((t = {})[t.Unspecified = 0] = "Unspecified", t[t.PendingReview = 1] = "PendingReview", t[t.Approved = 2] = "Approved", t[t.Rejected = 3] = "Rejected", t);
    let y = new class {
        getOptInStatus(e) {
            return this.bonusItemApi.paymentsBonusServiceGetBonusOptInInfo(e)
        }
        updateOptInStatus(e) {
            return this.bonusItemApi.paymentsBonusServiceCreateOrUpdateBonusOptInStatus(e)
        }
        constructor() {
            (0, r._)(this, "bonusItemApi", void 0), this.bonusItemApi = new g((0, I.createClientConfiguration)("payments-bonus-service", "bedev2"))
        }
    };
    e.s(["BonusOptInModerationStatus", () => P, "GamePassProductType", 0, 6, "default", 0, y], 858148);
    let b = {
        all: e => ["passes", e],
        listAll: (e, t) => [...b.all(e), "listAll", t],
        config: (e, t) => [...b.all(e), "config", t],
        batchConfigs: (e, t) => [...b.all(e), "batchConfigs", [...t].sort((e, t) => e - t)],
        create: e => [...b.all(e), "create"],
        update: (e, t) => [...b.all(e), t, "update"],
        batchUpdate: e => [...b.all(e), "batchUpdate"],
        bonusOptIn: (e, t) => [...b.all(e), t, "bonusOptIn"],
        metadata: () => ["passes", "metadata"]
    };
    e.s(["DEFAULT_RETRIES", 0, 1, "DEFAULT_STALE_TIME", 0, 1 / 0, "gamePassKeys", 0, b, "matchesGamePassBatchConfigsQuery", 0, function(e, t) {
        let s = e.queryKey;
        return "passes" === s[0] && s[1] === t && "batchConfigs" === s[2] && Array.isArray(s[3])
    }, "matchesGamePassListAllQuery", 0, function(e, t) {
        let s = e.queryKey;
        return "passes" === s[0] && s[1] === t && "listAll" === s[2]
    }], 966956);
    let w = 1 / 0;
    e.s(["DEFAULT_RETRIES", 0, 1, "DEFAULT_STALE_TIME", 0, w], 719743), e.s(["useGetGamePassBonusOptIn", 0, function(e) {
        var t;
        let {
            universeId: r,
            gamePassId: i
        } = e, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return (0, s.useQuery)({
            queryKey: b.bonusOptIn(r, i),
            queryFn: () => y.getOptInStatus({
                productTargetId: i,
                productType: 6
            }),
            staleTime: w,
            retry: 1,
            ...n,
            enabled: (null == (t = n.enabled) || t) && !!r && !!i
        })
    }], 261482);
    var A = e.i(237401);
    e.s(["usePassId", 0, function() {
        let e = (0, A.useRouter)(),
            t = e.query.passId;
        if (!e.isReady) return {
            isLoading: !0,
            isError: !1
        };
        if (!t || Array.isArray(t)) return {
            isLoading: !1,
            isError: !0
        };
        let s = Number(t);
        return Number.isNaN(s) || !Number.isInteger(s) ? {
            isLoading: !1,
            isError: !0
        } : {
            passId: s,
            isLoading: !1,
            isError: !1
        }
    }], 477749)
}, 503725, 919668, e => {
    "use strict";
    var t = e.i(721281),
        s = e.i(677753),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var s in t) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s])
            })(e, t)
        };

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function s() {
            this.constructor = e
        }
        r(e, t), e.prototype = null === t ? Object.create(t) : (s.prototype = t.prototype, new s)
    }

    function n(e, t, s, r) {
        return new(s || (s = Promise))(function(i, n) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    n(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    n(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var s, r, i, n = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var d = [o, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, d[0] && (n = 0)), n;) try {
                    if (s = 1, r && (i = 2 & d[0] ? r.return : d[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, d[1])).done) return i;
                    switch (r = 0, i && (d = [2 & d[0], i.value]), d[0]) {
                        case 0:
                        case 1:
                            i = d;
                            break;
                        case 4:
                            return n.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            n.label++, r = d[1], d = [0];
                            continue;
                        case 7:
                            d = n.ops.pop(), n.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = n.trys).length > 0 && i[i.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                n = 0;
                                continue
                            }
                            if (3 === d[0] && (!i || d[1] > i[0] && d[1] < i[3])) {
                                n.label = d[1];
                                break
                            }
                            if (6 === d[0] && n.label < i[1]) {
                                n.label = i[1], i = d;
                                break
                            }
                            if (i && n.label < i[2]) {
                                n.label = i[2], n.ops.push(d);
                                break
                            }
                            i[2] && n.ops.pop(), n.trys.pop();
                            continue
                    }
                    d = t.call(e, n)
                } catch (e) {
                    d = [6, e], r = 0
                } finally {
                    s = i = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function o(e) {
        return e
    }
    "function" == typeof SuppressedError && SuppressedError;

    function u(e, t) {
        return null == e ? e : {
            defaultPriceInRobux: e.defaultPriceInRobux,
            enabledFeatures: e.enabledFeatures.map(o)
        }
    }

    function d(e) {
        var t;
        return null == (t = e) ? t : {
            productId: t.productId,
            name: t.name,
            description: t.description,
            iconImageAssetId: t.iconImageAssetId,
            universeId: t.universeId,
            isForSale: t.isForSale,
            storePageEnabled: t.storePageEnabled,
            priceInformation: u(t.priceInformation),
            isImmutable: t.isImmutable,
            createdTimestamp: new Date(t.createdTimestamp),
            updatedTimestamp: new Date(t.updatedTimestamp),
            isArchived: (0, s.exists)(t, "isArchived") ? t.isArchived : void 0,
            isManagedPricingEnabled: (0, s.exists)(t, "isManagedPricingEnabled") ? t.isManagedPricingEnabled : void 0
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            productId: e.productId,
            changedProperties: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    isRegionalPricingEnabled: e.isRegionalPricingEnabled,
                    isManagedPricingEnabled: e.isManagedPricingEnabled,
                    isArchived: e.isArchived
                }
            }(e.changedProperties)
        }
    }

    function c(e) {
        var t, r;
        return null == (t = e) ? t : {
            productId: t.productId,
            error: null == (r = t.error) ? r : {
                errorCode: (0, s.exists)(r, "errorCode") ? r.errorCode : void 0,
                errorMessage: (0, s.exists)(r, "errorMessage") ? r.errorMessage : void 0,
                field: (0, s.exists)(r, "field") ? r.field : void 0,
                hint: (0, s.exists)(r, "hint") ? r.hint : void 0
            }
        }
    }

    function p(e) {
        var t;
        return null == (t = e) ? t : {
            developerProductId: (0, s.exists)(t, "developerProductId") ? t.developerProductId : void 0,
            productId: t.productId,
            name: t.name,
            description: t.description,
            iconImageAssetId: t.iconImageAssetId,
            universeId: t.universeId,
            isForSale: t.isForSale,
            storePageEnabled: t.storePageEnabled,
            priceInformation: u(t.priceInformation),
            isImmutable: t.isImmutable,
            createdTimestamp: new Date(t.createdTimestamp),
            updatedTimestamp: new Date(t.updatedTimestamp)
        }
    }

    function v(e, t) {
        return null == e ? e : {
            id: (0, s.exists)(e, "Id") ? e.Id : void 0,
            name: (0, s.exists)(e, "Name") ? e.Name : void 0,
            creatorType: (0, s.exists)(e, "CreatorType") ? e.CreatorType : void 0,
            creatorTargetId: (0, s.exists)(e, "CreatorTargetId") ? e.CreatorTargetId : void 0
        }
    }

    function m(e) {
        var t;
        return null == (t = e) ? t : {
            productId: (0, s.exists)(t, "ProductId") ? t.ProductId : void 0,
            developerProductId: (0, s.exists)(t, "DeveloperProductId") ? t.DeveloperProductId : void 0,
            name: (0, s.exists)(t, "Name") ? t.Name : void 0,
            description: (0, s.exists)(t, "Description") ? t.Description : void 0,
            iconImageAssetId: (0, s.exists)(t, "IconImageAssetId") ? t.IconImageAssetId : void 0,
            displayName: (0, s.exists)(t, "displayName") ? t.displayName : void 0,
            displayDescription: (0, s.exists)(t, "displayDescription") ? t.displayDescription : void 0,
            displayIcon: (0, s.exists)(t, "displayIcon") ? t.displayIcon : void 0,
            priceInRobux: (0, s.exists)(t, "PriceInRobux") ? t.PriceInRobux : void 0,
            isForSale: (0, s.exists)(t, "IsForSale") ? t.IsForSale : void 0,
            created: (0, s.exists)(t, "Created") ? new Date(t.Created) : void 0,
            updated: (0, s.exists)(t, "Updated") ? new Date(t.Updated) : void 0,
            isNew: (0, s.exists)(t, "IsNew") ? t.IsNew : void 0,
            universeId: (0, s.exists)(t, "UniverseId") ? t.UniverseId : void 0,
            productType: (0, s.exists)(t, "ProductType") ? t.ProductType : void 0,
            creator: (0, s.exists)(t, "Creator") ? v(t.Creator) : void 0,
            targetId: (0, s.exists)(t, "TargetId") ? t.TargetId : void 0,
            displayIconImageAssetId: (0, s.exists)(t, "DisplayIconImageAssetId") ? t.DisplayIconImageAssetId : void 0,
            isPublicDomain: (0, s.exists)(t, "IsPublicDomain") ? t.IsPublicDomain : void 0,
            isLimited: (0, s.exists)(t, "IsLimited") ? t.IsLimited : void 0,
            minimumMembershipLevel: (0, s.exists)(t, "MinimumMembershipLevel") ? t.MinimumMembershipLevel : void 0,
            isLimitedUnique: (0, s.exists)(t, "IsLimitedUnique") ? t.IsLimitedUnique : void 0,
            assetId: (0, s.exists)(t, "AssetId") ? t.AssetId : void 0,
            assetTypeId: (0, s.exists)(t, "AssetTypeId") ? t.AssetTypeId : void 0
        }
    }
    var h = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.developerProductsBatchGetDeveloperProductConfigsRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling developerProductsBatchGetDeveloperProductConfigs.");
                                return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v2/universes/{universeId}/developer-products/creator:batchGet".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/developer-products/creator:batchGet",
                                    method: "POST",
                                    headers: i,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            productIds: e.productIds
                                        }
                                    }(e.developerProductsBatchGetDeveloperProductConfigsRequest)
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        developerProducts: e.developerProducts.map(d)
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.developerProductsBatchGetDeveloperProductConfigs = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.developerProductsBatchGetDeveloperProductConfigsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.developerProductsCreateDeveloperProductV2Raw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling developerProductsCreateDeveloperProductV2.");
                                if (null === e.name || void 0 === e.name) throw new s.RequiredError("name", "Required parameter requestParameters.name was null or undefined when calling developerProductsCreateDeveloperProductV2.");
                                return r = {}, i = {}, n = (0, s.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.name && n.append("name", e.name), void 0 !== e.description && n.append("description", e.description), void 0 !== e.isForSale && n.append("isForSale", e.isForSale), void 0 !== e.price && n.append("price", e.price), void 0 !== e.imageFile && n.append("imageFile", e.imageFile), void 0 !== e.isRegionalPricingEnabled && n.append("isRegionalPricingEnabled", e.isRegionalPricingEnabled), void 0 !== e.isManagedPricingEnabled && n.append("isManagedPricingEnabled", e.isManagedPricingEnabled), [4, this.request({
                                    path: "/v2/universes/{universeId}/developer-products".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/developer-products",
                                    method: "POST",
                                    headers: i,
                                    query: r,
                                    body: n
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, t.prototype.developerProductsCreateDeveloperProductV2 = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.developerProductsCreateDeveloperProductV2Raw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.developerProductsGetDeveloperProductConfigV2Raw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling developerProductsGetDeveloperProductConfigV2.");
                                if (null === e.productId || void 0 === e.productId) throw new s.RequiredError("productId", "Required parameter requestParameters.productId was null or undefined when calling developerProductsGetDeveloperProductConfigV2.");
                                return r = {}, i = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/developer-products/{productId}/creator".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("productId", "}"), encodeURIComponent(String(e.productId))),
                                    schemaPath: "/v2/universes/{universeId}/developer-products/{productId}/creator",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, t.prototype.developerProductsGetDeveloperProductConfigV2 = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.developerProductsGetDeveloperProductConfigV2Raw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.developerProductsListDeveloperProductConfigsByUniverseV2Raw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling developerProductsListDeveloperProductConfigsByUniverseV2.");
                                return r = {}, void 0 !== e.pageSize && (r.pageSize = e.pageSize), void 0 !== e.pageToken && (r.pageToken = e.pageToken), void 0 !== e.isArchived && (r.isArchived = e.isArchived), i = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/developer-products/creator".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/developer-products/creator",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        developerProducts: e.developerProducts.map(d),
                                        nextPageToken: e.nextPageToken
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.developerProductsListDeveloperProductConfigsByUniverseV2 = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.developerProductsListDeveloperProductConfigsByUniverseV2Raw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.developerProductsUpdateDeveloperProductV2Raw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling developerProductsUpdateDeveloperProductV2.");
                                if (null === e.productId || void 0 === e.productId) throw new s.RequiredError("productId", "Required parameter requestParameters.productId was null or undefined when calling developerProductsUpdateDeveloperProductV2.");
                                return r = {}, i = {}, n = (0, s.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.name && n.append("name", e.name), void 0 !== e.description && n.append("description", e.description), void 0 !== e.isForSale && n.append("isForSale", e.isForSale), void 0 !== e.price && n.append("price", e.price), void 0 !== e.imageFile && n.append("imageFile", e.imageFile), void 0 !== e.isRegionalPricingEnabled && n.append("isRegionalPricingEnabled", e.isRegionalPricingEnabled), void 0 !== e.storePageEnabled && n.append("storePageEnabled", e.storePageEnabled), void 0 !== e.isManagedPricingEnabled && n.append("isManagedPricingEnabled", e.isManagedPricingEnabled), void 0 !== e.isArchived && n.append("isArchived", e.isArchived), [4, this.request({
                                    path: "/v2/universes/{universeId}/developer-products/{productId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("productId", "}"), encodeURIComponent(String(e.productId))),
                                    schemaPath: "/v2/universes/{universeId}/developer-products/{productId}",
                                    method: "PATCH",
                                    headers: i,
                                    query: r,
                                    body: n
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new s.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.developerProductsUpdateDeveloperProductV2 = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.developerProductsUpdateDeveloperProductV2Raw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }, t
        }(s.BaseAPI),
        f = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.developerProductsApiBulkUpdateDeveloperProductsRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling developerProductsApiBulkUpdateDeveloperProducts.");
                                return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/universes/{universeId}/developer-products".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/developer-products",
                                    method: "PATCH",
                                    headers: i,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            developerProductUpdates: e.developerProductUpdates.map(l)
                                        }
                                    }(e.developerProductsApiBulkUpdateDeveloperProductsRequest)
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        errors: e.errors.map(c)
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.developerProductsApiBulkUpdateDeveloperProducts = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.developerProductsApiBulkUpdateDeveloperProductsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.developerProductsApiGetDeveloperProductDetailsRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.productId || void 0 === e.productId) throw new s.RequiredError("productId", "Required parameter requestParameters.productId was null or undefined when calling developerProductsApiGetDeveloperProductDetails.");
                                return r = {}, i = {}, [4, this.request({
                                    path: "/v1/developer-products/{productId}/details".replace("{".concat("productId", "}"), encodeURIComponent(String(e.productId))),
                                    schemaPath: "/v1/developer-products/{productId}/details",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        displayName: (0, s.exists)(e, "DisplayName") ? e.DisplayName : void 0,
                                        displayDescription: (0, s.exists)(e, "DisplayDescription") ? e.DisplayDescription : void 0,
                                        displayIconImageAssetId: (0, s.exists)(e, "DisplayIconImageAssetId") ? e.DisplayIconImageAssetId : void 0,
                                        priceInformation: (0, s.exists)(e, "PriceInformation") ? null == (t = e.PriceInformation) ? t : {
                                            defaultPriceInRobux: t.defaultPriceInRobux,
                                            enabledFeatures: t.enabledFeatures.map(o)
                                        } : void 0,
                                        storePageEnabled: (0, s.exists)(e, "StorePageEnabled") ? e.StorePageEnabled : void 0,
                                        universeId: (0, s.exists)(e, "UniverseId") ? e.UniverseId : void 0,
                                        isImmutable: (0, s.exists)(e, "IsImmutable") ? e.IsImmutable : void 0,
                                        targetId: (0, s.exists)(e, "TargetId") ? e.TargetId : void 0,
                                        productType: (0, s.exists)(e, "ProductType") ? e.ProductType : void 0,
                                        assetId: (0, s.exists)(e, "AssetId") ? e.AssetId : void 0,
                                        productId: (0, s.exists)(e, "ProductId") ? e.ProductId : void 0,
                                        name: (0, s.exists)(e, "Name") ? e.Name : void 0,
                                        description: (0, s.exists)(e, "Description") ? e.Description : void 0,
                                        assetTypeId: (0, s.exists)(e, "AssetTypeId") ? e.AssetTypeId : void 0,
                                        creator: (0, s.exists)(e, "Creator") ? v(e.Creator) : void 0,
                                        iconImageAssetId: (0, s.exists)(e, "IconImageAssetId") ? e.IconImageAssetId : void 0,
                                        created: (0, s.exists)(e, "Created") ? new Date(e.Created) : void 0,
                                        updated: (0, s.exists)(e, "Updated") ? new Date(e.Updated) : void 0,
                                        priceInRobux: (0, s.exists)(e, "PriceInRobux") ? e.PriceInRobux : void 0,
                                        premiumPriceInRobux: (0, s.exists)(e, "PremiumPriceInRobux") ? e.PremiumPriceInRobux : void 0,
                                        priceInTickets: (0, s.exists)(e, "PriceInTickets") ? e.PriceInTickets : void 0,
                                        isNew: (0, s.exists)(e, "IsNew") ? e.IsNew : void 0,
                                        isForSale: (0, s.exists)(e, "IsForSale") ? e.IsForSale : void 0,
                                        isPublicDomain: (0, s.exists)(e, "IsPublicDomain") ? e.IsPublicDomain : void 0,
                                        isLimited: (0, s.exists)(e, "IsLimited") ? e.IsLimited : void 0,
                                        isLimitedUnique: (0, s.exists)(e, "IsLimitedUnique") ? e.IsLimitedUnique : void 0,
                                        remaining: (0, s.exists)(e, "Remaining") ? e.Remaining : void 0,
                                        sales: (0, s.exists)(e, "Sales") ? e.Sales : void 0,
                                        minimumMembershipLevel: (0, s.exists)(e, "MinimumMembershipLevel") ? e.MinimumMembershipLevel : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.developerProductsApiGetDeveloperProductDetails = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.developerProductsApiGetDeveloperProductDetailsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.developerProductsApiGetGiftingTradingStatusRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling developerProductsApiGetGiftingTradingStatus.");
                                return r = {}, i = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/gifting-trading".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/gifting-trading",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        giftingTradingStatus: e.giftingTradingStatus
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.developerProductsApiGetGiftingTradingStatus = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.developerProductsApiGetGiftingTradingStatusRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.developerProductsApiListDeveloperProductsByUniverseIdForCreatorCursoredRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling developerProductsApiListDeveloperProductsByUniverseIdForCreatorCursored.");
                                return r = {}, void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.pageSize && (r.pageSize = e.pageSize), void 0 !== e.pageToken && (r.pageToken = e.pageToken), i = {}, [4, this.request({
                                    path: "/v2/developer-products/universes/{universeId}/creator".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/developer-products/universes/{universeId}/creator",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        nextPageCursor: (0, s.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        developerProductsOverview: (0, s.exists)(e, "developerProductsOverview") ? null === e.developerProductsOverview ? null : e.developerProductsOverview.map(p) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.developerProductsApiListDeveloperProductsByUniverseIdForCreatorCursored = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.developerProductsApiListDeveloperProductsByUniverseIdForCreatorCursoredRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.developerProductsApiListDeveloperProductsCursoredRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling developerProductsApiListDeveloperProductsCursored.");
                                return r = {}, e.productIds && (r.productIds = e.productIds), void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.limit && (r.limit = e.limit), i = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/developerproducts".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/developerproducts",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        developerProducts: e.developerProducts.map(m),
                                        nextPageCursor: e.nextPageCursor
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.developerProductsApiListDeveloperProductsCursored = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.developerProductsApiListDeveloperProductsCursoredRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.developerProductsApiSetGiftingTradingStatusRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling developerProductsApiSetGiftingTradingStatus.");
                                return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/universes/{universeId}/gifting-trading".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/gifting-trading",
                                    method: "POST",
                                    headers: i,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            hasGiftingTrading: e.hasGiftingTrading
                                        }
                                    }(e.developerProductsApiSetGiftingTradingStatusRequest)
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.VoidApiResponse(n)]
                        }
                    })
                })
            }, t.prototype.developerProductsApiSetGiftingTradingStatus = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.developerProductsApiSetGiftingTradingStatusRaw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }, t
        }(s.BaseAPI);
    e.s(["DeveloperProductsApi", 0, h, "DeveloperProductsApiApi", 0, f, "ErrorCode", 0, {
        InvalidImageFile: "InvalidImageFile",
        UnauthorizedAccess: "UnauthorizedAccess",
        NotAuthenticated: "NotAuthenticated",
        NotFound: "NotFound",
        Internal: "Internal",
        BadRequest: "BadRequest",
        InvalidProductId: "InvalidProductId",
        UnauthorizedProductAccess: "UnauthorizedProductAccess",
        InvalidDeveloperProductId: "InvalidDeveloperProductId",
        DuplicateProductName: "DuplicateProductName",
        InvalidUniverseId: "InvalidUniverseId",
        UnauthorizedUniverseAccess: "UnauthorizedUniverseAccess",
        InvalidShopId: "InvalidShopId",
        UnknownError: "UnknownError",
        InvalidPriceInRobux: "InvalidPriceInRobux",
        InvalidPostBody: "InvalidPostBody",
        InvalidPageNumber: "InvalidPageNumber",
        InvalidPageSize: "InvalidPageSize",
        UnsupportedDeveloperProductUpdate: "UnsupportedDeveloperProductUpdate",
        PendingProductsLimitExceeded: "PendingProductsLimitExceeded",
        InvalidCursor: "InvalidCursor",
        InvalidRegionalPricing: "InvalidRegionalPricing",
        ProductRetrievalLimitExceeded: "ProductRetrievalLimitExceeded",
        InvalidProductIds: "InvalidProductIds",
        InvalidName: "InvalidName",
        InvalidDescription: "InvalidDescription",
        InvalidIsForSale: "InvalidIsForSale",
        InvalidStorePageEnabled: "InvalidStorePageEnabled",
        Unavailable: "Unavailable",
        InvalidPrice: "InvalidPrice",
        Blocked: "Blocked",
        Conflict: "Conflict",
        InvalidManagedPricing: "InvalidManagedPricing",
        ImageFileTooLarge: "ImageFileTooLarge"
    }], 919668);
    var g = e.i(272593);
    let I = new class {
        listDeveloperProducts(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsApi.developerProductsApiListDeveloperProductsCursored(e, t)
        }
        createDeveloperProduct(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsV2Api.developerProductsCreateDeveloperProductV2(e, t)
        }
        updateDeveloperProduct(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsV2Api.developerProductsUpdateDeveloperProductV2(e, t)
        }
        batchUpdateDeveloperProducts(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsApi.developerProductsApiBulkUpdateDeveloperProducts({
                universeId: e.universeId,
                developerProductsApiBulkUpdateDeveloperProductsRequest: e.body
            }, t)
        }
        getGiftingTradingStatus(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsApi.developerProductsApiGetGiftingTradingStatus({
                universeId: e
            }, t)
        }
        setGiftingTradingStatus(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsApi.developerProductsApiSetGiftingTradingStatus({
                universeId: e.universeId,
                developerProductsApiSetGiftingTradingStatusRequest: {
                    hasGiftingTrading: e.hasGiftingTrading
                }
            }, t)
        }
        getDeveloperProductConfig(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsV2Api.developerProductsGetDeveloperProductConfigV2(e, t)
        }
        batchGetDeveloperProductConfigs(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsV2Api.developerProductsBatchGetDeveloperProductConfigs({
                universeId: e.universeId,
                developerProductsBatchGetDeveloperProductConfigsRequest: {
                    productIds: e.productIds
                }
            }, t)
        }
        listDeveloperProductConfigsByUniverse(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsV2Api.developerProductsListDeveloperProductConfigsByUniverseV2(e, t)
        }
        constructor() {
            (0, t._)(this, "developerProductsApi", void 0), (0, t._)(this, "developerProductsV2Api", void 0);
            const e = (0, g.createClientConfiguration)("developer-products", "bedev2");
            this.developerProductsApi = new f(e), this.developerProductsV2Api = new h(e)
        }
    };
    e.s(["default", 0, I], 503725)
}, 851130, 803316, e => {
    "use strict";
    var t = e.i(721281),
        s = e.i(677753),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var s in t) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s])
            })(e, t)
        };

    function i(e, t, s, r) {
        return new(s || (s = Promise))(function(i, n) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    n(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    n(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function n(e, t) {
        var s, r, i, n = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var d = [o, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, d[0] && (n = 0)), n;) try {
                    if (s = 1, r && (i = 2 & d[0] ? r.return : d[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, d[1])).done) return i;
                    switch (r = 0, i && (d = [2 & d[0], i.value]), d[0]) {
                        case 0:
                        case 1:
                            i = d;
                            break;
                        case 4:
                            return n.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            n.label++, r = d[1], d = [0];
                            continue;
                        case 7:
                            d = n.ops.pop(), n.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = n.trys).length > 0 && i[i.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                n = 0;
                                continue
                            }
                            if (3 === d[0] && (!i || d[1] > i[0] && d[1] < i[3])) {
                                n.label = d[1];
                                break
                            }
                            if (6 === d[0] && n.label < i[1]) {
                                n.label = i[1], i = d;
                                break
                            }
                            if (i && n.label < i[2]) {
                                n.label = i[2], n.ops.push(d);
                                break
                            }
                            i[2] && n.ops.pop(), n.trys.pop();
                            continue
                    }
                    d = t.call(e, n)
                } catch (e) {
                    d = [6, e], r = 0
                } finally {
                    s = i = 0
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
        return e
    }

    function o(e) {
        var t, r;
        return null == (t = e) ? t : {
            gamePassId: t.gamePassId,
            name: t.name,
            description: t.description,
            isForSale: t.isForSale,
            iconAssetId: t.iconAssetId,
            createdTimestamp: new Date(t.createdTimestamp),
            updatedTimestamp: new Date(t.updatedTimestamp),
            isArchived: (0, s.exists)(t, "isArchived") ? t.isArchived : void 0,
            priceInformation: null == (r = t.priceInformation) ? r : {
                defaultPriceInRobux: r.defaultPriceInRobux,
                enabledFeatures: r.enabledFeatures.map(a)
            },
            isManagedPricingEnabled: (0, s.exists)(t, "isManagedPricingEnabled") ? t.isManagedPricingEnabled : void 0
        }
    }

    function u(e) {
        var t, r;
        return null == (t = e) ? t : {
            id: t.id,
            productId: t.productId,
            name: t.name,
            isForSale: t.isForSale,
            price: (0, s.exists)(t, "price") ? t.price : void 0,
            isOwned: (0, s.exists)(t, "isOwned") ? t.isOwned : void 0,
            creator: (0, s.exists)(t, "creator") ? null == (r = t.creator) ? r : {
                creatorType: (0, s.exists)(r, "creatorType") ? r.creatorType : void 0,
                creatorId: (0, s.exists)(r, "creatorId") ? r.creatorId : void 0,
                name: (0, s.exists)(r, "name") ? r.name : void 0,
                deprecatedId: (0, s.exists)(r, "deprecatedId") ? r.deprecatedId : void 0
            } : void 0,
            displayName: t.displayName,
            displayDescription: t.displayDescription,
            displayIconImageAssetId: t.displayIconImageAssetId,
            created: new Date(t.created),
            updated: new Date(t.updated)
        }
    }

    function d(e) {
        return e
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            gamePassId: e.gamePassId,
            changedPropertyNames: e.changedPropertyNames.map(d),
            changedProperties: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    RegionalPricing: e.regionalPricing,
                    ManagedPricing: e.managedPricing,
                    Archived: e.archived
                }
            }(e.changedProperties)
        }
    }

    function c(e) {
        var t, r;
        return null == (t = e) ? t : {
            gamePassId: t.gamePassId,
            error: null == (r = t.error) ? r : {
                errorCode: (0, s.exists)(r, "errorCode") ? r.errorCode : void 0,
                errorMessage: (0, s.exists)(r, "errorMessage") ? r.errorMessage : void 0,
                field: (0, s.exists)(r, "field") ? r.field : void 0,
                hint: (0, s.exists)(r, "hint") ? r.hint : void 0
            }
        }
    }

    function p(e) {
        var t, r;
        return null == (t = e) ? t : {
            gamePassId: (0, s.exists)(t, "gamePassId") ? t.gamePassId : void 0,
            iconAssetId: (0, s.exists)(t, "iconAssetId") ? t.iconAssetId : void 0,
            name: (0, s.exists)(t, "name") ? t.name : void 0,
            description: (0, s.exists)(t, "description") ? t.description : void 0,
            isForSale: (0, s.exists)(t, "isForSale") ? t.isForSale : void 0,
            price: (0, s.exists)(t, "price") ? t.price : void 0,
            creator: (0, s.exists)(t, "creator") ? null == (r = t.creator) ? r : {
                creatorType: (0, s.exists)(r, "creatorType") ? r.creatorType : void 0,
                creatorId: (0, s.exists)(r, "creatorId") ? r.creatorId : void 0,
                name: (0, s.exists)(r, "name") ? r.name : void 0
            } : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var v = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function s() {
                this.constructor = e
            }
            r(e, t), e.prototype = null === t ? Object.create(t) : (s.prototype = t.prototype, new s)
        }(t, e), t.prototype.gamePassesBatchGetGamePassConfigsRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gamePassesBatchGetGamePassConfigs.");
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/universes/{universeId}/game-passes/creator:batchGet".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/game-passes/creator:batchGet",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        gamePassIds: e.gamePassIds
                                    }
                                }(e.gamePassesBatchGetGamePassConfigsRequest)
                            }, t)];
                        case 1:
                            return a = n.sent(), [2, new s.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    gamePasses: e.gamePasses.map(o)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesBatchGetGamePassConfigs = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesBatchGetGamePassConfigsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesBulkUpdateRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gamePassesBulkUpdate.");
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/game-passes/universes/{universeId}/bulk-update".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/game-passes/universes/{universeId}/bulk-update",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        gamePassUpdates: e.gamePassUpdates.map(l)
                                    }
                                }(e.gamePassesBulkUpdateRequest)
                            }, t)];
                        case 1:
                            return a = n.sent(), [2, new s.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    errors: (0, s.exists)(e, "errors") ? null === e.errors ? null : e.errors.map(c) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesBulkUpdate = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesBulkUpdateRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesCreateGamePassRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, i, a, u;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gamePassesCreateGamePass.");
                            if (null === e.name || void 0 === e.name) throw new s.RequiredError("name", "Required parameter requestParameters.name was null or undefined when calling gamePassesCreateGamePass.");
                            return r = {}, i = {}, a = (0, s.canConsumeForm)([{
                                contentType: "multipart/form-data"
                            }]) ? new FormData : new URLSearchParams, void 0 !== e.name && a.append("name", e.name), void 0 !== e.description && a.append("description", e.description), void 0 !== e.imageFile && a.append("imageFile", e.imageFile), void 0 !== e.isForSale && a.append("isForSale", e.isForSale), void 0 !== e.price && a.append("price", e.price), void 0 !== e.isRegionalPricingEnabled && a.append("isRegionalPricingEnabled", e.isRegionalPricingEnabled), void 0 !== e.isManagedPricingEnabled && a.append("isManagedPricingEnabled", e.isManagedPricingEnabled), [4, this.request({
                                path: "/v1/universes/{universeId}/game-passes".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/game-passes",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: a
                            }, t)];
                        case 1:
                            return u = n.sent(), [2, new s.JSONApiResponse(u, function(e) {
                                return o(e)
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesCreateGamePass = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesCreateGamePassRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesGetGamePassConfigRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gamePassesGetGamePassConfig.");
                            if (null === e.gamePassId || void 0 === e.gamePassId) throw new s.RequiredError("gamePassId", "Required parameter requestParameters.gamePassId was null or undefined when calling gamePassesGetGamePassConfig.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/game-passes/{gamePassId}/creator".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("gamePassId", "}"), encodeURIComponent(String(e.gamePassId))),
                                schemaPath: "/v1/universes/{universeId}/game-passes/{gamePassId}/creator",
                                method: "GET",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return a = n.sent(), [2, new s.JSONApiResponse(a, function(e) {
                                return o(e)
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetGamePassConfig = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesGetGamePassConfigRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesGetGamePassMetadataRaw = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r, i;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return t = {}, r = {}, [4, this.request({
                                path: "/v1/metadata",
                                schemaPath: "/v1/metadata",
                                method: "GET",
                                headers: r,
                                query: t
                            }, e)];
                        case 1:
                            return i = n.sent(), [2, new s.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    gamePassMaxNameLength: (0, s.exists)(e, "gamePassMaxNameLength") ? e.gamePassMaxNameLength : void 0,
                                    gamePassMaxDescriptionLength: (0, s.exists)(e, "gamePassMaxDescriptionLength") ? e.gamePassMaxDescriptionLength : void 0,
                                    gamePassMinPrice: (0, s.exists)(e, "gamePassMinPrice") ? e.gamePassMinPrice : void 0,
                                    gamePassMaxPrice: (0, s.exists)(e, "gamePassMaxPrice") ? e.gamePassMaxPrice : void 0,
                                    gamePassPixelImageSize: (0, s.exists)(e, "GamePassPixelImageSize") ? e.GamePassPixelImageSize : void 0,
                                    gamePassDefaultIconAssetId: (0, s.exists)(e, "gamePassDefaultIconAssetId") ? e.gamePassDefaultIconAssetId : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetGamePassMetadata = function(e) {
            return i(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.gamePassesGetGamePassMetadataRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesGetPassProductInfoRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.gamePassId || void 0 === e.gamePassId) throw new s.RequiredError("gamePassId", "Required parameter requestParameters.gamePassId was null or undefined when calling gamePassesGetPassProductInfo.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/game-passes/{gamePassId}/product-info".replace("{".concat("gamePassId", "}"), encodeURIComponent(String(e.gamePassId))),
                                schemaPath: "/v1/game-passes/{gamePassId}/product-info",
                                method: "GET",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return a = n.sent(), [2, new s.JSONApiResponse(a, function(e) {
                                var t;
                                return null == e ? e : {
                                    targetId: (0, s.exists)(e, "TargetId") ? e.TargetId : void 0,
                                    productType: (0, s.exists)(e, "ProductType") ? e.ProductType : void 0,
                                    assetId: (0, s.exists)(e, "AssetId") ? e.AssetId : void 0,
                                    productId: (0, s.exists)(e, "ProductId") ? e.ProductId : void 0,
                                    name: (0, s.exists)(e, "Name") ? e.Name : void 0,
                                    description: (0, s.exists)(e, "Description") ? e.Description : void 0,
                                    assetTypeId: (0, s.exists)(e, "AssetTypeId") ? e.AssetTypeId : void 0,
                                    creator: (0, s.exists)(e, "Creator") ? null == (t = e.Creator) ? t : {
                                        id: (0, s.exists)(t, "Id") ? t.Id : void 0,
                                        name: (0, s.exists)(t, "Name") ? t.Name : void 0,
                                        creatorType: (0, s.exists)(t, "CreatorType") ? t.CreatorType : void 0,
                                        creatorTargetId: (0, s.exists)(t, "CreatorTargetId") ? t.CreatorTargetId : void 0
                                    } : void 0,
                                    iconImageAssetId: (0, s.exists)(e, "IconImageAssetId") ? e.IconImageAssetId : void 0,
                                    created: (0, s.exists)(e, "Created") ? new Date(e.Created) : void 0,
                                    updated: (0, s.exists)(e, "Updated") ? new Date(e.Updated) : void 0,
                                    priceInRobux: (0, s.exists)(e, "PriceInRobux") ? e.PriceInRobux : void 0,
                                    premiumPriceInRobux: (0, s.exists)(e, "PremiumPriceInRobux") ? e.PremiumPriceInRobux : void 0,
                                    priceInTickets: (0, s.exists)(e, "PriceInTickets") ? e.PriceInTickets : void 0,
                                    sales: (0, s.exists)(e, "Sales") ? e.Sales : void 0,
                                    isNew: (0, s.exists)(e, "IsNew") ? e.IsNew : void 0,
                                    isForSale: (0, s.exists)(e, "IsForSale") ? e.IsForSale : void 0,
                                    isPublicDomain: (0, s.exists)(e, "IsPublicDomain") ? e.IsPublicDomain : void 0,
                                    isLimited: (0, s.exists)(e, "IsLimited") ? e.IsLimited : void 0,
                                    isLimitedUnique: (0, s.exists)(e, "IsLimitedUnique") ? e.IsLimitedUnique : void 0,
                                    remaining: (0, s.exists)(e, "Remaining") ? e.Remaining : void 0,
                                    minimumMembershipLevel: (0, s.exists)(e, "MinimumMembershipLevel") ? e.MinimumMembershipLevel : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetPassProductInfo = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesGetPassProductInfoRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesGetSalesLimitInfoRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeid || void 0 === e.universeid) throw new s.RequiredError("universeid", "Required parameter requestParameters.universeid was null or undefined when calling gamePassesGetSalesLimitInfo.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/game-passes/universes/{universeid}/sales-limit".replace("{".concat("universeid", "}"), encodeURIComponent(String(e.universeid))),
                                schemaPath: "/v1/game-passes/universes/{universeid}/sales-limit",
                                method: "GET",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return a = n.sent(), [2, new s.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    salesLimit: (0, s.exists)(e, "salesLimit") ? e.salesLimit : void 0,
                                    hasLimitBeenReached: (0, s.exists)(e, "hasLimitBeenReached") ? e.hasLimitBeenReached : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetSalesLimitInfo = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesGetSalesLimitInfoRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesGetUserGamePassesRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new s.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling gamePassesGetUserGamePasses.");
                            return r = {}, void 0 !== e.exclusiveStartId && (r.exclusiveStartId = e.exclusiveStartId), void 0 !== e.count && (r.count = e.count), i = {}, [4, this.request({
                                path: "/v1/users/{userId}/game-passes".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/game-passes",
                                method: "GET",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return a = n.sent(), [2, new s.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    gamePasses: e.gamePasses.map(p)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetUserGamePasses = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesGetUserGamePassesRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesListGamePassConfigsByUniverseRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gamePassesListGamePassConfigsByUniverse.");
                            return r = {}, void 0 !== e.pageSize && (r.pageSize = e.pageSize), void 0 !== e.pageToken && (r.pageToken = e.pageToken), void 0 !== e.isArchived && (r.isArchived = e.isArchived), i = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/game-passes/creator".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/game-passes/creator",
                                method: "GET",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return a = n.sent(), [2, new s.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    gamePasses: e.gamePasses.map(o),
                                    nextPageToken: e.nextPageToken
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesListGamePassConfigsByUniverse = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesListGamePassConfigsByUniverseRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesListGamePassesByUniverseRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gamePassesListGamePassesByUniverse.");
                            return r = {}, void 0 !== e.pageSize && (r.pageSize = e.pageSize), void 0 !== e.pageToken && (r.pageToken = e.pageToken), void 0 !== e.passView && (r.passView = e.passView), i = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/game-passes".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/game-passes",
                                method: "GET",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return a = n.sent(), [2, new s.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    gamePasses: e.gamePasses.map(u),
                                    nextPageToken: e.nextPageToken
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesListGamePassesByUniverse = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesListGamePassesByUniverseRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesPurchaseGamePassRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.productId || void 0 === e.productId) throw new s.RequiredError("productId", "Required parameter requestParameters.productId was null or undefined when calling gamePassesPurchaseGamePass.");
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/game-passes/{productId}/purchase".replace("{".concat("productId", "}"), encodeURIComponent(String(e.productId))),
                                schemaPath: "/v1/game-passes/{productId}/purchase",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        expectedPrice: e.expectedPrice
                                    }
                                }(e.gamePassesPurchaseGamePassRequest)
                            }, t)];
                        case 1:
                            return a = n.sent(), [2, new s.JSONApiResponse(a, function(e) {
                                var t;
                                return null == e ? e : {
                                    purchased: (0, s.exists)(e, "purchased") ? e.purchased : void 0,
                                    reason: (0, s.exists)(e, "reason") ? e.reason : void 0,
                                    productId: (0, s.exists)(e, "productId") ? e.productId : void 0,
                                    statusCode: (0, s.exists)(e, "statusCode") ? e.statusCode : void 0,
                                    title: (0, s.exists)(e, "title") ? e.title : void 0,
                                    errorMsg: (0, s.exists)(e, "errorMsg") ? e.errorMsg : void 0,
                                    showDivId: (0, s.exists)(e, "showDivId") ? e.showDivId : void 0,
                                    shortfallPrice: (0, s.exists)(e, "shortfallPrice") ? e.shortfallPrice : void 0,
                                    balanceAfterSale: (0, s.exists)(e, "balanceAfterSale") ? e.balanceAfterSale : void 0,
                                    expectedPrice: (0, s.exists)(e, "expectedPrice") ? e.expectedPrice : void 0,
                                    currency: (0, s.exists)(e, "currency") ? e.currency : void 0,
                                    price: (0, s.exists)(e, "price") ? e.price : void 0,
                                    assetId: (0, s.exists)(e, "assetId") ? e.assetId : void 0,
                                    assetName: (0, s.exists)(e, "assetName") ? e.assetName : void 0,
                                    assetType: (0, s.exists)(e, "assetType") ? e.assetType : void 0,
                                    assetTypeDisplayName: (0, s.exists)(e, "assetTypeDisplayName") ? e.assetTypeDisplayName : void 0,
                                    assetIsWearable: (0, s.exists)(e, "assetIsWearable") ? e.assetIsWearable : void 0,
                                    sellerName: (0, s.exists)(e, "sellerName") ? e.sellerName : void 0,
                                    transactionVerb: (0, s.exists)(e, "transactionVerb") ? e.transactionVerb : void 0,
                                    isMultiPrivateSale: (0, s.exists)(e, "isMultiPrivateSale") ? e.isMultiPrivateSale : void 0,
                                    premiumPricing: (0, s.exists)(e, "premiumPricing") ? null == (t = e.premiumPricing) ? t : {
                                        premiumDiscountPercentage: (0, s.exists)(t, "premiumDiscountPercentage") ? t.premiumDiscountPercentage : void 0,
                                        premiumPriceInRobux: (0, s.exists)(t, "premiumPriceInRobux") ? t.premiumPriceInRobux : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesPurchaseGamePass = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesPurchaseGamePassRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesRevokeGamePassRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.gamePassId || void 0 === e.gamePassId) throw new s.RequiredError("gamePassId", "Required parameter requestParameters.gamePassId was null or undefined when calling gamePassesRevokeGamePass.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/game-passes/{gamePassId}:revokeOwnership".replace("{".concat("gamePassId", "}"), encodeURIComponent(String(e.gamePassId))),
                                schemaPath: "/v1/game-passes/{gamePassId}:revokeOwnership",
                                method: "POST",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return a = n.sent(), [2, new s.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.gamePassesRevokeGamePass = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesRevokeGamePassRaw(e, t)];
                        case 1:
                            return s.sent(), [2]
                    }
                })
            })
        }, t.prototype.gamePassesUpdateGamePassRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, i, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gamePassesUpdateGamePass.");
                            if (null === e.gamePassId || void 0 === e.gamePassId) throw new s.RequiredError("gamePassId", "Required parameter requestParameters.gamePassId was null or undefined when calling gamePassesUpdateGamePass.");
                            return r = {}, i = {}, a = (0, s.canConsumeForm)([{
                                contentType: "multipart/form-data"
                            }]) ? new FormData : new URLSearchParams, void 0 !== e.name && a.append("name", e.name), void 0 !== e.description && a.append("description", e.description), void 0 !== e.file && a.append("file", e.file), void 0 !== e.imageFile && a.append("imageFile", e.imageFile), void 0 !== e.isForSale && a.append("isForSale", e.isForSale), void 0 !== e.price && a.append("price", e.price), void 0 !== e.isRegionalPricingEnabled && a.append("isRegionalPricingEnabled", e.isRegionalPricingEnabled), void 0 !== e.isManagedPricingEnabled && a.append("isManagedPricingEnabled", e.isManagedPricingEnabled), void 0 !== e.isArchived && a.append("isArchived", e.isArchived), [4, this.request({
                                path: "/v1/universes/{universeId}/game-passes/{gamePassId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("gamePassId", "}"), encodeURIComponent(String(e.gamePassId))),
                                schemaPath: "/v1/universes/{universeId}/game-passes/{gamePassId}",
                                method: "PATCH",
                                headers: i,
                                query: r,
                                body: a
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.VoidApiResponse(o)]
                    }
                })
            })
        }, t.prototype.gamePassesUpdateGamePass = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesUpdateGamePassRaw(e, t)];
                        case 1:
                            return s.sent(), [2]
                    }
                })
            })
        }, t
    }(s.BaseAPI);
    e.s(["ErrorCode", 0, {
        InternalError: "InternalError",
        BadRequest: "BadRequest",
        NotFound: "NotFound",
        UnauthorizedAccess: "UnauthorizedAccess",
        NotAuthenticated: "NotAuthenticated",
        PassNotFound: "PassNotFound",
        TargetUnauthorizedAccess: "TargetUnauthorizedAccess",
        UniverseNotFound: "UniverseNotFound",
        MissingArgument: "MissingArgument",
        AssetCreationFailure: "AssetCreationFailure",
        PassRevokeFailure: "PassRevokeFailure",
        PassAlreadyRevoked: "PassAlreadyRevoked",
        SalesNotFound: "SalesNotFound",
        CommissionRateNotFound: "CommissionRateNotFound",
        AssetNotFound: "AssetNotFound",
        FileTooLarge: "FileTooLarge",
        ActiveInPo: "ActiveInPO",
        NotForSale: "NotForSale",
        NotSameUniverse: "NotSameUniverse",
        PricingConfigError: "PricingConfigError",
        InvalidCount: "InvalidCount",
        Blocked: "Blocked",
        InvalidPageSize: "InvalidPageSize",
        InvalidRegionalPricing: "InvalidRegionalPricing",
        InvalidManagedPricing: "InvalidManagedPricing"
    }, "GamePassProperty", 0, {
        RegionalPricing: "RegionalPricing",
        ManagedPricing: "ManagedPricing",
        Archived: "Archived"
    }, "GamePassesApi", 0, v], 803316);
    var m = e.i(272593);
    let h = new class {
        getPassSalesLimitInfo(e, t) {
            return this.passesApi.gamePassesGetSalesLimitInfo(e, t)
        }
        getPassMetadata(e) {
            return this.passesApi.gamePassesGetGamePassMetadata(e)
        }
        batchUpdateGamePasses(e, t) {
            return this.passesApi.gamePassesBulkUpdate(e, t)
        }
        listGamePassesByUniverse(e, t) {
            return this.passesApi.gamePassesListGamePassesByUniverse(e, t)
        }
        getGamePassConfig(e, t) {
            return this.passesApi.gamePassesGetGamePassConfig(e, t)
        }
        listGamePassConfigsByUniverse(e, t) {
            return this.passesApi.gamePassesListGamePassConfigsByUniverse(e, t)
        }
        batchGetGamePassConfigs(e, t) {
            return this.passesApi.gamePassesBatchGetGamePassConfigs({
                universeId: e.universeId,
                gamePassesBatchGetGamePassConfigsRequest: {
                    gamePassIds: e.gamePassIds
                }
            }, t)
        }
        createGamePass(e, t) {
            return this.passesApi.gamePassesCreateGamePass(e, t)
        }
        updateGamePass(e, t) {
            return this.passesApi.gamePassesUpdateGamePass(e, t)
        }
        constructor() {
            (0, t._)(this, "passesApi", void 0), this.passesApi = new v((0, m.createClientConfiguration)("game-passes", "bedev2"))
        }
    };
    e.s(["default", 0, h], 851130)
}, 239320, e => {
    "use strict";
    var t, s = e.i(677753),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var s in t) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s])
            })(e, t)
        };

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function s() {
            this.constructor = e
        }
        r(e, t), e.prototype = null === t ? Object.create(t) : (s.prototype = t.prototype, new s)
    }

    function n(e, t, s, r) {
        return new(s || (s = Promise))(function(i, n) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    n(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    n(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var s, r, i, n = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var d = [o, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, d[0] && (n = 0)), n;) try {
                    if (s = 1, r && (i = 2 & d[0] ? r.return : d[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, d[1])).done) return i;
                    switch (r = 0, i && (d = [2 & d[0], i.value]), d[0]) {
                        case 0:
                        case 1:
                            i = d;
                            break;
                        case 4:
                            return n.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            n.label++, r = d[1], d = [0];
                            continue;
                        case 7:
                            d = n.ops.pop(), n.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = n.trys).length > 0 && i[i.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                n = 0;
                                continue
                            }
                            if (3 === d[0] && (!i || d[1] > i[0] && d[1] < i[3])) {
                                n.label = d[1];
                                break
                            }
                            if (6 === d[0] && n.label < i[1]) {
                                n.label = i[1], i = d;
                                break
                            }
                            if (i && n.label < i[2]) {
                                n.label = i[2], n.ops.push(d);
                                break
                            }
                            i[2] && n.ops.pop(), n.trys.pop();
                            continue
                    }
                    d = t.call(e, n)
                } catch (e) {
                    d = [6, e], r = 0
                } finally {
                    s = i = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function o(e) {
        var t;
        return null == (t = e) ? t : {
            duration: (0, s.exists)(t, "duration") ? t.duration : void 0,
            usage: (0, s.exists)(t, "usage") ? t.usage : void 0,
            capacity: (0, s.exists)(t, "capacity") ? t.capacity : void 0,
            expirationTime: (0, s.exists)(t, "expirationTime") ? t.expirationTime : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function u(e, t) {
        return null == e ? e : {
            targetId: (0, s.exists)(e, "targetId") ? e.targetId : void 0
        }
    }

    function d(e, t) {
        return null == e ? e : {
            data: (0, s.exists)(e, "data") ? e.data : void 0
        }
    }
    var l = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.v1AssetQuotasGetRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.resourceType || void 0 === e.resourceType) throw new s.RequiredError("resourceType", "Required parameter requestParameters.resourceType was null or undefined when calling v1AssetQuotasGet.");
                                if (null === e.assetType || void 0 === e.assetType) throw new s.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling v1AssetQuotasGet.");
                                return r = {}, void 0 !== e.resourceType && (r.resourceType = e.resourceType), void 0 !== e.assetType && (r.assetType = e.assetType), void 0 !== e.useDummyData && (r.useDummyData = e.useDummyData), i = {}, [4, this.request({
                                    path: "/v1/asset-quotas",
                                    schemaPath: "/v1/asset-quotas",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        quotas: (0, s.exists)(e, "quotas") ? e.quotas.map(o) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetQuotasGet = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetQuotasGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(s.BaseAPI),
        c = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.v1AssetsAssetIdMediaGetRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdMediaGet.");
                                return r = {}, i = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/media".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/media",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaGet = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdMediaGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaMediaAssetIdDeleteRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdMediaMediaAssetIdDelete.");
                                if (null === e.mediaAssetId || void 0 === e.mediaAssetId) throw new s.RequiredError("mediaAssetId", "Required parameter requestParameters.mediaAssetId was null or undefined when calling v1AssetsAssetIdMediaMediaAssetIdDelete.");
                                return r = {}, i = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/media/{mediaAssetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))).replace("{".concat("mediaAssetId", "}"), encodeURIComponent(String(e.mediaAssetId))),
                                    schemaPath: "/v1/assets/{assetId}/media/{mediaAssetId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: r
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaMediaAssetIdDelete = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdMediaMediaAssetIdDeleteRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaOrderPostRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdMediaOrderPost.");
                                if (null === e.mediaAssetIds || void 0 === e.mediaAssetIds) throw new s.RequiredError("mediaAssetIds", "Required parameter requestParameters.mediaAssetIds was null or undefined when calling v1AssetsAssetIdMediaOrderPost.");
                                return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets/{assetId}/media/order".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/media/order",
                                    method: "POST",
                                    headers: i,
                                    query: r,
                                    body: e.mediaAssetIds
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaOrderPost = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdMediaOrderPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaPostRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdMediaPost.");
                                return r = {}, i = {}, n = (0, s.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && n.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/assets/{assetId}/media".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/media",
                                    method: "POST",
                                    headers: i,
                                    query: r,
                                    body: n
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaPost = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdMediaPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailDeleteRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdThumbnailDelete.");
                                return r = {}, i = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/thumbnail".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/thumbnail",
                                    method: "DELETE",
                                    headers: i,
                                    query: r
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailDelete = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdThumbnailDeleteRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailGetRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdThumbnailGet.");
                                return r = {}, i = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/thumbnail".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/thumbnail",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailGet = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdThumbnailGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailPostRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdThumbnailPost.");
                                return r = {}, i = {}, n = (0, s.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && n.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/assets/{assetId}/thumbnail".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/thumbnail",
                                    method: "POST",
                                    headers: i,
                                    query: r,
                                    body: n
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailPost = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdThumbnailPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(s.BaseAPI),
        p = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            i(t, e), t.prototype.v1AudioPostRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new s.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AudioPost.");
                                return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/audio",
                                    schemaPath: "/v1/audio",
                                    method: "POST",
                                    headers: i,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            file: e.file,
                                            groupId: e.groupId,
                                            paymentSource: e.paymentSource,
                                            estimatedFileSize: e.estimatedFileSize,
                                            estimatedDuration: e.estimatedDuration,
                                            assetPrivacy: e.assetPrivacy
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        id: (0, s.exists)(e, "Id") ? e.Id : void 0,
                                        name: (0, s.exists)(e, "Name") ? e.Name : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AudioPost = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AudioPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AudioVerifyPostRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new s.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AudioVerifyPost.");
                                return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/audio/verify",
                                    schemaPath: "/v1/audio/verify",
                                    method: "POST",
                                    headers: i,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            file: e.file,
                                            groupId: e.groupId,
                                            paymentSource: e.paymentSource,
                                            fileSize: e.fileSize,
                                            duration: e.duration
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return n = a.sent(), [2, new s.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        name: (0, s.exists)(e, "name") ? e.name : void 0,
                                        price: (0, s.exists)(e, "price") ? e.price : void 0,
                                        balance: (0, s.exists)(e, "balance") ? e.balance : void 0,
                                        canAfford: (0, s.exists)(e, "canAfford") ? e.canAfford : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AudioVerifyPost = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AudioVerifyPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }
        }(s.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.v1BadgesBadgeIdIconPostRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.badgeId || void 0 === e.badgeId) throw new s.RequiredError("badgeId", "Required parameter requestParameters.badgeId was null or undefined when calling v1BadgesBadgeIdIconPost.");
                                return r = {}, i = {}, n = (0, s.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && n.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/badges/{badgeId}/icon".replace("{".concat("badgeId", "}"), encodeURIComponent(String(e.badgeId))),
                                    schemaPath: "/v1/badges/{badgeId}/icon",
                                    method: "POST",
                                    headers: i,
                                    query: r,
                                    body: n
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1BadgesBadgeIdIconPost = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1BadgesBadgeIdIconPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(s.BaseAPI)),
        v = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.v1GamesGameIdIconPostRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.gameId || void 0 === e.gameId) throw new s.RequiredError("gameId", "Required parameter requestParameters.gameId was null or undefined when calling v1GamesGameIdIconPost.");
                                return r = {}, i = {}, n = (0, s.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && n.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/games/{gameId}/icon".replace("{".concat("gameId", "}"), encodeURIComponent(String(e.gameId))),
                                    schemaPath: "/v1/games/{gameId}/icon",
                                    method: "POST",
                                    headers: i,
                                    query: r,
                                    body: n
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesGameIdIconPost = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1GamesGameIdIconPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(s.BaseAPI),
        m = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.v1GamesGameIdThumbnailImagePostRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.gameId || void 0 === e.gameId) throw new s.RequiredError("gameId", "Required parameter requestParameters.gameId was null or undefined when calling v1GamesGameIdThumbnailImagePost.");
                                return r = {}, i = {}, n = (0, s.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && n.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/games/{gameId}/thumbnail/image".replace("{".concat("gameId", "}"), encodeURIComponent(String(e.gameId))),
                                    schemaPath: "/v1/games/{gameId}/thumbnail/image",
                                    method: "POST",
                                    headers: i,
                                    query: r,
                                    body: n
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesGameIdThumbnailImagePost = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1GamesGameIdThumbnailImagePostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(s.BaseAPI),
        h = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.v1PluginsPluginIdIconPostRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, i, n, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.pluginId || void 0 === e.pluginId) throw new s.RequiredError("pluginId", "Required parameter requestParameters.pluginId was null or undefined when calling v1PluginsPluginIdIconPost.");
                                return r = {}, i = {}, n = (0, s.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && n.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/plugins/{pluginId}/icon".replace("{".concat("pluginId", "}"), encodeURIComponent(String(e.pluginId))),
                                    schemaPath: "/v1/plugins/{pluginId}/icon",
                                    method: "POST",
                                    headers: i,
                                    query: r,
                                    body: n
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdIconPost = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PluginsPluginIdIconPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(s.BaseAPI),
        f = e.i(213067),
        g = e.i(272593),
        I = e.i(227987),
        P = ((t = {}).Month = "Month", t);
    let y = (0, g.createClientConfiguration)("publish", "bedev1"),
        b = new p(y),
        w = new m(y),
        A = new v(y),
        S = new l(y),
        R = new h(y),
        x = new c(y);
    e.s(["QuotaDuration", () => P, "QuotaDurationToDaysCount", 0, {
        Month: "30"
    }, "default", 0, {
        async patchBadgeIcon(e, t) {
            try {
                return await b.v1BadgesBadgeIdIconPost({
                    badgeId: e,
                    requestFiles: t
                })
            } catch (t) {
                let e = await (0, I.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        },
        async patchPluginIcon(e, t) {
            try {
                return await R.v1PluginsPluginIdIconPost({
                    pluginId: e,
                    requestFiles: t
                })
            } catch (t) {
                let e = await (0, I.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        },
        uploadThumbnailImage: async (e, t) => w.v1GamesGameIdThumbnailImagePost({
            gameId: e,
            requestFiles: t
        }),
        async patchUniverseIcon(e, t) {
            try {
                return await A.v1GamesGameIdIconPost({
                    gameId: e,
                    requestFiles: t
                })
            } catch (t) {
                let e = await (0, I.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        },
        async getAssetQuotas(e, t) {
            try {
                return await S.v1AssetQuotasGet({
                    resourceType: e,
                    assetType: t
                })
            } catch (t) {
                let e = await (0, I.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        },
        async getAssetMedia(e) {
            try {
                return await x.v1AssetsAssetIdMediaGet({
                    assetId: e
                })
            } catch (t) {
                let e = await (0, I.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        },
        async postAssetMedia(e, t) {
            try {
                return await x.v1AssetsAssetIdMediaPost({
                    assetId: e,
                    requestFiles: t
                })
            } catch (t) {
                let e = await (0, I.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        },
        async deleteAssetMedia(e, t) {
            try {
                await x.v1AssetsAssetIdMediaMediaAssetIdDelete({
                    assetId: e,
                    mediaAssetId: t
                })
            } catch (t) {
                let e = await (0, I.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        },
        async postOrderAssetMedia(e, t) {
            try {
                await x.v1AssetsAssetIdMediaOrderPost({
                    assetId: e,
                    mediaAssetIds: t
                })
            } catch (t) {
                let e = await (0, I.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        }
    }], 239320)
}, 533968, e => {
    "use strict";
    var t = e.i(185915);
    e.s(["getResponseFromError", () => t.default])
}, 663629, 205769, e => {
    "use strict";
    var t = e.i(416340);
    let s = (0, t.createContext)({
        isBadgeRefreshRequired: !1,
        badgeDetails: void 0,
        refreshBadgeDetails: () => ({}),
        isBadgeLoading: !1
    });
    s.displayName = "Badge", e.s(["default", 0, s], 205769), e.s(["default", 0, function() {
        return (0, t.useContext)(s)
    }], 663629)
}, 691450, 720054, e => {
    "use strict";
    var t, s = e.i(221628),
        r = e.i(416340),
        i = e.i(237401),
        n = e.i(540513),
        a = e.i(814975),
        o = e.i(968284),
        u = e.i(773057),
        d = e.i(759283),
        l = e.i(671376),
        c = e.i(627636),
        p = e.i(450639),
        v = e.i(486736),
        m = e.i(995849),
        h = e.i(899058),
        f = e.i(309999),
        g = e.i(255382),
        I = e.i(392782),
        P = e.i(239320),
        y = e.i(17829);
    let b = async e => {
        var t;
        let s = null == (t = (await P.default.getAssetQuotas("RateLimitCreatorMarketplaceDistribute", e)).quotas) ? void 0 : t[0];
        if (s && void 0 !== s.usage && void 0 !== s.capacity && void 0 !== s.duration && s.duration in P.QuotaDuration) return {
            capacity: s.capacity,
            duration: s.duration,
            expirationTime: s.expirationTime ? new Date(s.expirationTime) : void 0,
            usage: s.usage
        };
        throw Error("empty quota")
    }, w = async e => await g.default.getAssetPermissions(e), A = async (e, t) => await g.default.batchCheckAssetPermissions(t.map(t => ({
        assetId: e,
        subject: m.SubjectType.Universe,
        subjectId: t.toString(),
        permissionType: m.AssetConsumerAction.Use
    }))), S = async (e, t) => {
        var s, r, i, n;
        let a = await g.default.batchCheckAssetPermissions([{
            assetId: t,
            subject: m.SubjectType.User,
            subjectId: e.toString(),
            permissionType: m.AssetConsumerAction.Edit
        }]);
        if (!a || a.length < 1 || a[0].error) throw Error(null != (r = null == a || null == (n = a[0]) || null == (i = n.error) ? void 0 : i.message) ? r : "Something went wrong fetching asset edit permissions");
        return (null == (s = a[0].value) ? void 0 : s.status) === m.ApiPermissionStatus.HasPermission
    }, R = async e => {
        if (0 === e.length) return null;
        let t = await I.default.getDetails(e);
        return t.data && t.data.length > 0 ? t.data.filter(e => e && e.id && e.name && e.creator && e.creator.name).map(e => {
            var t;
            return {
                universeId: e.id,
                experienceName: e.name,
                creatorName: null == (t = e.creator) ? void 0 : t.name
            }
        }) : null
    };
    var x = ((t = {}).AssetNotPublic = "AssetNotPublic", t.UserNotVerified = "UserNotVerified", t.InvalidAssetType = "InvalidAssetType", t.PotentialPolicyViolation = "PotentialPolicyViolation", t.IneligibleFiatSeller = "IneligibleFiatSeller", t.Other = "Other", t.Unauthorized = "Unauthorized", t.NotStarted = "NotStarted", t.NotStartedAudioDistribution = "NotStartedAudioDistribution", t.Approved = "Approved", t.PackageIneligible = "PackageIneligible", t.RightsClaim = "RightsClaim", t.CompositeAssetBrokenDependencies = "CompositeAssetBrokenDependencies", t.CompositeAssetIneligibleDependencies = "CompositeAssetIneligibleDependencies", t.CompositeAssetDependenciesLimit = "CompositeAssetDependenciesLimit", t.HiddenFromSearch = "HiddenFromSearch", t.IneligiblePublisher = "IneligiblePublisher", t);
    e.s(["DistributionErrorState", () => x, "getAssetPermissions", 0, w, "getBackToCreationsPageLink", 0, e => {
        let t = "/dashboard/creations";
        return (null == e ? void 0 : e.type) && ((null == e ? void 0 : e.creator.type) === y.default.Group ? t += "?activeTab=".concat(e.type, "&groupId=").concat(e.creator.id) : t += "?activeTab=".concat(e.type)), t
    }, "getDeveloperItemDistributionQuota", 0, b, "getDistributionErrorStateForRestrictions", 0, (e, t, s, r, i, n, a) => e.includes(h.Restriction.CompositeAssetSubcomponentsRestricted) ? "CompositeAssetIneligibleDependencies" : e.includes(h.Restriction.CompositeAssetBrokenUnknownPermissions) || e.includes(h.Restriction.CompositeAssetBrokenReferencedAssetNotFound) ? "CompositeAssetBrokenDependencies" : e.includes(h.Restriction.CompositeAssetBrokenDependenciesLimit) ? "CompositeAssetDependenciesLimit" : e.includes(h.Restriction.AgeVerification) || e.includes(h.Restriction.Moderation) ? "IneligiblePublisher" : e.includes(h.Restriction.SafetyStatus) ? "PotentialPolicyViolation" : e.includes(h.Restriction.AssetType) ? "InvalidAssetType" : e.includes(h.Restriction.Authorization) ? "Unauthorized" : e.includes(h.Restriction.Packages) ? "PackageIneligible" : t ? n && (s.includes(h.Restriction.Moderation) || s.includes(h.Restriction.ModerationHistory) || s.includes(h.Restriction.TwoStepVerification) || s.includes(h.Restriction.Verification)) ? "IneligibleFiatSeller" : e.includes(h.Restriction.RightsClaim) || s.includes(h.Restriction.RightsClaim) ? "RightsClaim" : !r && n ? "Other" : a === f.ToolboxVisibilityStatus.Hidden ? "HiddenFromSearch" : void 0 : "Other", "getExperienceDetails", 0, R, "getUniverseHasPermission", 0, A, "getUserHasEditPermissionForAsset", 0, S, "postDeveloperItemDetails", 0, (e, t) => u.default.updateAsset(parseInt(e, 10), {
        ...t
    })], 720054);
    let C = (0, r.createContext)({
        canConfigureDeveloperItem: void 0,
        developerItemDetails: null,
        developerItemId: void 0,
        developerItemImage: "no image",
        iconAssetId: null,
        isLoadingDeveloperItem: !0,
        refreshDeveloperItemDetails: () => {
            throw Error("function is not implemented")
        },
        updateIconAssetId: () => {
            throw Error("function is not implemented")
        }
    });
    C.displayName = "DeveloperItemDetail", e.s(["DeveloperItemProvider", 0, e => {
        var t;
        let {
            children: m
        } = e, [h, f] = (0, r.useState)(!0), [g, I] = (0, r.useState)(void 0), [P, y] = (0, r.useState)(null), {
            user: b
        } = (0, a.useAuthentication)(), {
            settings: w
        } = (0, v.useSettings)(), {
            query: A,
            isReady: R
        } = (0, i.useRouter)(), x = (0, r.useMemo)(() => {
            if (R) {
                let {
                    id: e
                } = A;
                if (e) {
                    let t = parseInt(String(e), 10);
                    return t > 0 ? t : void 0
                }
            }
        }, [A, R]), [T, q] = (0, r.useState)(null);
        (0, r.useEffect)(() => {
            w.enableAudioUploadRevamp && x && (null == P ? void 0 : P.type) === l.Asset.Audio && o.default.getAsset(x, [o.FieldMask.ICON]).then(e => {
                if (e.icon) {
                    let t = parseInt(e.icon.replace("assets/", ""), 10);
                    Number.isNaN(t) || q(t)
                }
            })
        }, [x, null == P ? void 0 : P.type, w.enableAudioUploadRevamp]);
        let D = null != (t = null != T ? T : x) ? t : 0,
            {
                thumbnailImage: E,
                refreshThumbnail: G
            } = (0, p.default)({
                targetId: D,
                targetType: n.ThumbnailTypes.assetThumbnail,
                fontColor: "dark",
                returnPolicy: n.ReturnPolicy.PlaceHolder
            }),
            B = (0, r.useCallback)(e => {
                var t, s;
                let r = Object.values(l.Asset),
                    i = e.type && r.includes(e.type);
                return e.id && i && e.name && (null == (t = e.creator) ? void 0 : t.targetId) && (null == (s = e.creator) ? void 0 : s.type) && void 0 !== e.enableComments && void 0 !== e.isCopyingAllowed
            }, []),
            U = (0, r.useCallback)(async (e, t) => {
                f(!0);
                let [s, r] = await Promise.allSettled([u.default.getAssetDetails([e]), S(t, e)]);
                if (s.status === d.AllSettlePromiseSuccess && r.status === d.AllSettlePromiseSuccess) {
                    var i, n, a, o, p, v, m, h;
                    let e = null == (i = s.value.data) ? void 0 : i[0];
                    if (e && B(e)) {
                        let t = Object.values(l.Asset).find(t => t === e.type),
                            s = Object.values(c.CreatorType).find(t => {
                                var s;
                                return t === (null == (s = e.creator) ? void 0 : s.type)
                            });
                        if (!t || !s) {
                            y(null), f(!1);
                            return
                        }
                        y({
                            id: (null != (n = e.id) ? n : 0).toString(),
                            type: t,
                            name: null != (a = e.name) ? a : "",
                            creator: {
                                id: null != (o = null == (h = e.creator) ? void 0 : h.targetId) ? o : 0,
                                type: s
                            },
                            enableComments: null != (p = e.enableComments) && p,
                            isCopyingAllowed: null != (v = e.isCopyingAllowed) && v,
                            isVersioningEnabled: null != (m = e.isVersioningEnabled) && m,
                            description: e.description
                        })
                    } else y(null);
                    I(r.value)
                } else y(null);
                f(!1)
            }, [B]),
            k = (0, r.useCallback)(async function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                if (e && G(), x && (null == b ? void 0 : b.id)) return U(x, b.id)
            }, [b, x, U, G]);
        (0, r.useEffect)(() => {
            k()
        }, [k]);
        let M = (0, r.useMemo)(() => ({
            canConfigureDeveloperItem: g,
            developerItemId: x,
            iconAssetId: T,
            isLoadingDeveloperItem: h,
            developerItemDetails: P,
            refreshDeveloperItemDetails: k,
            developerItemImage: E,
            updateIconAssetId: q
        }), [g, P, x, T, h, k, E]);
        return (0, s.jsx)(C.Provider, {
            value: M,
            children: m
        })
    }, "useCurrentDeveloperItem", 0, function() {
        return (0, r.useContext)(C)
    }], 691450)
}, 914570, e => {
    "use strict";
    var t = e.i(221628),
        s = e.i(416340),
        r = e.i(863755),
        i = e.i(495011),
        n = e.i(92653);
    let a = (0, s.createContext)({
        developerProductDetails: void 0,
        isLoading: !1,
        isPending: !1,
        isError: !1,
        isStale: !1,
        isRefetching: !1
    });
    e.s(["DeveloperProductProvider", 0, e => {
        let {
            children: o
        } = e, {
            universeId: u
        } = (0, n.useUniverseId)(), {
            productId: d
        } = (0, i.useProductId)(), l = (0, r.useGetDeveloperProductConfig)({
            universeId: u,
            productId: d
        }, {
            enabled: !!d && !!u
        });
        return (0, t.jsx)(a.Provider, {
            value: (0, s.useMemo)(() => ({
                ...l,
                developerProductDetails: l.data
            }), [l]),
            children: o
        })
    }, "useCurrentDeveloperProduct", 0, function() {
        return (0, s.useContext)(a)
    }])
}, 768243, 4843, e => {
    "use strict";
    var t = e.i(416340);
    let s = (0, t.createContext)({
        isLoading: !1,
        eventDetails: null,
        refreshEventDetails: () => {
            throw Error("Cannot refresh event details prior to fetching for the first time")
        }
    });
    e.s(["default", 0, s], 4843), e.s(["default", 0, function() {
        return (0, t.useContext)(s)
    }], 768243)
}, 199186, 293293, e => {
    "use strict";
    var t = e.i(416340);
    let s = (0, t.createContext)({
        experienceSubscriptionDetails: void 0,
        usedSubscriptionNames: [],
        isExperienceSubscriptionLoading: !1,
        isExperienceSubscriptionRefreshRequired: !1,
        priceTierMap: void 0,
        revshareStatModelMap: void 0,
        canAccessExperienceSubscription: !1,
        refreshExperienceSubscriptionDetails: () => ({})
    });
    s.displayName = "experienceSubscriptions", e.s(["default", 0, s], 293293), e.s(["default", 0, function() {
        return (0, t.useContext)(s)
    }], 199186)
}, 731815, 213465, e => {
    "use strict";
    var t = e.i(416340);
    let s = (0, t.createContext)({
        isLoadingItem: !1,
        refreshItemDetails: () => {
            throw Error("function is not implemented")
        },
        collectiblesMetadata: void 0,
        marketplaceItemDetails: void 0
    });
    s.displayName = "ItemDetails", e.s(["default", 0, s], 213465), e.s(["default", 0, function() {
        return (0, t.useContext)(s)
    }], 731815)
}, 105098, 995721, e => {
    "use strict";
    var t = e.i(416340);
    let s = (0, t.createContext)({
        isLoadingLook: !1,
        refreshLookDetails: () => {
            throw Error("function is not implemented")
        },
        lookSalesData: void 0,
        lookDetail: void 0
    });
    s.displayName = "LookDetails", e.s(["default", 0, s], 995721), e.s(["default", 0, function() {
        return (0, t.useContext)(s)
    }], 105098)
}, 882221, e => {
    "use strict";
    var t = e.i(221628),
        s = e.i(416340),
        r = e.i(261482),
        i = e.i(477749),
        n = e.i(92653),
        a = e.i(157310),
        o = e.i(851130),
        u = e.i(966956);
    let d = (0, s.createContext)({
        passDetails: void 0,
        passPromotionsStatus: void 0,
        isPassLoading: !1,
        isPassDetailsRefetching: !1
    });
    d.displayName = "Pass", e.s(["PassProvider", 0, function(e) {
        let {
            children: l
        } = e, {
            universeId: c
        } = (0, n.useUniverseId)(), {
            passId: p
        } = (0, i.usePassId)(), v = !!c && !!p, {
            data: m,
            isLoading: h,
            isRefetching: f
        } = function(e) {
            var t;
            let {
                universeId: s,
                gamePassId: r
            } = e, i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return (0, a.useQuery)({
                queryKey: u.gamePassKeys.config(s, r),
                queryFn: e => {
                    let {
                        signal: t
                    } = e;
                    return o.default.getGamePassConfig({
                        universeId: s,
                        gamePassId: r
                    }, {
                        signal: t
                    })
                },
                staleTime: u.DEFAULT_STALE_TIME,
                retry: u.DEFAULT_RETRIES,
                ...i,
                enabled: (null == (t = i.enabled) || t) && !!s && s > 0 && !!r
            })
        }({
            universeId: c,
            gamePassId: p
        }, {
            enabled: v
        }), {
            data: g,
            isLoading: I
        } = (0, r.useGetGamePassBonusOptIn)({
            universeId: c,
            gamePassId: p
        }, {
            enabled: v
        }), P = h || I;
        return (0, t.jsx)(d.Provider, {
            value: (0, s.useMemo)(() => ({
                passDetails: m,
                passPromotionsStatus: g,
                isPassLoading: P,
                isPassDetailsRefetching: f
            }), [m, g, P, f]),
            children: l
        })
    }, "useCurrentPass", 0, function() {
        return (0, s.useContext)(d)
    }], 882221)
}, 967775, 946897, e => {
    "use strict";
    var t = e.i(416340);
    let s = (0, t.createContext)({
        placeDetails: void 0,
        refreshPlaceDetails: () => Promise.reject(Error("not implemented")),
        canConfigurePlace: !1,
        containingUniverse: 0,
        isPlaceLoading: !1,
        placeIcon: void 0,
        refreshPlaceIcon: () => Promise.reject(Error("not implemented"))
    });
    s.displayName = "PlaceDetails", e.s(["default", 0, s], 946897), e.s(["default", 0, function() {
        return (0, t.useContext)(s)
    }], 967775)
}, 863755, 285040, 495011, e => {
    "use strict";
    var t = e.i(157310),
        s = e.i(503725);
    let r = {
        all: e => ["universes", e, "developerproducts"],
        list: (e, t) => [...r.all(e), "list", t],
        config: (e, t) => [...r.all(e), "config", t],
        batchConfigs: (e, t) => [...r.all(e), "batchConfigs", [...t].sort((e, t) => e - t)],
        create: e => [...r.all(e), "create"],
        update: (e, t) => [...r.all(e), t, "update"],
        batchUpdate: e => [...r.all(e), "batchUpdate"]
    };
    e.s(["BULK_UPDATE_LIMIT", 0, 3e3, "DEFAULT_PAGE_SIZE", 0, 400, "DEFAULT_RETRIES", 0, 3, "DEFAULT_STALE_TIME", 0, 6e5, "INITIAL_FETCH_TOTAL", 0, 3e3, "developerProductKeys", 0, r, "matchesDeveloperProductBatchConfigsQuery", 0, function(e, t) {
        let s = e.queryKey;
        return "universes" === s[0] && s[1] === t && "developerproducts" === s[2] && "batchConfigs" === s[3] && Array.isArray(s[4])
    }, "matchesDeveloperProductListQuery", 0, function(e, t) {
        let s = e.queryKey;
        return "universes" === s[0] && s[1] === t && "developerproducts" === s[2] && "list" === s[3]
    }], 285040), e.s(["useGetDeveloperProductConfig", 0, function(e) {
        let {
            universeId: i,
            productId: n
        } = e, a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return (0, t.useQuery)({
            queryKey: r.config(i, n),
            queryFn: e => {
                let {
                    signal: t
                } = e;
                return s.default.getDeveloperProductConfig({
                    universeId: i,
                    productId: n
                }, {
                    signal: t
                })
            },
            retry: 3,
            ...a
        })
    }], 863755);
    var i = e.i(237401);
    e.s(["useProductId", 0, function() {
        let e = (0, i.useRouter)(),
            t = e.query.productId;
        if (!e.isReady) return {
            isLoading: !0,
            isError: !1
        };
        if (!t || Array.isArray(t)) return {
            isLoading: !1,
            isError: !0
        };
        let s = Number(t);
        return Number.isNaN(s) || !Number.isInteger(s) ? {
            isLoading: !1,
            isError: !0
        } : {
            productId: s,
            isLoading: !1,
            isError: !1
        }
    }], 495011)
}, 34213, 779433, e => {
    "use strict";
    var t = e.i(614505),
        s = e.i(157700);
    let r = (0, s.defineFlag)({
            namespace: "content-suitability",
            name: "questionnaireV2Allowlist",
            defaultValue: !1
        }),
        i = (0, s.defineFlag)({
            namespace: "content-suitability",
            name: "questionnaireV2Q1Release",
            defaultValue: !1
        });
    e.s(["questionnaireV2Allowlist", 0, r, "questionnaireV2Q1Release", 0, i], 779433), e.s(["default", 0, () => {
        let {
            ready: e,
            value: s
        } = (0, t.useFlag)(r), {
            ready: n,
            value: a
        } = (0, t.useFlag)(i), o = e && n;
        return {
            shouldUseV2: o && (a || s),
            isFetched: o
        }
    }], 34213)
}, 17829, e => {
    "use strict";
    var t, s = ((t = s || {}).User = "User", t.Group = "Group", t);
    e.s(["default", 0, s])
}, 627636, e => {
    "use strict";
    var t = e.i(17829);
    e.s(["CreatorType", () => t.default])
}, 450639, 950473, e => {
    "use strict";
    var t = e.i(221628),
        s = e.i(416340),
        r = e.i(79187),
        i = e.i(540513),
        n = e.i(808377),
        a = e.i(449934),
        o = e.i(169722),
        u = e.i(591403),
        d = e.i(833172);
    e.s(["NotInterestedIcon", () => d.NotInterested], 950473);
    var d = d,
        l = e.i(559956),
        c = e.i(199834),
        p = e.i(706442);
    let v = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
        return (0, p.makeStyles)()(t => ({
            imageStatusContainer: {
                backgroundColor: e ? t.palette.surface.outline : t.palette.components.input.filled.enableFill,
                color: e ? t.palette.content.inverse : t.palette.content.muted,
                width: "100%",
                height: "100%"
            },
            statusTextContainer: {
                display: "block",
                textAlign: "center",
                whiteSpace: "nowrap",
                color: e ? t.palette.content.inverse : t.palette.content.muted
            },
            imageContainer: {
                width: "100%",
                height: 0,
                paddingTop: "100%",
                position: "relative",
                borderRadius: e ? 4 : 8,
                overflow: "hidden",
                backgroundColor: t.palette.components.input.filled.enableFill
            },
            imageWrapper: {
                position: "absolute",
                bottom: 0,
                left: 0,
                width: "100%",
                height: "100%",
                textAlign: "center"
            },
            image: {
                width: "100%",
                height: "100%",
                position: "absolute",
                left: "0",
                bottom: "0",
                objectFit: "contain"
            },
            bottomRightAdornmentContainer: {
                position: "absolute",
                bottom: 8,
                right: 8,
                padding: 4,
                borderRadius: 4,
                background: t.palette.surface[200],
                display: "flex"
            },
            skeleton: {
                height: "100%"
            }
        }))
    };
    e.s(["default", 0, e => {
        let {
            targetId: p,
            targetType: m,
            returnPolicy: h = i.ReturnPolicy.AutoGenerated,
            isStatusTextShown: f = !1,
            alt: g,
            fontColor: I = "light",
            bottomRightAdornment: P
        } = e, {
            classes: {
                imageStatusContainer: y,
                statusTextContainer: b,
                imageWrapper: w,
                imageContainer: A,
                image: S,
                bottomRightAdornmentContainer: R,
                skeleton: x
            }
        } = v("light" !== I)(), {
            translate: C
        } = (0, r.useTranslation)(), [T, q] = (0, s.useState)(!1), [D, E] = (0, s.useState)(), G = (0, s.useCallback)(async function(e, t, s) {
            let r = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
            if (t && e) {
                q(!0);
                try {
                    let n = r ? i.ThumbnailClient.reloadThumbnailImage : i.ThumbnailClient.getThumbnailImage,
                        a = await n(e, t, s);
                    E(a)
                } catch (e) {
                    E({
                        state: n.ThumbnailResponseState.TemporarilyUnavailable
                    })
                } finally {
                    q(!1)
                }
            }
        }, []), B = (0, s.useMemo)(() => {
            if (T) return (0, t.jsx)(l.Skeleton, {
                classes: {
                    root: x
                },
                variant: "rectangular",
                animate: !0
            });
            let e = "",
                s = null;
            switch (null == D ? void 0 : D.state) {
                case n.ThumbnailResponseState.InReview:
                    e = C("Label.InReview"), s = (0, t.jsx)(u.HourglassEmptyIcon, {
                        fontSize: "large",
                        color: "dark" === I ? void 0 : "secondary"
                    });
                    break;
                case n.ThumbnailResponseState.Blocked:
                    e = C("Label.Moderated"), s = (0, t.jsx)(d.NotInterested, {
                        fontSize: "large",
                        color: "dark" === I ? void 0 : "secondary"
                    });
                    break;
                case n.ThumbnailResponseState.Error:
                case n.ThumbnailResponseState.TemporarilyUnavailable:
                    e = C("Label.Unavailable"), s = (0, t.jsx)(a.BrokenImageOutlinedIcon, {
                        fontSize: "large",
                        color: "dark" === I ? void 0 : "secondary"
                    });
                    break;
                default:
                    return null
            }
            return (0, t.jsx)(o.Grid, {
                container: !0,
                classes: {
                    root: y
                },
                justifyContent: "center",
                alignItems: "center",
                children: f ? (0, t.jsxs)("div", {
                    children: [s, (0, t.jsx)(c.Typography, {
                        variant: "smallLabel1",
                        classes: {
                            root: b
                        },
                        children: e
                    })]
                }) : s
            })
        }, [T, null == D ? void 0 : D.state, y, f, b, x, C, I]);
        return (0, s.useEffect)(() => {
            G(m, p, h)
        }, [p, m, h, G]), {
            thumbnailImage: (0, t.jsx)(o.Grid, {
                item: !0,
                container: !0,
                XSmall: 12,
                justifyContent: "center",
                alignItems: "center",
                children: (0, t.jsxs)("div", {
                    className: A,
                    children: [(null == D ? void 0 : D.state) === n.ThumbnailResponseState.Completed ? (0, t.jsx)("img", {
                        className: S,
                        src: null == D ? void 0 : D.imageUrl,
                        alt: g
                    }) : (0, t.jsx)("div", {
                        className: w,
                        children: B
                    }), P ? (0, t.jsx)("div", {
                        className: R,
                        children: P
                    }) : null]
                })
            }),
            thumbnailData: D,
            refreshThumbnail: (0, s.useCallback)(async () => G(m, p, h, !0), [G, m, p, h])
        }
    }], 450639)
}, 692587, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        return Object.entries(e).reduce((e, t) => {
            let [s, r] = t;
            return Array.isArray(r) ? e[s] = r.at(0) : e[s] = r, e
        }, {})
    }, "readQueryValue", 0, function(e) {
        if (null != e) return Array.isArray(e) ? e.at(0) : e
    }])
}, 92653, e => {
    "use strict";
    var t = e.i(237401);
    e.s(["useUniverseId", 0, function() {
        let e = (0, t.useRouter)(),
            s = e.query.id;
        if (!e.isReady) return {
            isLoading: !0,
            isError: !1
        };
        if (!s || Array.isArray(s)) return {
            isLoading: !1,
            isError: !0
        };
        let r = Number(s);
        return Number.isNaN(r) || !Number.isInteger(r) ? {
            isLoading: !1,
            isError: !0
        } : {
            universeId: r,
            isLoading: !1,
            isError: !1
        }
    }])
}, 943758, e => {
    "use strict";
    var t = e.i(221628),
        s = e.i(416340);
    let r = (0, s.createContext)(null);
    e.s(["BreadcrumbItemNameProvider", 0, function(e) {
        let {
            children: i
        } = e, n = (0, s.useRef)({}), a = (0, s.useRef)(new Set), o = (0, s.useCallback)(() => n.current, []), u = (0, s.useCallback)(e => (a.current.add(e), () => {
            a.current.delete(e)
        }), []), d = (0, s.useCallback)(() => {
            for (let e of a.current) e()
        }, []), l = (0, s.useCallback)((e, t) => {
            n.current[e] !== t && (n.current = {
                ...n.current,
                [e]: t
            }, d())
        }, [d]), c = (0, s.useCallback)(e => {
            if (e in n.current) {
                let t = {
                    ...n.current
                };
                delete t[e], n.current = t, d()
            }
        }, [d]), p = (0, s.useMemo)(() => ({
            getSnapshot: o,
            subscribe: u,
            register: l,
            unregister: c
        }), [o, u, l, c]);
        return (0, t.jsx)(r.Provider, {
            value: p,
            children: i
        })
    }, "useBreadcrumbItemNames", 0, function() {
        let e = (0, s.useContext)(r);
        if (!e) throw Error("useBreadcrumbItemNames must be used within an BreadcrumbItemNameProvider");
        return (0, s.useSyncExternalStore)(e.subscribe, e.getSnapshot, e.getSnapshot)
    }, "useBreadcrumbRegister", 0, function() {
        let e = (0, s.useContext)(r);
        if (!e) throw Error("useBreadcrumbRegister must be used within an BreadcrumbItemNameProvider");
        return e
    }])
}, 128106, e => {
    "use strict";
    var t, s = ((t = s || {}).Creations = "creations", t.Games = "games", t.GamePass = "passes", t.Badge = "badges", t.Bundle = "bundle", t.DeveloperProduct = "developer-products", t.ExternalPurchaseSettings = "external-purchase-settings", t.Catalog = "catalog", t.AssociatedItems = "associated-items", t.Localization = "localization", t.ActivityHistory = "activity-history", t.Notifications = "notifications", t.SocialLinks = "social-links", t.FreeAvatars = "free-avatars", t.Translation = "translation", t.Overview = "overview", t.ContributionReport = "contribution-report", t.Alerts = "alerts", t.AnalyticsMonetization = "analytics-monetization", t.AnalyticsRetention = "analytics-retention", t.AnalyticsEngagement = "analytics-engagement", t.AnalyticsAcquisition = "analytics-acquisition", t.AnalyticsPerformance = "analytics-performance", t.AnalyticsCrashes = "analytics-crashes", t.AnalyticsExploreMode = "analytics-explore-mode", t.AnalyticsCustomDashboards = "analytics-custom-dashboards", t.AnalyticsAudience = "analytics-audience", t.AnalyticsEconomy = "analytics-economy", t.AnalyticsFunnels = "analytics-funnels", t.AnalyticsErrorReport = "analytics-error-report", t.AnalyticsMemoryStores = "analytics-memory-stores", t.AnalyticsDataStores = "analytics-data-stores", t.AnalyticsHttpServicce = "analytics-http-service", t.AnalyticsMessagingService = "analytics-messaging-service", t.AnalyticsSpeechToText = "analytics-speech-to-text", t.AnalyticsTextToSpeech = "analytics-text-to-speech", t.AnalyticsVideoService = "analytics-video-service", t.AnalyticsGenerativeAI = "analytics-generative-ai", t.AnalyticCustomEvents = "analytics-custom-events", t.ImmersiveAds = "immersive-ads", t.ImmersiveAdsCreatePlacement = "immersive-ads-create-placement", t.Questionnaire = "experience-questionnaire", t.Guidelines = "guidelines", t.Configure = "configure", t.CommunicationSettings = "communication-settings", t.Sales = "sales", t.Promotions = "promotions", t.Create = "create", t.ConfigCreate = "config-create", t.Updates = "updates", t.Places = "places", t.Manage = "manage", t.Icon = "icon", t.Event = "event", t.SelectEligibility = "selectEligibility", t.Thumbnails = "thumbnails", t.Videos = "videos", t.Access = "access", t.Secrets = "secrets", t.CreatorStore = "store", t.Settings = "settings", t.Permissions = "permissions", t.Webhooks = "webhooks", t.Community = "community", t.Category = "category", t.Experiences = "experiences", t.ExperienceSubscription = "experience-subscriptions", t.Commerce = "commerce", t.CreateProducts = "create-products", t.Preferences = "preferences", t.Advanced = "advanced", t.DataSharing = "data-collection", t.PricedAssets = "priced-assets", t.Eligibility = "eligibility", t.AudioDistribution = "audio-distribution", t.PriceOptimization = "price-optimization", t.PriceCheck = "price-check", t.Bans = "bans", t.Add = "add", t.Reorder = "reorder", t.AvatarCreationTokens = "avatar-creation-tokens", t.CustomMatchmaking = "custom-matchmaking", t.CreateMatchmakingConfiguration = "create-configuration", t.CreateMatchmakingAttribute = "create-attribute", t.EditMatchmakingConfiguration = "edit-configuration", t.EditMatchmakingServerAttribute = "edit-server-attribute", t.EditMatchmakingPlayerAttribute = "edit-player-attribute", t.PaidAccess = "paid-access", t.ExtendedServices = "extended-services", t.PublicPublish = "public-publish", t.PublishingPermissions = "publishing-permissions", t.UsO18DevexRate = "us-o18-devex-rate", t.Feedback = "feedback", t.ApiSettings = "api-settings", t.Configs = "configs", t.ConfigsHistory = "configs-history", t.Experiments = "experiments", t.ExperimentCreate = "experiment-create", t.ExperimentDetails = "experiment-details", t.ReferralRewards = "referral-reward-details", t.Environments = "environments", t.Collaborators = "collaborators", t.Look = "look", t.AnalyticsJourneys = "analytics-journeys", t.AnalyticsJourneyDetail = "analytics-journey-detail", t.RecommendationService = "recommendation-service", t.ServerManagement = "server-management-service", t.ClientSessions = "client-sessions", t.ClientSession = "client-session", t.ManagedPricing = "managed-pricing", t.HardCodedPrices = "hard-coded-prices", t.Leaderboard = "leaderboard", t.PersonalizedShop = "personalized-shop", t.AudienceReach = "audience-reach", t.PlayerSupport = "player-support", t.PlayerSupportTicket = "player-support-ticket", t);
    e.s(["default", 0, s])
}, 509049, e => {
    "use strict";
    var t = e.i(416340),
        s = e.i(79187),
        r = e.i(34213),
        i = e.i(237401),
        n = e.i(54842),
        a = e.i(663629),
        o = e.i(691450),
        u = e.i(914570),
        d = e.i(768243),
        l = e.i(199186),
        c = e.i(731815),
        p = e.i(105098),
        v = e.i(882221),
        m = e.i(967775),
        h = e.i(475360),
        f = e.i(17829),
        g = e.i(251622),
        I = e.i(692587),
        P = e.i(114209),
        y = e.i(943758),
        b = e.i(128106);
    e.s(["default", 0, function() {
        let {
            translate: e
        } = (0, s.useTranslation)(), {
            shouldUseV2: w
        } = (0, r.default)(), {
            itemNameMapping: A,
            currentItemType: S,
            currentItemGroupId: R,
            isCurrentItemLoading: x,
            id: C,
            badgeId: T,
            passId: q,
            groupId: D,
            assetId: E,
            bundleId: G,
            experienceSubscriptionId: B,
            lookId: U,
            developerItemDetails: k,
            experimentId: M,
            environmentId: N
        } = function() {
            var e, r, w, A, S, R, x, C, T, q, D, E;
            let {
                translate: G
            } = (0, s.useTranslation)(), {
                gameDetails: B,
                isLoadingGame: U
            } = (0, P.useCurrentGame)(), {
                isLoadingItem: k,
                marketplaceItemDetails: M
            } = (0, c.default)(), {
                badgeDetails: N
            } = (0, a.default)(), {
                developerProductDetails: L
            } = (0, u.useCurrentDeveloperProduct)(), {
                passDetails: O
            } = (0, v.useCurrentPass)(), {
                lookDetail: F,
                isLoadingLook: V
            } = (0, p.default)(), {
                placeDetails: j
            } = (0, m.default)(), {
                eventDetails: _,
                isLoading: z
            } = (0, d.default)(), {
                developerItemDetails: J,
                isLoadingDeveloperItem: H
            } = (0, o.useCurrentDeveloperItem)(), {
                experienceSubscriptionDetails: K
            } = (0, l.default)(), Q = (0, y.useBreadcrumbItemNames)(), {
                query: W,
                pathname: Y
            } = (0, i.useRouter)(), {
                id: X,
                badgeId: Z,
                notificationCategory: $,
                activeTab: ee,
                experimentId: et,
                environmentId: es
            } = (0, I.default)(W), er = (0, t.useMemo)(() => {
                var e, t;
                return (null == B || null == (e = B.creator) ? void 0 : e.type) === "Group" ? null == B || null == (t = B.creator) ? void 0 : t.id : void 0
            }, [B]), ei = (0, t.useMemo)(() => {
                var e, t, s, r;
                if (null == M || null == (t = M.item) || null == (e = t.marketplaceItemDetails) ? void 0 : e.assetDetails) return null == M || null == (r = M.item) || null == (s = r.id) ? void 0 : s.toString()
            }, [M]), en = (0, t.useMemo)(() => {
                var e;
                return null == O || null == (e = O.gamePassId) ? void 0 : e.toString()
            }, [O]), ea = (0, t.useMemo)(() => {
                var e, t, s, r;
                if (null == M || null == (t = M.item) || null == (e = t.marketplaceItemDetails) ? void 0 : e.bundleDetails) return null == M || null == (r = M.item) || null == (s = r.id) ? void 0 : s.toString()
            }, [M]), eo = (0, t.useMemo)(() => {
                var e;
                return null != (e = null == K ? void 0 : K.id) ? e : void 0
            }, [K]), eu = (0, t.useMemo)(() => {
                var e, t, s, r, i;
                return (null == M || null == (t = M.item) || null == (e = t.creator) ? void 0 : e.kindCase) === 2 ? null == M || null == (i = M.item) || null == (r = i.creator) || null == (s = r.group) ? void 0 : s.groupId : er
            }, [er, null == M || null == (w = M.item) || null == (r = w.creator) || null == (e = r.group) ? void 0 : e.groupId, null == M || null == (S = M.item) || null == (A = S.creator) ? void 0 : A.kindCase]), ed = (0, t.useMemo)(() => null == F ? void 0 : F.lookId, [F]), el = (0, t.useMemo)(() => {
                var e, t, s, r, i, n, a;
                return {
                    [b.default.Bundle]: null == M || null == (n = M.item) ? void 0 : n.name,
                    [b.default.Games]: null == B ? void 0 : B.name,
                    [b.default.Badge]: null == N ? void 0 : N.name,
                    [b.default.DeveloperProduct]: null != (e = null == L ? void 0 : L.name) ? e : void 0,
                    [b.default.GamePass]: null != (t = null == O ? void 0 : O.name) ? t : void 0,
                    [b.default.Catalog]: null == M || null == (a = M.item) ? void 0 : a.name,
                    [b.default.Places]: null == j ? void 0 : j.name,
                    [b.default.Event]: null != (s = null == _ ? void 0 : _.title) ? s : void 0,
                    [b.default.CreatorStore]: null == J ? void 0 : J.name,
                    [b.default.Category]: $ ? G("Label.Category".concat($)) : void 0,
                    [b.default.ExperienceSubscription]: null != (r = null == K ? void 0 : K.name) ? r : void 0,
                    [b.default.Look]: null != (i = null == F ? void 0 : F.name) ? i : void 0,
                    ...Q
                }
            }, [null == M || null == (R = M.item) ? void 0 : R.name, null == B ? void 0 : B.name, null == N ? void 0 : N.name, null == L ? void 0 : L.name, null == O ? void 0 : O.name, null == j ? void 0 : j.name, null == _ ? void 0 : _.title, null == J ? void 0 : J.name, $, G, null == K ? void 0 : K.name, null == F ? void 0 : F.name, Q]), ec = (0, t.useMemo)(() => Y.includes(b.default.ExperienceSubscription) ? h.Item.ExperienceSubscription : Y.includes(b.default.Badge) ? h.Item.Badge : Y.includes(b.default.ReferralRewards) ? h.Item.ReferralRewards : Y.includes(b.default.Bundle) ? h.Item.Bundle : Y.includes(b.default.GamePass) ? h.Item.GamePass : Y.includes(b.default.DeveloperProduct) ? h.Item.DeveloperProduct : Y.includes(b.default.Catalog) ? h.Item.CatalogAsset : Y.includes(b.default.CreatorStore) ? h.Item.LibraryAsset : Y.includes(b.default.Places) ? h.Item.Places : Y.includes(b.default.Environments) ? h.Item.Environment : Y.includes(b.default.Alerts) ? h.Item.Alert : Y.includes(b.default.Event) ? h.Item.Event : Y.includes(b.default.Notifications) ? h.Item.Notifications : Y.includes(b.default.AssociatedItems) && "string" == typeof ee && (0, g.isItem)(ee) ? ee : Y.includes(b.default.AvatarCreationTokens) ? h.Item.AvatarCreationToken : Y.includes(b.default.Experiences) ? h.Item.Game : Y.includes(b.default.Advanced) ? h.Item.Advanced : Y.includes(b.default.Look) ? h.Item.Look : void 0, [ee, Y]), {
                currentItemGroupId: ep,
                isCurrentItemLoading: ev
            } = (0, t.useMemo)(() => {
                var e, t, s, r, i, a;
                return ec === h.Item.Bundle || ec === h.Item.CatalogAsset ? {
                    currentItemGroupId: null != eu ? eu : er,
                    isCurrentItemLoading: k
                } : ec === h.Item.DeveloperProduct || ec === h.Item.LibraryAsset ? {
                    currentItemGroupId: (null == J || null == (e = J.creator) ? void 0 : e.type) === f.default.Group ? null == J || null == (t = J.creator) ? void 0 : t.id : er,
                    isCurrentItemLoading: H
                } : ec === h.Item.Event ? {
                    currentItemGroupId: (null == _ || null == (s = _.host) ? void 0 : s.hostType) === n.HostType.Group ? null == _ || null == (r = _.host) ? void 0 : r.hostId : er,
                    isCurrentItemLoading: z
                } : ec === h.Item.Look ? {
                    currentItemGroupId: (null == F || null == (i = F.curator) ? void 0 : i.type) === f.default.Group ? null == F || null == (a = F.curator) ? void 0 : a.id : er,
                    isCurrentItemLoading: V
                } : {
                    currentItemGroupId: er,
                    isCurrentItemLoading: U
                }
            }, [ec, eu, er, k, null == J || null == (x = J.creator) ? void 0 : x.type, null == J || null == (C = J.creator) ? void 0 : C.id, H, null == _ || null == (T = _.host) ? void 0 : T.hostType, null == _ || null == (q = _.host) ? void 0 : q.hostId, z, U, null == F || null == (D = F.curator) ? void 0 : D.type, null == F || null == (E = F.curator) ? void 0 : E.id, V]);
            return {
                itemNameMapping: el,
                currentItemType: ec,
                currentItemGroupId: ep,
                isCurrentItemLoading: ev,
                pathname: Y,
                id: X,
                badgeId: Z,
                passId: en,
                groupId: er,
                assetId: ei,
                bundleId: ea,
                experienceSubscriptionId: eo,
                getMarketplaceItemGroupId: eu,
                lookId: ed,
                developerItemDetails: J,
                experimentId: et,
                environmentId: es
            }
        }(), L = (0, t.useMemo)(() => ({
            translate: e,
            itemType: S,
            enableQuestionnaireV2: w
        }), [S, w, e]);
        return {
            itemNameMapping: A,
            pathLinkParams: (0, t.useMemo)(() => {
                var e, t;
                return {
                    baseId: null == C ? void 0 : C.toString(),
                    badgeId: null == T ? void 0 : T.toString(),
                    passId: q,
                    groupId: null != (e = null == D ? void 0 : D.toString()) ? e : R ? R.toString() : void 0,
                    assetId: E,
                    bundleId: G,
                    developerItemId: null != (t = null == k ? void 0 : k.id) ? t : void 0,
                    associatedItemType: S,
                    experienceSubscriptionId: B,
                    environmentId: null != N ? N : void 0,
                    experimentId: null != M ? M : void 0,
                    lookId: null != U ? U : void 0
                }
            }, [C, T, q, D, R, E, G, null == k ? void 0 : k.id, S, B, N, M, U]),
            displayNameParam: L,
            currentItemType: S,
            currentItemGroupId: R,
            isCurrentItemLoading: x
        }
    }], 509049)
}, 114209, 559227, e => {
    "use strict";
    var t = e.i(221628),
        s = e.i(416340),
        r = e.i(237401),
        i = e.i(773057),
        n = e.i(392782);
    let a = (0, s.createContext)({
        isLoadingGame: !1,
        isErrorLoadingGame: !1,
        canConfigure: !1,
        gameDetails: null,
        refreshGameDetails: () => {
            throw Error("Not implemented")
        }
    });
    a.displayName = "Game", e.s(["default", 0, a], 559227);
    var o = e.i(721281),
        u = e.i(252842),
        d = e.i(533968);
    let l = new class {
        async getGameDetail(e, t) {
            var s, r, i;
            if (!t && this.gameDetailsMap.has(e)) return null != (s = this.gameDetailsMap.get(e)) ? s : null;
            try {
                let t = null != (r = null == (i = (await this.gamesClient.getDetails([e])).data) ? void 0 : i[0]) ? r : null;
                return t && this.gameDetailsMap.set(e, t), t
            } catch (s) {
                let t = (0, d.getResponseFromError)(s);
                if ((null == t ? void 0 : t.status) === u.StatusCodes.BAD_REQUEST) return null;
                throw console.log("Could not fetch game details for universeId ".concat(e)), s
            }
        }
        async getConfiguration(e, t) {
            if (!t && this.gameConfigurationMap.has(e)) {
                var s;
                return null != (s = this.gameConfigurationMap.get(e)) ? s : null
            }
            try {
                return await this.developClient.getUniverseConfiguration(e), this.gameConfigurationMap.set(e, !0), !0
            } catch (s) {
                let t = (0, d.getResponseFromError)(s);
                if ((null == t ? void 0 : t.status) === u.StatusCodes.FORBIDDEN) return this.gameConfigurationMap.set(e, !1), !1;
                return console.warn("Could not fetch game details for universeId ".concat(e)), null
            }
        }
        constructor(e, t) {
            (0, o._)(this, "gamesClient", void 0), (0, o._)(this, "developClient", void 0), (0, o._)(this, "gameDetailsMap", void 0), (0, o._)(this, "gameConfigurationMap", void 0), this.gamesClient = e, this.developClient = t, this.gameDetailsMap = new Map, this.gameConfigurationMap = new Map
        }
    }(n.default, i.default);
    e.s(["default", 0, e => {
        let {
            requestedGameId: i,
            children: n
        } = e, o = (0, r.useRouter)(), [u, d] = (0, s.useState)(!0), [c, p] = (0, s.useState)(null), [v, m] = (0, s.useState)(null), [h, f] = (0, s.useState)(!1), g = (0, s.useRef)(0), I = (0, s.useCallback)(async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                s = g.current += 1,
                r = l.getConfiguration(e),
                i = l.getGameDetail(e, t),
                [n, a] = await Promise.allSettled([r, i]);
            s === g.current && ("fulfilled" === n.status ? p(n.value) : p(null), "fulfilled" === a.status ? (f(!1), m(a.value)) : ("rejected" === a.status ? f(!0) : f(!1), m(null)), d(!1))
        }, []), P = (0, s.useMemo)(() => {
            let {
                id: e
            } = o.query;
            return i || ("string" == typeof e ? parseInt(e, 10) : void 0)
        }, [i, o.query]), y = (0, s.useCallback)(() => P ? I(P, !0) : Promise.reject(Error("Cannot refresh game details without a game ID")), [P, I]);
        (0, s.useEffect)(() => {
            try {
                if (void 0 !== P && !Number.isNaN(P) && P > 0) return void I(P);
                g.current += 1, p(null), m(null), f(!1), d(!1)
            } catch (e) {
                console.warn("Could not fetch game details for universeId ".concat(P))
            }
        }, [P, I]);
        let b = (0, s.useMemo)(() => ({
            isLoadingGame: u,
            canConfigure: c,
            gameDetails: v,
            isErrorLoadingGame: h,
            refreshGameDetails: y
        }), [u, c, v, h, y]);
        return (0, t.jsx)(a.Provider, {
            value: b,
            children: n
        })
    }, "useCurrentGame", 0, function() {
        let e = (0, s.useContext)(a);
        if (null === e) throw Error("useCurrentGame must be used within a GameProvider");
        return e
    }], 114209)
}, 899058, e => {
    "use strict";
    var t = e.i(677753),
        s = function(e, t) {
            return (s = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var s in t) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s])
            })(e, t)
        };

    function r(e, t, s, r) {
        return new(s || (s = Promise))(function(i, n) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    n(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    n(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var s, r, i, n = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var d = [o, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, d[0] && (n = 0)), n;) try {
                    if (s = 1, r && (i = 2 & d[0] ? r.return : d[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, d[1])).done) return i;
                    switch (r = 0, i && (d = [2 & d[0], i.value]), d[0]) {
                        case 0:
                        case 1:
                            i = d;
                            break;
                        case 4:
                            return n.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            n.label++, r = d[1], d = [0];
                            continue;
                        case 7:
                            d = n.ops.pop(), n.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = n.trys).length > 0 && i[i.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                n = 0;
                                continue
                            }
                            if (3 === d[0] && (!i || d[1] > i[0] && d[1] < i[3])) {
                                n.label = d[1];
                                break
                            }
                            if (6 === d[0] && n.label < i[1]) {
                                n.label = i[1], i = d;
                                break
                            }
                            if (i && n.label < i[2]) {
                                n.label = i[2], n.ops.push(d);
                                break
                            }
                            i[2] && n.ops.pop(), n.trys.pop();
                            continue
                    }
                    d = t.call(e, n)
                } catch (e) {
                    d = [6, e], r = 0
                } finally {
                    s = i = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function n(e) {
        return e
    }

    function a(e) {
        return e
    }

    function o(e) {
        var s;
        return null == (s = e) ? s : {
            duration: (0, t.exists)(s, "duration") ? s.duration : void 0,
            usage: (0, t.exists)(s, "usage") ? s.usage : void 0,
            capacity: (0, t.exists)(s, "capacity") ? s.capacity : void 0,
            expirationTime: (0, t.exists)(s, "expirationTime") ? null === s.expirationTime ? null : new Date(s.expirationTime) : void 0
        }
    }

    function u(e) {
        return e
    }

    function d(e) {
        return e
    }
    "function" == typeof SuppressedError && SuppressedError;
    var l = function(e) {
        function l() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function r() {
                this.constructor = e
            }
            s(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
        }(l, e), l.prototype.marketplacePublishingRequirementsApiGetRequirementsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, l, c;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, void 0 !== e.marketplaceType && (r.MarketplaceType = e.marketplaceType), void 0 !== e.assetType && (r.AssetType = e.assetType), e.assetSubTypes && (r.AssetSubTypes = e.assetSubTypes), void 0 !== e.assetId && (r.AssetId = e.assetId), void 0 !== e.assetVersionNumber && (r.AssetVersionNumber = e.assetVersionNumber), e.requirementChecks && (r.RequirementChecks = e.requirementChecks), l = {}, [4, this.request({
                                path: "/v1/requirements",
                                schemaPath: "/v1/requirements",
                                method: "GET",
                                headers: l,
                                query: r
                            }, s)];
                        case 1:
                            return c = i.sent(), [2, new t.JSONApiResponse(c, function(e) {
                                var s, r, i, l, c, p, v;
                                return null == e ? e : {
                                    publishing: (0, t.exists)(e, "publishing") ? null == (s = e.publishing) ? s : {
                                        restrictions: (0, t.exists)(s, "restrictions") ? null === s.restrictions ? null : s.restrictions.map(n) : void 0,
                                        allowedSubTypes: (0, t.exists)(s, "allowedSubTypes") ? null === s.allowedSubTypes ? null : s.allowedSubTypes.map(a) : void 0,
                                        isAllowed: (0, t.exists)(s, "isAllowed") ? s.isAllowed : void 0
                                    } : void 0,
                                    verification: (0, t.exists)(e, "verification") ? null == (r = e.verification) ? r : {
                                        isVerified: (0, t.exists)(r, "isVerified") ? r.isVerified : void 0,
                                        status: (0, t.exists)(r, "status") ? r.status : void 0,
                                        supportedTypes: (0, t.exists)(r, "supportedTypes") ? null === r.supportedTypes ? null : r.supportedTypes.map(d) : void 0
                                    } : void 0,
                                    sellerOnboarding: (0, t.exists)(e, "sellerOnboarding") ? null == (i = e.sellerOnboarding) ? i : {
                                        restrictions: (0, t.exists)(i, "restrictions") ? null === i.restrictions ? null : i.restrictions.map(n) : void 0,
                                        isAllowed: (0, t.exists)(i, "isAllowed") ? i.isAllowed : void 0
                                    } : void 0,
                                    pricing: (0, t.exists)(e, "pricing") ? null == (l = e.pricing) ? l : {
                                        restrictions: (0, t.exists)(l, "restrictions") ? null === l.restrictions ? null : l.restrictions.map(n) : void 0,
                                        isAllowed: (0, t.exists)(l, "isAllowed") ? l.isAllowed : void 0
                                    } : void 0,
                                    openUse: (0, t.exists)(e, "openUse") ? null == (c = e.openUse) ? c : {
                                        restrictions: (0, t.exists)(c, "restrictions") ? null === c.restrictions ? null : c.restrictions.map(n) : void 0,
                                        isAllowed: (0, t.exists)(c, "isAllowed") ? c.isAllowed : void 0
                                    } : void 0,
                                    roles: (0, t.exists)(e, "roles") ? null == (p = e.roles) ? p : {
                                        roles: (0, t.exists)(p, "roles") ? null === p.roles ? null : p.roles.map(u) : void 0
                                    } : void 0,
                                    assetConfigMetadata: (0, t.exists)(e, "assetConfigMetadata") ? null == (v = e.assetConfigMetadata) ? v : {
                                        restrictions: (0, t.exists)(v, "restrictions") ? null === v.restrictions ? null : v.restrictions.map(n) : void 0
                                    } : void 0,
                                    quotas: (0, t.exists)(e, "quotas") ? null === e.quotas ? null : e.quotas.map(o) : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.marketplacePublishingRequirementsApiGetRequirements = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.marketplacePublishingRequirementsApiGetRequirementsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, l
    }(t.BaseAPI);
    e.s(["AssetType", 0, {
        Invalid: "Invalid",
        Image: "Image",
        Tshirt: "Tshirt",
        Audio: "Audio",
        Mesh: "Mesh",
        Lua: "Lua",
        Html: "Html",
        Text: "Text",
        Hat: "Hat",
        Place: "Place",
        Model: "Model",
        Shirt: "Shirt",
        Pants: "Pants",
        Decal: "Decal",
        Avatar: "Avatar",
        Head: "Head",
        Face: "Face",
        Gear: "Gear",
        Badge: "Badge",
        GroupEmblem: "GroupEmblem",
        Animation: "Animation",
        Arms: "Arms",
        Legs: "Legs",
        Torso: "Torso",
        RightArm: "RightArm",
        LeftArm: "LeftArm",
        LeftLeg: "LeftLeg",
        RightLeg: "RightLeg",
        Package: "Package",
        YoutubeVideo: "YoutubeVideo",
        GamePass: "GamePass",
        App: "App",
        Code: "Code",
        Plugin: "Plugin",
        SolidModel: "SolidModel",
        MeshPart: "MeshPart",
        HairAccessory: "HairAccessory",
        FaceAccessory: "FaceAccessory",
        NeckAccessory: "NeckAccessory",
        ShoulderAccessory: "ShoulderAccessory",
        FrontAccessory: "FrontAccessory",
        BackAccessory: "BackAccessory",
        WaistAccessory: "WaistAccessory",
        ClimbAnimation: "ClimbAnimation",
        DeathAnimation: "DeathAnimation",
        FallAnimation: "FallAnimation",
        IdleAnimation: "IdleAnimation",
        JumpAnimation: "JumpAnimation",
        RunAnimation: "RunAnimation",
        SwimAnimation: "SwimAnimation",
        WalkAnimation: "WalkAnimation",
        PoseAnimation: "PoseAnimation",
        LocalizationTableManifest: "LocalizationTableManifest",
        LocalizationTableTranslation: "LocalizationTableTranslation",
        EmoteAnimation: "EmoteAnimation",
        Video: "Video",
        TexturePack: "TexturePack",
        TshirtAccessory: "TshirtAccessory",
        ShirtAccessory: "ShirtAccessory",
        PantsAccessory: "PantsAccessory",
        JacketAccessory: "JacketAccessory",
        SweaterAccessory: "SweaterAccessory",
        ShortsAccessory: "ShortsAccessory",
        LeftShoeAccessory: "LeftShoeAccessory",
        RightShoeAccessory: "RightShoeAccessory",
        DressSkirtAccessory: "DressSkirtAccessory",
        FontFamily: "FontFamily",
        FontFace: "FontFace",
        MeshHiddenSurfaceRemoval: "MeshHiddenSurfaceRemoval",
        EyebrowAccessory: "EyebrowAccessory",
        EyelashAccessory: "EyelashAccessory",
        MoodAnimation: "MoodAnimation",
        DynamicHead: "DynamicHead",
        CodeSnippet: "CodeSnippet",
        AdsVideo: "AdsVideo",
        OtaUpdate: "OtaUpdate",
        Screenshot: "Screenshot",
        RuntimePropertySet: "RuntimePropertySet",
        StorePreviewVideo: "StorePreviewVideo",
        GamePreviewVideo: "GamePreviewVideo",
        CreatorExperienceConfig: "CreatorExperienceConfig",
        FaceMakeup: "FaceMakeup",
        LipMakeup: "LipMakeup",
        EyeMakeup: "EyeMakeup"
    }, "MarketplacePublishingRequirementsApiApi", 0, l, "MarketplaceType", 0, {
        Invalid: "Invalid",
        Creator: "Creator"
    }, "RequirementCheck", 0, {
        Invalid: "Invalid",
        SellerOnboarding: "SellerOnboarding",
        Publishing: "Publishing",
        Pricing: "Pricing",
        Roles: "Roles",
        Sharing: "Sharing",
        OpenUse: "OpenUse",
        AssetConfig: "AssetConfig"
    }, "Restriction", 0, {
        Invalid: "Invalid",
        Authorization: "Authorization",
        Verification: "Verification",
        Quota: "Quota",
        AssetType: "AssetType",
        SafetyStatus: "SafetyStatus",
        KillSwitch: "KillSwitch",
        SellerAccountNotOnboarded: "SellerAccountNotOnboarded",
        SellerAccountRestricted: "SellerAccountRestricted",
        UnsupportedAssetOwner: "UnsupportedAssetOwner",
        Chargebacks: "Chargebacks",
        Moderation: "Moderation",
        ModerationHistory: "ModerationHistory",
        AssetModeration: "AssetModeration",
        AudioDuration: "AudioDuration",
        Packages: "Packages",
        CompositeAssetSubcomponentsRestricted: "CompositeAssetSubcomponentsRestricted",
        PricedAsset: "PricedAsset",
        RightsClaim: "RightsClaim",
        CompositeAssetSubcomponentsEligibilityPending: "CompositeAssetSubcomponentsEligibilityPending",
        UnsupportedSellerCountry: "UnsupportedSellerCountry",
        CompositeAssetLatestVersionUnverified: "CompositeAssetLatestVersionUnverified",
        CompositeAssetBrokenUnknownPermissions: "CompositeAssetBrokenUnknownPermissions",
        CompositeAssetBrokenDependenciesLimit: "CompositeAssetBrokenDependenciesLimit",
        CompositeAssetBrokenReferencedAssetNotFound: "CompositeAssetBrokenReferencedAssetNotFound",
        NotOriginalCreatorOfGroupAsset: "NotOriginalCreatorOfGroupAsset",
        CompositeAssetRevertedToUnevaluatedVersion: "CompositeAssetRevertedToUnevaluatedVersion",
        TwoStepVerification: "TwoStepVerification",
        AgeVerification: "AgeVerification",
        SocialLinkCreate: "SocialLinkCreate",
        SocialLinkView: "SocialLinkView"
    }, "Role", 0, {
        Invalid: "Invalid",
        Reseller: "Reseller"
    }])
}, 808377, e => {
    "use strict";
    var t = e.i(620140);
    e.s(["ThumbnailResponseState", () => t.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum])
}, 449934, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["BrokenImageOutlinedIcon", () => t.BrokenImageOutlined])
}, 591403, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["HourglassEmptyIcon", () => t.HourglassEmpty])
}]);

//# debugId=c4749507-6342-969f-b69d-707c4eed71f7
//# sourceMappingURL=0jz_rnh0p14cy.js.map