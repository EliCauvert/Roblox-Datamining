! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "5456a343002c1b3c11ba6cb45d8d3d89ee98513f"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "443e6e09-ff92-4f0b-9085-8f696ceaab80", e._sentryDebugIdIdentifier = "sentry-dbid-443e6e09-ff92-4f0b-9085-8f696ceaab80")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e = {},
        t = {};

    function r(n) {
        var o = t[n];
        if (void 0 !== o) return o.exports;
        var i = t[n] = {
            exports: {}
        };
        return e[n](i, i.exports, r), i.exports
    }
    r.d = function(e, t) {
        for (var n in t) r.o(t, n) && !r.o(e, n) && Object.defineProperty(e, n, {
            enumerable: !0,
            get: t[n]
        })
    }, r.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, r.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, r.rv = function() {
        return "1.5.7"
    }, r.ruid = "bundler=rspack@1.5.7";
    var n = {};

    function o(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    r.r(n), r.d(n, {
        default: function() {
            return E
        }
    });
    var i = function(e, t) {
        var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
        if ("string" == typeof e) r[e] = t;
        else {
            var n = function(e) {
                    if (Array.isArray(e)) return o(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return o(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                i = n.pop(),
                a = r,
                l = !0,
                u = !1,
                s = void 0;
            try {
                for (var c, f = n[Symbol.iterator](); !(l = (c = f.next()).done); l = !0) {
                    var p, m = c.value;
                    null != (p = a)[m] || (p[m] = {}), a = a[m]
                }
            } catch (e) {
                u = !0, s = e
            } finally {
                try {
                    l || null == f.return || f.return()
                } finally {
                    if (u) throw s
                }
            }
            a[i] = t
        }
    };

    function a(e, t, r) {
        this.locales = e, this.formats = t, this.pluralFn = r
    }

    function l(e) {
        this.id = e
    }

    function u(e, t, r, n, o) {
        this.id = e, this.useOrdinal = t, this.offset = r, this.options = n, this.pluralFn = o
    }

    function s(e, t, r, n) {
        this.id = e, this.offset = t, this.numberFormat = r, this.string = n
    }

    function c(e, t) {
        this.id = e, this.options = t
    }
    a.prototype.compile = function(e) {
        return this.pluralStack = [], this.currentPlural = null, this.pluralNumberFormat = null, this.compileMessage(e)
    }, a.prototype.compileMessage = function(e) {
        if (!(e && "messageFormatPattern" === e.type)) throw Error('Message AST is not of type: "messageFormatPattern"');
        var t, r, n, o = e.elements,
            i = [];
        for (t = 0, r = o.length; t < r; t += 1) switch ((n = o[t]).type) {
            case "messageTextElement":
                i.push(this.compileMessageText(n));
                break;
            case "argumentElement":
                i.push(this.compileArgument(n));
                break;
            default:
                throw Error("Message element does not have a valid type")
        }
        return i
    }, a.prototype.compileMessageText = function(e) {
        return this.currentPlural && /(^|[^\\])#/g.test(e.value) ? (this.pluralNumberFormat || (this.pluralNumberFormat = new Intl.NumberFormat(this.locales)), new s(this.currentPlural.id, this.currentPlural.format.offset, this.pluralNumberFormat, e.value)) : e.value.replace(/\\#/g, "#")
    }, a.prototype.compileArgument = function(e) {
        var t = e.format;
        if (!t) return new l(e.id);
        var r, n = this.formats,
            o = this.locales,
            i = this.pluralFn;
        switch (t.type) {
            case "numberFormat":
                return r = n.number[t.style], {
                    id: e.id,
                    format: new Intl.NumberFormat(o, r).format
                };
            case "dateFormat":
                return r = n.date[t.style], {
                    id: e.id,
                    format: new Intl.DateTimeFormat(o, r).format
                };
            case "timeFormat":
                return r = n.time[t.style], {
                    id: e.id,
                    format: new Intl.DateTimeFormat(o, r).format
                };
            case "pluralFormat":
                return r = this.compileOptions(e), new u(e.id, t.ordinal, t.offset, r, i);
            case "selectFormat":
                return r = this.compileOptions(e), new c(e.id, r);
            default:
                throw Error("Message element does not have a valid format type")
        }
    }, a.prototype.compileOptions = function(e) {
        var t, r, n, o = e.format,
            i = o.options,
            a = {};
        for (this.pluralStack.push(this.currentPlural), this.currentPlural = "pluralFormat" === o.type ? e : null, t = 0, r = i.length; t < r; t += 1) a[(n = i[t]).selector] = this.compileMessage(n.value);
        return this.currentPlural = this.pluralStack.pop(), a
    }, l.prototype.format = function(e) {
        return e || "number" == typeof e ? "string" == typeof e ? e : String(e) : ""
    }, u.prototype.getOption = function(e) {
        var t = this.options;
        return t["=" + e] || t[this.pluralFn(e - this.offset, this.useOrdinal)] || t.other
    }, s.prototype.format = function(e) {
        var t = this.numberFormat.format(e - this.offset);
        return this.string.replace(/(^|[^\\])#/g, "$1" + t).replace(/\\#/g, "#")
    }, c.prototype.getOption = function(e) {
        var t = this.options;
        return t[e] || t.other
    };
    var f = function() {
        function e(t, r, n, o) {
            this.message = t, this.expected = r, this.found = n, this.location = o, this.name = "SyntaxError", "function" == typeof Error.captureStackTrace && Error.captureStackTrace(this, e)
        }

        function t() {
            this.constructor = e
        }
        return t.prototype = Error.prototype, e.prototype = new t, {
            SyntaxError: e,
            parse: function(t) {
                var r, n, o, i, a = arguments.length > 1 ? arguments[1] : {},
                    l = {},
                    u = {
                        start: ei
                    },
                    s = ei,
                    c = function(e) {
                        var t, r, n, o, i, a = "";
                        for (t = 0, n = e.length; t < n; t += 1)
                            for (r = 0, i = (o = e[t]).length; r < i; r += 1) a += o[r];
                        return a
                    },
                    f = /^[^ \t\n\r,.+={}#]/,
                    p = {
                        type: "class",
                        value: "[^ \\t\\n\\r,.+={}#]",
                        description: "[^ \\t\\n\\r,.+={}#]"
                    },
                    m = {
                        type: "literal",
                        value: "{",
                        description: '"{"'
                    },
                    h = {
                        type: "literal",
                        value: ",",
                        description: '","'
                    },
                    d = {
                        type: "literal",
                        value: "}",
                        description: '"}"'
                    },
                    y = "number",
                    g = {
                        type: "literal",
                        value: "number",
                        description: '"number"'
                    },
                    v = "date",
                    b = {
                        type: "literal",
                        value: "date",
                        description: '"date"'
                    },
                    w = "time",
                    F = {
                        type: "literal",
                        value: "time",
                        description: '"time"'
                    },
                    O = "plural",
                    x = {
                        type: "literal",
                        value: "plural",
                        description: '"plural"'
                    },
                    A = "selectordinal",
                    _ = {
                        type: "literal",
                        value: "selectordinal",
                        description: '"selectordinal"'
                    },
                    D = "select",
                    T = {
                        type: "literal",
                        value: "select",
                        description: '"select"'
                    },
                    C = {
                        type: "literal",
                        value: "=",
                        description: '"="'
                    },
                    k = "offset:",
                    S = {
                        type: "literal",
                        value: "offset:",
                        description: '"offset:"'
                    },
                    L = {
                        type: "other",
                        description: "whitespace"
                    },
                    j = /^[ \t\n\r]/,
                    P = {
                        type: "class",
                        value: "[ \\t\\n\\r]",
                        description: "[ \\t\\n\\r]"
                    },
                    E = {
                        type: "other",
                        description: "optionalWhitespace"
                    },
                    I = /^[0-9]/,
                    R = {
                        type: "class",
                        value: "[0-9]",
                        description: "[0-9]"
                    },
                    N = /^[0-9a-f]/i,
                    M = {
                        type: "class",
                        value: "[0-9a-f]i",
                        description: "[0-9a-f]i"
                    },
                    Z = {
                        type: "literal",
                        value: "0",
                        description: '"0"'
                    },
                    z = /^[1-9]/,
                    B = {
                        type: "class",
                        value: "[1-9]",
                        description: "[1-9]"
                    },
                    U = /^[^{}\\\0-\x1F \t\n\r]/,
                    W = {
                        type: "class",
                        value: "[^{}\\\\\\0-\\x1F\\x7f \\t\\n\\r]",
                        description: "[^{}\\\\\\0-\\x1F\\x7f \\t\\n\\r]"
                    },
                    $ = {
                        type: "literal",
                        value: "\\\\",
                        description: '"\\\\\\\\"'
                    },
                    q = {
                        type: "literal",
                        value: "\\#",
                        description: '"\\\\#"'
                    },
                    J = {
                        type: "literal",
                        value: "\\{",
                        description: '"\\\\{"'
                    },
                    Y = {
                        type: "literal",
                        value: "\\}",
                        description: '"\\\\}"'
                    },
                    G = {
                        type: "literal",
                        value: "\\u",
                        description: '"\\\\u"'
                    },
                    H = 0,
                    K = 0,
                    Q = [{
                        line: 1,
                        column: 1,
                        seenCR: !1
                    }],
                    V = 0,
                    X = [],
                    ee = 0;
                if ("startRule" in a) {
                    if (!(a.startRule in u)) throw Error("Can't start parsing from rule \"" + a.startRule + '".');
                    s = u[a.startRule]
                }

                function et() {
                    return en(K, H)
                }

                function er(e) {
                    var r, n, o = Q[e];
                    if (o) return o;
                    for (r = e - 1; !Q[r];) r--;
                    for (o = {
                            line: (o = Q[r]).line,
                            column: o.column,
                            seenCR: o.seenCR
                        }; r < e;) "\n" === (n = t.charAt(r)) ? (!o.seenCR && o.line++, o.column = 1, o.seenCR = !1) : "\r" === n || "\u2028" === n || "\u2029" === n ? (o.line++, o.column = 1, o.seenCR = !0) : (o.column++, o.seenCR = !1), r++;
                    return Q[e] = o, o
                }

                function en(e, t) {
                    var r = er(e),
                        n = er(t);
                    return {
                        start: {
                            offset: e,
                            line: r.line,
                            column: r.column
                        },
                        end: {
                            offset: t,
                            line: n.line,
                            column: n.column
                        }
                    }
                }

                function eo(e) {
                    H < V || (H > V && (V = H, X = []), X.push(e))
                }

                function ei() {
                    return ea()
                }

                function ea() {
                    var e, t, r;
                    for (e = H, t = [], r = el(); r !== l;) t.push(r), r = el();
                    return t !== l && (K = e, t = {
                        type: "messageFormatPattern",
                        elements: t,
                        location: et()
                    }), t
                }

                function el() {
                    var e, r, n;
                    return r = H, (n = function() {
                        var e, r, n, o, i, a;
                        if (e = H, r = [], n = H, (o = ef()) !== l && (i = ey()) !== l && (a = ef()) !== l ? n = o = [o, i, a] : (H = n, n = l), n !== l)
                            for (; n !== l;) r.push(n), n = H, (o = ef()) !== l && (i = ey()) !== l && (a = ef()) !== l ? n = o = [o, i, a] : (H = n, n = l);
                        else r = l;
                        return r !== l && (K = e, r = c(r)), (e = r) === l && (e = H, e = (r = ec()) !== l ? t.substring(e, H) : r), e
                    }()) !== l && (K = r, n = {
                        type: "messageTextElement",
                        value: n,
                        location: et()
                    }), (e = n) === l && (e = function() {
                        var e, r, n, o, i, a, u, s, c, C, k, S, L, j, P, E;
                        if (e = H, 123 === t.charCodeAt(H) ? (r = "{", H++) : (r = l, 0 === ee && eo(m)), r !== l)
                            if (ef() !== l)
                                if ((n = function() {
                                        var e, r, n;
                                        if ((e = eh()) === l) {
                                            if (e = H, r = [], f.test(t.charAt(H)) ? (n = t.charAt(H), H++) : (n = l, 0 === ee && eo(p)), n !== l)
                                                for (; n !== l;) r.push(n), f.test(t.charAt(H)) ? (n = t.charAt(H), H++) : (n = l, 0 === ee && eo(p));
                                            else r = l;
                                            e = r !== l ? t.substring(e, H) : r
                                        }
                                        return e
                                    }()) !== l)
                                    if (ef() !== l) {
                                        if (o = H, 44 === t.charCodeAt(H) ? (i = ",", H++) : (i = l, 0 === ee && eo(h)), i !== l && (a = ef()) !== l && ((C = H, t.substr(H, 6) === y ? (k = y, H += 6) : (k = l, 0 === ee && eo(g)), k === l && (t.substr(H, 4) === v ? (k = v, H += 4) : (k = l, 0 === ee && eo(b)), k === l && (t.substr(H, 4) === w ? (k = w, H += 4) : (k = l, 0 === ee && eo(F)))), k !== l && ef() !== l && (S = H, 44 === t.charCodeAt(H) ? (L = ",", H++) : (L = l, 0 === ee && eo(h)), L !== l && (j = ef()) !== l && (P = ey()) !== l ? S = L = [L, j, P] : (H = S, S = l), S === l && (S = null), S !== l)) ? (K = C, C = k = {
                                                type: k + "Format",
                                                style: (E = S) && E[2],
                                                location: et()
                                            }) : (H = C, C = l), (c = C) === l && (c = function() {
                                                var e, r, n, o;
                                                return (e = H, t.substr(H, 6) === O ? (r = O, H += 6) : (r = l, 0 === ee && eo(x)), r !== l && ef() !== l && (44 === t.charCodeAt(H) ? (n = ",", H++) : (n = l, 0 === ee && eo(h)), n !== l && ef() !== l && (o = es()) !== l)) ? (K = e, e = r = {
                                                    type: o.type,
                                                    ordinal: !1,
                                                    offset: o.offset || 0,
                                                    options: o.options,
                                                    location: et()
                                                }) : (H = e, e = l), e
                                            }()) === l && (c = function() {
                                                var e, r, n, o;
                                                return (e = H, t.substr(H, 13) === A ? (r = A, H += 13) : (r = l, 0 === ee && eo(_)), r !== l && ef() !== l && (44 === t.charCodeAt(H) ? (n = ",", H++) : (n = l, 0 === ee && eo(h)), n !== l && ef() !== l && (o = es()) !== l)) ? (K = e, e = r = {
                                                    type: o.type,
                                                    ordinal: !0,
                                                    offset: o.offset || 0,
                                                    options: o.options,
                                                    location: et()
                                                }) : (H = e, e = l), e
                                            }()) === l && (c = function() {
                                                var e, r, n, o, i;
                                                if (e = H, t.substr(H, 6) === D ? (r = D, H += 6) : (r = l, 0 === ee && eo(T)), r !== l)
                                                    if (ef() !== l)
                                                        if (44 === t.charCodeAt(H) ? (n = ",", H++) : (n = l, 0 === ee && eo(h)), n !== l)
                                                            if (ef() !== l) {
                                                                if (o = [], (i = eu()) !== l)
                                                                    for (; i !== l;) o.push(i), i = eu();
                                                                else o = l;
                                                                o !== l ? (K = e, e = r = {
                                                                    type: "selectFormat",
                                                                    options: o,
                                                                    location: et()
                                                                }) : (H = e, e = l)
                                                            } else H = e, e = l;
                                                else H = e, e = l;
                                                else H = e, e = l;
                                                else H = e, e = l;
                                                return e
                                            }()), (u = c) !== l) ? o = i = [i, a, u] : (H = o, o = l), o === l && (o = null), o !== l)(i = ef()) !== l && (125 === t.charCodeAt(H) ? (a = "}", H++) : (a = l, 0 === ee && eo(d)), a !== l) ? (K = e, e = r = {
                                            type: "argumentElement",
                                            id: n,
                                            format: (s = o) && s[2],
                                            location: et()
                                        }) : (H = e, e = l);
                                        else H = e, e = l
                                    } else H = e, e = l;
                        else H = e, e = l;
                        else H = e, e = l;
                        else H = e, e = l;
                        return e
                    }()), e
                }

                function eu() {
                    var e, r, n, o, i, a, u, s, c;
                    return (e = H, ef() !== l && (a = H, u = H, 61 === t.charCodeAt(H) ? (s = "=", H++) : (s = l, 0 === ee && eo(C)), s !== l && (c = eh()) !== l ? u = s = [s, c] : (H = u, u = l), (a = u !== l ? t.substring(a, H) : u) === l && (a = ey()), (r = a) !== l && ef() !== l && (123 === t.charCodeAt(H) ? (n = "{", H++) : (n = l, 0 === ee && eo(m)), n !== l && ef() !== l && (o = ea()) !== l && ef() !== l && (125 === t.charCodeAt(H) ? (i = "}", H++) : (i = l, 0 === ee && eo(d)), i !== l)))) ? (K = e, e = {
                        type: "optionalFormatPattern",
                        selector: r,
                        value: o,
                        location: et()
                    }) : (H = e, e = l), e
                }

                function es() {
                    var e, r, n, o, i, a, u;
                    if (e = H, (i = H, t.substr(H, 7) === k ? (a = k, H += 7) : (a = l, 0 === ee && eo(S)), a !== l && ef() !== l && (u = eh()) !== l) ? (K = i, i = a = u) : (H = i, i = l), (r = i) === l && (r = null), r !== l)
                        if (ef() !== l) {
                            if (n = [], (o = eu()) !== l)
                                for (; o !== l;) n.push(o), o = eu();
                            else n = l;
                            n !== l ? (K = e, e = r = {
                                type: "pluralFormat",
                                offset: r,
                                options: n,
                                location: et()
                            }) : (H = e, e = l)
                        } else H = e, e = l;
                    else H = e, e = l;
                    return e
                }

                function ec() {
                    var e, r;
                    if (ee++, e = [], j.test(t.charAt(H)) ? (r = t.charAt(H), H++) : (r = l, 0 === ee && eo(P)), r !== l)
                        for (; r !== l;) e.push(r), j.test(t.charAt(H)) ? (r = t.charAt(H), H++) : (r = l, 0 === ee && eo(P));
                    else e = l;
                    return ee--, e === l && (r = l, 0 === ee && eo(L)), e
                }

                function ef() {
                    var e, r, n;
                    for (ee++, e = H, r = [], n = ec(); n !== l;) r.push(n), n = ec();
                    return e = r !== l ? t.substring(e, H) : r, ee--, e === l && (r = l, 0 === ee && eo(E)), e
                }

                function ep() {
                    var e;
                    return I.test(t.charAt(H)) ? (e = t.charAt(H), H++) : (e = l, 0 === ee && eo(R)), e
                }

                function em() {
                    var e;
                    return N.test(t.charAt(H)) ? (e = t.charAt(H), H++) : (e = l, 0 === ee && eo(M)), e
                }

                function eh() {
                    var e, r, n, o, i, a;
                    if (e = H, 48 === t.charCodeAt(H) ? (r = "0", H++) : (r = l, 0 === ee && eo(Z)), r === l) {
                        if (r = H, n = H, z.test(t.charAt(H)) ? (o = t.charAt(H), H++) : (o = l, 0 === ee && eo(B)), o !== l) {
                            for (i = [], a = ep(); a !== l;) i.push(a), a = ep();
                            i !== l ? n = o = [o, i] : (H = n, n = l)
                        } else H = n, n = l;
                        r = n !== l ? t.substring(r, H) : n
                    }
                    return r !== l && (K = e, r = parseInt(r, 10)), r
                }

                function ed() {
                    var e, r, n, o, i, a, u, s;
                    return U.test(t.charAt(H)) ? (e = t.charAt(H), H++) : (e = l, 0 === ee && eo(W)), e === l && (e = H, "\\\\" === t.substr(H, 2) ? (r = "\\\\", H += 2) : (r = l, 0 === ee && eo($)), r !== l && (K = e, r = "\\"), (e = r) === l && (e = H, "\\#" === t.substr(H, 2) ? (r = "\\#", H += 2) : (r = l, 0 === ee && eo(q)), r !== l && (K = e, r = "\\#"), (e = r) === l && (e = H, "\\{" === t.substr(H, 2) ? (r = "\\{", H += 2) : (r = l, 0 === ee && eo(J)), r !== l && (K = e, r = "{"), (e = r) === l))) && (e = H, "\\}" === t.substr(H, 2) ? (r = "\\}", H += 2) : (r = l, 0 === ee && eo(Y)), r !== l && (K = e, r = "}"), (e = r) === l) && ((e = H, "\\u" === t.substr(H, 2) ? (r = "\\u", H += 2) : (r = l, 0 === ee && eo(G)), r !== l && (n = H, o = H, (i = em()) !== l && (a = em()) !== l && (u = em()) !== l && (s = em()) !== l ? o = i = [i, a, u, s] : (H = o, o = l), (n = o !== l ? t.substring(n, H) : o) !== l)) ? (K = e, e = r = String.fromCharCode(parseInt(n, 16))) : (H = e, e = l)), e
                }

                function ey() {
                    var e, t, r;
                    if (e = H, t = [], (r = ed()) !== l)
                        for (; r !== l;) t.push(r), r = ed();
                    else t = l;
                    return t !== l && (K = e, t = t.join("")), t
                }
                if ((i = s()) !== l && H === t.length) return i;
                throw i !== l && H < t.length && eo({
                    type: "end",
                    description: "end of input"
                }), r = X, n = V < t.length ? t.charAt(V) : null, o = V < t.length ? en(V, V + 1) : en(V, V), null !== r && function(e) {
                    var t = 1;
                    for (e.sort(function(e, t) {
                            return e.description < t.description ? -1 : +(e.description > t.description)
                        }); t < e.length;) e[t - 1] === e[t] ? e.splice(t, 1) : t++
                }(r), new e(function(e, t) {
                    var r, n = Array(e.length);
                    for (r = 0; r < e.length; r++) n[r] = e[r].description;
                    return "Expected " + (e.length > 1 ? n.slice(0, -1).join(", ") + " or " + n[e.length - 1] : n[0]) + " but " + (t ? '"' + function(e) {
                        function t(e) {
                            return e.charCodeAt(0).toString(16).toUpperCase()
                        }
                        return e.replace(/\\/g, "\\\\").replace(/"/g, '\\"').replace(/\x08/g, "\\b").replace(/\t/g, "\\t").replace(/\n/g, "\\n").replace(/\f/g, "\\f").replace(/\r/g, "\\r").replace(/[\x00-\x07\x0B\x0E\x0F]/g, function(e) {
                            return "\\x0" + t(e)
                        }).replace(/[\x10-\x1F\x80-\xFF]/g, function(e) {
                            return "\\x" + t(e)
                        }).replace(/[\u0100-\u0FFF]/g, function(e) {
                            return "\\u0" + t(e)
                        }).replace(/[\u1000-\uFFFF]/g, function(e) {
                            return "\\u" + t(e)
                        })
                    }(t) + '"' : "end of input") + " found."
                }(r, n), r, n, o)
            }
        }
    }();

    function p(e, t, r) {
        var n = "string" == typeof e ? p.__parse(e) : e;
        if (!(n && "messageFormatPattern" === n.type)) throw TypeError("A message must be provided as a String or AST.");
        r = this._mergeFormats(p.formats, r), Object.defineProperty(this, "_locale", {
            value: this._resolveLocale(t)
        });
        var o = this._findPluralRuleFunction(this._locale),
            i = this._compilePattern(n, t, r, o),
            a = this;
        this.format = function(e) {
            return a._format(i, e)
        }
    }
    Object.defineProperty(p, "formats", {
        enumerable: !0,
        value: {
            number: {
                currency: {
                    style: "currency"
                },
                percent: {
                    style: "percent"
                }
            },
            date: {
                short: {
                    month: "numeric",
                    day: "numeric",
                    year: "2-digit"
                },
                medium: {
                    month: "short",
                    day: "numeric",
                    year: "numeric"
                },
                long: {
                    month: "long",
                    day: "numeric",
                    year: "numeric"
                },
                full: {
                    weekday: "long",
                    month: "long",
                    day: "numeric",
                    year: "numeric"
                }
            },
            time: {
                short: {
                    hour: "numeric",
                    minute: "numeric"
                },
                medium: {
                    hour: "numeric",
                    minute: "numeric",
                    second: "numeric"
                },
                long: {
                    hour: "numeric",
                    minute: "numeric",
                    second: "numeric",
                    timeZoneName: "short"
                },
                full: {
                    hour: "numeric",
                    minute: "numeric",
                    second: "numeric",
                    timeZoneName: "short"
                }
            }
        }
    }), Object.defineProperty(p, "__localeData__", {
        value: Object.create(null)
    }), Object.defineProperty(p, "__addLocaleData", {
        value: function(e) {
            if (!(e && e.locale)) throw Error("Locale data provided to IntlMessageFormat is missing a `locale` property");
            p.__localeData__[e.locale.toLowerCase()] = e
        }
    }), Object.defineProperty(p, "__parse", {
        value: f.parse
    }), Object.defineProperty(p, "defaultLocale", {
        enumerable: !0,
        writable: !0,
        value: void 0
    }), p.prototype.resolvedOptions = function() {
        return {
            locale: this._locale
        }
    }, p.prototype._compilePattern = function(e, t, r, n) {
        return new a(t, r, n).compile(e)
    }, p.prototype._findPluralRuleFunction = function(e) {
        for (var t = p.__localeData__, r = t[e.toLowerCase()]; r;) {
            if (r.pluralRuleFunction) return r.pluralRuleFunction;
            r = r.parentLocale && t[r.parentLocale.toLowerCase()]
        }
        throw Error("Locale data added to IntlMessageFormat is missing a `pluralRuleFunction` for :" + e)
    }, p.prototype._format = function(e, t) {
        var r, n, o, i, a, l = "";
        for (r = 0, n = e.length; r < n; r += 1) {
            if ("string" == typeof(o = e[r])) {
                l += o;
                continue
            }
            if (i = o.id, !(t && Object.prototype.hasOwnProperty.call(t, i))) throw Error("A value must be provided for: " + i);
            a = t[i], o.options ? l += this._format(o.getOption(a), t) : l += o.format(a)
        }
        return l
    }, p.prototype._mergeFormats = function(e, t) {
        var r, n, o = {};
        for (r in e) Object.prototype.hasOwnProperty.call(e, r) && (o[r] = n = Object.create(e[r]), t && Object.prototype.hasOwnProperty.call(t, r) && Object.assign(n, t[r]));
        return o
    }, p.prototype._resolveLocale = function(e) {
        "string" == typeof e && (e = [e]), e = (e || []).concat(p.defaultLocale);
        var t, r, n, o, i = p.__localeData__;
        for (t = 0, r = e.length; t < r; t += 1)
            for (n = e[t].toLowerCase().split("-"); n.length;) {
                if (o = i[n.join("-")]) return o.locale;
                n.pop()
            }
        var a = e.pop();
        throw Error("No locale data has been added to IntlMessageFormat for: " + e.join(", ") + ", or the default locale: " + a)
    };
    var m = "RobloxLocaleCode",
        h = function() {
            try {
                var e = window.Roblox.LocalStorage;
                if ("undefined" != typeof localStorage) return e ? e.isAvailable() : localStorage && localStorage.getItem && localStorage.setItem;
                return !1
            } catch (e) {
                return !1
            }
        },
        d = ["zh-cn", "zh-tw", "ko-kr", "ja-jp"],
        y = ["zh-tw"],
        g = {
            zh_cjv: "zh_cn"
        },
        v = function(e) {
            return e.replace(/_/g, "-")
        },
        b = function(e) {
            return !!(e && d.includes(e))
        },
        w = function() {
            var e, t = h(),
                r = document.querySelector('meta[name="locale-data"]');
            return r && (e = r.dataset ? r.dataset.languageCode : r.getAttribute("data-language-code")), !e && t && (e = localStorage.getItem(m)), e || (e = "en_us"), t && localStorage.setItem(m, e), e
        },
        F = {
            short: {
                year: "numeric",
                month: "2-digit",
                day: "2-digit"
            },
            full: {
                year: "numeric",
                month: "2-digit",
                day: "2-digit",
                hour: "2-digit",
                minute: "2-digit"
            },
            time: {
                hour: "2-digit",
                minute: "2-digit"
            }
        },
        O = new Date("Aug 17 2003"),
        x = [1, 2, 3, 4, 5, 6, 7],
        A = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
        _ = [{
            year: "numeric",
            month: "short",
            day: "numeric"
        }, {
            hour: "numeric",
            minute: "numeric"
        }],
        D = {
            month: 0,
            day: 1,
            year: 2
        },
        T = ["narrow", "short", "long"],
        C = ["numeric", "2-digit", "narrow", "short", "long"],
        k = function() {
            var e;

            function t(e) {
                if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                this.locale = e, this.dateOrdering = {}
            }
            return e = [{
                    key: "getTimeZone",
                    value: function(e) {
                        return new Intl.DateTimeFormat(this.locale, e).resolvedOptions().timeZone
                    }
                }, {
                    key: "getShortDate",
                    value: function(e) {
                        return this.getCustomDateTime(e)
                    }
                }, {
                    key: "getFullDate",
                    value: function(e) {
                        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : " | ";
                        return this.getCustomDateTime(e, _["0"]) + t + this.getCustomDateTime(e, _["1"])
                    }
                }, {
                    key: "getCustomDateTime",
                    value: function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : new Date,
                            t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : void 0,
                            r = new Intl.DateTimeFormat(this.locale, t);
                        try {
                            if ("string" == typeof e || "number" == typeof e) return r.format(new Date(e));
                            return r.format(e)
                        } catch (e) {
                            return ""
                        }
                    }
                }, {
                    key: "getOrderedDateParts",
                    value: function(e) {
                        var t = this;
                        if (0 === Object.keys(this.dateOrdering).length) {
                            var r = new Intl.DateTimeFormat(this.locale, e);
                            if (this.dateOrdering = this.getDefaultDateOrdering(), r.formatToParts) {
                                var n = r.formatToParts(new Date).filter(function(e) {
                                    return "literal" !== e.type
                                });
                                3 === n.length && n.forEach(function(e, r) {
                                    t.dateOrdering[e.type] = r
                                })
                            }
                        }
                        return this.dateOrdering
                    }
                }, {
                    key: "getDefaultDateOrdering",
                    value: function() {
                        var e = this.getShortDate(O),
                            t = [{
                                type: "year",
                                index: e.indexOf("2003")
                            }, {
                                type: "month",
                                index: e.indexOf("8")
                            }, {
                                type: "day",
                                index: e.indexOf("17")
                            }];
                        return t.some(function(e) {
                            return -1 === e.index
                        }) || (t = t.sort(function(e, t) {
                            return e.index - t.index
                        })).forEach(function(e, t) {
                            D[e.type] = t
                        }), D
                    }
                }],
                function(e, t) {
                    for (var r = 0; r < t.length; r++) {
                        var n = t[r];
                        n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                    }
                }(t.prototype, e), t
        }(),
        S = function() {
            var e;

            function t(e, r) {
                if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                this.locale = e, this.currency = r
            }
            return e = [{
                    key: "getCustomNumber",
                    value: function(e, t) {
                        try {
                            return new Intl.NumberFormat(this.locale, t).format(e)
                        } catch (t) {
                            return e
                        }
                    }
                }],
                function(e, t) {
                    for (var r = 0; r < t.length; r++) {
                        var n = t[r];
                        n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                    }
                }(t.prototype, e), t
        }(),
        L = function(e, t) {
            return e < t ? -1 : +(e > t)
        },
        j = function(e, t, r) {
            return b(e) && r ? y.indexOf(e) >= 0 ? "".concat(t, " ").concat(r) : t + r : t
        };

    function P(e) {
        return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }
    p.__addLocaleData({
        locale: "en",
        pluralRuleFunction: function(e, t) {
            var r = String(e).split("."),
                n = !r[1],
                o = Number(r[0]) == e,
                i = o && r[0].slice(-1),
                a = o && r[0].slice(-2);
            return t ? 1 == i && 11 != a ? "one" : 2 == i && 12 != a ? "two" : 3 == i && 13 != a ? "few" : "other" : 1 == e && n ? "one" : "other"
        }
    }), p.defaultLocale = "en";
    var E = function() {
        var e;

        function t(e, r, n) {
            if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
            var o, i = e || w();
            this.locale = Object.prototype.hasOwnProperty.call(g, i) ? v(g[i]) : v(i), this.defaultLocale = [this.locale], this.timeZone = r || "America/Los_Angeles", this.currency = n || "USD", this.monthsList = {}, this.weekdaysList = {}, this.langSensitiveCompare = (o = this.locale, void 0 !== Intl.Collator ? new Intl.Collator(o).compare : (String.prototype.localeCompare, L)), this.dateTimeFormatter = null, this.numberFormatter = null
        }
        return e = [{
                key: "getLocale",
                value: function() {
                    return v(this.locale)
                }
            }, {
                key: "getRobloxLocale",
                value: function() {
                    return this.locale.replace(/-/g, "_")
                }
            }, {
                key: "getTimeZone",
                value: function() {
                    return this.timeZone
                }
            }, {
                key: "getCurrency",
                value: function() {
                    return this.currency
                }
            }, {
                key: "getDateTimeFormatter",
                value: function() {
                    return this.dateTimeFormatter || (this.dateTimeFormatter = new k(this.locale)), this.dateTimeFormatter
                }
            }, {
                key: "getNumberFormatter",
                value: function() {
                    return this.numberFormatter || (this.numberFormatter = new S(this.defaultLocale, this.currency)), this.numberFormatter
                }
            }, {
                key: "isAsianLanguage",
                value: function() {
                    return b(this.locale)
                }
            }, {
                key: "getFormattedDateString",
                value: function(e, t) {
                    return j(this.locale, e, t)
                }
            }, {
                key: "getMonthsI18n",
                value: function(e, t) {
                    var r, n = C.indexOf(e) > -1 ? e : "short";
                    return this.monthsList[n] && this.monthsList[n].length > 0 || (this.monthsList[n] = (r = this.locale, A.map(function(e) {
                        return new Date(2017, e - 1)
                    }).map(function(e, o) {
                        return b(r) ? {
                            value: o + 1,
                            name: j(r, o + 1, t)
                        } : {
                            value: o + 1,
                            name: Intl.DateTimeFormat(r, {
                                month: n
                            }).format(e)
                        }
                    }))), this.monthsList[n]
                }
            }, {
                key: "f",
                value: function(e, t, r) {
                    if ("string" != typeof e) throw TypeError("'message' must be a string");
                    return new p(e, this.locale, r).format(t)
                }
            }, {
                key: "d",
                value: function(e, t) {
                    var r;
                    if (console.warn("This method has been deprecated in favor of the new DateTimeFormatter API, please do not use it anymore!"), (void 0 === e ? "undefined" : P(e)) !== "object" || !Date.prototype.isPrototypeOf(e)) throw TypeError("'dateObj' must be a JavaScript date object");
                    if ("string" == typeof t || void 0 === t) r = F[t] || F.short;
                    else if ((void 0 === t ? "undefined" : P(t)) === "object") r = t;
                    else throw TypeError("'options' must be either of type string or object based on Intl.DateTimeFormat");
                    return this.getDateTimeFormatter().getCustomDateTime(e, r)
                }
            }, {
                key: "n",
                value: function(e, t) {
                    if (Number.isNaN(e)) throw TypeError("The argument 'number' must be of type number");
                    var r, n = {
                        currency: {
                            style: "currency",
                            currency: this.currency
                        },
                        percent: {
                            style: "percent",
                            maximumFractionDigits: 2
                        },
                        decimal: {
                            style: "decimal",
                            maximumFractionDigits: 2
                        }
                    };
                    if ("string" == typeof t || void 0 === t) r = n[t] || n.decimal;
                    else if ((void 0 === t ? "undefined" : P(t)) === "object") r = t;
                    else throw TypeError("'options' must be of type string or object based on Intl.NumberFormat");
                    return this.getNumberFormatter().getCustomNumber(e, r)
                }
            }, {
                key: "getWeekdaysList",
                value: function(e) {
                    var t = this,
                        r = T.indexOf(e) > -1 ? e : "short";
                    if (this.weekdaysList[r] && this.weekdaysList[r].length > 0) return this.weekdaysList[r];
                    var n = x.map(function(e) {
                        return new Date(2017, 4, e)
                    });
                    return this.weekdaysList[r] = n.map(function(e, n) {
                        return {
                            value: n + 1,
                            name: Intl.DateTimeFormat(t.locale, {
                                weekday: r
                            }).format(e)
                        }
                    }), this.weekdaysList[r]
                }
            }, {
                key: "getMonthsList",
                value: function(e) {
                    var t = this,
                        r = C.indexOf(e) > -1 ? e : "short";
                    if (this.monthsList[r] && this.monthsList[r].length > 0) return this.monthsList[r];
                    var n = A.map(function(e) {
                        return new Date(2017, e - 1)
                    });
                    return this.monthsList[r] = n.map(function(e, n) {
                        return {
                            value: n + 1,
                            name: Intl.DateTimeFormat(t.locale, {
                                month: r
                            }).format(e)
                        }
                    }), this.monthsList[r]
                }
            }],
            function(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }(t.prototype, e), t
    }();
    i(["Roblox", "core-scripts", "intl", "intl"], n), i(["Roblox", "Intl"], E)
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("InternationalCore");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/internationalCore-d9bad931e81a8152.js.map