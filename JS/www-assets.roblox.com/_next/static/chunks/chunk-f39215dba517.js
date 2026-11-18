;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "9d0b213f-0dcf-c4c0-dc9b-e356b157b927")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 586588, e => {
    "use strict";
    var t = e.i(473897),
        r = e.i(360702),
        s = e.i(574999),
        n = e.i(851460),
        i = e.i(246382);
    class a extends s.BaseUrl {
        static new(e) {
            e.password = "", e.username = "";
            let r = n.UrlSearchParams.internalFromUniqueURLSearchParams((0, t.downcast)(e.searchParams));
            return new a(e, r)
        }
        static fromURL(e) {
            return a.new((0, i.cloneURL)(e))
        }
        static parse(e) {
            try {
                return (0, r.ok)(a.new((0, t.downcast)(new URL(e))))
            } catch (e) {
                return (0, r.err)(e)
            }
        }
        with(e) {
            let {
                scheme: t,
                host: r,
                port: s,
                path: o,
                searchParams: l,
                fragment: p
            } = e;
            if (null == t && null == r && null == s && null == o && null == l && null == p) return this;
            let c = (0, i.cloneURL)(this.url);
            if (null != t && (c.protocol = t), null != r && (c.hostname = r), null != s && (c.port = "number" == typeof s ? s.toString() : s), null != o && (c.pathname = o), null != p && (c.hash = p), null != l) {
                let e = n.UrlSearchParams.new(l);
                return c.search = e.toString(), new a(c, e)
            }
            return new a(c, this.searchParams)
        }
        withScheme(e) {
            let t = (0, i.cloneURL)(this.url);
            return t.protocol = e, new a(t, this.searchParams)
        }
        withHost(e) {
            let t = (0, i.cloneURL)(this.url);
            return t.hostname = e, new a(t, this.searchParams)
        }
        withPort(e) {
            let t = (0, i.cloneURL)(this.url);
            return t.port = "number" == typeof e ? e.toString() : e, new a(t, this.searchParams)
        }
        withPath(e) {
            let t = (0, i.cloneURL)(this.url);
            return t.pathname = e, new a(t, this.searchParams)
        }
        withSearchParams(e) {
            let t = n.UrlSearchParams.new(e),
                r = (0, i.cloneURL)(this.url);
            return r.search = t.toString(), new a(r, t)
        }
        withSearchParamsAppended(e) {
            let t = this.searchParams.copyAndAppendAll(e),
                r = (0, i.cloneURL)(this.url);
            return r.search = t.toString(), new a(r, t)
        }
        withFragment(e) {
            let t = (0, i.cloneURL)(this.url);
            return t.hash = e, new a(t, this.searchParams)
        }
        constructor(e, t) {
            super(e, t)
        }
    }
    e.s(["AnyUrl", 0, a])
}, 245837, e => {
    "use strict";
    var t = e.i(152972),
        r = e.i(519003),
        s = e.i(577896);
    let {
        rootDomain: n,
        apiGateway: i,
        apiGatewayCdn: a,
        wwwRoblox: o,
        authApi: l,
        metricsApi: p
    } = (0, r.getPageBaseUrls)(), c = e => e.toString().replace(/\/+$/, ""), u = {
        apiGatewayUrl: c(i),
        websiteUrl: c(o),
        authApi: c(l),
        avatarApi: `https://avatar.${n}`,
        beaconApi: i.withPath("/beacon-api").toString(),
        catalogApi: `https://catalog.${n}`,
        domain: n,
        economyApi: `https://economy.${n}`,
        inventoryApi: `https://inventory.${n}`,
        metricsApi: c(p),
        privateMessagesApi: `https://privatemessages.${n}`,
        thumbnailsApi: `https://thumbnails.${n}`,
        accountInformationApi: `https://accountinformation.${n}`,
        accountSettingsApi: `https://accountsettings.${n}`,
        apiGatewayCdnUrl: c(a),
        gamesApi: `https://games.${n}`,
        tradesApi: `https://trades.${n}`,
        twoStepVerificationApi: `https://twostepverification.${n}`,
        userModerationApi: `https://usermoderation.${n}`,
        usersApi: `https://users.${n}`,
        abtestingApiSite: `https://abtesting.${n}`,
        adConfigurationApi: `https://adconfiguration.${n}`,
        adsApi: `https://ads.${n}`,
        advertiseApi: `https://advertise.${s.defaultRootDomain}`,
        apiProxyUrl: `https://api.${n}`,
        assetDeliveryApi: `https://assetdelivery.${n}`,
        assetPathPrefix: `https://assets.create.${s.defaultRootDomain}`,
        badgesApi: `https://badges.${n}`,
        billingApi: `https://billing.${n}`,
        captchaApi: `https://captcha.${s.defaultRootDomain}`,
        chatApi: i.withPath("/platform-chat-api").toString(),
        chatModerationApi: `https://chatmoderation.${n}`,
        contactsApi: `https://contacts.${n}`,
        contactsServiceApi: i.withPath("/contacts-api").toString(),
        contentStoreApi: `https://contentstore.${n}`,
        developApi: `https://develop.${n}`,
        economycreatorstatsApi: `https://economycreatorstats.${n}`,
        engagementPayoutsApi: `https://engagementpayouts.${n}`,
        followingsApi: `https://followings.${n}`,
        friendsApi: `https://friends.${n}`,
        gameInternationalizationApi: `https://gameinternationalization.${n}`,
        gameJoinApi: `https://gamejoin.${n}`,
        gameUpdateNotificationsApi: i.withPath("/game-update-notifications").toString(),
        groupsApi: `https://groups.${n}`,
        groupsModerationApi: `https://groupsmoderation.${n}`,
        helpSite: `https://en.help.${s.defaultRootDomain}`,
        itemConfigurationApi: `https://itemconfiguration.${n}`,
        legacyChatApi: `https://chat.${n}`,
        localeApi: `https://locale.${n}`,
        localizationTablesApi: `https://localizationtables.${n}`,
        matchmakingApi: i.withPath("/matchmaking-api").toString(),
        midasApi: `https://midas.${n}`,
        modalsApi: i.withPath("/modals-api").toString(),
        notificationApi: `https://notifications.${n}`,
        passProductPurchasingApi: i.withPath("/pass-product-purchasing").toString(),
        playWebsite: `https://play.${s.defaultRootDomain}`,
        bundlesProductPurchasingApi: i.withPath("/bundles-product-purchasing").toString(),
        premiumFeaturesApi: `https://premiumfeatures.${n}`,
        presenceApi: `https://presence.${n}`,
        profileInsightsApi: i.withPath("/profile-insights-api").toString(),
        publishApi: `https://publish.${n}`,
        restrictedHoursServiceApi: i.withPath("/restricted-hours-service").toString(),
        screenTimeApi: "https://apis.rcs.roblox.com/screen-time-api",
        shareApi: `https://share.${n}`,
        shareLinksApi: i.withPath("/sharelinks").toString(),
        shareLinksApiV2: i.withPath("/deeplinks").toString(),
        showcasesApi: i.withPath("/showcases-api").toString(),
        translationRolesApi: `https://translationroles.${n}`,
        userAgreementsServiceApi: i.withPath("/user-agreements").toString(),
        userSettingsApi: i.withPath("/user-settings-api").toString(),
        voiceApi: `https://voice.${n}`,
        eduAuthenticationApi: "production" === t.robloxEnv ? "https://auth.rblx.org" : `https://auth.${t.robloxEnv}.rblx.org`,
        eduWebsiteUrl: "production" === t.robloxEnv ? "https://www.rblx.org" : `https://www.${t.robloxEnv}.rblx.org`,
        guildedBaseUrl: "production" === t.robloxEnv ? "https://guilded.gg" : "sitetest1" === t.robloxEnv ? "https://tarobi-dev-test.com" : "https://tarobi-dev-sandbox.com",
        vngGamesShopUrl: "production" === t.robloxEnv ? "https://shop.vnggames.com/vn/game/roblox" : "https://sbx-shop.vnggames.com/vn/game/roblox",
        stripeCheckoutDomain: `pay.${s.defaultRootDomain}`,
        amazonStoreLink: "https://www.amazon.com/Roblox-Corporation/dp/B00NUF4YOA",
        amazonWebStoreLink: "https%3a%2f%2fwww.amazon.com%2froblox%3f%26_encoding%3dUTF8%26tag%3dr05d13-20%26linkCode%3dur2%26linkId%3d5562fc29c05b45562a86358c198356eb%26camp%3d1789%26creative%3d9325",
        appProtocolUrl: "robloxmobile://",
        googlePlayStoreLink: "https://play.google.com/store/apps/details?id=com.roblox.client&hl=en",
        appStoreLink: "https://itunes.apple.com/us/app/roblox-mobile/id431946152",
        iosAppStoreLink: "https://itunes.apple.com/us/app/roblox-mobile/id431946152",
        windowsStoreLink: "https://www.microsoft.com/en-us/store/games/roblox/9nblgggzm6wm",
        xboxStoreLink: "https://www.microsoft.com/en-us/p/roblox/bq1tn1t79v9k"
    };
    e.s(["EnvironmentUrls", 0, u, "default", 0, u])
}, 61907, e => {
    "use strict";
    e.s(["fromPeriodToColonDelimited", 0, e => e.replaceAll(".", ":"), "toFullKeyPath", 0, e => {
        if ("string" != typeof e || 0 === e.length) return;
        let t = e.split(".");
        if (t.length <= 2 || t.some(e => 0 === e.length)) return;
        let r = t.slice(0, 2),
            s = t.slice(2).join(":"),
            n = r.join(":");
        return {
            path: `${n}.${s}`,
            namespace: r.join("."),
            key: s
        }
    }])
}, 645020, e => {
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
                    delay: n,
                    maxSize: i
                } = e,
                a = [],
                o = t(),
                l = () => {
                    let {
                        resolve: e,
                        reject: s
                    } = o, n = a;
                    a = [], o = t(), r(n).then(e).catch(s)
                };
            return e => {
                0 === a.length && (s = setTimeout(l, n)), a.push(e);
                let {
                    promise: t
                } = o;
                return null != i && a.length >= i && (clearTimeout(s), l()), t
            }
        };
    e.s(["batch", 0, r, "batchQuery", 0, (e, t, s) => {
        let n = r(e, t);
        return e => n(e).then(t => s(t, e))
    }, "queue", 0, (e, r) => {
        let s = 0,
            n = [],
            i = () => {
                let e = n.shift();
                if (void 0 === e) s -= 1;
                else {
                    let [t, {
                        resolve: s,
                        reject: n
                    }] = e;
                    r(...t).then(s).catch(n).finally(i)
                }
            };
        return function() {
            for (var a = arguments.length, o = Array(a), l = 0; l < a; l++) o[l] = arguments[l];
            if (s < e) return s += 1, r(...o).finally(i);
            let p = t();
            return n.push([o, p]), p.promise
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
        n = e => s(e.reason) ?? new r({
            code: "Reason",
            reason: e.reason
        });
    e.s(["AbortError", 0, r, "abortErrorFromError", 0, s, "abortErrorFromSignal", 0, n], 552566);
    var i = e.i(723941),
        a = e.i(360702),
        o = e.i(240549);
    class l extends Error {
        static new(e, t, r, s) {
            let {
                headers: n,
                redirected: i,
                status: a,
                statusText: o,
                type: p,
                url: c
            } = r;
            return new l(e, t, {
                headers: n,
                redirected: i,
                status: a,
                statusText: o,
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
    let u = (e, t) => a.AsyncResult.fromExecutor(r => {
        if (t.aborted) return void r((0, a.err)(n(t)));
        let s = setTimeout(() => {
            r((0, a.ok)(null))
        }, e);
        t.addEventListener("abort", () => {
            clearTimeout(s), r((0, a.err)(n(t)))
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
            let s = (0, a.tryCatch)(() => new Date(t), () => null).getOrNull();
            return null != s ? s.getTime() - Date.now() : null
        },
        f = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : m;
            return e instanceof p || e instanceof l && t.includes(e.response.status)
        },
        w = e => (t, r) => {
            let {
                retry: s,
                signal: n
            } = r;
            return null == s ? e(t, r) : e(t, r).orElse(async i => {
                let o = i,
                    l = 0,
                    p = s(0, o);
                for (; null != p && Number.isFinite(p);) {
                    if (p > 0)
                        if (null == n) await (0, c.timeout)(p);
                        else {
                            let e = await u(p, n);
                            if (e.isErr()) return e.cast()
                        } l += 1, r.headers.set("x-retry-attempt", l.toString());
                    let i = await e(t, r);
                    if (i.isOk()) return i;
                    ({
                        error: o
                    } = i), p = s(l, o)
                }
                return (0, a.errAsync)(o)
            })
        };
    e.s(["defaultRetryableHttpStatuses", 0, m, "exponentialBackoff", 0, d, "isRetryableError", 0, f, "retryAfterHeaderDelay", 0, g, "retryInterceptor", 0, w], 874775);
    let b = (e => {
            let {
                maxRetries: t,
                factor: r,
                maxDelay: s,
                retryableHttpStatuses: n = m
            } = e, i = d(r, s);
            return (e, r) => e < t && f(r, n) ? g(r) ?? i(e) : NaN
        })({
            maxRetries: 3,
            factor: 1e3,
            maxDelay: 3e4
        }),
        v = (e, t) => a.AsyncResult.fromPromise(globalThis.fetch(e.href, t), e => s(e) ?? new p(e)).andThen(r => r.ok ? (0, a.ok)(r) : t.includeBodyOnError ? r.text().catch(() => void 0).then(s => (0, a.err)(l.new(e, t, r, s))) : (0, a.err)(l.new(e, t, r))),
        A = w(v),
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
        S = e => a.AsyncResult.fromPromise(e.json(), e => new i.JsonDeserializationError({
            code: "Syntax",
            error: e
        })),
        k = e => t => S(t).andThen(t => (0, o.zodSafeParse)(e, t).mapErr(e => new i.JsonDeserializationError({
            code: "Validation",
            error: e
        }))),
        P = (e, t, r) => {
            let s = (0, i.serialize)(t);
            if (s.isErr()) return (0, a.errAsync)(s.error);
            let n = new Headers(r?.headers);
            return n.set("content-type", "application/json"), y(e, {
                ...r,
                method: "POST",
                headers: n,
                body: s.value
            })
        };
    e.s(["defaultBrowserRetryDelay", 0, b, "fetch", 0, y, "get", 0, (e, t, r) => y(e, r).andThen(k(t)), "getUntyped", 0, (e, t) => y(e, t).andThen(S), "post", 0, (e, t, r, s) => P(e, t, s).andThen(k(r)), "postUntyped", 0, (e, t, r) => P(e, t, r).andThen(e => {
        let t;
        return "application/json" === (t = e.headers.get("content-type")) || t?.startsWith("application/json;") ? S(e) : (0, a.okAsync)(void 0)
    }), "setInterceptors", 0, e => {
        A = e.toReversed().reduce((e, t) => t(e), v)
    }], 646424)
}, 880983, e => {
    "use strict";
    var t = e.i(682259);
    let r = ["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "nl_nl", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"],
        s = [...r, "bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"],
        n = ["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"],
        i = ["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "nl", "pl", "pt", "th", "tr", "vi"],
        a = [...i, ...n];
    e.s(["defaultLanguage", 0, "en", "defaultLocale", 0, "en-us", "fullySupportedLocalesLowercaseUnderscore", 0, r, "localeFromLowercaseUnderscore", 0, e => e.replace("_", "-"), "localeFromUppercaseDash", 0, e => e.toLowerCase(), "localeToLowercaseUnderscore", 0, e => e.replace("-", "_").toLowerCase(), "localeToUppercaseDash", 0, e => {
        let [t, r] = e.split("-");
        return `${t}-${r?.toUpperCase()}`
    }, "locales", 0, ["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw", "bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"], "localesLowercaseUnderscore", 0, s, "localesUppercaseDash", 0, ["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "nl-NL", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW", "bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"], "stripLocalePrefix", 0, e => {
        if (!e.startsWith("/")) return e;
        let r = e.indexOf("/", 1),
            s = (-1 === r ? e.substring(1) : e.substring(1, r)).toLowerCase();
        return (0, t.arrayIncludes)(i, s) ? -1 === r ? "/" : e.substring(r) : e
    }, "urlLanguageOrLocalePrefixes", 0, a, "urlLocalePrefixToLanguage", 0, {
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
    }, "urlLocalePrefixes", 0, n])
}, 545819, e => {
    "use strict";
    let t = (e, t, r) => {
        let s = null == r.sameSite ? "" : `;samesite=${r.sameSite}`,
            n = null == r.domain ? "" : `;domain=${r.domain}`,
            i = `;path=${r.path??"/"}`,
            a = null == r.expires ? "" : `;expires=${r.expires.toUTCString()}`,
            o = null == r.maxAge ? "" : `;max-age=${r.maxAge}`;
        document.cookie = `${e}=${encodeURIComponent(t)};secure${s}${n}${i}${a}${o}`
    };
    e.s(["delete", 0, (e, r) => {
        let {
            domain: s,
            path: n
        } = r;
        t(e, "", {
            domain: s,
            path: n,
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
}, 889375, 621899, 270784, e => {
    "use strict";
    let t, r;
    var s, n = e.i(357355),
        i = e.i(646424),
        a = e.i(849735),
        o = e.i(868275);
    class l {
        constructor(e = {
            baseUrl: ""
        }) {
            (0, o._)(this, "configuration", void 0), (0, o._)(this, "baseUrl", void 0), this.configuration = e, this.baseUrl = e.baseUrl
        }
    }
    class p {
        sendEvent(e) {
            let {
                localTime: t,
                target: r,
                eventType: s,
                context: n,
                additionalProperties: i,
                currentUrl: a,
                guestId: o,
                sessionId: l
            } = e, p = t.toISOString(), c = new URL(`${this.baseUrl}/pe`);
            return c.searchParams.append("t", r), c.searchParams.append("evt", s), c.searchParams.append("ctx", n), c.searchParams.append("lt", p), c.searchParams.append("url", a || window.location.href), void 0 !== o && c.searchParams.append("gid", o), void 0 !== l && c.searchParams.append("sid", l), void 0 !== i && Object.keys(i).forEach(e => {
                c.searchParams.append(e, (i[e] ?? "").toString())
            }), fetch(c.href, {
                credentials: "same-origin"
            })
        }
        sendEventViaImg(e, t) {
            let r = this.buildEventUrl(e),
                s = new Image;
            return s.src = r.href, s.onload = () => {
                void 0 !== t && t(!0)
            }, s.onerror = () => {
                void 0 !== t && t(!1)
            }, s
        }
        async sendEventViaFetch(e, t) {
            let r = this.buildEventUrl(e),
                s = await fetch(r.href, {
                    mode: "cors",
                    credentials: "include",
                    keepalive: !0
                }).then(e => e.ok, () => !1);
            t?.(s)
        }
        buildEventUrl(e) {
            let {
                localTime: t,
                target: r,
                eventType: s,
                context: n,
                additionalProperties: i,
                currentUrl: a,
                guestId: o,
                sessionId: l
            } = e, p = t.toISOString(), c = new URL(`${this.baseUrl}/e.png`);
            return c.searchParams.append("t", r), c.searchParams.append("evt", s), c.searchParams.append("ctx", n), c.searchParams.append("lt", p), c.searchParams.append("url", a || window.location.href), void 0 !== o && c.searchParams.append("gid", o), void 0 !== l && c.searchParams.append("sid", l), void 0 !== i && Object.keys(i).forEach(e => {
                c.searchParams.append(e, (i[e] ?? "").toString())
            }), c
        }
        constructor(e = new l) {
            (0, o._)(this, "configuration", void 0), (0, o._)(this, "baseUrl", void 0), this.configuration = e, this.baseUrl = e.baseUrl
        }
    }
    e.s(["Configuration", 0, l, "Tracker", 0, p], 621899);
    var c = e.i(545819);
    let u = () => (0, c.get)("RBXSessionTracker")?.value.match(/sessionid=([^&]*)/i)?.[1] ?? !1,
        h = () => (0, c.get)("GuestData")?.value.match(/userid=([^&]*)/i)?.[1] ?? !1;
    e.s(["getBrowserTrackerId", 0, () => (0, c.get)("RBXEventTrackerV2")?.value.match(/browserid=([^&]*)/i)?.[1] ?? !1, "getGuestId", 0, h, "getSessionId", 0, u], 270784);
    var d = e.i(519003);
    (s = {}).Click = "click", s.Hover = "hover", s.Load = "load";
    let m = (t = new p(new l({
        baseUrl: (0, d.getPageBaseUrls)().eventStreamApi.withPath("www").href
    })), r = (e, t, r) => {
        let s = null != n.document;
        return {
            target: "www",
            localTime: new Date,
            eventType: e,
            context: t ?? "click",
            guestId: s && h() || void 0,
            sessionId: s && u() || void 0,
            additionalProperties: {
                renderingPlatform: "nextjs",
                ...r
            }
        }
    }, {
        sendEvent: (e, s, n) => {
            t.sendEventViaImg(r(e, s, n))
        },
        sendEventWithKeepalive: (e, t, s) => {
            var o;
            let l, p = (l = [
                ["t", (o = r(e, t, s)).target],
                ["evt", o.eventType],
                ["ctx", o.context],
                ["lt", o.localTime.toISOString()],
                ["url", o.currentUrl ?? n.document?.URL ?? ""]
            ], void 0 !== o.guestId && l.push(["gid", o.guestId]), void 0 !== o.sessionId && l.push(["sid", o.sessionId]), Object.entries(o.additionalProperties ?? {}).forEach(e => {
                let [t, r] = e;
                l.push([t, String(r ?? "")])
            }), (0, d.getPageBaseUrls)().eventStreamApi.withPath("www/e.png").withSearchParams(l));
            i.fetch(p, {
                mode: "no-cors",
                credentials: "include",
                keepalive: !0,
                retry: () => null
            }).inspectErr(e => {
                e instanceof a.HttpError || console.error(e)
            })
        }
    });
    e.s(["eventStreamClientV1", 0, m, "sendEvent", 0, (e, t, r) => {
        m.sendEvent(e, t, r)
    }, "sendEventWithKeepalive", 0, (e, t, r) => {
        m.sendEventWithKeepalive(e, t, r)
    }], 889375)
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
    let n = e => {
            let r = (0, s.parseBigInt)(e);
            return null == r ? null : r > 0 && r <= Number.MAX_SAFE_INTEGER ? (0, t.downcast)(r.toString()) : null
        },
        i = "blackbird";
    e.s(["blackbirdMembership", 0, i, "getCurrentUser", 0, () => {
        if ("u" < typeof document) return;
        var e = document.querySelector('meta[name="user-data"]')?.dataset ?? document.documentElement.dataset;
        let t = e.userid ?? e.user,
            r = null == t ? void 0 : n(t) ?? void 0;
        return "string" == typeof r ? {
            isAuthenticated: !0,
            id: r,
            userName: e.name ?? e.userName,
            displayName: e.displayname ?? e.userDisplayName,
            isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
            membership: e.membership === i || e.userMembership === i ? i : void 0,
            isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
            isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
        } : void 0
    }, "parseUserId", 0, n, "userIdToNumber", 0, function(e) {
        if (void 0 === e) return;
        let t = (0, r.parseInt)(e);
        if (null == t) throw Error(`UserId ${e} was not parsable as an integer.`);
        return t
    }])
}, 683898, e => {
    "use strict";
    let t = ["android", "ios", "xbox", "uwp", "amazon", "win32", "universalApp", "unknown"],
        r = new Map(t.map(e => [e.toLowerCase(), e]));
    e.s(["AppType", 0, t, "toAppType", 0, e => r.get(e?.trim().toLowerCase() ?? "") ?? "unknown"])
}, 358239, 673518, e => {
    "use strict";
    var t = e.i(357355);
    e.i(350223);
    var r = e.i(874296),
        s = e.i(189571),
        s = s,
        n = e.i(683898);
    let i = r.catch(r.union([r.boolean(), r.stringbool({
            truthy: ["true"],
            falsy: ["false"]
        })]), !1),
        a = (e, t) => {
            let n = new Map(e.map(e => [e.toLowerCase(), e]));
            return r.pipe(r.catch(r.string().check(s._toLowerCase()), t.toLowerCase()), r.transform(e => n.get(e) ?? t))
        },
        o = {
            isUwpApp: "isUWPApp",
            isPcgdkApp: "isPcGdkApp"
        },
        l = r.object({
            browser: a(["chrome", "edge", "firefox", "safari", "unknown"], "unknown"),
            operatingSystem: a(["ios", "android", "osx", "windows", "windowsPhone", "xboxOne", "xboxOneSTx", "playStation", "chromeOS", "unknown"], "unknown"),
            deviceType: a(["computer", "tablet", "phone", "console", "vr", "unknown"], "unknown"),
            appType: a(n.AppType, "unknown"),
            isInApp: i,
            isDesktop: i,
            isPhone: i,
            isTablet: i,
            isConsole: i,
            isAndroidApp: i,
            isIosApp: i,
            isUWPApp: i,
            isXboxApp: i,
            isAmazonApp: i,
            isWin32App: i,
            isStudio: i,
            isIosDevice: i,
            isAndroidDevice: i,
            isUniversalApp: i,
            isChromeOs: i,
            isSamsungGalaxyStoreApp: i,
            isPcGdkApp: i,
            isMac: i,
            isWindows: i
        }),
        p = Object.assign(r.pipe(r.transform(e => {
            if (!("object" == typeof e && null != e && !Array.isArray(e))) return e;
            let t = {
                ...e
            };
            for (let [e, r] of Object.entries(o)) void 0 === t[r] && void 0 !== t[e] && (t[r] = t[e]);
            return t
        }), l), {
            shape: l.shape
        }),
        c = {
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
        u = e => /Firefox\/|FxiOS\//i.test(e) ? "firefox" : /Edg(?:e|A|iOS)?\//i.test(e) ? "edge" : /Chrome\/|CriOS\//i.test(e) ? "chrome" : /Safari\//i.test(e) ? "safari" : "unknown";
    e.s(["browserFromUserAgent", 0, u, "defaultDeviceMeta", 0, c], 673518);
    let h = () => {
        if (null == t.document) return c;
        let e = t.document.querySelector('meta[name="device-meta"]');
        if (null != e) {
            let r = p.safeParse(e.dataset);
            if (r.success) return {
                ...r.data,
                browser: "unknown" === r.data.browser ? u(t.navigator?.userAgent ?? "") : r.data.browser
            }
        }
        return c
    };
    e.s(["getDeviceClient", 0, h, "getDeviceMeta", 0, h, "isIos13Ipad", 0, () => t.navigator?.platform === "MacIntel" && t.navigator.maxTouchPoints > 1], 358239)
}, 782009, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(682259),
        s = e.i(880983);
    let n = new Map([
        ["zh_cjv", "zh_cn"]
    ]);

    function i() {
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
            let i = n.get(t) ?? t;
            if ((0, r.arrayIncludes)(s.localesLowercaseUnderscore, i)) return (0, s.localeFromLowercaseUnderscore)(i)
        }() ?? s.defaultLocale
    }

    function a(e) {
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
        dateTime: (e, t) => a(i()).dateTime(e, t),
        number: (e, t) => a(i()).number(e, t)
    }, "getLocaleFromDocument", 0, i, "useFormatter", 0, function(e) {
        let r = e ?? i();
        return (0, t.useMemo)(() => a(r), [r])
    }])
}, 44170, 476752, e => {
    "use strict";
    var t = e.i(473897);
    let r = e => {
            let r = Array.from(e, e => String.fromCodePoint(e)).join("");
            return (0, t.downcast)(btoa(r))
        },
        s = e => Uint8Array.from(atob(e), e => e.codePointAt(0)),
        n = new TextEncoder;
    new TextDecoder, e.s(["base64ToBytes", 0, s, "bytesToBase64", 0, r, "stringToBase64", 0, e => r(n.encode(e))], 476752);
    let i = {
            name: "ECDSA",
            namedCurve: "P-256"
        },
        a = {
            name: "ECDSA",
            hash: {
                name: "SHA-256"
            }
        },
        o = e => {
            let t = new Uint8Array(e.length);
            for (let r = 0; r < e.length; r += 1) t[r] = e.charCodeAt(r);
            return t.buffer
        },
        l = e => r(new Uint8Array(e)),
        p = async () => crypto.subtle.generateKey(i, !1, ["sign"]), c = async (e, t) => l(await crypto.subtle.sign(a, e, o(t))), u = async e => l(await crypto.subtle.exportKey("spki", e)), h = e => new TextEncoder().encode(e), d = async e => {
            let t = h(e);
            return l(await crypto.subtle.digest(a.hash.name, t))
        };
    e.s(["arrayBufferToBase64String", 0, l, "base64StringToArrayBuffer", 0, e => new Uint8Array(s((0, t.downcast)(e))).buffer, "exportPublicKeyAsSpki", 0, u, "generateSigningKeyPairUnextractable", 0, p, "hashStringWithFnv1a32", 0, e => {
        let t = h(e),
            r = 0x811c9dc5;
        for (let e of t) r ^= e, r = Math.imul(r, 0x1000193);
        let s = (r >>> 0).toString(16).toLowerCase();
        for (; s.length < 8;) s = `0${s}`;
        return s
    }, "hashStringWithSha256", 0, d, "sign", 0, c, "stringToArrayBuffer", 0, o, "stringToUrlSafeBase64", 0, e => l(h(e).buffer).replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, ""), "textEncode", 0, h], 44170)
}]);

//# debugId=9d0b213f-0dcf-c4c0-dc9b-e356b157b927
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0l5agqoe91~91.js.map