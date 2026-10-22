;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "d0400aed-a70f-79db-47e2-9f5fc132c341")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 261482, 858148, 966956, 719743, 477749, e => {
    "use strict";
    var t, s = e.i(157310),
        n = e.i(721281),
        r = e.i(677753),
        i = function(e, t) {
            return (i = Object.setPrototypeOf || ({
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
        i(e, t), e.prototype = null === t ? Object.create(t) : (s.prototype = t.prototype, new s)
    }

    function o(e, t, s, n) {
        return new(s || (s = Promise))(function(r, i) {
            function a(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function u(e, t) {
        var s, n, r, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
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
                var l = [o, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                    if (s = 1, n && (r = 2 & l[0] ? n.return : l[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, l[1])).done) return r;
                    switch (n = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                        case 0:
                        case 1:
                            r = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < r[1]) {
                                i.label = r[1], r = l;
                                break
                            }
                            if (r && i.label < r[2]) {
                                i.label = r[2], i.ops.push(l);
                                break
                            }
                            r[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    s = r = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function l(e) {
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

    function d(e) {
        var t, s;
        return null == (t = e) ? t : {
            virtualPurchasingProductId: (0, r.exists)(t, "virtualPurchasingProductId") ? t.virtualPurchasingProductId : void 0,
            virtualPurchasingProductType: (0, r.exists)(t, "virtualPurchasingProductType") ? t.virtualPurchasingProductType : void 0,
            virtualPurchasingProductTargetId: (0, r.exists)(t, "virtualPurchasingProductTargetId") ? t.virtualPurchasingProductTargetId : void 0,
            universalProductIdentifier: (0, r.exists)(t, "universalProductIdentifier") ? null == (s = t.universalProductIdentifier) ? s : {
                namespace: (0, r.exists)(s, "namespace") ? s.namespace : void 0,
                targetIdentifier: (0, r.exists)(s, "targetIdentifier") ? s.targetIdentifier : void 0
            } : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function c(e) {
        var t, s, n;
        return null == (t = e) ? t : {
            bonus: (0, r.exists)(t, "bonus") ? d(t.bonus) : void 0,
            gamePassPayload: (0, r.exists)(t, "gamePassPayload") ? null == (s = t.gamePassPayload) ? s : {
                rootPlaceId: (0, r.exists)(s, "rootPlaceId") ? s.rootPlaceId : void 0,
                gamePassDisplayName: (0, r.exists)(s, "gamePassDisplayName") ? s.gamePassDisplayName : void 0,
                experienceDisplayName: (0, r.exists)(s, "experienceDisplayName") ? s.experienceDisplayName : void 0,
                gamePassDisplayImageUrl: (0, r.exists)(s, "gamePassDisplayImageUrl") ? s.gamePassDisplayImageUrl : void 0,
                experienceImageUrl: (0, r.exists)(s, "experienceImageUrl") ? s.experienceImageUrl : void 0,
                experienceRatingText: (0, r.exists)(s, "experienceRatingText") ? s.experienceRatingText : void 0
            } : void 0,
            avatarItemPayload: (0, r.exists)(t, "avatarItemPayload") ? null == (n = t.avatarItemPayload) ? n : {
                assetId: (0, r.exists)(n, "assetId") ? n.assetId : void 0,
                displayName: (0, r.exists)(n, "displayName") ? n.displayName : void 0,
                thumbnailUrl: (0, r.exists)(n, "thumbnailUrl") ? n.thumbnailUrl : void 0,
                hasThumbnailUrl: (0, r.exists)(n, "hasThumbnailUrl") ? n.hasThumbnailUrl : void 0,
                creatorName: (0, r.exists)(n, "creatorName") ? n.creatorName : void 0,
                hasCreatorName: (0, r.exists)(n, "hasCreatorName") ? n.hasCreatorName : void 0,
                creatorIsVerified: (0, r.exists)(n, "creatorIsVerified") ? n.creatorIsVerified : void 0,
                hasCreatorIsVerified: (0, r.exists)(n, "hasCreatorIsVerified") ? n.hasCreatorIsVerified : void 0,
                backgroundImageUrl: (0, r.exists)(n, "backgroundImageUrl") ? n.backgroundImageUrl : void 0,
                hasBackgroundImageUrl: (0, r.exists)(n, "hasBackgroundImageUrl") ? n.hasBackgroundImageUrl : void 0,
                thumbnailAnimatedUrl: (0, r.exists)(n, "thumbnailAnimatedUrl") ? n.thumbnailAnimatedUrl : void 0,
                hasThumbnailAnimatedUrl: (0, r.exists)(n, "hasThumbnailAnimatedUrl") ? n.hasThumbnailAnimatedUrl : void 0
            } : void 0,
            offeringType: (0, r.exists)(t, "offeringType") ? t.offeringType : void 0,
            expirationTimestampMs: (0, r.exists)(t, "expirationTimestampMs") ? t.expirationTimestampMs : void 0
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
            key: (0, r.exists)(t, "key") ? null == (s = t.key) ? s : {
                productNamespace: (0, r.exists)(s, "productNamespace") ? s.productNamespace : void 0,
                productId: (0, r.exists)(s, "productId") ? s.productId : void 0,
                bonusPoliciesName: (0, r.exists)(s, "bonusPoliciesName") ? s.bonusPoliciesName : void 0,
                hasBonusPoliciesName: (0, r.exists)(s, "hasBonusPoliciesName") ? s.hasBonusPoliciesName : void 0
            } : void 0,
            displayableBonuses: (0, r.exists)(t, "displayableBonuses") ? null === t.displayableBonuses ? null : t.displayableBonuses.map(c) : void 0
        }
    }

    function m(e, t) {
        return null == e ? e : {
            selectedDisplayableBonuses: (0, r.exists)(e, "selectedDisplayableBonuses") ? null === e.selectedDisplayableBonuses ? null : e.selectedDisplayableBonuses.map(c) : void 0
        }
    }
    var h = r.BaseAPI;

    function f() {
        return null !== h && h.apply(this, arguments) || this
    }
    a(f, h), f.prototype.paymentsBonusModerationApplyBonusModerationDecisionRaw = function(e, t) {
        return o(this, void 0, void 0, function() {
            var s, n, i;
            return u(this, function(a) {
                switch (a.label) {
                    case 0:
                        return s = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                            path: "/v1/moderation-decision",
                            schemaPath: "/v1/moderation-decision",
                            method: "POST",
                            headers: n,
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
                                    annotations: void 0 === e.annotations ? void 0 : null === e.annotations ? null : e.annotations.map(l),
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
                        return i = a.sent(), [2, new r.JSONApiResponse(i)]
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
            var s, n, i;
            return u(this, function(a) {
                switch (a.label) {
                    case 0:
                        return s = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                            path: "/v1/fix-bonus-opt-in-status",
                            schemaPath: "/v1/fix-bonus-opt-in-status",
                            method: "POST",
                            headers: n,
                            query: s,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    gamePassId: e.gamePassId
                                }
                            }(e.paymentsBonusModerationFixBonusOptInStatusRequest)
                        }, t)];
                    case 1:
                        return i = a.sent(), [2, new r.JSONApiResponse(i)]
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
    var I = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(t, e), t.prototype.paymentsBonusServiceCreateOrUpdateBonusOptInStatusRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var s, n, i;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return s = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/opt-in-status",
                                    schemaPath: "/v1/opt-in-status",
                                    method: "POST",
                                    headers: n,
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
                                return i = a.sent(), [2, new r.JSONApiResponse(i)]
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
                    var s, n, i;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return s = {}, void 0 !== e.productType && (s.productType = e.productType), void 0 !== e.productTargetId && (s.productTargetId = e.productTargetId), n = {}, [4, this.request({
                                    path: "/v1/opt-in-status",
                                    schemaPath: "/v1/opt-in-status",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        isBonusOptedIn: (0, r.exists)(e, "isBonusOptedIn") ? e.isBonusOptedIn : void 0,
                                        isEligible: (0, r.exists)(e, "isEligible") ? e.isEligible : void 0,
                                        moderationStatus: (0, r.exists)(e, "moderationStatus") ? e.moderationStatus : void 0,
                                        isBonusOptInVisible: (0, r.exists)(e, "isBonusOptInVisible") ? e.isBonusOptInVisible : void 0
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
                    var s, n, i;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return s = {}, void 0 !== e.paymentSessionId && (s.paymentSessionId = e.paymentSessionId), n = {}, [4, this.request({
                                    path: "/v1/bonus-sessions",
                                    schemaPath: "/v1/bonus-sessions",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        selectedBonuses: (0, r.exists)(e, "selectedBonuses") ? null === e.selectedBonuses ? null : e.selectedBonuses.map(d) : void 0
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
                    var s, n, i;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return s = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/bonus-sessions",
                                    schemaPath: "/v1/bonus-sessions",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            paymentSessionId: e.paymentSessionId,
                                            productBonusKeys: void 0 === e.productBonusKeys ? void 0 : null === e.productBonusKeys ? null : e.productBonusKeys.map(p)
                                        }
                                    }(e.paymentsBonusServiceGetOrCreateBonusSessionRequest)
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        selectedDisplayableBonuses: (0, r.exists)(e, "selectedDisplayableBonuses") ? null === e.selectedDisplayableBonuses ? null : e.selectedDisplayableBonuses.map(c) : void 0,
                                        created: (0, r.exists)(e, "created") ? e.created : void 0,
                                        productDisplayableBonuses: (0, r.exists)(e, "productDisplayableBonuses") ? null === e.productDisplayableBonuses ? null : e.productDisplayableBonuses.map(v) : void 0
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
                    var s, n, i;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.checkoutSessionId || void 0 === e.checkoutSessionId) throw new r.RequiredError("checkoutSessionId", "Required parameter requestParameters.checkoutSessionId was null or undefined when calling paymentsBonusServiceGetPaymentBonusByCheckoutSessionId.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/checkout-session/{checkoutSessionId}/payment-bonus".replace("{".concat("checkoutSessionId", "}"), encodeURIComponent(String(e.checkoutSessionId))),
                                    schemaPath: "/v1/checkout-session/{checkoutSessionId}/payment-bonus",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new r.JSONApiResponse(i, function(e) {
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
                    var s, n, i;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.paymentSessionId || void 0 === e.paymentSessionId) throw new r.RequiredError("paymentSessionId", "Required parameter requestParameters.paymentSessionId was null or undefined when calling paymentsBonusServiceGetPaymentBonusByPaymentSessionId.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/payment-session/{paymentSessionId}/payment-bonus".replace("{".concat("paymentSessionId", "}"), encodeURIComponent(String(e.paymentSessionId))),
                                    schemaPath: "/v1/payment-session/{paymentSessionId}/payment-bonus",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new r.JSONApiResponse(i, function(e) {
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
                    var s, n, i;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return s = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/handle-game-join-event",
                                    schemaPath: "/v1/handle-game-join-event",
                                    method: "POST",
                                    headers: n,
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
                                return i = a.sent(), [2, new r.JSONApiResponse(i)]
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
        }(r.BaseAPI),
        g = e.i(272593),
        P = ((t = {})[t.Unspecified = 0] = "Unspecified", t[t.PendingReview = 1] = "PendingReview", t[t.Approved = 2] = "Approved", t[t.Rejected = 3] = "Rejected", t);
    let y = new class {
        getOptInStatus(e) {
            return this.bonusItemApi.paymentsBonusServiceGetBonusOptInInfo(e)
        }
        updateOptInStatus(e) {
            return this.bonusItemApi.paymentsBonusServiceCreateOrUpdateBonusOptInStatus(e)
        }
        constructor() {
            (0, n._)(this, "bonusItemApi", void 0), this.bonusItemApi = new I((0, g.createClientConfiguration)("payments-bonus-service", "bedev2"))
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
            universeId: n,
            gamePassId: r
        } = e, i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return (0, s.useQuery)({
            queryKey: b.bonusOptIn(n, r),
            queryFn: () => y.getOptInStatus({
                productTargetId: r,
                productType: 6
            }),
            staleTime: w,
            retry: 1,
            ...i,
            enabled: (null == (t = i.enabled) || t) && !!n && !!r
        })
    }], 261482);
    var A = e.i(589624);
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
}, 503725, 441494, e => {
    "use strict";
    var t = e.i(721281),
        s = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var s in t) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s])
            })(e, t)
        };

    function r(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function s() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (s.prototype = t.prototype, new s)
    }
    var i = function() {
        return (i = Object.assign || function(e) {
            for (var t, s = 1, n = arguments.length; s < n; s++)
                for (var r in t = arguments[s]) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
            return e
        }).apply(this, arguments)
    };

    function a(e, t, s, n) {
        return new(s || (s = Promise))(function(r, i) {
            function a(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var s, n, r, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
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
                var l = [o, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                    if (s = 1, n && (r = 2 & l[0] ? n.return : l[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, l[1])).done) return r;
                    switch (n = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                        case 0:
                        case 1:
                            r = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < r[1]) {
                                i.label = r[1], r = l;
                                break
                            }
                            if (r && i.label < r[2]) {
                                i.label = r[2], i.ops.push(l);
                                break
                            }
                            r[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    s = r = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function u(e) {
        return e
    }
    "function" == typeof SuppressedError && SuppressedError;

    function l(e, t) {
        return null == e ? e : {
            defaultPriceInRobux: e.defaultPriceInRobux,
            enabledFeatures: e.enabledFeatures.map(u)
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
            priceInformation: l(t.priceInformation),
            isImmutable: t.isImmutable,
            createdTimestamp: new Date(t.createdTimestamp),
            updatedTimestamp: new Date(t.updatedTimestamp),
            isArchived: null == t.isArchived ? void 0 : t.isArchived,
            isManagedPricingEnabled: t.isManagedPricingEnabled
        }
    }
    var c = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return r(t, e), t.prototype.developerProductsBatchGetDeveloperProductConfigsRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n;
                return o(this, function(r) {
                    var i;
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsBatchGetDeveloperProductConfigs().');
                    return t = {}, (n = {})["Content-Type"] = "application/json", [2, {
                        path: "/v2/universes/{universeId}/developer-products/creator:batchGet".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v2/universes/{universeId}/developer-products/creator:batchGet",
                        method: "POST",
                        headers: n,
                        query: t,
                        body: null == (i = e.batchGetDeveloperProductConfigsRequest) ? i : {
                            productIds: i.productIds
                        }
                    }]
                })
            })
        }, t.prototype.developerProductsBatchGetDeveloperProductConfigsRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsBatchGetDeveloperProductConfigsRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    developerProducts: e.developerProducts.map(d)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsBatchGetDeveloperProductConfigs = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(s) {
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
        }, t.prototype.developerProductsCreateDeveloperProductV2RequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n, r;
                return o(this, function(i) {
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsCreateDeveloperProductV2().');
                    if (null == e.name) throw new s.RequiredError("name", 'Required parameter "name" was null or undefined when calling developerProductsCreateDeveloperProductV2().');
                    return t = {}, n = {}, r = (0, s.canConsumeForm)([{
                        contentType: "multipart/form-data"
                    }]) ? new FormData : new URLSearchParams, null != e.name && r.append("name", e.name), null != e.description && r.append("description", e.description), null != e.isForSale && r.append("isForSale", e.isForSale), null != e.price && r.append("price", e.price), null != e.imageFile && r.append("imageFile", e.imageFile), null != e.isManagedPricingEnabled && r.append("isManagedPricingEnabled", e.isManagedPricingEnabled), [2, {
                        path: "/v2/universes/{universeId}/developer-products".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v2/universes/{universeId}/developer-products",
                        method: "POST",
                        headers: n,
                        query: t,
                        body: r
                    }]
                })
            })
        }, t.prototype.developerProductsCreateDeveloperProductV2Raw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsCreateDeveloperProductV2RequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return d(e)
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsCreateDeveloperProductV2 = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(s) {
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
        }, t.prototype.developerProductsGetDeveloperProductConfigV2RequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n;
                return o(this, function(r) {
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsGetDeveloperProductConfigV2().');
                    if (null == e.productId) throw new s.RequiredError("productId", 'Required parameter "productId" was null or undefined when calling developerProductsGetDeveloperProductConfigV2().');
                    return t = {}, n = {}, [2, {
                        path: "/v2/universes/{universeId}/developer-products/{productId}/creator".replace("{universeId}", encodeURIComponent(String(e.universeId))).replace("{productId}", encodeURIComponent(String(e.productId))),
                        schemaPath: "/v2/universes/{universeId}/developer-products/{productId}/creator",
                        method: "GET",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsGetDeveloperProductConfigV2Raw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsGetDeveloperProductConfigV2RequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return d(e)
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsGetDeveloperProductConfigV2 = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(s) {
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
        }, t.prototype.developerProductsListDeveloperProductConfigsByUniverseV2RequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n;
                return o(this, function(r) {
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsListDeveloperProductConfigsByUniverseV2().');
                    return t = {}, null != e.pageSize && (t.pageSize = e.pageSize), null != e.pageToken && (t.pageToken = e.pageToken), null != e.isForSale && (t.isForSale = e.isForSale), null != e.isArchived && (t.isArchived = e.isArchived), n = {}, [2, {
                        path: "/v2/universes/{universeId}/developer-products/creator".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v2/universes/{universeId}/developer-products/creator",
                        method: "GET",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsListDeveloperProductConfigsByUniverseV2Raw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsListDeveloperProductConfigsByUniverseV2RequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    developerProducts: e.developerProducts.map(d),
                                    nextPageToken: e.nextPageToken
                                }
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsListDeveloperProductConfigsByUniverseV2 = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(s) {
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
        }, t.prototype.developerProductsUpdateDeveloperProductV2RequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n, r;
                return o(this, function(i) {
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsUpdateDeveloperProductV2().');
                    if (null == e.productId) throw new s.RequiredError("productId", 'Required parameter "productId" was null or undefined when calling developerProductsUpdateDeveloperProductV2().');
                    return t = {}, n = {}, r = (0, s.canConsumeForm)([{
                        contentType: "multipart/form-data"
                    }]) ? new FormData : new URLSearchParams, null != e.name && r.append("name", e.name), null != e.description && r.append("description", e.description), null != e.isForSale && r.append("isForSale", e.isForSale), null != e.price && r.append("price", e.price), null != e.imageFile && r.append("imageFile", e.imageFile), null != e.isManagedPricingEnabled && r.append("isManagedPricingEnabled", e.isManagedPricingEnabled), null != e.isArchived && r.append("isArchived", e.isArchived), [2, {
                        path: "/v2/universes/{universeId}/developer-products/{productId}".replace("{universeId}", encodeURIComponent(String(e.universeId))).replace("{productId}", encodeURIComponent(String(e.productId))),
                        schemaPath: "/v2/universes/{universeId}/developer-products/{productId}",
                        method: "PATCH",
                        headers: n,
                        query: t,
                        body: r
                    }]
                })
            })
        }, t.prototype.developerProductsUpdateDeveloperProductV2Raw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsUpdateDeveloperProductV2RequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.VoidApiResponse(r)]
                    }
                })
            })
        }, t.prototype.developerProductsUpdateDeveloperProductV2 = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.developerProductsUpdateDeveloperProductV2Raw(e, t)];
                        case 1:
                            return s.sent(), [2]
                    }
                })
            })
        }, t
    }(s.BaseAPI);

    function p(e) {
        var t, s;
        return null == (t = e) ? t : {
            productId: t.productId,
            changedProperties: null == (s = t.changedProperties) ? s : {
                isManagedPricingEnabled: s.isManagedPricingEnabled,
                isArchived: s.isArchived
            }
        }
    }

    function v(e) {
        var t, s;
        return null == (t = e) ? t : {
            productId: t.productId,
            error: null == (s = t.error) ? s : {
                errorCode: null == s.errorCode ? void 0 : s.errorCode,
                errorMessage: null == s.errorMessage ? void 0 : s.errorMessage,
                field: void 0 === s.field ? void 0 : null === s.field ? null : s.field,
                hint: void 0 === s.hint ? void 0 : null === s.hint ? null : s.hint
            }
        }
    }

    function m(e) {
        var t;
        return null == (t = e) ? t : {
            type: null == t.Type ? void 0 : t.Type,
            amountInRobux: null == t.AmountInRobux ? void 0 : t.AmountInRobux,
            percent: null == t.Percent ? void 0 : t.Percent,
            endTime: void 0 === t.EndTime ? void 0 : null === t.EndTime ? null : new Date(t.EndTime)
        }
    }

    function h(e, t) {
        return null == e ? e : {
            id: null == e.Id ? void 0 : e.Id,
            name: void 0 === e.Name ? void 0 : null === e.Name ? null : e.Name,
            creatorType: void 0 === e.CreatorType ? void 0 : null === e.CreatorType ? null : e.CreatorType,
            creatorTargetId: null == e.CreatorTargetId ? void 0 : e.CreatorTargetId
        }
    }

    function f(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? i(i({}, b(e, !0)), {
            universeId: e.universeId,
            placeId: e.placeId,
            location: function(e) {
                if (null == e) return e;
                switch (e.locationType) {
                    case "developerPrompted":
                        return Object.assign({}, e, {
                            locationType: "developerPrompted"
                        });
                    case "personalizedShop":
                        return Object.assign({}, function e(t, s) {
                            return void 0 === s && (s = !1), null == t ? t : s ? i(i({}, function(t, s) {
                                if (void 0 === s && (s = !1), null == t) return t;
                                if (!s) switch (t.locationType) {
                                    case "developerPrompted":
                                    default:
                                        return t;
                                    case "personalizedShop":
                                        return e(t, s)
                                }
                                return {
                                    locationType: t.locationType
                                }
                            }(t, !0)), {
                                stableCategoryId: t.stableCategoryId,
                                categoryGroup: t.categoryGroup,
                                categoryPosition: t.categoryPosition,
                                gridPositionRow: t.gridPositionRow,
                                gridPositionColumn: t.gridPositionColumn,
                                categoryName: t.categoryName
                            }) : (t.locationType, t)
                        }(e, !1), {
                            locationType: "personalizedShop"
                        });
                    default:
                        return e
                }
            }(e.location)
        }) : (e.scopeType, e)
    }

    function I(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? i(i({}, g(e, !0)), {
            profileId: e.profileId,
            type: e.type
        }) : (e.pageType, e)
    }

    function g(e, t) {
        if (void 0 === t && (t = !1), null == e) return e;
        if (!t) switch (e.pageType) {
            case "experienceDetail":
                return P(e, t);
            case "marketplace":
            case "postPurchase":
            default:
                return e;
            case "profile":
                return I(e, t)
        }
        return {
            pageType: e.pageType
        }
    }

    function P(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? i(i({}, g(e, !0)), {
            universeId: e.universeId
        }) : (e.pageType, e)
    }

    function y(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? i(i({}, b(e, !0)), {
            page: function(e) {
                if (null == e) return e;
                switch (e.pageType) {
                    case "experienceDetail":
                        return Object.assign({}, P(e, !1), {
                            pageType: "experienceDetail"
                        });
                    case "marketplace":
                        return Object.assign({}, e, {
                            pageType: "marketplace"
                        });
                    case "postPurchase":
                        return Object.assign({}, e, {
                            pageType: "postPurchase"
                        });
                    case "profile":
                        return Object.assign({}, I(e, !1), {
                            pageType: "profile"
                        });
                    default:
                        return e
                }
            }(e.page)
        }) : (e.scopeType, e)
    }

    function b(e, t) {
        if (void 0 === t && (t = !1), null == e) return e;
        if (!t) switch (e.scopeType) {
            case "api":
            default:
                return e;
            case "inExperience":
                return f(e, t);
            case "lua":
                return w(e, t);
            case "web":
                return y(e, t)
        }
        return {
            scopeType: e.scopeType
        }
    }

    function w(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? i(i({}, b(e, !0)), {
            location: function(e) {
                if (null == e) return e;
                switch (e.locationType) {
                    case "homePageGameItemShop":
                        return Object.assign({}, e, {
                            locationType: "homePageGameItemShop"
                        });
                    case "searchPageGameItemShop":
                        return Object.assign({}, e, {
                            locationType: "searchPageGameItemShop"
                        });
                    default:
                        return e
                }
            }(e.location)
        }) : (e.scopeType, e)
    }

    function A(e) {
        var t;
        return null == (t = e) ? t : {
            source: t.source,
            discountId: t.discountId
        }
    }

    function R(e) {
        var t;
        return null == (t = e) ? t : {
            productId: void 0 === t.ProductId ? void 0 : null === t.ProductId ? null : t.ProductId,
            developerProductId: null == t.DeveloperProductId ? void 0 : t.DeveloperProductId,
            name: null == t.Name ? void 0 : t.Name,
            description: null == t.Description ? void 0 : t.Description,
            iconImageAssetId: void 0 === t.IconImageAssetId ? void 0 : null === t.IconImageAssetId ? null : t.IconImageAssetId,
            displayIcon: void 0 === t.displayIcon ? void 0 : null === t.displayIcon ? null : t.displayIcon,
            priceInRobux: void 0 === t.PriceInRobux ? void 0 : null === t.PriceInRobux ? null : t.PriceInRobux,
            isForSale: null == t.IsForSale ? void 0 : t.IsForSale,
            created: null == t.Created ? void 0 : new Date(t.Created),
            updated: null == t.Updated ? void 0 : new Date(t.Updated),
            isNew: null == t.IsNew ? void 0 : t.IsNew,
            universeId: null == t.UniverseId ? void 0 : t.UniverseId,
            productType: void 0 === t.ProductType ? void 0 : null === t.ProductType ? null : t.ProductType,
            creator: null == t.Creator ? void 0 : h(t.Creator),
            targetId: void 0 === t.TargetId ? void 0 : null === t.TargetId ? null : t.TargetId,
            displayIconImageAssetId: void 0 === t.DisplayIconImageAssetId ? void 0 : null === t.DisplayIconImageAssetId ? null : t.DisplayIconImageAssetId,
            displayName: void 0 === t.DisplayName ? void 0 : null === t.DisplayName ? null : t.DisplayName,
            displayDescription: void 0 === t.DisplayDescription ? void 0 : null === t.DisplayDescription ? null : t.DisplayDescription,
            isPublicDomain: void 0 === t.IsPublicDomain ? void 0 : null === t.IsPublicDomain ? null : t.IsPublicDomain,
            isLimited: void 0 === t.IsLimited ? void 0 : null === t.IsLimited ? null : t.IsLimited,
            minimumMembershipLevel: void 0 === t.MinimumMembershipLevel ? void 0 : null === t.MinimumMembershipLevel ? null : t.MinimumMembershipLevel,
            isLimitedUnique: void 0 === t.IsLimitedUnique ? void 0 : null === t.IsLimitedUnique ? null : t.IsLimitedUnique,
            assetId: void 0 === t.AssetId ? void 0 : null === t.AssetId ? null : t.AssetId,
            assetTypeId: void 0 === t.AssetTypeId ? void 0 : null === t.AssetTypeId ? null : t.AssetTypeId,
            userBasePriceInRobux: null == t.UserBasePriceInRobux ? void 0 : t.UserBasePriceInRobux,
            priceDiscountDetails: null == t.PriceDiscountDetails ? void 0 : t.PriceDiscountDetails.map(m)
        }
    }

    function S(e, t) {
        return null == e ? e : {
            developerProducts: e.developerProducts.map(R),
            nextPageCursor: e.nextPageCursor
        }
    }

    function T(e, t) {
        return null == e ? e : {
            purchased: void 0 === e.purchased ? void 0 : null === e.purchased ? null : e.purchased,
            transactionStatus: void 0 === e.transactionStatus ? void 0 : null === e.transactionStatus ? null : e.transactionStatus,
            productId: void 0 === e.productId ? void 0 : null === e.productId ? null : e.productId,
            price: void 0 === e.price ? void 0 : null === e.price ? null : e.price,
            receipt: null == e.receipt ? void 0 : e.receipt,
            receiptType: null == e.receiptType ? void 0 : e.receiptType,
            success: null == e.success ? void 0 : e.success
        }
    }
    var C = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return r(t, e), t.prototype.developerProductsApiBatchGetDeveloperProductsTempRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, s;
                return o(this, function(n) {
                    return t = {}, null != e.productIds && (t.productIds = e.productIds), s = {}, null != e.robloxUniverseId && (s["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/developer-products/batch",
                        schemaPath: "/v1/developer-products/batch",
                        method: "GET",
                        headers: s,
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsApiBatchGetDeveloperProductsTempRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiBatchGetDeveloperProductsTempRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return S(e)
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiBatchGetDeveloperProductsTemp = function() {
            return a(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.developerProductsApiBatchGetDeveloperProductsTempRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsApiBulkUpdateDeveloperProductsRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n;
                return o(this, function(r) {
                    var i;
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsApiBulkUpdateDeveloperProducts().');
                    return t = {}, (n = {})["Content-Type"] = "application/json", [2, {
                        path: "/v1/universes/{universeId}/developer-products".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/developer-products",
                        method: "PATCH",
                        headers: n,
                        query: t,
                        body: null == (i = e.bulkUpdateDeveloperProductsRequest) ? i : {
                            developerProductUpdates: i.developerProductUpdates.map(p)
                        }
                    }]
                })
            })
        }, t.prototype.developerProductsApiBulkUpdateDeveloperProductsRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiBulkUpdateDeveloperProductsRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    errors: e.errors.map(v)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiBulkUpdateDeveloperProducts = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(s) {
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
        }, t.prototype.developerProductsApiConsumePendingDeveloperProductPurchaseRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, s;
                return o(this, function(n) {
                    var r;
                    return t = {}, (s = {})["Content-Type"] = "application/json", [2, {
                        path: "/v1/developer-products/enforce-consume",
                        schemaPath: "/v1/developer-products/enforce-consume",
                        method: "POST",
                        headers: s,
                        query: t,
                        body: null == (r = e.virtualPurchaseV2CallBackModel) ? r : {
                            PurchaseToken: r.purchaseToken,
                            PurchaseStatusType: r.purchaseStatusType
                        }
                    }]
                })
            })
        }, t.prototype.developerProductsApiConsumePendingDeveloperProductPurchaseRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiConsumePendingDeveloperProductPurchaseRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return T(e)
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiConsumePendingDeveloperProductPurchase = function() {
            return a(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.developerProductsApiConsumePendingDeveloperProductPurchaseRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsApiGetDeveloperProductDetailsRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n;
                return o(this, function(r) {
                    if (null == e.productId) throw new s.RequiredError("productId", 'Required parameter "productId" was null or undefined when calling developerProductsApiGetDeveloperProductDetails().');
                    return t = {}, n = {}, null != e.robloxUniverseId && (n["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/developer-products/{productId}/details".replace("{productId}", encodeURIComponent(String(e.productId))),
                        schemaPath: "/v1/developer-products/{productId}/details",
                        method: "GET",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsApiGetDeveloperProductDetailsRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiGetDeveloperProductDetailsRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    displayName: null == e.DisplayName ? void 0 : e.DisplayName,
                                    displayDescription: null == e.DisplayDescription ? void 0 : e.DisplayDescription,
                                    displayIconImageAssetId: null == e.DisplayIconImageAssetId ? void 0 : e.DisplayIconImageAssetId,
                                    priceInformation: void 0 === e.PriceInformation ? void 0 : null === e.PriceInformation ? null : l(e.PriceInformation),
                                    storePageEnabled: void 0 === e.StorePageEnabled ? void 0 : null === e.StorePageEnabled ? null : e.StorePageEnabled,
                                    universeId: void 0 === e.UniverseId ? void 0 : null === e.UniverseId ? null : e.UniverseId,
                                    isImmutable: void 0 === e.IsImmutable ? void 0 : null === e.IsImmutable ? null : e.IsImmutable,
                                    userBasePriceInRobux: null == e.UserBasePriceInRobux ? void 0 : e.UserBasePriceInRobux,
                                    priceDiscountDetails: null == e.PriceDiscountDetails ? void 0 : e.PriceDiscountDetails.map(m),
                                    targetId: null == e.TargetId ? void 0 : e.TargetId,
                                    productType: void 0 === e.ProductType ? void 0 : null === e.ProductType ? null : e.ProductType,
                                    assetId: null == e.AssetId ? void 0 : e.AssetId,
                                    productId: null == e.ProductId ? void 0 : e.ProductId,
                                    name: void 0 === e.Name ? void 0 : null === e.Name ? null : e.Name,
                                    description: void 0 === e.Description ? void 0 : null === e.Description ? null : e.Description,
                                    assetTypeId: null == e.AssetTypeId ? void 0 : e.AssetTypeId,
                                    creator: null == e.Creator ? void 0 : h(e.Creator),
                                    iconImageAssetId: null == e.IconImageAssetId ? void 0 : e.IconImageAssetId,
                                    created: null == e.Created ? void 0 : new Date(e.Created),
                                    updated: null == e.Updated ? void 0 : new Date(e.Updated),
                                    priceInRobux: void 0 === e.PriceInRobux ? void 0 : null === e.PriceInRobux ? null : e.PriceInRobux,
                                    premiumPriceInRobux: void 0 === e.PremiumPriceInRobux ? void 0 : null === e.PremiumPriceInRobux ? null : e.PremiumPriceInRobux,
                                    priceInTickets: void 0 === e.PriceInTickets ? void 0 : null === e.PriceInTickets ? null : e.PriceInTickets,
                                    isNew: null == e.IsNew ? void 0 : e.IsNew,
                                    isForSale: null == e.IsForSale ? void 0 : e.IsForSale,
                                    isPublicDomain: null == e.IsPublicDomain ? void 0 : e.IsPublicDomain,
                                    isLimited: null == e.IsLimited ? void 0 : e.IsLimited,
                                    isLimitedUnique: null == e.IsLimitedUnique ? void 0 : e.IsLimitedUnique,
                                    remaining: void 0 === e.Remaining ? void 0 : null === e.Remaining ? null : e.Remaining,
                                    sales: void 0 === e.Sales ? void 0 : null === e.Sales ? null : e.Sales,
                                    minimumMembershipLevel: null == e.MinimumMembershipLevel ? void 0 : e.MinimumMembershipLevel
                                }
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiGetDeveloperProductDetails = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(s) {
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
        }, t.prototype.developerProductsApiGetGiftingTradingStatusRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n;
                return o(this, function(r) {
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsApiGetGiftingTradingStatus().');
                    return t = {}, n = {}, [2, {
                        path: "/v1/universes/{universeId}/gifting-trading".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/gifting-trading",
                        method: "GET",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsApiGetGiftingTradingStatusRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiGetGiftingTradingStatusRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    giftingTradingStatus: e.giftingTradingStatus
                                }
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiGetGiftingTradingStatus = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(s) {
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
        }, t.prototype.developerProductsApiGetUsersPriceLevelsRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n;
                return o(this, function(r) {
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsApiGetUsersPriceLevels().');
                    return t = {}, null != e.userIds && (t.userIds = e.userIds), n = {}, [2, {
                        path: "/v1/universes/{universeId}/price-levels".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/price-levels",
                        method: "GET",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsApiGetUsersPriceLevelsRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiGetUsersPriceLevelsRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    userPriceLevels: null == e.userPriceLevels ? void 0 : e.userPriceLevels
                                }
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiGetUsersPriceLevels = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.developerProductsApiGetUsersPriceLevelsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsApiListDeveloperProductsCursoredRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n;
                return o(this, function(r) {
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsApiListDeveloperProductsCursored().');
                    return t = {}, null != e.productIds && (t.productIds = e.productIds), null != e.cursor && (t.cursor = e.cursor), null != e.limit && (t.limit = e.limit), n = {}, null != e.robloxUniverseId && (n["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v2/universes/{universeId}/developerproducts".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v2/universes/{universeId}/developerproducts",
                        method: "GET",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsApiListDeveloperProductsCursoredRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiListDeveloperProductsCursoredRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return S(e)
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiListDeveloperProductsCursored = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(s) {
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
        }, t.prototype.developerProductsApiListGameTransactionsRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t;
                return o(this, function(s) {
                    return t = {}, null != e.playerId && (t.playerId = e.playerId), null != e.placeId && (t.placeId = e.placeId), null != e.status && (t.status = e.status), null != e.locationType && (t.locationType = e.locationType), [2, {
                        path: "/v1/game-transactions",
                        schemaPath: "/v1/game-transactions",
                        method: "GET",
                        headers: {},
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsApiListGameTransactionsRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiListGameTransactionsRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.VoidApiResponse(r)]
                    }
                })
            })
        }, t.prototype.developerProductsApiListGameTransactions = function() {
            return a(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.developerProductsApiListGameTransactionsRaw(e, t)];
                        case 1:
                            return s.sent(), [2]
                    }
                })
            })
        }, t.prototype.developerProductsApiPurchaseDeveloperProductRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n;
                return o(this, function(r) {
                    var i, a;
                    if (null == e.productId) throw new s.RequiredError("productId", 'Required parameter "productId" was null or undefined when calling developerProductsApiPurchaseDeveloperProduct().');
                    return t = {}, null != e.requestLocationType && (t.requestLocationType = e.requestLocationType), (n = {})["Content-Type"] = "application/json", null != e.robloxPlaceId && (n["roblox-Place-Id"] = String(e.robloxPlaceId)), null != e.robloxGameId && (n["roblox-Game-Id"] = String(e.robloxGameId)), [2, {
                        path: "/v1/developer-products/{productId}/purchase".replace("{productId}", encodeURIComponent(String(e.productId))),
                        schemaPath: "/v1/developer-products/{productId}/purchase",
                        method: "POST",
                        headers: n,
                        query: t,
                        body: null == (i = e.developerProductPurchaseRequest) ? i : {
                            expectedPrice: i.expectedPrice,
                            saleLocationType: i.saleLocationType,
                            saleLocationId: i.saleLocationId,
                            requestId: i.requestId,
                            idempotencyKey: i.idempotencyKey,
                            purchasePayload: null == (a = i.purchasePayload) ? a : {
                                surface: function(e) {
                                    if (null == e) return e;
                                    switch (e.scopeType) {
                                        case "api":
                                            return Object.assign({}, e, {
                                                scopeType: "api"
                                            });
                                        case "inExperience":
                                            return Object.assign({}, f(e, !1), {
                                                scopeType: "inExperience"
                                            });
                                        case "lua":
                                            return Object.assign({}, w(e, !1), {
                                                scopeType: "lua"
                                            });
                                        case "web":
                                            return Object.assign({}, y(e, !1), {
                                                scopeType: "web"
                                            });
                                        default:
                                            return e
                                    }
                                }(a.surface),
                                discounts: null == a.discounts ? void 0 : a.discounts.map(A)
                            }
                        }
                    }]
                })
            })
        }, t.prototype.developerProductsApiPurchaseDeveloperProductRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiPurchaseDeveloperProductRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return T(e)
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiPurchaseDeveloperProduct = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.developerProductsApiPurchaseDeveloperProductRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsApiSetGiftingTradingStatusRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n;
                return o(this, function(r) {
                    var i;
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsApiSetGiftingTradingStatus().');
                    return t = {}, (n = {})["Content-Type"] = "application/json", [2, {
                        path: "/v1/universes/{universeId}/gifting-trading".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/gifting-trading",
                        method: "POST",
                        headers: n,
                        query: t,
                        body: null == (i = e.setGiftingTradingStatusRequest) ? i : {
                            hasGiftingTrading: i.hasGiftingTrading
                        }
                    }]
                })
            })
        }, t.prototype.developerProductsApiSetGiftingTradingStatusRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, r;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiSetGiftingTradingStatusRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.VoidApiResponse(r)]
                    }
                })
            })
        }, t.prototype.developerProductsApiSetGiftingTradingStatus = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(s) {
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
    e.s(["DeveloperProductsApi", 0, c, "DeveloperProductsApiApi", 0, C, "ErrorCode", 0, {
        InvalidImageFile: "InvalidImageFile",
        ImageFileTooLarge: "ImageFileTooLarge",
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
        InvalidManagedPricing: "InvalidManagedPricing"
    }], 441494);
    var q = e.i(272593);
    let G = new class {
        listDeveloperProducts(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsApi.developerProductsApiListDeveloperProductsCursored(e, t)
        }
        getDeveloperProductDetails(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsApi.developerProductsApiGetDeveloperProductDetails({
                productId: e
            }, t)
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
                bulkUpdateDeveloperProductsRequest: e.body
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
                setGiftingTradingStatusRequest: {
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
                batchGetDeveloperProductConfigsRequest: {
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
            const e = (0, q.createClientConfiguration)("developer-products", "bedev2");
            this.developerProductsApi = new C(e), this.developerProductsV2Api = new c(e)
        }
    };
    e.s(["default", 0, G], 503725)
}, 851130, 866529, e => {
    "use strict";
    var t = e.i(721281),
        s = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var s in t) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s])
            })(e, t)
        },
        r = function() {
            return (r = Object.assign || function(e) {
                for (var t, s = 1, n = arguments.length; s < n; s++)
                    for (var r in t = arguments[s]) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
                return e
            }).apply(this, arguments)
        };

    function i(e, t, s, n) {
        return new(s || (s = Promise))(function(r, i) {
            function a(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var s, n, r, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
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
                var l = [o, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                    if (s = 1, n && (r = 2 & l[0] ? n.return : l[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, l[1])).done) return r;
                    switch (n = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                        case 0:
                        case 1:
                            r = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < r[1]) {
                                i.label = r[1], r = l;
                                break
                            }
                            if (r && i.label < r[2]) {
                                i.label = r[2], i.ops.push(l);
                                break
                            }
                            r[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    s = r = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function o(e) {
        return e
    }

    function u(e) {
        var t, s;
        return null == (t = e) ? t : {
            gamePassId: t.gamePassId,
            name: t.name,
            description: t.description,
            isForSale: t.isForSale,
            iconAssetId: t.iconAssetId,
            createdTimestamp: new Date(t.createdTimestamp),
            updatedTimestamp: new Date(t.updatedTimestamp),
            isArchived: null == t.isArchived ? void 0 : t.isArchived,
            priceInformation: null == (s = t.priceInformation) ? s : {
                defaultPriceInRobux: s.defaultPriceInRobux,
                enabledFeatures: s.enabledFeatures.map(o)
            },
            isManagedPricingEnabled: t.isManagedPricingEnabled,
            isTrialEnabled: null == t.isTrialEnabled ? void 0 : t.isTrialEnabled
        }
    }

    function l(e) {
        var t;
        return null == (t = e) ? t : {
            userId: t.userId,
            gamePassId: t.gamePassId
        }
    }

    function d(e) {
        var t;
        return null == (t = e) ? t : {
            userId: t.userId,
            gamePassId: t.gamePassId
        }
    }

    function c(e) {
        var t;
        return null == (t = e) ? t : {
            startTime: new Date(t.startTime),
            endTime: new Date(t.endTime)
        }
    }

    function p(e) {
        var t;
        return null == (t = e) ? t : {
            userId: t.userId,
            gamePassId: t.gamePassId,
            isOwned: t.isOwned,
            overrides: null == t.overrides ? void 0 : t.overrides.map(c)
        }
    }

    function v(e) {
        var t;
        return null == (t = e) ? t : {
            type: t.Type,
            amountInRobux: t.AmountInRobux,
            percent: t.Percent,
            endTime: t.EndTime
        }
    }

    function m(e) {
        var t, s;
        return null == (t = e) ? t : {
            id: t.id,
            productId: t.productId,
            name: t.name,
            isForSale: t.isForSale,
            price: void 0 === t.price ? void 0 : null === t.price ? null : t.price,
            userBasePriceInRobux: null == t.userBasePriceInRobux ? void 0 : t.userBasePriceInRobux,
            priceDiscountDetails: null == t.priceDiscountDetails ? void 0 : t.priceDiscountDetails.map(v),
            isOwned: null == t.isOwned ? void 0 : t.isOwned,
            creator: void 0 === t.creator ? void 0 : null === t.creator ? null : null == (s = t.creator) ? s : {
                creatorType: s.creatorType,
                creatorId: s.creatorId,
                name: s.name,
                deprecatedId: null == s.deprecatedId ? void 0 : s.deprecatedId
            },
            displayName: t.displayName,
            displayDescription: t.displayDescription,
            displayIconImageAssetId: t.displayIconImageAssetId,
            created: new Date(t.created),
            updated: new Date(t.updated)
        }
    }

    function h(e) {
        return e
    }

    function f(e) {
        var t, s;
        return null == (t = e) ? t : {
            gamePassId: t.gamePassId,
            changedPropertyNames: t.changedPropertyNames.map(h),
            changedProperties: null == (s = t.changedProperties) ? s : {
                ManagedPricing: s.managedPricing,
                Archived: s.archived,
                Trial: s.trial
            }
        }
    }

    function I(e) {
        var t, s;
        return null == (t = e) ? t : {
            gamePassId: t.gamePassId,
            error: null == (s = t.error) ? s : {
                errorCode: s.errorCode,
                errorMessage: s.errorMessage,
                field: void 0 === s.field ? void 0 : null === s.field ? null : s.field,
                hint: void 0 === s.hint ? void 0 : null === s.hint ? null : s.hint
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function g(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? r(r({}, A(e, !0)), {
            universeId: e.universeId,
            placeId: e.placeId,
            location: function(e) {
                if (null == e) return e;
                switch (e.locationType) {
                    case "developerPrompted":
                        return Object.assign({}, e, {
                            locationType: "developerPrompted"
                        });
                    case "personalizedShop":
                        return Object.assign({}, function e(t, s) {
                            return void 0 === s && (s = !1), null == t ? t : s ? r(r({}, function(t, s) {
                                if (void 0 === s && (s = !1), null == t) return t;
                                if (!s) switch (t.locationType) {
                                    case "developerPrompted":
                                    default:
                                        return t;
                                    case "personalizedShop":
                                        return e(t, s)
                                }
                                return {
                                    locationType: t.locationType
                                }
                            }(t, !0)), {
                                stableCategoryId: t.stableCategoryId,
                                categoryGroup: t.categoryGroup,
                                categoryPosition: t.categoryPosition,
                                gridPositionRow: t.gridPositionRow,
                                gridPositionColumn: t.gridPositionColumn,
                                categoryName: t.categoryName
                            }) : (t.locationType, t)
                        }(e, !1), {
                            locationType: "personalizedShop"
                        });
                    default:
                        return e
                }
            }(e.location)
        }) : (e.scopeType, e)
    }

    function P(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? r(r({}, y(e, !0)), {
            profileId: e.profileId,
            type: e.type
        }) : (e.pageType, e)
    }

    function y(e, t) {
        if (void 0 === t && (t = !1), null == e) return e;
        if (!t) switch (e.pageType) {
            case "experienceDetail":
                return b(e, t);
            case "marketplace":
            case "postPurchase":
            default:
                return e;
            case "profile":
                return P(e, t)
        }
        return {
            pageType: e.pageType
        }
    }

    function b(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? r(r({}, y(e, !0)), {
            universeId: e.universeId
        }) : (e.pageType, e)
    }

    function w(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? r(r({}, A(e, !0)), {
            page: function(e) {
                if (null == e) return e;
                switch (e.pageType) {
                    case "experienceDetail":
                        return Object.assign({}, b(e, !1), {
                            pageType: "experienceDetail"
                        });
                    case "marketplace":
                        return Object.assign({}, e, {
                            pageType: "marketplace"
                        });
                    case "postPurchase":
                        return Object.assign({}, e, {
                            pageType: "postPurchase"
                        });
                    case "profile":
                        return Object.assign({}, P(e, !1), {
                            pageType: "profile"
                        });
                    default:
                        return e
                }
            }(e.page)
        }) : (e.scopeType, e)
    }

    function A(e, t) {
        if (void 0 === t && (t = !1), null == e) return e;
        if (!t) switch (e.scopeType) {
            case "api":
            default:
                return e;
            case "inExperience":
                return g(e, t);
            case "lua":
                return R(e, t);
            case "web":
                return w(e, t)
        }
        return {
            scopeType: e.scopeType
        }
    }

    function R(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? r(r({}, A(e, !0)), {
            location: function(e) {
                if (null == e) return e;
                switch (e.locationType) {
                    case "homePageGameItemShop":
                        return Object.assign({}, e, {
                            locationType: "homePageGameItemShop"
                        });
                    case "searchPageGameItemShop":
                        return Object.assign({}, e, {
                            locationType: "searchPageGameItemShop"
                        });
                    default:
                        return e
                }
            }(e.location)
        }) : (e.scopeType, e)
    }

    function S(e) {
        var t;
        return null == (t = e) ? t : {
            source: t.source,
            discountId: t.discountId
        }
    }

    function T(e) {
        var t;
        return null == (t = e) ? t : {
            gamePassId: t.gamePassId,
            status: t.status,
            startTime: null == t.startTime ? void 0 : new Date(t.startTime),
            endTime: null == t.endTime ? void 0 : new Date(t.endTime)
        }
    }

    function C(e) {
        var t, s;
        return null == (t = e) ? t : {
            gamePassId: t.gamePassId,
            iconAssetId: t.iconAssetId,
            name: t.name,
            description: t.description,
            isForSale: t.isForSale,
            price: t.price,
            creator: null == (s = t.creator) ? s : {
                creatorType: s.creatorType,
                creatorId: s.creatorId,
                name: s.name
            }
        }
    }
    var q = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function s() {
                this.constructor = e
            }
            n(e, t), e.prototype = null === t ? Object.create(t) : (s.prototype = t.prototype, new s)
        }(t, e), t.prototype.gamePassesBatchGetGamePassConfigsRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    var i;
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesBatchGetGamePassConfigs().');
                    return t = {}, (n = {})["Content-Type"] = "application/json", [2, {
                        path: "/v1/universes/{universeId}/game-passes/creator:batchGet".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/game-passes/creator:batchGet",
                        method: "POST",
                        headers: n,
                        query: t,
                        body: null == (i = e.batchGetGamePassConfigsRequest) ? i : {
                            gamePassIds: i.gamePassIds
                        }
                    }]
                })
            })
        }, t.prototype.gamePassesBatchGetGamePassConfigsRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesBatchGetGamePassConfigsRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    gamePasses: e.gamePasses.map(u)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesBatchGetGamePassConfigs = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(s) {
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
        }, t.prototype.gamePassesBatchGetGamePassOwnershipsRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, s;
                return a(this, function(n) {
                    var r;
                    return t = {}, (s = {})["Content-Type"] = "application/json", null != e.robloxUniverseId && (s["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/game-passes:batchGetOwnership",
                        schemaPath: "/v1/game-passes:batchGetOwnership",
                        method: "POST",
                        headers: s,
                        query: t,
                        body: null == (r = e.batchGetGamePassOwnershipsRequest) ? r : {
                            ownershipIdentifiers: r.ownershipIdentifiers.map(d),
                            includeOverrides: r.includeOverrides
                        }
                    }]
                })
            })
        }, t.prototype.gamePassesBatchGetGamePassOwnershipsRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesBatchGetGamePassOwnershipsRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    ownershipIdentifiers: e.ownershipIdentifiers.map(l),
                                    ownerships: null == e.ownerships ? void 0 : e.ownerships.map(p)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesBatchGetGamePassOwnerships = function() {
            return i(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesBatchGetGamePassOwnershipsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesBatchGetGamePassesRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, s;
                return a(this, function(n) {
                    var r;
                    return t = {}, (s = {})["Content-Type"] = "application/json", null != e.robloxUniverseId && (s["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/game-passes:batchGet",
                        schemaPath: "/v1/game-passes:batchGet",
                        method: "POST",
                        headers: s,
                        query: t,
                        body: null == (r = e.batchGetGamePassesRequest) ? r : {
                            gamePassIds: r.gamePassIds,
                            passView: r.passView
                        }
                    }]
                })
            })
        }, t.prototype.gamePassesBatchGetGamePassesRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesBatchGetGamePassesRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    gamePasses: e.gamePasses.map(m)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesBatchGetGamePasses = function() {
            return i(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesBatchGetGamePassesRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesBulkUpdateRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    var i;
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesBulkUpdate().');
                    return t = {}, (n = {})["Content-Type"] = "application/json", [2, {
                        path: "/v1/game-passes/universes/{universeId}/bulk-update".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/game-passes/universes/{universeId}/bulk-update",
                        method: "POST",
                        headers: n,
                        query: t,
                        body: null == (i = e.gamePassBulkUpdateRequest) ? i : {
                            gamePassUpdates: i.gamePassUpdates.map(f)
                        }
                    }]
                })
            })
        }, t.prototype.gamePassesBulkUpdateRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesBulkUpdateRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    errors: e.errors.map(I)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesBulkUpdate = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(s) {
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
        }, t.prototype.gamePassesCreateGamePassRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n, r;
                return a(this, function(i) {
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesCreateGamePass().');
                    if (null == e.name) throw new s.RequiredError("name", 'Required parameter "name" was null or undefined when calling gamePassesCreateGamePass().');
                    return t = {}, n = {}, r = (0, s.canConsumeForm)([{
                        contentType: "multipart/form-data"
                    }]) ? new FormData : new URLSearchParams, null != e.name && r.append("name", e.name), null != e.description && r.append("description", e.description), null != e.imageFile && r.append("imageFile", e.imageFile), null != e.isForSale && r.append("isForSale", e.isForSale), null != e.price && r.append("price", e.price), null != e.isManagedPricingEnabled && r.append("isManagedPricingEnabled", e.isManagedPricingEnabled), null != e.isTrialEnabled && r.append("isTrialEnabled", e.isTrialEnabled), [2, {
                        path: "/v1/universes/{universeId}/game-passes".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/game-passes",
                        method: "POST",
                        headers: n,
                        query: t,
                        body: r
                    }]
                })
            })
        }, t.prototype.gamePassesCreateGamePassRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesCreateGamePassRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return u(e)
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesCreateGamePass = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(s) {
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
        }, t.prototype.gamePassesGetGamePassConfigRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesGetGamePassConfig().');
                    if (null == e.gamePassId) throw new s.RequiredError("gamePassId", 'Required parameter "gamePassId" was null or undefined when calling gamePassesGetGamePassConfig().');
                    return t = {}, n = {}, [2, {
                        path: "/v1/universes/{universeId}/game-passes/{gamePassId}/creator".replace("{universeId}", encodeURIComponent(String(e.universeId))).replace("{gamePassId}", encodeURIComponent(String(e.gamePassId))),
                        schemaPath: "/v1/universes/{universeId}/game-passes/{gamePassId}/creator",
                        method: "GET",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesGetGamePassConfigRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesGetGamePassConfigRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return u(e)
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetGamePassConfig = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(s) {
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
        }, t.prototype.gamePassesGetGamePassMetadataRequestOpts = function() {
            return i(this, void 0, void 0, function() {
                return a(this, function(e) {
                    return [2, {
                        path: "/v1/metadata",
                        schemaPath: "/v1/metadata",
                        method: "GET",
                        headers: {},
                        query: {}
                    }]
                })
            })
        }, t.prototype.gamePassesGetGamePassMetadataRaw = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.gamePassesGetGamePassMetadataRequestOpts()];
                        case 1:
                            return t = r.sent(), [4, this.request(t, e)];
                        case 2:
                            return n = r.sent(), [2, new s.JSONApiResponse(n, function(e) {
                                return null == e ? e : {
                                    gamePassMaxNameLength: e.gamePassMaxNameLength,
                                    gamePassMaxDescriptionLength: e.gamePassMaxDescriptionLength,
                                    gamePassMinPrice: e.gamePassMinPrice,
                                    gamePassMaxPrice: e.gamePassMaxPrice,
                                    gamePassPixelImageSize: e.GamePassPixelImageSize,
                                    gamePassDefaultIconAssetId: e.gamePassDefaultIconAssetId
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetGamePassMetadata = function(e) {
            return i(this, void 0, void 0, function() {
                return a(this, function(t) {
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
        }, t.prototype.gamePassesGetPassProductInfoRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    if (null == e.gamePassId) throw new s.RequiredError("gamePassId", 'Required parameter "gamePassId" was null or undefined when calling gamePassesGetPassProductInfo().');
                    return t = {}, n = {}, null != e.robloxUniverseId && (n["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/game-passes/{gamePassId}/product-info".replace("{gamePassId}", encodeURIComponent(String(e.gamePassId))),
                        schemaPath: "/v1/game-passes/{gamePassId}/product-info",
                        method: "GET",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesGetPassProductInfoRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesGetPassProductInfoRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                var t;
                                return null == e ? e : {
                                    targetId: null == e.TargetId ? void 0 : e.TargetId,
                                    productType: null == e.ProductType ? void 0 : e.ProductType,
                                    assetId: null == e.AssetId ? void 0 : e.AssetId,
                                    productId: null == e.ProductId ? void 0 : e.ProductId,
                                    name: null == e.Name ? void 0 : e.Name,
                                    description: null == e.Description ? void 0 : e.Description,
                                    assetTypeId: null == e.AssetTypeId ? void 0 : e.AssetTypeId,
                                    creator: void 0 === e.Creator ? void 0 : null === e.Creator ? null : null == (t = e.Creator) ? t : {
                                        id: null == t.Id ? void 0 : t.Id,
                                        name: null == t.Name ? void 0 : t.Name,
                                        creatorType: null == t.CreatorType ? void 0 : t.CreatorType,
                                        creatorTargetId: null == t.CreatorTargetId ? void 0 : t.CreatorTargetId
                                    },
                                    iconImageAssetId: null == e.IconImageAssetId ? void 0 : e.IconImageAssetId,
                                    created: null == e.Created ? void 0 : new Date(e.Created),
                                    updated: null == e.Updated ? void 0 : new Date(e.Updated),
                                    priceInRobux: void 0 === e.PriceInRobux ? void 0 : null === e.PriceInRobux ? null : e.PriceInRobux,
                                    premiumPriceInRobux: void 0 === e.PremiumPriceInRobux ? void 0 : null === e.PremiumPriceInRobux ? null : e.PremiumPriceInRobux,
                                    priceInTickets: void 0 === e.PriceInTickets ? void 0 : null === e.PriceInTickets ? null : e.PriceInTickets,
                                    sales: null == e.Sales ? void 0 : e.Sales,
                                    isNew: null == e.IsNew ? void 0 : e.IsNew,
                                    isForSale: null == e.IsForSale ? void 0 : e.IsForSale,
                                    isPublicDomain: null == e.IsPublicDomain ? void 0 : e.IsPublicDomain,
                                    isLimited: null == e.IsLimited ? void 0 : e.IsLimited,
                                    isLimitedUnique: null == e.IsLimitedUnique ? void 0 : e.IsLimitedUnique,
                                    remaining: void 0 === e.Remaining ? void 0 : null === e.Remaining ? null : e.Remaining,
                                    minimumMembershipLevel: null == e.MinimumMembershipLevel ? void 0 : e.MinimumMembershipLevel,
                                    userBasePriceInRobux: null == e.UserBasePriceInRobux ? void 0 : e.UserBasePriceInRobux,
                                    priceDiscountDetails: null == e.PriceDiscountDetails ? void 0 : e.PriceDiscountDetails.map(v)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetPassProductInfo = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(s) {
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
        }, t.prototype.gamePassesGetSalesLimitInfoRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    if (null == e.universeid) throw new s.RequiredError("universeid", 'Required parameter "universeid" was null or undefined when calling gamePassesGetSalesLimitInfo().');
                    return t = {}, n = {}, [2, {
                        path: "/v1/game-passes/universes/{universeid}/sales-limit".replace("{universeid}", encodeURIComponent(String(e.universeid))),
                        schemaPath: "/v1/game-passes/universes/{universeid}/sales-limit",
                        method: "GET",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesGetSalesLimitInfoRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesGetSalesLimitInfoRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    salesLimit: e.salesLimit,
                                    hasLimitBeenReached: e.hasLimitBeenReached
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetSalesLimitInfo = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(s) {
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
        }, t.prototype.gamePassesGetTrialAvailabilitiesRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesGetTrialAvailabilities().');
                    return t = {}, n = {}, [2, {
                        path: "/v1/universes/{universeId}/trial-availabilities".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/trial-availabilities",
                        method: "GET",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesGetTrialAvailabilitiesRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesGetTrialAvailabilitiesRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    trialAvailabilities: e.trialAvailabilities.map(T)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetTrialAvailabilities = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesGetTrialAvailabilitiesRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesGetUserGamePassesRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    if (null == e.userId) throw new s.RequiredError("userId", 'Required parameter "userId" was null or undefined when calling gamePassesGetUserGamePasses().');
                    return t = {}, null != e.exclusiveStartId && (t.exclusiveStartId = e.exclusiveStartId), null != e.count && (t.count = e.count), n = {}, [2, {
                        path: "/v1/users/{userId}/game-passes".replace("{userId}", encodeURIComponent(String(e.userId))),
                        schemaPath: "/v1/users/{userId}/game-passes",
                        method: "GET",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesGetUserGamePassesRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesGetUserGamePassesRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    gamePasses: e.gamePasses.map(C)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetUserGamePasses = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(s) {
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
        }, t.prototype.gamePassesListGamePassConfigsByUniverseRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesListGamePassConfigsByUniverse().');
                    return t = {}, null != e.pageSize && (t.pageSize = e.pageSize), null != e.pageToken && (t.pageToken = e.pageToken), null != e.isForSale && (t.isForSale = e.isForSale), null != e.isArchived && (t.isArchived = e.isArchived), n = {}, [2, {
                        path: "/v1/universes/{universeId}/game-passes/creator".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/game-passes/creator",
                        method: "GET",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesListGamePassConfigsByUniverseRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesListGamePassConfigsByUniverseRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    gamePasses: e.gamePasses.map(u),
                                    nextPageToken: e.nextPageToken
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesListGamePassConfigsByUniverse = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(s) {
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
        }, t.prototype.gamePassesListGamePassesByUniverseRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesListGamePassesByUniverse().');
                    return t = {}, null != e.pageSize && (t.pageSize = e.pageSize), null != e.pageToken && (t.pageToken = e.pageToken), null != e.passView && (t.passView = e.passView), n = {}, null != e.robloxUniverseId && (n["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/universes/{universeId}/game-passes".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/game-passes",
                        method: "GET",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesListGamePassesByUniverseRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesListGamePassesByUniverseRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    gamePasses: e.gamePasses.map(m),
                                    nextPageToken: e.nextPageToken
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesListGamePassesByUniverse = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(s) {
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
        }, t.prototype.gamePassesPurchaseGamePassRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    var i, a;
                    if (null == e.productId) throw new s.RequiredError("productId", 'Required parameter "productId" was null or undefined when calling gamePassesPurchaseGamePass().');
                    return t = {}, (n = {})["Content-Type"] = "application/json", null != e.robloxPlaceId && (n["roblox-Place-Id"] = String(e.robloxPlaceId)), null != e.robloxGameId && (n["roblox-Game-Id"] = String(e.robloxGameId)), null != e.robloxUniverseId && (n["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/game-passes/{productId}/purchase".replace("{productId}", encodeURIComponent(String(e.productId))),
                        schemaPath: "/v1/game-passes/{productId}/purchase",
                        method: "POST",
                        headers: n,
                        query: t,
                        body: null == (i = e.gamePassPurchaseRequest) ? i : {
                            expectedPrice: i.expectedPrice,
                            purchasePayload: null == (a = i.purchasePayload) ? a : {
                                surface: function(e) {
                                    if (null == e) return e;
                                    switch (e.scopeType) {
                                        case "api":
                                            return Object.assign({}, e, {
                                                scopeType: "api"
                                            });
                                        case "inExperience":
                                            return Object.assign({}, g(e, !1), {
                                                scopeType: "inExperience"
                                            });
                                        case "lua":
                                            return Object.assign({}, R(e, !1), {
                                                scopeType: "lua"
                                            });
                                        case "web":
                                            return Object.assign({}, w(e, !1), {
                                                scopeType: "web"
                                            });
                                        default:
                                            return e
                                    }
                                }(a.surface),
                                discounts: null == a.discounts ? void 0 : a.discounts.map(S)
                            },
                            idempotencyKey: i.idempotencyKey
                        }
                    }]
                })
            })
        }, t.prototype.gamePassesPurchaseGamePassRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesPurchaseGamePassRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    reason: void 0 === e.reason ? void 0 : null === e.reason ? null : e.reason,
                                    productId: void 0 === e.productId ? void 0 : null === e.productId ? null : e.productId,
                                    statusCode: void 0 === e.statusCode ? void 0 : null === e.statusCode ? null : e.statusCode,
                                    title: void 0 === e.title ? void 0 : null === e.title ? null : e.title,
                                    errorMsg: void 0 === e.errorMsg ? void 0 : null === e.errorMsg ? null : e.errorMsg,
                                    showDivId: void 0 === e.showDivId ? void 0 : null === e.showDivId ? null : e.showDivId,
                                    shortfallPrice: void 0 === e.shortfallPrice ? void 0 : null === e.shortfallPrice ? null : e.shortfallPrice,
                                    balanceAfterSale: void 0 === e.balanceAfterSale ? void 0 : null === e.balanceAfterSale ? null : e.balanceAfterSale,
                                    expectedPrice: void 0 === e.expectedPrice ? void 0 : null === e.expectedPrice ? null : e.expectedPrice,
                                    currency: void 0 === e.currency ? void 0 : null === e.currency ? null : e.currency,
                                    price: void 0 === e.price ? void 0 : null === e.price ? null : e.price,
                                    assetId: void 0 === e.assetId ? void 0 : null === e.assetId ? null : e.assetId,
                                    assetName: void 0 === e.assetName ? void 0 : null === e.assetName ? null : e.assetName,
                                    assetType: void 0 === e.assetType ? void 0 : null === e.assetType ? null : e.assetType,
                                    assetTypeDisplayName: void 0 === e.assetTypeDisplayName ? void 0 : null === e.assetTypeDisplayName ? null : e.assetTypeDisplayName,
                                    assetIsWearable: void 0 === e.assetIsWearable ? void 0 : null === e.assetIsWearable ? null : e.assetIsWearable,
                                    sellerName: void 0 === e.sellerName ? void 0 : null === e.sellerName ? null : e.sellerName,
                                    transactionVerb: void 0 === e.transactionVerb ? void 0 : null === e.transactionVerb ? null : e.transactionVerb,
                                    isMultiPrivateSale: void 0 === e.isMultiPrivateSale ? void 0 : null === e.isMultiPrivateSale ? null : e.isMultiPrivateSale,
                                    purchased: void 0 === e.purchased ? void 0 : null === e.purchased ? null : e.purchased
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesPurchaseGamePass = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(s) {
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
        }, t.prototype.gamePassesRedeemTrialRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    var i;
                    if (null == e.gamePassId) throw new s.RequiredError("gamePassId", 'Required parameter "gamePassId" was null or undefined when calling gamePassesRedeemTrial().');
                    return t = {}, (n = {})["Content-Type"] = "application/json", null != e.robloxUniverseId && (n["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/game-passes/{gamePassId}/trial:redeem".replace("{gamePassId}", encodeURIComponent(String(e.gamePassId))),
                        schemaPath: "/v1/game-passes/{gamePassId}/trial:redeem",
                        method: "POST",
                        headers: n,
                        query: t,
                        body: null == (i = e.redeemTrialRequest) ? i : {
                            surface: function(e) {
                                if (null == e) return e;
                                switch (e.scopeType) {
                                    case "api":
                                        return Object.assign({}, e, {
                                            scopeType: "api"
                                        });
                                    case "inExperience":
                                        return Object.assign({}, g(e, !1), {
                                            scopeType: "inExperience"
                                        });
                                    case "lua":
                                        return Object.assign({}, R(e, !1), {
                                            scopeType: "lua"
                                        });
                                    case "web":
                                        return Object.assign({}, w(e, !1), {
                                            scopeType: "web"
                                        });
                                    default:
                                        return e
                                }
                            }(i.surface)
                        }
                    }]
                })
            })
        }, t.prototype.gamePassesRedeemTrialRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesRedeemTrialRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    gamePassId: e.gamePassId,
                                    startTime: new Date(e.startTime),
                                    endTime: new Date(e.endTime)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesRedeemTrial = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesRedeemTrialRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesRevokeGamePassRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    if (null == e.gamePassId) throw new s.RequiredError("gamePassId", 'Required parameter "gamePassId" was null or undefined when calling gamePassesRevokeGamePass().');
                    return t = {}, n = {}, [2, {
                        path: "/v1/game-passes/{gamePassId}:revokeOwnership".replace("{gamePassId}", encodeURIComponent(String(e.gamePassId))),
                        schemaPath: "/v1/game-passes/{gamePassId}:revokeOwnership",
                        method: "POST",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesRevokeGamePassRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesRevokeGamePassRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.VoidApiResponse(r)]
                    }
                })
            })
        }, t.prototype.gamePassesRevokeGamePass = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesRevokeGamePassRaw(e, t)];
                        case 1:
                            return s.sent(), [2]
                    }
                })
            })
        }, t.prototype.gamePassesUpdateGamePassRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n, r;
                return a(this, function(i) {
                    if (null == e.universeId) throw new s.RequiredError("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesUpdateGamePass().');
                    if (null == e.gamePassId) throw new s.RequiredError("gamePassId", 'Required parameter "gamePassId" was null or undefined when calling gamePassesUpdateGamePass().');
                    return t = {}, n = {}, r = (0, s.canConsumeForm)([{
                        contentType: "multipart/form-data"
                    }]) ? new FormData : new URLSearchParams, null != e.name && r.append("name", e.name), null != e.description && r.append("description", e.description), null != e.file && r.append("file", e.file), null != e.imageFile && r.append("imageFile", e.imageFile), null != e.isForSale && r.append("isForSale", e.isForSale), null != e.price && r.append("price", e.price), null != e.isManagedPricingEnabled && r.append("isManagedPricingEnabled", e.isManagedPricingEnabled), null != e.isArchived && r.append("isArchived", e.isArchived), null != e.isTrialEnabled && r.append("isTrialEnabled", e.isTrialEnabled), [2, {
                        path: "/v1/universes/{universeId}/game-passes/{gamePassId}".replace("{universeId}", encodeURIComponent(String(e.universeId))).replace("{gamePassId}", encodeURIComponent(String(e.gamePassId))),
                        schemaPath: "/v1/universes/{universeId}/game-passes/{gamePassId}",
                        method: "PATCH",
                        headers: n,
                        query: t,
                        body: r
                    }]
                })
            })
        }, t.prototype.gamePassesUpdateGamePassRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, r;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesUpdateGamePassRequestOpts(e)];
                        case 1:
                            return n = i.sent(), [4, this.request(n, t)];
                        case 2:
                            return r = i.sent(), [2, new s.VoidApiResponse(r)]
                    }
                })
            })
        }, t.prototype.gamePassesUpdateGamePass = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(s) {
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
        InvalidManagedPricing: "InvalidManagedPricing",
        UnsupportedGamePassUpdate: "UnsupportedGamePassUpdate"
    }, "GamePassesApi", 0, q], 866529);
    var G = e.i(272593);
    let D = new class {
        getPassSalesLimitInfo(e, t) {
            return this.passesApi.gamePassesGetSalesLimitInfo(e, t)
        }
        getPassMetadata(e) {
            return this.passesApi.gamePassesGetGamePassMetadata(e)
        }
        getPassProductInfo(e, t) {
            return this.passesApi.gamePassesGetPassProductInfo({
                gamePassId: e
            }, t)
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
                batchGetGamePassConfigsRequest: {
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
            (0, t._)(this, "passesApi", void 0), this.passesApi = new q((0, G.createClientConfiguration)("game-passes", "bedev2"))
        }
    };
    e.s(["default", 0, D], 851130)
}, 239320, e => {
    "use strict";
    var t, s = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var s in t) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s])
            })(e, t)
        };

    function r(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function s() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (s.prototype = t.prototype, new s)
    }

    function i(e, t, s, n) {
        return new(s || (s = Promise))(function(r, i) {
            function a(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var s, n, r, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
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
                var l = [o, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                    if (s = 1, n && (r = 2 & l[0] ? n.return : l[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, l[1])).done) return r;
                    switch (n = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                        case 0:
                        case 1:
                            r = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < r[1]) {
                                i.label = r[1], r = l;
                                break
                            }
                            if (r && i.label < r[2]) {
                                i.label = r[2], i.ops.push(l);
                                break
                            }
                            r[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    s = r = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
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

    function l(e, t) {
        return null == e ? e : {
            data: (0, s.exists)(e, "data") ? e.data : void 0
        }
    }
    var d = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(t, e), t.prototype.v1AssetQuotasGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, r, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.resourceType || void 0 === e.resourceType) throw new s.RequiredError("resourceType", "Required parameter requestParameters.resourceType was null or undefined when calling v1AssetQuotasGet.");
                                if (null === e.assetType || void 0 === e.assetType) throw new s.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling v1AssetQuotasGet.");
                                return n = {}, void 0 !== e.resourceType && (n.resourceType = e.resourceType), void 0 !== e.assetType && (n.assetType = e.assetType), void 0 !== e.useDummyData && (n.useDummyData = e.useDummyData), r = {}, [4, this.request({
                                    path: "/v1/asset-quotas",
                                    schemaPath: "/v1/asset-quotas",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new s.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        quotas: (0, s.exists)(e, "quotas") ? e.quotas.map(o) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetQuotasGet = function(e, t) {
                return i(this, void 0, void 0, function() {
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
            return r(t, e), t.prototype.v1AssetsAssetIdMediaGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, r, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdMediaGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/media".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/media",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new s.JSONApiResponse(i, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaGet = function(e, t) {
                return i(this, void 0, void 0, function() {
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
                return i(this, void 0, void 0, function() {
                    var n, r, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdMediaMediaAssetIdDelete.");
                                if (null === e.mediaAssetId || void 0 === e.mediaAssetId) throw new s.RequiredError("mediaAssetId", "Required parameter requestParameters.mediaAssetId was null or undefined when calling v1AssetsAssetIdMediaMediaAssetIdDelete.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/media/{mediaAssetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))).replace("{".concat("mediaAssetId", "}"), encodeURIComponent(String(e.mediaAssetId))),
                                    schemaPath: "/v1/assets/{assetId}/media/{mediaAssetId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new s.JSONApiResponse(i)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaMediaAssetIdDelete = function(e, t) {
                return i(this, void 0, void 0, function() {
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
                return i(this, void 0, void 0, function() {
                    var n, r, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdMediaOrderPost.");
                                if (null === e.mediaAssetIds || void 0 === e.mediaAssetIds) throw new s.RequiredError("mediaAssetIds", "Required parameter requestParameters.mediaAssetIds was null or undefined when calling v1AssetsAssetIdMediaOrderPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets/{assetId}/media/order".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/media/order",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: e.mediaAssetIds
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new s.JSONApiResponse(i)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaOrderPost = function(e, t) {
                return i(this, void 0, void 0, function() {
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
                return i(this, void 0, void 0, function() {
                    var n, r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdMediaPost.");
                                return n = {}, r = {}, i = (0, s.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && i.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/assets/{assetId}/media".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/media",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: i
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaPost = function(e, t) {
                return i(this, void 0, void 0, function() {
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
                return i(this, void 0, void 0, function() {
                    var n, r, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdThumbnailDelete.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/thumbnail".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/thumbnail",
                                    method: "DELETE",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new s.JSONApiResponse(i)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailDelete = function(e, t) {
                return i(this, void 0, void 0, function() {
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
                return i(this, void 0, void 0, function() {
                    var n, r, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdThumbnailGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/thumbnail".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/thumbnail",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new s.JSONApiResponse(i, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailGet = function(e, t) {
                return i(this, void 0, void 0, function() {
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
                return i(this, void 0, void 0, function() {
                    var n, r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdThumbnailPost.");
                                return n = {}, r = {}, i = (0, s.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && i.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/assets/{assetId}/thumbnail".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/thumbnail",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: i
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailPost = function(e, t) {
                return i(this, void 0, void 0, function() {
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
            r(t, e), t.prototype.v1AudioPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, r, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new s.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AudioPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/audio",
                                    schemaPath: "/v1/audio",
                                    method: "POST",
                                    headers: r,
                                    query: n,
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
                                return i = a.sent(), [2, new s.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        id: (0, s.exists)(e, "Id") ? e.Id : void 0,
                                        name: (0, s.exists)(e, "Name") ? e.Name : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AudioPost = function(e, t) {
                return i(this, void 0, void 0, function() {
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
                return i(this, void 0, void 0, function() {
                    var n, r, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new s.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AudioVerifyPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/audio/verify",
                                    schemaPath: "/v1/audio/verify",
                                    method: "POST",
                                    headers: r,
                                    query: n,
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
                                return i = a.sent(), [2, new s.JSONApiResponse(i, function(e) {
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
                return i(this, void 0, void 0, function() {
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
            return r(t, e), t.prototype.v1BadgesBadgeIdIconPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.badgeId || void 0 === e.badgeId) throw new s.RequiredError("badgeId", "Required parameter requestParameters.badgeId was null or undefined when calling v1BadgesBadgeIdIconPost.");
                                return n = {}, r = {}, i = (0, s.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && i.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/badges/{badgeId}/icon".replace("{".concat("badgeId", "}"), encodeURIComponent(String(e.badgeId))),
                                    schemaPath: "/v1/badges/{badgeId}/icon",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: i
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1BadgesBadgeIdIconPost = function(e, t) {
                return i(this, void 0, void 0, function() {
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
            return r(t, e), t.prototype.v1GamesGameIdIconPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.gameId || void 0 === e.gameId) throw new s.RequiredError("gameId", "Required parameter requestParameters.gameId was null or undefined when calling v1GamesGameIdIconPost.");
                                return n = {}, r = {}, i = (0, s.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && i.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/games/{gameId}/icon".replace("{".concat("gameId", "}"), encodeURIComponent(String(e.gameId))),
                                    schemaPath: "/v1/games/{gameId}/icon",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: i
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesGameIdIconPost = function(e, t) {
                return i(this, void 0, void 0, function() {
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
            return r(t, e), t.prototype.v1GamesGameIdThumbnailImagePostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.gameId || void 0 === e.gameId) throw new s.RequiredError("gameId", "Required parameter requestParameters.gameId was null or undefined when calling v1GamesGameIdThumbnailImagePost.");
                                return n = {}, r = {}, i = (0, s.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && i.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/games/{gameId}/thumbnail/image".replace("{".concat("gameId", "}"), encodeURIComponent(String(e.gameId))),
                                    schemaPath: "/v1/games/{gameId}/thumbnail/image",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: i
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesGameIdThumbnailImagePost = function(e, t) {
                return i(this, void 0, void 0, function() {
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
            return r(t, e), t.prototype.v1PluginsPluginIdIconPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, r, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.pluginId || void 0 === e.pluginId) throw new s.RequiredError("pluginId", "Required parameter requestParameters.pluginId was null or undefined when calling v1PluginsPluginIdIconPost.");
                                return n = {}, r = {}, i = (0, s.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && i.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/plugins/{pluginId}/icon".replace("{".concat("pluginId", "}"), encodeURIComponent(String(e.pluginId))),
                                    schemaPath: "/v1/plugins/{pluginId}/icon",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: i
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdIconPost = function(e, t) {
                return i(this, void 0, void 0, function() {
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
        I = e.i(272593),
        g = e.i(227987),
        P = ((t = {}).Month = "Month", t);
    let y = (0, I.createClientConfiguration)("publish", "bedev1"),
        b = new p(y),
        w = new m(y),
        A = new v(y),
        R = new d(y),
        S = new h(y),
        T = new c(y);
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
                let e = await (0, g.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        },
        async patchPluginIcon(e, t) {
            try {
                return await S.v1PluginsPluginIdIconPost({
                    pluginId: e,
                    requestFiles: t
                })
            } catch (t) {
                let e = await (0, g.default)(t);
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
                let e = await (0, g.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        },
        async getAssetQuotas(e, t) {
            try {
                return await R.v1AssetQuotasGet({
                    resourceType: e,
                    assetType: t
                })
            } catch (t) {
                let e = await (0, g.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        },
        async getAssetMedia(e) {
            try {
                return await T.v1AssetsAssetIdMediaGet({
                    assetId: e
                })
            } catch (t) {
                let e = await (0, g.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        },
        async postAssetMedia(e, t) {
            try {
                return await T.v1AssetsAssetIdMediaPost({
                    assetId: e,
                    requestFiles: t
                })
            } catch (t) {
                let e = await (0, g.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        },
        async deleteAssetMedia(e, t) {
            try {
                await T.v1AssetsAssetIdMediaMediaAssetIdDelete({
                    assetId: e,
                    mediaAssetId: t
                })
            } catch (t) {
                let e = await (0, g.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        },
        async postOrderAssetMedia(e, t) {
            try {
                await T.v1AssetsAssetIdMediaOrderPost({
                    assetId: e,
                    mediaAssetIds: t
                })
            } catch (t) {
                let e = await (0, g.default)(t);
                if (e) throw new f.default(e.code, e.message);
                throw t
            }
        }
    }], 239320)
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
        n = e.i(416340),
        r = e.i(589624),
        i = e.i(795621),
        a = e.i(751846),
        o = e.i(814975),
        u = e.i(968284),
        l = e.i(773057),
        d = e.i(759283),
        c = e.i(671376),
        p = e.i(627636),
        v = e.i(450639),
        m = e.i(970494),
        h = e.i(995849),
        f = e.i(403028),
        I = e.i(309999),
        g = e.i(255382),
        P = e.i(392782),
        y = e.i(239320),
        b = e.i(17829);
    let w = async e => {
        var t;
        let s = null == (t = (await y.default.getAssetQuotas("RateLimitCreatorMarketplaceDistribute", e)).quotas) ? void 0 : t[0];
        if (s && void 0 !== s.usage && void 0 !== s.capacity && void 0 !== s.duration && s.duration in y.QuotaDuration) return {
            capacity: s.capacity,
            duration: s.duration,
            expirationTime: s.expirationTime ? new Date(s.expirationTime) : void 0,
            usage: s.usage
        };
        throw Error("empty quota")
    }, A = async e => await g.default.getAssetPermissions(e), R = async (e, t) => await g.default.batchCheckAssetPermissions(t.map(t => ({
        assetId: e,
        subject: h.SubjectType.Universe,
        subjectId: t.toString(),
        permissionType: h.AssetConsumerAction.Use
    }))), S = async (e, t) => {
        var s, n, r, i;
        let a = await g.default.batchCheckAssetPermissions([{
            assetId: t,
            subject: h.SubjectType.User,
            subjectId: e.toString(),
            permissionType: h.AssetConsumerAction.Edit
        }]);
        if (!a || a.length < 1 || a[0].error) throw Error(null != (n = null == a || null == (i = a[0]) || null == (r = i.error) ? void 0 : r.message) ? n : "Something went wrong fetching asset edit permissions");
        return (null == (s = a[0].value) ? void 0 : s.status) === h.ApiPermissionStatus.HasPermission
    }, T = async e => {
        if (0 === e.length) return null;
        let t = await P.default.getDetails(e);
        return t.data && t.data.length > 0 ? t.data.filter(e => e && e.id && e.name && e.creator && e.creator.name && e.creator.id && e.creator.type).map(e => {
            var t, s, n;
            return {
                universeId: e.id,
                experienceName: e.name,
                creatorName: null == (t = e.creator) ? void 0 : t.name,
                creatorId: null == (s = e.creator) ? void 0 : s.id,
                creatorType: null == (n = e.creator) ? void 0 : n.type
            }
        }) : null
    };
    var C = ((t = {}).AssetNotPublic = "AssetNotPublic", t.UserNotVerified = "UserNotVerified", t.InvalidAssetType = "InvalidAssetType", t.PotentialPolicyViolation = "PotentialPolicyViolation", t.IneligibleFiatSeller = "IneligibleFiatSeller", t.Other = "Other", t.Unauthorized = "Unauthorized", t.NotStarted = "NotStarted", t.NotStartedAudioDistribution = "NotStartedAudioDistribution", t.Approved = "Approved", t.PackageIneligible = "PackageIneligible", t.RightsClaim = "RightsClaim", t.CompositeAssetBrokenDependencies = "CompositeAssetBrokenDependencies", t.CompositeAssetIneligibleDependencies = "CompositeAssetIneligibleDependencies", t.CompositeAssetDependenciesLimit = "CompositeAssetDependenciesLimit", t.HiddenFromSearch = "HiddenFromSearch", t.IneligiblePublisher = "IneligiblePublisher", t.NoPublishedVersion = "NoPublishedVersion", t);
    e.s(["DistributionErrorState", () => C, "getAssetPermissions", 0, A, "getBackToCreationsPageLink", 0, e => {
        let t = "/dashboard/creations";
        return (null == e ? void 0 : e.type) && ((null == e ? void 0 : e.creator.type) === b.default.Group ? t += "?activeTab=".concat(e.type, "&groupId=").concat(e.creator.id) : t += "?activeTab=".concat(e.type)), t
    }, "getDeveloperItemDistributionQuota", 0, w, "getDistributionErrorStateForRestrictions", 0, (e, t, s, n, r, i, a) => e.includes(f.Restriction.NoPublishedVersion) ? "NoPublishedVersion" : e.includes(f.Restriction.CompositeAssetSubcomponentsRestricted) ? "CompositeAssetIneligibleDependencies" : e.includes(f.Restriction.CompositeAssetBrokenUnknownPermissions) || e.includes(f.Restriction.CompositeAssetBrokenReferencedAssetNotFound) ? "CompositeAssetBrokenDependencies" : e.includes(f.Restriction.CompositeAssetBrokenDependenciesLimit) ? "CompositeAssetDependenciesLimit" : e.includes(f.Restriction.AgeVerification) || e.includes(f.Restriction.Moderation) ? "IneligiblePublisher" : e.includes(f.Restriction.SafetyStatus) ? "PotentialPolicyViolation" : e.includes(f.Restriction.AssetType) ? "InvalidAssetType" : e.includes(f.Restriction.Authorization) ? "Unauthorized" : e.includes(f.Restriction.Packages) ? "PackageIneligible" : t ? i && (s.includes(f.Restriction.Moderation) || s.includes(f.Restriction.ModerationHistory) || s.includes(f.Restriction.TwoStepVerification) || s.includes(f.Restriction.Verification)) ? "IneligibleFiatSeller" : e.includes(f.Restriction.RightsClaim) || s.includes(f.Restriction.RightsClaim) ? "RightsClaim" : !n && i ? "Other" : a === I.ToolboxVisibilityStatus.Hidden ? "HiddenFromSearch" : void 0 : "Other", "getExperienceDetails", 0, T, "getUniverseHasPermission", 0, R, "getUserHasEditPermissionForAsset", 0, S, "postDeveloperItemDetails", 0, (e, t) => l.default.updateAsset(parseInt(e, 10), {
        ...t
    })], 720054);
    let q = (0, n.createContext)({
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
    q.displayName = "DeveloperItemDetail", e.s(["DeveloperItemProvider", 0, e => {
        var t;
        let {
            children: h
        } = e, [f, I] = (0, n.useState)(!0), [g, P] = (0, n.useState)(void 0), [y, b] = (0, n.useState)(null), [w, A] = (0, n.useState)(), R = (0, i.useQueryClient)(), {
            user: T
        } = (0, o.useAuthentication)(), {
            query: C,
            isReady: G
        } = (0, r.useRouter)(), D = (0, n.useMemo)(() => {
            if (G) {
                let {
                    id: e
                } = C;
                if (e) {
                    let t = parseInt(String(e), 10);
                    return t > 0 ? t : void 0
                }
            }
        }, [C, G]), [x, O] = (0, n.useState)(null);
        (0, n.useEffect)(() => {
            D && (null == y ? void 0 : y.type) === c.Asset.Audio && u.default.getAsset(D, [u.FieldMask.ICON]).then(e => {
                if (e.icon) {
                    let t = parseInt(e.icon.replace("assets/", ""), 10);
                    Number.isNaN(t) || O(t)
                }
            })
        }, [D, null == y ? void 0 : y.type]);
        let U = null != (t = null != x ? x : D) ? t : 0,
            {
                thumbnailImage: E,
                refreshThumbnail: B
            } = (0, v.default)({
                targetId: U,
                targetType: a.ThumbnailTypes.assetThumbnail,
                fontColor: "dark",
                returnPolicy: a.ReturnPolicy.PlaceHolder
            }),
            k = (0, n.useCallback)(e => {
                var t, s;
                let n = Object.values(c.Asset),
                    r = e.type && n.includes(e.type);
                return e.id && r && e.name && (null == (t = e.creator) ? void 0 : t.targetId) && (null == (s = e.creator) ? void 0 : s.type) && void 0 !== e.enableComments && void 0 !== e.isCopyingAllowed
            }, []),
            N = (0, n.useCallback)(async (e, t) => {
                I(!0);
                let [s, n] = await Promise.allSettled([l.default.getAssetDetails([e]), S(t, e)]);
                if (s.status === d.AllSettlePromiseSuccess && n.status === d.AllSettlePromiseSuccess) {
                    var r, i, a, o, u, v, h, f;
                    let t = null == (r = s.value.data) ? void 0 : r[0];
                    if (t && k(t)) {
                        let s = Object.values(c.Asset).find(e => e === t.type),
                            n = Object.values(p.CreatorType).find(e => {
                                var s;
                                return e === (null == (s = t.creator) ? void 0 : s.type)
                            });
                        if (!s || !n) {
                            b(null), A(void 0), I(!1);
                            return
                        }
                        let r = {
                                id: (null != (i = t.id) ? i : 0).toString(),
                                type: s,
                                name: null != (a = t.name) ? a : "",
                                creator: {
                                    id: null != (o = null == (f = t.creator) ? void 0 : f.targetId) ? o : 0,
                                    type: n
                                },
                                enableComments: null != (u = t.enableComments) && u,
                                isCopyingAllowed: null != (v = t.isCopyingAllowed) && v,
                                isVersioningEnabled: null != (h = t.isVersioningEnabled) && h,
                                description: t.description
                            },
                            l = (0, m.reconcileDeveloperItemDetailsMetadata)(R, e, r);
                        b(l.details), A(l.expiresAt)
                    } else b(null), A(void 0);
                    P(n.value)
                } else b(null), A(void 0);
                I(!1)
            }, [k, R]),
            L = (0, n.useCallback)(async function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                if (e && B(), D && (null == T ? void 0 : T.id)) return N(D, T.id)
            }, [T, D, N, B]);
        (0, n.useEffect)(() => {
            let e = window.setTimeout(() => {
                L()
            }, 0);
            return () => window.clearTimeout(e)
        }, [L]), (0, n.useEffect)(() => {
            if (null == w) return;
            let e = window.setTimeout(() => {
                A(void 0), L()
            }, Math.max(0, w - Date.now()));
            return () => window.clearTimeout(e)
        }, [w, L]);
        let M = (0, n.useMemo)(() => ({
            canConfigureDeveloperItem: g,
            developerItemId: D,
            iconAssetId: x,
            isLoadingDeveloperItem: f,
            developerItemDetails: y,
            refreshDeveloperItemDetails: L,
            developerItemImage: E,
            updateIconAssetId: O
        }), [g, y, D, x, f, L, E]);
        return (0, s.jsx)(q.Provider, {
            value: M,
            children: h
        })
    }, "useCurrentDeveloperItem", 0, function() {
        return (0, n.useContext)(q)
    }], 691450)
}, 914570, e => {
    "use strict";
    var t = e.i(221628),
        s = e.i(416340),
        n = e.i(863755),
        r = e.i(495011),
        i = e.i(92653);
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
        } = (0, i.useUniverseId)(), {
            productId: l
        } = (0, r.useProductId)(), d = (0, n.useGetDeveloperProductConfig)({
            universeId: u,
            productId: l
        }, {
            enabled: !!l && !!u
        });
        return (0, t.jsx)(a.Provider, {
            value: (0, s.useMemo)(() => ({
                ...d,
                developerProductDetails: d.data
            }), [d]),
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
        isErrorLoadingItem: !1,
        refreshItemDetails: () => {
            throw Error("function is not implemented")
        },
        collectiblesMetadata: void 0,
        marketplaceItemDetails: void 0
    });
    s.displayName = "ItemDetails", e.s(["default", 0, s], 213465), e.s(["default", 0, function() {
        return (0, t.useContext)(s)
    }], 731815)
}, 882221, e => {
    "use strict";
    var t = e.i(221628),
        s = e.i(416340),
        n = e.i(261482),
        r = e.i(477749),
        i = e.i(92653),
        a = e.i(157310),
        o = e.i(851130),
        u = e.i(966956);
    let l = (0, s.createContext)({
        passDetails: void 0,
        passPromotionsStatus: void 0,
        isPassLoading: !1,
        isPassDetailsRefetching: !1
    });
    l.displayName = "Pass", e.s(["PassProvider", 0, function(e) {
        let {
            children: d
        } = e, {
            universeId: c
        } = (0, i.useUniverseId)(), {
            passId: p
        } = (0, r.usePassId)(), v = !!c && !!p, {
            data: m,
            isLoading: h,
            isRefetching: f
        } = function(e) {
            var t;
            let {
                universeId: s,
                gamePassId: n
            } = e, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return (0, a.useQuery)({
                queryKey: u.gamePassKeys.config(s, n),
                queryFn: e => {
                    let {
                        signal: t
                    } = e;
                    return o.default.getGamePassConfig({
                        universeId: s,
                        gamePassId: n
                    }, {
                        signal: t
                    })
                },
                staleTime: u.DEFAULT_STALE_TIME,
                retry: u.DEFAULT_RETRIES,
                ...r,
                enabled: (null == (t = r.enabled) || t) && !!s && s > 0 && !!n
            })
        }({
            universeId: c,
            gamePassId: p
        }, {
            enabled: v
        }), {
            data: I,
            isLoading: g
        } = (0, n.useGetGamePassBonusOptIn)({
            universeId: c,
            gamePassId: p
        }, {
            enabled: v
        }), P = h || g;
        return (0, t.jsx)(l.Provider, {
            value: (0, s.useMemo)(() => ({
                passDetails: m,
                passPromotionsStatus: I,
                isPassLoading: P,
                isPassDetailsRefetching: f
            }), [m, I, P, f]),
            children: d
        })
    }, "useCurrentPass", 0, function() {
        return (0, s.useContext)(l)
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
    let n = {
        all: e => ["universes", e, "developerproducts"],
        list: (e, t) => [...n.all(e), "list", t],
        config: (e, t) => [...n.all(e), "config", t],
        batchConfigs: (e, t) => [...n.all(e), "batchConfigs", [...t].sort((e, t) => e - t)],
        create: e => [...n.all(e), "create"],
        update: (e, t) => [...n.all(e), t, "update"],
        batchUpdate: e => [...n.all(e), "batchUpdate"]
    };
    e.s(["BULK_UPDATE_LIMIT", 0, 3e3, "DEFAULT_PAGE_SIZE", 0, 400, "DEFAULT_RETRIES", 0, 3, "DEFAULT_STALE_TIME", 0, 6e5, "INITIAL_FETCH_TOTAL", 0, 3e3, "developerProductKeys", 0, n, "matchesDeveloperProductBatchConfigsQuery", 0, function(e, t) {
        let s = e.queryKey;
        return "universes" === s[0] && s[1] === t && "developerproducts" === s[2] && "batchConfigs" === s[3] && Array.isArray(s[4])
    }, "matchesDeveloperProductListQuery", 0, function(e, t) {
        let s = e.queryKey;
        return "universes" === s[0] && s[1] === t && "developerproducts" === s[2] && "list" === s[3]
    }], 285040), e.s(["useGetDeveloperProductConfig", 0, function(e) {
        let {
            universeId: r,
            productId: i
        } = e, a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return (0, t.useQuery)({
            queryKey: n.config(r, i),
            queryFn: e => {
                let {
                    signal: t
                } = e;
                return s.default.getDeveloperProductConfig({
                    universeId: r,
                    productId: i
                }, {
                    signal: t
                })
            },
            retry: 3,
            ...a
        })
    }], 863755);
    var r = e.i(589624);
    e.s(["useProductId", 0, function() {
        let e = (0, r.useRouter)(),
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
}, 92653, e => {
    "use strict";
    var t = e.i(589624);
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
        let n = Number(s);
        return Number.isNaN(n) || !Number.isInteger(n) ? {
            isLoading: !1,
            isError: !0
        } : {
            universeId: n,
            isLoading: !1,
            isError: !1
        }
    }])
}, 943758, e => {
    "use strict";
    var t = e.i(221628),
        s = e.i(416340);
    let n = (0, s.createContext)(null);
    e.s(["BreadcrumbItemNameProvider", 0, function(e) {
        let {
            children: r
        } = e, i = (0, s.useRef)({}), a = (0, s.useRef)(new Set), o = (0, s.useCallback)(() => i.current, []), u = (0, s.useCallback)(e => (a.current.add(e), () => {
            a.current.delete(e)
        }), []), l = (0, s.useCallback)(() => {
            for (let e of a.current) e()
        }, []), d = (0, s.useCallback)((e, t) => {
            i.current[e] !== t && (i.current = {
                ...i.current,
                [e]: t
            }, l())
        }, [l]), c = (0, s.useCallback)(e => {
            if (e in i.current) {
                let t = {
                    ...i.current
                };
                delete t[e], i.current = t, l()
            }
        }, [l]), p = (0, s.useMemo)(() => ({
            getSnapshot: o,
            subscribe: u,
            register: d,
            unregister: c
        }), [o, u, d, c]);
        return (0, t.jsx)(n.Provider, {
            value: p,
            children: r
        })
    }, "useBreadcrumbItemNames", 0, function() {
        let e = (0, s.useContext)(n);
        if (!e) throw Error("useBreadcrumbItemNames must be used within an BreadcrumbItemNameProvider");
        return (0, s.useSyncExternalStore)(e.subscribe, e.getSnapshot, e.getSnapshot)
    }, "useBreadcrumbRegister", 0, function() {
        let e = (0, s.useContext)(n);
        if (!e) throw Error("useBreadcrumbRegister must be used within an BreadcrumbItemNameProvider");
        return e
    }])
}, 128106, e => {
    "use strict";
    var t, s = ((t = s || {}).Creations = "creations", t.Games = "games", t.GamePass = "passes", t.Badge = "badges", t.Bundle = "bundle", t.DeveloperProduct = "developer-products", t.ExternalPurchaseSettings = "external-purchase-settings", t.Catalog = "catalog", t.AssociatedItems = "associated-items", t.Localization = "localization", t.ActivityHistory = "activity-history", t.Notifications = "notifications", t.SocialLinks = "social-links", t.Translation = "translation", t.Overview = "overview", t.ContributionReport = "contribution-report", t.Alerts = "alerts", t.AnalyticsMonetization = "analytics-monetization", t.AnalyticsRetention = "analytics-retention", t.AnalyticsEngagement = "analytics-engagement", t.AnalyticsAcquisition = "analytics-acquisition", t.AnalyticsPerformance = "analytics-performance", t.AnalyticsCrashes = "analytics-crashes", t.AnalyticsExploreMode = "analytics-explore-mode", t.AnalyticsCustomDashboards = "analytics-custom-dashboards", t.AnalyticsAudience = "analytics-audience", t.AnalyticsEconomy = "analytics-economy", t.AnalyticsFunnels = "analytics-funnels", t.AnalyticsErrorReport = "analytics-error-report", t.AnalyticsMemoryStores = "analytics-memory-stores", t.AnalyticsDataStores = "analytics-data-stores", t.AnalyticsHttpServicce = "analytics-http-service", t.AnalyticsMessagingService = "analytics-messaging-service", t.AnalyticsSpeechToText = "analytics-speech-to-text", t.AnalyticsTextToSpeech = "analytics-text-to-speech", t.AnalyticsVideoService = "analytics-video-service", t.AnalyticsGenerativeAI = "analytics-generative-ai", t.AnalyticCustomEvents = "analytics-custom-events", t.ImmersiveAds = "immersive-ads", t.ImmersiveAdsCreatePlacement = "immersive-ads-create-placement", t.Questionnaire = "experience-questionnaire", t.Guidelines = "guidelines", t.Configure = "configure", t.CommunicationSettings = "communication-settings", t.Sales = "sales", t.Promotions = "promotions", t.Create = "create", t.ConfigCreate = "config-create", t.Updates = "updates", t.Places = "places", t.Manage = "manage", t.Icon = "icon", t.Event = "event", t.SelectEligibility = "selectEligibility", t.Thumbnails = "thumbnails", t.Videos = "videos", t.Access = "access", t.Secrets = "secrets", t.CreatorStore = "store", t.Settings = "settings", t.Permissions = "permissions", t.Webhooks = "webhooks", t.Community = "community", t.Category = "category", t.Experiences = "experiences", t.ExperienceSubscription = "experience-subscriptions", t.Commerce = "commerce", t.CreateProducts = "create-products", t.Preferences = "preferences", t.Advanced = "advanced", t.DataSharing = "data-collection", t.PricedAssets = "priced-assets", t.Eligibility = "eligibility", t.AudioDistribution = "audio-distribution", t.PriceOptimization = "price-optimization", t.PriceCheck = "price-check", t.Bans = "bans", t.AntiCheat = "anti-cheat", t.IssuesAndAppeals = "issues-and-appeals", t.Add = "add", t.Reorder = "reorder", t.AvatarCreationTokens = "avatar-creation-tokens", t.CustomMatchmaking = "custom-matchmaking", t.CreateMatchmakingConfiguration = "create-configuration", t.CreateMatchmakingAttribute = "create-attribute", t.EditMatchmakingConfiguration = "edit-configuration", t.EditMatchmakingServerAttribute = "edit-server-attribute", t.EditMatchmakingPlayerAttribute = "edit-player-attribute", t.PaidAccess = "paid-access", t.ExtendedServices = "extended-services", t.PublicPublish = "public-publish", t.PublishingPermissions = "publishing-permissions", t.UsO18DevexRate = "us-o18-devex-rate", t.Feedback = "feedback", t.ApiSettings = "api-settings", t.Configs = "configs", t.ConfigsHistory = "configs-history", t.Experiments = "experiments", t.ExperimentCreate = "experiment-create", t.ExperimentDetails = "experiment-details", t.ReferralRewards = "referral-reward-details", t.Environments = "environments", t.Collaborators = "collaborators", t.Look = "look", t.AnalyticsJourneys = "analytics-journeys", t.AnalyticsJourneyDetail = "analytics-journey-detail", t.RecommendationService = "recommendation-service", t.Observability = "observability", t.ServerManagement = "server-management-service", t.ClientSessions = "client-sessions", t.ClientSession = "client-session", t.ManagedPricing = "managed-pricing", t.HardCodedPrices = "hard-coded-prices", t.DeveloperProductPurchasesBlocked = "developer-product-purchases-blocked", t.Leaderboard = "leaderboard", t.PersonalizedShop = "personalized-shop", t.AudienceReach = "audience-reach", t.PlayerSupport = "player-support", t.PlayerSupportTicket = "player-support-ticket", t.GameDetails = "game-details", t.ContentRating = "content-rating", t.AdvancedSettings = "advanced-settings", t.GameJoin = "game-join", t.Publishing = "publishing", t.GameViolation = "game-violation", t);
    e.s(["default", 0, s])
}, 509049, e => {
    "use strict";
    var t = e.i(416340),
        s = e.i(589624),
        n = e.i(79187),
        r = e.i(54842),
        i = e.i(663629),
        a = e.i(691450),
        o = e.i(914570),
        u = e.i(768243),
        l = e.i(199186),
        d = e.i(731815),
        c = e.i(105098),
        p = e.i(882221),
        v = e.i(967775),
        m = e.i(475360),
        h = e.i(759283),
        f = e.i(17829),
        I = e.i(251622),
        g = e.i(692587),
        P = e.i(114209),
        y = e.i(943758),
        b = e.i(128106);
    e.s(["default", 0, function() {
        let {
            pathname: e
        } = (0, s.useRouter)(), {
            translate: w
        } = (0, n.useTranslation)(), {
            itemNameMapping: A,
            currentItemType: R,
            currentItemGroupId: S,
            isCurrentItemLoading: T,
            hasCurrentItemLoadError: C,
            id: q,
            badgeId: G,
            passId: D,
            groupId: x,
            assetId: O,
            bundleId: U,
            experienceSubscriptionId: E,
            lookId: B,
            developerItemDetails: k,
            experimentId: N,
            environmentId: L
        } = function() {
            var e, w, A, R, S, T, C, q, G, D, x, O;
            let {
                translate: U
            } = (0, n.useTranslation)(), {
                gameDetails: E,
                isLoadingGame: B,
                isErrorLoadingGame: k
            } = (0, P.useCurrentGame)(), {
                isLoadingItem: N,
                isErrorLoadingItem: L,
                marketplaceItemDetails: M
            } = (0, d.default)(), {
                badgeDetails: F
            } = (0, i.default)(), {
                developerProductDetails: V
            } = (0, o.useCurrentDeveloperProduct)(), {
                passDetails: j
            } = (0, p.useCurrentPass)(), {
                lookDetail: _,
                isLoadingLook: J
            } = (0, c.default)(), {
                placeDetails: z
            } = (0, v.default)(), {
                eventDetails: H,
                isLoading: K
            } = (0, u.default)(), {
                developerItemDetails: Q,
                isLoadingDeveloperItem: W
            } = (0, a.useCurrentDeveloperItem)(), {
                experienceSubscriptionDetails: Y
            } = (0, l.default)(), Z = (0, y.useBreadcrumbItemNames)(), {
                query: X,
                pathname: $
            } = (0, s.useRouter)(), {
                id: ee,
                badgeId: et,
                notificationCategory: es,
                activeTab: en,
                experimentId: er,
                environmentId: ei
            } = (0, g.default)(X), ea = (0, t.useMemo)(() => {
                var e, t;
                return (null == E || null == (e = E.creator) ? void 0 : e.type) === "Group" ? null == E || null == (t = E.creator) ? void 0 : t.id : void 0
            }, [E]), eo = (0, t.useMemo)(() => {
                var e, t, s, n;
                if (null == M || null == (t = M.item) || null == (e = t.marketplaceItemDetails) ? void 0 : e.assetDetails) return null == M || null == (n = M.item) || null == (s = n.id) ? void 0 : s.toString()
            }, [M]), eu = (0, t.useMemo)(() => {
                var e;
                return null == j || null == (e = j.gamePassId) ? void 0 : e.toString()
            }, [j]), el = (0, t.useMemo)(() => {
                var e, t, s, n;
                if (null == M || null == (t = M.item) || null == (e = t.marketplaceItemDetails) ? void 0 : e.bundleDetails) return null == M || null == (n = M.item) || null == (s = n.id) ? void 0 : s.toString()
            }, [M]), ed = (0, t.useMemo)(() => {
                var e;
                return null != (e = null == Y ? void 0 : Y.id) ? e : void 0
            }, [Y]), ec = (0, t.useMemo)(() => {
                var e, t, s, n, r;
                return (null == M || null == (t = M.item) || null == (e = t.creator) ? void 0 : e.kindCase) === 2 ? null == M || null == (r = M.item) || null == (n = r.creator) || null == (s = n.group) ? void 0 : s.groupId : ea
            }, [ea, null == M || null == (A = M.item) || null == (w = A.creator) || null == (e = w.group) ? void 0 : e.groupId, null == M || null == (S = M.item) || null == (R = S.creator) ? void 0 : R.kindCase]), ep = (0, t.useMemo)(() => null == _ ? void 0 : _.lookId, [_]), ev = (0, t.useMemo)(() => {
                var e, t, s, n, r, i, a;
                return {
                    [b.default.Bundle]: null == M || null == (i = M.item) ? void 0 : i.name,
                    [b.default.Games]: null == E ? void 0 : E.name,
                    [b.default.Badge]: null == F ? void 0 : F.name,
                    [b.default.DeveloperProduct]: null != (e = null == V ? void 0 : V.name) ? e : void 0,
                    [b.default.GamePass]: null != (t = null == j ? void 0 : j.name) ? t : void 0,
                    [b.default.Catalog]: null == M || null == (a = M.item) ? void 0 : a.name,
                    [b.default.Places]: null == z ? void 0 : z.name,
                    [b.default.Event]: null != (s = null == H ? void 0 : H.title) ? s : void 0,
                    [b.default.CreatorStore]: null == Q ? void 0 : Q.name,
                    [b.default.Category]: es ? U("Label.Category".concat(es)) : void 0,
                    [b.default.ExperienceSubscription]: null != (n = null == Y ? void 0 : Y.name) ? n : void 0,
                    [b.default.Look]: null != (r = null == _ ? void 0 : _.name) ? r : void 0,
                    ...Z
                }
            }, [null == M || null == (T = M.item) ? void 0 : T.name, null == E ? void 0 : E.name, null == F ? void 0 : F.name, null == V ? void 0 : V.name, null == j ? void 0 : j.name, null == z ? void 0 : z.name, null == H ? void 0 : H.title, null == Q ? void 0 : Q.name, es, U, null == Y ? void 0 : Y.name, null == _ ? void 0 : _.name, Z]), em = (0, t.useMemo)(() => $.includes(b.default.ExperienceSubscription) ? m.Item.ExperienceSubscription : $.includes(b.default.Badge) ? m.Item.Badge : $.includes(b.default.ReferralRewards) ? m.Item.ReferralRewards : $.includes(b.default.Bundle) ? m.Item.Bundle : $.includes(b.default.GamePass) ? m.Item.GamePass : $.includes(b.default.DeveloperProduct) ? m.Item.DeveloperProduct : $.includes(b.default.Catalog) ? m.Item.CatalogAsset : $.includes(b.default.CreatorStore) ? m.Item.LibraryAsset : $.includes(b.default.Places) ? m.Item.Places : $.includes(b.default.Environments) ? m.Item.Environment : $.includes(b.default.Alerts) ? m.Item.Alert : $.includes(b.default.Event) ? m.Item.Event : $.includes(b.default.Notifications) ? m.Item.Notifications : $.includes(b.default.AssociatedItems) && "string" == typeof en && (0, I.isItem)(en) ? en : $.includes(b.default.AvatarCreationTokens) ? m.Item.AvatarCreationToken : $.includes(h.itemTypeToPath[m.Item.Journey]) ? m.Item.Journey : $.includes(b.default.Experiences) ? m.Item.Game : $.includes(b.default.Advanced) ? m.Item.Advanced : $.includes(b.default.Look) ? m.Item.Look : void 0, [en, $]), {
                currentItemGroupId: eh,
                isCurrentItemLoading: ef,
                hasCurrentItemLoadError: eI
            } = (0, t.useMemo)(() => {
                var e, t, s, n, i, a;
                return em === m.Item.Bundle || em === m.Item.CatalogAsset ? {
                    currentItemGroupId: null != ec ? ec : ea,
                    isCurrentItemLoading: N,
                    hasCurrentItemLoadError: L
                } : em === m.Item.DeveloperProduct || em === m.Item.LibraryAsset ? {
                    currentItemGroupId: (null == Q || null == (e = Q.creator) ? void 0 : e.type) === f.default.Group ? null == Q || null == (t = Q.creator) ? void 0 : t.id : ea,
                    isCurrentItemLoading: W,
                    hasCurrentItemLoadError: !1
                } : em === m.Item.Event ? {
                    currentItemGroupId: (null == H || null == (s = H.host) ? void 0 : s.hostType) === r.HostType.Group ? null == H || null == (n = H.host) ? void 0 : n.hostId : ea,
                    isCurrentItemLoading: K,
                    hasCurrentItemLoadError: !1
                } : em === m.Item.Look ? {
                    currentItemGroupId: (null == _ || null == (i = _.curator) ? void 0 : i.type) === f.default.Group ? null == _ || null == (a = _.curator) ? void 0 : a.id : ea,
                    isCurrentItemLoading: J,
                    hasCurrentItemLoadError: !1
                } : {
                    currentItemGroupId: ea,
                    isCurrentItemLoading: B,
                    hasCurrentItemLoadError: null != k && k
                }
            }, [em, ec, ea, N, L, null == Q || null == (C = Q.creator) ? void 0 : C.type, null == Q || null == (q = Q.creator) ? void 0 : q.id, W, null == H || null == (G = H.host) ? void 0 : G.hostType, null == H || null == (D = H.host) ? void 0 : D.hostId, K, B, k, null == _ || null == (x = _.curator) ? void 0 : x.type, null == _ || null == (O = _.curator) ? void 0 : O.id, J]);
            return {
                itemNameMapping: ev,
                currentItemType: em,
                currentItemGroupId: eh,
                isCurrentItemLoading: ef,
                hasCurrentItemLoadError: eI,
                pathname: $,
                id: ee,
                badgeId: et,
                passId: eu,
                groupId: ea,
                assetId: eo,
                bundleId: el,
                experienceSubscriptionId: ed,
                getMarketplaceItemGroupId: ec,
                lookId: ep,
                developerItemDetails: Q,
                experimentId: er,
                environmentId: ei
            }
        }(), M = (0, t.useMemo)(() => ({
            translate: w,
            itemType: R,
            pathname: e
        }), [R, e, w]);
        return {
            itemNameMapping: A,
            pathLinkParams: (0, t.useMemo)(() => {
                var t, s;
                return {
                    baseId: null == q ? void 0 : q.toString(),
                    badgeId: null == G ? void 0 : G.toString(),
                    passId: D,
                    groupId: null != (t = null == x ? void 0 : x.toString()) ? t : S ? S.toString() : void 0,
                    assetId: O,
                    bundleId: U,
                    developerItemId: null != (s = null == k ? void 0 : k.id) ? s : void 0,
                    associatedItemType: R,
                    experienceSubscriptionId: E,
                    environmentId: null != L ? L : void 0,
                    experimentId: null != N ? N : void 0,
                    lookId: null != B ? B : void 0,
                    pathname: e
                }
            }, [q, G, D, x, S, O, U, null == k ? void 0 : k.id, R, E, L, N, B, e]),
            displayNameParam: M,
            currentItemType: R,
            currentItemGroupId: S,
            isCurrentItemLoading: T,
            hasCurrentItemLoadError: C
        }
    }], 509049)
}, 403028, e => {
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

    function n(e, t, s, n) {
        return new(s || (s = Promise))(function(r, i) {
            function a(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var s, n, r, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
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
                var l = [o, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                    if (s = 1, n && (r = 2 & l[0] ? n.return : l[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, l[1])).done) return r;
                    switch (n = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                        case 0:
                        case 1:
                            r = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < r[1]) {
                                i.label = r[1], r = l;
                                break
                            }
                            if (r && i.label < r[2]) {
                                i.label = r[2], i.ops.push(l);
                                break
                            }
                            r[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    s = r = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function i(e) {
        return e
    }

    function a(e) {
        return e
    }

    function o(e) {
        return e
    }

    function u(e) {
        return e
    }

    function l(e) {
        var s;
        return null == (s = e) ? s : {
            duration: (0, t.exists)(s, "duration") ? s.duration : void 0,
            usage: (0, t.exists)(s, "usage") ? s.usage : void 0,
            capacity: (0, t.exists)(s, "capacity") ? s.capacity : void 0,
            expirationTime: (0, t.exists)(s, "expirationTime") ? null === s.expirationTime ? null : new Date(s.expirationTime) : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var d = function(e) {
        function d() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            s(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(d, e), d.prototype.marketplacePublishingRequirementsApiGetRequirementsRaw = function(e, s) {
            return n(this, void 0, void 0, function() {
                var n, d, c;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, void 0 !== e.marketplaceType && (n.MarketplaceType = e.marketplaceType), void 0 !== e.assetType && (n.AssetType = e.assetType), e.assetSubTypes && (n.AssetSubTypes = e.assetSubTypes), void 0 !== e.assetId && (n.AssetId = e.assetId), void 0 !== e.assetVersionNumber && (n.AssetVersionNumber = e.assetVersionNumber), e.requirementChecks && (n.RequirementChecks = e.requirementChecks), d = {}, [4, this.request({
                                path: "/v1/requirements",
                                schemaPath: "/v1/requirements",
                                method: "GET",
                                headers: d,
                                query: n
                            }, s)];
                        case 1:
                            return c = r.sent(), [2, new t.JSONApiResponse(c, function(e) {
                                var s, n, r, d, c, p, v;
                                return null == e ? e : {
                                    publishing: (0, t.exists)(e, "publishing") ? null == (s = e.publishing) ? s : {
                                        restrictions: (0, t.exists)(s, "restrictions") ? null === s.restrictions ? null : s.restrictions.map(i) : void 0,
                                        allowedSubTypes: (0, t.exists)(s, "allowedSubTypes") ? null === s.allowedSubTypes ? null : s.allowedSubTypes.map(a) : void 0,
                                        isAllowed: (0, t.exists)(s, "isAllowed") ? s.isAllowed : void 0
                                    } : void 0,
                                    verification: (0, t.exists)(e, "verification") ? null == (n = e.verification) ? n : {
                                        isVerified: (0, t.exists)(n, "isVerified") ? n.isVerified : void 0,
                                        status: (0, t.exists)(n, "status") ? n.status : void 0,
                                        supportedTypes: (0, t.exists)(n, "supportedTypes") ? null === n.supportedTypes ? null : n.supportedTypes.map(u) : void 0
                                    } : void 0,
                                    sellerOnboarding: (0, t.exists)(e, "sellerOnboarding") ? null == (r = e.sellerOnboarding) ? r : {
                                        restrictions: (0, t.exists)(r, "restrictions") ? null === r.restrictions ? null : r.restrictions.map(i) : void 0,
                                        isAllowed: (0, t.exists)(r, "isAllowed") ? r.isAllowed : void 0
                                    } : void 0,
                                    pricing: (0, t.exists)(e, "pricing") ? null == (d = e.pricing) ? d : {
                                        restrictions: (0, t.exists)(d, "restrictions") ? null === d.restrictions ? null : d.restrictions.map(i) : void 0,
                                        isAllowed: (0, t.exists)(d, "isAllowed") ? d.isAllowed : void 0
                                    } : void 0,
                                    openUse: (0, t.exists)(e, "openUse") ? null == (c = e.openUse) ? c : {
                                        restrictions: (0, t.exists)(c, "restrictions") ? null === c.restrictions ? null : c.restrictions.map(i) : void 0,
                                        isAllowed: (0, t.exists)(c, "isAllowed") ? c.isAllowed : void 0
                                    } : void 0,
                                    roles: (0, t.exists)(e, "roles") ? null == (p = e.roles) ? p : {
                                        roles: (0, t.exists)(p, "roles") ? null === p.roles ? null : p.roles.map(o) : void 0
                                    } : void 0,
                                    assetConfigMetadata: (0, t.exists)(e, "assetConfigMetadata") ? null == (v = e.assetConfigMetadata) ? v : {
                                        restrictions: (0, t.exists)(v, "restrictions") ? null === v.restrictions ? null : v.restrictions.map(i) : void 0
                                    } : void 0,
                                    quotas: (0, t.exists)(e, "quotas") ? null === e.quotas ? null : e.quotas.map(l) : void 0
                                }
                            })]
                    }
                })
            })
        }, d.prototype.marketplacePublishingRequirementsApiGetRequirements = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(s) {
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
        }, d
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
    }, "MarketplacePublishingRequirementsApiApi", 0, d, "MarketplaceType", 0, {
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
        SocialLinkView: "SocialLinkView",
        NoPublishedVersion: "NoPublishedVersion"
    }, "Role", 0, {
        Invalid: "Invalid",
        Reseller: "Reseller"
    }])
}]);

//# debugId=d0400aed-a70f-79db-47e2-9f5fc132c341
//# sourceMappingURL=3o-_kgo8sg2t_.js.map