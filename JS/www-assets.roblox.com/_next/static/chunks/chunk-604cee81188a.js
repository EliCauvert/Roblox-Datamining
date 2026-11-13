;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f6239778-5153-ebbc-134e-e45c5f4e9ca3")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 645020, e => {
    "use strict";
    e.s(["parseFloat", 0, e => {
        let t = Number.parseFloat(e);
        return Number.isNaN(t) ? null : t
    }, "parseInt", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 10,
            r = Number.parseInt(e, t);
        return Number.isNaN(r) ? null : r
    }])
}, 734899, e => {
    "use strict";
    let t = () => {
            let e, t;
            return {
                promise: new Promise((r, s) => {
                    e = r, t = s
                }),
                resolve: e,
                reject: t
            }
        },
        r = (e, r) => {
            let s, {
                    delay: a,
                    maxSize: o
                } = e,
                i = [],
                n = t(),
                l = () => {
                    let {
                        resolve: e,
                        reject: s
                    } = n, a = i;
                    i = [], n = t(), r(a).then(e).catch(s)
                };
            return e => {
                0 === i.length && (s = setTimeout(l, a)), i.push(e);
                let {
                    promise: t
                } = n;
                return null != o && i.length >= o && (clearTimeout(s), l()), t
            }
        };
    e.s(["batch", 0, r, "batchQuery", 0, (e, t, s) => {
        let a = r(e, t);
        return e => a(e).then(t => s(t, e))
    }, "queue", 0, (e, r) => {
        let s = 0,
            a = [],
            o = () => {
                let e = a.shift();
                if (void 0 === e) s -= 1;
                else {
                    let [t, {
                        resolve: s,
                        reject: a
                    }] = e;
                    r(...t).then(s).catch(a).finally(o)
                }
            };
        return function() {
            for (var i = arguments.length, n = Array(i), l = 0; l < i; l++) n[l] = arguments[l];
            if (s < e) return s += 1, r(...n).finally(o);
            let p = t();
            return a.push([n, p]), p.promise
        }
    }, "timeout", 0, e => new Promise(t => {
        setTimeout(t, e)
    }), "withResolvers", 0, t])
}, 646424, 552566, 849735, 763170, 874775, e => {
    "use strict";
    var t = e.i(868275);
    class r extends Error {
        constructor(e) {
            super("Reason" === e.code ? void 0 : e.message, {
                cause: e
            }), (0, t._)(this, "cause", void 0), this.cause = e
        }
    }
    let s = e => e instanceof DOMException && ("AbortError" === e.name || "TimeoutError" === e.name) ? new r({
            code: "AbortError" === e.name ? "Abort" : "Timeout",
            message: e.message
        }) : null,
        a = e => s(e.reason) ?? new r({
            code: "Reason",
            reason: e.reason
        });
    e.s(["AbortError", 0, r, "abortErrorFromError", 0, s, "abortErrorFromSignal", 0, a], 552566);
    var o = e.i(723941),
        i = e.i(360702),
        n = e.i(240549);
    class l extends Error {
        static new(e, t, r, s) {
            let {
                headers: a,
                redirected: o,
                status: i,
                statusText: n,
                type: p,
                url: c
            } = r;
            return new l(e, t, {
                headers: a,
                redirected: o,
                status: i,
                statusText: n,
                type: p,
                url: c,
                body: s
            })
        }
        constructor(e, r, s) {
            super(`${s.status} ${r.method} ${e.href}`), (0, t._)(this, "url", void 0), (0, t._)(this, "request", void 0), (0, t._)(this, "response", void 0), this.url = e, this.request = r, this.response = s
        }
    }
    class p extends Error {
        constructor(e) {
            super(e.message, {
                cause: e
            }), (0, t._)(this, "cause", void 0), this.cause = e
        }
    }
    e.s(["HttpError", 0, l, "UnknownFetchError", 0, p], 849735);
    var c = e.i(734899);
    let u = (e, t) => i.AsyncResult.fromExecutor(r => {
        if (t.aborted) return void r((0, i.err)(a(t)));
        let s = setTimeout(() => {
            r((0, i.ok)(null))
        }, e);
        t.addEventListener("abort", () => {
            clearTimeout(s), r((0, i.err)(a(t)))
        }, {
            once: !0
        })
    });
    e.s(["abortableTimeout", 0, u], 763170);
    var h = e.i(645020);
    let d = (e, t) => r => Math.min(2 ** r * e, t),
        m = [408, 429, 500, 502, 503, 504],
        g = e => {
            if (!(e instanceof l)) return null;
            let t = e.response.headers.get("Retry-After");
            if (null == t) return null;
            let r = (0, h.parseInt)(t);
            if (null != r) return 1e3 * r;
            let s = (0, i.tryCatch)(() => new Date(t), () => null).getOrNull();
            return null != s ? s.getTime() - Date.now() : null
        },
        b = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : m;
            return e instanceof p || e instanceof l && t.includes(e.response.status)
        },
        f = e => (t, r) => {
            let {
                retry: s,
                signal: a
            } = r;
            return null == s ? e(t, r) : e(t, r).orElse(async o => {
                let n = o,
                    l = 0,
                    p = s(0, n);
                for (; null != p && Number.isFinite(p);) {
                    if (p > 0)
                        if (null == a) await (0, c.timeout)(p);
                        else {
                            let e = await u(p, a);
                            if (e.isErr()) return e.cast()
                        } l += 1, r.headers.set("x-retry-attempt", l.toString());
                    let o = await e(t, r);
                    if (o.isOk()) return o;
                    ({
                        error: n
                    } = o), p = s(l, n)
                }
                return (0, i.errAsync)(n)
            })
        };
    e.s(["defaultRetryableHttpStatuses", 0, m, "exponentialBackoff", 0, d, "isRetryableError", 0, b, "retryAfterHeaderDelay", 0, g, "retryInterceptor", 0, f], 874775);
    let v = (e => {
            let {
                maxRetries: t,
                factor: r,
                maxDelay: s,
                retryableHttpStatuses: a = m
            } = e, o = d(r, s);
            return (e, r) => e < t && b(r, a) ? g(r) ?? o(e) : NaN
        })({
            maxRetries: 3,
            factor: 1e3,
            maxDelay: 3e4
        }),
        w = (e, t) => i.AsyncResult.fromPromise(globalThis.fetch(e.href, t), e => s(e) ?? new p(e)).andThen(r => r.ok ? (0, i.ok)(r) : t.includeBodyOnError ? r.text().catch(() => void 0).then(s => (0, i.err)(l.new(e, t, r, s))) : (0, i.err)(l.new(e, t, r))),
        A = f(w),
        y = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                r = t.method ?? "GET",
                s = new Headers(t.headers);
            return A(e, {
                ...t,
                method: r,
                headers: s
            })
        },
        x = e => i.AsyncResult.fromPromise(e.json(), e => new o.JsonDeserializationError({
            code: "Syntax",
            error: e
        })),
        T = e => t => x(t).andThen(t => (0, n.zodSafeParse)(e, t).mapErr(e => new o.JsonDeserializationError({
            code: "Validation",
            error: e
        }))),
        k = (e, t, r) => {
            let s = (0, o.serialize)(t);
            if (s.isErr()) return (0, i.errAsync)(s.error);
            let a = new Headers(r?.headers);
            return a.set("content-type", "application/json"), y(e, {
                ...r,
                method: "POST",
                headers: a,
                body: s.value
            })
        };
    e.s(["defaultBrowserRetryDelay", 0, v, "fetch", 0, y, "get", 0, (e, t, r) => y(e, r).andThen(T(t)), "getUntyped", 0, (e, t) => y(e, t).andThen(x), "post", 0, (e, t, r, s) => k(e, t, s).andThen(T(r)), "postUntyped", 0, (e, t, r) => k(e, t, r).andThen(e => {
        let t;
        return "application/json" === (t = e.headers.get("content-type")) || t?.startsWith("application/json;") ? x(e) : (0, i.okAsync)(void 0)
    }), "setInterceptors", 0, e => {
        A = e.toReversed().reduce((e, t) => t(e), w)
    }], 646424)
}, 357355, e => {
    "use strict";
    let t = globalThis.window,
        r = globalThis.document,
        s = globalThis.navigator,
        a = void 0 === t ? void 0 : t;
    e.s(["document", 0, void 0 === r ? void 0 : r, "navigator", 0, null == a || void 0 === s ? void 0 : s, "window", 0, a])
}, 545819, e => {
    "use strict";
    let t = (e, t, r) => {
        let s = null == r.sameSite ? "" : `;samesite=${r.sameSite}`,
            a = null == r.domain ? "" : `;domain=${r.domain}`,
            o = `;path=${r.path??"/"}`,
            i = null == r.expires ? "" : `;expires=${r.expires.toUTCString()}`,
            n = null == r.maxAge ? "" : `;max-age=${r.maxAge}`;
        document.cookie = `${e}=${encodeURIComponent(t)};secure${s}${a}${o}${i}${n}`
    };
    e.s(["delete", 0, (e, r) => {
        let {
            domain: s,
            path: a
        } = r;
        t(e, "", {
            domain: s,
            path: a,
            expires: new Date(0)
        })
    }, "get", 0, e => {
        let t = `${e}=`,
            r = document.cookie.split("; ").find(e => e.startsWith(t))?.slice(t.length);
        return null == r ? null : {
            name: e,
            value: decodeURIComponent(r)
        }
    }, "set", 0, (e, r, s) => {
        t(e, r, s)
    }])
}, 889375, 181759, 270784, e => {
    "use strict";
    let t, r;
    var s, a = e.i(357355),
        o = e.i(646424),
        i = e.i(849735);

    function n(e, t, r) {
        return t in e ? Object.defineProperty(e, t, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = r, e
    }
    var l = function e() {
        var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
            baseUrl: ""
        };
        if (!(this instanceof e)) throw TypeError("Cannot call a class as a function");
        n(this, "configuration", void 0), n(this, "baseUrl", void 0), this.configuration = t, this.baseUrl = this.configuration.baseUrl
    };

    function p(e, t, r) {
        return t in e ? Object.defineProperty(e, t, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = r, e
    }
    var c = function() {
        var e;

        function t() {
            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : new l;
            if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
            p(this, "configuration", void 0), p(this, "baseUrl", void 0), this.configuration = e, this.baseUrl = e.baseUrl
        }
        return e = [{
                key: "sendEvent",
                value: function(e) {
                    var t = e.localTime,
                        r = e.target,
                        s = e.eventType,
                        a = e.context,
                        o = e.additionalProperties,
                        i = e.currentUrl,
                        n = e.guestId,
                        l = e.sessionId,
                        p = t.toISOString(),
                        c = new URL("".concat(this.baseUrl, "/pe"));
                    return c.searchParams.append("t", r), c.searchParams.append("evt", s), c.searchParams.append("ctx", a), c.searchParams.append("lt", p), c.searchParams.append("url", i || window.location.href), void 0 !== n && c.searchParams.append("gid", n), void 0 !== l && c.searchParams.append("sid", l), void 0 !== o && Object.keys(o).forEach(function(e) {
                        var t;
                        c.searchParams.append(e, (null != (t = o[e]) ? t : "").toString())
                    }), fetch(c.href, {
                        credentials: "same-origin"
                    })
                }
            }, {
                key: "sendEventViaImg",
                value: function(e, t) {
                    var r = e.localTime,
                        s = e.target,
                        a = e.eventType,
                        o = e.context,
                        i = e.additionalProperties,
                        n = e.currentUrl,
                        l = e.guestId,
                        p = e.sessionId,
                        c = r.toISOString(),
                        u = new URL("".concat(this.baseUrl, "/e.png"));
                    u.searchParams.append("t", s), u.searchParams.append("evt", a), u.searchParams.append("ctx", o), u.searchParams.append("lt", c), u.searchParams.append("url", n || window.location.href), void 0 !== l && u.searchParams.append("gid", l), void 0 !== p && u.searchParams.append("sid", p), void 0 !== i && Object.keys(i).forEach(function(e) {
                        var t;
                        u.searchParams.append(e, (null != (t = i[e]) ? t : "").toString())
                    });
                    var h = new Image;
                    return h.src = u.href, h.onload = function() {
                        void 0 !== t && t(!0)
                    }, h.onerror = function(e) {
                        void 0 !== t && t(!1), console.error(e)
                    }, h
                }
            }],
            function(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var s = t[r];
                    s.enumerable = s.enumerable || !1, s.configurable = !0, "value" in s && (s.writable = !0), Object.defineProperty(e, s.key, s)
                }
            }(t.prototype, e), t
    }();
    e.s(["Configuration", 0, l, "Tracker", 0, c], 181759);
    var u = e.i(545819);
    let h = () => (0, u.get)("RBXSessionTracker")?.value.match(/sessionid=([^&]*)/i)?.[1] ?? !1,
        d = () => (0, u.get)("GuestData")?.value.match(/userid=([^&]*)/i)?.[1] ?? !1;
    e.s(["getBrowserTrackerId", 0, () => (0, u.get)("RBXEventTrackerV2")?.value.match(/browserid=([^&]*)/i)?.[1] ?? !1, "getGuestId", 0, d, "getSessionId", 0, h], 270784);
    var m = e.i(815079);
    (s = {}).Click = "click", s.Hover = "hover", s.Load = "load";
    let g = (t = new c(new l({
        baseUrl: m.eventStreamApi.withPath("www").href
    })), r = (e, t, r) => {
        let s = null != a.document;
        return {
            target: "www",
            localTime: new Date,
            eventType: e,
            context: t ?? "click",
            guestId: s && d() || void 0,
            sessionId: s && h() || void 0,
            additionalProperties: {
                renderingPlatform: "nextjs",
                ...r
            }
        }
    }, {
        sendEvent: (e, s, a) => {
            t.sendEventViaImg(r(e, s, a))
        },
        sendEventWithKeepalive: (e, t, s) => {
            var n;
            let l, p = (l = [
                ["t", (n = r(e, t, s)).target],
                ["evt", n.eventType],
                ["ctx", n.context],
                ["lt", n.localTime.toISOString()],
                ["url", n.currentUrl ?? a.document?.URL ?? ""]
            ], void 0 !== n.guestId && l.push(["gid", n.guestId]), void 0 !== n.sessionId && l.push(["sid", n.sessionId]), Object.entries(n.additionalProperties ?? {}).forEach(e => {
                let [t, r] = e;
                l.push([t, String(r ?? "")])
            }), m.eventStreamApi.withPath("www/e.png").withSearchParams(l));
            o.fetch(p, {
                mode: "no-cors",
                credentials: "include",
                keepalive: !0,
                retry: () => null
            }).inspectErr(e => {
                e instanceof i.HttpError || console.error(e)
            })
        }
    });
    e.s(["eventStreamClientV1", 0, g, "sendEvent", 0, (e, t, r) => {
        g.sendEvent(e, t, r)
    }, "sendEventWithKeepalive", 0, (e, t, r) => {
        g.sendEventWithKeepalive(e, t, r)
    }], 889375)
}, 245837, e => {
    "use strict";
    var t = e.i(815079),
        r = e.i(587541),
        s = e.i(152972);
    let a = {
            sitetest3: r.Url.parse("https://avatar.sitetest3.robloxlabs.com").getOrThrow(),
            sitetest2: r.Url.parse("https://avatar.sitetest2.robloxlabs.com").getOrThrow(),
            sitetest1: r.Url.parse("https://avatar.sitetest1.robloxlabs.com").getOrThrow(),
            production: r.Url.parse("https://avatar.roblox.com").getOrThrow()
        } [s.robloxEnv],
        o = {
            sitetest3: r.Url.parse("https://catalog.sitetest3.robloxlabs.com").getOrThrow(),
            sitetest2: r.Url.parse("https://catalog.sitetest2.robloxlabs.com").getOrThrow(),
            sitetest1: r.Url.parse("https://catalog.sitetest1.robloxlabs.com").getOrThrow(),
            production: r.Url.parse("https://catalog.roblox.com").getOrThrow()
        } [s.robloxEnv],
        i = {
            sitetest3: r.Url.parse("https://economy.sitetest3.robloxlabs.com").getOrThrow(),
            sitetest2: r.Url.parse("https://economy.sitetest2.robloxlabs.com").getOrThrow(),
            sitetest1: r.Url.parse("https://economy.sitetest1.robloxlabs.com").getOrThrow(),
            production: r.Url.parse("https://economy.roblox.com").getOrThrow()
        } [s.robloxEnv],
        n = {
            sitetest3: r.Url.parse("https://inventory.sitetest3.robloxlabs.com").getOrThrow(),
            sitetest2: r.Url.parse("https://inventory.sitetest2.robloxlabs.com").getOrThrow(),
            sitetest1: r.Url.parse("https://inventory.sitetest1.robloxlabs.com").getOrThrow(),
            production: r.Url.parse("https://inventory.roblox.com").getOrThrow()
        } [s.robloxEnv],
        l = {
            sitetest3: r.Url.parse("https://privatemessages.sitetest3.robloxlabs.com").getOrThrow(),
            sitetest2: r.Url.parse("https://privatemessages.sitetest2.robloxlabs.com").getOrThrow(),
            sitetest1: r.Url.parse("https://privatemessages.sitetest1.robloxlabs.com").getOrThrow(),
            production: r.Url.parse("https://privatemessages.roblox.com").getOrThrow()
        } [s.robloxEnv],
        p = {
            sitetest3: r.Url.parse("https://thumbnails.sitetest3.robloxlabs.com").getOrThrow(),
            sitetest2: r.Url.parse("https://thumbnails.sitetest2.robloxlabs.com").getOrThrow(),
            sitetest1: r.Url.parse("https://thumbnails.sitetest1.robloxlabs.com").getOrThrow(),
            production: r.Url.parse("https://thumbnails.roblox.com").getOrThrow()
        } [s.robloxEnv],
        c = {
            sitetest3: "sitetest3.robloxlabs.com",
            sitetest2: "sitetest2.robloxlabs.com",
            sitetest1: "sitetest1.robloxlabs.com",
            production: "roblox.com"
        } [s.robloxEnv],
        u = e => e.toString().replace(/\/+$/, ""),
        h = {
            apiGatewayUrl: u(t.apiGateway),
            websiteUrl: u(t.wwwRoblox),
            authApi: u(t.authApi),
            avatarApi: u(a),
            beaconApi: t.apiGateway.withPath("/beacon-api").toString(),
            catalogApi: u(o),
            domain: c,
            economyApi: u(i),
            inventoryApi: u(n),
            metricsApi: u(t.metricsApi),
            privateMessagesApi: u(l),
            thumbnailsApi: u(p),
            accountInformationApi: `https://accountinformation.${c}`,
            accountSettingsApi: `https://accountsettings.${c}`,
            apiGatewayCdnUrl: "production" === s.robloxEnv ? "https://apis.rbxcdn.com" : `https://apis.${c}`,
            gamesApi: `https://games.${c}`,
            tradesApi: `https://trades.${c}`,
            twoStepVerificationApi: `https://twostepverification.${c}`,
            userModerationApi: `https://usermoderation.${c}`,
            usersApi: `https://users.${c}`,
            abtestingApiSite: `https://abtesting.${c}`,
            adConfigurationApi: `https://adconfiguration.${c}`,
            adsApi: `https://ads.${c}`,
            advertiseApi: `https://advertise.${c}`,
            apiProxyUrl: `https://api.${c}`,
            assetDeliveryApi: `https://assetdelivery.${c}`,
            assetPathPrefix: `https://assets.create.${c}`,
            badgesApi: `https://badges.${c}`,
            billingApi: `https://billing.${c}`,
            captchaApi: `https://captcha.${c}`,
            chatApi: t.apiGateway.withPath("/platform-chat-api").toString(),
            chatModerationApi: `https://chatmoderation.${c}`,
            contactsApi: `https://contacts.${c}`,
            contactsServiceApi: t.apiGateway.withPath("/contacts-api").toString(),
            contentStoreApi: `https://contentstore.${c}`,
            developApi: `https://develop.${c}`,
            economycreatorstatsApi: `https://economycreatorstats.${c}`,
            engagementPayoutsApi: `https://engagementpayouts.${c}`,
            followingsApi: `https://followings.${c}`,
            friendsApi: `https://friends.${c}`,
            gameInternationalizationApi: `https://gameinternationalization.${c}`,
            gameJoinApi: `https://gamejoin.${c}`,
            gameUpdateNotificationsApi: t.apiGateway.withPath("/game-update-notifications").toString(),
            groupsApi: `https://groups.${c}`,
            groupsModerationApi: `https://groupsmoderation.${c}`,
            helpSite: `https://en.help.${c}`,
            itemConfigurationApi: `https://itemconfiguration.${c}`,
            legacyChatApi: `https://chat.${c}`,
            localeApi: `https://locale.${c}`,
            localizationTablesApi: `https://localizationtables.${c}`,
            matchmakingApi: t.apiGateway.withPath("/matchmaking-api").toString(),
            midasApi: `https://midas.${c}`,
            modalsApi: t.apiGateway.withPath("/modals-api").toString(),
            notificationApi: `https://notifications.${c}`,
            passProductPurchasingApi: t.apiGateway.withPath("/pass-product-purchasing").toString(),
            playWebsite: `https://play.${c}`,
            bundlesProductPurchasingApi: t.apiGateway.withPath("/bundles-product-purchasing").toString(),
            premiumFeaturesApi: `https://premiumfeatures.${c}`,
            presenceApi: `https://presence.${c}`,
            profileInsightsApi: t.apiGateway.withPath("/profile-insights-api").toString(),
            publishApi: `https://publish.${c}`,
            restrictedHoursServiceApi: t.apiGateway.withPath("/restricted-hours-service").toString(),
            screenTimeApi: "https://apis.rcs.roblox.com/screen-time-api",
            shareApi: `https://share.${c}`,
            shareLinksApi: t.apiGateway.withPath("/sharelinks").toString(),
            shareLinksApiV2: t.apiGateway.withPath("/deeplinks").toString(),
            showcasesApi: t.apiGateway.withPath("/showcases-api").toString(),
            translationRolesApi: `https://translationroles.${c}`,
            userAgreementsServiceApi: t.apiGateway.withPath("/user-agreements").toString(),
            userSettingsApi: t.apiGateway.withPath("/user-settings-api").toString(),
            voiceApi: `https://voice.${c}`,
            eduAuthenticationApi: "production" === s.robloxEnv ? "https://auth.rblx.org" : `https://auth.${s.robloxEnv}.rblx.org`,
            eduWebsiteUrl: "production" === s.robloxEnv ? "https://www.rblx.org" : `https://www.${s.robloxEnv}.rblx.org`,
            guildedBaseUrl: "production" === s.robloxEnv ? "https://guilded.gg" : "sitetest1" === s.robloxEnv ? "https://tarobi-dev-test.com" : "https://tarobi-dev-sandbox.com",
            vngGamesShopUrl: "production" === s.robloxEnv ? "https://shop.vnggames.com/vn/game/roblox" : "https://sbx-shop.vnggames.com/vn/game/roblox",
            stripeCheckoutDomain: `pay.${c}`,
            amazonStoreLink: "https://www.amazon.com/Roblox-Corporation/dp/B00NUF4YOA",
            amazonWebStoreLink: "https%3a%2f%2fwww.amazon.com%2froblox%3f%26_encoding%3dUTF8%26tag%3dr05d13-20%26linkCode%3dur2%26linkId%3d5562fc29c05b45562a86358c198356eb%26camp%3d1789%26creative%3d9325",
            appProtocolUrl: "robloxmobile://",
            googlePlayStoreLink: "https://play.google.com/store/apps/details?id=com.roblox.client&hl=en",
            appStoreLink: "https://itunes.apple.com/us/app/roblox-mobile/id431946152",
            iosAppStoreLink: "https://itunes.apple.com/us/app/roblox-mobile/id431946152",
            windowsStoreLink: "https://www.microsoft.com/en-us/store/games/roblox/9nblgggzm6wm",
            xboxStoreLink: "https://www.microsoft.com/en-us/p/roblox/bq1tn1t79v9k"
        };
    e.s(["EnvironmentUrls", 0, h, "default", 0, h])
}, 61907, e => {
    "use strict";
    e.s(["fromPeriodToColonDelimited", 0, e => e.replaceAll(".", ":"), "toFullKeyPath", 0, e => {
        if ("string" != typeof e || 0 === e.length) return;
        let t = e.split(".");
        if (t.length <= 2 || t.some(e => 0 === e.length)) return;
        let r = t.slice(0, 2),
            s = t.slice(2).join(":"),
            a = r.join(":");
        return {
            path: `${a}.${s}`,
            namespace: r.join("."),
            key: s
        }
    }])
}, 880983, e => {
    "use strict";
    var t = e.i(682259);
    let r = ["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "nl_nl", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"],
        s = [...r, "bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"],
        a = ["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"],
        o = ["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "nl", "pl", "pt", "th", "tr", "vi"],
        i = [...o, ...a];
    e.s(["defaultLanguage", 0, "en", "defaultLocale", 0, "en-us", "fullySupportedLocalesLowercaseUnderscore", 0, r, "localeFromLowercaseUnderscore", 0, e => e.replace("_", "-"), "localeFromUppercaseDash", 0, e => e.toLowerCase(), "localeToLowercaseUnderscore", 0, e => e.replace("-", "_").toLowerCase(), "localeToUppercaseDash", 0, e => {
        let [t, r] = e.split("-");
        return `${t}-${r?.toUpperCase()}`
    }, "locales", 0, ["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw", "bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"], "localesLowercaseUnderscore", 0, s, "localesUppercaseDash", 0, ["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "nl-NL", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW", "bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"], "stripLocalePrefix", 0, e => {
        if (!e.startsWith("/")) return e;
        let r = e.indexOf("/", 1),
            s = (-1 === r ? e.substring(1) : e.substring(1, r)).toLowerCase();
        return (0, t.arrayIncludes)(o, s) ? -1 === r ? "/" : e.substring(r) : e
    }, "urlLanguageOrLocalePrefixes", 0, i, "urlLocalePrefixToLanguage", 0, {
        "ar-001": "ar",
        "de-de": "de",
        "es-es": "es",
        "fr-fr": "fr",
        "hi-in": "hi",
        "it-it": "it",
        "id-id": "id",
        "ko-kr": "ko",
        "nl-nl": "nl",
        "ja-jp": "ja",
        "th-th": "th",
        "pl-pl": "pl",
        "pt-br": "pt",
        "tr-tr": "tr",
        "vi-vn": "vi"
    }, "urlLocalePrefixes", 0, a])
}, 683740, e => {
    "use strict";
    e.s(["bigIntFromNumber", 0, e => {
        try {
            return BigInt(e)
        } catch {
            return null
        }
    }, "bigIntToNumber", 0, e => Number.MIN_SAFE_INTEGER <= e && e <= Number.MAX_SAFE_INTEGER ? Number(e) : null, "parseBigInt", 0, e => {
        if (!e.trim()) return null;
        try {
            return BigInt(e)
        } catch {
            return null
        }
    }])
}, 126392, e => {
    "use strict";
    var t = e.i(473897),
        r = e.i(645020),
        s = e.i(683740);
    let a = e => {
            let r = (0, s.parseBigInt)(e);
            return null == r ? null : r > 0 && r <= Number.MAX_SAFE_INTEGER ? (0, t.downcast)(r.toString()) : null
        },
        o = "blackbird";
    e.s(["blackbirdMembership", 0, o, "getCurrentUser", 0, () => {
        if ("u" < typeof document) return;
        var e = document.querySelector('meta[name="user-data"]')?.dataset ?? document.documentElement.dataset;
        let t = e.userid ?? e.user,
            r = null == t ? void 0 : a(t) ?? void 0;
        return "string" == typeof r ? {
            isAuthenticated: !0,
            id: r,
            userName: e.name ?? e.userName,
            displayName: e.displayname ?? e.userDisplayName,
            isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
            membership: e.membership === o || e.userMembership === o ? o : void 0,
            isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
            isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
        } : void 0
    }, "parseUserId", 0, a, "userIdToNumber", 0, function(e) {
        if (void 0 === e) return;
        let t = (0, r.parseInt)(e);
        if (null == t) throw Error(`UserId ${e} was not parsable as an integer.`);
        return t
    }])
}, 358239, 673518, e => {
    "use strict";
    var t = e.i(357355);
    e.i(350223);
    var r = e.i(874296),
        s = e.i(189571),
        s = s;
    let a = r.catch(r.union([r.boolean(), r.stringbool({
            truthy: ["true"],
            falsy: ["false"]
        })]), !1),
        o = (e, t) => {
            let a = new Map(e.map(e => [e.toLowerCase(), e]));
            return r.pipe(r.catch(r.string().check(s._toLowerCase()), t.toLowerCase()), r.transform(e => a.get(e) ?? t))
        },
        i = {
            isUwpApp: "isUWPApp",
            isPcgdkApp: "isPcGdkApp"
        },
        n = r.object({
            browser: o(["chrome", "edge", "firefox", "safari", "unknown"], "unknown"),
            operatingSystem: o(["ios", "android", "osx", "windows", "windowsPhone", "xboxOne", "xboxOneSTx", "playStation", "chromeOS", "unknown"], "unknown"),
            deviceType: o(["computer", "tablet", "phone", "console", "vr", "unknown"], "unknown"),
            appType: o(["android", "ios", "xbox", "uwp", "amazon", "win32", "universalApp", "unknown"], "unknown"),
            isInApp: a,
            isDesktop: a,
            isPhone: a,
            isTablet: a,
            isConsole: a,
            isAndroidApp: a,
            isIosApp: a,
            isUWPApp: a,
            isXboxApp: a,
            isAmazonApp: a,
            isWin32App: a,
            isStudio: a,
            isIosDevice: a,
            isAndroidDevice: a,
            isUniversalApp: a,
            isChromeOs: a,
            isSamsungGalaxyStoreApp: a,
            isPcGdkApp: a,
            isMac: a,
            isWindows: a
        }),
        l = Object.assign(r.pipe(r.transform(e => {
            if (!("object" == typeof e && null != e && !Array.isArray(e))) return e;
            let t = {
                ...e
            };
            for (let [e, r] of Object.entries(i)) void 0 === t[r] && void 0 !== t[e] && (t[r] = t[e]);
            return t
        }), n), {
            shape: n.shape
        }),
        p = {
            browser: "unknown",
            deviceType: "unknown",
            operatingSystem: "unknown",
            appType: "unknown",
            isInApp: !1,
            isDesktop: !1,
            isPhone: !1,
            isTablet: !1,
            isConsole: !1,
            isAndroidApp: !1,
            isIosApp: !1,
            isUWPApp: !1,
            isXboxApp: !1,
            isAmazonApp: !1,
            isWin32App: !1,
            isStudio: !1,
            isIosDevice: !1,
            isAndroidDevice: !1,
            isUniversalApp: !1,
            isChromeOs: !1,
            isPcGdkApp: !1,
            isSamsungGalaxyStoreApp: !1,
            isMac: !1,
            isWindows: !1
        },
        c = e => /Firefox\/|FxiOS\//i.test(e) ? "firefox" : /Edg(?:e|A|iOS)?\//i.test(e) ? "edge" : /Chrome\/|CriOS\//i.test(e) ? "chrome" : /Safari\//i.test(e) ? "safari" : "unknown";
    e.s(["browserFromUserAgent", 0, c, "defaultDeviceMeta", 0, p], 673518);
    let u = () => {
        if (null == t.document) return p;
        let e = t.document.querySelector('meta[name="device-meta"]');
        if (null != e) {
            let r = l.safeParse(e.dataset);
            if (r.success) return {
                ...r.data,
                browser: "unknown" === r.data.browser ? c(t.navigator?.userAgent ?? "") : r.data.browser
            }
        }
        return p
    };
    e.s(["getDeviceClient", 0, u, "getDeviceMeta", 0, u, "isIos13Ipad", 0, () => t.navigator?.platform === "MacIntel" && t.navigator.maxTouchPoints > 1], 358239)
}, 782009, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(682259),
        s = e.i(880983);
    let a = new Map([
        ["zh_cjv", "zh_cn"]
    ]);

    function o() {
        return function() {
            if ("u" < typeof document) return;
            let {
                lang: e
            } = document.documentElement;
            if (e) return (0, r.arrayIncludes)(s.localesUppercaseDash, e) ? (0, s.localeFromUppercaseDash)(e) : void 0
        }() ?? function() {
            if ("u" < typeof document) return;
            let e = document.querySelector('meta[name="locale-data"]');
            if (!(e instanceof HTMLMetaElement)) return;
            let {
                languageCode: t
            } = e.dataset;
            if (!t) return;
            let o = a.get(t) ?? t;
            if ((0, r.arrayIncludes)(s.localesLowercaseUnderscore, o)) return (0, s.localeFromLowercaseUnderscore)(o)
        }() ?? s.defaultLocale
    }

    function i(e) {
        return {
            dateTime: (t, r) => {
                try {
                    return new Intl.DateTimeFormat((0, s.localeToUppercaseDash)(e), r).format(t instanceof Date ? t : new Date(t))
                } catch {
                    return ""
                }
            },
            number: (t, r) => {
                try {
                    return new Intl.NumberFormat((0, s.localeToUppercaseDash)(e), r).format(t)
                } catch {
                    return String(t)
                }
            }
        }
    }
    e.s(["format", 0, {
        dateTime: (e, t) => i(o()).dateTime(e, t),
        number: (e, t) => i(o()).number(e, t)
    }, "getLocaleFromDocument", 0, o, "useFormatter", 0, function(e) {
        let r = e ?? o();
        return (0, t.useMemo)(() => i(r), [r])
    }])
}, 44170, 476752, e => {
    "use strict";
    var t = e.i(473897);
    let r = e => {
            let r = Array.from(e, e => String.fromCodePoint(e)).join("");
            return (0, t.downcast)(btoa(r))
        },
        s = e => Uint8Array.from(atob(e), e => e.codePointAt(0)),
        a = new TextEncoder;
    new TextDecoder, e.s(["base64ToBytes", 0, s, "bytesToBase64", 0, r, "stringToBase64", 0, e => r(a.encode(e))], 476752);
    let o = {
            name: "ECDSA",
            namedCurve: "P-256"
        },
        i = {
            name: "ECDSA",
            hash: {
                name: "SHA-256"
            }
        },
        n = e => {
            let t = new Uint8Array(e.length);
            for (let r = 0; r < e.length; r += 1) t[r] = e.charCodeAt(r);
            return t.buffer
        },
        l = e => r(new Uint8Array(e)),
        p = async () => crypto.subtle.generateKey(o, !1, ["sign"]), c = async (e, t) => l(await crypto.subtle.sign(i, e, n(t))), u = async e => l(await crypto.subtle.exportKey("spki", e)), h = e => new TextEncoder().encode(e), d = async e => {
            let t = h(e);
            return l(await crypto.subtle.digest(i.hash.name, t))
        };
    e.s(["arrayBufferToBase64String", 0, l, "base64StringToArrayBuffer", 0, e => new Uint8Array(s((0, t.downcast)(e))).buffer, "exportPublicKeyAsSpki", 0, u, "generateSigningKeyPairUnextractable", 0, p, "hashStringWithFnv1a32", 0, e => {
        let t = h(e),
            r = 0x811c9dc5;
        for (let e of t) r ^= e, r = Math.imul(r, 0x1000193);
        let s = (r >>> 0).toString(16).toLowerCase();
        for (; s.length < 8;) s = `0${s}`;
        return s
    }, "hashStringWithSha256", 0, d, "sign", 0, c, "stringToArrayBuffer", 0, n, "stringToUrlSafeBase64", 0, e => l(h(e).buffer).replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, ""), "textEncode", 0, h], 44170)
}]);

//# debugId=f6239778-5153-ebbc-134e-e45c5f4e9ca3
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/05-om1a7.w58f.js.map