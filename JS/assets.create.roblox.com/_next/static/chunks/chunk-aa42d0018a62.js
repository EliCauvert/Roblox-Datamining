;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "2462ed4e-cdff-2dd9-52b1-f52ea45a2154")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 401263, 884213, e => {
    "use strict";
    var t = e.i(416340);
    let a = /{(.+?)}/g,
        i = (e, t) => void 0 === t || 0 === Object.keys(t).length ? e : e.replace(a, (e, a) => {
            var i;
            return null != (i = t[a]) ? i : "{".concat(a, "}")
        });
    e.s(["default", 0, i], 884213);
    let n = /{(.+?)}/,
        r = /({.+?})/g,
        l = /^[a-zA-Z0-9-]+\.(?:capture-loopback\.)?chromatic\.com$/,
        s = /(?:^|\.)robloxlabs\.com$/,
        o = () => {
            let e, t = l.test(window.location.hostname),
                a = window.location.hostname.includes("localhost"),
                i = "string" == typeof(e = window.location.hostname) && s.test(e);
            return {
                isSSR: !1,
                isAllowed: t || a || i,
                isDangerous: t || i,
                preferLoadedTranslations: i
            }
        },
        u = (e, t) => t.isDangerous ? "[!!".concat(e, "!!]") : e;
    var d = e.i(730530);
    e.s(["default", 0, e => {
        let {
            ready: a,
            translate: l,
            translateHTML: s,
            translateWithNamespace: c,
            translateWithNamespaceHTML: f
        } = e, p = (0, t.useMemo)(() => ({
            ready: a,
            translate: l,
            translateHTML: s,
            translateWithNamespace: c,
            translateWithNamespaceHTML: f
        }), [a, l, s, c, f]);
        return (0, t.useMemo)(() => {
            let e = {
                ready: p.ready,
                translate: (0, d.translationFn)(p),
                translateHTML: (0, d.translateHTMLFn)(p),
                translateWithNamespace: p.translateWithNamespace,
                translateWithNamespaceHTML: p.translateWithNamespaceHTML
            };
            return {
                ...e,
                tPendingTranslation: (e => {
                    let {
                        ready: t,
                        translate: a
                    } = e;
                    return (e, n, r, l) => {
                        let s = o();
                        if (!s.isAllowed) return a(r, l);
                        if (s.preferLoadedTranslations && t) {
                            let e = a(r, l);
                            if (e.length > 0) return e
                        }
                        return i(s.preferLoadedTranslations && !t ? e : u(e, s), l)
                    }
                })(e),
                tPendingHtmlTranslation: (e => {
                    let {
                        ready: a,
                        translateHTML: l
                    } = e;
                    return (e, s, d, c, f) => {
                        let p = o();
                        if (!p.isAllowed) return l(d, c, f);
                        if (p.preferLoadedTranslations && a) {
                            let e = l(d, c, f);
                            if ("" !== e) return e
                        }
                        return ((e, a, l) => {
                            let s, o;
                            if (void 0 === a && void 0 === l) return e;
                            let {
                                stringArgs: u,
                                htmlArgs: d
                            } = (s = {}, o = {}, void 0 === l || Object.entries(l).forEach(e => {
                                let [t, a] = e;
                                "string" == typeof a ? s[t] = a : o[t] = a
                            }), {
                                stringArgs: s,
                                htmlArgs: o
                            }), c = i(e, u), f = c.split(r).filter(e => !!e);
                            if (1 === f.length) return c;
                            let p = [...f];
                            if (0 !== Object.keys(d).length) {
                                let e = f.reduce((e, t, a) => {
                                    let i = n.exec(t);
                                    if (i) {
                                        let t = i[1];
                                        if (Object.hasOwn(d, t)) {
                                            let i = e[t];
                                            if (!i) return Object.assign(e, {
                                                [t]: [a]
                                            });
                                            i.push(a)
                                        }
                                    }
                                    return e
                                }, {});
                                Object.entries(d).forEach(t => {
                                    let [a, i] = t, n = e[a];
                                    n && n.forEach(e => {
                                        p[e] = i
                                    })
                                })
                            }
                            if (!Array.isArray(a) || 0 === a.length) return (0, t.createElement)(t.Fragment, null, ...p);
                            let m = a.reduce((e, t) => {
                                    let {
                                        opening: a,
                                        closing: i,
                                        content: n
                                    } = t;
                                    return Object.assign(e, {
                                        ["{".concat(a, "}")]: {
                                            match: "{".concat(i, "}"),
                                            content: n
                                        }
                                    })
                                }, {}),
                                h = [],
                                v = [],
                                g = [];
                            for (let e = p.shift(); void 0 !== e; e = p.shift())
                                if ("string" == typeof e && n.test(e))
                                    if (Object.hasOwn(m, e)) v.push(e), g.push(e);
                                    else {
                                        let a = v.pop();
                                        if (void 0 !== a) {
                                            let {
                                                match: i,
                                                content: n
                                            } = m[a];
                                            if (e !== i) break;
                                            let r = [],
                                                l = !1;
                                            for (; g.length > 0 && !l;) {
                                                let e = g.pop();
                                                e === a ? l = !0 : r.unshift(e)
                                            }
                                            let s = n(r.every(e => "string" == typeof e) ? r : (0, t.createElement)(t.Fragment, null, ...r));
                                            0 === g.length ? h.push(s) : g.push(s)
                                        }
                                    }
                            else 0 === g.length ? h.push(e) : g.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...h)
                        })(p.preferLoadedTranslations && !a ? e : u(e, p), c, f)
                    }
                })(e)
            }
        }, [p])
    }], 401263)
}, 756568, e => {
    "use strict";
    var t = e.i(776344);
    e.s(["Flex", () => t.default])
}, 338653, 770651, e => {
    "use strict";
    var t = e.i(601362),
        a = function(e, t) {
            return (a = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function i() {
            this.constructor = e
        }
        a(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
    }

    function n(e, t, a, i) {
        return new(a || (a = Promise))(function(n, r) {
            function l(e) {
                try {
                    o(i.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    o(i.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(l, s)
            }
            o((i = i.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var a, i, n, r = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return l.next = s(0), l.throw = s(1), l.return = s(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
            return this
        }), l;

        function s(s) {
            return function(o) {
                var u = [s, o];
                if (a) throw TypeError("Generator is already executing.");
                for (; l && (l = 0, u[0] && (r = 0)), r;) try {
                    if (a = 1, i && (n = 2 & u[0] ? i.return : u[0] ? i.throw || ((n = i.return) && n.call(i), 0) : i.next) && !(n = n.call(i, u[1])).done) return n;
                    switch (i = 0, n && (u = [2 & u[0], n.value]), u[0]) {
                        case 0:
                        case 1:
                            n = u;
                            break;
                        case 4:
                            return r.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            r.label++, i = u[1], u = [0];
                            continue;
                        case 7:
                            u = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = r.trys).length > 0 && n[n.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === u[0] && (!n || u[1] > n[0] && u[1] < n[3])) {
                                r.label = u[1];
                                break
                            }
                            if (6 === u[0] && r.label < n[1]) {
                                r.label = n[1], n = u;
                                break
                            }
                            if (n && r.label < n[2]) {
                                r.label = n[2], r.ops.push(u);
                                break
                            }
                            n[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    u = t.call(e, r)
                } catch (e) {
                    u = [6, e], i = 0
                } finally {
                    a = n = 0
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

    function l(e, t) {
        return null == e ? e : {
            universeId: e.universeId,
            universeName: e.universeName,
            rootPlaceId: e.rootPlaceId
        }
    }

    function s(e) {
        var a;
        return null == (a = e) ? a : {
            campaignName: a.campaignName,
            linkId: a.linkId,
            linkType: a.linkType,
            createdUtc: new Date(a.createdUtc),
            updatedUtc: new Date(a.updatedUtc),
            universe: (0, t.exists)(a, "universe") ? l(a.universe) : void 0,
            referralCode: a.referralCode,
            referralCodeType: a.referralCodeType,
            launchData: (0, t.exists)(a, "launchData") ? a.launchData : void 0,
            creatorKey: (0, t.exists)(a, "creatorKey") ? a.creatorKey : void 0,
            creatorType: (0, t.exists)(a, "creatorType") ? a.creatorType : void 0,
            fallbackType: (0, t.exists)(a, "fallbackType") ? a.fallbackType : void 0
        }
    }

    function o(e) {
        if (void 0 !== e) return null === e ? null : {
            universeId: e.universeId,
            campaignName: e.campaignName,
            launchData: e.launchData,
            fallbackType: e.fallbackType
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            linkId: e.linkId,
            universeId: e.universeId,
            launchData: e.launchData,
            newOwnerId: e.newOwnerId,
            newOwnerType: e.newOwnerType,
            fallbackType: e.fallbackType
        }
    }

    function d(e, a) {
        return null == e ? e : {
            campaignName: e.campaignName,
            linkId: e.linkId,
            linkType: e.linkType,
            createdUtc: new Date(e.createdUtc),
            updatedUtc: new Date(e.updatedUtc),
            universe: (0, t.exists)(e, "universe") ? l(e.universe) : void 0,
            referralCode: e.referralCode,
            referralCodeType: e.referralCodeType,
            launchData: (0, t.exists)(e, "launchData") ? e.launchData : void 0,
            creatorKey: (0, t.exists)(e, "creatorKey") ? e.creatorKey : void 0,
            creatorType: (0, t.exists)(e, "creatorType") ? e.creatorType : void 0,
            fallbackType: (0, t.exists)(e, "fallbackType") ? e.fallbackType : void 0
        }
    }

    function c(e, t) {
        return null == e ? e : {
            affiliateLink: d(e.affiliateLink)
        }
    }

    function f(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorId: e.creatorId,
            creatorType: e.creatorType
        }
    }

    function p(e, a) {
        return null == e ? e : {
            experienceEventId: (0, t.exists)(e, "experienceEventId") ? e.experienceEventId : void 0,
            launchData: (0, t.exists)(e, "launchData") ? e.launchData : void 0
        }
    }

    function m(e, t) {
        return null == e ? e : {
            isEligibleToCreate: e.isEligibleToCreate,
            isAllowedToCreateForAnyExperience: e.isAllowedToCreateForAnyExperience
        }
    }

    function h(e) {
        return e
    }

    function v(e, a) {
        return null == e ? e : {
            affiliateLinks: e.affiliateLinks.map(s),
            totalCount: e.totalCount,
            nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function g(e, t) {
        return null == e ? e : {
            affiliateLink: d(e.affiliateLink)
        }
    }
    var y = function(e) {
        function a() {
            return null !== e && e.apply(this, arguments) || this
        }
        return i(a, e), a.prototype.affiliateLinksCreateAffiliateLinkByGroupRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksCreateAffiliateLinkByGroup.");
                            if (null === e.affiliateLinksCreateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksCreateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksCreateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksCreateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksCreateAffiliateLinkByGroup.");
                            return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: o(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return c(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksCreateAffiliateLinkByGroup = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksCreateAffiliateLinkByGroupRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksCreateAffiliateLinkByUserRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.affiliateLinksCreateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksCreateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksCreateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksCreateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksCreateAffiliateLinkByUser.");
                            return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: o(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return c(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksCreateAffiliateLinkByUser = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksCreateAffiliateLinkByUserRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetCreatorMetadataByGroupRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksGetCreatorMetadataByGroup.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/links/metadata".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links/metadata",
                                method: "GET",
                                headers: n,
                                query: i
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return m(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetCreatorMetadataByGroup = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksGetCreatorMetadataByGroupRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetCreatorMetadataByUserRaw = function(e) {
            return n(this, void 0, void 0, function() {
                var a, i, n;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return a = {}, i = {}, [4, this.request({
                                path: "/v1/links/metadata",
                                schemaPath: "/v1/links/metadata",
                                method: "GET",
                                headers: i,
                                query: a
                            }, e)];
                        case 1:
                            return n = r.sent(), [2, new t.JSONApiResponse(n, function(e) {
                                return m(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetCreatorMetadataByUser = function(e) {
            return n(this, void 0, void 0, function() {
                return r(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.affiliateLinksGetCreatorMetadataByUserRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetEligibilityByGroupRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksGetEligibilityByGroup.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/eligibility".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/eligibility",
                                method: "GET",
                                headers: n,
                                query: i
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    isEligible: e.IsEligible
                                }
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetEligibilityByGroup = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksGetEligibilityByGroupRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetRequirementsByUserRaw = function(e) {
            return n(this, void 0, void 0, function() {
                var a, i, n;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return a = {}, i = {}, [4, this.request({
                                path: "/v1/links/requirements",
                                schemaPath: "/v1/links/requirements",
                                method: "GET",
                                headers: i,
                                query: a
                            }, e)];
                        case 1:
                            return n = r.sent(), [2, new t.JSONApiResponse(n, function(e) {
                                return null == e ? e : {
                                    requirements: e.Requirements.map(h)
                                }
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetRequirementsByUser = function(e) {
            return n(this, void 0, void 0, function() {
                return r(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.affiliateLinksGetRequirementsByUserRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetUniverseEligibilityByIdRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling affiliateLinksGetUniverseEligibilityById.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/eligibility".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/eligibility",
                                method: "GET",
                                headers: n,
                                query: i
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    isEligible: e.IsEligible
                                }
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksGetUniverseEligibilityById = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksGetUniverseEligibilityByIdRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksListAffiliateLinksByGroupRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksListAffiliateLinksByGroup.");
                            return i = {}, void 0 !== e.maxPageSize && (i.maxPageSize = e.maxPageSize), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.pageToken && (i.pageToken = e.pageToken), n = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "GET",
                                headers: n,
                                query: i
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksListAffiliateLinksByGroup = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksListAffiliateLinksByGroupRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksListAffiliateLinksByUserRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, void 0 !== e.maxPageSize && (i.maxPageSize = e.maxPageSize), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.pageToken && (i.pageToken = e.pageToken), n = {}, [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "GET",
                                headers: n,
                                query: i
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksListAffiliateLinksByUser = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksListAffiliateLinksByUserRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksResolveAffiliateLinkByReferralCodeRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling affiliateLinksResolveAffiliateLinkByReferralCode.");
                            return i = {}, void 0 !== e.referralCode && (i.referralCode = e.referralCode), n = {}, [4, this.request({
                                path: "/v1/links/resolve",
                                schemaPath: "/v1/links/resolve",
                                method: "GET",
                                headers: n,
                                query: i
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    linkId: e.linkId,
                                    linkType: e.linkType,
                                    universeId: (0, t.exists)(e, "universeId") ? e.universeId : void 0,
                                    experienceJoinData: (0, t.exists)(e, "experienceJoinData") ? p(e.experienceJoinData) : void 0,
                                    joinData: (0, t.exists)(e, "joinData") ? p(e.joinData) : void 0,
                                    fallbackType: (0, t.exists)(e, "fallbackType") ? e.fallbackType : void 0,
                                    fallbackId: (0, t.exists)(e, "fallbackId") ? e.fallbackId : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksResolveAffiliateLinkByReferralCode = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksResolveAffiliateLinkByReferralCodeRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksUpdateAffiliateLinkByGroupRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksUpdateAffiliateLinkByGroup.");
                            if (null === e.affiliateLinksUpdateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksUpdateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksUpdateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksUpdateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksUpdateAffiliateLinkByGroup.");
                            return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "PUT",
                                headers: n,
                                query: i,
                                body: u(e.affiliateLinksUpdateAffiliateLinkByUserRequest)
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksUpdateAffiliateLinkByGroup = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksUpdateAffiliateLinkByGroupRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.affiliateLinksUpdateAffiliateLinkByUserRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.affiliateLinksUpdateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksUpdateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksUpdateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksUpdateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksUpdateAffiliateLinkByUser.");
                            return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "PUT",
                                headers: n,
                                query: i,
                                body: u(e.affiliateLinksUpdateAffiliateLinkByUserRequest)
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, a.prototype.affiliateLinksUpdateAffiliateLinkByUser = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.affiliateLinksUpdateAffiliateLinkByUserRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a
    }(t.BaseAPI);
    (function(e) {
        function a() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(a, e), a.prototype.eventsAuthenticatedVisitRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.eventsAuthenticatedVisitRequest || void 0 === e.eventsAuthenticatedVisitRequest) throw new t.RequiredError("eventsAuthenticatedVisitRequest", "Required parameter requestParameters.eventsAuthenticatedVisitRequest was null or undefined when calling eventsAuthenticatedVisit.");
                            return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/events/authenticated-visit",
                                schemaPath: "/v1/events/authenticated-visit",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        linkId: e.linkId,
                                        referralUrl: e.referralUrl,
                                        linkType: e.linkType,
                                        userDidLogIn: e.userDidLogIn
                                    }
                                }(e.eventsAuthenticatedVisitRequest)
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.VoidApiResponse(l)]
                    }
                })
            })
        }, a.prototype.eventsAuthenticatedVisit = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.eventsAuthenticatedVisitRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, a.prototype.eventsPostQualifiedSignupRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.eventsPostQualifiedSignupRequest || void 0 === e.eventsPostQualifiedSignupRequest) throw new t.RequiredError("eventsPostQualifiedSignupRequest", "Required parameter requestParameters.eventsPostQualifiedSignupRequest was null or undefined when calling eventsPostQualifiedSignup.");
                            return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/events/qualified-signup",
                                schemaPath: "/v1/events/qualified-signup",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        linkId: e.linkId,
                                        referralUrl: e.referralUrl,
                                        linkType: e.linkType
                                    }
                                }(e.eventsPostQualifiedSignupRequest)
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.VoidApiResponse(l)]
                    }
                })
            })
        }, a.prototype.eventsPostQualifiedSignup = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.eventsPostQualifiedSignupRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }
    })(t.BaseAPI),
    function(e) {
        function a() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(a, e), a.prototype.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest || void 0 === e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest) throw new t.RequiredError("internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest", "Required parameter requestParameters.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest was null or undefined when calling internalAffiliateLinksCreateAffiliateLinkWithCustomCode.");
                            return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/vanity",
                                schemaPath: "/v1/internal/links/vanity",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        campaignName: e.campaignName,
                                        creator: f(e.creator),
                                        vanityCode: e.vanityCode,
                                        launchData: e.launchData,
                                        fallbackType: e.fallbackType
                                    }
                                }(e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest)
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return c(e)
                            })]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksCreateAffiliateLinkWithCustomCode = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksDeleteAffiliateLinkRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.linkId || void 0 === e.linkId) throw new t.RequiredError("linkId", "Required parameter requestParameters.linkId was null or undefined when calling internalAffiliateLinksDeleteAffiliateLink.");
                            return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/{linkId}".replace("{".concat("linkId", "}"), encodeURIComponent(String(e.linkId))),
                                schemaPath: "/v1/internal/links/{linkId}",
                                method: "DELETE",
                                headers: n,
                                query: i
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.VoidApiResponse(l)]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksDeleteAffiliateLink = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksDeleteAffiliateLinkRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksGetAffiliateLinkForReferralCodeRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling internalAffiliateLinksGetAffiliateLinkForReferralCode.");
                            return i = {}, void 0 !== e.referralCode && (i.referralCode = e.referralCode), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/share",
                                schemaPath: "/v1/internal/links/share",
                                method: "GET",
                                headers: n,
                                query: i
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    linkId: e.linkId,
                                    linkType: e.linkType
                                }
                            })]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksGetAffiliateLinkForReferralCode = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksGetAffiliateLinkForReferralCodeRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkByReferralCode.");
                            if (null === e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest || void 0 === e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest) throw new t.RequiredError("internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest", "Required parameter requestParameters.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkByReferralCode.");
                            return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/referral-code/{referralCode}".replace("{".concat("referralCode", "}"), encodeURIComponent(String(e.referralCode))),
                                schemaPath: "/v1/internal/links/referral-code/{referralCode}",
                                method: "PATCH",
                                headers: n,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        launchData: e.launchData,
                                        creator: f(e.creator),
                                        fallbackType: e.fallbackType
                                    }
                                }(e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest)
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksUpdateAffiliateLinkByReferralCode = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksUpdateAffiliateLinkReferralCodeRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.linkId || void 0 === e.linkId) throw new t.RequiredError("linkId", "Required parameter requestParameters.linkId was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkReferralCode.");
                            return i = {}, void 0 !== e.linkId && (i.linkId = e.linkId), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links",
                                schemaPath: "/v1/internal/links",
                                method: "PUT",
                                headers: n,
                                query: i
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.VoidApiResponse(l)]
                    }
                })
            })
        }, a.prototype.internalAffiliateLinksUpdateAffiliateLinkReferralCode = function(e, t) {
            return n(this, void 0, void 0, function() {
                return r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksUpdateAffiliateLinkReferralCodeRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }
    }(t.BaseAPI),
    function(e) {
        function a() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(a, e), a.prototype.privacyTaskWebhookEraseUserDataRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var i, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/erase-user-data",
                                schemaPath: "/v1/erase-user-data",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        privacyTaskId: e.privacyTaskId,
                                        userKey: e.userKey,
                                        userId: e.userId
                                    }
                                }(e.privacyTaskWebhookEraseUserDataRequest)
                            }, a)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    state: (0, t.exists)(e, "state") ? e.state : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.privacyTaskWebhookEraseUserData = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.privacyTaskWebhookEraseUserDataRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI), e.s(["AffiliateLinksApi", 0, y, "FallbackType", 0, {
        Invalid: "Invalid",
        Profile: "Profile",
        Home: "Home"
    }, "Requirements", 0, {
        Restricted: "Restricted",
        Email: "Email",
        Id: "Id",
        UserAgreement: "UserAgreement",
        ModerationStatus: "ModerationStatus",
        Payable: "Payable"
    }], 770651);
    let k = new y((0, e.i(272593).createClientConfiguration)("affiliate-links", "bedev2"));
    e.s(["createAffiliateLink", 0, e => k.affiliateLinksCreateAffiliateLinkByUser({
        affiliateLinksCreateAffiliateLinkByUserRequest: e
    }), "createGroupAffiliateLink", 0, e => {
        let {
            groupId: t,
            ...a
        } = e;
        return k.affiliateLinksCreateAffiliateLinkByGroup({
            groupId: t,
            affiliateLinksCreateAffiliateLinkByUserRequest: a
        })
    }, "editAffiliateLink", 0, e => k.affiliateLinksUpdateAffiliateLinkByUser({
        affiliateLinksUpdateAffiliateLinkByUserRequest: e
    }), "editGroupAffiliateLink", 0, e => {
        let {
            groupId: t,
            ...a
        } = e;
        return k.affiliateLinksUpdateAffiliateLinkByGroup({
            groupId: t,
            affiliateLinksUpdateAffiliateLinkByUserRequest: a
        })
    }, "getAffiliateLinks", 0, e => k.affiliateLinksListAffiliateLinksByUser(e), "getGroupAffiliateLinks", 0, e => k.affiliateLinksListAffiliateLinksByGroup(e), "getGroupCreatorMetadata", 0, e => k.affiliateLinksGetCreatorMetadataByGroup({
        groupId: e
    }), "getGroupEligibility", 0, e => k.affiliateLinksGetEligibilityByGroup({
        groupId: e
    }), "getRequirements", 0, () => k.affiliateLinksGetRequirementsByUser(), "getUniverseEligibility", 0, e => k.affiliateLinksGetUniverseEligibilityById({
        universeId: e
    }), "getUserCreatorMetadata", 0, () => k.affiliateLinksGetCreatorMetadataByUser()], 338653)
}, 836157, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        i = e.i(608652),
        n = e.i(174617),
        r = e.i(199786),
        l = e.i(300792),
        s = e.i(692166),
        o = e.i(169525),
        u = e.i(600317),
        d = e.i(221628),
        c = "Checkbox",
        [f, p] = (0, i.createContextScope)(c),
        [m, h] = f(c);

    function v(e) {
        let {
            __scopeCheckbox: a,
            checked: i,
            children: n,
            defaultChecked: l,
            disabled: s,
            form: o,
            name: u,
            onCheckedChange: f,
            required: p,
            value: h = "on",
            internal_do_not_use_render: v
        } = e, [g, y] = (0, r.useControllableState)({
            prop: i,
            defaultProp: null != l && l,
            onChange: f,
            caller: c
        }), [k, b] = t.useState(null), [w, x] = t.useState(null), L = t.useRef(!1), A = !k || !!o || !!k.closest("form"), E = {
            checked: g,
            disabled: s,
            setChecked: y,
            control: k,
            setControl: b,
            name: u,
            form: o,
            value: h,
            hasConsumerStoppedPropagationRef: L,
            required: p,
            defaultChecked: !R(l) && l,
            isFormControl: A,
            bubbleInput: w,
            setBubbleInput: x
        };
        return (0, d.jsx)(m, {
            scope: a,
            ...E,
            children: "function" == typeof v ? v(E) : n
        })
    }
    var g = "CheckboxTrigger",
        y = t.forwardRef((e, i) => {
            let {
                __scopeCheckbox: r,
                onKeyDown: l,
                onClick: s,
                ...o
            } = e, {
                control: c,
                value: f,
                disabled: p,
                checked: m,
                required: v,
                setControl: y,
                setChecked: k,
                hasConsumerStoppedPropagationRef: b,
                isFormControl: w,
                bubbleInput: x
            } = h(g, r), L = (0, a.useComposedRefs)(i, y), E = t.useRef(m);
            return t.useEffect(() => {
                let e = null == c ? void 0 : c.form;
                if (e) {
                    let t = () => k(E.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [c, k]), (0, d.jsx)(u.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": R(m) ? "mixed" : m,
                "aria-required": v,
                "data-state": A(m),
                "data-disabled": p ? "" : void 0,
                disabled: p,
                value: f,
                ...o,
                ref: L,
                onKeyDown: (0, n.composeEventHandlers)(l, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, n.composeEventHandlers)(s, e => {
                    k(e => !!R(e) || !e), x && w && (b.current = e.isPropagationStopped(), b.current || e.stopPropagation())
                })
            })
        });
    y.displayName = g;
    var k = t.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: i,
            checked: n,
            defaultChecked: r,
            required: l,
            disabled: s,
            value: o,
            onCheckedChange: u,
            form: c,
            ...f
        } = e;
        return (0, d.jsx)(v, {
            __scopeCheckbox: a,
            checked: n,
            defaultChecked: r,
            disabled: s,
            required: l,
            onCheckedChange: u,
            name: i,
            form: c,
            value: o,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: i
                } = e;
                return (0, d.jsxs)(d.Fragment, {
                    children: [(0, d.jsx)(y, {
                        ...f,
                        ref: t,
                        __scopeCheckbox: a
                    }), i && (0, d.jsx)(L, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    k.displayName = c;
    var b = "CheckboxIndicator",
        w = t.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: i,
                ...n
            } = e, r = h(b, a);
            return (0, d.jsx)(o.Presence, {
                present: i || R(r.checked) || !0 === r.checked,
                children: (0, d.jsx)(u.Primitive.span, {
                    "data-state": A(r.checked),
                    "data-disabled": r.disabled ? "" : void 0,
                    ...n,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    w.displayName = b;
    var x = "CheckboxBubbleInput",
        L = t.forwardRef((e, i) => {
            let {
                __scopeCheckbox: n,
                ...r
            } = e, {
                control: o,
                hasConsumerStoppedPropagationRef: c,
                checked: f,
                defaultChecked: p,
                required: m,
                disabled: v,
                name: g,
                value: y,
                form: k,
                bubbleInput: b,
                setBubbleInput: w
            } = h(x, n), L = (0, a.useComposedRefs)(i, w), A = (0, l.usePrevious)(f), E = (0, s.useSize)(o);
            t.useEffect(() => {
                if (!b) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !c.current;
                if (A !== f && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    b.indeterminate = R(f), e.call(b, !R(f) && f), b.dispatchEvent(a)
                }
            }, [b, A, f, c]);
            let C = t.useRef(!R(f) && f);
            return (0, d.jsx)(u.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != p ? p : C.current,
                required: m,
                disabled: v,
                name: g,
                value: y,
                form: k,
                ...r,
                tabIndex: -1,
                ref: L,
                style: {
                    ...r.style,
                    ...E,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function R(e) {
        return "indeterminate" === e
    }

    function A(e) {
        return R(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    L.displayName = x, e.s(["Indicator", 0, w, "Root", 0, k])
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        i = e.i(723570),
        n = e => {
            var n, l, s;
            let o, u, {
                    present: d,
                    children: c
                } = e,
                f = function(e) {
                    var a, n;
                    let [l, s] = t.useState(), o = t.useRef(null), u = t.useRef(e), d = t.useRef("none"), [c, f] = (a = e ? "mounted" : "unmounted", n = {
                        mounted: {
                            UNMOUNT: "unmounted",
                            ANIMATION_OUT: "unmountSuspended"
                        },
                        unmountSuspended: {
                            MOUNT: "mounted",
                            ANIMATION_END: "unmounted"
                        },
                        unmounted: {
                            MOUNT: "mounted"
                        }
                    }, t.useReducer((e, t) => {
                        let a = n[e][t];
                        return null != a ? a : e
                    }, a));
                    return t.useEffect(() => {
                        let e = r(o.current);
                        d.current = "mounted" === c ? e : "none"
                    }, [c]), (0, i.useLayoutEffect)(() => {
                        let t = o.current,
                            a = u.current;
                        if (a !== e) {
                            let i = d.current,
                                n = r(t);
                            e ? f("MOUNT") : "none" === n || (null == t ? void 0 : t.display) === "none" ? f("UNMOUNT") : a && i !== n ? f("ANIMATION_OUT") : f("UNMOUNT"), u.current = e
                        }
                    }, [e, f]), (0, i.useLayoutEffect)(() => {
                        if (l) {
                            var e;
                            let t, a = null != (e = l.ownerDocument.defaultView) ? e : window,
                                i = e => {
                                    let i = r(o.current).includes(CSS.escape(e.animationName));
                                    if (e.target === l && i && (f("ANIMATION_END"), !u.current)) {
                                        let e = l.style.animationFillMode;
                                        l.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === l.style.animationFillMode && (l.style.animationFillMode = e)
                                        })
                                    }
                                },
                                n = e => {
                                    e.target === l && (d.current = r(o.current))
                                };
                            return l.addEventListener("animationstart", n), l.addEventListener("animationcancel", i), l.addEventListener("animationend", i), () => {
                                a.clearTimeout(t), l.removeEventListener("animationstart", n), l.removeEventListener("animationcancel", i), l.removeEventListener("animationend", i)
                            }
                        }
                        f("ANIMATION_END")
                    }, [l, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(c),
                        ref: t.useCallback(e => {
                            o.current = e ? getComputedStyle(e) : null, s(e)
                        }, [])
                    }
                }(d),
                p = "function" == typeof c ? c({
                    present: f.isPresent
                }) : t.Children.only(c),
                m = (0, a.useComposedRefs)(f.ref, (u = (o = null == (l = Object.getOwnPropertyDescriptor((n = p).props, "ref")) ? void 0 : l.get) && "isReactWarning" in o && o.isReactWarning) ? n.ref : (u = (o = null == (s = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : s.get) && "isReactWarning" in o && o.isReactWarning) ? n.props.ref : n.props.ref || n.ref);
            return "function" == typeof c || f.isPresent ? t.cloneElement(p, {
                ref: m
            }) : null
        };

    function r(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    n.displayName = "Presence", e.s(["Presence", 0, n])
}, 202289, e => {
    "use strict";
    var t = e.i(737586),
        a = e.i(944821),
        i = e.i(197649),
        n = e.i(416340),
        r = e.i(836157);
    let l = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        s = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        o = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        u = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: d,
            className: c,
            isChecked: f,
            isDisabled: p,
            size: m,
            hint: h,
            placement: v,
            onCheckedChange: g,
            id: y,
            ...k
        } = e, b = (0, a.default)(), w = y || b, x = d && n.default.createElement("label", {
            htmlFor: w,
            className: (0, i.default)("flex flex-col grow-1 gap-xsmall", !p && "cursor-pointer")
        }, n.default.createElement("span", {
            className: (0, i.default)(o[m], u[m], "content-emphasis")
        }, d), h && n.default.createElement("span", {
            className: "text-body-medium content-default"
        }, h));
        return n.default.createElement("div", {
            className: (0, i.default)("foundation-web-checkbox flex gap-medium", p && "opacity-[0.5]", !p && "cursor-pointer", c)
        }, "End" === v && x, n.default.createElement("div", {
            className: (0, i.default)(s[m])
        }, n.default.createElement(r.Root, {
            "data-slot": "checkbox",
            className: (0, i.default)(l[m], t.interactable, !p && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: w,
            checked: f,
            disabled: p,
            onCheckedChange: g,
            "aria-label": d,
            ...k
        }, n.default.createElement(t.StateLayer, null), n.default.createElement(r.Indicator, {
            "data-slot": "checkbox-indicator",
            className: (0, i.default)(l[m], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === v && x)
    }])
}, 960916, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let i = (0, a.forwardRef)((e, i) => {
        let {
            className: n,
            style: r,
            orientation: l = "horizontal",
            variant: s = "Standard",
            ...o
        } = e, u = "vertical" === l, d = {};
        return u || "Inset" !== s ? u || "InsetLeft" !== s ? u || "InsetRight" !== s || (d = {
            marginRight: "var(--padding-xlarge)"
        }) : d = {
            marginLeft: "var(--padding-xlarge)"
        } : d = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, a.default.createElement("div", {
            ref: i,
            ...o,
            role: "separator",
            "data-orientation": l,
            "aria-orientation": l,
            style: {
                borderRightWidth: 0,
                borderBottomWidth: 0,
                boxSizing: "border-box",
                borderStyle: "solid",
                ...u ? {
                    height: "100%",
                    width: 0,
                    borderLeftWidth: "var(--stroke-standard)",
                    borderTopWidth: 0
                } : "Thick" === s ? {
                    height: "var(--size-250)",
                    borderTop: "var(--stroke-standard)",
                    borderLeftWidth: 0,
                    background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                } : {
                    height: 0,
                    borderTopWidth: "var(--stroke-standard)",
                    borderLeftWidth: 0
                },
                ...d,
                ...r
            },
            className: (0, t.default)("stroke-default self-stretch", n)
        })
    });
    i.displayName = "Divider", e.s(["Divider", 0, i])
}, 732749, 222298, e => {
    "use strict";
    var t = e.i(737586),
        a = e.i(944821),
        i = e.i(461806),
        n = e.i(482076),
        r = e.i(197649),
        l = e.i(416340),
        s = e.i(563921);
    let o = (0, l.createContext)(null),
        u = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        d = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        c = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        f = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        p = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        m = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        h = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        v = (0, l.forwardRef)((e, v) => {
            let {
                label: g,
                labelTooltip: y,
                ariaLabelledBy: k,
                ariaLabel: b,
                className: w,
                size: x,
                variant: L = "Standard",
                value: R,
                placeholder: A,
                isDisabled: E,
                hasError: C,
                hint: I,
                onValueChange: T,
                onOpenChange: N,
                children: S
            } = e, P = (0, a.default)(), q = (0, l.useMemo)(() => ({
                size: x
            }), [x]), U = g ? l.default.createElement("span", {
                id: P,
                className: (0, r.default)(c[x], "content-emphasis")
            }, g) : null;
            return l.default.createElement(o.Provider, {
                value: q
            }, l.default.createElement("div", {
                className: (0, r.default)("flex flex-col", E && ["opacity-[0.5]", "pointer-events-none"], p[x], w)
            }, U && (y ? l.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, U, l.default.createElement(i.LabelTooltip, y)) : U), l.default.createElement(s.Root, {
                value: R,
                disabled: E,
                onValueChange: T,
                onOpenChange: N
            }, l.default.createElement(s.Trigger, {
                className: (0, r.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", n.INPUT_BACKGROUND_BY_VARIANT[L], n.INPUT_STROKE_BY_VARIANT[L], m[x], h[x], d[x], f[x], C ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === R ? "content-muted" : "content-default"),
                ref: v,
                "aria-labelledby": g ? P : k,
                "aria-label": b
            }, l.default.createElement(t.StateLayer, null), l.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, l.default.createElement(s.Value, {
                placeholder: A
            })), l.default.createElement(s.Icon, {
                className: (0, r.default)(u[x], "icon icon-regular-chevron-large-down content-default")
            })), l.default.createElement(s.Portal, null, l.default.createElement(s.Content, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, S))), I && l.default.createElement("span", {
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": C,
                    "content-default": !C
                })
            }, I)))
        });
    v.displayName = "Dropdown", e.s(["Dropdown", 0, v, "DropdownContext", 0, o], 222298);
    var g = e.i(23342),
        y = e.i(142953);
    let k = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        b = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        w = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        x = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        L = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        R = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        A = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        E = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        C = (0, l.createContext)(null),
        I = () => {
            let e = (0, l.useContext)(C);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        var t;
        let {
            children: a,
            className: i,
            size: n
        } = e, u = (0, l.useContext)(o), d = u ? "dropdown" : "standalone", c = null != (t = null != n ? n : null == u ? void 0 : u.size) ? t : "Medium", f = (0, l.useMemo)(() => ({
            size: c,
            mode: d
        }), [c, d]), p = (0, r.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", k[c], i), m = "standalone" === d ? l.default.createElement(y.Root, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, l.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: p
        }, a)) : l.default.createElement("div", {
            className: p
        }, a);
        return l.default.createElement(C.Provider, {
            value: f
        }, "dropdown" === d ? l.default.createElement(s.Viewport, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, m) : m)
    }, "MenuItem", 0, e => {
        let a, {
                value: i,
                leading: n,
                title: o,
                description: u,
                trailing: d,
                disabled: c,
                className: f,
                onSelect: p,
                asChild: m,
                children: h,
                ...v
            } = e,
            {
                size: k,
                mode: b
            } = I(),
            C = (0, r.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", A[k], w[k], x[k], L[k], E[k], c && "opacity-[0.5]", c && "pointer-events-none", f),
            T = l.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, o);
        switch (b) {
            case "dropdown":
                T = l.default.createElement(s.ItemText, {
                    asChild: !0
                }, T);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", b)
        }
        let N = l.default.createElement(l.default.Fragment, null, !c && l.default.createElement(t.StateLayer, null), n, l.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", R[k])
        }, T, u && l.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, u)), d);
        if (m) {
            let {
                as: e,
                ...i
            } = v, n = l.default.Children.only(h), r = void 0 === o && n.props.children;
            a = l.default.createElement(g.Slot, {
                ...i,
                role: "standalone" === b ? "menuitem" : void 0,
                "aria-disabled": c || void 0,
                className: C,
                style: {
                    outlineOffset: 0
                },
                onClick: c ? void 0 : p
            }, r ? l.default.cloneElement(n, {}, l.default.createElement(l.default.Fragment, null, !c && l.default.createElement(t.StateLayer, null), n.props.children)) : l.default.cloneElement(n, {}, N))
        } else if ("a" === v.as) {
            let {
                as: e,
                href: t,
                ...i
            } = v;
            a = l.default.createElement("a", {
                ...i,
                role: "standalone" === b ? "menuitem" : void 0,
                "aria-disabled": c,
                href: c ? void 0 : t,
                className: C,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: c ? void 0 : p
            }, N)
        } else {
            let {
                as: e,
                ...t
            } = v;
            a = l.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === b ? "menuitem" : void 0,
                "aria-disabled": c,
                className: C,
                style: {
                    outlineOffset: 0
                },
                onClick: c ? void 0 : p
            }, N)
        }
        return "dropdown" === b ? l.default.createElement(s.Item, {
            value: i,
            disabled: c,
            asChild: !0
        }, a) : l.default.createElement(y.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: i
        }, a)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: a,
            leading: i,
            trailing: n,
            disabled: s,
            className: o
        } = e, {
            size: u
        } = I(), d = (0, r.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", A[u], w[u], x[u], L[u], s && "opacity-[0.5]", o);
        return l.default.createElement("div", {
            role: "none",
            className: d
        }, i, l.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", R[u])
        }, l.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), a && l.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, a)), n)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: a
        } = e, {
            size: i
        } = I();
        return l.default.createElement("div", {
            role: "group",
            className: (0, r.default)(b[i], a)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return l.default.createElement("div", {
            role: "separator",
            className: (0, r.default)("foundation-web-menu-separator", t)
        })
    }], 732749)
}, 610932, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        i = e.i(734463);
    let n = e => {
        var t, a, i, n, r, l;
        let s = null != (t = null == (i = (n = window).matchMedia) || null == (a = i.call(n, "(pointer: coarse)")) ? void 0 : a.matches) && t,
            o = null == (r = document.activeElement) ? void 0 : r.matches(":focus-visible");
        if (s && !o) return void e.preventDefault();
        let u = null == (l = e.currentTarget) ? void 0 : l.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        u && (e.preventDefault(), u.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: n,
            onOpenChange: r,
            children: l
        } = e;
        return a.createElement(i.Root, {
            open: t,
            defaultOpen: n,
            onOpenChange: r
        }, l)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: t,
            className: n,
            children: r
        } = e;
        return a.createElement(i.Anchor, {
            asChild: t,
            className: n
        }, r)
    }, "PopoverContent", 0, function(e) {
        let {
            side: r = "bottom",
            align: l = "center",
            sideOffset: s = 4,
            className: o,
            children: u,
            ariaLabel: d,
            onOpenAutoFocus: c,
            ...f
        } = e;
        return a.createElement(i.Portal, null, a.createElement(i.Content, {
            side: r,
            align: l,
            sideOffset: s,
            ...f,
            "aria-label": null != d ? d : f["aria-label"],
            onOpenAutoFocus: null != c ? c : n,
            className: (0, t.default)("foundation-web-portal-zindex", o)
        }, u))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: n,
            className: r,
            children: l
        } = e;
        return a.createElement(i.Trigger, {
            asChild: t,
            disabled: n,
            className: r
        }, l)
    }])
}, 278300, e => {
    "use strict";
    var t = e.i(880343),
        a = e.i(737586),
        i = e.i(494118),
        n = e.i(197649),
        r = e.i(416340);
    let l = {
            Small: "XSmall",
            Medium: "Small"
        },
        s = {
            Small: "size-600",
            Medium: "size-800"
        },
        o = {
            Small: "text-label-small",
            Medium: "text-label-medium"
        },
        u = (e, t) => t ? "Page ".concat(e, ", current page") : "Go to page ".concat(e),
        d = (0, r.forwardRef)((e, t) => {
            let {
                currentPage: d,
                totalPages: c,
                onPageChange: f,
                navType: p = "MultiPage",
                size: m = "Medium",
                hasFirstLastButtons: h,
                firstPageLabel: v,
                previousPageLabel: g,
                nextPageLabel: y,
                lastPageLabel: k,
                pageLabel: b = u,
                isAlwaysVisible: w = !1,
                className: x,
                "aria-label": L,
                ...R
            } = e, A = Math.max(0, Math.floor(c)), E = Math.min(Math.max(1, Math.floor(d)), Math.max(1, A)), C = 0 === A || 1 === E, I = 0 === A || E === A;
            if (A <= 1 && !w) return null;
            let T = [];
            if ("MultiPage" === p) T = A <= 7 ? Array.from({
                length: A
            }, (e, t) => t + 1) : E <= 4 ? [1, 2, 3, 4, 5, "trailing-ellipsis", A] : E >= A - 3 ? [1, "leading-ellipsis", A - 4, A - 3, A - 2, A - 1, A] : [1, "leading-ellipsis", E - 1, E, E + 1, "trailing-ellipsis", A];
            else "SinglePage" === p && A > 0 && (T = [E]);
            let N = l[m];
            return r.default.createElement("nav", {
                ref: t,
                "aria-label": L,
                className: (0, n.default)("foundation-web-pagination inline-flex items-center gap-small", x),
                ...R
            }, r.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, h && r.default.createElement(i.IconButton, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: v,
                size: N,
                variant: "Utility",
                isCircular: !0,
                isDisabled: C,
                onClick: () => f(1)
            }), r.default.createElement(i.IconButton, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: g,
                size: N,
                variant: "Utility",
                isCircular: !0,
                isDisabled: C,
                onClick: () => f(E - 1)
            })), T.length > 0 && r.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, T.map(e => "number" != typeof e ? r.default.createElement("span", {
                key: e,
                "aria-hidden": "true",
                className: (0, n.default)("inline-flex items-center justify-center content-action-utility select-none", s[m], o[m])
            }, "…") : e === E ? r.default.createElement("span", {
                key: e,
                role: "img",
                "aria-current": "page",
                "aria-label": b(e, !0),
                className: (0, n.default)("inline-flex items-center justify-center radius-circle bg-inverse-surface-0 content-inverse-emphasis select-none", s[m], o[m])
            }, e) : r.default.createElement("button", {
                key: e,
                type: "button",
                "aria-label": b(e, !1),
                className: (0, n.default)("relative clip group/interactable focus-visible:outline-focus disabled:outline-none", "relative inline-flex items-center justify-center radius-circle stroke-none bg-none content-action-utility cursor-pointer", s[m], o[m]),
                onClick: () => f(e)
            }, r.default.createElement(a.StateLayer, null), e))), r.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, r.default.createElement(i.IconButton, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: y,
                size: N,
                variant: "Utility",
                isCircular: !0,
                isDisabled: I,
                onClick: () => f(E + 1)
            }), h && r.default.createElement(i.IconButton, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: k,
                size: N,
                variant: "Utility",
                isCircular: !0,
                isDisabled: I,
                onClick: () => f(A)
            })))
        });
    d.displayName = "Pagination";
    let c = (0, r.createContext)(null),
        f = e => {
            let t = (0, r.useContext)(c);
            if (!t) throw Error("".concat(e, " must be used within a <Table>"));
            return t
        },
        p = {
            XSmall: "height-800",
            Small: "height-1200",
            Medium: "height-1500"
        },
        m = {
            XSmall: "padding-x-medium",
            Small: "padding-x-large",
            Medium: "padding-x-xlarge"
        },
        h = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        v = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        g = {
            XSmall: "text-body-small",
            Small: "text-body-medium",
            Medium: "text-body-medium"
        },
        y = {
            start: "text-align-x-start",
            center: "text-align-x-center",
            end: "text-align-x-end"
        },
        k = {
            start: "justify-start",
            center: "justify-center",
            end: "justify-end"
        },
        b = (0, r.forwardRef)((e, t) => {
            let {
                children: a,
                size: i = "Medium",
                variant: l = "Divided",
                className: s,
                ...o
            } = e, u = (0, r.useMemo)(() => ({
                size: i,
                variant: l
            }), [i, l]), d = "Framed" === l;
            return r.default.createElement(c.Provider, {
                value: u
            }, r.default.createElement("div", {
                className: (0, n.default)("width-full bg-surface-100", d && "radius-medium clip stroke-standard stroke-default")
            }, r.default.createElement("table", {
                ref: t,
                className: (0, n.default)("foundation-web-table width-full content-default", s),
                ...o
            }, a)))
        });
    b.displayName = "Table";
    let w = (0, r.forwardRef)((e, t) => {
        let {
            children: a,
            className: i,
            ...l
        } = e;
        return f("TableHeader"), r.default.createElement("thead", {
            ref: t,
            className: (0, n.default)("foundation-web-table-header", i),
            ...l
        }, a)
    });
    w.displayName = "TableHeader";
    let x = (0, r.forwardRef)((e, t) => {
        let {
            children: a,
            className: i,
            ...l
        } = e;
        return f("TableBody"), r.default.createElement("tbody", {
            ref: t,
            className: (0, n.default)("foundation-web-table-body", i),
            ...l
        }, a)
    });
    x.displayName = "TableBody";
    let L = (0, r.forwardRef)((e, t) => {
        let {
            children: a,
            className: i,
            isInteractive: l = !1,
            isHoverable: s = !1,
            isSelected: o = !1,
            isDisabled: u = !1,
            onClick: d,
            onKeyDown: c,
            tabIndex: p,
            role: m,
            ...h
        } = e;
        f("TableRow");
        let v = l ? {
            role: null != m ? m : "row",
            tabIndex: null != p ? p : 0,
            onClick: u ? void 0 : d,
            onKeyDown: e => {
                u || (null == c || c(e), e.defaultPrevented || ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == d || d(e)))
            }
        } : {
            role: m,
            tabIndex: p,
            onClick: d,
            onKeyDown: c
        };
        return r.default.createElement("tr", {
            ref: t,
            "aria-selected": l ? o : void 0,
            "aria-disabled": !!l && !!u || void 0,
            "data-selected": o || void 0,
            className: (0, n.default)("foundation-web-table-row", (l || s) && "hover:bg-shift-100", l && !u && "cursor-pointer", l && u && "opacity-disabled pointer-events-none", o && "bg-shift-200", i),
            ...v,
            ...h
        }, a)
    });
    L.displayName = "TableRow";
    let R = (0, r.forwardRef)((e, a) => {
        let {
            children: i,
            className: l,
            sortDirection: s,
            onSort: o,
            align: u = "start",
            sortLabel: d,
            scope: c,
            ...p
        } = e, {
            size: g
        } = f("TableHeaderCell"), b = !!o, w = null != s ? s : "none", x = b && "none" !== w && r.default.createElement(t.Icon, {
            name: "ascending" === w ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), L = r.default.createElement("div", {
            className: (0, n.default)("flex items-center gap-xsmall", v[g], "content-muted", k[u])
        }, "end" === u && x, r.default.createElement("span", {
            className: "text-truncate-end"
        }, i), "end" !== u && x), R = "string" == typeof i ? "Sort by ".concat(i) : void 0;
        return r.default.createElement("th", {
            ref: a,
            scope: null != c ? c : "col",
            "aria-sort": b ? w : void 0,
            className: (0, n.default)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", h[g], m[g], y[u], "content-muted", l),
            ...p
        }, b ? r.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: o,
            "aria-label": null != d ? d : R
        }, L) : L)
    });
    R.displayName = "TableHeaderCell";
    let A = (0, r.forwardRef)((e, t) => {
        let {
            children: a,
            className: i,
            align: l = "start",
            ...s
        } = e, {
            size: o
        } = f("TableCell");
        return r.default.createElement("td", {
            ref: t,
            className: (0, n.default)("foundation-web-table-cell foundation-web-table-row-divider", p[o], m[o], g[o], y[l], "content-default", i),
            ...s
        }, a)
    });
    A.displayName = "TableCell";
    let E = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-large"
        },
        C = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        I = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-small"
        },
        T = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        N = (0, r.forwardRef)((e, t) => {
            let {
                size: a = "Medium",
                page: i,
                rowsPerPage: l,
                totalRows: s,
                rowsPerPageOptions: o = [10, 25, 50],
                onPageChange: u,
                onRowsPerPageChange: c,
                paginationAriaLabel: f,
                rowsPerPageLabel: p = "Rows per page",
                firstPageLabel: m = "First page",
                previousPageLabel: h = "Previous page",
                nextPageLabel: v = "Next page",
                lastPageLabel: g = "Last page",
                rangeLabel: y,
                className: k,
                ...b
            } = e, w = Math.max(1, Math.ceil(s / l)), x = 0 === s ? 0 : i * l + 1, L = Math.min((i + 1) * l, s), R = (0, r.useCallback)(e => {
                let t = Number(e.target.value);
                null == c || c(t), u(0)
            }, [c, u]);
            return r.default.createElement("div", {
                ref: t,
                className: (0, n.default)("flex items-center justify-end", E[a], C[a], k),
                ...b
            }, r.default.createElement("div", {
                className: "flex items-center gap-large"
            }, r.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, c && r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: (0, n.default)(I[a], "content-default")
            }, p), r.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, r.default.createElement("select", {
                className: (0, n.default)("foundation-web-table-pagination-select", I[a], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === a ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: l,
                onChange: R,
                "aria-label": p
            }, o.map(e => r.default.createElement("option", {
                key: e,
                value: e
            }, e))))), r.default.createElement("span", {
                className: (0, n.default)(T[a], "content-default")
            }, y ? y(x, L, s) : "".concat(x, "-").concat(L, " of ").concat(s))), r.default.createElement(d, {
                "aria-label": f,
                currentPage: i + 1,
                totalPages: w,
                navType: "NoPage",
                size: "Medium" === a ? "Medium" : "Small",
                hasFirstLastButtons: !0,
                isAlwaysVisible: !0,
                firstPageLabel: m,
                previousPageLabel: h,
                nextPageLabel: v,
                lastPageLabel: g,
                onPageChange: e => u(e - 1)
            })))
        });
    N.displayName = "TablePagination", e.s(["Table", 0, b, "TableBody", 0, x, "TableCell", 0, A, "TableHeader", 0, w, "TableHeaderCell", 0, R, "TablePagination", 0, N, "TableRow", 0, L], 278300)
}, 756199, e => {
    "use strict";
    var t = e.i(999544),
        a = e.i(880343),
        i = e.i(944821),
        n = e.i(461806),
        r = e.i(482076),
        l = e.i(197649),
        s = e.i(416340);
    let o = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        u = {
            XSmall: "gap-x-xsmall",
            Small: "gap-x-small",
            Medium: "gap-x-small",
            Large: "gap-x-small"
        },
        d = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        c = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        f = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        p = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        m = (0, s.forwardRef)((e, m) => {
            let {
                label: h,
                labelTooltip: v,
                leadingIconName: g,
                trailingIconName: y,
                leadingIconNode: k,
                trailingIconNode: b,
                hasError: w,
                error: x,
                helperText: L,
                size: R,
                variant: A = "Standard",
                isRequired: E,
                isDisabled: C,
                className: I,
                style: T,
                inputContainerClassName: N,
                inputContainerClassStyle: S,
                id: P,
                ...q
            } = e, U = (0, i.default)(), B = P || U, M = "".concat(B, "-description"), O = null != R ? R : "Large", G = w || !!x, D = x || L, j = (0, s.useMemo)(() => g ? s.default.createElement(a.Icon, {
                name: g,
                size: O,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : k, [g, k, O]), K = (0, s.useMemo)(() => y ? s.default.createElement(a.Icon, {
                name: y,
                size: O,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : b, [O, y, b]), X = h ? s.default.createElement("label", {
                htmlFor: B,
                className: (0, l.default)(f[O], "content-emphasis")
            }, h, E && s.default.createElement(s.default.Fragment, null, " ", s.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return s.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, l.default)("flex width-full flex-col gap-small ".concat(I), {
                    [t.disabledOpacity]: C
                }),
                style: T
            }, X && (v ? s.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, X, s.default.createElement(n.LabelTooltip, v)) : X), s.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, l.default)("foundation-web-input flex items-center width-full", r.INPUT_STROKE_BY_VARIANT[A], r.INPUT_BACKGROUND_BY_VARIANT[A], N, d[O], c[O], o[O], u[O], G ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: S
            }, j, s.default.createElement("input", {
                type: "text",
                id: B,
                ref: m,
                className: (0, l.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", p[O]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": G,
                "aria-describedby": D ? M : void 0,
                required: E,
                ...q,
                disabled: C
            }), K), D && s.default.createElement("span", {
                id: M,
                className: (0, l.default)("text-caption-small", {
                    "content-system-alert": G,
                    "content-default": !G
                })
            }, D))
        });
    m.displayName = "TextInput", e.s(["TextInput", 0, m])
}, 776569, 560130, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);

    function i(e) {
        let {
            className: i
        } = e;
        return a.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, t.default)("block", i),
            style: {
                marginTop: -1
            }
        }, a.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }
    e.s(["Beak", 0, i], 560130);
    var n = e.i(989665);
    e.s(["Tooltip", 0, function(e) {
        let {
            position: r,
            hasBeak: l = !0,
            title: s,
            description: o,
            ariaLabel: u,
            delayDurationMs: d = 500,
            children: c,
            open: f,
            onOpenChange: p,
            contentClassName: m
        } = e, [h, v] = r.split("-"), g = null != u ? u : "string" == typeof s && null == o ? s : void 0;
        return a.createElement(n.Provider, {
            delayDuration: d
        }, a.createElement(n.Root, {
            open: f,
            onOpenChange: p
        }, c, a.createElement(n.Portal, null, a.createElement(n.Content, {
            side: h,
            align: v,
            "aria-label": g,
            className: (0, t.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", m),
            sideOffset: 5
        }, l && a.createElement(n.Arrow, {
            asChild: !0
        }, a.createElement(i, {
            className: "content-[var(--inverse-surface-0)]"
        })), a.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, a.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, s), o && a.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, o))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: i,
            className: r
        } = e;
        return a.createElement(n.Trigger, {
            asChild: i,
            className: r
        }, t)
    }], 776569)
}, 461806, e => {
    "use strict";
    var t = e.i(880343),
        a = e.i(776569),
        i = e.i(416340);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: n,
            description: r,
            position: l = "top-center"
        } = e;
        return i.default.createElement(a.Tooltip, {
            position: l,
            title: n,
            description: r
        }, i.default.createElement(a.TooltipTrigger, {
            asChild: !0
        }, i.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": n,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, i.default.createElement(t.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }])
}, 482076, e => {
    "use strict";
    e.s(["INPUT_BACKGROUND_BY_VARIANT", 0, {
        Standard: "bg-none",
        Contrast: "bg-shift-200",
        Utility: "bg-none"
    }, "INPUT_STROKE_BY_VARIANT", 0, {
        Standard: "stroke-standard",
        Contrast: "stroke-none",
        Utility: "stroke-none"
    }, "INPUT_VARIANTS", 0, ["Standard", "Contrast", "Utility"]])
}, 944821, e => {
    "use strict";
    var t = e.i(416340);
    let a = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            i = (0, t.useRef)();
        return i.current || (a += 1, i.current = "".concat(e).concat(a)), i.current
    }])
}, 95063, e => {
    "use strict";
    var t = e.i(670236);
    e.s(["NavigateNextIcon", () => t.N])
}, 940685, e => {
    "use strict";
    var t = e.i(484613);
    e.s(["NavigateBeforeIcon", () => t.NavigateBefore])
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function a(e, t) {
        let {
            pages: a,
            pageParams: i
        } = t, n = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[n], a, i[n], i) : void 0
    }

    function i(e, t) {
        var a;
        let {
            pages: i,
            pageParams: n
        } = t;
        return i.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, i[0], i, n[0], n) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != i(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (n, r) => {
                var l, s, o, u, d;
                let c = n.options,
                    f = null == (o = n.fetchOptions) || null == (s = o.meta) || null == (l = s.fetchMore) ? void 0 : l.direction,
                    p = (null == (u = n.state.data) ? void 0 : u.pages) || [],
                    m = (null == (d = n.state.data) ? void 0 : d.pageParams) || [],
                    h = {
                        pages: [],
                        pageParams: []
                    },
                    v = 0,
                    g = async () => {
                        let r = !1,
                            l = (0, t.ensureQueryFn)(n.options, n.fetchOptions),
                            s = async (e, a, i) => {
                                let s;
                                if (r) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(s = {
                                        client: n.client,
                                        queryKey: n.queryKey,
                                        pageParam: a,
                                        direction: i ? "backward" : "forward",
                                        meta: n.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (n.signal.aborted ? r = !0 : n.signal.addEventListener("abort", () => {
                                            r = !0
                                        }), n.signal)
                                    }), s),
                                    u = await l(o),
                                    {
                                        maxPages: d
                                    } = n.options,
                                    c = i ? t.addToStart : t.addToEnd;
                                return {
                                    pages: c(e.pages, u, d),
                                    pageParams: c(e.pageParams, a, d)
                                }
                            };
                        if (f && p.length) {
                            let e = "backward" === f,
                                t = {
                                    pages: p,
                                    pageParams: m
                                },
                                n = (e ? i : a)(c, t);
                            h = await s(t, n, e)
                        } else {
                            let t = null != e ? e : p.length;
                            do {
                                var o;
                                let e = 0 === v ? null != (o = m[0]) ? o : c.initialPageParam : a(c, h);
                                if (v > 0 && null == e) break;
                                h = await s(h, e), v++
                            } while (v < t)
                        }
                        return h
                    };
                n.options.persister ? n.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = n.options).persister) ? void 0 : e.call(t, g, {
                        client: n.client,
                        queryKey: n.queryKey,
                        meta: n.options.meta,
                        signal: n.signal
                    }, r)
                } : n.fetchFn = g
            }
        }
    }])
}, 630986, e => {
    "use strict";
    var t = e.i(468612),
        a = e.i(117437),
        i = class extends t.QueryObserver {
            bindMethods() {
                super.bindMethods(), this.fetchNextPage = this.fetchNextPage.bind(this), this.fetchPreviousPage = this.fetchPreviousPage.bind(this)
            }
            setOptions(e) {
                super.setOptions({
                    ...e,
                    behavior: (0, a.infiniteQueryBehavior)()
                })
            }
            getOptimisticResult(e) {
                return e.behavior = (0, a.infiniteQueryBehavior)(), super.getOptimisticResult(e)
            }
            fetchNextPage(e) {
                return this.fetch({
                    ...e,
                    meta: {
                        fetchMore: {
                            direction: "forward"
                        }
                    }
                })
            }
            fetchPreviousPage(e) {
                return this.fetch({
                    ...e,
                    meta: {
                        fetchMore: {
                            direction: "backward"
                        }
                    }
                })
            }
            createResult(e, t) {
                var i, n;
                let {
                    state: r
                } = e, l = super.createResult(e, t), {
                    isFetching: s,
                    isRefetching: o,
                    isError: u,
                    isRefetchError: d
                } = l, c = null == (n = r.fetchMeta) || null == (i = n.fetchMore) ? void 0 : i.direction, f = u && "forward" === c, p = s && "forward" === c, m = u && "backward" === c, h = s && "backward" === c;
                return {
                    ...l,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, a.hasNextPage)(t, r.data),
                    hasPreviousPage: (0, a.hasPreviousPage)(t, r.data),
                    isFetchNextPageError: f,
                    isFetchingNextPage: p,
                    isFetchPreviousPageError: m,
                    isFetchingPreviousPage: h,
                    isRefetchError: d && !f && !m,
                    isRefetching: o && !p && !h
                }
            }
            constructor(e, t) {
                super(e, t)
            }
        },
        n = e.i(624083);
    e.s(["useInfiniteQuery", 0, function(e, t) {
        return (0, n.useBaseQuery)(e, i, t)
    }], 630986)
}]);

//# debugId=2462ed4e-cdff-2dd9-52b1-f52ea45a2154
//# sourceMappingURL=2c7it91dd-q25.js.map