;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "aa6b0abd-f534-a3c8-32f5-9134918e9191")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 136817, t => {
    "use strict";

    function r() {
        return (r = Object.assign.bind()).apply(null, arguments)
    }
    t.s(["default", () => r])
}, 26277, t => {
    "use strict";
    t.s(["default", 0, function(t) {
        var r = Object.create(null);
        return function(n) {
            return void 0 === r[n] && (r[n] = t(n)), r[n]
        }
    }])
}, 534424, 238825, 905625, 220454, 327209, 164688, t => {
    "use strict";
    var r, n = t.i(416340),
        o = function() {
            function t(t) {
                var r = this;
                this._insertTag = function(t) {
                    var n;
                    n = 0 === r.tags.length ? r.insertionPoint ? r.insertionPoint.nextSibling : r.prepend ? r.container.firstChild : r.before : r.tags[r.tags.length - 1].nextSibling, r.container.insertBefore(t, n), r.tags.push(t)
                }, this.isSpeedy = void 0 === t.speedy || t.speedy, this.tags = [], this.ctr = 0, this.nonce = t.nonce, this.key = t.key, this.container = t.container, this.prepend = t.prepend, this.insertionPoint = t.insertionPoint, this.before = null
            }
            var r = t.prototype;
            return r.hydrate = function(t) {
                t.forEach(this._insertTag)
            }, r.insert = function(t) {
                this.ctr % (this.isSpeedy ? 65e3 : 1) == 0 && this._insertTag(((r = document.createElement("style")).setAttribute("data-emotion", this.key), void 0 !== this.nonce && r.setAttribute("nonce", this.nonce), r.appendChild(document.createTextNode("")), r.setAttribute("data-s", ""), r));
                var r, n = this.tags[this.tags.length - 1];
                if (this.isSpeedy) {
                    var o = function(t) {
                        if (t.sheet) return t.sheet;
                        for (var r = 0; r < document.styleSheets.length; r++)
                            if (document.styleSheets[r].ownerNode === t) return document.styleSheets[r]
                    }(n);
                    try {
                        o.insertRule(t, o.cssRules.length)
                    } catch (t) {}
                } else n.appendChild(document.createTextNode(t));
                this.ctr++
            }, r.flush = function() {
                this.tags.forEach(function(t) {
                    var r;
                    return null == (r = t.parentNode) ? void 0 : r.removeChild(t)
                }), this.tags = [], this.ctr = 0
            }, t
        }(),
        a = Math.abs,
        i = String.fromCharCode,
        s = Object.assign;

    function l(t, r, n) {
        return t.replace(r, n)
    }

    function c(t, r) {
        return t.indexOf(r)
    }

    function u(t, r) {
        return 0 | t.charCodeAt(r)
    }

    function f(t, r, n) {
        return t.slice(r, n)
    }

    function d(t) {
        return t.length
    }

    function p(t, r) {
        return r.push(t), t
    }
    var h = 1,
        m = 1,
        y = 0,
        g = 0,
        b = 0,
        v = "";

    function x(t, r, n, o, a, i, s) {
        return {
            value: t,
            root: r,
            parent: n,
            type: o,
            props: a,
            children: i,
            line: h,
            column: m,
            length: s,
            return: ""
        }
    }

    function k(t, r) {
        return s(x("", null, null, "", null, null, 0), t, {
            length: -t.length
        }, r)
    }

    function w() {
        return b = g < y ? u(v, g++) : 0, m++, 10 === b && (m = 1, h++), b
    }

    function O() {
        return u(v, g)
    }

    function S(t) {
        switch (t) {
            case 0:
            case 9:
            case 10:
            case 13:
            case 32:
                return 5;
            case 33:
            case 43:
            case 44:
            case 47:
            case 62:
            case 64:
            case 126:
            case 59:
            case 123:
            case 125:
                return 4;
            case 58:
                return 3;
            case 34:
            case 39:
            case 40:
            case 91:
                return 2;
            case 41:
            case 93:
                return 1
        }
        return 0
    }

    function C(t) {
        return h = m = 1, y = d(v = t), g = 0, []
    }

    function A(t) {
        var r, n;
        return (r = g - 1, n = function t(r) {
            for (; w();) switch (b) {
                case r:
                    return g;
                case 34:
                case 39:
                    34 !== r && 39 !== r && t(b);
                    break;
                case 40:
                    41 === r && t(r);
                    break;
                case 92:
                    w()
            }
            return g
        }(91 === t ? t + 2 : 40 === t ? t + 1 : t), f(v, r, n)).trim()
    }
    var j = "-ms-",
        _ = "-moz-",
        E = "-webkit-",
        P = "comm",
        T = "rule",
        R = "decl",
        $ = "@keyframes";

    function M(t, r) {
        for (var n = "", o = t.length, a = 0; a < o; a++) n += r(t[a], a, t, r) || "";
        return n
    }

    function N(t, r, n, o) {
        switch (t.type) {
            case "@layer":
                if (t.children.length) break;
            case "@import":
            case R:
                return t.return = t.return || t.value;
            case P:
                return "";
            case $:
                return t.return = t.value + "{" + M(t.children, o) + "}";
            case T:
                t.value = t.props.join(",")
        }
        return d(n = M(t.children, o)) ? t.return = t.value + "{" + n + "}" : ""
    }

    function I(t, r, n, o, i, s, c, u, d, p, h) {
        for (var m = i - 1, y = 0 === i ? s : [""], g = y.length, b = 0, v = 0, k = 0; b < o; ++b)
            for (var w = 0, O = f(t, m + 1, m = a(v = c[b])), S = t; w < g; ++w)(S = (v > 0 ? y[w] + " " + O : l(O, /&\f/g, y[w])).trim()) && (d[k++] = S);
        return x(t, r, n, 0 === i ? T : u, d, p, h)
    }

    function W(t, r, n, o) {
        return x(t, r, n, R, f(t, 0, o), f(t, o + 1, -1), o)
    }
    var z = function(t, r, n) {
            for (var o = 0, a = 0; o = a, a = O(), 38 === o && 12 === a && (r[n] = 1), !S(a);) w();
            return f(v, t, g)
        },
        B = function(t, r) {
            var n = -1,
                o = 44;
            do switch (S(o)) {
                case 0:
                    38 === o && 12 === O() && (r[n] = 1), t[n] += z(g - 1, r, n);
                    break;
                case 2:
                    t[n] += A(o);
                    break;
                case 4:
                    if (44 === o) {
                        t[++n] = 58 === O() ? "&\f" : "", r[n] = t[n].length;
                        break
                    }
                default:
                    t[n] += i(o)
            }
            while (o = w()) return t
        },
        G = function(t, r) {
            var n;
            return n = B(C(t), r), v = "", n
        },
        F = new WeakMap,
        K = function(t) {
            if ("rule" === t.type && t.parent && !(t.length < 1)) {
                for (var r = t.value, n = t.parent, o = t.column === n.column && t.line === n.line;
                    "rule" !== n.type;)
                    if (!(n = n.parent)) return;
                if ((1 !== t.props.length || 58 === r.charCodeAt(0) || F.get(n)) && !o) {
                    F.set(t, !0);
                    for (var a = [], i = G(r, a), s = n.props, l = 0, c = 0; l < i.length; l++)
                        for (var u = 0; u < s.length; u++, c++) t.props[c] = a[l] ? i[l].replace(/&\f/g, s[u]) : s[u] + " " + i[l]
                }
            }
        },
        L = function(t) {
            if ("decl" === t.type) {
                var r = t.value;
                108 === r.charCodeAt(0) && 98 === r.charCodeAt(2) && (t.return = "", t.value = "")
            }
        },
        U = [function(t, r, n, o) {
            if (t.length > -1 && !t.return) switch (t.type) {
                case R:
                    t.return = function t(r, n) {
                        switch (45 ^ u(r, 0) ? (((n << 2 ^ u(r, 0)) << 2 ^ u(r, 1)) << 2 ^ u(r, 2)) << 2 ^ u(r, 3) : 0) {
                            case 5103:
                                return E + "print-" + r + r;
                            case 5737:
                            case 4201:
                            case 3177:
                            case 3433:
                            case 1641:
                            case 4457:
                            case 2921:
                            case 5572:
                            case 6356:
                            case 5844:
                            case 3191:
                            case 6645:
                            case 3005:
                            case 6391:
                            case 5879:
                            case 5623:
                            case 6135:
                            case 4599:
                            case 4855:
                            case 4215:
                            case 6389:
                            case 5109:
                            case 5365:
                            case 5621:
                            case 3829:
                                return E + r + r;
                            case 5349:
                            case 4246:
                            case 4810:
                            case 6968:
                            case 2756:
                                return E + r + _ + r + j + r + r;
                            case 6828:
                            case 4268:
                                return E + r + j + r + r;
                            case 6165:
                                return E + r + j + "flex-" + r + r;
                            case 5187:
                                return E + r + l(r, /(\w+).+(:[^]+)/, E + "box-$1$2" + j + "flex-$1$2") + r;
                            case 5443:
                                return E + r + j + "flex-item-" + l(r, /flex-|-self/, "") + r;
                            case 4675:
                                return E + r + j + "flex-line-pack" + l(r, /align-content|flex-|-self/, "") + r;
                            case 5548:
                                return E + r + j + l(r, "shrink", "negative") + r;
                            case 5292:
                                return E + r + j + l(r, "basis", "preferred-size") + r;
                            case 6060:
                                return E + "box-" + l(r, "-grow", "") + E + r + j + l(r, "grow", "positive") + r;
                            case 4554:
                                return E + l(r, /([^-])(transform)/g, "$1" + E + "$2") + r;
                            case 6187:
                                return l(l(l(r, /(zoom-|grab)/, E + "$1"), /(image-set)/, E + "$1"), r, "") + r;
                            case 5495:
                            case 3959:
                                return l(r, /(image-set\([^]*)/, E + "$1$`$1");
                            case 4968:
                                return l(l(r, /(.+:)(flex-)?(.*)/, E + "box-pack:$3" + j + "flex-pack:$3"), /s.+-b[^;]+/, "justify") + E + r + r;
                            case 4095:
                            case 3583:
                            case 4068:
                            case 2532:
                                return l(r, /(.+)-inline(.+)/, E + "$1$2") + r;
                            case 8116:
                            case 7059:
                            case 5753:
                            case 5535:
                            case 5445:
                            case 5701:
                            case 4933:
                            case 4677:
                            case 5533:
                            case 5789:
                            case 5021:
                            case 4765:
                                if (d(r) - 1 - n > 6) switch (u(r, n + 1)) {
                                    case 109:
                                        if (45 !== u(r, n + 4)) break;
                                    case 102:
                                        return l(r, /(.+:)(.+)-([^]+)/, "$1" + E + "$2-$3$1" + _ + (108 == u(r, n + 3) ? "$3" : "$2-$3")) + r;
                                    case 115:
                                        return ~c(r, "stretch") ? t(l(r, "stretch", "fill-available"), n) + r : r
                                }
                                break;
                            case 4949:
                                if (115 !== u(r, n + 1)) break;
                            case 6444:
                                switch (u(r, d(r) - 3 - (~c(r, "!important") && 10))) {
                                    case 107:
                                        return l(r, ":", ":" + E) + r;
                                    case 101:
                                        return l(r, /(.+:)([^;!]+)(;|!.+)?/, "$1" + E + (45 === u(r, 14) ? "inline-" : "") + "box$3$1" + E + "$2$3$1" + j + "$2box$3") + r
                                }
                                break;
                            case 5936:
                                switch (u(r, n + 11)) {
                                    case 114:
                                        return E + r + j + l(r, /[svh]\w+-[tblr]{2}/, "tb") + r;
                                    case 108:
                                        return E + r + j + l(r, /[svh]\w+-[tblr]{2}/, "tb-rl") + r;
                                    case 45:
                                        return E + r + j + l(r, /[svh]\w+-[tblr]{2}/, "lr") + r
                                }
                                return E + r + j + r + r
                        }
                        return r
                    }(t.value, t.length);
                    break;
                case $:
                    return M([k(t, {
                        value: l(t.value, "@", "@" + E)
                    })], o);
                case T:
                    if (t.length) {
                        var a, i;
                        return a = t.props, i = function(r) {
                            var n;
                            switch (n = r, (n = /(::plac\w+|:read-\w+)/.exec(n)) ? n[0] : n) {
                                case ":read-only":
                                case ":read-write":
                                    return M([k(t, {
                                        props: [l(r, /:(read-\w+)/, ":" + _ + "$1")]
                                    })], o);
                                case "::placeholder":
                                    return M([k(t, {
                                        props: [l(r, /:(plac\w+)/, ":" + E + "input-$1")]
                                    }), k(t, {
                                        props: [l(r, /:(plac\w+)/, ":" + _ + "$1")]
                                    }), k(t, {
                                        props: [l(r, /:(plac\w+)/, j + "input-$1")]
                                    })], o)
                            }
                            return ""
                        }, a.map(i).join("")
                    }
            }
        }],
        D = function(t) {
            var r, n, a, s, y, k = t.key;
            if ("css" === k) {
                var j = document.querySelectorAll("style[data-emotion]:not([data-s])");
                Array.prototype.forEach.call(j, function(t) {
                    -1 !== t.getAttribute("data-emotion").indexOf(" ") && (document.head.appendChild(t), t.setAttribute("data-s", ""))
                })
            }
            var _ = t.stylisPlugins || U,
                E = {},
                T = [];
            s = t.container || document.head, Array.prototype.forEach.call(document.querySelectorAll('style[data-emotion^="' + k + ' "]'), function(t) {
                for (var r = t.getAttribute("data-emotion").split(" "), n = 1; n < r.length; n++) E[r[n]] = !0;
                T.push(t)
            });
            var R = (n = (r = [K, L].concat(_, [N, (a = function(t) {
                    y.insert(t)
                }, function(t) {
                    !t.root && (t = t.return) && a(t)
                })])).length, function(t, o, a, i) {
                    for (var s = "", l = 0; l < n; l++) s += r[l](t, o, a, i) || "";
                    return s
                }),
                $ = function(t) {
                    var r, n;
                    return M((n = function t(r, n, o, a, s, y, k, C, j) {
                        for (var _, E = 0, T = 0, R = k, $ = 0, M = 0, N = 0, z = 1, B = 1, G = 1, F = 0, K = "", L = s, U = y, D = a, H = K; B;) switch (N = F, F = w()) {
                            case 40:
                                if (108 != N && 58 == u(H, R - 1)) {
                                    -1 != c(H += l(A(F), "&", "&\f"), "&\f") && (G = -1);
                                    break
                                }
                            case 34:
                            case 39:
                            case 91:
                                H += A(F);
                                break;
                            case 9:
                            case 10:
                            case 13:
                            case 32:
                                H += function(t) {
                                    for (; b = O();)
                                        if (b < 33) w();
                                        else break;
                                    return S(t) > 2 || S(b) > 3 ? "" : " "
                                }(N);
                                break;
                            case 92:
                                H += function(t, r) {
                                    for (var n; --r && w() && !(b < 48) && !(b > 102) && (!(b > 57) || !(b < 65)) && (!(b > 70) || !(b < 97)););
                                    return n = g + (r < 6 && 32 == O() && 32 == w()), f(v, t, n)
                                }(g - 1, 7);
                                continue;
                            case 47:
                                switch (O()) {
                                    case 42:
                                    case 47:
                                        p((_ = function(t, r) {
                                            for (; w();)
                                                if (t + b === 57) break;
                                                else if (t + b === 84 && 47 === O()) break;
                                            return "/*" + f(v, r, g - 1) + "*" + i(47 === t ? t : w())
                                        }(w(), g), x(_, n, o, P, i(b), f(_, 2, -2), 0)), j);
                                        break;
                                    default:
                                        H += "/"
                                }
                                break;
                            case 123 * z:
                                C[E++] = d(H) * G;
                            case 125 * z:
                            case 59:
                            case 0:
                                switch (F) {
                                    case 0:
                                    case 125:
                                        B = 0;
                                    case 59 + T:
                                        -1 == G && (H = l(H, /\f/g, "")), M > 0 && d(H) - R && p(M > 32 ? W(H + ";", a, o, R - 1) : W(l(H, " ", "") + ";", a, o, R - 2), j);
                                        break;
                                    case 59:
                                        H += ";";
                                    default:
                                        if (p(D = I(H, n, o, E, T, s, C, K, L = [], U = [], R), y), 123 === F)
                                            if (0 === T) t(H, n, D, D, L, y, R, C, U);
                                            else switch (99 === $ && 110 === u(H, 3) ? 100 : $) {
                                                case 100:
                                                case 108:
                                                case 109:
                                                case 115:
                                                    t(r, D, D, a && p(I(r, D, D, 0, 0, s, C, K, s, L = [], R), U), s, U, R, C, a ? L : U);
                                                    break;
                                                default:
                                                    t(H, D, D, D, [""], U, 0, C, U)
                                            }
                                }
                                E = T = M = 0, z = G = 1, K = H = "", R = k;
                                break;
                            case 58:
                                R = 1 + d(H), M = N;
                            default:
                                if (z < 1) {
                                    if (123 == F) --z;
                                    else if (125 == F && 0 == z++ && 125 == (b = g > 0 ? u(v, --g) : 0, m--, 10 === b && (m = 1, h--), b)) continue
                                }
                                switch (H += i(F), F * z) {
                                    case 38:
                                        G = T > 0 ? 1 : (H += "\f", -1);
                                        break;
                                    case 44:
                                        C[E++] = (d(H) - 1) * G, G = 1;
                                        break;
                                    case 64:
                                        45 === O() && (H += A(w())), $ = O(), T = R = d(K = H += function(t) {
                                            for (; !S(O());) w();
                                            return f(v, t, g)
                                        }(g)), F++;
                                        break;
                                    case 45:
                                        45 === N && 2 == d(H) && (z = 0)
                                }
                        }
                        return y
                    }("", null, null, null, [""], r = C(r = t), 0, [0], r), v = "", n), R)
                },
                z = {
                    key: k,
                    sheet: new o({
                        key: k,
                        container: s,
                        nonce: t.nonce,
                        speedy: t.speedy,
                        prepend: t.prepend,
                        insertionPoint: t.insertionPoint
                    }),
                    nonce: t.nonce,
                    inserted: E,
                    registered: {},
                    insert: function(t, r, n, o) {
                        y = n, $(t ? t + "{" + r.styles + "}" : r.styles), o && (z.inserted[r.name] = !0)
                    }
                };
            return z.sheet.hydrate(T), z
        };

    function H(t, r, n) {
        var o = "";
        return n.split(" ").forEach(function(n) {
            void 0 !== t[n] ? r.push(t[n] + ";") : n && (o += n + " ")
        }), o
    }
    t.s(["default", 0, D], 238825), t.i(136817), t.i(781979);
    var q = function(t, r, n) {
            var o = t.key + "-" + r.name;
            !1 === n && void 0 === t.registered[o] && (t.registered[o] = r.styles)
        },
        V = function(t, r, n) {
            q(t, r, n);
            var o = t.key + "-" + r.name;
            if (void 0 === t.inserted[r.name]) {
                var a = r;
                do t.insert(r === a ? "." + o : "", a, t.sheet, !0), a = a.next; while (void 0 !== a)
            }
        };
    t.s(["getRegisteredStyles", 0, H, "insertStyles", 0, V, "registerStyles", 0, q], 905625);
    var Y = {
            animationIterationCount: 1,
            aspectRatio: 1,
            borderImageOutset: 1,
            borderImageSlice: 1,
            borderImageWidth: 1,
            boxFlex: 1,
            boxFlexGroup: 1,
            boxOrdinalGroup: 1,
            columnCount: 1,
            columns: 1,
            flex: 1,
            flexGrow: 1,
            flexPositive: 1,
            flexShrink: 1,
            flexNegative: 1,
            flexOrder: 1,
            gridRow: 1,
            gridRowEnd: 1,
            gridRowSpan: 1,
            gridRowStart: 1,
            gridColumn: 1,
            gridColumnEnd: 1,
            gridColumnSpan: 1,
            gridColumnStart: 1,
            msGridRow: 1,
            msGridRowSpan: 1,
            msGridColumn: 1,
            msGridColumnSpan: 1,
            fontWeight: 1,
            lineHeight: 1,
            opacity: 1,
            order: 1,
            orphans: 1,
            scale: 1,
            tabSize: 1,
            widows: 1,
            zIndex: 1,
            zoom: 1,
            WebkitLineClamp: 1,
            fillOpacity: 1,
            floodOpacity: 1,
            stopOpacity: 1,
            strokeDasharray: 1,
            strokeDashoffset: 1,
            strokeMiterlimit: 1,
            strokeOpacity: 1,
            strokeWidth: 1
        },
        X = t.i(26277),
        Z = /[A-Z]|^ms/g,
        J = /_EMO_([^_]+?)_([^]*?)_EMO_/g,
        Q = function(t) {
            return 45 === t.charCodeAt(1)
        },
        ee = function(t) {
            return null != t && "boolean" != typeof t
        },
        et = (0, X.default)(function(t) {
            return Q(t) ? t : t.replace(Z, "-$&").toLowerCase()
        }),
        er = function(t, n) {
            switch (t) {
                case "animation":
                case "animationName":
                    if ("string" == typeof n) return n.replace(J, function(t, n, o) {
                        return r = {
                            name: n,
                            styles: o,
                            next: r
                        }, n
                    })
            }
            return 1 === Y[t] || Q(t) || "number" != typeof n || 0 === n ? n : n + "px"
        };

    function en(t, n, o) {
        if (null == o) return "";
        if (void 0 !== o.__emotion_styles) return o;
        switch (typeof o) {
            case "boolean":
                return "";
            case "object":
                if (1 === o.anim) return r = {
                    name: o.name,
                    styles: o.styles,
                    next: r
                }, o.name;
                if (void 0 !== o.styles) {
                    var a = o.next;
                    if (void 0 !== a)
                        for (; void 0 !== a;) r = {
                            name: a.name,
                            styles: a.styles,
                            next: r
                        }, a = a.next;
                    return o.styles + ";"
                }
                return function(t, r, n) {
                    var o = "";
                    if (Array.isArray(n))
                        for (var a = 0; a < n.length; a++) o += en(t, r, n[a]) + ";";
                    else
                        for (var i in n) {
                            var s = n[i];
                            if ("object" != typeof s) null != r && void 0 !== r[s] ? o += i + "{" + r[s] + "}" : ee(s) && (o += et(i) + ":" + er(i, s) + ";");
                            else if (Array.isArray(s) && "string" == typeof s[0] && (null == r || void 0 === r[s[0]]))
                                for (var l = 0; l < s.length; l++) ee(s[l]) && (o += et(i) + ":" + er(i, s[l]) + ";");
                            else {
                                var c = en(t, r, s);
                                switch (i) {
                                    case "animation":
                                    case "animationName":
                                        o += et(i) + ":" + c + ";";
                                        break;
                                    default:
                                        o += i + "{" + c + "}"
                                }
                            }
                        }
                    return o
                }(t, n, o);
            case "function":
                if (void 0 !== t) {
                    var i = r,
                        s = o(t);
                    return r = i, en(t, n, s)
                }
        }
        if (null == n) return o;
        var l = n[o];
        return void 0 !== l ? l : o
    }
    var eo = /label:\s*([^\s;{]+)\s*(;|$)/g;

    function ea(t, n, o) {
        if (1 === t.length && "object" == typeof t[0] && null !== t[0] && void 0 !== t[0].styles) return t[0];
        var a, i = !0,
            s = "";
        r = void 0;
        var l = t[0];
        null == l || void 0 === l.raw ? (i = !1, s += en(o, n, l)) : s += l[0];
        for (var c = 1; c < t.length; c++) s += en(o, n, t[c]), i && (s += l[c]);
        eo.lastIndex = 0;
        for (var u = ""; null !== (a = eo.exec(s));) u += "-" + a[1];
        return {
            name: function(t) {
                for (var r, n = 0, o = 0, a = t.length; a >= 4; ++o, a -= 4) r = (65535 & (r = 255 & t.charCodeAt(o) | (255 & t.charCodeAt(++o)) << 8 | (255 & t.charCodeAt(++o)) << 16 | (255 & t.charCodeAt(++o)) << 24)) * 0x5bd1e995 + ((r >>> 16) * 59797 << 16), r ^= r >>> 24, n = (65535 & r) * 0x5bd1e995 + ((r >>> 16) * 59797 << 16) ^ (65535 & n) * 0x5bd1e995 + ((n >>> 16) * 59797 << 16);
                switch (a) {
                    case 3:
                        n ^= (255 & t.charCodeAt(o + 2)) << 16;
                    case 2:
                        n ^= (255 & t.charCodeAt(o + 1)) << 8;
                    case 1:
                        n ^= 255 & t.charCodeAt(o), n = (65535 & n) * 0x5bd1e995 + ((n >>> 16) * 59797 << 16)
                }
                return n ^= n >>> 13, (((n = (65535 & n) * 0x5bd1e995 + ((n >>> 16) * 59797 << 16)) ^ n >>> 15) >>> 0).toString(36)
            }(s) + u,
            styles: s,
            next: r
        }
    }
    t.s(["serializeStyles", 0, ea], 220454);
    var ei = !!n.useInsertionEffect && n.useInsertionEffect,
        es = ei || function(t) {
            return t()
        },
        el = ei || n.useLayoutEffect;
    t.s(["useInsertionEffectAlwaysWithSyncFallback", 0, es, "useInsertionEffectWithLayoutFallback", 0, el], 327209);
    var ec = n.createContext("u" > typeof HTMLElement ? D({
            key: "css"
        }) : null),
        eu = ec.Provider,
        ef = function(t) {
            return (0, n.forwardRef)(function(r, o) {
                return t(r, (0, n.useContext)(ec), o)
            })
        },
        ed = n.createContext({}),
        ep = {}.hasOwnProperty,
        eh = "__EMOTION_TYPE_PLEASE_DO_NOT_USE__",
        em = function(t) {
            var r = t.cache,
                n = t.serialized,
                o = t.isStringTag;
            return q(r, n, o), es(function() {
                return V(r, n, o)
            }), null
        },
        ey = ef(function(t, r, o) {
            var a = t.css;
            "string" == typeof a && void 0 !== r.registered[a] && (a = r.registered[a]);
            var i = t[eh],
                s = [a],
                l = "";
            "string" == typeof t.className ? l = H(r.registered, s, t.className) : null != t.className && (l = t.className + " ");
            var c = ea(s, void 0, n.useContext(ed));
            l += r.key + "-" + c.name;
            var u = {};
            for (var f in t) ep.call(t, f) && "css" !== f && f !== eh && (u[f] = t[f]);
            return u.className = l, o && (u.ref = o), n.createElement(n.Fragment, null, n.createElement(em, {
                cache: r,
                serialized: c,
                isStringTag: "string" == typeof i
            }), n.createElement(i, u))
        });
    t.s(["C", 0, eu, "E", 0, ey, "T", 0, ed, "_", 0, function() {
        return (0, n.useContext)(ec)
    }, "c", 0, function(t, r) {
        var n = {};
        for (var o in r) ep.call(r, o) && (n[o] = r[o]);
        return n[eh] = t, n
    }, "h", 0, ep, "i", 0, !1, "w", 0, ef], 164688), t.s(["ThemeContext", 0, ed], 534424)
}, 178417, t => {
    "use strict";
    var r = "u" > typeof globalThis ? globalThis : "u" > typeof window ? window : t.g;
    t.s(["a", 0, function(t) {
        return t && t.__esModule && Object.prototype.hasOwnProperty.call(t, "default") ? t.default : t
    }, "c", 0, r, "g", 0, function(t) {
        if (t.__esModule) return t;
        var r = t.default;
        if ("function" == typeof r) {
            var n = function t() {
                if (this instanceof t) {
                    var n = [null];
                    return n.push.apply(n, arguments), new(Function.bind.apply(r, n))
                }
                return r.apply(this, arguments)
            };
            n.prototype = r.prototype
        } else n = {};
        return Object.defineProperty(n, "__esModule", {
            value: !0
        }), Object.keys(t).forEach(function(r) {
            var o = Object.getOwnPropertyDescriptor(t, r);
            Object.defineProperty(n, r, o.get ? o : {
                enumerable: !0,
                get: function() {
                    return t[r]
                }
            })
        }), n
    }])
}, 983545, t => {
    "use strict";
    t.s(["c", 0, function(t) {
        let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : Number.MIN_SAFE_INTEGER,
            n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Number.MAX_SAFE_INTEGER;
        return Math.max(r, Math.min(t, n))
    }, "f", 0, function(t) {
        let r = "https://mui.com/production-error/?code=" + t;
        for (let t = 1; t < arguments.length; t += 1) r += "&args[]=" + encodeURIComponent(arguments[t]);
        return "Minified MUI error #" + t + "; visit " + r + " for the full message."
    }])
}, 273589, 941603, t => {
    "use strict";
    let r, n;
    var o = t.i(962560),
        a = t.i(178417),
        i = t.i(983545),
        s = t.i(416340),
        l = Object.getOwnPropertySymbols,
        c = Object.prototype.hasOwnProperty,
        u = Object.prototype.propertyIsEnumerable,
        f = ! function() {
            try {
                var t = new String("abc");
                if (t[5] = "de", "5" === Object.getOwnPropertyNames(t)[0]) return !1;
                for (var r = {}, n = 0; n < 10; n++) r["_" + String.fromCharCode(n)] = n;
                if ("0123456789" !== Object.getOwnPropertyNames(r).map(function(t) {
                        return r[t]
                    }).join("")) return !1;
                var o = {};
                return "abcdefghijklmnopqrst".split("").forEach(function(t) {
                    o[t] = t
                }), "abcdefghijklmnopqrst" === Object.keys(Object.assign({}, o)).join("")
            } catch (t) {
                return !1
            }
        }() ? function(t, r) {
            for (var n, o, a = function(t) {
                    if (null == t) throw TypeError("Object.assign cannot be called with null or undefined");
                    return Object(t)
                }(t), i = 1; i < arguments.length; i++) {
                for (var s in n = Object(arguments[i])) c.call(n, s) && (a[s] = n[s]);
                if (l) {
                    o = l(n);
                    for (var f = 0; f < o.length; f++) u.call(n, o[f]) && (a[o[f]] = n[o[f]])
                }
            }
            return a
        } : Object.assign;
    t.s(["o", 0, f], 941603);
    var d = {
            black: "#000",
            white: "#fff"
        },
        p = {
            50: "#ffebee",
            100: "#ffcdd2",
            200: "#ef9a9a",
            300: "#e57373",
            400: "#ef5350",
            500: "#f44336",
            600: "#e53935",
            700: "#d32f2f",
            800: "#c62828",
            900: "#b71c1c",
            A100: "#ff8a80",
            A200: "#ff5252",
            A400: "#ff1744",
            A700: "#d50000"
        },
        h = {
            50: "#f3e5f5",
            100: "#e1bee7",
            200: "#ce93d8",
            300: "#ba68c8",
            400: "#ab47bc",
            500: "#9c27b0",
            600: "#8e24aa",
            700: "#7b1fa2",
            800: "#6a1b9a",
            900: "#4a148c",
            A100: "#ea80fc",
            A200: "#e040fb",
            A400: "#d500f9",
            A700: "#aa00ff"
        },
        m = {
            50: "#e3f2fd",
            100: "#bbdefb",
            200: "#90caf9",
            300: "#64b5f6",
            400: "#42a5f5",
            500: "#2196f3",
            600: "#1e88e5",
            700: "#1976d2",
            800: "#1565c0",
            900: "#0d47a1",
            A100: "#82b1ff",
            A200: "#448aff",
            A400: "#2979ff",
            A700: "#2962ff"
        },
        y = {
            50: "#e1f5fe",
            100: "#b3e5fc",
            200: "#81d4fa",
            300: "#4fc3f7",
            400: "#29b6f6",
            500: "#03a9f4",
            600: "#039be5",
            700: "#0288d1",
            800: "#0277bd",
            900: "#01579b",
            A100: "#80d8ff",
            A200: "#40c4ff",
            A400: "#00b0ff",
            A700: "#0091ea"
        },
        g = {
            50: "#e8f5e9",
            100: "#c8e6c9",
            200: "#a5d6a7",
            300: "#81c784",
            400: "#66bb6a",
            500: "#4caf50",
            600: "#43a047",
            700: "#388e3c",
            800: "#2e7d32",
            900: "#1b5e20",
            A100: "#b9f6ca",
            A200: "#69f0ae",
            A400: "#00e676",
            A700: "#00c853"
        },
        b = {
            50: "#fff3e0",
            100: "#ffe0b2",
            200: "#ffcc80",
            300: "#ffb74d",
            400: "#ffa726",
            500: "#ff9800",
            600: "#fb8c00",
            700: "#f57c00",
            800: "#ef6c00",
            900: "#e65100",
            A100: "#ffd180",
            A200: "#ffab40",
            A400: "#ff9100",
            A700: "#ff6d00"
        },
        v = {
            50: "#fafafa",
            100: "#f5f5f5",
            200: "#eeeeee",
            300: "#e0e0e0",
            400: "#bdbdbd",
            500: "#9e9e9e",
            600: "#757575",
            700: "#616161",
            800: "#424242",
            900: "#212121",
            A100: "#f5f5f5",
            A200: "#eeeeee",
            A400: "#bdbdbd",
            A700: "#616161"
        },
        x = Object.freeze({
            __proto__: null,
            default: i.f
        });

    function k(t, r) {
        if (null == t) return {};
        var n = {};
        for (var o in t)
            if (({}).hasOwnProperty.call(t, o)) {
                if (-1 !== r.indexOf(o)) continue;
                n[o] = t[o]
            } return n
    }
    var w = {};

    function O(t) {
        if ("object" != typeof t || null === t) return !1;
        let r = Object.getPrototypeOf(t);
        return !(null !== r && r !== Object.prototype && null !== Object.getPrototypeOf(r) || Symbol.toStringTag in t || Symbol.iterator in t)
    }

    function S(t, r) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {
                clone: !0
            },
            a = n.clone ? (0, o._)({}, t) : t;
        return O(t) && O(r) && Object.keys(r).forEach(o => {
            s.isValidElement(r[o]) ? a[o] = r[o] : O(r[o]) && Object.prototype.hasOwnProperty.call(t, o) && O(t[o]) ? a[o] = S(t[o], r[o], n) : n.clone ? a[o] = O(r[o]) ? function t(r) {
                if (s.isValidElement(r) || !O(r)) return r;
                let n = {};
                return Object.keys(r).forEach(o => {
                    n[o] = t(r[o])
                }), n
            }(r[o]) : r[o] : a[o] = r[o]
        }), a
    }({
        get exports() {
            return w
        },
        set exports(e) {
            w = e
        }
    }).exports = (function() {
        if (eI) return eN;
        eI = 1;
        var t = eM ? e$ : (eM = 1, e$ = "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED");

        function r() {}

        function n() {}
        return n.resetWarningCache = r, eN = function() {
            function o(r, n, o, a, i, s) {
                if (s !== t) {
                    var l = Error("Calling PropTypes validators directly is not supported by the `prop-types` package. Use PropTypes.checkPropTypes() to call them. Read more at http://fb.me/use-check-prop-types");
                    throw l.name = "Invariant Violation", l
                }
            }

            function a() {
                return o
            }
            o.isRequired = o;
            var i = {
                array: o,
                bigint: o,
                bool: o,
                func: o,
                number: o,
                object: o,
                string: o,
                symbol: o,
                any: o,
                arrayOf: a,
                element: o,
                elementType: o,
                instanceOf: a,
                node: o,
                objectOf: a,
                oneOf: a,
                oneOfType: a,
                shape: a,
                exact: a,
                checkPropTypes: n,
                resetWarningCache: r
            };
            return i.PropTypes = i, i
        }
    })()();
    let C = ["values", "unit", "step"];

    function A(t) {
        let r, {
                values: n = {
                    xs: 0,
                    sm: 600,
                    md: 900,
                    lg: 1200,
                    xl: 1536
                },
                unit: a = "px",
                step: i = 5
            } = t,
            s = k(t, C),
            l = ((r = Object.keys(n).map(t => ({
                key: t,
                val: n[t]
            })) || []).sort((t, r) => t.val - r.val), r.reduce((t, r) => (0, o._)({}, t, {
                [r.key]: r.val
            }), {})),
            c = Object.keys(l);

        function u(t) {
            return "@media (min-width:".concat("number" == typeof n[t] ? n[t] : t).concat(a, ")")
        }

        function f(t) {
            return "@media (max-width:".concat(("number" == typeof n[t] ? n[t] : t) - i / 100).concat(a, ")")
        }

        function d(t, r) {
            let o = c.indexOf(r);
            return "@media (min-width:".concat("number" == typeof n[t] ? n[t] : t).concat(a, ") and (max-width:").concat((-1 !== o && "number" == typeof n[c[o]] ? n[c[o]] : r) - i / 100).concat(a, ")")
        }
        return (0, o._)({
            keys: c,
            values: l,
            up: u,
            down: f,
            between: d,
            only: function(t) {
                return c.indexOf(t) + 1 < c.length ? d(t, c[c.indexOf(t) + 1]) : u(t)
            },
            not: function(t) {
                let r = c.indexOf(t);
                return 0 === r ? u(c[1]) : r === c.length - 1 ? f(c[r]) : d(t, c[c.indexOf(t) + 1]).replace("@media", "@media not all and")
            },
            unit: a
        }, s)
    }
    var j = {
        borderRadius: 4
    };

    function _(t, r) {
        return r ? S(t, r, {
            clone: !1
        }) : t
    }
    let E = {
            xs: 0,
            sm: 600,
            md: 900,
            lg: 1200,
            xl: 1536
        },
        P = {
            keys: ["xs", "sm", "md", "lg", "xl"],
            up: t => "@media (min-width:".concat(E[t], "px)")
        };

    function T(t, r, n) {
        let o = t.theme || {};
        if (Array.isArray(r)) {
            let t = o.breakpoints || P;
            return r.reduce((o, a, i) => (o[t.up(t.keys[i])] = n(r[i]), o), {})
        }
        if ("object" == typeof r) {
            let t = o.breakpoints || P;
            return Object.keys(r).reduce((o, a) => (-1 !== Object.keys(t.values || E).indexOf(a) ? o[t.up(a)] = n(r[a], a) : o[a] = r[a], o), {})
        }
        return n(r)
    }

    function R() {
        var t;
        let r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        return (null == (t = r.keys) ? void 0 : t.reduce((t, n) => (t[r.up(n)] = {}, t), {})) || {}
    }

    function $(t, r) {
        return t.reduce((t, r) => {
            let n = t[r];
            return n && 0 !== Object.keys(n).length || delete t[r], t
        }, r)
    }

    function M(t) {
        if ("string" != typeof t) throw Error((0, i.f)(7));
        return t.charAt(0).toUpperCase() + t.slice(1)
    }

    function N(t, r) {
        let n = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
        if (!r || "string" != typeof r) return null;
        if (t && t.vars && n) {
            let n = "vars.".concat(r).split(".").reduce((t, r) => t && t[r] ? t[r] : null, t);
            if (null != n) return n
        }
        return r.split(".").reduce((t, r) => t && null != t[r] ? t[r] : null, t)
    }

    function I(t, r, n) {
        let o, a = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : n;
        return o = "function" == typeof t ? t(n) : Array.isArray(t) ? t[n] || a : N(t, n) || a, r && (o = r(o, a, t)), o
    }

    function W(t) {
        let {
            prop: r,
            cssProperty: n = t.prop,
            themeKey: o,
            transform: a
        } = t, i = t => {
            if (null == t[r]) return null;
            let i = t[r],
                s = N(t.theme, o) || {};
            return T(t, i, t => {
                let o = I(s, a, t);
                return t === o && "string" == typeof t && (o = I(s, a, "".concat(r).concat("default" === t ? "" : M(t)), t)), !1 === n ? o : {
                    [n]: o
                }
            })
        };
        return i.propTypes = {}, i.filterProps = [r], i
    }
    let z = {
            m: "margin",
            p: "padding"
        },
        B = {
            t: "Top",
            r: "Right",
            b: "Bottom",
            l: "Left",
            x: ["Left", "Right"],
            y: ["Top", "Bottom"]
        },
        G = {
            marginX: "mx",
            marginY: "my",
            paddingX: "px",
            paddingY: "py"
        },
        F = (eR = t => {
            if (t.length > 2) {
                if (!G[t]) return [t];
                t = G[t]
            }
            let [r, n] = t.split(""), o = z[r], a = B[n] || "";
            return Array.isArray(a) ? a.map(t => o + t) : [o + a]
        }, r = {}, t => (void 0 === r[t] && (r[t] = eR(t)), r[t])),
        K = ["m", "mt", "mr", "mb", "ml", "mx", "my", "margin", "marginTop", "marginRight", "marginBottom", "marginLeft", "marginX", "marginY", "marginInline", "marginInlineStart", "marginInlineEnd", "marginBlock", "marginBlockStart", "marginBlockEnd"],
        L = ["p", "pt", "pr", "pb", "pl", "px", "py", "padding", "paddingTop", "paddingRight", "paddingBottom", "paddingLeft", "paddingX", "paddingY", "paddingInline", "paddingInlineStart", "paddingInlineEnd", "paddingBlock", "paddingBlockStart", "paddingBlockEnd"];

    function U(t, r, n, o) {
        var a;
        let i = null != (a = N(t, r, !1)) ? a : n;
        return "number" == typeof i ? t => "string" == typeof t ? t : i * t : Array.isArray(i) ? t => "string" == typeof t ? t : i[t] : "function" == typeof i ? i : () => {}
    }

    function D(t) {
        return U(t, "spacing", 8, "spacing")
    }

    function H(t, r) {
        if ("string" == typeof r || null == r) return r;
        let n = t(Math.abs(r));
        return r >= 0 ? n : "number" == typeof n ? -n : "-".concat(n)
    }

    function q(t, r) {
        let n = D(t.theme);
        return Object.keys(t).map(o => (function(t, r, n, o) {
            var a;
            if (-1 === r.indexOf(n)) return null;
            let i = (a = F(n), t => a.reduce((r, n) => (r[n] = H(o, t), r), {}));
            return T(t, t[n], i)
        })(t, r, o, n)).reduce(_, {})
    }

    function V(t) {
        return q(t, K)
    }

    function Y(t) {
        return q(t, L)
    }

    function X() {
        for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
        let o = r.reduce((t, r) => (r.filterProps.forEach(n => {
                t[n] = r
            }), t), {}),
            a = t => Object.keys(t).reduce((r, n) => o[n] ? _(r, o[n](t)) : r, {});
        return a.propTypes = {}, a.filterProps = r.reduce((t, r) => t.concat(r.filterProps), []), a
    }

    function Z(t) {
        return "number" != typeof t ? t : "".concat(t, "px solid")
    }

    function J(t, r) {
        return W({
            prop: t,
            themeKey: "borders",
            transform: r
        })
    } [...K, ...L], V.propTypes = {}, V.filterProps = K, Y.propTypes = {}, Y.filterProps = L;
    let Q = J("border", Z),
        ee = J("borderTop", Z),
        et = J("borderRight", Z),
        er = J("borderBottom", Z),
        en = J("borderLeft", Z),
        eo = J("borderColor"),
        ea = J("borderTopColor"),
        ei = J("borderRightColor"),
        es = J("borderBottomColor"),
        el = J("borderLeftColor"),
        ec = J("outline", Z),
        eu = J("outlineColor"),
        ef = t => {
            if (void 0 !== t.borderRadius && null !== t.borderRadius) {
                let r = U(t.theme, "shape.borderRadius", 4, "borderRadius");
                return T(t, t.borderRadius, t => ({
                    borderRadius: H(r, t)
                }))
            }
            return null
        };
    ef.propTypes = {}, ef.filterProps = ["borderRadius"], X(Q, ee, et, er, en, eo, ea, ei, es, el, ef, ec, eu);
    let ed = t => {
        if (void 0 !== t.gap && null !== t.gap) {
            let r = U(t.theme, "spacing", 8, "gap");
            return T(t, t.gap, t => ({
                gap: H(r, t)
            }))
        }
        return null
    };
    ed.propTypes = {}, ed.filterProps = ["gap"];
    let ep = t => {
        if (void 0 !== t.columnGap && null !== t.columnGap) {
            let r = U(t.theme, "spacing", 8, "columnGap");
            return T(t, t.columnGap, t => ({
                columnGap: H(r, t)
            }))
        }
        return null
    };
    ep.propTypes = {}, ep.filterProps = ["columnGap"];
    let eh = t => {
        if (void 0 !== t.rowGap && null !== t.rowGap) {
            let r = U(t.theme, "spacing", 8, "rowGap");
            return T(t, t.rowGap, t => ({
                rowGap: H(r, t)
            }))
        }
        return null
    };

    function em(t, r) {
        return "grey" === r ? r : t
    }

    function ey(t) {
        return t <= 1 && 0 !== t ? 100 * t + "%" : t
    }
    eh.propTypes = {}, eh.filterProps = ["rowGap"], X(ed, ep, eh, W({
        prop: "gridColumn"
    }), W({
        prop: "gridRow"
    }), W({
        prop: "gridAutoFlow"
    }), W({
        prop: "gridAutoColumns"
    }), W({
        prop: "gridAutoRows"
    }), W({
        prop: "gridTemplateColumns"
    }), W({
        prop: "gridTemplateRows"
    }), W({
        prop: "gridTemplateAreas"
    }), W({
        prop: "gridArea"
    })), X(W({
        prop: "color",
        themeKey: "palette",
        transform: em
    }), W({
        prop: "bgcolor",
        cssProperty: "backgroundColor",
        themeKey: "palette",
        transform: em
    }), W({
        prop: "backgroundColor",
        themeKey: "palette",
        transform: em
    }));
    let eg = W({
            prop: "width",
            transform: ey
        }),
        eb = t => void 0 !== t.maxWidth && null !== t.maxWidth ? T(t, t.maxWidth, r => {
            var n, o;
            let a = (null == (n = t.theme) || null == (n = n.breakpoints) || null == (n = n.values) ? void 0 : n[r]) || E[r];
            return a ? "px" !== (null == (o = t.theme) || null == (o = o.breakpoints) ? void 0 : o.unit) ? {
                maxWidth: "".concat(a).concat(t.theme.breakpoints.unit)
            } : {
                maxWidth: a
            } : {
                maxWidth: ey(r)
            }
        }) : null;
    eb.filterProps = ["maxWidth"];
    let ev = W({
            prop: "minWidth",
            transform: ey
        }),
        ex = W({
            prop: "height",
            transform: ey
        }),
        ek = W({
            prop: "maxHeight",
            transform: ey
        }),
        ew = W({
            prop: "minHeight",
            transform: ey
        });
    W({
        prop: "size",
        cssProperty: "width",
        transform: ey
    }), W({
        prop: "size",
        cssProperty: "height",
        transform: ey
    }), X(eg, eb, ev, ex, ek, ew, W({
        prop: "boxSizing"
    }));
    var eO = {
        border: {
            themeKey: "borders",
            transform: Z
        },
        borderTop: {
            themeKey: "borders",
            transform: Z
        },
        borderRight: {
            themeKey: "borders",
            transform: Z
        },
        borderBottom: {
            themeKey: "borders",
            transform: Z
        },
        borderLeft: {
            themeKey: "borders",
            transform: Z
        },
        borderColor: {
            themeKey: "palette"
        },
        borderTopColor: {
            themeKey: "palette"
        },
        borderRightColor: {
            themeKey: "palette"
        },
        borderBottomColor: {
            themeKey: "palette"
        },
        borderLeftColor: {
            themeKey: "palette"
        },
        outline: {
            themeKey: "borders",
            transform: Z
        },
        outlineColor: {
            themeKey: "palette"
        },
        borderRadius: {
            themeKey: "shape.borderRadius",
            style: ef
        },
        color: {
            themeKey: "palette",
            transform: em
        },
        bgcolor: {
            themeKey: "palette",
            cssProperty: "backgroundColor",
            transform: em
        },
        backgroundColor: {
            themeKey: "palette",
            transform: em
        },
        p: {
            style: Y
        },
        pt: {
            style: Y
        },
        pr: {
            style: Y
        },
        pb: {
            style: Y
        },
        pl: {
            style: Y
        },
        px: {
            style: Y
        },
        py: {
            style: Y
        },
        padding: {
            style: Y
        },
        paddingTop: {
            style: Y
        },
        paddingRight: {
            style: Y
        },
        paddingBottom: {
            style: Y
        },
        paddingLeft: {
            style: Y
        },
        paddingX: {
            style: Y
        },
        paddingY: {
            style: Y
        },
        paddingInline: {
            style: Y
        },
        paddingInlineStart: {
            style: Y
        },
        paddingInlineEnd: {
            style: Y
        },
        paddingBlock: {
            style: Y
        },
        paddingBlockStart: {
            style: Y
        },
        paddingBlockEnd: {
            style: Y
        },
        m: {
            style: V
        },
        mt: {
            style: V
        },
        mr: {
            style: V
        },
        mb: {
            style: V
        },
        ml: {
            style: V
        },
        mx: {
            style: V
        },
        my: {
            style: V
        },
        margin: {
            style: V
        },
        marginTop: {
            style: V
        },
        marginRight: {
            style: V
        },
        marginBottom: {
            style: V
        },
        marginLeft: {
            style: V
        },
        marginX: {
            style: V
        },
        marginY: {
            style: V
        },
        marginInline: {
            style: V
        },
        marginInlineStart: {
            style: V
        },
        marginInlineEnd: {
            style: V
        },
        marginBlock: {
            style: V
        },
        marginBlockStart: {
            style: V
        },
        marginBlockEnd: {
            style: V
        },
        displayPrint: {
            cssProperty: !1,
            transform: t => ({
                "@media print": {
                    display: t
                }
            })
        },
        display: {},
        overflow: {},
        textOverflow: {},
        visibility: {},
        whiteSpace: {},
        flexBasis: {},
        flexDirection: {},
        flexWrap: {},
        justifyContent: {},
        alignItems: {},
        alignContent: {},
        order: {},
        flex: {},
        flexGrow: {},
        flexShrink: {},
        alignSelf: {},
        justifyItems: {},
        justifySelf: {},
        gap: {
            style: ed
        },
        rowGap: {
            style: eh
        },
        columnGap: {
            style: ep
        },
        gridColumn: {},
        gridRow: {},
        gridAutoFlow: {},
        gridAutoColumns: {},
        gridAutoRows: {},
        gridTemplateColumns: {},
        gridTemplateRows: {},
        gridTemplateAreas: {},
        gridArea: {},
        position: {},
        zIndex: {
            themeKey: "zIndex"
        },
        top: {},
        right: {},
        bottom: {},
        left: {},
        boxShadow: {
            themeKey: "shadows"
        },
        width: {
            transform: ey
        },
        maxWidth: {
            style: eb
        },
        minWidth: {
            transform: ey
        },
        height: {
            transform: ey
        },
        maxHeight: {
            transform: ey
        },
        minHeight: {
            transform: ey
        },
        boxSizing: {},
        fontFamily: {
            themeKey: "typography"
        },
        fontSize: {
            themeKey: "typography"
        },
        fontStyle: {
            themeKey: "typography"
        },
        fontWeight: {
            themeKey: "typography"
        },
        letterSpacing: {},
        textTransform: {},
        lineHeight: {},
        textAlign: {},
        typography: {
            cssProperty: !1,
            themeKey: "typography"
        }
    };

    function eS() {
        function t(t, r, n, o) {
            let a = {
                    [t]: r,
                    theme: n
                },
                i = o[t];
            if (!i) return {
                [t]: r
            };
            let {
                cssProperty: s = t,
                themeKey: l,
                transform: c,
                style: u
            } = i;
            if (null == r) return null;
            if ("typography" === l && "inherit" === r) return {
                [t]: r
            };
            let f = N(n, l) || {};
            return u ? u(a) : T(a, r, r => {
                let n = I(f, c, r);
                return r === n && "string" == typeof r && (n = I(f, c, "".concat(t).concat("default" === r ? "" : M(r)), r)), !1 === s ? n : {
                    [s]: n
                }
            })
        }
        return function r(n) {
            var o;
            let {
                sx: a,
                theme: i = {},
                nested: s
            } = n || {};
            if (!a) return null;
            let l = null != (o = i.unstable_sxConfig) ? o : eO;

            function c(n) {
                let o = n;
                if ("function" == typeof n) o = n(i);
                else if ("object" != typeof n) return n;
                if (!o) return null;
                let a = R(i.breakpoints),
                    c = Object.keys(a),
                    u = a;
                return Object.keys(o).forEach(n => {
                    var a;
                    let s = "function" == typeof(a = o[n]) ? a(i) : a;
                    if (null != s)
                        if ("object" == typeof s)
                            if (l[n]) u = _(u, t(n, s, i, l));
                            else {
                                let t = T({
                                    theme: i
                                }, s, t => ({
                                    [n]: t
                                }));
                                ! function() {
                                    for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                                    let o = new Set(r.reduce((t, r) => t.concat(Object.keys(r)), []));
                                    return r.every(t => o.size === Object.keys(t).length)
                                }(t, s) ? u = _(u, t): u[n] = r({
                                    sx: s,
                                    theme: i,
                                    nested: !0
                                })
                            }
                    else u = _(u, t(n, s, i, l))
                }), !s && i.modularCssLayers ? {
                    "@layer sx": $(c, u)
                } : $(c, u)
            }
            return Array.isArray(a) ? a.map(c) : c(a)
        }
    }
    let eC = eS();

    function eA(t, r) {
        return this.vars && "function" == typeof this.getColorSchemeSelector ? {
            [this.getColorSchemeSelector(t).replace(/(\[[^\]]+\])/, "*:where($1)")]: r
        } : this.palette.mode === t ? r : {}
    }
    eC.filterProps = ["sx"];
    let ej = ["breakpoints", "palette", "spacing", "shape"];

    function e_() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        for (var r = arguments.length, n = Array(r > 1 ? r - 1 : 0), a = 1; a < r; a++) n[a - 1] = arguments[a];
        let {
            breakpoints: i = {},
            palette: s = {},
            spacing: l,
            shape: c = {}
        } = t, u = k(t, ej), f = A(i), d = function() {
            let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 8;
            if (t.mui) return t;
            let r = D({
                    spacing: t
                }),
                n = function() {
                    for (var t = arguments.length, n = Array(t), o = 0; o < t; o++) n[o] = arguments[o];
                    return (0 === n.length ? [1] : n).map(t => {
                        let n = r(t);
                        return "number" == typeof n ? "".concat(n, "px") : n
                    }).join(" ")
                };
            return n.mui = !0, n
        }(l), p = S({
            breakpoints: f,
            direction: "ltr",
            components: {},
            palette: (0, o._)({
                mode: "light"
            }, s),
            spacing: d,
            shape: (0, o._)({}, j, c)
        }, u);
        return p.applyStyles = eA, (p = n.reduce((t, r) => S(t, r), p)).unstable_sxConfig = (0, o._)({}, eO, null == u ? void 0 : u.unstable_sxConfig), p.unstable_sx = function(t) {
            return eC({
                sx: t,
                theme: this
            })
        }, p
    }
    let eE = t => t;
    var eP = (n = eE, {
        configure(t) {
            n = t
        },
        generate: t => n(t),
        reset() {
            n = eE
        }
    });
    let eT = {
        active: "active",
        checked: "checked",
        completed: "completed",
        disabled: "disabled",
        error: "error",
        expanded: "expanded",
        focused: "focused",
        focusVisible: "focusVisible",
        open: "open",
        readOnly: "readOnly",
        required: "required",
        selected: "selected"
    };
    var eR, e$, eM, eN, eI, eW, ez = Object.freeze({
            __proto__: null,
            default: i.c
        }),
        eB = {},
        eG = {};
    (eW = {
        get exports() {
            return eG
        },
        set exports(e) {
            eG = e
        }
    }).exports = function(t) {
        return t && t.__esModule ? t : {
            default: t
        }
    }, eW.exports.__esModule = !0, eW.exports.default = eW.exports;
    var eF = (0, a.g)(x),
        eK = (0, a.g)(ez),
        eL = eG;
    Object.defineProperty(eB, "__esModule", {
        value: !0
    });
    var eU = eB.alpha = e4;
    eB.blend = function(t, r, n) {
        let o = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 1,
            a = (t, r) => Math.round((t ** (1 / o) * (1 - n) + r ** (1 / o) * n) ** o),
            i = eQ(t),
            s = eQ(r);
        return e1({
            type: "rgb",
            values: [a(i.values[0], s.values[0]), a(i.values[1], s.values[1]), a(i.values[2], s.values[2])]
        })
    }, eB.colorChannel = void 0;
    var eD = eB.darken = e3;
    eB.decomposeColor = eQ;
    var eH = eB.emphasize = e9,
        eq = eB.getContrastRatio = function(t, r) {
            let n = e2(t),
                o = e2(r);
            return (Math.max(n, o) + .05) / (Math.min(n, o) + .05)
        };
    eB.getLuminance = e2, eB.hexToRgb = eJ, eB.hslToRgb = e5;
    var eV = eB.lighten = e6;
    eB.private_safeAlpha = function(t, r, n) {
        try {
            return e4(t, r)
        } catch (r) {
            return t
        }
    }, eB.private_safeColorChannel = void 0, eB.private_safeDarken = function(t, r, n) {
        try {
            return e3(t, r)
        } catch (r) {
            return t
        }
    }, eB.private_safeEmphasize = function(t, r, n) {
        try {
            return e9(t, r)
        } catch (r) {
            return t
        }
    }, eB.private_safeLighten = function(t, r, n) {
        try {
            return e6(t, r)
        } catch (r) {
            return t
        }
    }, eB.recomposeColor = e1, eB.rgbToHex = function(t) {
        if (0 === t.indexOf("#")) return t;
        let {
            values: r
        } = eQ(t);
        return "#".concat(r.map((t, r) => {
            let n;
            return 1 === (n = (3 === r ? Math.round(255 * t) : t).toString(16)).length ? "0".concat(n) : n
        }).join(""))
    };
    var eY = eL(eF),
        eX = eL(eK);

    function eZ(t) {
        let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
            n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1;
        return (0, eX.default)(t, r, n)
    }

    function eJ(t) {
        t = t.slice(1);
        let r = RegExp(".{1,".concat(t.length >= 6 ? 2 : 1, "}"), "g"),
            n = t.match(r);
        return n && 1 === n[0].length && (n = n.map(t => t + t)), n ? "rgb".concat(4 === n.length ? "a" : "", "(").concat(n.map((t, r) => r < 3 ? parseInt(t, 16) : Math.round(parseInt(t, 16) / 255 * 1e3) / 1e3).join(", "), ")") : ""
    }

    function eQ(t) {
        if (t.type) return t;
        if ("#" === t.charAt(0)) return eQ(eJ(t));
        let r = t.indexOf("("),
            n = t.substring(0, r);
        if (-1 === ["rgb", "rgba", "hsl", "hsla", "color"].indexOf(n)) throw Error((0, eY.default)(9, t));
        let o, a = t.substring(r + 1, t.length - 1);
        if ("color" === n) {
            if (o = (a = a.split(" ")).shift(), 4 === a.length && "/" === a[3].charAt(0) && (a[3] = a[3].slice(1)), -1 === ["srgb", "display-p3", "a98-rgb", "prophoto-rgb", "rec-2020"].indexOf(o)) throw Error((0, eY.default)(10, o))
        } else a = a.split(",");
        return {
            type: n,
            values: a = a.map(t => parseFloat(t)),
            colorSpace: o
        }
    }
    let e0 = t => {
        let r = eQ(t);
        return r.values.slice(0, 3).map((t, n) => -1 !== r.type.indexOf("hsl") && 0 !== n ? "".concat(t, "%") : t).join(" ")
    };

    function e1(t) {
        let {
            type: r,
            colorSpace: n
        } = t, {
            values: o
        } = t;
        return -1 !== r.indexOf("rgb") ? o = o.map((t, r) => r < 3 ? parseInt(t, 10) : t) : -1 !== r.indexOf("hsl") && (o[1] = "".concat(o[1], "%"), o[2] = "".concat(o[2], "%")), o = -1 !== r.indexOf("color") ? "".concat(n, " ").concat(o.join(" ")) : "".concat(o.join(", ")), "".concat(r, "(").concat(o, ")")
    }

    function e5(t) {
        let {
            values: r
        } = t = eQ(t), n = r[0], o = r[1] / 100, a = r[2] / 100, i = o * Math.min(a, 1 - a), s = function(t) {
            let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : (t + n / 30) % 12;
            return a - i * Math.max(Math.min(r - 3, 9 - r, 1), -1)
        }, l = "rgb", c = [Math.round(255 * s(0)), Math.round(255 * s(8)), Math.round(255 * s(4))];
        return "hsla" === t.type && (l += "a", c.push(r[3])), e1({
            type: l,
            values: c
        })
    }

    function e2(t) {
        let r = "hsl" === (t = eQ(t)).type || "hsla" === t.type ? eQ(e5(t)).values : t.values;
        return Number((.2126 * (r = r.map(r => ("color" !== t.type && (r /= 255), r <= .03928 ? r / 12.92 : ((r + .055) / 1.055) ** 2.4)))[0] + .7152 * r[1] + .0722 * r[2]).toFixed(3))
    }

    function e4(t, r) {
        return t = eQ(t), r = eZ(r), "rgb" !== t.type && "hsl" !== t.type || (t.type += "a"), "color" === t.type ? t.values[3] = "/".concat(r) : t.values[3] = r, e1(t)
    }

    function e3(t, r) {
        if (t = eQ(t), r = eZ(r), -1 !== t.type.indexOf("hsl")) t.values[2] *= 1 - r;
        else if (-1 !== t.type.indexOf("rgb") || -1 !== t.type.indexOf("color"))
            for (let n = 0; n < 3; n += 1) t.values[n] *= 1 - r;
        return e1(t)
    }

    function e6(t, r) {
        if (t = eQ(t), r = eZ(r), -1 !== t.type.indexOf("hsl")) t.values[2] += (100 - t.values[2]) * r;
        else if (-1 !== t.type.indexOf("rgb"))
            for (let n = 0; n < 3; n += 1) t.values[n] += (255 - t.values[n]) * r;
        else if (-1 !== t.type.indexOf("color"))
            for (let n = 0; n < 3; n += 1) t.values[n] += (1 - t.values[n]) * r;
        return e1(t)
    }

    function e9(t) {
        let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : .15;
        return e2(t) > .5 ? e3(t, r) : e6(t, r)
    }
    eB.colorChannel = e0, eB.private_safeColorChannel = (t, r) => {
        try {
            return e0(t)
        } catch (r) {
            return t
        }
    };
    let e7 = ["mode", "contrastThreshold", "tonalOffset"],
        e8 = {
            text: {
                primary: "rgba(0, 0, 0, 0.87)",
                secondary: "rgba(0, 0, 0, 0.6)",
                disabled: "rgba(0, 0, 0, 0.38)"
            },
            divider: "rgba(0, 0, 0, 0.12)",
            background: {
                paper: d.white,
                default: d.white
            },
            action: {
                active: "rgba(0, 0, 0, 0.54)",
                hover: "rgba(0, 0, 0, 0.04)",
                hoverOpacity: .04,
                selected: "rgba(0, 0, 0, 0.08)",
                selectedOpacity: .08,
                disabled: "rgba(0, 0, 0, 0.26)",
                disabledBackground: "rgba(0, 0, 0, 0.12)",
                disabledOpacity: .38,
                focus: "rgba(0, 0, 0, 0.12)",
                focusOpacity: .12,
                activatedOpacity: .12
            }
        },
        te = {
            text: {
                primary: d.white,
                secondary: "rgba(255, 255, 255, 0.7)",
                disabled: "rgba(255, 255, 255, 0.5)",
                icon: "rgba(255, 255, 255, 0.5)"
            },
            divider: "rgba(255, 255, 255, 0.12)",
            background: {
                paper: "#121212",
                default: "#121212"
            },
            action: {
                active: d.white,
                hover: "rgba(255, 255, 255, 0.08)",
                hoverOpacity: .08,
                selected: "rgba(255, 255, 255, 0.16)",
                selectedOpacity: .16,
                disabled: "rgba(255, 255, 255, 0.3)",
                disabledBackground: "rgba(255, 255, 255, 0.12)",
                disabledOpacity: .38,
                focus: "rgba(255, 255, 255, 0.12)",
                focusOpacity: .12,
                activatedOpacity: .24
            }
        };

    function tt(t, r, n, o) {
        let a = o.light || o,
            i = o.dark || 1.5 * o;
        t[r] || (t.hasOwnProperty(n) ? t[r] = t[n] : "light" === r ? t.light = eV(t.main, a) : "dark" === r && (t.dark = eD(t.main, i)))
    }
    let tr = ["fontFamily", "fontSize", "fontWeightLight", "fontWeightRegular", "fontWeightMedium", "fontWeightBold", "htmlFontSize", "allVariants", "pxToRem"],
        tn = {
            textTransform: "uppercase"
        },
        to = '"Roboto", "Helvetica", "Arial", sans-serif';

    function ta() {
        for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
        return ["".concat(r[0], "px ").concat(r[1], "px ").concat(r[2], "px ").concat(r[3], "px rgba(0,0,0,").concat(.2, ")"), "".concat(r[4], "px ").concat(r[5], "px ").concat(r[6], "px ").concat(r[7], "px rgba(0,0,0,").concat(.14, ")"), "".concat(r[8], "px ").concat(r[9], "px ").concat(r[10], "px ").concat(r[11], "px rgba(0,0,0,").concat(.12, ")")].join(",")
    }
    var ti = ["none", ta(0, 2, 1, -1, 0, 1, 1, 0, 0, 1, 3, 0), ta(0, 3, 1, -2, 0, 2, 2, 0, 0, 1, 5, 0), ta(0, 3, 3, -2, 0, 3, 4, 0, 0, 1, 8, 0), ta(0, 2, 4, -1, 0, 4, 5, 0, 0, 1, 10, 0), ta(0, 3, 5, -1, 0, 5, 8, 0, 0, 1, 14, 0), ta(0, 3, 5, -1, 0, 6, 10, 0, 0, 1, 18, 0), ta(0, 4, 5, -2, 0, 7, 10, 1, 0, 2, 16, 1), ta(0, 5, 5, -3, 0, 8, 10, 1, 0, 3, 14, 2), ta(0, 5, 6, -3, 0, 9, 12, 1, 0, 3, 16, 2), ta(0, 6, 6, -3, 0, 10, 14, 1, 0, 4, 18, 3), ta(0, 6, 7, -4, 0, 11, 15, 1, 0, 4, 20, 3), ta(0, 7, 8, -4, 0, 12, 17, 2, 0, 5, 22, 4), ta(0, 7, 8, -4, 0, 13, 19, 2, 0, 5, 24, 4), ta(0, 7, 9, -4, 0, 14, 21, 2, 0, 5, 26, 4), ta(0, 8, 9, -5, 0, 15, 22, 2, 0, 6, 28, 5), ta(0, 8, 10, -5, 0, 16, 24, 2, 0, 6, 30, 5), ta(0, 8, 11, -5, 0, 17, 26, 2, 0, 6, 32, 5), ta(0, 9, 11, -5, 0, 18, 28, 2, 0, 7, 34, 6), ta(0, 9, 12, -6, 0, 19, 29, 2, 0, 7, 36, 6), ta(0, 10, 13, -6, 0, 20, 31, 3, 0, 8, 38, 7), ta(0, 10, 13, -6, 0, 21, 33, 3, 0, 8, 40, 7), ta(0, 10, 14, -6, 0, 22, 35, 3, 0, 8, 42, 7), ta(0, 11, 14, -7, 0, 23, 36, 3, 0, 9, 44, 8), ta(0, 11, 15, -7, 0, 24, 38, 3, 0, 9, 46, 8)];
    let ts = ["duration", "easing", "delay"],
        tl = {
            easeInOut: "cubic-bezier(0.4, 0, 0.2, 1)",
            easeOut: "cubic-bezier(0.0, 0, 0.2, 1)",
            easeIn: "cubic-bezier(0.4, 0, 1, 1)",
            sharp: "cubic-bezier(0.4, 0, 0.6, 1)"
        },
        tc = {
            shortest: 150,
            shorter: 200,
            short: 250,
            standard: 300,
            complex: 375,
            enteringScreen: 225,
            leavingScreen: 195
        };

    function tu(t) {
        return "".concat(Math.round(t), "ms")
    }

    function tf(t) {
        if (!t) return 0;
        let r = t / 36;
        return Math.round(10 * (4 + 15 * r ** .25 + r / 5))
    }
    var td = {
        mobileStepper: 1e3,
        fab: 1050,
        speedDial: 1050,
        appBar: 1100,
        drawer: 1200,
        modal: 1300,
        snackbar: 1400,
        tooltip: 1500
    };
    let tp = ["breakpoints", "mixins", "spacing", "palette", "transitions", "typography", "shape"];
    t.s(["_", 0, k, "a", 0, M, "b", 0, eU, "c", 0, e_, "d", 0, S, "e", 0, v, "f", 0, function() {
        let t, r, n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        for (var a, s = arguments.length, l = Array(s > 1 ? s - 1 : 0), c = 1; c < s; c++) l[c - 1] = arguments[c];
        let {
            mixins: u = {},
            palette: f = {},
            transitions: x = {},
            typography: w = {}
        } = n, O = k(n, tp);
        if (n.vars && void 0 === n.generateCssVars) throw Error((0, i.f)(18));
        let C = function(t) {
                let {
                    mode: r = "light",
                    contrastThreshold: n = 3,
                    tonalOffset: a = .2
                } = t, s = k(t, e7), l = t.primary || function() {
                    let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "light";
                    return "dark" === t ? {
                        main: m[200],
                        light: m[50],
                        dark: m[400]
                    } : {
                        main: m[700],
                        light: m[400],
                        dark: m[800]
                    }
                }(r), c = t.secondary || function() {
                    let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "light";
                    return "dark" === t ? {
                        main: h[200],
                        light: h[50],
                        dark: h[400]
                    } : {
                        main: h[500],
                        light: h[300],
                        dark: h[700]
                    }
                }(r), u = t.error || function() {
                    let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "light";
                    return "dark" === t ? {
                        main: p[500],
                        light: p[300],
                        dark: p[700]
                    } : {
                        main: p[700],
                        light: p[400],
                        dark: p[800]
                    }
                }(r), f = t.info || function() {
                    let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "light";
                    return "dark" === t ? {
                        main: y[400],
                        light: y[300],
                        dark: y[700]
                    } : {
                        main: y[700],
                        light: y[500],
                        dark: y[900]
                    }
                }(r), x = t.success || function() {
                    let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "light";
                    return "dark" === t ? {
                        main: g[400],
                        light: g[300],
                        dark: g[700]
                    } : {
                        main: g[800],
                        light: g[500],
                        dark: g[900]
                    }
                }(r), w = t.warning || function() {
                    let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "light";
                    return "dark" === t ? {
                        main: b[400],
                        light: b[300],
                        dark: b[700]
                    } : {
                        main: "#ed6c02",
                        light: b[500],
                        dark: b[900]
                    }
                }(r);

                function O(t) {
                    return eq(t, te.text.primary) >= n ? te.text.primary : e8.text.primary
                }
                let C = t => {
                    let {
                        color: r,
                        name: n,
                        mainShade: s = 500,
                        lightShade: l = 300,
                        darkShade: c = 700
                    } = t;
                    if (!(r = (0, o._)({}, r)).main && r[s] && (r.main = r[s]), !r.hasOwnProperty("main")) throw Error((0, i.f)(11, n ? " (".concat(n, ")") : "", s));
                    if ("string" != typeof r.main) throw Error((0, i.f)(12, n ? " (".concat(n, ")") : "", JSON.stringify(r.main)));
                    return tt(r, "light", l, a), tt(r, "dark", c, a), r.contrastText || (r.contrastText = O(r.main)), r
                };
                return S((0, o._)({
                    common: (0, o._)({}, d),
                    mode: r,
                    primary: C({
                        color: l,
                        name: "primary"
                    }),
                    secondary: C({
                        color: c,
                        name: "secondary",
                        mainShade: "A400",
                        lightShade: "A200",
                        darkShade: "A700"
                    }),
                    error: C({
                        color: u,
                        name: "error"
                    }),
                    warning: C({
                        color: w,
                        name: "warning"
                    }),
                    info: C({
                        color: f,
                        name: "info"
                    }),
                    success: C({
                        color: x,
                        name: "success"
                    }),
                    grey: v,
                    contrastThreshold: n,
                    getContrastText: O,
                    augmentColor: C,
                    tonalOffset: a
                }, {
                    dark: te,
                    light: e8
                } [r]), s)
            }(f),
            A = e_(n),
            j = S(A, {
                mixins: (a = A.breakpoints, (0, o._)({
                    toolbar: {
                        minHeight: 56,
                        [a.up("xs")]: {
                            "@media (orientation: landscape)": {
                                minHeight: 48
                            }
                        },
                        [a.up("sm")]: {
                            minHeight: 64
                        }
                    }
                }, u)),
                palette: C,
                shadows: ti.slice(),
                typography: function(t, r) {
                    let n = "function" == typeof r ? r(t) : r,
                        {
                            fontFamily: a = to,
                            fontSize: i = 14,
                            fontWeightLight: s = 300,
                            fontWeightRegular: l = 400,
                            fontWeightMedium: c = 500,
                            fontWeightBold: u = 700,
                            htmlFontSize: f = 16,
                            allVariants: d,
                            pxToRem: p
                        } = n,
                        h = k(n, tr),
                        m = i / 14,
                        y = p || (t => t / f * m + "rem"),
                        g = (t, r, n, i, s) => (0, o._)({
                            fontFamily: a,
                            fontWeight: t,
                            fontSize: y(r),
                            lineHeight: n
                        }, a === to ? {
                            letterSpacing: Math.round(i / r * 1e5) / 1e5 + "em"
                        } : {}, s, d),
                        b = {
                            h1: g(s, 96, 1.167, -1.5),
                            h2: g(s, 60, 1.2, -.5),
                            h3: g(l, 48, 1.167, 0),
                            h4: g(l, 34, 1.235, .25),
                            h5: g(l, 24, 1.334, 0),
                            h6: g(c, 20, 1.6, .15),
                            subtitle1: g(l, 16, 1.75, .15),
                            subtitle2: g(c, 14, 1.57, .1),
                            body1: g(l, 16, 1.5, .15),
                            body2: g(l, 14, 1.43, .15),
                            button: g(c, 14, 1.75, .4, tn),
                            caption: g(l, 12, 1.66, .4),
                            overline: g(l, 12, 2.66, 1, tn),
                            inherit: {
                                fontFamily: "inherit",
                                fontWeight: "inherit",
                                fontSize: "inherit",
                                lineHeight: "inherit",
                                letterSpacing: "inherit"
                            }
                        };
                    return S((0, o._)({
                        htmlFontSize: f,
                        pxToRem: y,
                        fontFamily: a,
                        fontSize: i,
                        fontWeightLight: s,
                        fontWeightRegular: l,
                        fontWeightMedium: c,
                        fontWeightBold: u
                    }, b), h, {
                        clone: !1
                    })
                }(C, w),
                transitions: (t = (0, o._)({}, tl, x.easing), r = (0, o._)({}, tc, x.duration), (0, o._)({
                    getAutoHeightDuration: tf,
                    create: function() {
                        let n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : ["all"],
                            o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                            {
                                duration: a = r.standard,
                                easing: i = t.easeInOut,
                                delay: s = 0
                            } = o;
                        return k(o, ts), (Array.isArray(n) ? n : [n]).map(t => "".concat(t, " ").concat("string" == typeof a ? a : tu(a), " ").concat(i, " ").concat("string" == typeof s ? s : tu(s))).join(",")
                    }
                }, x, {
                    easing: t,
                    duration: r
                })),
                zIndex: (0, o._)({}, td)
            });
        return j = S(j, O), (j = l.reduce((t, r) => S(t, r), j)).unstable_sxConfig = (0, o._)({}, eO, null == O ? void 0 : O.unstable_sxConfig), j.unstable_sx = function(t) {
            return eC({
                sx: t,
                theme: this
            })
        }, j
    }, "g", 0, function(t, r) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "Mui",
            o = eT[r];
        return o ? "".concat(n, "-").concat(o) : "".concat(eP.generate(t), "-").concat(r)
    }, "h", 0, tc, "i", 0, O, "j", 0, eD, "k", 0, N, "l", 0, eV, "m", 0, T, "n", 0, eH, "o", 0, A, "p", () => w, "q", 0, eA, "r", 0, function(t) {
        let r, {
                values: n,
                breakpoints: o,
                base: a
            } = t,
            i = Object.keys(a || function(t, r) {
                if ("object" != typeof t) return {};
                let n = {},
                    o = Object.keys(r);
                return Array.isArray(t) ? o.forEach((r, o) => {
                    o < t.length && (n[r] = !0)
                }) : o.forEach(r => {
                    null != t[r] && (n[r] = !0)
                }), n
            }(n, o));
        return 0 === i.length ? n : i.reduce((t, o, a) => (Array.isArray(n) ? (t[o] = null != n[a] ? n[a] : n[r], r = a) : "object" == typeof n ? (t[o] = null != n[o] ? n[o] : n[r], r = o) : t[o] = n, t), {})
    }, "s", 0, eC, "t", 0, eO, "u", 0, eS, "v", () => eG, "w", 0, D, "x", 0, function(t) {
        for (var r = arguments.length, n = Array(r > 1 ? r - 1 : 0), o = 1; o < r; o++) n[o - 1] = arguments[o];
        let a = R(t),
            i = [a, ...n].reduce((t, r) => S(t, r), {});
        return $(Object.keys(a), i)
    }, "y", 0, H], 273589)
}, 970624, t => {
    "use strict";
    var r = (0, t.i(273589).f)();
    t.s(["T", 0, "$$material", "d", 0, r])
}, 724913, t => {
    "use strict";
    var r = "u" > typeof document,
        n = function(t, n, o) {
            var a = t.key + "-" + n.name;
            (!1 === o || !1 === r && void 0 !== t.compat) && void 0 === t.registered[a] && (t.registered[a] = n.styles)
        },
        o = {
            animationIterationCount: 1,
            aspectRatio: 1,
            borderImageOutset: 1,
            borderImageSlice: 1,
            borderImageWidth: 1,
            boxFlex: 1,
            boxFlexGroup: 1,
            boxOrdinalGroup: 1,
            columnCount: 1,
            columns: 1,
            flex: 1,
            flexGrow: 1,
            flexPositive: 1,
            flexShrink: 1,
            flexNegative: 1,
            flexOrder: 1,
            gridRow: 1,
            gridRowEnd: 1,
            gridRowSpan: 1,
            gridRowStart: 1,
            gridColumn: 1,
            gridColumnEnd: 1,
            gridColumnSpan: 1,
            gridColumnStart: 1,
            msGridRow: 1,
            msGridRowSpan: 1,
            msGridColumn: 1,
            msGridColumnSpan: 1,
            fontWeight: 1,
            lineHeight: 1,
            opacity: 1,
            order: 1,
            orphans: 1,
            scale: 1,
            tabSize: 1,
            widows: 1,
            zIndex: 1,
            zoom: 1,
            WebkitLineClamp: 1,
            fillOpacity: 1,
            floodOpacity: 1,
            stopOpacity: 1,
            strokeDasharray: 1,
            strokeDashoffset: 1,
            strokeMiterlimit: 1,
            strokeOpacity: 1,
            strokeWidth: 1
        },
        a = /[A-Z]|^ms/g,
        i = /_EMO_([^_]+?)_([^]*?)_EMO_/g,
        s = function(t) {
            return 45 === t.charCodeAt(1)
        },
        l = function(t) {
            return null != t && "boolean" != typeof t
        },
        c = (d = function(t) {
            return s(t) ? t : t.replace(a, "-$&").toLowerCase()
        }, p = Object.create(null), function(t) {
            return void 0 === p[t] && (p[t] = d(t)), p[t]
        }),
        u = function(t, r) {
            switch (t) {
                case "animation":
                case "animationName":
                    if ("string" == typeof r) return r.replace(i, function(t, r, n) {
                        return h = {
                            name: r,
                            styles: n,
                            next: h
                        }, r
                    })
            }
            return 1 === o[t] || s(t) || "number" != typeof r || 0 === r ? r : r + "px"
        };

    function f(t, r, n) {
        if (null == n) return "";
        if (void 0 !== n.__emotion_styles) return n;
        switch (typeof n) {
            case "boolean":
                return "";
            case "object":
                if (1 === n.anim) return h = {
                    name: n.name,
                    styles: n.styles,
                    next: h
                }, n.name;
                if (void 0 !== n.styles) {
                    var o = n.next;
                    if (void 0 !== o)
                        for (; void 0 !== o;) h = {
                            name: o.name,
                            styles: o.styles,
                            next: h
                        }, o = o.next;
                    return n.styles + ";"
                }
                return function(t, r, n) {
                    var o = "";
                    if (Array.isArray(n))
                        for (var a = 0; a < n.length; a++) o += f(t, r, n[a]) + ";";
                    else
                        for (var i in n) {
                            var s = n[i];
                            if ("object" != typeof s) null != r && void 0 !== r[s] ? o += i + "{" + r[s] + "}" : l(s) && (o += c(i) + ":" + u(i, s) + ";");
                            else if (Array.isArray(s) && "string" == typeof s[0] && (null == r || void 0 === r[s[0]]))
                                for (var d = 0; d < s.length; d++) l(s[d]) && (o += c(i) + ":" + u(i, s[d]) + ";");
                            else {
                                var p = f(t, r, s);
                                switch (i) {
                                    case "animation":
                                    case "animationName":
                                        o += c(i) + ":" + p + ";";
                                        break;
                                    default:
                                        o += i + "{" + p + "}"
                                }
                            }
                        }
                    return o
                }(t, r, n);
            case "function":
                if (void 0 !== t) {
                    var a = h,
                        i = n(t);
                    return h = a, f(t, r, i)
                }
        }
        if (null == r) return n;
        var s = r[n];
        return void 0 !== s ? s : n
    }
    var d, p, h, m = /label:\s*([^\s;{]+)\s*(;|$)/g;
    t.s(["g", 0, function(t, r, n) {
        var o = "";
        return n.split(" ").forEach(function(n) {
            void 0 !== t[n] ? r.push(t[n] + ";") : n && (o += n + " ")
        }), o
    }, "i", 0, function(t, o, a) {
        n(t, o, a);
        var i = t.key + "-" + o.name;
        if (void 0 === t.inserted[o.name]) {
            var s = "",
                l = o;
            do {
                var c = t.insert(o === l ? "." + i : "", l, t.sheet, !0);
                r || void 0 === c || (s += c), l = l.next
            } while (void 0 !== l) if (!r && 0 !== s.length) return s
        }
    }, "r", 0, n, "s", 0, function(t, r, n) {
        if (1 === t.length && "object" == typeof t[0] && null !== t[0] && void 0 !== t[0].styles) return t[0];
        var o = !0,
            a = "";
        h = void 0;
        var i = t[0];
        null == i || void 0 === i.raw ? (o = !1, a += f(n, r, i)) : a += i[0];
        for (var s = 1; s < t.length; s++) a += f(n, r, t[s]), o && (a += i[s]);
        m.lastIndex = 0;
        for (var l, c = ""; null !== (l = m.exec(a));) c += "-" + l[1];
        return {
            name: function(t) {
                for (var r, n = 0, o = 0, a = t.length; a >= 4; ++o, a -= 4) r = 0x5bd1e995 * (65535 & (r = 255 & t.charCodeAt(o) | (255 & t.charCodeAt(++o)) << 8 | (255 & t.charCodeAt(++o)) << 16 | (255 & t.charCodeAt(++o)) << 24)) + (59797 * (r >>> 16) << 16), n = 0x5bd1e995 * (65535 & (r ^= r >>> 24)) + (59797 * (r >>> 16) << 16) ^ 0x5bd1e995 * (65535 & n) + (59797 * (n >>> 16) << 16);
                switch (a) {
                    case 3:
                        n ^= (255 & t.charCodeAt(o + 2)) << 16;
                    case 2:
                        n ^= (255 & t.charCodeAt(o + 1)) << 8;
                    case 1:
                        n = 0x5bd1e995 * (65535 & (n ^= 255 & t.charCodeAt(o))) + (59797 * (n >>> 16) << 16)
                }
                return (((n = 0x5bd1e995 * (65535 & (n ^= n >>> 13)) + (59797 * (n >>> 16) << 16)) ^ n >>> 15) >>> 0).toString(36)
            }(a) + c,
            styles: a,
            next: h
        }
    }])
}, 962560, t => {
    "use strict";

    function r() {
        return (r = Object.assign.bind()).apply(null, arguments)
    }
    t.s(["_", () => r])
}, 614515, 51760, t => {
    "use strict";
    let r, n, o, a, i;
    var s = t.i(416340),
        l = t.i(724913),
        c = t.i(164688),
        c = c;
    let u = Object.fromEntries ? Object.fromEntries : t => {
        if (!t || !t[Symbol.iterator]) throw Error("Object.fromEntries() requires a single iterable argument");
        let r = {};
        return Object.keys(t).forEach(n => {
            let [o, a] = t[n];
            r[o] = a
        }), r
    };

    function f(t) {
        return Object.keys(t)
    }

    function d(t, r) {
        if (!t) throw Error(r)
    }
    let p = t => {
            let r = t.length,
                n = 0,
                o = "";
            for (; n < r; n++) {
                let r, a = t[n];
                if (null != a) {
                    switch (typeof a) {
                        case "boolean":
                            break;
                        case "object":
                            if (Array.isArray(a)) r = p(a);
                            else
                                for (let t in d(!0), r = "", a) a[t] && t && (r && (r += " "), r += t);
                            break;
                        default:
                            r = a
                    }
                    r && (o && (o += " "), o += r)
                }
            }
            return o
        },
        {
            createCssAndCx: h
        } = {
            createCssAndCx: function(t) {
                let {
                    cache: r
                } = t, n = function() {
                    for (var t = arguments.length, n = Array(t), o = 0; o < t; o++) n[o] = arguments[o];
                    let a = (0, l.s)(n, r.registered);
                    (0, l.i)(r, a, !1);
                    let i = "".concat(r.key, "-").concat(a.name);
                    {
                        let t = n[0];
                        !(t instanceof Object) || "styles" in t || "length" in t || "__emotion_styles" in t || y.saveClassNameCSSObjectMapping(r, i, t)
                    }
                    return i
                };
                return {
                    css: n,
                    cx: function() {
                        let t, o;
                        for (var a, i = arguments.length, s = Array(i), c = 0; c < i; c++) s[c] = arguments[c];
                        let u = p(s),
                            f = y.fixClassName(r, u, n);
                        return a = r.registered, t = [], o = (0, l.g)(a, t, f), t.length < 2 ? f : o + n(t)
                    }
                }
            }
        };

    function m(t) {
        let {
            useCache: r
        } = t;
        return {
            useCssAndCx: function() {
                var t, n, o;
                let a, i = r(),
                    {
                        css: l,
                        cx: c
                    } = (t = () => h({
                        cache: i
                    }), n = [i], (!(a = (0, s.useRef)()).current || n.length !== (null == (o = a.current.prevDeps) ? void 0 : o.length) || a.current.prevDeps.map((t, r) => t === n[r]).indexOf(!1) >= 0) && (a.current = {
                        v: t(),
                        prevDeps: [...n]
                    }), a.current.v);
                return {
                    css: l,
                    cx: c
                }
            }
        }
    }
    let y = (r = new WeakMap, {
        saveClassNameCSSObjectMapping: (t, n, o) => {
            let a = r.get(t);
            void 0 === a && (a = new Map, r.set(t, a)), a.set(n, o)
        },
        fixClassName: (t, n, o) => {
            var a;
            let i, s = r.get(t);
            return p((a = n.split(" ").map(t => [t, null == s ? void 0 : s.get(t)]), i = !1, a.map(t => {
                let r, [n, o] = t;
                if (void 0 === o) return n;
                if (i) r = {
                    "&&": o
                };
                else
                    for (let t in r = n, o)
                        if (t.startsWith("@media")) {
                            i = !0;
                            break
                        } return r
            })).map(t => "string" == typeof t ? t : o(t)))
        }
    });

    function g(t) {
        if (!(t instanceof Object) || "function" == typeof t) return t;
        let r = [];
        for (let n in t) {
            let o = t[n],
                a = typeof o;
            if ("string" !== a && ("number" !== a || isNaN(o)) && "boolean" !== a && null != o) return t;
            r.push("".concat(n, ":").concat(a, "_").concat(o))
        }
        return "xSqLiJdLMd9s" + r.join("|")
    }

    function b(t, r, n) {
        if (!(r instanceof Object)) return t;
        let o = {};
        return f(t).forEach(a => o[a] = n(t[a], r[a])), f(r).forEach(n => {
            if (n in t) return;
            let a = r[n];
            "string" == typeof a && (o[n] = a)
        }), o
    }
    let v = t => {
            var r, n;
            let o, {
                classes: a,
                theme: i,
                muiStyleOverridesParams: l,
                css: c,
                cx: u,
                name: f
            } = t;
            if ("makeStyle no name" !== f) {
                if (void 0 !== l && void 0 === f) throw Error("To use muiStyleOverridesParams, you must specify a name using .withName('MyComponent')")
            } else f = void 0;
            try {
                o = void 0 === f ? void 0 : (null == (n = null == (r = i.components) ? void 0 : r[f]) ? void 0 : n.styleOverrides) || void 0
            } catch (t) {}
            let d = (0, s.useMemo)(() => {
                if (void 0 === o) return;
                let t = {};
                for (let r in o) {
                    let n = o[r];
                    n instanceof Object && (t[r] = c("function" == typeof n ? n({
                        theme: i,
                        ownerState: null == l ? void 0 : l.ownerState,
                        ...null == l ? void 0 : l.props
                    }) : n))
                }
                return t
            }, [o, g(null == l ? void 0 : l.props), g(null == l ? void 0 : l.ownerState), c]);
            return {
                classes: a = (0, s.useMemo)(() => b(a, d, u), [a, d, u])
            }
        },
        x = c._,
        k = 0;

    function w(t) {
        let {
            useTheme: r,
            cache: n
        } = t, {
            useCache: o
        } = S({
            cacheProvidedAtInception: n
        }), {
            useCssAndCx: a
        } = m({
            useCache: o
        });
        return {
            makeStyles: function(t) {
                let {
                    name: n,
                    uniqId: i = "" + k++
                } = null != t ? t : {}, l = "object" != typeof n ? n : Object.keys(n)[0];
                return function(t) {
                    let n = "function" == typeof t ? t : () => t;
                    return function(t, c) {
                        let p = r(),
                            {
                                css: h,
                                cx: m
                            } = a(),
                            y = o(),
                            x = (0, s.useMemo)(() => {
                                let r = {},
                                    o = n(p, t, "u" > typeof Proxy && new Proxy({}, {
                                        get: (t, n) => ("symbol" == typeof n && d(!1), r[n] = "".concat(y.key, "-").concat(i).concat(void 0 !== l ? "-".concat(l) : "", "-").concat(n, "-ref"))
                                    }) || {}),
                                    a = u(f(o).map(t => {
                                        let n = o[t];
                                        return n.label || (n.label = "".concat(void 0 !== l ? "".concat(l, "-") : "").concat(t)), [t, "".concat(h(n)).concat(t in r ? " ".concat(r[t]) : "")]
                                    }));
                                return f(r).forEach(t => {
                                    t in a || (a[t] = r[t])
                                }), a
                            }, [y, h, m, p, g(t)]);
                        {
                            let t = null == c ? void 0 : c.props.classes;
                            x = (0, s.useMemo)(() => b(x, t, m), [x, g(t), m])
                        } {
                            let t = v({
                                classes: x,
                                css: h,
                                cx: m,
                                name: null != l ? l : "makeStyle no name",
                                idOfUseStyles: i,
                                muiStyleOverridesParams: c,
                                theme: p
                            });
                            void 0 !== t.classes && (x = t.classes), void 0 !== t.css && (h = t.css), void 0 !== t.cx && (m = t.cx)
                        }
                        return {
                            classes: x,
                            theme: p,
                            css: h,
                            cx: m
                        }
                    }
                }
            },
            useStyles: function() {
                let t = r(),
                    {
                        css: n,
                        cx: o
                    } = a();
                return {
                    theme: t,
                    css: n,
                    cx: o
                }
            }
        }
    }
    let O = (0, s.createContext)(void 0),
        {
            createUseCache: S
        } = {
            createUseCache: function(t) {
                let {
                    cacheProvidedAtInception: r
                } = t;
                return {
                    useCache: function() {
                        var t;
                        let n = x(),
                            o = (0, s.useContext)(O),
                            a = null != (t = null != r ? r : o) ? t : n;
                        if (null === a) throw Error("In order to get SSR working with tss-react you need to explicitly provide an Emotion cache.\nMUI users be aware: This is not an error strictly related to tss-react, with or without tss-react,\nMUI needs an Emotion cache to be provided for SSR to work.\nHere is the MUI documentation related to SSR setup: https://mui.com/material-ui/guides/server-rendering/\nTSS provides helper that makes the process of setting up SSR easier: https://docs.tss-react.dev/ssr");
                        return a
                    }
                }
            }
        };

    function C(t) {
        return t.charAt(0).toUpperCase() + t.slice(1)
    }
    let A = new WeakMap,
        j = "getClasses should only be used in conjunction with withStyles";

    function _(t) {
        let r = t.classes;
        if (void 0 === r) throw Error(j);
        let n = A.get(r);
        if (void 0 === n) throw Error(j);
        return n
    }

    function E(t) {
        let r = {},
            n = {};
        return Object.keys(t).forEach(o => (o.startsWith("@media") ? n : r)[o] = t[o]), Object.keys(n).forEach(t => {
            let o = n[t];
            Object.keys(o).forEach(n => {
                var a;
                return r[n] = {
                    ...null != (a = r[n]) ? a : {},
                    [t]: o[n]
                }
            })
        }), r
    }
    let P = (n = "object" == typeof document && "function" == typeof(null == document ? void 0 : document.getElementById), o = "u" > typeof jest, a = "u" > typeof mocha, i = "u" > typeof __vitest_worker__, !(n || o || a || i));

    function T(t) {
        R = 0, $.splice(0, $.length);
        let {
            useContext: r,
            usePlugin: n,
            cache: o
        } = t, {
            useCache: a
        } = S({
            cacheProvidedAtInception: o
        }), {
            useCssAndCx: i
        } = m({
            useCache: a
        });
        return {
            tss: function t(r) {
                let {
                    useContext: n,
                    useCache: o,
                    useCssAndCx: a,
                    usePlugin: i,
                    name: s,
                    doesUseNestedSelectors: l
                } = r;
                return {
                    withParams: () => t({
                        ...r
                    }),
                    withName: n => t({
                        ...r,
                        name: "object" != typeof n ? n : Object.keys(n)[0]
                    }),
                    withNestedSelectors: () => t({
                        ...r,
                        doesUseNestedSelectors: !0
                    }),
                    create: t => {
                        let r = "x" + R++;
                        if (void 0 !== s)
                            for (;;) {
                                let t = $.find(t => t.name === s);
                                if (void 0 === t) break;
                                $.splice($.indexOf(t), 1)
                            }
                        let c = "function" == typeof t ? t : () => t;
                        return function(p) {
                            var h, m, y;
                            let {
                                classesOverrides: v,
                                ...x
                            } = null != p ? p : {}, k = n(), {
                                css: w,
                                cx: O
                            } = a(), S = o(), C = function(t) {
                                let {
                                    cache: r,
                                    cssObjectByRuleNameOrGetCssObjectByRuleName: n,
                                    classesOverridesRef: o,
                                    paramsAndPluginParamsRef: a,
                                    idOfUseStyles: i,
                                    context: s,
                                    getClasses: l
                                } = t;
                                e: {
                                    let t = M.get(r);
                                    if (void 0 === t) break e;
                                    let l = t.get(n);
                                    if (void 0 === l) break e;
                                    let c = l.get(o);
                                    if (void 0 === c) break e;
                                    let u = c.get(a);
                                    if (void 0 === u) break e;
                                    let d = u.find(t => {
                                        let {
                                            context: r
                                        } = t;
                                        if (r === s) return !0;
                                        if (f(r).length !== f(s).length) return !1;
                                        for (let t in r)
                                            if (g(r[t]) !== g(s[t])) return !1;
                                        return !0
                                    });
                                    if (void 0 !== d) {
                                        if ((null == d ? void 0 : d.idOfUseStyles) === i) return d.result;
                                        u.splice(u.indexOf(d), 1)
                                    }
                                }
                                let c = l();
                                {
                                    M.has(r) || M.set(r, new WeakMap);
                                    let t = M.get(r);
                                    d(void 0 !== t), t.has(n) || t.set(n, new Map);
                                    let l = t.get(n);
                                    d(void 0 !== l), l.has(o) || (l.size > 200 && l.clear(), l.set(o, new Map));
                                    let u = l.get(o);
                                    if (d(void 0 !== u), !u.has(a)) {
                                        {
                                            let t = "string" == typeof a ? 257 : 5;
                                            u.size < t || u.clear()
                                        }
                                        u.set(a, [])
                                    }
                                    let f = u.get(a);
                                    d(void 0 !== f), f.length > 5 && (f = []), f.push({
                                        idOfUseStyles: i,
                                        context: s,
                                        result: c
                                    })
                                }
                                return c
                            }({
                                cache: S,
                                cssObjectByRuleNameOrGetCssObjectByRuleName: t,
                                classesOverridesRef: g(v),
                                paramsAndPluginParamsRef: g(x),
                                idOfUseStyles: r,
                                context: k,
                                getClasses: () => {
                                    let t = {},
                                        n = c({
                                            ...p,
                                            ...k,
                                            ...l ? {
                                                classes: "u" < typeof Proxy ? {} : new Proxy({}, {
                                                    get: (n, o) => {
                                                        if ("symbol" == typeof o && d(!1), P && void 0 === s) throw Error('tss-react: In SSR setups, in order to use nested selectors, you must also give a unique name to the useStyle function.\nSolution: Use tss.withName("ComponentName").withNestedSelectors<...>()... to set a name.');
                                                        if (void 0 !== s) {
                                                            let t = $.find(t => t.name === s && t.idOfUseStyles === r);
                                                            void 0 === t && $.push(t = {
                                                                name: s,
                                                                idOfUseStyles: r,
                                                                nestedSelectorRuleNames: new Set
                                                            }), t.nestedSelectorRuleNames.add(o)
                                                        }
                                                        if (void 0 !== s && void 0 !== $.find(t => t.name === s && t.idOfUseStyles !== r && t.nestedSelectorRuleNames.has(o))) throw Error(['tss-react: There are in your codebase two different useStyles named "'.concat(s, '" that'), "both use use the nested selector ".concat(o, ".\n"), 'This may lead to CSS class name collisions, causing nested selectors to target elements outside of the intended scope.\n Solution: Ensure each useStyles using nested selectors has a unique name.\n Use: tss.withName("UniqueName").withNestedSelectors<...>()...'].join(" "));
                                                        return t[o] = "".concat(S.key, "-").concat(void 0 !== s ? s : r, "-").concat(o, "-ref")
                                                    }
                                                })
                                            } : {}
                                        }),
                                        o = u(f(n).map(r => {
                                            let o = n[r];
                                            return o.label || (o.label = "".concat(void 0 !== s ? "".concat(s, "-") : "").concat(r)), [r, "".concat(w(o)).concat(r in t ? " ".concat(t[r]) : "")]
                                        }));
                                    return f(t).forEach(r => {
                                        r in o || (o[r] = t[r])
                                    }), o = b(o, v, O)
                                }
                            }), A = i({
                                classes: C,
                                css: w,
                                cx: O,
                                idOfUseStyles: r,
                                name: s,
                                ...k,
                                ...x
                            });
                            return {
                                classes: null != (h = A.classes) ? h : C,
                                css: null != (m = A.css) ? m : w,
                                cx: null != (y = A.cx) ? y : O,
                                ...k
                            }
                        }
                    }
                }
            }({
                useContext: r,
                useCache: a,
                useCssAndCx: i,
                usePlugin: null != n ? n : t => {
                    let {
                        classes: r,
                        cx: n,
                        css: o
                    } = t;
                    return {
                        classes: r,
                        cx: n,
                        css: o
                    }
                },
                name: void 0,
                doesUseNestedSelectors: !1
            })
        }
    }
    let R = 0,
        $ = [],
        M = new WeakMap;

    function N(t) {
        return {
            ...w(t),
            ... function(t) {
                let {
                    useTheme: r,
                    cache: n
                } = t, {
                    makeStyles: o
                } = w({
                    useTheme: r,
                    cache: n
                });

                function a(t, r, n) {
                    let a, i = "string" == typeof t ? (Object.defineProperty(a = function(r) {
                            let {
                                children: n,
                                ...o
                            } = r;
                            return (0, s.createElement)(t, o, n)
                        }, "name", {
                            value: C(t)
                        }), a) : t,
                        l = (() => {
                            let t;
                            {
                                let {
                                    name: t
                                } = null != n ? n : {};
                                if (void 0 !== t) return "object" != typeof t ? t : Object.keys(t)[0]
                            } {
                                let r = i.displayName;
                                "string" == typeof r && "" !== r && (t = r)
                            }
                            if (void 0 === t) {
                                let r = i.name;
                                "string" == typeof r && "" !== r && (t = r)
                            }
                            if (void 0 !== t) return (t = (t = t.replace(/\$/g, "usd")).replace(/\(/g, "_").replace(/\)/g, "_")).replace(/[^a-zA-Z0-9-_]/g, "_")
                        })(),
                        c = o({
                            ...n,
                            name: l
                        })("function" == typeof r ? (t, n, o) => E(r(t, n, o)) : E(r)),
                        u = (0, s.forwardRef)(function(r, n) {
                            let {
                                className: o,
                                classes: a,
                                ...l
                            } = r, {
                                classes: u,
                                cx: f
                            } = c(r, {
                                props: r
                            }), d = f(u.root, o);
                            return A.set(u, {
                                ...u,
                                root: d
                            }), s.default.createElement(i, {
                                ref: n,
                                className: ! function(t) {
                                    for (let r in t)
                                        if ("root" !== r) return !0;
                                    return !1
                                }(u) ? d : o,
                                ..."string" == typeof t ? {} : {
                                    classes: u
                                },
                                ...l
                            })
                        });
                    return void 0 !== l && (u.displayName = "".concat(C(l), "WithStyles"), Object.defineProperty(u, "name", {
                        value: u.displayName
                    })), u
                }
                return a.getClasses = _, {
                    withStyles: a
                }
            }(t)
        }
    }
    let {
        tss: I
    } = T({
        useContext: () => ({})
    });
    I.create({}), t.s(["T", 0, function(t) {
        let {
            children: r,
            value: n
        } = t;
        return s.default.createElement(O.Provider, {
            value: n
        }, r)
    }, "a", 0, T, "c", 0, N, "u", 0, v], 51760);
    var W = t.i(652199);
    let {
        makeStyles: z,
        withStyles: B
    } = N({
        useTheme: W.u
    }), {
        tss: G
    } = T({
        useContext: function() {
            return {
                theme: (0, W.u)()
            }
        },
        usePlugin: v
    });
    G.create({}), t.s(["default", 0, z], 614515)
}, 706442, t => {
    "use strict";
    var r = t.i(614515);
    t.s(["makeStyles", () => r.default])
}, 652199, 687636, 252900, t => {
    "use strict";
    var r = t.i(416340),
        n = t.i(970624),
        o = t.i(534424);

    function a() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null,
            n = r.useContext(o.ThemeContext);
        return n && 0 !== Object.keys(n).length ? n : t
    }
    t.s(["u", 0, a], 687636);
    let i = (0, t.i(273589).c)();

    function s() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : i;
        return a(t)
    }
    t.s(["u", 0, s], 252900), t.s(["u", 0, function() {
        let t = s(n.d);
        return t[n.T] || t
    }], 652199)
}, 29750, (t, r, n) => {
    "use strict";
    var o = "function" == typeof Symbol && Symbol.for,
        a = o ? Symbol.for("react.element") : 60103,
        i = o ? Symbol.for("react.portal") : 60106,
        s = o ? Symbol.for("react.fragment") : 60107,
        l = o ? Symbol.for("react.strict_mode") : 60108,
        c = o ? Symbol.for("react.profiler") : 60114,
        u = o ? Symbol.for("react.provider") : 60109,
        f = o ? Symbol.for("react.context") : 60110,
        d = o ? Symbol.for("react.async_mode") : 60111,
        p = o ? Symbol.for("react.concurrent_mode") : 60111,
        h = o ? Symbol.for("react.forward_ref") : 60112,
        m = o ? Symbol.for("react.suspense") : 60113,
        y = o ? Symbol.for("react.suspense_list") : 60120,
        g = o ? Symbol.for("react.memo") : 60115,
        b = o ? Symbol.for("react.lazy") : 60116,
        v = o ? Symbol.for("react.block") : 60121,
        x = o ? Symbol.for("react.fundamental") : 60117,
        k = o ? Symbol.for("react.responder") : 60118,
        w = o ? Symbol.for("react.scope") : 60119;

    function O(t) {
        if ("object" == typeof t && null !== t) {
            var r = t.$$typeof;
            switch (r) {
                case a:
                    switch (t = t.type) {
                        case d:
                        case p:
                        case s:
                        case c:
                        case l:
                        case m:
                            return t;
                        default:
                            switch (t = t && t.$$typeof) {
                                case f:
                                case h:
                                case b:
                                case g:
                                case u:
                                    return t;
                                default:
                                    return r
                            }
                    }
                case i:
                    return r
            }
        }
    }

    function S(t) {
        return O(t) === p
    }
    n.AsyncMode = d, n.ConcurrentMode = p, n.ContextConsumer = f, n.ContextProvider = u, n.Element = a, n.ForwardRef = h, n.Fragment = s, n.Lazy = b, n.Memo = g, n.Portal = i, n.Profiler = c, n.StrictMode = l, n.Suspense = m, n.isAsyncMode = function(t) {
        return S(t) || O(t) === d
    }, n.isConcurrentMode = S, n.isContextConsumer = function(t) {
        return O(t) === f
    }, n.isContextProvider = function(t) {
        return O(t) === u
    }, n.isElement = function(t) {
        return "object" == typeof t && null !== t && t.$$typeof === a
    }, n.isForwardRef = function(t) {
        return O(t) === h
    }, n.isFragment = function(t) {
        return O(t) === s
    }, n.isLazy = function(t) {
        return O(t) === b
    }, n.isMemo = function(t) {
        return O(t) === g
    }, n.isPortal = function(t) {
        return O(t) === i
    }, n.isProfiler = function(t) {
        return O(t) === c
    }, n.isStrictMode = function(t) {
        return O(t) === l
    }, n.isSuspense = function(t) {
        return O(t) === m
    }, n.isValidElementType = function(t) {
        return "string" == typeof t || "function" == typeof t || t === s || t === p || t === c || t === l || t === m || t === y || "object" == typeof t && null !== t && (t.$$typeof === b || t.$$typeof === g || t.$$typeof === u || t.$$typeof === f || t.$$typeof === h || t.$$typeof === x || t.$$typeof === k || t.$$typeof === w || t.$$typeof === v)
    }, n.typeOf = O
}, 213784, (t, r, n) => {
    "use strict";
    r.exports = t.r(29750)
}, 781979, (t, r, n) => {
    "use strict";
    var o = t.r(213784),
        a = {
            childContextTypes: !0,
            contextType: !0,
            contextTypes: !0,
            defaultProps: !0,
            displayName: !0,
            getDefaultProps: !0,
            getDerivedStateFromError: !0,
            getDerivedStateFromProps: !0,
            mixins: !0,
            propTypes: !0,
            type: !0
        },
        i = {
            name: !0,
            length: !0,
            prototype: !0,
            caller: !0,
            callee: !0,
            arguments: !0,
            arity: !0
        },
        s = {
            $$typeof: !0,
            compare: !0,
            defaultProps: !0,
            displayName: !0,
            propTypes: !0,
            type: !0
        },
        l = {};

    function c(t) {
        return o.isMemo(t) ? s : l[t.$$typeof] || a
    }
    l[o.ForwardRef] = {
        $$typeof: !0,
        render: !0,
        defaultProps: !0,
        displayName: !0,
        propTypes: !0
    }, l[o.Memo] = s;
    var u = Object.defineProperty,
        f = Object.getOwnPropertyNames,
        d = Object.getOwnPropertySymbols,
        p = Object.getOwnPropertyDescriptor,
        h = Object.getPrototypeOf,
        m = Object.prototype;
    r.exports = function t(r, n, o) {
        if ("string" != typeof n) {
            if (m) {
                var a = h(n);
                a && a !== m && t(r, a, o)
            }
            var s = f(n);
            d && (s = s.concat(d(n)));
            for (var l = c(r), y = c(n), g = 0; g < s.length; ++g) {
                var b = s[g];
                if (!i[b] && !(o && o[b]) && !(y && y[b]) && !(l && l[b])) {
                    var v = p(n, b);
                    try {
                        u(r, b, v)
                    } catch (t) {}
                }
            }
        }
        return r
    }
}]);

//# debugId=aa6b0abd-f534-a3c8-32f5-9134918e9191
//# sourceMappingURL=1b7au1ub202tf.js.map