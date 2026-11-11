;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "0fbd3fe2-c815-b050-226f-1df8462f7b1d")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 294109, e => {
    "use strict";
    var t = e.i(433659),
        n = e.i(179183),
        i = e.i(643766),
        a = e.i(365434),
        r = e.i(677484),
        o = e.i(785517),
        s = e.i(268953);

    function c(e) {
        return (0, t.g)("MuiDialogActions", e)
    }(0, r.g)("MuiDialogActions", ["root", "spacing"]);
    let l = ["className", "disableSpacing"],
        u = (0, a.s)("div", {
            name: "MuiDialogActions",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.root, !n.disableSpacing && t.spacing]
            }
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, n._)({
                display: "flex",
                alignItems: "center",
                padding: 8,
                justifyContent: "flex-end",
                flex: "0 0 auto"
            }, !t.disableSpacing && {
                "& > :not(style) ~ :not(style)": {
                    marginLeft: 8
                }
            })
        }),
        p = i.forwardRef(function(e, i) {
            let r = (0, s.u)({
                    props: e,
                    name: "MuiDialogActions"
                }),
                {
                    className: p,
                    disableSpacing: d = !1
                } = r,
                h = (0, t._)(r, l),
                v = (0, n._)({}, r, {
                    disableSpacing: d
                }),
                m = (e => {
                    let {
                        classes: t,
                        disableSpacing: n
                    } = e;
                    return (0, a.a)({
                        root: ["root", !n && "spacing"]
                    }, c, t)
                })(v);
            return (0, o.jsx)(u, (0, n._)({
                className: (0, a.c)(m.root, p),
                ownerState: v,
                ref: i
            }, h))
        });
    e.s(["D", 0, p])
}, 922471, e => {
    "use strict";
    var t = e.i(225226),
        n = e.i(643766),
        i = e.i(231543),
        a = e.i(130933),
        r = e.i(294109);
    e.i(785517);
    var o = (0, i.f)({
            name: "DialogActions"
        })({
            root: {
                justifyContent: "flex-end",
                padding: 20
            }
        }),
        s = (0, n.forwardRef)(function(e, i) {
            var s = e.classes,
                c = e.children,
                l = e.className,
                u = (0, t.a)(e, ["classes", "children", "className"]),
                p = o(void 0, {
                    props: {
                        classes: (0, a.f)(s, l)
                    }
                });
            return n.default.createElement(r.D, (0, t._)({}, u, {
                classes: p.classes,
                ref: i
            }), c)
        });
    e.s(["f", 0, s])
}, 811314, e => {
    "use strict";
    var t = e.i(922471);
    e.s(["f", () => t.f])
}, 796866, e => {
    "use strict";
    var t = e.i(225226),
        n = e.i(643766),
        i = e.i(231543),
        a = e.i(130933),
        r = e.i(179183),
        o = e.i(433659),
        s = e.i(365434),
        c = e.i(197240),
        l = e.i(628520),
        u = e.i(785517),
        p = e.i(422166),
        d = e.i(268953);
    let h = ["className", "id"],
        v = (0, s.s)(p.T, {
            name: "MuiDialogTitle",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({
            padding: "16px 24px",
            flex: "0 0 auto"
        }),
        m = n.forwardRef(function(e, t) {
            let i = (0, d.u)({
                    props: e,
                    name: "MuiDialogTitle"
                }),
                {
                    className: a,
                    id: p
                } = i,
                m = (0, o._)(i, h),
                f = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, s.a)({
                        root: ["root"]
                    }, c.g, t)
                })(i),
                {
                    titleId: y = p
                } = n.useContext(l.D);
            return (0, u.jsx)(v, (0, r._)({
                component: "h2",
                className: (0, s.c)(f.root, a),
                ownerState: i,
                ref: t,
                variant: "h6",
                id: null != p ? p : y
            }, m))
        });
    var f = (0, i.f)({
            name: "DialogTitle"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({}, e.typography.h4), {
                    textAlign: "left",
                    padding: 20,
                    paddingBottom: 8
                })
            }
        }),
        y = (0, n.forwardRef)(function(e, i) {
            var r = e.classes,
                o = e.children,
                s = e.className,
                c = (0, t.a)(e, ["classes", "children", "className"]),
                l = f(void 0, {
                    props: {
                        classes: (0, a.f)(r, s)
                    }
                });
            return n.default.createElement(m, (0, t._)({}, c, {
                classes: l.classes,
                ref: i
            }), o)
        });
    e.s(["f", 0, y])
}, 402976, e => {
    "use strict";
    var t = e.i(796866);
    e.s(["f", () => t.f])
}, 639102, e => {
    "use strict";
    var t, n = e.i(415858),
        i = function(e, t) {
            return (i = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function a(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        i(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function r(e, t, n, i) {
        return new(n || (n = Promise))(function(a, r) {
            function o(e) {
                try {
                    c(i.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    c(i.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function c(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, s)
            }
            c((i = i.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var n, i, a, r = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(c) {
                var l = [s, c];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, l[0] && (r = 0)), r;) try {
                    if (n = 1, i && (a = 2 & l[0] ? i.return : l[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, l[1])).done) return a;
                    switch (i = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                        case 0:
                        case 1:
                            a = l;
                            break;
                        case 4:
                            return r.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            r.label++, i = l[1], l = [0];
                            continue;
                        case 7:
                            l = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = r.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                r.label = l[1];
                                break
                            }
                            if (6 === l[0] && r.label < a[1]) {
                                r.label = a[1], a = l;
                                break
                            }
                            if (a && r.label < a[2]) {
                                r.label = a[2], r.ops.push(l);
                                break
                            }
                            a[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    l = t.call(e, r)
                } catch (e) {
                    l = [6, e], i = 0
                } finally {
                    n = a = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function s(e, t) {
        return null == e ? e : {
            applicationSettings: (0, n.u)(e, "applicationSettings") ? e.applicationSettings : void 0
        }
    }

    function c(e, t) {
        return null == e ? e : {
            version: (0, n.u)(e, "version") ? e.version : void 0,
            clientVersionUpload: (0, n.u)(e, "clientVersionUpload") ? e.clientVersionUpload : void 0,
            bootstrapperVersion: (0, n.u)(e, "bootstrapperVersion") ? e.bootstrapperVersion : void 0,
            nextClientVersionUpload: (0, n.u)(e, "nextClientVersionUpload") ? e.nextClientVersionUpload : void 0,
            nextClientVersion: (0, n.u)(e, "nextClientVersion") ? e.nextClientVersion : void 0
        }
    }

    function l(e) {
        var t;
        return null == (t = e) ? t : {
            name: (0, n.u)(t, "name") ? t.name : void 0,
            version: (0, n.u)(t, "version") ? t.version : void 0,
            downloadUrl: (0, n.u)(t, "downloadUrl") ? t.downloadUrl : void 0,
            isStandalone: (0, n.u)(t, "isStandalone") ? t.isStandalone : void 0,
            assetId: (0, n.u)(t, "assetId") ? t.assetId : void 0,
            assetVersion: (0, n.u)(t, "assetVersion") ? t.assetVersion : void 0,
            maxAppVersion: (0, n.u)(t, "maxAppVersion") ? t.maxAppVersion : void 0,
            tryoutName: (0, n.u)(t, "tryoutName") ? t.tryoutName : void 0,
            localAssetURI: (0, n.u)(t, "localAssetURI") ? t.localAssetURI : void 0,
            isForcedUpdate: (0, n.u)(t, "isForcedUpdate") ? t.isForcedUpdate : void 0,
            appStorageResetId: (0, n.u)(t, "appStorageResetId") ? t.appStorageResetId : void 0,
            isDevelopmentConfig: (0, n.u)(t, "isDevelopmentConfig") ? t.isDevelopmentConfig : void 0,
            assetsManifest: (0, n.u)(t, "assetsManifest") ? t.assetsManifest : void 0,
            versionV2: (0, n.u)(t, "versionV2") ? t.versionV2 : void 0
        }
    }

    function u(e, t) {
        var i;
        return null == e ? e : {
            channelName: (0, n.u)(e, "channelName") ? e.channelName : void 0,
            channelAssignmentType: (0, n.u)(e, "channelAssignmentType") ? e.channelAssignmentType : void 0,
            token: (0, n.u)(e, "token") ? e.token : void 0,
            program: (0, n.u)(e, "program") ? null == (i = e.program) ? i : {
                name: (0, n.u)(i, "name") ? i.name : void 0,
                id: (0, n.u)(i, "id") ? i.id : void 0
            } : void 0,
            isFlagOnly: (0, n.u)(e, "isFlagOnly") ? e.isFlagOnly : void 0
        }
    }
    var p = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return a(t, e), t.prototype.v2UserChannelGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, void 0 !== e.binaryType && (i.binaryType = e.binaryType), a = {}, [4, this.request({
                                path: "/v2/user-channel",
                                schemaPath: "/v2/user-channel",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.H(r, function(e) {
                                return u(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2UserChannelGet = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2UserChannelGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v2UserChannelInternalGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new n.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v2UserChannelInternalGet.");
                            return i = {}, void 0 !== e.userId && (i.userId = e.userId), void 0 !== e.binaryType && (i.binaryType = e.binaryType), void 0 !== e.isLuobuUser && (i.isLuobuUser = e.isLuobuUser), void 0 !== e.isPcVngUser && (i.isPcVngUser = e.isPcVngUser), a = {}, [4, this.request({
                                path: "/v2/user-channel-internal",
                                schemaPath: "/v2/user-channel-internal",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.H(r, function(e) {
                                return u(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2UserChannelInternalGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2UserChannelInternalGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v2UserPublicChannelInternalGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new n.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v2UserPublicChannelInternalGet.");
                            if (null === e.binaryType || void 0 === e.binaryType) throw new n.w("binaryType", "Required parameter requestParameters.binaryType was null or undefined when calling v2UserPublicChannelInternalGet.");
                            return i = {}, void 0 !== e.userId && (i.userId = e.userId), void 0 !== e.binaryType && (i.binaryType = e.binaryType), a = {}, [4, this.request({
                                path: "/v2/user-public-channel-internal",
                                schemaPath: "/v2/user-public-channel-internal",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.H(r, function(e) {
                                return u(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2UserPublicChannelInternalGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2UserPublicChannelInternalGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t
    }(n._);
    (function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        a(t, e), t.prototype.v2CompressionDictionariesDictionarySha256GetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.dictionarySha256 || void 0 === e.dictionarySha256) throw new n.w("dictionarySha256", "Required parameter requestParameters.dictionarySha256 was null or undefined when calling v2CompressionDictionariesDictionarySha256Get.");
                            return i = {}, a = {}, [4, this.request({
                                path: "/v2/compression-dictionaries/{dictionarySha256}".replace("{".concat("dictionarySha256", "}"), encodeURIComponent(String(e.dictionarySha256))),
                                schemaPath: "/v2/compression-dictionaries/{dictionarySha256}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.V(r)]
                    }
                })
            })
        }, t.prototype.v2CompressionDictionariesDictionarySha256Get = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2CompressionDictionariesDictionarySha256GetRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.v2CompressionDictionariesGetRaw = function(e) {
            return r(this, void 0, void 0, function() {
                var t, i, a;
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return t = {}, i = {}, [4, this.request({
                                path: "/v2/compression-dictionaries",
                                schemaPath: "/v2/compression-dictionaries",
                                method: "GET",
                                headers: i,
                                query: t
                            }, e)];
                        case 1:
                            return a = r.sent(), [2, new n.V(a)]
                    }
                })
            })
        }, t.prototype.v2CompressionDictionariesGet = function(e) {
            return r(this, void 0, void 0, function() {
                return o(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v2CompressionDictionariesGetRaw(e)];
                        case 1:
                            return t.sent(), [2]
                    }
                })
            })
        }, t.prototype.v2SettingsApplicationApplicationNameBucketBucketNameGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.w("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsApplicationApplicationNameBucketBucketNameGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new n.w("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsApplicationApplicationNameBucketBucketNameGet.");
                            return i = {}, a = {}, void 0 !== e.trueClientIP && null !== e.trueClientIP && (a["True-Client-IP"] = String(e.trueClientIP)), [4, this.request({
                                path: "/v2/settings/application/{applicationName}/bucket/{bucketName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings/application/{applicationName}/bucket/{bucketName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.H(r, function(e) {
                                return s(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2SettingsApplicationApplicationNameBucketBucketNameGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2SettingsApplicationApplicationNameBucketBucketNameGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v2SettingsApplicationApplicationNameGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.w("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsApplicationApplicationNameGet.");
                            return i = {}, a = {}, void 0 !== e.trueClientIP && null !== e.trueClientIP && (a["True-Client-IP"] = String(e.trueClientIP)), [4, this.request({
                                path: "/v2/settings/application/{applicationName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))),
                                schemaPath: "/v2/settings/application/{applicationName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.H(r, function(e) {
                                return s(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2SettingsApplicationApplicationNameGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2SettingsApplicationApplicationNameGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.w("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGet.");
                            if (null === e.dictionarySha256 || void 0 === e.dictionarySha256) throw new n.w("dictionarySha256", "Required parameter requestParameters.dictionarySha256 was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new n.w("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGet.");
                            return i = {}, a = {}, [4, this.request({
                                path: "/v2/settings-compressed/application/{applicationName}/bucket/{bucketName}/{dictionarySha256}.dcz".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("dictionarySha256", "}"), encodeURIComponent(String(e.dictionarySha256))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings-compressed/application/{applicationName}/bucket/{bucketName}/{dictionarySha256}.dcz",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.V(r)]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGetRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameBucketBucketNameZstGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.w("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameZstGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new n.w("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameZstGet.");
                            return i = {}, a = {}, [4, this.request({
                                path: "/v2/settings-compressed/application/{applicationName}/bucket/{bucketName}.zst".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings-compressed/application/{applicationName}/bucket/{bucketName}.zst",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.V(r)]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameBucketBucketNameZstGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2SettingsCompressedApplicationApplicationNameBucketBucketNameZstGetRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameDictionarySha256DczGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.w("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameDictionarySha256DczGet.");
                            if (null === e.dictionarySha256 || void 0 === e.dictionarySha256) throw new n.w("dictionarySha256", "Required parameter requestParameters.dictionarySha256 was null or undefined when calling v2SettingsCompressedApplicationApplicationNameDictionarySha256DczGet.");
                            return i = {}, a = {}, void 0 !== e.trueClientIP && null !== e.trueClientIP && (a["True-Client-IP"] = String(e.trueClientIP)), [4, this.request({
                                path: "/v2/settings-compressed/application/{applicationName}/{dictionarySha256}.dcz".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("dictionarySha256", "}"), encodeURIComponent(String(e.dictionarySha256))),
                                schemaPath: "/v2/settings-compressed/application/{applicationName}/{dictionarySha256}.dcz",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.V(r)]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameDictionarySha256DczGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2SettingsCompressedApplicationApplicationNameDictionarySha256DczGetRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameZstGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.w("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameZstGet.");
                            return i = {}, a = {}, void 0 !== e.trueClientIP && null !== e.trueClientIP && (a["True-Client-IP"] = String(e.trueClientIP)), [4, this.request({
                                path: "/v2/settings-compressed/application/{applicationName}.zst".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))),
                                schemaPath: "/v2/settings-compressed/application/{applicationName}.zst",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.V(r)]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameZstGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2SettingsCompressedApplicationApplicationNameZstGetRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsApplicationNameBucketBucketNameGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.w("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsSecuredSettingsApplicationNameBucketBucketNameGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new n.w("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsSecuredSettingsApplicationNameBucketBucketNameGet.");
                            if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new n.w("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v2SettingsSecuredSettingsApplicationNameBucketBucketNameGet.");
                            return i = {}, a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/settings/secured-settings/{applicationName}/bucket/{bucketName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings/secured-settings/{applicationName}/bucket/{bucketName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.H(r, function(e) {
                                return s(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsApplicationNameBucketBucketNameGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2SettingsSecuredSettingsApplicationNameBucketBucketNameGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsApplicationNameGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.w("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsSecuredSettingsApplicationNameGet.");
                            if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new n.w("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v2SettingsSecuredSettingsApplicationNameGet.");
                            return i = {}, a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/settings/secured-settings/{applicationName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))),
                                schemaPath: "/v2/settings/secured-settings/{applicationName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.H(r, function(e) {
                                return s(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsApplicationNameGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2SettingsSecuredSettingsApplicationNameGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.w("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new n.w("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGet.");
                            if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new n.w("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGet.");
                            return i = {}, a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/settings/secured-settings-internal/{applicationName}/bucket/{bucketName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings/secured-settings-internal/{applicationName}/bucket/{bucketName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.H(r, function(e) {
                                return s(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsInternalApplicationNameGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.w("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameGet.");
                            if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new n.w("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameGet.");
                            return i = {}, a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/settings/secured-settings-internal/{applicationName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))),
                                schemaPath: "/v2/settings/secured-settings-internal/{applicationName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.H(r, function(e) {
                                return s(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsInternalApplicationNameGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2SettingsSecuredSettingsInternalApplicationNameGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    })(n._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        a(t, e), t.prototype.v2OtaVersionBinaryTypeGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.binaryType || void 0 === e.binaryType) throw new n.w("binaryType", "Required parameter requestParameters.binaryType was null or undefined when calling v2OtaVersionBinaryTypeGet.");
                            return i = {}, void 0 !== e.channel && (i.channel = e.channel), void 0 !== e.version && (i.version = e.version), void 0 !== e.tag && (i.tag = e.tag), void 0 !== e.name && (i.name = e.name), a = {}, [4, this.request({
                                path: "/v2/ota-version/{binaryType}".replace("{".concat("binaryType", "}"), encodeURIComponent(String(e.binaryType))),
                                schemaPath: "/v2/ota-version/{binaryType}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.H(r, function(e) {
                                return e.map(l)
                            })]
                    }
                })
            })
        }, t.prototype.v2OtaVersionBinaryTypeGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2OtaVersionBinaryTypeGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(n._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        a(t, e), t.prototype.v2AndroidBinariesVersionChannelsChannelNameGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.version || void 0 === e.version) throw new n.w("version", "Required parameter requestParameters.version was null or undefined when calling v2AndroidBinariesVersionChannelsChannelNameGet.");
                            if (null === e.channelName || void 0 === e.channelName) throw new n.w("channelName", "Required parameter requestParameters.channelName was null or undefined when calling v2AndroidBinariesVersionChannelsChannelNameGet.");
                            return i = {}, a = {}, [4, this.request({
                                path: "/v2/android-binaries/{version}/channels/{channelName}".replace("{".concat("version", "}"), encodeURIComponent(String(e.version))).replace("{".concat("channelName", "}"), encodeURIComponent(String(e.channelName))),
                                schemaPath: "/v2/android-binaries/{version}/channels/{channelName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.H(r, function(e) {
                                var t;
                                return null == e ? e : {
                                    moduleName: (0, n.u)(e, "moduleName") ? e.moduleName : void 0,
                                    libraryNames: (0, n.u)(e, "libraryNames") ? null == (t = e.libraryNames) ? t : {
                                        engine: (0, n.u)(t, "engine") ? t.engine : void 0
                                    } : void 0,
                                    supportsAndroidBinaries: (0, n.u)(e, "supportsAndroidBinaries") ? e.supportsAndroidBinaries : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v2AndroidBinariesVersionChannelsChannelNameGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2AndroidBinariesVersionChannelsChannelNameGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v2ClientVersionBinaryTypeChannelChannelNameGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.binaryType || void 0 === e.binaryType) throw new n.w("binaryType", "Required parameter requestParameters.binaryType was null or undefined when calling v2ClientVersionBinaryTypeChannelChannelNameGet.");
                            if (null === e.channelName || void 0 === e.channelName) throw new n.w("channelName", "Required parameter requestParameters.channelName was null or undefined when calling v2ClientVersionBinaryTypeChannelChannelNameGet.");
                            return i = {}, a = {}, [4, this.request({
                                path: "/v2/client-version/{binaryType}/channel/{channelName}".replace("{".concat("binaryType", "}"), encodeURIComponent(String(e.binaryType))).replace("{".concat("channelName", "}"), encodeURIComponent(String(e.channelName))),
                                schemaPath: "/v2/client-version/{binaryType}/channel/{channelName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.H(r, function(e) {
                                return c(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2ClientVersionBinaryTypeChannelChannelNameGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2ClientVersionBinaryTypeChannelChannelNameGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v2ClientVersionBinaryTypeGetRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var i, a, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.binaryType || void 0 === e.binaryType) throw new n.w("binaryType", "Required parameter requestParameters.binaryType was null or undefined when calling v2ClientVersionBinaryTypeGet.");
                            return i = {}, a = {}, [4, this.request({
                                path: "/v2/client-version/{binaryType}".replace("{".concat("binaryType", "}"), encodeURIComponent(String(e.binaryType))),
                                schemaPath: "/v2/client-version/{binaryType}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.H(r, function(e) {
                                return c(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2ClientVersionBinaryTypeGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2ClientVersionBinaryTypeGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(n._);
    let d = new p((0, e.i(272593).f)("clientsettings", "bedev1"));
    var h = ((t = {}).RCCService = "RCCService", t.WindowsPlayer = "WindowsPlayer", t.WindowsStudio = "WindowsStudio64", t.MacPlayer = "MacPlayer", t.MacStudio = "MacStudio", t.WindowsStudioCJV = "WindowsStudio64CJV", t.MacStudioCJV = "MacStudioCJV", t.WindowsPlayerCJV = "WindowsPlayerCJV", t.MacPlayerCJV = "MacPlayerCJV", t);
    e.s(["b", () => h, "s", 0, {
        getUserChannel: e => d.v2UserChannelGet({
            binaryType: e
        })
    }], 639102)
}, 991707, e => {
    "use strict";
    var t = e.i(805290),
        n = e.i(415858),
        i = function(e, t) {
            return (i = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function a(e, t, n, i) {
        return new(n || (n = Promise))(function(a, r) {
            function o(e) {
                try {
                    c(i.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    c(i.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function c(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, s)
            }
            c((i = i.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var n, i, a, r = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(c) {
                var l = [s, c];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, l[0] && (r = 0)), r;) try {
                    if (n = 1, i && (a = 2 & l[0] ? i.return : l[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, l[1])).done) return a;
                    switch (i = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                        case 0:
                        case 1:
                            a = l;
                            break;
                        case 4:
                            return r.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            r.label++, i = l[1], l = [0];
                            continue;
                        case 7:
                            l = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = r.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                r.label = l[1];
                                break
                            }
                            if (6 === l[0] && r.label < a[1]) {
                                r.label = a[1], a = l;
                                break
                            }
                            if (a && r.label < a[2]) {
                                r.label = a[2], r.ops.push(l);
                                break
                            }
                            a[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    l = t.call(e, r)
                } catch (e) {
                    l = [6, e], i = 0
                } finally {
                    n = a = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var o = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return function(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function n() {
                    this.constructor = e
                }
                i(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
            }(t, e), t.prototype.v1PlacesAssetIdSafetyStatusGetRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var i, a, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new n.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1PlacesAssetIdSafetyStatusGet.");
                                return i = {}, a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/places/{assetId}/safety-status".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/places/{assetId}/safety-status",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new n.H(o, function(e) {
                                    return null == e ? e : {
                                        placeSafetyStatus: (0, n.u)(e, "placeSafetyStatus") ? e.placeSafetyStatus : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesAssetIdSafetyStatusGet = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PlacesAssetIdSafetyStatusGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(n._),
        s = e.i(272593);
    let c = new class {
        getPlaceSafetyStatusById(e) {
            return this.placeSafetyStatusApi.v1PlacesAssetIdSafetyStatusGet({
                assetId: e
            })
        }
        constructor() {
            (0, t._)(this, "placeSafetyStatusApi", void 0);
            let e = (0, s.f)("content-safety", "bedev2");
            this.placeSafetyStatusApi = new o(e)
        }
    };
    e.s(["f", 0, c], 991707)
}, 413019, e => {
    "use strict";
    var t = e.i(521811),
        n = e.i(889311),
        i = e.i(441182);
    let a = {
            eventType: n.f.ViewComputeTab,
            context: t.f.Click
        },
        r = {
            eventType: n.f.SelectInviteTranslators,
            context: t.f.Click,
            additionalProperties: {
                Source: i.f.LocalizationTranslatorTab
            }
        };
    e.s(["C", 0, (e, a, r, o, s, c) => ({
        eventType: n.f.AddTranslationEntry,
        context: t.f.Click,
        additionalProperties: {
            Source: i.f.TranslationStringsTab,
            UserResponse: c,
            OriginalString: null != e ? e : "",
            Key: null != a ? a : "",
            Context: null != r ? r : "",
            Example: null != o ? o : "",
            UniverseId: null != s ? s : ""
        }
    }), "v", 0, (e, a, r) => ({
        eventType: n.f.ClearAutoCapturedTable,
        context: t.f.Click,
        additionalProperties: {
            Source: i.f.LocalizationSettingsTab,
            SelectedTimeFrame: null != e ? e : "",
            UniverseId: a,
            StatusCode: r
        }
    }), "n", 0, (e, a, r, o, s, c) => ({
        eventType: n.f.DownloadContributorReport,
        context: t.f.Click,
        additionalProperties: {
            Source: i.f.LocalizationContributionReport,
            UniverseId: e,
            StartDate: a.toISOString(),
            EndDate: r.toISOString(),
            ReportType: o,
            ReportTargetId: s,
            StatusCode: c
        }
    }), "U", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "";
        return {
            eventType: n.f.DownloadStudio,
            context: t.f.Click,
            additionalProperties: {
                logic: "directDownload",
                referralUrl: document.referrer,
                downloadCode: e
            }
        }
    }, "V", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "";
        return {
            eventType: n.f.DownloadStudio,
            context: t.f.Click,
            additionalProperties: {
                logic: "openOrDownload",
                referralUrl: document.referrer,
                downloadCode: e
            }
        }
    }, "Z", 0, (e, a) => ({
        eventType: n.f.FilterTranslationProductList,
        context: t.f.Click,
        additionalProperties: {
            Source: i.f.TranslationProductsTab,
            ProductType: a,
            UniverseId: null != e ? e : ""
        }
    }), "i", 0, (e, a, r, o) => ({
        eventType: n.f.InviteTranslatorsModel,
        context: t.f.Click,
        additionalProperties: {
            Source: i.f.LocalizationTranslatorTab,
            AssigneeId: null != e ? e : "",
            TranslatorType: null != r ? r : "",
            InviteOptions: o,
            UserResponse: a
        }
    }), "k", 0, (e, a, r) => ({
        eventType: n.f.PageTabSelected,
        context: t.f.Click,
        additionalProperties: {
            Source: i.f.LanguageTabSelectedRequest,
            UniverseId: null != e ? e : "",
            CurrentTab: null != a ? a : "",
            SelectedTab: null != r ? r : ""
        }
    }), "b", 0, e => ({
        eventType: n.f.NotificationsSettingsCategoryLoad,
        context: t.f.Load,
        additionalProperties: {
            category: e
        }
    }), "a", 0, () => ({
        eventType: "loadPage",
        context: t.f.Load,
        additionalProperties: {
            referralUrl: document.referrer
        }
    }), "o", 0, (e, n, a, r) => ({
        eventType: e,
        context: t.f.Click,
        additionalProperties: {
            Source: i.f.LocalizationSettingsTab,
            UniverseId: n,
            UserResponse: a,
            StatusCode: r
        }
    }), "Y", 0, (e, a, r, o) => ({
        eventType: n.f.ManageSupportedLanguage,
        context: t.f.Click,
        additionalProperties: {
            Source: i.f.LocalizationAddSupportedLanguage,
            LanguageCodes: e.toString(),
            UniverseId: a,
            UserResponse: r,
            IsAddLanguage: o ? "true" : "false"
        }
    }), "F", 0, (e, i) => ({
        eventType: n.f.NotificationsSettingsLeftNavClick,
        context: t.f.Click,
        additionalProperties: {
            from: e,
            to: i
        }
    }), "Q", 0, e => ({
        eventType: n.f.NotificationsSettingsCategoryCancelClick,
        context: t.f.Click,
        additionalProperties: {
            category: e
        }
    }), "j", 0, r, "x", 0, e => ({
        eventType: n.f.StudioStartAttempt,
        context: t.f.Click,
        additionalProperties: {
            task: e.toLowerCase(),
            referralUrl: document.referrer
        }
    }), "c", 0, function(e) {
        let i = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
        return {
            eventType: n.f.StudioStartSuccess,
            context: t.f.Click,
            additionalProperties: {
                task: e.toLowerCase(),
                referralUrl: document.referrer,
                hasAuthCode: String(i),
                authCodeHash: a
            }
        }
    }, "z", 0, (e, i, a, r) => ({
        eventType: n.f.SwitchOffAutomaticTranslation,
        context: t.f.Click,
        additionalProperties: {
            Source: e,
            LanguageCode: a,
            UniverseId: null != i ? i : "",
            UserResponse: r
        }
    }), "$", 0, (e, i, a) => ({
        eventType: n.f.SwitchOnAutomaticTranslation,
        context: t.f.Click,
        additionalProperties: {
            Source: e,
            LanguageCode: a,
            UniverseId: null != i ? i : ""
        }
    }), "s", 0, (e, a, r, o) => ({
        eventType: n.f.UpdateGameProductIcon,
        context: t.f.Click,
        additionalProperties: {
            Source: i.f.TranslationProductsTab,
            ProductType: e,
            ProductId: a,
            UserResponse: r,
            LanguageCode: o
        }
    }), "m", 0, (e, a, r, o, s) => ({
        eventType: n.f.UpdateGameProductTranslation,
        context: t.f.Click,
        additionalProperties: {
            Source: i.f.TranslationProductsTab,
            ProductType: e,
            ProductId: a,
            FieldType: r,
            Translation: null != o ? o : "",
            LanguageCode: s
        }
    }), "y", 0, (e, a, r, o, s) => ({
        eventType: n.f.UpdateUniverseIconAndThumbnail,
        context: t.f.Click,
        additionalProperties: {
            Source: i.f.TranslationInformationTab,
            UniverseId: null != e ? e : "",
            Field: a,
            LanguageCode: null != r ? r : "",
            UserResponse: o,
            StatusCode: s
        }
    }), "E", 0, (e, a, r, o, s) => ({
        eventType: n.f.UpdateUniverseInformation,
        context: t.f.Click,
        additionalProperties: {
            Source: i.f.TranslationInformationTab,
            Field: e,
            OriginalString: a,
            Translation: r,
            LanguageCode: s,
            UniverseId: null != o ? o : ""
        }
    }), "q", 0, a, "p", 0, (e, a) => ({
        eventType: n.f.ViewNotifications,
        context: t.f.Click,
        additionalProperties: {
            Source: i.f.LeftNavigation,
            userId: e ? "".concat(e) : "unknown",
            universeId: a ? "".concat(a) : "unknown"
        }
    })])
}, 521811, e => {
    "use strict";
    var t, n = ((t = n || {}).Click = "click", t.Hover = "hover", t.Load = "load", t);
    e.s(["f", 0, n])
}, 441182, e => {
    "use strict";
    var t, n = ((t = n || {}).LeftNavigation = "LeftNavigation", t.Landing = "Landing", t.LanguageTabSelectedRequest = "LanguageTabSelectedRequest", t.LocalizationAddSupportedLanguage = "LocalizationAddSupportedLanguage", t.LocalizationAutomaticQuotas = "LocalizationAutomaticQuotas", t.LocalizationAutoTranslationInfo = "LocalizationAutoTranslationInfo", t.LocalizationAutoTranslationStrings = "LocalizationAutoTranslationStrings", t.LocalizationAutoTranslationImage = "LocalizationAutoTranslationImage", t.LocalizationContributionReport = "LocalizationContributionReport", t.LocalizationSettingsTab = "LocalizationSettingsTab", t.LocalizationTranslatorTab = "LocalizationTranslatorTab", t.DevStats = "DevStats", t.DevStatsExportTab = "DevStats-Export", t.DocumentationLanguageSetting = "DocumentationLanguageSetting", t.AnalyticsOverview = "AnalyticsOverview", t.TranslationInformationTab = "TranslationInformationTab", t.TranslationProductsTab = "TranslationProductsTab", t.TranslationStringsTab = "TranslationStringsTab", t.NotificationContentOverview = "NotificationContentOverview", t.NotificationContentForm = "NotificationContentForm", t.NotificationAnalyticsOverview = "NotificationAnalyticsOverview", t);
    e.s(["f", 0, n])
}, 709337, e => {
    "use strict";
    var t = e.i(785517),
        n = e.i(643766);
    let i = (0, n.createContext)(null);
    e.s(["e", 0, e => {
        let {
            children: a,
            trackerClient: r
        } = e, o = (0, n.useMemo)(() => ({
            trackerClient: r
        }), [r]);
        return (0, t.jsx)(i.Provider, {
            value: o,
            children: a
        })
    }, "l", 0, function() {
        let e = (0, n.useContext)(i);
        if (null === e) throw Error("useEventTrackerProvider must be used within a EventTrackerProvider");
        return e
    }])
}, 877051, e => {
    "use strict";
    var t = e.i(785517),
        n = e.i(79187),
        i = e.i(148792),
        a = e.i(402976),
        r = e.i(8994),
        o = e.i(811314),
        s = e.i(433285),
        c = e.i(870999),
        l = e.i(446475),
        u = e.i(47277),
        p = e.i(775444),
        d = e.i(215680),
        h = e.i(828200),
        v = e.i(67243);
    let m = "https://www.".concat("roblox.com", "/info/terms"),
        f = (0, v.f)()(() => ({
            closeIcon: {
                position: "absolute",
                right: 8,
                top: 8
            },
            titleWrapper: {
                position: "relative"
            }
        }));
    e.s(["f", 0, e => {
        let {
            open: v,
            onClose: y
        } = e, {
            translate: g,
            translateHTML: w
        } = (0, n.A)(), {
            classes: S
        } = f();
        return (0, t.jsxs)(i.f, {
            open: v,
            onClose: y,
            maxWidth: "Medium",
            children: [(0, t.jsxs)(a.f, {
                className: S.titleWrapper,
                children: [(0, t.jsx)(d.f, {
                    className: S.closeIcon,
                    color: "secondary",
                    "aria-label": g("Action.Close"),
                    onClick: y,
                    size: "large",
                    children: (0, t.jsx)(h.f, {})
                }), (0, t.jsxs)(c.f, {
                    container: !0,
                    alignItems: "center",
                    gap: 2,
                    children: [(0, t.jsx)(p.f, {
                        color: "warning",
                        fontSize: "large"
                    }), (0, t.jsx)(u.f, {
                        variant: "h4",
                        children: g("Heading.ExperienceLocked")
                    })]
                })]
            }), (0, t.jsx)(r.f, {
                children: (0, t.jsx)(u.f, {
                    variant: "body1",
                    component: "div",
                    children: w("Description.ExperienceLockedTermsOfUse", [{
                        opening: "linkStart",
                        closing: "linkEnd",
                        content: e => (0, t.jsx)(l.f, {
                            href: m,
                            target: "_blank",
                            rel: "noopener noreferrer",
                            children: e
                        })
                    }])
                })
            }), (0, t.jsx)(o.f, {
                children: (0, t.jsx)(s.f, {
                    variant: "contained",
                    color: "primaryBrand",
                    size: "large",
                    onClick: y,
                    children: g("Action.OK")
                })
            })]
        })
    }])
}, 893949, e => {
    "use strict";
    var t = e.i(785517),
        n = e.i(643766),
        i = e.i(209754),
        a = e.i(79187),
        r = e.i(921394),
        o = e.i(581577),
        s = e.i(814975),
        c = e.i(639102),
        l = e.i(413019),
        u = e.i(709337),
        p = e.i(877051),
        d = e.i(392782),
        h = e.i(991707);
    async function v(e, t) {
        var n;
        let i = Number(e),
            a = Number(t);
        if (!Number.isFinite(i) || !Number.isFinite(a)) return !1;
        let r = null == (n = (await d.f.getDetails([i])).data) ? void 0 : n[0],
            o = null == r ? void 0 : r.rootPlaceId;
        if (null == o) return !1;
        let s = new Set([a, o]);
        return (await Promise.all([...s].map(async e => {
            var t;
            return (null == (t = (await h.f.getPlaceSafetyStatusById(e)).placeSafetyStatus) ? void 0 : t.userPlayabilityRestrictions) !== "RestrictedForAll"
        }))).every(Boolean)
    }
    var m = e.i(252842);
    let {
        getCurrentPlatform: f
    } = m.E, y = {
        light: "https://cdn.foundation.".concat("roblox.com", "/current/StudioLogo-Light.svg"),
        dark: "https://cdn.foundation.".concat("roblox.com", "/current/StudioLogo-Dark.svg")
    };
    e.s(["L", 0, function(e) {
        let {
            children: a
        } = e, {
            themeMode: s
        } = (0, r.g)(), l = (0, n.useMemo)(() => (0, o.q)({
            logoSrc: y[s],
            target: "global",
            environment: "production",
            fetchers: {
                userChannel: async () => (await c.s.getUserChannel(f() === m.o.macOS ? c.b.MacStudio : c.b.WindowsStudio)).channelName
            },
            errorHandler: e => (0, i.y)(e)
        }), [s]);
        return (0, t.jsx)(o.S, {
            resources: l,
            children: a
        })
    }, "U", 0, (e, i) => {
        let {
            user: r
        } = (0, s.f)(), {
            locale: c
        } = (0, a.z)(), {
            translate: d
        } = (0, a.A)(), {
            trackerClient: h
        } = (0, u.l)(), m = null == i ? void 0 : i.onDialogClose, y = {
            "Action.DownloadStudio": d("Action.DownloadStudio"),
            "Message.CheckingStudio": d("Message.CheckingStudio"),
            "Message.OpenStudioError": d("Message.OpenStudioError"),
            "Message.StartYourCreation": d("Message.StartYourCreation")
        }, {
            isCompatible: g,
            open: w,
            dialog: S,
            getStudioDownloadUrlAsync: b
        } = (0, o.T)(null != e ? e : y, {
            startAttempt: e => h.sendEvent((0, l.x)(e.task)),
            startSuccess: (e, t) => h.sendEvent((0, l.c)(e.task, null == t ? void 0 : t.hasAuthCode, null == t ? void 0 : t.authCodeHash)),
            download: (e, t) => {
                (null == t ? void 0 : t.getDownloadCode) ? t.getDownloadCode().then(e => {
                    void 0 !== e ? h.sendEvent((0, l.V)(e)) : h.sendEvent((0, l.V)())
                }).catch(() => {
                    h.sendEvent((0, l.V)())
                }): h.sendEvent((0, l.V)())
            },
            close: () => null == m ? void 0 : m()
        }), [N, C] = (0, n.useState)(!1), T = (0, n.useCallback)(() => {
            C(!1), null == m || m()
        }, [m]), A = (0, n.useCallback)((e, t) => w(e, t), [w]);
        return {
            isCompatible: g,
            open: (0, n.useCallback)(e => {
                let t = {
                    userId: null == r ? void 0 : r.id,
                    locale: null != c ? c : a.v.English,
                    protocolScheme: (f(), "roblox-studio"),
                    distributorType: "Global"
                };
                (async () => {
                    if (e.task === o.e.EditPlace || e.task === o.e.EditPlaceRevision) try {
                        if (!await v(e.universeId, e.placeId)) return void C(!0)
                    } catch (e) {}
                    A(e, t)
                })().catch(() => {})
            }, [null == r ? void 0 : r.id, c, A]),
            dialog: (0, t.jsxs)(t.Fragment, {
                children: [S, (0, t.jsx)(p.f, {
                    open: N,
                    onClose: T
                })]
            }),
            getStudioDownloadUrlAsync: b
        }
    }], 893949)
}]);

//# debugId=0fbd3fe2-c815-b050-226f-1df8462f7b1d
//# sourceMappingURL=3l-k-e26n4r5i.js.map