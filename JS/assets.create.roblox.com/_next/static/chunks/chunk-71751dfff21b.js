;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "fa01e810-b7da-f63b-6f0f-e5b4ce7d90a8")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 657642, 929036, 733681, e => {
    "use strict";
    let n, r, a;
    var t = "u" > typeof globalThis ? globalThis : window;

    function d(e) {
        if (Object.prototype.hasOwnProperty.call(e, "__esModule")) return e;
        var n = e.default;
        if ("function" == typeof n) {
            var r = function e() {
                var r = !1;
                try {
                    r = this instanceof e
                } catch (e) {}
                return r ? Reflect.construct(n, arguments, this.constructor) : n.apply(this, arguments)
            };
            r.prototype = n.prototype
        } else r = {};
        return Object.defineProperty(r, "__esModule", {
            value: !0
        }), Object.keys(e).forEach(function(n) {
            var a = Object.getOwnPropertyDescriptor(e, n);
            Object.defineProperty(r, n, a.get ? a : {
                enumerable: !0,
                get: function() {
                    return e[n]
                }
            })
        }), r
    }
    e.s(["a", 0, function(e) {
        return e && e.__esModule && Object.prototype.hasOwnProperty.call(e, "default") ? e.default : e
    }, "c", 0, t, "g", 0, d], 929036);
    var s = e.i(416340);

    function i(e, n) {
        let r = !1,
            a = e ? n().catch(() => {}).then(() => {
                r = !0
            }) : null;
        return function() {
            let [e, n] = (0, s.useState)(!a || r);
            return (0, s.useEffect)(() => {
                a && !e && a.then(() => n(!0))
            }, [e]), e
        }
    }

    function _(e, n, r, a) {
        let t = null == a || "number" == typeof a || "boolean" == typeof a ? a : r(a),
            d = n.get(t);
        return void 0 === d && (d = e.call(this, a), n.set(t, d)), d
    }

    function o(e, n, r) {
        let a = Array.prototype.slice.call(arguments, 3),
            t = r(a),
            d = n.get(t);
        return void 0 === d && (d = e.apply(this, a), n.set(t, d)), d
    }
    e.s(["c", 0, i], 733681);
    var u, c, y, l, w, f, m, p, h = class {
        get(e) {
            return this.cache[e]
        }
        set(e, n) {
            this.cache[e] = n
        }
        constructor() {
            this.cache = Object.create(null)
        }
    };
    let M = [{
            paradigmLocales: {
                _locales: "en en_GB es es_419 pt_BR pt_PT"
            }
        }, {
            $enUS: {
                _value: "AS+CA+GU+MH+MP+PH+PR+UM+US+VI"
            }
        }, {
            $cnsar: {
                _value: "HK+MO"
            }
        }, {
            $americas: {
                _value: "019"
            }
        }, {
            $maghreb: {
                _value: "MA+DZ+TN+LY+MR+EH"
            }
        }, {
            no: {
                _desired: "nb",
                _distance: "1"
            }
        }, {
            bs: {
                _desired: "hr",
                _distance: "4"
            }
        }, {
            bs: {
                _desired: "sh",
                _distance: "4"
            }
        }, {
            hr: {
                _desired: "sh",
                _distance: "4"
            }
        }, {
            sr: {
                _desired: "sh",
                _distance: "4"
            }
        }, {
            aa: {
                _desired: "ssy",
                _distance: "4"
            }
        }, {
            de: {
                _desired: "gsw",
                _distance: "4",
                _oneway: "true"
            }
        }, {
            de: {
                _desired: "lb",
                _distance: "4",
                _oneway: "true"
            }
        }, {
            no: {
                _desired: "da",
                _distance: "8"
            }
        }, {
            nb: {
                _desired: "da",
                _distance: "8"
            }
        }, {
            ru: {
                _desired: "ab",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ach",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            nl: {
                _desired: "af",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ak",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "am",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            es: {
                _desired: "ay",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "az",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ur: {
                _desired: "bal",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "be",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "bem",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            hi: {
                _desired: "bh",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "bn",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "bo",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "br",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            es: {
                _desired: "ca",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            fil: {
                _desired: "ceb",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "chr",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ckb",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "co",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "crs",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            sk: {
                _desired: "cs",
                _distance: "20"
            }
        }, {
            en: {
                _desired: "cy",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ee",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "eo",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            es: {
                _desired: "eu",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            da: {
                _desired: "fo",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            nl: {
                _desired: "fy",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ga",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "gaa",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "gd",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            es: {
                _desired: "gl",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            es: {
                _desired: "gn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            hi: {
                _desired: "gu",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ha",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "haw",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "ht",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "hy",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ia",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ig",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "is",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            id: {
                _desired: "jv",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ka",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "kg",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "kk",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "km",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "kn",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "kri",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            tr: {
                _desired: "ku",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "ky",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            it: {
                _desired: "la",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "lg",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "ln",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "lo",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "loz",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "lua",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            hi: {
                _desired: "mai",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "mfe",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "mg",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "mi",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ml",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "mn",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            hi: {
                _desired: "mr",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            id: {
                _desired: "ms",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "mt",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "my",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ne",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            nb: {
                _desired: "nn",
                _distance: "20"
            }
        }, {
            no: {
                _desired: "nn",
                _distance: "20"
            }
        }, {
            en: {
                _desired: "nso",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ny",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "nyn",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "oc",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "om",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "or",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "pa",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "pcm",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ps",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            es: {
                _desired: "qu",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            de: {
                _desired: "rm",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "rn",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "rw",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            hi: {
                _desired: "sa",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "sd",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "si",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "sn",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "so",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "sq",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "st",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            id: {
                _desired: "su",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "sw",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ta",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "te",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "tg",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ti",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "tk",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "tlh",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "tn",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "to",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "tt",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "tum",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "ug",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "uk",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ur",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "uz",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "wo",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "xh",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "yi",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "yo",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "za",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "zu",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "aao",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "abh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "abv",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "acm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "acq",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "acw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "acx",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "acy",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "adf",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "aeb",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "aec",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "afb",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ajp",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "apc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "apd",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "arq",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ars",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ary",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "arz",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "auz",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "avl",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ayh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ayl",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ayn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ayp",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "bbz",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "pga",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "shu",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ssh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            az: {
                _desired: "azb",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            et: {
                _desired: "vro",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "ffm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "fub",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "fue",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "fuf",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "fuh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "fui",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "fuq",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "fuv",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            gn: {
                _desired: "gnw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            gn: {
                _desired: "gui",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            gn: {
                _desired: "gun",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            gn: {
                _desired: "nhd",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            iu: {
                _desired: "ikt",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "enb",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "eyo",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "niq",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "oki",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "pko",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "sgc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "tec",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "tuy",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kok: {
                _desired: "gom",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kpe: {
                _desired: "gkp",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "ida",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lkb",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lko",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lks",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lri",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lrm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lsm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lto",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lts",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lwg",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "nle",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "nyd",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "rag",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            lv: {
                _desired: "ltg",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "bhr",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "bjq",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "bmm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "bzc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "msh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "skg",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "tdx",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "tkg",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "txy",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "xmv",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "xmw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mn: {
                _desired: "mvf",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "bjn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "btj",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "bve",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "bvu",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "coa",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "dup",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "hji",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "id",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "jak",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "jax",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "kvb",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "kvr",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "kxd",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "lce",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "lcf",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "liw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "max",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "meo",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "mfa",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "mfb",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "min",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "mqg",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "msi",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "mui",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "orn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "ors",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "pel",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "pse",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "tmw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "urk",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "vkk",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "vkt",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "xmm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "zlm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "zmi",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ne: {
                _desired: "dty",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            om: {
                _desired: "gax",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            om: {
                _desired: "hae",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            om: {
                _desired: "orc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            or: {
                _desired: "spv",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ps: {
                _desired: "pbt",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ps: {
                _desired: "pst",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qub",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qud",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "quf",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qug",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "quh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "quk",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qul",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qup",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qur",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qus",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "quw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qux",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "quy",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qva",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qve",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvi",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvj",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvl",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvo",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvp",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvs",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvz",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qwa",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qwc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qwh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qws",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxa",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxl",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxo",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxp",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxr",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxt",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxu",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            sc: {
                _desired: "sdc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            sc: {
                _desired: "sdn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            sc: {
                _desired: "sro",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            sq: {
                _desired: "aae",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            sq: {
                _desired: "aat",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            sq: {
                _desired: "aln",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            syr: {
                _desired: "aii",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            uz: {
                _desired: "uzs",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            yi: {
                _desired: "yih",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "cdo",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "cjy",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "cpx",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "czh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "czo",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "gan",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "hak",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "hsn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "lzh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "mnp",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "nan",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "wuu",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "yue",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "*": {
                _desired: "*",
                _distance: "80"
            }
        }, {
            "en-Latn": {
                _desired: "am-Ethi",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "ru-Cyrl": {
                _desired: "az-Latn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "bn-Beng",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "zh-Hans": {
                _desired: "bo-Tibt",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "ru-Cyrl": {
                _desired: "hy-Armn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "ka-Geor",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "km-Khmr",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "kn-Knda",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "lo-Laoo",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "ml-Mlym",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "my-Mymr",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "ne-Deva",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "or-Orya",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "pa-Guru",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "ps-Arab",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "sd-Arab",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "si-Sinh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "ta-Taml",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "te-Telu",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "ti-Ethi",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "ru-Cyrl": {
                _desired: "tk-Latn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "ur-Arab",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "ru-Cyrl": {
                _desired: "uz-Latn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "yi-Hebr",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "sr-Cyrl": {
                _desired: "sr-Latn",
                _distance: "5"
            }
        }, {
            "zh-Hans": {
                _desired: "za-Latn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "zh-Hans": {
                _desired: "zh-Hani",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "zh-Hant": {
                _desired: "zh-Hani",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "ar-Arab": {
                _desired: "ar-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "bn-Beng": {
                _desired: "bn-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "gu-Gujr": {
                _desired: "gu-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "hi-Deva": {
                _desired: "hi-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "kn-Knda": {
                _desired: "kn-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "ml-Mlym": {
                _desired: "ml-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "mr-Deva": {
                _desired: "mr-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "ta-Taml": {
                _desired: "ta-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "te-Telu": {
                _desired: "te-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "zh-Hans": {
                _desired: "zh-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "ja-Jpan": {
                _desired: "ja-Latn",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ja-Jpan": {
                _desired: "ja-Hani",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ja-Jpan": {
                _desired: "ja-Hira",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ja-Jpan": {
                _desired: "ja-Kana",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ja-Jpan": {
                _desired: "ja-Hrkt",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ja-Hrkt": {
                _desired: "ja-Hira",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ja-Hrkt": {
                _desired: "ja-Kana",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ko-Kore": {
                _desired: "ko-Hani",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ko-Kore": {
                _desired: "ko-Hang",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ko-Kore": {
                _desired: "ko-Jamo",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ko-Hang": {
                _desired: "ko-Jamo",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "*-*": {
                _desired: "*-*",
                _distance: "50"
            }
        }, {
            "ar-*-$maghreb": {
                _desired: "ar-*-$maghreb",
                _distance: "4"
            }
        }, {
            "ar-*-$!maghreb": {
                _desired: "ar-*-$!maghreb",
                _distance: "4"
            }
        }, {
            "ar-*-*": {
                _desired: "ar-*-*",
                _distance: "5"
            }
        }, {
            "en-*-$enUS": {
                _desired: "en-*-$enUS",
                _distance: "4"
            }
        }, {
            "en-*-GB": {
                _desired: "en-*-$!enUS",
                _distance: "3"
            }
        }, {
            "en-*-$!enUS": {
                _desired: "en-*-$!enUS",
                _distance: "4"
            }
        }, {
            "en-*-*": {
                _desired: "en-*-*",
                _distance: "5"
            }
        }, {
            "es-*-$americas": {
                _desired: "es-*-$americas",
                _distance: "4"
            }
        }, {
            "es-*-$!americas": {
                _desired: "es-*-$!americas",
                _distance: "4"
            }
        }, {
            "es-*-*": {
                _desired: "es-*-*",
                _distance: "5"
            }
        }, {
            "pt-*-$americas": {
                _desired: "pt-*-$americas",
                _distance: "4"
            }
        }, {
            "pt-*-$!americas": {
                _desired: "pt-*-$!americas",
                _distance: "4"
            }
        }, {
            "pt-*-*": {
                _desired: "pt-*-*",
                _distance: "5"
            }
        }, {
            "zh-Hant-$cnsar": {
                _desired: "zh-Hant-$cnsar",
                _distance: "4"
            }
        }, {
            "zh-Hant-$!cnsar": {
                _desired: "zh-Hant-$!cnsar",
                _distance: "4"
            }
        }, {
            "zh-Hant-*": {
                _desired: "zh-Hant-*",
                _distance: "5"
            }
        }, {
            "*-*-*": {
                _desired: "*-*-*",
                _distance: "4"
            }
        }],
        S = {
            "001": ["001", "001-status-grouping", "002", "005", "009", "011", "013", "014", "015", "017", "018", "019", "021", "029", "030", "034", "035", "039", "053", "054", "057", "061", "142", "143", "145", "150", "151", "154", "155", "AC", "AD", "AE", "AF", "AG", "AI", "AL", "AM", "AO", "AQ", "AR", "AS", "AT", "AU", "AW", "AX", "AZ", "BA", "BB", "BD", "BE", "BF", "BG", "BH", "BI", "BJ", "BL", "BM", "BN", "BO", "BQ", "BR", "BS", "BT", "BV", "BW", "BY", "BZ", "CA", "CC", "CD", "CF", "CG", "CH", "CI", "CK", "CL", "CM", "CN", "CO", "CP", "CQ", "CR", "CU", "CV", "CW", "CX", "CY", "CZ", "DE", "DG", "DJ", "DK", "DM", "DO", "DZ", "EA", "EC", "EE", "EG", "EH", "ER", "ES", "ET", "EU", "EZ", "FI", "FJ", "FK", "FM", "FO", "FR", "GA", "GB", "GD", "GE", "GF", "GG", "GH", "GI", "GL", "GM", "GN", "GP", "GQ", "GR", "GS", "GT", "GU", "GW", "GY", "HK", "HM", "HN", "HR", "HT", "HU", "IC", "ID", "IE", "IL", "IM", "IN", "IO", "IQ", "IR", "IS", "IT", "JE", "JM", "JO", "JP", "KE", "KG", "KH", "KI", "KM", "KN", "KP", "KR", "KW", "KY", "KZ", "LA", "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU", "LV", "LY", "MA", "MC", "MD", "ME", "MF", "MG", "MH", "MK", "ML", "MM", "MN", "MO", "MP", "MQ", "MR", "MS", "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "NA", "NC", "NE", "NF", "NG", "NI", "NL", "NO", "NP", "NR", "NU", "NZ", "OM", "PA", "PE", "PF", "PG", "PH", "PK", "PL", "PM", "PN", "PR", "PS", "PT", "PW", "PY", "QA", "QO", "RE", "RO", "RS", "RU", "RW", "SA", "SB", "SC", "SD", "SE", "SG", "SH", "SI", "SJ", "SK", "SL", "SM", "SN", "SO", "SR", "SS", "ST", "SV", "SX", "SY", "SZ", "TA", "TC", "TD", "TF", "TG", "TH", "TJ", "TK", "TL", "TM", "TN", "TO", "TR", "TT", "TV", "TW", "TZ", "UA", "UG", "UM", "UN", "US", "UY", "UZ", "VA", "VC", "VE", "VG", "VI", "VN", "VU", "WF", "WS", "XK", "YE", "YT", "ZA", "ZM", "ZW"],
            "002": ["002", "002-status-grouping", "011", "014", "015", "017", "018", "202", "AO", "BF", "BI", "BJ", "BW", "CD", "CF", "CG", "CI", "CM", "CV", "DJ", "DZ", "EA", "EG", "EH", "ER", "ET", "GA", "GH", "GM", "GN", "GQ", "GW", "IC", "IO", "KE", "KM", "LR", "LS", "LY", "MA", "MG", "ML", "MR", "MU", "MW", "MZ", "NA", "NE", "NG", "RE", "RW", "SC", "SD", "SH", "SL", "SN", "SO", "SS", "ST", "SZ", "TD", "TF", "TG", "TN", "TZ", "UG", "YT", "ZA", "ZM", "ZW"],
            "003": ["003", "013", "021", "029", "AG", "AI", "AW", "BB", "BL", "BM", "BQ", "BS", "BZ", "CA", "CR", "CU", "CW", "DM", "DO", "GD", "GL", "GP", "GT", "HN", "HT", "JM", "KN", "KY", "LC", "MF", "MQ", "MS", "MX", "NI", "PA", "PM", "PR", "SV", "SX", "TC", "TT", "US", "VC", "VG", "VI"],
            "005": ["005", "AR", "BO", "BR", "BV", "CL", "CO", "EC", "FK", "GF", "GS", "GY", "PE", "PY", "SR", "UY", "VE"],
            "009": ["009", "053", "054", "057", "061", "AC", "AQ", "AS", "AU", "CC", "CK", "CP", "CX", "DG", "FJ", "FM", "GU", "HM", "KI", "MH", "MP", "NC", "NF", "NR", "NU", "NZ", "PF", "PG", "PN", "PW", "QO", "SB", "TA", "TK", "TO", "TV", "UM", "VU", "WF", "WS"],
            "011": ["011", "BF", "BJ", "CI", "CV", "GH", "GM", "GN", "GW", "LR", "ML", "MR", "NE", "NG", "SH", "SL", "SN", "TG"],
            "013": ["013", "BZ", "CR", "GT", "HN", "MX", "NI", "PA", "SV"],
            "014": ["014", "BI", "DJ", "ER", "ET", "IO", "KE", "KM", "MG", "MU", "MW", "MZ", "RE", "RW", "SC", "SO", "SS", "TF", "TZ", "UG", "YT", "ZM", "ZW"],
            "015": ["015", "DZ", "EA", "EG", "EH", "IC", "LY", "MA", "SD", "TN"],
            "017": ["017", "AO", "CD", "CF", "CG", "CM", "GA", "GQ", "ST", "TD"],
            "018": ["018", "BW", "LS", "NA", "SZ", "ZA"],
            "019": ["003", "005", "013", "019", "019-status-grouping", "021", "029", "419", "AG", "AI", "AR", "AW", "BB", "BL", "BM", "BO", "BQ", "BR", "BS", "BV", "BZ", "CA", "CL", "CO", "CR", "CU", "CW", "DM", "DO", "EC", "FK", "GD", "GF", "GL", "GP", "GS", "GT", "GY", "HN", "HT", "JM", "KN", "KY", "LC", "MF", "MQ", "MS", "MX", "NI", "PA", "PE", "PM", "PR", "PY", "SR", "SV", "SX", "TC", "TT", "US", "UY", "VC", "VE", "VG", "VI"],
            "021": ["021", "BM", "CA", "GL", "PM", "US"],
            "029": ["029", "AG", "AI", "AW", "BB", "BL", "BQ", "BS", "CU", "CW", "DM", "DO", "GD", "GP", "HT", "JM", "KN", "KY", "LC", "MF", "MQ", "MS", "PR", "SX", "TC", "TT", "VC", "VG", "VI"],
            "030": ["030", "CN", "HK", "JP", "KP", "KR", "MN", "MO", "TW"],
            "034": ["034", "AF", "BD", "BT", "IN", "IR", "LK", "MV", "NP", "PK"],
            "035": ["035", "BN", "ID", "KH", "LA", "MM", "MY", "PH", "SG", "TH", "TL", "VN"],
            "039": ["039", "AD", "AL", "BA", "ES", "GI", "GR", "HR", "IT", "ME", "MK", "MT", "PT", "RS", "SI", "SM", "VA", "XK"],
            "053": ["053", "AU", "CC", "CX", "HM", "NF", "NZ"],
            "054": ["054", "FJ", "NC", "PG", "SB", "VU"],
            "057": ["057", "FM", "GU", "KI", "MH", "MP", "NR", "PW", "UM"],
            "061": ["061", "AS", "CK", "NU", "PF", "PN", "TK", "TO", "TV", "WF", "WS"],
            142: ["030", "034", "035", "142", "143", "145", "AE", "AF", "AM", "AZ", "BD", "BH", "BN", "BT", "CN", "CY", "GE", "HK", "ID", "IL", "IN", "IQ", "IR", "JO", "JP", "KG", "KH", "KP", "KR", "KW", "KZ", "LA", "LB", "LK", "MM", "MN", "MO", "MV", "MY", "NP", "OM", "PH", "PK", "PS", "QA", "SA", "SG", "SY", "TH", "TJ", "TL", "TM", "TR", "TW", "UZ", "VN", "YE"],
            143: ["143", "KG", "KZ", "TJ", "TM", "UZ"],
            145: ["145", "AE", "AM", "AZ", "BH", "CY", "GE", "IL", "IQ", "JO", "KW", "LB", "OM", "PS", "QA", "SA", "SY", "TR", "YE"],
            150: ["039", "150", "151", "154", "155", "AD", "AL", "AT", "AX", "BA", "BE", "BG", "BY", "CH", "CQ", "CZ", "DE", "DK", "EE", "ES", "FI", "FO", "FR", "GB", "GG", "GI", "GR", "HR", "HU", "IE", "IM", "IS", "IT", "JE", "LI", "LT", "LU", "LV", "MC", "MD", "ME", "MK", "MT", "NL", "NO", "PL", "PT", "RO", "RS", "RU", "SE", "SI", "SJ", "SK", "SM", "UA", "VA", "XK"],
            151: ["151", "BG", "BY", "CZ", "HU", "MD", "PL", "RO", "RU", "SK", "UA"],
            154: ["154", "AX", "CQ", "DK", "EE", "FI", "FO", "GB", "GG", "IE", "IM", "IS", "JE", "LT", "LV", "NO", "SE", "SJ"],
            155: ["155", "AT", "BE", "CH", "DE", "FR", "LI", "LU", "MC", "NL"],
            202: ["011", "014", "017", "018", "202", "AO", "BF", "BI", "BJ", "BW", "CD", "CF", "CG", "CI", "CM", "CV", "DJ", "ER", "ET", "GA", "GH", "GM", "GN", "GQ", "GW", "IO", "KE", "KM", "LR", "LS", "MG", "ML", "MR", "MU", "MW", "MZ", "NA", "NE", "NG", "RE", "RW", "SC", "SH", "SL", "SN", "SO", "SS", "ST", "SZ", "TD", "TF", "TG", "TZ", "UG", "YT", "ZA", "ZM", "ZW"],
            419: ["005", "013", "029", "419", "AG", "AI", "AR", "AW", "BB", "BL", "BO", "BQ", "BR", "BS", "BV", "BZ", "CL", "CO", "CR", "CU", "CW", "DM", "DO", "EC", "FK", "GD", "GF", "GP", "GS", "GT", "GY", "HN", "HT", "JM", "KN", "KY", "LC", "MF", "MQ", "MS", "MX", "NI", "PA", "PE", "PR", "PY", "SR", "SV", "SX", "TC", "TT", "UY", "VC", "VE", "VG", "VI"],
            EU: ["AT", "BE", "BG", "CY", "CZ", "DE", "DK", "EE", "ES", "EU", "FI", "FR", "GR", "HR", "HU", "IE", "IT", "LT", "LU", "LV", "MT", "NL", "PL", "PT", "RO", "SE", "SI", "SK"],
            EZ: ["AT", "BE", "CY", "DE", "EE", "ES", "EZ", "FI", "FR", "GR", "IE", "IT", "LT", "LU", "LV", "MT", "NL", "PT", "SI", "SK"],
            QO: ["AC", "AQ", "CP", "DG", "QO", "TA"],
            UN: ["AD", "AE", "AF", "AG", "AL", "AM", "AO", "AR", "AT", "AU", "AZ", "BA", "BB", "BD", "BE", "BF", "BG", "BH", "BI", "BJ", "BN", "BO", "BR", "BS", "BT", "BW", "BY", "BZ", "CA", "CD", "CF", "CG", "CH", "CI", "CL", "CM", "CN", "CO", "CR", "CU", "CV", "CY", "CZ", "DE", "DJ", "DK", "DM", "DO", "DZ", "EC", "EE", "EG", "ER", "ES", "ET", "FI", "FJ", "FM", "FR", "GA", "GB", "GD", "GE", "GH", "GM", "GN", "GQ", "GR", "GT", "GW", "GY", "HN", "HR", "HT", "HU", "ID", "IE", "IL", "IN", "IQ", "IR", "IS", "IT", "JM", "JO", "JP", "KE", "KG", "KH", "KI", "KM", "KN", "KP", "KR", "KW", "KZ", "LA", "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU", "LV", "LY", "MA", "MC", "MD", "ME", "MG", "MH", "MK", "ML", "MM", "MN", "MR", "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "NA", "NE", "NG", "NI", "NL", "NO", "NP", "NR", "NZ", "OM", "PA", "PE", "PG", "PH", "PK", "PL", "PT", "PW", "PY", "QA", "RO", "RS", "RU", "RW", "SA", "SB", "SC", "SD", "SE", "SG", "SI", "SK", "SL", "SM", "SN", "SO", "SR", "SS", "ST", "SV", "SY", "SZ", "TD", "TG", "TH", "TJ", "TL", "TM", "TN", "TO", "TR", "TT", "TV", "TZ", "UA", "UG", "UN", "US", "UY", "UZ", "VC", "VE", "VN", "VU", "WS", "YE", "ZA", "ZM", "ZW"]
        },
        g = /-u(?:-[0-9a-z]{2,8})+/gi;

    function L(e, n) {
        let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Error;
        if (!e) throw new r(n)
    }

    function A(e, n, r) {
        let [a, t, d] = n.split("-"), s = !0;
        if (d && "$" === d[0]) {
            let n = "!" !== d[1],
                a = (n ? r[d.slice(1)] : r[d.slice(2)]).map(e => S[e] || [e]).reduce((e, n) => [...e, ...n], []);
            s && (s = a.indexOf(e.region || "") > -1 == n)
        } else s && (s = !e.region || "*" === d || d === e.region);
        return s && (s = !e.script || "*" === t || t === e.script), s && (s = !e.language || "*" === a || a === e.language)
    }

    function G(e) {
        return [e.language, e.script, e.region].filter(Boolean).join("-")
    }

    function C(e, n, r) {
        for (let a of r.matches) {
            let t = A(e, a.desired, r.matchVariables) && A(n, a.supported, r.matchVariables);
            if (a.oneway || t || (t = A(e, a.supported, r.matchVariables) && A(n, a.desired, r.matchVariables)), t) {
                let t = 10 * a.distance;
                if (r.paradigmLocales.indexOf(G(e)) > -1 != r.paradigmLocales.indexOf(G(n)) > -1) return t - 1;
                return t
            }
        }
        throw Error("No matching distance found")
    }
    let b = (u = function(e, r) {
            let a = new Intl.Locale(e).maximize(),
                t = new Intl.Locale(r).maximize(),
                d = {
                    language: a.language,
                    script: a.script || "",
                    region: a.region || ""
                },
                s = {
                    language: t.language,
                    script: t.script || "",
                    region: t.region || ""
                },
                i = 0,
                _ = function() {
                    if (!n) {
                        var e, r;
                        let a = null == (r = M[0]) || null == (e = r.paradigmLocales) ? void 0 : e._locales.split(" "),
                            t = M.slice(1, 5);
                        n = {
                            matches: M.slice(5).map(e => {
                                let n = Object.keys(e)[0],
                                    r = e[n];
                                return {
                                    supported: n,
                                    desired: r._desired,
                                    distance: +r._distance,
                                    oneway: "true" === r.oneway
                                }
                            }, {}),
                            matchVariables: t.reduce((e, n) => {
                                let r = Object.keys(n)[0],
                                    a = n[r];
                                return e[r.slice(1)] = a._value.split("+"), e
                            }, {}),
                            paradigmLocales: [...a, ...a.map(e => new Intl.Locale(e.replace(/_/g, "-")).maximize().toString())]
                        }
                    }
                    return n
                }();
            return d.language !== s.language && (i += C({
                language: a.language,
                script: "",
                region: ""
            }, {
                language: t.language,
                script: "",
                region: ""
            }, _)), d.script !== s.script && (i += C({
                language: a.language,
                script: d.script,
                region: ""
            }, {
                language: t.language,
                script: s.script,
                region: ""
            }, _)), d.region !== s.region && (i += C(d, s, _)), i
        }, r = (c = {
            serializer: e => "".concat(e[0], "|").concat(e[1])
        }).cache ? c.cache : {
            create: function() {
                return new h
            }
        }, a = c && c.serializer ? c.serializer : function() {
            return JSON.stringify(arguments)
        }, (c && c.strategy ? c.strategy : function(e, n) {
            var r, a;
            let t = 1 === e.length ? _ : o;
            return r = n.cache.create(), a = n.serializer, t.bind(this, e, r, a)
        })(u, {
            cache: r,
            serializer: a
        })),
        T = new WeakMap;

    function E(e) {
        return Intl.getCanonicalLocales(e)[0]
    }
    let v = new WeakMap;

    function B(e, n) {
        let r = v.get(e);
        r || (r = new Set(e), v.set(e, r));
        let a = n;
        for (;;) {
            if (r.has(a)) return a;
            let e = a.lastIndexOf("-");
            if (!~e) return;
            e >= 2 && "-" === a[e - 2] && (e -= 2), a = a.slice(0, e)
        }
    }

    function k(e, n, r, a, t, d) {
        var s, i;
        let _, o;
        if ("lookup" === r.localeMatcher) _ = function(e, n, r) {
            let a = {
                locale: ""
            };
            for (let r of n) {
                let n = r.replace(g, ""),
                    t = B(e, n);
                if (t) return a.locale = t, r !== n && (a.extension = r.slice(n.length, r.length)), a
            }
            return a.locale = r(), a
        }(Array.from(e), n, d);
        else {
            let r, a, t, i, o;
            s = Array.from(e), t = [], i = n.reduce((e, n) => {
                let r = n.replace(g, "");
                return t.push(r), e[r] = n, e
            }, {}), (o = function(e, n) {
                let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 838,
                    a = 1 / 0,
                    t = {
                        matchedDesiredLocale: "",
                        distances: {}
                    },
                    d = T.get(n);
                d || (d = n.map(e => {
                    try {
                        return Intl.getCanonicalLocales([e])[0] || e
                    } catch (n) {
                        return e
                    }
                }), T.set(n, d));
                let s = new Set(d);
                for (let n = 0; n < e.length; n++) {
                    let r = e[n];
                    if (s.has(r)) {
                        let e = 0 + 40 * n;
                        if (t.distances[r] = {
                                [r]: e
                            }, e < a && (a = e, t.matchedDesiredLocale = r, t.matchedSupportedLocale = r), 0 === n) return t
                    }
                }
                for (let n = 0; n < e.length; n++) {
                    let r = e[n];
                    try {
                        let e = new Intl.Locale(r).maximize().toString();
                        if (e !== r) {
                            let d = function(e) {
                                let n = [],
                                    r = e;
                                for (; r;) {
                                    n.push(r);
                                    let e = r.lastIndexOf("-");
                                    if (-1 === e) break;
                                    r = r.substring(0, e)
                                }
                                return n
                            }(e);
                            for (let i = 0; i < d.length; i++) {
                                let _ = d[i];
                                if (_ !== r && s.has(_)) {
                                    let d;
                                    try {
                                        d = new Intl.Locale(_).maximize().toString() === e ? 0 + 40 * n : 10 * i + 40 * n
                                    } catch (e) {
                                        d = 10 * i + 40 * n
                                    }
                                    t.distances[r] || (t.distances[r] = {}), t.distances[r][_] = d, d < a && (a = d, t.matchedDesiredLocale = r, t.matchedSupportedLocale = _);
                                    break
                                }
                            }
                        }
                    } catch (e) {}
                }
                return t.matchedSupportedLocale && 0 === a || (a = 1 / 0, e.forEach((e, r) => {
                    t.distances[e] || (t.distances[e] = {}), d.forEach((d, s) => {
                        let i = n[s],
                            _ = b(e, d) + 0 + 40 * r;
                        t.distances[e][i] = _, _ < a && (a = _, t.matchedDesiredLocale = e, t.matchedSupportedLocale = i)
                    })
                }), a >= r && (t.matchedDesiredLocale = void 0, t.matchedSupportedLocale = void 0)), t
            }(t, s)).matchedSupportedLocale && o.matchedDesiredLocale && (r = o.matchedSupportedLocale, a = i[o.matchedDesiredLocale].slice(o.matchedDesiredLocale.length) || void 0), _ = r ? {
                locale: r,
                extension: a
            } : {
                locale: d()
            }
        }
        null == _ && (_ = {
            locale: d(),
            extension: ""
        });
        let u = _.locale,
            c = t[u],
            y = {
                locale: "en",
                dataLocale: u
            };
        o = _.extension ? function(e) {
            let n;
            L(e === e.toLowerCase(), "Expected extension to be lowercase"), L("-u-" === e.slice(0, 3), "Expected extension to be a Unicode locale extension");
            let r = [],
                a = [],
                t = e.length,
                d = 3;
            for (; d < t;) {
                let s, i = e.indexOf("-", d);
                s = -1 === i ? t - d : i - d;
                let _ = e.slice(d, d + s);
                L(s >= 2, "Expected a subtag to have at least 2 characters"), void 0 === n && 2 != s ? -1 === r.indexOf(_) && r.push(_) : 2 === s ? (n = {
                    key: _,
                    value: ""
                }, void 0 === a.find(e => e.key === (null == n ? void 0 : n.key)) && a.push(n)) : (null == n ? void 0 : n.value) === "" ? n.value = _ : (L(void 0 !== n, "Expected keyword to be defined"), n.value += "-" + _), d += s + 1
            }
            return {
                attributes: r,
                keywords: a
            }
        }(_.extension).keywords : [];
        let l = [];
        for (let e of a) {
            let n, a = null != (i = null == c ? void 0 : c[e]) ? i : [];
            L(Array.isArray(a), "keyLocaleData for ".concat(e, " must be an array"));
            let t = a[0];
            L(void 0 === t || "string" == typeof t, "value must be a string or undefined");
            let d = o.find(n => n.key === e);
            if (d) {
                let r = d.value;
                "" !== r ? a.indexOf(r) > -1 && (n = {
                    key: e,
                    value: t = r
                }) : a.indexOf("true") > -1 && (n = {
                    key: e,
                    value: t = "true"
                })
            }
            let s = r[e];
            L(null == s || "string" == typeof s, "optionsValue must be a string or undefined"), "string" == typeof s && "" === (s = function(e, n) {
                let r = n.toLowerCase();
                return L(void 0 !== e, "ukey must be defined"), r
            }(e.toLowerCase(), s)) && (s = "true"), s !== t && a.indexOf(s) > -1 && (t = s, n = void 0), n && l.push(n), y[e] = t
        }
        return l.length > 0 && (u = function(e, n, r) {
            L(-1 === e.indexOf("-u-"), "Expected locale to not have a Unicode locale extension");
            let a = "-u";
            for (let e of n) a += "-".concat(e);
            for (let e of r) {
                let {
                    key: n,
                    value: r
                } = e;
                a += "-".concat(n), "" !== r && (a += "-".concat(r))
            }
            if ("-u" === a) return E(e);
            let t = e.indexOf("-x-");
            return E(-1 === t ? e + a : e.slice(0, t) + a + e.slice(t))
        }(u, [], l)), y.locale = u, y
    }

    function I(e, n, r, a) {
        return k(n, Intl.getCanonicalLocales(e), {
            localeMatcher: "best fit"
        }, [], {}, () => r).locale
    }
    let N = ["aa", "aa-DJ", "aa-ER", "ab", "af", "af-NA", "agq", "ak", "am", "an", "ann", "apc", "ar", "ar-AE", "ar-BH", "ar-DJ", "ar-DZ", "ar-EG", "ar-EH", "ar-ER", "ar-IL", "ar-IQ", "ar-JO", "ar-KM", "ar-KW", "ar-LB", "ar-LY", "ar-MA", "ar-MR", "ar-OM", "ar-PS", "ar-QA", "ar-SA", "ar-SD", "ar-SO", "ar-SS", "ar-SY", "ar-TD", "ar-TN", "ar-YE", "arn", "as", "asa", "ast", "az", "az-Arab", "az-Arab-IQ", "az-Arab-TR", "az-Cyrl", "az-Latn", "ba", "bal", "bal-Arab", "bal-Latn", "bas", "be", "be-tarask", "bem", "bew", "bez", "bg", "bgc", "bgn", "bgn-AE", "bgn-AF", "bgn-IR", "bgn-OM", "bho", "blo", "blt", "bm", "bm-Nkoo", "bn", "bn-IN", "bo", "bo-IN", "bqi", "br", "brx", "bs", "bs-Cyrl", "bs-Latn", "bss", "bua", "byn", "ca", "ca-AD", "ca-ES-valencia", "ca-FR", "ca-IT", "cad", "cch", "ccp", "ccp-IN", "ce", "ceb", "cgg", "cho", "chr", "cic", "ckb", "ckb-IR", "co", "cop", "cs", "csw", "cu", "cv", "cy", "da", "da-GL", "dav", "de", "de-AT", "de-BE", "de-CH", "de-IT", "de-LI", "de-LU", "dje", "doi", "dsb", "dua", "dv", "dyo", "dz", "ebu", "ee", "ee-TG", "el", "el-CY", "el-polyton", "en", "en-001", "en-150", "en-AE", "en-AG", "en-AI", "en-AS", "en-AT", "en-AU", "en-BB", "en-BE", "en-BI", "en-BM", "en-BS", "en-BW", "en-BZ", "en-CA", "en-CC", "en-CH", "en-CK", "en-CM", "en-CX", "en-CY", "en-CZ", "en-DE", "en-DG", "en-DK", "en-DM", "en-Dsrt", "en-EE", "en-ER", "en-ES", "en-FI", "en-FJ", "en-FK", "en-FM", "en-FR", "en-GB", "en-GD", "en-GE", "en-GG", "en-GH", "en-GI", "en-GM", "en-GS", "en-GU", "en-GY", "en-HK", "en-HU", "en-ID", "en-IE", "en-IL", "en-IM", "en-IN", "en-IO", "en-IT", "en-JE", "en-JM", "en-JP", "en-KE", "en-KI", "en-KN", "en-KY", "en-LC", "en-LR", "en-LS", "en-LT", "en-LV", "en-MG", "en-MH", "en-MO", "en-MP", "en-MS", "en-MT", "en-MU", "en-MV", "en-MW", "en-MY", "en-NA", "en-NF", "en-NG", "en-NL", "en-NO", "en-NR", "en-NU", "en-NZ", "en-PG", "en-PH", "en-PK", "en-PL", "en-PN", "en-PR", "en-PT", "en-PW", "en-RO", "en-RW", "en-SB", "en-SC", "en-SD", "en-SE", "en-SG", "en-SH", "en-SI", "en-SK", "en-SL", "en-SS", "en-SX", "en-SZ", "en-Shaw", "en-TC", "en-TK", "en-TO", "en-TT", "en-TV", "en-TZ", "en-UA", "en-UG", "en-UM", "en-VC", "en-VG", "en-VI", "en-VU", "en-WS", "en-ZA", "en-ZM", "en-ZW", "eo", "es", "es-419", "es-AR", "es-BO", "es-BR", "es-BZ", "es-CL", "es-CO", "es-CR", "es-CU", "es-DO", "es-EA", "es-EC", "es-GQ", "es-GT", "es-HN", "es-IC", "es-MX", "es-NI", "es-PA", "es-PE", "es-PH", "es-PR", "es-PY", "es-SV", "es-US", "es-UY", "es-VE", "et", "eu", "ewo", "fa", "fa-AF", "ff", "ff-Adlm", "ff-Adlm-BF", "ff-Adlm-CM", "ff-Adlm-GH", "ff-Adlm-GM", "ff-Adlm-GW", "ff-Adlm-LR", "ff-Adlm-MR", "ff-Adlm-NE", "ff-Adlm-NG", "ff-Adlm-SL", "ff-Adlm-SN", "ff-Latn", "ff-Latn-BF", "ff-Latn-CM", "ff-Latn-GH", "ff-Latn-GM", "ff-Latn-GN", "ff-Latn-GW", "ff-Latn-LR", "ff-Latn-MR", "ff-Latn-NE", "ff-Latn-NG", "ff-Latn-SL", "fi", "fil", "fo", "fo-DK", "fr", "fr-BE", "fr-BF", "fr-BI", "fr-BJ", "fr-BL", "fr-CA", "fr-CD", "fr-CF", "fr-CG", "fr-CH", "fr-CI", "fr-CM", "fr-DJ", "fr-DZ", "fr-GA", "fr-GF", "fr-GN", "fr-GP", "fr-GQ", "fr-HT", "fr-KM", "fr-LU", "fr-MA", "fr-MC", "fr-MF", "fr-MG", "fr-ML", "fr-MQ", "fr-MR", "fr-MU", "fr-NC", "fr-NE", "fr-PF", "fr-PM", "fr-RE", "fr-RW", "fr-SC", "fr-SN", "fr-SY", "fr-TD", "fr-TG", "fr-TN", "fr-VU", "fr-WF", "fr-YT", "frr", "fur", "fy", "ga", "ga-GB", "gaa", "gd", "gez", "gez-ER", "gl", "gn", "gsw", "gsw-FR", "gsw-LI", "gu", "guz", "gv", "ha", "ha-Arab", "ha-Arab-SD", "ha-GH", "ha-NE", "haw", "he", "hi", "hi-Latn", "hnj", "hnj-Hmnp", "hr", "hr-BA", "hsb", "ht", "hu", "hy", "ia", "id", "ie", "ig", "ii", "io", "is", "it", "it-CH", "it-SM", "it-VA", "iu", "iu-Latn", "ja", "jbo", "jgo", "jmc", "jv", "ka", "kaa", "kaa-Cyrl", "kaa-Latn", "kab", "kaj", "kam", "kcg", "kde", "kea", "kek", "ken", "kgp", "khq", "ki", "kk", "kk-Arab", "kk-Cyrl", "kk-KZ", "kkj", "kl", "kln", "km", "kn", "ko", "ko-CN", "ko-KP", "kok", "kok-Deva", "kok-Latn", "kpe", "kpe-GN", "ks", "ks-Arab", "ks-Deva", "ksb", "ksf", "ksh", "ku", "ku-Arab", "ku-Arab-IR", "ku-Latn", "ku-Latn-IQ", "ku-Latn-SY", "ku-TR", "kw", "kxv", "kxv-Deva", "kxv-Latn", "kxv-Orya", "kxv-Telu", "ky", "la", "lag", "lb", "lg", "lij", "lkt", "lld", "lmo", "ln", "ln-AO", "ln-CF", "ln-CG", "lo", "lrc", "lrc-IQ", "lt", "ltg", "lu", "luo", "luy", "lv", "lzz", "mai", "mas", "mas-TZ", "mdf", "mer", "mfe", "mg", "mgh", "mgo", "mhn", "mi", "mic", "mk", "ml", "mn", "mn-Mong", "mn-Mong-MN", "mni", "mni-Beng", "mni-Mtei", "moh", "mr", "ms", "ms-Arab", "ms-Arab-BN", "ms-BN", "ms-ID", "ms-SG", "mt", "mua", "mus", "mww", "mww-Hmnp", "my", "myv", "mzn", "naq", "nb", "nb-SJ", "nd", "nds", "nds-NL", "ne", "ne-IN", "nl", "nl-AW", "nl-BE", "nl-BQ", "nl-CW", "nl-SR", "nl-SX", "nmg", "nn", "nnh", "no", "nqo", "nr", "nso", "nus", "nv", "ny", "nyn", "oc", "oc-ES", "oka", "oka-US", "om", "om-KE", "or", "os", "os-RU", "osa", "pa", "pa-Arab", "pa-Guru", "pap", "pap-AW", "pcm", "pi", "pi-Latn", "pis", "pl", "pms", "prg", "ps", "ps-PK", "pt", "pt-AO", "pt-CH", "pt-CV", "pt-GQ", "pt-GW", "pt-LU", "pt-MO", "pt-MZ", "pt-PT", "pt-ST", "pt-TL", "qu", "qu-BO", "qu-EC", "quc", "raj", "rhg", "rhg-Rohg", "rhg-Rohg-BD", "rif", "rm", "rn", "ro", "ro-MD", "rof", "ru", "ru-BY", "ru-KG", "ru-KZ", "ru-MD", "ru-UA", "rw", "rwk", "sa", "sah", "saq", "sat", "sat-Deva", "sat-Olck", "sbp", "sc", "scn", "sd", "sd-Arab", "sd-Deva", "sdh", "sdh-IQ", "se", "se-FI", "se-SE", "seh", "ses", "sg", "sgs", "shi", "shi-Latn", "shi-Tfng", "shn", "shn-TH", "si", "sid", "sk", "skr", "sl", "sma", "sma-NO", "smj", "smj-NO", "smn", "sms", "sn", "so", "so-DJ", "so-ET", "so-KE", "sq", "sq-MK", "sq-XK", "sr", "sr-Cyrl", "sr-Cyrl-BA", "sr-Cyrl-ME", "sr-Cyrl-XK", "sr-Latn", "sr-Latn-BA", "sr-Latn-ME", "sr-Latn-XK", "ss", "ss-SZ", "ssy", "st", "st-LS", "su", "su-Latn", "suz", "suz-Deva", "suz-Sunu", "sv", "sv-AX", "sv-FI", "sw", "sw-CD", "sw-KE", "sw-UG", "syr", "syr-SY", "szl", "ta", "ta-LK", "ta-MY", "ta-SG", "te", "teo", "teo-KE", "tg", "th", "ti", "ti-ER", "tig", "tk", "tn", "tn-BW", "to", "tok", "tpi", "tr", "tr-CY", "trv", "trw", "ts", "tt", "twq", "tyv", "tzm", "ug", "uk", "und", "ur", "ur-IN", "uz", "uz-Arab", "uz-Cyrl", "uz-Latn", "vai", "vai-Latn", "vai-Vaii", "ve", "vec", "vi", "vmw", "vo", "vun", "wa", "wae", "wal", "wbp", "wo", "xh", "xnr", "xog", "yav", "yi", "yo", "yo-BJ", "yrl", "yrl-CO", "yrl-VE", "yue", "yue-Hans", "yue-Hant", "yue-Hant-CN", "yue-Hant-MO", "za", "zgh", "zh", "zh-Hans", "zh-Hans-HK", "zh-Hans-MO", "zh-Hans-MY", "zh-Hans-SG", "zh-Hant", "zh-Hant-HK", "zh-Hant-MO", "zh-Hant-MY", "zh-Latn", "zu"];
    var P = {};

    function R() {
        return y || (y = 1, Object.defineProperty(P, "__esModule", {
            value: !0
        }), P.shouldPolyfill = function() {
            return !("Locale" in Intl) || function() {
                try {
                    return "x-private" === new Intl.Locale("und-x-private").toString()
                } catch (e) {
                    return !0
                }
            }()
        }), P
    }
    var O = R(),
        K = {},
        H = function(e, n) {
            return (H = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, n) {
                e.__proto__ = n
            } || function(e, n) {
                for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
            })(e, n)
        };

    function D(e, n) {
        if ("function" != typeof n && null !== n) throw TypeError("Class extends value " + String(n) + " is not a constructor or null");

        function r() {
            this.constructor = e
        }
        H(e, n), e.prototype = null === n ? Object.create(n) : (r.prototype = n.prototype, new r)
    }
    var q = function() {
        return (q = Object.assign || function(e) {
            for (var n, r = 1, a = arguments.length; r < a; r++)
                for (var t in n = arguments[r]) Object.prototype.hasOwnProperty.call(n, t) && (e[t] = n[t]);
            return e
        }).apply(this, arguments)
    };

    function U(e, n) {
        var r = {};
        for (var a in e) Object.prototype.hasOwnProperty.call(e, a) && 0 > n.indexOf(a) && (r[a] = e[a]);
        if (null != e && "function" == typeof Object.getOwnPropertySymbols)
            for (var t = 0, a = Object.getOwnPropertySymbols(e); t < a.length; t++) 0 > n.indexOf(a[t]) && Object.prototype.propertyIsEnumerable.call(e, a[t]) && (r[a[t]] = e[a[t]]);
        return r
    }

    function z(e, n, r, a) {
        var t, d = arguments.length,
            s = d < 3 ? n : null === a ? a = Object.getOwnPropertyDescriptor(n, r) : a;
        if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(e, n, r, a);
        else
            for (var i = e.length - 1; i >= 0; i--)(t = e[i]) && (s = (d < 3 ? t(s) : d > 3 ? t(n, r, s) : t(n, r)) || s);
        return d > 3 && s && Object.defineProperty(n, r, s), s
    }

    function F(e, n) {
        return function(r, a) {
            n(r, a, e)
        }
    }

    function V(e, n, r, a, t, d) {
        function s(e) {
            if (void 0 !== e && "function" != typeof e) throw TypeError("Function expected");
            return e
        }
        for (var i, _ = a.kind, o = "getter" === _ ? "get" : "setter" === _ ? "set" : "value", u = !n && e ? a.static ? e : e.prototype : null, c = n || (u ? Object.getOwnPropertyDescriptor(u, a.name) : {}), y = !1, l = r.length - 1; l >= 0; l--) {
            var w = {};
            for (var f in a) w[f] = "access" === f ? {} : a[f];
            for (var f in a.access) w.access[f] = a.access[f];
            w.addInitializer = function(e) {
                if (y) throw TypeError("Cannot add initializers after decoration has completed");
                d.push(s(e || null))
            };
            var m = (0, r[l])("accessor" === _ ? {
                get: c.get,
                set: c.set
            } : c[o], w);
            if ("accessor" === _) {
                if (void 0 === m) continue;
                if (null === m || "object" != typeof m) throw TypeError("Object expected");
                (i = s(m.get)) && (c.get = i), (i = s(m.set)) && (c.set = i), (i = s(m.init)) && t.unshift(i)
            } else(i = s(m)) && ("field" === _ ? t.unshift(i) : c[o] = i)
        }
        u && Object.defineProperty(u, a.name, c), y = !0
    }

    function Z(e, n, r) {
        for (var a = arguments.length > 2, t = 0; t < n.length; t++) r = a ? n[t].call(e, r) : n[t].call(e);
        return a ? r : void 0
    }

    function x(e) {
        return "symbol" == typeof e ? e : "".concat(e)
    }

    function j(e, n, r) {
        return "symbol" == typeof n && (n = n.description ? "[".concat(n.description, "]") : ""), Object.defineProperty(e, "name", {
            configurable: !0,
            value: r ? "".concat(r, " ", n) : n
        })
    }

    function W(e, n) {
        if ("object" == typeof Reflect && "function" == typeof Reflect.metadata) return Reflect.metadata(e, n)
    }

    function Y(e, n, r, a) {
        return new(r || (r = Promise))(function(t, d) {
            function s(e) {
                try {
                    _(a.next(e))
                } catch (e) {
                    d(e)
                }
            }

            function i(e) {
                try {
                    _(a.throw(e))
                } catch (e) {
                    d(e)
                }
            }

            function _(e) {
                var n;
                e.done ? t(e.value) : ((n = e.value) instanceof r ? n : new r(function(e) {
                    e(n)
                })).then(s, i)
            }
            _((a = a.apply(e, n || [])).next())
        })
    }

    function J(e, n) {
        var r, a, t, d = {
                label: 0,
                sent: function() {
                    if (1 & t[0]) throw t[1];
                    return t[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = i(0), s.throw = i(1), s.return = i(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function i(i) {
            return function(_) {
                var o = [i, _];
                if (r) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, o[0] && (d = 0)), d;) try {
                    if (r = 1, a && (t = 2 & o[0] ? a.return : o[0] ? a.throw || ((t = a.return) && t.call(a), 0) : a.next) && !(t = t.call(a, o[1])).done) return t;
                    switch (a = 0, t && (o = [2 & o[0], t.value]), o[0]) {
                        case 0:
                        case 1:
                            t = o;
                            break;
                        case 4:
                            return d.label++, {
                                value: o[1],
                                done: !1
                            };
                        case 5:
                            d.label++, a = o[1], o = [0];
                            continue;
                        case 7:
                            o = d.ops.pop(), d.trys.pop();
                            continue;
                        default:
                            if (!(t = (t = d.trys).length > 0 && t[t.length - 1]) && (6 === o[0] || 2 === o[0])) {
                                d = 0;
                                continue
                            }
                            if (3 === o[0] && (!t || o[1] > t[0] && o[1] < t[3])) {
                                d.label = o[1];
                                break
                            }
                            if (6 === o[0] && d.label < t[1]) {
                                d.label = t[1], t = o;
                                break
                            }
                            if (t && d.label < t[2]) {
                                d.label = t[2], d.ops.push(o);
                                break
                            }
                            t[2] && d.ops.pop(), d.trys.pop();
                            continue
                    }
                    o = n.call(e, d)
                } catch (e) {
                    o = [6, e], a = 0
                } finally {
                    r = t = 0
                }
                if (5 & o[0]) throw o[1];
                return {
                    value: o[0] ? o[1] : void 0,
                    done: !0
                }
            }
        }
    }
    var Q = Object.create ? function(e, n, r, a) {
        void 0 === a && (a = r);
        var t = Object.getOwnPropertyDescriptor(n, r);
        (!t || ("get" in t ? !n.__esModule : t.writable || t.configurable)) && (t = {
            enumerable: !0,
            get: function() {
                return n[r]
            }
        }), Object.defineProperty(e, a, t)
    } : function(e, n, r, a) {
        void 0 === a && (a = r), e[a] = n[r]
    };

    function X(e, n) {
        for (var r in e) "default" === r || Object.prototype.hasOwnProperty.call(n, r) || Q(n, e, r)
    }

    function $(e) {
        var n = "function" == typeof Symbol && Symbol.iterator,
            r = n && e[n],
            a = 0;
        if (r) return r.call(e);
        if (e && "number" == typeof e.length) return {
            next: function() {
                return e && a >= e.length && (e = void 0), {
                    value: e && e[a++],
                    done: !e
                }
            }
        };
        throw TypeError(n ? "Object is not iterable." : "Symbol.iterator is not defined.")
    }

    function ee(e, n) {
        var r = "function" == typeof Symbol && e[Symbol.iterator];
        if (!r) return e;
        var a, t, d = r.call(e),
            s = [];
        try {
            for (;
                (void 0 === n || n-- > 0) && !(a = d.next()).done;) s.push(a.value)
        } catch (e) {
            t = {
                error: e
            }
        } finally {
            try {
                a && !a.done && (r = d.return) && r.call(d)
            } finally {
                if (t) throw t.error
            }
        }
        return s
    }

    function en() {
        for (var e = [], n = 0; n < arguments.length; n++) e = e.concat(ee(arguments[n]));
        return e
    }

    function er() {
        for (var e = 0, n = 0, r = arguments.length; n < r; n++) e += arguments[n].length;
        for (var a = Array(e), t = 0, n = 0; n < r; n++)
            for (var d = arguments[n], s = 0, i = d.length; s < i; s++, t++) a[t] = d[s];
        return a
    }

    function ea(e, n, r) {
        if (r || 2 == arguments.length)
            for (var a, t = 0, d = n.length; t < d; t++) !a && t in n || (a || (a = Array.prototype.slice.call(n, 0, t)), a[t] = n[t]);
        return e.concat(a || Array.prototype.slice.call(n))
    }

    function et(e) {
        return this instanceof et ? (this.v = e, this) : new et(e)
    }

    function ed(e, n, r) {
        if (!Symbol.asyncIterator) throw TypeError("Symbol.asyncIterator is not defined.");
        var a, t = r.apply(e, n || []),
            d = [];
        return a = Object.create(("function" == typeof AsyncIterator ? AsyncIterator : Object).prototype), s("next"), s("throw"), s("return", function(e) {
            return function(n) {
                return Promise.resolve(n).then(e, o)
            }
        }), a[Symbol.asyncIterator] = function() {
            return this
        }, a;

        function s(e, n) {
            t[e] && (a[e] = function(n) {
                return new Promise(function(r, a) {
                    d.push([e, n, r, a]) > 1 || i(e, n)
                })
            }, n && (a[e] = n(a[e])))
        }

        function i(e, n) {
            try {
                var r;
                (r = t[e](n)).value instanceof et ? Promise.resolve(r.value.v).then(_, o) : u(d[0][2], r)
            } catch (e) {
                u(d[0][3], e)
            }
        }

        function _(e) {
            i("next", e)
        }

        function o(e) {
            i("throw", e)
        }

        function u(e, n) {
            e(n), d.shift(), d.length && i(d[0][0], d[0][1])
        }
    }

    function es(e) {
        var n, r;
        return n = {}, a("next"), a("throw", function(e) {
            throw e
        }), a("return"), n[Symbol.iterator] = function() {
            return this
        }, n;

        function a(a, t) {
            n[a] = e[a] ? function(n) {
                return (r = !r) ? {
                    value: et(e[a](n)),
                    done: !1
                } : t ? t(n) : n
            } : t
        }
    }

    function ei(e) {
        if (!Symbol.asyncIterator) throw TypeError("Symbol.asyncIterator is not defined.");
        var n, r = e[Symbol.asyncIterator];
        return r ? r.call(e) : (e = $(e), n = {}, a("next"), a("throw"), a("return"), n[Symbol.asyncIterator] = function() {
            return this
        }, n);

        function a(r) {
            n[r] = e[r] && function(n) {
                return new Promise(function(a, t) {
                    var d;
                    d = (n = e[r](n)).done, Promise.resolve(n.value).then(function(e) {
                        a({
                            value: e,
                            done: d
                        })
                    }, t)
                })
            }
        }
    }

    function e_(e, n) {
        return Object.defineProperty ? Object.defineProperty(e, "raw", {
            value: n
        }) : e.raw = n, e
    }
    var eo = Object.create ? function(e, n) {
            Object.defineProperty(e, "default", {
                enumerable: !0,
                value: n
            })
        } : function(e, n) {
            e.default = n
        },
        eu = function(e) {
            return (eu = Object.getOwnPropertyNames || function(e) {
                var n = [];
                for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (n[n.length] = r);
                return n
            })(e)
        };

    function ec(e) {
        if (e && e.__esModule) return e;
        var n = {};
        if (null != e)
            for (var r = eu(e), a = 0; a < r.length; a++) "default" !== r[a] && Q(n, e, r[a]);
        return eo(n, e), n
    }

    function ey(e) {
        return e && e.__esModule ? e : {
            default: e
        }
    }

    function el(e, n, r, a) {
        if ("a" === r && !a) throw TypeError("Private accessor was defined without a getter");
        if ("function" == typeof n ? e !== n || !a : !n.has(e)) throw TypeError("Cannot read private member from an object whose class did not declare it");
        return "m" === r ? a : "a" === r ? a.call(e) : a ? a.value : n.get(e)
    }

    function ew(e, n, r, a, t) {
        if ("m" === a) throw TypeError("Private method is not writable");
        if ("a" === a && !t) throw TypeError("Private accessor was defined without a setter");
        if ("function" == typeof n ? e !== n || !t : !n.has(e)) throw TypeError("Cannot write private member to an object whose class did not declare it");
        return "a" === a ? t.call(e, r) : t ? t.value = r : n.set(e, r), r
    }

    function ef(e, n) {
        if (null === n || "object" != typeof n && "function" != typeof n) throw TypeError("Cannot use 'in' operator on non-object");
        return "function" == typeof e ? n === e : e.has(n)
    }

    function em(e, n, r) {
        if (null != n) {
            var a, t;
            if ("object" != typeof n && "function" != typeof n) throw TypeError("Object expected.");
            if (r) {
                if (!Symbol.asyncDispose) throw TypeError("Symbol.asyncDispose is not defined.");
                a = n[Symbol.asyncDispose]
            }
            if (void 0 === a) {
                if (!Symbol.dispose) throw TypeError("Symbol.dispose is not defined.");
                a = n[Symbol.dispose], r && (t = a)
            }
            if ("function" != typeof a) throw TypeError("Object not disposable.");
            t && (a = function() {
                try {
                    t.call(this)
                } catch (e) {
                    return Promise.reject(e)
                }
            }), e.stack.push({
                value: n,
                dispose: a,
                async: r
            })
        } else r && e.stack.push({
            async: !0
        });
        return n
    }
    var ep = "function" == typeof SuppressedError ? SuppressedError : function(e, n, r) {
        var a = Error(r);
        return a.name = "SuppressedError", a.error = e, a.suppressed = n, a
    };

    function eh(e) {
        function n(n) {
            e.error = e.hasError ? new ep(n, e.error, "An error was suppressed during disposal.") : n, e.hasError = !0
        }
        var r, a = 0;
        return function t() {
            for (; r = e.stack.pop();) try {
                if (!r.async && 1 === a) return a = 0, e.stack.push(r), Promise.resolve().then(t);
                if (r.dispose) {
                    var d = r.dispose.call(r.value);
                    if (r.async) return a |= 2, Promise.resolve(d).then(t, function(e) {
                        return n(e), t()
                    })
                } else a |= 1
            } catch (e) {
                n(e)
            }
            if (1 === a) return e.hasError ? Promise.reject(e.error) : Promise.resolve();
            if (e.hasError) throw e.error
        }()
    }

    function eM(e, n) {
        return "string" == typeof e && /^\.\.?\//.test(e) ? e.replace(/\.(tsx)$|((?:\.d)?)((?:\.[^./]+?)?)\.([cm]?)ts$/i, function(e, r, a, t, d) {
            return r ? n ? ".jsx" : ".js" : !a || t && d ? a + t + "." + d.toLowerCase() + "js" : e
        }) : e
    }
    var eS = {
            __extends: D,
            __assign: q,
            __rest: U,
            __decorate: z,
            __param: F,
            __esDecorate: V,
            __runInitializers: Z,
            __propKey: x,
            __setFunctionName: j,
            __metadata: W,
            __awaiter: Y,
            __generator: J,
            __createBinding: Q,
            __exportStar: X,
            __values: $,
            __read: ee,
            __spread: en,
            __spreadArrays: er,
            __spreadArray: ea,
            __await: et,
            __asyncGenerator: ed,
            __asyncDelegator: es,
            __asyncValues: ei,
            __makeTemplateObject: e_,
            __importStar: ec,
            __importDefault: ey,
            __classPrivateFieldGet: el,
            __classPrivateFieldSet: ew,
            __classPrivateFieldIn: ef,
            __addDisposableResource: em,
            __disposeResources: eh,
            __rewriteRelativeImportExtension: eM
        },
        eg = Object.freeze({
            __proto__: null,
            __addDisposableResource: em,
            get __assign() {
                return q
            },
            __asyncDelegator: es,
            __asyncGenerator: ed,
            __asyncValues: ei,
            __await: et,
            __awaiter: Y,
            __classPrivateFieldGet: el,
            __classPrivateFieldIn: ef,
            __classPrivateFieldSet: ew,
            __createBinding: Q,
            __decorate: z,
            __disposeResources: eh,
            __esDecorate: V,
            __exportStar: X,
            __extends: D,
            __generator: J,
            __importDefault: ey,
            __importStar: ec,
            __makeTemplateObject: e_,
            __metadata: W,
            __param: F,
            __propKey: x,
            __read: ee,
            __rest: U,
            __rewriteRelativeImportExtension: eM,
            __runInitializers: Z,
            __setFunctionName: j,
            __spread: en,
            __spreadArray: ea,
            __spreadArrays: er,
            __values: $,
            default: eS
        }),
        eL = [{
            paradigmLocales: {
                _locales: "en en_GB es es_419 pt_BR pt_PT"
            }
        }, {
            $enUS: {
                _value: "AS+CA+GU+MH+MP+PH+PR+UM+US+VI"
            }
        }, {
            $cnsar: {
                _value: "HK+MO"
            }
        }, {
            $americas: {
                _value: "019"
            }
        }, {
            $maghreb: {
                _value: "MA+DZ+TN+LY+MR+EH"
            }
        }, {
            no: {
                _desired: "nb",
                _distance: "1"
            }
        }, {
            bs: {
                _desired: "hr",
                _distance: "4"
            }
        }, {
            bs: {
                _desired: "sh",
                _distance: "4"
            }
        }, {
            hr: {
                _desired: "sh",
                _distance: "4"
            }
        }, {
            sr: {
                _desired: "sh",
                _distance: "4"
            }
        }, {
            aa: {
                _desired: "ssy",
                _distance: "4"
            }
        }, {
            de: {
                _desired: "gsw",
                _distance: "4",
                _oneway: "true"
            }
        }, {
            de: {
                _desired: "lb",
                _distance: "4",
                _oneway: "true"
            }
        }, {
            no: {
                _desired: "da",
                _distance: "8"
            }
        }, {
            nb: {
                _desired: "da",
                _distance: "8"
            }
        }, {
            ru: {
                _desired: "ab",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ach",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            nl: {
                _desired: "af",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ak",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "am",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            es: {
                _desired: "ay",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "az",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ur: {
                _desired: "bal",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "be",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "bem",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            hi: {
                _desired: "bh",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "bn",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "bo",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "br",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            es: {
                _desired: "ca",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            fil: {
                _desired: "ceb",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "chr",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ckb",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "co",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "crs",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            sk: {
                _desired: "cs",
                _distance: "20"
            }
        }, {
            en: {
                _desired: "cy",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ee",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "eo",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            es: {
                _desired: "eu",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            da: {
                _desired: "fo",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            nl: {
                _desired: "fy",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ga",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "gaa",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "gd",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            es: {
                _desired: "gl",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            es: {
                _desired: "gn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            hi: {
                _desired: "gu",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ha",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "haw",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "ht",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "hy",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ia",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ig",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "is",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            id: {
                _desired: "jv",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ka",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "kg",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "kk",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "km",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "kn",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "kri",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            tr: {
                _desired: "ku",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "ky",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            it: {
                _desired: "la",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "lg",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "ln",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "lo",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "loz",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "lua",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            hi: {
                _desired: "mai",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "mfe",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "mg",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "mi",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ml",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "mn",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            hi: {
                _desired: "mr",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            id: {
                _desired: "ms",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "mt",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "my",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ne",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            nb: {
                _desired: "nn",
                _distance: "20"
            }
        }, {
            no: {
                _desired: "nn",
                _distance: "20"
            }
        }, {
            en: {
                _desired: "nso",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ny",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "nyn",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "oc",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "om",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "or",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "pa",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "pcm",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ps",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            es: {
                _desired: "qu",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            de: {
                _desired: "rm",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "rn",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "rw",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            hi: {
                _desired: "sa",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "sd",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "si",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "sn",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "so",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "sq",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "st",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            id: {
                _desired: "su",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "sw",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ta",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "te",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "tg",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ti",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "tk",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "tlh",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "tn",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "to",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "tt",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "tum",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "ug",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "uk",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "ur",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ru: {
                _desired: "uz",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            fr: {
                _desired: "wo",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "xh",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "yi",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "yo",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "za",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            en: {
                _desired: "zu",
                _distance: "30",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "aao",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "abh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "abv",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "acm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "acq",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "acw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "acx",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "acy",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "adf",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "aeb",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "aec",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "afb",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ajp",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "apc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "apd",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "arq",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ars",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ary",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "arz",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "auz",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "avl",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ayh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ayl",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ayn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ayp",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "bbz",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "pga",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "shu",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ar: {
                _desired: "ssh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            az: {
                _desired: "azb",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            et: {
                _desired: "vro",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "ffm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "fub",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "fue",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "fuf",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "fuh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "fui",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "fuq",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ff: {
                _desired: "fuv",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            gn: {
                _desired: "gnw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            gn: {
                _desired: "gui",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            gn: {
                _desired: "gun",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            gn: {
                _desired: "nhd",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            iu: {
                _desired: "ikt",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "enb",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "eyo",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "niq",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "oki",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "pko",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "sgc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "tec",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kln: {
                _desired: "tuy",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kok: {
                _desired: "gom",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            kpe: {
                _desired: "gkp",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "ida",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lkb",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lko",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lks",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lri",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lrm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lsm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lto",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lts",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "lwg",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "nle",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "nyd",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            luy: {
                _desired: "rag",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            lv: {
                _desired: "ltg",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "bhr",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "bjq",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "bmm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "bzc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "msh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "skg",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "tdx",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "tkg",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "txy",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "xmv",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mg: {
                _desired: "xmw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            mn: {
                _desired: "mvf",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "bjn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "btj",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "bve",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "bvu",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "coa",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "dup",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "hji",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "id",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "jak",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "jax",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "kvb",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "kvr",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "kxd",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "lce",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "lcf",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "liw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "max",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "meo",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "mfa",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "mfb",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "min",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "mqg",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "msi",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "mui",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "orn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "ors",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "pel",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "pse",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "tmw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "urk",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "vkk",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "vkt",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "xmm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "zlm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ms: {
                _desired: "zmi",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ne: {
                _desired: "dty",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            om: {
                _desired: "gax",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            om: {
                _desired: "hae",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            om: {
                _desired: "orc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            or: {
                _desired: "spv",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ps: {
                _desired: "pbt",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            ps: {
                _desired: "pst",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qub",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qud",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "quf",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qug",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "quh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "quk",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qul",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qup",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qur",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qus",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "quw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qux",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "quy",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qva",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qve",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvi",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvj",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvl",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvm",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvo",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvp",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvs",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qvz",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qwa",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qwc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qwh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qws",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxa",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxl",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxo",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxp",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxr",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxt",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxu",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            qu: {
                _desired: "qxw",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            sc: {
                _desired: "sdc",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            sc: {
                _desired: "sdn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            sc: {
                _desired: "sro",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            sq: {
                _desired: "aae",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            sq: {
                _desired: "aat",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            sq: {
                _desired: "aln",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            syr: {
                _desired: "aii",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            uz: {
                _desired: "uzs",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            yi: {
                _desired: "yih",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "cdo",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "cjy",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "cpx",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "czh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "czo",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "gan",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "hak",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "hsn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "lzh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "mnp",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "nan",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "wuu",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            zh: {
                _desired: "yue",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "*": {
                _desired: "*",
                _distance: "80"
            }
        }, {
            "en-Latn": {
                _desired: "am-Ethi",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "ru-Cyrl": {
                _desired: "az-Latn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "bn-Beng",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "zh-Hans": {
                _desired: "bo-Tibt",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "ru-Cyrl": {
                _desired: "hy-Armn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "ka-Geor",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "km-Khmr",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "kn-Knda",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "lo-Laoo",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "ml-Mlym",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "my-Mymr",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "ne-Deva",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "or-Orya",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "pa-Guru",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "ps-Arab",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "sd-Arab",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "si-Sinh",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "ta-Taml",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "te-Telu",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "ti-Ethi",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "ru-Cyrl": {
                _desired: "tk-Latn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "ur-Arab",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "ru-Cyrl": {
                _desired: "uz-Latn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "en-Latn": {
                _desired: "yi-Hebr",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "sr-Cyrl": {
                _desired: "sr-Latn",
                _distance: "5"
            }
        }, {
            "zh-Hans": {
                _desired: "za-Latn",
                _distance: "10",
                _oneway: "true"
            }
        }, {
            "zh-Hans": {
                _desired: "zh-Hani",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "zh-Hant": {
                _desired: "zh-Hani",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "ar-Arab": {
                _desired: "ar-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "bn-Beng": {
                _desired: "bn-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "gu-Gujr": {
                _desired: "gu-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "hi-Deva": {
                _desired: "hi-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "kn-Knda": {
                _desired: "kn-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "ml-Mlym": {
                _desired: "ml-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "mr-Deva": {
                _desired: "mr-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "ta-Taml": {
                _desired: "ta-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "te-Telu": {
                _desired: "te-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "zh-Hans": {
                _desired: "zh-Latn",
                _distance: "20",
                _oneway: "true"
            }
        }, {
            "ja-Jpan": {
                _desired: "ja-Latn",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ja-Jpan": {
                _desired: "ja-Hani",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ja-Jpan": {
                _desired: "ja-Hira",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ja-Jpan": {
                _desired: "ja-Kana",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ja-Jpan": {
                _desired: "ja-Hrkt",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ja-Hrkt": {
                _desired: "ja-Hira",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ja-Hrkt": {
                _desired: "ja-Kana",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ko-Kore": {
                _desired: "ko-Hani",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ko-Kore": {
                _desired: "ko-Hang",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ko-Kore": {
                _desired: "ko-Jamo",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "ko-Hang": {
                _desired: "ko-Jamo",
                _distance: "5",
                _oneway: "true"
            }
        }, {
            "*-*": {
                _desired: "*-*",
                _distance: "50"
            }
        }, {
            "ar-*-$maghreb": {
                _desired: "ar-*-$maghreb",
                _distance: "4"
            }
        }, {
            "ar-*-$!maghreb": {
                _desired: "ar-*-$!maghreb",
                _distance: "4"
            }
        }, {
            "ar-*-*": {
                _desired: "ar-*-*",
                _distance: "5"
            }
        }, {
            "en-*-$enUS": {
                _desired: "en-*-$enUS",
                _distance: "4"
            }
        }, {
            "en-*-GB": {
                _desired: "en-*-$!enUS",
                _distance: "3"
            }
        }, {
            "en-*-$!enUS": {
                _desired: "en-*-$!enUS",
                _distance: "4"
            }
        }, {
            "en-*-*": {
                _desired: "en-*-*",
                _distance: "5"
            }
        }, {
            "es-*-$americas": {
                _desired: "es-*-$americas",
                _distance: "4"
            }
        }, {
            "es-*-$!americas": {
                _desired: "es-*-$!americas",
                _distance: "4"
            }
        }, {
            "es-*-*": {
                _desired: "es-*-*",
                _distance: "5"
            }
        }, {
            "pt-*-$americas": {
                _desired: "pt-*-$americas",
                _distance: "4"
            }
        }, {
            "pt-*-$!americas": {
                _desired: "pt-*-$!americas",
                _distance: "4"
            }
        }, {
            "pt-*-*": {
                _desired: "pt-*-*",
                _distance: "5"
            }
        }, {
            "zh-Hant-$cnsar": {
                _desired: "zh-Hant-$cnsar",
                _distance: "4"
            }
        }, {
            "zh-Hant-$!cnsar": {
                _desired: "zh-Hant-$!cnsar",
                _distance: "4"
            }
        }, {
            "zh-Hant-*": {
                _desired: "zh-Hant-*",
                _distance: "5"
            }
        }, {
            "*-*-*": {
                _desired: "*-*-*",
                _distance: "4"
            }
        }],
        eA = {
            "001": ["001", "001-status-grouping", "002", "005", "009", "011", "013", "014", "015", "017", "018", "019", "021", "029", "030", "034", "035", "039", "053", "054", "057", "061", "142", "143", "145", "150", "151", "154", "155", "AC", "AD", "AE", "AF", "AG", "AI", "AL", "AM", "AO", "AQ", "AR", "AS", "AT", "AU", "AW", "AX", "AZ", "BA", "BB", "BD", "BE", "BF", "BG", "BH", "BI", "BJ", "BL", "BM", "BN", "BO", "BQ", "BR", "BS", "BT", "BV", "BW", "BY", "BZ", "CA", "CC", "CD", "CF", "CG", "CH", "CI", "CK", "CL", "CM", "CN", "CO", "CP", "CQ", "CR", "CU", "CV", "CW", "CX", "CY", "CZ", "DE", "DG", "DJ", "DK", "DM", "DO", "DZ", "EA", "EC", "EE", "EG", "EH", "ER", "ES", "ET", "EU", "EZ", "FI", "FJ", "FK", "FM", "FO", "FR", "GA", "GB", "GD", "GE", "GF", "GG", "GH", "GI", "GL", "GM", "GN", "GP", "GQ", "GR", "GS", "GT", "GU", "GW", "GY", "HK", "HM", "HN", "HR", "HT", "HU", "IC", "ID", "IE", "IL", "IM", "IN", "IO", "IQ", "IR", "IS", "IT", "JE", "JM", "JO", "JP", "KE", "KG", "KH", "KI", "KM", "KN", "KP", "KR", "KW", "KY", "KZ", "LA", "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU", "LV", "LY", "MA", "MC", "MD", "ME", "MF", "MG", "MH", "MK", "ML", "MM", "MN", "MO", "MP", "MQ", "MR", "MS", "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "NA", "NC", "NE", "NF", "NG", "NI", "NL", "NO", "NP", "NR", "NU", "NZ", "OM", "PA", "PE", "PF", "PG", "PH", "PK", "PL", "PM", "PN", "PR", "PS", "PT", "PW", "PY", "QA", "QO", "RE", "RO", "RS", "RU", "RW", "SA", "SB", "SC", "SD", "SE", "SG", "SH", "SI", "SJ", "SK", "SL", "SM", "SN", "SO", "SR", "SS", "ST", "SV", "SX", "SY", "SZ", "TA", "TC", "TD", "TF", "TG", "TH", "TJ", "TK", "TL", "TM", "TN", "TO", "TR", "TT", "TV", "TW", "TZ", "UA", "UG", "UM", "UN", "US", "UY", "UZ", "VA", "VC", "VE", "VG", "VI", "VN", "VU", "WF", "WS", "XK", "YE", "YT", "ZA", "ZM", "ZW"],
            "002": ["002", "002-status-grouping", "011", "014", "015", "017", "018", "202", "AO", "BF", "BI", "BJ", "BW", "CD", "CF", "CG", "CI", "CM", "CV", "DJ", "DZ", "EA", "EG", "EH", "ER", "ET", "GA", "GH", "GM", "GN", "GQ", "GW", "IC", "IO", "KE", "KM", "LR", "LS", "LY", "MA", "MG", "ML", "MR", "MU", "MW", "MZ", "NA", "NE", "NG", "RE", "RW", "SC", "SD", "SH", "SL", "SN", "SO", "SS", "ST", "SZ", "TD", "TF", "TG", "TN", "TZ", "UG", "YT", "ZA", "ZM", "ZW"],
            "003": ["003", "013", "021", "029", "AG", "AI", "AW", "BB", "BL", "BM", "BQ", "BS", "BZ", "CA", "CR", "CU", "CW", "DM", "DO", "GD", "GL", "GP", "GT", "HN", "HT", "JM", "KN", "KY", "LC", "MF", "MQ", "MS", "MX", "NI", "PA", "PM", "PR", "SV", "SX", "TC", "TT", "US", "VC", "VG", "VI"],
            "005": ["005", "AR", "BO", "BR", "BV", "CL", "CO", "EC", "FK", "GF", "GS", "GY", "PE", "PY", "SR", "UY", "VE"],
            "009": ["009", "053", "054", "057", "061", "AC", "AQ", "AS", "AU", "CC", "CK", "CP", "CX", "DG", "FJ", "FM", "GU", "HM", "KI", "MH", "MP", "NC", "NF", "NR", "NU", "NZ", "PF", "PG", "PN", "PW", "QO", "SB", "TA", "TK", "TO", "TV", "UM", "VU", "WF", "WS"],
            "011": ["011", "BF", "BJ", "CI", "CV", "GH", "GM", "GN", "GW", "LR", "ML", "MR", "NE", "NG", "SH", "SL", "SN", "TG"],
            "013": ["013", "BZ", "CR", "GT", "HN", "MX", "NI", "PA", "SV"],
            "014": ["014", "BI", "DJ", "ER", "ET", "IO", "KE", "KM", "MG", "MU", "MW", "MZ", "RE", "RW", "SC", "SO", "SS", "TF", "TZ", "UG", "YT", "ZM", "ZW"],
            "015": ["015", "DZ", "EA", "EG", "EH", "IC", "LY", "MA", "SD", "TN"],
            "017": ["017", "AO", "CD", "CF", "CG", "CM", "GA", "GQ", "ST", "TD"],
            "018": ["018", "BW", "LS", "NA", "SZ", "ZA"],
            "019": ["003", "005", "013", "019", "019-status-grouping", "021", "029", "419", "AG", "AI", "AR", "AW", "BB", "BL", "BM", "BO", "BQ", "BR", "BS", "BV", "BZ", "CA", "CL", "CO", "CR", "CU", "CW", "DM", "DO", "EC", "FK", "GD", "GF", "GL", "GP", "GS", "GT", "GY", "HN", "HT", "JM", "KN", "KY", "LC", "MF", "MQ", "MS", "MX", "NI", "PA", "PE", "PM", "PR", "PY", "SR", "SV", "SX", "TC", "TT", "US", "UY", "VC", "VE", "VG", "VI"],
            "021": ["021", "BM", "CA", "GL", "PM", "US"],
            "029": ["029", "AG", "AI", "AW", "BB", "BL", "BQ", "BS", "CU", "CW", "DM", "DO", "GD", "GP", "HT", "JM", "KN", "KY", "LC", "MF", "MQ", "MS", "PR", "SX", "TC", "TT", "VC", "VG", "VI"],
            "030": ["030", "CN", "HK", "JP", "KP", "KR", "MN", "MO", "TW"],
            "034": ["034", "AF", "BD", "BT", "IN", "IR", "LK", "MV", "NP", "PK"],
            "035": ["035", "BN", "ID", "KH", "LA", "MM", "MY", "PH", "SG", "TH", "TL", "VN"],
            "039": ["039", "AD", "AL", "BA", "ES", "GI", "GR", "HR", "IT", "ME", "MK", "MT", "PT", "RS", "SI", "SM", "VA", "XK"],
            "053": ["053", "AU", "CC", "CX", "HM", "NF", "NZ"],
            "054": ["054", "FJ", "NC", "PG", "SB", "VU"],
            "057": ["057", "FM", "GU", "KI", "MH", "MP", "NR", "PW", "UM"],
            "061": ["061", "AS", "CK", "NU", "PF", "PN", "TK", "TO", "TV", "WF", "WS"],
            142: ["030", "034", "035", "142", "143", "145", "AE", "AF", "AM", "AZ", "BD", "BH", "BN", "BT", "CN", "CY", "GE", "HK", "ID", "IL", "IN", "IQ", "IR", "JO", "JP", "KG", "KH", "KP", "KR", "KW", "KZ", "LA", "LB", "LK", "MM", "MN", "MO", "MV", "MY", "NP", "OM", "PH", "PK", "PS", "QA", "SA", "SG", "SY", "TH", "TJ", "TL", "TM", "TR", "TW", "UZ", "VN", "YE"],
            143: ["143", "KG", "KZ", "TJ", "TM", "UZ"],
            145: ["145", "AE", "AM", "AZ", "BH", "CY", "GE", "IL", "IQ", "JO", "KW", "LB", "OM", "PS", "QA", "SA", "SY", "TR", "YE"],
            150: ["039", "150", "151", "154", "155", "AD", "AL", "AT", "AX", "BA", "BE", "BG", "BY", "CH", "CQ", "CZ", "DE", "DK", "EE", "ES", "FI", "FO", "FR", "GB", "GG", "GI", "GR", "HR", "HU", "IE", "IM", "IS", "IT", "JE", "LI", "LT", "LU", "LV", "MC", "MD", "ME", "MK", "MT", "NL", "NO", "PL", "PT", "RO", "RS", "RU", "SE", "SI", "SJ", "SK", "SM", "UA", "VA", "XK"],
            151: ["151", "BG", "BY", "CZ", "HU", "MD", "PL", "RO", "RU", "SK", "UA"],
            154: ["154", "AX", "CQ", "DK", "EE", "FI", "FO", "GB", "GG", "IE", "IM", "IS", "JE", "LT", "LV", "NO", "SE", "SJ"],
            155: ["155", "AT", "BE", "CH", "DE", "FR", "LI", "LU", "MC", "NL"],
            202: ["011", "014", "017", "018", "202", "AO", "BF", "BI", "BJ", "BW", "CD", "CF", "CG", "CI", "CM", "CV", "DJ", "ER", "ET", "GA", "GH", "GM", "GN", "GQ", "GW", "IO", "KE", "KM", "LR", "LS", "MG", "ML", "MR", "MU", "MW", "MZ", "NA", "NE", "NG", "RE", "RW", "SC", "SH", "SL", "SN", "SO", "SS", "ST", "SZ", "TD", "TF", "TG", "TZ", "UG", "YT", "ZA", "ZM", "ZW"],
            419: ["005", "013", "029", "419", "AG", "AI", "AR", "AW", "BB", "BL", "BO", "BQ", "BR", "BS", "BV", "BZ", "CL", "CO", "CR", "CU", "CW", "DM", "DO", "EC", "FK", "GD", "GF", "GP", "GS", "GT", "GY", "HN", "HT", "JM", "KN", "KY", "LC", "MF", "MQ", "MS", "MX", "NI", "PA", "PE", "PR", "PY", "SR", "SV", "SX", "TC", "TT", "UY", "VC", "VE", "VG", "VI"],
            EU: ["AT", "BE", "BG", "CY", "CZ", "DE", "DK", "EE", "ES", "EU", "FI", "FR", "GR", "HR", "HU", "IE", "IT", "LT", "LU", "LV", "MT", "NL", "PL", "PT", "RO", "SE", "SI", "SK"],
            EZ: ["AT", "BE", "CY", "DE", "EE", "ES", "EZ", "FI", "FR", "GR", "IE", "IT", "LT", "LU", "LV", "MT", "NL", "PT", "SI", "SK"],
            QO: ["AC", "AQ", "CP", "DG", "QO", "TA"],
            UN: ["AD", "AE", "AF", "AG", "AL", "AM", "AO", "AR", "AT", "AU", "AZ", "BA", "BB", "BD", "BE", "BF", "BG", "BH", "BI", "BJ", "BN", "BO", "BR", "BS", "BT", "BW", "BY", "BZ", "CA", "CD", "CF", "CG", "CH", "CI", "CL", "CM", "CN", "CO", "CR", "CU", "CV", "CY", "CZ", "DE", "DJ", "DK", "DM", "DO", "DZ", "EC", "EE", "EG", "ER", "ES", "ET", "FI", "FJ", "FM", "FR", "GA", "GB", "GD", "GE", "GH", "GM", "GN", "GQ", "GR", "GT", "GW", "GY", "HN", "HR", "HT", "HU", "ID", "IE", "IL", "IN", "IQ", "IR", "IS", "IT", "JM", "JO", "JP", "KE", "KG", "KH", "KI", "KM", "KN", "KP", "KR", "KW", "KZ", "LA", "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU", "LV", "LY", "MA", "MC", "MD", "ME", "MG", "MH", "MK", "ML", "MM", "MN", "MR", "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "NA", "NE", "NG", "NI", "NL", "NO", "NP", "NR", "NZ", "OM", "PA", "PE", "PG", "PH", "PK", "PL", "PT", "PW", "PY", "QA", "RO", "RS", "RU", "RW", "SA", "SB", "SC", "SD", "SE", "SG", "SI", "SK", "SL", "SM", "SN", "SO", "SR", "SS", "ST", "SV", "SY", "SZ", "TD", "TG", "TH", "TJ", "TL", "TM", "TN", "TO", "TR", "TT", "TV", "TZ", "UA", "UG", "UN", "US", "UY", "UZ", "VC", "VE", "VN", "VU", "WS", "YE", "ZA", "ZM", "ZW"]
        },
        eG = /-u(?:-[0-9a-z]{2,8})+/gi;

    function eC(e, n, r) {
        if (void 0 === r && (r = Error), !e) throw new r(n)
    }

    function eb(e, n, r) {
        var a = n.split("-"),
            t = a[0],
            d = a[1],
            s = a[2],
            i = !0;
        if (s && "$" === s[0]) {
            var _ = "!" !== s[1],
                o = (_ ? r[s.slice(1)] : r[s.slice(2)]).map(function(e) {
                    return eA[e] || [e]
                }).reduce(function(e, n) {
                    return ea(ea([], e, !0), n, !0)
                }, []);
            i && (i = o.indexOf(e.region || "") > -1 == _)
        } else i && (i = !e.region || "*" === s || s === e.region);
        return i && (i = !e.script || "*" === d || d === e.script), i && (i = !e.language || "*" === t || t === e.language), i
    }

    function eT(e) {
        return [e.language, e.script, e.region].filter(Boolean).join("-")
    }

    function eE(e, n, r) {
        for (var a = 0, t = r.matches; a < t.length; a++) {
            var d = t[a],
                s = eb(e, d.desired, r.matchVariables) && eb(n, d.supported, r.matchVariables);
            if (d.oneway || s || (s = eb(e, d.supported, r.matchVariables) && eb(n, d.desired, r.matchVariables)), s) {
                var i = 10 * d.distance;
                if (r.paradigmLocales.indexOf(eT(e)) > -1 != r.paradigmLocales.indexOf(eT(n)) > -1) return i - 1;
                return i
            }
        }
        throw Error("No matching distance found")
    }

    function ev(e) {
        return Intl.getCanonicalLocales(e)[0]
    }

    function eB(e, n) {
        for (var r = n;;) {
            if (e.indexOf(r) > -1) return r;
            var a = r.lastIndexOf("-");
            if (!~a) return;
            a >= 2 && "-" === r[a - 2] && (a -= 2), r = r.slice(0, a)
        }
    }

    function ek(e, n, r, a, t, d) {
        "lookup" === r.localeMatcher ? i = function(e, n, r) {
            for (var a = {
                    locale: ""
                }, t = 0; t < n.length; t++) {
                var d = n[t],
                    s = d.replace(eG, ""),
                    i = eB(e, s);
                if (i) return a.locale = i, d !== s && (a.extension = d.slice(s.length, d.length)), a
            }
            return a.locale = r(), a
        }(Array.from(e), n, d) : (o = Array.from(e), y = [], w = n.reduce(function(e, n) {
            var r = n.replace(eG, "");
            return y.push(r), e[r] = n, e
        }, {}), (void 0 === f && (f = 838), m = 1 / 0, p = {
            matchedDesiredLocale: "",
            distances: {}
        }, y.forEach(function(e, n) {
            p.distances[e] || (p.distances[e] = {}), o.forEach(function(r) {
                var a, t, d, s, i, _, o = (a = new Intl.Locale(e).maximize(), t = new Intl.Locale(r).maximize(), d = {
                    language: a.language,
                    script: a.script || "",
                    region: a.region || ""
                }, s = {
                    language: t.language,
                    script: t.script || "",
                    region: t.region || ""
                }, i = 0, _ = function() {
                    var e, n;
                    if (!l) {
                        var r = null == (n = null == (e = eL[0]) ? void 0 : e.paradigmLocales) ? void 0 : n._locales.split(" "),
                            a = eL.slice(1, 5);
                        l = {
                            matches: eL.slice(5).map(function(e) {
                                var n = Object.keys(e)[0],
                                    r = e[n];
                                return {
                                    supported: n,
                                    desired: r._desired,
                                    distance: +r._distance,
                                    oneway: "true" === r.oneway
                                }
                            }, {}),
                            matchVariables: a.reduce(function(e, n) {
                                var r = Object.keys(n)[0],
                                    a = n[r];
                                return e[r.slice(1)] = a._value.split("+"), e
                            }, {}),
                            paradigmLocales: ea(ea([], r, !0), r.map(function(e) {
                                return new Intl.Locale(e.replace(/_/g, "-")).maximize().toString()
                            }), !0)
                        }
                    }
                    return l
                }(), d.language !== s.language && (i += eE({
                    language: a.language,
                    script: "",
                    region: ""
                }, {
                    language: t.language,
                    script: "",
                    region: ""
                }, _)), d.script !== s.script && (i += eE({
                    language: a.language,
                    script: d.script,
                    region: ""
                }, {
                    language: t.language,
                    script: s.script,
                    region: ""
                }, _)), d.region !== s.region && (i += eE(d, s, _)), i + 0 + 40 * n);
                p.distances[e][r] = o, o < m && (m = o, p.matchedDesiredLocale = e, p.matchedSupportedLocale = r)
            })
        }), m >= f && (p.matchedDesiredLocale = void 0, p.matchedSupportedLocale = void 0), p).matchedSupportedLocale && p.matchedDesiredLocale && (u = p.matchedSupportedLocale, c = w[p.matchedDesiredLocale].slice(p.matchedDesiredLocale.length) || void 0), i = u ? {
            locale: u,
            extension: c
        } : {
            locale: d()
        }), null == i && (i = {
            locale: d(),
            extension: ""
        });
        var s, i, _, o, u, c, y, w, f, m, p, h = i.locale,
            M = t[h],
            S = {
                locale: "en",
                dataLocale: h
            };
        _ = i.extension ? function(e) {
            eC(e === e.toLowerCase(), "Expected extension to be lowercase"), eC("-u-" === e.slice(0, 3), "Expected extension to be a Unicode locale extension");
            for (var n, r = [], a = [], t = e.length, d = 3; d < t;) {
                var s = e.indexOf("-", d),
                    i = void 0;
                i = -1 === s ? t - d : s - d;
                var _ = e.slice(d, d + i);
                eC(i >= 2, "Expected a subtag to have at least 2 characters"), void 0 === n && 2 != i ? -1 === r.indexOf(_) && r.push(_) : 2 === i ? (n = {
                    key: _,
                    value: ""
                }, void 0 === a.find(function(e) {
                    return e.key === (null == n ? void 0 : n.key)
                }) && a.push(n)) : (null == n ? void 0 : n.value) === "" ? n.value = _ : (eC(void 0 !== n, "Expected keyword to be defined"), n.value += "-" + _), d += i + 1
            }
            return {
                attributes: r,
                keywords: a
            }
        }(i.extension).keywords : [];
        for (var g = [], L = function(e) {
                var n, a, t = null != (s = null == M ? void 0 : M[e]) ? s : [];
                eC(Array.isArray(t), "keyLocaleData for ".concat(e, " must be an array"));
                var d = t[0];
                eC(void 0 === d || "string" == typeof d, "value must be a string or undefined");
                var i = void 0,
                    o = _.find(function(n) {
                        return n.key === e
                    });
                if (o) {
                    var u = o.value;
                    "" !== u ? t.indexOf(u) > -1 && (i = {
                        key: e,
                        value: d = u
                    }) : t.indexOf("true") > -1 && (i = {
                        key: e,
                        value: d = "true"
                    })
                }
                var c = r[e];
                eC(null == c || "string" == typeof c, "optionsValue must be a string or undefined"), "string" == typeof c && (n = e.toLowerCase(), a = c.toLowerCase(), eC(void 0 !== n, "ukey must be defined"), "" === (c = a) && (c = "true")), c !== d && t.indexOf(c) > -1 && (d = c, i = void 0), i && g.push(i), S[e] = d
            }, A = 0; A < a.length; A++) L(a[A]);
        return g.length > 0 && (h = function(e, n, r) {
            eC(-1 === e.indexOf("-u-"), "Expected locale to not have a Unicode locale extension");
            for (var a = "-u", t = 0; t < n.length; t++) {
                var d = n[t];
                a += "-".concat(d)
            }
            for (var s = 0; s < r.length; s++) {
                var i = r[s],
                    _ = i.key,
                    o = i.value;
                a += "-".concat(_), "" !== o && (a += "-".concat(o))
            }
            if ("-u" === a) return ev(e);
            var u = e.indexOf("-x-");
            return ev(-1 === u ? e + a : e.slice(0, u) + a + e.slice(u))
        }(h, [], g)), S.locale = h, S
    }

    function eI(e, n) {
        for (var r = [], a = 0; a < n.length; a++) {
            var t = eB(e, n[a].replace(eG, ""));
            t && r.push(t)
        }
        return r
    }
    var eN = d(Object.freeze({
            __proto__: null,
            LookupSupportedLocales: eI,
            ResolveLocale: ek,
            match: function(e, n, r, a) {
                return ek(n, Intl.getCanonicalLocales(e), {
                    localeMatcher: (null == a ? void 0 : a.algorithm) || "best fit"
                }, [], {}, function() {
                    return r
                }).locale
            }
        })),
        eP = {};

    function eR() {
        if (f) return K;
        f = 1, Object.defineProperty(K, "__esModule", {
            value: !0
        }), K.shouldPolyfill = function(n) {
            if (void 0 === n && (n = "en"), !("PluralRules" in Intl) || "one" === new Intl.PluralRules("en", {
                    minimumFractionDigits: 2
                }).select(1) || ! function(e) {
                    if (!e) return !0;
                    var n = Array.isArray(e) ? e : [e];
                    return Intl.PluralRules.supportedLocalesOf(n).length === n.length
                }(n)) return n ? (0, eN.match)([n], e.supportedLocales, "en") : void 0
        };
        var e = (w || (w = 1, Object.defineProperty(eP, "__esModule", {
            value: !0
        }), eP.supportedLocales = void 0, eP.supportedLocales = ["af", "ak", "am", "an", "ar", "ars", "as", "asa", "ast", "az", "bal", "be", "bem", "bez", "bg", "bho", "bm", "bn", "bo", "br", "brx", "bs", "ca", "ce", "ceb", "cgg", "chr", "ckb", "cs", "cy", "da", "de", "doi", "dsb", "dv", "dz", "ee", "el", "en", "eo", "es", "et", "eu", "fa", "ff", "fi", "fil", "fo", "fr", "fur", "fy", "ga", "gd", "gl", "gsw", "gu", "guw", "gv", "ha", "haw", "he", "hi", "hnj", "hr", "hsb", "hu", "hy", "ia", "id", "ig", "ii", "io", "is", "it", "iu", "ja", "jbo", "jgo", "jmc", "jv", "jw", "ka", "kab", "kaj", "kcg", "kde", "kea", "kk", "kkj", "kl", "km", "kn", "ko", "ks", "ksb", "ksh", "ku", "kw", "ky", "lag", "lb", "lg", "lij", "lkt", "ln", "lo", "lt", "lv", "mas", "mg", "mgo", "mk", "ml", "mn", "mo", "mr", "ms", "mt", "my", "nah", "naq", "nb", "nd", "ne", "nl", "nn", "nnh", "no", "nqo", "nr", "nso", "ny", "nyn", "om", "or", "os", "osa", "pa", "pap", "pcm", "pl", "prg", "ps", "pt", "pt-PT", "rm", "ro", "rof", "ru", "rwk", "sah", "saq", "sat", "sc", "scn", "sd", "sdh", "se", "seh", "ses", "sg", "sh", "shi", "si", "sk", "sl", "sma", "smi", "smj", "smn", "sms", "sn", "so", "sq", "sr", "ss", "ssy", "st", "su", "sv", "sw", "syr", "ta", "te", "teo", "th", "ti", "tig", "tk", "tl", "tn", "to", "tpi", "tr", "ts", "tzm", "ug", "uk", "und", "ur", "uz", "ve", "vi", "vo", "vun", "wa", "wae", "wo", "xh", "xog", "yi", "yo", "yue", "zh", "zu"]), eP);
        return K
    }
    var eO = eR(),
        eK = {},
        eH = {};

    function eD() {
        if (p) return eK;
        p = 1, Object.defineProperty(eK, "__esModule", {
            value: !0
        }), eK.shouldPolyfill = function(n) {
            if (void 0 === n && (n = "en"), !("RelativeTimeFormat" in Intl) || ! function(e) {
                    if (!e) return !0;
                    var n = Array.isArray(e) ? e : [e];
                    return Intl.RelativeTimeFormat.supportedLocalesOf(n).length === n.length
                }(n) || ! function(e) {
                    try {
                        return "numberingSystem" in new Intl.RelativeTimeFormat(e || "en", {
                            numeric: "auto"
                        }).resolvedOptions()
                    } catch (e) {
                        return !1
                    }
                }(n)) return (0, eN.match)([n], e.supportedLocales, "en")
        };
        var e = (m || (m = 1, Object.defineProperty(eH, "__esModule", {
            value: !0
        }), eH.supportedLocales = void 0, eH.supportedLocales = ["af", "af-NA", "agq", "ak", "am", "ar", "ar-AE", "ar-BH", "ar-DJ", "ar-DZ", "ar-EG", "ar-EH", "ar-ER", "ar-IL", "ar-IQ", "ar-JO", "ar-KM", "ar-KW", "ar-LB", "ar-LY", "ar-MA", "ar-MR", "ar-OM", "ar-PS", "ar-QA", "ar-SA", "ar-SD", "ar-SO", "ar-SS", "ar-SY", "ar-TD", "ar-TN", "ar-YE", "as", "asa", "ast", "az", "az-Cyrl", "az-Latn", "bas", "be", "be-tarask", "bem", "bez", "bg", "bm", "bn", "bn-IN", "bo", "bo-IN", "br", "brx", "bs", "bs-Cyrl", "bs-Latn", "ca", "ca-AD", "ca-ES-valencia", "ca-FR", "ca-IT", "ccp", "ccp-IN", "ce", "ceb", "cgg", "chr", "ckb", "ckb-IR", "cs", "cy", "da", "da-GL", "dav", "de", "de-AT", "de-BE", "de-CH", "de-IT", "de-LI", "de-LU", "dje", "doi", "dsb", "dua", "dyo", "dz", "ebu", "ee", "ee-TG", "el", "el-CY", "en", "en-001", "en-150", "en-AE", "en-AG", "en-AI", "en-AS", "en-AT", "en-AU", "en-BB", "en-BE", "en-BI", "en-BM", "en-BS", "en-BW", "en-BZ", "en-CA", "en-CC", "en-CH", "en-CK", "en-CM", "en-CX", "en-CY", "en-DE", "en-DG", "en-DK", "en-DM", "en-ER", "en-FI", "en-FJ", "en-FK", "en-FM", "en-GB", "en-GD", "en-GG", "en-GH", "en-GI", "en-GM", "en-GU", "en-GY", "en-HK", "en-IE", "en-IL", "en-IM", "en-IN", "en-IO", "en-JE", "en-JM", "en-KE", "en-KI", "en-KN", "en-KY", "en-LC", "en-LR", "en-LS", "en-MG", "en-MH", "en-MO", "en-MP", "en-MS", "en-MT", "en-MU", "en-MW", "en-MY", "en-NA", "en-NF", "en-NG", "en-NL", "en-NR", "en-NU", "en-NZ", "en-PG", "en-PH", "en-PK", "en-PN", "en-PR", "en-PW", "en-RW", "en-SB", "en-SC", "en-SD", "en-SE", "en-SG", "en-SH", "en-SI", "en-SL", "en-SS", "en-SX", "en-SZ", "en-TC", "en-TK", "en-TO", "en-TT", "en-TV", "en-TZ", "en-UG", "en-UM", "en-VC", "en-VG", "en-VI", "en-VU", "en-WS", "en-ZA", "en-ZM", "en-ZW", "eo", "es", "es-419", "es-AR", "es-BO", "es-BR", "es-BZ", "es-CL", "es-CO", "es-CR", "es-CU", "es-DO", "es-EA", "es-EC", "es-GQ", "es-GT", "es-HN", "es-IC", "es-MX", "es-NI", "es-PA", "es-PE", "es-PH", "es-PR", "es-PY", "es-SV", "es-US", "es-UY", "es-VE", "et", "eu", "ewo", "fa", "fa-AF", "ff", "ff-Adlm", "ff-Adlm-BF", "ff-Adlm-CM", "ff-Adlm-GH", "ff-Adlm-GM", "ff-Adlm-GW", "ff-Adlm-LR", "ff-Adlm-MR", "ff-Adlm-NE", "ff-Adlm-NG", "ff-Adlm-SL", "ff-Adlm-SN", "ff-Latn", "ff-Latn-BF", "ff-Latn-CM", "ff-Latn-GH", "ff-Latn-GM", "ff-Latn-GN", "ff-Latn-GW", "ff-Latn-LR", "ff-Latn-MR", "ff-Latn-NE", "ff-Latn-NG", "ff-Latn-SL", "fi", "fil", "fo", "fo-DK", "fr", "fr-BE", "fr-BF", "fr-BI", "fr-BJ", "fr-BL", "fr-CA", "fr-CD", "fr-CF", "fr-CG", "fr-CH", "fr-CI", "fr-CM", "fr-DJ", "fr-DZ", "fr-GA", "fr-GF", "fr-GN", "fr-GP", "fr-GQ", "fr-HT", "fr-KM", "fr-LU", "fr-MA", "fr-MC", "fr-MF", "fr-MG", "fr-ML", "fr-MQ", "fr-MR", "fr-MU", "fr-NC", "fr-NE", "fr-PF", "fr-PM", "fr-RE", "fr-RW", "fr-SC", "fr-SN", "fr-SY", "fr-TD", "fr-TG", "fr-TN", "fr-VU", "fr-WF", "fr-YT", "fur", "fy", "ga", "ga-GB", "gd", "gl", "gsw", "gsw-FR", "gsw-LI", "gu", "guz", "gv", "ha", "ha-GH", "ha-NE", "haw", "he", "hi", "hr", "hr-BA", "hsb", "hu", "hy", "ia", "id", "ig", "ii", "is", "it", "it-CH", "it-SM", "it-VA", "ja", "jgo", "jmc", "jv", "ka", "kab", "kam", "kde", "kea", "kgp", "khq", "ki", "kk", "kkj", "kl", "kln", "km", "kn", "ko", "ko-KP", "kok", "ks", "ks-Arab", "ksb", "ksf", "ksh", "ku", "kw", "ky", "lag", "lb", "lg", "lkt", "ln", "ln-AO", "ln-CF", "ln-CG", "lo", "lrc", "lrc-IQ", "lt", "lu", "luo", "luy", "lv", "mai", "mas", "mas-TZ", "mer", "mfe", "mg", "mgh", "mgo", "mi", "mk", "ml", "mn", "mni", "mni-Beng", "mr", "ms", "ms-BN", "ms-ID", "ms-SG", "mt", "mua", "my", "mzn", "naq", "nb", "nb-SJ", "nd", "nds", "nds-NL", "ne", "ne-IN", "nl", "nl-AW", "nl-BE", "nl-BQ", "nl-CW", "nl-SR", "nl-SX", "nmg", "nn", "nnh", "no", "nus", "nyn", "om", "om-KE", "or", "os", "os-RU", "pa", "pa-Arab", "pa-Guru", "pcm", "pl", "ps", "ps-PK", "pt", "pt-AO", "pt-CH", "pt-CV", "pt-GQ", "pt-GW", "pt-LU", "pt-MO", "pt-MZ", "pt-PT", "pt-ST", "pt-TL", "qu", "qu-BO", "qu-EC", "rm", "rn", "ro", "ro-MD", "rof", "ru", "ru-BY", "ru-KG", "ru-KZ", "ru-MD", "ru-UA", "rw", "rwk", "sa", "sah", "saq", "sat", "sat-Olck", "sbp", "sc", "sd", "sd-Arab", "sd-Deva", "se", "se-FI", "se-SE", "seh", "ses", "sg", "shi", "shi-Latn", "shi-Tfng", "si", "sk", "sl", "smn", "sn", "so", "so-DJ", "so-ET", "so-KE", "sq", "sq-MK", "sq-XK", "sr", "sr-Cyrl", "sr-Cyrl-BA", "sr-Cyrl-ME", "sr-Cyrl-XK", "sr-Latn", "sr-Latn-BA", "sr-Latn-ME", "sr-Latn-XK", "su", "su-Latn", "sv", "sv-AX", "sv-FI", "sw", "sw-CD", "sw-KE", "sw-UG", "ta", "ta-LK", "ta-MY", "ta-SG", "te", "teo", "teo-KE", "tg", "th", "ti", "ti-ER", "tk", "to", "tr", "tr-CY", "tt", "twq", "tzm", "ug", "uk", "und", "ur", "ur-IN", "uz", "uz-Arab", "uz-Cyrl", "uz-Latn", "vai", "vai-Latn", "vai-Vaii", "vi", "vun", "wae", "wo", "xh", "xog", "yav", "yi", "yo", "yo-BJ", "yrl", "yrl-CO", "yrl-VE", "yue", "yue-Hans", "yue-Hant", "zgh", "zh", "zh-Hans", "zh-Hans-HK", "zh-Hans-MO", "zh-Hans-SG", "zh-Hant", "zh-Hant-HK", "zh-Hant-MO", "zu"]), eH);
        return eK
    }
    var eq = eD();
    let eU = O.shouldPolyfill(),
        ez = eU || void 0 !== eq.shouldPolyfill(),
        eF = eU || void 0 !== eO.shouldPolyfill(),
        eV = eU || void 0 !== function() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "en";
            try {
                let n, r;
                if ("u" < typeof Intl || !Intl.DisplayNames || (n = Intl.DisplayNames) && !n.polyfilled && "CA" === new n(["en"], {
                        type: "region"
                    }).of("CA") || (r = Intl.DisplayNames) && !r.polyfilled && "Arabic" !== new r(["en"], {
                        type: "script"
                    }).of("arab") || ! function(e) {
                        if (!e) return !0;
                        let n = Array.isArray(e) ? e : [e];
                        return Intl.DisplayNames.supportedLocalesOf(n).length === n.length
                    }(e)) return I([e], N, "en")
            } catch (e) {
                return !0
            }
        }(),
        eZ = "function" != typeof window.ResizeObserver,
        ex = i(ez || eF || eV || eZ, function() {
            return Promise.all([(eU ? e.A(544044).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([ez ? e.A(144508).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, eF ? e.A(104070).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, eV ? e.A(939853).then(() => e.A(890267)) : null])), eZ ? e.A(956827) : null])
        });
    e.s(["L", 0, function(e, n) {
        let r = [];
        for (let a of n) {
            let n = B(e, a.replace(g, ""));
            n && r.push(n)
        }
        return r
    }, "R", 0, k, "_", 0, ea, "a", 0, eR, "b", 0, eD, "c", 0, ek, "d", 0, eI, "e", 0, D, "f", 0, R, "m", 0, I, "r", 0, eN, "t", 0, eg, "u", 0, ex], 657642)
}]);

//# debugId=fa01e810-b7da-f63b-6f0f-e5b4ce7d90a8
//# sourceMappingURL=1w1lk0_bfrv1b.js.map