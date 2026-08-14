;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "e3da0f23-36b4-49c6-28a1-518fbfc89b8e")
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
        return new(r || (r = Promise))(function(n, i) {
            function s(e) {
                try {
                    c(a.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    c(a.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function c(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(s, o)
            }
            c((a = a.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var r, a, n, i = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = o(0), s.throw = o(1), s.return = o(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function o(o) {
            return function(c) {
                var l = [o, c];
                if (r) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, l[0] && (i = 0)), i;) try {
                    if (r = 1, a && (n = 2 & l[0] ? a.return : l[0] ? a.throw || ((n = a.return) && n.call(a), 0) : a.next) && !(n = n.call(a, l[1])).done) return n;
                    switch (a = 0, n && (l = [2 & l[0], n.value]), l[0]) {
                        case 0:
                        case 1:
                            n = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, a = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = i.trys).length > 0 && n[n.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < n[1]) {
                                i.label = n[1], n = l;
                                break
                            }
                            if (n && i.label < n[2]) {
                                i.label = n[2], i.ops.push(l);
                                break
                            }
                            n[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
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

    function s(e, r) {
        return null == e ? e : {
            description: (0, t.exists)(e, "description") ? e.description : void 0
        }
    }

    function o(e) {
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

    function h() {
        return null !== d && d.apply(this, arguments) || this
    }
    a(h, d), h.prototype.v1BirthdateGetRaw = function(e) {
        return n(this, void 0, void 0, function() {
            var r, a, n;
            return i(this, function(i) {
                switch (i.label) {
                    case 0:
                        return r = {}, a = {}, [4, this.request({
                            path: "/v1/birthdate",
                            schemaPath: "/v1/birthdate",
                            method: "GET",
                            headers: a,
                            query: r
                        }, e)];
                    case 1:
                        return n = i.sent(), [2, new t.JSONApiResponse(n, function(e) {
                            return null == e ? e : {
                                birthMonth: (0, t.exists)(e, "birthMonth") ? e.birthMonth : void 0,
                                birthDay: (0, t.exists)(e, "birthDay") ? e.birthDay : void 0,
                                birthYear: (0, t.exists)(e, "birthYear") ? e.birthYear : void 0
                            }
                        })]
                }
            })
        })
    }, h.prototype.v1BirthdateGet = function(e) {
        return n(this, void 0, void 0, function() {
            return i(this, function(t) {
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
    }, h.prototype.v1BirthdatePostRaw = function(e, r) {
        return n(this, void 0, void 0, function() {
            var a, n, s;
            return i(this, function(i) {
                switch (i.label) {
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
                        return s = i.sent(), [2, new t.JSONApiResponse(s)]
                }
            })
        })
    }, h.prototype.v1BirthdatePost = function(e, t) {
        return n(this, void 0, void 0, function() {
            return i(this, function(r) {
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
    }, h.prototype.v1DescriptionGetRaw = function(e) {
        return n(this, void 0, void 0, function() {
            var r, a, n;
            return i(this, function(i) {
                switch (i.label) {
                    case 0:
                        return r = {}, a = {}, [4, this.request({
                            path: "/v1/description",
                            schemaPath: "/v1/description",
                            method: "GET",
                            headers: a,
                            query: r
                        }, e)];
                    case 1:
                        return n = i.sent(), [2, new t.JSONApiResponse(n, function(e) {
                            return s(e)
                        })]
                }
            })
        })
    }, h.prototype.v1DescriptionGet = function(e) {
        return n(this, void 0, void 0, function() {
            return i(this, function(t) {
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
    }, h.prototype.v1DescriptionPostRaw = function(e, r) {
        return n(this, void 0, void 0, function() {
            var a, n, o;
            return i(this, function(i) {
                switch (i.label) {
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
                        return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                            return s(e)
                        })]
                }
            })
        })
    }, h.prototype.v1DescriptionPost = function(e, t) {
        return n(this, void 0, void 0, function() {
            return i(this, function(r) {
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
    }, h.prototype.v1GenderGetRaw = function(e) {
        return n(this, void 0, void 0, function() {
            var r, a, n;
            return i(this, function(i) {
                switch (i.label) {
                    case 0:
                        return r = {}, a = {}, [4, this.request({
                            path: "/v1/gender",
                            schemaPath: "/v1/gender",
                            method: "GET",
                            headers: a,
                            query: r
                        }, e)];
                    case 1:
                        return n = i.sent(), [2, new t.JSONApiResponse(n, function(e) {
                            return null == e ? e : {
                                gender: (0, t.exists)(e, "gender") ? e.gender : void 0
                            }
                        })]
                }
            })
        })
    }, h.prototype.v1GenderGet = function(e) {
        return n(this, void 0, void 0, function() {
            return i(this, function(t) {
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
    }, h.prototype.v1GenderPostRaw = function(e, r) {
        return n(this, void 0, void 0, function() {
            var a, n, s;
            return i(this, function(i) {
                switch (i.label) {
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
                        return s = i.sent(), [2, new t.JSONApiResponse(s)]
                }
            })
        })
    }, h.prototype.v1GenderPost = function(e, t) {
        return n(this, void 0, void 0, function() {
            return i(this, function(r) {
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
    var p = function(e) {
            function r() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(r, e), r.prototype.v1DisplayNamesValidateGetRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var a, n, s;
                    return i(this, function(i) {
                        switch (i.label) {
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
                                return s = i.sent(), [2, new t.JSONApiResponse(s)]
                        }
                    })
                })
            }, r.prototype.v1DisplayNamesValidateGet = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(r) {
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
                    var a, n, s;
                    return i(this, function(i) {
                        switch (i.label) {
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
                                return s = i.sent(), [2, new t.JSONApiResponse(s)]
                        }
                    })
                })
            }, r.prototype.v1UsersUserIdDisplayNamesPatch = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(r) {
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
                    var a, n, s;
                    return i(this, function(i) {
                        switch (i.label) {
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
                                return s = i.sent(), [2, new t.JSONApiResponse(s)]
                        }
                    })
                })
            }, r.prototype.v1UsersUserIdDisplayNamesValidateGet = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(r) {
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
                    var a, n, s;
                    return i(this, function(i) {
                        switch (i.label) {
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
                                return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
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
                    return i(this, function(r) {
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
                    var a, n, s;
                    return i(this, function(i) {
                        switch (i.label) {
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
                                return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
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
                    return i(this, function(r) {
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
                    var a, n, s;
                    return i(this, function(i) {
                        switch (i.label) {
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
                                return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? e.data.map(o) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsernamesUsersPost = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(r) {
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
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, a = {}, [4, this.request({
                                    path: "/v1/users/authenticated/age-bracket",
                                    schemaPath: "/v1/users/authenticated/age-bracket",
                                    method: "GET",
                                    headers: a,
                                    query: r
                                }, e)];
                            case 1:
                                return n = i.sent(), [2, new t.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        ageBracket: (0, t.exists)(e, "ageBracket") ? e.ageBracket : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersAuthenticatedAgeBracketGet = function(e) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(t) {
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
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, a = {}, [4, this.request({
                                    path: "/v1/users/authenticated/country-code",
                                    schemaPath: "/v1/users/authenticated/country-code",
                                    method: "GET",
                                    headers: a,
                                    query: r
                                }, e)];
                            case 1:
                                return n = i.sent(), [2, new t.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        countryCode: (0, t.exists)(e, "countryCode") ? e.countryCode : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersAuthenticatedCountryCodeGet = function(e) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(t) {
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
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, a = {}, [4, this.request({
                                    path: "/v1/users/authenticated",
                                    schemaPath: "/v1/users/authenticated",
                                    method: "GET",
                                    headers: a,
                                    query: r
                                }, e)];
                            case 1:
                                return n = i.sent(), [2, new t.JSONApiResponse(n, function(e) {
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
                    return i(this, function(t) {
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
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, a = {}, [4, this.request({
                                    path: "/v1/users/authenticated/roles",
                                    schemaPath: "/v1/users/authenticated/roles",
                                    method: "GET",
                                    headers: a,
                                    query: r
                                }, e)];
                            case 1:
                                return n = i.sent(), [2, new t.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        roles: (0, t.exists)(e, "roles") ? e.roles : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersAuthenticatedRolesGet = function(e) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(t) {
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
                    var a, n, s;
                    return i(this, function(i) {
                        switch (i.label) {
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
                                return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? e.data.map(c) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersPost = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(r) {
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
                    var a, n, s;
                    return i(this, function(i) {
                        switch (i.label) {
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
                                return s = i.sent(), [2, new t.JSONApiResponse(s, function(e) {
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
                    return i(this, function(r) {
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
    e.s(["DisplayNamesApi", 0, p, "UserSearchApi", 0, v, "UsersApi", 0, f, "V1UsersSearchGetLimitEnum", 0, {
        NUMBER_10: 10,
        NUMBER_25: 25,
        NUMBER_50: 50,
        NUMBER_100: 100
    }])
}, 938780, e => {
    "use strict";
    var t = e.i(273589),
        r = e.i(962560),
        a = e.i(416340),
        n = e.i(42569),
        i = e.i(576881),
        s = e.i(751498),
        o = e.i(221628),
        c = e.i(112896),
        l = e.i(963320);
    e.i(197094);
    var u = (0, s.c)((0, o.jsx)("path", {
            d: "M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"
        }), "CheckBoxOutlineBlank"),
        d = (0, s.c)((0, o.jsx)("path", {
            d: "M19 3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.11 0 2-.9 2-2V5c0-1.1-.89-2-2-2zm-9 14l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"
        }), "CheckBox"),
        h = (0, s.c)((0, o.jsx)("path", {
            d: "M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-2 10H7v-2h10v2z"
        }), "IndeterminateCheckBox");
    let p = ["checkedIcon", "color", "icon", "indeterminate", "indeterminateIcon", "inputProps", "size", "className"],
        v = (0, n.s)(i.S, {
            shouldForwardProp: e => (0, n.r)(e) || "classes" === e,
            name: "MuiCheckbox",
            slot: "Root",
            overridesResolver: (e, r) => {
                let {
                    ownerState: a
                } = e;
                return [r.root, a.indeterminate && r.indeterminate, r["size".concat((0, t.a)(a.size))], "default" !== a.color && r["color".concat((0, t.a)(a.color))]]
            }
        })(e => {
            let {
                theme: a,
                ownerState: n
            } = e;
            return (0, r._)({
                color: (a.vars || a).palette.text.secondary
            }, !n.disableRipple && {
                "&:hover": {
                    backgroundColor: a.vars ? "rgba(".concat("default" === n.color ? a.vars.palette.action.activeChannel : a.vars.palette[n.color].mainChannel, " / ").concat(a.vars.palette.action.hoverOpacity, ")") : (0, t.b)("default" === n.color ? a.palette.action.active : a.palette[n.color].main, a.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== n.color && {
                ["&.".concat(c.c.checked, ", &.").concat(c.c.indeterminate)]: {
                    color: (a.vars || a).palette[n.color].main
                },
                ["&.".concat(c.c.disabled)]: {
                    color: (a.vars || a).palette.action.disabled
                }
            })
        }),
        f = (0, o.jsx)(d, {}),
        m = (0, o.jsx)(u, {}),
        y = (0, o.jsx)(h, {}),
        b = a.forwardRef(function(e, i) {
            var s, u;
            let d = (0, l.u)({
                    props: e,
                    name: "MuiCheckbox"
                }),
                {
                    checkedIcon: h = f,
                    color: b = "primary",
                    icon: w = m,
                    indeterminate: g = !1,
                    indeterminateIcon: C = y,
                    inputProps: R,
                    size: x = "medium",
                    className: I
                } = d,
                q = (0, t._)(d, p),
                P = g ? C : w,
                k = g ? C : h,
                S = (0, r._)({}, d, {
                    color: b,
                    indeterminate: g,
                    size: x
                }),
                _ = (e => {
                    let {
                        classes: a,
                        indeterminate: i,
                        color: s,
                        size: o
                    } = e, l = {
                        root: ["root", i && "indeterminate", "color".concat((0, t.a)(s)), "size".concat((0, t.a)(o))]
                    }, u = (0, n.a)(l, c.g, a);
                    return (0, r._)({}, a, u)
                })(S);
            return (0, o.jsx)(v, (0, r._)({
                type: "checkbox",
                inputProps: (0, r._)({
                    "data-indeterminate": g
                }, R),
                icon: a.cloneElement(P, {
                    fontSize: null != (s = P.props.fontSize) ? s : x
                }),
                checkedIcon: a.cloneElement(k, {
                    fontSize: null != (u = k.props.fontSize) ? u : x
                }),
                ownerState: S,
                ref: i,
                className: (0, n.c)(_.root, I)
            }, q, {
                classes: _
            }))
        });
    e.s(["M", 0, b])
}, 268887, e => {
    "use strict";
    var t = e.i(273589),
        r = e.i(962560),
        a = e.i(416340),
        n = e.i(42569),
        i = e.i(751498),
        s = e.i(221628),
        o = e.i(696180),
        c = e.i(963320),
        l = e.i(208958),
        u = e.i(232625);
    e.i(196344);
    var d = (0, i.c)((0, s.jsx)("path", {
        d: "M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm5 13.59L15.59 17 12 13.41 8.41 17 7 15.59 10.59 12 7 8.41 8.41 7 12 10.59 15.59 7 17 8.41 13.41 12 17 15.59z"
    }), "Cancel");

    function h(e) {
        return (0, t.g)("MuiChip", e)
    }
    var p = (0, o.g)("MuiChip", ["root", "sizeSmall", "sizeMedium", "colorError", "colorInfo", "colorPrimary", "colorSecondary", "colorSuccess", "colorWarning", "disabled", "clickable", "clickableColorPrimary", "clickableColorSecondary", "deletable", "deletableColorPrimary", "deletableColorSecondary", "outlined", "filled", "outlinedPrimary", "outlinedSecondary", "filledPrimary", "filledSecondary", "avatar", "avatarSmall", "avatarMedium", "avatarColorPrimary", "avatarColorSecondary", "icon", "iconSmall", "iconMedium", "iconColorPrimary", "iconColorSecondary", "label", "labelSmall", "labelMedium", "deleteIcon", "deleteIconSmall", "deleteIconMedium", "deleteIconColorPrimary", "deleteIconColorSecondary", "deleteIconOutlinedColorPrimary", "deleteIconOutlinedColorSecondary", "deleteIconFilledColorPrimary", "deleteIconFilledColorSecondary", "focusVisible"]);
    let v = ["avatar", "className", "clickable", "color", "component", "deleteIcon", "disabled", "icon", "label", "onClick", "onDelete", "onKeyDown", "onKeyUp", "size", "variant", "tabIndex", "skipFocusWhenDisabled"],
        f = (0, n.s)("div", {
            name: "MuiChip",
            slot: "Root",
            overridesResolver: (e, r) => {
                let {
                    ownerState: a
                } = e, {
                    color: n,
                    iconColor: i,
                    clickable: s,
                    onDelete: o,
                    size: c,
                    variant: l
                } = a;
                return [{
                    ["& .".concat(p.avatar)]: r.avatar
                }, {
                    ["& .".concat(p.avatar)]: r["avatar".concat((0, t.a)(c))]
                }, {
                    ["& .".concat(p.avatar)]: r["avatarColor".concat((0, t.a)(n))]
                }, {
                    ["& .".concat(p.icon)]: r.icon
                }, {
                    ["& .".concat(p.icon)]: r["icon".concat((0, t.a)(c))]
                }, {
                    ["& .".concat(p.icon)]: r["iconColor".concat((0, t.a)(i))]
                }, {
                    ["& .".concat(p.deleteIcon)]: r.deleteIcon
                }, {
                    ["& .".concat(p.deleteIcon)]: r["deleteIcon".concat((0, t.a)(c))]
                }, {
                    ["& .".concat(p.deleteIcon)]: r["deleteIconColor".concat((0, t.a)(n))]
                }, {
                    ["& .".concat(p.deleteIcon)]: r["deleteIcon".concat((0, t.a)(l), "Color").concat((0, t.a)(n))]
                }, r.root, r["size".concat((0, t.a)(c))], r["color".concat((0, t.a)(n))], s && r.clickable, s && "default" !== n && r["clickableColor".concat((0, t.a)(n), ")")], o && r.deletable, o && "default" !== n && r["deletableColor".concat((0, t.a)(n))], r[l], r["".concat(l).concat((0, t.a)(n))]]
            }
        })(e => {
            let {
                theme: a,
                ownerState: n
            } = e, i = "light" === a.palette.mode ? a.palette.grey[700] : a.palette.grey[300];
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
                ["&.".concat(p.disabled)]: {
                    opacity: (a.vars || a).palette.action.disabledOpacity,
                    pointerEvents: "none"
                },
                ["& .".concat(p.avatar)]: {
                    marginLeft: 5,
                    marginRight: -6,
                    width: 24,
                    height: 24,
                    color: a.vars ? a.vars.palette.Chip.defaultAvatarColor : i,
                    fontSize: a.typography.pxToRem(12)
                },
                ["& .".concat(p.avatarColorPrimary)]: {
                    color: (a.vars || a).palette.primary.contrastText,
                    backgroundColor: (a.vars || a).palette.primary.dark
                },
                ["& .".concat(p.avatarColorSecondary)]: {
                    color: (a.vars || a).palette.secondary.contrastText,
                    backgroundColor: (a.vars || a).palette.secondary.dark
                },
                ["& .".concat(p.avatarSmall)]: {
                    marginLeft: 4,
                    marginRight: -4,
                    width: 18,
                    height: 18,
                    fontSize: a.typography.pxToRem(10)
                },
                ["& .".concat(p.icon)]: (0, r._)({
                    marginLeft: 5,
                    marginRight: -6
                }, "small" === n.size && {
                    fontSize: 18,
                    marginLeft: 4,
                    marginRight: -4
                }, n.iconColor === n.color && (0, r._)({
                    color: a.vars ? a.vars.palette.Chip.defaultIconColor : i
                }, "default" !== n.color && {
                    color: "inherit"
                })),
                ["& .".concat(p.deleteIcon)]: (0, r._)({
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
                ["&.".concat(p.focusVisible)]: {
                    backgroundColor: a.vars ? "rgba(".concat(a.vars.palette.action.selectedChannel, " / calc(").concat(a.vars.palette.action.selectedOpacity, " + ").concat(a.vars.palette.action.focusOpacity, "))") : (0, t.b)(a.palette.action.selected, a.palette.action.selectedOpacity + a.palette.action.focusOpacity)
                }
            }, n.onDelete && "default" !== n.color && {
                ["&.".concat(p.focusVisible)]: {
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
                ["&.".concat(p.focusVisible)]: {
                    backgroundColor: a.vars ? "rgba(".concat(a.vars.palette.action.selectedChannel, " / calc(").concat(a.vars.palette.action.selectedOpacity, " + ").concat(a.vars.palette.action.focusOpacity, "))") : (0, t.b)(a.palette.action.selected, a.palette.action.selectedOpacity + a.palette.action.focusOpacity)
                },
                "&:active": {
                    boxShadow: (a.vars || a).shadows[1]
                }
            }, n.clickable && "default" !== n.color && {
                ["&:hover, &.".concat(p.focusVisible)]: {
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
                ["&.".concat(p.clickable, ":hover")]: {
                    backgroundColor: (a.vars || a).palette.action.hover
                },
                ["&.".concat(p.focusVisible)]: {
                    backgroundColor: (a.vars || a).palette.action.focus
                },
                ["& .".concat(p.avatar)]: {
                    marginLeft: 4
                },
                ["& .".concat(p.avatarSmall)]: {
                    marginLeft: 2
                },
                ["& .".concat(p.icon)]: {
                    marginLeft: 4
                },
                ["& .".concat(p.iconSmall)]: {
                    marginLeft: 2
                },
                ["& .".concat(p.deleteIcon)]: {
                    marginRight: 5
                },
                ["& .".concat(p.deleteIconSmall)]: {
                    marginRight: 3
                }
            }, "outlined" === n.variant && "default" !== n.color && {
                color: (a.vars || a).palette[n.color].main,
                border: "1px solid ".concat(a.vars ? "rgba(".concat(a.vars.palette[n.color].mainChannel, " / 0.7)") : (0, t.b)(a.palette[n.color].main, .7)),
                ["&.".concat(p.clickable, ":hover")]: {
                    backgroundColor: a.vars ? "rgba(".concat(a.vars.palette[n.color].mainChannel, " / ").concat(a.vars.palette.action.hoverOpacity, ")") : (0, t.b)(a.palette[n.color].main, a.palette.action.hoverOpacity)
                },
                ["&.".concat(p.focusVisible)]: {
                    backgroundColor: a.vars ? "rgba(".concat(a.vars.palette[n.color].mainChannel, " / ").concat(a.vars.palette.action.focusOpacity, ")") : (0, t.b)(a.palette[n.color].main, a.palette.action.focusOpacity)
                },
                ["& .".concat(p.deleteIcon)]: {
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
    let b = a.forwardRef(function(e, i) {
        let o = (0, c.u)({
                props: e,
                name: "MuiChip"
            }),
            {
                avatar: p,
                className: b,
                clickable: w,
                color: g = "default",
                component: C,
                deleteIcon: R,
                disabled: x = !1,
                icon: I,
                label: q,
                onClick: P,
                onDelete: k,
                onKeyDown: S,
                onKeyUp: _,
                size: U = "medium",
                variant: N = "filled",
                tabIndex: O,
                skipFocusWhenDisabled: G = !1
            } = o,
            E = (0, t._)(o, v),
            B = a.useRef(null),
            A = (0, l.u)(B, i),
            D = e => {
                e.stopPropagation(), k && k(e)
            },
            M = !(!1 === w || !P) || w,
            V = M || k ? u.B : C || "div",
            T = (0, r._)({}, o, {
                component: V,
                disabled: x,
                size: U,
                color: g,
                iconColor: a.isValidElement(I) && I.props.color || g,
                onDelete: !!k,
                clickable: M,
                variant: N
            }),
            z = (e => {
                let {
                    classes: r,
                    disabled: a,
                    size: i,
                    color: s,
                    iconColor: o,
                    onDelete: c,
                    clickable: l,
                    variant: u
                } = e, d = {
                    root: ["root", u, a && "disabled", "size".concat((0, t.a)(i)), "color".concat((0, t.a)(s)), l && "clickable", l && "clickableColor".concat((0, t.a)(s)), c && "deletable", c && "deletableColor".concat((0, t.a)(s)), "".concat(u).concat((0, t.a)(s))],
                    label: ["label", "label".concat((0, t.a)(i))],
                    avatar: ["avatar", "avatar".concat((0, t.a)(i)), "avatarColor".concat((0, t.a)(s))],
                    icon: ["icon", "icon".concat((0, t.a)(i)), "iconColor".concat((0, t.a)(o))],
                    deleteIcon: ["deleteIcon", "deleteIcon".concat((0, t.a)(i)), "deleteIconColor".concat((0, t.a)(s)), "deleteIcon".concat((0, t.a)(u), "Color").concat((0, t.a)(s))]
                };
                return (0, n.a)(d, h, r)
            })(T),
            j = V === u.B ? (0, r._)({
                component: C || "div",
                focusVisibleClassName: z.focusVisible
            }, k && {
                disableRipple: !0
            }) : {},
            L = null;
        k && (L = R && a.isValidElement(R) ? a.cloneElement(R, {
            className: (0, n.c)(R.props.className, z.deleteIcon),
            onClick: D
        }) : (0, s.jsx)(d, {
            className: (0, n.c)(z.deleteIcon),
            onClick: D
        }));
        let J = null;
        p && a.isValidElement(p) && (J = a.cloneElement(p, {
            className: (0, n.c)(z.avatar, p.props.className)
        }));
        let K = null;
        return I && a.isValidElement(I) && (K = a.cloneElement(I, {
            className: (0, n.c)(z.icon, I.props.className)
        })), (0, s.jsxs)(f, (0, r._)({
            as: V,
            className: (0, n.c)(z.root, b),
            disabled: !(!M || !x) || void 0,
            onClick: P,
            onKeyDown: e => {
                e.currentTarget === e.target && y(e) && e.preventDefault(), S && S(e)
            },
            onKeyUp: e => {
                e.currentTarget === e.target && (k && y(e) ? k(e) : "Escape" === e.key && B.current && B.current.blur()), _ && _(e)
            },
            ref: A,
            tabIndex: G && x ? -1 : O,
            ownerState: T
        }, j, E, {
            children: [J || K, (0, s.jsx)(m, {
                className: (0, n.c)(z.label),
                ownerState: T,
                children: q
            }), L]
        }))
    });
    e.s(["C", 0, b, "c", 0, p])
}, 770009, 773272, e => {
    "use strict";
    var t = e.i(865800),
        r = e.i(416340),
        a = e.i(734094),
        n = e.i(614515),
        i = e.i(993807),
        s = e.i(268887);
    e.i(221628);
    var o = function(e, t) {
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
            var n, i, c = void 0 === r ? {} : r,
                l = c.variant,
                u = void 0 === l ? "filled" : l,
                d = c.large,
                h = c.color,
                p = void 0 === h ? "secondary" : h,
                v = "filled" === u ? e.palette.content.inverse : e.palette.content.standard,
                f = e.palette.actionV2.primary,
                m = e.palette.content.static.dark;
            "primaryBrand" === p && (v = "filled" === u ? e.palette.content.static.light : e.palette.content.action, f = e.palette.actionV2.primaryBrand, m = e.palette.content.static.dark), "secondary" === p && (v = e.palette.content.standard, f = e.palette.actionV2.secondary, m = e.palette.states.active), "error" === p && (v = "filled" === u ? e.palette.content.inverse : e.palette.content.alert.important, f = e.palette.actionV2.important, m = e.palette.content.static.dark), "success" === p && (v = "filled" === u ? e.palette.content.inverse : e.palette.content.alert.active, f = e.palette.actionV2.active, m = e.palette.content.static.dark), "warning" === p && (v = "filled" === u ? a.l.TokensLight.Color.Content.Emphasis : e.palette.content.alert.notice, f = e.palette.actionV2.notice, m = e.palette.content.static.dark);
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
                })["&.".concat(s.c.clickable, ":hover")] = {
                    backgroundColor: f.containedHoverFocus
                }, n["& .".concat(s.c.icon)] = {
                    color: y
                }, n["& .".concat(s.c.avatar)] = "primary" === p || "secondary" === p ? {
                    color: e.palette.content.standard,
                    backgroundColor: e.palette.content.inverse
                } : {
                    color: e.palette.content.static.light,
                    backgroundColor: e.palette.content.static.dark
                }, n["& .".concat(s.c.deleteIcon)] = {
                    color: m
                }, n),
                outlined: ((i = {
                    color: v,
                    borderColor: e.palette.surface.outline
                })["&.".concat(s.c.clickable, ":hover")] = {
                    backgroundColor: e.palette.states.hover
                }, i["& .".concat(s.c.icon)] = {
                    color: y
                }, i["& .".concat(s.c.avatar)] = {
                    color: "secondary" === p ? e.palette.content.standard : e.palette.content.inverse,
                    backgroundColor: o(e, p)
                }, i["& .".concat(s.c.deleteIcon)] = {
                    color: "secondary" === p ? e.palette.content.standard : f.fill
                }, i)
            }
        }),
        l = (0, r.forwardRef)(function(e, a) {
            var n = e.classes,
                o = e.size,
                l = e.variant,
                u = void 0 === l ? "filled" : l,
                d = e.color,
                h = e.className,
                p = (0, t.a)(e, ["classes", "size", "variant", "color", "className"]),
                v = c({
                    large: "large" === o,
                    color: void 0 === d ? "primaryBrand" : d,
                    variant: u
                }, {
                    props: {
                        classes: (0, i.default)(n, h)
                    }
                });
            return r.default.createElement(s.C, (0, t._)({}, p, {
                size: "large" !== o ? o : void 0,
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
}, 182012, 436175, e => {
    "use strict";
    var t, r, a, n, i, s, o, c, l, u, d, h = e.i(416340),
        p = e.i(711300),
        v = e.i(634203),
        f = e.i(35877),
        m = e.i(422898),
        y = e.i(630844),
        b = e.i(665564),
        w = e.i(199189),
        g = e.i(919122),
        C = (t = new WeakMap, r = new WeakMap, a = new WeakMap, n = new WeakMap, i = new WeakSet, class extends w.Removable {
            setOptions(e) {
                this.options = e, this.updateGcTime(this.options.gcTime)
            }
            get meta() {
                return this.options.meta
            }
            addObserver(e) {
                (0, p._)(this, r).includes(e) || ((0, p._)(this, r).push(e), this.clearGcTimeout(), (0, p._)(this, a).notify({
                    type: "observerAdded",
                    mutation: this,
                    observer: e
                }))
            }
            removeObserver(e) {
                (0, f._)(this, r, (0, p._)(this, r).filter(t => t !== e)), this.scheduleGc(), (0, p._)(this, a).notify({
                    type: "observerRemoved",
                    mutation: this,
                    observer: e
                })
            }
            optionalRemove() {
                (0, p._)(this, r).length || ("pending" === this.state.status ? this.scheduleGc() : (0, p._)(this, a).remove(this))
            }
            continue () {
                var e, t;
                return null != (e = null == (t = (0, p._)(this, n)) ? void 0 : t.continue()) ? e : this.execute(this.state.variables)
            }
            async execute(e) {
                var r, s, o, c, l, u, d, h, v, y, b, w, C, R, I, q, P, k, S, _, U;
                let N = () => {
                        (0, m._)(this, i, x).call(this, {
                            type: "continue"
                        })
                    },
                    O = {
                        client: (0, p._)(this, t),
                        meta: this.options.meta,
                        mutationKey: this.options.mutationKey
                    };
                (0, f._)(this, n, (0, g.createRetryer)({
                    fn: () => this.options.mutationFn ? this.options.mutationFn(e, O) : Promise.reject(Error("No mutationFn found")),
                    onFail: (e, t) => {
                        (0, m._)(this, i, x).call(this, {
                            type: "failed",
                            failureCount: e,
                            error: t
                        })
                    },
                    onPause: () => {
                        (0, m._)(this, i, x).call(this, {
                            type: "pause"
                        })
                    },
                    onContinue: N,
                    retry: null != (r = this.options.retry) ? r : 0,
                    retryDelay: this.options.retryDelay,
                    networkMode: this.options.networkMode,
                    canRun: () => (0, p._)(this, a).canRun(this)
                }));
                let G = "pending" === this.state.status,
                    E = !(0, p._)(this, n).canStart();
                try {
                    if (G) N();
                    else {
                        (0, m._)(this, i, x).call(this, {
                            type: "pending",
                            variables: e,
                            isPaused: E
                        }), await (null == (y = (b = (0, p._)(this, a).config).onMutate) ? void 0 : y.call(b, e, this, O));
                        let t = await (null == (w = (C = this.options).onMutate) ? void 0 : w.call(C, e, O));
                        t !== this.state.context && (0, m._)(this, i, x).call(this, {
                            type: "pending",
                            context: t,
                            variables: e,
                            isPaused: E
                        })
                    }
                    let t = await (0, p._)(this, n).start();
                    return await (null == (s = (o = (0, p._)(this, a).config).onSuccess) ? void 0 : s.call(o, t, e, this.state.context, this, O)), await (null == (c = (l = this.options).onSuccess) ? void 0 : c.call(l, t, e, this.state.context, O)), await (null == (u = (d = (0, p._)(this, a).config).onSettled) ? void 0 : u.call(d, t, null, this.state.variables, this.state.context, this, O)), await (null == (h = (v = this.options).onSettled) ? void 0 : h.call(v, t, null, e, this.state.context, O)), (0, m._)(this, i, x).call(this, {
                        type: "success",
                        data: t
                    }), t
                } catch (t) {
                    try {
                        throw await (null == (R = (I = (0, p._)(this, a).config).onError) ? void 0 : R.call(I, t, e, this.state.context, this, O)), await (null == (q = (P = this.options).onError) ? void 0 : q.call(P, t, e, this.state.context, O)), await (null == (k = (S = (0, p._)(this, a).config).onSettled) ? void 0 : k.call(S, void 0, t, this.state.variables, this.state.context, this, O)), await (null == (_ = (U = this.options).onSettled) ? void 0 : _.call(U, void 0, t, e, this.state.context, O)), t
                    } finally {
                        (0, m._)(this, i, x).call(this, {
                            type: "error",
                            error: t
                        })
                    }
                } finally {
                    (0, p._)(this, a).runNext(this)
                }
            }
            constructor(e) {
                super(), (0, y._)(this, i), (0, v._)(this, t, {
                    writable: !0,
                    value: void 0
                }), (0, v._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, v._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, v._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, t, e.client), this.mutationId = e.mutationId, (0, f._)(this, a, e.mutationCache), (0, f._)(this, r, []), this.state = e.state || R(), this.setOptions(e.options), this.scheduleGc()
            }
        });

    function R() {
        return {
            context: void 0,
            data: void 0,
            error: null,
            failureCount: 0,
            failureReason: null,
            isPaused: !1,
            status: "idle",
            variables: void 0,
            submittedAt: 0
        }
    }

    function x(e) {
        this.state = (t => {
            switch (e.type) {
                case "failed":
                    return {
                        ...t, failureCount: e.failureCount, failureReason: e.error
                    };
                case "pause":
                    return {
                        ...t, isPaused: !0
                    };
                case "continue":
                    return {
                        ...t, isPaused: !1
                    };
                case "pending":
                    return {
                        ...t, context: e.context, data: void 0, failureCount: 0, failureReason: null, error: null, isPaused: e.isPaused, status: "pending", variables: e.variables, submittedAt: Date.now()
                    };
                case "success":
                    return {
                        ...t, data: e.data, failureCount: 0, failureReason: null, error: null, status: "success", isPaused: !1
                    };
                case "error":
                    return {
                        ...t, data: void 0, error: e.error, failureCount: t.failureCount + 1, failureReason: e.error, isPaused: !1, status: "error"
                    }
            }
        })(this.state), b.notifyManager.batch(() => {
            (0, p._)(this, r).forEach(t => {
                t.onMutationUpdate(e)
            }), (0, p._)(this, a).notify({
                mutation: this,
                type: "updated",
                action: e
            })
        })
    }
    e.s(["Mutation", 0, C, "getDefaultState", 0, R], 436175);
    var I = e.i(211089),
        q = e.i(711367),
        P = (s = new WeakMap, o = new WeakMap, c = new WeakMap, l = new WeakMap, u = new WeakSet, d = new WeakSet, class extends I.Subscribable {
            bindMethods() {
                this.mutate = this.mutate.bind(this), this.reset = this.reset.bind(this)
            }
            setOptions(e) {
                var t;
                let r = this.options;
                this.options = (0, p._)(this, s).defaultMutationOptions(e), (0, q.shallowEqualObjects)(this.options, r) || (0, p._)(this, s).getMutationCache().notify({
                    type: "observerOptionsUpdated",
                    mutation: (0, p._)(this, c),
                    observer: this
                }), (null == r ? void 0 : r.mutationKey) && this.options.mutationKey && (0, q.hashKey)(r.mutationKey) !== (0, q.hashKey)(this.options.mutationKey) ? this.reset() : (null == (t = (0, p._)(this, c)) ? void 0 : t.state.status) === "pending" && (0, p._)(this, c).setOptions(this.options)
            }
            onUnsubscribe() {
                if (!this.hasListeners()) {
                    var e;
                    null == (e = (0, p._)(this, c)) || e.removeObserver(this)
                }
            }
            onMutationUpdate(e) {
                (0, m._)(this, u, k).call(this), (0, m._)(this, d, S).call(this, e)
            }
            getCurrentResult() {
                return (0, p._)(this, o)
            }
            reset() {
                var e;
                null == (e = (0, p._)(this, c)) || e.removeObserver(this), (0, f._)(this, c, void 0), (0, m._)(this, u, k).call(this), (0, m._)(this, d, S).call(this)
            }
            mutate(e, t) {
                var r;
                return (0, f._)(this, l, t), null == (r = (0, p._)(this, c)) || r.removeObserver(this), (0, f._)(this, c, (0, p._)(this, s).getMutationCache().build((0, p._)(this, s), this.options)), (0, p._)(this, c).addObserver(this), (0, p._)(this, c).execute(e)
            }
            constructor(e, t) {
                super(), (0, y._)(this, u), (0, y._)(this, d), (0, v._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, v._)(this, o, {
                    writable: !0,
                    value: void 0
                }), (0, v._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, v._)(this, l, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, s, e), this.setOptions(t), this.bindMethods(), (0, m._)(this, u, k).call(this)
            }
        });

    function k() {
        var e, t;
        let r = null != (e = null == (t = (0, p._)(this, c)) ? void 0 : t.state) ? e : R();
        (0, f._)(this, o, {
            ...r,
            isPending: "pending" === r.status,
            isSuccess: "success" === r.status,
            isError: "error" === r.status,
            isIdle: "idle" === r.status,
            mutate: this.mutate,
            reset: this.reset
        })
    }

    function S(e) {
        b.notifyManager.batch(() => {
            if ((0, p._)(this, l) && this.hasListeners()) {
                var t, r, a, n, i, c, u, d;
                let h = (0, p._)(this, o).variables,
                    v = (0, p._)(this, o).context,
                    f = {
                        client: (0, p._)(this, s),
                        meta: this.options.meta,
                        mutationKey: this.options.mutationKey
                    };
                (null == e ? void 0 : e.type) === "success" ? (null == (t = (r = (0, p._)(this, l)).onSuccess) || t.call(r, e.data, h, v, f), null == (a = (n = (0, p._)(this, l)).onSettled) || a.call(n, e.data, null, h, v, f)) : (null == e ? void 0 : e.type) === "error" && (null == (i = (c = (0, p._)(this, l)).onError) || i.call(c, e.error, h, v, f), null == (u = (d = (0, p._)(this, l)).onSettled) || u.call(d, void 0, e.error, h, v, f))
            }
            this.listeners.forEach(e => {
                e((0, p._)(this, o))
            })
        })
    }
    var _ = e.i(795621);
    e.s(["useMutation", 0, function(e, t) {
        let r = (0, _.useQueryClient)(t),
            [a] = h.useState(() => new P(r, e));
        h.useEffect(() => {
            a.setOptions(e)
        }, [a, e]);
        let n = h.useSyncExternalStore(h.useCallback(e => a.subscribe(b.notifyManager.batchCalls(e)), [a]), () => a.getCurrentResult(), () => a.getCurrentResult()),
            i = h.useCallback((e, t) => {
                a.mutate(e, t).catch(q.noop)
            }, [a]);
        if (n.error && (0, q.shouldThrowError)(a.options.throwOnError, [n.error])) throw n.error;
        return {
            ...n,
            mutate: i,
            mutateAsync: n.mutate
        }
    }], 182012)
}]);

//# debugId=e3da0f23-36b4-49c6-28a1-518fbfc89b8e
//# sourceMappingURL=31zlpyak0k6_a.js.map