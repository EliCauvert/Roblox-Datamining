;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "ca4f7c77-1fc2-bcc0-f6fe-29ea005ebfdd")
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
    var I = function(e) {
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
            (0, r._)(this, "bonusItemApi", void 0), this.bonusItemApi = new I((0, g.createClientConfiguration)("payments-bonus-service", "bedev2"))
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
}, 968284, 129882, e => {
    "use strict";
    var t, s, r = e.i(721281),
        i = e.i(408068),
        n = e.i(284856),
        a = ((t = {}).MD5_CALCULATION = "MD5_CALCULATION", t.MULTIPART_START = "MULTIPART_START", t.CHUNK_UPLOAD = "CHUNK_UPLOAD", t.CHUNK_COMPLETE = "CHUNK_COMPLETE", t.MULTIPART_COMPLETE = "MULTIPART_COMPLETE", t.CHUNK_UPLOAD_ABORT = "CHUNK_UPLOAD_ABORT", t.CHUNK_COMPLETE_ABORT = "CHUNK_COMPLETE_ABORT", t);
    class o extends Error {
        constructor(e, t, s, i, n, a, o) {
            super(e), (0, r._)(this, "stage", void 0), (0, r._)(this, "operationId", void 0), (0, r._)(this, "chunkIndex", void 0), (0, r._)(this, "httpStatus", void 0), (0, r._)(this, "errorCode", void 0), (0, r._)(this, "retryAttempt", void 0), this.name = "MultipartUploadError", this.stage = t, this.operationId = s, this.chunkIndex = i, this.httpStatus = n, this.errorCode = a, this.retryAttempt = o
        }
    }
    e.s(["MultipartUploadError", 0, o, "MultipartUploadStage", () => a], 129882);
    var u = e.i(650502),
        d = e.i(272593),
        l = ((s = {}).ASSET_TYPE = "assetType", s.DESCRIPTION = "description", s.DISPLAY_NAME = "displayName", s.ICON = "icon", s.MODERATION_RESULT = "moderationResult", s.PREVIEWS = "previews", s.FACEBOOK_SOCIAL_LINK = "facebookSocialLink", s.TWITTER_SOCIAL_LINK = "twitterSocialLink", s.YOUTUBE_SOCIAL_LINK = "youtubeSocialLink", s.TWITCH_SOCIAL_LINK = "twitchSocialLink", s.DISCORD_SOCIAL_LINK = "discordSocialLink", s.GITHUB_SOCIAL_LINK = "githubSocialLink", s.ROBLOX_SOCIAL_LINK = "robloxSocialLink", s.DEVFORUM_SOCIAL_LINK = "devForumSocialLink", s.TRY_ASSET_SOCIAL_LINK = "tryAssetSocialLink", s);
    let c = (0, u.getBEDEV2ServiceBasePath)("assets/user-auth"),
        p = "x-csrf-token",
        v = JSON.stringify({
            AssetPrivacy: "OpenUse"
        });
    async function m(e, t, s) {
        let r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 0;
        try {
            return await e()
        } catch (n) {
            let i = n instanceof Error ? n : Error(String(n));
            if (r < t) {
                let i = s(r);
                return await new Promise(e => {
                    setTimeout(e, i)
                }), m(e, t, s, r + 1)
            }
            throw i
        }
    }
    let h = async () => {
        try {
            return (await fetch("".concat(c, "/v1/assets"), {
                method: "PATCH",
                credentials: "include"
            })).headers.get(p)
        } catch (e) {
            return null
        }
    }, f = new class e {
        async createAssetAndGetOperationId(t, s) {
            let r = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                i = r ? e.generateRequestInitForCreatingOpenUseAsset(t, s) : {},
                n = await h();
            n && (i.headers = {
                [p]: n
            });
            let a = await this.assetsUploadApi.assetsCreateAsset({
                request: t,
                fileContent: s
            }, i);
            return e.parseOperationId(a.path)
        }
        async createAssetAndGetOperationIdWithMultipart(t, s, r, i) {
            var n;
            let u, d, l, c, v = null != r && r ? e.generateRequestInitForCreatingOpenUseAsset(t, s) : {},
                f = await h();
            f && (v.headers = {
                [p]: f,
                "Content-Type": "application/json; charset=utf-8"
            }), i && i(1);
            try {
                let t = await e.calculateMD5(s);
                u = t.hash, d = t.data
            } catch (e) {
                throw new o("Failed to calculate MD5 for file: ".concat(e instanceof Error ? e.message : String(e)), a.MD5_CALCULATION, void 0, void 0, void 0, "MD5_CALCULATION_FAILED")
            }
            i && i(5);
            let I = e.makeUploadPlan(s.size);
            i && i(10);
            let g = {
                    asset: t,
                    file: {
                        filesize: s.size,
                        md5CheckSum: u,
                        chunkPlan: I,
                        contentType: s.type
                    }
                },
                P = [];
            try {
                l = await this.multipartUploadApi.assetsCreateAssetWithMultipartUpload({
                    multipartUploadStartRequest: g
                }, v)
            } catch (e) {
                throw new o("Failed to start multipart upload: ".concat(e instanceof Error ? e.message : String(e)), a.MULTIPART_START, void 0, void 0, e instanceof Error && "status" in e ? e.status : void 0, "MULTIPART_START_FAILED")
            }
            if (i && i(15), 0 === (P = null != (n = l.uploadUrls) ? n : []).length) throw new o("Upload URLs are empty from multipart start response", a.MULTIPART_START, void 0, void 0, void 0, "EMPTY_UPLOAD_URLS");
            let y = e.parseOperationId(l.operationPath);
            if ("" === y) throw new o("Operation ID is empty from multipart start response", a.MULTIPART_START, void 0, void 0, void 0, "EMPTY_OPERATION_ID");
            try {
                c = await e.uploadChunks(P, d, y, i ? e => {
                    i(Math.min(15 + .65 * e, 80))
                } : void 0)
            } catch (e) {
                try {
                    await this.multipartUploadApi.assetsMultipartUploadAbort({
                        operationId: y
                    }, v)
                } catch (t) {
                    throw new o("Chunk upload failed and abort also failed. Original error: ".concat(e instanceof Error ? e.message : String(e), ". Abort error: ").concat(t instanceof Error ? t.message : String(t)), a.CHUNK_UPLOAD_ABORT, y, void 0, void 0, "ABORT_FAILED")
                }
                if (e instanceof o) throw e;
                throw new o("Chunk upload failed: ".concat(e instanceof Error ? e.message : String(e)), a.CHUNK_UPLOAD, y, void 0, void 0, "CHUNK_UPLOAD_FAILED")
            }
            i && i(80);
            try {
                await Promise.all(c.map((e, t) => {
                    let s = t + 1;
                    return m(async () => {
                        try {
                            await this.multipartUploadApi.assetsMultipartUploadChunkComplete({
                                operationId: y,
                                multipartUploadChunkCompleteRequest: {
                                    chunkNum: s,
                                    eTag: e
                                }
                            }, v)
                        } catch (e) {
                            throw new o("Failed to complete chunk ".concat(s, ": ").concat(e instanceof Error ? e.message : String(e)), a.CHUNK_COMPLETE, y, s, e instanceof Error && "status" in e ? e.status : void 0, "CHUNK_COMPLETE_FAILED")
                        }
                    }, 3, e => 1e3 * 2 ** e)
                }))
            } catch (e) {
                try {
                    await this.multipartUploadApi.assetsMultipartUploadAbort({
                        operationId: y
                    }, v)
                } catch (t) {
                    throw new o("Chunk complete failed and abort also failed. Original error: ".concat(e instanceof Error ? e.message : String(e), ". Abort error: ").concat(t instanceof Error ? t.message : String(t)), a.CHUNK_COMPLETE_ABORT, y, void 0, void 0, "ABORT_FAILED")
                }
                if (e instanceof o) throw e;
                throw new o("Chunk complete failed: ".concat(e instanceof Error ? e.message : String(e)), a.CHUNK_COMPLETE, y, void 0, void 0, "CHUNK_COMPLETE_FAILED")
            }
            i && i(90);
            try {
                await this.multipartUploadApi.assetsMultipartUploadComplete({
                    operationId: y
                }, v)
            } catch (e) {
                throw new o("Failed to complete multipart upload: ".concat(e instanceof Error ? e.message : String(e)), a.MULTIPART_COMPLETE, y, void 0, e instanceof Error && "status" in e ? e.status : void 0, "MULTIPART_COMPLETE_FAILED")
            }
            return i && i(100), y
        }
        async updateAssetAndGetOperationId(t, s, r, i) {
            let n = await this.assetsUploadApi.assetsUpdateAsset({
                assetId: t,
                updateMask: s,
                request: r,
                fileContent: i
            });
            return e.parseOperationId(n.path)
        }
        async getAsset(e, t) {
            return await this.assetsUploadApi.assetsGetAsset({
                assetId: e,
                readMask: t
            })
        }
        async getOperationStatus(e) {
            return await this.uploadStatusApi.assetsGetOperation({
                operationId: e
            })
        }
        async getOperationStatusRaw(e) {
            let t = await this.uploadStatusApi.assetsGetOperationRaw({
                    operationId: e
                }),
                s = await t.raw.json();
            return null !== s && "object" == typeof s ? s : {}
        }
        async getOperationStatusWithMetadata(e) {
            let t = await this.getOperationStatusRaw(e);
            return {
                operation: t,
                metadata: t.metadata
            }
        }
        static parseOperationId(e) {
            if (!e) throw Error("Operation path is missing or empty");
            let t = e.split("/");
            return t[t.length - 1]
        }
        static generateRequestInitForCreatingOpenUseAsset(e, t) {
            let s = new FormData;
            return s.append("request", JSON.stringify(e)), s.append("fileContent", t), s.append("additionalParameters", v), {
                body: s
            }
        }
        static async calculateMD5(e) {
            let t = await new Promise((t, s) => {
                let r = new FileReader;
                r.onload = e => {
                    var r;
                    let i = null == e || null == (r = e.target) ? void 0 : r.result;
                    i instanceof ArrayBuffer ? t(new Uint8Array(i)) : s(Error("Failed to read file"))
                }, r.onerror = () => s(r.error), r.readAsArrayBuffer(e)
            });
            return {
                hash: (0, i.md5)(t),
                data: t
            }
        }
        static makeUploadPlan(e) {
            let t = [],
                s = 0;
            for (; s < e;) {
                let r = Math.min(5242880, e - s);
                t.push(r), s += 5242880
            }
            return t
        }
        static async uploadChunks(e, t, s, r) {
            let i = e.length,
                n = 0,
                u = r ? () => {
                    r(Math.min((n += 1) / i * 100, 99))
                } : void 0,
                d = e.map((e, r) => {
                    let i = Number(e.contentStart || 0),
                        n = Number(e.contentLength || 0);
                    return m(async () => {
                        if (!(null == e ? void 0 : e.url)) throw new o("No URL found for chunk ".concat(r + 1), a.CHUNK_UPLOAD, s, r + 1, void 0, "MISSING_UPLOAD_URL");
                        let d = t.slice(i, i + n);
                        if (d.length !== n) throw new o("Chunk size mismatch for chunk ".concat(r + 1, ": expected ").concat(n, ", got ").concat(d.length), a.CHUNK_UPLOAD, s, r + 1, void 0, "CHUNK_SIZE_MISMATCH");
                        let l = await fetch(e.url, {
                            method: "PUT",
                            body: d
                        });
                        if (!l.ok) throw new o("Failed to upload chunk ".concat(r + 1, ": ").concat(l.status, " ").concat(l.statusText), a.CHUNK_UPLOAD, s, r + 1, l.status, "CHUNK_UPLOAD_HTTP_ERROR");
                        let c = l.headers.get("ETag");
                        if (!c) throw new o("No ETag received for chunk ".concat(r + 1), a.CHUNK_UPLOAD, s, r + 1, l.status, "MISSING_ETAG");
                        return u && u(), c.replaceAll(/['"]/g, "")
                    }, 3, e => 1e3 * 2 ** e)
                }),
                l = await Promise.all(d);
            return r && r(100), l
        }
        constructor() {
            (0, r._)(this, "assetsUploadApi", void 0), (0, r._)(this, "uploadStatusApi", void 0), (0, r._)(this, "multipartUploadApi", void 0);
            const e = (0, d.createClientConfiguration)("assets/user-auth", "bedev2");
            this.assetsUploadApi = new n.AssetApi(e), this.uploadStatusApi = new n.UploadStatusApi(e), this.multipartUploadApi = new n.MultipartUploadApi(e)
        }
    };
    e.s(["FieldMask", () => l, "default", 0, f], 968284)
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
    var I = e.i(272593);
    let g = new class {
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
            const e = (0, I.createClientConfiguration)("developer-products", "bedev2");
            this.developerProductsApi = new f(e), this.developerProductsV2Api = new h(e)
        }
    };
    e.s(["default", 0, g], 503725)
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
        I = e.i(272593),
        g = e.i(227987),
        P = ((t = {}).Month = "Month", t);
    let y = (0, I.createClientConfiguration)("publish", "bedev1"),
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
                let e = await (0, g.default)(t);
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
                return await S.v1AssetQuotasGet({
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
                return await x.v1AssetsAssetIdMediaGet({
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
                return await x.v1AssetsAssetIdMediaPost({
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
                await x.v1AssetsAssetIdMediaMediaAssetIdDelete({
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
                await x.v1AssetsAssetIdMediaOrderPost({
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
        I = e.i(255382),
        g = e.i(392782),
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
    }, w = async e => await I.default.getAssetPermissions(e), A = async (e, t) => await I.default.batchCheckAssetPermissions(t.map(t => ({
        assetId: e,
        subject: m.SubjectType.Universe,
        subjectId: t.toString(),
        permissionType: m.AssetConsumerAction.Use
    }))), S = async (e, t) => {
        var s, r, i, n;
        let a = await I.default.batchCheckAssetPermissions([{
            assetId: t,
            subject: m.SubjectType.User,
            subjectId: e.toString(),
            permissionType: m.AssetConsumerAction.Edit
        }]);
        if (!a || a.length < 1 || a[0].error) throw Error(null != (r = null == a || null == (n = a[0]) || null == (i = n.error) ? void 0 : i.message) ? r : "Something went wrong fetching asset edit permissions");
        return (null == (s = a[0].value) ? void 0 : s.status) === m.ApiPermissionStatus.HasPermission
    }, R = async e => {
        if (0 === e.length) return null;
        let t = await g.default.getDetails(e);
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
        } = e, [h, f] = (0, r.useState)(!0), [I, g] = (0, r.useState)(void 0), [P, y] = (0, r.useState)(null), {
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
        }, [A, R]), [T, E] = (0, r.useState)(null);
        (0, r.useEffect)(() => {
            w.enableAudioUploadRevamp && x && (null == P ? void 0 : P.type) === l.Asset.Audio && o.default.getAsset(x, [o.FieldMask.ICON]).then(e => {
                if (e.icon) {
                    let t = parseInt(e.icon.replace("assets/", ""), 10);
                    Number.isNaN(t) || E(t)
                }
            })
        }, [x, null == P ? void 0 : P.type, w.enableAudioUploadRevamp]);
        let q = null != (t = null != T ? T : x) ? t : 0,
            {
                thumbnailImage: U,
                refreshThumbnail: D
            } = (0, p.default)({
                targetId: q,
                targetType: n.ThumbnailTypes.assetThumbnail,
                fontColor: "dark",
                returnPolicy: n.ReturnPolicy.PlaceHolder
            }),
            O = (0, r.useCallback)(e => {
                var t, s;
                let r = Object.values(l.Asset),
                    i = e.type && r.includes(e.type);
                return e.id && i && e.name && (null == (t = e.creator) ? void 0 : t.targetId) && (null == (s = e.creator) ? void 0 : s.type) && void 0 !== e.enableComments && void 0 !== e.isCopyingAllowed
            }, []),
            B = (0, r.useCallback)(async (e, t) => {
                f(!0);
                let [s, r] = await Promise.allSettled([u.default.getAssetDetails([e]), S(t, e)]);
                if (s.status === d.AllSettlePromiseSuccess && r.status === d.AllSettlePromiseSuccess) {
                    var i, n, a, o, p, v, m, h;
                    let e = null == (i = s.value.data) ? void 0 : i[0];
                    if (e && O(e)) {
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
                    g(r.value)
                } else y(null);
                f(!1)
            }, [O]),
            L = (0, r.useCallback)(async function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                if (e && D(), x && (null == b ? void 0 : b.id)) return B(x, b.id)
            }, [b, x, B, D]);
        (0, r.useEffect)(() => {
            L()
        }, [L]);
        let G = (0, r.useMemo)(() => ({
            canConfigureDeveloperItem: I,
            developerItemId: x,
            iconAssetId: T,
            isLoadingDeveloperItem: h,
            developerItemDetails: P,
            refreshDeveloperItemDetails: L,
            developerItemImage: U,
            updateIconAssetId: E
        }), [I, P, x, T, h, L, U]);
        return (0, s.jsx)(C.Provider, {
            value: G,
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
            data: I,
            isLoading: g
        } = (0, r.useGetGamePassBonusOptIn)({
            universeId: c,
            gamePassId: p
        }, {
            enabled: v
        }), P = h || g;
        return (0, t.jsx)(d.Provider, {
            value: (0, s.useMemo)(() => ({
                passDetails: m,
                passPromotionsStatus: I,
                isPassLoading: P,
                isPassDetailsRefetching: f
            }), [m, I, P, f]),
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
            alt: I,
            fontColor: g = "light",
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
        } = v("light" !== g)(), {
            translate: C
        } = (0, r.useTranslation)(), [T, E] = (0, s.useState)(!1), [q, U] = (0, s.useState)(), D = (0, s.useCallback)(async function(e, t, s) {
            let r = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
            if (t && e) {
                E(!0);
                try {
                    let n = r ? i.ThumbnailClient.reloadThumbnailImage : i.ThumbnailClient.getThumbnailImage,
                        a = await n(e, t, s);
                    U(a)
                } catch (e) {
                    U({
                        state: n.ThumbnailResponseState.TemporarilyUnavailable
                    })
                } finally {
                    E(!1)
                }
            }
        }, []), O = (0, s.useMemo)(() => {
            if (T) return (0, t.jsx)(l.Skeleton, {
                classes: {
                    root: x
                },
                variant: "rectangular",
                animate: !0
            });
            let e = "",
                s = null;
            switch (null == q ? void 0 : q.state) {
                case n.ThumbnailResponseState.InReview:
                    e = C("Label.InReview"), s = (0, t.jsx)(u.HourglassEmptyIcon, {
                        fontSize: "large",
                        color: "dark" === g ? void 0 : "secondary"
                    });
                    break;
                case n.ThumbnailResponseState.Blocked:
                    e = C("Label.Moderated"), s = (0, t.jsx)(d.NotInterested, {
                        fontSize: "large",
                        color: "dark" === g ? void 0 : "secondary"
                    });
                    break;
                case n.ThumbnailResponseState.Error:
                case n.ThumbnailResponseState.TemporarilyUnavailable:
                    e = C("Label.Unavailable"), s = (0, t.jsx)(a.BrokenImageOutlinedIcon, {
                        fontSize: "large",
                        color: "dark" === g ? void 0 : "secondary"
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
        }, [T, null == q ? void 0 : q.state, y, f, b, x, C, g]);
        return (0, s.useEffect)(() => {
            D(m, p, h)
        }, [p, m, h, D]), {
            thumbnailImage: (0, t.jsx)(o.Grid, {
                item: !0,
                container: !0,
                XSmall: 12,
                justifyContent: "center",
                alignItems: "center",
                children: (0, t.jsxs)("div", {
                    className: A,
                    children: [(null == q ? void 0 : q.state) === n.ThumbnailResponseState.Completed ? (0, t.jsx)("img", {
                        className: S,
                        src: null == q ? void 0 : q.imageUrl,
                        alt: I
                    }) : (0, t.jsx)("div", {
                        className: w,
                        children: O
                    }), P ? (0, t.jsx)("div", {
                        className: R,
                        children: P
                    }) : null]
                })
            }),
            thumbnailData: q,
            refreshThumbnail: (0, s.useCallback)(async () => D(m, p, h, !0), [D, m, p, h])
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
        I = e.i(251622),
        g = e.i(692587),
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
            passId: E,
            groupId: q,
            assetId: U,
            bundleId: D,
            experienceSubscriptionId: O,
            lookId: B,
            developerItemDetails: L,
            experimentId: G,
            environmentId: k
        } = function() {
            var e, r, w, A, S, R, x, C, T, E, q, U;
            let {
                translate: D
            } = (0, s.useTranslation)(), {
                gameDetails: O,
                isLoadingGame: B
            } = (0, P.useCurrentGame)(), {
                isLoadingItem: L,
                marketplaceItemDetails: G
            } = (0, c.default)(), {
                badgeDetails: k
            } = (0, a.default)(), {
                developerProductDetails: N
            } = (0, u.useCurrentDeveloperProduct)(), {
                passDetails: M
            } = (0, v.useCurrentPass)(), {
                lookDetail: F,
                isLoadingLook: _
            } = (0, p.default)(), {
                placeDetails: V
            } = (0, m.default)(), {
                eventDetails: j,
                isLoading: z
            } = (0, d.default)(), {
                developerItemDetails: H,
                isLoadingDeveloperItem: J
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
            } = (0, g.default)(W), er = (0, t.useMemo)(() => {
                var e, t;
                return (null == O || null == (e = O.creator) ? void 0 : e.type) === "Group" ? null == O || null == (t = O.creator) ? void 0 : t.id : void 0
            }, [O]), ei = (0, t.useMemo)(() => {
                var e, t, s, r;
                if (null == G || null == (t = G.item) || null == (e = t.marketplaceItemDetails) ? void 0 : e.assetDetails) return null == G || null == (r = G.item) || null == (s = r.id) ? void 0 : s.toString()
            }, [G]), en = (0, t.useMemo)(() => {
                var e;
                return null == M || null == (e = M.gamePassId) ? void 0 : e.toString()
            }, [M]), ea = (0, t.useMemo)(() => {
                var e, t, s, r;
                if (null == G || null == (t = G.item) || null == (e = t.marketplaceItemDetails) ? void 0 : e.bundleDetails) return null == G || null == (r = G.item) || null == (s = r.id) ? void 0 : s.toString()
            }, [G]), eo = (0, t.useMemo)(() => {
                var e;
                return null != (e = null == K ? void 0 : K.id) ? e : void 0
            }, [K]), eu = (0, t.useMemo)(() => {
                var e, t, s, r, i;
                return (null == G || null == (t = G.item) || null == (e = t.creator) ? void 0 : e.kindCase) === 2 ? null == G || null == (i = G.item) || null == (r = i.creator) || null == (s = r.group) ? void 0 : s.groupId : er
            }, [er, null == G || null == (w = G.item) || null == (r = w.creator) || null == (e = r.group) ? void 0 : e.groupId, null == G || null == (S = G.item) || null == (A = S.creator) ? void 0 : A.kindCase]), ed = (0, t.useMemo)(() => null == F ? void 0 : F.lookId, [F]), el = (0, t.useMemo)(() => {
                var e, t, s, r, i, n, a;
                return {
                    [b.default.Bundle]: null == G || null == (n = G.item) ? void 0 : n.name,
                    [b.default.Games]: null == O ? void 0 : O.name,
                    [b.default.Badge]: null == k ? void 0 : k.name,
                    [b.default.DeveloperProduct]: null != (e = null == N ? void 0 : N.name) ? e : void 0,
                    [b.default.GamePass]: null != (t = null == M ? void 0 : M.name) ? t : void 0,
                    [b.default.Catalog]: null == G || null == (a = G.item) ? void 0 : a.name,
                    [b.default.Places]: null == V ? void 0 : V.name,
                    [b.default.Event]: null != (s = null == j ? void 0 : j.title) ? s : void 0,
                    [b.default.CreatorStore]: null == H ? void 0 : H.name,
                    [b.default.Category]: $ ? D("Label.Category".concat($)) : void 0,
                    [b.default.ExperienceSubscription]: null != (r = null == K ? void 0 : K.name) ? r : void 0,
                    [b.default.Look]: null != (i = null == F ? void 0 : F.name) ? i : void 0,
                    ...Q
                }
            }, [null == G || null == (R = G.item) ? void 0 : R.name, null == O ? void 0 : O.name, null == k ? void 0 : k.name, null == N ? void 0 : N.name, null == M ? void 0 : M.name, null == V ? void 0 : V.name, null == j ? void 0 : j.title, null == H ? void 0 : H.name, $, D, null == K ? void 0 : K.name, null == F ? void 0 : F.name, Q]), ec = (0, t.useMemo)(() => Y.includes(b.default.ExperienceSubscription) ? h.Item.ExperienceSubscription : Y.includes(b.default.Badge) ? h.Item.Badge : Y.includes(b.default.ReferralRewards) ? h.Item.ReferralRewards : Y.includes(b.default.Bundle) ? h.Item.Bundle : Y.includes(b.default.GamePass) ? h.Item.GamePass : Y.includes(b.default.DeveloperProduct) ? h.Item.DeveloperProduct : Y.includes(b.default.Catalog) ? h.Item.CatalogAsset : Y.includes(b.default.CreatorStore) ? h.Item.LibraryAsset : Y.includes(b.default.Places) ? h.Item.Places : Y.includes(b.default.Environments) ? h.Item.Environment : Y.includes(b.default.Alerts) ? h.Item.Alert : Y.includes(b.default.Event) ? h.Item.Event : Y.includes(b.default.Notifications) ? h.Item.Notifications : Y.includes(b.default.AssociatedItems) && "string" == typeof ee && (0, I.isItem)(ee) ? ee : Y.includes(b.default.AvatarCreationTokens) ? h.Item.AvatarCreationToken : Y.includes(b.default.Experiences) ? h.Item.Game : Y.includes(b.default.Advanced) ? h.Item.Advanced : Y.includes(b.default.Look) ? h.Item.Look : void 0, [ee, Y]), {
                currentItemGroupId: ep,
                isCurrentItemLoading: ev
            } = (0, t.useMemo)(() => {
                var e, t, s, r, i, a;
                return ec === h.Item.Bundle || ec === h.Item.CatalogAsset ? {
                    currentItemGroupId: null != eu ? eu : er,
                    isCurrentItemLoading: L
                } : ec === h.Item.DeveloperProduct || ec === h.Item.LibraryAsset ? {
                    currentItemGroupId: (null == H || null == (e = H.creator) ? void 0 : e.type) === f.default.Group ? null == H || null == (t = H.creator) ? void 0 : t.id : er,
                    isCurrentItemLoading: J
                } : ec === h.Item.Event ? {
                    currentItemGroupId: (null == j || null == (s = j.host) ? void 0 : s.hostType) === n.HostType.Group ? null == j || null == (r = j.host) ? void 0 : r.hostId : er,
                    isCurrentItemLoading: z
                } : ec === h.Item.Look ? {
                    currentItemGroupId: (null == F || null == (i = F.curator) ? void 0 : i.type) === f.default.Group ? null == F || null == (a = F.curator) ? void 0 : a.id : er,
                    isCurrentItemLoading: _
                } : {
                    currentItemGroupId: er,
                    isCurrentItemLoading: B
                }
            }, [ec, eu, er, L, null == H || null == (x = H.creator) ? void 0 : x.type, null == H || null == (C = H.creator) ? void 0 : C.id, J, null == j || null == (T = j.host) ? void 0 : T.hostType, null == j || null == (E = j.host) ? void 0 : E.hostId, z, B, null == F || null == (q = F.curator) ? void 0 : q.type, null == F || null == (U = F.curator) ? void 0 : U.id, _]);
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
                developerItemDetails: H,
                experimentId: et,
                environmentId: es
            }
        }(), N = (0, t.useMemo)(() => ({
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
                    passId: E,
                    groupId: null != (e = null == q ? void 0 : q.toString()) ? e : R ? R.toString() : void 0,
                    assetId: U,
                    bundleId: D,
                    developerItemId: null != (t = null == L ? void 0 : L.id) ? t : void 0,
                    associatedItemType: S,
                    experienceSubscriptionId: O,
                    environmentId: null != k ? k : void 0,
                    experimentId: null != G ? G : void 0,
                    lookId: null != B ? B : void 0
                }
            }, [C, T, E, q, R, U, D, null == L ? void 0 : L.id, S, O, k, G, B]),
            displayNameParam: N,
            currentItemType: S,
            currentItemGroupId: R,
            isCurrentItemLoading: x
        }
    }], 509049)
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
}, 408068, (e, t, s) => {
    var r = e.i(2226);
    ! function() {
        "use strict";
        var s = "input is invalid type",
            i = "object" == typeof window,
            n = i ? window : {};
        n.JS_MD5_NO_WINDOW && (i = !1);
        var a = !i && "object" == typeof self,
            o = !n.JS_MD5_NO_NODE_JS && "object" == typeof r.default && r.default.versions && r.default.versions.node;
        o ? n = e.g : a && (n = self);
        var u, d = !n.JS_MD5_NO_COMMON_JS && t.exports,
            l = "function" == typeof define && define.amd,
            c = !n.JS_MD5_NO_ARRAY_BUFFER && "u" > typeof ArrayBuffer,
            p = "0123456789abcdef".split(""),
            v = [128, 32768, 8388608, -0x80000000],
            m = [0, 8, 16, 24],
            h = ["hex", "array", "digest", "buffer", "arrayBuffer", "base64"],
            f = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".split(""),
            I = [];
        if (c) {
            var g = new ArrayBuffer(68);
            u = new Uint8Array(g), I = new Uint32Array(g)
        }
        var P = Array.isArray;
        (n.JS_MD5_NO_NODE_JS || !P) && (P = function(e) {
            return "[object Array]" === Object.prototype.toString.call(e)
        });
        var y = ArrayBuffer.isView;
        c && (n.JS_MD5_NO_ARRAY_BUFFER_IS_VIEW || !y) && (y = function(e) {
            return "object" == typeof e && e.buffer && e.buffer.constructor === ArrayBuffer
        });
        var b = function(e) {
                var t = typeof e;
                if ("string" === t) return [e, !0];
                if ("object" !== t || null === e) throw Error(s);
                if (c && e.constructor === ArrayBuffer) return [new Uint8Array(e), !1];
                if (!P(e) && !y(e)) throw Error(s);
                return [e, !1]
            },
            w = function(e) {
                return function(t) {
                    return new R(!0).update(t)[e]()
                }
            },
            A = function(e) {
                var t, r = {},
                    i = void 0;
                return t = i.from && !n.JS_MD5_NO_BUFFER_FROM ? i.from : function(e) {
                        return new i(e)
                    },
                    function(n) {
                        if ("string" == typeof n) return r.createHash("md5").update(n, "utf8").digest("hex");
                        if (null == n) throw Error(s);
                        return n.constructor === ArrayBuffer && (n = new Uint8Array(n)), P(n) || y(n) || n.constructor === i ? r.createHash("md5").update(t(n)).digest("hex") : e(n)
                    }
            },
            S = function(e) {
                return function(t, s) {
                    return new x(t, !0).update(s)[e]()
                }
            };

        function R(e) {
            if (e) I[0] = I[16] = I[1] = I[2] = I[3] = I[4] = I[5] = I[6] = I[7] = I[8] = I[9] = I[10] = I[11] = I[12] = I[13] = I[14] = I[15] = 0, this.blocks = I, this.buffer8 = u;
            else if (c) {
                var t = new ArrayBuffer(68);
                this.buffer8 = new Uint8Array(t), this.blocks = new Uint32Array(t)
            } else this.blocks = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            this.h0 = this.h1 = this.h2 = this.h3 = this.start = this.bytes = this.hBytes = 0, this.finalized = this.hashed = !1, this.first = !0
        }

        function x(e, t) {
            var s, r = b(e);
            if (e = r[0], r[1]) {
                var i, n = [],
                    a = e.length,
                    o = 0;
                for (s = 0; s < a; ++s)(i = e.charCodeAt(s)) < 128 ? n[o++] = i : (i < 2048 ? n[o++] = 192 | i >>> 6 : (i < 55296 || i >= 57344 ? n[o++] = 224 | i >>> 12 : (i = 65536 + ((1023 & i) << 10 | 1023 & e.charCodeAt(++s)), n[o++] = 240 | i >>> 18, n[o++] = 128 | i >>> 12 & 63), n[o++] = 128 | i >>> 6 & 63), n[o++] = 128 | 63 & i);
                e = n
            }
            e.length > 64 && (e = new R(!0).update(e).array());
            var u = [],
                d = [];
            for (s = 0; s < 64; ++s) {
                var l = e[s] || 0;
                u[s] = 92 ^ l, d[s] = 54 ^ l
            }
            R.call(this, t), this.update(d), this.oKeyPad = u, this.inner = !0, this.sharedMemory = t
        }
        R.prototype.update = function(e) {
            if (this.finalized) throw Error("finalize already called");
            var t = b(e);
            e = t[0];
            for (var s, r, i = t[1], n = 0, a = e.length, o = this.blocks, u = this.buffer8; n < a;) {
                if (this.hashed && (this.hashed = !1, o[0] = o[16], o[16] = o[1] = o[2] = o[3] = o[4] = o[5] = o[6] = o[7] = o[8] = o[9] = o[10] = o[11] = o[12] = o[13] = o[14] = o[15] = 0), i)
                    if (c)
                        for (r = this.start; n < a && r < 64; ++n)(s = e.charCodeAt(n)) < 128 ? u[r++] = s : (s < 2048 ? u[r++] = 192 | s >>> 6 : (s < 55296 || s >= 57344 ? u[r++] = 224 | s >>> 12 : (s = 65536 + ((1023 & s) << 10 | 1023 & e.charCodeAt(++n)), u[r++] = 240 | s >>> 18, u[r++] = 128 | s >>> 12 & 63), u[r++] = 128 | s >>> 6 & 63), u[r++] = 128 | 63 & s);
                    else
                        for (r = this.start; n < a && r < 64; ++n)(s = e.charCodeAt(n)) < 128 ? o[r >>> 2] |= s << m[3 & r++] : (s < 2048 ? o[r >>> 2] |= (192 | s >>> 6) << m[3 & r++] : (s < 55296 || s >= 57344 ? o[r >>> 2] |= (224 | s >>> 12) << m[3 & r++] : (s = 65536 + ((1023 & s) << 10 | 1023 & e.charCodeAt(++n)), o[r >>> 2] |= (240 | s >>> 18) << m[3 & r++], o[r >>> 2] |= (128 | s >>> 12 & 63) << m[3 & r++]), o[r >>> 2] |= (128 | s >>> 6 & 63) << m[3 & r++]), o[r >>> 2] |= (128 | 63 & s) << m[3 & r++]);
                else if (c)
                    for (r = this.start; n < a && r < 64; ++n) u[r++] = e[n];
                else
                    for (r = this.start; n < a && r < 64; ++n) o[r >>> 2] |= e[n] << m[3 & r++];
                this.lastByteIndex = r, this.bytes += r - this.start, r >= 64 ? (this.start = r - 64, this.hash(), this.hashed = !0) : this.start = r
            }
            return this.bytes > 0xffffffff && (this.hBytes += this.bytes / 0x100000000 | 0, this.bytes = this.bytes % 0x100000000), this
        }, R.prototype.finalize = function() {
            if (!this.finalized) {
                this.finalized = !0;
                var e = this.blocks,
                    t = this.lastByteIndex;
                e[t >>> 2] |= v[3 & t], t >= 56 && (this.hashed || this.hash(), e[0] = e[16], e[16] = e[1] = e[2] = e[3] = e[4] = e[5] = e[6] = e[7] = e[8] = e[9] = e[10] = e[11] = e[12] = e[13] = e[14] = e[15] = 0), e[14] = this.bytes << 3, e[15] = this.hBytes << 3 | this.bytes >>> 29, this.hash()
            }
        }, R.prototype.hash = function() {
            var e, t, s, r, i, n, a = this.blocks;
            this.first ? (s = ((s = (-0x10325477 ^ (r = ((r = (-0x67452302 ^ 0x77777777 & (e = ((e = a[0] - 0x28955b89) << 7 | e >>> 25) - 0x10325477 | 0)) + a[1] - 0x705f434) << 12 | r >>> 20) + e | 0) & (-0x10325477 ^ e)) + a[2] - 0x4324b227) << 17 | s >>> 15) + r | 0, t = ((t = (e ^ s & (r ^ e)) + a[3] - 0x4e748589) << 22 | t >>> 10) + s | 0) : (e = this.h0, t = this.h1, s = this.h2, e += ((r = this.h3) ^ t & (s ^ r)) + a[0] - 0x28955b88, r += (s ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ s)) + a[1] - 0x173848aa, s += (t ^ (r = (r << 12 | r >>> 20) + e | 0) & (e ^ t)) + a[2] + 0x242070db, t += (e ^ (s = (s << 17 | s >>> 15) + r | 0) & (r ^ e)) + a[3] - 0x3e423112, t = (t << 22 | t >>> 10) + s | 0), e += (r ^ t & (s ^ r)) + a[4] - 0xa83f051, r += (s ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ s)) + a[5] + 0x4787c62a, s += (t ^ (r = (r << 12 | r >>> 20) + e | 0) & (e ^ t)) + a[6] - 0x57cfb9ed, t += (e ^ (s = (s << 17 | s >>> 15) + r | 0) & (r ^ e)) + a[7] - 0x2b96aff, e += (r ^ (t = (t << 22 | t >>> 10) + s | 0) & (s ^ r)) + a[8] + 0x698098d8, r += (s ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ s)) + a[9] - 0x74bb0851, s += (t ^ (r = (r << 12 | r >>> 20) + e | 0) & (e ^ t)) + a[10] - 42063, t += (e ^ (s = (s << 17 | s >>> 15) + r | 0) & (r ^ e)) + a[11] - 0x76a32842, e += (r ^ (t = (t << 22 | t >>> 10) + s | 0) & (s ^ r)) + a[12] + 0x6b901122, r += (s ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ s)) + a[13] - 0x2678e6d, s += (t ^ (r = (r << 12 | r >>> 20) + e | 0) & (e ^ t)) + a[14] - 0x5986bc72, t += (e ^ (s = (s << 17 | s >>> 15) + r | 0) & (r ^ e)) + a[15] + 0x49b40821, t = (t << 22 | t >>> 10) + s | 0, e += (s ^ r & (t ^ s)) + a[1] - 0x9e1da9e, e = (e << 5 | e >>> 27) + t | 0, r += (t ^ s & (e ^ t)) + a[6] - 0x3fbf4cc0, r = (r << 9 | r >>> 23) + e | 0, s += (e ^ t & (r ^ e)) + a[11] + 0x265e5a51, s = (s << 14 | s >>> 18) + r | 0, t += (r ^ e & (s ^ r)) + a[0] - 0x16493856, t = (t << 20 | t >>> 12) + s | 0, e += (s ^ r & (t ^ s)) + a[5] - 0x29d0efa3, e = (e << 5 | e >>> 27) + t | 0, r += (t ^ s & (e ^ t)) + a[10] + 0x2441453, r = (r << 9 | r >>> 23) + e | 0, s += (e ^ t & (r ^ e)) + a[15] - 0x275e197f, s = (s << 14 | s >>> 18) + r | 0, t += (r ^ e & (s ^ r)) + a[4] - 0x182c0438, t = (t << 20 | t >>> 12) + s | 0, e += (s ^ r & (t ^ s)) + a[9] + 0x21e1cde6, e = (e << 5 | e >>> 27) + t | 0, r += (t ^ s & (e ^ t)) + a[14] - 0x3cc8f82a, r = (r << 9 | r >>> 23) + e | 0, s += (e ^ t & (r ^ e)) + a[3] - 0xb2af279, s = (s << 14 | s >>> 18) + r | 0, t += (r ^ e & (s ^ r)) + a[8] + 0x455a14ed, t = (t << 20 | t >>> 12) + s | 0, e += (s ^ r & (t ^ s)) + a[13] - 0x561c16fb, e = (e << 5 | e >>> 27) + t | 0, r += (t ^ s & (e ^ t)) + a[2] - 0x3105c08, r = (r << 9 | r >>> 23) + e | 0, s += (e ^ t & (r ^ e)) + a[7] + 0x676f02d9, s = (s << 14 | s >>> 18) + r | 0, t += (r ^ e & (s ^ r)) + a[12] - 0x72d5b376, e += ((i = (t = (t << 20 | t >>> 12) + s | 0) ^ s) ^ r) + a[5] - 378558, r += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + a[8] - 0x788e097f, s += ((n = (r = (r << 11 | r >>> 21) + e | 0) ^ e) ^ t) + a[11] + 0x6d9d6122, t += (n ^ (s = (s << 16 | s >>> 16) + r | 0)) + a[14] - 0x21ac7f4, e += ((i = (t = (t << 23 | t >>> 9) + s | 0) ^ s) ^ r) + a[1] - 0x5b4115bc, r += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + a[4] + 0x4bdecfa9, s += ((n = (r = (r << 11 | r >>> 21) + e | 0) ^ e) ^ t) + a[7] - 0x944b4a0, t += (n ^ (s = (s << 16 | s >>> 16) + r | 0)) + a[10] - 0x41404390, e += ((i = (t = (t << 23 | t >>> 9) + s | 0) ^ s) ^ r) + a[13] + 0x289b7ec6, r += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + a[0] - 0x155ed806, s += ((n = (r = (r << 11 | r >>> 21) + e | 0) ^ e) ^ t) + a[3] - 0x2b10cf7b, t += (n ^ (s = (s << 16 | s >>> 16) + r | 0)) + a[6] + 0x4881d05, e += ((i = (t = (t << 23 | t >>> 9) + s | 0) ^ s) ^ r) + a[9] - 0x262b2fc7, r += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + a[12] - 0x1924661b, s += ((n = (r = (r << 11 | r >>> 21) + e | 0) ^ e) ^ t) + a[15] + 0x1fa27cf8, t += (n ^ (s = (s << 16 | s >>> 16) + r | 0)) + a[2] - 0x3b53a99b, t = (t << 23 | t >>> 9) + s | 0, e += (s ^ (t | ~r)) + a[0] - 0xbd6ddbc, e = (e << 6 | e >>> 26) + t | 0, r += (t ^ (e | ~s)) + a[7] + 0x432aff97, r = (r << 10 | r >>> 22) + e | 0, s += (e ^ (r | ~t)) + a[14] - 0x546bdc59, s = (s << 15 | s >>> 17) + r | 0, t += (r ^ (s | ~e)) + a[5] - 0x36c5fc7, t = (t << 21 | t >>> 11) + s | 0, e += (s ^ (t | ~r)) + a[12] + 0x655b59c3, e = (e << 6 | e >>> 26) + t | 0, r += (t ^ (e | ~s)) + a[3] - 0x70f3336e, r = (r << 10 | r >>> 22) + e | 0, s += (e ^ (r | ~t)) + a[10] - 1051523, s = (s << 15 | s >>> 17) + r | 0, t += (r ^ (s | ~e)) + a[1] - 0x7a7ba22f, t = (t << 21 | t >>> 11) + s | 0, e += (s ^ (t | ~r)) + a[8] + 0x6fa87e4f, e = (e << 6 | e >>> 26) + t | 0, r += (t ^ (e | ~s)) + a[15] - 0x1d31920, r = (r << 10 | r >>> 22) + e | 0, s += (e ^ (r | ~t)) + a[6] - 0x5cfebcec, s = (s << 15 | s >>> 17) + r | 0, t += (r ^ (s | ~e)) + a[13] + 0x4e0811a1, t = (t << 21 | t >>> 11) + s | 0, e += (s ^ (t | ~r)) + a[4] - 0x8ac817e, e = (e << 6 | e >>> 26) + t | 0, r += (t ^ (e | ~s)) + a[11] - 0x42c50dcb, r = (r << 10 | r >>> 22) + e | 0, s += (e ^ (r | ~t)) + a[2] + 0x2ad7d2bb, s = (s << 15 | s >>> 17) + r | 0, t += (r ^ (s | ~e)) + a[9] - 0x14792c6f, t = (t << 21 | t >>> 11) + s | 0, this.first ? (this.h0 = e + 0x67452301 | 0, this.h1 = t - 0x10325477 | 0, this.h2 = s - 0x67452302 | 0, this.h3 = r + 0x10325476 | 0, this.first = !1) : (this.h0 = this.h0 + e | 0, this.h1 = this.h1 + t | 0, this.h2 = this.h2 + s | 0, this.h3 = this.h3 + r | 0)
        }, R.prototype.hex = function() {
            this.finalize();
            var e = this.h0,
                t = this.h1,
                s = this.h2,
                r = this.h3;
            return p[e >>> 4 & 15] + p[15 & e] + p[e >>> 12 & 15] + p[e >>> 8 & 15] + p[e >>> 20 & 15] + p[e >>> 16 & 15] + p[e >>> 28 & 15] + p[e >>> 24 & 15] + p[t >>> 4 & 15] + p[15 & t] + p[t >>> 12 & 15] + p[t >>> 8 & 15] + p[t >>> 20 & 15] + p[t >>> 16 & 15] + p[t >>> 28 & 15] + p[t >>> 24 & 15] + p[s >>> 4 & 15] + p[15 & s] + p[s >>> 12 & 15] + p[s >>> 8 & 15] + p[s >>> 20 & 15] + p[s >>> 16 & 15] + p[s >>> 28 & 15] + p[s >>> 24 & 15] + p[r >>> 4 & 15] + p[15 & r] + p[r >>> 12 & 15] + p[r >>> 8 & 15] + p[r >>> 20 & 15] + p[r >>> 16 & 15] + p[r >>> 28 & 15] + p[r >>> 24 & 15]
        }, R.prototype.toString = R.prototype.hex, R.prototype.digest = function() {
            this.finalize();
            var e = this.h0,
                t = this.h1,
                s = this.h2,
                r = this.h3;
            return [255 & e, e >>> 8 & 255, e >>> 16 & 255, e >>> 24 & 255, 255 & t, t >>> 8 & 255, t >>> 16 & 255, t >>> 24 & 255, 255 & s, s >>> 8 & 255, s >>> 16 & 255, s >>> 24 & 255, 255 & r, r >>> 8 & 255, r >>> 16 & 255, r >>> 24 & 255]
        }, R.prototype.array = R.prototype.digest, R.prototype.arrayBuffer = function() {
            this.finalize();
            var e = new ArrayBuffer(16),
                t = new Uint32Array(e);
            return t[0] = this.h0, t[1] = this.h1, t[2] = this.h2, t[3] = this.h3, e
        }, R.prototype.buffer = R.prototype.arrayBuffer, R.prototype.base64 = function() {
            for (var e, t, s, r = "", i = this.array(), n = 0; n < 15;) e = i[n++], t = i[n++], s = i[n++], r += f[e >>> 2] + f[(e << 4 | t >>> 4) & 63] + f[(t << 2 | s >>> 6) & 63] + f[63 & s];
            return r + (f[(e = i[n]) >>> 2] + f[e << 4 & 63] + "==")
        }, x.prototype = new R, x.prototype.finalize = function() {
            if (R.prototype.finalize.call(this), this.inner) {
                this.inner = !1;
                var e = this.array();
                R.call(this, this.sharedMemory), this.update(this.oKeyPad), this.update(e), R.prototype.finalize.call(this)
            }
        };
        var C = function() {
            var e = w("hex");
            o && (e = A(e)), e.create = function() {
                return new R
            }, e.update = function(t) {
                return e.create().update(t)
            };
            for (var t = 0; t < h.length; ++t) {
                var s = h[t];
                e[s] = w(s)
            }
            return e
        }();
        if (C.md5 = C, C.md5.hmac = function() {
                var e = S("hex");
                e.create = function(e) {
                    return new x(e)
                }, e.update = function(t, s) {
                    return e.create(t).update(s)
                };
                for (var t = 0; t < h.length; ++t) {
                    var s = h[t];
                    e[s] = S(s)
                }
                return e
            }(), d) t.exports = C;
        else n.md5 = C, l && (e.r, void 0 !== C && e.v(C))
    }()
}]);

//# debugId=ca4f7c77-1fc2-bcc0-f6fe-29ea005ebfdd
//# sourceMappingURL=1m23-ct6xg37e.js.map