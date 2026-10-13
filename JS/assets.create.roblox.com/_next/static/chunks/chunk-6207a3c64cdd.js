;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "407070d5-9f9a-fc89-81cc-5749155c0a66")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 756568, e => {
    "use strict";
    var t = e.i(776344);
    e.s(["Flex", () => t.default])
}, 338653, 540459, e => {
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
                    o(n.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function l(e) {
                try {
                    o(n.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function o(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(s, l)
            }
            o((n = n.apply(e, t || [])).next())
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
        return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function l(l) {
            return function(o) {
                var u = [l, o];
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

    function l(e) {
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
            universe: (0, t.exists)(e, "universe") ? s(e.universe) : void 0,
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

    function k(e) {
        return e
    }

    function v(e, i) {
        return null == e ? e : {
            affiliateLinks: e.affiliateLinks.map(l),
            totalCount: e.totalCount,
            nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function y(e, t) {
        return null == e ? e : {
            affiliateLink: f(e.affiliateLink)
        }
    }
    var m = function(e) {
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
                                body: o(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return d(e)
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
                                body: o(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return d(e)
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
                                        creator: c(e.creator),
                                        vanityCode: e.vanityCode,
                                        launchData: e.launchData,
                                        fallbackType: e.fallbackType
                                    }
                                }(e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest)
                            }, i)];
                        case 1:
                            return s = a.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return d(e)
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
                                        creator: c(e.creator),
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
    }(t.BaseAPI), e.s(["AffiliateLinksApi", 0, m, "FallbackType", 0, {
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
    }], 540459);
    let L = new m((0, e.i(272593).createClientConfiguration)("affiliate-links", "bedev2"));
    e.s(["createAffiliateLink", 0, e => L.affiliateLinksCreateAffiliateLinkByUser({
        affiliateLinksCreateAffiliateLinkByUserRequest: e
    }), "createGroupAffiliateLink", 0, e => {
        let {
            groupId: t,
            ...i
        } = e;
        return L.affiliateLinksCreateAffiliateLinkByGroup({
            groupId: t,
            affiliateLinksCreateAffiliateLinkByUserRequest: i
        })
    }, "editAffiliateLink", 0, e => L.affiliateLinksUpdateAffiliateLinkByUser({
        affiliateLinksUpdateAffiliateLinkByUserRequest: e
    }), "editGroupAffiliateLink", 0, e => {
        let {
            groupId: t,
            ...i
        } = e;
        return L.affiliateLinksUpdateAffiliateLinkByGroup({
            groupId: t,
            affiliateLinksUpdateAffiliateLinkByUserRequest: i
        })
    }, "getAffiliateLinks", 0, e => L.affiliateLinksListAffiliateLinksByUser(e), "getGroupAffiliateLinks", 0, e => L.affiliateLinksListAffiliateLinksByGroup(e), "getGroupCreatorMetadata", 0, e => L.affiliateLinksGetCreatorMetadataByGroup({
        groupId: e
    }), "getGroupEligibility", 0, e => L.affiliateLinksGetEligibilityByGroup({
        groupId: e
    }), "getRequirements", 0, () => L.affiliateLinksGetRequirementsByUser(), "getUniverseEligibility", 0, e => L.affiliateLinksGetUniverseEligibilityById({
        universeId: e
    }), "getUserCreatorMetadata", 0, () => L.affiliateLinksGetCreatorMetadataByUser()], 338653)
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        i = e.i(78892),
        n = e.i(723570),
        r = e => {
            var r, s, l;
            let o, u, {
                    present: f,
                    children: d
                } = e,
                c = function(e) {
                    var i, r;
                    let [s, l] = t.useState(), o = t.useRef(null), u = t.useRef(e), f = t.useRef("none"), [d, c] = (i = e ? "mounted" : "unmounted", r = {
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
                        let i = r[e][t];
                        return null != i ? i : e
                    }, i));
                    return t.useEffect(() => {
                        let e = a(o.current);
                        f.current = "mounted" === d ? e : "none"
                    }, [d]), (0, n.useLayoutEffect)(() => {
                        let t = o.current,
                            i = u.current;
                        if (i !== e) {
                            let n = f.current,
                                r = a(t);
                            e ? c("MOUNT") : "none" === r || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : i && n !== r ? c("ANIMATION_OUT") : c("UNMOUNT"), u.current = e
                        }
                    }, [e, c]), (0, n.useLayoutEffect)(() => {
                        if (s) {
                            var e;
                            let t, i = null != (e = s.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = a(o.current).includes(CSS.escape(e.animationName));
                                    if (e.target === s && n && (c("ANIMATION_END"), !u.current)) {
                                        let e = s.style.animationFillMode;
                                        s.style.animationFillMode = "forwards", t = i.setTimeout(() => {
                                            "forwards" === s.style.animationFillMode && (s.style.animationFillMode = e)
                                        })
                                    }
                                },
                                r = e => {
                                    e.target === s && (f.current = a(o.current))
                                };
                            return s.addEventListener("animationstart", r), s.addEventListener("animationcancel", n), s.addEventListener("animationend", n), () => {
                                i.clearTimeout(t), s.removeEventListener("animationstart", r), s.removeEventListener("animationcancel", n), s.removeEventListener("animationend", n)
                            }
                        }
                        c("ANIMATION_END")
                    }, [s, c]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: t.useCallback(e => {
                            o.current = e ? getComputedStyle(e) : null, l(e)
                        }, [])
                    }
                }(f),
                p = "function" == typeof d ? d({
                    present: c.isPresent
                }) : t.Children.only(d),
                h = (0, i.useComposedRefs)(c.ref, (u = (o = null == (s = Object.getOwnPropertyDescriptor((r = p).props, "ref")) ? void 0 : s.get) && "isReactWarning" in o && o.isReactWarning) ? r.ref : (u = (o = null == (l = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : l.get) && "isReactWarning" in o && o.isReactWarning) ? r.props.ref : r.props.ref || r.ref);
            return "function" == typeof d || c.isPresent ? t.cloneElement(p, {
                ref: h
            }) : null
        };

    function a(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    r.displayName = "Presence", e.s(["Presence", 0, r])
}, 904451, e => {
    "use strict";
    var t = e.i(140625),
        i = e.i(408832),
        n = e.i(197649),
        r = e.i(416340),
        a = e.i(78892),
        s = e.i(608652),
        l = e.i(174617),
        o = e.i(199786),
        u = e.i(300792),
        f = e.i(692166),
        d = e.i(169525),
        c = e.i(600317),
        p = e.i(221628),
        h = "Checkbox",
        [k, v] = (0, s.createContextScope)(h),
        [y, m] = k(h);

    function L(e) {
        let {
            __scopeCheckbox: t,
            checked: i,
            children: n,
            defaultChecked: a,
            disabled: s,
            form: l,
            name: u,
            onCheckedChange: f,
            required: d,
            value: c = "on",
            internal_do_not_use_render: k
        } = e, [v, m] = (0, o.useControllableState)({
            prop: i,
            defaultProp: null != a && a,
            onChange: f,
            caller: h
        }), [L, w] = r.useState(null), [g, R] = r.useState(null), A = r.useRef(!1), b = !L || !!l || !!L.closest("form"), C = {
            checked: v,
            disabled: s,
            setChecked: m,
            control: L,
            setControl: w,
            name: u,
            form: l,
            value: c,
            hasConsumerStoppedPropagationRef: A,
            required: d,
            defaultChecked: !q(a) && a,
            isFormControl: b,
            bubbleInput: g,
            setBubbleInput: R
        };
        return (0, p.jsx)(y, {
            scope: t,
            ...C,
            children: "function" == typeof k ? k(C) : n
        })
    }
    var w = "CheckboxTrigger",
        g = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: i,
                onKeyDown: n,
                onClick: s,
                ...o
            } = e, {
                control: u,
                value: f,
                disabled: d,
                checked: h,
                required: k,
                setControl: v,
                setChecked: y,
                hasConsumerStoppedPropagationRef: L,
                isFormControl: g,
                bubbleInput: R
            } = m(w, i), A = (0, a.useComposedRefs)(t, v), b = r.useRef(h);
            return r.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => y(b.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, y]), (0, p.jsx)(c.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": q(h) ? "mixed" : h,
                "aria-required": k,
                "data-state": x(h),
                "data-disabled": d ? "" : void 0,
                disabled: d,
                value: f,
                ...o,
                ref: A,
                onKeyDown: (0, l.composeEventHandlers)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, l.composeEventHandlers)(s, e => {
                    y(e => !!q(e) || !e), R && g && (L.current = e.isPropagationStopped(), L.current || e.stopPropagation())
                })
            })
        });
    g.displayName = w;
    var R = r.forwardRef((e, t) => {
        let {
            __scopeCheckbox: i,
            name: n,
            checked: r,
            defaultChecked: a,
            required: s,
            disabled: l,
            value: o,
            onCheckedChange: u,
            form: f,
            ...d
        } = e;
        return (0, p.jsx)(L, {
            __scopeCheckbox: i,
            checked: r,
            defaultChecked: a,
            disabled: l,
            required: s,
            onCheckedChange: u,
            name: n,
            form: f,
            value: o,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, p.jsxs)(p.Fragment, {
                    children: [(0, p.jsx)(g, {
                        ...d,
                        ref: t,
                        __scopeCheckbox: i
                    }), n && (0, p.jsx)(I, {
                        __scopeCheckbox: i
                    })]
                })
            }
        })
    });
    R.displayName = h;
    var A = "CheckboxIndicator",
        b = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: i,
                forceMount: n,
                ...r
            } = e, a = m(A, i);
            return (0, p.jsx)(d.Presence, {
                present: n || q(a.checked) || !0 === a.checked,
                children: (0, p.jsx)(c.Primitive.span, {
                    "data-state": x(a.checked),
                    "data-disabled": a.disabled ? "" : void 0,
                    ...r,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    b.displayName = A;
    var C = "CheckboxBubbleInput",
        I = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: i,
                ...n
            } = e, {
                control: s,
                hasConsumerStoppedPropagationRef: l,
                checked: o,
                defaultChecked: d,
                required: h,
                disabled: k,
                name: v,
                value: y,
                form: L,
                bubbleInput: w,
                setBubbleInput: g
            } = m(C, i), R = (0, a.useComposedRefs)(t, g), A = (0, u.usePrevious)(o), b = (0, f.useSize)(s);
            r.useEffect(() => {
                if (!w) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !l.current;
                if (A !== o && e) {
                    let i = new Event("click", {
                        bubbles: t
                    });
                    w.indeterminate = q(o), e.call(w, !q(o) && o), w.dispatchEvent(i)
                }
            }, [w, A, o, l]);
            let I = r.useRef(!q(o) && o);
            return (0, p.jsx)(c.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != d ? d : I.current,
                required: h,
                disabled: k,
                name: v,
                value: y,
                form: L,
                ...n,
                tabIndex: -1,
                ref: R,
                style: {
                    ...n.style,
                    ...b,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function q(e) {
        return "indeterminate" === e
    }

    function x(e) {
        return q(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    I.displayName = C;
    let U = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        T = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        E = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        B = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: a,
            className: s,
            isChecked: l,
            isDisabled: o,
            size: u,
            hint: f,
            placement: d,
            onCheckedChange: c,
            id: p,
            ...h
        } = e, k = (0, i.default)(), v = p || k, y = a && r.default.createElement("label", {
            htmlFor: v,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !o && "cursor-pointer")
        }, r.default.createElement("span", {
            className: (0, n.default)(E[u], B[u], "content-emphasis")
        }, a), f && r.default.createElement("span", {
            className: "text-body-medium content-default"
        }, f));
        return r.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", o && "opacity-[0.5]", !o && "cursor-pointer", s)
        }, "End" === d && y, r.default.createElement("div", {
            className: (0, n.default)(T[u])
        }, r.default.createElement(R, {
            "data-slot": "checkbox",
            className: (0, n.default)(U[u], t.interactable, !o && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: v,
            checked: l,
            disabled: o,
            onCheckedChange: c,
            "aria-label": a,
            ...h
        }, r.default.createElement(t.StateLayer, null), r.default.createElement(b, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(U[u], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === d && y)
    }], 904451)
}, 395203, e => {
    "use strict";
    var t = e.i(603955),
        i = e.i(75584),
        n = e.i(408832),
        r = e.i(148380),
        a = e.i(750615),
        s = e.i(197649),
        l = e.i(416340);
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
        f = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        d = {
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
        h = (0, l.forwardRef)((e, h) => {
            let {
                label: k,
                labelTooltip: v,
                leadingIconName: y,
                trailingIconName: m,
                leadingIconNode: L,
                trailingIconNode: w,
                hasError: g,
                error: R,
                helperText: A,
                size: b,
                variant: C = "Standard",
                isRequired: I,
                isDisabled: q,
                className: x,
                style: U,
                inputContainerClassName: T,
                inputContainerClassStyle: E,
                id: B,
                ...P
            } = e, S = (0, n.default)(), N = B || S, G = "".concat(N, "-description"), O = null != b ? b : "Large", D = g || !!R, M = R || A, j = (0, l.useMemo)(() => y ? l.default.createElement(i.Icon, {
                name: y,
                size: O,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : L, [y, L, O]), K = (0, l.useMemo)(() => m ? l.default.createElement(i.Icon, {
                name: m,
                size: O,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : w, [O, m, w]), _ = k ? l.default.createElement("label", {
                htmlFor: N,
                className: (0, s.default)(c[O], "content-emphasis")
            }, k, I && l.default.createElement(l.default.Fragment, null, " ", l.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return l.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, s.default)("flex width-full flex-col gap-small ".concat(x), {
                    [t.disabledOpacity]: q
                }),
                style: U
            }, _ && (v ? l.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, _, l.default.createElement(r.LabelTooltip, v)) : _), l.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, s.default)("foundation-web-input flex items-center width-full", a.INPUT_STROKE_BY_VARIANT[C], a.INPUT_BACKGROUND_BY_VARIANT[C], T, f[O], d[O], o[O], u[O], D ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: E
            }, j, l.default.createElement("input", {
                type: "text",
                id: N,
                ref: h,
                className: (0, s.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", p[O]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": D,
                "aria-describedby": M ? G : void 0,
                required: I,
                ...P,
                disabled: q
            }), K), M && l.default.createElement("span", {
                id: G,
                className: (0, s.default)("text-caption-small", {
                    "content-system-alert": D,
                    "content-default": !D
                })
            }, M))
        });
    h.displayName = "TextInput", e.s(["TextInput", 0, h])
}, 16255, e => {
    "use strict";
    var t = e.i(788647);
    e.s(["NavigateNextIcon", () => t.N])
}, 883302, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["NavigateBeforeIcon", () => t.NavigateBefore])
}]);

//# debugId=407070d5-9f9a-fc89-81cc-5749155c0a66
//# sourceMappingURL=0k4a7gmp2ev3j.js.map