! function() {
    "use strict";
    var e = {
            n: function(r) {
                var n = r && r.__esModule ? function() {
                    return r.default
                } : function() {
                    return r
                };
                return e.d(n, {
                    a: n
                }), n
            },
            d: function(r, n) {
                for (var t in n) e.o(n, t) && !e.o(r, t) && Object.defineProperty(r, t, {
                    enumerable: !0,
                    get: n[t]
                })
            },
            o: function(e, r) {
                return Object.prototype.hasOwnProperty.call(e, r)
            }
        },
        r = Roblox,
        n = e.n(r),
        t = CoreUtilities,
        o = (CoreRobloxUtilities, r.EnvironmentUrls.apiGatewayUrl);
    r.EnvironmentUrls.voiceApi;

    function i(e, r, n, t, o, i, a) {
        try {
            var u = e[i](a),
                c = u.value
        } catch (e) {
            return void n(e)
        }
        u.done ? r(c) : Promise.resolve(c).then(t, o)
    }
    var a = function() {
        var e = function(e) {
            return function() {
                var r = this,
                    n = arguments;
                return new Promise((function(t, o) {
                    var a = e.apply(r, n);

                    function u(e) {
                        i(a, t, o, u, c, "next", e)
                    }

                    function c(e) {
                        i(a, t, o, u, c, "throw", e)
                    }
                    u(void 0)
                }))
            }
        }(regeneratorRuntime.mark((function e() {
            var n;
            return regeneratorRuntime.wrap((function(e) {
                for (;;) switch (e.prev = e.next) {
                    case 0:
                        return e.next = 2, r.Guac.callBehaviour("free-communication-infographics");
                    case 2:
                        return n = e.sent, e.abrupt("return", n);
                    case 4:
                    case "end":
                        return e.stop()
                }
            }), e)
        })));
        return function() {
            return e.apply(this, arguments)
        }
    }();
    n().HomePageUpsellCardService = {
        getHomePageUpsellCardVariation: function() {
            var e = {
                retryable: !1,
                withCredentials: !0,
                url: "".concat(o, "/upsellCard/type")
            };
            return t.httpService.get(e).then((function(e) {
                return e.data
            }))
        },
        getVoicePolicy: a
    }
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/1893a1744fa2a24b808e037bdd13b0f3-homePageUpsellCard.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("HomePageUpsellCard");