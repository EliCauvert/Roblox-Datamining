/*! For license information please see accountSwitcher.bundle.min.js.LICENSE.txt */ ! function() {
    var e = {
            243: function(e, n, t) {
                var r;
                e = t.nmd(e),
                    function() {
                        var o, i = "Expected a function",
                            a = "__lodash_hash_undefined__",
                            u = "__lodash_placeholder__",
                            c = 16,
                            l = 32,
                            s = 64,
                            f = 128,
                            d = 256,
                            p = 1 / 0,
                            h = 9007199254740991,
                            v = NaN,
                            g = 4294967295,
                            m = [
                                ["ary", f],
                                ["bind", 1],
                                ["bindKey", 2],
                                ["curry", 8],
                                ["curryRight", c],
                                ["flip", 512],
                                ["partial", l],
                                ["partialRight", s],
                                ["rearg", d]
                            ],
                            y = "[object Arguments]",
                            b = "[object Array]",
                            w = "[object Boolean]",
                            _ = "[object Date]",
                            S = "[object Error]",
                            E = "[object Function]",
                            A = "[object GeneratorFunction]",
                            x = "[object Map]",
                            O = "[object Number]",
                            C = "[object Object]",
                            k = "[object Promise]",
                            P = "[object RegExp]",
                            T = "[object Set]",
                            j = "[object String]",
                            R = "[object Symbol]",
                            N = "[object WeakMap]",
                            L = "[object ArrayBuffer]",
                            M = "[object DataView]",
                            I = "[object Float32Array]",
                            D = "[object Float64Array]",
                            z = "[object Int8Array]",
                            F = "[object Int16Array]",
                            B = "[object Int32Array]",
                            U = "[object Uint8Array]",
                            W = "[object Uint8ClampedArray]",
                            V = "[object Uint16Array]",
                            q = "[object Uint32Array]",
                            $ = /\b__p \+= '';/g,
                            K = /\b(__p \+=) '' \+/g,
                            H = /(__e\(.*?\)|\b__t\)) \+\n'';/g,
                            Z = /&(?:amp|lt|gt|quot|#39);/g,
                            G = /[&<>"']/g,
                            X = RegExp(Z.source),
                            Y = RegExp(G.source),
                            J = /<%-([\s\S]+?)%>/g,
                            Q = /<%([\s\S]+?)%>/g,
                            ee = /<%=([\s\S]+?)%>/g,
                            ne = /\.|\[(?:[^[\]]*|(["'])(?:(?!\1)[^\\]|\\.)*?\1)\]/,
                            te = /^\w*$/,
                            re = /[^.[\]]+|\[(?:(-?\d+(?:\.\d+)?)|(["'])((?:(?!\2)[^\\]|\\.)*?)\2)\]|(?=(?:\.|\[\])(?:\.|\[\]|$))/g,
                            oe = /[\\^$.*+?()[\]{}|]/g,
                            ie = RegExp(oe.source),
                            ae = /^\s+/,
                            ue = /\s/,
                            ce = /\{(?:\n\/\* \[wrapped with .+\] \*\/)?\n?/,
                            le = /\{\n\/\* \[wrapped with (.+)\] \*/,
                            se = /,? & /,
                            fe = /[^\x00-\x2f\x3a-\x40\x5b-\x60\x7b-\x7f]+/g,
                            de = /[()=,{}\[\]\/\s]/,
                            pe = /\\(\\)?/g,
                            he = /\$\{([^\\}]*(?:\\.[^\\}]*)*)\}/g,
                            ve = /\w*$/,
                            ge = /^[-+]0x[0-9a-f]+$/i,
                            me = /^0b[01]+$/i,
                            ye = /^\[object .+?Constructor\]$/,
                            be = /^0o[0-7]+$/i,
                            we = /^(?:0|[1-9]\d*)$/,
                            _e = /[\xc0-\xd6\xd8-\xf6\xf8-\xff\u0100-\u017f]/g,
                            Se = /($^)/,
                            Ee = /['\n\r\u2028\u2029\\]/g,
                            Ae = "\\ud800-\\udfff",
                            xe = "\\u0300-\\u036f\\ufe20-\\ufe2f\\u20d0-\\u20ff",
                            Oe = "\\u2700-\\u27bf",
                            Ce = "a-z\\xdf-\\xf6\\xf8-\\xff",
                            ke = "A-Z\\xc0-\\xd6\\xd8-\\xde",
                            Pe = "\\ufe0e\\ufe0f",
                            Te = "\\xac\\xb1\\xd7\\xf7\\x00-\\x2f\\x3a-\\x40\\x5b-\\x60\\x7b-\\xbf\\u2000-\\u206f \\t\\x0b\\f\\xa0\\ufeff\\n\\r\\u2028\\u2029\\u1680\\u180e\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2007\\u2008\\u2009\\u200a\\u202f\\u205f\\u3000",
                            je = "['’]",
                            Re = "[" + Ae + "]",
                            Ne = "[" + Te + "]",
                            Le = "[" + xe + "]",
                            Me = "\\d+",
                            Ie = "[" + Oe + "]",
                            De = "[" + Ce + "]",
                            ze = "[^" + Ae + Te + Me + Oe + Ce + ke + "]",
                            Fe = "\\ud83c[\\udffb-\\udfff]",
                            Be = "[^" + Ae + "]",
                            Ue = "(?:\\ud83c[\\udde6-\\uddff]){2}",
                            We = "[\\ud800-\\udbff][\\udc00-\\udfff]",
                            Ve = "[" + ke + "]",
                            qe = "\\u200d",
                            $e = "(?:" + De + "|" + ze + ")",
                            Ke = "(?:" + Ve + "|" + ze + ")",
                            He = "(?:['’](?:d|ll|m|re|s|t|ve))?",
                            Ze = "(?:['’](?:D|LL|M|RE|S|T|VE))?",
                            Ge = "(?:" + Le + "|" + Fe + ")" + "?",
                            Xe = "[" + Pe + "]?",
                            Ye = Xe + Ge + ("(?:" + qe + "(?:" + [Be, Ue, We].join("|") + ")" + Xe + Ge + ")*"),
                            Je = "(?:" + [Ie, Ue, We].join("|") + ")" + Ye,
                            Qe = "(?:" + [Be + Le + "?", Le, Ue, We, Re].join("|") + ")",
                            en = RegExp(je, "g"),
                            nn = RegExp(Le, "g"),
                            tn = RegExp(Fe + "(?=" + Fe + ")|" + Qe + Ye, "g"),
                            rn = RegExp([Ve + "?" + De + "+" + He + "(?=" + [Ne, Ve, "$"].join("|") + ")", Ke + "+" + Ze + "(?=" + [Ne, Ve + $e, "$"].join("|") + ")", Ve + "?" + $e + "+" + He, Ve + "+" + Ze, "\\d*(?:1ST|2ND|3RD|(?![123])\\dTH)(?=\\b|[a-z_])", "\\d*(?:1st|2nd|3rd|(?![123])\\dth)(?=\\b|[A-Z_])", Me, Je].join("|"), "g"),
                            on = RegExp("[" + qe + Ae + xe + Pe + "]"),
                            an = /[a-z][A-Z]|[A-Z]{2}[a-z]|[0-9][a-zA-Z]|[a-zA-Z][0-9]|[^a-zA-Z0-9 ]/,
                            un = ["Array", "Buffer", "DataView", "Date", "Error", "Float32Array", "Float64Array", "Function", "Int8Array", "Int16Array", "Int32Array", "Map", "Math", "Object", "Promise", "RegExp", "Set", "String", "Symbol", "TypeError", "Uint8Array", "Uint8ClampedArray", "Uint16Array", "Uint32Array", "WeakMap", "_", "clearTimeout", "isFinite", "parseInt", "setTimeout"],
                            cn = -1,
                            ln = {};
                        ln[I] = ln[D] = ln[z] = ln[F] = ln[B] = ln[U] = ln[W] = ln[V] = ln[q] = !0, ln[y] = ln[b] = ln[L] = ln[w] = ln[M] = ln[_] = ln[S] = ln[E] = ln[x] = ln[O] = ln[C] = ln[P] = ln[T] = ln[j] = ln[N] = !1;
                        var sn = {};
                        sn[y] = sn[b] = sn[L] = sn[M] = sn[w] = sn[_] = sn[I] = sn[D] = sn[z] = sn[F] = sn[B] = sn[x] = sn[O] = sn[C] = sn[P] = sn[T] = sn[j] = sn[R] = sn[U] = sn[W] = sn[V] = sn[q] = !0, sn[S] = sn[E] = sn[N] = !1;
                        var fn = {
                                "\\": "\\",
                                "'": "'",
                                "\n": "n",
                                "\r": "r",
                                "\u2028": "u2028",
                                "\u2029": "u2029"
                            },
                            dn = parseFloat,
                            pn = parseInt,
                            hn = "object" == typeof t.g && t.g && t.g.Object === Object && t.g,
                            vn = "object" == typeof self && self && self.Object === Object && self,
                            gn = hn || vn || Function("return this")(),
                            mn = n && !n.nodeType && n,
                            yn = mn && e && !e.nodeType && e,
                            bn = yn && yn.exports === mn,
                            wn = bn && hn.process,
                            _n = function() {
                                try {
                                    var e = yn && yn.require && yn.require("util").types;
                                    return e || wn && wn.binding && wn.binding("util")
                                } catch (e) {}
                            }(),
                            Sn = _n && _n.isArrayBuffer,
                            En = _n && _n.isDate,
                            An = _n && _n.isMap,
                            xn = _n && _n.isRegExp,
                            On = _n && _n.isSet,
                            Cn = _n && _n.isTypedArray;

                        function kn(e, n, t) {
                            switch (t.length) {
                                case 0:
                                    return e.call(n);
                                case 1:
                                    return e.call(n, t[0]);
                                case 2:
                                    return e.call(n, t[0], t[1]);
                                case 3:
                                    return e.call(n, t[0], t[1], t[2])
                            }
                            return e.apply(n, t)
                        }

                        function Pn(e, n, t, r) {
                            for (var o = -1, i = null == e ? 0 : e.length; ++o < i;) {
                                var a = e[o];
                                n(r, a, t(a), e)
                            }
                            return r
                        }

                        function Tn(e, n) {
                            for (var t = -1, r = null == e ? 0 : e.length; ++t < r && !1 !== n(e[t], t, e););
                            return e
                        }

                        function jn(e, n) {
                            for (var t = null == e ? 0 : e.length; t-- && !1 !== n(e[t], t, e););
                            return e
                        }

                        function Rn(e, n) {
                            for (var t = -1, r = null == e ? 0 : e.length; ++t < r;)
                                if (!n(e[t], t, e)) return !1;
                            return !0
                        }

                        function Nn(e, n) {
                            for (var t = -1, r = null == e ? 0 : e.length, o = 0, i = []; ++t < r;) {
                                var a = e[t];
                                n(a, t, e) && (i[o++] = a)
                            }
                            return i
                        }

                        function Ln(e, n) {
                            return !!(null == e ? 0 : e.length) && qn(e, n, 0) > -1
                        }

                        function Mn(e, n, t) {
                            for (var r = -1, o = null == e ? 0 : e.length; ++r < o;)
                                if (t(n, e[r])) return !0;
                            return !1
                        }

                        function In(e, n) {
                            for (var t = -1, r = null == e ? 0 : e.length, o = Array(r); ++t < r;) o[t] = n(e[t], t, e);
                            return o
                        }

                        function Dn(e, n) {
                            for (var t = -1, r = n.length, o = e.length; ++t < r;) e[o + t] = n[t];
                            return e
                        }

                        function zn(e, n, t, r) {
                            var o = -1,
                                i = null == e ? 0 : e.length;
                            for (r && i && (t = e[++o]); ++o < i;) t = n(t, e[o], o, e);
                            return t
                        }

                        function Fn(e, n, t, r) {
                            var o = null == e ? 0 : e.length;
                            for (r && o && (t = e[--o]); o--;) t = n(t, e[o], o, e);
                            return t
                        }

                        function Bn(e, n) {
                            for (var t = -1, r = null == e ? 0 : e.length; ++t < r;)
                                if (n(e[t], t, e)) return !0;
                            return !1
                        }
                        var Un = Zn("length");

                        function Wn(e, n, t) {
                            var r;
                            return t(e, (function(e, t, o) {
                                if (n(e, t, o)) return r = t, !1
                            })), r
                        }

                        function Vn(e, n, t, r) {
                            for (var o = e.length, i = t + (r ? 1 : -1); r ? i-- : ++i < o;)
                                if (n(e[i], i, e)) return i;
                            return -1
                        }

                        function qn(e, n, t) {
                            return n == n ? function(e, n, t) {
                                var r = t - 1,
                                    o = e.length;
                                for (; ++r < o;)
                                    if (e[r] === n) return r;
                                return -1
                            }(e, n, t) : Vn(e, Kn, t)
                        }

                        function $n(e, n, t, r) {
                            for (var o = t - 1, i = e.length; ++o < i;)
                                if (r(e[o], n)) return o;
                            return -1
                        }

                        function Kn(e) {
                            return e != e
                        }

                        function Hn(e, n) {
                            var t = null == e ? 0 : e.length;
                            return t ? Yn(e, n) / t : v
                        }

                        function Zn(e) {
                            return function(n) {
                                return null == n ? o : n[e]
                            }
                        }

                        function Gn(e) {
                            return function(n) {
                                return null == e ? o : e[n]
                            }
                        }

                        function Xn(e, n, t, r, o) {
                            return o(e, (function(e, o, i) {
                                t = r ? (r = !1, e) : n(t, e, o, i)
                            })), t
                        }

                        function Yn(e, n) {
                            for (var t, r = -1, i = e.length; ++r < i;) {
                                var a = n(e[r]);
                                a !== o && (t = t === o ? a : t + a)
                            }
                            return t
                        }

                        function Jn(e, n) {
                            for (var t = -1, r = Array(e); ++t < e;) r[t] = n(t);
                            return r
                        }

                        function Qn(e) {
                            return e ? e.slice(0, gt(e) + 1).replace(ae, "") : e
                        }

                        function et(e) {
                            return function(n) {
                                return e(n)
                            }
                        }

                        function nt(e, n) {
                            return In(n, (function(n) {
                                return e[n]
                            }))
                        }

                        function tt(e, n) {
                            return e.has(n)
                        }

                        function rt(e, n) {
                            for (var t = -1, r = e.length; ++t < r && qn(n, e[t], 0) > -1;);
                            return t
                        }

                        function ot(e, n) {
                            for (var t = e.length; t-- && qn(n, e[t], 0) > -1;);
                            return t
                        }
                        var it = Gn({
                                "À": "A",
                                "Á": "A",
                                "Â": "A",
                                "Ã": "A",
                                "Ä": "A",
                                "Å": "A",
                                "à": "a",
                                "á": "a",
                                "â": "a",
                                "ã": "a",
                                "ä": "a",
                                "å": "a",
                                "Ç": "C",
                                "ç": "c",
                                "Ð": "D",
                                "ð": "d",
                                "È": "E",
                                "É": "E",
                                "Ê": "E",
                                "Ë": "E",
                                "è": "e",
                                "é": "e",
                                "ê": "e",
                                "ë": "e",
                                "Ì": "I",
                                "Í": "I",
                                "Î": "I",
                                "Ï": "I",
                                "ì": "i",
                                "í": "i",
                                "î": "i",
                                "ï": "i",
                                "Ñ": "N",
                                "ñ": "n",
                                "Ò": "O",
                                "Ó": "O",
                                "Ô": "O",
                                "Õ": "O",
                                "Ö": "O",
                                "Ø": "O",
                                "ò": "o",
                                "ó": "o",
                                "ô": "o",
                                "õ": "o",
                                "ö": "o",
                                "ø": "o",
                                "Ù": "U",
                                "Ú": "U",
                                "Û": "U",
                                "Ü": "U",
                                "ù": "u",
                                "ú": "u",
                                "û": "u",
                                "ü": "u",
                                "Ý": "Y",
                                "ý": "y",
                                "ÿ": "y",
                                "Æ": "Ae",
                                "æ": "ae",
                                "Þ": "Th",
                                "þ": "th",
                                "ß": "ss",
                                "Ā": "A",
                                "Ă": "A",
                                "Ą": "A",
                                "ā": "a",
                                "ă": "a",
                                "ą": "a",
                                "Ć": "C",
                                "Ĉ": "C",
                                "Ċ": "C",
                                "Č": "C",
                                "ć": "c",
                                "ĉ": "c",
                                "ċ": "c",
                                "č": "c",
                                "Ď": "D",
                                "Đ": "D",
                                "ď": "d",
                                "đ": "d",
                                "Ē": "E",
                                "Ĕ": "E",
                                "Ė": "E",
                                "Ę": "E",
                                "Ě": "E",
                                "ē": "e",
                                "ĕ": "e",
                                "ė": "e",
                                "ę": "e",
                                "ě": "e",
                                "Ĝ": "G",
                                "Ğ": "G",
                                "Ġ": "G",
                                "Ģ": "G",
                                "ĝ": "g",
                                "ğ": "g",
                                "ġ": "g",
                                "ģ": "g",
                                "Ĥ": "H",
                                "Ħ": "H",
                                "ĥ": "h",
                                "ħ": "h",
                                "Ĩ": "I",
                                "Ī": "I",
                                "Ĭ": "I",
                                "Į": "I",
                                "İ": "I",
                                "ĩ": "i",
                                "ī": "i",
                                "ĭ": "i",
                                "į": "i",
                                "ı": "i",
                                "Ĵ": "J",
                                "ĵ": "j",
                                "Ķ": "K",
                                "ķ": "k",
                                "ĸ": "k",
                                "Ĺ": "L",
                                "Ļ": "L",
                                "Ľ": "L",
                                "Ŀ": "L",
                                "Ł": "L",
                                "ĺ": "l",
                                "ļ": "l",
                                "ľ": "l",
                                "ŀ": "l",
                                "ł": "l",
                                "Ń": "N",
                                "Ņ": "N",
                                "Ň": "N",
                                "Ŋ": "N",
                                "ń": "n",
                                "ņ": "n",
                                "ň": "n",
                                "ŋ": "n",
                                "Ō": "O",
                                "Ŏ": "O",
                                "Ő": "O",
                                "ō": "o",
                                "ŏ": "o",
                                "ő": "o",
                                "Ŕ": "R",
                                "Ŗ": "R",
                                "Ř": "R",
                                "ŕ": "r",
                                "ŗ": "r",
                                "ř": "r",
                                "Ś": "S",
                                "Ŝ": "S",
                                "Ş": "S",
                                "Š": "S",
                                "ś": "s",
                                "ŝ": "s",
                                "ş": "s",
                                "š": "s",
                                "Ţ": "T",
                                "Ť": "T",
                                "Ŧ": "T",
                                "ţ": "t",
                                "ť": "t",
                                "ŧ": "t",
                                "Ũ": "U",
                                "Ū": "U",
                                "Ŭ": "U",
                                "Ů": "U",
                                "Ű": "U",
                                "Ų": "U",
                                "ũ": "u",
                                "ū": "u",
                                "ŭ": "u",
                                "ů": "u",
                                "ű": "u",
                                "ų": "u",
                                "Ŵ": "W",
                                "ŵ": "w",
                                "Ŷ": "Y",
                                "ŷ": "y",
                                "Ÿ": "Y",
                                "Ź": "Z",
                                "Ż": "Z",
                                "Ž": "Z",
                                "ź": "z",
                                "ż": "z",
                                "ž": "z",
                                "Ĳ": "IJ",
                                "ĳ": "ij",
                                "Œ": "Oe",
                                "œ": "oe",
                                "ŉ": "'n",
                                "ſ": "s"
                            }),
                            at = Gn({
                                "&": "&amp;",
                                "<": "&lt;",
                                ">": "&gt;",
                                '"': "&quot;",
                                "'": "&#39;"
                            });

                        function ut(e) {
                            return "\\" + fn[e]
                        }

                        function ct(e) {
                            return on.test(e)
                        }

                        function lt(e) {
                            var n = -1,
                                t = Array(e.size);
                            return e.forEach((function(e, r) {
                                t[++n] = [r, e]
                            })), t
                        }

                        function st(e, n) {
                            return function(t) {
                                return e(n(t))
                            }
                        }

                        function ft(e, n) {
                            for (var t = -1, r = e.length, o = 0, i = []; ++t < r;) {
                                var a = e[t];
                                a !== n && a !== u || (e[t] = u, i[o++] = t)
                            }
                            return i
                        }

                        function dt(e) {
                            var n = -1,
                                t = Array(e.size);
                            return e.forEach((function(e) {
                                t[++n] = e
                            })), t
                        }

                        function pt(e) {
                            var n = -1,
                                t = Array(e.size);
                            return e.forEach((function(e) {
                                t[++n] = [e, e]
                            })), t
                        }

                        function ht(e) {
                            return ct(e) ? function(e) {
                                var n = tn.lastIndex = 0;
                                for (; tn.test(e);) ++n;
                                return n
                            }(e) : Un(e)
                        }

                        function vt(e) {
                            return ct(e) ? function(e) {
                                return e.match(tn) || []
                            }(e) : function(e) {
                                return e.split("")
                            }(e)
                        }

                        function gt(e) {
                            for (var n = e.length; n-- && ue.test(e.charAt(n)););
                            return n
                        }
                        var mt = Gn({
                            "&amp;": "&",
                            "&lt;": "<",
                            "&gt;": ">",
                            "&quot;": '"',
                            "&#39;": "'"
                        });
                        var yt = function e(n) {
                            var t, r = (n = null == n ? gn : yt.defaults(gn.Object(), n, yt.pick(gn, un))).Array,
                                ue = n.Date,
                                Ae = n.Error,
                                xe = n.Function,
                                Oe = n.Math,
                                Ce = n.Object,
                                ke = n.RegExp,
                                Pe = n.String,
                                Te = n.TypeError,
                                je = r.prototype,
                                Re = xe.prototype,
                                Ne = Ce.prototype,
                                Le = n["__core-js_shared__"],
                                Me = Re.toString,
                                Ie = Ne.hasOwnProperty,
                                De = 0,
                                ze = (t = /[^.]+$/.exec(Le && Le.keys && Le.keys.IE_PROTO || "")) ? "Symbol(src)_1." + t : "",
                                Fe = Ne.toString,
                                Be = Me.call(Ce),
                                Ue = gn._,
                                We = ke("^" + Me.call(Ie).replace(oe, "\\$&").replace(/hasOwnProperty|(function).*?(?=\\\()| for .+?(?=\\\])/g, "$1.*?") + "$"),
                                Ve = bn ? n.Buffer : o,
                                qe = n.Symbol,
                                $e = n.Uint8Array,
                                Ke = Ve ? Ve.allocUnsafe : o,
                                He = st(Ce.getPrototypeOf, Ce),
                                Ze = Ce.create,
                                Ge = Ne.propertyIsEnumerable,
                                Xe = je.splice,
                                Ye = qe ? qe.isConcatSpreadable : o,
                                Je = qe ? qe.iterator : o,
                                Qe = qe ? qe.toStringTag : o,
                                tn = function() {
                                    try {
                                        var e = pi(Ce, "defineProperty");
                                        return e({}, "", {}), e
                                    } catch (e) {}
                                }(),
                                on = n.clearTimeout !== gn.clearTimeout && n.clearTimeout,
                                fn = ue && ue.now !== gn.Date.now && ue.now,
                                hn = n.setTimeout !== gn.setTimeout && n.setTimeout,
                                vn = Oe.ceil,
                                mn = Oe.floor,
                                yn = Ce.getOwnPropertySymbols,
                                wn = Ve ? Ve.isBuffer : o,
                                _n = n.isFinite,
                                Un = je.join,
                                Gn = st(Ce.keys, Ce),
                                bt = Oe.max,
                                wt = Oe.min,
                                _t = ue.now,
                                St = n.parseInt,
                                Et = Oe.random,
                                At = je.reverse,
                                xt = pi(n, "DataView"),
                                Ot = pi(n, "Map"),
                                Ct = pi(n, "Promise"),
                                kt = pi(n, "Set"),
                                Pt = pi(n, "WeakMap"),
                                Tt = pi(Ce, "create"),
                                jt = Pt && new Pt,
                                Rt = {},
                                Nt = Fi(xt),
                                Lt = Fi(Ot),
                                Mt = Fi(Ct),
                                It = Fi(kt),
                                Dt = Fi(Pt),
                                zt = qe ? qe.prototype : o,
                                Ft = zt ? zt.valueOf : o,
                                Bt = zt ? zt.toString : o;

                            function Ut(e) {
                                if (tu(e) && !$a(e) && !(e instanceof $t)) {
                                    if (e instanceof qt) return e;
                                    if (Ie.call(e, "__wrapped__")) return Bi(e)
                                }
                                return new qt(e)
                            }
                            var Wt = function() {
                                function e() {}
                                return function(n) {
                                    if (!nu(n)) return {};
                                    if (Ze) return Ze(n);
                                    e.prototype = n;
                                    var t = new e;
                                    return e.prototype = o, t
                                }
                            }();

                            function Vt() {}

                            function qt(e, n) {
                                this.__wrapped__ = e, this.__actions__ = [], this.__chain__ = !!n, this.__index__ = 0, this.__values__ = o
                            }

                            function $t(e) {
                                this.__wrapped__ = e, this.__actions__ = [], this.__dir__ = 1, this.__filtered__ = !1, this.__iteratees__ = [], this.__takeCount__ = g, this.__views__ = []
                            }

                            function Kt(e) {
                                var n = -1,
                                    t = null == e ? 0 : e.length;
                                for (this.clear(); ++n < t;) {
                                    var r = e[n];
                                    this.set(r[0], r[1])
                                }
                            }

                            function Ht(e) {
                                var n = -1,
                                    t = null == e ? 0 : e.length;
                                for (this.clear(); ++n < t;) {
                                    var r = e[n];
                                    this.set(r[0], r[1])
                                }
                            }

                            function Zt(e) {
                                var n = -1,
                                    t = null == e ? 0 : e.length;
                                for (this.clear(); ++n < t;) {
                                    var r = e[n];
                                    this.set(r[0], r[1])
                                }
                            }

                            function Gt(e) {
                                var n = -1,
                                    t = null == e ? 0 : e.length;
                                for (this.__data__ = new Zt; ++n < t;) this.add(e[n])
                            }

                            function Xt(e) {
                                var n = this.__data__ = new Ht(e);
                                this.size = n.size
                            }

                            function Yt(e, n) {
                                var t = $a(e),
                                    r = !t && qa(e),
                                    o = !t && !r && Ga(e),
                                    i = !t && !r && !o && su(e),
                                    a = t || r || o || i,
                                    u = a ? Jn(e.length, Pe) : [],
                                    c = u.length;
                                for (var l in e) !n && !Ie.call(e, l) || a && ("length" == l || o && ("offset" == l || "parent" == l) || i && ("buffer" == l || "byteLength" == l || "byteOffset" == l) || wi(l, c)) || u.push(l);
                                return u
                            }

                            function Jt(e) {
                                var n = e.length;
                                return n ? e[Gr(0, n - 1)] : o
                            }

                            function Qt(e, n) {
                                return Ii(jo(e), cr(n, 0, e.length))
                            }

                            function er(e) {
                                return Ii(jo(e))
                            }

                            function nr(e, n, t) {
                                (t !== o && !Ua(e[n], t) || t === o && !(n in e)) && ar(e, n, t)
                            }

                            function tr(e, n, t) {
                                var r = e[n];
                                Ie.call(e, n) && Ua(r, t) && (t !== o || n in e) || ar(e, n, t)
                            }

                            function rr(e, n) {
                                for (var t = e.length; t--;)
                                    if (Ua(e[t][0], n)) return t;
                                return -1
                            }

                            function or(e, n, t, r) {
                                return pr(e, (function(e, o, i) {
                                    n(r, e, t(e), i)
                                })), r
                            }

                            function ir(e, n) {
                                return e && Ro(n, Ru(n), e)
                            }

                            function ar(e, n, t) {
                                "__proto__" == n && tn ? tn(e, n, {
                                    configurable: !0,
                                    enumerable: !0,
                                    value: t,
                                    writable: !0
                                }) : e[n] = t
                            }

                            function ur(e, n) {
                                for (var t = -1, i = n.length, a = r(i), u = null == e; ++t < i;) a[t] = u ? o : Cu(e, n[t]);
                                return a
                            }

                            function cr(e, n, t) {
                                return e == e && (t !== o && (e = e <= t ? e : t), n !== o && (e = e >= n ? e : n)), e
                            }

                            function lr(e, n, t, r, i, a) {
                                var u, c = 1 & n,
                                    l = 2 & n,
                                    s = 4 & n;
                                if (t && (u = i ? t(e, r, i, a) : t(e)), u !== o) return u;
                                if (!nu(e)) return e;
                                var f = $a(e);
                                if (f) {
                                    if (u = function(e) {
                                            var n = e.length,
                                                t = new e.constructor(n);
                                            n && "string" == typeof e[0] && Ie.call(e, "index") && (t.index = e.index, t.input = e.input);
                                            return t
                                        }(e), !c) return jo(e, u)
                                } else {
                                    var d = gi(e),
                                        p = d == E || d == A;
                                    if (Ga(e)) return xo(e, c);
                                    if (d == C || d == y || p && !i) {
                                        if (u = l || p ? {} : yi(e), !c) return l ? function(e, n) {
                                            return Ro(e, vi(e), n)
                                        }(e, function(e, n) {
                                            return e && Ro(n, Nu(n), e)
                                        }(u, e)) : function(e, n) {
                                            return Ro(e, hi(e), n)
                                        }(e, ir(u, e))
                                    } else {
                                        if (!sn[d]) return i ? e : {};
                                        u = function(e, n, t) {
                                            var r = e.constructor;
                                            switch (n) {
                                                case L:
                                                    return Oo(e);
                                                case w:
                                                case _:
                                                    return new r(+e);
                                                case M:
                                                    return function(e, n) {
                                                        var t = n ? Oo(e.buffer) : e.buffer;
                                                        return new e.constructor(t, e.byteOffset, e.byteLength)
                                                    }(e, t);
                                                case I:
                                                case D:
                                                case z:
                                                case F:
                                                case B:
                                                case U:
                                                case W:
                                                case V:
                                                case q:
                                                    return Co(e, t);
                                                case x:
                                                    return new r;
                                                case O:
                                                case j:
                                                    return new r(e);
                                                case P:
                                                    return function(e) {
                                                        var n = new e.constructor(e.source, ve.exec(e));
                                                        return n.lastIndex = e.lastIndex, n
                                                    }(e);
                                                case T:
                                                    return new r;
                                                case R:
                                                    return o = e, Ft ? Ce(Ft.call(o)) : {}
                                            }
                                            var o
                                        }(e, d, c)
                                    }
                                }
                                a || (a = new Xt);
                                var h = a.get(e);
                                if (h) return h;
                                a.set(e, u), uu(e) ? e.forEach((function(r) {
                                    u.add(lr(r, n, t, r, e, a))
                                })) : ru(e) && e.forEach((function(r, o) {
                                    u.set(o, lr(r, n, t, o, e, a))
                                }));
                                var v = f ? o : (s ? l ? ai : ii : l ? Nu : Ru)(e);
                                return Tn(v || e, (function(r, o) {
                                    v && (r = e[o = r]), tr(u, o, lr(r, n, t, o, e, a))
                                })), u
                            }

                            function sr(e, n, t) {
                                var r = t.length;
                                if (null == e) return !r;
                                for (e = Ce(e); r--;) {
                                    var i = t[r],
                                        a = n[i],
                                        u = e[i];
                                    if (u === o && !(i in e) || !a(u)) return !1
                                }
                                return !0
                            }

                            function fr(e, n, t) {
                                if ("function" != typeof e) throw new Te(i);
                                return Ri((function() {
                                    e.apply(o, t)
                                }), n)
                            }

                            function dr(e, n, t, r) {
                                var o = -1,
                                    i = Ln,
                                    a = !0,
                                    u = e.length,
                                    c = [],
                                    l = n.length;
                                if (!u) return c;
                                t && (n = In(n, et(t))), r ? (i = Mn, a = !1) : n.length >= 200 && (i = tt, a = !1, n = new Gt(n));
                                e: for (; ++o < u;) {
                                    var s = e[o],
                                        f = null == t ? s : t(s);
                                    if (s = r || 0 !== s ? s : 0, a && f == f) {
                                        for (var d = l; d--;)
                                            if (n[d] === f) continue e;
                                        c.push(s)
                                    } else i(n, f, r) || c.push(s)
                                }
                                return c
                            }
                            Ut.templateSettings = {
                                escape: J,
                                evaluate: Q,
                                interpolate: ee,
                                variable: "",
                                imports: {
                                    _: Ut
                                }
                            }, Ut.prototype = Vt.prototype, Ut.prototype.constructor = Ut, qt.prototype = Wt(Vt.prototype), qt.prototype.constructor = qt, $t.prototype = Wt(Vt.prototype), $t.prototype.constructor = $t, Kt.prototype.clear = function() {
                                this.__data__ = Tt ? Tt(null) : {}, this.size = 0
                            }, Kt.prototype.delete = function(e) {
                                var n = this.has(e) && delete this.__data__[e];
                                return this.size -= n ? 1 : 0, n
                            }, Kt.prototype.get = function(e) {
                                var n = this.__data__;
                                if (Tt) {
                                    var t = n[e];
                                    return t === a ? o : t
                                }
                                return Ie.call(n, e) ? n[e] : o
                            }, Kt.prototype.has = function(e) {
                                var n = this.__data__;
                                return Tt ? n[e] !== o : Ie.call(n, e)
                            }, Kt.prototype.set = function(e, n) {
                                var t = this.__data__;
                                return this.size += this.has(e) ? 0 : 1, t[e] = Tt && n === o ? a : n, this
                            }, Ht.prototype.clear = function() {
                                this.__data__ = [], this.size = 0
                            }, Ht.prototype.delete = function(e) {
                                var n = this.__data__,
                                    t = rr(n, e);
                                return !(t < 0) && (t == n.length - 1 ? n.pop() : Xe.call(n, t, 1), --this.size, !0)
                            }, Ht.prototype.get = function(e) {
                                var n = this.__data__,
                                    t = rr(n, e);
                                return t < 0 ? o : n[t][1]
                            }, Ht.prototype.has = function(e) {
                                return rr(this.__data__, e) > -1
                            }, Ht.prototype.set = function(e, n) {
                                var t = this.__data__,
                                    r = rr(t, e);
                                return r < 0 ? (++this.size, t.push([e, n])) : t[r][1] = n, this
                            }, Zt.prototype.clear = function() {
                                this.size = 0, this.__data__ = {
                                    hash: new Kt,
                                    map: new(Ot || Ht),
                                    string: new Kt
                                }
                            }, Zt.prototype.delete = function(e) {
                                var n = fi(this, e).delete(e);
                                return this.size -= n ? 1 : 0, n
                            }, Zt.prototype.get = function(e) {
                                return fi(this, e).get(e)
                            }, Zt.prototype.has = function(e) {
                                return fi(this, e).has(e)
                            }, Zt.prototype.set = function(e, n) {
                                var t = fi(this, e),
                                    r = t.size;
                                return t.set(e, n), this.size += t.size == r ? 0 : 1, this
                            }, Gt.prototype.add = Gt.prototype.push = function(e) {
                                return this.__data__.set(e, a), this
                            }, Gt.prototype.has = function(e) {
                                return this.__data__.has(e)
                            }, Xt.prototype.clear = function() {
                                this.__data__ = new Ht, this.size = 0
                            }, Xt.prototype.delete = function(e) {
                                var n = this.__data__,
                                    t = n.delete(e);
                                return this.size = n.size, t
                            }, Xt.prototype.get = function(e) {
                                return this.__data__.get(e)
                            }, Xt.prototype.has = function(e) {
                                return this.__data__.has(e)
                            }, Xt.prototype.set = function(e, n) {
                                var t = this.__data__;
                                if (t instanceof Ht) {
                                    var r = t.__data__;
                                    if (!Ot || r.length < 199) return r.push([e, n]), this.size = ++t.size, this;
                                    t = this.__data__ = new Zt(r)
                                }
                                return t.set(e, n), this.size = t.size, this
                            };
                            var pr = Mo(_r),
                                hr = Mo(Sr, !0);

                            function vr(e, n) {
                                var t = !0;
                                return pr(e, (function(e, r, o) {
                                    return t = !!n(e, r, o)
                                })), t
                            }

                            function gr(e, n, t) {
                                for (var r = -1, i = e.length; ++r < i;) {
                                    var a = e[r],
                                        u = n(a);
                                    if (null != u && (c === o ? u == u && !lu(u) : t(u, c))) var c = u,
                                        l = a
                                }
                                return l
                            }

                            function mr(e, n) {
                                var t = [];
                                return pr(e, (function(e, r, o) {
                                    n(e, r, o) && t.push(e)
                                })), t
                            }

                            function yr(e, n, t, r, o) {
                                var i = -1,
                                    a = e.length;
                                for (t || (t = bi), o || (o = []); ++i < a;) {
                                    var u = e[i];
                                    n > 0 && t(u) ? n > 1 ? yr(u, n - 1, t, r, o) : Dn(o, u) : r || (o[o.length] = u)
                                }
                                return o
                            }
                            var br = Io(),
                                wr = Io(!0);

                            function _r(e, n) {
                                return e && br(e, n, Ru)
                            }

                            function Sr(e, n) {
                                return e && wr(e, n, Ru)
                            }

                            function Er(e, n) {
                                return Nn(n, (function(n) {
                                    return Ja(e[n])
                                }))
                            }

                            function Ar(e, n) {
                                for (var t = 0, r = (n = _o(n, e)).length; null != e && t < r;) e = e[zi(n[t++])];
                                return t && t == r ? e : o
                            }

                            function xr(e, n, t) {
                                var r = n(e);
                                return $a(e) ? r : Dn(r, t(e))
                            }

                            function Or(e) {
                                return null == e ? e === o ? "[object Undefined]" : "[object Null]" : Qe && Qe in Ce(e) ? function(e) {
                                    var n = Ie.call(e, Qe),
                                        t = e[Qe];
                                    try {
                                        e[Qe] = o;
                                        var r = !0
                                    } catch (e) {}
                                    var i = Fe.call(e);
                                    r && (n ? e[Qe] = t : delete e[Qe]);
                                    return i
                                }(e) : function(e) {
                                    return Fe.call(e)
                                }(e)
                            }

                            function Cr(e, n) {
                                return e > n
                            }

                            function kr(e, n) {
                                return null != e && Ie.call(e, n)
                            }

                            function Pr(e, n) {
                                return null != e && n in Ce(e)
                            }

                            function Tr(e, n, t) {
                                for (var i = t ? Mn : Ln, a = e[0].length, u = e.length, c = u, l = r(u), s = 1 / 0, f = []; c--;) {
                                    var d = e[c];
                                    c && n && (d = In(d, et(n))), s = wt(d.length, s), l[c] = !t && (n || a >= 120 && d.length >= 120) ? new Gt(c && d) : o
                                }
                                d = e[0];
                                var p = -1,
                                    h = l[0];
                                e: for (; ++p < a && f.length < s;) {
                                    var v = d[p],
                                        g = n ? n(v) : v;
                                    if (v = t || 0 !== v ? v : 0, !(h ? tt(h, g) : i(f, g, t))) {
                                        for (c = u; --c;) {
                                            var m = l[c];
                                            if (!(m ? tt(m, g) : i(e[c], g, t))) continue e
                                        }
                                        h && h.push(g), f.push(v)
                                    }
                                }
                                return f
                            }

                            function jr(e, n, t) {
                                var r = null == (e = Pi(e, n = _o(n, e))) ? e : e[zi(Yi(n))];
                                return null == r ? o : kn(r, e, t)
                            }

                            function Rr(e) {
                                return tu(e) && Or(e) == y
                            }

                            function Nr(e, n, t, r, i) {
                                return e === n || (null == e || null == n || !tu(e) && !tu(n) ? e != e && n != n : function(e, n, t, r, i, a) {
                                    var u = $a(e),
                                        c = $a(n),
                                        l = u ? b : gi(e),
                                        s = c ? b : gi(n),
                                        f = (l = l == y ? C : l) == C,
                                        d = (s = s == y ? C : s) == C,
                                        p = l == s;
                                    if (p && Ga(e)) {
                                        if (!Ga(n)) return !1;
                                        u = !0, f = !1
                                    }
                                    if (p && !f) return a || (a = new Xt), u || su(e) ? ri(e, n, t, r, i, a) : function(e, n, t, r, o, i, a) {
                                        switch (t) {
                                            case M:
                                                if (e.byteLength != n.byteLength || e.byteOffset != n.byteOffset) return !1;
                                                e = e.buffer, n = n.buffer;
                                            case L:
                                                return !(e.byteLength != n.byteLength || !i(new $e(e), new $e(n)));
                                            case w:
                                            case _:
                                            case O:
                                                return Ua(+e, +n);
                                            case S:
                                                return e.name == n.name && e.message == n.message;
                                            case P:
                                            case j:
                                                return e == n + "";
                                            case x:
                                                var u = lt;
                                            case T:
                                                var c = 1 & r;
                                                if (u || (u = dt), e.size != n.size && !c) return !1;
                                                var l = a.get(e);
                                                if (l) return l == n;
                                                r |= 2, a.set(e, n);
                                                var s = ri(u(e), u(n), r, o, i, a);
                                                return a.delete(e), s;
                                            case R:
                                                if (Ft) return Ft.call(e) == Ft.call(n)
                                        }
                                        return !1
                                    }(e, n, l, t, r, i, a);
                                    if (!(1 & t)) {
                                        var h = f && Ie.call(e, "__wrapped__"),
                                            v = d && Ie.call(n, "__wrapped__");
                                        if (h || v) {
                                            var g = h ? e.value() : e,
                                                m = v ? n.value() : n;
                                            return a || (a = new Xt), i(g, m, t, r, a)
                                        }
                                    }
                                    if (!p) return !1;
                                    return a || (a = new Xt),
                                        function(e, n, t, r, i, a) {
                                            var u = 1 & t,
                                                c = ii(e),
                                                l = c.length,
                                                s = ii(n),
                                                f = s.length;
                                            if (l != f && !u) return !1;
                                            var d = l;
                                            for (; d--;) {
                                                var p = c[d];
                                                if (!(u ? p in n : Ie.call(n, p))) return !1
                                            }
                                            var h = a.get(e),
                                                v = a.get(n);
                                            if (h && v) return h == n && v == e;
                                            var g = !0;
                                            a.set(e, n), a.set(n, e);
                                            var m = u;
                                            for (; ++d < l;) {
                                                var y = e[p = c[d]],
                                                    b = n[p];
                                                if (r) var w = u ? r(b, y, p, n, e, a) : r(y, b, p, e, n, a);
                                                if (!(w === o ? y === b || i(y, b, t, r, a) : w)) {
                                                    g = !1;
                                                    break
                                                }
                                                m || (m = "constructor" == p)
                                            }
                                            if (g && !m) {
                                                var _ = e.constructor,
                                                    S = n.constructor;
                                                _ == S || !("constructor" in e) || !("constructor" in n) || "function" == typeof _ && _ instanceof _ && "function" == typeof S && S instanceof S || (g = !1)
                                            }
                                            return a.delete(e), a.delete(n), g
                                        }(e, n, t, r, i, a)
                                }(e, n, t, r, Nr, i))
                            }

                            function Lr(e, n, t, r) {
                                var i = t.length,
                                    a = i,
                                    u = !r;
                                if (null == e) return !a;
                                for (e = Ce(e); i--;) {
                                    var c = t[i];
                                    if (u && c[2] ? c[1] !== e[c[0]] : !(c[0] in e)) return !1
                                }
                                for (; ++i < a;) {
                                    var l = (c = t[i])[0],
                                        s = e[l],
                                        f = c[1];
                                    if (u && c[2]) {
                                        if (s === o && !(l in e)) return !1
                                    } else {
                                        var d = new Xt;
                                        if (r) var p = r(s, f, l, e, n, d);
                                        if (!(p === o ? Nr(f, s, 3, r, d) : p)) return !1
                                    }
                                }
                                return !0
                            }

                            function Mr(e) {
                                return !(!nu(e) || (n = e, ze && ze in n)) && (Ja(e) ? We : ye).test(Fi(e));
                                var n
                            }

                            function Ir(e) {
                                return "function" == typeof e ? e : null == e ? oc : "object" == typeof e ? $a(e) ? Wr(e[0], e[1]) : Ur(e) : pc(e)
                            }

                            function Dr(e) {
                                if (!xi(e)) return Gn(e);
                                var n = [];
                                for (var t in Ce(e)) Ie.call(e, t) && "constructor" != t && n.push(t);
                                return n
                            }

                            function zr(e) {
                                if (!nu(e)) return function(e) {
                                    var n = [];
                                    if (null != e)
                                        for (var t in Ce(e)) n.push(t);
                                    return n
                                }(e);
                                var n = xi(e),
                                    t = [];
                                for (var r in e)("constructor" != r || !n && Ie.call(e, r)) && t.push(r);
                                return t
                            }

                            function Fr(e, n) {
                                return e < n
                            }

                            function Br(e, n) {
                                var t = -1,
                                    o = Ha(e) ? r(e.length) : [];
                                return pr(e, (function(e, r, i) {
                                    o[++t] = n(e, r, i)
                                })), o
                            }

                            function Ur(e) {
                                var n = di(e);
                                return 1 == n.length && n[0][2] ? Ci(n[0][0], n[0][1]) : function(t) {
                                    return t === e || Lr(t, e, n)
                                }
                            }

                            function Wr(e, n) {
                                return Si(e) && Oi(n) ? Ci(zi(e), n) : function(t) {
                                    var r = Cu(t, e);
                                    return r === o && r === n ? ku(t, e) : Nr(n, r, 3)
                                }
                            }

                            function Vr(e, n, t, r, i) {
                                e !== n && br(n, (function(a, u) {
                                    if (i || (i = new Xt), nu(a)) ! function(e, n, t, r, i, a, u) {
                                        var c = Ti(e, t),
                                            l = Ti(n, t),
                                            s = u.get(l);
                                        if (s) return void nr(e, t, s);
                                        var f = a ? a(c, l, t + "", e, n, u) : o,
                                            d = f === o;
                                        if (d) {
                                            var p = $a(l),
                                                h = !p && Ga(l),
                                                v = !p && !h && su(l);
                                            f = l, p || h || v ? $a(c) ? f = c : Za(c) ? f = jo(c) : h ? (d = !1, f = xo(l, !0)) : v ? (d = !1, f = Co(l, !0)) : f = [] : iu(l) || qa(l) ? (f = c, qa(c) ? f = yu(c) : nu(c) && !Ja(c) || (f = yi(l))) : d = !1
                                        }
                                        d && (u.set(l, f), i(f, l, r, a, u), u.delete(l));
                                        nr(e, t, f)
                                    }(e, n, u, t, Vr, r, i);
                                    else {
                                        var c = r ? r(Ti(e, u), a, u + "", e, n, i) : o;
                                        c === o && (c = a), nr(e, u, c)
                                    }
                                }), Nu)
                            }

                            function qr(e, n) {
                                var t = e.length;
                                if (t) return wi(n += n < 0 ? t : 0, t) ? e[n] : o
                            }

                            function $r(e, n, t) {
                                n = n.length ? In(n, (function(e) {
                                    return $a(e) ? function(n) {
                                        return Ar(n, 1 === e.length ? e[0] : e)
                                    } : e
                                })) : [oc];
                                var r = -1;
                                n = In(n, et(si()));
                                var o = Br(e, (function(e, t, o) {
                                    var i = In(n, (function(n) {
                                        return n(e)
                                    }));
                                    return {
                                        criteria: i,
                                        index: ++r,
                                        value: e
                                    }
                                }));
                                return function(e, n) {
                                    var t = e.length;
                                    for (e.sort(n); t--;) e[t] = e[t].value;
                                    return e
                                }(o, (function(e, n) {
                                    return function(e, n, t) {
                                        var r = -1,
                                            o = e.criteria,
                                            i = n.criteria,
                                            a = o.length,
                                            u = t.length;
                                        for (; ++r < a;) {
                                            var c = ko(o[r], i[r]);
                                            if (c) return r >= u ? c : c * ("desc" == t[r] ? -1 : 1)
                                        }
                                        return e.index - n.index
                                    }(e, n, t)
                                }))
                            }

                            function Kr(e, n, t) {
                                for (var r = -1, o = n.length, i = {}; ++r < o;) {
                                    var a = n[r],
                                        u = Ar(e, a);
                                    t(u, a) && eo(i, _o(a, e), u)
                                }
                                return i
                            }

                            function Hr(e, n, t, r) {
                                var o = r ? $n : qn,
                                    i = -1,
                                    a = n.length,
                                    u = e;
                                for (e === n && (n = jo(n)), t && (u = In(e, et(t))); ++i < a;)
                                    for (var c = 0, l = n[i], s = t ? t(l) : l;
                                        (c = o(u, s, c, r)) > -1;) u !== e && Xe.call(u, c, 1), Xe.call(e, c, 1);
                                return e
                            }

                            function Zr(e, n) {
                                for (var t = e ? n.length : 0, r = t - 1; t--;) {
                                    var o = n[t];
                                    if (t == r || o !== i) {
                                        var i = o;
                                        wi(o) ? Xe.call(e, o, 1) : po(e, o)
                                    }
                                }
                                return e
                            }

                            function Gr(e, n) {
                                return e + mn(Et() * (n - e + 1))
                            }

                            function Xr(e, n) {
                                var t = "";
                                if (!e || n < 1 || n > h) return t;
                                do {
                                    n % 2 && (t += e), (n = mn(n / 2)) && (e += e)
                                } while (n);
                                return t
                            }

                            function Yr(e, n) {
                                return Ni(ki(e, n, oc), e + "")
                            }

                            function Jr(e) {
                                return Jt(Uu(e))
                            }

                            function Qr(e, n) {
                                var t = Uu(e);
                                return Ii(t, cr(n, 0, t.length))
                            }

                            function eo(e, n, t, r) {
                                if (!nu(e)) return e;
                                for (var i = -1, a = (n = _o(n, e)).length, u = a - 1, c = e; null != c && ++i < a;) {
                                    var l = zi(n[i]),
                                        s = t;
                                    if ("__proto__" === l || "constructor" === l || "prototype" === l) return e;
                                    if (i != u) {
                                        var f = c[l];
                                        (s = r ? r(f, l, c) : o) === o && (s = nu(f) ? f : wi(n[i + 1]) ? [] : {})
                                    }
                                    tr(c, l, s), c = c[l]
                                }
                                return e
                            }
                            var no = jt ? function(e, n) {
                                    return jt.set(e, n), e
                                } : oc,
                                to = tn ? function(e, n) {
                                    return tn(e, "toString", {
                                        configurable: !0,
                                        enumerable: !1,
                                        value: nc(n),
                                        writable: !0
                                    })
                                } : oc;

                            function ro(e) {
                                return Ii(Uu(e))
                            }

                            function oo(e, n, t) {
                                var o = -1,
                                    i = e.length;
                                n < 0 && (n = -n > i ? 0 : i + n), (t = t > i ? i : t) < 0 && (t += i), i = n > t ? 0 : t - n >>> 0, n >>>= 0;
                                for (var a = r(i); ++o < i;) a[o] = e[o + n];
                                return a
                            }

                            function io(e, n) {
                                var t;
                                return pr(e, (function(e, r, o) {
                                    return !(t = n(e, r, o))
                                })), !!t
                            }

                            function ao(e, n, t) {
                                var r = 0,
                                    o = null == e ? r : e.length;
                                if ("number" == typeof n && n == n && o <= 2147483647) {
                                    for (; r < o;) {
                                        var i = r + o >>> 1,
                                            a = e[i];
                                        null !== a && !lu(a) && (t ? a <= n : a < n) ? r = i + 1 : o = i
                                    }
                                    return o
                                }
                                return uo(e, n, oc, t)
                            }

                            function uo(e, n, t, r) {
                                var i = 0,
                                    a = null == e ? 0 : e.length;
                                if (0 === a) return 0;
                                for (var u = (n = t(n)) != n, c = null === n, l = lu(n), s = n === o; i < a;) {
                                    var f = mn((i + a) / 2),
                                        d = t(e[f]),
                                        p = d !== o,
                                        h = null === d,
                                        v = d == d,
                                        g = lu(d);
                                    if (u) var m = r || v;
                                    else m = s ? v && (r || p) : c ? v && p && (r || !h) : l ? v && p && !h && (r || !g) : !h && !g && (r ? d <= n : d < n);
                                    m ? i = f + 1 : a = f
                                }
                                return wt(a, 4294967294)
                            }

                            function co(e, n) {
                                for (var t = -1, r = e.length, o = 0, i = []; ++t < r;) {
                                    var a = e[t],
                                        u = n ? n(a) : a;
                                    if (!t || !Ua(u, c)) {
                                        var c = u;
                                        i[o++] = 0 === a ? 0 : a
                                    }
                                }
                                return i
                            }

                            function lo(e) {
                                return "number" == typeof e ? e : lu(e) ? v : +e
                            }

                            function so(e) {
                                if ("string" == typeof e) return e;
                                if ($a(e)) return In(e, so) + "";
                                if (lu(e)) return Bt ? Bt.call(e) : "";
                                var n = e + "";
                                return "0" == n && 1 / e == -1 / 0 ? "-0" : n
                            }

                            function fo(e, n, t) {
                                var r = -1,
                                    o = Ln,
                                    i = e.length,
                                    a = !0,
                                    u = [],
                                    c = u;
                                if (t) a = !1, o = Mn;
                                else if (i >= 200) {
                                    var l = n ? null : Yo(e);
                                    if (l) return dt(l);
                                    a = !1, o = tt, c = new Gt
                                } else c = n ? [] : u;
                                e: for (; ++r < i;) {
                                    var s = e[r],
                                        f = n ? n(s) : s;
                                    if (s = t || 0 !== s ? s : 0, a && f == f) {
                                        for (var d = c.length; d--;)
                                            if (c[d] === f) continue e;
                                        n && c.push(f), u.push(s)
                                    } else o(c, f, t) || (c !== u && c.push(f), u.push(s))
                                }
                                return u
                            }

                            function po(e, n) {
                                return null == (e = Pi(e, n = _o(n, e))) || delete e[zi(Yi(n))]
                            }

                            function ho(e, n, t, r) {
                                return eo(e, n, t(Ar(e, n)), r)
                            }

                            function vo(e, n, t, r) {
                                for (var o = e.length, i = r ? o : -1;
                                    (r ? i-- : ++i < o) && n(e[i], i, e););
                                return t ? oo(e, r ? 0 : i, r ? i + 1 : o) : oo(e, r ? i + 1 : 0, r ? o : i)
                            }

                            function go(e, n) {
                                var t = e;
                                return t instanceof $t && (t = t.value()), zn(n, (function(e, n) {
                                    return n.func.apply(n.thisArg, Dn([e], n.args))
                                }), t)
                            }

                            function mo(e, n, t) {
                                var o = e.length;
                                if (o < 2) return o ? fo(e[0]) : [];
                                for (var i = -1, a = r(o); ++i < o;)
                                    for (var u = e[i], c = -1; ++c < o;) c != i && (a[i] = dr(a[i] || u, e[c], n, t));
                                return fo(yr(a, 1), n, t)
                            }

                            function yo(e, n, t) {
                                for (var r = -1, i = e.length, a = n.length, u = {}; ++r < i;) {
                                    var c = r < a ? n[r] : o;
                                    t(u, e[r], c)
                                }
                                return u
                            }

                            function bo(e) {
                                return Za(e) ? e : []
                            }

                            function wo(e) {
                                return "function" == typeof e ? e : oc
                            }

                            function _o(e, n) {
                                return $a(e) ? e : Si(e, n) ? [e] : Di(bu(e))
                            }
                            var So = Yr;

                            function Eo(e, n, t) {
                                var r = e.length;
                                return t = t === o ? r : t, !n && t >= r ? e : oo(e, n, t)
                            }
                            var Ao = on || function(e) {
                                return gn.clearTimeout(e)
                            };

                            function xo(e, n) {
                                if (n) return e.slice();
                                var t = e.length,
                                    r = Ke ? Ke(t) : new e.constructor(t);
                                return e.copy(r), r
                            }

                            function Oo(e) {
                                var n = new e.constructor(e.byteLength);
                                return new $e(n).set(new $e(e)), n
                            }

                            function Co(e, n) {
                                var t = n ? Oo(e.buffer) : e.buffer;
                                return new e.constructor(t, e.byteOffset, e.length)
                            }

                            function ko(e, n) {
                                if (e !== n) {
                                    var t = e !== o,
                                        r = null === e,
                                        i = e == e,
                                        a = lu(e),
                                        u = n !== o,
                                        c = null === n,
                                        l = n == n,
                                        s = lu(n);
                                    if (!c && !s && !a && e > n || a && u && l && !c && !s || r && u && l || !t && l || !i) return 1;
                                    if (!r && !a && !s && e < n || s && t && i && !r && !a || c && t && i || !u && i || !l) return -1
                                }
                                return 0
                            }

                            function Po(e, n, t, o) {
                                for (var i = -1, a = e.length, u = t.length, c = -1, l = n.length, s = bt(a - u, 0), f = r(l + s), d = !o; ++c < l;) f[c] = n[c];
                                for (; ++i < u;)(d || i < a) && (f[t[i]] = e[i]);
                                for (; s--;) f[c++] = e[i++];
                                return f
                            }

                            function To(e, n, t, o) {
                                for (var i = -1, a = e.length, u = -1, c = t.length, l = -1, s = n.length, f = bt(a - c, 0), d = r(f + s), p = !o; ++i < f;) d[i] = e[i];
                                for (var h = i; ++l < s;) d[h + l] = n[l];
                                for (; ++u < c;)(p || i < a) && (d[h + t[u]] = e[i++]);
                                return d
                            }

                            function jo(e, n) {
                                var t = -1,
                                    o = e.length;
                                for (n || (n = r(o)); ++t < o;) n[t] = e[t];
                                return n
                            }

                            function Ro(e, n, t, r) {
                                var i = !t;
                                t || (t = {});
                                for (var a = -1, u = n.length; ++a < u;) {
                                    var c = n[a],
                                        l = r ? r(t[c], e[c], c, t, e) : o;
                                    l === o && (l = e[c]), i ? ar(t, c, l) : tr(t, c, l)
                                }
                                return t
                            }

                            function No(e, n) {
                                return function(t, r) {
                                    var o = $a(t) ? Pn : or,
                                        i = n ? n() : {};
                                    return o(t, e, si(r, 2), i)
                                }
                            }

                            function Lo(e) {
                                return Yr((function(n, t) {
                                    var r = -1,
                                        i = t.length,
                                        a = i > 1 ? t[i - 1] : o,
                                        u = i > 2 ? t[2] : o;
                                    for (a = e.length > 3 && "function" == typeof a ? (i--, a) : o, u && _i(t[0], t[1], u) && (a = i < 3 ? o : a, i = 1), n = Ce(n); ++r < i;) {
                                        var c = t[r];
                                        c && e(n, c, r, a)
                                    }
                                    return n
                                }))
                            }

                            function Mo(e, n) {
                                return function(t, r) {
                                    if (null == t) return t;
                                    if (!Ha(t)) return e(t, r);
                                    for (var o = t.length, i = n ? o : -1, a = Ce(t);
                                        (n ? i-- : ++i < o) && !1 !== r(a[i], i, a););
                                    return t
                                }
                            }

                            function Io(e) {
                                return function(n, t, r) {
                                    for (var o = -1, i = Ce(n), a = r(n), u = a.length; u--;) {
                                        var c = a[e ? u : ++o];
                                        if (!1 === t(i[c], c, i)) break
                                    }
                                    return n
                                }
                            }

                            function Do(e) {
                                return function(n) {
                                    var t = ct(n = bu(n)) ? vt(n) : o,
                                        r = t ? t[0] : n.charAt(0),
                                        i = t ? Eo(t, 1).join("") : n.slice(1);
                                    return r[e]() + i
                                }
                            }

                            function zo(e) {
                                return function(n) {
                                    return zn(Ju(qu(n).replace(en, "")), e, "")
                                }
                            }

                            function Fo(e) {
                                return function() {
                                    var n = arguments;
                                    switch (n.length) {
                                        case 0:
                                            return new e;
                                        case 1:
                                            return new e(n[0]);
                                        case 2:
                                            return new e(n[0], n[1]);
                                        case 3:
                                            return new e(n[0], n[1], n[2]);
                                        case 4:
                                            return new e(n[0], n[1], n[2], n[3]);
                                        case 5:
                                            return new e(n[0], n[1], n[2], n[3], n[4]);
                                        case 6:
                                            return new e(n[0], n[1], n[2], n[3], n[4], n[5]);
                                        case 7:
                                            return new e(n[0], n[1], n[2], n[3], n[4], n[5], n[6])
                                    }
                                    var t = Wt(e.prototype),
                                        r = e.apply(t, n);
                                    return nu(r) ? r : t
                                }
                            }

                            function Bo(e) {
                                return function(n, t, r) {
                                    var i = Ce(n);
                                    if (!Ha(n)) {
                                        var a = si(t, 3);
                                        n = Ru(n), t = function(e) {
                                            return a(i[e], e, i)
                                        }
                                    }
                                    var u = e(n, t, r);
                                    return u > -1 ? i[a ? n[u] : u] : o
                                }
                            }

                            function Uo(e) {
                                return oi((function(n) {
                                    var t = n.length,
                                        r = t,
                                        a = qt.prototype.thru;
                                    for (e && n.reverse(); r--;) {
                                        var u = n[r];
                                        if ("function" != typeof u) throw new Te(i);
                                        if (a && !c && "wrapper" == ci(u)) var c = new qt([], !0)
                                    }
                                    for (r = c ? r : t; ++r < t;) {
                                        var l = ci(u = n[r]),
                                            s = "wrapper" == l ? ui(u) : o;
                                        c = s && Ei(s[0]) && 424 == s[1] && !s[4].length && 1 == s[9] ? c[ci(s[0])].apply(c, s[3]) : 1 == u.length && Ei(u) ? c[l]() : c.thru(u)
                                    }
                                    return function() {
                                        var e = arguments,
                                            r = e[0];
                                        if (c && 1 == e.length && $a(r)) return c.plant(r).value();
                                        for (var o = 0, i = t ? n[o].apply(this, e) : r; ++o < t;) i = n[o].call(this, i);
                                        return i
                                    }
                                }))
                            }

                            function Wo(e, n, t, i, a, u, c, l, s, d) {
                                var p = n & f,
                                    h = 1 & n,
                                    v = 2 & n,
                                    g = 24 & n,
                                    m = 512 & n,
                                    y = v ? o : Fo(e);
                                return function f() {
                                    for (var b = arguments.length, w = r(b), _ = b; _--;) w[_] = arguments[_];
                                    if (g) var S = li(f),
                                        E = function(e, n) {
                                            for (var t = e.length, r = 0; t--;) e[t] === n && ++r;
                                            return r
                                        }(w, S);
                                    if (i && (w = Po(w, i, a, g)), u && (w = To(w, u, c, g)), b -= E, g && b < d) {
                                        var A = ft(w, S);
                                        return Go(e, n, Wo, f.placeholder, t, w, A, l, s, d - b)
                                    }
                                    var x = h ? t : this,
                                        O = v ? x[e] : e;
                                    return b = w.length, l ? w = function(e, n) {
                                        var t = e.length,
                                            r = wt(n.length, t),
                                            i = jo(e);
                                        for (; r--;) {
                                            var a = n[r];
                                            e[r] = wi(a, t) ? i[a] : o
                                        }
                                        return e
                                    }(w, l) : m && b > 1 && w.reverse(), p && s < b && (w.length = s), this && this !== gn && this instanceof f && (O = y || Fo(O)), O.apply(x, w)
                                }
                            }

                            function Vo(e, n) {
                                return function(t, r) {
                                    return function(e, n, t, r) {
                                        return _r(e, (function(e, o, i) {
                                            n(r, t(e), o, i)
                                        })), r
                                    }(t, e, n(r), {})
                                }
                            }

                            function qo(e, n) {
                                return function(t, r) {
                                    var i;
                                    if (t === o && r === o) return n;
                                    if (t !== o && (i = t), r !== o) {
                                        if (i === o) return r;
                                        "string" == typeof t || "string" == typeof r ? (t = so(t), r = so(r)) : (t = lo(t), r = lo(r)), i = e(t, r)
                                    }
                                    return i
                                }
                            }

                            function $o(e) {
                                return oi((function(n) {
                                    return n = In(n, et(si())), Yr((function(t) {
                                        var r = this;
                                        return e(n, (function(e) {
                                            return kn(e, r, t)
                                        }))
                                    }))
                                }))
                            }

                            function Ko(e, n) {
                                var t = (n = n === o ? " " : so(n)).length;
                                if (t < 2) return t ? Xr(n, e) : n;
                                var r = Xr(n, vn(e / ht(n)));
                                return ct(n) ? Eo(vt(r), 0, e).join("") : r.slice(0, e)
                            }

                            function Ho(e) {
                                return function(n, t, i) {
                                    return i && "number" != typeof i && _i(n, t, i) && (t = i = o), n = hu(n), t === o ? (t = n, n = 0) : t = hu(t),
                                        function(e, n, t, o) {
                                            for (var i = -1, a = bt(vn((n - e) / (t || 1)), 0), u = r(a); a--;) u[o ? a : ++i] = e, e += t;
                                            return u
                                        }(n, t, i = i === o ? n < t ? 1 : -1 : hu(i), e)
                                }
                            }

                            function Zo(e) {
                                return function(n, t) {
                                    return "string" == typeof n && "string" == typeof t || (n = mu(n), t = mu(t)), e(n, t)
                                }
                            }

                            function Go(e, n, t, r, i, a, u, c, f, d) {
                                var p = 8 & n;
                                n |= p ? l : s, 4 & (n &= ~(p ? s : l)) || (n &= -4);
                                var h = [e, n, i, p ? a : o, p ? u : o, p ? o : a, p ? o : u, c, f, d],
                                    v = t.apply(o, h);
                                return Ei(e) && ji(v, h), v.placeholder = r, Li(v, e, n)
                            }

                            function Xo(e) {
                                var n = Oe[e];
                                return function(e, t) {
                                    if (e = mu(e), (t = null == t ? 0 : wt(vu(t), 292)) && _n(e)) {
                                        var r = (bu(e) + "e").split("e");
                                        return +((r = (bu(n(r[0] + "e" + (+r[1] + t))) + "e").split("e"))[0] + "e" + (+r[1] - t))
                                    }
                                    return n(e)
                                }
                            }
                            var Yo = kt && 1 / dt(new kt([, -0]))[1] == p ? function(e) {
                                return new kt(e)
                            } : lc;

                            function Jo(e) {
                                return function(n) {
                                    var t = gi(n);
                                    return t == x ? lt(n) : t == T ? pt(n) : function(e, n) {
                                        return In(n, (function(n) {
                                            return [n, e[n]]
                                        }))
                                    }(n, e(n))
                                }
                            }

                            function Qo(e, n, t, a, p, h, v, g) {
                                var m = 2 & n;
                                if (!m && "function" != typeof e) throw new Te(i);
                                var y = a ? a.length : 0;
                                if (y || (n &= -97, a = p = o), v = v === o ? v : bt(vu(v), 0), g = g === o ? g : vu(g), y -= p ? p.length : 0, n & s) {
                                    var b = a,
                                        w = p;
                                    a = p = o
                                }
                                var _ = m ? o : ui(e),
                                    S = [e, n, t, a, p, b, w, h, v, g];
                                if (_ && function(e, n) {
                                        var t = e[1],
                                            r = n[1],
                                            o = t | r,
                                            i = o < 131,
                                            a = r == f && 8 == t || r == f && t == d && e[7].length <= n[8] || 384 == r && n[7].length <= n[8] && 8 == t;
                                        if (!i && !a) return e;
                                        1 & r && (e[2] = n[2], o |= 1 & t ? 0 : 4);
                                        var c = n[3];
                                        if (c) {
                                            var l = e[3];
                                            e[3] = l ? Po(l, c, n[4]) : c, e[4] = l ? ft(e[3], u) : n[4]
                                        }(c = n[5]) && (l = e[5], e[5] = l ? To(l, c, n[6]) : c, e[6] = l ? ft(e[5], u) : n[6]);
                                        (c = n[7]) && (e[7] = c);
                                        r & f && (e[8] = null == e[8] ? n[8] : wt(e[8], n[8]));
                                        null == e[9] && (e[9] = n[9]);
                                        e[0] = n[0], e[1] = o
                                    }(S, _), e = S[0], n = S[1], t = S[2], a = S[3], p = S[4], !(g = S[9] = S[9] === o ? m ? 0 : e.length : bt(S[9] - y, 0)) && 24 & n && (n &= -25), n && 1 != n) E = 8 == n || n == c ? function(e, n, t) {
                                    var i = Fo(e);
                                    return function a() {
                                        for (var u = arguments.length, c = r(u), l = u, s = li(a); l--;) c[l] = arguments[l];
                                        var f = u < 3 && c[0] !== s && c[u - 1] !== s ? [] : ft(c, s);
                                        return (u -= f.length) < t ? Go(e, n, Wo, a.placeholder, o, c, f, o, o, t - u) : kn(this && this !== gn && this instanceof a ? i : e, this, c)
                                    }
                                }(e, n, g) : n != l && 33 != n || p.length ? Wo.apply(o, S) : function(e, n, t, o) {
                                    var i = 1 & n,
                                        a = Fo(e);
                                    return function n() {
                                        for (var u = -1, c = arguments.length, l = -1, s = o.length, f = r(s + c), d = this && this !== gn && this instanceof n ? a : e; ++l < s;) f[l] = o[l];
                                        for (; c--;) f[l++] = arguments[++u];
                                        return kn(d, i ? t : this, f)
                                    }
                                }(e, n, t, a);
                                else var E = function(e, n, t) {
                                    var r = 1 & n,
                                        o = Fo(e);
                                    return function n() {
                                        return (this && this !== gn && this instanceof n ? o : e).apply(r ? t : this, arguments)
                                    }
                                }(e, n, t);
                                return Li((_ ? no : ji)(E, S), e, n)
                            }

                            function ei(e, n, t, r) {
                                return e === o || Ua(e, Ne[t]) && !Ie.call(r, t) ? n : e
                            }

                            function ni(e, n, t, r, i, a) {
                                return nu(e) && nu(n) && (a.set(n, e), Vr(e, n, o, ni, a), a.delete(n)), e
                            }

                            function ti(e) {
                                return iu(e) ? o : e
                            }

                            function ri(e, n, t, r, i, a) {
                                var u = 1 & t,
                                    c = e.length,
                                    l = n.length;
                                if (c != l && !(u && l > c)) return !1;
                                var s = a.get(e),
                                    f = a.get(n);
                                if (s && f) return s == n && f == e;
                                var d = -1,
                                    p = !0,
                                    h = 2 & t ? new Gt : o;
                                for (a.set(e, n), a.set(n, e); ++d < c;) {
                                    var v = e[d],
                                        g = n[d];
                                    if (r) var m = u ? r(g, v, d, n, e, a) : r(v, g, d, e, n, a);
                                    if (m !== o) {
                                        if (m) continue;
                                        p = !1;
                                        break
                                    }
                                    if (h) {
                                        if (!Bn(n, (function(e, n) {
                                                if (!tt(h, n) && (v === e || i(v, e, t, r, a))) return h.push(n)
                                            }))) {
                                            p = !1;
                                            break
                                        }
                                    } else if (v !== g && !i(v, g, t, r, a)) {
                                        p = !1;
                                        break
                                    }
                                }
                                return a.delete(e), a.delete(n), p
                            }

                            function oi(e) {
                                return Ni(ki(e, o, Ki), e + "")
                            }

                            function ii(e) {
                                return xr(e, Ru, hi)
                            }

                            function ai(e) {
                                return xr(e, Nu, vi)
                            }
                            var ui = jt ? function(e) {
                                return jt.get(e)
                            } : lc;

                            function ci(e) {
                                for (var n = e.name + "", t = Rt[n], r = Ie.call(Rt, n) ? t.length : 0; r--;) {
                                    var o = t[r],
                                        i = o.func;
                                    if (null == i || i == e) return o.name
                                }
                                return n
                            }

                            function li(e) {
                                return (Ie.call(Ut, "placeholder") ? Ut : e).placeholder
                            }

                            function si() {
                                var e = Ut.iteratee || ic;
                                return e = e === ic ? Ir : e, arguments.length ? e(arguments[0], arguments[1]) : e
                            }

                            function fi(e, n) {
                                var t, r, o = e.__data__;
                                return ("string" == (r = typeof(t = n)) || "number" == r || "symbol" == r || "boolean" == r ? "__proto__" !== t : null === t) ? o["string" == typeof n ? "string" : "hash"] : o.map
                            }

                            function di(e) {
                                for (var n = Ru(e), t = n.length; t--;) {
                                    var r = n[t],
                                        o = e[r];
                                    n[t] = [r, o, Oi(o)]
                                }
                                return n
                            }

                            function pi(e, n) {
                                var t = function(e, n) {
                                    return null == e ? o : e[n]
                                }(e, n);
                                return Mr(t) ? t : o
                            }
                            var hi = yn ? function(e) {
                                    return null == e ? [] : (e = Ce(e), Nn(yn(e), (function(n) {
                                        return Ge.call(e, n)
                                    })))
                                } : gc,
                                vi = yn ? function(e) {
                                    for (var n = []; e;) Dn(n, hi(e)), e = He(e);
                                    return n
                                } : gc,
                                gi = Or;

                            function mi(e, n, t) {
                                for (var r = -1, o = (n = _o(n, e)).length, i = !1; ++r < o;) {
                                    var a = zi(n[r]);
                                    if (!(i = null != e && t(e, a))) break;
                                    e = e[a]
                                }
                                return i || ++r != o ? i : !!(o = null == e ? 0 : e.length) && eu(o) && wi(a, o) && ($a(e) || qa(e))
                            }

                            function yi(e) {
                                return "function" != typeof e.constructor || xi(e) ? {} : Wt(He(e))
                            }

                            function bi(e) {
                                return $a(e) || qa(e) || !!(Ye && e && e[Ye])
                            }

                            function wi(e, n) {
                                var t = typeof e;
                                return !!(n = null == n ? h : n) && ("number" == t || "symbol" != t && we.test(e)) && e > -1 && e % 1 == 0 && e < n
                            }

                            function _i(e, n, t) {
                                if (!nu(t)) return !1;
                                var r = typeof n;
                                return !!("number" == r ? Ha(t) && wi(n, t.length) : "string" == r && n in t) && Ua(t[n], e)
                            }

                            function Si(e, n) {
                                if ($a(e)) return !1;
                                var t = typeof e;
                                return !("number" != t && "symbol" != t && "boolean" != t && null != e && !lu(e)) || (te.test(e) || !ne.test(e) || null != n && e in Ce(n))
                            }

                            function Ei(e) {
                                var n = ci(e),
                                    t = Ut[n];
                                if ("function" != typeof t || !(n in $t.prototype)) return !1;
                                if (e === t) return !0;
                                var r = ui(t);
                                return !!r && e === r[0]
                            }(xt && gi(new xt(new ArrayBuffer(1))) != M || Ot && gi(new Ot) != x || Ct && gi(Ct.resolve()) != k || kt && gi(new kt) != T || Pt && gi(new Pt) != N) && (gi = function(e) {
                                var n = Or(e),
                                    t = n == C ? e.constructor : o,
                                    r = t ? Fi(t) : "";
                                if (r) switch (r) {
                                    case Nt:
                                        return M;
                                    case Lt:
                                        return x;
                                    case Mt:
                                        return k;
                                    case It:
                                        return T;
                                    case Dt:
                                        return N
                                }
                                return n
                            });
                            var Ai = Le ? Ja : mc;

                            function xi(e) {
                                var n = e && e.constructor;
                                return e === ("function" == typeof n && n.prototype || Ne)
                            }

                            function Oi(e) {
                                return e == e && !nu(e)
                            }

                            function Ci(e, n) {
                                return function(t) {
                                    return null != t && (t[e] === n && (n !== o || e in Ce(t)))
                                }
                            }

                            function ki(e, n, t) {
                                return n = bt(n === o ? e.length - 1 : n, 0),
                                    function() {
                                        for (var o = arguments, i = -1, a = bt(o.length - n, 0), u = r(a); ++i < a;) u[i] = o[n + i];
                                        i = -1;
                                        for (var c = r(n + 1); ++i < n;) c[i] = o[i];
                                        return c[n] = t(u), kn(e, this, c)
                                    }
                            }

                            function Pi(e, n) {
                                return n.length < 2 ? e : Ar(e, oo(n, 0, -1))
                            }

                            function Ti(e, n) {
                                if (("constructor" !== n || "function" != typeof e[n]) && "__proto__" != n) return e[n]
                            }
                            var ji = Mi(no),
                                Ri = hn || function(e, n) {
                                    return gn.setTimeout(e, n)
                                },
                                Ni = Mi(to);

                            function Li(e, n, t) {
                                var r = n + "";
                                return Ni(e, function(e, n) {
                                    var t = n.length;
                                    if (!t) return e;
                                    var r = t - 1;
                                    return n[r] = (t > 1 ? "& " : "") + n[r], n = n.join(t > 2 ? ", " : " "), e.replace(ce, "{\n/* [wrapped with " + n + "] */\n")
                                }(r, function(e, n) {
                                    return Tn(m, (function(t) {
                                        var r = "_." + t[0];
                                        n & t[1] && !Ln(e, r) && e.push(r)
                                    })), e.sort()
                                }(function(e) {
                                    var n = e.match(le);
                                    return n ? n[1].split(se) : []
                                }(r), t)))
                            }

                            function Mi(e) {
                                var n = 0,
                                    t = 0;
                                return function() {
                                    var r = _t(),
                                        i = 16 - (r - t);
                                    if (t = r, i > 0) {
                                        if (++n >= 800) return arguments[0]
                                    } else n = 0;
                                    return e.apply(o, arguments)
                                }
                            }

                            function Ii(e, n) {
                                var t = -1,
                                    r = e.length,
                                    i = r - 1;
                                for (n = n === o ? r : n; ++t < n;) {
                                    var a = Gr(t, i),
                                        u = e[a];
                                    e[a] = e[t], e[t] = u
                                }
                                return e.length = n, e
                            }
                            var Di = function(e) {
                                var n = Ma(e, (function(e) {
                                        return 500 === t.size && t.clear(), e
                                    })),
                                    t = n.cache;
                                return n
                            }((function(e) {
                                var n = [];
                                return 46 === e.charCodeAt(0) && n.push(""), e.replace(re, (function(e, t, r, o) {
                                    n.push(r ? o.replace(pe, "$1") : t || e)
                                })), n
                            }));

                            function zi(e) {
                                if ("string" == typeof e || lu(e)) return e;
                                var n = e + "";
                                return "0" == n && 1 / e == -1 / 0 ? "-0" : n
                            }

                            function Fi(e) {
                                if (null != e) {
                                    try {
                                        return Me.call(e)
                                    } catch (e) {}
                                    try {
                                        return e + ""
                                    } catch (e) {}
                                }
                                return ""
                            }

                            function Bi(e) {
                                if (e instanceof $t) return e.clone();
                                var n = new qt(e.__wrapped__, e.__chain__);
                                return n.__actions__ = jo(e.__actions__), n.__index__ = e.__index__, n.__values__ = e.__values__, n
                            }
                            var Ui = Yr((function(e, n) {
                                    return Za(e) ? dr(e, yr(n, 1, Za, !0)) : []
                                })),
                                Wi = Yr((function(e, n) {
                                    var t = Yi(n);
                                    return Za(t) && (t = o), Za(e) ? dr(e, yr(n, 1, Za, !0), si(t, 2)) : []
                                })),
                                Vi = Yr((function(e, n) {
                                    var t = Yi(n);
                                    return Za(t) && (t = o), Za(e) ? dr(e, yr(n, 1, Za, !0), o, t) : []
                                }));

                            function qi(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                if (!r) return -1;
                                var o = null == t ? 0 : vu(t);
                                return o < 0 && (o = bt(r + o, 0)), Vn(e, si(n, 3), o)
                            }

                            function $i(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                if (!r) return -1;
                                var i = r - 1;
                                return t !== o && (i = vu(t), i = t < 0 ? bt(r + i, 0) : wt(i, r - 1)), Vn(e, si(n, 3), i, !0)
                            }

                            function Ki(e) {
                                return (null == e ? 0 : e.length) ? yr(e, 1) : []
                            }

                            function Hi(e) {
                                return e && e.length ? e[0] : o
                            }
                            var Zi = Yr((function(e) {
                                    var n = In(e, bo);
                                    return n.length && n[0] === e[0] ? Tr(n) : []
                                })),
                                Gi = Yr((function(e) {
                                    var n = Yi(e),
                                        t = In(e, bo);
                                    return n === Yi(t) ? n = o : t.pop(), t.length && t[0] === e[0] ? Tr(t, si(n, 2)) : []
                                })),
                                Xi = Yr((function(e) {
                                    var n = Yi(e),
                                        t = In(e, bo);
                                    return (n = "function" == typeof n ? n : o) && t.pop(), t.length && t[0] === e[0] ? Tr(t, o, n) : []
                                }));

                            function Yi(e) {
                                var n = null == e ? 0 : e.length;
                                return n ? e[n - 1] : o
                            }
                            var Ji = Yr(Qi);

                            function Qi(e, n) {
                                return e && e.length && n && n.length ? Hr(e, n) : e
                            }
                            var ea = oi((function(e, n) {
                                var t = null == e ? 0 : e.length,
                                    r = ur(e, n);
                                return Zr(e, In(n, (function(e) {
                                    return wi(e, t) ? +e : e
                                })).sort(ko)), r
                            }));

                            function na(e) {
                                return null == e ? e : At.call(e)
                            }
                            var ta = Yr((function(e) {
                                    return fo(yr(e, 1, Za, !0))
                                })),
                                ra = Yr((function(e) {
                                    var n = Yi(e);
                                    return Za(n) && (n = o), fo(yr(e, 1, Za, !0), si(n, 2))
                                })),
                                oa = Yr((function(e) {
                                    var n = Yi(e);
                                    return n = "function" == typeof n ? n : o, fo(yr(e, 1, Za, !0), o, n)
                                }));

                            function ia(e) {
                                if (!e || !e.length) return [];
                                var n = 0;
                                return e = Nn(e, (function(e) {
                                    if (Za(e)) return n = bt(e.length, n), !0
                                })), Jn(n, (function(n) {
                                    return In(e, Zn(n))
                                }))
                            }

                            function aa(e, n) {
                                if (!e || !e.length) return [];
                                var t = ia(e);
                                return null == n ? t : In(t, (function(e) {
                                    return kn(n, o, e)
                                }))
                            }
                            var ua = Yr((function(e, n) {
                                    return Za(e) ? dr(e, n) : []
                                })),
                                ca = Yr((function(e) {
                                    return mo(Nn(e, Za))
                                })),
                                la = Yr((function(e) {
                                    var n = Yi(e);
                                    return Za(n) && (n = o), mo(Nn(e, Za), si(n, 2))
                                })),
                                sa = Yr((function(e) {
                                    var n = Yi(e);
                                    return n = "function" == typeof n ? n : o, mo(Nn(e, Za), o, n)
                                })),
                                fa = Yr(ia);
                            var da = Yr((function(e) {
                                var n = e.length,
                                    t = n > 1 ? e[n - 1] : o;
                                return t = "function" == typeof t ? (e.pop(), t) : o, aa(e, t)
                            }));

                            function pa(e) {
                                var n = Ut(e);
                                return n.__chain__ = !0, n
                            }

                            function ha(e, n) {
                                return n(e)
                            }
                            var va = oi((function(e) {
                                var n = e.length,
                                    t = n ? e[0] : 0,
                                    r = this.__wrapped__,
                                    i = function(n) {
                                        return ur(n, e)
                                    };
                                return !(n > 1 || this.__actions__.length) && r instanceof $t && wi(t) ? ((r = r.slice(t, +t + (n ? 1 : 0))).__actions__.push({
                                    func: ha,
                                    args: [i],
                                    thisArg: o
                                }), new qt(r, this.__chain__).thru((function(e) {
                                    return n && !e.length && e.push(o), e
                                }))) : this.thru(i)
                            }));
                            var ga = No((function(e, n, t) {
                                Ie.call(e, t) ? ++e[t] : ar(e, t, 1)
                            }));
                            var ma = Bo(qi),
                                ya = Bo($i);

                            function ba(e, n) {
                                return ($a(e) ? Tn : pr)(e, si(n, 3))
                            }

                            function wa(e, n) {
                                return ($a(e) ? jn : hr)(e, si(n, 3))
                            }
                            var _a = No((function(e, n, t) {
                                Ie.call(e, t) ? e[t].push(n) : ar(e, t, [n])
                            }));
                            var Sa = Yr((function(e, n, t) {
                                    var o = -1,
                                        i = "function" == typeof n,
                                        a = Ha(e) ? r(e.length) : [];
                                    return pr(e, (function(e) {
                                        a[++o] = i ? kn(n, e, t) : jr(e, n, t)
                                    })), a
                                })),
                                Ea = No((function(e, n, t) {
                                    ar(e, t, n)
                                }));

                            function Aa(e, n) {
                                return ($a(e) ? In : Br)(e, si(n, 3))
                            }
                            var xa = No((function(e, n, t) {
                                e[t ? 0 : 1].push(n)
                            }), (function() {
                                return [
                                    [],
                                    []
                                ]
                            }));
                            var Oa = Yr((function(e, n) {
                                    if (null == e) return [];
                                    var t = n.length;
                                    return t > 1 && _i(e, n[0], n[1]) ? n = [] : t > 2 && _i(n[0], n[1], n[2]) && (n = [n[0]]), $r(e, yr(n, 1), [])
                                })),
                                Ca = fn || function() {
                                    return gn.Date.now()
                                };

                            function ka(e, n, t) {
                                return n = t ? o : n, n = e && null == n ? e.length : n, Qo(e, f, o, o, o, o, n)
                            }

                            function Pa(e, n) {
                                var t;
                                if ("function" != typeof n) throw new Te(i);
                                return e = vu(e),
                                    function() {
                                        return --e > 0 && (t = n.apply(this, arguments)), e <= 1 && (n = o), t
                                    }
                            }
                            var Ta = Yr((function(e, n, t) {
                                    var r = 1;
                                    if (t.length) {
                                        var o = ft(t, li(Ta));
                                        r |= l
                                    }
                                    return Qo(e, r, n, t, o)
                                })),
                                ja = Yr((function(e, n, t) {
                                    var r = 3;
                                    if (t.length) {
                                        var o = ft(t, li(ja));
                                        r |= l
                                    }
                                    return Qo(n, r, e, t, o)
                                }));

                            function Ra(e, n, t) {
                                var r, a, u, c, l, s, f = 0,
                                    d = !1,
                                    p = !1,
                                    h = !0;
                                if ("function" != typeof e) throw new Te(i);

                                function v(n) {
                                    var t = r,
                                        i = a;
                                    return r = a = o, f = n, c = e.apply(i, t)
                                }

                                function g(e) {
                                    var t = e - s;
                                    return s === o || t >= n || t < 0 || p && e - f >= u
                                }

                                function m() {
                                    var e = Ca();
                                    if (g(e)) return y(e);
                                    l = Ri(m, function(e) {
                                        var t = n - (e - s);
                                        return p ? wt(t, u - (e - f)) : t
                                    }(e))
                                }

                                function y(e) {
                                    return l = o, h && r ? v(e) : (r = a = o, c)
                                }

                                function b() {
                                    var e = Ca(),
                                        t = g(e);
                                    if (r = arguments, a = this, s = e, t) {
                                        if (l === o) return function(e) {
                                            return f = e, l = Ri(m, n), d ? v(e) : c
                                        }(s);
                                        if (p) return Ao(l), l = Ri(m, n), v(s)
                                    }
                                    return l === o && (l = Ri(m, n)), c
                                }
                                return n = mu(n) || 0, nu(t) && (d = !!t.leading, u = (p = "maxWait" in t) ? bt(mu(t.maxWait) || 0, n) : u, h = "trailing" in t ? !!t.trailing : h), b.cancel = function() {
                                    l !== o && Ao(l), f = 0, r = s = a = l = o
                                }, b.flush = function() {
                                    return l === o ? c : y(Ca())
                                }, b
                            }
                            var Na = Yr((function(e, n) {
                                    return fr(e, 1, n)
                                })),
                                La = Yr((function(e, n, t) {
                                    return fr(e, mu(n) || 0, t)
                                }));

                            function Ma(e, n) {
                                if ("function" != typeof e || null != n && "function" != typeof n) throw new Te(i);
                                var t = function() {
                                    var r = arguments,
                                        o = n ? n.apply(this, r) : r[0],
                                        i = t.cache;
                                    if (i.has(o)) return i.get(o);
                                    var a = e.apply(this, r);
                                    return t.cache = i.set(o, a) || i, a
                                };
                                return t.cache = new(Ma.Cache || Zt), t
                            }

                            function Ia(e) {
                                if ("function" != typeof e) throw new Te(i);
                                return function() {
                                    var n = arguments;
                                    switch (n.length) {
                                        case 0:
                                            return !e.call(this);
                                        case 1:
                                            return !e.call(this, n[0]);
                                        case 2:
                                            return !e.call(this, n[0], n[1]);
                                        case 3:
                                            return !e.call(this, n[0], n[1], n[2])
                                    }
                                    return !e.apply(this, n)
                                }
                            }
                            Ma.Cache = Zt;
                            var Da = So((function(e, n) {
                                    var t = (n = 1 == n.length && $a(n[0]) ? In(n[0], et(si())) : In(yr(n, 1), et(si()))).length;
                                    return Yr((function(r) {
                                        for (var o = -1, i = wt(r.length, t); ++o < i;) r[o] = n[o].call(this, r[o]);
                                        return kn(e, this, r)
                                    }))
                                })),
                                za = Yr((function(e, n) {
                                    var t = ft(n, li(za));
                                    return Qo(e, l, o, n, t)
                                })),
                                Fa = Yr((function(e, n) {
                                    var t = ft(n, li(Fa));
                                    return Qo(e, s, o, n, t)
                                })),
                                Ba = oi((function(e, n) {
                                    return Qo(e, d, o, o, o, n)
                                }));

                            function Ua(e, n) {
                                return e === n || e != e && n != n
                            }
                            var Wa = Zo(Cr),
                                Va = Zo((function(e, n) {
                                    return e >= n
                                })),
                                qa = Rr(function() {
                                    return arguments
                                }()) ? Rr : function(e) {
                                    return tu(e) && Ie.call(e, "callee") && !Ge.call(e, "callee")
                                },
                                $a = r.isArray,
                                Ka = Sn ? et(Sn) : function(e) {
                                    return tu(e) && Or(e) == L
                                };

                            function Ha(e) {
                                return null != e && eu(e.length) && !Ja(e)
                            }

                            function Za(e) {
                                return tu(e) && Ha(e)
                            }
                            var Ga = wn || mc,
                                Xa = En ? et(En) : function(e) {
                                    return tu(e) && Or(e) == _
                                };

                            function Ya(e) {
                                if (!tu(e)) return !1;
                                var n = Or(e);
                                return n == S || "[object DOMException]" == n || "string" == typeof e.message && "string" == typeof e.name && !iu(e)
                            }

                            function Ja(e) {
                                if (!nu(e)) return !1;
                                var n = Or(e);
                                return n == E || n == A || "[object AsyncFunction]" == n || "[object Proxy]" == n
                            }

                            function Qa(e) {
                                return "number" == typeof e && e == vu(e)
                            }

                            function eu(e) {
                                return "number" == typeof e && e > -1 && e % 1 == 0 && e <= h
                            }

                            function nu(e) {
                                var n = typeof e;
                                return null != e && ("object" == n || "function" == n)
                            }

                            function tu(e) {
                                return null != e && "object" == typeof e
                            }
                            var ru = An ? et(An) : function(e) {
                                return tu(e) && gi(e) == x
                            };

                            function ou(e) {
                                return "number" == typeof e || tu(e) && Or(e) == O
                            }

                            function iu(e) {
                                if (!tu(e) || Or(e) != C) return !1;
                                var n = He(e);
                                if (null === n) return !0;
                                var t = Ie.call(n, "constructor") && n.constructor;
                                return "function" == typeof t && t instanceof t && Me.call(t) == Be
                            }
                            var au = xn ? et(xn) : function(e) {
                                return tu(e) && Or(e) == P
                            };
                            var uu = On ? et(On) : function(e) {
                                return tu(e) && gi(e) == T
                            };

                            function cu(e) {
                                return "string" == typeof e || !$a(e) && tu(e) && Or(e) == j
                            }

                            function lu(e) {
                                return "symbol" == typeof e || tu(e) && Or(e) == R
                            }
                            var su = Cn ? et(Cn) : function(e) {
                                return tu(e) && eu(e.length) && !!ln[Or(e)]
                            };
                            var fu = Zo(Fr),
                                du = Zo((function(e, n) {
                                    return e <= n
                                }));

                            function pu(e) {
                                if (!e) return [];
                                if (Ha(e)) return cu(e) ? vt(e) : jo(e);
                                if (Je && e[Je]) return function(e) {
                                    for (var n, t = []; !(n = e.next()).done;) t.push(n.value);
                                    return t
                                }(e[Je]());
                                var n = gi(e);
                                return (n == x ? lt : n == T ? dt : Uu)(e)
                            }

                            function hu(e) {
                                return e ? (e = mu(e)) === p || e === -1 / 0 ? 17976931348623157e292 * (e < 0 ? -1 : 1) : e == e ? e : 0 : 0 === e ? e : 0
                            }

                            function vu(e) {
                                var n = hu(e),
                                    t = n % 1;
                                return n == n ? t ? n - t : n : 0
                            }

                            function gu(e) {
                                return e ? cr(vu(e), 0, g) : 0
                            }

                            function mu(e) {
                                if ("number" == typeof e) return e;
                                if (lu(e)) return v;
                                if (nu(e)) {
                                    var n = "function" == typeof e.valueOf ? e.valueOf() : e;
                                    e = nu(n) ? n + "" : n
                                }
                                if ("string" != typeof e) return 0 === e ? e : +e;
                                e = Qn(e);
                                var t = me.test(e);
                                return t || be.test(e) ? pn(e.slice(2), t ? 2 : 8) : ge.test(e) ? v : +e
                            }

                            function yu(e) {
                                return Ro(e, Nu(e))
                            }

                            function bu(e) {
                                return null == e ? "" : so(e)
                            }
                            var wu = Lo((function(e, n) {
                                    if (xi(n) || Ha(n)) Ro(n, Ru(n), e);
                                    else
                                        for (var t in n) Ie.call(n, t) && tr(e, t, n[t])
                                })),
                                _u = Lo((function(e, n) {
                                    Ro(n, Nu(n), e)
                                })),
                                Su = Lo((function(e, n, t, r) {
                                    Ro(n, Nu(n), e, r)
                                })),
                                Eu = Lo((function(e, n, t, r) {
                                    Ro(n, Ru(n), e, r)
                                })),
                                Au = oi(ur);
                            var xu = Yr((function(e, n) {
                                    e = Ce(e);
                                    var t = -1,
                                        r = n.length,
                                        i = r > 2 ? n[2] : o;
                                    for (i && _i(n[0], n[1], i) && (r = 1); ++t < r;)
                                        for (var a = n[t], u = Nu(a), c = -1, l = u.length; ++c < l;) {
                                            var s = u[c],
                                                f = e[s];
                                            (f === o || Ua(f, Ne[s]) && !Ie.call(e, s)) && (e[s] = a[s])
                                        }
                                    return e
                                })),
                                Ou = Yr((function(e) {
                                    return e.push(o, ni), kn(Mu, o, e)
                                }));

                            function Cu(e, n, t) {
                                var r = null == e ? o : Ar(e, n);
                                return r === o ? t : r
                            }

                            function ku(e, n) {
                                return null != e && mi(e, n, Pr)
                            }
                            var Pu = Vo((function(e, n, t) {
                                    null != n && "function" != typeof n.toString && (n = Fe.call(n)), e[n] = t
                                }), nc(oc)),
                                Tu = Vo((function(e, n, t) {
                                    null != n && "function" != typeof n.toString && (n = Fe.call(n)), Ie.call(e, n) ? e[n].push(t) : e[n] = [t]
                                }), si),
                                ju = Yr(jr);

                            function Ru(e) {
                                return Ha(e) ? Yt(e) : Dr(e)
                            }

                            function Nu(e) {
                                return Ha(e) ? Yt(e, !0) : zr(e)
                            }
                            var Lu = Lo((function(e, n, t) {
                                    Vr(e, n, t)
                                })),
                                Mu = Lo((function(e, n, t, r) {
                                    Vr(e, n, t, r)
                                })),
                                Iu = oi((function(e, n) {
                                    var t = {};
                                    if (null == e) return t;
                                    var r = !1;
                                    n = In(n, (function(n) {
                                        return n = _o(n, e), r || (r = n.length > 1), n
                                    })), Ro(e, ai(e), t), r && (t = lr(t, 7, ti));
                                    for (var o = n.length; o--;) po(t, n[o]);
                                    return t
                                }));
                            var Du = oi((function(e, n) {
                                return null == e ? {} : function(e, n) {
                                    return Kr(e, n, (function(n, t) {
                                        return ku(e, t)
                                    }))
                                }(e, n)
                            }));

                            function zu(e, n) {
                                if (null == e) return {};
                                var t = In(ai(e), (function(e) {
                                    return [e]
                                }));
                                return n = si(n), Kr(e, t, (function(e, t) {
                                    return n(e, t[0])
                                }))
                            }
                            var Fu = Jo(Ru),
                                Bu = Jo(Nu);

                            function Uu(e) {
                                return null == e ? [] : nt(e, Ru(e))
                            }
                            var Wu = zo((function(e, n, t) {
                                return n = n.toLowerCase(), e + (t ? Vu(n) : n)
                            }));

                            function Vu(e) {
                                return Yu(bu(e).toLowerCase())
                            }

                            function qu(e) {
                                return (e = bu(e)) && e.replace(_e, it).replace(nn, "")
                            }
                            var $u = zo((function(e, n, t) {
                                    return e + (t ? "-" : "") + n.toLowerCase()
                                })),
                                Ku = zo((function(e, n, t) {
                                    return e + (t ? " " : "") + n.toLowerCase()
                                })),
                                Hu = Do("toLowerCase");
                            var Zu = zo((function(e, n, t) {
                                return e + (t ? "_" : "") + n.toLowerCase()
                            }));
                            var Gu = zo((function(e, n, t) {
                                return e + (t ? " " : "") + Yu(n)
                            }));
                            var Xu = zo((function(e, n, t) {
                                    return e + (t ? " " : "") + n.toUpperCase()
                                })),
                                Yu = Do("toUpperCase");

                            function Ju(e, n, t) {
                                return e = bu(e), (n = t ? o : n) === o ? function(e) {
                                    return an.test(e)
                                }(e) ? function(e) {
                                    return e.match(rn) || []
                                }(e) : function(e) {
                                    return e.match(fe) || []
                                }(e) : e.match(n) || []
                            }
                            var Qu = Yr((function(e, n) {
                                    try {
                                        return kn(e, o, n)
                                    } catch (e) {
                                        return Ya(e) ? e : new Ae(e)
                                    }
                                })),
                                ec = oi((function(e, n) {
                                    return Tn(n, (function(n) {
                                        n = zi(n), ar(e, n, Ta(e[n], e))
                                    })), e
                                }));

                            function nc(e) {
                                return function() {
                                    return e
                                }
                            }
                            var tc = Uo(),
                                rc = Uo(!0);

                            function oc(e) {
                                return e
                            }

                            function ic(e) {
                                return Ir("function" == typeof e ? e : lr(e, 1))
                            }
                            var ac = Yr((function(e, n) {
                                    return function(t) {
                                        return jr(t, e, n)
                                    }
                                })),
                                uc = Yr((function(e, n) {
                                    return function(t) {
                                        return jr(e, t, n)
                                    }
                                }));

                            function cc(e, n, t) {
                                var r = Ru(n),
                                    o = Er(n, r);
                                null != t || nu(n) && (o.length || !r.length) || (t = n, n = e, e = this, o = Er(n, Ru(n)));
                                var i = !(nu(t) && "chain" in t && !t.chain),
                                    a = Ja(e);
                                return Tn(o, (function(t) {
                                    var r = n[t];
                                    e[t] = r, a && (e.prototype[t] = function() {
                                        var n = this.__chain__;
                                        if (i || n) {
                                            var t = e(this.__wrapped__);
                                            return (t.__actions__ = jo(this.__actions__)).push({
                                                func: r,
                                                args: arguments,
                                                thisArg: e
                                            }), t.__chain__ = n, t
                                        }
                                        return r.apply(e, Dn([this.value()], arguments))
                                    })
                                })), e
                            }

                            function lc() {}
                            var sc = $o(In),
                                fc = $o(Rn),
                                dc = $o(Bn);

                            function pc(e) {
                                return Si(e) ? Zn(zi(e)) : function(e) {
                                    return function(n) {
                                        return Ar(n, e)
                                    }
                                }(e)
                            }
                            var hc = Ho(),
                                vc = Ho(!0);

                            function gc() {
                                return []
                            }

                            function mc() {
                                return !1
                            }
                            var yc = qo((function(e, n) {
                                    return e + n
                                }), 0),
                                bc = Xo("ceil"),
                                wc = qo((function(e, n) {
                                    return e / n
                                }), 1),
                                _c = Xo("floor");
                            var Sc, Ec = qo((function(e, n) {
                                    return e * n
                                }), 1),
                                Ac = Xo("round"),
                                xc = qo((function(e, n) {
                                    return e - n
                                }), 0);
                            return Ut.after = function(e, n) {
                                if ("function" != typeof n) throw new Te(i);
                                return e = vu(e),
                                    function() {
                                        if (--e < 1) return n.apply(this, arguments)
                                    }
                            }, Ut.ary = ka, Ut.assign = wu, Ut.assignIn = _u, Ut.assignInWith = Su, Ut.assignWith = Eu, Ut.at = Au, Ut.before = Pa, Ut.bind = Ta, Ut.bindAll = ec, Ut.bindKey = ja, Ut.castArray = function() {
                                if (!arguments.length) return [];
                                var e = arguments[0];
                                return $a(e) ? e : [e]
                            }, Ut.chain = pa, Ut.chunk = function(e, n, t) {
                                n = (t ? _i(e, n, t) : n === o) ? 1 : bt(vu(n), 0);
                                var i = null == e ? 0 : e.length;
                                if (!i || n < 1) return [];
                                for (var a = 0, u = 0, c = r(vn(i / n)); a < i;) c[u++] = oo(e, a, a += n);
                                return c
                            }, Ut.compact = function(e) {
                                for (var n = -1, t = null == e ? 0 : e.length, r = 0, o = []; ++n < t;) {
                                    var i = e[n];
                                    i && (o[r++] = i)
                                }
                                return o
                            }, Ut.concat = function() {
                                var e = arguments.length;
                                if (!e) return [];
                                for (var n = r(e - 1), t = arguments[0], o = e; o--;) n[o - 1] = arguments[o];
                                return Dn($a(t) ? jo(t) : [t], yr(n, 1))
                            }, Ut.cond = function(e) {
                                var n = null == e ? 0 : e.length,
                                    t = si();
                                return e = n ? In(e, (function(e) {
                                    if ("function" != typeof e[1]) throw new Te(i);
                                    return [t(e[0]), e[1]]
                                })) : [], Yr((function(t) {
                                    for (var r = -1; ++r < n;) {
                                        var o = e[r];
                                        if (kn(o[0], this, t)) return kn(o[1], this, t)
                                    }
                                }))
                            }, Ut.conforms = function(e) {
                                return function(e) {
                                    var n = Ru(e);
                                    return function(t) {
                                        return sr(t, e, n)
                                    }
                                }(lr(e, 1))
                            }, Ut.constant = nc, Ut.countBy = ga, Ut.create = function(e, n) {
                                var t = Wt(e);
                                return null == n ? t : ir(t, n)
                            }, Ut.curry = function e(n, t, r) {
                                var i = Qo(n, 8, o, o, o, o, o, t = r ? o : t);
                                return i.placeholder = e.placeholder, i
                            }, Ut.curryRight = function e(n, t, r) {
                                var i = Qo(n, c, o, o, o, o, o, t = r ? o : t);
                                return i.placeholder = e.placeholder, i
                            }, Ut.debounce = Ra, Ut.defaults = xu, Ut.defaultsDeep = Ou, Ut.defer = Na, Ut.delay = La, Ut.difference = Ui, Ut.differenceBy = Wi, Ut.differenceWith = Vi, Ut.drop = function(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                return r ? oo(e, (n = t || n === o ? 1 : vu(n)) < 0 ? 0 : n, r) : []
                            }, Ut.dropRight = function(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                return r ? oo(e, 0, (n = r - (n = t || n === o ? 1 : vu(n))) < 0 ? 0 : n) : []
                            }, Ut.dropRightWhile = function(e, n) {
                                return e && e.length ? vo(e, si(n, 3), !0, !0) : []
                            }, Ut.dropWhile = function(e, n) {
                                return e && e.length ? vo(e, si(n, 3), !0) : []
                            }, Ut.fill = function(e, n, t, r) {
                                var i = null == e ? 0 : e.length;
                                return i ? (t && "number" != typeof t && _i(e, n, t) && (t = 0, r = i), function(e, n, t, r) {
                                    var i = e.length;
                                    for ((t = vu(t)) < 0 && (t = -t > i ? 0 : i + t), (r = r === o || r > i ? i : vu(r)) < 0 && (r += i), r = t > r ? 0 : gu(r); t < r;) e[t++] = n;
                                    return e
                                }(e, n, t, r)) : []
                            }, Ut.filter = function(e, n) {
                                return ($a(e) ? Nn : mr)(e, si(n, 3))
                            }, Ut.flatMap = function(e, n) {
                                return yr(Aa(e, n), 1)
                            }, Ut.flatMapDeep = function(e, n) {
                                return yr(Aa(e, n), p)
                            }, Ut.flatMapDepth = function(e, n, t) {
                                return t = t === o ? 1 : vu(t), yr(Aa(e, n), t)
                            }, Ut.flatten = Ki, Ut.flattenDeep = function(e) {
                                return (null == e ? 0 : e.length) ? yr(e, p) : []
                            }, Ut.flattenDepth = function(e, n) {
                                return (null == e ? 0 : e.length) ? yr(e, n = n === o ? 1 : vu(n)) : []
                            }, Ut.flip = function(e) {
                                return Qo(e, 512)
                            }, Ut.flow = tc, Ut.flowRight = rc, Ut.fromPairs = function(e) {
                                for (var n = -1, t = null == e ? 0 : e.length, r = {}; ++n < t;) {
                                    var o = e[n];
                                    r[o[0]] = o[1]
                                }
                                return r
                            }, Ut.functions = function(e) {
                                return null == e ? [] : Er(e, Ru(e))
                            }, Ut.functionsIn = function(e) {
                                return null == e ? [] : Er(e, Nu(e))
                            }, Ut.groupBy = _a, Ut.initial = function(e) {
                                return (null == e ? 0 : e.length) ? oo(e, 0, -1) : []
                            }, Ut.intersection = Zi, Ut.intersectionBy = Gi, Ut.intersectionWith = Xi, Ut.invert = Pu, Ut.invertBy = Tu, Ut.invokeMap = Sa, Ut.iteratee = ic, Ut.keyBy = Ea, Ut.keys = Ru, Ut.keysIn = Nu, Ut.map = Aa, Ut.mapKeys = function(e, n) {
                                var t = {};
                                return n = si(n, 3), _r(e, (function(e, r, o) {
                                    ar(t, n(e, r, o), e)
                                })), t
                            }, Ut.mapValues = function(e, n) {
                                var t = {};
                                return n = si(n, 3), _r(e, (function(e, r, o) {
                                    ar(t, r, n(e, r, o))
                                })), t
                            }, Ut.matches = function(e) {
                                return Ur(lr(e, 1))
                            }, Ut.matchesProperty = function(e, n) {
                                return Wr(e, lr(n, 1))
                            }, Ut.memoize = Ma, Ut.merge = Lu, Ut.mergeWith = Mu, Ut.method = ac, Ut.methodOf = uc, Ut.mixin = cc, Ut.negate = Ia, Ut.nthArg = function(e) {
                                return e = vu(e), Yr((function(n) {
                                    return qr(n, e)
                                }))
                            }, Ut.omit = Iu, Ut.omitBy = function(e, n) {
                                return zu(e, Ia(si(n)))
                            }, Ut.once = function(e) {
                                return Pa(2, e)
                            }, Ut.orderBy = function(e, n, t, r) {
                                return null == e ? [] : ($a(n) || (n = null == n ? [] : [n]), $a(t = r ? o : t) || (t = null == t ? [] : [t]), $r(e, n, t))
                            }, Ut.over = sc, Ut.overArgs = Da, Ut.overEvery = fc, Ut.overSome = dc, Ut.partial = za, Ut.partialRight = Fa, Ut.partition = xa, Ut.pick = Du, Ut.pickBy = zu, Ut.property = pc, Ut.propertyOf = function(e) {
                                return function(n) {
                                    return null == e ? o : Ar(e, n)
                                }
                            }, Ut.pull = Ji, Ut.pullAll = Qi, Ut.pullAllBy = function(e, n, t) {
                                return e && e.length && n && n.length ? Hr(e, n, si(t, 2)) : e
                            }, Ut.pullAllWith = function(e, n, t) {
                                return e && e.length && n && n.length ? Hr(e, n, o, t) : e
                            }, Ut.pullAt = ea, Ut.range = hc, Ut.rangeRight = vc, Ut.rearg = Ba, Ut.reject = function(e, n) {
                                return ($a(e) ? Nn : mr)(e, Ia(si(n, 3)))
                            }, Ut.remove = function(e, n) {
                                var t = [];
                                if (!e || !e.length) return t;
                                var r = -1,
                                    o = [],
                                    i = e.length;
                                for (n = si(n, 3); ++r < i;) {
                                    var a = e[r];
                                    n(a, r, e) && (t.push(a), o.push(r))
                                }
                                return Zr(e, o), t
                            }, Ut.rest = function(e, n) {
                                if ("function" != typeof e) throw new Te(i);
                                return Yr(e, n = n === o ? n : vu(n))
                            }, Ut.reverse = na, Ut.sampleSize = function(e, n, t) {
                                return n = (t ? _i(e, n, t) : n === o) ? 1 : vu(n), ($a(e) ? Qt : Qr)(e, n)
                            }, Ut.set = function(e, n, t) {
                                return null == e ? e : eo(e, n, t)
                            }, Ut.setWith = function(e, n, t, r) {
                                return r = "function" == typeof r ? r : o, null == e ? e : eo(e, n, t, r)
                            }, Ut.shuffle = function(e) {
                                return ($a(e) ? er : ro)(e)
                            }, Ut.slice = function(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                return r ? (t && "number" != typeof t && _i(e, n, t) ? (n = 0, t = r) : (n = null == n ? 0 : vu(n), t = t === o ? r : vu(t)), oo(e, n, t)) : []
                            }, Ut.sortBy = Oa, Ut.sortedUniq = function(e) {
                                return e && e.length ? co(e) : []
                            }, Ut.sortedUniqBy = function(e, n) {
                                return e && e.length ? co(e, si(n, 2)) : []
                            }, Ut.split = function(e, n, t) {
                                return t && "number" != typeof t && _i(e, n, t) && (n = t = o), (t = t === o ? g : t >>> 0) ? (e = bu(e)) && ("string" == typeof n || null != n && !au(n)) && !(n = so(n)) && ct(e) ? Eo(vt(e), 0, t) : e.split(n, t) : []
                            }, Ut.spread = function(e, n) {
                                if ("function" != typeof e) throw new Te(i);
                                return n = null == n ? 0 : bt(vu(n), 0), Yr((function(t) {
                                    var r = t[n],
                                        o = Eo(t, 0, n);
                                    return r && Dn(o, r), kn(e, this, o)
                                }))
                            }, Ut.tail = function(e) {
                                var n = null == e ? 0 : e.length;
                                return n ? oo(e, 1, n) : []
                            }, Ut.take = function(e, n, t) {
                                return e && e.length ? oo(e, 0, (n = t || n === o ? 1 : vu(n)) < 0 ? 0 : n) : []
                            }, Ut.takeRight = function(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                return r ? oo(e, (n = r - (n = t || n === o ? 1 : vu(n))) < 0 ? 0 : n, r) : []
                            }, Ut.takeRightWhile = function(e, n) {
                                return e && e.length ? vo(e, si(n, 3), !1, !0) : []
                            }, Ut.takeWhile = function(e, n) {
                                return e && e.length ? vo(e, si(n, 3)) : []
                            }, Ut.tap = function(e, n) {
                                return n(e), e
                            }, Ut.throttle = function(e, n, t) {
                                var r = !0,
                                    o = !0;
                                if ("function" != typeof e) throw new Te(i);
                                return nu(t) && (r = "leading" in t ? !!t.leading : r, o = "trailing" in t ? !!t.trailing : o), Ra(e, n, {
                                    leading: r,
                                    maxWait: n,
                                    trailing: o
                                })
                            }, Ut.thru = ha, Ut.toArray = pu, Ut.toPairs = Fu, Ut.toPairsIn = Bu, Ut.toPath = function(e) {
                                return $a(e) ? In(e, zi) : lu(e) ? [e] : jo(Di(bu(e)))
                            }, Ut.toPlainObject = yu, Ut.transform = function(e, n, t) {
                                var r = $a(e),
                                    o = r || Ga(e) || su(e);
                                if (n = si(n, 4), null == t) {
                                    var i = e && e.constructor;
                                    t = o ? r ? new i : [] : nu(e) && Ja(i) ? Wt(He(e)) : {}
                                }
                                return (o ? Tn : _r)(e, (function(e, r, o) {
                                    return n(t, e, r, o)
                                })), t
                            }, Ut.unary = function(e) {
                                return ka(e, 1)
                            }, Ut.union = ta, Ut.unionBy = ra, Ut.unionWith = oa, Ut.uniq = function(e) {
                                return e && e.length ? fo(e) : []
                            }, Ut.uniqBy = function(e, n) {
                                return e && e.length ? fo(e, si(n, 2)) : []
                            }, Ut.uniqWith = function(e, n) {
                                return n = "function" == typeof n ? n : o, e && e.length ? fo(e, o, n) : []
                            }, Ut.unset = function(e, n) {
                                return null == e || po(e, n)
                            }, Ut.unzip = ia, Ut.unzipWith = aa, Ut.update = function(e, n, t) {
                                return null == e ? e : ho(e, n, wo(t))
                            }, Ut.updateWith = function(e, n, t, r) {
                                return r = "function" == typeof r ? r : o, null == e ? e : ho(e, n, wo(t), r)
                            }, Ut.values = Uu, Ut.valuesIn = function(e) {
                                return null == e ? [] : nt(e, Nu(e))
                            }, Ut.without = ua, Ut.words = Ju, Ut.wrap = function(e, n) {
                                return za(wo(n), e)
                            }, Ut.xor = ca, Ut.xorBy = la, Ut.xorWith = sa, Ut.zip = fa, Ut.zipObject = function(e, n) {
                                return yo(e || [], n || [], tr)
                            }, Ut.zipObjectDeep = function(e, n) {
                                return yo(e || [], n || [], eo)
                            }, Ut.zipWith = da, Ut.entries = Fu, Ut.entriesIn = Bu, Ut.extend = _u, Ut.extendWith = Su, cc(Ut, Ut), Ut.add = yc, Ut.attempt = Qu, Ut.camelCase = Wu, Ut.capitalize = Vu, Ut.ceil = bc, Ut.clamp = function(e, n, t) {
                                return t === o && (t = n, n = o), t !== o && (t = (t = mu(t)) == t ? t : 0), n !== o && (n = (n = mu(n)) == n ? n : 0), cr(mu(e), n, t)
                            }, Ut.clone = function(e) {
                                return lr(e, 4)
                            }, Ut.cloneDeep = function(e) {
                                return lr(e, 5)
                            }, Ut.cloneDeepWith = function(e, n) {
                                return lr(e, 5, n = "function" == typeof n ? n : o)
                            }, Ut.cloneWith = function(e, n) {
                                return lr(e, 4, n = "function" == typeof n ? n : o)
                            }, Ut.conformsTo = function(e, n) {
                                return null == n || sr(e, n, Ru(n))
                            }, Ut.deburr = qu, Ut.defaultTo = function(e, n) {
                                return null == e || e != e ? n : e
                            }, Ut.divide = wc, Ut.endsWith = function(e, n, t) {
                                e = bu(e), n = so(n);
                                var r = e.length,
                                    i = t = t === o ? r : cr(vu(t), 0, r);
                                return (t -= n.length) >= 0 && e.slice(t, i) == n
                            }, Ut.eq = Ua, Ut.escape = function(e) {
                                return (e = bu(e)) && Y.test(e) ? e.replace(G, at) : e
                            }, Ut.escapeRegExp = function(e) {
                                return (e = bu(e)) && ie.test(e) ? e.replace(oe, "\\$&") : e
                            }, Ut.every = function(e, n, t) {
                                var r = $a(e) ? Rn : vr;
                                return t && _i(e, n, t) && (n = o), r(e, si(n, 3))
                            }, Ut.find = ma, Ut.findIndex = qi, Ut.findKey = function(e, n) {
                                return Wn(e, si(n, 3), _r)
                            }, Ut.findLast = ya, Ut.findLastIndex = $i, Ut.findLastKey = function(e, n) {
                                return Wn(e, si(n, 3), Sr)
                            }, Ut.floor = _c, Ut.forEach = ba, Ut.forEachRight = wa, Ut.forIn = function(e, n) {
                                return null == e ? e : br(e, si(n, 3), Nu)
                            }, Ut.forInRight = function(e, n) {
                                return null == e ? e : wr(e, si(n, 3), Nu)
                            }, Ut.forOwn = function(e, n) {
                                return e && _r(e, si(n, 3))
                            }, Ut.forOwnRight = function(e, n) {
                                return e && Sr(e, si(n, 3))
                            }, Ut.get = Cu, Ut.gt = Wa, Ut.gte = Va, Ut.has = function(e, n) {
                                return null != e && mi(e, n, kr)
                            }, Ut.hasIn = ku, Ut.head = Hi, Ut.identity = oc, Ut.includes = function(e, n, t, r) {
                                e = Ha(e) ? e : Uu(e), t = t && !r ? vu(t) : 0;
                                var o = e.length;
                                return t < 0 && (t = bt(o + t, 0)), cu(e) ? t <= o && e.indexOf(n, t) > -1 : !!o && qn(e, n, t) > -1
                            }, Ut.indexOf = function(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                if (!r) return -1;
                                var o = null == t ? 0 : vu(t);
                                return o < 0 && (o = bt(r + o, 0)), qn(e, n, o)
                            }, Ut.inRange = function(e, n, t) {
                                return n = hu(n), t === o ? (t = n, n = 0) : t = hu(t),
                                    function(e, n, t) {
                                        return e >= wt(n, t) && e < bt(n, t)
                                    }(e = mu(e), n, t)
                            }, Ut.invoke = ju, Ut.isArguments = qa, Ut.isArray = $a, Ut.isArrayBuffer = Ka, Ut.isArrayLike = Ha, Ut.isArrayLikeObject = Za, Ut.isBoolean = function(e) {
                                return !0 === e || !1 === e || tu(e) && Or(e) == w
                            }, Ut.isBuffer = Ga, Ut.isDate = Xa, Ut.isElement = function(e) {
                                return tu(e) && 1 === e.nodeType && !iu(e)
                            }, Ut.isEmpty = function(e) {
                                if (null == e) return !0;
                                if (Ha(e) && ($a(e) || "string" == typeof e || "function" == typeof e.splice || Ga(e) || su(e) || qa(e))) return !e.length;
                                var n = gi(e);
                                if (n == x || n == T) return !e.size;
                                if (xi(e)) return !Dr(e).length;
                                for (var t in e)
                                    if (Ie.call(e, t)) return !1;
                                return !0
                            }, Ut.isEqual = function(e, n) {
                                return Nr(e, n)
                            }, Ut.isEqualWith = function(e, n, t) {
                                var r = (t = "function" == typeof t ? t : o) ? t(e, n) : o;
                                return r === o ? Nr(e, n, o, t) : !!r
                            }, Ut.isError = Ya, Ut.isFinite = function(e) {
                                return "number" == typeof e && _n(e)
                            }, Ut.isFunction = Ja, Ut.isInteger = Qa, Ut.isLength = eu, Ut.isMap = ru, Ut.isMatch = function(e, n) {
                                return e === n || Lr(e, n, di(n))
                            }, Ut.isMatchWith = function(e, n, t) {
                                return t = "function" == typeof t ? t : o, Lr(e, n, di(n), t)
                            }, Ut.isNaN = function(e) {
                                return ou(e) && e != +e
                            }, Ut.isNative = function(e) {
                                if (Ai(e)) throw new Ae("Unsupported core-js use. Try https://npms.io/search?q=ponyfill.");
                                return Mr(e)
                            }, Ut.isNil = function(e) {
                                return null == e
                            }, Ut.isNull = function(e) {
                                return null === e
                            }, Ut.isNumber = ou, Ut.isObject = nu, Ut.isObjectLike = tu, Ut.isPlainObject = iu, Ut.isRegExp = au, Ut.isSafeInteger = function(e) {
                                return Qa(e) && e >= -9007199254740991 && e <= h
                            }, Ut.isSet = uu, Ut.isString = cu, Ut.isSymbol = lu, Ut.isTypedArray = su, Ut.isUndefined = function(e) {
                                return e === o
                            }, Ut.isWeakMap = function(e) {
                                return tu(e) && gi(e) == N
                            }, Ut.isWeakSet = function(e) {
                                return tu(e) && "[object WeakSet]" == Or(e)
                            }, Ut.join = function(e, n) {
                                return null == e ? "" : Un.call(e, n)
                            }, Ut.kebabCase = $u, Ut.last = Yi, Ut.lastIndexOf = function(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                if (!r) return -1;
                                var i = r;
                                return t !== o && (i = (i = vu(t)) < 0 ? bt(r + i, 0) : wt(i, r - 1)), n == n ? function(e, n, t) {
                                    for (var r = t + 1; r--;)
                                        if (e[r] === n) return r;
                                    return r
                                }(e, n, i) : Vn(e, Kn, i, !0)
                            }, Ut.lowerCase = Ku, Ut.lowerFirst = Hu, Ut.lt = fu, Ut.lte = du, Ut.max = function(e) {
                                return e && e.length ? gr(e, oc, Cr) : o
                            }, Ut.maxBy = function(e, n) {
                                return e && e.length ? gr(e, si(n, 2), Cr) : o
                            }, Ut.mean = function(e) {
                                return Hn(e, oc)
                            }, Ut.meanBy = function(e, n) {
                                return Hn(e, si(n, 2))
                            }, Ut.min = function(e) {
                                return e && e.length ? gr(e, oc, Fr) : o
                            }, Ut.minBy = function(e, n) {
                                return e && e.length ? gr(e, si(n, 2), Fr) : o
                            }, Ut.stubArray = gc, Ut.stubFalse = mc, Ut.stubObject = function() {
                                return {}
                            }, Ut.stubString = function() {
                                return ""
                            }, Ut.stubTrue = function() {
                                return !0
                            }, Ut.multiply = Ec, Ut.nth = function(e, n) {
                                return e && e.length ? qr(e, vu(n)) : o
                            }, Ut.noConflict = function() {
                                return gn._ === this && (gn._ = Ue), this
                            }, Ut.noop = lc, Ut.now = Ca, Ut.pad = function(e, n, t) {
                                e = bu(e);
                                var r = (n = vu(n)) ? ht(e) : 0;
                                if (!n || r >= n) return e;
                                var o = (n - r) / 2;
                                return Ko(mn(o), t) + e + Ko(vn(o), t)
                            }, Ut.padEnd = function(e, n, t) {
                                e = bu(e);
                                var r = (n = vu(n)) ? ht(e) : 0;
                                return n && r < n ? e + Ko(n - r, t) : e
                            }, Ut.padStart = function(e, n, t) {
                                e = bu(e);
                                var r = (n = vu(n)) ? ht(e) : 0;
                                return n && r < n ? Ko(n - r, t) + e : e
                            }, Ut.parseInt = function(e, n, t) {
                                return t || null == n ? n = 0 : n && (n = +n), St(bu(e).replace(ae, ""), n || 0)
                            }, Ut.random = function(e, n, t) {
                                if (t && "boolean" != typeof t && _i(e, n, t) && (n = t = o), t === o && ("boolean" == typeof n ? (t = n, n = o) : "boolean" == typeof e && (t = e, e = o)), e === o && n === o ? (e = 0, n = 1) : (e = hu(e), n === o ? (n = e, e = 0) : n = hu(n)), e > n) {
                                    var r = e;
                                    e = n, n = r
                                }
                                if (t || e % 1 || n % 1) {
                                    var i = Et();
                                    return wt(e + i * (n - e + dn("1e-" + ((i + "").length - 1))), n)
                                }
                                return Gr(e, n)
                            }, Ut.reduce = function(e, n, t) {
                                var r = $a(e) ? zn : Xn,
                                    o = arguments.length < 3;
                                return r(e, si(n, 4), t, o, pr)
                            }, Ut.reduceRight = function(e, n, t) {
                                var r = $a(e) ? Fn : Xn,
                                    o = arguments.length < 3;
                                return r(e, si(n, 4), t, o, hr)
                            }, Ut.repeat = function(e, n, t) {
                                return n = (t ? _i(e, n, t) : n === o) ? 1 : vu(n), Xr(bu(e), n)
                            }, Ut.replace = function() {
                                var e = arguments,
                                    n = bu(e[0]);
                                return e.length < 3 ? n : n.replace(e[1], e[2])
                            }, Ut.result = function(e, n, t) {
                                var r = -1,
                                    i = (n = _o(n, e)).length;
                                for (i || (i = 1, e = o); ++r < i;) {
                                    var a = null == e ? o : e[zi(n[r])];
                                    a === o && (r = i, a = t), e = Ja(a) ? a.call(e) : a
                                }
                                return e
                            }, Ut.round = Ac, Ut.runInContext = e, Ut.sample = function(e) {
                                return ($a(e) ? Jt : Jr)(e)
                            }, Ut.size = function(e) {
                                if (null == e) return 0;
                                if (Ha(e)) return cu(e) ? ht(e) : e.length;
                                var n = gi(e);
                                return n == x || n == T ? e.size : Dr(e).length
                            }, Ut.snakeCase = Zu, Ut.some = function(e, n, t) {
                                var r = $a(e) ? Bn : io;
                                return t && _i(e, n, t) && (n = o), r(e, si(n, 3))
                            }, Ut.sortedIndex = function(e, n) {
                                return ao(e, n)
                            }, Ut.sortedIndexBy = function(e, n, t) {
                                return uo(e, n, si(t, 2))
                            }, Ut.sortedIndexOf = function(e, n) {
                                var t = null == e ? 0 : e.length;
                                if (t) {
                                    var r = ao(e, n);
                                    if (r < t && Ua(e[r], n)) return r
                                }
                                return -1
                            }, Ut.sortedLastIndex = function(e, n) {
                                return ao(e, n, !0)
                            }, Ut.sortedLastIndexBy = function(e, n, t) {
                                return uo(e, n, si(t, 2), !0)
                            }, Ut.sortedLastIndexOf = function(e, n) {
                                if (null == e ? 0 : e.length) {
                                    var t = ao(e, n, !0) - 1;
                                    if (Ua(e[t], n)) return t
                                }
                                return -1
                            }, Ut.startCase = Gu, Ut.startsWith = function(e, n, t) {
                                return e = bu(e), t = null == t ? 0 : cr(vu(t), 0, e.length), n = so(n), e.slice(t, t + n.length) == n
                            }, Ut.subtract = xc, Ut.sum = function(e) {
                                return e && e.length ? Yn(e, oc) : 0
                            }, Ut.sumBy = function(e, n) {
                                return e && e.length ? Yn(e, si(n, 2)) : 0
                            }, Ut.template = function(e, n, t) {
                                var r = Ut.templateSettings;
                                t && _i(e, n, t) && (n = o), e = bu(e), n = Su({}, n, r, ei);
                                var i, a, u = Su({}, n.imports, r.imports, ei),
                                    c = Ru(u),
                                    l = nt(u, c),
                                    s = 0,
                                    f = n.interpolate || Se,
                                    d = "__p += '",
                                    p = ke((n.escape || Se).source + "|" + f.source + "|" + (f === ee ? he : Se).source + "|" + (n.evaluate || Se).source + "|$", "g"),
                                    h = "//# sourceURL=" + (Ie.call(n, "sourceURL") ? (n.sourceURL + "").replace(/\s/g, " ") : "lodash.templateSources[" + ++cn + "]") + "\n";
                                e.replace(p, (function(n, t, r, o, u, c) {
                                    return r || (r = o), d += e.slice(s, c).replace(Ee, ut), t && (i = !0, d += "' +\n__e(" + t + ") +\n'"), u && (a = !0, d += "';\n" + u + ";\n__p += '"), r && (d += "' +\n((__t = (" + r + ")) == null ? '' : __t) +\n'"), s = c + n.length, n
                                })), d += "';\n";
                                var v = Ie.call(n, "variable") && n.variable;
                                if (v) {
                                    if (de.test(v)) throw new Ae("Invalid `variable` option passed into `_.template`")
                                } else d = "with (obj) {\n" + d + "\n}\n";
                                d = (a ? d.replace($, "") : d).replace(K, "$1").replace(H, "$1;"), d = "function(" + (v || "obj") + ") {\n" + (v ? "" : "obj || (obj = {});\n") + "var __t, __p = ''" + (i ? ", __e = _.escape" : "") + (a ? ", __j = Array.prototype.join;\nfunction print() { __p += __j.call(arguments, '') }\n" : ";\n") + d + "return __p\n}";
                                var g = Qu((function() {
                                    return xe(c, h + "return " + d).apply(o, l)
                                }));
                                if (g.source = d, Ya(g)) throw g;
                                return g
                            }, Ut.times = function(e, n) {
                                if ((e = vu(e)) < 1 || e > h) return [];
                                var t = g,
                                    r = wt(e, g);
                                n = si(n), e -= g;
                                for (var o = Jn(r, n); ++t < e;) n(t);
                                return o
                            }, Ut.toFinite = hu, Ut.toInteger = vu, Ut.toLength = gu, Ut.toLower = function(e) {
                                return bu(e).toLowerCase()
                            }, Ut.toNumber = mu, Ut.toSafeInteger = function(e) {
                                return e ? cr(vu(e), -9007199254740991, h) : 0 === e ? e : 0
                            }, Ut.toString = bu, Ut.toUpper = function(e) {
                                return bu(e).toUpperCase()
                            }, Ut.trim = function(e, n, t) {
                                if ((e = bu(e)) && (t || n === o)) return Qn(e);
                                if (!e || !(n = so(n))) return e;
                                var r = vt(e),
                                    i = vt(n);
                                return Eo(r, rt(r, i), ot(r, i) + 1).join("")
                            }, Ut.trimEnd = function(e, n, t) {
                                if ((e = bu(e)) && (t || n === o)) return e.slice(0, gt(e) + 1);
                                if (!e || !(n = so(n))) return e;
                                var r = vt(e);
                                return Eo(r, 0, ot(r, vt(n)) + 1).join("")
                            }, Ut.trimStart = function(e, n, t) {
                                if ((e = bu(e)) && (t || n === o)) return e.replace(ae, "");
                                if (!e || !(n = so(n))) return e;
                                var r = vt(e);
                                return Eo(r, rt(r, vt(n))).join("")
                            }, Ut.truncate = function(e, n) {
                                var t = 30,
                                    r = "...";
                                if (nu(n)) {
                                    var i = "separator" in n ? n.separator : i;
                                    t = "length" in n ? vu(n.length) : t, r = "omission" in n ? so(n.omission) : r
                                }
                                var a = (e = bu(e)).length;
                                if (ct(e)) {
                                    var u = vt(e);
                                    a = u.length
                                }
                                if (t >= a) return e;
                                var c = t - ht(r);
                                if (c < 1) return r;
                                var l = u ? Eo(u, 0, c).join("") : e.slice(0, c);
                                if (i === o) return l + r;
                                if (u && (c += l.length - c), au(i)) {
                                    if (e.slice(c).search(i)) {
                                        var s, f = l;
                                        for (i.global || (i = ke(i.source, bu(ve.exec(i)) + "g")), i.lastIndex = 0; s = i.exec(f);) var d = s.index;
                                        l = l.slice(0, d === o ? c : d)
                                    }
                                } else if (e.indexOf(so(i), c) != c) {
                                    var p = l.lastIndexOf(i);
                                    p > -1 && (l = l.slice(0, p))
                                }
                                return l + r
                            }, Ut.unescape = function(e) {
                                return (e = bu(e)) && X.test(e) ? e.replace(Z, mt) : e
                            }, Ut.uniqueId = function(e) {
                                var n = ++De;
                                return bu(e) + n
                            }, Ut.upperCase = Xu, Ut.upperFirst = Yu, Ut.each = ba, Ut.eachRight = wa, Ut.first = Hi, cc(Ut, (Sc = {}, _r(Ut, (function(e, n) {
                                Ie.call(Ut.prototype, n) || (Sc[n] = e)
                            })), Sc), {
                                chain: !1
                            }), Ut.VERSION = "4.17.21", Tn(["bind", "bindKey", "curry", "curryRight", "partial", "partialRight"], (function(e) {
                                Ut[e].placeholder = Ut
                            })), Tn(["drop", "take"], (function(e, n) {
                                $t.prototype[e] = function(t) {
                                    t = t === o ? 1 : bt(vu(t), 0);
                                    var r = this.__filtered__ && !n ? new $t(this) : this.clone();
                                    return r.__filtered__ ? r.__takeCount__ = wt(t, r.__takeCount__) : r.__views__.push({
                                        size: wt(t, g),
                                        type: e + (r.__dir__ < 0 ? "Right" : "")
                                    }), r
                                }, $t.prototype[e + "Right"] = function(n) {
                                    return this.reverse()[e](n).reverse()
                                }
                            })), Tn(["filter", "map", "takeWhile"], (function(e, n) {
                                var t = n + 1,
                                    r = 1 == t || 3 == t;
                                $t.prototype[e] = function(e) {
                                    var n = this.clone();
                                    return n.__iteratees__.push({
                                        iteratee: si(e, 3),
                                        type: t
                                    }), n.__filtered__ = n.__filtered__ || r, n
                                }
                            })), Tn(["head", "last"], (function(e, n) {
                                var t = "take" + (n ? "Right" : "");
                                $t.prototype[e] = function() {
                                    return this[t](1).value()[0]
                                }
                            })), Tn(["initial", "tail"], (function(e, n) {
                                var t = "drop" + (n ? "" : "Right");
                                $t.prototype[e] = function() {
                                    return this.__filtered__ ? new $t(this) : this[t](1)
                                }
                            })), $t.prototype.compact = function() {
                                return this.filter(oc)
                            }, $t.prototype.find = function(e) {
                                return this.filter(e).head()
                            }, $t.prototype.findLast = function(e) {
                                return this.reverse().find(e)
                            }, $t.prototype.invokeMap = Yr((function(e, n) {
                                return "function" == typeof e ? new $t(this) : this.map((function(t) {
                                    return jr(t, e, n)
                                }))
                            })), $t.prototype.reject = function(e) {
                                return this.filter(Ia(si(e)))
                            }, $t.prototype.slice = function(e, n) {
                                e = vu(e);
                                var t = this;
                                return t.__filtered__ && (e > 0 || n < 0) ? new $t(t) : (e < 0 ? t = t.takeRight(-e) : e && (t = t.drop(e)), n !== o && (t = (n = vu(n)) < 0 ? t.dropRight(-n) : t.take(n - e)), t)
                            }, $t.prototype.takeRightWhile = function(e) {
                                return this.reverse().takeWhile(e).reverse()
                            }, $t.prototype.toArray = function() {
                                return this.take(g)
                            }, _r($t.prototype, (function(e, n) {
                                var t = /^(?:filter|find|map|reject)|While$/.test(n),
                                    r = /^(?:head|last)$/.test(n),
                                    i = Ut[r ? "take" + ("last" == n ? "Right" : "") : n],
                                    a = r || /^find/.test(n);
                                i && (Ut.prototype[n] = function() {
                                    var n = this.__wrapped__,
                                        u = r ? [1] : arguments,
                                        c = n instanceof $t,
                                        l = u[0],
                                        s = c || $a(n),
                                        f = function(e) {
                                            var n = i.apply(Ut, Dn([e], u));
                                            return r && d ? n[0] : n
                                        };
                                    s && t && "function" == typeof l && 1 != l.length && (c = s = !1);
                                    var d = this.__chain__,
                                        p = !!this.__actions__.length,
                                        h = a && !d,
                                        v = c && !p;
                                    if (!a && s) {
                                        n = v ? n : new $t(this);
                                        var g = e.apply(n, u);
                                        return g.__actions__.push({
                                            func: ha,
                                            args: [f],
                                            thisArg: o
                                        }), new qt(g, d)
                                    }
                                    return h && v ? e.apply(this, u) : (g = this.thru(f), h ? r ? g.value()[0] : g.value() : g)
                                })
                            })), Tn(["pop", "push", "shift", "sort", "splice", "unshift"], (function(e) {
                                var n = je[e],
                                    t = /^(?:push|sort|unshift)$/.test(e) ? "tap" : "thru",
                                    r = /^(?:pop|shift)$/.test(e);
                                Ut.prototype[e] = function() {
                                    var e = arguments;
                                    if (r && !this.__chain__) {
                                        var o = this.value();
                                        return n.apply($a(o) ? o : [], e)
                                    }
                                    return this[t]((function(t) {
                                        return n.apply($a(t) ? t : [], e)
                                    }))
                                }
                            })), _r($t.prototype, (function(e, n) {
                                var t = Ut[n];
                                if (t) {
                                    var r = t.name + "";
                                    Ie.call(Rt, r) || (Rt[r] = []), Rt[r].push({
                                        name: n,
                                        func: t
                                    })
                                }
                            })), Rt[Wo(o, 2).name] = [{
                                name: "wrapper",
                                func: o
                            }], $t.prototype.clone = function() {
                                var e = new $t(this.__wrapped__);
                                return e.__actions__ = jo(this.__actions__), e.__dir__ = this.__dir__, e.__filtered__ = this.__filtered__, e.__iteratees__ = jo(this.__iteratees__), e.__takeCount__ = this.__takeCount__, e.__views__ = jo(this.__views__), e
                            }, $t.prototype.reverse = function() {
                                if (this.__filtered__) {
                                    var e = new $t(this);
                                    e.__dir__ = -1, e.__filtered__ = !0
                                } else(e = this.clone()).__dir__ *= -1;
                                return e
                            }, $t.prototype.value = function() {
                                var e = this.__wrapped__.value(),
                                    n = this.__dir__,
                                    t = $a(e),
                                    r = n < 0,
                                    o = t ? e.length : 0,
                                    i = function(e, n, t) {
                                        var r = -1,
                                            o = t.length;
                                        for (; ++r < o;) {
                                            var i = t[r],
                                                a = i.size;
                                            switch (i.type) {
                                                case "drop":
                                                    e += a;
                                                    break;
                                                case "dropRight":
                                                    n -= a;
                                                    break;
                                                case "take":
                                                    n = wt(n, e + a);
                                                    break;
                                                case "takeRight":
                                                    e = bt(e, n - a)
                                            }
                                        }
                                        return {
                                            start: e,
                                            end: n
                                        }
                                    }(0, o, this.__views__),
                                    a = i.start,
                                    u = i.end,
                                    c = u - a,
                                    l = r ? u : a - 1,
                                    s = this.__iteratees__,
                                    f = s.length,
                                    d = 0,
                                    p = wt(c, this.__takeCount__);
                                if (!t || !r && o == c && p == c) return go(e, this.__actions__);
                                var h = [];
                                e: for (; c-- && d < p;) {
                                    for (var v = -1, g = e[l += n]; ++v < f;) {
                                        var m = s[v],
                                            y = m.iteratee,
                                            b = m.type,
                                            w = y(g);
                                        if (2 == b) g = w;
                                        else if (!w) {
                                            if (1 == b) continue e;
                                            break e
                                        }
                                    }
                                    h[d++] = g
                                }
                                return h
                            }, Ut.prototype.at = va, Ut.prototype.chain = function() {
                                return pa(this)
                            }, Ut.prototype.commit = function() {
                                return new qt(this.value(), this.__chain__)
                            }, Ut.prototype.next = function() {
                                this.__values__ === o && (this.__values__ = pu(this.value()));
                                var e = this.__index__ >= this.__values__.length;
                                return {
                                    done: e,
                                    value: e ? o : this.__values__[this.__index__++]
                                }
                            }, Ut.prototype.plant = function(e) {
                                for (var n, t = this; t instanceof Vt;) {
                                    var r = Bi(t);
                                    r.__index__ = 0, r.__values__ = o, n ? i.__wrapped__ = r : n = r;
                                    var i = r;
                                    t = t.__wrapped__
                                }
                                return i.__wrapped__ = e, n
                            }, Ut.prototype.reverse = function() {
                                var e = this.__wrapped__;
                                if (e instanceof $t) {
                                    var n = e;
                                    return this.__actions__.length && (n = new $t(this)), (n = n.reverse()).__actions__.push({
                                        func: ha,
                                        args: [na],
                                        thisArg: o
                                    }), new qt(n, this.__chain__)
                                }
                                return this.thru(na)
                            }, Ut.prototype.toJSON = Ut.prototype.valueOf = Ut.prototype.value = function() {
                                return go(this.__wrapped__, this.__actions__)
                            }, Ut.prototype.first = Ut.prototype.head, Je && (Ut.prototype[Je] = function() {
                                return this
                            }), Ut
                        }();
                        gn._ = yt, (r = function() {
                            return yt
                        }.call(n, t, n, e)) === o || (e.exports = r)
                    }.call(this)
            }
        },
        n = {};

    function t(r) {
        var o = n[r];
        if (void 0 !== o) return o.exports;
        var i = n[r] = {
            id: r,
            loaded: !1,
            exports: {}
        };
        return e[r].call(i.exports, i, i.exports, t), i.loaded = !0, i.exports
    }
    t.n = function(e) {
            var n = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return t.d(n, {
                a: n
            }), n
        }, t.d = function(e, n) {
            for (var r in n) t.o(n, r) && !t.o(e, r) && Object.defineProperty(e, r, {
                enumerable: !0,
                get: n[r]
            })
        }, t.g = function() {
            if ("object" == typeof globalThis) return globalThis;
            try {
                return this || new Function("return this")()
            } catch (e) {
                if ("object" == typeof window) return window
            }
        }(), t.o = function(e, n) {
            return Object.prototype.hasOwnProperty.call(e, n)
        }, t.nmd = function(e) {
            return e.paths = [], e.children || (e.children = []), e
        }, t.nc = void 0,
        function() {
            "use strict";
            var e = Roblox,
                n = t.n(e),
                r = React,
                o = t.n(r),
                i = ReactDOM,
                a = t.n(i),
                u = function() {
                    return u = Object.assign || function(e) {
                        for (var n, t = 1, r = arguments.length; t < r; t++)
                            for (var o in n = arguments[t]) Object.prototype.hasOwnProperty.call(n, o) && (e[o] = n[o]);
                        return e
                    }, u.apply(this, arguments)
                };

            function c(e, n) {
                var t = {};
                for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && n.indexOf(r) < 0 && (t[r] = e[r]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                    var o = 0;
                    for (r = Object.getOwnPropertySymbols(e); o < r.length; o++) n.indexOf(r[o]) < 0 && Object.prototype.propertyIsEnumerable.call(e, r[o]) && (t[r[o]] = e[r[o]])
                }
                return t
            }

            function l(e) {
                var n, t, r = "";
                if ("string" == typeof e || "number" == typeof e) r += e;
                else if ("object" == typeof e)
                    if (Array.isArray(e)) {
                        var o = e.length;
                        for (n = 0; n < o; n++) e[n] && (t = l(e[n])) && (r && (r += " "), r += t)
                    } else
                        for (t in e) e[t] && (r && (r += " "), r += t);
                return r
            }
            var s = function() {
                    for (var e, n, t = 0, r = "", o = arguments.length; t < o; t++)(e = arguments[t]) && (n = l(e)) && (r && (r += " "), r += n);
                    return r
                },
                f = ReactJSX;

            function d(e, n) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, n) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var t = [],
                        r = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = e[Symbol.iterator](); !(r = (a = u.next()).done) && (t.push(a.value), !n || t.length !== n); r = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return t
                }(e, n) || function(e, n) {
                    if (!e) return;
                    if ("string" == typeof e) return p(e, n);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === t && e.constructor && (t = e.constructor.name);
                    if ("Map" === t || "Set" === t) return Array.from(e);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return p(e, n)
                }(e, n) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function p(e, n) {
                (null == n || n > e.length) && (n = e.length);
                for (var t = 0, r = new Array(n); t < n; t++) r[t] = e[t];
                return r
            }
            var h = null !== globalThis && void 0 !== globalThis && globalThis.document ? r.useLayoutEffect : function() {},
                v = r[" useId ".trim().toString()] || function() {},
                g = 0;

            function m(e) {
                var n = d(r.useState(v()), 2),
                    t = n[0],
                    o = n[1];
                return h((function() {
                    e || o((function(e) {
                        return null != e ? e : String(g++)
                    }))
                }), [e]), e || (t ? "radix-".concat(t) : "")
            }
            var y = ["children"],
                b = ["children"],
                w = ["asChild"],
                _ = ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"],
                S = ["children"],
                E = ["children"],
                A = ["asChild"],
                x = ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"],
                O = ["children"],
                C = ["children"],
                k = ["asChild"],
                P = ["container"];

            function T(e, n) {
                var t;
                if ("undefined" == typeof Symbol || null == e[Symbol.iterator]) {
                    if (Array.isArray(e) || (t = N(e)) || n && e && "number" == typeof e.length) {
                        t && (e = t);
                        var r = 0,
                            o = function() {};
                        return {
                            s: o,
                            n: function() {
                                return r >= e.length ? {
                                    done: !0
                                } : {
                                    done: !1,
                                    value: e[r++]
                                }
                            },
                            e: function(e) {
                                throw e
                            },
                            f: o
                        }
                    }
                    throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }
                var i, a = !0,
                    u = !1;
                return {
                    s: function() {
                        t = e[Symbol.iterator]()
                    },
                    n: function() {
                        var e = t.next();
                        return a = e.done, e
                    },
                    e: function(e) {
                        u = !0, i = e
                    },
                    f: function() {
                        try {
                            a || null == t.return || t.return()
                        } finally {
                            if (u) throw i
                        }
                    }
                }
            }

            function j(e) {
                return function(e) {
                    if (Array.isArray(e)) return L(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || N(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function R(e, n) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, n) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var t = [],
                        r = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = e[Symbol.iterator](); !(r = (a = u.next()).done) && (t.push(a.value), !n || t.length !== n); r = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return t
                }(e, n) || N(e, n) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function N(e, n) {
                if (e) {
                    if ("string" == typeof e) return L(e, n);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t ? Array.from(e) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? L(e, n) : void 0
                }
            }

            function L(e, n) {
                (null == n || n > e.length) && (n = e.length);
                for (var t = 0, r = new Array(n); t < n; t++) r[t] = e[t];
                return r
            }

            function M(e, n) {
                var t = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    n && (r = r.filter((function(n) {
                        return Object.getOwnPropertyDescriptor(e, n).enumerable
                    }))), t.push.apply(t, r)
                }
                return t
            }

            function I(e) {
                for (var n = 1; n < arguments.length; n++) {
                    var t = null != arguments[n] ? arguments[n] : {};
                    n % 2 ? M(Object(t), !0).forEach((function(n) {
                        D(e, n, t[n])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : M(Object(t)).forEach((function(n) {
                        Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                    }))
                }
                return e
            }

            function D(e, n, t) {
                return n in e ? Object.defineProperty(e, n, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[n] = t, e
            }

            function z(e, n) {
                if (null == e) return {};
                var t, r, o = function(e, n) {
                    if (null == e) return {};
                    var t, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) t = i[r], n.indexOf(t) >= 0 || (o[t] = e[t]);
                    return o
                }(e, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) t = i[r], n.indexOf(t) >= 0 || Object.prototype.propertyIsEnumerable.call(e, t) && (o[t] = e[t])
                }
                return o
            }

            function F(e, n) {
                var t = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    r = void 0 === t || t;
                return function(t) {
                    if (null != e && e(t), !1 === r || !t.defaultPrevented) return null == n ? void 0 : n(t)
                }
            }

            function B(e, n) {
                if ("function" == typeof e) return e(n);
                null != e && (e.current = n)
            }

            function U() {
                for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                return function(e) {
                    var t = !1,
                        r = n.map((function(n) {
                            var r = B(n, e);
                            return t || "function" != typeof r || (t = !0), r
                        }));
                    if (t) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var t = r[e];
                            "function" == typeof t ? t() : B(n[e], null)
                        }
                    }
                }
            }

            function W() {
                for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                return r.useCallback(U.apply(void 0, n), n)
            }
            var V = Symbol("radix.slottable");

            function q(e) {
                return r.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === V
            }
            var $ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, n) {
                var t = function(e) {
                        var n = function(e) {
                                var n = r.forwardRef((function(e, n) {
                                    var t = e.children,
                                        o = z(e, y);
                                    if (r.isValidElement(t)) {
                                        var i = function(e) {
                                                var n, t, r = null === (n = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === n ? void 0 : n.get,
                                                    o = r && "isReactWarning" in r && r.isReactWarning;
                                                return o ? e.ref : (o = (r = null === (t = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === t ? void 0 : t.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                            }(t),
                                            a = function(e, n) {
                                                var t = I({}, n),
                                                    r = function(r) {
                                                        var o = e[r],
                                                            i = n[r];
                                                        /^on[A-Z]/.test(r) ? o && i ? t[r] = function() {
                                                            i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                        } : o && (t[r] = o) : "style" === r ? t[r] = I(I({}, o), i) : "className" === r && (t[r] = [o, i].filter(Boolean).join(" "))
                                                    };
                                                for (var o in n) r(o);
                                                return I(I({}, e), t)
                                            }(o, t.props);
                                        return t.type !== r.Fragment && (a.ref = n ? U(n, i) : i), r.cloneElement(t, a)
                                    }
                                    return r.Children.count(t) > 1 ? r.Children.only(null) : null
                                }));
                                return n.displayName = "".concat(e, ".SlotClone"), n
                            }(e),
                            t = r.forwardRef((function(e, t) {
                                var o = e.children,
                                    i = z(e, b),
                                    a = r.Children.toArray(o),
                                    u = a.find(q);
                                if (u) {
                                    var c = u.props.children,
                                        l = a.map((function(e) {
                                            return e === u ? r.Children.count(c) > 1 ? r.Children.only(null) : r.isValidElement(c) ? c.props.children : null : e
                                        }));
                                    return (0, f.jsx)(n, I(I({}, i), {}, {
                                        ref: t,
                                        children: r.isValidElement(c) ? r.cloneElement(c, void 0, l) : null
                                    }))
                                }
                                return (0, f.jsx)(n, I(I({}, i), {}, {
                                    ref: t,
                                    children: o
                                }))
                            }));
                        return t.displayName = "".concat(e, ".Slot"), t
                    }("Primitive.".concat(n)),
                    o = r.forwardRef((function(e, r) {
                        var o = e.asChild,
                            i = z(e, w),
                            a = o ? t : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, f.jsx)(a, I(I({}, i), {}, {
                            ref: r
                        }))
                    }));
                return o.displayName = "Primitive.".concat(n), I(I({}, e), {}, D({}, n, o))
            }), {});

            function K(e) {
                var n = r.useRef(e);
                return r.useEffect((function() {
                    n.current = e
                })), r.useMemo((function() {
                    return function() {
                        for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                        return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                    }
                }), [])
            }
            var H, Z = "dismissableLayer.update",
                G = r.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                X = r.forwardRef((function(e, n) {
                    var t, o = e.disableOutsidePointerEvents,
                        i = void 0 !== o && o,
                        a = e.onEscapeKeyDown,
                        u = e.onPointerDownOutside,
                        c = e.onFocusOutside,
                        l = e.onInteractOutside,
                        s = e.onDismiss,
                        d = z(e, _),
                        p = r.useContext(G),
                        h = R(r.useState(null), 2),
                        v = h[0],
                        g = h[1],
                        m = null !== (t = null == v ? void 0 : v.ownerDocument) && void 0 !== t ? t : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                        y = R(r.useState({}), 2)[1],
                        b = W(n, (function(e) {
                            return g(e)
                        })),
                        w = Array.from(p.layers),
                        S = R(j(p.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        E = w.indexOf(S),
                        A = v ? w.indexOf(v) : -1,
                        x = p.layersWithOutsidePointerEventsDisabled.size > 0,
                        O = A >= E,
                        C = function(e) {
                            var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                                t = K(e),
                                o = r.useRef(!1),
                                i = r.useRef((function() {}));
                            return r.useEffect((function() {
                                var e = function(e) {
                                        if (e.target && !o.current) {
                                            var r = function() {
                                                    J("dismissableLayer.pointerDownOutside", t, a, {
                                                        discrete: !0
                                                    })
                                                },
                                                a = {
                                                    originalEvent: e
                                                };
                                            "touch" === e.pointerType ? (n.removeEventListener("click", i.current), i.current = r, n.addEventListener("click", i.current, {
                                                once: !0
                                            })) : r()
                                        } else n.removeEventListener("click", i.current);
                                        o.current = !1
                                    },
                                    r = window.setTimeout((function() {
                                        n.addEventListener("pointerdown", e)
                                    }), 0);
                                return function() {
                                    window.clearTimeout(r), n.removeEventListener("pointerdown", e), n.removeEventListener("click", i.current)
                                }
                            }), [n, t]), {
                                onPointerDownCapture: function() {
                                    return o.current = !0
                                }
                            }
                        }((function(e) {
                            var n = e.target,
                                t = j(p.branches).some((function(e) {
                                    return e.contains(n)
                                }));
                            O && !t && (null != u && u(e), null != l && l(e), e.defaultPrevented || null == s || s())
                        }), m),
                        k = function(e) {
                            var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                                t = K(e),
                                o = r.useRef(!1);
                            return r.useEffect((function() {
                                var e = function(e) {
                                    e.target && !o.current && J("dismissableLayer.focusOutside", t, {
                                        originalEvent: e
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return n.addEventListener("focusin", e),
                                    function() {
                                        return n.removeEventListener("focusin", e)
                                    }
                            }), [n, t]), {
                                onFocusCapture: function() {
                                    return o.current = !0
                                },
                                onBlurCapture: function() {
                                    return o.current = !1
                                }
                            }
                        }((function(e) {
                            var n = e.target;
                            j(p.branches).some((function(e) {
                                return e.contains(n)
                            })) || (null != c && c(e), null != l && l(e), e.defaultPrevented || null == s || s())
                        }), m);
                    return function(e) {
                        var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                            t = function(e) {
                                var n = r.useRef(e);
                                return r.useEffect((function() {
                                    n.current = e
                                })), r.useMemo((function() {
                                    return function() {
                                        for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                                        return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                                    }
                                }), [])
                            }(e);
                        r.useEffect((function() {
                            var e = function(e) {
                                "Escape" === e.key && t(e)
                            };
                            return n.addEventListener("keydown", e, {
                                    capture: !0
                                }),
                                function() {
                                    return n.removeEventListener("keydown", e, {
                                        capture: !0
                                    })
                                }
                        }), [t, n])
                    }((function(e) {
                        A === p.layers.size - 1 && (null != a && a(e), !e.defaultPrevented && s && (e.preventDefault(), s()))
                    }), m), r.useEffect((function() {
                        if (v) return i && (0 === p.layersWithOutsidePointerEventsDisabled.size && (H = m.body.style.pointerEvents, m.body.style.pointerEvents = "none"), p.layersWithOutsidePointerEventsDisabled.add(v)), p.layers.add(v), Y(),
                            function() {
                                i && 1 === p.layersWithOutsidePointerEventsDisabled.size && (m.body.style.pointerEvents = H)
                            }
                    }), [v, m, i, p]), r.useEffect((function() {
                        return function() {
                            v && (p.layers.delete(v), p.layersWithOutsidePointerEventsDisabled.delete(v), Y())
                        }
                    }), [v, p]), r.useEffect((function() {
                        var e = function() {
                            return y({})
                        };
                        return document.addEventListener(Z, e),
                            function() {
                                return document.removeEventListener(Z, e)
                            }
                    }), []), (0, f.jsx)($.div, I(I({}, d), {}, {
                        ref: b,
                        style: I({
                            pointerEvents: x ? O ? "auto" : "none" : void 0
                        }, e.style),
                        onFocusCapture: F(e.onFocusCapture, k.onFocusCapture),
                        onBlurCapture: F(e.onBlurCapture, k.onBlurCapture),
                        onPointerDownCapture: F(e.onPointerDownCapture, C.onPointerDownCapture)
                    }))
                }));

            function Y() {
                var e = new CustomEvent(Z);
                document.dispatchEvent(e)
            }

            function J(e, n, t, r) {
                var o = r.discrete,
                    a = t.originalEvent.target,
                    u = new CustomEvent(e, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: t
                    });
                n && a.addEventListener(e, n, {
                    once: !0
                }), o ? function(e, n) {
                    e && i.flushSync((function() {
                        return e.dispatchEvent(n)
                    }))
                }(a, u) : a.dispatchEvent(u)
            }
            X.displayName = "DismissableLayer", r.forwardRef((function(e, n) {
                var t = r.useContext(G),
                    o = r.useRef(null),
                    i = W(n, o);
                return r.useEffect((function() {
                    var e = o.current;
                    if (e) return t.branches.add(e),
                        function() {
                            t.branches.delete(e)
                        }
                }), [t.branches]), (0, f.jsx)($.div, I(I({}, e), {}, {
                    ref: i
                }))
            })).displayName = "DismissableLayerBranch";
            var Q = 0;

            function ee() {
                var e = document.createElement("span");
                return e.setAttribute("data-radix-focus-guard", ""), e.tabIndex = 0, e.style.outline = "none", e.style.opacity = "0", e.style.position = "fixed", e.style.pointerEvents = "none", e
            }

            function ne(e, n) {
                if ("function" == typeof e) return e(n);
                null != e && (e.current = n)
            }

            function te() {
                for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                return function(e) {
                    var t = !1,
                        r = n.map((function(n) {
                            var r = ne(n, e);
                            return t || "function" != typeof r || (t = !0), r
                        }));
                    if (t) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var t = r[e];
                            "function" == typeof t ? t() : ne(n[e], null)
                        }
                    }
                }
            }
            var re = Symbol("radix.slottable");

            function oe(e) {
                return r.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === re
            }
            var ie = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, n) {
                var t = function(e) {
                        var n = function(e) {
                                var n = r.forwardRef((function(e, n) {
                                    var t = e.children,
                                        o = z(e, S);
                                    if (r.isValidElement(t)) {
                                        var i = function(e) {
                                                var n, t, r = null === (n = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === n ? void 0 : n.get,
                                                    o = r && "isReactWarning" in r && r.isReactWarning;
                                                return o ? e.ref : (o = (r = null === (t = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === t ? void 0 : t.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                            }(t),
                                            a = function(e, n) {
                                                var t = I({}, n),
                                                    r = function(r) {
                                                        var o = e[r],
                                                            i = n[r];
                                                        /^on[A-Z]/.test(r) ? o && i ? t[r] = function() {
                                                            i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                        } : o && (t[r] = o) : "style" === r ? t[r] = I(I({}, o), i) : "className" === r && (t[r] = [o, i].filter(Boolean).join(" "))
                                                    };
                                                for (var o in n) r(o);
                                                return I(I({}, e), t)
                                            }(o, t.props);
                                        return t.type !== r.Fragment && (a.ref = n ? te(n, i) : i), r.cloneElement(t, a)
                                    }
                                    return r.Children.count(t) > 1 ? r.Children.only(null) : null
                                }));
                                return n.displayName = "".concat(e, ".SlotClone"), n
                            }(e),
                            t = r.forwardRef((function(e, t) {
                                var o = e.children,
                                    i = z(e, E),
                                    a = r.Children.toArray(o),
                                    u = a.find(oe);
                                if (u) {
                                    var c = u.props.children,
                                        l = a.map((function(e) {
                                            return e === u ? r.Children.count(c) > 1 ? r.Children.only(null) : r.isValidElement(c) ? c.props.children : null : e
                                        }));
                                    return (0, f.jsx)(n, I(I({}, i), {}, {
                                        ref: t,
                                        children: r.isValidElement(c) ? r.cloneElement(c, void 0, l) : null
                                    }))
                                }
                                return (0, f.jsx)(n, I(I({}, i), {}, {
                                    ref: t,
                                    children: o
                                }))
                            }));
                        return t.displayName = "".concat(e, ".Slot"), t
                    }("Primitive.".concat(n)),
                    o = r.forwardRef((function(e, r) {
                        var o = e.asChild,
                            i = z(e, A),
                            a = o ? t : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, f.jsx)(a, I(I({}, i), {}, {
                            ref: r
                        }))
                    }));
                return o.displayName = "Primitive.".concat(n), I(I({}, e), {}, D({}, n, o))
            }), {});

            function ae(e) {
                var n = r.useRef(e);
                return r.useEffect((function() {
                    n.current = e
                })), r.useMemo((function() {
                    return function() {
                        for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                        return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                    }
                }), [])
            }
            var ue = "focusScope.autoFocusOnMount",
                ce = "focusScope.autoFocusOnUnmount",
                le = {
                    bubbles: !1,
                    cancelable: !0
                },
                se = r.forwardRef((function(e, n) {
                    var t = e.loop,
                        o = void 0 !== t && t,
                        i = e.trapped,
                        a = void 0 !== i && i,
                        u = e.onMountAutoFocus,
                        c = e.onUnmountAutoFocus,
                        l = z(e, x),
                        s = R(r.useState(null), 2),
                        d = s[0],
                        p = s[1],
                        h = ae(u),
                        v = ae(c),
                        g = r.useRef(null),
                        m = function() {
                            for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                            return r.useCallback(te.apply(void 0, n), n)
                        }(n, (function(e) {
                            return p(e)
                        })),
                        y = r.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    r.useEffect((function() {
                        if (a) {
                            var e = function(e) {
                                    if (!y.paused && d) {
                                        var n = e.target;
                                        d.contains(n) ? g.current = n : he(g.current, {
                                            select: !0
                                        })
                                    }
                                },
                                n = function(e) {
                                    if (!y.paused && d) {
                                        var n = e.relatedTarget;
                                        null !== n && (d.contains(n) || he(g.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", e), document.addEventListener("focusout", n);
                            var t = new MutationObserver((function(e) {
                                if (document.activeElement === document.body) {
                                    var n, t = T(e);
                                    try {
                                        for (t.s(); !(n = t.n()).done;) {
                                            n.value.removedNodes.length > 0 && he(d)
                                        }
                                    } catch (e) {
                                        t.e(e)
                                    } finally {
                                        t.f()
                                    }
                                }
                            }));
                            return d && t.observe(d, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", e), document.removeEventListener("focusout", n), t.disconnect()
                                }
                        }
                    }), [a, d, y.paused]), r.useEffect((function() {
                        if (d) {
                            ve.add(y);
                            var e = document.activeElement;
                            if (!d.contains(e)) {
                                var n = new CustomEvent(ue, le);
                                d.addEventListener(ue, h), d.dispatchEvent(n), n.defaultPrevented || (function(e) {
                                    var n, t = (arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}).select,
                                        r = void 0 !== t && t,
                                        o = document.activeElement,
                                        i = T(e);
                                    try {
                                        for (i.s(); !(n = i.n()).done;) {
                                            if (he(n.value, {
                                                    select: r
                                                }), document.activeElement !== o) return
                                        }
                                    } catch (e) {
                                        i.e(e)
                                    } finally {
                                        i.f()
                                    }
                                }(fe(d).filter((function(e) {
                                    return "A" !== e.tagName
                                })), {
                                    select: !0
                                }), document.activeElement === e && he(d))
                            }
                            return function() {
                                d.removeEventListener(ue, h), setTimeout((function() {
                                    var n = new CustomEvent(ce, le);
                                    d.addEventListener(ce, v), d.dispatchEvent(n), n.defaultPrevented || he(null != e ? e : document.body, {
                                        select: !0
                                    }), d.removeEventListener(ce, v), ve.remove(y)
                                }), 0)
                            }
                        }
                    }), [d, h, v, y]);
                    var b = r.useCallback((function(e) {
                        if ((o || a) && !y.paused) {
                            var n = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                t = document.activeElement;
                            if (n && t) {
                                var r = e.currentTarget,
                                    i = function(e) {
                                        var n = fe(e);
                                        return [de(n, e), de(n.reverse(), e)]
                                    }(r),
                                    u = R(i, 2),
                                    c = u[0],
                                    l = u[1];
                                c && l ? e.shiftKey || t !== l ? e.shiftKey && t === c && (e.preventDefault(), o && he(l, {
                                    select: !0
                                })) : (e.preventDefault(), o && he(c, {
                                    select: !0
                                })) : t === r && e.preventDefault()
                            }
                        }
                    }), [o, a, y.paused]);
                    return (0, f.jsx)(ie.div, I(I({
                        tabIndex: -1
                    }, l), {}, {
                        ref: m,
                        onKeyDown: b
                    }))
                }));

            function fe(e) {
                for (var n = [], t = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var n = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || n ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); t.nextNode();) n.push(t.currentNode);
                return n
            }

            function de(e, n) {
                var t, r = T(e);
                try {
                    for (r.s(); !(t = r.n()).done;) {
                        var o = t.value;
                        if (!pe(o, {
                                upTo: n
                            })) return o
                    }
                } catch (e) {
                    r.e(e)
                } finally {
                    r.f()
                }
            }

            function pe(e, n) {
                var t = n.upTo;
                if ("hidden" === getComputedStyle(e).visibility) return !0;
                for (; e;) {
                    if (void 0 !== t && e === t) return !1;
                    if ("none" === getComputedStyle(e).display) return !0;
                    e = e.parentElement
                }
                return !1
            }

            function he(e) {
                var n = (arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}).select,
                    t = void 0 !== n && n;
                if (e && e.focus) {
                    var r = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== r && function(e) {
                        return e instanceof HTMLInputElement && "select" in e
                    }(e) && t && e.select()
                }
            }
            se.displayName = "FocusScope";
            var ve = function() {
                var e = [];
                return {
                    add: function(n) {
                        var t = e[0];
                        n !== t && null != t && t.pause(), (e = ge(e, n)).unshift(n)
                    },
                    remove: function(n) {
                        var t;
                        null === (t = (e = ge(e, n))[0]) || void 0 === t || t.resume()
                    }
                }
            }();

            function ge(e, n) {
                var t = j(e),
                    r = t.indexOf(n);
                return -1 !== r && t.splice(r, 1), t
            }

            function me(e, n) {
                if ("function" == typeof e) return e(n);
                null != e && (e.current = n)
            }
            var ye = Symbol("radix.slottable");

            function be(e) {
                return r.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === ye
            }
            var we = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, n) {
                    var t = function(e) {
                            var n = function(e) {
                                    var n = r.forwardRef((function(e, n) {
                                        var t = e.children,
                                            o = z(e, O);
                                        if (r.isValidElement(t)) {
                                            var i = function(e) {
                                                    var n, t, r = null === (n = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === n ? void 0 : n.get,
                                                        o = r && "isReactWarning" in r && r.isReactWarning;
                                                    return o ? e.ref : (o = (r = null === (t = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === t ? void 0 : t.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                                }(t),
                                                a = function(e, n) {
                                                    var t = I({}, n),
                                                        r = function(r) {
                                                            var o = e[r],
                                                                i = n[r];
                                                            /^on[A-Z]/.test(r) ? o && i ? t[r] = function() {
                                                                i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                            } : o && (t[r] = o) : "style" === r ? t[r] = I(I({}, o), i) : "className" === r && (t[r] = [o, i].filter(Boolean).join(" "))
                                                        };
                                                    for (var o in n) r(o);
                                                    return I(I({}, e), t)
                                                }(o, t.props);
                                            return t.type !== r.Fragment && (a.ref = n ? function() {
                                                for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                                                return function(e) {
                                                    var t = !1,
                                                        r = n.map((function(n) {
                                                            var r = me(n, e);
                                                            return t || "function" != typeof r || (t = !0), r
                                                        }));
                                                    if (t) return function() {
                                                        for (var e = 0; e < r.length; e++) {
                                                            var t = r[e];
                                                            "function" == typeof t ? t() : me(n[e], null)
                                                        }
                                                    }
                                                }
                                            }(n, i) : i), r.cloneElement(t, a)
                                        }
                                        return r.Children.count(t) > 1 ? r.Children.only(null) : null
                                    }));
                                    return n.displayName = "".concat(e, ".SlotClone"), n
                                }(e),
                                t = r.forwardRef((function(e, t) {
                                    var o = e.children,
                                        i = z(e, C),
                                        a = r.Children.toArray(o),
                                        u = a.find(be);
                                    if (u) {
                                        var c = u.props.children,
                                            l = a.map((function(e) {
                                                return e === u ? r.Children.count(c) > 1 ? r.Children.only(null) : r.isValidElement(c) ? c.props.children : null : e
                                            }));
                                        return (0, f.jsx)(n, I(I({}, i), {}, {
                                            ref: t,
                                            children: r.isValidElement(c) ? r.cloneElement(c, void 0, l) : null
                                        }))
                                    }
                                    return (0, f.jsx)(n, I(I({}, i), {}, {
                                        ref: t,
                                        children: o
                                    }))
                                }));
                            return t.displayName = "".concat(e, ".Slot"), t
                        }("Primitive.".concat(n)),
                        o = r.forwardRef((function(e, r) {
                            var o = e.asChild,
                                i = z(e, k),
                                a = o ? t : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, f.jsx)(a, I(I({}, i), {}, {
                                ref: r
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(n), I(I({}, e), {}, D({}, n, o))
                }), {}),
                _e = null !== globalThis && void 0 !== globalThis && globalThis.document ? r.useLayoutEffect : function() {},
                Se = r.forwardRef((function(e, n) {
                    var t, o = e.container,
                        i = z(e, P),
                        u = R(r.useState(!1), 2),
                        c = u[0],
                        l = u[1];
                    _e((function() {
                        return l(!0)
                    }), []);
                    var s = o || c && (null === globalThis || void 0 === globalThis || null === (t = globalThis.document) || void 0 === t ? void 0 : t.body);
                    return s ? a().createPortal((0, f.jsx)(we.div, I(I({}, i), {}, {
                        ref: n
                    })), s) : null
                }));
            Se.displayName = "Portal";
            var Ee = new WeakMap,
                Ae = new WeakMap,
                xe = {},
                Oe = 0,
                Ce = function e(n) {
                    return n && (n.host || e(n.parentNode))
                },
                ke = function(e, n, t) {
                    void 0 === t && (t = "data-aria-hidden");
                    var r = Array.from(Array.isArray(e) ? e : [e]),
                        o = n || function(e) {
                            return "undefined" == typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body
                        }(e);
                    return o ? (r.push.apply(r, Array.from(o.querySelectorAll("[aria-live]"))), function(e, n, t, r) {
                        var o = function(e, n) {
                            return n.map((function(n) {
                                if (e.contains(n)) return n;
                                var t = Ce(n);
                                return t && e.contains(t) ? t : (console.error("aria-hidden", n, "in not contained inside", e, ". Doing nothing"), null)
                            })).filter((function(e) {
                                return Boolean(e)
                            }))
                        }(n, Array.isArray(e) ? e : [e]);
                        xe[t] || (xe[t] = new WeakMap);
                        var i = xe[t],
                            a = [],
                            u = new Set,
                            c = new Set(o);
                        return o.forEach((function e(n) {
                                n && !u.has(n) && (u.add(n), e(n.parentNode))
                            })),
                            function e(n) {
                                n && !c.has(n) && Array.prototype.forEach.call(n.children, (function(n) {
                                    if (u.has(n)) e(n);
                                    else try {
                                        var o = n.getAttribute(r),
                                            c = null !== o && "false" !== o,
                                            l = (Ee.get(n) || 0) + 1,
                                            s = (i.get(n) || 0) + 1;
                                        Ee.set(n, l), i.set(n, s), a.push(n), 1 === l && c && Ae.set(n, !0), 1 === s && n.setAttribute(t, "true"), c || n.setAttribute(r, "true")
                                    } catch (o) {
                                        console.error("aria-hidden: cannot operate on ", n, o)
                                    }
                                }))
                            }(n), u.clear(), Oe++,
                            function() {
                                a.forEach((function(e) {
                                    var n = Ee.get(e) - 1,
                                        o = i.get(e) - 1;
                                    Ee.set(e, n), i.set(e, o), n || (Ae.has(e) || e.removeAttribute(r), Ae.delete(e)), o || e.removeAttribute(t)
                                })), --Oe || (Ee = new WeakMap, Ee = new WeakMap, Ae = new WeakMap, xe = {})
                            }
                    }(r, o, t, "aria-hidden")) : function() {
                        return null
                    }
                },
                Pe = "right-scroll-bar-position",
                Te = "width-before-scroll-bar";

            function je(e, n) {
                return "function" == typeof e ? e(n) : e && (e.current = n), e
            }
            var Re = "undefined" != typeof window ? r.useLayoutEffect : r.useEffect,
                Ne = new WeakMap;

            function Le(e) {
                return e
            }
            var Me = function(e) {
                var n = e.sideCar,
                    t = c(e, ["sideCar"]);
                if (!n) throw new Error("Sidecar: please provide `sideCar` property to import the right car");
                var o = n.read();
                if (!o) throw new Error("Sidecar medium not found");
                return r.createElement(o, u({}, t))
            };
            Me.isSideCarExport = !0;
            var Ie = function(e) {
                    void 0 === e && (e = {});
                    var n = function(e, n) {
                        void 0 === n && (n = Le);
                        var t = [],
                            r = !1;
                        return {
                            read: function() {
                                if (r) throw new Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                                return t.length ? t[t.length - 1] : null
                            },
                            useMedium: function(e) {
                                var o = n(e, r);
                                return t.push(o),
                                    function() {
                                        t = t.filter((function(e) {
                                            return e !== o
                                        }))
                                    }
                            },
                            assignSyncMedium: function(e) {
                                for (r = !0; t.length;) {
                                    var n = t;
                                    t = [], n.forEach(e)
                                }
                                t = {
                                    push: function(n) {
                                        return e(n)
                                    },
                                    filter: function() {
                                        return t
                                    }
                                }
                            },
                            assignMedium: function(e) {
                                r = !0;
                                var n = [];
                                if (t.length) {
                                    var o = t;
                                    t = [], o.forEach(e), n = t
                                }
                                var i = function() {
                                        var t = n;
                                        n = [], t.forEach(e)
                                    },
                                    a = function() {
                                        return Promise.resolve().then(i)
                                    };
                                a(), t = {
                                    push: function(e) {
                                        n.push(e), a()
                                    },
                                    filter: function(e) {
                                        return n = n.filter(e), t
                                    }
                                }
                            }
                        }
                    }();
                    return n.options = u({
                        async: !0,
                        ssr: !1
                    }, e), n
                }(),
                De = function() {},
                ze = r.forwardRef((function(e, n) {
                    var t = r.useRef(null),
                        o = r.useState({
                            onScrollCapture: De,
                            onWheelCapture: De,
                            onTouchMoveCapture: De
                        }),
                        i = o[0],
                        a = o[1],
                        l = e.forwardProps,
                        s = e.children,
                        f = e.className,
                        d = e.removeScrollBar,
                        p = e.enabled,
                        h = e.shards,
                        v = e.sideCar,
                        g = e.noIsolation,
                        m = e.inert,
                        y = e.allowPinchZoom,
                        b = e.as,
                        w = void 0 === b ? "div" : b,
                        _ = e.gapMode,
                        S = c(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        E = v,
                        A = function(e, n) {
                            var t, o, i, a = (t = n || null, o = function(n) {
                                return e.forEach((function(e) {
                                    return je(e, n)
                                }))
                            }, (i = (0, r.useState)((function() {
                                return {
                                    value: t,
                                    callback: o,
                                    facade: {
                                        get current() {
                                            return i.value
                                        },
                                        set current(e) {
                                            var n = i.value;
                                            n !== e && (i.value = e, i.callback(e, n))
                                        }
                                    }
                                }
                            }))[0]).callback = o, i.facade);
                            return Re((function() {
                                var n = Ne.get(a);
                                if (n) {
                                    var t = new Set(n),
                                        r = new Set(e),
                                        o = a.current;
                                    t.forEach((function(e) {
                                        r.has(e) || je(e, null)
                                    })), r.forEach((function(e) {
                                        t.has(e) || je(e, o)
                                    }))
                                }
                                Ne.set(a, e)
                            }), [e]), a
                        }([t, n]),
                        x = u(u({}, S), i);
                    return r.createElement(r.Fragment, null, p && r.createElement(E, {
                        sideCar: Ie,
                        removeScrollBar: d,
                        shards: h,
                        noIsolation: g,
                        inert: m,
                        setCallbacks: a,
                        allowPinchZoom: !!y,
                        lockRef: t,
                        gapMode: _
                    }), l ? r.cloneElement(r.Children.only(s), u(u({}, x), {
                        ref: A
                    })) : r.createElement(w, u({}, x, {
                        className: f,
                        ref: A
                    }), s))
                }));
            ze.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, ze.classNames = {
                fullWidth: Te,
                zeroRight: Pe
            };
            var Fe = function() {
                    var e = 0,
                        n = null;
                    return {
                        add: function(r) {
                            var o, i;
                            0 == e && (n = function() {
                                if (!document) return null;
                                var e = document.createElement("style");
                                e.type = "text/css";
                                var n = t.nc;
                                return n && e.setAttribute("nonce", n), e
                            }()) && (i = r, (o = n).styleSheet ? o.styleSheet.cssText = i : o.appendChild(document.createTextNode(i)), function(e) {
                                (document.head || document.getElementsByTagName("head")[0]).appendChild(e)
                            }(n)), e++
                        },
                        remove: function() {
                            !--e && n && (n.parentNode && n.parentNode.removeChild(n), n = null)
                        }
                    }
                },
                Be = function() {
                    var e, n = (e = Fe(), function(n, t) {
                        r.useEffect((function() {
                            return e.add(n),
                                function() {
                                    e.remove()
                                }
                        }), [n && t])
                    });
                    return function(e) {
                        var t = e.styles,
                            r = e.dynamic;
                        return n(t, r), null
                    }
                },
                Ue = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                We = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                Ve = Be(),
                qe = "data-scroll-locked",
                $e = function(e, n, t, r) {
                    var o = e.left,
                        i = e.top,
                        a = e.right,
                        u = e.gap;
                    return void 0 === t && (t = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(u, "px ").concat(r, ";\n  }\n  body[").concat(qe, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([n && "position: relative ".concat(r, ";"), "margin" === t && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(u, "px ").concat(r, ";\n    "), "padding" === t && "padding-right: ".concat(u, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(Pe, " {\n    right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(Te, " {\n    margin-right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(Pe, " .").concat(Pe, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(Te, " .").concat(Te, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(qe, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(u, "px;\n  }\n")
                },
                Ke = function() {
                    var e = parseInt(document.body.getAttribute(qe) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                He = function(e) {
                    var n = e.noRelative,
                        t = e.noImportant,
                        o = e.gapMode,
                        i = void 0 === o ? "margin" : o;
                    r.useEffect((function() {
                        return document.body.setAttribute(qe, (Ke() + 1).toString()),
                            function() {
                                var e = Ke() - 1;
                                e <= 0 ? document.body.removeAttribute(qe) : document.body.setAttribute(qe, e.toString())
                            }
                    }), []);
                    var a = r.useMemo((function() {
                        return function(e) {
                            if (void 0 === e && (e = "margin"), "undefined" == typeof window) return Ue;
                            var n = function(e) {
                                    var n = window.getComputedStyle(document.body),
                                        t = n["padding" === e ? "paddingLeft" : "marginLeft"],
                                        r = n["padding" === e ? "paddingTop" : "marginTop"],
                                        o = n["padding" === e ? "paddingRight" : "marginRight"];
                                    return [We(t), We(r), We(o)]
                                }(e),
                                t = document.documentElement.clientWidth,
                                r = window.innerWidth;
                            return {
                                left: n[0],
                                top: n[1],
                                right: n[2],
                                gap: Math.max(0, r - t + n[2] - n[0])
                            }
                        }(i)
                    }), [i]);
                    return r.createElement(Ve, {
                        styles: $e(a, !n, i, t ? "" : "!important")
                    })
                },
                Ze = !1;
            if ("undefined" != typeof window) try {
                var Ge = Object.defineProperty({}, "passive", {
                    get: function() {
                        return Ze = !0, !0
                    }
                });
                window.addEventListener("test", Ge, Ge), window.removeEventListener("test", Ge, Ge)
            } catch (v) {
                Ze = !1
            }
            var Xe = !!Ze && {
                    passive: !1
                },
                Ye = function(e, n) {
                    if (!(e instanceof Element)) return !1;
                    var t = window.getComputedStyle(e);
                    return "hidden" !== t[n] && !(t.overflowY === t.overflowX && ! function(e) {
                        return "TEXTAREA" === e.tagName
                    }(e) && "visible" === t[n])
                },
                Je = function(e, n) {
                    var t = n.ownerDocument,
                        r = n;
                    do {
                        if ("undefined" != typeof ShadowRoot && r instanceof ShadowRoot && (r = r.host), Qe(e, r)) {
                            var o = en(e, r);
                            if (o[1] > o[2]) return !0
                        }
                        r = r.parentNode
                    } while (r && r !== t.body);
                    return !1
                },
                Qe = function(e, n) {
                    return "v" === e ? function(e) {
                        return Ye(e, "overflowY")
                    }(n) : function(e) {
                        return Ye(e, "overflowX")
                    }(n)
                },
                en = function(e, n) {
                    return "v" === e ? [(t = n).scrollTop, t.scrollHeight, t.clientHeight] : function(e) {
                        return [e.scrollLeft, e.scrollWidth, e.clientWidth]
                    }(n);
                    var t
                },
                nn = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                tn = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                rn = function(e) {
                    return e && "current" in e ? e.current : e
                },
                on = function(e) {
                    return "\n  .block-interactivity-".concat(e, " {pointer-events: none;}\n  .allow-interactivity-").concat(e, " {pointer-events: all;}\n")
                },
                an = 0,
                un = [];

            function cn(e) {
                for (var n = null; null !== e;) e instanceof ShadowRoot && (n = e.host, e = e.host), e = e.parentNode;
                return n
            }
            var ln, sn = (ln = function(e) {
                    var n = r.useRef([]),
                        t = r.useRef([0, 0]),
                        o = r.useRef(),
                        i = r.useState(an++)[0],
                        a = r.useState(Be)[0],
                        u = r.useRef(e);
                    r.useEffect((function() {
                        u.current = e
                    }), [e]), r.useEffect((function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(i));
                            var n = function(e, n, t) {
                                if (t || 2 === arguments.length)
                                    for (var r, o = 0, i = n.length; o < i; o++) !r && o in n || (r || (r = Array.prototype.slice.call(n, 0, o)), r[o] = n[o]);
                                return e.concat(r || Array.prototype.slice.call(n))
                            }([e.lockRef.current], (e.shards || []).map(rn), !0).filter(Boolean);
                            return n.forEach((function(e) {
                                    return e.classList.add("allow-interactivity-".concat(i))
                                })),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(i)), n.forEach((function(e) {
                                        return e.classList.remove("allow-interactivity-".concat(i))
                                    }))
                                }
                        }
                    }), [e.inert, e.lockRef.current, e.shards]);
                    var c = r.useCallback((function(e, n) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !u.current.allowPinchZoom;
                            var r, i = nn(e),
                                a = t.current,
                                c = "deltaX" in e ? e.deltaX : a[0] - i[0],
                                l = "deltaY" in e ? e.deltaY : a[1] - i[1],
                                s = e.target,
                                f = Math.abs(c) > Math.abs(l) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var d = Je(f, s);
                            if (!d) return !0;
                            if (d ? r = f : (r = "v" === f ? "h" : "v", d = Je(f, s)), !d) return !1;
                            if (!o.current && "changedTouches" in e && (c || l) && (o.current = r), !r) return !0;
                            var p = o.current || r;
                            return function(e, n, t, r, o) {
                                var i = function(e, n) {
                                        return "h" === e && "rtl" === n ? -1 : 1
                                    }(e, window.getComputedStyle(n).direction),
                                    a = i * r,
                                    u = t.target,
                                    c = n.contains(u),
                                    l = !1,
                                    s = a > 0,
                                    f = 0,
                                    d = 0;
                                do {
                                    var p = en(e, u),
                                        h = p[0],
                                        v = p[1] - p[2] - i * h;
                                    (h || v) && Qe(e, u) && (f += v, d += h), u = u instanceof ShadowRoot ? u.host : u.parentNode
                                } while (!c && u !== document.body || c && (n.contains(u) || n === u));
                                return (s && (o && Math.abs(f) < 1 || !o && a > f) || !s && (o && Math.abs(d) < 1 || !o && -a > d)) && (l = !0), l
                            }(p, n, e, "h" === p ? c : l, !0)
                        }), []),
                        l = r.useCallback((function(e) {
                            var t = e;
                            if (un.length && un[un.length - 1] === a) {
                                var r = "deltaY" in t ? tn(t) : nn(t),
                                    o = n.current.filter((function(e) {
                                        return e.name === t.type && (e.target === t.target || t.target === e.shadowParent) && function(e, n) {
                                            return e[0] === n[0] && e[1] === n[1]
                                        }(e.delta, r)
                                    }))[0];
                                if (o && o.should) t.cancelable && t.preventDefault();
                                else if (!o) {
                                    var i = (u.current.shards || []).map(rn).filter(Boolean).filter((function(e) {
                                        return e.contains(t.target)
                                    }));
                                    (i.length > 0 ? c(t, i[0]) : !u.current.noIsolation) && t.cancelable && t.preventDefault()
                                }
                            }
                        }), []),
                        s = r.useCallback((function(e, t, r, o) {
                            var i = {
                                name: e,
                                delta: t,
                                target: r,
                                should: o,
                                shadowParent: cn(r)
                            };
                            n.current.push(i), setTimeout((function() {
                                n.current = n.current.filter((function(e) {
                                    return e !== i
                                }))
                            }), 1)
                        }), []),
                        f = r.useCallback((function(e) {
                            t.current = nn(e), o.current = void 0
                        }), []),
                        d = r.useCallback((function(n) {
                            s(n.type, tn(n), n.target, c(n, e.lockRef.current))
                        }), []),
                        p = r.useCallback((function(n) {
                            s(n.type, nn(n), n.target, c(n, e.lockRef.current))
                        }), []);
                    r.useEffect((function() {
                        return un.push(a), e.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", l, Xe), document.addEventListener("touchmove", l, Xe), document.addEventListener("touchstart", f, Xe),
                            function() {
                                un = un.filter((function(e) {
                                    return e !== a
                                })), document.removeEventListener("wheel", l, Xe), document.removeEventListener("touchmove", l, Xe), document.removeEventListener("touchstart", f, Xe)
                            }
                    }), []);
                    var h = e.removeScrollBar,
                        v = e.inert;
                    return r.createElement(r.Fragment, null, v ? r.createElement(a, {
                        styles: on(i)
                    }) : null, h ? r.createElement(He, {
                        gapMode: e.gapMode
                    }) : null)
                }, Ie.useMedium(ln), Me),
                fn = r.forwardRef((function(e, n) {
                    return r.createElement(ze, u({}, e, {
                        ref: n,
                        sideCar: sn
                    }))
                }));
            fn.classNames = ze.classNames;
            var dn = fn,
                pn = ["children"],
                hn = ["children"],
                vn = ["asChild"],
                gn = ["scope", "children"],
                mn = ["__scopeDialog"],
                yn = ["forceMount"],
                bn = ["__scopeDialog"],
                wn = ["forceMount"],
                _n = ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"],
                Sn = ["__scopeDialog"],
                En = ["__scopeDialog"],
                An = ["__scopeDialog"],
                xn = ["children"];

            function On(e) {
                return function(e) {
                    if (Array.isArray(e)) return Tn(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || Pn(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Cn(e, n) {
                if (null == e) return {};
                var t, r, o = function(e, n) {
                    if (null == e) return {};
                    var t, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) t = i[r], n.indexOf(t) >= 0 || (o[t] = e[t]);
                    return o
                }(e, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) t = i[r], n.indexOf(t) >= 0 || Object.prototype.propertyIsEnumerable.call(e, t) && (o[t] = e[t])
                }
                return o
            }

            function kn(e, n) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, n) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var t = [],
                        r = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = e[Symbol.iterator](); !(r = (a = u.next()).done) && (t.push(a.value), !n || t.length !== n); r = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return t
                }(e, n) || Pn(e, n) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Pn(e, n) {
                if (e) {
                    if ("string" == typeof e) return Tn(e, n);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t ? Array.from(e) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? Tn(e, n) : void 0
                }
            }

            function Tn(e, n) {
                (null == n || n > e.length) && (n = e.length);
                for (var t = 0, r = new Array(n); t < n; t++) r[t] = e[t];
                return r
            }

            function jn(e, n) {
                var t = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    n && (r = r.filter((function(n) {
                        return Object.getOwnPropertyDescriptor(e, n).enumerable
                    }))), t.push.apply(t, r)
                }
                return t
            }

            function Rn(e) {
                for (var n = 1; n < arguments.length; n++) {
                    var t = null != arguments[n] ? arguments[n] : {};
                    n % 2 ? jn(Object(t), !0).forEach((function(n) {
                        Nn(e, n, t[n])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : jn(Object(t)).forEach((function(n) {
                        Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                    }))
                }
                return e
            }

            function Nn(e, n, t) {
                return n in e ? Object.defineProperty(e, n, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[n] = t, e
            }

            function Ln(e, n) {
                var t = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    r = void 0 === t || t;
                return function(t) {
                    if (null != e && e(t), !1 === r || !t.defaultPrevented) return null == n ? void 0 : n(t)
                }
            }

            function Mn(e, n) {
                if ("function" == typeof e) return e(n);
                null != e && (e.current = n)
            }

            function In() {
                for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                return function(e) {
                    var t = !1,
                        r = n.map((function(n) {
                            var r = Mn(n, e);
                            return t || "function" != typeof r || (t = !0), r
                        }));
                    if (t) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var t = r[e];
                            "function" == typeof t ? t() : Mn(n[e], null)
                        }
                    }
                }
            }

            function Dn() {
                for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                return r.useCallback(In.apply(void 0, n), n)
            }

            function zn() {
                for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                var o = n[0];
                if (1 === n.length) return o;
                var i = function() {
                    var e = n.map((function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    }));
                    return function(n) {
                        var t = e.reduce((function(e, t) {
                            var r = t.useScope,
                                o = t.scopeName;
                            return Rn(Rn({}, e), r(n)["__scope".concat(o)])
                        }), {});
                        return r.useMemo((function() {
                            return Nn({}, "__scope".concat(o.scopeName), t)
                        }), [t])
                    }
                };
                return i.scopeName = o.scopeName, i
            }

            function Fn(e) {
                var n = r.useRef(e);
                return r.useEffect((function() {
                    n.current = e
                })), r.useMemo((function() {
                    return function() {
                        for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                        return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                    }
                }), [])
            }
            var Bn = null !== globalThis && void 0 !== globalThis && globalThis.document ? r.useLayoutEffect : function() {},
                Un = function(e) {
                    var n = e.present,
                        t = e.children,
                        o = function(e) {
                            var n = kn(r.useState(), 2),
                                t = n[0],
                                o = n[1],
                                i = r.useRef({}),
                                a = r.useRef(e),
                                u = r.useRef("none"),
                                c = function(e, n) {
                                    return r.useReducer((function(e, t) {
                                        var r;
                                        return null !== (r = n[e][t]) && void 0 !== r ? r : e
                                    }), e)
                                }(e ? "mounted" : "unmounted", {
                                    mounted: {
                                        UNMOUNT: "unmounted",
                                        ANIMATION_OUT: "unmountSuspended"
                                    },
                                    unmountSuspended: {
                                        MOUNT: "mounted",
                                        ANIMATION_END: "unmounted"
                                    },
                                    unmounted: {
                                        MOUNT: "mounted"
                                    }
                                }),
                                l = kn(c, 2),
                                s = l[0],
                                f = l[1];
                            return r.useEffect((function() {
                                var e = Wn(i.current);
                                u.current = "mounted" === s ? e : "none"
                            }), [s]), Bn((function() {
                                var n = i.current,
                                    t = a.current;
                                if (t !== e) {
                                    var r = u.current,
                                        o = Wn(n);
                                    e ? f("MOUNT") : "none" === o || "none" === (null == n ? void 0 : n.display) ? f("UNMOUNT") : f(t && r !== o ? "ANIMATION_OUT" : "UNMOUNT"), a.current = e
                                }
                            }), [e, f]), Bn((function() {
                                if (t) {
                                    var e, n, r = null !== (e = t.ownerDocument.defaultView) && void 0 !== e ? e : window,
                                        o = function(e) {
                                            var o = Wn(i.current).includes(e.animationName);
                                            if (e.target === t && o && (f("ANIMATION_END"), !a.current)) {
                                                var u = t.style.animationFillMode;
                                                t.style.animationFillMode = "forwards", n = r.setTimeout((function() {
                                                    "forwards" === t.style.animationFillMode && (t.style.animationFillMode = u)
                                                }))
                                            }
                                        },
                                        c = function(e) {
                                            e.target === t && (u.current = Wn(i.current))
                                        };
                                    return t.addEventListener("animationstart", c), t.addEventListener("animationcancel", o), t.addEventListener("animationend", o),
                                        function() {
                                            r.clearTimeout(n), t.removeEventListener("animationstart", c), t.removeEventListener("animationcancel", o), t.removeEventListener("animationend", o)
                                        }
                                }
                                f("ANIMATION_END")
                            }), [t, f]), {
                                isPresent: ["mounted", "unmountSuspended"].includes(s),
                                ref: r.useCallback((function(e) {
                                    e && (i.current = getComputedStyle(e)), o(e)
                                }), [])
                            }
                        }(n),
                        i = "function" == typeof t ? t({
                            present: o.isPresent
                        }) : r.Children.only(t),
                        a = Dn(o.ref, function(e) {
                            var n, t, r = null === (n = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === n ? void 0 : n.get,
                                o = r && "isReactWarning" in r && r.isReactWarning;
                            return o ? e.ref : (o = (r = null === (t = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === t ? void 0 : t.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                        }(i));
                    return "function" == typeof t || o.isPresent ? r.cloneElement(i, {
                        ref: a
                    }) : null
                };

            function Wn(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function Vn(e) {
                var n = function(e) {
                        var n = r.forwardRef((function(e, n) {
                            var t = e.children,
                                o = Cn(e, hn);
                            if (r.isValidElement(t)) {
                                var i = function(e) {
                                        var n, t, r = null === (n = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === n ? void 0 : n.get,
                                            o = r && "isReactWarning" in r && r.isReactWarning;
                                        return o ? e.ref : (o = (r = null === (t = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === t ? void 0 : t.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                    }(t),
                                    a = function(e, n) {
                                        var t = Rn({}, n),
                                            r = function(r) {
                                                var o = e[r],
                                                    i = n[r];
                                                /^on[A-Z]/.test(r) ? o && i ? t[r] = function() {
                                                    i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                } : o && (t[r] = o) : "style" === r ? t[r] = Rn(Rn({}, o), i) : "className" === r && (t[r] = [o, i].filter(Boolean).join(" "))
                                            };
                                        for (var o in n) r(o);
                                        return Rn(Rn({}, e), t)
                                    }(o, t.props);
                                return t.type !== r.Fragment && (a.ref = n ? In(n, i) : i), r.cloneElement(t, a)
                            }
                            return r.Children.count(t) > 1 ? r.Children.only(null) : null
                        }));
                        return n.displayName = "".concat(e, ".SlotClone"), n
                    }(e),
                    t = r.forwardRef((function(e, t) {
                        var o = e.children,
                            i = Cn(e, pn),
                            a = r.Children.toArray(o),
                            u = a.find($n);
                        if (u) {
                            var c = u.props.children,
                                l = a.map((function(e) {
                                    return e === u ? r.Children.count(c) > 1 ? r.Children.only(null) : r.isValidElement(c) ? c.props.children : null : e
                                }));
                            return (0, f.jsx)(n, Rn(Rn({}, i), {}, {
                                ref: t,
                                children: r.isValidElement(c) ? r.cloneElement(c, void 0, l) : null
                            }))
                        }
                        return (0, f.jsx)(n, Rn(Rn({}, i), {}, {
                            ref: t,
                            children: o
                        }))
                    }));
                return t.displayName = "".concat(e, ".Slot"), t
            }
            Un.displayName = "Presence";
            var qn = Symbol("radix.slottable");

            function $n(e) {
                return r.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === qn
            }
            var Kn = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, n) {
                    var t = Vn("Primitive.".concat(n)),
                        o = r.forwardRef((function(e, r) {
                            var o = e.asChild,
                                i = Cn(e, vn),
                                a = o ? t : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, f.jsx)(a, Rn(Rn({}, i), {}, {
                                ref: r
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(n), Rn(Rn({}, e), {}, Nn({}, n, o))
                }), {}),
                Hn = "Dialog",
                Zn = function(e) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        t = [],
                        o = function() {
                            var n = t.map((function(e) {
                                return r.createContext(e)
                            }));
                            return function(t) {
                                var o = (null == t ? void 0 : t[e]) || n;
                                return r.useMemo((function() {
                                    return Nn({}, "__scope".concat(e), Rn(Rn({}, t), {}, Nn({}, e, o)))
                                }), [t, o])
                            }
                        };
                    return o.scopeName = e, [function(n, o) {
                        var i = r.createContext(o),
                            a = t.length;
                        t = [].concat(On(t), [o]);
                        var u = function(n) {
                            var t, o = n.scope,
                                u = n.children,
                                c = Cn(n, gn),
                                l = (null == o || null === (t = o[e]) || void 0 === t ? void 0 : t[a]) || i,
                                s = r.useMemo((function() {
                                    return c
                                }), Object.values(c));
                            return (0, f.jsx)(l.Provider, {
                                value: s,
                                children: u
                            })
                        };
                        return u.displayName = n + "Provider", [u, function(t, u) {
                            var c, l = (null == u || null === (c = u[e]) || void 0 === c ? void 0 : c[a]) || i,
                                s = r.useContext(l);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw new Error("`".concat(t, "` must be used within `").concat(n, "`"))
                        }]
                    }, zn.apply(void 0, [o].concat(On(n)))]
                }(Hn),
                Gn = kn(Zn, 2),
                Xn = Gn[0],
                Yn = (Gn[1], kn(Xn(Hn), 2)),
                Jn = Yn[0],
                Qn = Yn[1],
                et = function(e) {
                    var n = e.__scopeDialog,
                        t = e.children,
                        o = e.open,
                        i = e.defaultOpen,
                        a = e.onOpenChange,
                        u = e.modal,
                        c = void 0 === u || u,
                        l = r.useRef(null),
                        s = r.useRef(null),
                        d = function(e) {
                            var n = e.prop,
                                t = e.defaultProp,
                                o = e.onChange,
                                i = void 0 === o ? function() {} : o,
                                a = function(e) {
                                    var n = e.defaultProp,
                                        t = e.onChange,
                                        o = r.useState(n),
                                        i = kn(o, 1)[0],
                                        a = r.useRef(i),
                                        u = Fn(t);
                                    return r.useEffect((function() {
                                        a.current !== i && (u(i), a.current = i)
                                    }), [i, a, u]), o
                                }({
                                    defaultProp: t,
                                    onChange: i
                                }),
                                u = kn(a, 2),
                                c = u[0],
                                l = u[1],
                                s = void 0 !== n,
                                f = s ? n : c,
                                d = Fn(i);
                            return [f, r.useCallback((function(e) {
                                if (s) {
                                    var t = "function" == typeof e ? e(n) : e;
                                    t !== n && d(t)
                                } else l(e)
                            }), [s, n, l, d])]
                        }({
                            prop: o,
                            defaultProp: i,
                            onChange: a
                        }),
                        p = kn(d, 2),
                        h = p[0],
                        v = void 0 !== h && h,
                        g = p[1];
                    return (0, f.jsx)(Jn, {
                        scope: n,
                        triggerRef: l,
                        contentRef: s,
                        contentId: m(),
                        titleId: m(),
                        descriptionId: m(),
                        open: v,
                        onOpenChange: g,
                        onOpenToggle: r.useCallback((function() {
                            return g((function(e) {
                                return !e
                            }))
                        }), [g]),
                        modal: c,
                        children: t
                    })
                };
            et.displayName = Hn;
            var nt = "DialogTrigger",
                tt = r.forwardRef((function(e, n) {
                    var t = e.__scopeDialog,
                        r = Cn(e, mn),
                        o = Qn(nt, t),
                        i = Dn(n, o.triggerRef);
                    return (0, f.jsx)(Kn.button, Rn(Rn({
                        type: "button",
                        "aria-haspopup": "dialog",
                        "aria-expanded": o.open,
                        "aria-controls": o.contentId,
                        "data-state": Et(o.open)
                    }, r), {}, {
                        ref: i,
                        onClick: Ln(e.onClick, o.onOpenToggle)
                    }))
                }));
            tt.displayName = nt;
            var rt = "DialogPortal",
                ot = kn(Xn(rt, {
                    forceMount: void 0
                }), 2),
                it = ot[0],
                at = ot[1],
                ut = function(e) {
                    var n = e.__scopeDialog,
                        t = e.forceMount,
                        o = e.children,
                        i = e.container,
                        a = Qn(rt, n);
                    return (0, f.jsx)(it, {
                        scope: n,
                        forceMount: t,
                        children: r.Children.map(o, (function(e) {
                            return (0, f.jsx)(Un, {
                                present: t || a.open,
                                children: (0, f.jsx)(Se, {
                                    asChild: !0,
                                    container: i,
                                    children: e
                                })
                            })
                        }))
                    })
                };
            ut.displayName = rt;
            var ct = "DialogOverlay",
                lt = r.forwardRef((function(e, n) {
                    var t = at(ct, e.__scopeDialog),
                        r = e.forceMount,
                        o = void 0 === r ? t.forceMount : r,
                        i = Cn(e, yn),
                        a = Qn(ct, e.__scopeDialog);
                    return a.modal ? (0, f.jsx)(Un, {
                        present: o || a.open,
                        children: (0, f.jsx)(ft, Rn(Rn({}, i), {}, {
                            ref: n
                        }))
                    }) : null
                }));
            lt.displayName = ct;
            var st = Vn("DialogOverlay.RemoveScroll"),
                ft = r.forwardRef((function(e, n) {
                    var t = e.__scopeDialog,
                        r = Cn(e, bn),
                        o = Qn(ct, t);
                    return (0, f.jsx)(dn, {
                        as: st,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, f.jsx)(Kn.div, Rn(Rn({
                            "data-state": Et(o.open)
                        }, r), {}, {
                            ref: n,
                            style: Rn({
                                pointerEvents: "auto"
                            }, r.style)
                        }))
                    })
                })),
                dt = "DialogContent",
                pt = r.forwardRef((function(e, n) {
                    var t = at(dt, e.__scopeDialog),
                        r = e.forceMount,
                        o = void 0 === r ? t.forceMount : r,
                        i = Cn(e, wn),
                        a = Qn(dt, e.__scopeDialog);
                    return (0, f.jsx)(Un, {
                        present: o || a.open,
                        children: a.modal ? (0, f.jsx)(ht, Rn(Rn({}, i), {}, {
                            ref: n
                        })) : (0, f.jsx)(vt, Rn(Rn({}, i), {}, {
                            ref: n
                        }))
                    })
                }));
            pt.displayName = dt;
            var ht = r.forwardRef((function(e, n) {
                    var t = Qn(dt, e.__scopeDialog),
                        o = r.useRef(null),
                        i = Dn(n, t.contentRef, o);
                    return r.useEffect((function() {
                        var e = o.current;
                        if (e) return ke(e)
                    }), []), (0, f.jsx)(gt, Rn(Rn({}, e), {}, {
                        ref: i,
                        trapFocus: t.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: Ln(e.onCloseAutoFocus, (function(e) {
                            var n;
                            e.preventDefault(), null === (n = t.triggerRef.current) || void 0 === n || n.focus()
                        })),
                        onPointerDownOutside: Ln(e.onPointerDownOutside, (function(e) {
                            var n = e.detail.originalEvent,
                                t = 0 === n.button && !0 === n.ctrlKey;
                            (2 === n.button || t) && e.preventDefault()
                        })),
                        onFocusOutside: Ln(e.onFocusOutside, (function(e) {
                            return e.preventDefault()
                        }))
                    }))
                })),
                vt = r.forwardRef((function(e, n) {
                    var t = Qn(dt, e.__scopeDialog),
                        o = r.useRef(!1),
                        i = r.useRef(!1);
                    return (0, f.jsx)(gt, Rn(Rn({}, e), {}, {
                        ref: n,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(n) {
                            var r, a;
                            null !== (r = e.onCloseAutoFocus) && void 0 !== r && r.call(e, n), n.defaultPrevented || (o.current || null !== (a = t.triggerRef.current) && void 0 !== a && a.focus(), n.preventDefault()), o.current = !1, i.current = !1
                        },
                        onInteractOutside: function(n) {
                            var r, a;
                            null !== (r = e.onInteractOutside) && void 0 !== r && r.call(e, n), n.defaultPrevented || (o.current = !0, "pointerdown" === n.detail.originalEvent.type && (i.current = !0));
                            var u = n.target;
                            (null === (a = t.triggerRef.current) || void 0 === a ? void 0 : a.contains(u)) && n.preventDefault(), "focusin" === n.detail.originalEvent.type && i.current && n.preventDefault()
                        }
                    }))
                })),
                gt = r.forwardRef((function(e, n) {
                    var t = e.__scopeDialog,
                        o = e.trapFocus,
                        i = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        u = Cn(e, _n),
                        c = Qn(dt, t),
                        l = r.useRef(null),
                        s = Dn(n, l);
                    return r.useEffect((function() {
                        var e, n, t = document.querySelectorAll("[data-radix-focus-guard]");
                        return document.body.insertAdjacentElement("afterbegin", null !== (e = t[0]) && void 0 !== e ? e : ee()), document.body.insertAdjacentElement("beforeend", null !== (n = t[1]) && void 0 !== n ? n : ee()), Q++,
                            function() {
                                1 === Q && document.querySelectorAll("[data-radix-focus-guard]").forEach((function(e) {
                                    return e.remove()
                                })), Q--
                            }
                    }), []), (0, f.jsxs)(f.Fragment, {
                        children: [(0, f.jsx)(se, {
                            asChild: !0,
                            loop: !0,
                            trapped: o,
                            onMountAutoFocus: i,
                            onUnmountAutoFocus: a,
                            children: (0, f.jsx)(X, Rn(Rn({
                                role: "dialog",
                                id: c.contentId,
                                "aria-describedby": c.descriptionId,
                                "aria-labelledby": c.titleId,
                                "data-state": Et(c.open)
                            }, u), {}, {
                                ref: s,
                                onDismiss: function() {
                                    return c.onOpenChange(!1)
                                }
                            }))
                        }), (0, f.jsxs)(f.Fragment, {
                            children: [(0, f.jsx)(kt, {
                                titleId: c.titleId
                            }), (0, f.jsx)(Pt, {
                                contentRef: l,
                                descriptionId: c.descriptionId
                            })]
                        })]
                    })
                })),
                mt = "DialogTitle",
                yt = r.forwardRef((function(e, n) {
                    var t = e.__scopeDialog,
                        r = Cn(e, Sn),
                        o = Qn(mt, t);
                    return (0, f.jsx)(Kn.h2, Rn(Rn({
                        id: o.titleId
                    }, r), {}, {
                        ref: n
                    }))
                }));
            yt.displayName = mt;
            var bt = "DialogDescription",
                wt = r.forwardRef((function(e, n) {
                    var t = e.__scopeDialog,
                        r = Cn(e, En),
                        o = Qn(bt, t);
                    return (0, f.jsx)(Kn.p, Rn(Rn({
                        id: o.descriptionId
                    }, r), {}, {
                        ref: n
                    }))
                }));
            wt.displayName = bt;
            var _t = "DialogClose",
                St = r.forwardRef((function(e, n) {
                    var t = e.__scopeDialog,
                        r = Cn(e, An),
                        o = Qn(_t, t);
                    return (0, f.jsx)(Kn.button, Rn(Rn({
                        type: "button"
                    }, r), {}, {
                        ref: n,
                        onClick: Ln(e.onClick, (function() {
                            return o.onOpenChange(!1)
                        }))
                    }))
                }));

            function Et(e) {
                return e ? "open" : "closed"
            }
            St.displayName = _t;
            var At = "DialogTitleWarning",
                xt = function(e, n) {
                    var t = r.createContext(n),
                        o = function(e) {
                            var n = e.children,
                                o = Cn(e, xn),
                                i = r.useMemo((function() {
                                    return o
                                }), Object.values(o));
                            return (0, f.jsx)(t.Provider, {
                                value: i,
                                children: n
                            })
                        };
                    return o.displayName = e + "Provider", [o, function(o) {
                        var i = r.useContext(t);
                        if (i) return i;
                        if (void 0 !== n) return n;
                        throw new Error("`".concat(o, "` must be used within `").concat(e, "`"))
                    }]
                }(At, {
                    contentName: dt,
                    titleName: mt,
                    docsSlug: "dialog"
                }),
                Ot = kn(xt, 2),
                Ct = (Ot[0], Ot[1]),
                kt = function(e) {
                    var n = e.titleId,
                        t = Ct(At),
                        o = "`".concat(t.contentName, "` requires a `").concat(t.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(t.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(t.docsSlug);
                    return r.useEffect((function() {
                        n && (document.getElementById(n) || console.error(o))
                    }), [o, n]), null
                },
                Pt = function(e) {
                    var n = e.contentRef,
                        t = e.descriptionId,
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(Ct("DialogDescriptionWarning").contentName, "}.");
                    return r.useEffect((function() {
                        var e, r = null === (e = n.current) || void 0 === e ? void 0 : e.getAttribute("aria-describedby");
                        t && r && (document.getElementById(t) || console.warn(o))
                    }), [o, n, t]), null
                },
                Tt = et,
                jt = ut,
                Rt = lt,
                Nt = pt,
                Lt = yt,
                Mt = St,
                It = ["children"],
                Dt = ["children"],
                zt = ["asChild"];

            function Ft(e, n) {
                var t = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    n && (r = r.filter((function(n) {
                        return Object.getOwnPropertyDescriptor(e, n).enumerable
                    }))), t.push.apply(t, r)
                }
                return t
            }

            function Bt(e) {
                for (var n = 1; n < arguments.length; n++) {
                    var t = null != arguments[n] ? arguments[n] : {};
                    n % 2 ? Ft(Object(t), !0).forEach((function(n) {
                        Ut(e, n, t[n])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : Ft(Object(t)).forEach((function(n) {
                        Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                    }))
                }
                return e
            }

            function Ut(e, n, t) {
                return n in e ? Object.defineProperty(e, n, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[n] = t, e
            }

            function Wt(e, n) {
                if (null == e) return {};
                var t, r, o = function(e, n) {
                    if (null == e) return {};
                    var t, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) t = i[r], n.indexOf(t) >= 0 || (o[t] = e[t]);
                    return o
                }(e, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) t = i[r], n.indexOf(t) >= 0 || Object.prototype.propertyIsEnumerable.call(e, t) && (o[t] = e[t])
                }
                return o
            }

            function Vt(e, n) {
                if ("function" == typeof e) return e(n);
                null != e && (e.current = n)
            }
            var qt = Symbol("radix.slottable");

            function $t(e) {
                return r.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === qt
            }
            var Kt = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((function(e, n) {
                    var t = function(e) {
                            var n = function(e) {
                                    var n = r.forwardRef((function(e, n) {
                                        var t = e.children,
                                            o = Wt(e, It);
                                        if (r.isValidElement(t)) {
                                            var i = function(e) {
                                                    var n, t, r = null === (n = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === n ? void 0 : n.get,
                                                        o = r && "isReactWarning" in r && r.isReactWarning;
                                                    return o ? e.ref : (o = (r = null === (t = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === t ? void 0 : t.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                                }(t),
                                                a = function(e, n) {
                                                    var t = Bt({}, n),
                                                        r = function(r) {
                                                            var o = e[r],
                                                                i = n[r];
                                                            /^on[A-Z]/.test(r) ? o && i ? t[r] = function() {
                                                                var e = i.apply(void 0, arguments);
                                                                return o.apply(void 0, arguments), e
                                                            } : o && (t[r] = o) : "style" === r ? t[r] = Bt(Bt({}, o), i) : "className" === r && (t[r] = [o, i].filter(Boolean).join(" "))
                                                        };
                                                    for (var o in n) r(o);
                                                    return Bt(Bt({}, e), t)
                                                }(o, t.props);
                                            return t.type !== r.Fragment && (a.ref = n ? function() {
                                                for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                                                return function(e) {
                                                    var t = !1,
                                                        r = n.map((function(n) {
                                                            var r = Vt(n, e);
                                                            return t || "function" != typeof r || (t = !0), r
                                                        }));
                                                    if (t) return function() {
                                                        for (var e = 0; e < r.length; e++) {
                                                            var t = r[e];
                                                            "function" == typeof t ? t() : Vt(n[e], null)
                                                        }
                                                    }
                                                }
                                            }(n, i) : i), r.cloneElement(t, a)
                                        }
                                        return r.Children.count(t) > 1 ? r.Children.only(null) : null
                                    }));
                                    return n.displayName = "".concat(e, ".SlotClone"), n
                                }(e),
                                t = r.forwardRef((function(e, t) {
                                    var o = e.children,
                                        i = Wt(e, Dt),
                                        a = r.Children.toArray(o),
                                        u = a.find($t);
                                    if (u) {
                                        var c = u.props.children,
                                            l = a.map((function(e) {
                                                return e === u ? r.Children.count(c) > 1 ? r.Children.only(null) : r.isValidElement(c) ? c.props.children : null : e
                                            }));
                                        return (0, f.jsx)(n, Bt(Bt({}, i), {}, {
                                            ref: t,
                                            children: r.isValidElement(c) ? r.cloneElement(c, void 0, l) : null
                                        }))
                                    }
                                    return (0, f.jsx)(n, Bt(Bt({}, i), {}, {
                                        ref: t,
                                        children: o
                                    }))
                                }));
                            return t.displayName = "".concat(e, ".Slot"), t
                        }("Primitive.".concat(n)),
                        o = r.forwardRef((function(e, r) {
                            var o = e.asChild,
                                i = Wt(e, zt),
                                a = o ? t : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, f.jsx)(a, Bt(Bt({}, i), {}, {
                                ref: r
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(n), Bt(Bt({}, e), {}, Ut({}, n, o))
                }), {}),
                Ht = Object.freeze({
                    position: "absolute",
                    border: 0,
                    width: 1,
                    height: 1,
                    padding: 0,
                    margin: -1,
                    overflow: "hidden",
                    clip: "rect(0, 0, 0, 0)",
                    whiteSpace: "nowrap",
                    wordWrap: "normal"
                }),
                Zt = r.forwardRef((function(e, n) {
                    return (0, f.jsx)(Kt.span, Bt(Bt({}, e), {}, {
                        ref: n,
                        style: Bt(Bt({}, Ht), e.style)
                    }))
                }));

            function Gt(e, n) {
                void 0 === n && (n = {});
                var t = n.insertAt;
                if (e && "undefined" != typeof document) {
                    var r = document.head || document.getElementsByTagName("head")[0],
                        o = document.createElement("style");
                    o.type = "text/css", "top" === t && r.firstChild ? r.insertBefore(o, r.firstChild) : r.appendChild(o), o.styleSheet ? o.styleSheet.cssText = e : o.appendChild(document.createTextNode(e))
                }
            }
            Zt.displayName = "VisuallyHidden", Gt(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}.light-theme,.system-theme,:root{--alpha-color-shadow-subtle:rgba(0,0,0,.08);--fui-future-alpha-color-shadow-subtle:rgba(0,0,0,.08);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}.dark-theme{--alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}@media (prefers-color-scheme:dark){:is(:root,.system-theme){--alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}:is(:root,.light-theme,.system-theme) .stroke-contrast-alpha{border-color:rgba(27,37,75,.5)}.dark-theme .stroke-contrast-alpha{border-color:rgba(208,217,251,.4)}@media (prefers-color-scheme:dark){:is(:root,.system-theme) .stroke-contrast-alpha{border-color:rgba(208,217,251,.4)}}.foundation-web-input.stroke-contrast-alpha:focus,.foundation-web-input.stroke-contrast-alpha:focus-within,.foundation-web-input.stroke-emphasis:focus,.foundation-web-input.stroke-emphasis:focus-within{border-color:var(--color-system-emphasis);box-shadow:inset 0 0 0 1px var(--color-system-emphasis)}.foundation-web-input.stroke-system-alert:focus,.foundation-web-input.stroke-system-alert:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-alert)}");
            var Xt = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]"
                },
                Yt = o().forwardRef((function(e, n) {
                    var t = e.name,
                        r = e.size,
                        i = void 0 === r ? "Medium" : r,
                        a = e.className,
                        u = (e.children, c(e, ["name", "size", "className", "children"]));
                    return o().createElement("span", Object.assign({
                        ref: n,
                        role: "presentation",
                        className: s("grow-0 shrink-0 basis-auto icon", t, Xt[i], a)
                    }, u))
                }));
            Yt.displayName = "Icon";
            var Jt = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                Qt = function(e) {
                    var n = e.className;
                    return o().createElement("div", {
                        role: "presentation",
                        className: s("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", n)
                    })
                },
                er = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                nr = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                tr = function(e) {
                    var n = e.variant,
                        t = e.size,
                        r = e.isCircular,
                        i = e.className,
                        a = c(e, ["variant", "size", "isCircular", "className"]);
                    return o().createElement("button", Object.assign({
                        type: "button",
                        className: s("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", Jt, nr[n], er[t], r && "radius-circle", i)
                    }, a), o().createElement(Qt, null), o().createElement(Yt, {
                        name: "icon-regular-x",
                        size: t
                    }))
                };
            Gt(".foundation-web-dialog-overlay{bottom:0;display:grid;left:0;overflow-y:auto;place-items:center;position:fixed;right:0;top:0}.foundation-web-dialog-close-container{right:var(--size-300);top:var(--size-300);z-index:1}.foundation-web-dialog-hero-media{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:calc(var(--stroke-standard)*-1);margin-right:calc(var(--stroke-standard)*-1);margin-top:calc(var(--stroke-standard)*-1);overflow:clip}.foundation-web-dialog-content[data-size=Small]{max-width:calc(var(--size-100)*80);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Medium]{max-width:calc(var(--size-100)*120);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Large]{max-width:calc(var(--size-100)*160);min-width:calc(var(--size-100)*75)}@keyframes foundation-web-dialog-backdrop-fade-in{0%{opacity:0}to{opacity:1}}@keyframes foundation-web-dialog-backdrop-fade-out{0%{opacity:1}to{opacity:0}}@keyframes foundation-web-dialog-content-scale-in{0%{transform:scale(.975)}to{transform:scale(1)}}@keyframes foundation-web-dialog-content-scale-out{0%{transform:scale(1)}to{transform:scale(.975)}}@media (prefers-reduced-motion:no-preference){.foundation-web-dialog-overlay[data-state=open]{animation:foundation-web-dialog-backdrop-fade-in var(--time-100) var(--ease-linear)}.foundation-web-dialog-overlay[data-state=closed]{animation:foundation-web-dialog-backdrop-fade-out var(--time-100) var(--ease-linear)}.foundation-web-dialog-content[data-state=open]{animation:foundation-web-dialog-content-scale-in var(--time-300) var(--ease-standard-out)}.foundation-web-dialog-content[data-state=closed]{animation:foundation-web-dialog-content-scale-out var(--time-300) var(--ease-standard-out)}}");
            var rr = (0, r.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                or = function() {
                    var e = (0, r.useContext)(rr);
                    if (!e) throw new Error("Dialog components must be used within a Dialog");
                    return e
                },
                ir = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                ar = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                ur = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                cr = function(e) {
                    var n = e.open,
                        t = e.onOpenChange,
                        i = e.children,
                        a = e.size,
                        u = e.type,
                        c = void 0 === u ? "Default" : u,
                        l = e.isModal,
                        s = e.hasCloseAffordance,
                        f = e.closeLabel,
                        d = e.hasMarginTop,
                        p = void 0 === d || d,
                        h = e.hasMarginBottom,
                        v = void 0 === h || h,
                        g = e.hasDescription,
                        m = void 0 !== g && g,
                        y = e.experimentalDisablePointerEventsStylingOnBody,
                        b = void 0 !== y && y,
                        w = (0, r.useMemo)((function() {
                            return {
                                size: a,
                                isModal: l,
                                type: c,
                                hasCloseAffordance: s,
                                closeLabel: f,
                                hasMarginTop: p,
                                hasMarginBottom: v,
                                hasDescription: m
                            }
                        }), [a, l, c, s, f, p, v, m]);
                    return (0, r.useEffect)((function() {
                        b && setTimeout((function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }), 0)
                    }), [b, n]), o().createElement(rr.Provider, {
                        value: w
                    }, o().createElement(Tt, {
                        open: n,
                        onOpenChange: t
                    }, i))
                };
            cr.displayName = "Dialog";
            var lr = function(e) {
                var n = e.children,
                    t = e.className,
                    r = e.style,
                    i = e.overlayClassName,
                    a = e.overlayStyle,
                    u = e.onOpenAutoFocus,
                    l = c(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    f = or(),
                    d = f.size,
                    p = f.isModal,
                    h = f.hasCloseAffordance,
                    v = f.closeLabel,
                    g = f.hasDescription,
                    m = s("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", p && "bg-common-backdrop", i),
                    y = s("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", t);
                return o().createElement(jt, null, o().createElement(Rt, {
                    className: m,
                    style: a
                }, o().createElement(Nt, Object.assign({
                    className: y,
                    "data-size": d,
                    style: r,
                    onOpenAutoFocus: u
                }, !g && {
                    "aria-describedby": void 0
                }, l), h && o().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, o().createElement(Mt, {
                    asChild: !0
                }, o().createElement(tr, {
                    variant: "OverMedia",
                    size: d,
                    isCircular: !0,
                    "aria-label": v
                }))), n)))
            };
            lr.displayName = "DialogContent";
            var sr = function(e) {
                var n = e.children,
                    t = e.className,
                    r = c(e, ["children", "className"]),
                    i = or(),
                    a = i.size,
                    u = i.hasMarginTop,
                    l = i.hasMarginBottom,
                    f = s(ir[a], u && ar[a], l && ur[a], t);
                return o().createElement("div", Object.assign({
                    className: f
                }, r), n)
            };
            sr.displayName = "DialogBody";
            var fr = function(e) {
                var n = e.children,
                    t = e.className,
                    r = e.hidden,
                    i = c(e, ["children", "className", "hidden"]),
                    a = o().createElement(Lt, Object.assign({
                        className: t
                    }, i), n);
                return r ? o().createElement(Zt, null, a) : a
            };
            fr.displayName = "DialogTitle";
            var dr, pr = ReactStyleGuide,
                hr = ReactUtilities,
                vr = HeaderScripts,
                gr = RobloxThumbnails,
                mr = "@",
                yr = {
                    common: ["CommonUI.Controls"],
                    feature: "Authentication.AccountSwitch"
                },
                br = (0, hr.withTranslations)((function(e) {
                    var n = e.userId,
                        t = e.displayName,
                        i = e.username,
                        a = e.onAccountSelection,
                        u = e.showIcon,
                        c = (e.translate, (0, r.useState)(!1)),
                        l = c[0],
                        s = c[1],
                        f = function() {
                            if (!u && !l) {
                                s(!0);
                                try {
                                    a(n)
                                } catch (e) {
                                    s(!1)
                                }
                            }
                        };
                    return o().createElement("div", {
                        className: u ? "active-account" : "account-selection",
                        role: "button",
                        tabIndex: 0,
                        onClick: f,
                        onKeyDown: f
                    }, o().createElement("div", {
                        className: "account-selection-thumbnail"
                    }, o().createElement(gr.Thumbnail2d, {
                        containerClass: "avatar-card-image",
                        type: gr.ThumbnailTypes.avatarHeadshot,
                        targetId: n,
                        size: gr.ThumbnailAvatarHeadshotSize.size60,
                        includeProfileFrame: !0
                    })), o().createElement("div", {
                        className: "account-selection-name-container"
                    }, o().createElement("p", {
                        className: "account-selection-displayname"
                    }, t || i), o().createElement("p", {
                        className: "account-selection-username"
                    }, i ? mr + i : "")), u && o().createElement("div", {
                        className: "accept-icon-image"
                    }), l && o().createElement("div", {
                        className: "spinner spinner-sm spinner-no-margin spinner-block"
                    }))
                }), yr),
                wr = {
                    ActionSwitch: "Action.Switch",
                    ActionAdd: "Action.Add",
                    ActionAddAccount: "Action.AddAccount",
                    ActionLogOutAllAccounts: "Action.LogoutAllAccounts",
                    HeadingSwitchAccount: "Heading.SwitchAccount",
                    LabelAddAccountWithoutLoggingOut: "Label.AddAccountWithoutLoggingOut",
                    LabelAddOrSwitchAccount: "Label.AddOrSwitchAccount",
                    DescriptionAccountLimit: "Description.AccountLimit"
                },
                _r = {
                    LogoutAll: "logoutAll",
                    LoginAccountLimit: "loginAccountLimit",
                    SignupAccountLimit: "signupAccountLimit",
                    UnavailableError: "unavailableError",
                    SwitchError: "switchError",
                    LoginEmptyBlobRequiredError: "loginEmptyBlobRequiredError",
                    SignupEmptyBlobRequiredError: "signupEmptyBlobRequiredError",
                    LoginVpcEmptyBlobRequiredError: "loginVpcEmptyBlobRequiredError",
                    SignupVpcEmptyBlobRequiredError: "signupVpcEmptyBlobRequiredError"
                },
                Sr = "Header.AccountSwitchingUnavailable",
                Er = "Description.InvalidAccountSwitch",
                Ar = "Description.AccountSwitchingNotWorking",
                xr = "Action.Close",
                Or = "Action.OK",
                Cr = "Description.LogoutAllBody",
                kr = "Action.ContinueToLogOut",
                Pr = "\tAction.StayLoggedIn",
                Tr = 1,
                jr = (e.EnvironmentUrls.websiteUrl, "RBXASBlob"),
                Rr = "RBXASBlobSynced",
                Nr = "navigation-account-switcher-container",
                Lr = "Accounts.AccountSwitcher",
                Mr = "isFoundationAccountSwitcherListEnabled";
            ! function(e) {
                e[e.AccountSwitcherModalType = 0] = "AccountSwitcherModalType", e[e.LogoutAllAccountsModalType = 1] = "LogoutAllAccountsModalType", e[e.LoginConfirmationForLogoutAllAccountsModalType = 2] = "LoginConfirmationForLogoutAllAccountsModalType", e[e.SignupConfirmationForLogoutAllAccountsModalType = 3] = "SignupConfirmationForLogoutAllAccountsModalType"
            }(dr || (dr = {}));
            var Ir = (0, hr.withTranslations)((function(e) {
                    var n = e.handleAddAccount,
                        t = e.translate,
                        i = (0, r.useState)(!1),
                        a = i[0],
                        u = i[1];
                    return o().createElement("div", {
                        className: "account-selection",
                        role: "button",
                        tabIndex: 0,
                        onClick: function() {
                            u(!0), n()
                        },
                        onKeyDown: function() {
                            u(!0), n()
                        }
                    }, o().createElement("div", {
                        className: "account-switcher-icon-add"
                    }, o().createElement("span", {
                        className: "icon-plus"
                    })), o().createElement("div", {
                        className: "account-selection-name-container"
                    }, o().createElement("p", {
                        className: "account-selection-add-account"
                    }, t(wr.ActionAddAccount))), a && o().createElement("div", {
                        className: "spinner spinner-sm spinner-block"
                    }))
                }), yr),
                Dr = function(e) {
                    var n = e.users,
                        t = e.titleText,
                        i = e.helpText,
                        a = e.onAccountSelection,
                        u = e.handleAddAccount,
                        c = e.suppressAddAccountRow,
                        l = void 0 !== c && c,
                        s = e.translate,
                        f = (0, r.useState)(!1),
                        d = f[0],
                        p = f[1],
                        h = function(e) {
                            if (!d) {
                                p(!0);
                                try {
                                    a(e)
                                } catch (e) {
                                    p(!1)
                                }
                            }
                        };
                    return o().createElement("div", {
                        className: "section-content account-switcher-section"
                    }, t && o().createElement("h1", {
                        className: "account-switcher-header"
                    }, t), i && o().createElement("h2", {
                        className: "account-switcher-help-text"
                    }, i), o().createElement("ul", {
                        className: "account-switcher-list "
                    }, n.map((function(e) {
                        return o().createElement("li", {
                            key: e.id
                        }, o().createElement("div", {
                            className: "account-selection-list-item",
                            role: "button",
                            tabIndex: 0
                        }, o().createElement(br, {
                            userId: e.id,
                            username: e.name,
                            displayName: e.displayName,
                            onAccountSelection: h,
                            showIcon: !1,
                            translate: s
                        })))
                    })), !l && o().createElement("li", {
                        className: "account-selection-list-item"
                    }, o().createElement(Ir, {
                        handleAddAccount: u,
                        translate: s
                    }))))
                },
                zr = ["children"],
                Fr = ["children"];

            function Br(e, n) {
                var t = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    n && (r = r.filter((function(n) {
                        return Object.getOwnPropertyDescriptor(e, n).enumerable
                    }))), t.push.apply(t, r)
                }
                return t
            }

            function Ur(e) {
                for (var n = 1; n < arguments.length; n++) {
                    var t = null != arguments[n] ? arguments[n] : {};
                    n % 2 ? Br(Object(t), !0).forEach((function(n) {
                        Wr(e, n, t[n])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : Br(Object(t)).forEach((function(n) {
                        Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                    }))
                }
                return e
            }

            function Wr(e, n, t) {
                return n in e ? Object.defineProperty(e, n, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[n] = t, e
            }

            function Vr(e, n) {
                if (null == e) return {};
                var t, r, o = function(e, n) {
                    if (null == e) return {};
                    var t, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) t = i[r], n.indexOf(t) >= 0 || (o[t] = e[t]);
                    return o
                }(e, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) t = i[r], n.indexOf(t) >= 0 || Object.prototype.propertyIsEnumerable.call(e, t) && (o[t] = e[t])
                }
                return o
            }

            function qr(e) {
                return qr = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                }, qr(e)
            }

            function $r(e, n) {
                if ("function" == typeof e) return e(n);
                null != e && (e.current = n)
            }
            var Kr = Symbol.for("react.lazy"),
                Hr = r[" use ".trim().toString()];

            function Zr(e) {
                return null != e && "object" == qr(e) && "$$typeof" in e && e.$$typeof === Kr && "_payload" in e && "object" == qr(n = e._payload) && null !== n && "then" in n;
                var n
            }
            var Gr = function(e) {
                var n = function(e) {
                        var n = r.forwardRef((function(e, n) {
                            var t = e.children,
                                o = Vr(e, Fr);
                            if (Zr(t) && "function" == typeof Hr && (t = Hr(t._payload)), r.isValidElement(t)) {
                                var i = function(e) {
                                        var n, t, r = null === (n = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === n ? void 0 : n.get,
                                            o = r && "isReactWarning" in r && r.isReactWarning;
                                        return o ? e.ref : (o = (r = null === (t = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === t ? void 0 : t.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                    }(t),
                                    a = function(e, n) {
                                        var t = Ur({}, n),
                                            r = function(r) {
                                                var o = e[r],
                                                    i = n[r];
                                                /^on[A-Z]/.test(r) ? o && i ? t[r] = function() {
                                                    var e = i.apply(void 0, arguments);
                                                    return o.apply(void 0, arguments), e
                                                } : o && (t[r] = o) : "style" === r ? t[r] = Ur(Ur({}, o), i) : "className" === r && (t[r] = [o, i].filter(Boolean).join(" "))
                                            };
                                        for (var o in n) r(o);
                                        return Ur(Ur({}, e), t)
                                    }(o, t.props);
                                return t.type !== r.Fragment && (a.ref = n ? function() {
                                    for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                                    return function(e) {
                                        var t = !1,
                                            r = n.map((function(n) {
                                                var r = $r(n, e);
                                                return t || "function" != typeof r || (t = !0), r
                                            }));
                                        if (t) return function() {
                                            for (var e = 0; e < r.length; e++) {
                                                var t = r[e];
                                                "function" == typeof t ? t() : $r(n[e], null)
                                            }
                                        }
                                    }
                                }(n, i) : i), r.cloneElement(t, a)
                            }
                            return r.Children.count(t) > 1 ? r.Children.only(null) : null
                        }));
                        return n.displayName = "".concat(e, ".SlotClone"), n
                    }(e),
                    t = r.forwardRef((function(e, t) {
                        var o = e.children,
                            i = Vr(e, zr);
                        Zr(o) && "function" == typeof Hr && (o = Hr(o._payload));
                        var a = r.Children.toArray(o),
                            u = a.find(Yr);
                        if (u) {
                            var c = u.props.children,
                                l = a.map((function(e) {
                                    return e === u ? r.Children.count(c) > 1 ? r.Children.only(null) : r.isValidElement(c) ? c.props.children : null : e
                                }));
                            return (0, f.jsx)(n, Ur(Ur({}, i), {}, {
                                ref: t,
                                children: r.isValidElement(c) ? r.cloneElement(c, void 0, l) : null
                            }))
                        }
                        return (0, f.jsx)(n, Ur(Ur({}, i), {}, {
                            ref: t,
                            children: o
                        }))
                    }));
                return t.displayName = "".concat(e, ".Slot"), t
            }("Slot");
            var Xr = Symbol("radix.slottable");

            function Yr(e) {
                return r.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === Xr
            }
            var Jr = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                Qr = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                eo = {
                    Large: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    Medium: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    Small: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    XSmall: {
                        circular: "radius-circle",
                        square: "radius-small"
                    }
                },
                no = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                to = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                ro = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                oo = {
                    Default: {
                        Emphasis: "content-action-emphasis",
                        Standard: "content-action-standard",
                        Alert: "content-action-alert",
                        Utility: "content-emphasis",
                        OverMedia: "content-emphasis"
                    },
                    Inverse: {
                        Emphasis: "content-inverse-action-emphasis",
                        Standard: "content-inverse-action-standard",
                        Alert: "content-inverse-action-alert",
                        Utility: "content-inverse-emphasis",
                        OverMedia: "content-inverse-emphasis"
                    }
                },
                io = {
                    Default: {
                        Emphasis: "content-action-standard",
                        Standard: "content-action-standard",
                        Alert: "content-action-standard",
                        Utility: "content-emphasis",
                        OverMedia: "content-emphasis"
                    },
                    Inverse: {
                        Emphasis: "content-inverse-action-standard",
                        Standard: "content-inverse-action-standard",
                        Alert: "content-inverse-action-standard",
                        Utility: "content-inverse-emphasis",
                        OverMedia: "content-inverse-emphasis"
                    }
                },
                ao = (0, r.forwardRef)((function(e, n) {
                    var t, r = e.className,
                        i = e.icon,
                        a = e.ariaLabel,
                        u = e.isDisabled,
                        l = void 0 !== u && u,
                        f = e.isCircular,
                        d = void 0 !== f && f,
                        p = e.isSelected,
                        h = void 0 !== p && p,
                        v = e.size,
                        g = void 0 === v ? "Large" : v,
                        m = e.variant,
                        y = void 0 === m ? "Emphasis" : m,
                        b = e.iconColor,
                        w = void 0 === b ? "Default" : b,
                        _ = e.asChild,
                        S = e.children,
                        E = c(e, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]);
                    t = l ? to[y] : h ? ro[y] : no[y];
                    var A = s("foundation-web-icon-button", l ? "opacity-[0.5]" : [Jt, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", Jr[g], eo[g][d ? "circular" : "square"], t, r),
                        x = o().createElement(o().Fragment, null, o().createElement(Qt, null), o().createElement("span", {
                            className: s("icon", i, Qr[g], l ? io[w][y] : oo[w][y])
                        }));
                    if (_) {
                        var O = c(E, ["as"]),
                            C = o().Children.only(S);
                        return o().createElement(Gr, Object.assign({
                            ref: n
                        }, O, {
                            className: A,
                            "aria-label": a,
                            "aria-disabled": l || void 0
                        }), o().cloneElement(C, {}, x))
                    }
                    if ("a" === E.as) {
                        E.as;
                        var k = E.href,
                            P = c(E, ["as", "href"]);
                        return o().createElement("a", Object.assign({
                            ref: n
                        }, P, {
                            "aria-label": a,
                            "aria-disabled": l,
                            href: l ? void 0 : k,
                            className: A
                        }), x)
                    }
                    var T = c(E, ["as"]);
                    return o().createElement("button", Object.assign({
                        ref: n,
                        type: "button"
                    }, T, {
                        "aria-label": a,
                        disabled: l,
                        className: A
                    }), x)
                })),
                uo = function(e) {
                    var n = e.isActive,
                        t = void 0 !== n && n,
                        r = e.user;
                    return o().createElement(o().Fragment, null, o().createElement("div", {
                        className: "account-selection-thumbnail"
                    }, o().createElement(gr.Thumbnail2d, {
                        containerClass: "avatar-card-image",
                        type: gr.ThumbnailTypes.avatarHeadshot,
                        targetId: r.id,
                        size: gr.ThumbnailAvatarHeadshotSize.size60,
                        includeProfileFrame: !0
                    })), o().createElement("div", {
                        className: "account-selection-name-container"
                    }, o().createElement("p", {
                        className: "account-selection-displayname"
                    }, r.displayName || r.name), o().createElement("p", {
                        className: "account-selection-username"
                    }, r.name ? mr + r.name : "")), t && o().createElement(Yt, {
                        className: "account-switcher-foundation-check content-system-success",
                        name: "icon-regular-circle-check",
                        size: "Medium"
                    }))
                },
                co = function(e) {
                    var n = e.isActive,
                        t = void 0 !== n && n,
                        i = e.onAccountSelection,
                        a = e.user,
                        u = (0, r.useState)(!1),
                        c = u[0],
                        l = u[1];
                    if (t) return o().createElement("li", {
                        className: "account-selection-list-item"
                    }, o().createElement("div", {
                        "aria-current": "true",
                        className: "active-account account-switcher-foundation-row",
                        "data-testid": "foundation-account-switcher-active-account-row"
                    }, o().createElement(uo, {
                        isActive: !0,
                        user: a
                    })));
                    return o().createElement("li", {
                        className: "account-selection-list-item"
                    }, o().createElement("button", {
                        className: "account-selection account-switcher-foundation-row",
                        "data-testid": "foundation-account-switcher-account-row",
                        onClick: function() {
                            if (!c) {
                                l(!0);
                                try {
                                    i(a.id)
                                } catch (e) {
                                    l(!1)
                                }
                            }
                        },
                        type: "button"
                    }, o().createElement(uo, {
                        user: a
                    }), c && o().createElement("div", {
                        className: "spinner spinner-sm spinner-no-margin spinner-block"
                    })))
                },
                lo = function(e) {
                    var n = e.handleAddAccount,
                        t = e.translate,
                        i = (0, r.useState)(!1),
                        a = i[0],
                        u = i[1];
                    return o().createElement("li", {
                        className: "account-selection-list-item"
                    }, o().createElement("button", {
                        className: "account-selection account-switcher-foundation-row",
                        "data-testid": "foundation-account-switcher-add-account-row",
                        onClick: function() {
                            u(!0), n()
                        },
                        type: "button"
                    }, o().createElement("div", {
                        className: "account-switcher-icon-add"
                    }, o().createElement("span", {
                        className: "icon-plus"
                    })), o().createElement("div", {
                        className: "account-selection-name-container"
                    }, o().createElement("p", {
                        className: "account-selection-add-account"
                    }, t(wr.ActionAddAccount))), a && o().createElement("div", {
                        className: "spinner spinner-sm spinner-block"
                    })))
                },
                so = function(e) {
                    var n = e.activeUser,
                        t = e.handleAddAccount,
                        r = e.isAccountLimitReached,
                        i = e.onAccountSelection,
                        a = e.suppressAddAccountRow,
                        u = void 0 !== a && a,
                        c = e.translate,
                        l = e.users;
                    return o().createElement("ul", {
                        className: "account-switcher-list account-switcher-foundation-list"
                    }, n && o().createElement(co, {
                        isActive: !0,
                        key: n.id,
                        onAccountSelection: i,
                        user: n
                    }), l.map((function(e) {
                        return o().createElement(co, {
                            key: e.id,
                            onAccountSelection: i,
                            user: e
                        })
                    })), !r && !u && o().createElement(lo, {
                        handleAddAccount: t,
                        translate: c
                    }))
                },
                fo = CoreRobloxUtilities,
                po = {
                    schematizedEventTypes: {
                        authFormInteraction: "authFormInteraction",
                        authButtonClick: "authButtonClick",
                        authMsgShown: "authMsgShown",
                        authPageLoad: "authPageload",
                        authModalShown: "authModalShown",
                        authClientError: "authClientError",
                        authOperationTiming: "authOperationTiming",
                        usernameSuggestionShown: "usernameSuggestionShown",
                        passkeyRegistrationEvent: "passkeyRegistrationEvent"
                    },
                    eventName: {
                        loginOtherDevice: "loginOtherDevice",
                        formValidation: "formValidation",
                        authPageLoad: "authPageload",
                        authFormInteraction: "authFormInteraction",
                        authButtonClick: "authButtonClick",
                        authModalShown: "authModalShown",
                        saiCreated: "saiCreated",
                        saiMissing: "saiMissing",
                        signupUsernameKeystrokes: "accountIntegrityKeystrokeEvents",
                        qualifiedSignup: "qualifiedSignup"
                    },
                    context: {
                        loginPage: "loginPage",
                        loginForm: "LoginForm",
                        schematizedLoginForm: "loginForm",
                        lrLoginForm: "lrLoginForm",
                        landingPage: "Multiverse",
                        signupForm: "MultiverseSignupForm",
                        schematizedSignupForm: "signupForm",
                        lrSignupForm: "lrSignupForm",
                        sendOTP: "sendOTP",
                        schematizedSendOTP: "sendOtp",
                        enterOTP: "enterOTP",
                        schematizedEnterOTP: "enterOtp",
                        validateOTP: "validateOTP",
                        disambiguationOTP: "disambiguationOTP",
                        disambiguationEmail: "disambiguationEmail",
                        disambiguationPhone: "disambiguationPhone",
                        disambigOTP: "disambigOtp",
                        revertAccount: "revertAccount",
                        accountSwitcherConfirmation: "accountSwitcherConfirmation",
                        accountSwitcherModal: "accountSwitcherModal",
                        accountSwitcherLimitError: "accountSwitcherLimitError",
                        accountSwitcherLogin: "accountSwitcherLogin",
                        accountSwitcherSignup: "accountSwitcherSignup",
                        accountSwitcherBackendRequestFailure: "accountSwitcherBackendRequestFailure",
                        accountSwitcherLocalStorageFailure: "accountSwitcherLocalStorageFailure",
                        accountSwitcherVpcLogin: "accountSwitcherVpcLogin",
                        accountSwitcherVpcSignup: "accountSwitcherVpcSignup",
                        platformAuthenticatorSupport: "platformAuthenticatorSupport",
                        passkeyLogin: "passkeyLogin",
                        silentPasskeyUpgradeWebLogin: "handleSilentPasskeyUpgradeWebLogin",
                        silentPasskeyUpgradeWebSignup: "handleSilentPasskeyUpgradeWebSignup",
                        silentPasskeyUpgradeWebLoginImmediate: "handleSilentPasskeyUpgradeWebLoginImmediate",
                        silentPasskeyUpgradeWebLoginDelayed: "handleSilentPasskeyUpgradeWebLoginDelayed",
                        silentPasskeyUpgradeWebSignupDelayed: "handleSilentPasskeyUpgradeWebSignupDelayed",
                        hba: "hba",
                        resetPasswordPage: "resetPasswordPage",
                        kisaU14Signup: "kisaU14Signup",
                        platformRestrictedPage: "platformRestrictedPage",
                        passkeyRegistration: "passkeyRegistration",
                        addAuthMethodPage: "addAuthMethodPage",
                        passkeyCeremony: "passkeyCeremony"
                    },
                    verifiedParentalConsentContext: {
                        chargeback: {
                            finishParentalSignup: "finishParentalSignup",
                            homepage: "homepage"
                        },
                        savePaymentMethods: {
                            finishParentalSignup: "finishParentalSignupDevsubs",
                            homepage: "homepageDevsubs"
                        },
                        changeBirthdayContext: {
                            finishParentalSignup: "finishParentalSignupAgeChange",
                            homepage: "homepageAgeChange"
                        },
                        linkToChild: {
                            finishParentalSignup: "finishParentalSignupLinking",
                            homepage: "homePageLinking"
                        },
                        updateUserSetting: {
                            finishParentalSignup: "finishParentalSignupSettings",
                            homepage: "homePageSettings"
                        }
                    },
                    aType: {
                        buttonClick: "buttonClick",
                        click: "click",
                        offFocus: "offFocus",
                        focus: "focus",
                        shown: "shown",
                        dismissed: "dismissed"
                    },
                    field: {
                        loginOtherDevice: "loginOtherDevice",
                        loginOTP: "loginOTP",
                        OTP: "otp",
                        loginSubmitButtonName: "loginSubmit",
                        password: "password",
                        username: "username",
                        signupSubmitButtonName: "signupSubmit",
                        appButtonClickName: "AppLink",
                        showPassword: "showPassword",
                        hidePassword: "hidePassword",
                        birthdayDay: "birthdayDay",
                        birthdayMonth: "birthdayMonth",
                        birthdayYear: "birthdayYear",
                        signupUsername: "signupUsername",
                        signupPassword: "signupPassword",
                        signupEmail: "signupEmail",
                        parentEmail: "parentEmail",
                        genderMale: "genderMale",
                        genderFemale: "genderFemale",
                        email: "email",
                        code: "code",
                        otpCode: "OTPcode",
                        errorMessage: "errorMessage",
                        resendErrorMessage: "resendErrorMessage",
                        accountSelection: "accountSelection",
                        checked: "checked",
                        unchecked: "unchecked",
                        usernameValid: "usernameValid",
                        revertAccountSubmitButtonName: "revertAccountSubmit",
                        birthday: "birthday",
                        accountSwitcher: "accountSwitcher",
                        logoutPopup: "logoutPopup",
                        hasAuthIntent: "hasAuthIntent",
                        tosCheckbox: "tosCheckbox",
                        exitSignupConfirmation: "exitSignupConfirmation",
                        autoPrompt: "autoPrompt",
                        deliberateRetry: "deliberateRetry",
                        general: "general"
                    },
                    btn: {
                        cancel: "cancel",
                        sendCode: "sendCode",
                        resendCode: "resendCode",
                        resend: "resend",
                        login: "login",
                        xdl: "xdl",
                        forgotCredentials: "forgotCredentials",
                        createAccount: "createAccount",
                        logoutAll: "logoutAll",
                        signup: "signup",
                        continue: "continue",
                        changeEmail: "changeEmail",
                        select: "select",
                        parentalConsentCheckbox: "pc_checkbox",
                        termsOfServiceCheckbox: "tos_checkbox",
                        privacyPolicyCheckbox: "pp_checkbox",
                        termsOfServiceLink: "tos_link",
                        privacyPolicyLink: "pp_link",
                        submitRevertAccount: "submitRevertAccount",
                        dismiss: "dismiss",
                        switch: "switch",
                        addAccount: "addAccount",
                        primaryButton: "primaryButton",
                        secondaryButton: "secondaryButton",
                        usernameSuggestion: "usernameSuggestion",
                        signIn: "signIn",
                        lrSignInButton: "lrSignInButton",
                        signupSubmit: "signupSubmit",
                        genderMale: "genderMale",
                        genderFemale: "genderFemale",
                        showPassword: "showPassword",
                        hidePassword: "hidePassword",
                        koreaConsentAllCheckbox: "koreaConsentAll",
                        koreaTosAndPrivacyPolicyCheckbox: "koreaToS1",
                        koreaThirdPartyPersonalInfoCheckbox: "koreaToS2",
                        koreaTransferPersonalInfoCheckbox: "koreaToS3",
                        koreaPersonalInfoCheckbox: "koreaToS4",
                        koreaOptionalPersonalInfoCheckbox: "koreaToS5Optional",
                        koreaAgreeTermsOfService: "koreaAgreeToS",
                        logoutPopupLogout: "logoutPopupLogout",
                        addPasskeyInlineCTA: "addPasskeyInlineCTA",
                        addPasskeyModal: "addPasskeyModal",
                        skipPasskey: "skipPasskey",
                        exitSignupConfirmYes: "exitSignupConfirmYes",
                        exitSignupConfirmCancel: "exitSignupConfirmCancel",
                        logout: "logout",
                        passkey: "passkey",
                        password: "password",
                        back: "back"
                    },
                    input: {
                        redacted: "[Redacted]"
                    },
                    origin: {
                        webVerifiedSignup: "WebVerifiedSignup",
                        signup: "signup",
                        login: "login",
                        signUpV2Arm: {
                            passwordFirst: "passwordFirst",
                            passkeyFirst: "passkeyFirst",
                            foundationControl: "foundationControl"
                        }
                    },
                    ctype: {
                        passkeyCeremony: "passkeyCeremony",
                        password: "password",
                        autoPromptSuppressed: "autoPromptSuppressed"
                    },
                    text: {
                        finishCreatingYourAccount: "Create Your Roblox Account",
                        signup: "Sign Up",
                        createAccount: "Create Account",
                        logout: "Log Out"
                    },
                    clientErrorTypes: {
                        pageLoadFailed: "pageLoadFailed",
                        userInfoFetchFailed: "userInfoFetchFailed",
                        localStorageSetFailure: "localStorageSetFailure",
                        localStorageGetFailure: "localStorageGetFailure",
                        localStorageRemoveFailure: "localStorageRemoveFailure",
                        logoutAllAccountSwitcherAccounts: "logoutAllAccountSwitcherAccounts"
                    },
                    state: {
                        focused: "focused",
                        unfocused: "unfocused",
                        selected: "selected",
                        unselected: "unselected",
                        skipVPC: "skipVPC",
                        launchParentSignUpOtp: "launchParentSignUpOtp",
                        accountSwitcher: {
                            switchSuccess: "success",
                            invalidSession: "invalidSession",
                            requestFailed: "requestFailed"
                        },
                        passkeyUpselling: {
                            passkeyRegistrationSuccess: "passkeyRegistrationSuccess",
                            passkeyRegistrationFailure: "passkeyRegistrationFailure",
                            passkeyOsDialogue: "passkeyOsDialogue",
                            passkeyUpsellModal: "passkeyUpsellModal",
                            passkeyUpsellShown: "passkeyUpsellShown",
                            passkeyNotSupported: "passkeyNotSupported",
                            passkeyUpsellFilteredByInAppTraffic: "passkeyUpsellFilteredByInAppTraffic",
                            filteredByNoPasskeySupport: "filteredByNoPasskeySupport",
                            filteredByNoSilentUpgradeSupport: "filteredByNoSilentUpgradeSupport",
                            unclearedWebSessionFlag: "unclearedWebSessionFlag"
                        },
                        signUpV2: {
                            addAuthMethodEntry: {
                                dismissed: "dismissed",
                                unsupported: "unsupported",
                                error: "error",
                                autoPromptSuppressed: "autoPromptSuppressed"
                            },
                            authMethodChosen: "authMethodChosen",
                            abandoned: {
                                awaitingCeremony: "abandoned:awaitingCeremony",
                                awaitingChoice: "abandoned:awaitingChoice",
                                formIncomplete: "abandoned:formIncomplete"
                            }
                        },
                        signupError: {
                            captcha: "captcha",
                            field: "field",
                            identityVerification: "identityVerification",
                            general: "general",
                            ageRestriction: "ageRestriction",
                            accountSwitcher: "accountSwitcher",
                            passkeyRegistrationFailed: "passkeyRegistrationFailed",
                            abandonedChallenge: "abandonedChallenge",
                            unknown: "unknown",
                            unknownTooManyAttempts: "unknown:tooManyAttempts"
                        }
                    },
                    passkeyRegistrationSource: {
                        signup: "signup"
                    },
                    passkeyRegistrationState: {
                        signupPreauthCredentialCreated: "SignupPreauthCredentialCreated",
                        signupPreauthDismissed: "SignupPreauthDismissed",
                        signupPreauthUnsupported: "SignupPreauthUnsupported",
                        signupPreauthError: "SignupPreauthError",
                        signupBindSuccess: "SignupBindSuccess",
                        signupBindFailed: "SignupBindFailed"
                    }
                },
                ho = function() {
                    return ho = Object.assign || function(e) {
                        for (var n, t = 1, r = arguments.length; t < r; t++)
                            for (var o in n = arguments[t]) Object.prototype.hasOwnProperty.call(n, o) && (e[o] = n[o]);
                        return e
                    }, ho.apply(this, arguments)
                },
                vo = function(e, n, t, r) {
                    void 0 === r && (r = {}), fo.eventStreamService.sendEventWithTarget(po.schematizedEventTypes.authOperationTiming, e, ho({
                        state: n,
                        elapsedTime: Math.round(t).toString()
                    }, r))
                },
                go = function(e, n, t) {
                    void 0 === t && (t = {}), fo.eventStreamService.sendEventWithTarget(po.schematizedEventTypes.authClientError, e, ho({
                        state: n
                    }, t))
                },
                mo = function(e, n) {
                    fo.eventStreamService.sendEventWithTarget(po.schematizedEventTypes.authButtonClick, po.context.accountSwitcherConfirmation, {
                        state: e,
                        btn: n
                    })
                },
                yo = function(e) {
                    var n = e.users,
                        t = e.isAccountLimitReached,
                        i = e.onAccountSelection,
                        a = e.handleAddAccount,
                        u = e.suppressAddAccountRow,
                        c = void 0 !== u && u,
                        l = (e.handleShowLogoutAllModal, e.handleModalDismiss),
                        s = e.activeUser,
                        f = e.accountListVariant,
                        d = void 0 === f ? "legacy" : f,
                        p = e.isAccountListVariantResolved,
                        h = void 0 === p || p,
                        v = e.translate,
                        g = (0, r.useState)(!1),
                        m = g[0],
                        y = g[1];
                    (0, r.useEffect)((function() {
                        if (!m && h) {
                            var e = n.map((function(e) {
                                return e.id
                            })).join(",");
                            t = e, void 0 === (r = {
                                accountSwitcherComponentVariant: d,
                                hasActiveAccount: null != s ? 1 : 0,
                                switchableAccountCount: n.length
                            }) && (r = {}), fo.eventStreamService.sendEventWithTarget(po.schematizedEventTypes.authModalShown, po.context.accountSwitcherModal, ho({
                                field: po.field.accountSwitcher,
                                state: t
                            }, r)), y(!0)
                        }
                        var t, r
                    }), [d, s, m, h, n]);
                    var b = "foundation" === d ? o().createElement(so, {
                            activeUser: s,
                            handleAddAccount: a,
                            isAccountLimitReached: t,
                            onAccountSelection: i,
                            suppressAddAccountRow: c,
                            translate: v,
                            users: n
                        }) : o().createElement("ul", {
                            className: "account-switcher-list "
                        }, s && o().createElement("li", {
                            className: "account-selection-list-item"
                        }, o().createElement(br, {
                            key: s.id,
                            userId: s.id,
                            username: s.name,
                            displayName: s.displayName,
                            onAccountSelection: i,
                            translate: v,
                            showIcon: !0
                        })), n.map((function(e) {
                            return o().createElement("li", {
                                className: "account-selection-list-item",
                                key: e.id
                            }, o().createElement(br, {
                                key: e.id,
                                userId: e.id,
                                username: e.name,
                                displayName: e.displayName,
                                onAccountSelection: i,
                                translate: v,
                                showIcon: !1
                            }))
                        })), !t && !c && o().createElement("li", {
                            className: "account-selection-list-item"
                        }, o().createElement(Ir, {
                            handleAddAccount: a,
                            translate: v
                        }))),
                        w = o().createElement("div", {
                            className: "foundation" === d ? "account-switcher-foundation-section modal-section" : "section-content modal-section"
                        }, t && o().createElement("p", {
                            className: "account-switcher-help-text"
                        }, v(wr.DescriptionAccountLimit)), b);
                    return "foundation" === d ? o().createElement(r.Fragment, null, o().createElement("div", {
                        className: "account-switcher-foundation-header"
                    }, o().createElement(ao, {
                        ariaLabel: v(xr),
                        className: "account-switcher-foundation-close",
                        icon: "icon-regular-x",
                        onClick: l,
                        size: "Large",
                        variant: "Utility"
                    }), o().createElement(fr, {
                        className: "account-switcher-foundation-title"
                    }, v(wr.HeadingSwitchAccount)), o().createElement("span", {
                        className: "account-switcher-foundation-header-spacer"
                    })), o().createElement(sr, {
                        className: "account-switcher-foundation-body"
                    }, w)) : o().createElement(r.Fragment, null, o().createElement(pr.Modal.Header, {
                        className: "account-switcher-header",
                        title: v(wr.HeadingSwitchAccount),
                        onClose: l
                    }), o().createElement(pr.Modal.Body, null, w))
                },
                bo = CoreUtilities,
                wo = function(e, n, t, r) {
                    return new(t || (t = Promise))((function(o, i) {
                        function a(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var n;
                            e.done ? o(e.value) : (n = e.value, n instanceof t ? n : new t((function(e) {
                                e(n)
                            }))).then(a, u)
                        }
                        c((r = r.apply(e, n || [])).next())
                    }))
                },
                _o = function(e, n) {
                    var t, r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return i = {
                        next: u(0),
                        throw: u(1),
                        return: u(2)
                    }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                        return this
                    }), i;

                    function u(i) {
                        return function(u) {
                            return function(i) {
                                if (t) throw new TypeError("Generator is already executing.");
                                for (; a;) try {
                                    if (t = 1, r && (o = 2 & i[0] ? r.return : i[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, i[1])).done) return o;
                                    switch (r = 0, o && (i = [2 & i[0], o.value]), i[0]) {
                                        case 0:
                                        case 1:
                                            o = i;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: i[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, r = i[1], i = [0];
                                            continue;
                                        case 7:
                                            i = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = a.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== i[0] && 2 !== i[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === i[0] && (!o || i[1] > o[0] && i[1] < o[3])) {
                                                a.label = i[1];
                                                break
                                            }
                                            if (6 === i[0] && a.label < o[1]) {
                                                a.label = o[1], o = i;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(i);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    i = n.call(e, a)
                                } catch (e) {
                                    i = [6, e], r = 0
                                } finally {
                                    t = o = 0
                                }
                                if (5 & i[0]) throw i[1];
                                return {
                                    value: i[0] ? i[1] : void 0,
                                    done: !0
                                }
                            }([i, u])
                        }
                    }
                },
                So = function(n) {
                    return e.EnvironmentUrls.apiGatewayUrl + n
                },
                Eo = t(243),
                Ao = function(e, n, t, r) {
                    return new(t || (t = Promise))((function(o, i) {
                        function a(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var n;
                            e.done ? o(e.value) : (n = e.value, n instanceof t ? n : new t((function(e) {
                                e(n)
                            }))).then(a, u)
                        }
                        c((r = r.apply(e, n || [])).next())
                    }))
                },
                xo = function(e, n) {
                    var t, r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return i = {
                        next: u(0),
                        throw: u(1),
                        return: u(2)
                    }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                        return this
                    }), i;

                    function u(i) {
                        return function(u) {
                            return function(i) {
                                if (t) throw new TypeError("Generator is already executing.");
                                for (; a;) try {
                                    if (t = 1, r && (o = 2 & i[0] ? r.return : i[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, i[1])).done) return o;
                                    switch (r = 0, o && (i = [2 & i[0], o.value]), i[0]) {
                                        case 0:
                                        case 1:
                                            o = i;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: i[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, r = i[1], i = [0];
                                            continue;
                                        case 7:
                                            i = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = a.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== i[0] && 2 !== i[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === i[0] && (!o || i[1] > o[0] && i[1] < o[3])) {
                                                a.label = i[1];
                                                break
                                            }
                                            if (6 === i[0] && a.label < o[1]) {
                                                a.label = o[1], o = i;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(i);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    i = n.call(e, a)
                                } catch (e) {
                                    i = [6, e], r = 0
                                } finally {
                                    t = o = 0
                                }
                                if (5 & i[0]) throw i[1];
                                return {
                                    value: i[0] ? i[1] : void 0,
                                    done: !0
                                }
                            }([i, u])
                        }
                    }
                },
                Oo = function(n) {
                    return Ao(void 0, void 0, Promise, (function() {
                        var t, r, o;
                        return xo(this, (function(i) {
                            switch (i.label) {
                                case 0:
                                    return a = "/v1/users", t = e.EnvironmentUrls.usersApi + a, r = {
                                        userIds: n
                                    }, o = {
                                        url: t,
                                        withCredentials: !1
                                    }, [4, bo.httpService.post(o, r)];
                                case 1:
                                    return [2, i.sent().data.data]
                            }
                            var a
                        }))
                    }))
                },
                Co = function(e, n, t, r) {
                    return new(t || (t = Promise))((function(o, i) {
                        function a(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var n;
                            e.done ? o(e.value) : (n = e.value, n instanceof t ? n : new t((function(e) {
                                e(n)
                            }))).then(a, u)
                        }
                        c((r = r.apply(e, n || [])).next())
                    }))
                },
                ko = function(e, n) {
                    var t, r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return i = {
                        next: u(0),
                        throw: u(1),
                        return: u(2)
                    }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                        return this
                    }), i;

                    function u(i) {
                        return function(u) {
                            return function(i) {
                                if (t) throw new TypeError("Generator is already executing.");
                                for (; a;) try {
                                    if (t = 1, r && (o = 2 & i[0] ? r.return : i[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, i[1])).done) return o;
                                    switch (r = 0, o && (i = [2 & i[0], o.value]), i[0]) {
                                        case 0:
                                        case 1:
                                            o = i;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: i[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, r = i[1], i = [0];
                                            continue;
                                        case 7:
                                            i = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = a.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== i[0] && 2 !== i[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === i[0] && (!o || i[1] > o[0] && i[1] < o[3])) {
                                                a.label = i[1];
                                                break
                                            }
                                            if (6 === i[0] && a.label < o[1]) {
                                                a.label = o[1], o = i;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(i);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    i = n.call(e, a)
                                } catch (e) {
                                    i = [6, e], r = 0
                                } finally {
                                    t = o = 0
                                }
                                if (5 & i[0]) throw i[1];
                                return {
                                    value: i[0] ? i[1] : void 0,
                                    done: !0
                                }
                            }([i, u])
                        }
                    }
                },
                Po = function() {
                    var e = document.querySelector('meta[name="account-switching-data"]');
                    return "true" === ((null == e ? void 0 : e.dataset) || {}).isAccountSwitchingEnabled
                },
                To = function() {
                    if (!Po()) return "";
                    try {
                        return fo.localStorageService.getLocalStorage(jr)
                    } catch (e) {
                        return console.warn(e), go(po.context.accountSwitcherLocalStorageFailure, po.clientErrorTypes.localStorageGetFailure), ""
                    }
                },
                jo = function(e) {
                    if (Po()) try {
                        fo.localStorageService.setLocalStorage(jr, e), fo.localStorageService.setLocalStorage(Rr, !0)
                    } catch (e) {
                        console.warn(e), go(po.context.accountSwitcherLocalStorageFailure, po.clientErrorTypes.localStorageSetFailure)
                    }
                },
                Ro = (0, Eo.memoize)((function() {
                    return Co(void 0, void 0, Promise, (function() {
                        var n, t;
                        return ko(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return r.trys.push([0, 2, , 3]), [4, null === e.ExperimentationService || void 0 === e.ExperimentationService ? void 0 : e.ExperimentationService.getAllValuesForLayer(Lr)];
                                case 1:
                                    return [2, !!(null == (n = r.sent()) ? void 0 : n.isAccountSwitcherEnabled)];
                                case 2:
                                    return t = r.sent(), console.info("Failed to get experiment parameter values for Account Switching", t), [2, !1];
                                case 3:
                                    return [2]
                            }
                        }))
                    }))
                })),
                No = function() {
                    return Co(void 0, void 0, Promise, (function() {
                        var e;
                        return ko(this, (function(n) {
                            return Po() ? (null === vr.authenticatedUser || void 0 === vr.authenticatedUser ? void 0 : vr.authenticatedUser.isAuthenticated) && (null === vr.authenticatedUser || void 0 === vr.authenticatedUser ? void 0 : vr.authenticatedUser.isUnder13) ? [2, !1] : null !== (e = To()) && "" !== e.trim() ? [2, !0] : (null === vr.authenticatedUser || void 0 === vr.authenticatedUser ? void 0 : vr.authenticatedUser.isAuthenticated) ? [2, Ro()] : [2, !1] : [2, !1]
                        }))
                    }))
                },
                Lo = function(e) {
                    return Co(void 0, void 0, Promise, (function() {
                        var n, t, r, o, i;
                        return ko(this, (function(a) {
                            switch (a.label) {
                                case 0:
                                    if (n = To(), t = {}, r = !1, !vr.authenticatedUser.isAuthenticated && !n) return [2, [t, r]];
                                    if (vr.authenticatedUser.isAuthenticated && vr.authenticatedUser.isUnder13) return [3, 4];
                                    a.label = 1;
                                case 1:
                                    return a.trys.push([1, 3, , 4]), [4, (u = {
                                        encrypted_users_data_blob: n,
                                        remove_invalid_active_user: e
                                    }, wo(void 0, void 0, Promise, (function() {
                                        var e, n;
                                        return _o(this, (function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return e = So("/account-switcher/v1/getLoggedInUsersMetadata"), n = {
                                                        url: e,
                                                        withCredentials: !0
                                                    }, [4, bo.httpService.post(n, u)];
                                                case 1:
                                                    return [2, t.sent().data]
                                            }
                                        }))
                                    })))];
                                case 2:
                                    return (t = a.sent()) && (jo(t.encrypted_users_data_blob), o = t.logged_in_users_metadata.length, t.active_user_id && vr.authenticatedUser.isAuthenticated && t.active_user_id !== vr.authenticatedUser.id.toString() && (o += 1), r = o >= 5), [3, 4];
                                case 3:
                                    throw i = a.sent(), console.warn("Parse user meta data failed!", i), i;
                                case 4:
                                    return [2, [t, r]]
                            }
                            var u
                        }))
                    }))
                },
                Mo = function(e, n) {
                    return void 0 === n && (n = !0), Co(void 0, void 0, Promise, (function() {
                        var t, r, o, i, a, u, c, l, s, f;
                        return ko(this, (function(d) {
                            switch (d.label) {
                                case 0:
                                    return o = [], i = -1, [4, No()];
                                case 1:
                                    return d.sent() ? [4, Lo(e)] : [2, {
                                        activeUser: r,
                                        usersAvailableForSwitching: o,
                                        isAccountLimitReached: !1,
                                        loggedOutUser: t
                                    }];
                                case 2:
                                    if (a = d.sent(), u = a[0], c = a[1], !u) return [3, 7];
                                    d.label = 3;
                                case 3:
                                    return d.trys.push([3, 6, , 7]), l = [], u.removed_user_metadata && "" !== u.removed_user_metadata.user_id && (i = Number(u.removed_user_metadata.user_id), l.push(u.removed_user_metadata.user_id)), u.logged_in_users_metadata && u.logged_in_users_metadata.forEach((function(e) {
                                        l.push(e.user_id)
                                    })), s = [], n ? [4, Oo(l)] : [3, 5];
                                case 4:
                                    (s = d.sent()) && ("" !== u.active_user_id && (r = s.find((function(e) {
                                        return e.id.toString() === u.active_user_id
                                    }))), -1 !== i && (t = s.find((function(e) {
                                        return e.id === i
                                    }))), o = s.filter((function(e) {
                                        return e.id !== i && e.id.toString() !== u.active_user_id
                                    }))), d.label = 5;
                                case 5:
                                    return [3, 7];
                                case 6:
                                    throw f = d.sent(), console.warn("Getting user info failed!", f), go(po.context.accountSwitcherBackendRequestFailure, po.clientErrorTypes.userInfoFetchFailed), f;
                                case 7:
                                    return [2, {
                                        activeUser: r,
                                        usersAvailableForSwitching: o,
                                        isAccountLimitReached: c,
                                        loggedOutUser: t
                                    }]
                            }
                        }))
                    }))
                },
                Io = function() {
                    return Co(void 0, void 0, Promise, (function() {
                        var e;
                        return ko(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    try {
                                        if (fo.localStorageService.getLocalStorage(Rr)) return [2]
                                    } catch (e) {
                                        return console.warn(e), go(po.context.accountSwitcherLocalStorageFailure, po.clientErrorTypes.localStorageGetFailure), [2]
                                    }
                                    return null === (e = To()) || "" === e.trim() ? [3, 2] : [4, Mo(!1, !1)];
                                case 1:
                                    n.sent(), n.label = 2;
                                case 2:
                                    return [2]
                            }
                        }))
                    }))
                },
                Do = function(e, n, t, r) {
                    return new(t || (t = Promise))((function(o, i) {
                        function a(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var n;
                            e.done ? o(e.value) : (n = e.value, n instanceof t ? n : new t((function(e) {
                                e(n)
                            }))).then(a, u)
                        }
                        c((r = r.apply(e, n || [])).next())
                    }))
                },
                zo = function(e, n) {
                    var t, r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return i = {
                        next: u(0),
                        throw: u(1),
                        return: u(2)
                    }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                        return this
                    }), i;

                    function u(i) {
                        return function(u) {
                            return function(i) {
                                if (t) throw new TypeError("Generator is already executing.");
                                for (; a;) try {
                                    if (t = 1, r && (o = 2 & i[0] ? r.return : i[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, i[1])).done) return o;
                                    switch (r = 0, o && (i = [2 & i[0], o.value]), i[0]) {
                                        case 0:
                                        case 1:
                                            o = i;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: i[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, r = i[1], i = [0];
                                            continue;
                                        case 7:
                                            i = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = a.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== i[0] && 2 !== i[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === i[0] && (!o || i[1] > o[0] && i[1] < o[3])) {
                                                a.label = i[1];
                                                break
                                            }
                                            if (6 === i[0] && a.label < o[1]) {
                                                a.label = o[1], o = i;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(i);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    i = n.call(e, a)
                                } catch (e) {
                                    i = [6, e], r = 0
                                } finally {
                                    t = o = 0
                                }
                                if (5 & i[0]) throw i[1];
                                return {
                                    value: i[0] ? i[1] : void 0,
                                    done: !0
                                }
                            }([i, u])
                        }
                    }
                },
                Fo = function(e) {
                    return !0 === e[Mr] ? "foundation" : "legacy"
                },
                Bo = function(e) {
                    return {
                        isEnrolled: Mr in e,
                        variant: Fo(e)
                    }
                },
                Uo = function(e) {
                    var n = e.origin,
                        t = e.localizedTitleText,
                        i = e.localizedBodyText,
                        a = e.shouldShowXButton,
                        u = void 0 !== a && a,
                        c = e.primaryButtonCallback,
                        l = e.localizedPrimaryButtonText,
                        s = e.secondaryButtonCallback,
                        f = e.localizedSecondaryButtonText,
                        d = e.onClose;
                    (0, r.useEffect)((function() {
                        var e;
                        e = n, fo.eventStreamService.sendEventWithTarget(po.schematizedEventTypes.authModalShown, po.context.accountSwitcherConfirmation, {
                            state: e
                        })
                    }), [n]);
                    return o().createElement(r.Fragment, null, o().createElement(pr.Modal.Header, {
                        className: "logout-all-accounts-header",
                        title: t,
                        onClose: d,
                        showCloseButton: u
                    }), o().createElement(pr.Modal.Body, null, o().createElement("div", {
                        className: "base-confirmation-modal-body-container"
                    }, o().createElement("div", {
                        className: "section-content modal-section"
                    }, o().createElement("p", {
                        className: "body-text"
                    }, i), l && c && o().createElement("button", {
                        type: "button",
                        id: "account-switch-primary-button",
                        className: "btn-full-width account-switch-primary-button btn-primary-md modal-button",
                        onClick: function() {
                            mo(n, po.btn.primaryButton), c && c()
                        }
                    }, l), f && s && o().createElement("button", {
                        type: "button",
                        id: "account-switch-secondary-button",
                        className: "btn-full-width account-switch-secondary-button btn-secondary-md modal-button",
                        onClick: function() {
                            mo(n, po.btn.secondaryButton), s && s()
                        }
                    }, f)))))
                },
                Wo = function(e, n, t, r) {
                    return new(t || (t = Promise))((function(o, i) {
                        function a(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var n;
                            e.done ? o(e.value) : (n = e.value, n instanceof t ? n : new t((function(e) {
                                e(n)
                            }))).then(a, u)
                        }
                        c((r = r.apply(e, n || [])).next())
                    }))
                },
                Vo = function(e, n) {
                    var t, r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return i = {
                        next: u(0),
                        throw: u(1),
                        return: u(2)
                    }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                        return this
                    }), i;

                    function u(i) {
                        return function(u) {
                            return function(i) {
                                if (t) throw new TypeError("Generator is already executing.");
                                for (; a;) try {
                                    if (t = 1, r && (o = 2 & i[0] ? r.return : i[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, i[1])).done) return o;
                                    switch (r = 0, o && (i = [2 & i[0], o.value]), i[0]) {
                                        case 0:
                                        case 1:
                                            o = i;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: i[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, r = i[1], i = [0];
                                            continue;
                                        case 7:
                                            i = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = a.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== i[0] && 2 !== i[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === i[0] && (!o || i[1] > o[0] && i[1] < o[3])) {
                                                a.label = i[1];
                                                break
                                            }
                                            if (6 === i[0] && a.label < o[1]) {
                                                a.label = o[1], o = i;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(i);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    i = n.call(e, a)
                                } catch (e) {
                                    i = [6, e], r = 0
                                } finally {
                                    t = o = 0
                                }
                                if (5 & i[0]) throw i[1];
                                return {
                                    value: i[0] ? i[1] : void 0,
                                    done: !0
                                }
                            }([i, u])
                        }
                    }
                },
                qo = (0, hr.withTranslations)((function(n) {
                    var t, i = n.modalType,
                        a = void 0 === i ? dr.AccountSwitcherModalType : i,
                        u = n.titleText,
                        c = n.helpText,
                        l = n.onAccountSwitched,
                        s = n.handleAddAccount,
                        f = n.suppressAddAccountRow,
                        d = void 0 !== f && f,
                        p = n.removeInvalidActiveUser,
                        h = void 0 !== p && p,
                        v = n.isModal,
                        g = n.translate,
                        m = n.loggedInUsers,
                        y = (0, r.useState)(!!m),
                        b = y[0],
                        w = y[1],
                        _ = (0, r.useState)(a),
                        S = _[0],
                        E = _[1],
                        A = (0, r.useState)("legacy"),
                        x = A[0],
                        O = A[1],
                        C = (0, r.useState)(!1),
                        k = C[0],
                        P = C[1],
                        T = (0, r.useState)(!1),
                        j = T[0],
                        R = T[1],
                        N = (0, r.useRef)(!1),
                        L = (0, r.useState)({
                            activeUser: {},
                            usersAvailableForSwitching: [],
                            isAccountLimitReached: !1
                        }),
                        M = L[0],
                        I = L[1],
                        D = vr.authenticatedUser.isAuthenticated && v;

                    function z() {
                        var n = {
                            containerId: Nr,
                            origin: _r.UnavailableError,
                            localizedTitleText: g(Sr),
                            localizedBodyText: g(Er),
                            localizedPrimaryButtonText: g(Or),
                            primaryButtonCallback: function() {
                                s()
                            }
                        };
                        e.AccountSwitcherService.renderBaseConfirmationModal(n)
                    }
                    var F = function() {
                            return D ? po.context.accountSwitcherModal : po.context.accountSwitcherLogin
                        },
                        B = function() {
                            return D ? {
                                accountSwitcherComponentVariant: x
                            } : {}
                        },
                        U = function(e) {
                            return Wo(void 0, void 0, void 0, (function() {
                                var n, t, r, o;
                                return Vo(this, (function(i) {
                                    switch (i.label) {
                                        case 0:
                                            if (!(n = To())) return [3, 4];
                                            t = {
                                                switched_from_user_id: vr.authenticatedUser.isAuthenticated ? vr.authenticatedUser.id.toString() : void 0,
                                                switched_to_user_id: e.toString(),
                                                encrypted_users_data_blob: n
                                            }, r = Date.now(), i.label = 1;
                                        case 1:
                                            return i.trys.push([1, 3, , 4]), u = F(), c = e.toString(), void 0 === (s = B()) && (s = {}), fo.eventStreamService.sendEventWithTarget(po.schematizedEventTypes.authButtonClick, u, ho({
                                                btn: po.btn.switch,
                                                state: c
                                            }, s)), [4, (a = t, wo(void 0, void 0, Promise, (function() {
                                                var e, n;
                                                return _o(this, (function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return e = So("/account-switcher/v1/switch"), n = {
                                                                url: e,
                                                                withCredentials: !0
                                                            }, [4, bo.httpService.post(n, a)];
                                                        case 1:
                                                            return [2, t.sent().data]
                                                    }
                                                }))
                                            })))];
                                        case 2:
                                            if (o = i.sent(), jo(o.encrypted_users_data_blob), o) {
                                                if (function(e) {
                                                        var n = e.errors;
                                                        return !!n && n.some((function(e) {
                                                            return e.code === Tr
                                                        }))
                                                    }(o)) return vo(F(), po.state.accountSwitcher.invalidSession, Date.now() - r, B()), z(), [2];
                                                vo(F(), po.state.accountSwitcher.switchSuccess, Date.now() - r, B()), l(e)
                                            }
                                            return [3, 4];
                                        case 3:
                                            return i.sent(), vo(F(), po.state.accountSwitcher.requestFailed, Date.now() - r, B()), z(), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                    var a, u, c, s
                                }))
                            }))
                        },
                        W = function() {
                            E(dr.LogoutAllAccountsModalType)
                        },
                        V = function(e) {
                            I(e)
                        };
                    (0, r.useEffect)((function() {
                        Wo(void 0, void 0, void 0, (function() {
                            var n, t, r, o, i, a;
                            return Vo(this, (function(u) {
                                switch (u.label) {
                                    case 0:
                                        return m ? (V(m), [3, 6]) : [3, 1];
                                    case 1:
                                        n = void 0, u.label = 2;
                                    case 2:
                                        return u.trys.push([2, 4, , 5]), [4, Mo(h)];
                                    case 3:
                                        return n = u.sent(), [3, 5];
                                    case 4:
                                        return u.sent(), t = {
                                            containerId: Nr,
                                            origin: _r.UnavailableError,
                                            localizedTitleText: g(Sr),
                                            localizedBodyText: g(Ar),
                                            localizedPrimaryButtonText: g(Or),
                                            primaryButtonCallback: function() {}
                                        }, e.AccountSwitcherService.renderBaseConfirmationModal(t), [2];
                                    case 5:
                                        r = n.activeUser, o = n.usersAvailableForSwitching, i = n.isAccountLimitReached, a = n.loggedOutUser, V({
                                            activeUser: r,
                                            usersAvailableForSwitching: o,
                                            isAccountLimitReached: i,
                                            loggedOutUser: a
                                        }), u.label = 6;
                                    case 6:
                                        return w(!0), [2]
                                }
                            }))
                        })).catch()
                    }), [m, h]), (0, r.useEffect)((function() {
                        Wo(void 0, void 0, void 0, (function() {
                            var n, t, r;
                            return Vo(this, (function(o) {
                                switch (o.label) {
                                    case 0:
                                        return [4, Do(void 0, void 0, Promise, (function() {
                                            var n, t;
                                            return zo(this, (function(r) {
                                                switch (r.label) {
                                                    case 0:
                                                        return r.trys.push([0, 2, 3, 4]), [4, Promise.race([null === e.ExperimentationService || void 0 === e.ExperimentationService ? void 0 : e.ExperimentationService.getAllValuesForLayer(Lr), new Promise((function(e) {
                                                            n = setTimeout((function() {
                                                                return e(void 0)
                                                            }), 2e3)
                                                        }))])];
                                                    case 1:
                                                        return t = r.sent(), [2, Bo(null != t ? t : {})];
                                                    case 2:
                                                        return r.sent(), [2, Bo({})];
                                                    case 3:
                                                        return void 0 !== n && clearTimeout(n), [7];
                                                    case 4:
                                                        return [2]
                                                }
                                            }))
                                        }))];
                                    case 1:
                                        return n = o.sent(), t = n.isEnrolled, r = n.variant, O(r), R(t), P(!0), [2]
                                }
                            }))
                        })).catch((function() {
                            O("legacy"), R(!1), P(!0)
                        }))
                    }), []), (0, r.useEffect)((function() {
                        !N.current && D && S === dr.AccountSwitcherModalType && b && k && j && (N.current = !0, function() {
                            var n;
                            try {
                                null === (n = null === e.ExperimentationService || void 0 === e.ExperimentationService ? void 0 : e.ExperimentationService.logLayerExposure) || void 0 === n || n.call(e.ExperimentationService, Lr)
                            } catch (e) {}
                        }())
                    }), [S, j, k, b, D]);
                    var q = function() {
                        var e;
                        w(!1), void 0 === (e = B()) && (e = {}), fo.eventStreamService.sendEventWithTarget(po.schematizedEventTypes.authButtonClick, po.context.accountSwitcherModal, ho({
                            btn: po.btn.dismiss
                        }, e))
                    };

                    function $() {
                        var e, n, t;
                        e = F(), n = po.btn.addAccount, void 0 === (t = B()) && (t = {}), fo.eventStreamService.sendEventWithTarget(po.schematizedEventTypes.authButtonClick, e, ho({
                            btn: n
                        }, t)), s()
                    }
                    return D && S === dr.AccountSwitcherModalType && !k ? o().createElement(o().Fragment, null) : D ? S === dr.AccountSwitcherModalType && "foundation" === x && k ? o().createElement(cr, {
                        open: b,
                        isModal: !0,
                        size: "Small",
                        type: "Default",
                        hasCloseAffordance: !1,
                        onOpenChange: function(e) {
                            e || q()
                        }
                    }, o().createElement(lr, {
                        className: "account-switcher-modal account-switcher-foundation-dialog"
                    }, o().createElement(yo, {
                        users: M.usersAvailableForSwitching,
                        isAccountLimitReached: M.isAccountLimitReached,
                        onAccountSelection: U,
                        handleAddAccount: $,
                        suppressAddAccountRow: d,
                        handleShowLogoutAllModal: W,
                        handleModalDismiss: q,
                        activeUser: M.activeUser,
                        accountListVariant: x,
                        isAccountListVariantResolved: k,
                        translate: g
                    }))) : o().createElement(pr.Modal, {
                        className: "account-switcher-modal",
                        show: b,
                        onHide: q,
                        size: "sm"
                    }, S === dr.AccountSwitcherModalType && o().createElement(yo, {
                        users: M.usersAvailableForSwitching,
                        isAccountLimitReached: M.isAccountLimitReached,
                        onAccountSelection: U,
                        handleAddAccount: $,
                        suppressAddAccountRow: d,
                        handleShowLogoutAllModal: W,
                        handleModalDismiss: q,
                        activeUser: M.activeUser,
                        accountListVariant: x,
                        isAccountListVariantResolved: k,
                        translate: g
                    }), S === dr.LogoutAllAccountsModalType && o().createElement(Uo, {
                        origin: _r.LogoutAll,
                        localizedTitleText: g(wr.ActionLogOutAllAccounts),
                        localizedBodyText: Cr,
                        primaryButtonCallback: function() {
                            return Wo(void 0, void 0, void 0, (function() {
                                var n;
                                return Vo(this, (function(t) {
                                    switch (t.label) {
                                        case 0:
                                            if (!(n = To())) return [3, 5];
                                            t.label = 1;
                                        case 1:
                                            return t.trys.push([1, 3, , 4]), [4, (r = {
                                                encrypted_users_data_blob: n
                                            }, wo(void 0, void 0, Promise, (function() {
                                                var e, n;
                                                return _o(this, (function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return e = So("/account-switcher/v1/logoutAllLoggedInUsers"), n = {
                                                                url: e,
                                                                withCredentials: !0
                                                            }, [4, bo.httpService.post(n, r)];
                                                        case 1:
                                                            return t.sent(), [2]
                                                    }
                                                }))
                                            })))];
                                        case 2:
                                            return t.sent(), [3, 4];
                                        case 3:
                                            return t.sent(), go(po.context.accountSwitcherModal, po.clientErrorTypes.logoutAllAccountSwitcherAccounts, B()), [3, 4];
                                        case 4:
                                            ! function() {
                                                try {
                                                    fo.localStorageService.removeLocalStorage(jr)
                                                } catch (e) {
                                                    console.warn(e), go(po.context.accountSwitcherLocalStorageFailure, po.clientErrorTypes.localStorageRemoveFailure)
                                                }
                                            }(), window.location.href = e.Endpoints.getAbsoluteUrl("/"), t.label = 5;
                                        case 5:
                                            return [2]
                                    }
                                    var r
                                }))
                            }))
                        },
                        localizedPrimaryButtonText: kr,
                        secondaryButtonCallback: q,
                        localizedSecondaryButtonText: Pr,
                        onClose: q
                    })) : o().createElement("div", {
                        className: "account-switcher-container"
                    }, (null === (t = M.usersAvailableForSwitching) || void 0 === t ? void 0 : t.length) > 0 && o().createElement(Dr, {
                        users: M.usersAvailableForSwitching,
                        titleText: u,
                        helpText: c,
                        onAccountSelection: U,
                        handleAddAccount: $,
                        suppressAddAccountRow: d,
                        translate: g
                    }))
                }), yr);
            var $o = function() {
                    var e = (0, r.useState)(!1),
                        n = e[0],
                        t = e[1],
                        o = (0, r.useState)(!1),
                        i = o[0],
                        a = o[1];
                    return (0, r.useEffect)((function() {
                        No().then((function(e) {
                            t(e)
                        })).finally((function() {
                            a(!0)
                        }))
                    }), []), [n, i]
                },
                Ko = function(e) {
                    var n = e.origin,
                        t = e.localizedTitleText,
                        i = e.localizedBodyText,
                        a = e.primaryButtonCallback,
                        u = e.localizedPrimaryButtonText,
                        c = e.secondaryButtonCallback,
                        l = e.localizedSecondaryButtonText,
                        s = e.isModalDismissable,
                        f = (0, r.useState)(!0),
                        d = f[0],
                        p = f[1],
                        h = function() {
                            s && p(!1)
                        };
                    return o().createElement(pr.Modal, {
                        className: "account-switcher-modal confirmation-modal",
                        show: d,
                        onHide: h,
                        size: "sm"
                    }, o().createElement(Uo, {
                        origin: n,
                        localizedTitleText: t,
                        localizedBodyText: i,
                        primaryButtonCallback: function() {
                            a && a(), p(!1)
                        },
                        localizedPrimaryButtonText: u,
                        secondaryButtonCallback: function() {
                            c && c(), p(!1)
                        },
                        localizedSecondaryButtonText: l,
                        onClose: h
                    }))
                },
                Ho = function(e, n, t, r) {
                    return new(t || (t = Promise))((function(o, i) {
                        function a(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var n;
                            e.done ? o(e.value) : (n = e.value, n instanceof t ? n : new t((function(e) {
                                e(n)
                            }))).then(a, u)
                        }
                        c((r = r.apply(e, n || [])).next())
                    }))
                },
                Zo = function(e, n) {
                    var t, r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return i = {
                        next: u(0),
                        throw: u(1),
                        return: u(2)
                    }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                        return this
                    }), i;

                    function u(i) {
                        return function(u) {
                            return function(i) {
                                if (t) throw new TypeError("Generator is already executing.");
                                for (; a;) try {
                                    if (t = 1, r && (o = 2 & i[0] ? r.return : i[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, i[1])).done) return o;
                                    switch (r = 0, o && (i = [2 & i[0], o.value]), i[0]) {
                                        case 0:
                                        case 1:
                                            o = i;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: i[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, r = i[1], i = [0];
                                            continue;
                                        case 7:
                                            i = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = a.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== i[0] && 2 !== i[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === i[0] && (!o || i[1] > o[0] && i[1] < o[3])) {
                                                a.label = i[1];
                                                break
                                            }
                                            if (6 === i[0] && a.label < o[1]) {
                                                a.label = o[1], o = i;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(i);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    i = n.call(e, a)
                                } catch (e) {
                                    i = [6, e], r = 0
                                } finally {
                                    t = o = 0
                                }
                                if (5 & i[0]) throw i[1];
                                return {
                                    value: i[0] ? i[1] : void 0,
                                    done: !0
                                }
                            }([i, u])
                        }
                    }
                },
                Go = function(e) {
                    var n = e.containerId,
                        t = e.titleText,
                        r = e.helpText,
                        a = e.onAccountSwitched,
                        u = e.handleAddAccount,
                        c = e.suppressAddAccountRow,
                        l = e.removeInvalidActiveUser,
                        s = e.isModal,
                        f = void 0 === s || s,
                        d = e.translate,
                        p = e.loggedInUsers;
                    return Ho(void 0, void 0, Promise, (function() {
                        var e;
                        return Zo(this, (function(s) {
                            switch (s.label) {
                                case 0:
                                    return e = document.getElementById(n), [4, No()];
                                case 1:
                                    return s.sent() && null != e ? ((0, i.unmountComponentAtNode)(e), (0, i.render)(o().createElement(qo, {
                                        titleText: t,
                                        helpText: r,
                                        onAccountSwitched: a,
                                        handleAddAccount: u,
                                        suppressAddAccountRow: c,
                                        removeInvalidActiveUser: l,
                                        isModal: f,
                                        translate: d,
                                        loggedInUsers: p
                                    }), e), [2, !0]) : [2, !1]
                            }
                        }))
                    }))
                },
                Xo = function(e) {
                    var n = e.containerId,
                        t = e.origin,
                        r = e.localizedTitleText,
                        a = e.localizedBodyText,
                        u = e.primaryButtonCallback,
                        c = e.localizedPrimaryButtonText,
                        l = e.secondaryButtonCallback,
                        s = e.localizedSecondaryButtonText,
                        f = e.isModalDismissable,
                        d = void 0 === f || f,
                        p = document.getElementById(n);
                    return !(!Po() || null == p) && ((0, i.unmountComponentAtNode)(p), (0, i.render)(o().createElement(Ko, {
                        origin: t,
                        localizedTitleText: r,
                        localizedBodyText: a,
                        primaryButtonCallback: u,
                        localizedPrimaryButtonText: c,
                        secondaryButtonCallback: l,
                        localizedSecondaryButtonText: s,
                        isModalDismissable: d
                    }), p), !0)
                },
                Yo = {
                    isAccountSwitcherAvailable: No,
                    renderAccountSwitcher: Go,
                    renderBaseConfirmationModal: Xo,
                    getStoredAccountSwitcherBlob: To,
                    storeAccountSwitcherBlob: jo,
                    useIsAccountSwitcherAvailableForBrowser: $o,
                    parseLoggedInUsers: Mo,
                    syncAccountSwitcherBlobIfNeeded: Io
                };
            Object.assign(n(), {
                AccountSwitcherService: Yo
            })
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/b347b814f546db9238c401f60b7fcd47-accountSwitcher.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("AccountSwitcher");