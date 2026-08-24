;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "7552c65e-dcbb-9bfa-360e-d9138cadf6fe")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 176936, e => {
    "use strict";
    var t = e.i(677753),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
            })(e, t)
        };

    function a(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function a() {
            this.constructor = e
        }
        r(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
    }

    function n(e, t, r, a) {
        return new(r || (r = Promise))(function(n, o) {
            function i(e) {
                try {
                    c(a.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                try {
                    c(a.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function c(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(i, s)
            }
            c((a = a.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var r, a, n, o = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function s(s) {
            return function(c) {
                var l = [s, c];
                if (r) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, l[0] && (o = 0)), o;) try {
                    if (r = 1, a && (n = 2 & l[0] ? a.return : l[0] ? a.throw || ((n = a.return) && n.call(a), 0) : a.next) && !(n = n.call(a, l[1])).done) return n;
                    switch (a = 0, n && (l = [2 & l[0], n.value]), l[0]) {
                        case 0:
                        case 1:
                            n = l;
                            break;
                        case 4:
                            return o.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            o.label++, a = l[1], l = [0];
                            continue;
                        case 7:
                            l = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = o.trys).length > 0 && n[n.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
                                o.label = l[1];
                                break
                            }
                            if (6 === l[0] && o.label < n[1]) {
                                o.label = n[1], n = l;
                                break
                            }
                            if (n && o.label < n[2]) {
                                o.label = n[2], o.ops.push(l);
                                break
                            }
                            n[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    l = t.call(e, o)
                } catch (e) {
                    l = [6, e], a = 0
                } finally {
                    r = n = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function i(e, r) {
        return null == e ? e : {
            description: (0, t.exists)(e, "description") ? e.description : void 0
        }
    }

    function s(e) {
        var r;
        return null == (r = e) ? r : {
            requestedUsername: (0, t.exists)(r, "requestedUsername") ? r.requestedUsername : void 0,
            hasVerifiedBadge: (0, t.exists)(r, "hasVerifiedBadge") ? r.hasVerifiedBadge : void 0,
            id: (0, t.exists)(r, "id") ? r.id : void 0,
            name: (0, t.exists)(r, "name") ? r.name : void 0,
            displayName: (0, t.exists)(r, "displayName") ? r.displayName : void 0
        }
    }

    function c(e) {
        var r;
        return null == (r = e) ? r : {
            hasVerifiedBadge: (0, t.exists)(r, "hasVerifiedBadge") ? r.hasVerifiedBadge : void 0,
            id: (0, t.exists)(r, "id") ? r.id : void 0,
            name: (0, t.exists)(r, "name") ? r.name : void 0,
            displayName: (0, t.exists)(r, "displayName") ? r.displayName : void 0
        }
    }

    function l(e) {
        var r;
        return null == (r = e) ? r : {
            previousUsernames: (0, t.exists)(r, "previousUsernames") ? r.previousUsernames : void 0,
            hasVerifiedBadge: (0, t.exists)(r, "hasVerifiedBadge") ? r.hasVerifiedBadge : void 0,
            id: (0, t.exists)(r, "id") ? r.id : void 0,
            name: (0, t.exists)(r, "name") ? r.name : void 0,
            displayName: (0, t.exists)(r, "displayName") ? r.displayName : void 0
        }
    }

    function u(e) {
        var r;
        return null == (r = e) ? r : {
            name: (0, t.exists)(r, "name") ? r.name : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var d = t.BaseAPI;

    function p() {
        return null !== d && d.apply(this, arguments) || this
    }
    a(p, d), p.prototype.v1BirthdateGetRaw = function(e) {
        return n(this, void 0, void 0, function() {
            var r, a, n;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        return r = {}, a = {}, [4, this.request({
                            path: "/v1/birthdate",
                            schemaPath: "/v1/birthdate",
                            method: "GET",
                            headers: a,
                            query: r
                        }, e)];
                    case 1:
                        return n = o.sent(), [2, new t.JSONApiResponse(n, function(e) {
                            return null == e ? e : {
                                birthMonth: (0, t.exists)(e, "birthMonth") ? e.birthMonth : void 0,
                                birthDay: (0, t.exists)(e, "birthDay") ? e.birthDay : void 0,
                                birthYear: (0, t.exists)(e, "birthYear") ? e.birthYear : void 0
                            }
                        })]
                }
            })
        })
    }, p.prototype.v1BirthdateGet = function(e) {
        return n(this, void 0, void 0, function() {
            return o(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.v1BirthdateGetRaw(e)];
                    case 1:
                        return [4, t.sent().value()];
                    case 2:
                        return [2, t.sent()]
                }
            })
        })
    }, p.prototype.v1BirthdatePostRaw = function(e, r) {
        return n(this, void 0, void 0, function() {
            var a, n, i;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        if (null === e.request || void 0 === e.request) throw new t.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1BirthdatePost.");
                        return a = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                            path: "/v1/birthdate",
                            schemaPath: "/v1/birthdate",
                            method: "POST",
                            headers: n,
                            query: a,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    birthMonth: e.birthMonth,
                                    birthDay: e.birthDay,
                                    birthYear: e.birthYear,
                                    password: e.password
                                }
                            }(e.request)
                        }, r)];
                    case 1:
                        return i = o.sent(), [2, new t.JSONApiResponse(i)]
                }
            })
        })
    }, p.prototype.v1BirthdatePost = function(e, t) {
        return n(this, void 0, void 0, function() {
            return o(this, function(r) {
                switch (r.label) {
                    case 0:
                        return [4, this.v1BirthdatePostRaw(e, t)];
                    case 1:
                        return [4, r.sent().value()];
                    case 2:
                        return [2, r.sent()]
                }
            })
        })
    }, p.prototype.v1DescriptionGetRaw = function(e) {
        return n(this, void 0, void 0, function() {
            var r, a, n;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        return r = {}, a = {}, [4, this.request({
                            path: "/v1/description",
                            schemaPath: "/v1/description",
                            method: "GET",
                            headers: a,
                            query: r
                        }, e)];
                    case 1:
                        return n = o.sent(), [2, new t.JSONApiResponse(n, function(e) {
                            return i(e)
                        })]
                }
            })
        })
    }, p.prototype.v1DescriptionGet = function(e) {
        return n(this, void 0, void 0, function() {
            return o(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.v1DescriptionGetRaw(e)];
                    case 1:
                        return [4, t.sent().value()];
                    case 2:
                        return [2, t.sent()]
                }
            })
        })
    }, p.prototype.v1DescriptionPostRaw = function(e, r) {
        return n(this, void 0, void 0, function() {
            var a, n, s;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        if (null === e.request || void 0 === e.request) throw new t.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1DescriptionPost.");
                        return a = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                            path: "/v1/description",
                            schemaPath: "/v1/description",
                            method: "POST",
                            headers: n,
                            query: a,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    description: e.description
                                }
                            }(e.request)
                        }, r)];
                    case 1:
                        return s = o.sent(), [2, new t.JSONApiResponse(s, function(e) {
                            return i(e)
                        })]
                }
            })
        })
    }, p.prototype.v1DescriptionPost = function(e, t) {
        return n(this, void 0, void 0, function() {
            return o(this, function(r) {
                switch (r.label) {
                    case 0:
                        return [4, this.v1DescriptionPostRaw(e, t)];
                    case 1:
                        return [4, r.sent().value()];
                    case 2:
                        return [2, r.sent()]
                }
            })
        })
    }, p.prototype.v1GenderGetRaw = function(e) {
        return n(this, void 0, void 0, function() {
            var r, a, n;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        return r = {}, a = {}, [4, this.request({
                            path: "/v1/gender",
                            schemaPath: "/v1/gender",
                            method: "GET",
                            headers: a,
                            query: r
                        }, e)];
                    case 1:
                        return n = o.sent(), [2, new t.JSONApiResponse(n, function(e) {
                            return null == e ? e : {
                                gender: (0, t.exists)(e, "gender") ? e.gender : void 0
                            }
                        })]
                }
            })
        })
    }, p.prototype.v1GenderGet = function(e) {
        return n(this, void 0, void 0, function() {
            return o(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.v1GenderGetRaw(e)];
                    case 1:
                        return [4, t.sent().value()];
                    case 2:
                        return [2, t.sent()]
                }
            })
        })
    }, p.prototype.v1GenderPostRaw = function(e, r) {
        return n(this, void 0, void 0, function() {
            var a, n, i;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        if (null === e.request || void 0 === e.request) throw new t.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GenderPost.");
                        return a = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                            path: "/v1/gender",
                            schemaPath: "/v1/gender",
                            method: "POST",
                            headers: n,
                            query: a,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    gender: e.gender
                                }
                            }(e.request)
                        }, r)];
                    case 1:
                        return i = o.sent(), [2, new t.JSONApiResponse(i)]
                }
            })
        })
    }, p.prototype.v1GenderPost = function(e, t) {
        return n(this, void 0, void 0, function() {
            return o(this, function(r) {
                switch (r.label) {
                    case 0:
                        return [4, this.v1GenderPostRaw(e, t)];
                    case 1:
                        return [4, r.sent().value()];
                    case 2:
                        return [2, r.sent()]
                }
            })
        })
    };
    var h = function(e) {
            function r() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(r, e), r.prototype.v1DisplayNamesValidateGetRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var a, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.displayName || void 0 === e.displayName) throw new t.RequiredError("displayName", "Required parameter requestParameters.displayName was null or undefined when calling v1DisplayNamesValidateGet.");
                                if (null === e.birthdate || void 0 === e.birthdate) throw new t.RequiredError("birthdate", "Required parameter requestParameters.birthdate was null or undefined when calling v1DisplayNamesValidateGet.");
                                return a = {}, void 0 !== e.displayName && (a.displayName = e.displayName), void 0 !== e.birthdate && (a.birthdate = e.birthdate.toISOString()), n = {}, [4, this.request({
                                    path: "/v1/display-names/validate",
                                    schemaPath: "/v1/display-names/validate",
                                    method: "GET",
                                    headers: n,
                                    query: a
                                }, r)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i)]
                        }
                    })
                })
            }, r.prototype.v1DisplayNamesValidateGet = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1DisplayNamesValidateGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.v1UsersUserIdDisplayNamesPatchRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var a, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdDisplayNamesPatch.");
                                if (null === e.request || void 0 === e.request) throw new t.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsersUserIdDisplayNamesPatch.");
                                return a = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/users/{userId}/display-names".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/display-names",
                                    method: "PATCH",
                                    headers: n,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            newDisplayName: e.newDisplayName
                                        }
                                    }(e.request)
                                }, r)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i)]
                        }
                    })
                })
            }, r.prototype.v1UsersUserIdDisplayNamesPatch = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersUserIdDisplayNamesPatchRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.v1UsersUserIdDisplayNamesValidateGetRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var a, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdDisplayNamesValidateGet.");
                                if (null === e.displayName || void 0 === e.displayName) throw new t.RequiredError("displayName", "Required parameter requestParameters.displayName was null or undefined when calling v1UsersUserIdDisplayNamesValidateGet.");
                                return a = {}, void 0 !== e.displayName && (a.displayName = e.displayName), n = {}, [4, this.request({
                                    path: "/v1/users/{userId}/display-names/validate".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/display-names/validate",
                                    method: "GET",
                                    headers: n,
                                    query: a
                                }, r)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i)]
                        }
                    })
                })
            }, r.prototype.v1UsersUserIdDisplayNamesValidateGet = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersUserIdDisplayNamesValidateGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(t.BaseAPI),
        v = function(e) {
            function r() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(r, e), r.prototype.v1UsersSearchGetRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var a, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.keyword || void 0 === e.keyword) throw new t.RequiredError("keyword", "Required parameter requestParameters.keyword was null or undefined when calling v1UsersSearchGet.");
                                return a = {}, void 0 !== e.keyword && (a.keyword = e.keyword), void 0 !== e.sessionId && (a.sessionId = e.sessionId), void 0 !== e.limit && (a.limit = e.limit), void 0 !== e.cursor && (a.cursor = e.cursor), n = {}, [4, this.request({
                                    path: "/v1/users/search",
                                    schemaPath: "/v1/users/search",
                                    method: "GET",
                                    headers: n,
                                    query: a
                                }, r)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, t.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, t.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, t.exists)(e, "data") ? e.data.map(l) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersSearchGet = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersSearchGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(t.BaseAPI),
        f = (function(e) {
            function r() {
                return null !== e && e.apply(this, arguments) || this
            }
            a(r, e), r.prototype.v1UsersUserIdUsernameHistoryGetRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var a, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdUsernameHistoryGet.");
                                return a = {}, void 0 !== e.limit && (a.limit = e.limit), void 0 !== e.cursor && (a.cursor = e.cursor), void 0 !== e.sortOrder && (a.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                    path: "/v1/users/{userId}/username-history".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/username-history",
                                    method: "GET",
                                    headers: n,
                                    query: a
                                }, r)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, t.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, t.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, t.exists)(e, "data") ? e.data.map(u) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersUserIdUsernameHistoryGet = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersUserIdUsernameHistoryGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }
        }(t.BaseAPI), function(e) {
            function r() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(r, e), r.prototype.v1UsernamesUsersPostRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var a, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new t.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamesUsersPost.");
                                return a = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/usernames/users",
                                    schemaPath: "/v1/usernames/users",
                                    method: "POST",
                                    headers: n,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            usernames: e.usernames,
                                            excludeBannedUsers: e.excludeBannedUsers
                                        }
                                    }(e.request)
                                }, r)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? e.data.map(s) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsernamesUsersPost = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsernamesUsersPostRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.v1UsersAuthenticatedAgeBracketGetRaw = function(e) {
                return n(this, void 0, void 0, function() {
                    var r, a, n;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return r = {}, a = {}, [4, this.request({
                                    path: "/v1/users/authenticated/age-bracket",
                                    schemaPath: "/v1/users/authenticated/age-bracket",
                                    method: "GET",
                                    headers: a,
                                    query: r
                                }, e)];
                            case 1:
                                return n = o.sent(), [2, new t.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        ageBracket: (0, t.exists)(e, "ageBracket") ? e.ageBracket : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersAuthenticatedAgeBracketGet = function(e) {
                return n(this, void 0, void 0, function() {
                    return o(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UsersAuthenticatedAgeBracketGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, r.prototype.v1UsersAuthenticatedCountryCodeGetRaw = function(e) {
                return n(this, void 0, void 0, function() {
                    var r, a, n;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return r = {}, a = {}, [4, this.request({
                                    path: "/v1/users/authenticated/country-code",
                                    schemaPath: "/v1/users/authenticated/country-code",
                                    method: "GET",
                                    headers: a,
                                    query: r
                                }, e)];
                            case 1:
                                return n = o.sent(), [2, new t.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        countryCode: (0, t.exists)(e, "countryCode") ? e.countryCode : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersAuthenticatedCountryCodeGet = function(e) {
                return n(this, void 0, void 0, function() {
                    return o(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UsersAuthenticatedCountryCodeGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, r.prototype.v1UsersAuthenticatedGetRaw = function(e) {
                return n(this, void 0, void 0, function() {
                    var r, a, n;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return r = {}, a = {}, [4, this.request({
                                    path: "/v1/users/authenticated",
                                    schemaPath: "/v1/users/authenticated",
                                    method: "GET",
                                    headers: a,
                                    query: r
                                }, e)];
                            case 1:
                                return n = o.sent(), [2, new t.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        id: (0, t.exists)(e, "id") ? e.id : void 0,
                                        name: (0, t.exists)(e, "name") ? e.name : void 0,
                                        displayName: (0, t.exists)(e, "displayName") ? e.displayName : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersAuthenticatedGet = function(e) {
                return n(this, void 0, void 0, function() {
                    return o(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UsersAuthenticatedGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, r.prototype.v1UsersAuthenticatedRolesGetRaw = function(e) {
                return n(this, void 0, void 0, function() {
                    var r, a, n;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return r = {}, a = {}, [4, this.request({
                                    path: "/v1/users/authenticated/roles",
                                    schemaPath: "/v1/users/authenticated/roles",
                                    method: "GET",
                                    headers: a,
                                    query: r
                                }, e)];
                            case 1:
                                return n = o.sent(), [2, new t.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        roles: (0, t.exists)(e, "roles") ? e.roles : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersAuthenticatedRolesGet = function(e) {
                return n(this, void 0, void 0, function() {
                    return o(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UsersAuthenticatedRolesGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, r.prototype.v1UsersPostRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var a, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new t.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsersPost.");
                                return a = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/users",
                                    schemaPath: "/v1/users",
                                    method: "POST",
                                    headers: n,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            userIds: e.userIds,
                                            excludeBannedUsers: e.excludeBannedUsers
                                        }
                                    }(e.request)
                                }, r)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? e.data.map(c) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersPost = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersPostRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.v1UsersUserIdGetRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var a, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdGet.");
                                return a = {}, n = {}, [4, this.request({
                                    path: "/v1/users/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}",
                                    method: "GET",
                                    headers: n,
                                    query: a
                                }, r)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        description: (0, t.exists)(e, "description") ? e.description : void 0,
                                        created: (0, t.exists)(e, "created") ? new Date(e.created) : void 0,
                                        isBanned: (0, t.exists)(e, "isBanned") ? e.isBanned : void 0,
                                        externalAppDisplayName: (0, t.exists)(e, "externalAppDisplayName") ? e.externalAppDisplayName : void 0,
                                        hasVerifiedBadge: (0, t.exists)(e, "hasVerifiedBadge") ? e.hasVerifiedBadge : void 0,
                                        id: (0, t.exists)(e, "id") ? e.id : void 0,
                                        name: (0, t.exists)(e, "name") ? e.name : void 0,
                                        displayName: (0, t.exists)(e, "displayName") ? e.displayName : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersUserIdGet = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersUserIdGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(t.BaseAPI));
    e.s(["DisplayNamesApi", 0, h, "UserSearchApi", 0, v, "UsersApi", 0, f, "V1UsersSearchGetLimitEnum", 0, {
        NUMBER_10: 10,
        NUMBER_25: 25,
        NUMBER_50: 50,
        NUMBER_100: 100
    }])
}, 268887, e => {
    "use strict";
    var t = e.i(273589),
        r = e.i(962560),
        a = e.i(416340),
        n = e.i(42569),
        o = e.i(751498),
        i = e.i(221628),
        s = e.i(696180),
        c = e.i(963320),
        l = e.i(208958),
        u = e.i(232625);
    e.i(196344);
    var d = (0, o.c)((0, i.jsx)("path", {
        d: "M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm5 13.59L15.59 17 12 13.41 8.41 17 7 15.59 10.59 12 7 8.41 8.41 7 12 10.59 15.59 7 17 8.41 13.41 12 17 15.59z"
    }), "Cancel");

    function p(e) {
        return (0, t.g)("MuiChip", e)
    }
    var h = (0, s.g)("MuiChip", ["root", "sizeSmall", "sizeMedium", "colorError", "colorInfo", "colorPrimary", "colorSecondary", "colorSuccess", "colorWarning", "disabled", "clickable", "clickableColorPrimary", "clickableColorSecondary", "deletable", "deletableColorPrimary", "deletableColorSecondary", "outlined", "filled", "outlinedPrimary", "outlinedSecondary", "filledPrimary", "filledSecondary", "avatar", "avatarSmall", "avatarMedium", "avatarColorPrimary", "avatarColorSecondary", "icon", "iconSmall", "iconMedium", "iconColorPrimary", "iconColorSecondary", "label", "labelSmall", "labelMedium", "deleteIcon", "deleteIconSmall", "deleteIconMedium", "deleteIconColorPrimary", "deleteIconColorSecondary", "deleteIconOutlinedColorPrimary", "deleteIconOutlinedColorSecondary", "deleteIconFilledColorPrimary", "deleteIconFilledColorSecondary", "focusVisible"]);
    let v = ["avatar", "className", "clickable", "color", "component", "deleteIcon", "disabled", "icon", "label", "onClick", "onDelete", "onKeyDown", "onKeyUp", "size", "variant", "tabIndex", "skipFocusWhenDisabled"],
        f = (0, n.s)("div", {
            name: "MuiChip",
            slot: "Root",
            overridesResolver: (e, r) => {
                let {
                    ownerState: a
                } = e, {
                    color: n,
                    iconColor: o,
                    clickable: i,
                    onDelete: s,
                    size: c,
                    variant: l
                } = a;
                return [{
                    ["& .".concat(h.avatar)]: r.avatar
                }, {
                    ["& .".concat(h.avatar)]: r["avatar".concat((0, t.a)(c))]
                }, {
                    ["& .".concat(h.avatar)]: r["avatarColor".concat((0, t.a)(n))]
                }, {
                    ["& .".concat(h.icon)]: r.icon
                }, {
                    ["& .".concat(h.icon)]: r["icon".concat((0, t.a)(c))]
                }, {
                    ["& .".concat(h.icon)]: r["iconColor".concat((0, t.a)(o))]
                }, {
                    ["& .".concat(h.deleteIcon)]: r.deleteIcon
                }, {
                    ["& .".concat(h.deleteIcon)]: r["deleteIcon".concat((0, t.a)(c))]
                }, {
                    ["& .".concat(h.deleteIcon)]: r["deleteIconColor".concat((0, t.a)(n))]
                }, {
                    ["& .".concat(h.deleteIcon)]: r["deleteIcon".concat((0, t.a)(l), "Color").concat((0, t.a)(n))]
                }, r.root, r["size".concat((0, t.a)(c))], r["color".concat((0, t.a)(n))], i && r.clickable, i && "default" !== n && r["clickableColor".concat((0, t.a)(n), ")")], s && r.deletable, s && "default" !== n && r["deletableColor".concat((0, t.a)(n))], r[l], r["".concat(l).concat((0, t.a)(n))]]
            }
        })(e => {
            let {
                theme: a,
                ownerState: n
            } = e, o = "light" === a.palette.mode ? a.palette.grey[700] : a.palette.grey[300];
            return (0, r._)({
                maxWidth: "100%",
                fontFamily: a.typography.fontFamily,
                fontSize: a.typography.pxToRem(13),
                display: "inline-flex",
                alignItems: "center",
                justifyContent: "center",
                height: 32,
                color: (a.vars || a).palette.text.primary,
                backgroundColor: (a.vars || a).palette.action.selected,
                borderRadius: 16,
                whiteSpace: "nowrap",
                transition: a.transitions.create(["background-color", "box-shadow"]),
                cursor: "unset",
                outline: 0,
                textDecoration: "none",
                border: 0,
                padding: 0,
                verticalAlign: "middle",
                boxSizing: "border-box",
                ["&.".concat(h.disabled)]: {
                    opacity: (a.vars || a).palette.action.disabledOpacity,
                    pointerEvents: "none"
                },
                ["& .".concat(h.avatar)]: {
                    marginLeft: 5,
                    marginRight: -6,
                    width: 24,
                    height: 24,
                    color: a.vars ? a.vars.palette.Chip.defaultAvatarColor : o,
                    fontSize: a.typography.pxToRem(12)
                },
                ["& .".concat(h.avatarColorPrimary)]: {
                    color: (a.vars || a).palette.primary.contrastText,
                    backgroundColor: (a.vars || a).palette.primary.dark
                },
                ["& .".concat(h.avatarColorSecondary)]: {
                    color: (a.vars || a).palette.secondary.contrastText,
                    backgroundColor: (a.vars || a).palette.secondary.dark
                },
                ["& .".concat(h.avatarSmall)]: {
                    marginLeft: 4,
                    marginRight: -4,
                    width: 18,
                    height: 18,
                    fontSize: a.typography.pxToRem(10)
                },
                ["& .".concat(h.icon)]: (0, r._)({
                    marginLeft: 5,
                    marginRight: -6
                }, "small" === n.size && {
                    fontSize: 18,
                    marginLeft: 4,
                    marginRight: -4
                }, n.iconColor === n.color && (0, r._)({
                    color: a.vars ? a.vars.palette.Chip.defaultIconColor : o
                }, "default" !== n.color && {
                    color: "inherit"
                })),
                ["& .".concat(h.deleteIcon)]: (0, r._)({
                    WebkitTapHighlightColor: "transparent",
                    color: a.vars ? "rgba(".concat(a.vars.palette.text.primaryChannel, " / 0.26)") : (0, t.b)(a.palette.text.primary, .26),
                    fontSize: 22,
                    cursor: "pointer",
                    margin: "0 5px 0 -6px",
                    "&:hover": {
                        color: a.vars ? "rgba(".concat(a.vars.palette.text.primaryChannel, " / 0.4)") : (0, t.b)(a.palette.text.primary, .4)
                    }
                }, "small" === n.size && {
                    fontSize: 16,
                    marginRight: 4,
                    marginLeft: -4
                }, "default" !== n.color && {
                    color: a.vars ? "rgba(".concat(a.vars.palette[n.color].contrastTextChannel, " / 0.7)") : (0, t.b)(a.palette[n.color].contrastText, .7),
                    "&:hover, &:active": {
                        color: (a.vars || a).palette[n.color].contrastText
                    }
                })
            }, "small" === n.size && {
                height: 24
            }, "default" !== n.color && {
                backgroundColor: (a.vars || a).palette[n.color].main,
                color: (a.vars || a).palette[n.color].contrastText
            }, n.onDelete && {
                ["&.".concat(h.focusVisible)]: {
                    backgroundColor: a.vars ? "rgba(".concat(a.vars.palette.action.selectedChannel, " / calc(").concat(a.vars.palette.action.selectedOpacity, " + ").concat(a.vars.palette.action.focusOpacity, "))") : (0, t.b)(a.palette.action.selected, a.palette.action.selectedOpacity + a.palette.action.focusOpacity)
                }
            }, n.onDelete && "default" !== n.color && {
                ["&.".concat(h.focusVisible)]: {
                    backgroundColor: (a.vars || a).palette[n.color].dark
                }
            })
        }, e => {
            let {
                theme: a,
                ownerState: n
            } = e;
            return (0, r._)({}, n.clickable && {
                userSelect: "none",
                WebkitTapHighlightColor: "transparent",
                cursor: "pointer",
                "&:hover": {
                    backgroundColor: a.vars ? "rgba(".concat(a.vars.palette.action.selectedChannel, " / calc(").concat(a.vars.palette.action.selectedOpacity, " + ").concat(a.vars.palette.action.hoverOpacity, "))") : (0, t.b)(a.palette.action.selected, a.palette.action.selectedOpacity + a.palette.action.hoverOpacity)
                },
                ["&.".concat(h.focusVisible)]: {
                    backgroundColor: a.vars ? "rgba(".concat(a.vars.palette.action.selectedChannel, " / calc(").concat(a.vars.palette.action.selectedOpacity, " + ").concat(a.vars.palette.action.focusOpacity, "))") : (0, t.b)(a.palette.action.selected, a.palette.action.selectedOpacity + a.palette.action.focusOpacity)
                },
                "&:active": {
                    boxShadow: (a.vars || a).shadows[1]
                }
            }, n.clickable && "default" !== n.color && {
                ["&:hover, &.".concat(h.focusVisible)]: {
                    backgroundColor: (a.vars || a).palette[n.color].dark
                }
            })
        }, e => {
            let {
                theme: a,
                ownerState: n
            } = e;
            return (0, r._)({}, "outlined" === n.variant && {
                backgroundColor: "transparent",
                border: a.vars ? "1px solid ".concat(a.vars.palette.Chip.defaultBorder) : "1px solid ".concat("light" === a.palette.mode ? a.palette.grey[400] : a.palette.grey[700]),
                ["&.".concat(h.clickable, ":hover")]: {
                    backgroundColor: (a.vars || a).palette.action.hover
                },
                ["&.".concat(h.focusVisible)]: {
                    backgroundColor: (a.vars || a).palette.action.focus
                },
                ["& .".concat(h.avatar)]: {
                    marginLeft: 4
                },
                ["& .".concat(h.avatarSmall)]: {
                    marginLeft: 2
                },
                ["& .".concat(h.icon)]: {
                    marginLeft: 4
                },
                ["& .".concat(h.iconSmall)]: {
                    marginLeft: 2
                },
                ["& .".concat(h.deleteIcon)]: {
                    marginRight: 5
                },
                ["& .".concat(h.deleteIconSmall)]: {
                    marginRight: 3
                }
            }, "outlined" === n.variant && "default" !== n.color && {
                color: (a.vars || a).palette[n.color].main,
                border: "1px solid ".concat(a.vars ? "rgba(".concat(a.vars.palette[n.color].mainChannel, " / 0.7)") : (0, t.b)(a.palette[n.color].main, .7)),
                ["&.".concat(h.clickable, ":hover")]: {
                    backgroundColor: a.vars ? "rgba(".concat(a.vars.palette[n.color].mainChannel, " / ").concat(a.vars.palette.action.hoverOpacity, ")") : (0, t.b)(a.palette[n.color].main, a.palette.action.hoverOpacity)
                },
                ["&.".concat(h.focusVisible)]: {
                    backgroundColor: a.vars ? "rgba(".concat(a.vars.palette[n.color].mainChannel, " / ").concat(a.vars.palette.action.focusOpacity, ")") : (0, t.b)(a.palette[n.color].main, a.palette.action.focusOpacity)
                },
                ["& .".concat(h.deleteIcon)]: {
                    color: a.vars ? "rgba(".concat(a.vars.palette[n.color].mainChannel, " / 0.7)") : (0, t.b)(a.palette[n.color].main, .7),
                    "&:hover, &:active": {
                        color: (a.vars || a).palette[n.color].main
                    }
                }
            })
        }),
        m = (0, n.s)("span", {
            name: "MuiChip",
            slot: "Label",
            overridesResolver: (e, r) => {
                let {
                    ownerState: a
                } = e, {
                    size: n
                } = a;
                return [r.label, r["label".concat((0, t.a)(n))]]
            }
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, r._)({
                overflow: "hidden",
                textOverflow: "ellipsis",
                paddingLeft: 12,
                paddingRight: 12,
                whiteSpace: "nowrap"
            }, "outlined" === t.variant && {
                paddingLeft: 11,
                paddingRight: 11
            }, "small" === t.size && {
                paddingLeft: 8,
                paddingRight: 8
            }, "small" === t.size && "outlined" === t.variant && {
                paddingLeft: 7,
                paddingRight: 7
            })
        });

    function y(e) {
        return "Backspace" === e.key || "Delete" === e.key
    }
    let b = a.forwardRef(function(e, o) {
        let s = (0, c.u)({
                props: e,
                name: "MuiChip"
            }),
            {
                avatar: h,
                className: b,
                clickable: w,
                color: g = "default",
                component: C,
                deleteIcon: R,
                disabled: q = !1,
                icon: I,
                label: P,
                onClick: x,
                onDelete: U,
                onKeyDown: N,
                onKeyUp: S,
                size: k = "medium",
                variant: G = "filled",
                tabIndex: O,
                skipFocusWhenDisabled: B = !1
            } = s,
            A = (0, t._)(s, v),
            D = a.useRef(null),
            E = (0, l.u)(D, o),
            V = e => {
                e.stopPropagation(), U && U(e)
            },
            T = !(!1 === w || !x) || w,
            z = T || U ? u.B : C || "div",
            _ = (0, r._)({}, s, {
                component: z,
                disabled: q,
                size: k,
                color: g,
                iconColor: a.isValidElement(I) && I.props.color || g,
                onDelete: !!U,
                clickable: T,
                variant: G
            }),
            M = (e => {
                let {
                    classes: r,
                    disabled: a,
                    size: o,
                    color: i,
                    iconColor: s,
                    onDelete: c,
                    clickable: l,
                    variant: u
                } = e, d = {
                    root: ["root", u, a && "disabled", "size".concat((0, t.a)(o)), "color".concat((0, t.a)(i)), l && "clickable", l && "clickableColor".concat((0, t.a)(i)), c && "deletable", c && "deletableColor".concat((0, t.a)(i)), "".concat(u).concat((0, t.a)(i))],
                    label: ["label", "label".concat((0, t.a)(o))],
                    avatar: ["avatar", "avatar".concat((0, t.a)(o)), "avatarColor".concat((0, t.a)(i))],
                    icon: ["icon", "icon".concat((0, t.a)(o)), "iconColor".concat((0, t.a)(s))],
                    deleteIcon: ["deleteIcon", "deleteIcon".concat((0, t.a)(o)), "deleteIconColor".concat((0, t.a)(i)), "deleteIcon".concat((0, t.a)(u), "Color").concat((0, t.a)(i))]
                };
                return (0, n.a)(d, p, r)
            })(_),
            J = z === u.B ? (0, r._)({
                component: C || "div",
                focusVisibleClassName: M.focusVisible
            }, U && {
                disableRipple: !0
            }) : {},
            j = null;
        U && (j = R && a.isValidElement(R) ? a.cloneElement(R, {
            className: (0, n.c)(R.props.className, M.deleteIcon),
            onClick: V
        }) : (0, i.jsx)(d, {
            className: (0, n.c)(M.deleteIcon),
            onClick: V
        }));
        let L = null;
        h && a.isValidElement(h) && (L = a.cloneElement(h, {
            className: (0, n.c)(M.avatar, h.props.className)
        }));
        let H = null;
        return I && a.isValidElement(I) && (H = a.cloneElement(I, {
            className: (0, n.c)(M.icon, I.props.className)
        })), (0, i.jsxs)(f, (0, r._)({
            as: z,
            className: (0, n.c)(M.root, b),
            disabled: !(!T || !q) || void 0,
            onClick: x,
            onKeyDown: e => {
                e.currentTarget === e.target && y(e) && e.preventDefault(), N && N(e)
            },
            onKeyUp: e => {
                e.currentTarget === e.target && (U && y(e) ? U(e) : "Escape" === e.key && D.current && D.current.blur()), S && S(e)
            },
            ref: E,
            tabIndex: B && q ? -1 : O,
            ownerState: _
        }, J, A, {
            children: [L || H, (0, i.jsx)(m, {
                className: (0, n.c)(M.label),
                ownerState: _,
                children: P
            }), j]
        }))
    });
    e.s(["C", 0, b, "c", 0, h])
}, 770009, 773272, e => {
    "use strict";
    var t = e.i(865800),
        r = e.i(416340),
        a = e.i(734094),
        n = e.i(614515),
        o = e.i(993807),
        i = e.i(268887);
    e.i(221628);
    var s = function(e, t) {
            var r = e.palette;
            switch (t) {
                case "primaryBrand":
                    return r.content.action;
                case "primary":
                    return r.actionV2.primary.fill;
                case "secondary":
                    return r.actionV2.secondary.fill;
                case "error":
                    return r.content.alert.important;
                case "warning":
                    return r.actionV2.notice.fill;
                case "success":
                    return r.content.alert.active;
                default:
                    return ""
            }
        },
        c = (0, n.default)({
            name: "Chip"
        })(function(e, r) {
            var n, o, c = void 0 === r ? {} : r,
                l = c.variant,
                u = void 0 === l ? "filled" : l,
                d = c.large,
                p = c.color,
                h = void 0 === p ? "secondary" : p,
                v = "filled" === u ? e.palette.content.inverse : e.palette.content.standard,
                f = e.palette.actionV2.primary,
                m = e.palette.content.static.dark;
            "primaryBrand" === h && (v = "filled" === u ? e.palette.content.static.light : e.palette.content.action, f = e.palette.actionV2.primaryBrand, m = e.palette.content.static.dark), "secondary" === h && (v = e.palette.content.standard, f = e.palette.actionV2.secondary, m = e.palette.states.active), "error" === h && (v = "filled" === u ? e.palette.content.inverse : e.palette.content.alert.important, f = e.palette.actionV2.important, m = e.palette.content.static.dark), "success" === h && (v = "filled" === u ? e.palette.content.inverse : e.palette.content.alert.active, f = e.palette.actionV2.active, m = e.palette.content.static.dark), "warning" === h && (v = "filled" === u ? a.l.TokensLight.Color.Content.Emphasis : e.palette.content.alert.notice, f = e.palette.actionV2.notice, m = e.palette.content.static.dark);
            var y = "inherit";
            return {
                root: (0, t._)((0, t._)({}, e.typography.chip), void 0 !== d && d ? {
                    height: 40,
                    borderRadius: 40,
                    padding: "0 4px"
                } : {}),
                filled: ((n = {
                    color: v,
                    backgroundColor: f.fill
                })["&.".concat(i.c.clickable, ":hover")] = {
                    backgroundColor: f.containedHoverFocus
                }, n["& .".concat(i.c.icon)] = {
                    color: y
                }, n["& .".concat(i.c.avatar)] = "primary" === h || "secondary" === h ? {
                    color: e.palette.content.standard,
                    backgroundColor: e.palette.content.inverse
                } : {
                    color: e.palette.content.static.light,
                    backgroundColor: e.palette.content.static.dark
                }, n["& .".concat(i.c.deleteIcon)] = {
                    color: m
                }, n),
                outlined: ((o = {
                    color: v,
                    borderColor: e.palette.surface.outline
                })["&.".concat(i.c.clickable, ":hover")] = {
                    backgroundColor: e.palette.states.hover
                }, o["& .".concat(i.c.icon)] = {
                    color: y
                }, o["& .".concat(i.c.avatar)] = {
                    color: "secondary" === h ? e.palette.content.standard : e.palette.content.inverse,
                    backgroundColor: s(e, h)
                }, o["& .".concat(i.c.deleteIcon)] = {
                    color: "secondary" === h ? e.palette.content.standard : f.fill
                }, o)
            }
        }),
        l = (0, r.forwardRef)(function(e, a) {
            var n = e.classes,
                s = e.size,
                l = e.variant,
                u = void 0 === l ? "filled" : l,
                d = e.color,
                p = e.className,
                h = (0, t.a)(e, ["classes", "size", "variant", "color", "className"]),
                v = c({
                    large: "large" === s,
                    color: void 0 === d ? "primaryBrand" : d,
                    variant: u
                }, {
                    props: {
                        classes: (0, o.default)(n, p)
                    }
                });
            return r.default.createElement(i.C, (0, t._)({}, h, {
                size: "large" !== s ? s : void 0,
                classes: v.classes,
                ref: a,
                variant: u
            }))
        });
    e.s(["default", 0, l, "useStyles", 0, c], 773272), e.s(["Chip", 0, l], 770009)
}, 196344, e => {
    "use strict";
    e.s(["u", 0, function(e, t, r, a, n) {
        return null
    }])
}]);

//# debugId=7552c65e-dcbb-9bfa-360e-d9138cadf6fe
//# sourceMappingURL=2wbzhnd6ckp_t.js.map