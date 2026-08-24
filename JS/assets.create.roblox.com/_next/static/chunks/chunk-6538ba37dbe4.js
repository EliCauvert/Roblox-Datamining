;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "3af447e2-1fa5-4046-be94-c91e9fdd4ea8")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 639102, e => {
    "use strict";
    var t, r = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
            })(e, t)
        };

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function r() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
    }

    function a(e, t, r, n) {
        return new(r || (r = Promise))(function(i, a) {
            function s(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function o(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(s, o)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var r, n, i, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = o(0), s.throw = o(1), s.return = o(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function o(o) {
            return function(u) {
                var c = [o, u];
                if (r) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, c[0] && (a = 0)), a;) try {
                    if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                    switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                        case 0:
                        case 1:
                            i = c;
                            break;
                        case 4:
                            return a.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            a.label++, n = c[1], c = [0];
                            continue;
                        case 7:
                            c = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                a.label = c[1];
                                break
                            }
                            if (6 === c[0] && a.label < i[1]) {
                                a.label = i[1], i = c;
                                break
                            }
                            if (i && a.label < i[2]) {
                                a.label = i[2], a.ops.push(c);
                                break
                            }
                            i[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    c = t.call(e, a)
                } catch (e) {
                    c = [6, e], n = 0
                } finally {
                    r = i = 0
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
    var o = r.BaseAPI;

    function u() {
        return null !== o && o.apply(this, arguments) || this
    }

    function c(e, t) {
        return null == e ? e : {
            applicationSettings: (0, r.exists)(e, "applicationSettings") ? e.applicationSettings : void 0
        }
    }
    i(u, o), u.prototype.v1InstallerCdnsGetRaw = function(e) {
        return a(this, void 0, void 0, function() {
            var t, n, i;
            return s(this, function(a) {
                switch (a.label) {
                    case 0:
                        return t = {}, n = {}, [4, this.request({
                            path: "/v1/installer-cdns",
                            schemaPath: "/v1/installer-cdns",
                            method: "GET",
                            headers: n,
                            query: t
                        }, e)];
                    case 1:
                        return i = a.sent(), [2, new r.VoidApiResponse(i)]
                }
            })
        })
    }, u.prototype.v1InstallerCdnsGet = function(e) {
        return a(this, void 0, void 0, function() {
            return s(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.v1InstallerCdnsGetRaw(e)];
                    case 1:
                        return t.sent(), [2]
                }
            })
        })
    };
    var l = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.v1SettingsApplicationGetRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.applicationName || void 0 === e.applicationName) throw new r.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v1SettingsApplicationGet.");
                                return n = {}, void 0 !== e.applicationName && (n.applicationName = e.applicationName), i = {}, void 0 !== e.trueClientIP && null !== e.trueClientIP && (i["True-Client-IP"] = String(e.trueClientIP)), [4, this.request({
                                    path: "/v1/settings/application",
                                    schemaPath: "/v1/settings/application",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1SettingsApplicationGet = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1SettingsApplicationGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1SettingsSecuredSettingsGetRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.applicationName || void 0 === e.applicationName) throw new r.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v1SettingsSecuredSettingsGet.");
                                if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new r.RequiredError("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v1SettingsSecuredSettingsGet.");
                                return n = {}, void 0 !== e.applicationName && (n.applicationName = e.applicationName), i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/settings/secured-settings",
                                    schemaPath: "/v1/settings/secured-settings",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1SettingsSecuredSettingsGet = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1SettingsSecuredSettingsGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1SettingsSecuredSettingsInternalGetRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.applicationName || void 0 === e.applicationName) throw new r.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v1SettingsSecuredSettingsInternalGet.");
                                if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new r.RequiredError("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v1SettingsSecuredSettingsInternalGet.");
                                return n = {}, void 0 !== e.applicationName && (n.applicationName = e.applicationName), i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/settings/secured-settings-internal",
                                    schemaPath: "/v1/settings/secured-settings-internal",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1SettingsSecuredSettingsInternalGet = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1SettingsSecuredSettingsInternalGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(r.BaseAPI),
        p = r.BaseAPI;

    function d() {
        return null !== p && p.apply(this, arguments) || this
    }
    i(d, p), d.prototype.v1ClientVersionBinaryTypeGetRaw = function(e, t) {
        return a(this, void 0, void 0, function() {
            var n, i, a;
            return s(this, function(s) {
                switch (s.label) {
                    case 0:
                        if (null === e.binaryType || void 0 === e.binaryType) throw new r.RequiredError("binaryType", "Required parameter requestParameters.binaryType was null or undefined when calling v1ClientVersionBinaryTypeGet.");
                        return n = {}, i = {}, [4, this.request({
                            path: "/v1/client-version/{binaryType}".replace("{".concat("binaryType", "}"), encodeURIComponent(String(e.binaryType))),
                            schemaPath: "/v1/client-version/{binaryType}",
                            method: "GET",
                            headers: i,
                            query: n
                        }, t)];
                    case 1:
                        return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                            return null == e ? e : {
                                version: (0, r.exists)(e, "version") ? e.version : void 0,
                                clientVersionUpload: (0, r.exists)(e, "clientVersionUpload") ? e.clientVersionUpload : void 0,
                                bootstrapperVersion: (0, r.exists)(e, "bootstrapperVersion") ? e.bootstrapperVersion : void 0,
                                nextClientVersionUpload: (0, r.exists)(e, "nextClientVersionUpload") ? e.nextClientVersionUpload : void 0,
                                nextClientVersion: (0, r.exists)(e, "nextClientVersion") ? e.nextClientVersion : void 0
                            }
                        })]
                }
            })
        })
    }, d.prototype.v1ClientVersionBinaryTypeGet = function(e, t) {
        return a(this, void 0, void 0, function() {
            return s(this, function(r) {
                switch (r.label) {
                    case 0:
                        return [4, this.v1ClientVersionBinaryTypeGetRaw(e, t)];
                    case 1:
                        return [4, r.sent().value()];
                    case 2:
                        return [2, r.sent()]
                }
            })
        })
    }, d.prototype.v1MobileClientVersionGetRaw = function(e, t) {
        return a(this, void 0, void 0, function() {
            var n, i, a;
            return s(this, function(s) {
                switch (s.label) {
                    case 0:
                        if (null === e.appVersion || void 0 === e.appVersion) throw new r.RequiredError("appVersion", "Required parameter requestParameters.appVersion was null or undefined when calling v1MobileClientVersionGet.");
                        return n = {}, void 0 !== e.appVersion && (n.appVersion = e.appVersion), i = {}, [4, this.request({
                            path: "/v1/mobile-client-version",
                            schemaPath: "/v1/mobile-client-version",
                            method: "GET",
                            headers: i,
                            query: n
                        }, t)];
                    case 1:
                        return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                            var t;
                            return null == e ? e : {
                                activeVersion: (0, r.exists)(e, "activeVersion") ? e.activeVersion : void 0,
                                upgradeSource: (0, r.exists)(e, "upgradeSource") ? e.upgradeSource : void 0,
                                mD5Sum: (0, r.exists)(e, "MD5Sum") ? e.MD5Sum : void 0,
                                data: (0, r.exists)(e, "data") ? null == (t = e.data) ? t : {
                                    upgradeAction: (0, r.exists)(t, "UpgradeAction") ? t.UpgradeAction : void 0
                                } : void 0
                            }
                        })]
                }
            })
        })
    }, d.prototype.v1MobileClientVersionGet = function(e, t) {
        return a(this, void 0, void 0, function() {
            return s(this, function(r) {
                switch (r.label) {
                    case 0:
                        return [4, this.v1MobileClientVersionGetRaw(e, t)];
                    case 1:
                        return [4, r.sent().value()];
                    case 2:
                        return [2, r.sent()]
                }
            })
        })
    };

    function h(e, t) {
        return null == e ? e : {
            applicationSettings: (0, r.exists)(e, "applicationSettings") ? e.applicationSettings : void 0
        }
    }

    function v(e, t) {
        return null == e ? e : {
            version: (0, r.exists)(e, "version") ? e.version : void 0,
            clientVersionUpload: (0, r.exists)(e, "clientVersionUpload") ? e.clientVersionUpload : void 0,
            bootstrapperVersion: (0, r.exists)(e, "bootstrapperVersion") ? e.bootstrapperVersion : void 0,
            nextClientVersionUpload: (0, r.exists)(e, "nextClientVersionUpload") ? e.nextClientVersionUpload : void 0,
            nextClientVersion: (0, r.exists)(e, "nextClientVersion") ? e.nextClientVersion : void 0
        }
    }

    function m(e) {
        var t;
        return null == (t = e) ? t : {
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            version: (0, r.exists)(t, "version") ? t.version : void 0,
            downloadUrl: (0, r.exists)(t, "downloadUrl") ? t.downloadUrl : void 0,
            isStandalone: (0, r.exists)(t, "isStandalone") ? t.isStandalone : void 0,
            assetId: (0, r.exists)(t, "assetId") ? t.assetId : void 0,
            assetVersion: (0, r.exists)(t, "assetVersion") ? t.assetVersion : void 0,
            maxAppVersion: (0, r.exists)(t, "maxAppVersion") ? t.maxAppVersion : void 0,
            tryoutName: (0, r.exists)(t, "tryoutName") ? t.tryoutName : void 0,
            localAssetURI: (0, r.exists)(t, "localAssetURI") ? t.localAssetURI : void 0,
            isForcedUpdate: (0, r.exists)(t, "isForcedUpdate") ? t.isForcedUpdate : void 0,
            appStorageResetId: (0, r.exists)(t, "appStorageResetId") ? t.appStorageResetId : void 0,
            isDevelopmentConfig: (0, r.exists)(t, "isDevelopmentConfig") ? t.isDevelopmentConfig : void 0,
            assetsManifest: (0, r.exists)(t, "assetsManifest") ? t.assetsManifest : void 0,
            versionV2: (0, r.exists)(t, "versionV2") ? t.versionV2 : void 0
        }
    }

    function f(e, t) {
        var n;
        return null == e ? e : {
            channelName: (0, r.exists)(e, "channelName") ? e.channelName : void 0,
            channelAssignmentType: (0, r.exists)(e, "channelAssignmentType") ? e.channelAssignmentType : void 0,
            token: (0, r.exists)(e, "token") ? e.token : void 0,
            program: (0, r.exists)(e, "program") ? null == (n = e.program) ? n : {
                name: (0, r.exists)(n, "name") ? n.name : void 0,
                id: (0, r.exists)(n, "id") ? n.id : void 0
            } : void 0,
            isFlagOnly: (0, r.exists)(e, "isFlagOnly") ? e.isFlagOnly : void 0
        }
    }
    var y = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return i(t, e), t.prototype.v2UserChannelGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return n = {}, void 0 !== e.binaryType && (n.binaryType = e.binaryType), i = {}, [4, this.request({
                                path: "/v2/user-channel",
                                schemaPath: "/v2/user-channel",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return f(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2UserChannelGet = function() {
            return a(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2UserChannelGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v2UserChannelInternalGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v2UserChannelInternalGet.");
                            return n = {}, void 0 !== e.userId && (n.userId = e.userId), void 0 !== e.binaryType && (n.binaryType = e.binaryType), void 0 !== e.isLuobuUser && (n.isLuobuUser = e.isLuobuUser), void 0 !== e.isPcVngUser && (n.isPcVngUser = e.isPcVngUser), i = {}, [4, this.request({
                                path: "/v2/user-channel-internal",
                                schemaPath: "/v2/user-channel-internal",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return f(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2UserChannelInternalGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2UserChannelInternalGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v2UserPublicChannelInternalGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v2UserPublicChannelInternalGet.");
                            if (null === e.binaryType || void 0 === e.binaryType) throw new r.RequiredError("binaryType", "Required parameter requestParameters.binaryType was null or undefined when calling v2UserPublicChannelInternalGet.");
                            return n = {}, void 0 !== e.userId && (n.userId = e.userId), void 0 !== e.binaryType && (n.binaryType = e.binaryType), i = {}, [4, this.request({
                                path: "/v2/user-public-channel-internal",
                                schemaPath: "/v2/user-public-channel-internal",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return f(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2UserPublicChannelInternalGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2UserPublicChannelInternalGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t
    }(r.BaseAPI);
    (function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(t, e), t.prototype.v2CompressionDictionariesDictionarySha256GetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.dictionarySha256 || void 0 === e.dictionarySha256) throw new r.RequiredError("dictionarySha256", "Required parameter requestParameters.dictionarySha256 was null or undefined when calling v2CompressionDictionariesDictionarySha256Get.");
                            return n = {}, i = {}, [4, this.request({
                                path: "/v2/compression-dictionaries/{dictionarySha256}".replace("{".concat("dictionarySha256", "}"), encodeURIComponent(String(e.dictionarySha256))),
                                schemaPath: "/v2/compression-dictionaries/{dictionarySha256}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.v2CompressionDictionariesDictionarySha256Get = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2CompressionDictionariesDictionarySha256GetRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, t.prototype.v2CompressionDictionariesGetRaw = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n, i;
                return s(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v2/compression-dictionaries",
                                schemaPath: "/v2/compression-dictionaries",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return i = a.sent(), [2, new r.VoidApiResponse(i)]
                    }
                })
            })
        }, t.prototype.v2CompressionDictionariesGet = function(e) {
            return a(this, void 0, void 0, function() {
                return s(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v2CompressionDictionariesGetRaw(e)];
                        case 1:
                            return t.sent(), [2]
                    }
                })
            })
        }, t.prototype.v2SettingsApplicationApplicationNameBucketBucketNameGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new r.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsApplicationApplicationNameBucketBucketNameGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new r.RequiredError("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsApplicationApplicationNameBucketBucketNameGet.");
                            return n = {}, i = {}, void 0 !== e.trueClientIP && null !== e.trueClientIP && (i["True-Client-IP"] = String(e.trueClientIP)), [4, this.request({
                                path: "/v2/settings/application/{applicationName}/bucket/{bucketName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings/application/{applicationName}/bucket/{bucketName}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2SettingsApplicationApplicationNameBucketBucketNameGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2SettingsApplicationApplicationNameBucketBucketNameGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v2SettingsApplicationApplicationNameGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new r.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsApplicationApplicationNameGet.");
                            return n = {}, i = {}, void 0 !== e.trueClientIP && null !== e.trueClientIP && (i["True-Client-IP"] = String(e.trueClientIP)), [4, this.request({
                                path: "/v2/settings/application/{applicationName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))),
                                schemaPath: "/v2/settings/application/{applicationName}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2SettingsApplicationApplicationNameGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2SettingsApplicationApplicationNameGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new r.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGet.");
                            if (null === e.dictionarySha256 || void 0 === e.dictionarySha256) throw new r.RequiredError("dictionarySha256", "Required parameter requestParameters.dictionarySha256 was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new r.RequiredError("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGet.");
                            return n = {}, i = {}, [4, this.request({
                                path: "/v2/settings-compressed/application/{applicationName}/bucket/{bucketName}/{dictionarySha256}.dcz".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("dictionarySha256", "}"), encodeURIComponent(String(e.dictionarySha256))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings-compressed/application/{applicationName}/bucket/{bucketName}/{dictionarySha256}.dcz",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2SettingsCompressedApplicationApplicationNameBucketBucketNameDictionarySha256DczGetRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameBucketBucketNameZstGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new r.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameZstGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new r.RequiredError("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameBucketBucketNameZstGet.");
                            return n = {}, i = {}, [4, this.request({
                                path: "/v2/settings-compressed/application/{applicationName}/bucket/{bucketName}.zst".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings-compressed/application/{applicationName}/bucket/{bucketName}.zst",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameBucketBucketNameZstGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2SettingsCompressedApplicationApplicationNameBucketBucketNameZstGetRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameDictionarySha256DczGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new r.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameDictionarySha256DczGet.");
                            if (null === e.dictionarySha256 || void 0 === e.dictionarySha256) throw new r.RequiredError("dictionarySha256", "Required parameter requestParameters.dictionarySha256 was null or undefined when calling v2SettingsCompressedApplicationApplicationNameDictionarySha256DczGet.");
                            return n = {}, i = {}, void 0 !== e.trueClientIP && null !== e.trueClientIP && (i["True-Client-IP"] = String(e.trueClientIP)), [4, this.request({
                                path: "/v2/settings-compressed/application/{applicationName}/{dictionarySha256}.dcz".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("dictionarySha256", "}"), encodeURIComponent(String(e.dictionarySha256))),
                                schemaPath: "/v2/settings-compressed/application/{applicationName}/{dictionarySha256}.dcz",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameDictionarySha256DczGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2SettingsCompressedApplicationApplicationNameDictionarySha256DczGetRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameZstGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new r.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsCompressedApplicationApplicationNameZstGet.");
                            return n = {}, i = {}, void 0 !== e.trueClientIP && null !== e.trueClientIP && (i["True-Client-IP"] = String(e.trueClientIP)), [4, this.request({
                                path: "/v2/settings-compressed/application/{applicationName}.zst".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))),
                                schemaPath: "/v2/settings-compressed/application/{applicationName}.zst",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.v2SettingsCompressedApplicationApplicationNameZstGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2SettingsCompressedApplicationApplicationNameZstGetRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsApplicationNameBucketBucketNameGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new r.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsSecuredSettingsApplicationNameBucketBucketNameGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new r.RequiredError("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsSecuredSettingsApplicationNameBucketBucketNameGet.");
                            if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new r.RequiredError("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v2SettingsSecuredSettingsApplicationNameBucketBucketNameGet.");
                            return n = {}, i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/settings/secured-settings/{applicationName}/bucket/{bucketName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings/secured-settings/{applicationName}/bucket/{bucketName}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsApplicationNameBucketBucketNameGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2SettingsSecuredSettingsApplicationNameBucketBucketNameGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsApplicationNameGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new r.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsSecuredSettingsApplicationNameGet.");
                            if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new r.RequiredError("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v2SettingsSecuredSettingsApplicationNameGet.");
                            return n = {}, i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/settings/secured-settings/{applicationName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))),
                                schemaPath: "/v2/settings/secured-settings/{applicationName}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsApplicationNameGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2SettingsSecuredSettingsApplicationNameGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new r.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGet.");
                            if (null === e.bucketName || void 0 === e.bucketName) throw new r.RequiredError("bucketName", "Required parameter requestParameters.bucketName was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGet.");
                            if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new r.RequiredError("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGet.");
                            return n = {}, i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/settings/secured-settings-internal/{applicationName}/bucket/{bucketName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))).replace("{".concat("bucketName", "}"), encodeURIComponent(String(e.bucketName))),
                                schemaPath: "/v2/settings/secured-settings-internal/{applicationName}/bucket/{bucketName}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2SettingsSecuredSettingsInternalApplicationNameBucketBucketNameGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsInternalApplicationNameGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.applicationName || void 0 === e.applicationName) throw new r.RequiredError("applicationName", "Required parameter requestParameters.applicationName was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameGet.");
                            if (null === e.robloxApiKey || void 0 === e.robloxApiKey) throw new r.RequiredError("robloxApiKey", "Required parameter requestParameters.robloxApiKey was null or undefined when calling v2SettingsSecuredSettingsInternalApplicationNameGet.");
                            return n = {}, i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/settings/secured-settings-internal/{applicationName}".replace("{".concat("applicationName", "}"), encodeURIComponent(String(e.applicationName))),
                                schemaPath: "/v2/settings/secured-settings-internal/{applicationName}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2SettingsSecuredSettingsInternalApplicationNameGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2SettingsSecuredSettingsInternalApplicationNameGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    })(r.BaseAPI),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(t, e), t.prototype.v2OtaVersionBinaryTypeGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.binaryType || void 0 === e.binaryType) throw new r.RequiredError("binaryType", "Required parameter requestParameters.binaryType was null or undefined when calling v2OtaVersionBinaryTypeGet.");
                            return n = {}, void 0 !== e.channel && (n.channel = e.channel), void 0 !== e.version && (n.version = e.version), void 0 !== e.tag && (n.tag = e.tag), void 0 !== e.name && (n.name = e.name), i = {}, [4, this.request({
                                path: "/v2/ota-version/{binaryType}".replace("{".concat("binaryType", "}"), encodeURIComponent(String(e.binaryType))),
                                schemaPath: "/v2/ota-version/{binaryType}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return e.map(m)
                            })]
                    }
                })
            })
        }, t.prototype.v2OtaVersionBinaryTypeGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2OtaVersionBinaryTypeGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(r.BaseAPI),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(t, e), t.prototype.v2AndroidBinariesVersionChannelsChannelNameGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.version || void 0 === e.version) throw new r.RequiredError("version", "Required parameter requestParameters.version was null or undefined when calling v2AndroidBinariesVersionChannelsChannelNameGet.");
                            if (null === e.channelName || void 0 === e.channelName) throw new r.RequiredError("channelName", "Required parameter requestParameters.channelName was null or undefined when calling v2AndroidBinariesVersionChannelsChannelNameGet.");
                            return n = {}, i = {}, [4, this.request({
                                path: "/v2/android-binaries/{version}/channels/{channelName}".replace("{".concat("version", "}"), encodeURIComponent(String(e.version))).replace("{".concat("channelName", "}"), encodeURIComponent(String(e.channelName))),
                                schemaPath: "/v2/android-binaries/{version}/channels/{channelName}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                var t;
                                return null == e ? e : {
                                    moduleName: (0, r.exists)(e, "moduleName") ? e.moduleName : void 0,
                                    libraryNames: (0, r.exists)(e, "libraryNames") ? null == (t = e.libraryNames) ? t : {
                                        engine: (0, r.exists)(t, "engine") ? t.engine : void 0
                                    } : void 0,
                                    supportsAndroidBinaries: (0, r.exists)(e, "supportsAndroidBinaries") ? e.supportsAndroidBinaries : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v2AndroidBinariesVersionChannelsChannelNameGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2AndroidBinariesVersionChannelsChannelNameGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v2ClientVersionBinaryTypeChannelChannelNameGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.binaryType || void 0 === e.binaryType) throw new r.RequiredError("binaryType", "Required parameter requestParameters.binaryType was null or undefined when calling v2ClientVersionBinaryTypeChannelChannelNameGet.");
                            if (null === e.channelName || void 0 === e.channelName) throw new r.RequiredError("channelName", "Required parameter requestParameters.channelName was null or undefined when calling v2ClientVersionBinaryTypeChannelChannelNameGet.");
                            return n = {}, i = {}, [4, this.request({
                                path: "/v2/client-version/{binaryType}/channel/{channelName}".replace("{".concat("binaryType", "}"), encodeURIComponent(String(e.binaryType))).replace("{".concat("channelName", "}"), encodeURIComponent(String(e.channelName))),
                                schemaPath: "/v2/client-version/{binaryType}/channel/{channelName}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2ClientVersionBinaryTypeChannelChannelNameGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2ClientVersionBinaryTypeChannelChannelNameGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v2ClientVersionBinaryTypeGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.binaryType || void 0 === e.binaryType) throw new r.RequiredError("binaryType", "Required parameter requestParameters.binaryType was null or undefined when calling v2ClientVersionBinaryTypeGet.");
                            return n = {}, i = {}, [4, this.request({
                                path: "/v2/client-version/{binaryType}".replace("{".concat("binaryType", "}"), encodeURIComponent(String(e.binaryType))),
                                schemaPath: "/v2/client-version/{binaryType}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, t.prototype.v2ClientVersionBinaryTypeGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v2ClientVersionBinaryTypeGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(r.BaseAPI);
    var b = e.i(272593);
    let w = new l((0, b.createClientConfiguration)("clientsettingscdn", "bedev1", {
            credentials: "omit"
        })),
        g = new y((0, b.createClientConfiguration)("clientsettings", "bedev1"));
    var I = ((t = {}).RCCService = "RCCService", t.WindowsPlayer = "WindowsPlayer", t.WindowsStudio = "WindowsStudio64", t.MacPlayer = "MacPlayer", t.MacStudio = "MacStudio", t.WindowsStudioCJV = "WindowsStudio64CJV", t.MacStudioCJV = "MacStudioCJV", t.WindowsPlayerCJV = "WindowsPlayerCJV", t.MacPlayerCJV = "MacPlayerCJV", t);
    e.s(["EClientBinaryType", () => I, "channelClient", 0, {
        getUserChannel: e => g.v2UserChannelGet({
            binaryType: e
        })
    }, "settingsClient", 0, {
        getApplicationSettings: () => w.v1SettingsApplicationGet({
            applicationName: "CreatorDashboard"
        })
    }], 639102)
}, 199475, e => {
    "use strict";
    var t = e.i(721281),
        r = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
            })(e, t)
        };

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function r() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
    }

    function a(e, t, r, n) {
        return new(r || (r = Promise))(function(i, a) {
            function s(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function o(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(s, o)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var r, n, i, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = o(0), s.throw = o(1), s.return = o(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function o(o) {
            return function(u) {
                var c = [o, u];
                if (r) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, c[0] && (a = 0)), a;) try {
                    if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                    switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                        case 0:
                        case 1:
                            i = c;
                            break;
                        case 4:
                            return a.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            a.label++, n = c[1], c = [0];
                            continue;
                        case 7:
                            c = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                a.label = c[1];
                                break
                            }
                            if (6 === c[0] && a.label < i[1]) {
                                a.label = i[1], i = c;
                                break
                            }
                            if (i && a.label < i[2]) {
                                a.label = i[2], a.ops.push(c);
                                break
                            }
                            i[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    c = t.call(e, a)
                } catch (e) {
                    c = [6, e], n = 0
                } finally {
                    r = i = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function o(e) {
        var t;
        return null == (t = e) ? t : {
            value: (0, r.exists)(t, "value") ? t.value : void 0,
            date: (0, r.exists)(t, "date") ? new Date(t.date) : void 0
        }
    }

    function u(e) {
        var t;
        return null == (t = e) ? t : {
            amount: (0, r.exists)(t, "amount") ? t.amount : void 0,
            conversionRatePer10KRobux: (0, r.exists)(t, "conversionRatePer10KRobux") ? t.conversionRatePer10KRobux : void 0,
            balanceType: (0, r.exists)(t, "balanceType") ? t.balanceType : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function c(e, t) {
        return null == e ? e : {
            watermarks: (0, r.exists)(e, "watermarks") ? e.watermarks.map(u) : void 0,
            shouldDisplayEffectiveO18Robux: (0, r.exists)(e, "shouldDisplayEffectiveO18Robux") ? e.shouldDisplayEffectiveO18Robux : void 0
        }
    }

    function l(e, t) {
        return null == e ? e : {
            premiumDiscountPercentage: (0, r.exists)(e, "premiumDiscountPercentage") ? e.premiumDiscountPercentage : void 0,
            premiumPriceInRobux: (0, r.exists)(e, "premiumPriceInRobux") ? e.premiumPriceInRobux : void 0
        }
    }

    function p(e) {
        var t, n;
        return null == (t = e) ? t : {
            userAssetId: (0, r.exists)(t, "userAssetId") ? t.userAssetId : void 0,
            seller: (0, r.exists)(t, "seller") ? null == (n = t.seller) ? n : {
                id: (0, r.exists)(n, "id") ? n.id : void 0,
                type: (0, r.exists)(n, "type") ? n.type : void 0,
                name: (0, r.exists)(n, "name") ? n.name : void 0
            } : void 0,
            price: (0, r.exists)(t, "price") ? t.price : void 0,
            serialNumber: (0, r.exists)(t, "serialNumber") ? t.serialNumber : void 0
        }
    }

    function d(e, t) {
        return null == e ? e : {
            robux: (0, r.exists)(e, "robux") ? e.robux : void 0
        }
    }
    var h = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.v1DeveloperExchangeHelpGetRaw = function(e) {
                return a(this, void 0, void 0, function() {
                    var t, n, i;
                    return s(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/developer-exchange/help",
                                    schemaPath: "/v1/developer-exchange/help",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return i = a.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, t.prototype.v1DeveloperExchangeHelpGet = function(e) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1DeveloperExchangeHelpGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1DeveloperExchangeInfoGetRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.fromDevExPage && (n.fromDevExPage = e.fromDevExPage), i = {}, [4, this.request({
                                    path: "/v1/developer-exchange/info",
                                    schemaPath: "/v1/developer-exchange/info",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        hasCurrencyOperationError: (0, r.exists)(e, "hasCurrencyOperationError") ? e.hasCurrencyOperationError : void 0,
                                        currencyOperationErrorMessage: (0, r.exists)(e, "currencyOperationErrorMessage") ? e.currencyOperationErrorMessage : void 0,
                                        showOnlyExchangeRates: (0, r.exists)(e, "showOnlyExchangeRates") ? e.showOnlyExchangeRates : void 0,
                                        emailIsVerified: (0, r.exists)(e, "emailIsVerified") ? e.emailIsVerified : void 0,
                                        isImbursementBlacklistUser: (0, r.exists)(e, "isImbursementBlacklistUser") ? e.isImbursementBlacklistUser : void 0,
                                        canProceedToCashout: (0, r.exists)(e, "canProceedToCashout") ? e.canProceedToCashout : void 0,
                                        isDevExSuspended: (0, r.exists)(e, "isDevExSuspended") ? e.isDevExSuspended : void 0,
                                        isAtRiskOfSuspension: (0, r.exists)(e, "isAtRiskOfSuspension") ? e.isAtRiskOfSuspension : void 0,
                                        devExSuspensionEndTimeUtc: (0, r.exists)(e, "devExSuspensionEndTimeUtc") ? new Date(e.devExSuspensionEndTimeUtc) : void 0,
                                        showProgressBar: (0, r.exists)(e, "showProgressBar") ? e.showProgressBar : void 0,
                                        percentRobux: (0, r.exists)(e, "percentRobux") ? e.percentRobux : void 0,
                                        minRobuxToCashOut: (0, r.exists)(e, "minRobuxToCashOut") ? e.minRobuxToCashOut : void 0,
                                        maxRobuxCanCashOut: (0, r.exists)(e, "maxRobuxCanCashOut") ? e.maxRobuxCanCashOut : void 0,
                                        lastImbursementStatus: (0, r.exists)(e, "lastImbursementStatus") ? e.lastImbursementStatus : void 0,
                                        lastImbursementSubmissionDate: (0, r.exists)(e, "lastImbursementSubmissionDate") ? new Date(e.lastImbursementSubmissionDate) : void 0,
                                        conversionPercent: (0, r.exists)(e, "conversionPercent") ? e.conversionPercent : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1DeveloperExchangeInfoGet = function() {
                return a(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1DeveloperExchangeInfoGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1DeveloperExchangeSubmitPostRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.requestModel || void 0 === e.requestModel) throw new r.RequiredError("requestModel", "Required parameter requestParameters.requestModel was null or undefined when calling v1DeveloperExchangeSubmitPost.");
                                return n = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/developer-exchange/submit",
                                    schemaPath: "/v1/developer-exchange/submit",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            password: e.password,
                                            paypalEmail: e.paypalEmail,
                                            firstName: e.firstName,
                                            lastName: e.lastName,
                                            country: e.country,
                                            robux: e.robux
                                        }
                                    }(e.requestModel)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        submitted: (0, r.exists)(e, "submitted") ? e.submitted : void 0,
                                        cashOutAbility: (0, r.exists)(e, "cashOutAbility") ? null == (t = e.cashOutAbility) ? t : {
                                            canCashOut: (0, r.exists)(t, "canCashOut") ? t.canCashOut : void 0,
                                            meetsPremiumRequirement: (0, r.exists)(t, "meetsPremiumRequirement") ? t.meetsPremiumRequirement : void 0,
                                            hasVerifiedEmail: (0, r.exists)(t, "hasVerifiedEmail") ? t.hasVerifiedEmail : void 0,
                                            isUserBlackListed: (0, r.exists)(t, "isUserBlackListed") ? t.isUserBlackListed : void 0,
                                            meetsMinimumCashOutBalance: (0, r.exists)(t, "meetsMinimumCashOutBalance") ? t.meetsMinimumCashOutBalance : void 0,
                                            hasCashedOutThisMonth: (0, r.exists)(t, "hasCashedOutThisMonth") ? t.hasCashedOutThisMonth : void 0,
                                            lastImbursementStatusIsValid: (0, r.exists)(t, "lastImbursementStatusIsValid") ? t.lastImbursementStatusIsValid : void 0
                                        } : void 0,
                                        errors: (0, r.exists)(e, "errors") ? e.errors : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1DeveloperExchangeSubmitPost = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1DeveloperExchangeSubmitPostRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(r.BaseAPI),
        v = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.v1GroupsGroupIdAddfundsAllowedGetRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdAddfundsAllowedGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/addfunds/allowed".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/addfunds/allowed",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), this.isJsonMime(a.headers.get("content-type")) ? [2, new r.JSONApiResponse(a)] : [2, new r.TextApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdAddfundsAllowedGet = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdAddfundsAllowedGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdAddfundsLatestGetRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdAddfundsLatestGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/addfunds/latest".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/addfunds/latest",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        transactionDate: (0, r.exists)(e, "transactionDate") ? e.transactionDate : void 0,
                                        rateLimitInDays: (0, r.exists)(e, "rateLimitInDays") ? e.rateLimitInDays : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdAddfundsLatestGet = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdAddfundsLatestGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdAddfundsPostRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdAddfundsPost.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdAddfundsPost.");
                                return n = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/addfunds".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/addfunds",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            robuxAmount: e.robuxAmount
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdAddfundsPost = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdAddfundsPostRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdCurrencyGetRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdCurrencyGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/currency".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/currency",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdCurrencyGet = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdCurrencyGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdDevExWatermarksGetRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdDevExWatermarksGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/devExWatermarks".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/devExWatermarks",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdDevExWatermarksGet = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdDevExWatermarksGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1UserCurrencyGetRaw = function(e) {
                return a(this, void 0, void 0, function() {
                    var t, n, i;
                    return s(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/user/currency",
                                    schemaPath: "/v1/user/currency",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return i = a.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UserCurrencyGet = function(e) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UserCurrencyGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1UsersUserIdCurrencyGetRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdCurrencyGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/users/{userId}/currency".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/currency",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UsersUserIdCurrencyGet = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersUserIdCurrencyGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1UsersUserIdDevExWatermarksGetRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdDevExWatermarksGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/users/{userId}/devExWatermarks".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/devExWatermarks",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UsersUserIdDevExWatermarksGet = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersUserIdDevExWatermarksGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(r.BaseAPI),
        m = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.v1GroupsGroupIdSnapshotRobuxGetRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdSnapshotRobuxGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/snapshot-robux".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/snapshot-robux",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        robuxAt35: (0, r.exists)(e, "robuxAt35") ? e.robuxAt35 : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdSnapshotRobuxGet = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdSnapshotRobuxGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdUsersPayoutEligibilityGetRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdUsersPayoutEligibilityGet.");
                                if (null === e.userIds || void 0 === e.userIds) throw new r.RequiredError("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1GroupsGroupIdUsersPayoutEligibilityGet.");
                                return n = {}, e.userIds && (n.userIds = e.userIds), i = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/users-payout-eligibility".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/users-payout-eligibility",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        usersGroupPayoutEligibility: (0, r.exists)(e, "usersGroupPayoutEligibility") ? e.usersGroupPayoutEligibility : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdUsersPayoutEligibilityGet = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdUsersPayoutEligibilityGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(r.BaseAPI),
        f = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.v1ProductsProductIdGetRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.productId || void 0 === e.productId) throw new r.RequiredError("productId", "Required parameter requestParameters.productId was null or undefined when calling v1ProductsProductIdGet.");
                                return n = {}, void 0 !== e.showPurchasable && (n.showPurchasable = e.showPurchasable), i = {}, [4, this.request({
                                    path: "/v1/products/{productId}".replace("{".concat("productId", "}"), encodeURIComponent(String(e.productId))),
                                    schemaPath: "/v1/products/{productId}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        purchasable: (0, r.exists)(e, "purchasable") ? e.purchasable : void 0,
                                        reason: (0, r.exists)(e, "reason") ? e.reason : void 0,
                                        productId: (0, r.exists)(e, "productId") ? e.productId : void 0,
                                        statusCode: (0, r.exists)(e, "statusCode") ? e.statusCode : void 0,
                                        title: (0, r.exists)(e, "title") ? e.title : void 0,
                                        errorMsg: (0, r.exists)(e, "errorMsg") ? e.errorMsg : void 0,
                                        showDivId: (0, r.exists)(e, "showDivId") ? e.showDivId : void 0,
                                        shortfallPrice: (0, r.exists)(e, "shortfallPrice") ? e.shortfallPrice : void 0,
                                        balanceAfterSale: (0, r.exists)(e, "balanceAfterSale") ? e.balanceAfterSale : void 0,
                                        expectedPrice: (0, r.exists)(e, "expectedPrice") ? e.expectedPrice : void 0,
                                        currency: (0, r.exists)(e, "currency") ? e.currency : void 0,
                                        price: (0, r.exists)(e, "price") ? e.price : void 0,
                                        assetId: (0, r.exists)(e, "assetId") ? e.assetId : void 0,
                                        assetName: (0, r.exists)(e, "assetName") ? e.assetName : void 0,
                                        assetType: (0, r.exists)(e, "assetType") ? e.assetType : void 0,
                                        assetTypeDisplayName: (0, r.exists)(e, "assetTypeDisplayName") ? e.assetTypeDisplayName : void 0,
                                        assetIsWearable: (0, r.exists)(e, "assetIsWearable") ? e.assetIsWearable : void 0,
                                        sellerName: (0, r.exists)(e, "sellerName") ? e.sellerName : void 0,
                                        transactionVerb: (0, r.exists)(e, "transactionVerb") ? e.transactionVerb : void 0,
                                        isMultiPrivateSale: (0, r.exists)(e, "isMultiPrivateSale") ? e.isMultiPrivateSale : void 0,
                                        premiumPricing: (0, r.exists)(e, "premiumPricing") ? l(e.premiumPricing) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ProductsProductIdGet = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1ProductsProductIdGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1PurchasesProductsProductIdPostRaw = function(e, t) {
                return a(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.productId || void 0 === e.productId) throw new r.RequiredError("productId", "Required parameter requestParameters.productId was null or undefined when calling v1PurchasesProductsProductIdPost.");
                                if (null === e.purchaseDetail || void 0 === e.purchaseDetail) throw new r.RequiredError("purchaseDetail", "Required parameter requestParameters.purchaseDetail was null or undefined when calling v1PurchasesProductsProductIdPost.");
                                return n = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/purchases/products/{productId}".replace("{".concat("productId", "}"), encodeURIComponent(String(e.productId))),
                                    schemaPath: "/v1/purchases/products/{productId}",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            expectedCurrency: e.expectedCurrency,
                                            expectedPrice: e.expectedPrice,
                                            expectedSellerId: e.expectedSellerId,
                                            expectedPromoId: e.expectedPromoId,
                                            userAssetId: e.userAssetId,
                                            saleLocationType: e.saleLocationType,
                                            saleLocationId: e.saleLocationId
                                        }
                                    }(e.purchaseDetail)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        purchased: (0, r.exists)(e, "purchased") ? e.purchased : void 0,
                                        reason: (0, r.exists)(e, "reason") ? e.reason : void 0,
                                        productId: (0, r.exists)(e, "productId") ? e.productId : void 0,
                                        statusCode: (0, r.exists)(e, "statusCode") ? e.statusCode : void 0,
                                        title: (0, r.exists)(e, "title") ? e.title : void 0,
                                        errorMsg: (0, r.exists)(e, "errorMsg") ? e.errorMsg : void 0,
                                        showDivId: (0, r.exists)(e, "showDivId") ? e.showDivId : void 0,
                                        shortfallPrice: (0, r.exists)(e, "shortfallPrice") ? e.shortfallPrice : void 0,
                                        balanceAfterSale: (0, r.exists)(e, "balanceAfterSale") ? e.balanceAfterSale : void 0,
                                        expectedPrice: (0, r.exists)(e, "expectedPrice") ? e.expectedPrice : void 0,
                                        currency: (0, r.exists)(e, "currency") ? e.currency : void 0,
                                        price: (0, r.exists)(e, "price") ? e.price : void 0,
                                        assetId: (0, r.exists)(e, "assetId") ? e.assetId : void 0,
                                        assetName: (0, r.exists)(e, "assetName") ? e.assetName : void 0,
                                        assetType: (0, r.exists)(e, "assetType") ? e.assetType : void 0,
                                        assetTypeDisplayName: (0, r.exists)(e, "assetTypeDisplayName") ? e.assetTypeDisplayName : void 0,
                                        assetIsWearable: (0, r.exists)(e, "assetIsWearable") ? e.assetIsWearable : void 0,
                                        sellerName: (0, r.exists)(e, "sellerName") ? e.sellerName : void 0,
                                        transactionVerb: (0, r.exists)(e, "transactionVerb") ? e.transactionVerb : void 0,
                                        isMultiPrivateSale: (0, r.exists)(e, "isMultiPrivateSale") ? e.isMultiPrivateSale : void 0,
                                        premiumPricing: (0, r.exists)(e, "premiumPricing") ? l(e.premiumPricing) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PurchasesProductsProductIdPost = function(e, t) {
                return a(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1PurchasesProductsProductIdPostRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(r.BaseAPI);
    (function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(t, e), t.prototype.v1AssetsAssetIdResaleDataGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new r.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdResaleDataGet.");
                            return n = {}, i = {}, [4, this.request({
                                path: "/v1/assets/{assetId}/resale-data".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/resale-data",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    assetStock: (0, r.exists)(e, "assetStock") ? e.assetStock : void 0,
                                    sales: (0, r.exists)(e, "sales") ? e.sales : void 0,
                                    numberRemaining: (0, r.exists)(e, "numberRemaining") ? e.numberRemaining : void 0,
                                    recentAveragePrice: (0, r.exists)(e, "recentAveragePrice") ? e.recentAveragePrice : void 0,
                                    originalPrice: (0, r.exists)(e, "originalPrice") ? e.originalPrice : void 0,
                                    priceDataPoints: (0, r.exists)(e, "priceDataPoints") ? e.priceDataPoints.map(o) : void 0,
                                    volumeDataPoints: (0, r.exists)(e, "volumeDataPoints") ? e.volumeDataPoints.map(o) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1AssetsAssetIdResaleDataGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AssetsAssetIdResaleDataGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v1AssetsAssetIdResellableCopiesUserAssetIdPatchRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new r.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdResellableCopiesUserAssetIdPatch.");
                            if (null === e.userAssetId || void 0 === e.userAssetId) throw new r.RequiredError("userAssetId", "Required parameter requestParameters.userAssetId was null or undefined when calling v1AssetsAssetIdResellableCopiesUserAssetIdPatch.");
                            if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AssetsAssetIdResellableCopiesUserAssetIdPatch.");
                            return n = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/assets/{assetId}/resellable-copies/{userAssetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))).replace("{".concat("userAssetId", "}"), encodeURIComponent(String(e.userAssetId))),
                                schemaPath: "/v1/assets/{assetId}/resellable-copies/{userAssetId}",
                                method: "PATCH",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        price: e.price
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a)]
                    }
                })
            })
        }, t.prototype.v1AssetsAssetIdResellableCopiesUserAssetIdPatch = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AssetsAssetIdResellableCopiesUserAssetIdPatchRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v1AssetsAssetIdResellersGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new r.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdResellersGet.");
                            return n = {}, void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), i = {}, [4, this.request({
                                path: "/v1/assets/{assetId}/resellers".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/resellers",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                    data: (0, r.exists)(e, "data") ? e.data.map(p) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1AssetsAssetIdResellersGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AssetsAssetIdResellersGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v1AssetsAssetIdUsersUserIdResellableCopiesGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1AssetsAssetIdUsersUserIdResellableCopiesGet.");
                            if (null === e.assetId || void 0 === e.assetId) throw new r.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdUsersUserIdResellableCopiesGet.");
                            return n = {}, i = {}, [4, this.request({
                                path: "/v1/assets/{assetId}/users/{userId}/resellable-copies".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/users/{userId}/resellable-copies",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    data: (0, r.exists)(e, "data") ? e.data.map(p) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1AssetsAssetIdUsersUserIdResellableCopiesGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AssetsAssetIdUsersUserIdResellableCopiesGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v1ResaleTaxRateGetRaw = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n, i;
                return s(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/resale-tax-rate",
                                schemaPath: "/v1/resale-tax-rate",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return i = a.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    taxRate: (0, r.exists)(e, "taxRate") ? e.taxRate : void 0,
                                    minimumFee: (0, r.exists)(e, "minimumFee") ? e.minimumFee : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1ResaleTaxRateGet = function(e) {
            return a(this, void 0, void 0, function() {
                return s(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1ResaleTaxRateGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    })(r.BaseAPI),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(t, e), t.prototype.v1GroupsGroupIdRevenueSummaryTimeFrameGetRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRevenueSummaryTimeFrameGet.");
                            if (null === e.timeFrame || void 0 === e.timeFrame) throw new r.RequiredError("timeFrame", "Required parameter requestParameters.timeFrame was null or undefined when calling v1GroupsGroupIdRevenueSummaryTimeFrameGet.");
                            return n = {}, i = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/revenue/summary/{timeFrame}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("timeFrame", "}"), encodeURIComponent(String(e.timeFrame))),
                                schemaPath: "/v1/groups/{groupId}/revenue/summary/{timeFrame}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    recurringRobuxStipend: (0, r.exists)(e, "recurringRobuxStipend") ? e.recurringRobuxStipend : void 0,
                                    itemSaleRobux: (0, r.exists)(e, "itemSaleRobux") ? e.itemSaleRobux : void 0,
                                    purchasedRobux: (0, r.exists)(e, "purchasedRobux") ? e.purchasedRobux : void 0,
                                    tradeSystemRobux: (0, r.exists)(e, "tradeSystemRobux") ? e.tradeSystemRobux : void 0,
                                    pendingRobux: (0, r.exists)(e, "pendingRobux") ? e.pendingRobux : void 0,
                                    groupPayoutRobux: (0, r.exists)(e, "groupPayoutRobux") ? e.groupPayoutRobux : void 0,
                                    individualToGroupRobux: (0, r.exists)(e, "individualToGroupRobux") ? e.individualToGroupRobux : void 0,
                                    premiumPayouts: (0, r.exists)(e, "premiumPayouts") ? e.premiumPayouts : void 0,
                                    groupPremiumPayouts: (0, r.exists)(e, "groupPremiumPayouts") ? e.groupPremiumPayouts : void 0,
                                    adjustmentRobux: (0, r.exists)(e, "adjustmentRobux") ? e.adjustmentRobux : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1GroupsGroupIdRevenueSummaryTimeFrameGet = function(e, t) {
            return a(this, void 0, void 0, function() {
                return s(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1GroupsGroupIdRevenueSummaryTimeFrameGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(r.BaseAPI);
    var y = e.i(272593);
    let b = new class {
        getUserCurrency(e) {
            return this.currencyApi.v1UsersUserIdCurrencyGet({
                userId: e
            })
        }
        getGroupCurrency(e) {
            return this.currencyApi.v1GroupsGroupIdCurrencyGet({
                groupId: e
            })
        }
        async getDeveloperExchangeInfo(e) {
            return this.cashoutApi.v1DeveloperExchangeInfoGet({
                fromDevExPage: e
            })
        }
        getGroupUserPayoutEligibility(e, t) {
            return this.groupPayoutsApi.v1GroupsGroupIdUsersPayoutEligibilityGet({
                userIds: t,
                groupId: e
            })
        }
        getGroupSnapshotRobux(e) {
            return this.groupPayoutsApi.v1GroupsGroupIdSnapshotRobuxGet({
                groupId: e
            })
        }
        getGroupDevExWatermarks(e) {
            return this.currencyApi.v1GroupsGroupIdDevExWatermarksGet({
                groupId: e
            })
        }
        constructor() {
            (0, t._)(this, "currencyApi", void 0), (0, t._)(this, "cashoutApi", void 0), (0, t._)(this, "productApi", void 0), (0, t._)(this, "groupPayoutsApi", void 0);
            const e = (0, y.createClientConfiguration)("economy", "bedev1");
            this.currencyApi = new v(e), this.cashoutApi = new h(e), this.productApi = new f(e), this.groupPayoutsApi = new m(e)
        }
    };
    e.s(["default", 0, b], 199475)
}, 486736, e => {
    "use strict";
    var t = e.i(221628),
        r = e.i(416340),
        n = e.i(639102),
        i = e.i(199475),
        a = e.i(429246);
    let s = Object.keys(a.featureFlagDefaults).reduce((e, t) => ({
            ...e,
            [t]: a.featureFlagDefaults[t]
        }), {}),
        o = {
            isUserEligibleForDevEx: !1
        },
        u = {
            ...s,
            ...o,
            isExperienceCreatedByCurrentUserOrGroup: !1
        },
        c = async () => {
            try {
                let {
                    applicationSettings: e = {}
                } = await n.settingsClient.getApplicationSettings(), t = {};
                return Object.entries(e).forEach(e => {
                    let [r, n] = e;
                    try {
                        let e = typeof s[r];
                        t[r] = "boolean" === e || "number" === e ? JSON.parse(n) : n
                    } catch (e) {
                        console.error(e)
                    }
                }), t
            } catch (e) {
                return s
            }
        }, l = async () => {
            try {
                return await i.default.getDeveloperExchangeInfo(), {
                    isUserEligibleForDevEx: !0
                }
            } catch (e) {
                return o
            }
        }, p = (0, r.createContext)({
            settings: {
                ...u
            },
            status: "initial",
            isFetched: !1
        });
    e.s(["SettingsProvider", 0, e => {
        let {
            children: n
        } = e, [i, a] = (0, r.useState)(() => ({
            settings: {
                ...u
            },
            status: "initial",
            isFetched: !1
        }));
        return (0, r.useEffect)(() => {
            (async () => {
                let e = await Promise.allSettled([c(), l()]);
                a({
                    settings: e.reduce((e, t) => ({
                        ...e,
                        ..."fulfilled" === t.status ? t.value : {}
                    }), u),
                    isFetched: !0,
                    status: e.find(e => "rejected" === e.status) ? "error" : "success"
                })
            })()
        }, []), (0, t.jsx)(p.Provider, {
            value: i,
            children: n
        })
    }, "useSettings", 0, () => {
        let {
            settings: e,
            status: t,
            isFetched: n
        } = (0, r.useContext)(p), i = (0, r.useRef)(e);
        return {
            settings: (0, r.useMemo)(() => {
                let t = i.current;
                return Object.keys(e).some(r => e[r] !== t[r]) && (i.current = e), i.current
            }, [e]),
            status: t,
            isFetched: n
        }
    }], 486736)
}, 429246, e => {
    "use strict";
    var t, r = ((t = {}).enableExample = "enableExample", t.enableActivityFeedLocation = "enableActivityFeedLocation", t.enableDevexMaintenanceBanner = "enableDevexMaintenanceBanner", t.affiliateProgramAllowlist = "affiliateProgramAllowlist", t.enablePlayerFeedback = "enablePlayerFeedback", t.enablePlayerFeedbackUnrated = "enablePlayerFeedbackUnrated", t.enablePlayerFeedbackCategoryResetBeforeResponse = "enablePlayerFeedbackCategoryResetBeforeResponse", t.enableEnvironments = "enableEnvironments", t.enableYourPlaceCreationExperimentDate = "enableYourPlaceCreationExperimentDate", t.creatorRewardsAllowlist = "creatorRewardsAllowlist", t.unratedExperienceBannerLink = "unratedExperienceBannerLink", t.enableRentables = "enableRentables", t.rentablesPostLaunchWhitelist = "rentablesPostLaunchWhitelist", t.enableContentMaturity18Plus = "enableContentMaturity18Plus", t.enableMakeupAssets = "enableMakeupAssets", t.enableQuestionnaireHelpDialog = "enableQuestionnaireHelpDialog", t.ageVerificationUpsellBannerStartDate = "ageVerificationUpsellBannerStartDate", t.ageVerificationUpsellBannerEndDate = "ageVerificationUpsellBannerEndDate", t.ageVerificationUpsellBannerHighPriorityDate = "ageVerificationUpsellBannerHighPriorityDate", t.ageVerificationUpsellGetStartedUrl = "ageVerificationUpsellGetStartedUrl", t.ageVerificationUpsellViewDetailsUrl = "ageVerificationUpsellViewDetailsUrl", t.serverManagementDevAllowlist = "serverManagementDevAllowlist", t.enableSignalRCrossTab = "enableSignalRCrossTab", t.enableImageTranslationEnrollment = "enableImageTranslationEnrollment", t.showTaxonomyOnAvatarItemAnalyticsTab = "showTaxonomyOnAvatarItemAnalyticsTab", t.enableSecureTeleports = "enableSecureTeleports", t.serverManagementIncreaseRestartDelay = "serverManagementIncreaseRestartDelay", t.serverManagementCustomPayloadReady = "serverManagementCustomPayloadReady", t.serverManagementShowShutdownServers = "serverManagementShowShutdownServers", t.establishTrustUpsellGetStartedUrl = "establishTrustUpsellGetStartedUrl", t.establishTrustUpsellViewDetailsUrl = "establishTrustUpsellViewDetailsUrl", t.starterPlaceTemplateId = "starterPlaceTemplateId", t.enableTalentHubV2 = "enableTalentHubV2", t.enableTalentHubV2M2 = "enableTalentHubV2M2", t.enablePlaceModerationCheckBeforeStudioOpen = "enablePlaceModerationCheckBeforeStudioOpen", t.enableIpPlatformConditionalOffers = "enableIpPlatformConditionalOffers", t.impactedBannerScoutMaxPages = "impactedBannerScoutMaxPages", t.impactedExperiencesDevForumUrl = "impactedExperiencesDevForumUrl", t.impactedExperiencesAgeLearnMoreUrl = "impactedExperiencesAgeLearnMoreUrl", t.enableGroupModerationPage = "enableGroupModerationPage", t.impactedExperiencesMaxUniverseIds = "impactedExperiencesMaxUniverseIds", t.isHdEnabled = "isHdEnabled", t.enableReducedMarketplaceVisibilityBanner = "enableReducedMarketplaceVisibilityBanner", t.enableCoreContentGatedBanner = "enableCoreContentGatedBanner", t.publishEligibilityDevForumUrl = "publishEligibilityDevForumUrl", t.enableAudioUploadRevamp = "enableAudioUploadRevamp", t.enableRtbfSetting = "enableRtbfSetting", t.rtbfSettingAllowlist = "rtbfSettingAllowlist", t.enableAvatarAnimations = "enableAvatarAnimations", t.enableAvatarBackgrounds = "enableAvatarBackgrounds", t.enableIpPlatformDecoupleListingCreationFromLicenseCreation = "enableIpPlatformDecoupleListingCreationFromLicenseCreation", t.serverManagementShowServerLogs = "serverManagementShowServerLogs", t.enable2D3DUnificationBanner = "enable2D3DUnificationBanner", t.unification2D3DBannerLearnMoreUrl = "unification2D3DBannerLearnMoreUrl", t.enableUgcUploadPublishBlockBanner = "enableUgcUploadPublishBlockBanner", t.enableDataStoreRequestSourceAnalytics = "enableDataStoreRequestSourceAnalytics", t.enableIpPlatformMatchesTableEsIndexImprovements = "enableIpPlatformMatchesTableEsIndexImprovements", t.enableEmissive = "enableEmissive", t.presetChatMinPresetsPerCategory = "presetChatMinPresetsPerCategory", t.presetChatMaxPresetsPerCategory = "presetChatMaxPresetsPerCategory", t);
    let n = {
        enableExample: !1,
        enableActivityFeedLocation: !1,
        enableDevexMaintenanceBanner: !1,
        affiliateProgramAllowlist: "",
        enablePlayerFeedback: !1,
        enablePlayerFeedbackUnrated: !1,
        enablePlayerFeedbackCategoryResetBeforeResponse: !1,
        enableEnvironments: !1,
        enableYourPlaceCreationExperimentDate: new Date("2025-09-23").toISOString(),
        creatorRewardsAllowlist: "",
        unratedExperienceBannerLink: "",
        enableRentables: !1,
        rentablesPostLaunchWhitelist: "",
        enableContentMaturity18Plus: !1,
        enableMakeupAssets: !1,
        enableQuestionnaireHelpDialog: !1,
        ageVerificationUpsellBannerStartDate: new Date("2025-12-03").toISOString(),
        ageVerificationUpsellBannerEndDate: new Date("2026-06-01").toISOString(),
        ageVerificationUpsellBannerHighPriorityDate: new Date("2026-01-21").toISOString(),
        ageVerificationUpsellGetStartedUrl: "https://www.roblox.com/my/account?creatorCollaboration",
        ageVerificationUpsellViewDetailsUrl: "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693",
        serverManagementDevAllowlist: "",
        enableSignalRCrossTab: !1,
        enableImageTranslationEnrollment: !1,
        showTaxonomyOnAvatarItemAnalyticsTab: !1,
        enableSecureTeleports: !1,
        serverManagementIncreaseRestartDelay: !1,
        serverManagementCustomPayloadReady: !1,
        serverManagementShowShutdownServers: !1,
        establishTrustUpsellGetStartedUrl: "https://www.roblox.com/my/account?creatorCollaboration",
        establishTrustUpsellViewDetailsUrl: "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693",
        starterPlaceTemplateId: 0x5cc7aab30524,
        enableTalentHubV2: !1,
        enableTalentHubV2M2: !1,
        enablePlaceModerationCheckBeforeStudioOpen: !1,
        enableIpPlatformConditionalOffers: !1,
        impactedBannerScoutMaxPages: 8,
        impactedExperiencesDevForumUrl: "https://devforum.roblox.com/",
        impactedExperiencesAgeLearnMoreUrl: "https://en.help.roblox.com/hc/en-us/articles/39143693116052-Understanding-Age-Checks-on-Roblox",
        enableGroupModerationPage: !1,
        impactedExperiencesMaxUniverseIds: 3,
        isHdEnabled: !1,
        enableReducedMarketplaceVisibilityBanner: !1,
        enableCoreContentGatedBanner: !1,
        publishEligibilityDevForumUrl: "",
        enableAudioUploadRevamp: !1,
        enableRtbfSetting: !1,
        rtbfSettingAllowlist: "",
        enableAvatarAnimations: !1,
        enableAvatarBackgrounds: !1,
        enableIpPlatformDecoupleListingCreationFromLicenseCreation: !1,
        serverManagementShowServerLogs: !1,
        enable2D3DUnificationBanner: !1,
        unification2D3DBannerLearnMoreUrl: "",
        enableUgcUploadPublishBlockBanner: !1,
        enableDataStoreRequestSourceAnalytics: !1,
        enableIpPlatformMatchesTableEsIndexImprovements: !1,
        enableEmissive: !1,
        presetChatMinPresetsPerCategory: 3,
        presetChatMaxPresetsPerCategory: 10
    };
    e.s(["FeatureFlagName", () => r, "featureFlagDefaults", 0, n])
}]);

//# debugId=3af447e2-1fa5-4046-be94-c91e9fdd4ea8
//# sourceMappingURL=2bk2vgf2kkgih.js.map