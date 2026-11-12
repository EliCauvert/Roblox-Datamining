;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "e4720f40-3648-4e52-f57f-cf01896049bc")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 871623, t => {
    "use strict";

    function e(t, e, r) {
        this.locales = t, this.formats = e, this.pluralFn = r
    }

    function r(t) {
        this.id = t
    }

    function o(t, e, r, o, n) {
        this.id = t, this.useOrdinal = e, this.offset = r, this.options = o, this.pluralFn = n
    }

    function n(t, e, r, o) {
        this.id = t, this.offset = e, this.numberFormat = r, this.string = o
    }

    function i(t, e) {
        this.id = t, this.options = e
    }
    e.prototype.compile = function(t) {
        return this.pluralStack = [], this.currentPlural = null, this.pluralNumberFormat = null, this.compileMessage(t)
    }, e.prototype.compileMessage = function(t) {
        if (!(t && "messageFormatPattern" === t.type)) throw Error('Message AST is not of type: "messageFormatPattern"');
        var e, r, o, n = t.elements,
            i = [];
        for (e = 0, r = n.length; e < r; e += 1) switch ((o = n[e]).type) {
            case "messageTextElement":
                i.push(this.compileMessageText(o));
                break;
            case "argumentElement":
                i.push(this.compileArgument(o));
                break;
            default:
                throw Error("Message element does not have a valid type")
        }
        return i
    }, e.prototype.compileMessageText = function(t) {
        return this.currentPlural && /(^|[^\\])#/g.test(t.value) ? (this.pluralNumberFormat || (this.pluralNumberFormat = new Intl.NumberFormat(this.locales)), new n(this.currentPlural.id, this.currentPlural.format.offset, this.pluralNumberFormat, t.value)) : t.value.replace(/\\#/g, "#")
    }, e.prototype.compileArgument = function(t) {
        var e = t.format;
        if (!e) return new r(t.id);
        var n, a = this.formats,
            s = this.locales,
            l = this.pluralFn;
        switch (e.type) {
            case "numberFormat":
                return n = a.number[e.style], {
                    id: t.id,
                    format: new Intl.NumberFormat(s, n).format
                };
            case "dateFormat":
                return n = a.date[e.style], {
                    id: t.id,
                    format: new Intl.DateTimeFormat(s, n).format
                };
            case "timeFormat":
                return n = a.time[e.style], {
                    id: t.id,
                    format: new Intl.DateTimeFormat(s, n).format
                };
            case "pluralFormat":
                return n = this.compileOptions(t), new o(t.id, e.ordinal, e.offset, n, l);
            case "selectFormat":
                return n = this.compileOptions(t), new i(t.id, n);
            default:
                throw Error("Message element does not have a valid format type")
        }
    }, e.prototype.compileOptions = function(t) {
        var e, r, o, n = t.format,
            i = n.options,
            a = {};
        for (this.pluralStack.push(this.currentPlural), this.currentPlural = "pluralFormat" === n.type ? t : null, e = 0, r = i.length; e < r; e += 1) a[(o = i[e]).selector] = this.compileMessage(o.value);
        return this.currentPlural = this.pluralStack.pop(), a
    }, r.prototype.format = function(t) {
        return t || "number" == typeof t ? "string" == typeof t ? t : String(t) : ""
    }, o.prototype.getOption = function(t) {
        var e = this.options;
        return e["=" + t] || e[this.pluralFn(t - this.offset, this.useOrdinal)] || e.other
    }, n.prototype.format = function(t) {
        var e = this.numberFormat.format(t - this.offset);
        return this.string.replace(/(^|[^\\])#/g, "$1" + e).replace(/\\#/g, "#")
    }, i.prototype.getOption = function(t) {
        var e = this.options;
        return e[t] || e.other
    };
    var a = function() {
        function t(e, r, o, n) {
            this.message = e, this.expected = r, this.found = o, this.location = n, this.name = "SyntaxError", "function" == typeof Error.captureStackTrace && Error.captureStackTrace(this, t)
        }

        function e() {
            this.constructor = t
        }
        return e.prototype = Error.prototype, t.prototype = new e, {
            SyntaxError: t,
            parse: function(e) {
                var r, o, n, i, a = arguments.length > 1 ? arguments[1] : {},
                    s = {},
                    l = {
                        start: ti
                    },
                    u = ti,
                    c = function(t) {
                        var e, r, o, n, i, a = "";
                        for (e = 0, o = t.length; e < o; e += 1)
                            for (r = 0, i = (n = t[e]).length; r < i; r += 1) a += n[r];
                        return a
                    },
                    m = /^[^ \t\n\r,.+={}#]/,
                    p = {
                        type: "class",
                        value: "[^ \\t\\n\\r,.+={}#]",
                        description: "[^ \\t\\n\\r,.+={}#]"
                    },
                    h = {
                        type: "literal",
                        value: "{",
                        description: '"{"'
                    },
                    f = {
                        type: "literal",
                        value: ",",
                        description: '","'
                    },
                    d = {
                        type: "literal",
                        value: "}",
                        description: '"}"'
                    },
                    g = "number",
                    y = {
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
                    F = "time",
                    w = {
                        type: "literal",
                        value: "time",
                        description: '"time"'
                    },
                    O = "plural",
                    _ = {
                        type: "literal",
                        value: "plural",
                        description: '"plural"'
                    },
                    A = "selectordinal",
                    T = {
                        type: "literal",
                        value: "selectordinal",
                        description: '"selectordinal"'
                    },
                    x = "select",
                    C = {
                        type: "literal",
                        value: "select",
                        description: '"select"'
                    },
                    D = {
                        type: "literal",
                        value: "=",
                        description: '"="'
                    },
                    L = "offset:",
                    P = {
                        type: "literal",
                        value: "offset:",
                        description: '"offset:"'
                    },
                    I = {
                        type: "other",
                        description: "whitespace"
                    },
                    j = /^[ \t\n\r]/,
                    S = {
                        type: "class",
                        value: "[ \\t\\n\\r]",
                        description: "[ \\t\\n\\r]"
                    },
                    E = {
                        type: "other",
                        description: "optionalWhitespace"
                    },
                    R = /^[0-9]/,
                    k = {
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
                    U = {
                        type: "class",
                        value: "[1-9]",
                        description: "[1-9]"
                    },
                    B = /^[^{}\\\0-\x1F \t\n\r]/,
                    $ = {
                        type: "class",
                        value: "[^{}\\\\\\0-\\x1F\\x7f \\t\\n\\r]",
                        description: "[^{}\\\\\\0-\\x1F\\x7f \\t\\n\\r]"
                    },
                    K = {
                        type: "literal",
                        value: "\\\\",
                        description: '"\\\\\\\\"'
                    },
                    W = {
                        type: "literal",
                        value: "\\#",
                        description: '"\\\\#"'
                    },
                    q = {
                        type: "literal",
                        value: "\\{",
                        description: '"\\\\{"'
                    },
                    J = {
                        type: "literal",
                        value: "\\}",
                        description: '"\\\\}"'
                    },
                    V = {
                        type: "literal",
                        value: "\\u",
                        description: '"\\\\u"'
                    },
                    G = 0,
                    H = 0,
                    Q = [{
                        line: 1,
                        column: 1,
                        seenCR: !1
                    }],
                    X = 0,
                    Y = [],
                    tt = 0;
                if ("startRule" in a) {
                    if (!(a.startRule in l)) throw Error("Can't start parsing from rule \"" + a.startRule + '".');
                    u = l[a.startRule]
                }

                function te() {
                    return to(H, G)
                }

                function tr(t) {
                    var r, o, n = Q[t];
                    if (n) return n;
                    for (r = t - 1; !Q[r];) r--;
                    for (n = {
                            line: (n = Q[r]).line,
                            column: n.column,
                            seenCR: n.seenCR
                        }; r < t;) "\n" === (o = e.charAt(r)) ? (!n.seenCR && n.line++, n.column = 1, n.seenCR = !1) : "\r" === o || "\u2028" === o || "\u2029" === o ? (n.line++, n.column = 1, n.seenCR = !0) : (n.column++, n.seenCR = !1), r++;
                    return Q[t] = n, n
                }

                function to(t, e) {
                    var r = tr(t),
                        o = tr(e);
                    return {
                        start: {
                            offset: t,
                            line: r.line,
                            column: r.column
                        },
                        end: {
                            offset: e,
                            line: o.line,
                            column: o.column
                        }
                    }
                }

                function tn(t) {
                    G < X || (G > X && (X = G, Y = []), Y.push(t))
                }

                function ti() {
                    return ta()
                }

                function ta() {
                    var t, e, r;
                    for (t = G, e = [], r = ts(); r !== s;) e.push(r), r = ts();
                    return e !== s && (H = t, e = {
                        type: "messageFormatPattern",
                        elements: e,
                        location: te()
                    }), e
                }

                function ts() {
                    var t, r, o;
                    return r = G, (o = function() {
                        var t, r, o, n, i, a;
                        if (t = G, r = [], o = G, (n = tm()) !== s && (i = tg()) !== s && (a = tm()) !== s ? o = n = [n, i, a] : (G = o, o = s), o !== s)
                            for (; o !== s;) r.push(o), o = G, (n = tm()) !== s && (i = tg()) !== s && (a = tm()) !== s ? o = n = [n, i, a] : (G = o, o = s);
                        else r = s;
                        return r !== s && (H = t, r = c(r)), (t = r) === s && (t = G, t = (r = tc()) !== s ? e.substring(t, G) : r), t
                    }()) !== s && (H = r, o = {
                        type: "messageTextElement",
                        value: o,
                        location: te()
                    }), (t = o) === s && (t = function() {
                        var t, r, o, n, i, a, l, u, c, D, L, P, I, j, S, E;
                        if (t = G, 123 === e.charCodeAt(G) ? (r = "{", G++) : (r = s, 0 === tt && tn(h)), r !== s)
                            if (tm() !== s)
                                if ((o = function() {
                                        var t, r, o;
                                        if ((t = tf()) === s) {
                                            if (t = G, r = [], m.test(e.charAt(G)) ? (o = e.charAt(G), G++) : (o = s, 0 === tt && tn(p)), o !== s)
                                                for (; o !== s;) r.push(o), m.test(e.charAt(G)) ? (o = e.charAt(G), G++) : (o = s, 0 === tt && tn(p));
                                            else r = s;
                                            t = r !== s ? e.substring(t, G) : r
                                        }
                                        return t
                                    }()) !== s)
                                    if (tm() !== s) {
                                        if (n = G, 44 === e.charCodeAt(G) ? (i = ",", G++) : (i = s, 0 === tt && tn(f)), i !== s && (a = tm()) !== s && ((D = G, e.substr(G, 6) === g ? (L = g, G += 6) : (L = s, 0 === tt && tn(y)), L === s && (e.substr(G, 4) === v ? (L = v, G += 4) : (L = s, 0 === tt && tn(b)), L === s && (e.substr(G, 4) === F ? (L = F, G += 4) : (L = s, 0 === tt && tn(w)))), L !== s && tm() !== s && (P = G, 44 === e.charCodeAt(G) ? (I = ",", G++) : (I = s, 0 === tt && tn(f)), I !== s && (j = tm()) !== s && (S = tg()) !== s ? P = I = [I, j, S] : (G = P, P = s), P === s && (P = null), P !== s)) ? (H = D, D = L = {
                                                type: L + "Format",
                                                style: (E = P) && E[2],
                                                location: te()
                                            }) : (G = D, D = s), (c = D) === s && (c = function() {
                                                var t, r, o, n;
                                                return (t = G, e.substr(G, 6) === O ? (r = O, G += 6) : (r = s, 0 === tt && tn(_)), r !== s && tm() !== s && (44 === e.charCodeAt(G) ? (o = ",", G++) : (o = s, 0 === tt && tn(f)), o !== s && tm() !== s && (n = tu()) !== s)) ? (H = t, t = r = {
                                                    type: n.type,
                                                    ordinal: !1,
                                                    offset: n.offset || 0,
                                                    options: n.options,
                                                    location: te()
                                                }) : (G = t, t = s), t
                                            }()) === s && (c = function() {
                                                var t, r, o, n;
                                                return (t = G, e.substr(G, 13) === A ? (r = A, G += 13) : (r = s, 0 === tt && tn(T)), r !== s && tm() !== s && (44 === e.charCodeAt(G) ? (o = ",", G++) : (o = s, 0 === tt && tn(f)), o !== s && tm() !== s && (n = tu()) !== s)) ? (H = t, t = r = {
                                                    type: n.type,
                                                    ordinal: !0,
                                                    offset: n.offset || 0,
                                                    options: n.options,
                                                    location: te()
                                                }) : (G = t, t = s), t
                                            }()) === s && (c = function() {
                                                var t, r, o, n, i;
                                                if (t = G, e.substr(G, 6) === x ? (r = x, G += 6) : (r = s, 0 === tt && tn(C)), r !== s)
                                                    if (tm() !== s)
                                                        if (44 === e.charCodeAt(G) ? (o = ",", G++) : (o = s, 0 === tt && tn(f)), o !== s)
                                                            if (tm() !== s) {
                                                                if (n = [], (i = tl()) !== s)
                                                                    for (; i !== s;) n.push(i), i = tl();
                                                                else n = s;
                                                                n !== s ? (H = t, t = r = {
                                                                    type: "selectFormat",
                                                                    options: n,
                                                                    location: te()
                                                                }) : (G = t, t = s)
                                                            } else G = t, t = s;
                                                else G = t, t = s;
                                                else G = t, t = s;
                                                else G = t, t = s;
                                                return t
                                            }()), (l = c) !== s) ? n = i = [i, a, l] : (G = n, n = s), n === s && (n = null), n !== s)(i = tm()) !== s && (125 === e.charCodeAt(G) ? (a = "}", G++) : (a = s, 0 === tt && tn(d)), a !== s) ? (H = t, t = r = {
                                            type: "argumentElement",
                                            id: o,
                                            format: (u = n) && u[2],
                                            location: te()
                                        }) : (G = t, t = s);
                                        else G = t, t = s
                                    } else G = t, t = s;
                        else G = t, t = s;
                        else G = t, t = s;
                        else G = t, t = s;
                        return t
                    }()), t
                }

                function tl() {
                    var t, r, o, n, i, a, l, u, c;
                    return (t = G, tm() !== s && (a = G, l = G, 61 === e.charCodeAt(G) ? (u = "=", G++) : (u = s, 0 === tt && tn(D)), u !== s && (c = tf()) !== s ? l = u = [u, c] : (G = l, l = s), (a = l !== s ? e.substring(a, G) : l) === s && (a = tg()), (r = a) !== s && tm() !== s && (123 === e.charCodeAt(G) ? (o = "{", G++) : (o = s, 0 === tt && tn(h)), o !== s && tm() !== s && (n = ta()) !== s && tm() !== s && (125 === e.charCodeAt(G) ? (i = "}", G++) : (i = s, 0 === tt && tn(d)), i !== s)))) ? (H = t, t = {
                        type: "optionalFormatPattern",
                        selector: r,
                        value: n,
                        location: te()
                    }) : (G = t, t = s), t
                }

                function tu() {
                    var t, r, o, n, i, a, l;
                    if (t = G, (i = G, e.substr(G, 7) === L ? (a = L, G += 7) : (a = s, 0 === tt && tn(P)), a !== s && tm() !== s && (l = tf()) !== s) ? (H = i, i = a = l) : (G = i, i = s), (r = i) === s && (r = null), r !== s)
                        if (tm() !== s) {
                            if (o = [], (n = tl()) !== s)
                                for (; n !== s;) o.push(n), n = tl();
                            else o = s;
                            o !== s ? (H = t, t = r = {
                                type: "pluralFormat",
                                offset: r,
                                options: o,
                                location: te()
                            }) : (G = t, t = s)
                        } else G = t, t = s;
                    else G = t, t = s;
                    return t
                }

                function tc() {
                    var t, r;
                    if (tt++, t = [], j.test(e.charAt(G)) ? (r = e.charAt(G), G++) : (r = s, 0 === tt && tn(S)), r !== s)
                        for (; r !== s;) t.push(r), j.test(e.charAt(G)) ? (r = e.charAt(G), G++) : (r = s, 0 === tt && tn(S));
                    else t = s;
                    return tt--, t === s && (r = s, 0 === tt && tn(I)), t
                }

                function tm() {
                    var t, r, o;
                    for (tt++, t = G, r = [], o = tc(); o !== s;) r.push(o), o = tc();
                    return t = r !== s ? e.substring(t, G) : r, tt--, t === s && (r = s, 0 === tt && tn(E)), t
                }

                function tp() {
                    var t;
                    return R.test(e.charAt(G)) ? (t = e.charAt(G), G++) : (t = s, 0 === tt && tn(k)), t
                }

                function th() {
                    var t;
                    return N.test(e.charAt(G)) ? (t = e.charAt(G), G++) : (t = s, 0 === tt && tn(M)), t
                }

                function tf() {
                    var t, r, o, n, i, a;
                    if (t = G, 48 === e.charCodeAt(G) ? (r = "0", G++) : (r = s, 0 === tt && tn(Z)), r === s) {
                        if (r = G, o = G, z.test(e.charAt(G)) ? (n = e.charAt(G), G++) : (n = s, 0 === tt && tn(U)), n !== s) {
                            for (i = [], a = tp(); a !== s;) i.push(a), a = tp();
                            i !== s ? o = n = [n, i] : (G = o, o = s)
                        } else G = o, o = s;
                        r = o !== s ? e.substring(r, G) : o
                    }
                    return r !== s && (H = t, r = parseInt(r, 10)), r
                }

                function td() {
                    var t, r, o, n, i, a, l, u;
                    return B.test(e.charAt(G)) ? (t = e.charAt(G), G++) : (t = s, 0 === tt && tn($)), t === s && (t = G, "\\\\" === e.substr(G, 2) ? (r = "\\\\", G += 2) : (r = s, 0 === tt && tn(K)), r !== s && (H = t, r = "\\"), (t = r) === s && (t = G, "\\#" === e.substr(G, 2) ? (r = "\\#", G += 2) : (r = s, 0 === tt && tn(W)), r !== s && (H = t, r = "\\#"), (t = r) === s && (t = G, "\\{" === e.substr(G, 2) ? (r = "\\{", G += 2) : (r = s, 0 === tt && tn(q)), r !== s && (H = t, r = "{"), (t = r) === s))) && (t = G, "\\}" === e.substr(G, 2) ? (r = "\\}", G += 2) : (r = s, 0 === tt && tn(J)), r !== s && (H = t, r = "}"), (t = r) === s) && ((t = G, "\\u" === e.substr(G, 2) ? (r = "\\u", G += 2) : (r = s, 0 === tt && tn(V)), r !== s && (o = G, n = G, (i = th()) !== s && (a = th()) !== s && (l = th()) !== s && (u = th()) !== s ? n = i = [i, a, l, u] : (G = n, n = s), (o = n !== s ? e.substring(o, G) : n) !== s)) ? (H = t, t = r = String.fromCharCode(parseInt(o, 16))) : (G = t, t = s)), t
                }

                function tg() {
                    var t, e, r;
                    if (t = G, e = [], (r = td()) !== s)
                        for (; r !== s;) e.push(r), r = td();
                    else e = s;
                    return e !== s && (H = t, e = e.join("")), e
                }
                if ((i = u()) !== s && G === e.length) return i;
                throw i !== s && G < e.length && tn({
                    type: "end",
                    description: "end of input"
                }), r = Y, o = X < e.length ? e.charAt(X) : null, n = X < e.length ? to(X, X + 1) : to(X, X), null !== r && function(t) {
                    var e = 1;
                    for (t.sort(function(t, e) {
                            return t.description < e.description ? -1 : +(t.description > e.description)
                        }); e < t.length;) t[e - 1] === t[e] ? t.splice(e, 1) : e++
                }(r), new t(function(t, e) {
                    var r, o = Array(t.length);
                    for (r = 0; r < t.length; r++) o[r] = t[r].description;
                    return "Expected " + (t.length > 1 ? o.slice(0, -1).join(", ") + " or " + o[t.length - 1] : o[0]) + " but " + (e ? '"' + function(t) {
                        function e(t) {
                            return t.charCodeAt(0).toString(16).toUpperCase()
                        }
                        return t.replace(/\\/g, "\\\\").replace(/"/g, '\\"').replace(/\x08/g, "\\b").replace(/\t/g, "\\t").replace(/\n/g, "\\n").replace(/\f/g, "\\f").replace(/\r/g, "\\r").replace(/[\x00-\x07\x0B\x0E\x0F]/g, function(t) {
                            return "\\x0" + e(t)
                        }).replace(/[\x10-\x1F\x80-\xFF]/g, function(t) {
                            return "\\x" + e(t)
                        }).replace(/[\u0100-\u0FFF]/g, function(t) {
                            return "\\u0" + e(t)
                        }).replace(/[\u1000-\uFFFF]/g, function(t) {
                            return "\\u" + e(t)
                        })
                    }(e) + '"' : "end of input") + " found."
                }(r, o), r, o, n)
            }
        }
    }();

    function s(t, e, r) {
        var o = "string" == typeof t ? s.__parse(t) : t;
        if (!(o && "messageFormatPattern" === o.type)) throw TypeError("A message must be provided as a String or AST.");
        r = this._mergeFormats(s.formats, r), Object.defineProperty(this, "_locale", {
            value: this._resolveLocale(e)
        });
        var n = this._findPluralRuleFunction(this._locale),
            i = this._compilePattern(o, e, r, n),
            a = this;
        this.format = function(t) {
            return a._format(i, t)
        }
    }
    Object.defineProperty(s, "formats", {
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
    }), Object.defineProperty(s, "__localeData__", {
        value: Object.create(null)
    }), Object.defineProperty(s, "__addLocaleData", {
        value: function(t) {
            if (!(t && t.locale)) throw Error("Locale data provided to IntlMessageFormat is missing a `locale` property");
            s.__localeData__[t.locale.toLowerCase()] = t
        }
    }), Object.defineProperty(s, "__parse", {
        value: a.parse
    }), Object.defineProperty(s, "defaultLocale", {
        enumerable: !0,
        writable: !0,
        value: void 0
    }), s.prototype.resolvedOptions = function() {
        return {
            locale: this._locale
        }
    }, s.prototype._compilePattern = function(t, r, o, n) {
        return new e(r, o, n).compile(t)
    }, s.prototype._findPluralRuleFunction = function(t) {
        for (var e = s.__localeData__, r = e[t.toLowerCase()]; r;) {
            if (r.pluralRuleFunction) return r.pluralRuleFunction;
            r = r.parentLocale && e[r.parentLocale.toLowerCase()]
        }
        throw Error("Locale data added to IntlMessageFormat is missing a `pluralRuleFunction` for :" + t)
    }, s.prototype._format = function(t, e) {
        var r, o, n, i, a, s = "";
        for (r = 0, o = t.length; r < o; r += 1) {
            if ("string" == typeof(n = t[r])) {
                s += n;
                continue
            }
            if (i = n.id, !(e && Object.prototype.hasOwnProperty.call(e, i))) throw Error("A value must be provided for: " + i);
            a = e[i], n.options ? s += this._format(n.getOption(a), e) : s += n.format(a)
        }
        return s
    }, s.prototype._mergeFormats = function(t, e) {
        var r, o, n = {};
        for (r in t) Object.prototype.hasOwnProperty.call(t, r) && (n[r] = o = Object.create(t[r]), e && Object.prototype.hasOwnProperty.call(e, r) && Object.assign(o, e[r]));
        return n
    }, s.prototype._resolveLocale = function(t) {
        "string" == typeof t && (t = [t]), t = (t || []).concat(s.defaultLocale);
        var e, r, o, n, i = s.__localeData__;
        for (e = 0, r = t.length; e < r; e += 1)
            for (o = t[e].toLowerCase().split("-"); o.length;) {
                if (n = i[o.join("-")]) return n.locale;
                o.pop()
            }
        var a = t.pop();
        throw Error("No locale data has been added to IntlMessageFormat for: " + t.join(", ") + ", or the default locale: " + a)
    };
    let l = "RobloxLocaleCode",
        u = ["zh-cn", "zh-tw", "ko-kr", "ja-jp"],
        c = ["zh-tw"],
        m = {
            zh_cjv: "zh_cn"
        },
        p = t => !!(t && u.includes(t)),
        h = {
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
        f = new Date("Aug 17 2003"),
        d = [1, 2, 3, 4, 5, 6, 7],
        g = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
        y = [{
            year: "numeric",
            month: "short",
            day: "numeric"
        }, {
            hour: "numeric",
            minute: "numeric"
        }],
        v = {
            month: 0,
            day: 1,
            year: 2
        },
        b = ["narrow", "short", "long"],
        F = ["numeric", "2-digit", "narrow", "short", "long"];
    class w {
        getTimeZone(t) {
            return new Intl.DateTimeFormat(this.locale, t).resolvedOptions().timeZone
        }
        getShortDate(t) {
            return this.getCustomDateTime(t)
        }
        getFullDate(t) {
            let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : " | ";
            return this.getCustomDateTime(t, y[0]) + e + this.getCustomDateTime(t, y[1])
        }
        getCustomDateTime() {
            let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : new Date,
                e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : void 0,
                r = new Intl.DateTimeFormat(this.locale, e);
            try {
                if ("string" == typeof t || "number" == typeof t) return r.format(new Date(t));
                return r.format(t)
            } catch {
                return ""
            }
        }
        getOrderedDateParts(t) {
            if (0 === Object.keys(this.dateOrdering).length) {
                let e = new Intl.DateTimeFormat(this.locale, t);
                if (this.dateOrdering = this.getDefaultDateOrdering(), e.formatToParts) {
                    let t = e.formatToParts(new Date).filter(t => "literal" !== t.type);
                    3 === t.length && t.forEach((t, e) => {
                        this.dateOrdering[t.type] = e
                    })
                }
            }
            return this.dateOrdering
        }
        getDefaultDateOrdering() {
            let t = this.getShortDate(f),
                e = [{
                    type: "year",
                    index: t.indexOf("2003")
                }, {
                    type: "month",
                    index: t.indexOf("8")
                }, {
                    type: "day",
                    index: t.indexOf("17")
                }];
            return e.some(t => -1 === t.index) || (e = e.sort((t, e) => t.index - e.index)).forEach((t, e) => {
                v[t.type] = e
            }), v
        }
        constructor(t) {
            this.locale = t, this.dateOrdering = {}
        }
    }
    let O = class {
            getCustomNumber(t, e) {
                try {
                    return new Intl.NumberFormat(this.locale, e).format(t)
                } catch {
                    return t
                }
            }
            constructor(t, e) {
                this.locale = t, this.currency = e
            }
        },
        _ = (t, e) => t < e ? -1 : +(t > e),
        A = (t, e, r) => p(t) && r ? c.indexOf(t) >= 0 ? `${e} ${r}` : e + r : e;
    s.__addLocaleData({
        locale: "en",
        pluralRuleFunction: function(t, e) {
            var r = String(t).split("."),
                o = !r[1],
                n = Number(r[0]) == t,
                i = n && r[0].slice(-1),
                a = n && r[0].slice(-2);
            return e ? 1 == i && 11 != a ? "one" : 2 == i && 12 != a ? "two" : 3 == i && 13 != a ? "few" : "other" : 1 == t && o ? "one" : "other"
        }
    }), s.defaultLocale = "en", t.s(["default", 0, class {
        getLocale() {
            return this.locale.replace(/_/g, "-")
        }
        getRobloxLocale() {
            return this.locale.replace(/-/g, "_")
        }
        getTimeZone() {
            return this.timeZone
        }
        getCurrency() {
            return this.currency
        }
        getDateTimeFormatter() {
            return this.dateTimeFormatter || (this.dateTimeFormatter = new w(this.locale)), this.dateTimeFormatter
        }
        getNumberFormatter() {
            return this.numberFormatter || (this.numberFormatter = new O(this.defaultLocale, this.currency)), this.numberFormatter
        }
        isAsianLanguage() {
            return p(this.locale)
        }
        getFormattedDateString(t, e) {
            return A(this.locale, t, e)
        }
        getMonthsI18n(t, e) {
            var r;
            let o = F.indexOf(t) > -1 ? t : "short";
            return this.monthsList[o] && this.monthsList[o].length > 0 || (this.monthsList[o] = (r = this.locale, g.map(t => new Date(2017, t - 1)).map((t, n) => p(r) ? {
                value: n + 1,
                name: A(r, n + 1, e)
            } : {
                value: n + 1,
                name: Intl.DateTimeFormat(r, {
                    month: o
                }).format(t)
            }))), this.monthsList[o]
        }
        f(t, e, r) {
            if ("string" != typeof t) throw TypeError("'message' must be a string");
            return new s(t, this.locale, r).format(e)
        }
        d(t, e) {
            let r;
            if (console.warn("This method has been deprecated in favor of the new DateTimeFormatter API, please do not use it anymore!"), "object" != typeof t || !Date.prototype.isPrototypeOf(t)) throw TypeError("'dateObj' must be a JavaScript date object");
            if ("string" == typeof e || void 0 === e) r = h[e] || h.short;
            else if ("object" == typeof e) r = e;
            else throw TypeError("'options' must be either of type string or object based on Intl.DateTimeFormat");
            return this.getDateTimeFormatter().getCustomDateTime(t, r)
        }
        n(t, e) {
            let r;
            if (Number.isNaN(t)) throw TypeError("The argument 'number' must be of type number");
            let o = {
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
            if ("string" == typeof e || void 0 === e) r = o[e] || o.decimal;
            else if ("object" == typeof e) r = e;
            else throw TypeError("'options' must be of type string or object based on Intl.NumberFormat");
            return this.getNumberFormatter().getCustomNumber(t, r)
        }
        getWeekdaysList(t) {
            let e = b.indexOf(t) > -1 ? t : "short";
            if (this.weekdaysList[e] && this.weekdaysList[e].length > 0) return this.weekdaysList[e];
            let r = d.map(t => new Date(2017, 4, t));
            return this.weekdaysList[e] = r.map((t, r) => ({
                value: r + 1,
                name: Intl.DateTimeFormat(this.locale, {
                    weekday: e
                }).format(t)
            })), this.weekdaysList[e]
        }
        getMonthsList(t) {
            let e = F.indexOf(t) > -1 ? t : "short";
            if (this.monthsList[e] && this.monthsList[e].length > 0) return this.monthsList[e];
            let r = g.map(t => new Date(2017, t - 1));
            return this.monthsList[e] = r.map((t, r) => ({
                value: r + 1,
                name: Intl.DateTimeFormat(this.locale, {
                    month: e
                }).format(t)
            })), this.monthsList[e]
        }
        constructor(t, e, r) {
            const o = t || (() => {
                let t, e = (() => {
                        try {
                            let {
                                LocalStorage: t
                            } = window.Roblox;
                            if ("u" > typeof localStorage) return t ? t.isAvailable() : localStorage && localStorage.getItem && localStorage.setItem;
                            return !1
                        } catch (t) {
                            return !1
                        }
                    })(),
                    r = document.querySelector('meta[name="locale-data"]');
                return r && (t = r.dataset ? r.dataset.languageCode : r.getAttribute("data-language-code")), !t && e && (t = localStorage.getItem(l)), t || (t = "en_us"), e && localStorage.setItem(l, t), t
            })();
            this.locale = (t => Object.prototype.hasOwnProperty.call(m, t) ? m[t].replace(/_/g, "-") : t.replace(/_/g, "-"))(o), this.defaultLocale = [this.locale], this.timeZone = e || "America/Los_Angeles", this.currency = r || "USD", this.monthsList = {}, this.weekdaysList = {}, this.langSensitiveCompare = (t => void 0 !== Intl.Collator ? new Intl.Collator(t).compare : (String.prototype.localeCompare, _))(this.locale), this.dateTimeFormatter = null, this.numberFormatter = null
        }
    }], 871623)
}, 836931, t => {
    "use strict";
    var e = t.i(357355);
    t.s(["observeIntersection", 0, (t, r) => {
        let o = e.window?.IntersectionObserver;
        if ("function" != typeof o) return () => void 0;
        let {
            elements: n,
            ...i
        } = t;
        try {
            let t = new o(r, i);
            for (let e of n) t.observe(e);
            return () => {
                t.disconnect()
            }
        } catch {}
        return () => void 0
    }, "observeVisibility", 0, (t, r) => {
        let o = e.window?.IntersectionObserver;
        if ("function" != typeof o) return () => void 0;
        let {
            element: n,
            ...i
        } = t;
        try {
            let t = new o((t, e) => {
                let [o] = t;
                r(o?.isIntersecting ?? !1, e)
            }, i);
            return t.observe(n), () => {
                t.disconnect()
            }
        } catch {}
        return () => void 0
    }])
}]);

//# debugId=e4720f40-3648-4e52-f57f-cf01896049bc
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0y1-35vxxsl5c.js.map