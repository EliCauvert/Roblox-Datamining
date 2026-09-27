;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "8326b69d-8888-a66d-2d63-4f4fc2e7167f")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 358763, e => {
    "use strict";
    var t = e.i(416340),
        i = e.i(296380);
    let n = () => {};
    e.s(["default", 0, function(e, a) {
        let {
            debounceDelay: r,
            intersectionObserverThreshold: l,
            resetOncePer: s
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, o = (0, t.useRef)(!1), u = (0, t.useCallback)(e => {
            !e || o.current || (o.current = !0, a())
        }, [a]), [f] = (0, i.default)(u, null != r ? r : 250), d = (0, t.useCallback)(e => {
            let [t] = e;
            f(t.isIntersecting)
        }, [f]), c = null != s ? s : "instance";
        (0, t.useMemo)(() => {
            "callback" === c && (o.current = !1)
        }, [a]), (0, t.useEffect)(() => {
            if (!e.current) return n;
            let t = new IntersectionObserver(d, {
                threshold: null != l ? l : .5
            });
            return t.observe(e.current), () => {
                t.disconnect()
            }
        }, [e, l, d])
    }])
}, 296380, e => {
    "use strict";
    var t = e.i(416340);
    let i = (e, i) => {
        let n = (0, t.useRef)(null),
            a = (0, t.useCallback)(() => {
                null !== n.current && (clearTimeout(n.current), n.current = null)
            }, [n]);
        return [(0, t.useCallback)(function() {
            for (var t = arguments.length, r = Array(t), l = 0; l < t; l++) r[l] = arguments[l];
            a(), n.current = window.setTimeout(() => {
                e(...r), n.current = null
            }, i)
        }, [e, i, a]), a, n]
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

    function a(e, t, i, n) {
        return new(i || (i = Promise))(function(a, r) {
            function l(e) {
                try {
                    o(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    o(n.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(l, s)
            }
            o((n = n.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var i, n, a, r = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
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
                if (i) throw TypeError("Generator is already executing.");
                for (; l && (l = 0, u[0] && (r = 0)), r;) try {
                    if (i = 1, n && (a = 2 & u[0] ? n.return : u[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, u[1])).done) return a;
                    switch (n = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                        case 0:
                        case 1:
                            a = u;
                            break;
                        case 4:
                            return r.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = r.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                r.label = u[1];
                                break
                            }
                            if (6 === u[0] && r.label < a[1]) {
                                r.label = a[1], a = u;
                                break
                            }
                            if (a && r.label < a[2]) {
                                r.label = a[2], r.ops.push(u);
                                break
                            }
                            a[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    u = t.call(e, r)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    i = a = 0
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
        var i;
        return null == (i = e) ? i : {
            campaignName: i.campaignName,
            linkId: i.linkId,
            linkType: i.linkType,
            createdUtc: new Date(i.createdUtc),
            updatedUtc: new Date(i.updatedUtc),
            universe: (0, t.exists)(i, "universe") ? l(i.universe) : void 0,
            referralCode: i.referralCode,
            referralCodeType: i.referralCodeType,
            launchData: (0, t.exists)(i, "launchData") ? i.launchData : void 0,
            creatorKey: (0, t.exists)(i, "creatorKey") ? i.creatorKey : void 0,
            creatorType: (0, t.exists)(i, "creatorType") ? i.creatorType : void 0,
            fallbackType: (0, t.exists)(i, "fallbackType") ? i.fallbackType : void 0
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

    function f(e, i) {
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

    function d(e, t) {
        return null == e ? e : {
            affiliateLink: f(e.affiliateLink)
        }
    }

    function c(e) {
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

    function v(e) {
        return e
    }

    function y(e, i) {
        return null == e ? e : {
            affiliateLinks: e.affiliateLinks.map(s),
            totalCount: e.totalCount,
            nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function k(e, t) {
        return null == e ? e : {
            affiliateLink: f(e.affiliateLink)
        }
    }
    var m = function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        return n(i, e), i.prototype.affiliateLinksCreateAffiliateLinkByGroupRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksCreateAffiliateLinkByGroup.");
                            if (null === e.affiliateLinksCreateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksCreateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksCreateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksCreateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksCreateAffiliateLinkByGroup.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: o(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return d(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksCreateAffiliateLinkByGroup = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.affiliateLinksCreateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksCreateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksCreateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksCreateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksCreateAffiliateLinkByUser.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: o(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return d(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksCreateAffiliateLinkByUser = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksGetCreatorMetadataByGroup.");
                            return n = {}, a = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/links/metadata".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links/metadata",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetCreatorMetadataByGroup = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var i, n, a;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/links/metadata",
                                schemaPath: "/v1/links/metadata",
                                method: "GET",
                                headers: n,
                                query: i
                            }, e)];
                        case 1:
                            return a = r.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetCreatorMetadataByUser = function(e) {
            return a(this, void 0, void 0, function() {
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
        }, i.prototype.affiliateLinksGetEligibilityByGroupRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksGetEligibilityByGroup.");
                            return n = {}, a = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/eligibility".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/eligibility",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    isEligible: e.IsEligible
                                }
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetEligibilityByGroup = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var i, n, a;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/links/requirements",
                                schemaPath: "/v1/links/requirements",
                                method: "GET",
                                headers: n,
                                query: i
                            }, e)];
                        case 1:
                            return a = r.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    requirements: e.Requirements.map(v)
                                }
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetRequirementsByUser = function(e) {
            return a(this, void 0, void 0, function() {
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
        }, i.prototype.affiliateLinksGetUniverseEligibilityByIdRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling affiliateLinksGetUniverseEligibilityById.");
                            return n = {}, a = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/eligibility".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/eligibility",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    isEligible: e.IsEligible
                                }
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetUniverseEligibilityById = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksListAffiliateLinksByGroup.");
                            return n = {}, void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.pageToken && (n.pageToken = e.pageToken), a = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksListAffiliateLinksByGroup = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.pageToken && (n.pageToken = e.pageToken), a = {}, [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksListAffiliateLinksByUser = function() {
            return a(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling affiliateLinksResolveAffiliateLinkByReferralCode.");
                            return n = {}, void 0 !== e.referralCode && (n.referralCode = e.referralCode), a = {}, [4, this.request({
                                path: "/v1/links/resolve",
                                schemaPath: "/v1/links/resolve",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
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
        }, i.prototype.affiliateLinksResolveAffiliateLinkByReferralCode = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksUpdateAffiliateLinkByGroup.");
                            if (null === e.affiliateLinksUpdateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksUpdateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksUpdateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksUpdateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksUpdateAffiliateLinkByGroup.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "PUT",
                                headers: a,
                                query: n,
                                body: u(e.affiliateLinksUpdateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return k(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksUpdateAffiliateLinkByGroup = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.affiliateLinksUpdateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksUpdateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksUpdateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksUpdateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksUpdateAffiliateLinkByUser.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "PUT",
                                headers: a,
                                query: n,
                                body: u(e.affiliateLinksUpdateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return k(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksUpdateAffiliateLinkByUser = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.eventsAuthenticatedVisitRequest || void 0 === e.eventsAuthenticatedVisitRequest) throw new t.RequiredError("eventsAuthenticatedVisitRequest", "Required parameter requestParameters.eventsAuthenticatedVisitRequest was null or undefined when calling eventsAuthenticatedVisit.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/events/authenticated-visit",
                                schemaPath: "/v1/events/authenticated-visit",
                                method: "POST",
                                headers: a,
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
                            return l = r.sent(), [2, new t.VoidApiResponse(l)]
                    }
                })
            })
        }, i.prototype.eventsAuthenticatedVisit = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.eventsAuthenticatedVisitRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }, i.prototype.eventsPostQualifiedSignupRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.eventsPostQualifiedSignupRequest || void 0 === e.eventsPostQualifiedSignupRequest) throw new t.RequiredError("eventsPostQualifiedSignupRequest", "Required parameter requestParameters.eventsPostQualifiedSignupRequest was null or undefined when calling eventsPostQualifiedSignup.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/events/qualified-signup",
                                schemaPath: "/v1/events/qualified-signup",
                                method: "POST",
                                headers: a,
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
                            return l = r.sent(), [2, new t.VoidApiResponse(l)]
                    }
                })
            })
        }, i.prototype.eventsPostQualifiedSignup = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest || void 0 === e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest) throw new t.RequiredError("internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest", "Required parameter requestParameters.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest was null or undefined when calling internalAffiliateLinksCreateAffiliateLinkWithCustomCode.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/vanity",
                                schemaPath: "/v1/internal/links/vanity",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        campaignName: e.campaignName,
                                        creator: c(e.creator),
                                        vanityCode: e.vanityCode,
                                        launchData: e.launchData,
                                        fallbackType: e.fallbackType
                                    }
                                }(e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest)
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return d(e)
                            })]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksCreateAffiliateLinkWithCustomCode = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.linkId || void 0 === e.linkId) throw new t.RequiredError("linkId", "Required parameter requestParameters.linkId was null or undefined when calling internalAffiliateLinksDeleteAffiliateLink.");
                            return n = {}, a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/{linkId}".replace("{".concat("linkId", "}"), encodeURIComponent(String(e.linkId))),
                                schemaPath: "/v1/internal/links/{linkId}",
                                method: "DELETE",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.VoidApiResponse(l)]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksDeleteAffiliateLink = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksDeleteAffiliateLinkRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksGetAffiliateLinkForReferralCodeRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling internalAffiliateLinksGetAffiliateLinkForReferralCode.");
                            return n = {}, void 0 !== e.referralCode && (n.referralCode = e.referralCode), a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/share",
                                schemaPath: "/v1/internal/links/share",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
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
        }, i.prototype.internalAffiliateLinksGetAffiliateLinkForReferralCode = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkByReferralCode.");
                            if (null === e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest || void 0 === e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest) throw new t.RequiredError("internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest", "Required parameter requestParameters.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkByReferralCode.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/referral-code/{referralCode}".replace("{".concat("referralCode", "}"), encodeURIComponent(String(e.referralCode))),
                                schemaPath: "/v1/internal/links/referral-code/{referralCode}",
                                method: "PATCH",
                                headers: a,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        launchData: e.launchData,
                                        creator: c(e.creator),
                                        fallbackType: e.fallbackType
                                    }
                                }(e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest)
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return k(e)
                            })]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksUpdateAffiliateLinkByReferralCode = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.linkId || void 0 === e.linkId) throw new t.RequiredError("linkId", "Required parameter requestParameters.linkId was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkReferralCode.");
                            return n = {}, void 0 !== e.linkId && (n.linkId = e.linkId), a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links",
                                schemaPath: "/v1/internal/links",
                                method: "PUT",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.VoidApiResponse(l)]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksUpdateAffiliateLinkReferralCode = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/erase-user-data",
                                schemaPath: "/v1/erase-user-data",
                                method: "POST",
                                headers: a,
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
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    state: (0, t.exists)(e, "state") ? e.state : void 0
                                }
                            })]
                    }
                })
            })
        }, i.prototype.privacyTaskWebhookEraseUserData = function() {
            return a(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(i) {
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
    }(t.BaseAPI), e.s(["AffiliateLinksApi", 0, m, "FallbackType", 0, {
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
    let g = new m((0, e.i(272593).createClientConfiguration)("affiliate-links", "bedev2"));
    e.s(["createAffiliateLink", 0, e => g.affiliateLinksCreateAffiliateLinkByUser({
        affiliateLinksCreateAffiliateLinkByUserRequest: e
    }), "createGroupAffiliateLink", 0, e => {
        let {
            groupId: t,
            ...i
        } = e;
        return g.affiliateLinksCreateAffiliateLinkByGroup({
            groupId: t,
            affiliateLinksCreateAffiliateLinkByUserRequest: i
        })
    }, "editAffiliateLink", 0, e => g.affiliateLinksUpdateAffiliateLinkByUser({
        affiliateLinksUpdateAffiliateLinkByUserRequest: e
    }), "editGroupAffiliateLink", 0, e => {
        let {
            groupId: t,
            ...i
        } = e;
        return g.affiliateLinksUpdateAffiliateLinkByGroup({
            groupId: t,
            affiliateLinksUpdateAffiliateLinkByUserRequest: i
        })
    }, "getAffiliateLinks", 0, e => g.affiliateLinksListAffiliateLinksByUser(e), "getGroupAffiliateLinks", 0, e => g.affiliateLinksListAffiliateLinksByGroup(e), "getGroupCreatorMetadata", 0, e => g.affiliateLinksGetCreatorMetadataByGroup({
        groupId: e
    }), "getGroupEligibility", 0, e => g.affiliateLinksGetEligibilityByGroup({
        groupId: e
    }), "getRequirements", 0, () => g.affiliateLinksGetRequirementsByUser(), "getUniverseEligibility", 0, e => g.affiliateLinksGetUniverseEligibilityById({
        universeId: e
    }), "getUserCreatorMetadata", 0, () => g.affiliateLinksGetCreatorMetadataByUser()], 361975)
}, 369114, e => {
    "use strict";
    var t = e.i(75584),
        i = e.i(659332),
        n = e.i(197649),
        a = e.i(416340);
    let r = (0, a.createContext)(null),
        l = e => {
            let t = (0, a.useContext)(r);
            if (!t) throw Error("".concat(e, " must be used within a <Table>"));
            return t
        },
        s = {
            XSmall: "height-800",
            Small: "height-1200",
            Medium: "height-1500"
        },
        o = {
            XSmall: "padding-x-medium",
            Small: "padding-x-large",
            Medium: "padding-x-xlarge"
        },
        u = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        f = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        d = {
            XSmall: "text-body-small",
            Small: "text-body-medium",
            Medium: "text-body-medium"
        },
        c = {
            start: "text-align-x-start",
            center: "text-align-x-center",
            end: "text-align-x-end"
        },
        p = {
            start: "justify-start",
            center: "justify-center",
            end: "justify-end"
        },
        h = (0, a.forwardRef)((e, t) => {
            let {
                children: i,
                size: l = "Medium",
                variant: s = "Divided",
                className: o,
                ...u
            } = e, f = (0, a.useMemo)(() => ({
                size: l,
                variant: s
            }), [l, s]), d = "Framed" === s;
            return a.default.createElement(r.Provider, {
                value: f
            }, a.default.createElement("div", {
                className: (0, n.default)("width-full bg-surface-100", d && "radius-medium clip stroke-standard stroke-default")
            }, a.default.createElement("table", {
                ref: t,
                className: (0, n.default)("foundation-web-table width-full content-default", o),
                ...u
            }, i)))
        });
    h.displayName = "Table";
    let v = (0, a.forwardRef)((e, t) => {
        let {
            children: i,
            className: r,
            ...s
        } = e;
        return l("TableHeader"), a.default.createElement("thead", {
            ref: t,
            className: (0, n.default)("foundation-web-table-header", r),
            ...s
        }, i)
    });
    v.displayName = "TableHeader";
    let y = (0, a.forwardRef)((e, t) => {
        let {
            children: i,
            className: r,
            ...s
        } = e;
        return l("TableBody"), a.default.createElement("tbody", {
            ref: t,
            className: (0, n.default)("foundation-web-table-body", r),
            ...s
        }, i)
    });
    y.displayName = "TableBody";
    let k = (0, a.forwardRef)((e, t) => {
        let {
            children: i,
            className: r,
            isInteractive: s = !1,
            isHoverable: o = !1,
            isSelected: u = !1,
            isDisabled: f = !1,
            onClick: d,
            onKeyDown: c,
            tabIndex: p,
            role: h,
            ...v
        } = e;
        l("TableRow");
        let y = s ? {
            role: null != h ? h : "row",
            tabIndex: null != p ? p : 0,
            onClick: f ? void 0 : d,
            onKeyDown: e => {
                f || (null == c || c(e), e.defaultPrevented || ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == d || d(e)))
            }
        } : {
            role: h,
            tabIndex: p,
            onClick: d,
            onKeyDown: c
        };
        return a.default.createElement("tr", {
            ref: t,
            "aria-selected": s ? u : void 0,
            "aria-disabled": !!s && !!f || void 0,
            "data-selected": u || void 0,
            className: (0, n.default)("foundation-web-table-row", (s || o) && "hover:bg-shift-100", s && !f && "cursor-pointer", s && f && "opacity-disabled pointer-events-none", u && "bg-shift-200", r),
            ...y,
            ...v
        }, i)
    });
    k.displayName = "TableRow";
    let m = (0, a.forwardRef)((e, i) => {
        let {
            children: r,
            className: s,
            sortDirection: d,
            onSort: h,
            align: v = "start",
            sortLabel: y,
            scope: k,
            ...m
        } = e, {
            size: g
        } = l("TableHeaderCell"), w = !!h, b = null != d ? d : "none", L = w && "none" !== b && a.default.createElement(t.Icon, {
            name: "ascending" === b ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), R = a.default.createElement("div", {
            className: (0, n.default)("flex items-center gap-xsmall", f[g], "content-muted", p[v])
        }, "end" === v && L, a.default.createElement("span", {
            className: "text-truncate-end"
        }, r), "end" !== v && L), A = "string" == typeof r ? "Sort by ".concat(r) : void 0;
        return a.default.createElement("th", {
            ref: i,
            scope: null != k ? k : "col",
            "aria-sort": w ? b : void 0,
            className: (0, n.default)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", u[g], o[g], c[v], "content-muted", s),
            ...m
        }, w ? a.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: h,
            "aria-label": null != y ? y : A
        }, R) : R)
    });
    m.displayName = "TableHeaderCell";
    let g = (0, a.forwardRef)((e, t) => {
        let {
            children: i,
            className: r,
            align: u = "start",
            ...f
        } = e, {
            size: p
        } = l("TableCell");
        return a.default.createElement("td", {
            ref: t,
            className: (0, n.default)("foundation-web-table-cell foundation-web-table-row-divider", s[p], o[p], d[p], c[u], "content-default", r),
            ...f
        }, i)
    });
    g.displayName = "TableCell";
    let w = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-large"
        },
        b = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        L = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-small"
        },
        R = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        A = {
            XSmall: "gap-xsmall",
            Small: "gap-xsmall",
            Medium: "gap-small"
        },
        C = {
            XSmall: "XSmall",
            Small: "XSmall",
            Medium: "Small"
        },
        q = (0, a.forwardRef)((e, t) => {
            let {
                size: r = "Medium",
                page: l,
                rowsPerPage: s,
                totalRows: o,
                rowsPerPageOptions: u = [10, 25, 50],
                onPageChange: f,
                onRowsPerPageChange: d,
                rowsPerPageLabel: c = "Rows per page",
                firstPageLabel: p = "First page",
                previousPageLabel: h = "Previous page",
                nextPageLabel: v = "Next page",
                lastPageLabel: y = "Last page",
                rangeLabel: k,
                className: m,
                ...g
            } = e, q = Math.max(1, Math.ceil(o / s)), I = 0 === l, P = l >= q - 1, U = 0 === o ? 0 : l * s + 1, x = Math.min((l + 1) * s, o), T = (0, a.useCallback)(e => {
                let t = Number(e.target.value);
                null == d || d(t), f(0)
            }, [d, f]), B = C[r];
            return a.default.createElement("div", {
                ref: t,
                className: (0, n.default)("flex items-center justify-end", w[r], b[r], m),
                ...g
            }, a.default.createElement("div", {
                className: "flex items-center gap-large"
            }, a.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, d && a.default.createElement("div", {
                className: "flex items-center gap-small"
            }, a.default.createElement("span", {
                className: (0, n.default)(L[r], "content-default")
            }, c), a.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, a.default.createElement("select", {
                className: (0, n.default)("foundation-web-table-pagination-select", L[r], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === r ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: s,
                onChange: T,
                "aria-label": c
            }, u.map(e => a.default.createElement("option", {
                key: e,
                value: e
            }, e))))), a.default.createElement("span", {
                className: (0, n.default)(R[r], "content-default")
            }, k ? k(U, x, o) : "".concat(U, "-").concat(x, " of ").concat(o))), a.default.createElement("div", {
                className: (0, n.default)("flex items-center", A[r])
            }, a.default.createElement(i.IconButton, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: p,
                size: B,
                variant: "Utility",
                isDisabled: I,
                onClick: () => f(0)
            }), a.default.createElement(i.IconButton, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: h,
                size: B,
                variant: "Utility",
                isDisabled: I,
                onClick: () => f(l - 1)
            }), a.default.createElement(i.IconButton, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: v,
                size: B,
                variant: "Utility",
                isDisabled: P,
                onClick: () => f(l + 1)
            }), a.default.createElement(i.IconButton, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: y,
                size: B,
                variant: "Utility",
                isDisabled: P,
                onClick: () => f(q - 1)
            }))))
        });
    q.displayName = "TablePagination", e.s(["Table", 0, h, "TableBody", 0, y, "TableCell", 0, g, "TableHeader", 0, v, "TableHeaderCell", 0, m, "TablePagination", 0, q, "TableRow", 0, k])
}, 16255, e => {
    "use strict";
    var t = e.i(788647);
    e.s(["NavigateNextIcon", () => t.N])
}, 763833, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["ArrowDownwardIcon", () => t.ArrowDownward])
}, 650642, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["ArrowUpwardIcon", () => t.ArrowUpward])
}, 883302, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["NavigateBeforeIcon", () => t.NavigateBefore])
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function i(e, t) {
        let {
            pages: i,
            pageParams: n
        } = t, a = i.length - 1;
        return i.length > 0 ? e.getNextPageParam(i[a], i, n[a], n) : void 0
    }

    function n(e, t) {
        var i;
        let {
            pages: n,
            pageParams: a
        } = t;
        return n.length > 0 ? null == (i = e.getPreviousPageParam) ? void 0 : i.call(e, n[0], n, a[0], a) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != i(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != n(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (a, r) => {
                var l, s, o, u, f;
                let d = a.options,
                    c = null == (o = a.fetchOptions) || null == (s = o.meta) || null == (l = s.fetchMore) ? void 0 : l.direction,
                    p = (null == (u = a.state.data) ? void 0 : u.pages) || [],
                    h = (null == (f = a.state.data) ? void 0 : f.pageParams) || [],
                    v = {
                        pages: [],
                        pageParams: []
                    },
                    y = 0,
                    k = async () => {
                        let r = !1,
                            l = (0, t.ensureQueryFn)(a.options, a.fetchOptions),
                            s = async (e, i, n) => {
                                let s;
                                if (r) return Promise.reject();
                                if (null == i && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(s = {
                                        client: a.client,
                                        queryKey: a.queryKey,
                                        pageParam: i,
                                        direction: n ? "backward" : "forward",
                                        meta: a.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (a.signal.aborted ? r = !0 : a.signal.addEventListener("abort", () => {
                                            r = !0
                                        }), a.signal)
                                    }), s),
                                    u = await l(o),
                                    {
                                        maxPages: f
                                    } = a.options,
                                    d = n ? t.addToStart : t.addToEnd;
                                return {
                                    pages: d(e.pages, u, f),
                                    pageParams: d(e.pageParams, i, f)
                                }
                            };
                        if (c && p.length) {
                            let e = "backward" === c,
                                t = {
                                    pages: p,
                                    pageParams: h
                                },
                                a = (e ? n : i)(d, t);
                            v = await s(t, a, e)
                        } else {
                            let t = null != e ? e : p.length;
                            do {
                                var o;
                                let e = 0 === y ? null != (o = h[0]) ? o : d.initialPageParam : i(d, v);
                                if (y > 0 && null == e) break;
                                v = await s(v, e), y++
                            } while (y < t)
                        }
                        return v
                    };
                a.options.persister ? a.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = a.options).persister) ? void 0 : e.call(t, k, {
                        client: a.client,
                        queryKey: a.queryKey,
                        meta: a.options.meta,
                        signal: a.signal
                    }, r)
                } : a.fetchFn = k
            }
        }
    }])
}, 630986, e => {
    "use strict";
    var t = e.i(468612),
        i = e.i(117437),
        n = class extends t.QueryObserver {
            bindMethods() {
                super.bindMethods(), this.fetchNextPage = this.fetchNextPage.bind(this), this.fetchPreviousPage = this.fetchPreviousPage.bind(this)
            }
            setOptions(e) {
                super.setOptions({
                    ...e,
                    behavior: (0, i.infiniteQueryBehavior)()
                })
            }
            getOptimisticResult(e) {
                return e.behavior = (0, i.infiniteQueryBehavior)(), super.getOptimisticResult(e)
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
                var n, a;
                let {
                    state: r
                } = e, l = super.createResult(e, t), {
                    isFetching: s,
                    isRefetching: o,
                    isError: u,
                    isRefetchError: f
                } = l, d = null == (a = r.fetchMeta) || null == (n = a.fetchMore) ? void 0 : n.direction, c = u && "forward" === d, p = s && "forward" === d, h = u && "backward" === d, v = s && "backward" === d;
                return {
                    ...l,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, i.hasNextPage)(t, r.data),
                    hasPreviousPage: (0, i.hasPreviousPage)(t, r.data),
                    isFetchNextPageError: c,
                    isFetchingNextPage: p,
                    isFetchPreviousPageError: h,
                    isFetchingPreviousPage: v,
                    isRefetchError: f && !c && !h,
                    isRefetching: o && !p && !v
                }
            }
            constructor(e, t) {
                super(e, t)
            }
        },
        a = e.i(624083);
    e.s(["useInfiniteQuery", 0, function(e, t) {
        return (0, a.useBaseQuery)(e, n, t)
    }], 630986)
}]);

//# debugId=8326b69d-8888-a66d-2d63-4f4fc2e7167f
//# sourceMappingURL=3581yjfp56w9f.js.map