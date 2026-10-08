;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1adf35af-b4ad-85af-6982-d5637de79ee2")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 893416, 305357, e => {
    "use strict";
    var t = e.i(945146),
        n = e.i(690569),
        r = e.i(416340),
        i = e.i(251635),
        o = e.i(787802),
        a = e.i(221628),
        s = e.i(121880);

    function c(e) {
        return (0, n.g)("MuiCardContent", e)
    }(0, o.g)("MuiCardContent", ["root"]);
    let u = ["className", "component"],
        d = (0, i.s)("div", {
            name: "MuiCardContent",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })(() => ({
            padding: 16,
            "&:last-child": {
                paddingBottom: 24
            }
        })),
        l = r.forwardRef(function(e, r) {
            let o = (0, s.u)({
                    props: e,
                    name: "MuiCardContent"
                }),
                {
                    className: l,
                    component: v = "div"
                } = o,
                h = (0, n._)(o, u),
                p = (0, t._)({}, o, {
                    component: v
                }),
                m = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, i.a)({
                        root: ["root"]
                    }, c, t)
                })(p);
            return (0, a.jsx)(d, (0, t._)({
                as: v,
                className: (0, i.c)(m.root, l),
                ownerState: p,
                ref: r
            }, h))
        });
    e.s(["C", 0, l], 305357), e.s(["CardContent", 0, l], 893416)
}, 454242, e => {
    "use strict";
    var t = e.i(194250),
        n = e.i(416340),
        r = e.i(863605),
        i = e.i(154502),
        o = e.i(41445),
        a = e.i(304797);
    e.i(221628);
    var s = (0, r.default)({
            name: "Checkbox"
        })(function(e, t) {
            var n, r, i = t.size;
            return {
                root: {
                    width: "small" === i ? 20 : 42,
                    height: "small" === i ? 20 : 42
                },
                colorPrimary: ((n = {
                    color: e.palette.content.muted
                })["&.".concat(o.c.checked)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, n),
                colorSecondary: {
                    color: e.palette.actionV2.primary.fill
                },
                disabled: ((r = {
                    color: e.palette.states.disabled
                })["&.".concat(o.c.colorPrimary, ".").concat(o.c.checked)] = {
                    color: e.palette.states.disabled
                }, r)
            }
        }),
        c = (0, n.forwardRef)(function(e, r) {
            var o = e.color,
                c = void 0 === o ? "primary" : o,
                u = e.classes,
                d = e.className,
                l = (0, t.a)(e, ["color", "classes", "className"]),
                v = s(e, {
                    props: {
                        classes: (0, i.default)(u, d)
                    }
                });
            return n.default.createElement(a.M, (0, t._)({}, l, {
                ref: r,
                color: null != c ? c : "primary",
                classes: v.classes
            }))
        });
    e.s(["Checkbox", 0, c], 454242)
}, 429884, 599147, e => {
    "use strict";
    e.i(721281);
    var t, n, r, i = e.i(416340),
        o = e.i(677753),
        a = e.i(79187),
        s = e.i(697973),
        c = e.i(345886),
        u = e.i(623983),
        d = e.i(748893),
        l = e.i(406952);
    e.i(686762), e.i(116873), e.i(893416), e.i(670474), e.i(83265), e.i(226519), e.i(102725), e.i(668539), e.i(348148), e.i(454242), e.i(335681), e.i(976457);
    var v = function(e, t) {
        return (v = Object.setPrototypeOf || ({
            __proto__: []
        }) instanceof Array && function(e, t) {
            e.__proto__ = t
        } || function(e, t) {
            for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
        })(e, t)
    };

    function h(e, t, n, r) {
        return new(n || (n = Promise))(function(i, o) {
            function a(e) {
                try {
                    c(r.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                try {
                    c(r.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function c(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, s)
            }
            c((r = r.apply(e, t || [])).next())
        })
    }

    function p(e, t) {
        var n, r, i, o = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function s(s) {
            return function(c) {
                var u = [s, c];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, u[0] && (o = 0)), o;) try {
                    if (n = 1, r && (i = 2 & u[0] ? r.return : u[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, u[1])).done) return i;
                    switch (r = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                        case 0:
                        case 1:
                            i = u;
                            break;
                        case 4:
                            return o.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            o.label++, r = u[1], u = [0];
                            continue;
                        case 7:
                            u = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                o.label = u[1];
                                break
                            }
                            if (6 === u[0] && o.label < i[1]) {
                                o.label = i[1], i = u;
                                break
                            }
                            if (i && o.label < i[2]) {
                                o.label = i[2], o.ops.push(u);
                                break
                            }
                            i[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    u = t.call(e, o)
                } catch (e) {
                    u = [6, e], r = 0
                } finally {
                    n = i = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function m(e) {
        var t;
        return null == (t = e) ? t : {
            labelTranslationKey: (0, o.exists)(t, "labelTranslationKey") ? t.labelTranslationKey : void 0,
            utteranceText: (0, o.exists)(t, "utteranceText") ? t.utteranceText : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function f(e) {
        var t;
        return null == (t = e) ? t : {
            fieldId: t.field_id,
            required: (0, o.exists)(t, "required") ? t.required : void 0
        }
    }

    function b(e) {
        var t, n, r;
        return null == (t = e) ? t : {
            actionId: t.action_id,
            archivedAt: (0, o.exists)(t, "archived_at") ? t.archived_at : void 0,
            associatedEntityType: t.associated_entity_type,
            createdAt: (0, o.exists)(t, "created_at") ? t.created_at : void 0,
            description: t.description,
            fields: (0, o.mapValues)(t.fields, f),
            handler: null == (n = t.handler) ? n : {
                handlerType: n.handler_type,
                path: n.path
            },
            reversalHandler: (0, o.exists)(t, "reversal_handler") ? null == (r = t.reversal_handler) ? r : {
                handlerType: r.handler_type,
                path: r.path
            } : void 0,
            teamId: t.team_id,
            updatedAt: (0, o.exists)(t, "updated_at") ? t.updated_at : void 0,
            updatedBy: (0, o.exists)(t, "updated_by") ? t.updated_by : void 0
        }
    }
    var y = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            v(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(t, e), t.prototype.behaviorInterventionCreateInterventionWebhookRaw = function(e) {
            return h(this, void 0, void 0, function() {
                var t, n, r;
                return p(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/create-intervention-webhook",
                                schemaPath: "/v1/create-intervention-webhook",
                                method: "POST",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new o.JSONApiResponse(r)]
                    }
                })
            })
        }, t.prototype.behaviorInterventionCreateInterventionWebhook = function(e) {
            return h(this, void 0, void 0, function() {
                return p(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.behaviorInterventionCreateInterventionWebhookRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.behaviorInterventionDismissInterventionRaw = function(e) {
            return h(this, void 0, void 0, function() {
                var t, n, r;
                return p(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/dismiss-intervention",
                                schemaPath: "/v1/dismiss-intervention",
                                method: "POST",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new o.JSONApiResponse(r)]
                    }
                })
            })
        }, t.prototype.behaviorInterventionDismissIntervention = function(e) {
            return h(this, void 0, void 0, function() {
                return p(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.behaviorInterventionDismissInterventionRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.behaviorInterventionGetActionRaw = function(e, t) {
            return h(this, void 0, void 0, function() {
                var n, r, i;
                return p(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.accountId || void 0 === e.accountId) throw new o.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling behaviorInterventionGetAction.");
                            if (null === e.actionId || void 0 === e.actionId) throw new o.RequiredError("actionId", "Required parameter requestParameters.actionId was null or undefined when calling behaviorInterventionGetAction.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/accounts/{accountId}/action/{actionId}".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("actionId", "}"), encodeURIComponent(String(e.actionId))),
                                schemaPath: "/v1/accounts/{accountId}/action/{actionId}",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new o.JSONApiResponse(i, function(e) {
                                return b(e)
                            })]
                    }
                })
            })
        }, t.prototype.behaviorInterventionGetAction = function(e, t) {
            return h(this, void 0, void 0, function() {
                return p(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.behaviorInterventionGetActionRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.behaviorInterventionGetNotApprovedRaw = function(e, t) {
            return h(this, void 0, void 0, function() {
                var n, r, i;
                return p(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, void 0 !== e.abuseVector && (n.abuseVector = e.abuseVector), r = {}, [4, this.request({
                                path: "/v1/not-approved",
                                schemaPath: "/v1/not-approved",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new o.JSONApiResponse(i, function(e) {
                                var t, n, r;
                                return null == e ? e : {
                                    acknowledgeable: (0, o.exists)(e, "acknowledgeable") ? e.acknowledgeable : void 0,
                                    badUtterances: (0, o.exists)(e, "badUtterances") ? e.badUtterances.map(m) : void 0,
                                    beginDate: (0, o.exists)(e, "beginDate") ? new Date(e.beginDate) : void 0,
                                    consequenceTransparencyMessage: (0, o.exists)(e, "consequenceTransparencyMessage") ? e.consequenceTransparencyMessage : void 0,
                                    context: (0, o.exists)(e, "context") ? e.context : void 0,
                                    duration: (0, o.exists)(e, "duration") ? e.duration : void 0,
                                    endDate: (0, o.exists)(e, "endDate") ? new Date(e.endDate) : void 0,
                                    interventionId: (0, o.exists)(e, "interventionId") ? e.interventionId : void 0,
                                    isForeshadowingConsequenceEnabled: (0, o.exists)(e, "isForeshadowingConsequenceEnabled") ? e.isForeshadowingConsequenceEnabled : void 0,
                                    labelTranslationKey: (0, o.exists)(e, "labelTranslationKey") ? e.labelTranslationKey : void 0,
                                    messageToUser: (0, o.exists)(e, "messageToUser") ? e.messageToUser : void 0,
                                    punishedUserId: (0, o.exists)(e, "punishedUserId") ? e.punishedUserId : void 0,
                                    punishmentId: (0, o.exists)(e, "punishmentId") ? e.punishmentId : void 0,
                                    punishmentTypeDescription: (0, o.exists)(e, "punishmentTypeDescription") ? e.punishmentTypeDescription : void 0,
                                    showAppealsProcessLink: (0, o.exists)(e, "showAppealsProcessLink") ? e.showAppealsProcessLink : void 0,
                                    showUGCAvatarGuidelinesLink: (0, o.exists)(e, "showUGCAvatarGuidelinesLink") ? e.showUGCAvatarGuidelinesLink : void 0,
                                    verificationCategory: (0, o.exists)(e, "verificationCategory") ? e.verificationCategory : void 0,
                                    violation: (0, o.exists)(e, "violation") ? null == (t = e.violation) ? t : {
                                        abuseTypeTranslationKeys: (0, o.exists)(t, "abuseTypeTranslationKeys") ? t.abuseTypeTranslationKeys : void 0,
                                        evidence: (0, o.exists)(t, "evidence") ? null == (n = t.evidence) ? n : {
                                            displayMeta: (0, o.exists)(n, "displayMeta") ? null == (r = n.displayMeta) ? r : {
                                                capitalizedKey: (0, o.exists)(r, "capitalizedKey") ? r.capitalizedKey : void 0,
                                                icon: (0, o.exists)(r, "icon") ? r.icon : void 0,
                                                lowercaseKey: (0, o.exists)(r, "lowercaseKey") ? r.lowercaseKey : void 0
                                            } : void 0,
                                            elements: (0, o.exists)(n, "elements") ? n.elements : void 0,
                                            elementsObj: (0, o.exists)(n, "elementsObj") ? n.elementsObj : void 0,
                                            type: (0, o.exists)(n, "type") ? n.type : void 0
                                        } : void 0,
                                        uid: (0, o.exists)(t, "uid") ? t.uid : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.behaviorInterventionGetNotApproved = function() {
            return h(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), p(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.behaviorInterventionGetNotApprovedRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.behaviorInterventionGetReminderRaw = function(e) {
            return h(this, void 0, void 0, function() {
                var t, n, r;
                return p(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/reminder",
                                schemaPath: "/v1/reminder",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new o.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    contentVariant: (0, o.exists)(e, "contentVariant") ? e.contentVariant : void 0,
                                    experimentVariant: (0, o.exists)(e, "experimentVariant") ? e.experimentVariant : void 0,
                                    interventionId: (0, o.exists)(e, "interventionId") ? e.interventionId : void 0,
                                    policyViolation: (0, o.exists)(e, "policyViolation") ? e.policyViolation : void 0,
                                    reminderNumber: (0, o.exists)(e, "reminderNumber") ? e.reminderNumber : void 0,
                                    shouldSurfaceReminder: (0, o.exists)(e, "shouldSurfaceReminder") ? e.shouldSurfaceReminder : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.behaviorInterventionGetReminder = function(e) {
            return h(this, void 0, void 0, function() {
                return p(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.behaviorInterventionGetReminderRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.behaviorInterventionHealthCheckRaw = function(e) {
            return h(this, void 0, void 0, function() {
                var t, n, r;
                return p(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/health",
                                schemaPath: "/health",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), this.isJsonMime(r.headers.get("content-type")) ? [2, new o.JSONApiResponse(r)] : [2, new o.TextApiResponse(r)]
                    }
                })
            })
        }, t.prototype.behaviorInterventionHealthCheck = function(e) {
            return h(this, void 0, void 0, function() {
                return p(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.behaviorInterventionHealthCheckRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.behaviorInterventionInvalidateInterventionsWebhookRaw = function(e) {
            return h(this, void 0, void 0, function() {
                var t, n, r;
                return p(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/invalidate-interventions-webhook",
                                schemaPath: "/v1/invalidate-interventions-webhook",
                                method: "POST",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new o.JSONApiResponse(r)]
                    }
                })
            })
        }, t.prototype.behaviorInterventionInvalidateInterventionsWebhook = function(e) {
            return h(this, void 0, void 0, function() {
                return p(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.behaviorInterventionInvalidateInterventionsWebhookRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.behaviorInterventionListActionsRaw = function(e, t) {
            return h(this, void 0, void 0, function() {
                var n, r, i;
                return p(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.accountId || void 0 === e.accountId) throw new o.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling behaviorInterventionListActions.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/accounts/{accountId}/actions".replace("{".concat("accountId", "}"), encodeURIComponent(String(e.accountId))),
                                schemaPath: "/v1/accounts/{accountId}/actions",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new o.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    actions: (0, o.exists)(e, "actions") ? e.actions.map(b) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.behaviorInterventionListActions = function(e, t) {
            return h(this, void 0, void 0, function() {
                return p(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.behaviorInterventionListActionsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.behaviorInterventionListInterventionsRaw = function(e, t) {
            return h(this, void 0, void 0, function() {
                var n, r, i;
                return p(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.accountId || void 0 === e.accountId) throw new o.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling behaviorInterventionListInterventions.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/accounts/{account_id}/interventions".replace("{".concat("account_id", "}"), encodeURIComponent(String(e.accountId))),
                                schemaPath: "/v1/accounts/{account_id}/interventions",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new o.JSONApiResponse(i)]
                    }
                })
            })
        }, t.prototype.behaviorInterventionListInterventions = function(e, t) {
            return h(this, void 0, void 0, function() {
                return p(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.behaviorInterventionListInterventionsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.behaviorInterventionListUserInterventionsRaw = function(e, t) {
            return h(this, void 0, void 0, function() {
                var n, r, i;
                return p(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.accountId || void 0 === e.accountId) throw new o.RequiredError("accountId", "Required parameter requestParameters.accountId was null or undefined when calling behaviorInterventionListUserInterventions.");
                            if (null === e.userId || void 0 === e.userId) throw new o.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling behaviorInterventionListUserInterventions.");
                            if (null === e.pageSize || void 0 === e.pageSize) throw new o.RequiredError("pageSize", "Required parameter requestParameters.pageSize was null or undefined when calling behaviorInterventionListUserInterventions.");
                            return n = {}, void 0 !== e.pageSize && (n.page_size = e.pageSize), void 0 !== e.pageToken && (n.page_token = e.pageToken), void 0 !== e.includeDryRun && (n.include_dry_run = e.includeDryRun), r = {}, [4, this.request({
                                path: "/v1/accounts/{account_id}/interventions/robloxUsers/{user_id}".replace("{".concat("account_id", "}"), encodeURIComponent(String(e.accountId))).replace("{".concat("user_id", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/accounts/{account_id}/interventions/robloxUsers/{user_id}",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new o.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    interventions: (0, o.exists)(e, "interventions") ? e.interventions : void 0,
                                    nextPageToken: (0, o.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.behaviorInterventionListUserInterventions = function(e, t) {
            return h(this, void 0, void 0, function() {
                return p(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.behaviorInterventionListUserInterventionsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.behaviorInterventionNotApprovedReactivateRaw = function(e) {
            return h(this, void 0, void 0, function() {
                var t, n, r;
                return p(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/not-approved/reactivate",
                                schemaPath: "/v1/not-approved/reactivate",
                                method: "POST",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new o.JSONApiResponse(r)]
                    }
                })
            })
        }, t.prototype.behaviorInterventionNotApprovedReactivate = function(e) {
            return h(this, void 0, void 0, function() {
                return p(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.behaviorInterventionNotApprovedReactivateRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t
    }(o.BaseAPI);
    e.s(["BehaviorInterventionGetNotApprovedAbuseVectorEnum", 0, {
        Communication: "communication",
        ExperienceChat: "experience_chat",
        PartyChat: "party_chat",
        Economy: "economy",
        AvatarChange: "avatar_change",
        AgeVerification: "age_verification",
        Devex: "devex",
        Platform: "platform"
    }, "DefaultApi", 0, y], 599147);
    var I = e.i(438641);
    let w = ["https://users.roblox.com/v1/users/authenticated", "https://users.sitetest1.robloxlabs.com/v1/users/authenticated", "https://users.sitetest2.robloxlabs.com/v1/users/authenticated", "https://users.sitetest3.robloxlabs.com/v1/users/authenticated"],
        g = (0, s.makeStyles)()(() => ({
            background: {
                marginTop: 68,
                marginBottom: 68
            },
            button: {
                marginTop: 12
            }
        })),
        x = e => {
            let {
                src: t,
                onReload: n
            } = e, {
                translate: r
            } = (0, a.useTranslation)(), {
                classes: {
                    background: o,
                    button: s
                }
            } = g();
            return i.default.createElement(c.Grid, {
                container: !0,
                classes: {
                    root: o
                },
                direction: "column",
                alignItems: "center"
            }, i.default.createElement(c.Grid, {
                container: !0,
                item: !0,
                justifyContent: "center"
            }, i.default.createElement("img", {
                src: t,
                alt: "Error Illustration",
                width: "192px",
                height: "192px"
            })), i.default.createElement(c.Grid, {
                container: !0,
                item: !0,
                direction: "column",
                justifyContent: "center",
                alignItems: "center"
            }, i.default.createElement(u.Typography, {
                variant: "h6",
                align: "center"
            }, r("Heading.FailedToLoadPage")), i.default.createElement(u.Typography, {
                color: "secondary",
                align: "center"
            }, r("Message.FailedToLoadPage")), i.default.createElement(d.Button, {
                classes: {
                    root: s
                },
                variant: "outlined",
                color: "secondary",
                onClick: n
            }, r("Action.FailedToLoadPage"))))
        };

    function R(e) {
        let t = e.displayName || e.name || "Component",
            n = t => i.default.createElement(l.UIThemeProvider, null, i.default.createElement(e, t));
        return n.displayName = "withTheme(".concat(t, ")"), n
    }
    R(x);
    let T = (0, s.makeStyles)()(() => ({
            background: {
                marginTop: 68,
                marginBottom: 68
            }
        })),
        q = () => {
            let {
                translate: e
            } = (0, a.useTranslation)(), {
                classes: {
                    background: t
                }
            } = T();
            return i.default.createElement(c.Grid, {
                container: !0,
                classes: {
                    root: t
                },
                direction: "column",
                alignItems: "center"
            }, i.default.createElement(c.Grid, {
                container: !0,
                item: !0,
                justifyContent: "center"
            }, i.default.createElement("img", {
                src: "751a3e023908351b.png",
                alt: "Error Illustration",
                width: "192px",
                height: "192px"
            })), i.default.createElement(c.Grid, {
                container: !0,
                item: !0,
                direction: "column",
                justifyContent: "center",
                alignItems: "center"
            }, i.default.createElement(u.Typography, {
                variant: "h6",
                align: "center"
            }, e("Heading.AccessDenied")), i.default.createElement(u.Typography, {
                color: "secondary",
                align: "center"
            }, e("Description.AccessDenied"))))
        };
    R(q), (t = {})[t.Reactivate = 0] = "Reactivate", t[t.RobloxRedirect = 1] = "RobloxRedirect", t[t.RequestAppeal = 2] = "RequestAppeal", (n = {}).ModerationModalImpressionEvent = "moderationModalImpression", n.ModerationModalReactivateEvent = "moderationModalReactivate", n.ModerationModalLogoutEvent = "moderationModalLogout", (r = {}).Warn = "Warn", r.Delete = "Delete", r.Hour1 = "Ban 1 Hour", r.Hour6 = "Ban 6 Hours", r.Day1 = "Ban 1 Day", r.Day3 = "Ban 3 Days", r.Day7 = "Ban 7 Days", r.Day14 = "Ban 14 Days", r.Month6 = "Ban 6 Months", r.Year1 = "Ban 1 Year";
    let A = I.z.object({
            type: I.z.literal("platform"),
            displayMeta: I.z.optional(I.z.object({
                lowercaseKey: I.z.string().min(1),
                capitalizedKey: I.z.string().min(1),
                icon: I.z.string()
            })),
            elements: I.z.optional(I.z.array(I.z.unknown()))
        }),
        E = I.z.discriminatedUnion("type", [I.z.object({
            type: I.z.literal("text"),
            labelKey: I.z.string(),
            text: I.z.string()
        }), I.z.object({
            type: I.z.literal("image"),
            labelKey: I.z.string(),
            url: I.z.string(),
            altLabelKey: I.z.optional(I.z.string())
        })]);
    A.merge(I.z.object({
        elements: I.z.optional(I.z.array(E))
    })), (0, s.makeStyles)()(e => ({
        image: {
            maxWidth: 212,
            maxHeight: 212,
            borderRadius: 8
        },
        boldText: {
            fontWeight: e.typography.fontWeightBold
        },
        moderatorNote: {
            maxWidth: 900
        },
        alert: {
            marginLeft: 20,
            marginRight: 20
        }
    })), e.s(["AccessDeniedError", 0, q, "LoadError", 0, x, "useMaintenanceObserver", 0, e => {
        let t = t => {
            let {
                location: {
                    pathname: n
                }
            } = window;
            "/" !== n && "/landing" !== n && "/roadmap" !== n && "/maintenance" !== n && !n.startsWith("/docs") && w.includes(t) && window.location.replace("".concat(e, "/maintenance"))
        };
        return (0, i.useEffect)(() => (o.maintenanceMiddleware.subscribe(t), () => {
            o.maintenanceMiddleware.unsubscribe(t)
        }), []), null
    }], 429884)
}]);

//# debugId=1adf35af-b4ad-85af-6982-d5637de79ee2
//# sourceMappingURL=27xp2-9lepxm1.js.map