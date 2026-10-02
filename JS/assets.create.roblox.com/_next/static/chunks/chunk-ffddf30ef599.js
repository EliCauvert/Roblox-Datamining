;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "fd8132aa-a2bc-3f85-6720-fd9ab8ee6dac")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 639102, e => {
    "use strict";
    var t, n = e.i(677753),
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
                    l(i.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    l(i.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, s)
            }
            l((i = i.apply(e, t || [])).next())
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
            return function(l) {
                var c = [s, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, c[0] && (r = 0)), r;) try {
                    if (n = 1, i && (a = 2 & c[0] ? i.return : c[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, c[1])).done) return a;
                    switch (i = 0, a && (c = [2 & c[0], a.value]), c[0]) {
                        case 0:
                        case 1:
                            a = c;
                            break;
                        case 4:
                            return r.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            r.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = r.trys).length > 0 && a[a.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === c[0] && (!a || c[1] > a[0] && c[1] < a[3])) {
                                r.label = c[1];
                                break
                            }
                            if (6 === c[0] && r.label < a[1]) {
                                r.label = a[1], a = c;
                                break
                            }
                            if (a && r.label < a[2]) {
                                r.label = a[2], r.ops.push(c);
                                break
                            }
                            a[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    c = t.call(e, r)
                } catch (e) {
                    c = [6, e], i = 0
                } finally {
                    n = a = 0
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
    var s = n.BaseAPI;

    function l() {
        return null !== s && s.apply(this, arguments) || this
    }

    function c(e, t) {
        return null == e ? e : {
            applicationSettings: (0, n.exists)(e, "applicationSettings") ? e.applicationSettings : void 0
        }
    }
    a(l, s), l.prototype.v1InstallerCdnsGetRaw = function(e) {
        return r(this, void 0, void 0, function() {
            var t, i, a;
            return o(this, function(r) {
                switch (r.label) {
                    case 0:
                        return t = {}, i = {}, [4, this.request({
                            path: "/v1/installer-cdns",
                            schemaPath: "/v1/installer-cdns",
                            method: "GET",
                            headers: i,
                            query: t
                        }, e)];
                    case 1:
                        return a = r.sent(), [2, new n.VoidApiResponse(a)]
                }
            })
        })
    }, l.prototype.v1InstallerCdnsGet = function(e) {
        return r(this, void 0, void 0, function() {
            return o(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.v1InstallerCdnsGetRaw(e)];
                    case 1:
                        return t.sent(), [2]
                }
            })
        })
    };
    var u = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(t, e), t.prototype.v1SettingsApplicationGetRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var i, a, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.applicationName || void 0 === e.applicationName) throw new n.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v1SettingsApplicationGet.");
                                return i = {}, void 0 !== e.applicationName && (i.applicationName = e.applicationName), a = {}, void 0 !== e.trueClientIP && null !== e.trueClientIP && (a["True-Client-IP"] = String(e.trueClientIP)), [4, this.request({
                                    path: "/v1/settings/application",
                                    schemaPath: "/v1/settings/application",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1SettingsApplicationGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1SettingsApplicationGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1SettingsSecuredSettingsGetRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var i, a, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.applicationName || void 0 === e.applicationName) throw new n.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v1SettingsSecuredSettingsGet.");
                                if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new n.RequiredError("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v1SettingsSecuredSettingsGet.");
                                return i = {}, void 0 !== e.applicationName && (i.applicationName = e.applicationName), a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/settings/secured-settings",
                                    schemaPath: "/v1/settings/secured-settings",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1SettingsSecuredSettingsGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1SettingsSecuredSettingsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1SettingsSecuredSettingsInternalGetRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var i, a, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.applicationName || void 0 === e.applicationName) throw new n.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v1SettingsSecuredSettingsInternalGet.");
                                if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new n.RequiredError("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v1SettingsSecuredSettingsInternalGet.");
                                return i = {}, void 0 !== e.applicationName && (i.applicationName = e.applicationName), a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/settings/secured-settings-internal",
                                    schemaPath: "/v1/settings/secured-settings-internal",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1SettingsSecuredSettingsInternalGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1SettingsSecuredSettingsInternalGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(n.BaseAPI),
        p = n.BaseAPI;

    function d() {
        return null !== p && p.apply(this, arguments) || this
    }
    a(d, p), d.prototype.v1ClientVersionBinaryTypeGetRaw = function(e, t) {
        return r(this, void 0, void 0, function() {
            var i, a, r;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        if (null === e.binaryType || void 0 === e.binaryType) throw new n.RequiredError("binaryType", "Required parameter requestParameters.binaryType was null or undefined when calling v1ClientVersionBinaryTypeGet.");
                        return i = {}, a = {}, [4, this.request({
                            path: "/v1/client-version/{binaryType}".replace("{".concat("binaryType", "}"), encodeURIComponent(String(e.binaryType))),
                            schemaPath: "/v1/client-version/{binaryType}",
                            method: "GET",
                            headers: a,
                            query: i
                        }, t)];
                    case 1:
                        return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                            return null == e ? e : {
                                version: (0, n.exists)(e, "version") ? e.version : void 0,
                                clientVersionUpload: (0, n.exists)(e, "clientVersionUpload") ? e.clientVersionUpload : void 0,
                                bootstrapperVersion: (0, n.exists)(e, "bootstrapperVersion") ? e.bootstrapperVersion : void 0,
                                nextClientVersionUpload: (0, n.exists)(e, "nextClientVersionUpload") ? e.nextClientVersionUpload : void 0,
                                nextClientVersion: (0, n.exists)(e, "nextClientVersion") ? e.nextClientVersion : void 0
                            }
                        })]
                }
            })
        })
    }, d.prototype.v1ClientVersionBinaryTypeGet = function(e, t) {
        return r(this, void 0, void 0, function() {
            return o(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.v1ClientVersionBinaryTypeGetRaw(e, t)];
                    case 1:
                        return [4, n.sent().value()];
                    case 2:
                        return [2, n.sent()]
                }
            })
        })
    }, d.prototype.v1MobileClientVersionGetRaw = function(e, t) {
        return r(this, void 0, void 0, function() {
            var i, a, r;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        if (null === e.appVersion || void 0 === e.appVersion) throw new n.RequiredError("appVersion", "Required parameter requestParameters.appVersion was null or undefined when calling v1MobileClientVersionGet.");
                        return i = {}, void 0 !== e.appVersion && (i.appVersion = e.appVersion), a = {}, [4, this.request({
                            path: "/v1/mobile-client-version",
                            schemaPath: "/v1/mobile-client-version",
                            method: "GET",
                            headers: a,
                            query: i
                        }, t)];
                    case 1:
                        return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                            var t;
                            return null == e ? e : {
                                activeVersion: (0, n.exists)(e, "activeVersion") ? e.activeVersion : void 0,
                                upgradeSource: (0, n.exists)(e, "upgradeSource") ? e.upgradeSource : void 0,
                                mD5Sum: (0, n.exists)(e, "MD5Sum") ? e.MD5Sum : void 0,
                                data: (0, n.exists)(e, "data") ? null == (t = e.data) ? t : {
                                    upgradeAction: (0, n.exists)(t, "UpgradeAction") ? t.UpgradeAction : void 0
                                } : void 0
                            }
                        })]
                }
            })
        })
    }, d.prototype.v1MobileClientVersionGet = function(e, t) {
        return r(this, void 0, void 0, function() {
            return o(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.v1MobileClientVersionGetRaw(e, t)];
                    case 1:
                        return [4, n.sent().value()];
                    case 2:
                        return [2, n.sent()]
                }
            })
        })
    };

    function v(e, t) {
        return null == e ? e : {
            applicationSettings: (0, n.exists)(e, "applicationSettings") ? e.applicationSettings : void 0
        }
    }

    function h(e, t) {
        return null == e ? e : {
            version: (0, n.exists)(e, "version") ? e.version : void 0,
            clientVersionUpload: (0, n.exists)(e, "clientVersionUpload") ? e.clientVersionUpload : void 0,
            bootstrapperVersion: (0, n.exists)(e, "bootstrapperVersion") ? e.bootstrapperVersion : void 0,
            nextClientVersionUpload: (0, n.exists)(e, "nextClientVersionUpload") ? e.nextClientVersionUpload : void 0,
            nextClientVersion: (0, n.exists)(e, "nextClientVersion") ? e.nextClientVersion : void 0
        }
    }

    function m(e) {
        var t;
        return null == (t = e) ? t : {
            name: (0, n.exists)(t, "name") ? t.name : void 0,
            version: (0, n.exists)(t, "version") ? t.version : void 0,
            downloadUrl: (0, n.exists)(t, "downloadUrl") ? t.downloadUrl : void 0,
            isStandalone: (0, n.exists)(t, "isStandalone") ? t.isStandalone : void 0,
            assetId: (0, n.exists)(t, "assetId") ? t.assetId : void 0,
            assetVersion: (0, n.exists)(t, "assetVersion") ? t.assetVersion : void 0,
            maxAppVersion: (0, n.exists)(t, "maxAppVersion") ? t.maxAppVersion : void 0,
            tryoutName: (0, n.exists)(t, "tryoutName") ? t.tryoutName : void 0,
            localAssetURI: (0, n.exists)(t, "localAssetURI") ? t.localAssetURI : void 0,
            isForcedUpdate: (0, n.exists)(t, "isForcedUpdate") ? t.isForcedUpdate : void 0,
            appStorageResetId: (0, n.exists)(t, "appStorageResetId") ? t.appStorageResetId : void 0,
            isDevelopmentConfig: (0, n.exists)(t, "isDevelopmentConfig") ? t.isDevelopmentConfig : void 0,
            assetsManifest: (0, n.exists)(t, "assetsManifest") ? t.assetsManifest : void 0,
            versionV2: (0, n.exists)(t, "versionV2") ? t.versionV2 : void 0
        }
    }

    function f(e, t) {
        var i;
        return null == e ? e : {
            channelName: (0, n.exists)(e, "channelName") ? e.channelName : void 0,
            channelAssignmentType: (0, n.exists)(e, "channelAssignmentType") ? e.channelAssignmentType : void 0,
            token: (0, n.exists)(e, "token") ? e.token : void 0,
            program: (0, n.exists)(e, "program") ? null == (i = e.program) ? i : {
                name: (0, n.exists)(i, "name") ? i.name : void 0,
                id: (0, n.exists)(i, "id") ? i.id : void 0
            } : void 0,
            isFlagOnly: (0, n.exists)(e, "isFlagOnly") ? e.isFlagOnly : void 0
        }
    }
    var g = function(e) {
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
                            return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                return f(e)
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
                            if (null === e.userId || void 0 === e.userId) throw new n.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v2UserChannelInternalGet.");
                            return i = {}, void 0 !== e.userId && (i.userId = e.userId), void 0 !== e.binaryType && (i.binaryType = e.binaryType), void 0 !== e.isLuobuUser && (i.isLuobuUser = e.isLuobuUser), void 0 !== e.isPcVngUser && (i.isPcVngUser = e.isPcVngUser), a = {}, [4, this.request({
                                path: "/v2/user-channel-internal",
                                schemaPath: "/v2/user-channel-internal",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                return f(e)
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
                            if (null === e.userId || void 0 === e.userId) throw new n.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v2UserPublicChannelInternalGet.");
                            if (null === e.binaryType || void 0 === e.binaryType) throw new n.RequiredError("binaryType", "Required parameter requestParameters.binaryType was null or undefined when calling v2UserPublicChannelInternalGet.");
                            return i = {}, void 0 !== e.userId && (i.userId = e.userId), void 0 !== e.binaryType && (i.binaryType = e.binaryType), a = {}, [4, this.request({
                                path: "/v2/user-public-channel-internal",
                                schemaPath: "/v2/user-public-channel-internal",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                return f(e)
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
    }(n.BaseAPI);
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
                            if (null === e.dictionarySha256 || void 0 === e.dictionarySha256) throw new n.RequiredError("dictionarySha256", "Required parameter requestParameters.dictionarySha256 was null or undefined when calling v2CompressionDictionariesDictionarySha256Get.");
                            return i = {}, a = {}, [4, this.request({
                                path: "/v2/compression-dictionaries/{dictionarySha256}".replace("{".concat("dictionarySha256", "}"), encodeURIComponent(String(e.dictionarySha256))),
                                schemaPath: "/v2/compression-dictionaries/{dictionarySha256}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.VoidApiResponse(r)]
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
                            return a = r.sent(), [2, new n.VoidApiResponse(a)]
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
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsApplicationApplicationNameBucketBucketNameGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new n.RequiredError("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsApplicationApplicationNameBucketBucketNameGet.");
                            return i = {}, a = {}, void 0 !== e.trueClientIP && null !== e.trueClientIP && (a["True-Client-IP"] = String(e.trueClientIP)), [4, this.request({
                                path: "/v2/settings/application/{applicationName}/bucket/{bucketName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings/application/{applicationName}/bucket/{bucketName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                return v(e)
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
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsApplicationApplicationNameGet.");
                            return i = {}, a = {}, void 0 !== e.trueClientIP && null !== e.trueClientIP && (a["True-Client-IP"] = String(e.trueClientIP)), [4, this.request({
                                path: "/v2/settings/application/{applicationName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))),
                                schemaPath: "/v2/settings/application/{applicationName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                return v(e)
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
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGet.");
                            if (null === e.dictionarySha256 || void 0 === e.dictionarySha256) throw new n.RequiredError("dictionarySha256", "Required parameter requestParameters.dictionarySha256 was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new n.RequiredError("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGet.");
                            return i = {}, a = {}, [4, this.request({
                                path: "/v2/settings-compressed/application/{applicationName}/bucket/{bucketName}/{dictionarySha256}.dcz".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("dictionarySha256", "}"), encodeURIComponent(String(e.dictionarySha256))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings-compressed/application/{applicationName}/bucket/{bucketName}/{dictionarySha256}.dcz",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.VoidApiResponse(r)]
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
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameZstGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new n.RequiredError("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameZstGet.");
                            return i = {}, a = {}, [4, this.request({
                                path: "/v2/settings-compressed/application/{applicationName}/bucket/{bucketName}.zst".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings-compressed/application/{applicationName}/bucket/{bucketName}.zst",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.VoidApiResponse(r)]
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
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameDictionarySha256DczGet.");
                            if (null === e.dictionarySha256 || void 0 === e.dictionarySha256) throw new n.RequiredError("dictionarySha256", "Required parameter requestParameters.dictionarySha256 was null or undefined when calling v2SettingsCompressedApplicationApplicationNameDictionarySha256DczGet.");
                            return i = {}, a = {}, void 0 !== e.trueClientIP && null !== e.trueClientIP && (a["True-Client-IP"] = String(e.trueClientIP)), [4, this.request({
                                path: "/v2/settings-compressed/application/{applicationName}/{dictionarySha256}.dcz".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("dictionarySha256", "}"), encodeURIComponent(String(e.dictionarySha256))),
                                schemaPath: "/v2/settings-compressed/application/{applicationName}/{dictionarySha256}.dcz",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.VoidApiResponse(r)]
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
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameZstGet.");
                            return i = {}, a = {}, void 0 !== e.trueClientIP && null !== e.trueClientIP && (a["True-Client-IP"] = String(e.trueClientIP)), [4, this.request({
                                path: "/v2/settings-compressed/application/{applicationName}.zst".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))),
                                schemaPath: "/v2/settings-compressed/application/{applicationName}.zst",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.VoidApiResponse(r)]
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
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsSecuredSettingsApplicationNameBucketBucketNameGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new n.RequiredError("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsSecuredSettingsApplicationNameBucketBucketNameGet.");
                            if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new n.RequiredError("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v2SettingsSecuredSettingsApplicationNameBucketBucketNameGet.");
                            return i = {}, a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/settings/secured-settings/{applicationName}/bucket/{bucketName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings/secured-settings/{applicationName}/bucket/{bucketName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                return v(e)
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
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsSecuredSettingsApplicationNameGet.");
                            if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new n.RequiredError("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v2SettingsSecuredSettingsApplicationNameGet.");
                            return i = {}, a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/settings/secured-settings/{applicationName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))),
                                schemaPath: "/v2/settings/secured-settings/{applicationName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                return v(e)
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
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new n.RequiredError("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGet.");
                            if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new n.RequiredError("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGet.");
                            return i = {}, a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/settings/secured-settings-internal/{applicationName}/bucket/{bucketName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings/secured-settings-internal/{applicationName}/bucket/{bucketName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                return v(e)
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
                            if (null === e.applicationName || void 0 === e.applicationName) throw new n.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameGet.");
                            if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new n.RequiredError("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameGet.");
                            return i = {}, a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/settings/secured-settings-internal/{applicationName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))),
                                schemaPath: "/v2/settings/secured-settings-internal/{applicationName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                return v(e)
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
    })(n.BaseAPI),
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
                            if (null === e.binaryType || void 0 === e.binaryType) throw new n.RequiredError("binaryType", "Required parameter requestParameters.binaryType was null or undefined when calling v2OtaVersionBinaryTypeGet.");
                            return i = {}, void 0 !== e.channel && (i.channel = e.channel), void 0 !== e.version && (i.version = e.version), void 0 !== e.tag && (i.tag = e.tag), void 0 !== e.name && (i.name = e.name), a = {}, [4, this.request({
                                path: "/v2/ota-version/{binaryType}".replace("{".concat("binaryType", "}"), encodeURIComponent(String(e.binaryType))),
                                schemaPath: "/v2/ota-version/{binaryType}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                return e.map(m)
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
    }(n.BaseAPI),
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
                            if (null === e.version || void 0 === e.version) throw new n.RequiredError("version", "Required parameter requestParameters.version was null or undefined when calling v2AndroidBinariesVersionChannelsChannelNameGet.");
                            if (null === e.channelName || void 0 === e.channelName) throw new n.RequiredError("channelName", "Required parameter requestParameters.channelName was null or undefined when calling v2AndroidBinariesVersionChannelsChannelNameGet.");
                            return i = {}, a = {}, [4, this.request({
                                path: "/v2/android-binaries/{version}/channels/{channelName}".replace("{".concat("version", "}"), encodeURIComponent(String(e.version))).replace("{".concat("channelName", "}"), encodeURIComponent(String(e.channelName))),
                                schemaPath: "/v2/android-binaries/{version}/channels/{channelName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                var t;
                                return null == e ? e : {
                                    moduleName: (0, n.exists)(e, "moduleName") ? e.moduleName : void 0,
                                    libraryNames: (0, n.exists)(e, "libraryNames") ? null == (t = e.libraryNames) ? t : {
                                        engine: (0, n.exists)(t, "engine") ? t.engine : void 0
                                    } : void 0,
                                    supportsAndroidBinaries: (0, n.exists)(e, "supportsAndroidBinaries") ? e.supportsAndroidBinaries : void 0
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
                            if (null === e.binaryType || void 0 === e.binaryType) throw new n.RequiredError("binaryType", "Required parameter requestParameters.binaryType was null or undefined when calling v2ClientVersionBinaryTypeChannelChannelNameGet.");
                            if (null === e.channelName || void 0 === e.channelName) throw new n.RequiredError("channelName", "Required parameter requestParameters.channelName was null or undefined when calling v2ClientVersionBinaryTypeChannelChannelNameGet.");
                            return i = {}, a = {}, [4, this.request({
                                path: "/v2/client-version/{binaryType}/channel/{channelName}".replace("{".concat("binaryType", "}"), encodeURIComponent(String(e.binaryType))).replace("{".concat("channelName", "}"), encodeURIComponent(String(e.channelName))),
                                schemaPath: "/v2/client-version/{binaryType}/channel/{channelName}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                return h(e)
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
                            if (null === e.binaryType || void 0 === e.binaryType) throw new n.RequiredError("binaryType", "Required parameter requestParameters.binaryType was null or undefined when calling v2ClientVersionBinaryTypeGet.");
                            return i = {}, a = {}, [4, this.request({
                                path: "/v2/client-version/{binaryType}".replace("{".concat("binaryType", "}"), encodeURIComponent(String(e.binaryType))),
                                schemaPath: "/v2/client-version/{binaryType}",
                                method: "GET",
                                headers: a,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                return h(e)
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
    }(n.BaseAPI);
    var y = e.i(272593);
    let S = new u((0, y.createClientConfiguration)("clientsettingscdn", "bedev1", {
            credentials: "omit"
        })),
        w = new g((0, y.createClientConfiguration)("clientsettings", "bedev1"));
    var b = ((t = {}).RCCService = "RCCService", t.WindowsPlayer = "WindowsPlayer", t.WindowsStudio = "WindowsStudio64", t.MacPlayer = "MacPlayer", t.MacStudio = "MacStudio", t.WindowsStudioCJV = "WindowsStudio64CJV", t.MacStudioCJV = "MacStudioCJV", t.WindowsPlayerCJV = "WindowsPlayerCJV", t.MacPlayerCJV = "MacPlayerCJV", t);
    e.s(["EClientBinaryType", () => b, "channelClient", 0, {
        getUserChannel: e => w.v2UserChannelGet({
            binaryType: e
        })
    }, "settingsClient", 0, {
        getApplicationSettings: () => S.v1SettingsApplicationGet({
            applicationName: "CreatorDashboard"
        })
    }], 639102)
}, 991707, e => {
    "use strict";
    var t = e.i(721281),
        n = e.i(677753),
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
                    l(i.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    l(i.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, s)
            }
            l((i = i.apply(e, t || [])).next())
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
            return function(l) {
                var c = [s, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, c[0] && (r = 0)), r;) try {
                    if (n = 1, i && (a = 2 & c[0] ? i.return : c[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, c[1])).done) return a;
                    switch (i = 0, a && (c = [2 & c[0], a.value]), c[0]) {
                        case 0:
                        case 1:
                            a = c;
                            break;
                        case 4:
                            return r.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            r.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = r.trys).length > 0 && a[a.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === c[0] && (!a || c[1] > a[0] && c[1] < a[3])) {
                                r.label = c[1];
                                break
                            }
                            if (6 === c[0] && r.label < a[1]) {
                                r.label = a[1], a = c;
                                break
                            }
                            if (a && r.label < a[2]) {
                                r.label = a[2], r.ops.push(c);
                                break
                            }
                            a[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    c = t.call(e, r)
                } catch (e) {
                    c = [6, e], i = 0
                } finally {
                    n = a = 0
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
                                if (null === e.assetId || void 0 === e.assetId) throw new n.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1PlacesAssetIdSafetyStatusGet.");
                                return i = {}, a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/places/{assetId}/safety-status".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/places/{assetId}/safety-status",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new n.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        placeSafetyStatus: (0, n.exists)(e, "placeSafetyStatus") ? e.placeSafetyStatus : void 0
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
        }(n.BaseAPI),
        s = e.i(272593);
    let l = new class {
        getPlaceSafetyStatusById(e) {
            return this.placeSafetyStatusApi.v1PlacesAssetIdSafetyStatusGet({
                assetId: e
            })
        }
        constructor() {
            (0, t._)(this, "placeSafetyStatusApi", void 0);
            const e = (0, s.createClientConfiguration)("content-safety", "bedev2");
            this.placeSafetyStatusApi = new o(e)
        }
    };
    e.s(["default", 0, l], 991707)
}, 413019, e => {
    "use strict";
    var t = e.i(521811),
        n = e.i(889311),
        i = e.i(441182);
    let a = {
            eventType: n.default.ViewComputeTab,
            context: t.default.Click
        },
        r = {
            eventType: n.default.SelectInviteTranslators,
            context: t.default.Click,
            additionalProperties: {
                Source: i.default.LocalizationTranslatorTab
            }
        };
    e.s(["addEntryEventModel", 0, (e, a, r, o, s, l) => ({
        eventType: n.default.AddTranslationEntry,
        context: t.default.Click,
        additionalProperties: {
            Source: i.default.TranslationStringsTab,
            UserResponse: l,
            OriginalString: null != e ? e : "",
            Key: null != a ? a : "",
            Context: null != r ? r : "",
            Example: null != o ? o : "",
            UniverseId: null != s ? s : ""
        }
    }), "clearAutoCapturedTableEventModel", 0, (e, a, r) => ({
        eventType: n.default.ClearAutoCapturedTable,
        context: t.default.Click,
        additionalProperties: {
            Source: i.default.LocalizationSettingsTab,
            SelectedTimeFrame: null != e ? e : "",
            UniverseId: a,
            StatusCode: r
        }
    }), "downloadContributorReportEventModel", 0, (e, a, r, o, s, l) => ({
        eventType: n.default.DownloadContributorReport,
        context: t.default.Click,
        additionalProperties: {
            Source: i.default.LocalizationContributionReport,
            UniverseId: e,
            StartDate: a.toISOString(),
            EndDate: r.toISOString(),
            ReportType: o,
            ReportTargetId: s,
            StatusCode: l
        }
    }), "downloadStudioDirectDownloadEventModel", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "";
        return {
            eventType: n.default.DownloadStudio,
            context: t.default.Click,
            additionalProperties: {
                logic: "directDownload",
                referralUrl: document.referrer,
                downloadCode: e
            }
        }
    }, "downloadStudioOpenOrDownloadEventModel", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "";
        return {
            eventType: n.default.DownloadStudio,
            context: t.default.Click,
            additionalProperties: {
                logic: "openOrDownload",
                referralUrl: document.referrer,
                downloadCode: e
            }
        }
    }, "filterProductListEventModel", 0, (e, a) => ({
        eventType: n.default.FilterTranslationProductList,
        context: t.default.Click,
        additionalProperties: {
            Source: i.default.TranslationProductsTab,
            ProductType: a,
            UniverseId: null != e ? e : ""
        }
    }), "inviteTranslatorEventModel", 0, (e, a, r, o) => ({
        eventType: n.default.InviteTranslatorsModel,
        context: t.default.Click,
        additionalProperties: {
            Source: i.default.LocalizationTranslatorTab,
            AssigneeId: null != e ? e : "",
            TranslatorType: null != r ? r : "",
            InviteOptions: o,
            UserResponse: a
        }
    }), "languageTabSelectedRequestEventModel", 0, (e, a, r) => ({
        eventType: n.default.PageTabSelected,
        context: t.default.Click,
        additionalProperties: {
            Source: i.default.LanguageTabSelectedRequest,
            UniverseId: null != e ? e : "",
            CurrentTab: null != a ? a : "",
            SelectedTab: null != r ? r : ""
        }
    }), "loadNotificationCategoryEventModel", 0, e => ({
        eventType: n.default.NotificationsSettingsCategoryLoad,
        context: t.default.Load,
        additionalProperties: {
            category: e
        }
    }), "loadPageEventModel", 0, () => ({
        eventType: "loadPage",
        context: t.default.Load,
        additionalProperties: {
            referralUrl: document.referrer
        }
    }), "localizationSettingsToggledEventModel", 0, (e, n, a, r) => ({
        eventType: e,
        context: t.default.Click,
        additionalProperties: {
            Source: i.default.LocalizationSettingsTab,
            UniverseId: n,
            UserResponse: a,
            StatusCode: r
        }
    }), "manageSupportedLanguageEventModel", 0, (e, a, r, o) => ({
        eventType: n.default.ManageSupportedLanguage,
        context: t.default.Click,
        additionalProperties: {
            Source: i.default.LocalizationAddSupportedLanguage,
            LanguageCodes: e.toString(),
            UniverseId: a,
            UserResponse: r,
            IsAddLanguage: o ? "true" : "false"
        }
    }), "notificationSettingsLeftNavEventModel", 0, (e, i) => ({
        eventType: n.default.NotificationsSettingsLeftNavClick,
        context: t.default.Click,
        additionalProperties: {
            from: e,
            to: i
        }
    }), "notificationsSettingsCategoryCancelEventModel", 0, e => ({
        eventType: n.default.NotificationsSettingsCategoryCancelClick,
        context: t.default.Click,
        additionalProperties: {
            category: e
        }
    }), "selectInviteTranslatorsEventModel", 0, r, "studioStartAttemptEventModel", 0, e => ({
        eventType: n.default.StudioStartAttempt,
        context: t.default.Click,
        additionalProperties: {
            task: e.toLowerCase(),
            referralUrl: document.referrer
        }
    }), "studioStartSuccessEventModel", 0, function(e) {
        let i = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
        return {
            eventType: n.default.StudioStartSuccess,
            context: t.default.Click,
            additionalProperties: {
                task: e.toLowerCase(),
                referralUrl: document.referrer,
                hasAuthCode: String(i),
                authCodeHash: a
            }
        }
    }, "switchOffAutomaticTranslationEventModel", 0, (e, i, a, r) => ({
        eventType: n.default.SwitchOffAutomaticTranslation,
        context: t.default.Click,
        additionalProperties: {
            Source: e,
            LanguageCode: a,
            UniverseId: null != i ? i : "",
            UserResponse: r
        }
    }), "switchOnAutomaticTranslationEventModel", 0, (e, i, a) => ({
        eventType: n.default.SwitchOnAutomaticTranslation,
        context: t.default.Click,
        additionalProperties: {
            Source: e,
            LanguageCode: a,
            UniverseId: null != i ? i : ""
        }
    }), "updateGameProductIconEventModel", 0, (e, a, r, o) => ({
        eventType: n.default.UpdateGameProductIcon,
        context: t.default.Click,
        additionalProperties: {
            Source: i.default.TranslationProductsTab,
            ProductType: e,
            ProductId: a,
            UserResponse: r,
            LanguageCode: o
        }
    }), "updateGameProductTranslationEventModel", 0, (e, a, r, o, s) => ({
        eventType: n.default.UpdateGameProductTranslation,
        context: t.default.Click,
        additionalProperties: {
            Source: i.default.TranslationProductsTab,
            ProductType: e,
            ProductId: a,
            FieldType: r,
            Translation: null != o ? o : "",
            LanguageCode: s
        }
    }), "updateUniverseIconAndThumbnailEventModel", 0, (e, a, r, o, s) => ({
        eventType: n.default.UpdateUniverseIconAndThumbnail,
        context: t.default.Click,
        additionalProperties: {
            Source: i.default.TranslationInformationTab,
            UniverseId: null != e ? e : "",
            Field: a,
            LanguageCode: null != r ? r : "",
            UserResponse: o,
            StatusCode: s
        }
    }), "updateUniverseInformationEventModel", 0, (e, a, r, o, s) => ({
        eventType: n.default.UpdateUniverseInformation,
        context: t.default.Click,
        additionalProperties: {
            Source: i.default.TranslationInformationTab,
            Field: e,
            OriginalString: a,
            Translation: r,
            LanguageCode: s,
            UniverseId: null != o ? o : ""
        }
    }), "viewComputeTab", 0, a, "viewNotificationsEventMode", 0, (e, a) => ({
        eventType: n.default.ViewNotifications,
        context: t.default.Click,
        additionalProperties: {
            Source: i.default.LeftNavigation,
            userId: e ? "".concat(e) : "unknown",
            universeId: a ? "".concat(a) : "unknown"
        }
    })])
}, 521811, e => {
    "use strict";
    var t, n = ((t = n || {}).Click = "click", t.Hover = "hover", t.Load = "load", t);
    e.s(["default", 0, n])
}, 441182, e => {
    "use strict";
    var t, n = ((t = n || {}).LeftNavigation = "LeftNavigation", t.Landing = "Landing", t.LanguageTabSelectedRequest = "LanguageTabSelectedRequest", t.LocalizationAddSupportedLanguage = "LocalizationAddSupportedLanguage", t.LocalizationAutomaticQuotas = "LocalizationAutomaticQuotas", t.LocalizationAutoTranslationInfo = "LocalizationAutoTranslationInfo", t.LocalizationAutoTranslationStrings = "LocalizationAutoTranslationStrings", t.LocalizationAutoTranslationImage = "LocalizationAutoTranslationImage", t.LocalizationContributionReport = "LocalizationContributionReport", t.LocalizationSettingsTab = "LocalizationSettingsTab", t.LocalizationTranslatorTab = "LocalizationTranslatorTab", t.DevStats = "DevStats", t.DevStatsExportTab = "DevStats-Export", t.DocumentationLanguageSetting = "DocumentationLanguageSetting", t.AnalyticsOverview = "AnalyticsOverview", t.TranslationInformationTab = "TranslationInformationTab", t.TranslationProductsTab = "TranslationProductsTab", t.TranslationStringsTab = "TranslationStringsTab", t.NotificationContentOverview = "NotificationContentOverview", t.NotificationContentForm = "NotificationContentForm", t.NotificationAnalyticsOverview = "NotificationAnalyticsOverview", t);
    e.s(["default", 0, n])
}, 709337, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340);
    let i = (0, n.createContext)(null);
    e.s(["EventTrackerProvider", 0, e => {
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
    }, "useEventTrackerProvider", 0, function() {
        let e = (0, n.useContext)(i);
        if (null === e) throw Error("useEventTrackerProvider must be used within a EventTrackerProvider");
        return e
    }])
}, 877051, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(79187),
        i = e.i(226519),
        a = e.i(102725),
        r = e.i(668539),
        o = e.i(976457),
        s = e.i(748893),
        l = e.i(345886),
        c = e.i(686762),
        u = e.i(623983),
        p = e.i(752756),
        d = e.i(649114),
        v = e.i(15645),
        h = e.i(697973);
    let m = "https://www.".concat("roblox.com", "/info/terms"),
        f = (0, h.makeStyles)()(() => ({
            closeIcon: {
                position: "absolute",
                right: 8,
                top: 8
            },
            titleWrapper: {
                position: "relative"
            }
        }));
    e.s(["default", 0, e => {
        let {
            open: h,
            onClose: g
        } = e, {
            translate: y,
            translateHTML: S
        } = (0, n.useTranslation)(), {
            classes: w
        } = f();
        return (0, t.jsxs)(i.Dialog, {
            open: h,
            onClose: g,
            maxWidth: "Medium",
            children: [(0, t.jsxs)(a.DialogTitle, {
                className: w.titleWrapper,
                children: [(0, t.jsx)(d.IconButton, {
                    className: w.closeIcon,
                    color: "secondary",
                    "aria-label": y("Action.Close"),
                    onClick: g,
                    size: "large",
                    children: (0, t.jsx)(v.CloseIcon, {})
                }), (0, t.jsxs)(l.Grid, {
                    container: !0,
                    alignItems: "center",
                    gap: 2,
                    children: [(0, t.jsx)(p.WarningIcon, {
                        color: "warning",
                        fontSize: "large"
                    }), (0, t.jsx)(u.Typography, {
                        variant: "h4",
                        children: y("Heading.ExperienceLocked")
                    })]
                })]
            }), (0, t.jsx)(r.DialogContent, {
                children: (0, t.jsx)(u.Typography, {
                    variant: "body1",
                    component: "div",
                    children: S("Description.ExperienceLockedTermsOfUse", [{
                        opening: "linkStart",
                        closing: "linkEnd",
                        content: e => (0, t.jsx)(c.Link, {
                            href: m,
                            target: "_blank",
                            rel: "noopener noreferrer",
                            children: e
                        })
                    }])
                })
            }), (0, t.jsx)(o.DialogActions, {
                children: (0, t.jsx)(s.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    size: "large",
                    onClick: g,
                    children: y("Action.OK")
                })
            })]
        })
    }])
}, 893949, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        i = e.i(80768),
        a = e.i(79187),
        r = e.i(921394),
        o = e.i(581577),
        s = e.i(814975),
        l = e.i(639102),
        c = e.i(413019),
        u = e.i(709337),
        p = e.i(877051),
        d = e.i(392782),
        v = e.i(991707);
    async function h(e, t) {
        var n;
        let i = Number(e),
            a = Number(t);
        if (!Number.isFinite(i) || !Number.isFinite(a)) return !1;
        let r = null == (n = (await d.default.getDetails([i])).data) ? void 0 : n[0],
            o = null == r ? void 0 : r.rootPlaceId;
        if (null == o) return !1;
        let s = new Set([a, o]);
        return (await Promise.all([...s].map(async e => {
            var t;
            return (null == (t = (await v.default.getPlaceSafetyStatusById(e)).placeSafetyStatus) ? void 0 : t.userPlayabilityRestrictions) !== "RestrictedForAll"
        }))).every(Boolean)
    }
    var m = e.i(252842);
    let {
        getCurrentPlatform: f
    } = m.device, g = {
        light: "https://cdn.foundation.".concat("roblox.com", "/current/StudioLogo-Light.svg"),
        dark: "https://cdn.foundation.".concat("roblox.com", "/current/StudioLogo-Dark.svg")
    };
    e.s(["ThemeAwareStudioResourcesProvider", 0, function(e) {
        let {
            children: a
        } = e, {
            themeMode: s
        } = (0, r.useThemeMode)(), c = (0, n.useMemo)(() => (0, o.createStudioResources)({
            logoSrc: g[s],
            target: "global",
            environment: "production",
            fetchers: {
                userChannel: async () => (await l.channelClient.getUserChannel(f() === m.Platform.macOS ? l.EClientBinaryType.MacStudio : l.EClientBinaryType.WindowsStudio)).channelName
            },
            errorHandler: e => (0, i.captureException)(e)
        }), [s]);
        return (0, t.jsx)(o.StudioResourcesProvider, {
            resources: c,
            children: a
        })
    }, "default", 0, e => {
        let {
            user: i
        } = (0, s.useAuthentication)(), {
            locale: r
        } = (0, a.useLocalization)(), {
            translate: l
        } = (0, a.useTranslation)(), {
            trackerClient: d
        } = (0, u.useEventTrackerProvider)(), v = {
            "Action.DownloadStudio": l("Action.DownloadStudio"),
            "Message.CheckingStudio": l("Message.CheckingStudio"),
            "Message.OpenStudioError": l("Message.OpenStudioError"),
            "Message.StartYourCreation": l("Message.StartYourCreation")
        }, {
            isCompatible: m,
            open: g,
            dialog: y,
            getStudioDownloadUrlAsync: S
        } = (0, o.useStudio)(null != e ? e : v, {
            startAttempt: e => d.sendEvent((0, c.studioStartAttemptEventModel)(e.task)),
            startSuccess: (e, t) => d.sendEvent((0, c.studioStartSuccessEventModel)(e.task, null == t ? void 0 : t.hasAuthCode, null == t ? void 0 : t.authCodeHash)),
            download: (e, t) => {
                (null == t ? void 0 : t.getDownloadCode) ? t.getDownloadCode().then(e => {
                    void 0 !== e ? d.sendEvent((0, c.downloadStudioOpenOrDownloadEventModel)(e)) : d.sendEvent((0, c.downloadStudioOpenOrDownloadEventModel)())
                }).catch(() => {
                    d.sendEvent((0, c.downloadStudioOpenOrDownloadEventModel)())
                }): d.sendEvent((0, c.downloadStudioOpenOrDownloadEventModel)())
            }
        }), [w, b] = (0, n.useState)(!1), N = (0, n.useCallback)(() => b(!1), []), C = (0, n.useCallback)((e, t) => g(e, t), [g]);
        return {
            isCompatible: m,
            open: (0, n.useCallback)(e => {
                let t = {
                    userId: null == i ? void 0 : i.id,
                    locale: null != r ? r : a.Locale.English,
                    protocolScheme: (f(), "roblox-studio"),
                    distributorType: "Global"
                };
                (async () => {
                    if (e.task === o.EStudioTaskType.EditPlace) try {
                        if (!await h(e.universeId, e.placeId)) return void b(!0)
                    } catch (e) {}
                    C(e, t)
                })().catch(() => {})
            }, [null == i ? void 0 : i.id, r, C]),
            dialog: (0, t.jsxs)(t.Fragment, {
                children: [y, (0, t.jsx)(p.default, {
                    open: w,
                    onClose: N
                })]
            }),
            getStudioDownloadUrlAsync: S
        }
    }], 893949)
}, 714644, e => {
    "use strict";
    var t = e.i(690569),
        n = e.i(945146),
        i = e.i(416340),
        a = e.i(251635),
        r = e.i(787802),
        o = e.i(221628),
        s = e.i(121880);

    function l(e) {
        return (0, t.g)("MuiDialogActions", e)
    }(0, r.g)("MuiDialogActions", ["root", "spacing"]);
    let c = ["className", "disableSpacing"],
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
                v = (0, t._)(r, c),
                h = (0, n._)({}, r, {
                    disableSpacing: d
                }),
                m = (e => {
                    let {
                        classes: t,
                        disableSpacing: n
                    } = e;
                    return (0, a.a)({
                        root: ["root", !n && "spacing"]
                    }, l, t)
                })(h);
            return (0, o.jsx)(u, (0, n._)({
                className: (0, a.c)(m.root, p),
                ownerState: h,
                ref: i
            }, v))
        });
    e.s(["D", 0, p])
}, 392848, e => {
    "use strict";
    let t = e.i(416340).createContext({});
    e.s(["D", 0, t])
}, 871451, 39024, e => {
    "use strict";
    var t = e.i(194250),
        n = e.i(416340),
        i = e.i(863605),
        a = e.i(154502),
        r = e.i(690569),
        o = e.i(945146),
        s = e.i(251635),
        l = e.i(787802),
        c = e.i(392848),
        u = e.i(342607),
        p = e.i(221628),
        d = e.i(482027),
        v = e.i(806009),
        h = e.i(770593),
        m = e.i(121880),
        f = e.i(236365),
        g = e.i(299545);

    function y(e) {
        return (0, r.g)("MuiDialog", e)
    }
    var S = (0, l.g)("MuiDialog", ["root", "scrollPaper", "scrollBody", "container", "paper", "paperScrollPaper", "paperScrollBody", "paperWidthFalse", "paperWidthXs", "paperWidthSm", "paperWidthMd", "paperWidthLg", "paperWidthXl", "paperFullWidth", "paperFullScreen"]);
    let w = ["aria-describedby", "aria-labelledby", "BackdropComponent", "BackdropProps", "children", "className", "disableEscapeKeyDown", "fullScreen", "fullWidth", "maxWidth", "onBackdropClick", "onClick", "onClose", "open", "PaperComponent", "PaperProps", "scroll", "TransitionComponent", "transitionDuration", "TransitionProps"],
        b = (0, s.s)(d.M, {
            name: "MuiDialog",
            slot: "Backdrop",
            overrides: (e, t) => t.backdrop
        })({
            zIndex: -1
        }),
        N = (0, s.s)(v.M, {
            name: "MuiDialog",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({
            "@media print": {
                position: "absolute !important"
            }
        }),
        C = (0, s.s)("div", {
            name: "MuiDialog",
            slot: "Container",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.container, t["scroll".concat((0, r.a)(n.scroll))]]
            }
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, o._)({
                height: "100%",
                "@media print": {
                    height: "auto"
                },
                outline: 0
            }, "paper" === t.scroll && {
                display: "flex",
                justifyContent: "center",
                alignItems: "center"
            }, "body" === t.scroll && {
                overflowY: "auto",
                overflowX: "hidden",
                textAlign: "center",
                "&::after": {
                    content: '""',
                    display: "inline-block",
                    verticalAlign: "middle",
                    height: "100%",
                    width: "0"
                }
            })
        }),
        A = (0, s.s)(h.M, {
            name: "MuiDialog",
            slot: "Paper",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.paper, t["scrollPaper".concat((0, r.a)(n.scroll))], t["paperWidth".concat((0, r.a)(String(n.maxWidth)))], n.fullWidth && t.paperFullWidth, n.fullScreen && t.paperFullScreen]
            }
        })(e => {
            let {
                theme: t,
                ownerState: n
            } = e;
            return (0, o._)({
                margin: 32,
                position: "relative",
                overflowY: "auto",
                "@media print": {
                    overflowY: "visible",
                    boxShadow: "none"
                }
            }, "paper" === n.scroll && {
                display: "flex",
                flexDirection: "column",
                maxHeight: "calc(100% - 64px)"
            }, "body" === n.scroll && {
                display: "inline-block",
                verticalAlign: "middle",
                textAlign: "left"
            }, !n.maxWidth && {
                maxWidth: "calc(100% - 64px)"
            }, "xs" === n.maxWidth && {
                maxWidth: "px" === t.breakpoints.unit ? Math.max(t.breakpoints.values.xs, 444) : "max(".concat(t.breakpoints.values.xs).concat(t.breakpoints.unit, ", 444px)"),
                ["&.".concat(S.paperScrollBody)]: {
                    [t.breakpoints.down(Math.max(t.breakpoints.values.xs, 444) + 64)]: {
                        maxWidth: "calc(100% - 64px)"
                    }
                }
            }, n.maxWidth && "xs" !== n.maxWidth && {
                maxWidth: "".concat(t.breakpoints.values[n.maxWidth]).concat(t.breakpoints.unit),
                ["&.".concat(S.paperScrollBody)]: {
                    [t.breakpoints.down(t.breakpoints.values[n.maxWidth] + 64)]: {
                        maxWidth: "calc(100% - 64px)"
                    }
                }
            }, n.fullWidth && {
                width: "calc(100% - 64px)"
            }, n.fullScreen && {
                margin: 0,
                width: "100%",
                maxWidth: "100%",
                height: "100%",
                maxHeight: "none",
                borderRadius: 0,
                ["&.".concat(S.paperScrollBody)]: {
                    margin: 0,
                    maxWidth: "100%"
                }
            })
        }),
        x = n.forwardRef(function(e, t) {
            let i = (0, m.u)({
                    props: e,
                    name: "MuiDialog"
                }),
                a = (0, u.u)(),
                l = {
                    enter: a.transitions.duration.enteringScreen,
                    exit: a.transitions.duration.leavingScreen
                },
                {
                    "aria-describedby": d,
                    "aria-labelledby": v,
                    BackdropComponent: S,
                    BackdropProps: x,
                    children: R,
                    className: T,
                    disableEscapeKeyDown: k = !1,
                    fullScreen: P = !1,
                    fullWidth: I = !1,
                    maxWidth: q = "sm",
                    onBackdropClick: G,
                    onClick: E,
                    onClose: B,
                    open: D,
                    PaperComponent: U = h.M,
                    PaperProps: M = {},
                    scroll: V = "paper",
                    TransitionComponent: O = g.F,
                    transitionDuration: L = l,
                    TransitionProps: K
                } = i,
                W = (0, r._)(i, w),
                z = (0, o._)({}, i, {
                    disableEscapeKeyDown: k,
                    fullScreen: P,
                    fullWidth: I,
                    maxWidth: q,
                    scroll: V
                }),
                _ = (e => {
                    let {
                        classes: t,
                        scroll: n,
                        maxWidth: i,
                        fullWidth: a,
                        fullScreen: o
                    } = e, l = {
                        root: ["root"],
                        container: ["container", "scroll".concat((0, r.a)(n))],
                        paper: ["paper", "paperScroll".concat((0, r.a)(n)), "paperWidth".concat((0, r.a)(String(i))), a && "paperFullWidth", o && "paperFullScreen"]
                    };
                    return (0, s.a)(l, y, t)
                })(z),
                j = n.useRef(),
                J = (0, f.u)(v),
                F = n.useMemo(() => ({
                    titleId: J
                }), [J]);
            return (0, p.jsx)(N, (0, o._)({
                className: (0, s.c)(_.root, T),
                closeAfterTransition: !0,
                components: {
                    Backdrop: b
                },
                componentsProps: {
                    backdrop: (0, o._)({
                        transitionDuration: L,
                        as: S
                    }, x)
                },
                disableEscapeKeyDown: k,
                onClose: B,
                open: D,
                ref: t,
                onClick: e => {
                    E && E(e), j.current && (j.current = null, G && G(e), B && B(e, "backdropClick"))
                },
                ownerState: z
            }, W, {
                children: (0, p.jsx)(O, (0, o._)({
                    appear: !0,
                    in: D,
                    timeout: L,
                    role: "presentation"
                }, K, {
                    children: (0, p.jsx)(C, {
                        className: (0, s.c)(_.container),
                        onMouseDown: e => {
                            j.current = e.target === e.currentTarget
                        },
                        ownerState: z,
                        children: (0, p.jsx)(A, (0, o._)({
                            as: U,
                            elevation: 24,
                            role: "dialog",
                            "aria-describedby": d,
                            "aria-labelledby": J
                        }, M, {
                            className: (0, s.c)(_.paper, M.className),
                            ownerState: z,
                            children: (0, p.jsx)(c.D.Provider, {
                                value: F,
                                children: R
                            })
                        }))
                    })
                }))
            }))
        });
    e.s(["M", 0, x, "d", 0, S], 39024), e.i(149285);
    var R = (0, i.default)({
            name: "Dialog"
        })(function(e) {
            return {
                paper: (0, t._)({
                    boxShadow: e.elevation.overlay,
                    backgroundColor: e.palette.surface[300]
                }, e.border.radius.large),
                xsmallBreakpointWidthOverride: {}
            }
        }),
        T = (0, n.forwardRef)(function(e, i) {
            var r = e.classes,
                o = e.children;
            e.fullScreen;
            var s = e.className,
                l = e.maxWidth,
                c = (0, t.a)(e, ["classes", "children", "fullScreen", "className", "maxWidth"]),
                u = R(void 0, {
                    props: {
                        classes: (0, a.default)(r, s)
                    }
                });
            return n.default.createElement(x, (0, t._)({}, c, {
                fullScreen: !1,
                classes: u.classes,
                maxWidth: "XSmall" === l ? "Small" : l,
                ref: i
            }), o)
        });
    e.s(["default", 0, T], 871451)
}, 226519, e => {
    "use strict";
    var t = e.i(871451);
    e.s(["Dialog", () => t.default])
}, 735410, e => {
    "use strict";
    var t = e.i(194250),
        n = e.i(416340),
        i = e.i(863605),
        a = e.i(154502),
        r = e.i(714644);
    e.i(221628);
    var o = (0, i.default)({
            name: "DialogActions"
        })({
            root: {
                justifyContent: "flex-end",
                padding: 20
            }
        }),
        s = (0, n.forwardRef)(function(e, i) {
            var s = e.classes,
                l = e.children,
                c = e.className,
                u = (0, t.a)(e, ["classes", "children", "className"]),
                p = o(void 0, {
                    props: {
                        classes: (0, a.default)(s, c)
                    }
                });
            return n.default.createElement(r.D, (0, t._)({}, u, {
                classes: p.classes,
                ref: i
            }), l)
        });
    e.s(["default", 0, s])
}, 976457, e => {
    "use strict";
    var t = e.i(735410);
    e.s(["DialogActions", () => t.default])
}, 668539, 502927, 378645, 571824, e => {
    "use strict";
    var t = e.i(194250),
        n = e.i(416340),
        i = e.i(863605),
        a = e.i(154502),
        r = e.i(690569),
        o = e.i(945146),
        s = e.i(251635),
        l = e.i(787802),
        c = (0, l.g)("MuiDialogTitle", ["root"]);
    e.s(["d", 0, c, "g", 0, function(e) {
        return (0, r.g)("MuiDialogTitle", e)
    }], 502927);
    var u = e.i(221628),
        p = e.i(121880);

    function d(e) {
        return (0, r.g)("MuiDialogContent", e)
    }
    var v = (0, l.g)("MuiDialogContent", ["root", "dividers"]);
    let h = ["className", "dividers"],
        m = (0, s.s)("div", {
            name: "MuiDialogContent",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.root, n.dividers && t.dividers]
            }
        })(e => {
            let {
                theme: t,
                ownerState: n
            } = e;
            return (0, o._)({
                flex: "1 1 auto",
                WebkitOverflowScrolling: "touch",
                overflowY: "auto",
                padding: "20px 24px"
            }, n.dividers ? {
                padding: "16px 24px",
                borderTop: "1px solid ".concat((t.vars || t).palette.divider),
                borderBottom: "1px solid ".concat((t.vars || t).palette.divider)
            } : {
                [".".concat(c.root, " + &")]: {
                    paddingTop: 0
                }
            })
        }),
        f = n.forwardRef(function(e, t) {
            let n = (0, p.u)({
                    props: e,
                    name: "MuiDialogContent"
                }),
                {
                    className: i,
                    dividers: a = !1
                } = n,
                l = (0, r._)(n, h),
                c = (0, o._)({}, n, {
                    dividers: a
                }),
                v = (e => {
                    let {
                        classes: t,
                        dividers: n
                    } = e;
                    return (0, s.a)({
                        root: ["root", n && "dividers"]
                    }, d, t)
                })(c);
            return (0, u.jsx)(m, (0, o._)({
                className: (0, s.c)(v.root, i),
                ownerState: c,
                ref: t
            }, l))
        });
    e.s(["D", 0, f, "d", 0, v], 378645);
    var g = (0, i.default)({
            name: "DialogContent"
        })({
            root: {
                paddingLeft: 20,
                paddingRight: 20,
                paddingBottom: 12
            },
            dividers: {
                margin: "0 24px",
                padding: "16px 0"
            }
        }),
        y = (0, n.forwardRef)(function(e, i) {
            var r = e.classes,
                o = e.children,
                s = e.className,
                l = (0, t.a)(e, ["classes", "children", "className"]),
                c = g(void 0, {
                    props: {
                        classes: (0, a.default)(r, s)
                    }
                });
            return n.default.createElement(f, (0, t._)({}, l, {
                classes: c.classes,
                ref: i
            }), o)
        });
    e.s(["default", 0, y], 571824), e.s(["DialogContent", 0, y], 668539)
}, 649836, e => {
    "use strict";
    var t = e.i(194250),
        n = e.i(416340),
        i = e.i(863605),
        a = e.i(154502),
        r = e.i(945146),
        o = e.i(690569),
        s = e.i(251635),
        l = e.i(502927),
        c = e.i(392848),
        u = e.i(221628),
        p = e.i(396249),
        d = e.i(121880);
    let v = ["className", "id"],
        h = (0, s.s)(p.T, {
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
                m = (0, o._)(i, v),
                f = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, s.a)({
                        root: ["root"]
                    }, l.g, t)
                })(i),
                {
                    titleId: g = p
                } = n.useContext(c.D);
            return (0, u.jsx)(h, (0, r._)({
                component: "h2",
                className: (0, s.c)(f.root, a),
                ownerState: i,
                ref: t,
                variant: "h6",
                id: null != p ? p : g
            }, m))
        });
    var f = (0, i.default)({
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
        g = (0, n.forwardRef)(function(e, i) {
            var r = e.classes,
                o = e.children,
                s = e.className,
                l = (0, t.a)(e, ["classes", "children", "className"]),
                c = f(void 0, {
                    props: {
                        classes: (0, a.default)(r, s)
                    }
                });
            return n.default.createElement(m, (0, t._)({}, l, {
                classes: c.classes,
                ref: i
            }), o)
        });
    e.s(["default", 0, g])
}, 102725, e => {
    "use strict";
    var t = e.i(649836);
    e.s(["DialogTitle", () => t.default])
}]);

//# debugId=fd8132aa-a2bc-3f85-6720-fd9ab8ee6dac
//# sourceMappingURL=1e2xesfzhoion.js.map