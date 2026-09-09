;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b1647c21-a6aa-6596-ca51-ef0ede301216")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 361975, 540459, e => {
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

    function a(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function a() {
            this.constructor = e
        }
        i(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
    }

    function n(e, t, i, a) {
        return new(i || (i = Promise))(function(n, r) {
            function l(e) {
                try {
                    o(a.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    o(a.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(l, s)
            }
            o((a = a.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var i, a, n, r = {
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
                if (i) throw TypeError("Generator is already executing.");
                for (; l && (l = 0, u[0] && (r = 0)), r;) try {
                    if (i = 1, a && (n = 2 & u[0] ? a.return : u[0] ? a.throw || ((n = a.return) && n.call(a), 0) : a.next) && !(n = n.call(a, u[1])).done) return n;
                    switch (a = 0, n && (u = [2 & u[0], n.value]), u[0]) {
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
                            r.label++, a = u[1], u = [0];
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
                    u = [6, e], a = 0
                } finally {
                    i = n = 0
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

    function d(e, i) {
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

    function f(e, t) {
        return null == e ? e : {
            affiliateLink: d(e.affiliateLink)
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

    function m(e, t) {
        return null == e ? e : {
            isEligibleToCreate: e.isEligibleToCreate,
            isAllowedToCreateForAnyExperience: e.isAllowedToCreateForAnyExperience
        }
    }

    function h(e) {
        return e
    }

    function v(e, i) {
        return null == e ? e : {
            affiliateLinks: e.affiliateLinks.map(s),
            totalCount: e.totalCount,
            nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function y(e, t) {
        return null == e ? e : {
            affiliateLink: d(e.affiliateLink)
        }
    }
    var k = function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        return a(i, e), i.prototype.affiliateLinksCreateAffiliateLinkByGroupRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksCreateAffiliateLinkByGroup.");
                            if (null === e.affiliateLinksCreateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksCreateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksCreateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksCreateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksCreateAffiliateLinkByGroup.");
                            return a = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "POST",
                                headers: n,
                                query: a,
                                body: o(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return f(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksCreateAffiliateLinkByGroup = function(e, t) {
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.affiliateLinksCreateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksCreateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksCreateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksCreateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksCreateAffiliateLinkByUser.");
                            return a = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "POST",
                                headers: n,
                                query: a,
                                body: o(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return f(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksCreateAffiliateLinkByUser = function(e, t) {
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksGetCreatorMetadataByGroup.");
                            return a = {}, n = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/links/metadata".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links/metadata",
                                method: "GET",
                                headers: n,
                                query: a
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return m(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetCreatorMetadataByGroup = function(e, t) {
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var i, a, n;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, a = {}, [4, this.request({
                                path: "/v1/links/metadata",
                                schemaPath: "/v1/links/metadata",
                                method: "GET",
                                headers: a,
                                query: i
                            }, e)];
                        case 1:
                            return n = r.sent(), [2, new t.JSONApiResponse(n, function(e) {
                                return m(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetCreatorMetadataByUser = function(e) {
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
        }, i.prototype.affiliateLinksGetEligibilityByGroupRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksGetEligibilityByGroup.");
                            return a = {}, n = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/eligibility".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/eligibility",
                                method: "GET",
                                headers: n,
                                query: a
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
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var i, a, n;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, a = {}, [4, this.request({
                                path: "/v1/links/requirements",
                                schemaPath: "/v1/links/requirements",
                                method: "GET",
                                headers: a,
                                query: i
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
        }, i.prototype.affiliateLinksGetRequirementsByUser = function(e) {
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
        }, i.prototype.affiliateLinksGetUniverseEligibilityByIdRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling affiliateLinksGetUniverseEligibilityById.");
                            return a = {}, n = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/eligibility".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/eligibility",
                                method: "GET",
                                headers: n,
                                query: a
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
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksListAffiliateLinksByGroup.");
                            return a = {}, void 0 !== e.maxPageSize && (a.maxPageSize = e.maxPageSize), void 0 !== e.sortOrder && (a.sortOrder = e.sortOrder), void 0 !== e.pageToken && (a.pageToken = e.pageToken), n = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "GET",
                                headers: n,
                                query: a
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksListAffiliateLinksByGroup = function(e, t) {
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return a = {}, void 0 !== e.maxPageSize && (a.maxPageSize = e.maxPageSize), void 0 !== e.sortOrder && (a.sortOrder = e.sortOrder), void 0 !== e.pageToken && (a.pageToken = e.pageToken), n = {}, [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "GET",
                                headers: n,
                                query: a
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksListAffiliateLinksByUser = function() {
            return n(this, arguments, void 0, function(e, t) {
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
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling affiliateLinksResolveAffiliateLinkByReferralCode.");
                            return a = {}, void 0 !== e.referralCode && (a.referralCode = e.referralCode), n = {}, [4, this.request({
                                path: "/v1/links/resolve",
                                schemaPath: "/v1/links/resolve",
                                method: "GET",
                                headers: n,
                                query: a
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
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksUpdateAffiliateLinkByGroup.");
                            if (null === e.affiliateLinksUpdateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksUpdateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksUpdateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksUpdateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksUpdateAffiliateLinkByGroup.");
                            return a = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "PUT",
                                headers: n,
                                query: a,
                                body: u(e.affiliateLinksUpdateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksUpdateAffiliateLinkByGroup = function(e, t) {
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.affiliateLinksUpdateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksUpdateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksUpdateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksUpdateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksUpdateAffiliateLinkByUser.");
                            return a = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "PUT",
                                headers: n,
                                query: a,
                                body: u(e.affiliateLinksUpdateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksUpdateAffiliateLinkByUser = function(e, t) {
            return n(this, void 0, void 0, function() {
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
        a(i, e), i.prototype.eventsAuthenticatedVisitRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.eventsAuthenticatedVisitRequest || void 0 === e.eventsAuthenticatedVisitRequest) throw new t.RequiredError("eventsAuthenticatedVisitRequest", "Required parameter requestParameters.eventsAuthenticatedVisitRequest was null or undefined when calling eventsAuthenticatedVisit.");
                            return a = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/events/authenticated-visit",
                                schemaPath: "/v1/events/authenticated-visit",
                                method: "POST",
                                headers: n,
                                query: a,
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
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.eventsPostQualifiedSignupRequest || void 0 === e.eventsPostQualifiedSignupRequest) throw new t.RequiredError("eventsPostQualifiedSignupRequest", "Required parameter requestParameters.eventsPostQualifiedSignupRequest was null or undefined when calling eventsPostQualifiedSignup.");
                            return a = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/events/qualified-signup",
                                schemaPath: "/v1/events/qualified-signup",
                                method: "POST",
                                headers: n,
                                query: a,
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
            return n(this, void 0, void 0, function() {
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
        a(i, e), i.prototype.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest || void 0 === e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest) throw new t.RequiredError("internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest", "Required parameter requestParameters.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest was null or undefined when calling internalAffiliateLinksCreateAffiliateLinkWithCustomCode.");
                            return a = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/vanity",
                                schemaPath: "/v1/internal/links/vanity",
                                method: "POST",
                                headers: n,
                                query: a,
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
                                return f(e)
                            })]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksCreateAffiliateLinkWithCustomCode = function(e, t) {
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.linkId || void 0 === e.linkId) throw new t.RequiredError("linkId", "Required parameter requestParameters.linkId was null or undefined when calling internalAffiliateLinksDeleteAffiliateLink.");
                            return a = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/{linkId}".replace("{".concat("linkId", "}"), encodeURIComponent(String(e.linkId))),
                                schemaPath: "/v1/internal/links/{linkId}",
                                method: "DELETE",
                                headers: n,
                                query: a
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.VoidApiResponse(l)]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksDeleteAffiliateLink = function(e, t) {
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling internalAffiliateLinksGetAffiliateLinkForReferralCode.");
                            return a = {}, void 0 !== e.referralCode && (a.referralCode = e.referralCode), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/share",
                                schemaPath: "/v1/internal/links/share",
                                method: "GET",
                                headers: n,
                                query: a
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
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkByReferralCode.");
                            if (null === e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest || void 0 === e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest) throw new t.RequiredError("internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest", "Required parameter requestParameters.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkByReferralCode.");
                            return a = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/referral-code/{referralCode}".replace("{".concat("referralCode", "}"), encodeURIComponent(String(e.referralCode))),
                                schemaPath: "/v1/internal/links/referral-code/{referralCode}",
                                method: "PATCH",
                                headers: n,
                                query: a,
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
                                return y(e)
                            })]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksUpdateAffiliateLinkByReferralCode = function(e, t) {
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.linkId || void 0 === e.linkId) throw new t.RequiredError("linkId", "Required parameter requestParameters.linkId was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkReferralCode.");
                            return a = {}, void 0 !== e.linkId && (a.linkId = e.linkId), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links",
                                schemaPath: "/v1/internal/links",
                                method: "PUT",
                                headers: n,
                                query: a
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.VoidApiResponse(l)]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksUpdateAffiliateLinkReferralCode = function(e, t) {
            return n(this, void 0, void 0, function() {
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
        a(i, e), i.prototype.privacyTaskWebhookEraseUserDataRaw = function(e, i) {
            return n(this, void 0, void 0, function() {
                var a, n, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return a = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/erase-user-data",
                                schemaPath: "/v1/erase-user-data",
                                method: "POST",
                                headers: n,
                                query: a,
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
            return n(this, arguments, void 0, function(e, t) {
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
    }(t.BaseAPI), e.s(["AffiliateLinksApi", 0, k, "FallbackType", 0, {
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
    let g = new k((0, e.i(272593).createClientConfiguration)("affiliate-links", "bedev2"));
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
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        i = e.i(78892),
        a = e.i(723570),
        n = e => {
            var n, l, s;
            let o, u, {
                    present: d,
                    children: f
                } = e,
                c = function(e) {
                    var i, n;
                    let [l, s] = t.useState(), o = t.useRef(null), u = t.useRef(e), d = t.useRef("none"), [f, c] = (i = e ? "mounted" : "unmounted", n = {
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
                        let i = n[e][t];
                        return null != i ? i : e
                    }, i));
                    return t.useEffect(() => {
                        let e = r(o.current);
                        d.current = "mounted" === f ? e : "none"
                    }, [f]), (0, a.useLayoutEffect)(() => {
                        let t = o.current,
                            i = u.current;
                        if (i !== e) {
                            let a = d.current,
                                n = r(t);
                            e ? c("MOUNT") : "none" === n || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : i && a !== n ? c("ANIMATION_OUT") : c("UNMOUNT"), u.current = e
                        }
                    }, [e, c]), (0, a.useLayoutEffect)(() => {
                        if (l) {
                            var e;
                            let t, i = null != (e = l.ownerDocument.defaultView) ? e : window,
                                a = e => {
                                    let a = r(o.current).includes(CSS.escape(e.animationName));
                                    if (e.target === l && a && (c("ANIMATION_END"), !u.current)) {
                                        let e = l.style.animationFillMode;
                                        l.style.animationFillMode = "forwards", t = i.setTimeout(() => {
                                            "forwards" === l.style.animationFillMode && (l.style.animationFillMode = e)
                                        })
                                    }
                                },
                                n = e => {
                                    e.target === l && (d.current = r(o.current))
                                };
                            return l.addEventListener("animationstart", n), l.addEventListener("animationcancel", a), l.addEventListener("animationend", a), () => {
                                i.clearTimeout(t), l.removeEventListener("animationstart", n), l.removeEventListener("animationcancel", a), l.removeEventListener("animationend", a)
                            }
                        }
                        c("ANIMATION_END")
                    }, [l, c]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: t.useCallback(e => {
                            o.current = e ? getComputedStyle(e) : null, s(e)
                        }, [])
                    }
                }(d),
                p = "function" == typeof f ? f({
                    present: c.isPresent
                }) : t.Children.only(f),
                m = (0, i.useComposedRefs)(c.ref, (u = (o = null == (l = Object.getOwnPropertyDescriptor((n = p).props, "ref")) ? void 0 : l.get) && "isReactWarning" in o && o.isReactWarning) ? n.ref : (u = (o = null == (s = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : s.get) && "isReactWarning" in o && o.isReactWarning) ? n.props.ref : n.props.ref || n.ref);
            return "function" == typeof f || c.isPresent ? t.cloneElement(p, {
                ref: m
            }) : null
        };

    function r(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    n.displayName = "Presence", e.s(["Presence", 0, n])
}, 71597, e => {
    "use strict";
    var t = e.i(18046),
        i = e.i(39210),
        a = e.i(197649),
        n = e.i(416340),
        r = e.i(78892),
        l = e.i(608652),
        s = e.i(174617),
        o = e.i(199786),
        u = e.i(300792),
        d = e.i(692166),
        f = e.i(169525),
        c = e.i(600317),
        p = e.i(221628),
        m = "Checkbox",
        [h, v] = (0, l.createContextScope)(m),
        [y, k] = h(m);

    function g(e) {
        let {
            __scopeCheckbox: t,
            checked: i,
            children: a,
            defaultChecked: r,
            disabled: l,
            form: s,
            name: u,
            onCheckedChange: d,
            required: f,
            value: c = "on",
            internal_do_not_use_render: h
        } = e, [v, k] = (0, o.useControllableState)({
            prop: i,
            defaultProp: null != r && r,
            onChange: d,
            caller: m
        }), [g, w] = n.useState(null), [L, b] = n.useState(null), R = n.useRef(!1), x = !g || !!s || !!g.closest("form"), A = {
            checked: v,
            disabled: l,
            setChecked: k,
            control: g,
            setControl: w,
            name: u,
            form: s,
            value: c,
            hasConsumerStoppedPropagationRef: R,
            required: f,
            defaultChecked: !I(r) && r,
            isFormControl: x,
            bubbleInput: L,
            setBubbleInput: b
        };
        return (0, p.jsx)(y, {
            scope: t,
            ...A,
            children: "function" == typeof h ? h(A) : a
        })
    }
    var w = "CheckboxTrigger",
        L = n.forwardRef((e, t) => {
            let {
                __scopeCheckbox: i,
                onKeyDown: a,
                onClick: l,
                ...o
            } = e, {
                control: u,
                value: d,
                disabled: f,
                checked: m,
                required: h,
                setControl: v,
                setChecked: y,
                hasConsumerStoppedPropagationRef: g,
                isFormControl: L,
                bubbleInput: b
            } = k(w, i), R = (0, r.useComposedRefs)(t, v), x = n.useRef(m);
            return n.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => y(x.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, y]), (0, p.jsx)(c.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": I(m) ? "mixed" : m,
                "aria-required": h,
                "data-state": q(m),
                "data-disabled": f ? "" : void 0,
                disabled: f,
                value: d,
                ...o,
                ref: R,
                onKeyDown: (0, s.composeEventHandlers)(a, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, s.composeEventHandlers)(l, e => {
                    y(e => !!I(e) || !e), b && L && (g.current = e.isPropagationStopped(), g.current || e.stopPropagation())
                })
            })
        });
    L.displayName = w;
    var b = n.forwardRef((e, t) => {
        let {
            __scopeCheckbox: i,
            name: a,
            checked: n,
            defaultChecked: r,
            required: l,
            disabled: s,
            value: o,
            onCheckedChange: u,
            form: d,
            ...f
        } = e;
        return (0, p.jsx)(g, {
            __scopeCheckbox: i,
            checked: n,
            defaultChecked: r,
            disabled: s,
            required: l,
            onCheckedChange: u,
            name: a,
            form: d,
            value: o,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: a
                } = e;
                return (0, p.jsxs)(p.Fragment, {
                    children: [(0, p.jsx)(L, {
                        ...f,
                        ref: t,
                        __scopeCheckbox: i
                    }), a && (0, p.jsx)(C, {
                        __scopeCheckbox: i
                    })]
                })
            }
        })
    });
    b.displayName = m;
    var R = "CheckboxIndicator",
        x = n.forwardRef((e, t) => {
            let {
                __scopeCheckbox: i,
                forceMount: a,
                ...n
            } = e, r = k(R, i);
            return (0, p.jsx)(f.Presence, {
                present: a || I(r.checked) || !0 === r.checked,
                children: (0, p.jsx)(c.Primitive.span, {
                    "data-state": q(r.checked),
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
    x.displayName = R;
    var A = "CheckboxBubbleInput",
        C = n.forwardRef((e, t) => {
            let {
                __scopeCheckbox: i,
                ...a
            } = e, {
                control: l,
                hasConsumerStoppedPropagationRef: s,
                checked: o,
                defaultChecked: f,
                required: m,
                disabled: h,
                name: v,
                value: y,
                form: g,
                bubbleInput: w,
                setBubbleInput: L
            } = k(A, i), b = (0, r.useComposedRefs)(t, L), R = (0, u.usePrevious)(o), x = (0, d.useSize)(l);
            n.useEffect(() => {
                if (!w) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !s.current;
                if (R !== o && e) {
                    let i = new Event("click", {
                        bubbles: t
                    });
                    w.indeterminate = I(o), e.call(w, !I(o) && o), w.dispatchEvent(i)
                }
            }, [w, R, o, s]);
            let C = n.useRef(!I(o) && o);
            return (0, p.jsx)(c.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != f ? f : C.current,
                required: m,
                disabled: h,
                name: v,
                value: y,
                form: g,
                ...a,
                tabIndex: -1,
                ref: b,
                style: {
                    ...a.style,
                    ...x,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function I(e) {
        return "indeterminate" === e
    }

    function q(e) {
        return I(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    C.displayName = A;
    let E = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        P = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        T = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        U = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: r,
            className: l,
            isChecked: s,
            isDisabled: o,
            size: u,
            hint: d,
            placement: f,
            onCheckedChange: c,
            id: p,
            ...m
        } = e, h = (0, i.default)(), v = p || h, y = r && n.default.createElement("label", {
            htmlFor: v,
            className: (0, a.default)("flex flex-col grow-1 gap-xsmall", !o && "cursor-pointer")
        }, n.default.createElement("span", {
            className: (0, a.default)(T[u], U[u], "content-emphasis")
        }, r), d && n.default.createElement("span", {
            className: "text-body-medium content-default"
        }, d));
        return n.default.createElement("div", {
            className: (0, a.default)("foundation-web-checkbox flex gap-medium", o && "opacity-[0.5]", !o && "cursor-pointer", l)
        }, "End" === f && y, n.default.createElement("div", {
            className: (0, a.default)(P[u])
        }, n.default.createElement(b, {
            "data-slot": "checkbox",
            className: (0, a.default)(E[u], t.interactable, !o && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: v,
            checked: s,
            disabled: o,
            onCheckedChange: c,
            "aria-label": r,
            ...m
        }, n.default.createElement(t.StateLayer, null), n.default.createElement(x, {
            "data-slot": "checkbox-indicator",
            className: (0, a.default)(E[u], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === f && y)
    }], 71597)
}, 934145, 616892, e => {
    "use strict";
    var t = e.i(18046),
        i = e.i(39210),
        a = e.i(339855),
        n = e.i(908202),
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
        f = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        c = {
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
                label: y,
                labelTooltip: k,
                ariaLabelledBy: g,
                ariaLabel: w,
                className: L,
                size: b,
                variant: R = "Standard",
                value: x,
                placeholder: A,
                isDisabled: C,
                hasError: I,
                hint: q,
                onValueChange: E,
                onOpenChange: P,
                children: T
            } = e, U = (0, i.default)(), S = (0, l.useMemo)(() => ({
                size: b
            }), [b]), N = y ? l.default.createElement("span", {
                id: U,
                className: (0, r.default)(f[b], "content-emphasis")
            }, y) : null;
            return l.default.createElement(o.Provider, {
                value: S
            }, l.default.createElement("div", {
                className: (0, r.default)("flex flex-col", C && ["opacity-[0.5]", "pointer-events-none"], p[b], L)
            }, N && (k ? l.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, N, l.default.createElement(a.LabelTooltip, k)) : N), l.default.createElement(s.Root, {
                value: x,
                disabled: C,
                onValueChange: E,
                onOpenChange: P
            }, l.default.createElement(s.Trigger, {
                className: (0, r.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", n.INPUT_BACKGROUND_BY_VARIANT[R], n.INPUT_STROKE_BY_VARIANT[R], m[b], h[b], d[b], c[b], I ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === x ? "content-muted" : "content-default"),
                ref: v,
                "aria-labelledby": y ? U : g,
                "aria-label": w
            }, l.default.createElement(t.StateLayer, null), l.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, l.default.createElement(s.Value, {
                placeholder: A
            })), l.default.createElement(s.Icon, {
                className: (0, r.default)(u[b], "icon icon-regular-chevron-large-down content-default")
            })), l.default.createElement(s.Portal, null, l.default.createElement(s.Content, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, T))), q && l.default.createElement("span", {
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": I,
                    "content-default": !I
                })
            }, q)))
        });
    v.displayName = "Dropdown", e.s(["Dropdown", 0, v, "DropdownContext", 0, o], 616892);
    var y = e.i(23342),
        k = e.i(142953);
    let g = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        w = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        L = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        b = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        R = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        x = {
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
        C = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        I = (0, l.createContext)(null),
        q = () => {
            let e = (0, l.useContext)(I);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        var t;
        let {
            children: i,
            className: a,
            size: n
        } = e, u = (0, l.useContext)(o), d = u ? "dropdown" : "standalone", f = null != (t = null != n ? n : null == u ? void 0 : u.size) ? t : "Medium", c = (0, l.useMemo)(() => ({
            size: f,
            mode: d
        }), [f, d]), p = (0, r.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", g[f], a), m = "standalone" === d ? l.default.createElement(k.Root, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, l.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: p
        }, i)) : l.default.createElement("div", {
            className: p
        }, i);
        return l.default.createElement(I.Provider, {
            value: c
        }, "dropdown" === d ? l.default.createElement(s.Viewport, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, m) : m)
    }, "MenuItem", 0, e => {
        let i, {
                value: a,
                leading: n,
                title: o,
                description: u,
                trailing: d,
                disabled: f,
                className: c,
                onSelect: p,
                asChild: m,
                children: h,
                ...v
            } = e,
            {
                size: g,
                mode: w
            } = q(),
            I = (0, r.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", A[g], L[g], b[g], R[g], C[g], f && "opacity-[0.5]", f && "pointer-events-none", c),
            E = l.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, o);
        switch (w) {
            case "dropdown":
                E = l.default.createElement(s.ItemText, {
                    asChild: !0
                }, E);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", w)
        }
        let P = l.default.createElement(l.default.Fragment, null, !f && l.default.createElement(t.StateLayer, null), n, l.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", x[g])
        }, E, u && l.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, u)), d);
        if (m) {
            let {
                as: e,
                ...a
            } = v, n = l.default.Children.only(h), r = void 0 === o && n.props.children;
            i = l.default.createElement(y.Slot, {
                ...a,
                role: "standalone" === w ? "menuitem" : void 0,
                "aria-disabled": f || void 0,
                className: I,
                style: {
                    outlineOffset: 0
                },
                onClick: f ? void 0 : p
            }, r ? l.default.cloneElement(n, {}, l.default.createElement(l.default.Fragment, null, !f && l.default.createElement(t.StateLayer, null), n.props.children)) : l.default.cloneElement(n, {}, P))
        } else if ("a" === v.as) {
            let {
                as: e,
                href: t,
                ...a
            } = v;
            i = l.default.createElement("a", {
                ...a,
                role: "standalone" === w ? "menuitem" : void 0,
                "aria-disabled": f,
                href: f ? void 0 : t,
                className: I,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: f ? void 0 : p
            }, P)
        } else {
            let {
                as: e,
                ...t
            } = v;
            i = l.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === w ? "menuitem" : void 0,
                "aria-disabled": f,
                className: I,
                style: {
                    outlineOffset: 0
                },
                onClick: f ? void 0 : p
            }, P)
        }
        return "dropdown" === w ? l.default.createElement(s.Item, {
            value: a,
            disabled: f,
            asChild: !0
        }, i) : l.default.createElement(k.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: a
        }, i)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: i,
            leading: a,
            trailing: n,
            disabled: s,
            className: o
        } = e, {
            size: u
        } = q(), d = (0, r.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", A[u], L[u], b[u], R[u], s && "opacity-[0.5]", o);
        return l.default.createElement("div", {
            role: "none",
            className: d
        }, a, l.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", x[u])
        }, l.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), i && l.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, i)), n)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: i
        } = e, {
            size: a
        } = q();
        return l.default.createElement("div", {
            role: "group",
            className: (0, r.default)(w[a], i)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return l.default.createElement("div", {
            role: "separator",
            className: (0, r.default)("foundation-web-menu-separator", t)
        })
    }], 934145)
}, 924747, e => {
    "use strict";
    var t = e.i(823981),
        i = e.i(688702),
        a = e.i(39210),
        n = e.i(339855),
        r = e.i(908202),
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
        f = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        c = {
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
                leadingIconName: y,
                trailingIconName: k,
                leadingIconNode: g,
                trailingIconNode: w,
                hasError: L,
                error: b,
                helperText: R,
                size: x,
                variant: A = "Standard",
                isRequired: C,
                isDisabled: I,
                className: q,
                style: E,
                inputContainerClassName: P,
                inputContainerClassStyle: T,
                id: U,
                ...S
            } = e, N = (0, a.default)(), B = U || N, O = "".concat(B, "-description"), M = null != x ? x : "Large", G = L || !!b, D = b || R, K = (0, s.useMemo)(() => y ? s.default.createElement(i.Icon, {
                name: y,
                size: M,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : g, [y, g, M]), j = (0, s.useMemo)(() => k ? s.default.createElement(i.Icon, {
                name: k,
                size: M,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : w, [M, k, w]), _ = h ? s.default.createElement("label", {
                htmlFor: B,
                className: (0, l.default)(c[M], "content-emphasis")
            }, h, C && s.default.createElement(s.default.Fragment, null, " ", s.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return s.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, l.default)("flex width-full flex-col gap-small ".concat(q), {
                    [t.disabledOpacity]: I
                }),
                style: E
            }, _ && (v ? s.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, _, s.default.createElement(n.LabelTooltip, v)) : _), s.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, l.default)("foundation-web-input flex items-center width-full", r.INPUT_STROKE_BY_VARIANT[A], r.INPUT_BACKGROUND_BY_VARIANT[A], P, d[M], f[M], o[M], u[M], G ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: T
            }, K, s.default.createElement("input", {
                type: "text",
                id: B,
                ref: m,
                className: (0, l.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", p[M]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": G,
                "aria-describedby": D ? O : void 0,
                required: C,
                ...S,
                disabled: I
            }), j), D && s.default.createElement("span", {
                id: O,
                className: (0, l.default)("text-caption-small", {
                    "content-system-alert": G,
                    "content-default": !G
                })
            }, D))
        });
    m.displayName = "TextInput", e.s(["TextInput", 0, m])
}, 339855, e => {
    "use strict";
    var t = e.i(688702),
        i = e.i(737420),
        a = e.i(416340);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: n,
            description: r,
            position: l = "top-center"
        } = e;
        return a.default.createElement(i.Tooltip, {
            position: l,
            title: n,
            description: r
        }, a.default.createElement(i.TooltipTrigger, {
            asChild: !0
        }, a.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": n,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, a.default.createElement(t.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }])
}, 908202, e => {
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
}, 39210, e => {
    "use strict";
    var t = e.i(416340);
    let i = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            a = (0, t.useRef)();
        return a.current || (i += 1, a.current = "".concat(e).concat(i)), a.current
    }])
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function i(e, t) {
        let {
            pages: i,
            pageParams: a
        } = t, n = i.length - 1;
        return i.length > 0 ? e.getNextPageParam(i[n], i, a[n], a) : void 0
    }

    function a(e, t) {
        var i;
        let {
            pages: a,
            pageParams: n
        } = t;
        return a.length > 0 ? null == (i = e.getPreviousPageParam) ? void 0 : i.call(e, a[0], a, n[0], n) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != i(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != a(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (n, r) => {
                var l, s, o, u, d;
                let f = n.options,
                    c = null == (o = n.fetchOptions) || null == (s = o.meta) || null == (l = s.fetchMore) ? void 0 : l.direction,
                    p = (null == (u = n.state.data) ? void 0 : u.pages) || [],
                    m = (null == (d = n.state.data) ? void 0 : d.pageParams) || [],
                    h = {
                        pages: [],
                        pageParams: []
                    },
                    v = 0,
                    y = async () => {
                        let r = !1,
                            l = (0, t.ensureQueryFn)(n.options, n.fetchOptions),
                            s = async (e, i, a) => {
                                let s;
                                if (r) return Promise.reject();
                                if (null == i && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(s = {
                                        client: n.client,
                                        queryKey: n.queryKey,
                                        pageParam: i,
                                        direction: a ? "backward" : "forward",
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
                                    f = a ? t.addToStart : t.addToEnd;
                                return {
                                    pages: f(e.pages, u, d),
                                    pageParams: f(e.pageParams, i, d)
                                }
                            };
                        if (c && p.length) {
                            let e = "backward" === c,
                                t = {
                                    pages: p,
                                    pageParams: m
                                },
                                n = (e ? a : i)(f, t);
                            h = await s(t, n, e)
                        } else {
                            let t = null != e ? e : p.length;
                            do {
                                var o;
                                let e = 0 === v ? null != (o = m[0]) ? o : f.initialPageParam : i(f, h);
                                if (v > 0 && null == e) break;
                                h = await s(h, e), v++
                            } while (v < t)
                        }
                        return h
                    };
                n.options.persister ? n.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = n.options).persister) ? void 0 : e.call(t, y, {
                        client: n.client,
                        queryKey: n.queryKey,
                        meta: n.options.meta,
                        signal: n.signal
                    }, r)
                } : n.fetchFn = y
            }
        }
    }])
}, 630986, e => {
    "use strict";
    var t = e.i(468612),
        i = e.i(117437),
        a = class extends t.QueryObserver {
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
                var a, n;
                let {
                    state: r
                } = e, l = super.createResult(e, t), {
                    isFetching: s,
                    isRefetching: o,
                    isError: u,
                    isRefetchError: d
                } = l, f = null == (n = r.fetchMeta) || null == (a = n.fetchMore) ? void 0 : a.direction, c = u && "forward" === f, p = s && "forward" === f, m = u && "backward" === f, h = s && "backward" === f;
                return {
                    ...l,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, i.hasNextPage)(t, r.data),
                    hasPreviousPage: (0, i.hasPreviousPage)(t, r.data),
                    isFetchNextPageError: c,
                    isFetchingNextPage: p,
                    isFetchPreviousPageError: m,
                    isFetchingPreviousPage: h,
                    isRefetchError: d && !c && !m,
                    isRefetching: o && !p && !h
                }
            }
            constructor(e, t) {
                super(e, t)
            }
        },
        n = e.i(624083);
    e.s(["useInfiniteQuery", 0, function(e, t) {
        return (0, n.useBaseQuery)(e, a, t)
    }], 630986)
}]);

//# debugId=b1647c21-a6aa-6596-ca51-ef0ede301216
//# sourceMappingURL=2woqlryzpo_v0.js.map