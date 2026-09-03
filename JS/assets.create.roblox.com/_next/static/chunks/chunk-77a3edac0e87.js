;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "893ed8df-bdfa-fc59-0e48-6039aa99adba")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 358763, e => {
    "use strict";
    var t = e.i(416340),
        i = e.i(296380);
    let n = () => {};
    e.s(["default", 0, function(e, r) {
        let {
            debounceDelay: a,
            intersectionObserverThreshold: s,
            resetOncePer: o
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, l = (0, t.useRef)(!1), u = (0, t.useCallback)(e => {
            !e || l.current || (l.current = !0, r())
        }, [r]), [f] = (0, i.default)(u, null != a ? a : 250), c = (0, t.useCallback)(e => {
            let [t] = e;
            f(t.isIntersecting)
        }, [f]), d = null != o ? o : "instance";
        (0, t.useMemo)(() => {
            "callback" === d && (l.current = !1)
        }, [r]), (0, t.useEffect)(() => {
            if (!e.current) return n;
            let t = new IntersectionObserver(c, {
                threshold: null != s ? s : .5
            });
            return t.observe(e.current), () => {
                t.disconnect()
            }
        }, [e, s, c])
    }])
}, 756568, e => {
    "use strict";
    var t = e.i(776344);
    e.s(["Flex", () => t.default])
}, 296380, e => {
    "use strict";
    var t = e.i(416340);
    let i = (e, i) => {
        let n = (0, t.useRef)(null),
            r = (0, t.useCallback)(() => {
                null !== n.current && (clearTimeout(n.current), n.current = null)
            }, [n]);
        return [(0, t.useCallback)(function() {
            for (var t = arguments.length, a = Array(t), s = 0; s < t; s++) a[s] = arguments[s];
            r(), n.current = window.setTimeout(() => {
                e(...a), n.current = null
            }, i)
        }, [e, i, r]), r, n]
    };
    e.s(["default", 0, i, "useDebouncedFunction", 0, i])
}, 780880, e => {
    "use strict";
    var t = e.i(198528);
    e.s(["useQueryParams", () => t.default])
}, 361975, 540459, e => {
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

    function n(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        i(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function r(e, t, i, n) {
        return new(i || (i = Promise))(function(r, a) {
            function s(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function o(e) {
                try {
                    l(n.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function l(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(s, o)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var i, n, r, a = {
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
            return function(l) {
                var u = [o, l];
                if (i) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, u[0] && (a = 0)), a;) try {
                    if (i = 1, n && (r = 2 & u[0] ? n.return : u[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, u[1])).done) return r;
                    switch (n = 0, r && (u = [2 & u[0], r.value]), u[0]) {
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
                            a.label++, n = u[1], u = [0];
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
                    u = [6, e], n = 0
                } finally {
                    i = r = 0
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

    function s(e, t) {
        return null == e ? e : {
            universeId: e.universeId,
            universeName: e.universeName,
            rootPlaceId: e.rootPlaceId
        }
    }

    function o(e) {
        var i;
        return null == (i = e) ? i : {
            campaignName: i.campaignName,
            linkId: i.linkId,
            linkType: i.linkType,
            createdUtc: new Date(i.createdUtc),
            updatedUtc: new Date(i.updatedUtc),
            universe: (0, t.exists)(i, "universe") ? s(i.universe) : void 0,
            referralCode: i.referralCode,
            referralCodeType: i.referralCodeType,
            launchData: (0, t.exists)(i, "launchData") ? i.launchData : void 0,
            creatorKey: (0, t.exists)(i, "creatorKey") ? i.creatorKey : void 0,
            creatorType: (0, t.exists)(i, "creatorType") ? i.creatorType : void 0,
            fallbackType: (0, t.exists)(i, "fallbackType") ? i.fallbackType : void 0
        }
    }

    function l(e) {
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

    function f(e, i) {
        return null == e ? e : {
            campaignName: e.campaignName,
            linkId: e.linkId,
            linkType: e.linkType,
            createdUtc: new Date(e.createdUtc),
            updatedUtc: new Date(e.updatedUtc),
            universe: (0, t.exists)(e, "universe") ? s(e.universe) : void 0,
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
            affiliateLink: f(e.affiliateLink)
        }
    }

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorId: e.creatorId,
            creatorType: e.creatorType
        }
    }

    function p(e, i) {
        return null == e ? e : {
            experienceEventId: (0, t.exists)(e, "experienceEventId") ? e.experienceEventId : void 0,
            launchData: (0, t.exists)(e, "launchData") ? e.launchData : void 0
        }
    }

    function h(e, t) {
        return null == e ? e : {
            isEligibleToCreate: e.isEligibleToCreate,
            isAllowedToCreateForAnyExperience: e.isAllowedToCreateForAnyExperience
        }
    }

    function k(e) {
        return e
    }

    function v(e, i) {
        return null == e ? e : {
            affiliateLinks: e.affiliateLinks.map(o),
            totalCount: e.totalCount,
            nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function y(e, t) {
        return null == e ? e : {
            affiliateLink: f(e.affiliateLink)
        }
    }
    var L = function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        return n(i, e), i.prototype.affiliateLinksCreateAffiliateLinkByGroupRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksCreateAffiliateLinkByGroup.");
                            if (null === e.affiliateLinksCreateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksCreateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksCreateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksCreateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksCreateAffiliateLinkByGroup.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: l(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return c(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksCreateAffiliateLinkByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksCreateAffiliateLinkByGroupRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksCreateAffiliateLinkByUserRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.affiliateLinksCreateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksCreateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksCreateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksCreateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksCreateAffiliateLinkByUser.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: l(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return c(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksCreateAffiliateLinkByUser = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksCreateAffiliateLinkByUserRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetCreatorMetadataByGroupRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksGetCreatorMetadataByGroup.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/links/metadata".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links/metadata",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetCreatorMetadataByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksGetCreatorMetadataByGroupRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetCreatorMetadataByUserRaw = function(e) {
            return r(this, void 0, void 0, function() {
                var i, n, r;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/links/metadata",
                                schemaPath: "/v1/links/metadata",
                                method: "GET",
                                headers: n,
                                query: i
                            }, e)];
                        case 1:
                            return r = a.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetCreatorMetadataByUser = function(e) {
            return r(this, void 0, void 0, function() {
                return a(this, function(t) {
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
        }, i.prototype.affiliateLinksGetEligibilityByGroupRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksGetEligibilityByGroup.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/eligibility".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/eligibility",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    isEligible: e.IsEligible
                                }
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetEligibilityByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksGetEligibilityByGroupRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetRequirementsByUserRaw = function(e) {
            return r(this, void 0, void 0, function() {
                var i, n, r;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/links/requirements",
                                schemaPath: "/v1/links/requirements",
                                method: "GET",
                                headers: n,
                                query: i
                            }, e)];
                        case 1:
                            return r = a.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    requirements: e.Requirements.map(k)
                                }
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetRequirementsByUser = function(e) {
            return r(this, void 0, void 0, function() {
                return a(this, function(t) {
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
        }, i.prototype.affiliateLinksGetUniverseEligibilityByIdRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling affiliateLinksGetUniverseEligibilityById.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/eligibility".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/eligibility",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    isEligible: e.IsEligible
                                }
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetUniverseEligibilityById = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksGetUniverseEligibilityByIdRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksListAffiliateLinksByGroupRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksListAffiliateLinksByGroup.");
                            return n = {}, void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.pageToken && (n.pageToken = e.pageToken), r = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksListAffiliateLinksByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksListAffiliateLinksByGroupRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksListAffiliateLinksByUserRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.pageToken && (n.pageToken = e.pageToken), r = {}, [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksListAffiliateLinksByUser = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksListAffiliateLinksByUserRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksResolveAffiliateLinkByReferralCodeRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling affiliateLinksResolveAffiliateLinkByReferralCode.");
                            return n = {}, void 0 !== e.referralCode && (n.referralCode = e.referralCode), r = {}, [4, this.request({
                                path: "/v1/links/resolve",
                                schemaPath: "/v1/links/resolve",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
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
        }, i.prototype.affiliateLinksResolveAffiliateLinkByReferralCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksResolveAffiliateLinkByReferralCodeRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksUpdateAffiliateLinkByGroupRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksUpdateAffiliateLinkByGroup.");
                            if (null === e.affiliateLinksUpdateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksUpdateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksUpdateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksUpdateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksUpdateAffiliateLinkByGroup.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "PUT",
                                headers: r,
                                query: n,
                                body: u(e.affiliateLinksUpdateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksUpdateAffiliateLinkByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksUpdateAffiliateLinkByGroupRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksUpdateAffiliateLinkByUserRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.affiliateLinksUpdateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksUpdateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksUpdateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksUpdateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksUpdateAffiliateLinkByUser.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "PUT",
                                headers: r,
                                query: n,
                                body: u(e.affiliateLinksUpdateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksUpdateAffiliateLinkByUser = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksUpdateAffiliateLinkByUserRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i
    }(t.BaseAPI);
    (function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(i, e), i.prototype.eventsAuthenticatedVisitRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.eventsAuthenticatedVisitRequest || void 0 === e.eventsAuthenticatedVisitRequest) throw new t.RequiredError("eventsAuthenticatedVisitRequest", "Required parameter requestParameters.eventsAuthenticatedVisitRequest was null or undefined when calling eventsAuthenticatedVisit.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/events/authenticated-visit",
                                schemaPath: "/v1/events/authenticated-visit",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        linkId: e.linkId,
                                        referralUrl: e.referralUrl,
                                        linkType: e.linkType,
                                        userDidLogIn: e.userDidLogIn
                                    }
                                }(e.eventsAuthenticatedVisitRequest)
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.VoidApiResponse(s)]
                    }
                })
            })
        }, i.prototype.eventsAuthenticatedVisit = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.eventsAuthenticatedVisitRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }, i.prototype.eventsPostQualifiedSignupRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.eventsPostQualifiedSignupRequest || void 0 === e.eventsPostQualifiedSignupRequest) throw new t.RequiredError("eventsPostQualifiedSignupRequest", "Required parameter requestParameters.eventsPostQualifiedSignupRequest was null or undefined when calling eventsPostQualifiedSignup.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/events/qualified-signup",
                                schemaPath: "/v1/events/qualified-signup",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        linkId: e.linkId,
                                        referralUrl: e.referralUrl,
                                        linkType: e.linkType
                                    }
                                }(e.eventsPostQualifiedSignupRequest)
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.VoidApiResponse(s)]
                    }
                })
            })
        }, i.prototype.eventsPostQualifiedSignup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.eventsPostQualifiedSignupRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }
    })(t.BaseAPI),
    function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(i, e), i.prototype.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest || void 0 === e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest) throw new t.RequiredError("internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest", "Required parameter requestParameters.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest was null or undefined when calling internalAffiliateLinksCreateAffiliateLinkWithCustomCode.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/vanity",
                                schemaPath: "/v1/internal/links/vanity",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        campaignName: e.campaignName,
                                        creator: d(e.creator),
                                        vanityCode: e.vanityCode,
                                        launchData: e.launchData,
                                        fallbackType: e.fallbackType
                                    }
                                }(e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest)
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return c(e)
                            })]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksCreateAffiliateLinkWithCustomCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksDeleteAffiliateLinkRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.linkId || void 0 === e.linkId) throw new t.RequiredError("linkId", "Required parameter requestParameters.linkId was null or undefined when calling internalAffiliateLinksDeleteAffiliateLink.");
                            return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/{linkId}".replace("{".concat("linkId", "}"), encodeURIComponent(String(e.linkId))),
                                schemaPath: "/v1/internal/links/{linkId}",
                                method: "DELETE",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.VoidApiResponse(s)]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksDeleteAffiliateLink = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksDeleteAffiliateLinkRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksGetAffiliateLinkForReferralCodeRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling internalAffiliateLinksGetAffiliateLinkForReferralCode.");
                            return n = {}, void 0 !== e.referralCode && (n.referralCode = e.referralCode), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/share",
                                schemaPath: "/v1/internal/links/share",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    linkId: e.linkId,
                                    linkType: e.linkType
                                }
                            })]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksGetAffiliateLinkForReferralCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksGetAffiliateLinkForReferralCodeRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkByReferralCode.");
                            if (null === e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest || void 0 === e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest) throw new t.RequiredError("internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest", "Required parameter requestParameters.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkByReferralCode.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/referral-code/{referralCode}".replace("{".concat("referralCode", "}"), encodeURIComponent(String(e.referralCode))),
                                schemaPath: "/v1/internal/links/referral-code/{referralCode}",
                                method: "PATCH",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        launchData: e.launchData,
                                        creator: d(e.creator),
                                        fallbackType: e.fallbackType
                                    }
                                }(e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest)
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksUpdateAffiliateLinkByReferralCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksUpdateAffiliateLinkReferralCodeRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.linkId || void 0 === e.linkId) throw new t.RequiredError("linkId", "Required parameter requestParameters.linkId was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkReferralCode.");
                            return n = {}, void 0 !== e.linkId && (n.linkId = e.linkId), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links",
                                schemaPath: "/v1/internal/links",
                                method: "PUT",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.VoidApiResponse(s)]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksUpdateAffiliateLinkReferralCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksUpdateAffiliateLinkReferralCodeRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }
    }(t.BaseAPI),
    function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(i, e), i.prototype.privacyTaskWebhookEraseUserDataRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/erase-user-data",
                                schemaPath: "/v1/erase-user-data",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        privacyTaskId: e.privacyTaskId,
                                        userKey: e.userKey,
                                        userId: e.userId
                                    }
                                }(e.privacyTaskWebhookEraseUserDataRequest)
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    state: (0, t.exists)(e, "state") ? e.state : void 0
                                }
                            })]
                    }
                })
            })
        }, i.prototype.privacyTaskWebhookEraseUserData = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.privacyTaskWebhookEraseUserDataRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI), e.s(["AffiliateLinksApi", 0, L, "FallbackType", 0, {
        Invalid: "Invalid",
        Profile: "Profile",
        Home: "Home"
    }, "ReferralCodeType", 0, {
        Custom: "Custom",
        Random: "Random"
    }, "Requirements", 0, {
        Restricted: "Restricted",
        Email: "Email",
        Id: "Id",
        UserAgreement: "UserAgreement",
        ModerationStatus: "ModerationStatus",
        Payable: "Payable"
    }], 540459);
    let w = new L((0, e.i(272593).createClientConfiguration)("affiliate-links", "bedev2"));
    e.s(["createAffiliateLink", 0, e => w.affiliateLinksCreateAffiliateLinkByUser({
        affiliateLinksCreateAffiliateLinkByUserRequest: e
    }), "createGroupAffiliateLink", 0, e => {
        let {
            groupId: t,
            ...i
        } = e;
        return w.affiliateLinksCreateAffiliateLinkByGroup({
            groupId: t,
            affiliateLinksCreateAffiliateLinkByUserRequest: i
        })
    }, "editAffiliateLink", 0, e => w.affiliateLinksUpdateAffiliateLinkByUser({
        affiliateLinksUpdateAffiliateLinkByUserRequest: e
    }), "editGroupAffiliateLink", 0, e => {
        let {
            groupId: t,
            ...i
        } = e;
        return w.affiliateLinksUpdateAffiliateLinkByGroup({
            groupId: t,
            affiliateLinksUpdateAffiliateLinkByUserRequest: i
        })
    }, "getAffiliateLinks", 0, e => w.affiliateLinksListAffiliateLinksByUser(e), "getGroupAffiliateLinks", 0, e => w.affiliateLinksListAffiliateLinksByGroup(e), "getGroupCreatorMetadata", 0, e => w.affiliateLinksGetCreatorMetadataByGroup({
        groupId: e
    }), "getGroupEligibility", 0, e => w.affiliateLinksGetEligibilityByGroup({
        groupId: e
    }), "getRequirements", 0, () => w.affiliateLinksGetRequirementsByUser(), "getUniverseEligibility", 0, e => w.affiliateLinksGetUniverseEligibilityById({
        universeId: e
    }), "getUserCreatorMetadata", 0, () => w.affiliateLinksGetCreatorMetadataByUser()], 361975)
}, 27281, e => {
    "use strict";
    var t = e.i(437272);
    e.s(["NavigateNextIcon", () => t.N])
}, 774807, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["ArrowDownwardIcon", () => t.ArrowDownward])
}, 558826, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["ArrowUpwardIcon", () => t.ArrowUpward])
}, 93235, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["NavigateBeforeIcon", () => t.NavigateBefore])
}]);

//# debugId=893ed8df-bdfa-fc59-0e48-6039aa99adba
//# sourceMappingURL=2cpx9afy24dpt.js.map