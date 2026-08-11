/*! For license information please see groupEvents.bundle.min.js.LICENSE.txt */ ! function() {
    var e = {
            4452: function(e, t) {
                var n;
                ! function() {
                    "use strict";
                    var r = {}.hasOwnProperty;

                    function o() {
                        for (var e = "", t = 0; t < arguments.length; t++) {
                            var n = arguments[t];
                            n && (e = i(e, a(n)))
                        }
                        return e
                    }

                    function a(e) {
                        if ("string" == typeof e || "number" == typeof e) return e;
                        if ("object" != typeof e) return "";
                        if (Array.isArray(e)) return o.apply(null, e);
                        if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                        var t = "";
                        for (var n in e) r.call(e, n) && e[n] && (t = i(t, n));
                        return t
                    }

                    function i(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (o.default = o, e.exports = o) : void 0 === (n = function() {
                        return o
                    }.apply(t, [])) || (e.exports = n)
                }()
            }
        },
        t = {};

    function n(r) {
        var o = t[r];
        if (void 0 !== o) return o.exports;
        var a = t[r] = {
            exports: {}
        };
        return e[r](a, a.exports, n), a.exports
    }
    n.n = function(e) {
            var t = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return n.d(t, {
                a: t
            }), t
        }, n.d = function(e, t) {
            for (var r in t) n.o(t, r) && !n.o(e, r) && Object.defineProperty(e, r, {
                enumerable: !0,
                get: t[r]
            })
        }, n.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        },
        function() {
            "use strict";
            var e, t, r, o, a, i = Roblox,
                u = n.n(i),
                c = React,
                l = n.n(c),
                s = ReactDOM,
                v = ReactUtilities,
                d = ReactStyleGuide,
                p = n(4452),
                f = n.n(p),
                m = {
                    common: [],
                    feature: "Feature.VirtualEvents"
                },
                h = {
                    common: [],
                    feature: "Feature.Groups"
                },
                g = CoreUtilities,
                b = i.EnvironmentUrls.apiGatewayUrl,
                E = i.EnvironmentUrls.gamesApi,
                y = i.EnvironmentUrls.groupsApi,
                w = i.EnvironmentUrls.domain,
                S = "".concat(b, "/virtual-events/v1/virtual-events"),
                I = "".concat(E, "/v1/games"),
                k = "".concat(E, "/v2/groups"),
                x = "".concat(y, "/v1/featured-content"),
                C = {
                    getVirtualEventsUrl: function(e, t, n, r, o) {
                        return "".concat(S, "/groups/").concat(e)
                    },
                    getVirtualEventDetailsUrl: function(e, t) {
                        return t ? "".concat(S, "/").concat(e) : "".concat(S, "/public/").concat(e)
                    },
                    getVirtualEventsRsvpEndpoint: function(e) {
                        return "".concat(S, "/").concat(e, "/rsvps")
                    },
                    getGameDetailsForUniverseIdsEndpoint: function() {
                        return "".concat(I)
                    },
                    getGamesForGroupEndpoint: function(e) {
                        return "".concat(k, "/").concat(e, "/gamesV2?accessFilter=Public&sortOrder=Desc")
                    },
                    getGroupFeaturedEventsUrl: function(e) {
                        return "".concat(x, "/event?groupId=").concat(e)
                    },
                    getGroupFeaturedEventUrl: function(e, t) {
                        return "".concat(x, "/event?groupId=").concat(e, "&eventId=").concat(t)
                    },
                    getEventUrl: function(e) {
                        return "https://".concat(w, "/events/").concat(e)
                    },
                    getCreateExperienceUrl: function(e) {
                        return "https://create.".concat(w, "/dashboard/creations?groupId=").concat(e)
                    },
                    getCreateEventForExperienceUrl: function(e) {
                        return "https://create.".concat(w, "/dashboard/creations/experiences/").concat(e, "/events")
                    }
                },
                T = {
                    active: "active"
                },
                P = {
                    going: "going",
                    notGoing: "notGoing"
                },
                G = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, u)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                U = function(e, t) {
                    var n, r, o, a = {
                            label: 0,
                            sent: function() {
                                if (1 & o[0]) throw o[1];
                                return o[1]
                            },
                            trys: [],
                            ops: []
                        },
                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                    return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                        return this
                    }), i;

                    function u(u) {
                        return function(c) {
                            return function(u) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                    if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                    switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, r = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = a.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== u[0] && 2 !== u[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                a.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && a.label < o[1]) {
                                                a.label = o[1], o = u;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(u);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, a)
                                } catch (e) {
                                    u = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }([u, c])
                        }
                    }
                },
                F = function(e, t, n) {
                    if (n || 2 === arguments.length)
                        for (var r, o = 0, a = t.length; o < a; o++) !r && o in t || (r || (r = Array.prototype.slice.call(t, 0, o)), r[o] = t[o]);
                    return e.concat(r || Array.prototype.slice.call(t))
                },
                D = function(e) {
                    for (var t = [], n = 1; n < arguments.length; n++) t[n - 1] = arguments[n];
                    return G(void 0, F([e], t, !0), Promise, (function(e, t, n, r, o) {
                        var a, i, u;
                        return void 0 === t && (t = "upcoming"), void 0 === n && (n = (new Date).toISOString()), void 0 === r && (r = "startUtc"), void 0 === o && (o = "desc"), U(this, (function(c) {
                            switch (c.label) {
                                case 0:
                                    return a = {
                                        url: C.getVirtualEventsUrl(e, t, n, r, o),
                                        withCredentials: !0
                                    }, [4, g.httpService.get(a)];
                                case 1:
                                    return i = c.sent(), [2, null === (u = i.data) || void 0 === u ? void 0 : u.data]
                            }
                        }))
                    }))
                },
                N = function(e) {
                    return G(void 0, void 0, Promise, (function() {
                        var t, n, r, o;
                        return U(this, (function(a) {
                            switch (a.label) {
                                case 0:
                                    return t = null === (o = null === (r = window.Roblox) || void 0 === r ? void 0 : r.CurrentUser) || void 0 === o ? void 0 : o.isAuthenticated, n = {
                                        url: C.getVirtualEventDetailsUrl(e, t),
                                        withCredentials: !0
                                    }, [4, g.httpService.get(n)];
                                case 1:
                                    return [2, a.sent().data]
                            }
                        }))
                    }))
                },
                O = function(e, t) {
                    return G(void 0, void 0, Promise, (function() {
                        var n, r;
                        return U(this, (function(o) {
                            switch (o.label) {
                                case 0:
                                    return n = {
                                        url: C.getVirtualEventsRsvpEndpoint(e),
                                        withCredentials: !0
                                    }, r = {
                                        rsvpStatus: t
                                    }, [4, g.httpService.post(n, r)];
                                case 1:
                                    return o.sent(), [2]
                            }
                        }))
                    }))
                },
                j = function(e) {
                    return G(void 0, void 0, Promise, (function() {
                        var t, n, r, o;
                        return U(this, (function(a) {
                            switch (a.label) {
                                case 0:
                                    return t = {
                                        url: C.getGameDetailsForUniverseIdsEndpoint(),
                                        withCredentials: !0
                                    }, n = {
                                        universeIds: e
                                    }, [4, g.httpService.get(t, n)];
                                case 1:
                                    return r = a.sent(), [2, null === (o = r.data) || void 0 === o ? void 0 : o.data]
                            }
                        }))
                    }))
                },
                V = function(e) {
                    return G(void 0, void 0, Promise, (function() {
                        var t, n, r;
                        return U(this, (function(o) {
                            switch (o.label) {
                                case 0:
                                    return t = {
                                        url: C.getGamesForGroupEndpoint(e),
                                        withCredentials: !0
                                    }, [4, g.httpService.get(t)];
                                case 1:
                                    return n = o.sent(), [2, null === (r = n.data) || void 0 === r ? void 0 : r.data]
                            }
                        }))
                    }))
                },
                R = function(e) {
                    return G(void 0, void 0, Promise, (function() {
                        var t;
                        return U(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return t = {
                                        url: C.getGroupFeaturedEventsUrl(e),
                                        withCredentials: !0
                                    }, [4, g.httpService.get(t)];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                M = function(e, t) {
                    return G(void 0, void 0, Promise, (function() {
                        var n;
                        return U(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return n = {
                                        url: C.getGroupFeaturedEventUrl(e, t),
                                        withCredentials: !0
                                    }, [4, g.httpService.post(n)];
                                case 1:
                                    return [2, r.sent().data]
                            }
                        }))
                    }))
                },
                W = function(e, t) {
                    return G(void 0, void 0, Promise, (function() {
                        var n;
                        return U(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return n = {
                                        url: C.getGroupFeaturedEventUrl(e, t),
                                        withCredentials: !0
                                    }, [4, g.httpService.delete(n)];
                                case 1:
                                    return r.sent(), [2]
                            }
                        }))
                    }))
                },
                A = RobloxThumbnails,
                L = "virtualEvents",
                B = "groupDetailsPage",
                z = "virtualEventJoined",
                H = "eventDetailsPageVisit",
                J = "virtualEventRSVP",
                _ = {
                    sendVirtualEventJoinedEvent: function(e, t, n) {
                        u().EventStream.SendEventWithTarget(z, L, {
                            virtualEventId: e,
                            universeId: t,
                            "SD.gamePlayFromEventDetails.ID": n,
                            "SD.gamePlayFromEventDetails.CT": Date.now(),
                            channel: B
                        }, u().EventStream.TargetTypes.WWW)
                    },
                    sendEventDetailsPageVisitEvent: function(e, t) {
                        u().EventStream.SendEventWithTarget(H, L, {
                            virtualEventId: e,
                            universeId: t,
                            channel: B
                        }, u().EventStream.TargetTypes.WWW)
                    },
                    sendVirtualEventRSVPEvent: function(e, t, n) {
                        u().EventStream.SendEventWithTarget(J, L, {
                            virtualEventId: e,
                            universeId: t,
                            channel: B,
                            status: n
                        }, u().EventStream.TargetTypes.WWW)
                    }
                },
                q = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, u)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                K = function(e, t) {
                    var n, r, o, a = {
                            label: 0,
                            sent: function() {
                                if (1 & o[0]) throw o[1];
                                return o[1]
                            },
                            trys: [],
                            ops: []
                        },
                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                    return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                        return this
                    }), i;

                    function u(u) {
                        return function(c) {
                            return function(u) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                    if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                    switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, r = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = a.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== u[0] && 2 !== u[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                a.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && a.label < o[1]) {
                                                a.label = o[1], o = u;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(u);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, a)
                                } catch (e) {
                                    u = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }([u, c])
                        }
                    }
                },
                Q = i.PlayButton.launchGame,
                X = P,
                Y = (0, v.withTranslations)((function(e) {
                    var t = e.event,
                        n = e.gameDetails,
                        r = e.systemFeedbackService,
                        o = e.translate,
                        a = (0, c.useState)(t.userRsvpStatus === X.going),
                        u = a[0],
                        s = a[1],
                        v = (0, c.useCallback)((function(e) {
                            return q(void 0, void 0, void 0, (function() {
                                return K(this, (function(n) {
                                    switch (n.label) {
                                        case 0:
                                            e.preventDefault(), e.stopPropagation(), n.label = 1;
                                        case 1:
                                            return n.trys.push([1, 3, , 4]), [4, O(t.id, X.going)];
                                        case 2:
                                            return n.sent(), s(!0), _.sendVirtualEventRSVPEvent(t.id, t.universeId, X.going), [3, 4];
                                        case 3:
                                            return n.sent(), r.warning(o("NetworkError")), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                }))
                            }))
                        }), [t.id, t.universeId, s, r, o]),
                        d = (0, c.useCallback)((function(e) {
                            return q(void 0, void 0, void 0, (function() {
                                return K(this, (function(n) {
                                    switch (n.label) {
                                        case 0:
                                            e.preventDefault(), e.stopPropagation(), n.label = 1;
                                        case 1:
                                            return n.trys.push([1, 3, , 4]), [4, O(t.id, X.notGoing)];
                                        case 2:
                                            return n.sent(), s(!1), _.sendVirtualEventRSVPEvent(t.id, t.universeId, X.notGoing), [3, 4];
                                        case 3:
                                            return n.sent(), r.warning(o("NetworkError")), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                }))
                            }))
                        }), [t.id, t.universeId, s, r, o]),
                        p = (0, c.useCallback)((function(e) {
                            if (e.preventDefault(), e.stopPropagation(), n) {
                                var r = g.uuidService.generateRandomUuid(),
                                    o = t.placeId || n.rootPlaceId.toString();
                                i.DeviceMeta && (0, i.DeviceMeta)().isInApp ? window.location.href = "roblox://experiences/start?placeId=".concat(o) : Q(o, n.rootPlaceId.toString(), "", void 0, {
                                    eventName: "virtualEventJoinGame",
                                    ctx: "virtualEvents",
                                    eventJoinSessionId: r
                                }, {}), _.sendVirtualEventJoinedEvent(t.id, t.universeId, r)
                            }
                        }), [n, t.id, t.universeId]);
                    return (0, c.useMemo)((function() {
                        return Date.now() > Date.parse(t.eventTime.startUtc)
                    }), [t]) ? l().createElement("button", {
                        type: "button",
                        className: "group-event-join-button btn-growth-md",
                        onClick: p
                    }, o("JoinEvent")) : u ? l().createElement("button", {
                        type: "button",
                        className: "group-event-join-button btn-secondary-md",
                        onClick: d
                    }, o("UnfollowEvent")) : l().createElement("button", {
                        type: "button",
                        className: "group-event-join-button btn-cta-md",
                        onClick: v
                    }, o("NotifyMe"))
                }), m),
                Z = CoreRobloxUtilities;
            ! function(e) {
                e.GroupPageClickEvent = "groupPageClickEvent", e.GroupPageExposureEvent = "groupPageExposureEvent", e.GroupForumsExposureEvent = "groupForumsExposureEvent", e.GroupForumPostExposureEvent = "groupForumPostExposureEvent", e.CmntyAgeCheckBannerShownEvent = "cmntyAgeCheckBannerShownEvent"
            }(e || (e = {})),
            function(e) {
                e.GroupHomepage = "groupHomepage", e.GroupForums = "groupForums", e.ConfigureGroup = "configureGroup"
            }(t || (t = {})),
            function(e) {
                e.ForumsTab = "forums"
            }(r || (r = {})),
            function(e) {
                e.BannerComponent = "Banner", e.IntrusiveModal = "IntrusiveModal"
            }(o || (o = {})),
            function(e) {
                e.CreatePost = "createPost", e.WriteComment = "writeComment", e.InteractComment = "interactComment"
            }(a || (a = {}));
            var $ = function() {
                    return $ = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, $.apply(this, arguments)
                },
                ee = function(t) {
                    var n = t.context,
                        r = t.groupId,
                        o = t.clickTargetType,
                        a = t.clickTargetId,
                        i = t.hasRichText;
                    Z.eventStreamService.sendEventWithTarget(e.GroupPageClickEvent, n, $($({
                        groupId: r,
                        clickTargetType: o
                    }, a && {
                        clickTargetId: a
                    }), i && {
                        hasRichText: i ? 1 : 0
                    }))
                },
                te = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, u)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                ne = function(e, t) {
                    var n, r, o, a = {
                            label: 0,
                            sent: function() {
                                if (1 & o[0]) throw o[1];
                                return o[1]
                            },
                            trys: [],
                            ops: []
                        },
                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                    return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                        return this
                    }), i;

                    function u(u) {
                        return function(c) {
                            return function(u) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                    if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                    switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, r = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = a.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== u[0] && 2 !== u[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                a.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && a.label < o[1]) {
                                                a.label = o[1], o = u;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(u);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, a)
                                } catch (e) {
                                    u = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }([u, c])
                        }
                    }
                },
                re = (0, d.createSystemFeedback)(),
                oe = re[0],
                ae = re[1],
                ie = (new i.Intl).locale,
                ue = (0, v.withTranslations)((function(e) {
                    var n = e.group,
                        r = e.event,
                        o = e.gameDetails,
                        a = e.featuredEventId,
                        i = e.setFeaturedEventId,
                        u = e.canSetFeaturedEvent,
                        s = e.isFullSized,
                        v = e.translate,
                        p = (0, c.useMemo)((function() {
                            return a === r.id
                        }), [a, r.id]),
                        f = (0, c.useCallback)((function() {
                            return te(void 0, void 0, void 0, (function() {
                                return ne(this, (function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return e.trys.push([0, 5, , 6]), p ? [4, W(n.id, r.id)] : [3, 2];
                                        case 1:
                                            return e.sent(), i(void 0), ae.success(v("Message.UnfeatureEventSuccess")), [3, 4];
                                        case 2:
                                            return [4, M(n.id, r.id)];
                                        case 3:
                                            e.sent(), i(r.id), ae.success(v("Message.FeatureEventSuccess")), e.label = 4;
                                        case 4:
                                            return ee({
                                                groupId: n.id,
                                                clickTargetType: p ? "unfeatureEvent" : "featureEvent",
                                                clickTargetId: r.id.toString(),
                                                context: t.GroupHomepage
                                            }), [3, 6];
                                        case 5:
                                            return e.sent(), ae.warning(v("NetworkError")), [3, 6];
                                        case 6:
                                            return [2]
                                    }
                                }))
                            }))
                        }), [p, i, n.id, r.id, v]),
                        m = (0, c.useMemo)((function() {
                            var e = new Date(Date.parse(r.eventTime.startUtc)),
                                t = e.toLocaleString(ie, {
                                    weekday: "short",
                                    month: "short",
                                    day: "numeric"
                                }),
                                n = e.toLocaleString(ie, {
                                    hour: "numeric",
                                    minute: "numeric",
                                    hour12: !0
                                });
                            return v("Label.EventDate", {
                                dayString: t,
                                timeString: n
                            })
                        }), [r, v]),
                        h = (0, c.useMemo)((function() {
                            var e, t;
                            return (null === (t = null === (e = r.thumbnails) || void 0 === e ? void 0 : e[0]) || void 0 === t ? void 0 : t.mediaId) || r.universeId
                        }), [r]),
                        g = (0, c.useMemo)((function() {
                            var e, t;
                            return (null === (t = null === (e = r.thumbnails) || void 0 === e ? void 0 : e[0]) || void 0 === t ? void 0 : t.mediaId) ? A.ThumbnailTypes.assetThumbnail : A.ThumbnailTypes.universeThumbnail
                        }), [r]),
                        b = (0, c.useCallback)((function() {
                            _.sendEventDetailsPageVisitEvent(r.id, r.universeId)
                        }), [r.id, r.universeId]);
                    return l().createElement(d.Link, {
                        "aria-label": r.title,
                        onClick: b,
                        url: C.getEventUrl(r.id)
                    }, l().createElement("div", {
                        className: "group-event"
                    }, l().createElement("div", {
                        className: "group-event-thumbnail"
                    }, l().createElement(A.Thumbnail2d, {
                        type: g,
                        size: A.ThumbnailUniverseThumbnailSize.width768,
                        targetId: h,
                        containerClass: "group-event-thumbnail-container"
                    })), l().createElement("div", {
                        className: "group-event-content"
                    }, l().createElement("div", {
                        className: "group-event-header"
                    }, l().createElement("h2", null, r.title)), l().createElement("div", {
                        className: "group-event-date text-default font-bold"
                    }, m), s && l().createElement("div", {
                        className: "group-event-description text-description"
                    }, r.description), l().createElement("div", {
                        className: "group-event-follow-button"
                    }, l().createElement(Y, {
                        event: r,
                        gameDetails: o,
                        systemFeedbackService: ae
                    }), u && l().createElement(d.Popover, {
                        id: "group-event-dropdown-menu-popover",
                        button: l().createElement(d.IconButton, {
                            className: "group-event-feature-button",
                            iconName: "more",
                            size: d.IconButton.sizes.small,
                            onClick: function(e) {
                                e.preventDefault(), e.stopPropagation()
                            }
                        }),
                        trigger: "click",
                        placement: "bottom"
                    }, l().createElement("ul", {
                        className: "group-event-dropdown-menu dropdown-menu",
                        role: "menu"
                    }, l().createElement("li", null, l().createElement(d.Button, {
                        variant: d.Button.variants.secondary,
                        onClick: f
                    }, v(p ? "Action.UnfeatureEvent" : "Action.FeatureEvent")))))))), l().createElement(oe, null))
                }), h),
                ce = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, u)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                le = function(e, t) {
                    var n, r, o, a = {
                            label: 0,
                            sent: function() {
                                if (1 & o[0]) throw o[1];
                                return o[1]
                            },
                            trys: [],
                            ops: []
                        },
                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                    return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                        return this
                    }), i;

                    function u(u) {
                        return function(c) {
                            return function(u) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                    if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                    switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, r = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = a.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== u[0] && 2 !== u[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                a.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && a.label < o[1]) {
                                                a.label = o[1], o = u;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(u);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, a)
                                } catch (e) {
                                    u = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }([u, c])
                        }
                    }
                },
                se = (0, v.withTranslations)((function(e) {
                    var n = e.group,
                        r = e.translate,
                        o = (0, c.useState)(null),
                        a = o[0],
                        i = o[1],
                        u = (0, c.useState)(!0),
                        s = u[0],
                        v = u[1],
                        p = (0, c.useCallback)((function() {
                            return ce(void 0, void 0, void 0, (function() {
                                var e, t, r;
                                return le(this, (function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (!(null == n ? void 0 : n.id)) return [2];
                                            o.label = 1;
                                        case 1:
                                            return o.trys.push([1, 3, 4, 5]), [4, V(n.id)];
                                        case 2:
                                            if ((e = o.sent()).length > 0) {
                                                for (t = e[0], r = 1; r < e.length; r++) e[r].placeVisits > t.placeVisits && (t = e[r]);
                                                i(t)
                                            }
                                            return [3, 5];
                                        case 3:
                                            return o.sent(), i(null), [3, 5];
                                        case 4:
                                            return v(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                }))
                            }))
                        }), [n, i]);
                    (0, c.useEffect)((function() {
                        p()
                    }), [p]);
                    var f = (0, c.useMemo)((function() {
                            return null == a ? C.getCreateExperienceUrl(n.id) : C.getCreateEventForExperienceUrl(a.id)
                        }), [a, n.id]),
                        m = (0, c.useCallback)((function() {
                            ee({
                                groupId: n.id,
                                clickTargetType: "createEvent",
                                context: t.GroupHomepage
                            })
                        }), [n.id]);
                    return s ? l().createElement(d.Loading, null) : l().createElement("div", {
                        className: "section-content-off"
                    }, l().createElement("span", {
                        className: "group-event-calendar-icon"
                    }), l().createElement("h2", null, r("Label.GroupEventsUpsell")), l().createElement("span", null, r("Label.GroupEventsCreatorHubUpsell")), l().createElement(d.Link, {
                        url: f
                    }, l().createElement("button", {
                        type: "button",
                        className: "group-create-event-button btn-growth-md",
                        onClick: m
                    }, r("Label.CreateEvent"))))
                }), h),
                ve = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, u)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                de = function(e, t) {
                    var n, r, o, a = {
                            label: 0,
                            sent: function() {
                                if (1 & o[0]) throw o[1];
                                return o[1]
                            },
                            trys: [],
                            ops: []
                        },
                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                    return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                        return this
                    }), i;

                    function u(u) {
                        return function(c) {
                            return function(u) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                    if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                    switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, r = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = a.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== u[0] && 2 !== u[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                a.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && a.label < o[1]) {
                                                a.label = o[1], o = u;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(u);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, a)
                                } catch (e) {
                                    u = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }([u, c])
                        }
                    }
                },
                pe = T,
                fe = (0, v.withTranslations)((function(e) {
                    var t = e.onlyShowFeaturedEvent,
                        n = e.group,
                        r = e.canSetFeaturedEvent,
                        o = e.translate,
                        a = (0, c.useState)([]),
                        i = a[0],
                        u = a[1],
                        s = (0, c.useState)([]),
                        v = s[0],
                        p = s[1],
                        m = (0, c.useState)(),
                        h = m[0],
                        g = m[1],
                        b = (0, c.useState)(!0),
                        E = b[0],
                        y = b[1],
                        w = (0, c.useCallback)((function() {
                            return ve(void 0, void 0, void 0, (function() {
                                var e, r, o, a, i, c, l, s;
                                return de(this, (function(v) {
                                    switch (v.label) {
                                        case 0:
                                            if (!(null == n ? void 0 : n.id)) return [2];
                                            v.label = 1;
                                        case 1:
                                            return v.trys.push([1, 9, 10, 11]), [4, R(n.id)];
                                        case 2:
                                            return e = v.sent(), g(null == e ? void 0 : e.contentId), r = void 0, t ? [4, N(e.contentId)] : [3, 4];
                                        case 3:
                                            return o = v.sent(), r = [o], [3, 7];
                                        case 4:
                                            return [4, D(n.id)];
                                        case 5:
                                            return a = v.sent(), [4, Promise.all(a.map((function(e) {
                                                return ve(void 0, void 0, void 0, (function() {
                                                    return de(this, (function(t) {
                                                        return [2, N(e.id)]
                                                    }))
                                                }))
                                            })))];
                                        case 6:
                                            i = v.sent(), r = i, v.label = 7;
                                        case 7:
                                            return c = r.filter((function(e) {
                                                return e.eventStatus === pe.active && Date.now() < Date.parse(e.eventTime.endUtc)
                                            })).sort((function(e, t) {
                                                return Date.parse(e.eventTime.startUtc) - Date.parse(t.eventTime.startUtc)
                                            })), u(c), l = r.map((function(e) {
                                                return e.universeId
                                            })), [4, j(l)];
                                        case 8:
                                            return s = v.sent(), p(s), [3, 11];
                                        case 9:
                                            return v.sent(), g(void 0), u([]), p([]), [3, 11];
                                        case 10:
                                            return y(!1), [7];
                                        case 11:
                                            return [2]
                                    }
                                }))
                            }))
                        }), [n, t]);
                    (0, c.useEffect)((function() {
                        w()
                    }), [w]);
                    var S = (0, c.useMemo)((function() {
                        return E ? l().createElement(d.Loading, null) : i && i.length > 0 ? l().createElement("div", {
                            className: f()("group-events group-section-content-transparent", t && "group-events-full-size")
                        }, i.map((function(e) {
                            return l().createElement(ue, {
                                key: e.id,
                                group: n,
                                event: e,
                                gameDetails: (o = e.universeId, v.find((function(e) {
                                    return e.id === o
                                }))),
                                featuredEventId: h,
                                setFeaturedEventId: g,
                                canSetFeaturedEvent: r,
                                isFullSized: t
                            });
                            var o
                        }))) : t ? null : r ? l().createElement(se, {
                            group: n
                        }) : l().createElement("div", {
                            className: "section-content-off"
                        }, l().createElement("span", {
                            className: "group-event-calendar-icon"
                        }), l().createElement("h2", null, o("Label.NoGroupEvents")), l().createElement("span", null, o("Label.CheckLaterForEvents")))
                    }), [n, E, i, h, g, o, v, t, r]);
                    return !t || (null == i ? void 0 : i.length) && h ? l().createElement("div", {
                        className: "section"
                    }, l().createElement("div", {
                        className: "container-header group-events-header"
                    }, l().createElement("h2", null, o("Heading.Events"))), S) : null
                }), h),
                me = function() {
                    return me = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, me.apply(this, arguments)
                },
                he = {
                    renderGroupEventsSection: function(e, t) {
                        (0, s.unmountComponentAtNode)(e), (0, s.render)(l().createElement(fe, me({}, t)), e)
                    }
                };
            Object.assign(u(), {
                GroupEventsService: he
            })
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/0e4bd28a3650448f599a7595853be4f4-groupEvents.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("GroupEvents");