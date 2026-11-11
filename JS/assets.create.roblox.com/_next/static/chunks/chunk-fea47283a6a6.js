;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "0cfe2128-dfd0-3085-b3b2-888f9b92d27d")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 255382, 631401, e => {
    "use strict";
    var s = e.i(415858),
        t = function(e, s) {
            return (t = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, s) {
                e.__proto__ = s
            } || function(e, s) {
                for (var t in s) Object.prototype.hasOwnProperty.call(s, t) && (e[t] = s[t])
            })(e, s)
        };

    function n(e, s) {
        if ("function" != typeof s && null !== s) throw TypeError("Class extends value " + String(s) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        t(e, s), e.prototype = null === s ? Object.create(s) : (n.prototype = s.prototype, new n)
    }

    function r(e, s, t, n) {
        return new(t || (t = Promise))(function(r, i) {
            function o(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function a(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var s;
                e.done ? r(e.value) : ((s = e.value) instanceof t ? s : new t(function(e) {
                    e(s)
                })).then(o, a)
            }
            u((n = n.apply(e, s || [])).next())
        })
    }

    function i(e, s) {
        var t, n, r, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = a(0), o.throw = a(1), o.return = a(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function a(a) {
            return function(u) {
                var c = [a, u];
                if (t) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, c[0] && (i = 0)), i;) try {
                    if (t = 1, n && (r = 2 & c[0] ? n.return : c[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, c[1])).done) return r;
                    switch (n = 0, r && (c = [2 & c[0], r.value]), c[0]) {
                        case 0:
                        case 1:
                            r = c;
                            break;
                        case 4:
                            return i.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = c[1], c = [0];
                            continue;
                        case 7:
                            c = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === c[0] && (!r || c[1] > r[0] && c[1] < r[3])) {
                                i.label = c[1];
                                break
                            }
                            if (6 === c[0] && i.label < r[1]) {
                                i.label = r[1], r = c;
                                break
                            }
                            if (r && i.label < r[2]) {
                                i.label = r[2], i.ops.push(c);
                                break
                            }
                            r[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    c = s.call(e, i)
                } catch (e) {
                    c = [6, e], n = 0
                } finally {
                    t = r = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function o(e, t) {
        return null == e ? e : {
            status: (0, s.u)(e, "status") ? e.status : void 0
        }
    }

    function a(e) {
        var t;
        return null == (t = e) ? t : {
            typeUrl: (0, s.u)(t, "typeUrl") ? t.typeUrl : void 0,
            value: (0, s.u)(t, "value") ? t.value : void 0
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            assetId: e.assetId
        }
    }

    function c(e) {
        return e
    }

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            assetId: e.assetId,
            grantToDependencies: e.grantToDependencies,
            parentVersionNumber: e.parentVersionNumber
        }
    }

    function l(e, t) {
        return null == e ? e : {
            requestId: (0, s.u)(e, "requestId") ? e.requestId : void 0,
            status: (0, s.u)(e, "status") ? e.status : void 0
        }
    }

    function p(e) {
        var t;
        return null == (t = e) ? t : {
            requestId: (0, s.u)(t, "requestId") ? t.requestId : void 0,
            assetId: (0, s.u)(t, "assetId") ? t.assetId : void 0,
            assetName: (0, s.u)(t, "assetName") ? t.assetName : void 0,
            requesterCreatorType: (0, s.u)(t, "requesterCreatorType") ? t.requesterCreatorType : void 0,
            requesterId: (0, s.u)(t, "requesterId") ? t.requesterId : void 0,
            ownerCreatorType: (0, s.u)(t, "ownerCreatorType") ? t.ownerCreatorType : void 0,
            ownerCreatorId: (0, s.u)(t, "ownerCreatorId") ? t.ownerCreatorId : void 0,
            status: (0, s.u)(t, "status") ? t.status : void 0,
            createdAt: (0, s.u)(t, "createdAt") ? new Date(t.createdAt) : void 0,
            expiresAt: (0, s.u)(t, "expiresAt") ? null === t.expiresAt ? null : new Date(t.expiresAt) : void 0
        }
    }

    function h(e) {
        if (void 0 !== e) return null === e ? null : {
            subject: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    subjectType: e.subjectType,
                    subjectId: e.subjectId
                }
            }(e.subject),
            action: e.action,
            assetId: e.assetId,
            enableDeepAccessCheck: e.enableDeepAccessCheck
        }
    }

    function m(e) {
        if (void 0 !== e) return null === e ? null : {
            assetId: e.assetId
        }
    }

    function v(e) {
        if (void 0 !== e) return null === e ? null : {
            subjectType: e.subjectType,
            subjectId: e.subjectId,
            action: e.action
        }
    }

    function f(e) {
        if (void 0 !== e) return null === e ? null : {
            requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(v),
            grantToDependencies: e.grantToDependencies,
            parentVersionNumber: e.parentVersionNumber,
            enableDeepAccessCheck: e.enableDeepAccessCheck
        }
    }

    function P(e) {
        if (void 0 !== e) return null === e ? null : {
            createAssetsAsRestricted: e.createAssetsAsRestricted
        }
    }

    function I(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, s.u)(t, "assetId") ? t.assetId : void 0,
            code: (0, s.u)(t, "code") ? t.code : void 0
        }
    }

    function w(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, s.u)(t, "assetId") ? t.assetId : void 0,
            requestId: (0, s.u)(t, "requestId") ? t.requestId : void 0,
            status: (0, s.u)(t, "status") ? t.status : void 0
        }
    }

    function A(e) {
        var t, n;
        return null == (t = e) ? t : {
            value: (0, s.u)(t, "value") ? null == (n = t.value) ? n : {
                status: (0, s.u)(n, "status") ? n.status : void 0
            } : void 0,
            error: (0, s.u)(t, "error") ? t.error : void 0
        }
    }

    function q(e) {
        var t, n;
        return null == (t = e) ? t : {
            value: (0, s.u)(t, "value") ? null == (n = t.value) ? n : {
                isOpenUse: (0, s.u)(n, "isOpenUse") ? n.isOpenUse : void 0
            } : void 0,
            error: (0, s.u)(t, "error") ? t.error : void 0
        }
    }

    function y(e) {
        var t;
        return null == (t = e) ? t : {
            parentAssetId: (0, s.u)(t, "parentAssetId") ? t.parentAssetId : void 0,
            grantedDependentAssetIds: (0, s.u)(t, "grantedDependentAssetIds") ? t.grantedDependentAssetIds : void 0
        }
    }

    function R(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, s.u)(t, "assetId") ? t.assetId : void 0,
            code: (0, s.u)(t, "code") ? t.code : void 0
        }
    }

    function g(e) {
        var t;
        return null == (t = e) ? t : {
            action: (0, s.u)(t, "action") ? t.action : void 0,
            assetId: (0, s.u)(t, "assetId") ? t.assetId : void 0,
            error: (0, s.u)(t, "error") ? t.error : void 0
        }
    }

    function b(e, t) {
        return null == e ? e : {
            creatorType: (0, s.u)(e, "creatorType") ? e.creatorType : void 0,
            creatorId: (0, s.u)(e, "creatorId") ? e.creatorId : void 0,
            createAssetsAsRestricted: (0, s.u)(e, "createAssetsAsRestricted") ? e.createAssetsAsRestricted : void 0
        }
    }

    function S(e) {
        var t, n;
        return null == (t = e) ? t : {
            assetId: (0, s.u)(t, "assetId") ? t.assetId : void 0,
            assetName: (0, s.u)(t, "assetName") ? t.assetName : void 0,
            assetType: (0, s.u)(t, "assetType") ? t.assetType : void 0,
            accessStatus: (0, s.u)(t, "accessStatus") ? t.accessStatus : void 0,
            creator: (0, s.u)(t, "creator") ? null == (n = t.creator) ? n : {
                type: (0, s.u)(n, "type") ? n.type : void 0,
                id: (0, s.u)(n, "id") ? n.id : void 0
            } : void 0
        }
    }

    function G(e) {
        var t;
        return null == (t = e) ? t : {
            action: (0, s.u)(t, "action") ? t.action : void 0,
            subjectId: (0, s.u)(t, "subjectId") ? t.subjectId : void 0,
            subjectType: (0, s.u)(t, "subjectType") ? t.subjectType : void 0,
            permissionLevel: (0, s.u)(t, "permissionLevel") ? t.permissionLevel : void 0,
            permissionSource: (0, s.u)(t, "permissionSource") ? t.permissionSource : void 0
        }
    }

    function C(e, t) {
        return null == e ? e : {
            isEligible: (0, s.u)(e, "isEligible") ? e.isEligible : void 0
        }
    }

    function T(e, t) {
        return null == e ? e : {
            requests: (0, s.u)(e, "requests") ? null === e.requests ? null : e.requests.map(p) : void 0,
            nextCursor: (0, s.u)(e, "nextCursor") ? e.nextCursor : void 0
        }
    }

    function U(e) {
        var t;
        return null == (t = e) ? t : {
            action: (0, s.u)(t, "action") ? t.action : void 0,
            assetId: (0, s.u)(t, "assetId") ? t.assetId : void 0
        }
    }
    var k = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.assetPermissionRequestsApproveAssetPermissionRequestRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.requestId || void 0 === e.requestId) throw new s.w("requestId", "Required parameter requestParameters.requestId was null or undefined when calling assetPermissionRequestsApproveAssetPermissionRequest.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/asset-permission-requests/{requestId}:approve".replace("{".concat("requestId", "}"), encodeURIComponent(String(e.requestId))),
                                    schemaPath: "/v1/asset-permission-requests/{requestId}:approve",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionRequestsApproveAssetPermissionRequest = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionRequestsApproveAssetPermissionRequestRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionRequestsBatchRequestAccessRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/assets/permissions:batchRequestAccess",
                                    schemaPath: "/v1/assets/permissions:batchRequestAccess",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(u)
                                        }
                                    }(e.assetPermissionRequestsBatchRequestAccessRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return null == e ? e : {
                                        requests: (0, s.u)(e, "requests") ? null === e.requests ? null : e.requests.map(w) : void 0,
                                        errors: (0, s.u)(e, "errors") ? null === e.errors ? null : e.errors.map(I) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionRequestsBatchRequestAccess = function() {
                return r(this, arguments, void 0, function(e, s) {
                    return void 0 === e && (e = {}), i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionRequestsBatchRequestAccessRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionRequestsListOwnerAssetPermissionRequestsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, void 0 !== e.status && (n.status = e.status), void 0 !== e.assetId && (n.assetId = e.assetId), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/asset-permission-requests:listByOwner",
                                    schemaPath: "/v1/asset-permission-requests:listByOwner",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return T(e)
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionRequestsListOwnerAssetPermissionRequests = function() {
                return r(this, arguments, void 0, function(e, s) {
                    return void 0 === e && (e = {}), i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionRequestsListOwnerAssetPermissionRequestsRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionRequestsListRequesterAssetPermissionRequestsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, void 0 !== e.status && (n.status = e.status), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/asset-permission-requests:listByRequester",
                                    schemaPath: "/v1/asset-permission-requests:listByRequester",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return T(e)
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionRequestsListRequesterAssetPermissionRequests = function() {
                return r(this, arguments, void 0, function(e, s) {
                    return void 0 === e && (e = {}), i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionRequestsListRequesterAssetPermissionRequestsRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionRequestsRejectAssetPermissionRequestRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.requestId || void 0 === e.requestId) throw new s.w("requestId", "Required parameter requestParameters.requestId was null or undefined when calling assetPermissionRequestsRejectAssetPermissionRequest.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/asset-permission-requests/{requestId}:reject".replace("{".concat("requestId", "}"), encodeURIComponent(String(e.requestId))),
                                    schemaPath: "/v1/asset-permission-requests/{requestId}:reject",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionRequestsRejectAssetPermissionRequest = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionRequestsRejectAssetPermissionRequestRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t
        }(s._),
        j = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.assetPermissionsBatchCheckAssetPermissionsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/assets/check-permissions",
                                    schemaPath: "/v1/assets/check-permissions",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(h)
                                        }
                                    }(e.assetPermissionsBatchCheckAssetPermissionsRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return null == e ? e : {
                                        results: (0, s.u)(e, "results") ? null === e.results ? null : e.results.map(A) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsBatchCheckAssetPermissions = function() {
                return r(this, arguments, void 0, function(e, s) {
                    return void 0 === e && (e = {}), i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsBatchCheckAssetPermissionsRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsBatchGetAssetAccessPropertiesRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/assets/access-properties",
                                    schemaPath: "/v1/assets/access-properties",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(m)
                                        }
                                    }(e.assetPermissionsBatchGetAssetAccessPropertiesRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return null == e ? e : {
                                        results: (0, s.u)(e, "results") ? null === e.results ? null : e.results.map(q) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsBatchGetAssetAccessProperties = function() {
                return r(this, arguments, void 0, function(e, s) {
                    return void 0 === e && (e = {}), i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsBatchGetAssetAccessPropertiesRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsBatchGrantPermissionsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/assets/permissions",
                                    schemaPath: "/v1/assets/permissions",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            subjectType: e.subjectType,
                                            subjectId: e.subjectId,
                                            action: e.action,
                                            assetIds: e.assetIds,
                                            enableDeepAccessCheck: e.enableDeepAccessCheck,
                                            requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(d)
                                        }
                                    }(e.assetPermissionsBatchGrantPermissionsRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return null == e ? e : {
                                        successAssetIds: (0, s.u)(e, "successAssetIds") ? e.successAssetIds : void 0,
                                        dependenciesGrantResults: (0, s.u)(e, "dependenciesGrantResults") ? null === e.dependenciesGrantResults ? null : e.dependenciesGrantResults.map(y) : void 0,
                                        errors: (0, s.u)(e, "errors") ? null === e.errors ? null : e.errors.map(R) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsBatchGrantPermissions = function() {
                return r(this, arguments, void 0, function(e, s) {
                    return void 0 === e && (e = {}), i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsBatchGrantPermissionsRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsCheckActionsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/assets/check-actions",
                                    schemaPath: "/v1/assets/check-actions",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            actions: void 0 === e.actions ? void 0 : null === e.actions ? null : e.actions.map(c),
                                            assetIds: e.assetIds
                                        }
                                    }(e.assetPermissionsCheckActionsRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), this.isJsonMime(o.headers.get("content-type")) ? [2, new s.H(o)] : [2, new s.U(o)]
                        }
                    })
                })
            }, t.prototype.assetPermissionsCheckActions = function() {
                return r(this, arguments, void 0, function(e, s) {
                    return void 0 === e && (e = {}), i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsCheckActionsRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsCopyAssetPermissionsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new s.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling assetPermissionsCopyAssetPermissions.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/universes/{universeId}/permissions:copyInto".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/permissions:copyInto",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            sourceUniverseId: e.sourceUniverseId
                                        }
                                    }(e.assetPermissionsCopyAssetPermissionsRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return null == e ? e : {
                                        operationId: (0, s.u)(e, "operationId") ? e.operationId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsCopyAssetPermissions = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsCopyAssetPermissionsRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetActionGatingStatusRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsGetActionGatingStatus.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/eligibility-status".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/eligibility-status",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return a = i.sent(), [2, new s.H(a, function(e) {
                                    return null == e ? e : {
                                        canBeDistributedOnStore: (0, s.u)(e, "CanBeDistributedOnStore") ? o(e.CanBeDistributedOnStore) : void 0,
                                        canBeShared: (0, s.u)(e, "CanBeShared") ? o(e.CanBeShared) : void 0,
                                        canBeSetToOpenUse: (0, s.u)(e, "CanBeSetToOpenUse") ? o(e.CanBeSetToOpenUse) : void 0,
                                        metadataState: (0, s.u)(e, "MetadataState") ? e.MetadataState : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetActionGatingStatus = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsGetActionGatingStatusRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetAssetDependenciesRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsGetAssetDependencies.");
                                return n = {}, void 0 !== e.versionNumber && (n.versionNumber = e.versionNumber), void 0 !== e.dependenciesDegree && (n.dependenciesDegree = e.dependenciesDegree), void 0 !== e.includeAccessStatus && (n.includeAccessStatus = e.includeAccessStatus), void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (n.pageToken = e.pageToken), void 0 !== e.returnCountOnly && (n.returnCountOnly = e.returnCountOnly), r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/dependencies".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/dependencies",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return null == e ? e : {
                                        results: (0, s.u)(e, "results") ? null === e.results ? null : e.results.map(S) : void 0,
                                        hasMore: (0, s.u)(e, "hasMore") ? e.hasMore : void 0,
                                        nextPageToken: (0, s.u)(e, "nextPageToken") ? e.nextPageToken : void 0,
                                        dependenciesCount: (0, s.u)(e, "dependenciesCount") ? e.dependenciesCount : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetAssetDependencies = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsGetAssetDependenciesRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetAssetPermissionsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsGetAssetPermissions.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/permissions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/permissions",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return null == e ? e : {
                                        results: (0, s.u)(e, "results") ? null === e.results ? null : e.results.map(G) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetAssetPermissions = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsGetAssetPermissionsRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetGroupSettingsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new s.w("groupId", "Required parameter requestParameters.groupId was null or undefined when calling assetPermissionsGetGroupSettings.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/settings".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/settings",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return b(e)
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetGroupSettings = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsGetGroupSettingsRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetIsGroupEligibleForBetaRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new s.w("groupId", "Required parameter requestParameters.groupId was null or undefined when calling assetPermissionsGetIsGroupEligibleForBeta.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/is-group-eligible-for-beta/{groupId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/is-group-eligible-for-beta/{groupId}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return C(e)
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetIsGroupEligibleForBeta = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsGetIsGroupEligibleForBetaRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetIsUserEligibleForBetaRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new s.w("userId", "Required parameter requestParameters.userId was null or undefined when calling assetPermissionsGetIsUserEligibleForBeta.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/is-user-eligible-for-beta/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/is-user-eligible-for-beta/{userId}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return C(e)
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetIsUserEligibleForBeta = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsGetIsUserEligibleForBetaRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetOperationStatusRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new s.w("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetPermissionsGetOperationStatus.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    var t, n;
                                    return null == e ? e : {
                                        path: (0, s.u)(e, "path") ? e.path : void 0,
                                        operationId: (0, s.u)(e, "operationId") ? e.operationId : void 0,
                                        done: (0, s.u)(e, "done") ? e.done : void 0,
                                        error: (0, s.u)(e, "error") ? null == (t = e.error) ? t : {
                                            code: (0, s.u)(t, "code") ? t.code : void 0,
                                            message: (0, s.u)(t, "message") ? t.message : void 0,
                                            details: (0, s.u)(t, "details") ? null === t.details ? null : t.details.map(a) : void 0
                                        } : void 0,
                                        response: (0, s.u)(e, "response") ? null == (n = e.response) ? n : {
                                            errors: (0, s.u)(n, "errors") ? null === n.errors ? null : n.errors.map(g) : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetOperationStatus = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsGetOperationStatusRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetUserSettingsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new s.w("userId", "Required parameter requestParameters.userId was null or undefined when calling assetPermissionsGetUserSettings.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/users/{userId}/settings".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/settings",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return b(e)
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGetUserSettings = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsGetUserSettingsRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGrantAssetPermissionsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsGrantAssetPermissions.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/assets/{assetId}/permissions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/permissions",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: f(e.assetPermissionsRevokeAssetPermissionsRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o)]
                        }
                    })
                })
            }, t.prototype.assetPermissionsGrantAssetPermissions = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsGrantAssetPermissionsRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsListUniverseAssetPermissionsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new s.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling assetPermissionsListUniverseAssetPermissions.");
                                return n = {}, void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (n.pageToken = e.pageToken), r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/assets".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/assets",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return null == e ? e : {
                                        results: (0, s.u)(e, "results") ? null === e.results ? null : e.results.map(U) : void 0,
                                        nextPageToken: (0, s.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsListUniverseAssetPermissions = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsListUniverseAssetPermissionsRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsRevokeAssetPermissionsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new s.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsRevokeAssetPermissions.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/assets/{assetId}/permissions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/permissions",
                                    method: "DELETE",
                                    headers: r,
                                    query: n,
                                    body: f(e.assetPermissionsRevokeAssetPermissionsRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o)]
                        }
                    })
                })
            }, t.prototype.assetPermissionsRevokeAssetPermissions = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsRevokeAssetPermissionsRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsUpdateGroupSettingsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new s.w("groupId", "Required parameter requestParameters.groupId was null or undefined when calling assetPermissionsUpdateGroupSettings.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/groups/{groupId}/settings".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/settings",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: P(e.assetPermissionsUpdateUserSettingsRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return b(e)
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsUpdateGroupSettings = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsUpdateGroupSettingsRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.assetPermissionsUpdateUserSettingsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, r, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new s.w("userId", "Required parameter requestParameters.userId was null or undefined when calling assetPermissionsUpdateUserSettings.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/users/{userId}/settings".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/settings",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: P(e.assetPermissionsUpdateUserSettingsRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new s.H(o, function(e) {
                                    return b(e)
                                })]
                        }
                    })
                })
            }, t.prototype.assetPermissionsUpdateUserSettings = function(e, s) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.assetPermissionsUpdateUserSettingsRaw(e, s)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t
        }(s._);
    e.s(["x", 0, {
        Restricted: "Restricted",
        OpenUse: "OpenUse"
    }, "W", 0, {
        UnknownError: "UnknownError",
        HasPermission: "HasPermission",
        NoPermission: "NoPermission",
        AssetNotFound: "AssetNotFound"
    }, "_", 0, {
        Invalid: "Invalid",
        Edit: "Edit",
        Use: "Use",
        Download: "Download",
        CreateAssetVersion: "CreateAssetVersion",
        UpdateAssetText: "UpdateAssetText",
        GrantAssetPermissions: "GrantAssetPermissions",
        CreateAssetFromAsset: "CreateAssetFromAsset",
        CopyFromRcc: "CopyFromRcc",
        UpdateFromRcc: "UpdateFromRcc"
    }, "X", 0, {
        Invalid: "Invalid",
        Edit: "Edit",
        Download: "Download",
        Use: "Use",
        CopyFromRcc: "CopyFromRcc",
        UpdateFromRcc: "UpdateFromRcc"
    }, "J", 0, k, "u", 0, j, "s", 0, {
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
        Screenshot: "Screenshot"
    }, "V", 0, {
        Invalid: "Invalid",
        User: "User",
        Group: "Group"
    }, "p", 0, {
        UnknownError: "UnknownError",
        InvalidRequest: "InvalidRequest",
        AssetNotFound: "AssetNotFound",
        CannotManageAsset: "CannotManageAsset",
        PublicAssetCannotBeGrantedTo: "PublicAssetCannotBeGrantedTo",
        CannotManageSubject: "CannotManageSubject",
        SubjectNotFound: "SubjectNotFound",
        AssetTypeNotEnabled: "AssetTypeNotEnabled",
        PermissionLimitReached: "PermissionLimitReached",
        NotRequestable: "NotRequestable",
        RequesterNotConnected: "RequesterNotConnected",
        AlreadyPending: "AlreadyPending",
        AlreadyHasAccess: "AlreadyHasAccess",
        RequestNotFound: "RequestNotFound",
        InvalidRequestStatus: "InvalidRequestStatus",
        RateLimited: "RateLimited",
        CallerNotOwner: "CallerNotOwner",
        BatchSizeLimitExceeded: "BatchSizeLimitExceeded"
    }, "$", 0, {
        Invalid: "Invalid",
        User: "User",
        Group: "Group",
        GroupRoleset: "GroupRoleset",
        All: "All",
        Universe: "Universe"
    }], 631401);
    let B = (0, e.i(272593).f)("asset-permissions-api", "bedev2"),
        E = new j(B),
        O = new k(B);
    e.s(["f", 0, {
        async batchCheckAssetPermissions(e) {
            let s = {
                requests: e.map(e => ({
                    action: e.permissionType,
                    assetId: e.assetId,
                    subject: {
                        subjectId: e.subjectId,
                        subjectType: e.subject
                    }
                }))
            };
            return (await E.assetPermissionsBatchCheckAssetPermissions({
                assetPermissionsBatchCheckAssetPermissionsRequest: s
            })).results
        },
        async getAssetDependencies(e) {
            let s = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                t = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
            return await E.assetPermissionsGetAssetDependencies({
                assetId: e,
                includeAccessStatus: s,
                returnCountOnly: t
            })
        },
        getAssetEligibilityStatus: async e => await E.assetPermissionsGetActionGatingStatus({
            assetId: e
        }),
        getAssetPermissions: async e => (await E.assetPermissionsGetAssetPermissions({
            assetId: e
        })).results,
        grantAssetPermissions(e, s, t, n, r) {
            let i = {
                assetId: e
            };
            return s && (i.assetPermissionsRevokeAssetPermissionsRequest = {
                requests: s,
                grantToDependencies: t,
                parentVersionNumber: n,
                enableDeepAccessCheck: r
            }), E.assetPermissionsGrantAssetPermissions(i)
        },
        listUniverseAssetPermissions: (e, s, t) => E.assetPermissionsListUniverseAssetPermissions({
            universeId: e,
            maxPageSize: s,
            pageToken: t
        }),
        batchGrantAssetPermissions: (e, s, t, n, r) => E.assetPermissionsBatchGrantPermissions({
            assetPermissionsBatchGrantPermissionsRequest: {
                requests: e,
                enableDeepAccessCheck: s,
                subjectId: n,
                subjectType: t,
                action: r
            }
        }),
        revokeAssetPermissions(e, s) {
            let t = {
                assetId: e
            };
            return s && (t.assetPermissionsRevokeAssetPermissionsRequest = {
                requests: s
            }), E.assetPermissionsRevokeAssetPermissions(t)
        },
        getUserPermissionSettings: async e => await E.assetPermissionsGetUserSettings({
            userId: e
        }),
        getGroupPermissionSettings: async e => await E.assetPermissionsGetGroupSettings({
            groupId: e
        }),
        updateUserPermissionSettings: async (e, s) => E.assetPermissionsUpdateUserSettings({
            userId: e,
            assetPermissionsUpdateUserSettingsRequest: s
        }),
        updateGroupPermissionSettings: async (e, s) => E.assetPermissionsUpdateGroupSettings({
            groupId: e,
            assetPermissionsUpdateUserSettingsRequest: s
        }),
        batchGetAssetAccessProperties: async e => await E.assetPermissionsBatchGetAssetAccessProperties({
            assetPermissionsBatchGetAssetAccessPropertiesRequest: {
                requests: e
            }
        }),
        listOwnerAssetPermissionRequests() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
            return O.assetPermissionRequestsListOwnerAssetPermissionRequests(e)
        },
        listRequesterAssetPermissionRequests() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
            return O.assetPermissionRequestsListRequesterAssetPermissionRequests(e)
        },
        approveAssetPermissionRequest: e => O.assetPermissionRequestsApproveAssetPermissionRequest({
            requestId: e
        }),
        rejectAssetPermissionRequest: e => O.assetPermissionRequestsRejectAssetPermissionRequest({
            requestId: e
        })
    }], 255382)
}]);

//# debugId=0cfe2128-dfd0-3085-b3b2-888f9b92d27d
//# sourceMappingURL=0-zorl1dwjezy.js.map