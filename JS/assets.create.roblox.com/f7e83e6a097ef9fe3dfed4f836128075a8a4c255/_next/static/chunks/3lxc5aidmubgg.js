;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "12726e59-e25c-0520-076b-7855692b2216")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 581548, e => {
    "use strict";
    var n = e.i(677753),
        i = function(e, n) {
            return (i = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, n) {
                e.__proto__ = n
            } || function(e, n) {
                for (var i in n) Object.prototype.hasOwnProperty.call(n, i) && (e[i] = n[i])
            })(e, n)
        };

    function t(e, n) {
        if ("function" != typeof n && null !== n) throw TypeError("Class extends value " + String(n) + " is not a constructor or null");

        function t() {
            this.constructor = e
        }
        i(e, n), e.prototype = null === n ? Object.create(n) : (t.prototype = n.prototype, new t)
    }

    function r(e, n, i, t) {
        return new(i || (i = Promise))(function(r, o) {
            function a(e) {
                try {
                    d(t.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                try {
                    d(t.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function d(e) {
                var n;
                e.done ? r(e.value) : ((n = e.value) instanceof i ? n : new i(function(e) {
                    e(n)
                })).then(a, s)
            }
            d((t = t.apply(e, n || [])).next())
        })
    }

    function o(e, n) {
        var i, t, r, o = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function s(s) {
            return function(d) {
                var u = [s, d];
                if (i) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, u[0] && (o = 0)), o;) try {
                    if (i = 1, t && (r = 2 & u[0] ? t.return : u[0] ? t.throw || ((r = t.return) && r.call(t), 0) : t.next) && !(r = r.call(t, u[1])).done) return r;
                    switch (t = 0, r && (u = [2 & u[0], r.value]), u[0]) {
                        case 0:
                        case 1:
                            r = u;
                            break;
                        case 4:
                            return o.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            o.label++, t = u[1], u = [0];
                            continue;
                        case 7:
                            u = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = o.trys).length > 0 && r[r.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === u[0] && (!r || u[1] > r[0] && u[1] < r[3])) {
                                o.label = u[1];
                                break
                            }
                            if (6 === u[0] && o.label < r[1]) {
                                o.label = r[1], r = u;
                                break
                            }
                            if (r && o.label < r[2]) {
                                o.label = r[2], o.ops.push(u);
                                break
                            }
                            r[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    u = n.call(e, o)
                } catch (e) {
                    u = [6, e], t = 0
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

    function a(e) {
        var n;
        return null == (n = e) ? n : {
            userId: n.userId,
            percentage: n.percentage
        }
    }

    function s(e) {
        if (void 0 !== e) return null === e ? null : {
            userId: e.userId,
            percentage: e.percentage
        }
    }

    function d(e, n) {
        return null == e ? e : {
            payouts: e.payouts.map(a)
        }
    }

    function u(e) {
        var i;
        return null == (i = e) ? i : {
            id: (0, n.exists)(i, "id") ? i.id : void 0,
            organizationId: (0, n.exists)(i, "organizationId") ? i.organizationId : void 0,
            recipientUserId: (0, n.exists)(i, "recipientUserId") ? i.recipientUserId : void 0,
            senderUserId: (0, n.exists)(i, "senderUserId") ? i.senderUserId : void 0,
            invitationStatusType: (0, n.exists)(i, "invitationStatusType") ? i.invitationStatusType : void 0,
            updatedTime: (0, n.exists)(i, "updatedTime") ? new Date(i.updatedTime) : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function l(e, i) {
        return null == e ? e : {
            invitations: e.invitations.map(u),
            pageToken: (0, n.exists)(e, "pageToken") ? e.pageToken : void 0
        }
    }

    function c(e) {
        var i, t;
        return null == (i = e) ? i : {
            recipientUserId: i.recipientUserId,
            status: i.status,
            oneTimePayout: (0, n.exists)(i, "oneTimePayout") ? null == (t = i.oneTimePayout) ? t : {
                amount: t.amount,
                createdAt: new Date(t.createdAt)
            } : void 0
        }
    }

    function I(e, n) {
        return null == e ? e : {
            payouts: e.payouts.map(c)
        }
    }

    function g(e) {
        var i;
        return null == (i = e) ? i : {
            id: i.id,
            organizationId: i.organizationId,
            name: i.name,
            color: i.color,
            updatedTime: (0, n.exists)(i, "updatedTime") ? null === i.updatedTime ? null : new Date(i.updatedTime) : void 0
        }
    }

    function v(e, i) {
        return null == e ? e : {
            roles: e.roles.map(g),
            pageToken: (0, n.exists)(e, "pageToken") ? e.pageToken : void 0
        }
    }

    function p(e) {
        var i;
        return null == (i = e) ? i : {
            userId: (0, n.exists)(i, "userId") ? i.userId : void 0,
            roles: (0, n.exists)(i, "roles") ? null === i.roles ? null : i.roles.map(g) : void 0
        }
    }

    function h(e, i) {
        return null == e ? e : {
            users: e.users.map(p),
            pageToken: (0, n.exists)(e, "pageToken") ? e.pageToken : void 0
        }
    }

    function z(e) {
        if (void 0 !== e) return null === e ? null : {
            name: e.name,
            color: e.color
        }
    }

    function R(e) {
        var i;
        return null == (i = e) ? i : {
            universeId: (0, n.exists)(i, "UniverseId") ? i.UniverseId : void 0,
            percentage: (0, n.exists)(i, "Percentage") ? i.Percentage : void 0
        }
    }

    function f(e) {
        var n;
        return null == (n = e) ? n : {
            isGranted: n.isGranted,
            canEdit: n.canEdit
        }
    }

    function w(e, i) {
        return null == e ? e : {
            permissions: (0, n.mapValues)(e.permissions, f)
        }
    }

    function m(e) {
        var i;
        return null == (i = e) ? i : {
            id: (0, n.exists)(i, "id") ? i.id : void 0,
            name: (0, n.exists)(i, "name") ? i.name : void 0
        }
    }

    function O(e, n) {
        return null == e ? e : {
            id: e.id,
            groupId: e.groupId
        }
    }

    function q(e) {
        if (void 0 !== e) return null === e ? null : {
            isGranted: e.isGranted
        }
    }

    function P(e, n) {
        return null == e ? e : {
            success: e.success
        }
    }

    function U(e) {
        if (void 0 !== e) return null === e ? null : {
            permissions: (0, n.mapValues)(e.permissions, q)
        }
    }
    var y = function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            return t(i, e), i.prototype.v1OrganizationsOrganizationIdPayoutsLatestGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdPayoutsLatestGet.");
                                return t = {}, e.userIds && (t.userIds = e.userIds), r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/payouts/latest".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/payouts/latest",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdPayoutsLatestGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdPayoutsLatestGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdPayoutsSuggestedGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdPayoutsSuggestedGet.");
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/payouts/suggested".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/payouts/suggested",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdPayoutsSuggestedGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdPayoutsSuggestedGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdPayoutsUniverseIdGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdPayoutsUniverseIdGet.");
                                if (null === e.universeId || void 0 === e.universeId) throw new n.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1OrganizationsOrganizationIdPayoutsUniverseIdGet.");
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/payouts/{universeId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/organizations/{organizationId}/payouts/{universeId}",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdPayoutsUniverseIdGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdPayoutsUniverseIdGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdPayoutsUniverseIdPatchRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdPayoutsUniverseIdPatch.");
                                if (null === e.universeId || void 0 === e.universeId) throw new n.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1OrganizationsOrganizationIdPayoutsUniverseIdPatch.");
                                if (null === e.updateUniverseRecurringPayoutsRequestModel || void 0 === e.updateUniverseRecurringPayoutsRequestModel) throw new n.RequiredError("updateUniverseRecurringPayoutsRequestModel", "Required parameter requestParameters.updateUniverseRecurringPayoutsRequestModel was null or undefined when calling v1OrganizationsOrganizationIdPayoutsUniverseIdPatch.");
                                return t = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/organizations/{organizationId}/payouts/{universeId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/organizations/{organizationId}/payouts/{universeId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            payouts: e.payouts.map(s)
                                        }
                                    }(e.updateUniverseRecurringPayoutsRequestModel)
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdPayoutsUniverseIdPatch = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdPayoutsUniverseIdPatchRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdPayoutsUniversesGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdPayoutsUniversesGet.");
                                return t = {}, void 0 !== e.limit && (t.limit = e.limit), void 0 !== e.cursor && (t.cursor = e.cursor), void 0 !== e.previous && (t.previous = e.previous), r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/payouts/universes".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/payouts/universes",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    var i;
                                    return null == e ? e : {
                                        data: (0, n.exists)(e, "data") ? null == (i = e.data) ? i : {
                                            records: (0, n.exists)(i, "Records") ? null === i.Records ? null : i.Records.map(R) : void 0,
                                            nextCursor: (0, n.exists)(i, "NextCursor") ? i.NextCursor : void 0,
                                            previousCursor: (0, n.exists)(i, "PreviousCursor") ? i.PreviousCursor : void 0,
                                            hasMore: (0, n.exists)(i, "HasMore") ? i.HasMore : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdPayoutsUniversesGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdPayoutsUniversesGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i
        }(n.BaseAPI),
        S = (function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            t(i, e), i.prototype.v2GroupsPermissionsCreateassetsGetRaw = function(e) {
                return r(this, void 0, void 0, function() {
                    var i, t, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return i = {}, t = {}, [4, this.request({
                                    path: "/v2/groups/permissions/createassets",
                                    schemaPath: "/v2/groups/permissions/createassets",
                                    method: "GET",
                                    headers: t,
                                    query: i
                                }, e)];
                            case 1:
                                return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        data: (0, n.exists)(e, "data") ? null === e.data ? null : e.data.map(m) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, i.prototype.v2GroupsPermissionsCreateassetsGet = function(e) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2GroupsPermissionsCreateassetsGetRaw(e)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }
        }(n.BaseAPI), function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            return t(i, e), i.prototype.v1OrganizationsOrganizationIdInvitationsGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsGet.");
                                return t = {}, void 0 !== e.maxPageSize && (t.MaxPageSize = e.maxPageSize), void 0 !== e.pageToken && (t.PageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/invitations".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/invitations",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdInvitationsGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdInvitationsGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdDeleteRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdDelete.");
                                if (null === e.invitationId || void 0 === e.invitationId) throw new n.RequiredError("invitationId", "Required parameter requestParameters.invitationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdDelete.");
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/invitations/{invitationId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("invitationId", "}"), encodeURIComponent(String(e.invitationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/invitations/{invitationId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return P(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdDelete = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdInvitationsInvitationIdDeleteRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.invitationId || void 0 === e.invitationId) throw new n.RequiredError("invitationId", "Required parameter requestParameters.invitationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdGet.");
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdGet.");
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/invitations/{invitationId}".replace("{".concat("invitationId", "}"), encodeURIComponent(String(e.invitationId))).replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/invitations/{invitationId}",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdInvitationsInvitationIdGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdPatchRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.invitationId || void 0 === e.invitationId) throw new n.RequiredError("invitationId", "Required parameter requestParameters.invitationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdPatch.");
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdPatch.");
                                if (null === e.updateInvitationRequestModel || void 0 === e.updateInvitationRequestModel) throw new n.RequiredError("updateInvitationRequestModel", "Required parameter requestParameters.updateInvitationRequestModel was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdPatch.");
                                return t = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/organizations/{organizationId}/invitations/{invitationId}".replace("{".concat("invitationId", "}"), encodeURIComponent(String(e.invitationId))).replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/invitations/{invitationId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            status: e.status
                                        }
                                    }(e.updateInvitationRequestModel)
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return P(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdPatch = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdInvitationsInvitationIdPatchRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.invitationId || void 0 === e.invitationId) throw new n.RequiredError("invitationId", "Required parameter requestParameters.invitationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet.");
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet.");
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/invitations/{invitationId}/roleIds".replace("{".concat("invitationId", "}"), encodeURIComponent(String(e.invitationId))).replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/invitations/{invitationId}/roleIds",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        roleIds: e.roleIds
                                    }
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdInvitationsPostRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsPost.");
                                if (null === e.createInvitationRequestModel || void 0 === e.createInvitationRequestModel) throw new n.RequiredError("createInvitationRequestModel", "Required parameter requestParameters.createInvitationRequestModel was null or undefined when calling v1OrganizationsOrganizationIdInvitationsPost.");
                                return t = {}, void 0 !== e.isSecure && (t.isSecure = e.isSecure), (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/organizations/{organizationId}/invitations".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/invitations",
                                    method: "POST",
                                    headers: r,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            recipientUserId: e.recipientUserId,
                                            roleIds: e.roleIds
                                        }
                                    }(e.createInvitationRequestModel)
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdInvitationsPost = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdInvitationsPostRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i
        }(n.BaseAPI)),
        G = function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            return t(i, e), i.prototype.v1OrganizationsGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new n.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1OrganizationsGet.");
                                return t = {}, void 0 !== e.groupId && (t.groupId = e.groupId), r = {}, [4, this.request({
                                    path: "/v1/organizations",
                                    schemaPath: "/v1/organizations",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsPostRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.createOrganizationRequestModel || void 0 === e.createOrganizationRequestModel) throw new n.RequiredError("createOrganizationRequestModel", "Required parameter requestParameters.createOrganizationRequestModel was null or undefined when calling v1OrganizationsPost.");
                                return t = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/organizations",
                                    schemaPath: "/v1/organizations",
                                    method: "POST",
                                    headers: r,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            groupId: e.groupId
                                        }
                                    }(e.createOrganizationRequestModel)
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsPost = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsPostRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i
        }(n.BaseAPI),
        E = function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            return t(i, e), i.prototype.v1OrganizationsOrganizationIdRolesGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesGet.");
                                return t = {}, void 0 !== e.maxPageSize && (t.MaxPageSize = e.maxPageSize), void 0 !== e.pageToken && (t.PageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesPostRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesPost.");
                                if (null === e.createOrUpdateRoleRequestModel || void 0 === e.createOrUpdateRoleRequestModel) throw new n.RequiredError("createOrUpdateRoleRequestModel", "Required parameter requestParameters.createOrUpdateRoleRequestModel was null or undefined when calling v1OrganizationsOrganizationIdRolesPost.");
                                return t = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles",
                                    method: "POST",
                                    headers: r,
                                    query: t,
                                    body: z(e.createOrUpdateRoleRequestModel)
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesPost = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesPostRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesRoleIdDeleteRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdDelete.");
                                if (null === e.roleId || void 0 === e.roleId) throw new n.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdDelete.");
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles/{roleId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles/{roleId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return P(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesRoleIdDelete = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesRoleIdDeleteRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet.");
                                if (null === e.roleId || void 0 === e.roleId) throw new n.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet.");
                                return t = {}, void 0 !== e.maxPageSize && (t.MaxPageSize = e.maxPageSize), void 0 !== e.pageToken && (t.PageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles/{roleId}/invitations".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles/{roleId}/invitations",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesRoleIdMetadataGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdMetadataGet.");
                                if (null === e.roleId || void 0 === e.roleId) throw new n.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdMetadataGet.");
                                return t = {}, void 0 !== e.isDefault && (t.isDefault = e.isDefault), r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles/{roleId}/metadata".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles/{roleId}/metadata",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesRoleIdMetadataGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesRoleIdMetadataGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatchRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch.");
                                if (null === e.roleId || void 0 === e.roleId) throw new n.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch.");
                                if (null === e.createOrUpdateRoleRequestModel || void 0 === e.createOrUpdateRoleRequestModel) throw new n.RequiredError("createOrUpdateRoleRequestModel", "Required parameter requestParameters.createOrUpdateRoleRequestModel was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch.");
                                return t = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles/{roleId}/metadata".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles/{roleId}/metadata",
                                    method: "PATCH",
                                    headers: r,
                                    query: t,
                                    body: z(e.createOrUpdateRoleRequestModel)
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatchRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesRoleIdPositionPatchRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdPositionPatch.");
                                if (null === e.roleId || void 0 === e.roleId) throw new n.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdPositionPatch.");
                                return t = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles/{roleId}/position".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles/{roleId}/position",
                                    method: "PATCH",
                                    headers: r,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            previousRoleId: e.previousRoleId,
                                            nextRoleId: e.nextRoleId
                                        }
                                    }(e.updateRolePositionRequestModel)
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return P(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesRoleIdPositionPatch = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesRoleIdPositionPatchRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesRoleIdUsersGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdUsersGet.");
                                if (null === e.roleId || void 0 === e.roleId) throw new n.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdUsersGet.");
                                return t = {}, void 0 !== e.maxPageSize && (t.MaxPageSize = e.maxPageSize), void 0 !== e.pageToken && (t.PageToken = e.pageToken), void 0 !== e.isDefault && (t.isDefault = e.isDefault), r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles/{roleId}/users".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles/{roleId}/users",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return h(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdRolesRoleIdUsersGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesRoleIdUsersGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v2OrganizationsOrganizationIdRolesRoleIdPermissionsGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v2OrganizationsOrganizationIdRolesRoleIdPermissionsGet.");
                                if (null === e.roleId || void 0 === e.roleId) throw new n.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v2OrganizationsOrganizationIdRolesRoleIdPermissionsGet.");
                                return t = {}, void 0 !== e.isDefault && (t.isDefault = e.isDefault), r = {}, [4, this.request({
                                    path: "/v2/organizations/{organizationId}/roles/{roleId}/permissions".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v2/organizations/{organizationId}/roles/{roleId}/permissions",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return w(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v2OrganizationsOrganizationIdRolesRoleIdPermissionsGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v2OrganizationsOrganizationIdRolesRoleIdPermissionsGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v2OrganizationsOrganizationIdRolesRoleIdPermissionsPostRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v2OrganizationsOrganizationIdRolesRoleIdPermissionsPost.");
                                if (null === e.roleId || void 0 === e.roleId) throw new n.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v2OrganizationsOrganizationIdRolesRoleIdPermissionsPost.");
                                if (null === e.updatePermissionsRequestModel || void 0 === e.updatePermissionsRequestModel) throw new n.RequiredError("updatePermissionsRequestModel", "Required parameter requestParameters.updatePermissionsRequestModel was null or undefined when calling v2OrganizationsOrganizationIdRolesRoleIdPermissionsPost.");
                                return t = {}, void 0 !== e.isDefault && (t.isDefault = e.isDefault), void 0 !== e.isSecure && (t.isSecure = e.isSecure), (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v2/organizations/{organizationId}/roles/{roleId}/permissions".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v2/organizations/{organizationId}/roles/{roleId}/permissions",
                                    method: "POST",
                                    headers: r,
                                    query: t,
                                    body: U(e.updatePermissionsRequestModel)
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.VoidApiResponse(a)]
                        }
                    })
                })
            }, i.prototype.v2OrganizationsOrganizationIdRolesRoleIdPermissionsPost = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v2OrganizationsOrganizationIdRolesRoleIdPermissionsPostRaw(e, n)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, i
        }(n.BaseAPI),
        b = function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            return t(i, e), i.prototype.v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdGet.");
                                if (null === e.roleId || void 0 === e.roleId) throw new n.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdGet.");
                                if (null === e.universeId || void 0 === e.universeId) throw new n.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdGet.");
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions/organizations/{organizationId}/roles/{roleId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))).replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions/organizations/{organizationId}/roles/{roleId}",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return w(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdPostRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdPost.");
                                if (null === e.roleId || void 0 === e.roleId) throw new n.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdPost.");
                                if (null === e.universeId || void 0 === e.universeId) throw new n.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdPost.");
                                if (null === e.updatePermissionsRequestModel || void 0 === e.updatePermissionsRequestModel) throw new n.RequiredError("updatePermissionsRequestModel", "Required parameter requestParameters.updatePermissionsRequestModel was null or undefined when calling v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdPost.");
                                return t = {}, void 0 !== e.isSecure && (t.isSecure = e.isSecure), (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions/organizations/{organizationId}/roles/{roleId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))).replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions/organizations/{organizationId}/roles/{roleId}",
                                    method: "POST",
                                    headers: r,
                                    query: t,
                                    body: U(e.updatePermissionsRequestModel)
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.VoidApiResponse(a)]
                        }
                    })
                })
            }, i.prototype.v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdPost = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdPostRaw(e, n)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, i.prototype.v2UniversesUniverseIdPermissionsResolvedGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new n.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsResolvedGet.");
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions/resolved".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions/resolved",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        deleteDataStore: e.deleteDataStore,
                                        deleteDataStoreEntry: e.deleteDataStoreEntry,
                                        edit: e.edit,
                                        publish: e.publish,
                                        listDataStores: e.listDataStores,
                                        manageBans: e.manageBans,
                                        viewAnalytics: e.viewAnalytics,
                                        monetizeExperience: e.monetizeExperience,
                                        createSecrets: e.createSecrets,
                                        deleteSecrets: e.deleteSecrets,
                                        editSecrets: e.editSecrets,
                                        manageWebhooks: e.manageWebhooks,
                                        manageAlerts: e.manageAlerts
                                    }
                                })]
                        }
                    })
                })
            }, i.prototype.v2UniversesUniverseIdPermissionsResolvedGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsResolvedGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i
        }(n.BaseAPI),
        T = function(e) {
            function i() {
                return null !== e && e.apply(this, arguments) || this
            }
            return t(i, e), i.prototype.v1OrganizationsOrganizationIdUsersGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersGet.");
                                return t = {}, void 0 !== e.maxPageSize && (t.MaxPageSize = e.maxPageSize), void 0 !== e.pageToken && (t.PageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return h(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersUserIdDeleteRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdDelete.");
                                if (null === e.userId || void 0 === e.userId) throw new n.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdDelete.");
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users/{userId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users/{userId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return P(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersUserIdDelete = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersUserIdDeleteRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersUserIdInvitationsGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdInvitationsGet.");
                                if (null === e.userId || void 0 === e.userId) throw new n.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdInvitationsGet.");
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users/{userId}/invitations".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users/{userId}/invitations",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersUserIdInvitationsGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersUserIdInvitationsGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersUserIdPermissionsGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdPermissionsGet.");
                                if (null === e.userId || void 0 === e.userId) throw new n.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdPermissionsGet.");
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users/{userId}/permissions".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users/{userId}/permissions",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        isOwner: e.isOwner,
                                        canConfigureOrganization: e.canConfigureOrganization,
                                        assignableRoleIds: e.assignableRoleIds,
                                        canViewRoleSettings: e.canViewRoleSettings,
                                        canViewRolePermissions: e.canViewRolePermissions,
                                        permissionEditableRoleIds: e.permissionEditableRoleIds,
                                        metadataEditableRoleIds: e.metadataEditableRoleIds,
                                        canCreateRoles: e.canCreateRoles,
                                        canDeleteRoles: e.canDeleteRoles,
                                        canManageMembers: e.canManageMembers,
                                        canViewAuditLogs: e.canViewAuditLogs,
                                        canViewAnalytics: e.canViewAnalytics,
                                        canViewExperiences: e.canViewExperiences,
                                        canConfigureRevenueDetails: e.canConfigureRevenueDetails,
                                        canViewRevenueDetails: e.canViewRevenueDetails,
                                        canAdvertiseGroup: e.canAdvertiseGroup,
                                        canViewAssets: e.canViewAssets,
                                        canCreateAssets: e.canCreateAssets,
                                        canConfigureAssets: e.canConfigureAssets,
                                        canManageAssetPermissions: e.canManageAssetPermissions,
                                        canMonetizeAssets: e.canMonetizeAssets,
                                        canManageUniverseBans: e.canManageUniverseBans,
                                        canManageExperienceEvents: e.canManageExperienceEvents,
                                        canManageGroupFeatures: e.canManageGroupFeatures
                                    }
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersUserIdPermissionsGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersUserIdPermissionsGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersUserIdPostRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdPost.");
                                if (null === e.userId || void 0 === e.userId) throw new n.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdPost.");
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users/{userId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users/{userId}",
                                    method: "POST",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return P(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersUserIdPost = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersUserIdPostRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersUserIdRolesGetRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesGet.");
                                if (null === e.userId || void 0 === e.userId) throw new n.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesGet.");
                                return t = {}, void 0 !== e.maxPageSize && (t.MaxPageSize = e.maxPageSize), void 0 !== e.pageToken && (t.PageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users/{userId}/roles".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users/{userId}/roles",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersUserIdRolesGet = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersUserIdRolesGetRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDeleteRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete.");
                                if (null === e.roleId || void 0 === e.roleId) throw new n.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete.");
                                if (null === e.userId || void 0 === e.userId) throw new n.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete.");
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users/{userId}/roles/{roleId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users/{userId}/roles/{roleId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return P(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDeleteRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPostRaw = function(e, i) {
                return r(this, void 0, void 0, function() {
                    var t, r, a;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new n.RequiredError("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost.");
                                if (null === e.roleId || void 0 === e.roleId) throw new n.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost.");
                                if (null === e.userId || void 0 === e.userId) throw new n.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost.");
                                return t = {}, void 0 !== e.isSecure && (t.isSecure = e.isSecure), r = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users/{userId}/roles/{roleId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users/{userId}/roles/{roleId}",
                                    method: "POST",
                                    headers: r,
                                    query: t
                                }, i)];
                            case 1:
                                return a = o.sent(), [2, new n.JSONApiResponse(a, function(e) {
                                    return P(e)
                                })]
                        }
                    })
                })
            }, i.prototype.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost = function(e, n) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPostRaw(e, n)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, i
        }(n.BaseAPI);
    e.s(["GroupUniversePayoutApi", 0, y, "InvitationApi", 0, S, "InvitationStatusType", 0, {
        Invalid: "Invalid",
        Open: "Open",
        Accepted: "Accepted",
        Declined: "Declined",
        Deleted: "Deleted"
    }, "OrganizationApi", 0, G, "RoleApi", 0, E, "RoleColorType", 0, {
        Invalid: "Invalid",
        Blue: "Blue",
        LightBlue: "LightBlue",
        Green: "Green",
        LightGreen: "LightGreen",
        Purple: "Purple",
        LightPurple: "LightPurple",
        Yellow: "Yellow",
        LightYellow: "LightYellow",
        Orange: "Orange",
        LightOrange: "LightOrange",
        Red: "Red",
        LightRed: "LightRed",
        Pink: "Pink",
        LightPink: "LightPink",
        Teal: "Teal",
        LightTeal: "LightTeal",
        Standard: "Standard"
    }, "UniversesApi", 0, b, "UserApi", 0, T])
}]);

//# debugId=12726e59-e25c-0520-076b-7855692b2216
//# sourceMappingURL=3kfiiuofpotlv.js.map