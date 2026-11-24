;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "35169ed2-bed3-ba62-f2f8-ccd587365cb5")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 871623, e => {
    "use strict";

    function t(e, t, r) {
        this.locales = e, this.formats = t, this.pluralFn = r
    }

    function r(e) {
        this.id = e
    }

    function o(e, t, r, o, n) {
        this.id = e, this.useOrdinal = t, this.offset = r, this.options = o, this.pluralFn = n
    }

    function n(e, t, r, o) {
        this.id = e, this.offset = t, this.numberFormat = r, this.string = o
    }

    function a(e, t) {
        this.id = e, this.options = t
    }
    t.prototype.compile = function(e) {
        return this.pluralStack = [], this.currentPlural = null, this.pluralNumberFormat = null, this.compileMessage(e)
    }, t.prototype.compileMessage = function(e) {
        if (!(e && "messageFormatPattern" === e.type)) throw Error('Message AST is not of type: "messageFormatPattern"');
        var t, r, o, n = e.elements,
            a = [];
        for (t = 0, r = n.length; t < r; t += 1) switch ((o = n[t]).type) {
            case "messageTextElement":
                a.push(this.compileMessageText(o));
                break;
            case "argumentElement":
                a.push(this.compileArgument(o));
                break;
            default:
                throw Error("Message element does not have a valid type")
        }
        return a
    }, t.prototype.compileMessageText = function(e) {
        return this.currentPlural && /(^|[^\\])#/g.test(e.value) ? (this.pluralNumberFormat || (this.pluralNumberFormat = new Intl.NumberFormat(this.locales)), new n(this.currentPlural.id, this.currentPlural.format.offset, this.pluralNumberFormat, e.value)) : e.value.replace(/\\#/g, "#")
    }, t.prototype.compileArgument = function(e) {
        var t = e.format;
        if (!t) return new r(e.id);
        var n, i = this.formats,
            s = this.locales,
            l = this.pluralFn;
        switch (t.type) {
            case "numberFormat":
                return n = i.number[t.style], {
                    id: e.id,
                    format: new Intl.NumberFormat(s, n).format
                };
            case "dateFormat":
                return n = i.date[t.style], {
                    id: e.id,
                    format: new Intl.DateTimeFormat(s, n).format
                };
            case "timeFormat":
                return n = i.time[t.style], {
                    id: e.id,
                    format: new Intl.DateTimeFormat(s, n).format
                };
            case "pluralFormat":
                return n = this.compileOptions(e), new o(e.id, t.ordinal, t.offset, n, l);
            case "selectFormat":
                return n = this.compileOptions(e), new a(e.id, n);
            default:
                throw Error("Message element does not have a valid format type")
        }
    }, t.prototype.compileOptions = function(e) {
        var t, r, o, n = e.format,
            a = n.options,
            i = {};
        for (this.pluralStack.push(this.currentPlural), this.currentPlural = "pluralFormat" === n.type ? e : null, t = 0, r = a.length; t < r; t += 1) i[(o = a[t]).selector] = this.compileMessage(o.value);
        return this.currentPlural = this.pluralStack.pop(), i
    }, r.prototype.format = function(e) {
        return e || "number" == typeof e ? "string" == typeof e ? e : String(e) : ""
    }, o.prototype.getOption = function(e) {
        var t = this.options;
        return t["=" + e] || t[this.pluralFn(e - this.offset, this.useOrdinal)] || t.other
    }, n.prototype.format = function(e) {
        var t = this.numberFormat.format(e - this.offset);
        return this.string.replace(/(^|[^\\])#/g, "$1" + t).replace(/\\#/g, "#")
    }, a.prototype.getOption = function(e) {
        var t = this.options;
        return t[e] || t.other
    };
    var i = function() {
        function e(t, r, o, n) {
            this.message = t, this.expected = r, this.found = o, this.location = n, this.name = "SyntaxError", "function" == typeof Error.captureStackTrace && Error.captureStackTrace(this, e)
        }

        function t() {
            this.constructor = e
        }
        return t.prototype = Error.prototype, e.prototype = new t, {
            SyntaxError: e,
            parse: function(t) {
                var r, o, n, a, i = arguments.length > 1 ? arguments[1] : {},
                    s = {},
                    l = {
                        start: ea
                    },
                    u = ea,
                    c = function(e) {
                        var t, r, o, n, a, i = "";
                        for (t = 0, o = e.length; t < o; t += 1)
                            for (r = 0, a = (n = e[t]).length; r < a; r += 1) i += n[r];
                        return i
                    },
                    p = /^[^ \t\n\r,.+={}#]/,
                    m = {
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
                    w = "time",
                    F = {
                        type: "literal",
                        value: "time",
                        description: '"time"'
                    },
                    x = "plural",
                    C = {
                        type: "literal",
                        value: "plural",
                        description: '"plural"'
                    },
                    P = "selectordinal",
                    A = {
                        type: "literal",
                        value: "selectordinal",
                        description: '"selectordinal"'
                    },
                    O = "select",
                    D = {
                        type: "literal",
                        value: "select",
                        description: '"select"'
                    },
                    _ = {
                        type: "literal",
                        value: "=",
                        description: '"="'
                    },
                    T = "offset:",
                    j = {
                        type: "literal",
                        value: "offset:",
                        description: '"offset:"'
                    },
                    R = {
                        type: "other",
                        description: "whitespace"
                    },
                    E = /^[ \t\n\r]/,
                    L = {
                        type: "class",
                        value: "[ \\t\\n\\r]",
                        description: "[ \\t\\n\\r]"
                    },
                    S = {
                        type: "other",
                        description: "optionalWhitespace"
                    },
                    I = /^[0-9]/,
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
                    H = {
                        type: "class",
                        value: "[1-9]",
                        description: "[1-9]"
                    },
                    U = /^[^{}\\\0-\x1F \t\n\r]/,
                    B = {
                        type: "class",
                        value: "[^{}\\\\\\0-\\x1F\\x7f \\t\\n\\r]",
                        description: "[^{}\\\\\\0-\\x1F\\x7f \\t\\n\\r]"
                    },
                    K = {
                        type: "literal",
                        value: "\\\\",
                        description: '"\\\\\\\\"'
                    },
                    $ = {
                        type: "literal",
                        value: "\\#",
                        description: '"\\\\#"'
                    },
                    q = {
                        type: "literal",
                        value: "\\{",
                        description: '"\\\\{"'
                    },
                    W = {
                        type: "literal",
                        value: "\\}",
                        description: '"\\\\}"'
                    },
                    G = {
                        type: "literal",
                        value: "\\u",
                        description: '"\\\\u"'
                    },
                    J = 0,
                    V = 0,
                    Q = [{
                        line: 1,
                        column: 1,
                        seenCR: !1
                    }],
                    X = 0,
                    Y = [],
                    ee = 0;
                if ("startRule" in i) {
                    if (!(i.startRule in l)) throw Error("Can't start parsing from rule \"" + i.startRule + '".');
                    u = l[i.startRule]
                }

                function et() {
                    return eo(V, J)
                }

                function er(e) {
                    var r, o, n = Q[e];
                    if (n) return n;
                    for (r = e - 1; !Q[r];) r--;
                    for (n = {
                            line: (n = Q[r]).line,
                            column: n.column,
                            seenCR: n.seenCR
                        }; r < e;) "\n" === (o = t.charAt(r)) ? (!n.seenCR && n.line++, n.column = 1, n.seenCR = !1) : "\r" === o || "\u2028" === o || "\u2029" === o ? (n.line++, n.column = 1, n.seenCR = !0) : (n.column++, n.seenCR = !1), r++;
                    return Q[e] = n, n
                }

                function eo(e, t) {
                    var r = er(e),
                        o = er(t);
                    return {
                        start: {
                            offset: e,
                            line: r.line,
                            column: r.column
                        },
                        end: {
                            offset: t,
                            line: o.line,
                            column: o.column
                        }
                    }
                }

                function en(e) {
                    J < X || (J > X && (X = J, Y = []), Y.push(e))
                }

                function ea() {
                    return ei()
                }

                function ei() {
                    var e, t, r;
                    for (e = J, t = [], r = es(); r !== s;) t.push(r), r = es();
                    return t !== s && (V = e, t = {
                        type: "messageFormatPattern",
                        elements: t,
                        location: et()
                    }), t
                }

                function es() {
                    var e, r, o;
                    return r = J, (o = function() {
                        var e, r, o, n, a, i;
                        if (e = J, r = [], o = J, (n = ep()) !== s && (a = eg()) !== s && (i = ep()) !== s ? o = n = [n, a, i] : (J = o, o = s), o !== s)
                            for (; o !== s;) r.push(o), o = J, (n = ep()) !== s && (a = eg()) !== s && (i = ep()) !== s ? o = n = [n, a, i] : (J = o, o = s);
                        else r = s;
                        return r !== s && (V = e, r = c(r)), (e = r) === s && (e = J, e = (r = ec()) !== s ? t.substring(e, J) : r), e
                    }()) !== s && (V = r, o = {
                        type: "messageTextElement",
                        value: o,
                        location: et()
                    }), (e = o) === s && (e = function() {
                        var e, r, o, n, a, i, l, u, c, _, T, j, R, E, L, S;
                        if (e = J, 123 === t.charCodeAt(J) ? (r = "{", J++) : (r = s, 0 === ee && en(h)), r !== s)
                            if (ep() !== s)
                                if ((o = function() {
                                        var e, r, o;
                                        if ((e = ef()) === s) {
                                            if (e = J, r = [], p.test(t.charAt(J)) ? (o = t.charAt(J), J++) : (o = s, 0 === ee && en(m)), o !== s)
                                                for (; o !== s;) r.push(o), p.test(t.charAt(J)) ? (o = t.charAt(J), J++) : (o = s, 0 === ee && en(m));
                                            else r = s;
                                            e = r !== s ? t.substring(e, J) : r
                                        }
                                        return e
                                    }()) !== s)
                                    if (ep() !== s) {
                                        if (n = J, 44 === t.charCodeAt(J) ? (a = ",", J++) : (a = s, 0 === ee && en(f)), a !== s && (i = ep()) !== s && ((_ = J, t.substr(J, 6) === g ? (T = g, J += 6) : (T = s, 0 === ee && en(y)), T === s && (t.substr(J, 4) === v ? (T = v, J += 4) : (T = s, 0 === ee && en(b)), T === s && (t.substr(J, 4) === w ? (T = w, J += 4) : (T = s, 0 === ee && en(F)))), T !== s && ep() !== s && (j = J, 44 === t.charCodeAt(J) ? (R = ",", J++) : (R = s, 0 === ee && en(f)), R !== s && (E = ep()) !== s && (L = eg()) !== s ? j = R = [R, E, L] : (J = j, j = s), j === s && (j = null), j !== s)) ? (V = _, _ = T = {
                                                type: T + "Format",
                                                style: (S = j) && S[2],
                                                location: et()
                                            }) : (J = _, _ = s), (c = _) === s && (c = function() {
                                                var e, r, o, n;
                                                return (e = J, t.substr(J, 6) === x ? (r = x, J += 6) : (r = s, 0 === ee && en(C)), r !== s && ep() !== s && (44 === t.charCodeAt(J) ? (o = ",", J++) : (o = s, 0 === ee && en(f)), o !== s && ep() !== s && (n = eu()) !== s)) ? (V = e, e = r = {
                                                    type: n.type,
                                                    ordinal: !1,
                                                    offset: n.offset || 0,
                                                    options: n.options,
                                                    location: et()
                                                }) : (J = e, e = s), e
                                            }()) === s && (c = function() {
                                                var e, r, o, n;
                                                return (e = J, t.substr(J, 13) === P ? (r = P, J += 13) : (r = s, 0 === ee && en(A)), r !== s && ep() !== s && (44 === t.charCodeAt(J) ? (o = ",", J++) : (o = s, 0 === ee && en(f)), o !== s && ep() !== s && (n = eu()) !== s)) ? (V = e, e = r = {
                                                    type: n.type,
                                                    ordinal: !0,
                                                    offset: n.offset || 0,
                                                    options: n.options,
                                                    location: et()
                                                }) : (J = e, e = s), e
                                            }()) === s && (c = function() {
                                                var e, r, o, n, a;
                                                if (e = J, t.substr(J, 6) === O ? (r = O, J += 6) : (r = s, 0 === ee && en(D)), r !== s)
                                                    if (ep() !== s)
                                                        if (44 === t.charCodeAt(J) ? (o = ",", J++) : (o = s, 0 === ee && en(f)), o !== s)
                                                            if (ep() !== s) {
                                                                if (n = [], (a = el()) !== s)
                                                                    for (; a !== s;) n.push(a), a = el();
                                                                else n = s;
                                                                n !== s ? (V = e, e = r = {
                                                                    type: "selectFormat",
                                                                    options: n,
                                                                    location: et()
                                                                }) : (J = e, e = s)
                                                            } else J = e, e = s;
                                                else J = e, e = s;
                                                else J = e, e = s;
                                                else J = e, e = s;
                                                return e
                                            }()), (l = c) !== s) ? n = a = [a, i, l] : (J = n, n = s), n === s && (n = null), n !== s)(a = ep()) !== s && (125 === t.charCodeAt(J) ? (i = "}", J++) : (i = s, 0 === ee && en(d)), i !== s) ? (V = e, e = r = {
                                            type: "argumentElement",
                                            id: o,
                                            format: (u = n) && u[2],
                                            location: et()
                                        }) : (J = e, e = s);
                                        else J = e, e = s
                                    } else J = e, e = s;
                        else J = e, e = s;
                        else J = e, e = s;
                        else J = e, e = s;
                        return e
                    }()), e
                }

                function el() {
                    var e, r, o, n, a, i, l, u, c;
                    return (e = J, ep() !== s && (i = J, l = J, 61 === t.charCodeAt(J) ? (u = "=", J++) : (u = s, 0 === ee && en(_)), u !== s && (c = ef()) !== s ? l = u = [u, c] : (J = l, l = s), (i = l !== s ? t.substring(i, J) : l) === s && (i = eg()), (r = i) !== s && ep() !== s && (123 === t.charCodeAt(J) ? (o = "{", J++) : (o = s, 0 === ee && en(h)), o !== s && ep() !== s && (n = ei()) !== s && ep() !== s && (125 === t.charCodeAt(J) ? (a = "}", J++) : (a = s, 0 === ee && en(d)), a !== s)))) ? (V = e, e = {
                        type: "optionalFormatPattern",
                        selector: r,
                        value: n,
                        location: et()
                    }) : (J = e, e = s), e
                }

                function eu() {
                    var e, r, o, n, a, i, l;
                    if (e = J, (a = J, t.substr(J, 7) === T ? (i = T, J += 7) : (i = s, 0 === ee && en(j)), i !== s && ep() !== s && (l = ef()) !== s) ? (V = a, a = i = l) : (J = a, a = s), (r = a) === s && (r = null), r !== s)
                        if (ep() !== s) {
                            if (o = [], (n = el()) !== s)
                                for (; n !== s;) o.push(n), n = el();
                            else o = s;
                            o !== s ? (V = e, e = r = {
                                type: "pluralFormat",
                                offset: r,
                                options: o,
                                location: et()
                            }) : (J = e, e = s)
                        } else J = e, e = s;
                    else J = e, e = s;
                    return e
                }

                function ec() {
                    var e, r;
                    if (ee++, e = [], E.test(t.charAt(J)) ? (r = t.charAt(J), J++) : (r = s, 0 === ee && en(L)), r !== s)
                        for (; r !== s;) e.push(r), E.test(t.charAt(J)) ? (r = t.charAt(J), J++) : (r = s, 0 === ee && en(L));
                    else e = s;
                    return ee--, e === s && (r = s, 0 === ee && en(R)), e
                }

                function ep() {
                    var e, r, o;
                    for (ee++, e = J, r = [], o = ec(); o !== s;) r.push(o), o = ec();
                    return e = r !== s ? t.substring(e, J) : r, ee--, e === s && (r = s, 0 === ee && en(S)), e
                }

                function em() {
                    var e;
                    return I.test(t.charAt(J)) ? (e = t.charAt(J), J++) : (e = s, 0 === ee && en(k)), e
                }

                function eh() {
                    var e;
                    return N.test(t.charAt(J)) ? (e = t.charAt(J), J++) : (e = s, 0 === ee && en(M)), e
                }

                function ef() {
                    var e, r, o, n, a, i;
                    if (e = J, 48 === t.charCodeAt(J) ? (r = "0", J++) : (r = s, 0 === ee && en(Z)), r === s) {
                        if (r = J, o = J, z.test(t.charAt(J)) ? (n = t.charAt(J), J++) : (n = s, 0 === ee && en(H)), n !== s) {
                            for (a = [], i = em(); i !== s;) a.push(i), i = em();
                            a !== s ? o = n = [n, a] : (J = o, o = s)
                        } else J = o, o = s;
                        r = o !== s ? t.substring(r, J) : o
                    }
                    return r !== s && (V = e, r = parseInt(r, 10)), r
                }

                function ed() {
                    var e, r, o, n, a, i, l, u;
                    return U.test(t.charAt(J)) ? (e = t.charAt(J), J++) : (e = s, 0 === ee && en(B)), e === s && (e = J, "\\\\" === t.substr(J, 2) ? (r = "\\\\", J += 2) : (r = s, 0 === ee && en(K)), r !== s && (V = e, r = "\\"), (e = r) === s && (e = J, "\\#" === t.substr(J, 2) ? (r = "\\#", J += 2) : (r = s, 0 === ee && en($)), r !== s && (V = e, r = "\\#"), (e = r) === s && (e = J, "\\{" === t.substr(J, 2) ? (r = "\\{", J += 2) : (r = s, 0 === ee && en(q)), r !== s && (V = e, r = "{"), (e = r) === s))) && (e = J, "\\}" === t.substr(J, 2) ? (r = "\\}", J += 2) : (r = s, 0 === ee && en(W)), r !== s && (V = e, r = "}"), (e = r) === s) && ((e = J, "\\u" === t.substr(J, 2) ? (r = "\\u", J += 2) : (r = s, 0 === ee && en(G)), r !== s && (o = J, n = J, (a = eh()) !== s && (i = eh()) !== s && (l = eh()) !== s && (u = eh()) !== s ? n = a = [a, i, l, u] : (J = n, n = s), (o = n !== s ? t.substring(o, J) : n) !== s)) ? (V = e, e = r = String.fromCharCode(parseInt(o, 16))) : (J = e, e = s)), e
                }

                function eg() {
                    var e, t, r;
                    if (e = J, t = [], (r = ed()) !== s)
                        for (; r !== s;) t.push(r), r = ed();
                    else t = s;
                    return t !== s && (V = e, t = t.join("")), t
                }
                if ((a = u()) !== s && J === t.length) return a;
                throw a !== s && J < t.length && en({
                    type: "end",
                    description: "end of input"
                }), r = Y, o = X < t.length ? t.charAt(X) : null, n = X < t.length ? eo(X, X + 1) : eo(X, X), null !== r && function(e) {
                    var t = 1;
                    for (e.sort(function(e, t) {
                            return e.description < t.description ? -1 : +(e.description > t.description)
                        }); t < e.length;) e[t - 1] === e[t] ? e.splice(t, 1) : t++
                }(r), new e(function(e, t) {
                    var r, o = Array(e.length);
                    for (r = 0; r < e.length; r++) o[r] = e[r].description;
                    return "Expected " + (e.length > 1 ? o.slice(0, -1).join(", ") + " or " + o[e.length - 1] : o[0]) + " but " + (t ? '"' + function(e) {
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
                }(r, o), r, o, n)
            }
        }
    }();

    function s(e, t, r) {
        var o = "string" == typeof e ? s.__parse(e) : e;
        if (!(o && "messageFormatPattern" === o.type)) throw TypeError("A message must be provided as a String or AST.");
        r = this._mergeFormats(s.formats, r), Object.defineProperty(this, "_locale", {
            value: this._resolveLocale(t)
        });
        var n = this._findPluralRuleFunction(this._locale),
            a = this._compilePattern(o, t, r, n),
            i = this;
        this.format = function(e) {
            return i._format(a, e)
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
        value: function(e) {
            if (!(e && e.locale)) throw Error("Locale data provided to IntlMessageFormat is missing a `locale` property");
            s.__localeData__[e.locale.toLowerCase()] = e
        }
    }), Object.defineProperty(s, "__parse", {
        value: i.parse
    }), Object.defineProperty(s, "defaultLocale", {
        enumerable: !0,
        writable: !0,
        value: void 0
    }), s.prototype.resolvedOptions = function() {
        return {
            locale: this._locale
        }
    }, s.prototype._compilePattern = function(e, r, o, n) {
        return new t(r, o, n).compile(e)
    }, s.prototype._findPluralRuleFunction = function(e) {
        for (var t = s.__localeData__, r = t[e.toLowerCase()]; r;) {
            if (r.pluralRuleFunction) return r.pluralRuleFunction;
            r = r.parentLocale && t[r.parentLocale.toLowerCase()]
        }
        throw Error("Locale data added to IntlMessageFormat is missing a `pluralRuleFunction` for :" + e)
    }, s.prototype._format = function(e, t) {
        var r, o, n, a, i, s = "";
        for (r = 0, o = e.length; r < o; r += 1) {
            if ("string" == typeof(n = e[r])) {
                s += n;
                continue
            }
            if (a = n.id, !(t && Object.prototype.hasOwnProperty.call(t, a))) throw Error("A value must be provided for: " + a);
            i = t[a], n.options ? s += this._format(n.getOption(i), t) : s += n.format(i)
        }
        return s
    }, s.prototype._mergeFormats = function(e, t) {
        var r, o, n = {};
        for (r in e) Object.prototype.hasOwnProperty.call(e, r) && (n[r] = o = Object.create(e[r]), t && Object.prototype.hasOwnProperty.call(t, r) && Object.assign(o, t[r]));
        return n
    }, s.prototype._resolveLocale = function(e) {
        "string" == typeof e && (e = [e]), e = (e || []).concat(s.defaultLocale);
        var t, r, o, n, a = s.__localeData__;
        for (t = 0, r = e.length; t < r; t += 1)
            for (o = e[t].toLowerCase().split("-"); o.length;) {
                if (n = a[o.join("-")]) return n.locale;
                o.pop()
            }
        var i = e.pop();
        throw Error("No locale data has been added to IntlMessageFormat for: " + e.join(", ") + ", or the default locale: " + i)
    };
    let l = "RobloxLocaleCode",
        u = ["zh-cn", "zh-tw", "ko-kr", "ja-jp"],
        c = ["zh-tw"],
        p = {
            zh_cjv: "zh_cn"
        },
        m = e => !!(e && u.includes(e)),
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
        w = ["numeric", "2-digit", "narrow", "short", "long"];
    class F {
        getTimeZone(e) {
            return new Intl.DateTimeFormat(this.locale, e).resolvedOptions().timeZone
        }
        getShortDate(e) {
            return this.getCustomDateTime(e)
        }
        getFullDate(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : " | ";
            return this.getCustomDateTime(e, y[0]) + t + this.getCustomDateTime(e, y[1])
        }
        getCustomDateTime() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : new Date,
                t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : void 0,
                r = new Intl.DateTimeFormat(this.locale, t);
            try {
                if ("string" == typeof e || "number" == typeof e) return r.format(new Date(e));
                return r.format(e)
            } catch {
                return ""
            }
        }
        getOrderedDateParts(e) {
            if (0 === Object.keys(this.dateOrdering).length) {
                let t = new Intl.DateTimeFormat(this.locale, e);
                if (this.dateOrdering = this.getDefaultDateOrdering(), t.formatToParts) {
                    let e = t.formatToParts(new Date).filter(e => "literal" !== e.type);
                    3 === e.length && e.forEach((e, t) => {
                        this.dateOrdering[e.type] = t
                    })
                }
            }
            return this.dateOrdering
        }
        getDefaultDateOrdering() {
            let e = this.getShortDate(f),
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
            return t.some(e => -1 === e.index) || (t = t.sort((e, t) => e.index - t.index)).forEach((e, t) => {
                v[e.type] = t
            }), v
        }
        constructor(e) {
            this.locale = e, this.dateOrdering = {}
        }
    }
    let x = class {
            getCustomNumber(e, t) {
                try {
                    return new Intl.NumberFormat(this.locale, t).format(e)
                } catch {
                    return e
                }
            }
            constructor(e, t) {
                this.locale = e, this.currency = t
            }
        },
        C = (e, t) => e < t ? -1 : +(e > t),
        P = (e, t, r) => m(e) && r ? c.indexOf(e) >= 0 ? `${t} ${r}` : t + r : t;
    s.__addLocaleData({
        locale: "en",
        pluralRuleFunction: function(e, t) {
            var r = String(e).split("."),
                o = !r[1],
                n = Number(r[0]) == e,
                a = n && r[0].slice(-1),
                i = n && r[0].slice(-2);
            return t ? 1 == a && 11 != i ? "one" : 2 == a && 12 != i ? "two" : 3 == a && 13 != i ? "few" : "other" : 1 == e && o ? "one" : "other"
        }
    }), s.defaultLocale = "en", e.s(["default", 0, class {
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
            return this.dateTimeFormatter || (this.dateTimeFormatter = new F(this.locale)), this.dateTimeFormatter
        }
        getNumberFormatter() {
            return this.numberFormatter || (this.numberFormatter = new x(this.defaultLocale, this.currency)), this.numberFormatter
        }
        isAsianLanguage() {
            return m(this.locale)
        }
        getFormattedDateString(e, t) {
            return P(this.locale, e, t)
        }
        getMonthsI18n(e, t) {
            var r;
            let o = w.indexOf(e) > -1 ? e : "short";
            return this.monthsList[o] && this.monthsList[o].length > 0 || (this.monthsList[o] = (r = this.locale, g.map(e => new Date(2017, e - 1)).map((e, n) => m(r) ? {
                value: n + 1,
                name: P(r, n + 1, t)
            } : {
                value: n + 1,
                name: Intl.DateTimeFormat(r, {
                    month: o
                }).format(e)
            }))), this.monthsList[o]
        }
        f(e, t, r) {
            if ("string" != typeof e) throw TypeError("'message' must be a string");
            return new s(e, this.locale, r).format(t)
        }
        d(e, t) {
            let r;
            if (console.warn("This method has been deprecated in favor of the new DateTimeFormatter API, please do not use it anymore!"), "object" != typeof e || !Date.prototype.isPrototypeOf(e)) throw TypeError("'dateObj' must be a JavaScript date object");
            if ("string" == typeof t || void 0 === t) r = h[t] || h.short;
            else if ("object" == typeof t) r = t;
            else throw TypeError("'options' must be either of type string or object based on Intl.DateTimeFormat");
            return this.getDateTimeFormatter().getCustomDateTime(e, r)
        }
        n(e, t) {
            let r;
            if (Number.isNaN(e)) throw TypeError("The argument 'number' must be of type number");
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
            if ("string" == typeof t || void 0 === t) r = o[t] || o.decimal;
            else if ("object" == typeof t) r = t;
            else throw TypeError("'options' must be of type string or object based on Intl.NumberFormat");
            return this.getNumberFormatter().getCustomNumber(e, r)
        }
        getWeekdaysList(e) {
            let t = b.indexOf(e) > -1 ? e : "short";
            if (this.weekdaysList[t] && this.weekdaysList[t].length > 0) return this.weekdaysList[t];
            let r = d.map(e => new Date(2017, 4, e));
            return this.weekdaysList[t] = r.map((e, r) => ({
                value: r + 1,
                name: Intl.DateTimeFormat(this.locale, {
                    weekday: t
                }).format(e)
            })), this.weekdaysList[t]
        }
        getMonthsList(e) {
            let t = w.indexOf(e) > -1 ? e : "short";
            if (this.monthsList[t] && this.monthsList[t].length > 0) return this.monthsList[t];
            let r = g.map(e => new Date(2017, e - 1));
            return this.monthsList[t] = r.map((e, r) => ({
                value: r + 1,
                name: Intl.DateTimeFormat(this.locale, {
                    month: t
                }).format(e)
            })), this.monthsList[t]
        }
        constructor(e, t, r) {
            const o = e || (() => {
                let e, t = (() => {
                        try {
                            let {
                                LocalStorage: e
                            } = window.Roblox;
                            if ("u" > typeof localStorage) return e ? e.isAvailable() : localStorage && localStorage.getItem && localStorage.setItem;
                            return !1
                        } catch (e) {
                            return !1
                        }
                    })(),
                    r = document.querySelector('meta[name="locale-data"]');
                return r && (e = r.dataset ? r.dataset.languageCode : r.getAttribute("data-language-code")), !e && t && (e = localStorage.getItem(l)), e || (e = "en_us"), t && localStorage.setItem(l, e), e
            })();
            this.locale = (e => Object.prototype.hasOwnProperty.call(p, e) ? p[e].replace(/_/g, "-") : e.replace(/_/g, "-"))(o), this.defaultLocale = [this.locale], this.timeZone = t || "America/Los_Angeles", this.currency = r || "USD", this.monthsList = {}, this.weekdaysList = {}, this.langSensitiveCompare = (e => void 0 !== Intl.Collator ? new Intl.Collator(e).compare : (String.prototype.localeCompare, C))(this.locale), this.dateTimeFormatter = null, this.numberFormatter = null
        }
    }], 871623)
}, 836931, e => {
    "use strict";
    var t = e.i(357355);
    e.s(["observeIntersection", 0, (e, r) => {
        let o = t.window?.IntersectionObserver;
        if ("function" != typeof o) return () => void 0;
        let {
            elements: n,
            ...a
        } = e;
        try {
            let e = new o(r, a);
            for (let t of n) e.observe(t);
            return () => {
                e.disconnect()
            }
        } catch {}
        return () => void 0
    }, "observeVisibility", 0, (e, r) => {
        let o = t.window?.IntersectionObserver;
        if ("function" != typeof o) return () => void 0;
        let {
            element: n,
            ...a
        } = e;
        try {
            let e = new o((e, t) => {
                let [o] = e;
                r(o?.isIntersecting ?? !1, t)
            }, a);
            return e.observe(n), () => {
                e.disconnect()
            }
        } catch {}
        return () => void 0
    }])
}, 527069, e => {
    "use strict";
    e.s(["clamp", 0, function(e, t) {
        let [r, o] = t;
        return Math.min(o, Math.max(r, e))
    }])
}, 256368, 453893, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(371847),
        o = e.i(775453),
        n = e.i(539181),
        a = e.i(734988),
        i = e.i(430781),
        s = e.i(653279),
        l = e.i(5872),
        u = e.i(481010),
        c = e.i(215941),
        p = e.i(337537),
        m = e.i(396012),
        h = e.i(434205),
        f = e.i(354981),
        d = e.i(494334),
        g = e.i(73772),
        y = e.i(641501),
        v = e.i(809804),
        b = "Popover",
        [w, F] = (0, a.createContextScope)(b, [c.createPopperScope]),
        x = (0, c.createPopperScope)(),
        [C, P] = w(b),
        A = e => {
            let {
                __scopePopover: t,
                children: o,
                open: n,
                defaultOpen: a,
                onOpenChange: i,
                modal: s = !1
            } = e, l = x(t), p = r.useRef(null), [m, h] = r.useState(!1), [f = !1, g] = (0, d.useControllableState)({
                prop: n,
                defaultProp: a,
                onChange: i
            });
            return (0, v.jsx)(c.Root, {
                ...l,
                children: (0, v.jsx)(C, {
                    scope: t,
                    contentId: (0, u.useId)(),
                    triggerRef: p,
                    open: f,
                    onOpenChange: g,
                    onOpenToggle: r.useCallback(() => g(e => !e), [g]),
                    hasCustomAnchor: m,
                    onCustomAnchorAdd: r.useCallback(() => h(!0), []),
                    onCustomAnchorRemove: r.useCallback(() => h(!1), []),
                    modal: s,
                    children: o
                })
            })
        };
    A.displayName = b;
    var O = "PopoverAnchor",
        D = r.forwardRef((e, t) => {
            let {
                __scopePopover: o,
                ...n
            } = e, a = P(O, o), i = x(o), {
                onCustomAnchorAdd: s,
                onCustomAnchorRemove: l
            } = a;
            return r.useEffect(() => (s(), () => l()), [s, l]), (0, v.jsx)(c.Anchor, {
                ...i,
                ...n,
                ref: t
            })
        });
    D.displayName = O;
    var _ = "PopoverTrigger",
        T = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...a
            } = e, i = P(_, r), s = x(r), l = (0, n.useComposedRefs)(t, i.triggerRef), u = (0, v.jsx)(h.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": i.open,
                "aria-controls": i.contentId,
                "data-state": B(i.open),
                ...a,
                ref: l,
                onClick: (0, o.composeEventHandlers)(e.onClick, i.onOpenToggle)
            });
            return i.hasCustomAnchor ? u : (0, v.jsx)(c.Anchor, {
                asChild: !0,
                ...s,
                children: u
            })
        });
    T.displayName = _;
    var j = "PopoverPortal",
        [R, E] = w(j, {
            forceMount: void 0
        }),
        L = e => {
            let {
                __scopePopover: t,
                forceMount: r,
                children: o,
                container: n
            } = e, a = P(j, t);
            return (0, v.jsx)(R, {
                scope: t,
                forceMount: r,
                children: (0, v.jsx)(m.Presence, {
                    present: r || a.open,
                    children: (0, v.jsx)(p.Portal, {
                        asChild: !0,
                        container: n,
                        children: o
                    })
                })
            })
        };
    L.displayName = j;
    var S = "PopoverContent",
        I = r.forwardRef((e, t) => {
            let r = E(S, e.__scopePopover),
                {
                    forceMount: o = r.forceMount,
                    ...n
                } = e,
                a = P(S, e.__scopePopover);
            return (0, v.jsx)(m.Presence, {
                present: o || a.open,
                children: a.modal ? (0, v.jsx)(N, {
                    ...n,
                    ref: t
                }) : (0, v.jsx)(M, {
                    ...n,
                    ref: t
                })
            })
        });
    I.displayName = S;
    var k = (0, f.createSlot)("PopoverContent.RemoveScroll"),
        N = r.forwardRef((e, t) => {
            let a = P(S, e.__scopePopover),
                i = r.useRef(null),
                s = (0, n.useComposedRefs)(t, i),
                l = r.useRef(!1);
            return r.useEffect(() => {
                let e = i.current;
                if (e) return (0, g.hideOthers)(e)
            }, []), (0, v.jsx)(y.RemoveScroll, {
                as: k,
                allowPinchZoom: !0,
                children: (0, v.jsx)(Z, {
                    ...e,
                    ref: s,
                    trapFocus: a.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: (0, o.composeEventHandlers)(e.onCloseAutoFocus, e => {
                        e.preventDefault(), l.current || a.triggerRef.current?.focus()
                    }),
                    onPointerDownOutside: (0, o.composeEventHandlers)(e.onPointerDownOutside, e => {
                        let t = e.detail.originalEvent,
                            r = 0 === t.button && !0 === t.ctrlKey;
                        l.current = 2 === t.button || r
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: (0, o.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        M = r.forwardRef((e, t) => {
            let o = P(S, e.__scopePopover),
                n = r.useRef(!1),
                a = r.useRef(!1);
            return (0, v.jsx)(Z, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    e.onCloseAutoFocus?.(t), t.defaultPrevented || (n.current || o.triggerRef.current?.focus(), t.preventDefault()), n.current = !1, a.current = !1
                },
                onInteractOutside: t => {
                    e.onInteractOutside?.(t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (a.current = !0));
                    let r = t.target;
                    o.triggerRef.current?.contains(r) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && a.current && t.preventDefault()
                }
            })
        }),
        Z = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                trapFocus: o,
                onOpenAutoFocus: n,
                onCloseAutoFocus: a,
                disableOutsidePointerEvents: u,
                onEscapeKeyDown: p,
                onPointerDownOutside: m,
                onFocusOutside: h,
                onInteractOutside: f,
                ...d
            } = e, g = P(S, r), y = x(r);
            return (0, s.useFocusGuards)(), (0, v.jsx)(l.FocusScope, {
                asChild: !0,
                loop: !0,
                trapped: o,
                onMountAutoFocus: n,
                onUnmountAutoFocus: a,
                children: (0, v.jsx)(i.DismissableLayer, {
                    asChild: !0,
                    disableOutsidePointerEvents: u,
                    onInteractOutside: f,
                    onEscapeKeyDown: p,
                    onPointerDownOutside: m,
                    onFocusOutside: h,
                    onDismiss: () => g.onOpenChange(!1),
                    children: (0, v.jsx)(c.Content, {
                        "data-state": B(g.open),
                        role: "dialog",
                        id: g.contentId,
                        ...y,
                        ...d,
                        ref: t,
                        style: {
                            ...d.style,
                            "--radix-popover-content-transform-origin": "var(--radix-popper-transform-origin)",
                            "--radix-popover-content-available-width": "var(--radix-popper-available-width)",
                            "--radix-popover-content-available-height": "var(--radix-popper-available-height)",
                            "--radix-popover-trigger-width": "var(--radix-popper-anchor-width)",
                            "--radix-popover-trigger-height": "var(--radix-popper-anchor-height)"
                        }
                    })
                })
            })
        }),
        z = "PopoverClose",
        H = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...n
            } = e, a = P(z, r);
            return (0, v.jsx)(h.Primitive.button, {
                type: "button",
                ...n,
                ref: t,
                onClick: (0, o.composeEventHandlers)(e.onClick, () => a.onOpenChange(!1))
            })
        });
    H.displayName = z;
    var U = r.forwardRef((e, t) => {
        let {
            __scopePopover: r,
            ...o
        } = e, n = x(r);
        return (0, v.jsx)(c.Arrow, {
            ...n,
            ...o,
            ref: t
        })
    });

    function B(e) {
        return e ? "open" : "closed"
    }
    U.displayName = "PopoverArrow", e.s(["Anchor", 0, D, "Arrow", 0, U, "Close", 0, H, "Content", 0, I, "Portal", 0, L, "Root", 0, A, "Trigger", 0, T], 453893);
    let K = e => {
        let t = window.matchMedia?.("(pointer: coarse)")?.matches ?? !1,
            r = document.activeElement?.matches(":focus-visible");
        if (t && !r) return void e.preventDefault();
        let o = e.currentTarget?.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        o && (e.preventDefault(), o.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: o,
            onOpenChange: n,
            children: a
        } = e;
        return r.createElement(A, {
            open: t,
            defaultOpen: o,
            onOpenChange: n
        }, a)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: t,
            className: o,
            children: n
        } = e;
        return r.createElement(D, {
            asChild: t,
            className: o
        }, n)
    }, "PopoverContent", 0, function(e) {
        let {
            side: o = "bottom",
            align: n = "center",
            sideOffset: a = 4,
            className: i,
            children: s,
            ariaLabel: l,
            onOpenAutoFocus: u,
            ...c
        } = e;
        return r.createElement(L, null, r.createElement(I, {
            side: o,
            align: n,
            sideOffset: a,
            ...c,
            "aria-label": l ?? c["aria-label"],
            onOpenAutoFocus: u ?? K,
            className: (0, t.default)("foundation-web-portal-zindex", i)
        }, s))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: o,
            className: n,
            children: a
        } = e;
        return r.createElement(T, {
            asChild: t,
            disabled: o,
            className: n
        }, a)
    }], 256368)
}]);

//# debugId=35169ed2-bed3-ba62-f2f8-ccd587365cb5
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0~8xjp-1mzg2f.js.map