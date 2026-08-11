/*! For license information please see reactLogin.bundle.min.js.LICENSE.txt */ ! function() {
    var e = {
            7243: function(e, n, t) {
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
                            S = "[object Date]",
                            E = "[object Error]",
                            A = "[object Function]",
                            x = "[object GeneratorFunction]",
                            C = "[object Map]",
                            _ = "[object Number]",
                            k = "[object Object]",
                            L = "[object Promise]",
                            P = "[object RegExp]",
                            O = "[object Set]",
                            I = "[object String]",
                            T = "[object Symbol]",
                            R = "[object WeakMap]",
                            U = "[object ArrayBuffer]",
                            N = "[object DataView]",
                            D = "[object Float32Array]",
                            j = "[object Float64Array]",
                            M = "[object Int8Array]",
                            z = "[object Int16Array]",
                            B = "[object Int32Array]",
                            F = "[object Uint8Array]",
                            W = "[object Uint8ClampedArray]",
                            V = "[object Uint16Array]",
                            q = "[object Uint32Array]",
                            H = /\b__p \+= '';/g,
                            G = /\b(__p \+=) '' \+/g,
                            K = /(__e\(.*?\)|\b__t\)) \+\n'';/g,
                            Q = /&(?:amp|lt|gt|quot|#39);/g,
                            $ = /[&<>"']/g,
                            Y = RegExp(Q.source),
                            X = RegExp($.source),
                            Z = /<%-([\s\S]+?)%>/g,
                            J = /<%([\s\S]+?)%>/g,
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
                            Se = /[\xc0-\xd6\xd8-\xf6\xf8-\xff\u0100-\u017f]/g,
                            Ee = /($^)/,
                            Ae = /['\n\r\u2028\u2029\\]/g,
                            xe = "\\ud800-\\udfff",
                            Ce = "\\u0300-\\u036f\\ufe20-\\ufe2f\\u20d0-\\u20ff",
                            _e = "\\u2700-\\u27bf",
                            ke = "a-z\\xdf-\\xf6\\xf8-\\xff",
                            Le = "A-Z\\xc0-\\xd6\\xd8-\\xde",
                            Pe = "\\ufe0e\\ufe0f",
                            Oe = "\\xac\\xb1\\xd7\\xf7\\x00-\\x2f\\x3a-\\x40\\x5b-\\x60\\x7b-\\xbf\\u2000-\\u206f \\t\\x0b\\f\\xa0\\ufeff\\n\\r\\u2028\\u2029\\u1680\\u180e\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2007\\u2008\\u2009\\u200a\\u202f\\u205f\\u3000",
                            Ie = "['’]",
                            Te = "[" + xe + "]",
                            Re = "[" + Oe + "]",
                            Ue = "[" + Ce + "]",
                            Ne = "\\d+",
                            De = "[" + _e + "]",
                            je = "[" + ke + "]",
                            Me = "[^" + xe + Oe + Ne + _e + ke + Le + "]",
                            ze = "\\ud83c[\\udffb-\\udfff]",
                            Be = "[^" + xe + "]",
                            Fe = "(?:\\ud83c[\\udde6-\\uddff]){2}",
                            We = "[\\ud800-\\udbff][\\udc00-\\udfff]",
                            Ve = "[" + Le + "]",
                            qe = "\\u200d",
                            He = "(?:" + je + "|" + Me + ")",
                            Ge = "(?:" + Ve + "|" + Me + ")",
                            Ke = "(?:['’](?:d|ll|m|re|s|t|ve))?",
                            Qe = "(?:['’](?:D|LL|M|RE|S|T|VE))?",
                            $e = "(?:" + Ue + "|" + ze + ")" + "?",
                            Ye = "[" + Pe + "]?",
                            Xe = Ye + $e + ("(?:" + qe + "(?:" + [Be, Fe, We].join("|") + ")" + Ye + $e + ")*"),
                            Ze = "(?:" + [De, Fe, We].join("|") + ")" + Xe,
                            Je = "(?:" + [Be + Ue + "?", Ue, Fe, We, Te].join("|") + ")",
                            en = RegExp(Ie, "g"),
                            nn = RegExp(Ue, "g"),
                            tn = RegExp(ze + "(?=" + ze + ")|" + Je + Xe, "g"),
                            rn = RegExp([Ve + "?" + je + "+" + Ke + "(?=" + [Re, Ve, "$"].join("|") + ")", Ge + "+" + Qe + "(?=" + [Re, Ve + He, "$"].join("|") + ")", Ve + "?" + He + "+" + Ke, Ve + "+" + Qe, "\\d*(?:1ST|2ND|3RD|(?![123])\\dTH)(?=\\b|[a-z_])", "\\d*(?:1st|2nd|3rd|(?![123])\\dth)(?=\\b|[A-Z_])", Ne, Ze].join("|"), "g"),
                            on = RegExp("[" + qe + xe + Ce + Pe + "]"),
                            an = /[a-z][A-Z]|[A-Z]{2}[a-z]|[0-9][a-zA-Z]|[a-zA-Z][0-9]|[^a-zA-Z0-9 ]/,
                            un = ["Array", "Buffer", "DataView", "Date", "Error", "Float32Array", "Float64Array", "Function", "Int8Array", "Int16Array", "Int32Array", "Map", "Math", "Object", "Promise", "RegExp", "Set", "String", "Symbol", "TypeError", "Uint8Array", "Uint8ClampedArray", "Uint16Array", "Uint32Array", "WeakMap", "_", "clearTimeout", "isFinite", "parseInt", "setTimeout"],
                            cn = -1,
                            ln = {};
                        ln[D] = ln[j] = ln[M] = ln[z] = ln[B] = ln[F] = ln[W] = ln[V] = ln[q] = !0, ln[y] = ln[b] = ln[U] = ln[w] = ln[N] = ln[S] = ln[E] = ln[A] = ln[C] = ln[_] = ln[k] = ln[P] = ln[O] = ln[I] = ln[R] = !1;
                        var sn = {};
                        sn[y] = sn[b] = sn[U] = sn[N] = sn[w] = sn[S] = sn[D] = sn[j] = sn[M] = sn[z] = sn[B] = sn[C] = sn[_] = sn[k] = sn[P] = sn[O] = sn[I] = sn[T] = sn[F] = sn[W] = sn[V] = sn[q] = !0, sn[E] = sn[A] = sn[R] = !1;
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
                            Sn = function() {
                                try {
                                    var e = yn && yn.require && yn.require("util").types;
                                    return e || wn && wn.binding && wn.binding("util")
                                } catch (e) {}
                            }(),
                            En = Sn && Sn.isArrayBuffer,
                            An = Sn && Sn.isDate,
                            xn = Sn && Sn.isMap,
                            Cn = Sn && Sn.isRegExp,
                            _n = Sn && Sn.isSet,
                            kn = Sn && Sn.isTypedArray;

                        function Ln(e, n, t) {
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

                        function On(e, n) {
                            for (var t = -1, r = null == e ? 0 : e.length; ++t < r && !1 !== n(e[t], t, e););
                            return e
                        }

                        function In(e, n) {
                            for (var t = null == e ? 0 : e.length; t-- && !1 !== n(e[t], t, e););
                            return e
                        }

                        function Tn(e, n) {
                            for (var t = -1, r = null == e ? 0 : e.length; ++t < r;)
                                if (!n(e[t], t, e)) return !1;
                            return !0
                        }

                        function Rn(e, n) {
                            for (var t = -1, r = null == e ? 0 : e.length, o = 0, i = []; ++t < r;) {
                                var a = e[t];
                                n(a, t, e) && (i[o++] = a)
                            }
                            return i
                        }

                        function Un(e, n) {
                            return !!(null == e ? 0 : e.length) && qn(e, n, 0) > -1
                        }

                        function Nn(e, n, t) {
                            for (var r = -1, o = null == e ? 0 : e.length; ++r < o;)
                                if (t(n, e[r])) return !0;
                            return !1
                        }

                        function Dn(e, n) {
                            for (var t = -1, r = null == e ? 0 : e.length, o = Array(r); ++t < r;) o[t] = n(e[t], t, e);
                            return o
                        }

                        function jn(e, n) {
                            for (var t = -1, r = n.length, o = e.length; ++t < r;) e[o + t] = n[t];
                            return e
                        }

                        function Mn(e, n, t, r) {
                            var o = -1,
                                i = null == e ? 0 : e.length;
                            for (r && i && (t = e[++o]); ++o < i;) t = n(t, e[o], o, e);
                            return t
                        }

                        function zn(e, n, t, r) {
                            var o = null == e ? 0 : e.length;
                            for (r && o && (t = e[--o]); o--;) t = n(t, e[o], o, e);
                            return t
                        }

                        function Bn(e, n) {
                            for (var t = -1, r = null == e ? 0 : e.length; ++t < r;)
                                if (n(e[t], t, e)) return !0;
                            return !1
                        }
                        var Fn = Qn("length");

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
                            }(e, n, t) : Vn(e, Gn, t)
                        }

                        function Hn(e, n, t, r) {
                            for (var o = t - 1, i = e.length; ++o < i;)
                                if (r(e[o], n)) return o;
                            return -1
                        }

                        function Gn(e) {
                            return e != e
                        }

                        function Kn(e, n) {
                            var t = null == e ? 0 : e.length;
                            return t ? Xn(e, n) / t : v
                        }

                        function Qn(e) {
                            return function(n) {
                                return null == n ? o : n[e]
                            }
                        }

                        function $n(e) {
                            return function(n) {
                                return null == e ? o : e[n]
                            }
                        }

                        function Yn(e, n, t, r, o) {
                            return o(e, (function(e, o, i) {
                                t = r ? (r = !1, e) : n(t, e, o, i)
                            })), t
                        }

                        function Xn(e, n) {
                            for (var t, r = -1, i = e.length; ++r < i;) {
                                var a = n(e[r]);
                                a !== o && (t = t === o ? a : t + a)
                            }
                            return t
                        }

                        function Zn(e, n) {
                            for (var t = -1, r = Array(e); ++t < e;) r[t] = n(t);
                            return r
                        }

                        function Jn(e) {
                            return e ? e.slice(0, gt(e) + 1).replace(ae, "") : e
                        }

                        function et(e) {
                            return function(n) {
                                return e(n)
                            }
                        }

                        function nt(e, n) {
                            return Dn(n, (function(n) {
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
                        var it = $n({
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
                            at = $n({
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
                            }(e) : Fn(e)
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
                        var mt = $n({
                            "&amp;": "&",
                            "&lt;": "<",
                            "&gt;": ">",
                            "&quot;": '"',
                            "&#39;": "'"
                        });
                        var yt = function e(n) {
                            var t, r = (n = null == n ? gn : yt.defaults(gn.Object(), n, yt.pick(gn, un))).Array,
                                ue = n.Date,
                                xe = n.Error,
                                Ce = n.Function,
                                _e = n.Math,
                                ke = n.Object,
                                Le = n.RegExp,
                                Pe = n.String,
                                Oe = n.TypeError,
                                Ie = r.prototype,
                                Te = Ce.prototype,
                                Re = ke.prototype,
                                Ue = n["__core-js_shared__"],
                                Ne = Te.toString,
                                De = Re.hasOwnProperty,
                                je = 0,
                                Me = (t = /[^.]+$/.exec(Ue && Ue.keys && Ue.keys.IE_PROTO || "")) ? "Symbol(src)_1." + t : "",
                                ze = Re.toString,
                                Be = Ne.call(ke),
                                Fe = gn._,
                                We = Le("^" + Ne.call(De).replace(oe, "\\$&").replace(/hasOwnProperty|(function).*?(?=\\\()| for .+?(?=\\\])/g, "$1.*?") + "$"),
                                Ve = bn ? n.Buffer : o,
                                qe = n.Symbol,
                                He = n.Uint8Array,
                                Ge = Ve ? Ve.allocUnsafe : o,
                                Ke = st(ke.getPrototypeOf, ke),
                                Qe = ke.create,
                                $e = Re.propertyIsEnumerable,
                                Ye = Ie.splice,
                                Xe = qe ? qe.isConcatSpreadable : o,
                                Ze = qe ? qe.iterator : o,
                                Je = qe ? qe.toStringTag : o,
                                tn = function() {
                                    try {
                                        var e = pi(ke, "defineProperty");
                                        return e({}, "", {}), e
                                    } catch (e) {}
                                }(),
                                on = n.clearTimeout !== gn.clearTimeout && n.clearTimeout,
                                fn = ue && ue.now !== gn.Date.now && ue.now,
                                hn = n.setTimeout !== gn.setTimeout && n.setTimeout,
                                vn = _e.ceil,
                                mn = _e.floor,
                                yn = ke.getOwnPropertySymbols,
                                wn = Ve ? Ve.isBuffer : o,
                                Sn = n.isFinite,
                                Fn = Ie.join,
                                $n = st(ke.keys, ke),
                                bt = _e.max,
                                wt = _e.min,
                                St = ue.now,
                                Et = n.parseInt,
                                At = _e.random,
                                xt = Ie.reverse,
                                Ct = pi(n, "DataView"),
                                _t = pi(n, "Map"),
                                kt = pi(n, "Promise"),
                                Lt = pi(n, "Set"),
                                Pt = pi(n, "WeakMap"),
                                Ot = pi(ke, "create"),
                                It = Pt && new Pt,
                                Tt = {},
                                Rt = zi(Ct),
                                Ut = zi(_t),
                                Nt = zi(kt),
                                Dt = zi(Lt),
                                jt = zi(Pt),
                                Mt = qe ? qe.prototype : o,
                                zt = Mt ? Mt.valueOf : o,
                                Bt = Mt ? Mt.toString : o;

                            function Ft(e) {
                                if (tu(e) && !Ha(e) && !(e instanceof Ht)) {
                                    if (e instanceof qt) return e;
                                    if (De.call(e, "__wrapped__")) return Bi(e)
                                }
                                return new qt(e)
                            }
                            var Wt = function() {
                                function e() {}
                                return function(n) {
                                    if (!nu(n)) return {};
                                    if (Qe) return Qe(n);
                                    e.prototype = n;
                                    var t = new e;
                                    return e.prototype = o, t
                                }
                            }();

                            function Vt() {}

                            function qt(e, n) {
                                this.__wrapped__ = e, this.__actions__ = [], this.__chain__ = !!n, this.__index__ = 0, this.__values__ = o
                            }

                            function Ht(e) {
                                this.__wrapped__ = e, this.__actions__ = [], this.__dir__ = 1, this.__filtered__ = !1, this.__iteratees__ = [], this.__takeCount__ = g, this.__views__ = []
                            }

                            function Gt(e) {
                                var n = -1,
                                    t = null == e ? 0 : e.length;
                                for (this.clear(); ++n < t;) {
                                    var r = e[n];
                                    this.set(r[0], r[1])
                                }
                            }

                            function Kt(e) {
                                var n = -1,
                                    t = null == e ? 0 : e.length;
                                for (this.clear(); ++n < t;) {
                                    var r = e[n];
                                    this.set(r[0], r[1])
                                }
                            }

                            function Qt(e) {
                                var n = -1,
                                    t = null == e ? 0 : e.length;
                                for (this.clear(); ++n < t;) {
                                    var r = e[n];
                                    this.set(r[0], r[1])
                                }
                            }

                            function $t(e) {
                                var n = -1,
                                    t = null == e ? 0 : e.length;
                                for (this.__data__ = new Qt; ++n < t;) this.add(e[n])
                            }

                            function Yt(e) {
                                var n = this.__data__ = new Kt(e);
                                this.size = n.size
                            }

                            function Xt(e, n) {
                                var t = Ha(e),
                                    r = !t && qa(e),
                                    o = !t && !r && $a(e),
                                    i = !t && !r && !o && su(e),
                                    a = t || r || o || i,
                                    u = a ? Zn(e.length, Pe) : [],
                                    c = u.length;
                                for (var l in e) !n && !De.call(e, l) || a && ("length" == l || o && ("offset" == l || "parent" == l) || i && ("buffer" == l || "byteLength" == l || "byteOffset" == l) || wi(l, c)) || u.push(l);
                                return u
                            }

                            function Zt(e) {
                                var n = e.length;
                                return n ? e[$r(0, n - 1)] : o
                            }

                            function Jt(e, n) {
                                return Di(Io(e), cr(n, 0, e.length))
                            }

                            function er(e) {
                                return Di(Io(e))
                            }

                            function nr(e, n, t) {
                                (t !== o && !Fa(e[n], t) || t === o && !(n in e)) && ar(e, n, t)
                            }

                            function tr(e, n, t) {
                                var r = e[n];
                                De.call(e, n) && Fa(r, t) && (t !== o || n in e) || ar(e, n, t)
                            }

                            function rr(e, n) {
                                for (var t = e.length; t--;)
                                    if (Fa(e[t][0], n)) return t;
                                return -1
                            }

                            function or(e, n, t, r) {
                                return pr(e, (function(e, o, i) {
                                    n(r, e, t(e), i)
                                })), r
                            }

                            function ir(e, n) {
                                return e && To(n, Tu(n), e)
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
                                for (var t = -1, i = n.length, a = r(i), u = null == e; ++t < i;) a[t] = u ? o : ku(e, n[t]);
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
                                var f = Ha(e);
                                if (f) {
                                    if (u = function(e) {
                                            var n = e.length,
                                                t = new e.constructor(n);
                                            n && "string" == typeof e[0] && De.call(e, "index") && (t.index = e.index, t.input = e.input);
                                            return t
                                        }(e), !c) return Io(e, u)
                                } else {
                                    var d = gi(e),
                                        p = d == A || d == x;
                                    if ($a(e)) return Co(e, c);
                                    if (d == k || d == y || p && !i) {
                                        if (u = l || p ? {} : yi(e), !c) return l ? function(e, n) {
                                            return To(e, vi(e), n)
                                        }(e, function(e, n) {
                                            return e && To(n, Ru(n), e)
                                        }(u, e)) : function(e, n) {
                                            return To(e, hi(e), n)
                                        }(e, ir(u, e))
                                    } else {
                                        if (!sn[d]) return i ? e : {};
                                        u = function(e, n, t) {
                                            var r = e.constructor;
                                            switch (n) {
                                                case U:
                                                    return _o(e);
                                                case w:
                                                case S:
                                                    return new r(+e);
                                                case N:
                                                    return function(e, n) {
                                                        var t = n ? _o(e.buffer) : e.buffer;
                                                        return new e.constructor(t, e.byteOffset, e.byteLength)
                                                    }(e, t);
                                                case D:
                                                case j:
                                                case M:
                                                case z:
                                                case B:
                                                case F:
                                                case W:
                                                case V:
                                                case q:
                                                    return ko(e, t);
                                                case C:
                                                    return new r;
                                                case _:
                                                case I:
                                                    return new r(e);
                                                case P:
                                                    return function(e) {
                                                        var n = new e.constructor(e.source, ve.exec(e));
                                                        return n.lastIndex = e.lastIndex, n
                                                    }(e);
                                                case O:
                                                    return new r;
                                                case T:
                                                    return o = e, zt ? ke(zt.call(o)) : {}
                                            }
                                            var o
                                        }(e, d, c)
                                    }
                                }
                                a || (a = new Yt);
                                var h = a.get(e);
                                if (h) return h;
                                a.set(e, u), uu(e) ? e.forEach((function(r) {
                                    u.add(lr(r, n, t, r, e, a))
                                })) : ru(e) && e.forEach((function(r, o) {
                                    u.set(o, lr(r, n, t, o, e, a))
                                }));
                                var v = f ? o : (s ? l ? ai : ii : l ? Ru : Tu)(e);
                                return On(v || e, (function(r, o) {
                                    v && (r = e[o = r]), tr(u, o, lr(r, n, t, o, e, a))
                                })), u
                            }

                            function sr(e, n, t) {
                                var r = t.length;
                                if (null == e) return !r;
                                for (e = ke(e); r--;) {
                                    var i = t[r],
                                        a = n[i],
                                        u = e[i];
                                    if (u === o && !(i in e) || !a(u)) return !1
                                }
                                return !0
                            }

                            function fr(e, n, t) {
                                if ("function" != typeof e) throw new Oe(i);
                                return Ti((function() {
                                    e.apply(o, t)
                                }), n)
                            }

                            function dr(e, n, t, r) {
                                var o = -1,
                                    i = Un,
                                    a = !0,
                                    u = e.length,
                                    c = [],
                                    l = n.length;
                                if (!u) return c;
                                t && (n = Dn(n, et(t))), r ? (i = Nn, a = !1) : n.length >= 200 && (i = tt, a = !1, n = new $t(n));
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
                            Ft.templateSettings = {
                                escape: Z,
                                evaluate: J,
                                interpolate: ee,
                                variable: "",
                                imports: {
                                    _: Ft
                                }
                            }, Ft.prototype = Vt.prototype, Ft.prototype.constructor = Ft, qt.prototype = Wt(Vt.prototype), qt.prototype.constructor = qt, Ht.prototype = Wt(Vt.prototype), Ht.prototype.constructor = Ht, Gt.prototype.clear = function() {
                                this.__data__ = Ot ? Ot(null) : {}, this.size = 0
                            }, Gt.prototype.delete = function(e) {
                                var n = this.has(e) && delete this.__data__[e];
                                return this.size -= n ? 1 : 0, n
                            }, Gt.prototype.get = function(e) {
                                var n = this.__data__;
                                if (Ot) {
                                    var t = n[e];
                                    return t === a ? o : t
                                }
                                return De.call(n, e) ? n[e] : o
                            }, Gt.prototype.has = function(e) {
                                var n = this.__data__;
                                return Ot ? n[e] !== o : De.call(n, e)
                            }, Gt.prototype.set = function(e, n) {
                                var t = this.__data__;
                                return this.size += this.has(e) ? 0 : 1, t[e] = Ot && n === o ? a : n, this
                            }, Kt.prototype.clear = function() {
                                this.__data__ = [], this.size = 0
                            }, Kt.prototype.delete = function(e) {
                                var n = this.__data__,
                                    t = rr(n, e);
                                return !(t < 0) && (t == n.length - 1 ? n.pop() : Ye.call(n, t, 1), --this.size, !0)
                            }, Kt.prototype.get = function(e) {
                                var n = this.__data__,
                                    t = rr(n, e);
                                return t < 0 ? o : n[t][1]
                            }, Kt.prototype.has = function(e) {
                                return rr(this.__data__, e) > -1
                            }, Kt.prototype.set = function(e, n) {
                                var t = this.__data__,
                                    r = rr(t, e);
                                return r < 0 ? (++this.size, t.push([e, n])) : t[r][1] = n, this
                            }, Qt.prototype.clear = function() {
                                this.size = 0, this.__data__ = {
                                    hash: new Gt,
                                    map: new(_t || Kt),
                                    string: new Gt
                                }
                            }, Qt.prototype.delete = function(e) {
                                var n = fi(this, e).delete(e);
                                return this.size -= n ? 1 : 0, n
                            }, Qt.prototype.get = function(e) {
                                return fi(this, e).get(e)
                            }, Qt.prototype.has = function(e) {
                                return fi(this, e).has(e)
                            }, Qt.prototype.set = function(e, n) {
                                var t = fi(this, e),
                                    r = t.size;
                                return t.set(e, n), this.size += t.size == r ? 0 : 1, this
                            }, $t.prototype.add = $t.prototype.push = function(e) {
                                return this.__data__.set(e, a), this
                            }, $t.prototype.has = function(e) {
                                return this.__data__.has(e)
                            }, Yt.prototype.clear = function() {
                                this.__data__ = new Kt, this.size = 0
                            }, Yt.prototype.delete = function(e) {
                                var n = this.__data__,
                                    t = n.delete(e);
                                return this.size = n.size, t
                            }, Yt.prototype.get = function(e) {
                                return this.__data__.get(e)
                            }, Yt.prototype.has = function(e) {
                                return this.__data__.has(e)
                            }, Yt.prototype.set = function(e, n) {
                                var t = this.__data__;
                                if (t instanceof Kt) {
                                    var r = t.__data__;
                                    if (!_t || r.length < 199) return r.push([e, n]), this.size = ++t.size, this;
                                    t = this.__data__ = new Qt(r)
                                }
                                return t.set(e, n), this.size = t.size, this
                            };
                            var pr = No(Sr),
                                hr = No(Er, !0);

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
                                    n > 0 && t(u) ? n > 1 ? yr(u, n - 1, t, r, o) : jn(o, u) : r || (o[o.length] = u)
                                }
                                return o
                            }
                            var br = Do(),
                                wr = Do(!0);

                            function Sr(e, n) {
                                return e && br(e, n, Tu)
                            }

                            function Er(e, n) {
                                return e && wr(e, n, Tu)
                            }

                            function Ar(e, n) {
                                return Rn(n, (function(n) {
                                    return Za(e[n])
                                }))
                            }

                            function xr(e, n) {
                                for (var t = 0, r = (n = So(n, e)).length; null != e && t < r;) e = e[Mi(n[t++])];
                                return t && t == r ? e : o
                            }

                            function Cr(e, n, t) {
                                var r = n(e);
                                return Ha(e) ? r : jn(r, t(e))
                            }

                            function _r(e) {
                                return null == e ? e === o ? "[object Undefined]" : "[object Null]" : Je && Je in ke(e) ? function(e) {
                                    var n = De.call(e, Je),
                                        t = e[Je];
                                    try {
                                        e[Je] = o;
                                        var r = !0
                                    } catch (e) {}
                                    var i = ze.call(e);
                                    r && (n ? e[Je] = t : delete e[Je]);
                                    return i
                                }(e) : function(e) {
                                    return ze.call(e)
                                }(e)
                            }

                            function kr(e, n) {
                                return e > n
                            }

                            function Lr(e, n) {
                                return null != e && De.call(e, n)
                            }

                            function Pr(e, n) {
                                return null != e && n in ke(e)
                            }

                            function Or(e, n, t) {
                                for (var i = t ? Nn : Un, a = e[0].length, u = e.length, c = u, l = r(u), s = 1 / 0, f = []; c--;) {
                                    var d = e[c];
                                    c && n && (d = Dn(d, et(n))), s = wt(d.length, s), l[c] = !t && (n || a >= 120 && d.length >= 120) ? new $t(c && d) : o
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

                            function Ir(e, n, t) {
                                var r = null == (e = Pi(e, n = So(n, e))) ? e : e[Mi(Xi(n))];
                                return null == r ? o : Ln(r, e, t)
                            }

                            function Tr(e) {
                                return tu(e) && _r(e) == y
                            }

                            function Rr(e, n, t, r, i) {
                                return e === n || (null == e || null == n || !tu(e) && !tu(n) ? e != e && n != n : function(e, n, t, r, i, a) {
                                    var u = Ha(e),
                                        c = Ha(n),
                                        l = u ? b : gi(e),
                                        s = c ? b : gi(n),
                                        f = (l = l == y ? k : l) == k,
                                        d = (s = s == y ? k : s) == k,
                                        p = l == s;
                                    if (p && $a(e)) {
                                        if (!$a(n)) return !1;
                                        u = !0, f = !1
                                    }
                                    if (p && !f) return a || (a = new Yt), u || su(e) ? ri(e, n, t, r, i, a) : function(e, n, t, r, o, i, a) {
                                        switch (t) {
                                            case N:
                                                if (e.byteLength != n.byteLength || e.byteOffset != n.byteOffset) return !1;
                                                e = e.buffer, n = n.buffer;
                                            case U:
                                                return !(e.byteLength != n.byteLength || !i(new He(e), new He(n)));
                                            case w:
                                            case S:
                                            case _:
                                                return Fa(+e, +n);
                                            case E:
                                                return e.name == n.name && e.message == n.message;
                                            case P:
                                            case I:
                                                return e == n + "";
                                            case C:
                                                var u = lt;
                                            case O:
                                                var c = 1 & r;
                                                if (u || (u = dt), e.size != n.size && !c) return !1;
                                                var l = a.get(e);
                                                if (l) return l == n;
                                                r |= 2, a.set(e, n);
                                                var s = ri(u(e), u(n), r, o, i, a);
                                                return a.delete(e), s;
                                            case T:
                                                if (zt) return zt.call(e) == zt.call(n)
                                        }
                                        return !1
                                    }(e, n, l, t, r, i, a);
                                    if (!(1 & t)) {
                                        var h = f && De.call(e, "__wrapped__"),
                                            v = d && De.call(n, "__wrapped__");
                                        if (h || v) {
                                            var g = h ? e.value() : e,
                                                m = v ? n.value() : n;
                                            return a || (a = new Yt), i(g, m, t, r, a)
                                        }
                                    }
                                    if (!p) return !1;
                                    return a || (a = new Yt),
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
                                                if (!(u ? p in n : De.call(n, p))) return !1
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
                                                var S = e.constructor,
                                                    E = n.constructor;
                                                S == E || !("constructor" in e) || !("constructor" in n) || "function" == typeof S && S instanceof S && "function" == typeof E && E instanceof E || (g = !1)
                                            }
                                            return a.delete(e), a.delete(n), g
                                        }(e, n, t, r, i, a)
                                }(e, n, t, r, Rr, i))
                            }

                            function Ur(e, n, t, r) {
                                var i = t.length,
                                    a = i,
                                    u = !r;
                                if (null == e) return !a;
                                for (e = ke(e); i--;) {
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
                                        var d = new Yt;
                                        if (r) var p = r(s, f, l, e, n, d);
                                        if (!(p === o ? Rr(f, s, 3, r, d) : p)) return !1
                                    }
                                }
                                return !0
                            }

                            function Nr(e) {
                                return !(!nu(e) || (n = e, Me && Me in n)) && (Za(e) ? We : ye).test(zi(e));
                                var n
                            }

                            function Dr(e) {
                                return "function" == typeof e ? e : null == e ? oc : "object" == typeof e ? Ha(e) ? Wr(e[0], e[1]) : Fr(e) : pc(e)
                            }

                            function jr(e) {
                                if (!Ci(e)) return $n(e);
                                var n = [];
                                for (var t in ke(e)) De.call(e, t) && "constructor" != t && n.push(t);
                                return n
                            }

                            function Mr(e) {
                                if (!nu(e)) return function(e) {
                                    var n = [];
                                    if (null != e)
                                        for (var t in ke(e)) n.push(t);
                                    return n
                                }(e);
                                var n = Ci(e),
                                    t = [];
                                for (var r in e)("constructor" != r || !n && De.call(e, r)) && t.push(r);
                                return t
                            }

                            function zr(e, n) {
                                return e < n
                            }

                            function Br(e, n) {
                                var t = -1,
                                    o = Ka(e) ? r(e.length) : [];
                                return pr(e, (function(e, r, i) {
                                    o[++t] = n(e, r, i)
                                })), o
                            }

                            function Fr(e) {
                                var n = di(e);
                                return 1 == n.length && n[0][2] ? ki(n[0][0], n[0][1]) : function(t) {
                                    return t === e || Ur(t, e, n)
                                }
                            }

                            function Wr(e, n) {
                                return Ei(e) && _i(n) ? ki(Mi(e), n) : function(t) {
                                    var r = ku(t, e);
                                    return r === o && r === n ? Lu(t, e) : Rr(n, r, 3)
                                }
                            }

                            function Vr(e, n, t, r, i) {
                                e !== n && br(n, (function(a, u) {
                                    if (i || (i = new Yt), nu(a)) ! function(e, n, t, r, i, a, u) {
                                        var c = Oi(e, t),
                                            l = Oi(n, t),
                                            s = u.get(l);
                                        if (s) return void nr(e, t, s);
                                        var f = a ? a(c, l, t + "", e, n, u) : o,
                                            d = f === o;
                                        if (d) {
                                            var p = Ha(l),
                                                h = !p && $a(l),
                                                v = !p && !h && su(l);
                                            f = l, p || h || v ? Ha(c) ? f = c : Qa(c) ? f = Io(c) : h ? (d = !1, f = Co(l, !0)) : v ? (d = !1, f = ko(l, !0)) : f = [] : iu(l) || qa(l) ? (f = c, qa(c) ? f = yu(c) : nu(c) && !Za(c) || (f = yi(l))) : d = !1
                                        }
                                        d && (u.set(l, f), i(f, l, r, a, u), u.delete(l));
                                        nr(e, t, f)
                                    }(e, n, u, t, Vr, r, i);
                                    else {
                                        var c = r ? r(Oi(e, u), a, u + "", e, n, i) : o;
                                        c === o && (c = a), nr(e, u, c)
                                    }
                                }), Ru)
                            }

                            function qr(e, n) {
                                var t = e.length;
                                if (t) return wi(n += n < 0 ? t : 0, t) ? e[n] : o
                            }

                            function Hr(e, n, t) {
                                n = n.length ? Dn(n, (function(e) {
                                    return Ha(e) ? function(n) {
                                        return xr(n, 1 === e.length ? e[0] : e)
                                    } : e
                                })) : [oc];
                                var r = -1;
                                n = Dn(n, et(si()));
                                var o = Br(e, (function(e, t, o) {
                                    var i = Dn(n, (function(n) {
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
                                            var c = Lo(o[r], i[r]);
                                            if (c) return r >= u ? c : c * ("desc" == t[r] ? -1 : 1)
                                        }
                                        return e.index - n.index
                                    }(e, n, t)
                                }))
                            }

                            function Gr(e, n, t) {
                                for (var r = -1, o = n.length, i = {}; ++r < o;) {
                                    var a = n[r],
                                        u = xr(e, a);
                                    t(u, a) && eo(i, So(a, e), u)
                                }
                                return i
                            }

                            function Kr(e, n, t, r) {
                                var o = r ? Hn : qn,
                                    i = -1,
                                    a = n.length,
                                    u = e;
                                for (e === n && (n = Io(n)), t && (u = Dn(e, et(t))); ++i < a;)
                                    for (var c = 0, l = n[i], s = t ? t(l) : l;
                                        (c = o(u, s, c, r)) > -1;) u !== e && Ye.call(u, c, 1), Ye.call(e, c, 1);
                                return e
                            }

                            function Qr(e, n) {
                                for (var t = e ? n.length : 0, r = t - 1; t--;) {
                                    var o = n[t];
                                    if (t == r || o !== i) {
                                        var i = o;
                                        wi(o) ? Ye.call(e, o, 1) : po(e, o)
                                    }
                                }
                                return e
                            }

                            function $r(e, n) {
                                return e + mn(At() * (n - e + 1))
                            }

                            function Yr(e, n) {
                                var t = "";
                                if (!e || n < 1 || n > h) return t;
                                do {
                                    n % 2 && (t += e), (n = mn(n / 2)) && (e += e)
                                } while (n);
                                return t
                            }

                            function Xr(e, n) {
                                return Ri(Li(e, n, oc), e + "")
                            }

                            function Zr(e) {
                                return Zt(Fu(e))
                            }

                            function Jr(e, n) {
                                var t = Fu(e);
                                return Di(t, cr(n, 0, t.length))
                            }

                            function eo(e, n, t, r) {
                                if (!nu(e)) return e;
                                for (var i = -1, a = (n = So(n, e)).length, u = a - 1, c = e; null != c && ++i < a;) {
                                    var l = Mi(n[i]),
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
                            var no = It ? function(e, n) {
                                    return It.set(e, n), e
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
                                return Di(Fu(e))
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
                                    if (!t || !Fa(u, c)) {
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
                                if (Ha(e)) return Dn(e, so) + "";
                                if (lu(e)) return Bt ? Bt.call(e) : "";
                                var n = e + "";
                                return "0" == n && 1 / e == -1 / 0 ? "-0" : n
                            }

                            function fo(e, n, t) {
                                var r = -1,
                                    o = Un,
                                    i = e.length,
                                    a = !0,
                                    u = [],
                                    c = u;
                                if (t) a = !1, o = Nn;
                                else if (i >= 200) {
                                    var l = n ? null : Xo(e);
                                    if (l) return dt(l);
                                    a = !1, o = tt, c = new $t
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
                                return null == (e = Pi(e, n = So(n, e))) || delete e[Mi(Xi(n))]
                            }

                            function ho(e, n, t, r) {
                                return eo(e, n, t(xr(e, n)), r)
                            }

                            function vo(e, n, t, r) {
                                for (var o = e.length, i = r ? o : -1;
                                    (r ? i-- : ++i < o) && n(e[i], i, e););
                                return t ? oo(e, r ? 0 : i, r ? i + 1 : o) : oo(e, r ? i + 1 : 0, r ? o : i)
                            }

                            function go(e, n) {
                                var t = e;
                                return t instanceof Ht && (t = t.value()), Mn(n, (function(e, n) {
                                    return n.func.apply(n.thisArg, jn([e], n.args))
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
                                return Qa(e) ? e : []
                            }

                            function wo(e) {
                                return "function" == typeof e ? e : oc
                            }

                            function So(e, n) {
                                return Ha(e) ? e : Ei(e, n) ? [e] : ji(bu(e))
                            }
                            var Eo = Xr;

                            function Ao(e, n, t) {
                                var r = e.length;
                                return t = t === o ? r : t, !n && t >= r ? e : oo(e, n, t)
                            }
                            var xo = on || function(e) {
                                return gn.clearTimeout(e)
                            };

                            function Co(e, n) {
                                if (n) return e.slice();
                                var t = e.length,
                                    r = Ge ? Ge(t) : new e.constructor(t);
                                return e.copy(r), r
                            }

                            function _o(e) {
                                var n = new e.constructor(e.byteLength);
                                return new He(n).set(new He(e)), n
                            }

                            function ko(e, n) {
                                var t = n ? _o(e.buffer) : e.buffer;
                                return new e.constructor(t, e.byteOffset, e.length)
                            }

                            function Lo(e, n) {
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

                            function Oo(e, n, t, o) {
                                for (var i = -1, a = e.length, u = -1, c = t.length, l = -1, s = n.length, f = bt(a - c, 0), d = r(f + s), p = !o; ++i < f;) d[i] = e[i];
                                for (var h = i; ++l < s;) d[h + l] = n[l];
                                for (; ++u < c;)(p || i < a) && (d[h + t[u]] = e[i++]);
                                return d
                            }

                            function Io(e, n) {
                                var t = -1,
                                    o = e.length;
                                for (n || (n = r(o)); ++t < o;) n[t] = e[t];
                                return n
                            }

                            function To(e, n, t, r) {
                                var i = !t;
                                t || (t = {});
                                for (var a = -1, u = n.length; ++a < u;) {
                                    var c = n[a],
                                        l = r ? r(t[c], e[c], c, t, e) : o;
                                    l === o && (l = e[c]), i ? ar(t, c, l) : tr(t, c, l)
                                }
                                return t
                            }

                            function Ro(e, n) {
                                return function(t, r) {
                                    var o = Ha(t) ? Pn : or,
                                        i = n ? n() : {};
                                    return o(t, e, si(r, 2), i)
                                }
                            }

                            function Uo(e) {
                                return Xr((function(n, t) {
                                    var r = -1,
                                        i = t.length,
                                        a = i > 1 ? t[i - 1] : o,
                                        u = i > 2 ? t[2] : o;
                                    for (a = e.length > 3 && "function" == typeof a ? (i--, a) : o, u && Si(t[0], t[1], u) && (a = i < 3 ? o : a, i = 1), n = ke(n); ++r < i;) {
                                        var c = t[r];
                                        c && e(n, c, r, a)
                                    }
                                    return n
                                }))
                            }

                            function No(e, n) {
                                return function(t, r) {
                                    if (null == t) return t;
                                    if (!Ka(t)) return e(t, r);
                                    for (var o = t.length, i = n ? o : -1, a = ke(t);
                                        (n ? i-- : ++i < o) && !1 !== r(a[i], i, a););
                                    return t
                                }
                            }

                            function Do(e) {
                                return function(n, t, r) {
                                    for (var o = -1, i = ke(n), a = r(n), u = a.length; u--;) {
                                        var c = a[e ? u : ++o];
                                        if (!1 === t(i[c], c, i)) break
                                    }
                                    return n
                                }
                            }

                            function jo(e) {
                                return function(n) {
                                    var t = ct(n = bu(n)) ? vt(n) : o,
                                        r = t ? t[0] : n.charAt(0),
                                        i = t ? Ao(t, 1).join("") : n.slice(1);
                                    return r[e]() + i
                                }
                            }

                            function Mo(e) {
                                return function(n) {
                                    return Mn(Zu(qu(n).replace(en, "")), e, "")
                                }
                            }

                            function zo(e) {
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
                                    var i = ke(n);
                                    if (!Ka(n)) {
                                        var a = si(t, 3);
                                        n = Tu(n), t = function(e) {
                                            return a(i[e], e, i)
                                        }
                                    }
                                    var u = e(n, t, r);
                                    return u > -1 ? i[a ? n[u] : u] : o
                                }
                            }

                            function Fo(e) {
                                return oi((function(n) {
                                    var t = n.length,
                                        r = t,
                                        a = qt.prototype.thru;
                                    for (e && n.reverse(); r--;) {
                                        var u = n[r];
                                        if ("function" != typeof u) throw new Oe(i);
                                        if (a && !c && "wrapper" == ci(u)) var c = new qt([], !0)
                                    }
                                    for (r = c ? r : t; ++r < t;) {
                                        var l = ci(u = n[r]),
                                            s = "wrapper" == l ? ui(u) : o;
                                        c = s && Ai(s[0]) && 424 == s[1] && !s[4].length && 1 == s[9] ? c[ci(s[0])].apply(c, s[3]) : 1 == u.length && Ai(u) ? c[l]() : c.thru(u)
                                    }
                                    return function() {
                                        var e = arguments,
                                            r = e[0];
                                        if (c && 1 == e.length && Ha(r)) return c.plant(r).value();
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
                                    y = v ? o : zo(e);
                                return function f() {
                                    for (var b = arguments.length, w = r(b), S = b; S--;) w[S] = arguments[S];
                                    if (g) var E = li(f),
                                        A = function(e, n) {
                                            for (var t = e.length, r = 0; t--;) e[t] === n && ++r;
                                            return r
                                        }(w, E);
                                    if (i && (w = Po(w, i, a, g)), u && (w = Oo(w, u, c, g)), b -= A, g && b < d) {
                                        var x = ft(w, E);
                                        return $o(e, n, Wo, f.placeholder, t, w, x, l, s, d - b)
                                    }
                                    var C = h ? t : this,
                                        _ = v ? C[e] : e;
                                    return b = w.length, l ? w = function(e, n) {
                                        var t = e.length,
                                            r = wt(n.length, t),
                                            i = Io(e);
                                        for (; r--;) {
                                            var a = n[r];
                                            e[r] = wi(a, t) ? i[a] : o
                                        }
                                        return e
                                    }(w, l) : m && b > 1 && w.reverse(), p && s < b && (w.length = s), this && this !== gn && this instanceof f && (_ = y || zo(_)), _.apply(C, w)
                                }
                            }

                            function Vo(e, n) {
                                return function(t, r) {
                                    return function(e, n, t, r) {
                                        return Sr(e, (function(e, o, i) {
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

                            function Ho(e) {
                                return oi((function(n) {
                                    return n = Dn(n, et(si())), Xr((function(t) {
                                        var r = this;
                                        return e(n, (function(e) {
                                            return Ln(e, r, t)
                                        }))
                                    }))
                                }))
                            }

                            function Go(e, n) {
                                var t = (n = n === o ? " " : so(n)).length;
                                if (t < 2) return t ? Yr(n, e) : n;
                                var r = Yr(n, vn(e / ht(n)));
                                return ct(n) ? Ao(vt(r), 0, e).join("") : r.slice(0, e)
                            }

                            function Ko(e) {
                                return function(n, t, i) {
                                    return i && "number" != typeof i && Si(n, t, i) && (t = i = o), n = hu(n), t === o ? (t = n, n = 0) : t = hu(t),
                                        function(e, n, t, o) {
                                            for (var i = -1, a = bt(vn((n - e) / (t || 1)), 0), u = r(a); a--;) u[o ? a : ++i] = e, e += t;
                                            return u
                                        }(n, t, i = i === o ? n < t ? 1 : -1 : hu(i), e)
                                }
                            }

                            function Qo(e) {
                                return function(n, t) {
                                    return "string" == typeof n && "string" == typeof t || (n = mu(n), t = mu(t)), e(n, t)
                                }
                            }

                            function $o(e, n, t, r, i, a, u, c, f, d) {
                                var p = 8 & n;
                                n |= p ? l : s, 4 & (n &= ~(p ? s : l)) || (n &= -4);
                                var h = [e, n, i, p ? a : o, p ? u : o, p ? o : a, p ? o : u, c, f, d],
                                    v = t.apply(o, h);
                                return Ai(e) && Ii(v, h), v.placeholder = r, Ui(v, e, n)
                            }

                            function Yo(e) {
                                var n = _e[e];
                                return function(e, t) {
                                    if (e = mu(e), (t = null == t ? 0 : wt(vu(t), 292)) && Sn(e)) {
                                        var r = (bu(e) + "e").split("e");
                                        return +((r = (bu(n(r[0] + "e" + (+r[1] + t))) + "e").split("e"))[0] + "e" + (+r[1] - t))
                                    }
                                    return n(e)
                                }
                            }
                            var Xo = Lt && 1 / dt(new Lt([, -0]))[1] == p ? function(e) {
                                return new Lt(e)
                            } : lc;

                            function Zo(e) {
                                return function(n) {
                                    var t = gi(n);
                                    return t == C ? lt(n) : t == O ? pt(n) : function(e, n) {
                                        return Dn(n, (function(n) {
                                            return [n, e[n]]
                                        }))
                                    }(n, e(n))
                                }
                            }

                            function Jo(e, n, t, a, p, h, v, g) {
                                var m = 2 & n;
                                if (!m && "function" != typeof e) throw new Oe(i);
                                var y = a ? a.length : 0;
                                if (y || (n &= -97, a = p = o), v = v === o ? v : bt(vu(v), 0), g = g === o ? g : vu(g), y -= p ? p.length : 0, n & s) {
                                    var b = a,
                                        w = p;
                                    a = p = o
                                }
                                var S = m ? o : ui(e),
                                    E = [e, n, t, a, p, b, w, h, v, g];
                                if (S && function(e, n) {
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
                                        }(c = n[5]) && (l = e[5], e[5] = l ? Oo(l, c, n[6]) : c, e[6] = l ? ft(e[5], u) : n[6]);
                                        (c = n[7]) && (e[7] = c);
                                        r & f && (e[8] = null == e[8] ? n[8] : wt(e[8], n[8]));
                                        null == e[9] && (e[9] = n[9]);
                                        e[0] = n[0], e[1] = o
                                    }(E, S), e = E[0], n = E[1], t = E[2], a = E[3], p = E[4], !(g = E[9] = E[9] === o ? m ? 0 : e.length : bt(E[9] - y, 0)) && 24 & n && (n &= -25), n && 1 != n) A = 8 == n || n == c ? function(e, n, t) {
                                    var i = zo(e);
                                    return function a() {
                                        for (var u = arguments.length, c = r(u), l = u, s = li(a); l--;) c[l] = arguments[l];
                                        var f = u < 3 && c[0] !== s && c[u - 1] !== s ? [] : ft(c, s);
                                        return (u -= f.length) < t ? $o(e, n, Wo, a.placeholder, o, c, f, o, o, t - u) : Ln(this && this !== gn && this instanceof a ? i : e, this, c)
                                    }
                                }(e, n, g) : n != l && 33 != n || p.length ? Wo.apply(o, E) : function(e, n, t, o) {
                                    var i = 1 & n,
                                        a = zo(e);
                                    return function n() {
                                        for (var u = -1, c = arguments.length, l = -1, s = o.length, f = r(s + c), d = this && this !== gn && this instanceof n ? a : e; ++l < s;) f[l] = o[l];
                                        for (; c--;) f[l++] = arguments[++u];
                                        return Ln(d, i ? t : this, f)
                                    }
                                }(e, n, t, a);
                                else var A = function(e, n, t) {
                                    var r = 1 & n,
                                        o = zo(e);
                                    return function n() {
                                        return (this && this !== gn && this instanceof n ? o : e).apply(r ? t : this, arguments)
                                    }
                                }(e, n, t);
                                return Ui((S ? no : Ii)(A, E), e, n)
                            }

                            function ei(e, n, t, r) {
                                return e === o || Fa(e, Re[t]) && !De.call(r, t) ? n : e
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
                                    h = 2 & t ? new $t : o;
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
                                return Ri(Li(e, o, Gi), e + "")
                            }

                            function ii(e) {
                                return Cr(e, Tu, hi)
                            }

                            function ai(e) {
                                return Cr(e, Ru, vi)
                            }
                            var ui = It ? function(e) {
                                return It.get(e)
                            } : lc;

                            function ci(e) {
                                for (var n = e.name + "", t = Tt[n], r = De.call(Tt, n) ? t.length : 0; r--;) {
                                    var o = t[r],
                                        i = o.func;
                                    if (null == i || i == e) return o.name
                                }
                                return n
                            }

                            function li(e) {
                                return (De.call(Ft, "placeholder") ? Ft : e).placeholder
                            }

                            function si() {
                                var e = Ft.iteratee || ic;
                                return e = e === ic ? Dr : e, arguments.length ? e(arguments[0], arguments[1]) : e
                            }

                            function fi(e, n) {
                                var t, r, o = e.__data__;
                                return ("string" == (r = typeof(t = n)) || "number" == r || "symbol" == r || "boolean" == r ? "__proto__" !== t : null === t) ? o["string" == typeof n ? "string" : "hash"] : o.map
                            }

                            function di(e) {
                                for (var n = Tu(e), t = n.length; t--;) {
                                    var r = n[t],
                                        o = e[r];
                                    n[t] = [r, o, _i(o)]
                                }
                                return n
                            }

                            function pi(e, n) {
                                var t = function(e, n) {
                                    return null == e ? o : e[n]
                                }(e, n);
                                return Nr(t) ? t : o
                            }
                            var hi = yn ? function(e) {
                                    return null == e ? [] : (e = ke(e), Rn(yn(e), (function(n) {
                                        return $e.call(e, n)
                                    })))
                                } : gc,
                                vi = yn ? function(e) {
                                    for (var n = []; e;) jn(n, hi(e)), e = Ke(e);
                                    return n
                                } : gc,
                                gi = _r;

                            function mi(e, n, t) {
                                for (var r = -1, o = (n = So(n, e)).length, i = !1; ++r < o;) {
                                    var a = Mi(n[r]);
                                    if (!(i = null != e && t(e, a))) break;
                                    e = e[a]
                                }
                                return i || ++r != o ? i : !!(o = null == e ? 0 : e.length) && eu(o) && wi(a, o) && (Ha(e) || qa(e))
                            }

                            function yi(e) {
                                return "function" != typeof e.constructor || Ci(e) ? {} : Wt(Ke(e))
                            }

                            function bi(e) {
                                return Ha(e) || qa(e) || !!(Xe && e && e[Xe])
                            }

                            function wi(e, n) {
                                var t = typeof e;
                                return !!(n = null == n ? h : n) && ("number" == t || "symbol" != t && we.test(e)) && e > -1 && e % 1 == 0 && e < n
                            }

                            function Si(e, n, t) {
                                if (!nu(t)) return !1;
                                var r = typeof n;
                                return !!("number" == r ? Ka(t) && wi(n, t.length) : "string" == r && n in t) && Fa(t[n], e)
                            }

                            function Ei(e, n) {
                                if (Ha(e)) return !1;
                                var t = typeof e;
                                return !("number" != t && "symbol" != t && "boolean" != t && null != e && !lu(e)) || (te.test(e) || !ne.test(e) || null != n && e in ke(n))
                            }

                            function Ai(e) {
                                var n = ci(e),
                                    t = Ft[n];
                                if ("function" != typeof t || !(n in Ht.prototype)) return !1;
                                if (e === t) return !0;
                                var r = ui(t);
                                return !!r && e === r[0]
                            }(Ct && gi(new Ct(new ArrayBuffer(1))) != N || _t && gi(new _t) != C || kt && gi(kt.resolve()) != L || Lt && gi(new Lt) != O || Pt && gi(new Pt) != R) && (gi = function(e) {
                                var n = _r(e),
                                    t = n == k ? e.constructor : o,
                                    r = t ? zi(t) : "";
                                if (r) switch (r) {
                                    case Rt:
                                        return N;
                                    case Ut:
                                        return C;
                                    case Nt:
                                        return L;
                                    case Dt:
                                        return O;
                                    case jt:
                                        return R
                                }
                                return n
                            });
                            var xi = Ue ? Za : mc;

                            function Ci(e) {
                                var n = e && e.constructor;
                                return e === ("function" == typeof n && n.prototype || Re)
                            }

                            function _i(e) {
                                return e == e && !nu(e)
                            }

                            function ki(e, n) {
                                return function(t) {
                                    return null != t && (t[e] === n && (n !== o || e in ke(t)))
                                }
                            }

                            function Li(e, n, t) {
                                return n = bt(n === o ? e.length - 1 : n, 0),
                                    function() {
                                        for (var o = arguments, i = -1, a = bt(o.length - n, 0), u = r(a); ++i < a;) u[i] = o[n + i];
                                        i = -1;
                                        for (var c = r(n + 1); ++i < n;) c[i] = o[i];
                                        return c[n] = t(u), Ln(e, this, c)
                                    }
                            }

                            function Pi(e, n) {
                                return n.length < 2 ? e : xr(e, oo(n, 0, -1))
                            }

                            function Oi(e, n) {
                                if (("constructor" !== n || "function" != typeof e[n]) && "__proto__" != n) return e[n]
                            }
                            var Ii = Ni(no),
                                Ti = hn || function(e, n) {
                                    return gn.setTimeout(e, n)
                                },
                                Ri = Ni(to);

                            function Ui(e, n, t) {
                                var r = n + "";
                                return Ri(e, function(e, n) {
                                    var t = n.length;
                                    if (!t) return e;
                                    var r = t - 1;
                                    return n[r] = (t > 1 ? "& " : "") + n[r], n = n.join(t > 2 ? ", " : " "), e.replace(ce, "{\n/* [wrapped with " + n + "] */\n")
                                }(r, function(e, n) {
                                    return On(m, (function(t) {
                                        var r = "_." + t[0];
                                        n & t[1] && !Un(e, r) && e.push(r)
                                    })), e.sort()
                                }(function(e) {
                                    var n = e.match(le);
                                    return n ? n[1].split(se) : []
                                }(r), t)))
                            }

                            function Ni(e) {
                                var n = 0,
                                    t = 0;
                                return function() {
                                    var r = St(),
                                        i = 16 - (r - t);
                                    if (t = r, i > 0) {
                                        if (++n >= 800) return arguments[0]
                                    } else n = 0;
                                    return e.apply(o, arguments)
                                }
                            }

                            function Di(e, n) {
                                var t = -1,
                                    r = e.length,
                                    i = r - 1;
                                for (n = n === o ? r : n; ++t < n;) {
                                    var a = $r(t, i),
                                        u = e[a];
                                    e[a] = e[t], e[t] = u
                                }
                                return e.length = n, e
                            }
                            var ji = function(e) {
                                var n = Na(e, (function(e) {
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

                            function Mi(e) {
                                if ("string" == typeof e || lu(e)) return e;
                                var n = e + "";
                                return "0" == n && 1 / e == -1 / 0 ? "-0" : n
                            }

                            function zi(e) {
                                if (null != e) {
                                    try {
                                        return Ne.call(e)
                                    } catch (e) {}
                                    try {
                                        return e + ""
                                    } catch (e) {}
                                }
                                return ""
                            }

                            function Bi(e) {
                                if (e instanceof Ht) return e.clone();
                                var n = new qt(e.__wrapped__, e.__chain__);
                                return n.__actions__ = Io(e.__actions__), n.__index__ = e.__index__, n.__values__ = e.__values__, n
                            }
                            var Fi = Xr((function(e, n) {
                                    return Qa(e) ? dr(e, yr(n, 1, Qa, !0)) : []
                                })),
                                Wi = Xr((function(e, n) {
                                    var t = Xi(n);
                                    return Qa(t) && (t = o), Qa(e) ? dr(e, yr(n, 1, Qa, !0), si(t, 2)) : []
                                })),
                                Vi = Xr((function(e, n) {
                                    var t = Xi(n);
                                    return Qa(t) && (t = o), Qa(e) ? dr(e, yr(n, 1, Qa, !0), o, t) : []
                                }));

                            function qi(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                if (!r) return -1;
                                var o = null == t ? 0 : vu(t);
                                return o < 0 && (o = bt(r + o, 0)), Vn(e, si(n, 3), o)
                            }

                            function Hi(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                if (!r) return -1;
                                var i = r - 1;
                                return t !== o && (i = vu(t), i = t < 0 ? bt(r + i, 0) : wt(i, r - 1)), Vn(e, si(n, 3), i, !0)
                            }

                            function Gi(e) {
                                return (null == e ? 0 : e.length) ? yr(e, 1) : []
                            }

                            function Ki(e) {
                                return e && e.length ? e[0] : o
                            }
                            var Qi = Xr((function(e) {
                                    var n = Dn(e, bo);
                                    return n.length && n[0] === e[0] ? Or(n) : []
                                })),
                                $i = Xr((function(e) {
                                    var n = Xi(e),
                                        t = Dn(e, bo);
                                    return n === Xi(t) ? n = o : t.pop(), t.length && t[0] === e[0] ? Or(t, si(n, 2)) : []
                                })),
                                Yi = Xr((function(e) {
                                    var n = Xi(e),
                                        t = Dn(e, bo);
                                    return (n = "function" == typeof n ? n : o) && t.pop(), t.length && t[0] === e[0] ? Or(t, o, n) : []
                                }));

                            function Xi(e) {
                                var n = null == e ? 0 : e.length;
                                return n ? e[n - 1] : o
                            }
                            var Zi = Xr(Ji);

                            function Ji(e, n) {
                                return e && e.length && n && n.length ? Kr(e, n) : e
                            }
                            var ea = oi((function(e, n) {
                                var t = null == e ? 0 : e.length,
                                    r = ur(e, n);
                                return Qr(e, Dn(n, (function(e) {
                                    return wi(e, t) ? +e : e
                                })).sort(Lo)), r
                            }));

                            function na(e) {
                                return null == e ? e : xt.call(e)
                            }
                            var ta = Xr((function(e) {
                                    return fo(yr(e, 1, Qa, !0))
                                })),
                                ra = Xr((function(e) {
                                    var n = Xi(e);
                                    return Qa(n) && (n = o), fo(yr(e, 1, Qa, !0), si(n, 2))
                                })),
                                oa = Xr((function(e) {
                                    var n = Xi(e);
                                    return n = "function" == typeof n ? n : o, fo(yr(e, 1, Qa, !0), o, n)
                                }));

                            function ia(e) {
                                if (!e || !e.length) return [];
                                var n = 0;
                                return e = Rn(e, (function(e) {
                                    if (Qa(e)) return n = bt(e.length, n), !0
                                })), Zn(n, (function(n) {
                                    return Dn(e, Qn(n))
                                }))
                            }

                            function aa(e, n) {
                                if (!e || !e.length) return [];
                                var t = ia(e);
                                return null == n ? t : Dn(t, (function(e) {
                                    return Ln(n, o, e)
                                }))
                            }
                            var ua = Xr((function(e, n) {
                                    return Qa(e) ? dr(e, n) : []
                                })),
                                ca = Xr((function(e) {
                                    return mo(Rn(e, Qa))
                                })),
                                la = Xr((function(e) {
                                    var n = Xi(e);
                                    return Qa(n) && (n = o), mo(Rn(e, Qa), si(n, 2))
                                })),
                                sa = Xr((function(e) {
                                    var n = Xi(e);
                                    return n = "function" == typeof n ? n : o, mo(Rn(e, Qa), o, n)
                                })),
                                fa = Xr(ia);
                            var da = Xr((function(e) {
                                var n = e.length,
                                    t = n > 1 ? e[n - 1] : o;
                                return t = "function" == typeof t ? (e.pop(), t) : o, aa(e, t)
                            }));

                            function pa(e) {
                                var n = Ft(e);
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
                                return !(n > 1 || this.__actions__.length) && r instanceof Ht && wi(t) ? ((r = r.slice(t, +t + (n ? 1 : 0))).__actions__.push({
                                    func: ha,
                                    args: [i],
                                    thisArg: o
                                }), new qt(r, this.__chain__).thru((function(e) {
                                    return n && !e.length && e.push(o), e
                                }))) : this.thru(i)
                            }));
                            var ga = Ro((function(e, n, t) {
                                De.call(e, t) ? ++e[t] : ar(e, t, 1)
                            }));
                            var ma = Bo(qi),
                                ya = Bo(Hi);

                            function ba(e, n) {
                                return (Ha(e) ? On : pr)(e, si(n, 3))
                            }

                            function wa(e, n) {
                                return (Ha(e) ? In : hr)(e, si(n, 3))
                            }
                            var Sa = Ro((function(e, n, t) {
                                De.call(e, t) ? e[t].push(n) : ar(e, t, [n])
                            }));
                            var Ea = Xr((function(e, n, t) {
                                    var o = -1,
                                        i = "function" == typeof n,
                                        a = Ka(e) ? r(e.length) : [];
                                    return pr(e, (function(e) {
                                        a[++o] = i ? Ln(n, e, t) : Ir(e, n, t)
                                    })), a
                                })),
                                Aa = Ro((function(e, n, t) {
                                    ar(e, t, n)
                                }));

                            function xa(e, n) {
                                return (Ha(e) ? Dn : Br)(e, si(n, 3))
                            }
                            var Ca = Ro((function(e, n, t) {
                                e[t ? 0 : 1].push(n)
                            }), (function() {
                                return [
                                    [],
                                    []
                                ]
                            }));
                            var _a = Xr((function(e, n) {
                                    if (null == e) return [];
                                    var t = n.length;
                                    return t > 1 && Si(e, n[0], n[1]) ? n = [] : t > 2 && Si(n[0], n[1], n[2]) && (n = [n[0]]), Hr(e, yr(n, 1), [])
                                })),
                                ka = fn || function() {
                                    return gn.Date.now()
                                };

                            function La(e, n, t) {
                                return n = t ? o : n, n = e && null == n ? e.length : n, Jo(e, f, o, o, o, o, n)
                            }

                            function Pa(e, n) {
                                var t;
                                if ("function" != typeof n) throw new Oe(i);
                                return e = vu(e),
                                    function() {
                                        return --e > 0 && (t = n.apply(this, arguments)), e <= 1 && (n = o), t
                                    }
                            }
                            var Oa = Xr((function(e, n, t) {
                                    var r = 1;
                                    if (t.length) {
                                        var o = ft(t, li(Oa));
                                        r |= l
                                    }
                                    return Jo(e, r, n, t, o)
                                })),
                                Ia = Xr((function(e, n, t) {
                                    var r = 3;
                                    if (t.length) {
                                        var o = ft(t, li(Ia));
                                        r |= l
                                    }
                                    return Jo(n, r, e, t, o)
                                }));

                            function Ta(e, n, t) {
                                var r, a, u, c, l, s, f = 0,
                                    d = !1,
                                    p = !1,
                                    h = !0;
                                if ("function" != typeof e) throw new Oe(i);

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
                                    var e = ka();
                                    if (g(e)) return y(e);
                                    l = Ti(m, function(e) {
                                        var t = n - (e - s);
                                        return p ? wt(t, u - (e - f)) : t
                                    }(e))
                                }

                                function y(e) {
                                    return l = o, h && r ? v(e) : (r = a = o, c)
                                }

                                function b() {
                                    var e = ka(),
                                        t = g(e);
                                    if (r = arguments, a = this, s = e, t) {
                                        if (l === o) return function(e) {
                                            return f = e, l = Ti(m, n), d ? v(e) : c
                                        }(s);
                                        if (p) return xo(l), l = Ti(m, n), v(s)
                                    }
                                    return l === o && (l = Ti(m, n)), c
                                }
                                return n = mu(n) || 0, nu(t) && (d = !!t.leading, u = (p = "maxWait" in t) ? bt(mu(t.maxWait) || 0, n) : u, h = "trailing" in t ? !!t.trailing : h), b.cancel = function() {
                                    l !== o && xo(l), f = 0, r = s = a = l = o
                                }, b.flush = function() {
                                    return l === o ? c : y(ka())
                                }, b
                            }
                            var Ra = Xr((function(e, n) {
                                    return fr(e, 1, n)
                                })),
                                Ua = Xr((function(e, n, t) {
                                    return fr(e, mu(n) || 0, t)
                                }));

                            function Na(e, n) {
                                if ("function" != typeof e || null != n && "function" != typeof n) throw new Oe(i);
                                var t = function() {
                                    var r = arguments,
                                        o = n ? n.apply(this, r) : r[0],
                                        i = t.cache;
                                    if (i.has(o)) return i.get(o);
                                    var a = e.apply(this, r);
                                    return t.cache = i.set(o, a) || i, a
                                };
                                return t.cache = new(Na.Cache || Qt), t
                            }

                            function Da(e) {
                                if ("function" != typeof e) throw new Oe(i);
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
                            Na.Cache = Qt;
                            var ja = Eo((function(e, n) {
                                    var t = (n = 1 == n.length && Ha(n[0]) ? Dn(n[0], et(si())) : Dn(yr(n, 1), et(si()))).length;
                                    return Xr((function(r) {
                                        for (var o = -1, i = wt(r.length, t); ++o < i;) r[o] = n[o].call(this, r[o]);
                                        return Ln(e, this, r)
                                    }))
                                })),
                                Ma = Xr((function(e, n) {
                                    var t = ft(n, li(Ma));
                                    return Jo(e, l, o, n, t)
                                })),
                                za = Xr((function(e, n) {
                                    var t = ft(n, li(za));
                                    return Jo(e, s, o, n, t)
                                })),
                                Ba = oi((function(e, n) {
                                    return Jo(e, d, o, o, o, n)
                                }));

                            function Fa(e, n) {
                                return e === n || e != e && n != n
                            }
                            var Wa = Qo(kr),
                                Va = Qo((function(e, n) {
                                    return e >= n
                                })),
                                qa = Tr(function() {
                                    return arguments
                                }()) ? Tr : function(e) {
                                    return tu(e) && De.call(e, "callee") && !$e.call(e, "callee")
                                },
                                Ha = r.isArray,
                                Ga = En ? et(En) : function(e) {
                                    return tu(e) && _r(e) == U
                                };

                            function Ka(e) {
                                return null != e && eu(e.length) && !Za(e)
                            }

                            function Qa(e) {
                                return tu(e) && Ka(e)
                            }
                            var $a = wn || mc,
                                Ya = An ? et(An) : function(e) {
                                    return tu(e) && _r(e) == S
                                };

                            function Xa(e) {
                                if (!tu(e)) return !1;
                                var n = _r(e);
                                return n == E || "[object DOMException]" == n || "string" == typeof e.message && "string" == typeof e.name && !iu(e)
                            }

                            function Za(e) {
                                if (!nu(e)) return !1;
                                var n = _r(e);
                                return n == A || n == x || "[object AsyncFunction]" == n || "[object Proxy]" == n
                            }

                            function Ja(e) {
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
                            var ru = xn ? et(xn) : function(e) {
                                return tu(e) && gi(e) == C
                            };

                            function ou(e) {
                                return "number" == typeof e || tu(e) && _r(e) == _
                            }

                            function iu(e) {
                                if (!tu(e) || _r(e) != k) return !1;
                                var n = Ke(e);
                                if (null === n) return !0;
                                var t = De.call(n, "constructor") && n.constructor;
                                return "function" == typeof t && t instanceof t && Ne.call(t) == Be
                            }
                            var au = Cn ? et(Cn) : function(e) {
                                return tu(e) && _r(e) == P
                            };
                            var uu = _n ? et(_n) : function(e) {
                                return tu(e) && gi(e) == O
                            };

                            function cu(e) {
                                return "string" == typeof e || !Ha(e) && tu(e) && _r(e) == I
                            }

                            function lu(e) {
                                return "symbol" == typeof e || tu(e) && _r(e) == T
                            }
                            var su = kn ? et(kn) : function(e) {
                                return tu(e) && eu(e.length) && !!ln[_r(e)]
                            };
                            var fu = Qo(zr),
                                du = Qo((function(e, n) {
                                    return e <= n
                                }));

                            function pu(e) {
                                if (!e) return [];
                                if (Ka(e)) return cu(e) ? vt(e) : Io(e);
                                if (Ze && e[Ze]) return function(e) {
                                    for (var n, t = []; !(n = e.next()).done;) t.push(n.value);
                                    return t
                                }(e[Ze]());
                                var n = gi(e);
                                return (n == C ? lt : n == O ? dt : Fu)(e)
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
                                e = Jn(e);
                                var t = me.test(e);
                                return t || be.test(e) ? pn(e.slice(2), t ? 2 : 8) : ge.test(e) ? v : +e
                            }

                            function yu(e) {
                                return To(e, Ru(e))
                            }

                            function bu(e) {
                                return null == e ? "" : so(e)
                            }
                            var wu = Uo((function(e, n) {
                                    if (Ci(n) || Ka(n)) To(n, Tu(n), e);
                                    else
                                        for (var t in n) De.call(n, t) && tr(e, t, n[t])
                                })),
                                Su = Uo((function(e, n) {
                                    To(n, Ru(n), e)
                                })),
                                Eu = Uo((function(e, n, t, r) {
                                    To(n, Ru(n), e, r)
                                })),
                                Au = Uo((function(e, n, t, r) {
                                    To(n, Tu(n), e, r)
                                })),
                                xu = oi(ur);
                            var Cu = Xr((function(e, n) {
                                    e = ke(e);
                                    var t = -1,
                                        r = n.length,
                                        i = r > 2 ? n[2] : o;
                                    for (i && Si(n[0], n[1], i) && (r = 1); ++t < r;)
                                        for (var a = n[t], u = Ru(a), c = -1, l = u.length; ++c < l;) {
                                            var s = u[c],
                                                f = e[s];
                                            (f === o || Fa(f, Re[s]) && !De.call(e, s)) && (e[s] = a[s])
                                        }
                                    return e
                                })),
                                _u = Xr((function(e) {
                                    return e.push(o, ni), Ln(Nu, o, e)
                                }));

                            function ku(e, n, t) {
                                var r = null == e ? o : xr(e, n);
                                return r === o ? t : r
                            }

                            function Lu(e, n) {
                                return null != e && mi(e, n, Pr)
                            }
                            var Pu = Vo((function(e, n, t) {
                                    null != n && "function" != typeof n.toString && (n = ze.call(n)), e[n] = t
                                }), nc(oc)),
                                Ou = Vo((function(e, n, t) {
                                    null != n && "function" != typeof n.toString && (n = ze.call(n)), De.call(e, n) ? e[n].push(t) : e[n] = [t]
                                }), si),
                                Iu = Xr(Ir);

                            function Tu(e) {
                                return Ka(e) ? Xt(e) : jr(e)
                            }

                            function Ru(e) {
                                return Ka(e) ? Xt(e, !0) : Mr(e)
                            }
                            var Uu = Uo((function(e, n, t) {
                                    Vr(e, n, t)
                                })),
                                Nu = Uo((function(e, n, t, r) {
                                    Vr(e, n, t, r)
                                })),
                                Du = oi((function(e, n) {
                                    var t = {};
                                    if (null == e) return t;
                                    var r = !1;
                                    n = Dn(n, (function(n) {
                                        return n = So(n, e), r || (r = n.length > 1), n
                                    })), To(e, ai(e), t), r && (t = lr(t, 7, ti));
                                    for (var o = n.length; o--;) po(t, n[o]);
                                    return t
                                }));
                            var ju = oi((function(e, n) {
                                return null == e ? {} : function(e, n) {
                                    return Gr(e, n, (function(n, t) {
                                        return Lu(e, t)
                                    }))
                                }(e, n)
                            }));

                            function Mu(e, n) {
                                if (null == e) return {};
                                var t = Dn(ai(e), (function(e) {
                                    return [e]
                                }));
                                return n = si(n), Gr(e, t, (function(e, t) {
                                    return n(e, t[0])
                                }))
                            }
                            var zu = Zo(Tu),
                                Bu = Zo(Ru);

                            function Fu(e) {
                                return null == e ? [] : nt(e, Tu(e))
                            }
                            var Wu = Mo((function(e, n, t) {
                                return n = n.toLowerCase(), e + (t ? Vu(n) : n)
                            }));

                            function Vu(e) {
                                return Xu(bu(e).toLowerCase())
                            }

                            function qu(e) {
                                return (e = bu(e)) && e.replace(Se, it).replace(nn, "")
                            }
                            var Hu = Mo((function(e, n, t) {
                                    return e + (t ? "-" : "") + n.toLowerCase()
                                })),
                                Gu = Mo((function(e, n, t) {
                                    return e + (t ? " " : "") + n.toLowerCase()
                                })),
                                Ku = jo("toLowerCase");
                            var Qu = Mo((function(e, n, t) {
                                return e + (t ? "_" : "") + n.toLowerCase()
                            }));
                            var $u = Mo((function(e, n, t) {
                                return e + (t ? " " : "") + Xu(n)
                            }));
                            var Yu = Mo((function(e, n, t) {
                                    return e + (t ? " " : "") + n.toUpperCase()
                                })),
                                Xu = jo("toUpperCase");

                            function Zu(e, n, t) {
                                return e = bu(e), (n = t ? o : n) === o ? function(e) {
                                    return an.test(e)
                                }(e) ? function(e) {
                                    return e.match(rn) || []
                                }(e) : function(e) {
                                    return e.match(fe) || []
                                }(e) : e.match(n) || []
                            }
                            var Ju = Xr((function(e, n) {
                                    try {
                                        return Ln(e, o, n)
                                    } catch (e) {
                                        return Xa(e) ? e : new xe(e)
                                    }
                                })),
                                ec = oi((function(e, n) {
                                    return On(n, (function(n) {
                                        n = Mi(n), ar(e, n, Oa(e[n], e))
                                    })), e
                                }));

                            function nc(e) {
                                return function() {
                                    return e
                                }
                            }
                            var tc = Fo(),
                                rc = Fo(!0);

                            function oc(e) {
                                return e
                            }

                            function ic(e) {
                                return Dr("function" == typeof e ? e : lr(e, 1))
                            }
                            var ac = Xr((function(e, n) {
                                    return function(t) {
                                        return Ir(t, e, n)
                                    }
                                })),
                                uc = Xr((function(e, n) {
                                    return function(t) {
                                        return Ir(e, t, n)
                                    }
                                }));

                            function cc(e, n, t) {
                                var r = Tu(n),
                                    o = Ar(n, r);
                                null != t || nu(n) && (o.length || !r.length) || (t = n, n = e, e = this, o = Ar(n, Tu(n)));
                                var i = !(nu(t) && "chain" in t && !t.chain),
                                    a = Za(e);
                                return On(o, (function(t) {
                                    var r = n[t];
                                    e[t] = r, a && (e.prototype[t] = function() {
                                        var n = this.__chain__;
                                        if (i || n) {
                                            var t = e(this.__wrapped__);
                                            return (t.__actions__ = Io(this.__actions__)).push({
                                                func: r,
                                                args: arguments,
                                                thisArg: e
                                            }), t.__chain__ = n, t
                                        }
                                        return r.apply(e, jn([this.value()], arguments))
                                    })
                                })), e
                            }

                            function lc() {}
                            var sc = Ho(Dn),
                                fc = Ho(Tn),
                                dc = Ho(Bn);

                            function pc(e) {
                                return Ei(e) ? Qn(Mi(e)) : function(e) {
                                    return function(n) {
                                        return xr(n, e)
                                    }
                                }(e)
                            }
                            var hc = Ko(),
                                vc = Ko(!0);

                            function gc() {
                                return []
                            }

                            function mc() {
                                return !1
                            }
                            var yc = qo((function(e, n) {
                                    return e + n
                                }), 0),
                                bc = Yo("ceil"),
                                wc = qo((function(e, n) {
                                    return e / n
                                }), 1),
                                Sc = Yo("floor");
                            var Ec, Ac = qo((function(e, n) {
                                    return e * n
                                }), 1),
                                xc = Yo("round"),
                                Cc = qo((function(e, n) {
                                    return e - n
                                }), 0);
                            return Ft.after = function(e, n) {
                                if ("function" != typeof n) throw new Oe(i);
                                return e = vu(e),
                                    function() {
                                        if (--e < 1) return n.apply(this, arguments)
                                    }
                            }, Ft.ary = La, Ft.assign = wu, Ft.assignIn = Su, Ft.assignInWith = Eu, Ft.assignWith = Au, Ft.at = xu, Ft.before = Pa, Ft.bind = Oa, Ft.bindAll = ec, Ft.bindKey = Ia, Ft.castArray = function() {
                                if (!arguments.length) return [];
                                var e = arguments[0];
                                return Ha(e) ? e : [e]
                            }, Ft.chain = pa, Ft.chunk = function(e, n, t) {
                                n = (t ? Si(e, n, t) : n === o) ? 1 : bt(vu(n), 0);
                                var i = null == e ? 0 : e.length;
                                if (!i || n < 1) return [];
                                for (var a = 0, u = 0, c = r(vn(i / n)); a < i;) c[u++] = oo(e, a, a += n);
                                return c
                            }, Ft.compact = function(e) {
                                for (var n = -1, t = null == e ? 0 : e.length, r = 0, o = []; ++n < t;) {
                                    var i = e[n];
                                    i && (o[r++] = i)
                                }
                                return o
                            }, Ft.concat = function() {
                                var e = arguments.length;
                                if (!e) return [];
                                for (var n = r(e - 1), t = arguments[0], o = e; o--;) n[o - 1] = arguments[o];
                                return jn(Ha(t) ? Io(t) : [t], yr(n, 1))
                            }, Ft.cond = function(e) {
                                var n = null == e ? 0 : e.length,
                                    t = si();
                                return e = n ? Dn(e, (function(e) {
                                    if ("function" != typeof e[1]) throw new Oe(i);
                                    return [t(e[0]), e[1]]
                                })) : [], Xr((function(t) {
                                    for (var r = -1; ++r < n;) {
                                        var o = e[r];
                                        if (Ln(o[0], this, t)) return Ln(o[1], this, t)
                                    }
                                }))
                            }, Ft.conforms = function(e) {
                                return function(e) {
                                    var n = Tu(e);
                                    return function(t) {
                                        return sr(t, e, n)
                                    }
                                }(lr(e, 1))
                            }, Ft.constant = nc, Ft.countBy = ga, Ft.create = function(e, n) {
                                var t = Wt(e);
                                return null == n ? t : ir(t, n)
                            }, Ft.curry = function e(n, t, r) {
                                var i = Jo(n, 8, o, o, o, o, o, t = r ? o : t);
                                return i.placeholder = e.placeholder, i
                            }, Ft.curryRight = function e(n, t, r) {
                                var i = Jo(n, c, o, o, o, o, o, t = r ? o : t);
                                return i.placeholder = e.placeholder, i
                            }, Ft.debounce = Ta, Ft.defaults = Cu, Ft.defaultsDeep = _u, Ft.defer = Ra, Ft.delay = Ua, Ft.difference = Fi, Ft.differenceBy = Wi, Ft.differenceWith = Vi, Ft.drop = function(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                return r ? oo(e, (n = t || n === o ? 1 : vu(n)) < 0 ? 0 : n, r) : []
                            }, Ft.dropRight = function(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                return r ? oo(e, 0, (n = r - (n = t || n === o ? 1 : vu(n))) < 0 ? 0 : n) : []
                            }, Ft.dropRightWhile = function(e, n) {
                                return e && e.length ? vo(e, si(n, 3), !0, !0) : []
                            }, Ft.dropWhile = function(e, n) {
                                return e && e.length ? vo(e, si(n, 3), !0) : []
                            }, Ft.fill = function(e, n, t, r) {
                                var i = null == e ? 0 : e.length;
                                return i ? (t && "number" != typeof t && Si(e, n, t) && (t = 0, r = i), function(e, n, t, r) {
                                    var i = e.length;
                                    for ((t = vu(t)) < 0 && (t = -t > i ? 0 : i + t), (r = r === o || r > i ? i : vu(r)) < 0 && (r += i), r = t > r ? 0 : gu(r); t < r;) e[t++] = n;
                                    return e
                                }(e, n, t, r)) : []
                            }, Ft.filter = function(e, n) {
                                return (Ha(e) ? Rn : mr)(e, si(n, 3))
                            }, Ft.flatMap = function(e, n) {
                                return yr(xa(e, n), 1)
                            }, Ft.flatMapDeep = function(e, n) {
                                return yr(xa(e, n), p)
                            }, Ft.flatMapDepth = function(e, n, t) {
                                return t = t === o ? 1 : vu(t), yr(xa(e, n), t)
                            }, Ft.flatten = Gi, Ft.flattenDeep = function(e) {
                                return (null == e ? 0 : e.length) ? yr(e, p) : []
                            }, Ft.flattenDepth = function(e, n) {
                                return (null == e ? 0 : e.length) ? yr(e, n = n === o ? 1 : vu(n)) : []
                            }, Ft.flip = function(e) {
                                return Jo(e, 512)
                            }, Ft.flow = tc, Ft.flowRight = rc, Ft.fromPairs = function(e) {
                                for (var n = -1, t = null == e ? 0 : e.length, r = {}; ++n < t;) {
                                    var o = e[n];
                                    r[o[0]] = o[1]
                                }
                                return r
                            }, Ft.functions = function(e) {
                                return null == e ? [] : Ar(e, Tu(e))
                            }, Ft.functionsIn = function(e) {
                                return null == e ? [] : Ar(e, Ru(e))
                            }, Ft.groupBy = Sa, Ft.initial = function(e) {
                                return (null == e ? 0 : e.length) ? oo(e, 0, -1) : []
                            }, Ft.intersection = Qi, Ft.intersectionBy = $i, Ft.intersectionWith = Yi, Ft.invert = Pu, Ft.invertBy = Ou, Ft.invokeMap = Ea, Ft.iteratee = ic, Ft.keyBy = Aa, Ft.keys = Tu, Ft.keysIn = Ru, Ft.map = xa, Ft.mapKeys = function(e, n) {
                                var t = {};
                                return n = si(n, 3), Sr(e, (function(e, r, o) {
                                    ar(t, n(e, r, o), e)
                                })), t
                            }, Ft.mapValues = function(e, n) {
                                var t = {};
                                return n = si(n, 3), Sr(e, (function(e, r, o) {
                                    ar(t, r, n(e, r, o))
                                })), t
                            }, Ft.matches = function(e) {
                                return Fr(lr(e, 1))
                            }, Ft.matchesProperty = function(e, n) {
                                return Wr(e, lr(n, 1))
                            }, Ft.memoize = Na, Ft.merge = Uu, Ft.mergeWith = Nu, Ft.method = ac, Ft.methodOf = uc, Ft.mixin = cc, Ft.negate = Da, Ft.nthArg = function(e) {
                                return e = vu(e), Xr((function(n) {
                                    return qr(n, e)
                                }))
                            }, Ft.omit = Du, Ft.omitBy = function(e, n) {
                                return Mu(e, Da(si(n)))
                            }, Ft.once = function(e) {
                                return Pa(2, e)
                            }, Ft.orderBy = function(e, n, t, r) {
                                return null == e ? [] : (Ha(n) || (n = null == n ? [] : [n]), Ha(t = r ? o : t) || (t = null == t ? [] : [t]), Hr(e, n, t))
                            }, Ft.over = sc, Ft.overArgs = ja, Ft.overEvery = fc, Ft.overSome = dc, Ft.partial = Ma, Ft.partialRight = za, Ft.partition = Ca, Ft.pick = ju, Ft.pickBy = Mu, Ft.property = pc, Ft.propertyOf = function(e) {
                                return function(n) {
                                    return null == e ? o : xr(e, n)
                                }
                            }, Ft.pull = Zi, Ft.pullAll = Ji, Ft.pullAllBy = function(e, n, t) {
                                return e && e.length && n && n.length ? Kr(e, n, si(t, 2)) : e
                            }, Ft.pullAllWith = function(e, n, t) {
                                return e && e.length && n && n.length ? Kr(e, n, o, t) : e
                            }, Ft.pullAt = ea, Ft.range = hc, Ft.rangeRight = vc, Ft.rearg = Ba, Ft.reject = function(e, n) {
                                return (Ha(e) ? Rn : mr)(e, Da(si(n, 3)))
                            }, Ft.remove = function(e, n) {
                                var t = [];
                                if (!e || !e.length) return t;
                                var r = -1,
                                    o = [],
                                    i = e.length;
                                for (n = si(n, 3); ++r < i;) {
                                    var a = e[r];
                                    n(a, r, e) && (t.push(a), o.push(r))
                                }
                                return Qr(e, o), t
                            }, Ft.rest = function(e, n) {
                                if ("function" != typeof e) throw new Oe(i);
                                return Xr(e, n = n === o ? n : vu(n))
                            }, Ft.reverse = na, Ft.sampleSize = function(e, n, t) {
                                return n = (t ? Si(e, n, t) : n === o) ? 1 : vu(n), (Ha(e) ? Jt : Jr)(e, n)
                            }, Ft.set = function(e, n, t) {
                                return null == e ? e : eo(e, n, t)
                            }, Ft.setWith = function(e, n, t, r) {
                                return r = "function" == typeof r ? r : o, null == e ? e : eo(e, n, t, r)
                            }, Ft.shuffle = function(e) {
                                return (Ha(e) ? er : ro)(e)
                            }, Ft.slice = function(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                return r ? (t && "number" != typeof t && Si(e, n, t) ? (n = 0, t = r) : (n = null == n ? 0 : vu(n), t = t === o ? r : vu(t)), oo(e, n, t)) : []
                            }, Ft.sortBy = _a, Ft.sortedUniq = function(e) {
                                return e && e.length ? co(e) : []
                            }, Ft.sortedUniqBy = function(e, n) {
                                return e && e.length ? co(e, si(n, 2)) : []
                            }, Ft.split = function(e, n, t) {
                                return t && "number" != typeof t && Si(e, n, t) && (n = t = o), (t = t === o ? g : t >>> 0) ? (e = bu(e)) && ("string" == typeof n || null != n && !au(n)) && !(n = so(n)) && ct(e) ? Ao(vt(e), 0, t) : e.split(n, t) : []
                            }, Ft.spread = function(e, n) {
                                if ("function" != typeof e) throw new Oe(i);
                                return n = null == n ? 0 : bt(vu(n), 0), Xr((function(t) {
                                    var r = t[n],
                                        o = Ao(t, 0, n);
                                    return r && jn(o, r), Ln(e, this, o)
                                }))
                            }, Ft.tail = function(e) {
                                var n = null == e ? 0 : e.length;
                                return n ? oo(e, 1, n) : []
                            }, Ft.take = function(e, n, t) {
                                return e && e.length ? oo(e, 0, (n = t || n === o ? 1 : vu(n)) < 0 ? 0 : n) : []
                            }, Ft.takeRight = function(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                return r ? oo(e, (n = r - (n = t || n === o ? 1 : vu(n))) < 0 ? 0 : n, r) : []
                            }, Ft.takeRightWhile = function(e, n) {
                                return e && e.length ? vo(e, si(n, 3), !1, !0) : []
                            }, Ft.takeWhile = function(e, n) {
                                return e && e.length ? vo(e, si(n, 3)) : []
                            }, Ft.tap = function(e, n) {
                                return n(e), e
                            }, Ft.throttle = function(e, n, t) {
                                var r = !0,
                                    o = !0;
                                if ("function" != typeof e) throw new Oe(i);
                                return nu(t) && (r = "leading" in t ? !!t.leading : r, o = "trailing" in t ? !!t.trailing : o), Ta(e, n, {
                                    leading: r,
                                    maxWait: n,
                                    trailing: o
                                })
                            }, Ft.thru = ha, Ft.toArray = pu, Ft.toPairs = zu, Ft.toPairsIn = Bu, Ft.toPath = function(e) {
                                return Ha(e) ? Dn(e, Mi) : lu(e) ? [e] : Io(ji(bu(e)))
                            }, Ft.toPlainObject = yu, Ft.transform = function(e, n, t) {
                                var r = Ha(e),
                                    o = r || $a(e) || su(e);
                                if (n = si(n, 4), null == t) {
                                    var i = e && e.constructor;
                                    t = o ? r ? new i : [] : nu(e) && Za(i) ? Wt(Ke(e)) : {}
                                }
                                return (o ? On : Sr)(e, (function(e, r, o) {
                                    return n(t, e, r, o)
                                })), t
                            }, Ft.unary = function(e) {
                                return La(e, 1)
                            }, Ft.union = ta, Ft.unionBy = ra, Ft.unionWith = oa, Ft.uniq = function(e) {
                                return e && e.length ? fo(e) : []
                            }, Ft.uniqBy = function(e, n) {
                                return e && e.length ? fo(e, si(n, 2)) : []
                            }, Ft.uniqWith = function(e, n) {
                                return n = "function" == typeof n ? n : o, e && e.length ? fo(e, o, n) : []
                            }, Ft.unset = function(e, n) {
                                return null == e || po(e, n)
                            }, Ft.unzip = ia, Ft.unzipWith = aa, Ft.update = function(e, n, t) {
                                return null == e ? e : ho(e, n, wo(t))
                            }, Ft.updateWith = function(e, n, t, r) {
                                return r = "function" == typeof r ? r : o, null == e ? e : ho(e, n, wo(t), r)
                            }, Ft.values = Fu, Ft.valuesIn = function(e) {
                                return null == e ? [] : nt(e, Ru(e))
                            }, Ft.without = ua, Ft.words = Zu, Ft.wrap = function(e, n) {
                                return Ma(wo(n), e)
                            }, Ft.xor = ca, Ft.xorBy = la, Ft.xorWith = sa, Ft.zip = fa, Ft.zipObject = function(e, n) {
                                return yo(e || [], n || [], tr)
                            }, Ft.zipObjectDeep = function(e, n) {
                                return yo(e || [], n || [], eo)
                            }, Ft.zipWith = da, Ft.entries = zu, Ft.entriesIn = Bu, Ft.extend = Su, Ft.extendWith = Eu, cc(Ft, Ft), Ft.add = yc, Ft.attempt = Ju, Ft.camelCase = Wu, Ft.capitalize = Vu, Ft.ceil = bc, Ft.clamp = function(e, n, t) {
                                return t === o && (t = n, n = o), t !== o && (t = (t = mu(t)) == t ? t : 0), n !== o && (n = (n = mu(n)) == n ? n : 0), cr(mu(e), n, t)
                            }, Ft.clone = function(e) {
                                return lr(e, 4)
                            }, Ft.cloneDeep = function(e) {
                                return lr(e, 5)
                            }, Ft.cloneDeepWith = function(e, n) {
                                return lr(e, 5, n = "function" == typeof n ? n : o)
                            }, Ft.cloneWith = function(e, n) {
                                return lr(e, 4, n = "function" == typeof n ? n : o)
                            }, Ft.conformsTo = function(e, n) {
                                return null == n || sr(e, n, Tu(n))
                            }, Ft.deburr = qu, Ft.defaultTo = function(e, n) {
                                return null == e || e != e ? n : e
                            }, Ft.divide = wc, Ft.endsWith = function(e, n, t) {
                                e = bu(e), n = so(n);
                                var r = e.length,
                                    i = t = t === o ? r : cr(vu(t), 0, r);
                                return (t -= n.length) >= 0 && e.slice(t, i) == n
                            }, Ft.eq = Fa, Ft.escape = function(e) {
                                return (e = bu(e)) && X.test(e) ? e.replace($, at) : e
                            }, Ft.escapeRegExp = function(e) {
                                return (e = bu(e)) && ie.test(e) ? e.replace(oe, "\\$&") : e
                            }, Ft.every = function(e, n, t) {
                                var r = Ha(e) ? Tn : vr;
                                return t && Si(e, n, t) && (n = o), r(e, si(n, 3))
                            }, Ft.find = ma, Ft.findIndex = qi, Ft.findKey = function(e, n) {
                                return Wn(e, si(n, 3), Sr)
                            }, Ft.findLast = ya, Ft.findLastIndex = Hi, Ft.findLastKey = function(e, n) {
                                return Wn(e, si(n, 3), Er)
                            }, Ft.floor = Sc, Ft.forEach = ba, Ft.forEachRight = wa, Ft.forIn = function(e, n) {
                                return null == e ? e : br(e, si(n, 3), Ru)
                            }, Ft.forInRight = function(e, n) {
                                return null == e ? e : wr(e, si(n, 3), Ru)
                            }, Ft.forOwn = function(e, n) {
                                return e && Sr(e, si(n, 3))
                            }, Ft.forOwnRight = function(e, n) {
                                return e && Er(e, si(n, 3))
                            }, Ft.get = ku, Ft.gt = Wa, Ft.gte = Va, Ft.has = function(e, n) {
                                return null != e && mi(e, n, Lr)
                            }, Ft.hasIn = Lu, Ft.head = Ki, Ft.identity = oc, Ft.includes = function(e, n, t, r) {
                                e = Ka(e) ? e : Fu(e), t = t && !r ? vu(t) : 0;
                                var o = e.length;
                                return t < 0 && (t = bt(o + t, 0)), cu(e) ? t <= o && e.indexOf(n, t) > -1 : !!o && qn(e, n, t) > -1
                            }, Ft.indexOf = function(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                if (!r) return -1;
                                var o = null == t ? 0 : vu(t);
                                return o < 0 && (o = bt(r + o, 0)), qn(e, n, o)
                            }, Ft.inRange = function(e, n, t) {
                                return n = hu(n), t === o ? (t = n, n = 0) : t = hu(t),
                                    function(e, n, t) {
                                        return e >= wt(n, t) && e < bt(n, t)
                                    }(e = mu(e), n, t)
                            }, Ft.invoke = Iu, Ft.isArguments = qa, Ft.isArray = Ha, Ft.isArrayBuffer = Ga, Ft.isArrayLike = Ka, Ft.isArrayLikeObject = Qa, Ft.isBoolean = function(e) {
                                return !0 === e || !1 === e || tu(e) && _r(e) == w
                            }, Ft.isBuffer = $a, Ft.isDate = Ya, Ft.isElement = function(e) {
                                return tu(e) && 1 === e.nodeType && !iu(e)
                            }, Ft.isEmpty = function(e) {
                                if (null == e) return !0;
                                if (Ka(e) && (Ha(e) || "string" == typeof e || "function" == typeof e.splice || $a(e) || su(e) || qa(e))) return !e.length;
                                var n = gi(e);
                                if (n == C || n == O) return !e.size;
                                if (Ci(e)) return !jr(e).length;
                                for (var t in e)
                                    if (De.call(e, t)) return !1;
                                return !0
                            }, Ft.isEqual = function(e, n) {
                                return Rr(e, n)
                            }, Ft.isEqualWith = function(e, n, t) {
                                var r = (t = "function" == typeof t ? t : o) ? t(e, n) : o;
                                return r === o ? Rr(e, n, o, t) : !!r
                            }, Ft.isError = Xa, Ft.isFinite = function(e) {
                                return "number" == typeof e && Sn(e)
                            }, Ft.isFunction = Za, Ft.isInteger = Ja, Ft.isLength = eu, Ft.isMap = ru, Ft.isMatch = function(e, n) {
                                return e === n || Ur(e, n, di(n))
                            }, Ft.isMatchWith = function(e, n, t) {
                                return t = "function" == typeof t ? t : o, Ur(e, n, di(n), t)
                            }, Ft.isNaN = function(e) {
                                return ou(e) && e != +e
                            }, Ft.isNative = function(e) {
                                if (xi(e)) throw new xe("Unsupported core-js use. Try https://npms.io/search?q=ponyfill.");
                                return Nr(e)
                            }, Ft.isNil = function(e) {
                                return null == e
                            }, Ft.isNull = function(e) {
                                return null === e
                            }, Ft.isNumber = ou, Ft.isObject = nu, Ft.isObjectLike = tu, Ft.isPlainObject = iu, Ft.isRegExp = au, Ft.isSafeInteger = function(e) {
                                return Ja(e) && e >= -9007199254740991 && e <= h
                            }, Ft.isSet = uu, Ft.isString = cu, Ft.isSymbol = lu, Ft.isTypedArray = su, Ft.isUndefined = function(e) {
                                return e === o
                            }, Ft.isWeakMap = function(e) {
                                return tu(e) && gi(e) == R
                            }, Ft.isWeakSet = function(e) {
                                return tu(e) && "[object WeakSet]" == _r(e)
                            }, Ft.join = function(e, n) {
                                return null == e ? "" : Fn.call(e, n)
                            }, Ft.kebabCase = Hu, Ft.last = Xi, Ft.lastIndexOf = function(e, n, t) {
                                var r = null == e ? 0 : e.length;
                                if (!r) return -1;
                                var i = r;
                                return t !== o && (i = (i = vu(t)) < 0 ? bt(r + i, 0) : wt(i, r - 1)), n == n ? function(e, n, t) {
                                    for (var r = t + 1; r--;)
                                        if (e[r] === n) return r;
                                    return r
                                }(e, n, i) : Vn(e, Gn, i, !0)
                            }, Ft.lowerCase = Gu, Ft.lowerFirst = Ku, Ft.lt = fu, Ft.lte = du, Ft.max = function(e) {
                                return e && e.length ? gr(e, oc, kr) : o
                            }, Ft.maxBy = function(e, n) {
                                return e && e.length ? gr(e, si(n, 2), kr) : o
                            }, Ft.mean = function(e) {
                                return Kn(e, oc)
                            }, Ft.meanBy = function(e, n) {
                                return Kn(e, si(n, 2))
                            }, Ft.min = function(e) {
                                return e && e.length ? gr(e, oc, zr) : o
                            }, Ft.minBy = function(e, n) {
                                return e && e.length ? gr(e, si(n, 2), zr) : o
                            }, Ft.stubArray = gc, Ft.stubFalse = mc, Ft.stubObject = function() {
                                return {}
                            }, Ft.stubString = function() {
                                return ""
                            }, Ft.stubTrue = function() {
                                return !0
                            }, Ft.multiply = Ac, Ft.nth = function(e, n) {
                                return e && e.length ? qr(e, vu(n)) : o
                            }, Ft.noConflict = function() {
                                return gn._ === this && (gn._ = Fe), this
                            }, Ft.noop = lc, Ft.now = ka, Ft.pad = function(e, n, t) {
                                e = bu(e);
                                var r = (n = vu(n)) ? ht(e) : 0;
                                if (!n || r >= n) return e;
                                var o = (n - r) / 2;
                                return Go(mn(o), t) + e + Go(vn(o), t)
                            }, Ft.padEnd = function(e, n, t) {
                                e = bu(e);
                                var r = (n = vu(n)) ? ht(e) : 0;
                                return n && r < n ? e + Go(n - r, t) : e
                            }, Ft.padStart = function(e, n, t) {
                                e = bu(e);
                                var r = (n = vu(n)) ? ht(e) : 0;
                                return n && r < n ? Go(n - r, t) + e : e
                            }, Ft.parseInt = function(e, n, t) {
                                return t || null == n ? n = 0 : n && (n = +n), Et(bu(e).replace(ae, ""), n || 0)
                            }, Ft.random = function(e, n, t) {
                                if (t && "boolean" != typeof t && Si(e, n, t) && (n = t = o), t === o && ("boolean" == typeof n ? (t = n, n = o) : "boolean" == typeof e && (t = e, e = o)), e === o && n === o ? (e = 0, n = 1) : (e = hu(e), n === o ? (n = e, e = 0) : n = hu(n)), e > n) {
                                    var r = e;
                                    e = n, n = r
                                }
                                if (t || e % 1 || n % 1) {
                                    var i = At();
                                    return wt(e + i * (n - e + dn("1e-" + ((i + "").length - 1))), n)
                                }
                                return $r(e, n)
                            }, Ft.reduce = function(e, n, t) {
                                var r = Ha(e) ? Mn : Yn,
                                    o = arguments.length < 3;
                                return r(e, si(n, 4), t, o, pr)
                            }, Ft.reduceRight = function(e, n, t) {
                                var r = Ha(e) ? zn : Yn,
                                    o = arguments.length < 3;
                                return r(e, si(n, 4), t, o, hr)
                            }, Ft.repeat = function(e, n, t) {
                                return n = (t ? Si(e, n, t) : n === o) ? 1 : vu(n), Yr(bu(e), n)
                            }, Ft.replace = function() {
                                var e = arguments,
                                    n = bu(e[0]);
                                return e.length < 3 ? n : n.replace(e[1], e[2])
                            }, Ft.result = function(e, n, t) {
                                var r = -1,
                                    i = (n = So(n, e)).length;
                                for (i || (i = 1, e = o); ++r < i;) {
                                    var a = null == e ? o : e[Mi(n[r])];
                                    a === o && (r = i, a = t), e = Za(a) ? a.call(e) : a
                                }
                                return e
                            }, Ft.round = xc, Ft.runInContext = e, Ft.sample = function(e) {
                                return (Ha(e) ? Zt : Zr)(e)
                            }, Ft.size = function(e) {
                                if (null == e) return 0;
                                if (Ka(e)) return cu(e) ? ht(e) : e.length;
                                var n = gi(e);
                                return n == C || n == O ? e.size : jr(e).length
                            }, Ft.snakeCase = Qu, Ft.some = function(e, n, t) {
                                var r = Ha(e) ? Bn : io;
                                return t && Si(e, n, t) && (n = o), r(e, si(n, 3))
                            }, Ft.sortedIndex = function(e, n) {
                                return ao(e, n)
                            }, Ft.sortedIndexBy = function(e, n, t) {
                                return uo(e, n, si(t, 2))
                            }, Ft.sortedIndexOf = function(e, n) {
                                var t = null == e ? 0 : e.length;
                                if (t) {
                                    var r = ao(e, n);
                                    if (r < t && Fa(e[r], n)) return r
                                }
                                return -1
                            }, Ft.sortedLastIndex = function(e, n) {
                                return ao(e, n, !0)
                            }, Ft.sortedLastIndexBy = function(e, n, t) {
                                return uo(e, n, si(t, 2), !0)
                            }, Ft.sortedLastIndexOf = function(e, n) {
                                if (null == e ? 0 : e.length) {
                                    var t = ao(e, n, !0) - 1;
                                    if (Fa(e[t], n)) return t
                                }
                                return -1
                            }, Ft.startCase = $u, Ft.startsWith = function(e, n, t) {
                                return e = bu(e), t = null == t ? 0 : cr(vu(t), 0, e.length), n = so(n), e.slice(t, t + n.length) == n
                            }, Ft.subtract = Cc, Ft.sum = function(e) {
                                return e && e.length ? Xn(e, oc) : 0
                            }, Ft.sumBy = function(e, n) {
                                return e && e.length ? Xn(e, si(n, 2)) : 0
                            }, Ft.template = function(e, n, t) {
                                var r = Ft.templateSettings;
                                t && Si(e, n, t) && (n = o), e = bu(e), n = Eu({}, n, r, ei);
                                var i, a, u = Eu({}, n.imports, r.imports, ei),
                                    c = Tu(u),
                                    l = nt(u, c),
                                    s = 0,
                                    f = n.interpolate || Ee,
                                    d = "__p += '",
                                    p = Le((n.escape || Ee).source + "|" + f.source + "|" + (f === ee ? he : Ee).source + "|" + (n.evaluate || Ee).source + "|$", "g"),
                                    h = "//# sourceURL=" + (De.call(n, "sourceURL") ? (n.sourceURL + "").replace(/\s/g, " ") : "lodash.templateSources[" + ++cn + "]") + "\n";
                                e.replace(p, (function(n, t, r, o, u, c) {
                                    return r || (r = o), d += e.slice(s, c).replace(Ae, ut), t && (i = !0, d += "' +\n__e(" + t + ") +\n'"), u && (a = !0, d += "';\n" + u + ";\n__p += '"), r && (d += "' +\n((__t = (" + r + ")) == null ? '' : __t) +\n'"), s = c + n.length, n
                                })), d += "';\n";
                                var v = De.call(n, "variable") && n.variable;
                                if (v) {
                                    if (de.test(v)) throw new xe("Invalid `variable` option passed into `_.template`")
                                } else d = "with (obj) {\n" + d + "\n}\n";
                                d = (a ? d.replace(H, "") : d).replace(G, "$1").replace(K, "$1;"), d = "function(" + (v || "obj") + ") {\n" + (v ? "" : "obj || (obj = {});\n") + "var __t, __p = ''" + (i ? ", __e = _.escape" : "") + (a ? ", __j = Array.prototype.join;\nfunction print() { __p += __j.call(arguments, '') }\n" : ";\n") + d + "return __p\n}";
                                var g = Ju((function() {
                                    return Ce(c, h + "return " + d).apply(o, l)
                                }));
                                if (g.source = d, Xa(g)) throw g;
                                return g
                            }, Ft.times = function(e, n) {
                                if ((e = vu(e)) < 1 || e > h) return [];
                                var t = g,
                                    r = wt(e, g);
                                n = si(n), e -= g;
                                for (var o = Zn(r, n); ++t < e;) n(t);
                                return o
                            }, Ft.toFinite = hu, Ft.toInteger = vu, Ft.toLength = gu, Ft.toLower = function(e) {
                                return bu(e).toLowerCase()
                            }, Ft.toNumber = mu, Ft.toSafeInteger = function(e) {
                                return e ? cr(vu(e), -9007199254740991, h) : 0 === e ? e : 0
                            }, Ft.toString = bu, Ft.toUpper = function(e) {
                                return bu(e).toUpperCase()
                            }, Ft.trim = function(e, n, t) {
                                if ((e = bu(e)) && (t || n === o)) return Jn(e);
                                if (!e || !(n = so(n))) return e;
                                var r = vt(e),
                                    i = vt(n);
                                return Ao(r, rt(r, i), ot(r, i) + 1).join("")
                            }, Ft.trimEnd = function(e, n, t) {
                                if ((e = bu(e)) && (t || n === o)) return e.slice(0, gt(e) + 1);
                                if (!e || !(n = so(n))) return e;
                                var r = vt(e);
                                return Ao(r, 0, ot(r, vt(n)) + 1).join("")
                            }, Ft.trimStart = function(e, n, t) {
                                if ((e = bu(e)) && (t || n === o)) return e.replace(ae, "");
                                if (!e || !(n = so(n))) return e;
                                var r = vt(e);
                                return Ao(r, rt(r, vt(n))).join("")
                            }, Ft.truncate = function(e, n) {
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
                                var l = u ? Ao(u, 0, c).join("") : e.slice(0, c);
                                if (i === o) return l + r;
                                if (u && (c += l.length - c), au(i)) {
                                    if (e.slice(c).search(i)) {
                                        var s, f = l;
                                        for (i.global || (i = Le(i.source, bu(ve.exec(i)) + "g")), i.lastIndex = 0; s = i.exec(f);) var d = s.index;
                                        l = l.slice(0, d === o ? c : d)
                                    }
                                } else if (e.indexOf(so(i), c) != c) {
                                    var p = l.lastIndexOf(i);
                                    p > -1 && (l = l.slice(0, p))
                                }
                                return l + r
                            }, Ft.unescape = function(e) {
                                return (e = bu(e)) && Y.test(e) ? e.replace(Q, mt) : e
                            }, Ft.uniqueId = function(e) {
                                var n = ++je;
                                return bu(e) + n
                            }, Ft.upperCase = Yu, Ft.upperFirst = Xu, Ft.each = ba, Ft.eachRight = wa, Ft.first = Ki, cc(Ft, (Ec = {}, Sr(Ft, (function(e, n) {
                                De.call(Ft.prototype, n) || (Ec[n] = e)
                            })), Ec), {
                                chain: !1
                            }), Ft.VERSION = "4.17.21", On(["bind", "bindKey", "curry", "curryRight", "partial", "partialRight"], (function(e) {
                                Ft[e].placeholder = Ft
                            })), On(["drop", "take"], (function(e, n) {
                                Ht.prototype[e] = function(t) {
                                    t = t === o ? 1 : bt(vu(t), 0);
                                    var r = this.__filtered__ && !n ? new Ht(this) : this.clone();
                                    return r.__filtered__ ? r.__takeCount__ = wt(t, r.__takeCount__) : r.__views__.push({
                                        size: wt(t, g),
                                        type: e + (r.__dir__ < 0 ? "Right" : "")
                                    }), r
                                }, Ht.prototype[e + "Right"] = function(n) {
                                    return this.reverse()[e](n).reverse()
                                }
                            })), On(["filter", "map", "takeWhile"], (function(e, n) {
                                var t = n + 1,
                                    r = 1 == t || 3 == t;
                                Ht.prototype[e] = function(e) {
                                    var n = this.clone();
                                    return n.__iteratees__.push({
                                        iteratee: si(e, 3),
                                        type: t
                                    }), n.__filtered__ = n.__filtered__ || r, n
                                }
                            })), On(["head", "last"], (function(e, n) {
                                var t = "take" + (n ? "Right" : "");
                                Ht.prototype[e] = function() {
                                    return this[t](1).value()[0]
                                }
                            })), On(["initial", "tail"], (function(e, n) {
                                var t = "drop" + (n ? "" : "Right");
                                Ht.prototype[e] = function() {
                                    return this.__filtered__ ? new Ht(this) : this[t](1)
                                }
                            })), Ht.prototype.compact = function() {
                                return this.filter(oc)
                            }, Ht.prototype.find = function(e) {
                                return this.filter(e).head()
                            }, Ht.prototype.findLast = function(e) {
                                return this.reverse().find(e)
                            }, Ht.prototype.invokeMap = Xr((function(e, n) {
                                return "function" == typeof e ? new Ht(this) : this.map((function(t) {
                                    return Ir(t, e, n)
                                }))
                            })), Ht.prototype.reject = function(e) {
                                return this.filter(Da(si(e)))
                            }, Ht.prototype.slice = function(e, n) {
                                e = vu(e);
                                var t = this;
                                return t.__filtered__ && (e > 0 || n < 0) ? new Ht(t) : (e < 0 ? t = t.takeRight(-e) : e && (t = t.drop(e)), n !== o && (t = (n = vu(n)) < 0 ? t.dropRight(-n) : t.take(n - e)), t)
                            }, Ht.prototype.takeRightWhile = function(e) {
                                return this.reverse().takeWhile(e).reverse()
                            }, Ht.prototype.toArray = function() {
                                return this.take(g)
                            }, Sr(Ht.prototype, (function(e, n) {
                                var t = /^(?:filter|find|map|reject)|While$/.test(n),
                                    r = /^(?:head|last)$/.test(n),
                                    i = Ft[r ? "take" + ("last" == n ? "Right" : "") : n],
                                    a = r || /^find/.test(n);
                                i && (Ft.prototype[n] = function() {
                                    var n = this.__wrapped__,
                                        u = r ? [1] : arguments,
                                        c = n instanceof Ht,
                                        l = u[0],
                                        s = c || Ha(n),
                                        f = function(e) {
                                            var n = i.apply(Ft, jn([e], u));
                                            return r && d ? n[0] : n
                                        };
                                    s && t && "function" == typeof l && 1 != l.length && (c = s = !1);
                                    var d = this.__chain__,
                                        p = !!this.__actions__.length,
                                        h = a && !d,
                                        v = c && !p;
                                    if (!a && s) {
                                        n = v ? n : new Ht(this);
                                        var g = e.apply(n, u);
                                        return g.__actions__.push({
                                            func: ha,
                                            args: [f],
                                            thisArg: o
                                        }), new qt(g, d)
                                    }
                                    return h && v ? e.apply(this, u) : (g = this.thru(f), h ? r ? g.value()[0] : g.value() : g)
                                })
                            })), On(["pop", "push", "shift", "sort", "splice", "unshift"], (function(e) {
                                var n = Ie[e],
                                    t = /^(?:push|sort|unshift)$/.test(e) ? "tap" : "thru",
                                    r = /^(?:pop|shift)$/.test(e);
                                Ft.prototype[e] = function() {
                                    var e = arguments;
                                    if (r && !this.__chain__) {
                                        var o = this.value();
                                        return n.apply(Ha(o) ? o : [], e)
                                    }
                                    return this[t]((function(t) {
                                        return n.apply(Ha(t) ? t : [], e)
                                    }))
                                }
                            })), Sr(Ht.prototype, (function(e, n) {
                                var t = Ft[n];
                                if (t) {
                                    var r = t.name + "";
                                    De.call(Tt, r) || (Tt[r] = []), Tt[r].push({
                                        name: n,
                                        func: t
                                    })
                                }
                            })), Tt[Wo(o, 2).name] = [{
                                name: "wrapper",
                                func: o
                            }], Ht.prototype.clone = function() {
                                var e = new Ht(this.__wrapped__);
                                return e.__actions__ = Io(this.__actions__), e.__dir__ = this.__dir__, e.__filtered__ = this.__filtered__, e.__iteratees__ = Io(this.__iteratees__), e.__takeCount__ = this.__takeCount__, e.__views__ = Io(this.__views__), e
                            }, Ht.prototype.reverse = function() {
                                if (this.__filtered__) {
                                    var e = new Ht(this);
                                    e.__dir__ = -1, e.__filtered__ = !0
                                } else(e = this.clone()).__dir__ *= -1;
                                return e
                            }, Ht.prototype.value = function() {
                                var e = this.__wrapped__.value(),
                                    n = this.__dir__,
                                    t = Ha(e),
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
                            }, Ft.prototype.at = va, Ft.prototype.chain = function() {
                                return pa(this)
                            }, Ft.prototype.commit = function() {
                                return new qt(this.value(), this.__chain__)
                            }, Ft.prototype.next = function() {
                                this.__values__ === o && (this.__values__ = pu(this.value()));
                                var e = this.__index__ >= this.__values__.length;
                                return {
                                    done: e,
                                    value: e ? o : this.__values__[this.__index__++]
                                }
                            }, Ft.prototype.plant = function(e) {
                                for (var n, t = this; t instanceof Vt;) {
                                    var r = Bi(t);
                                    r.__index__ = 0, r.__values__ = o, n ? i.__wrapped__ = r : n = r;
                                    var i = r;
                                    t = t.__wrapped__
                                }
                                return i.__wrapped__ = e, n
                            }, Ft.prototype.reverse = function() {
                                var e = this.__wrapped__;
                                if (e instanceof Ht) {
                                    var n = e;
                                    return this.__actions__.length && (n = new Ht(this)), (n = n.reverse()).__actions__.push({
                                        func: ha,
                                        args: [na],
                                        thisArg: o
                                    }), new qt(n, this.__chain__)
                                }
                                return this.thru(na)
                            }, Ft.prototype.toJSON = Ft.prototype.valueOf = Ft.prototype.value = function() {
                                return go(this.__wrapped__, this.__actions__)
                            }, Ft.prototype.first = Ft.prototype.head, Ze && (Ft.prototype[Ze] = function() {
                                return this
                            }), Ft
                        }();
                        gn._ = yt, (r = function() {
                            return yt
                        }.call(n, t, n, e)) === o || (e.exports = r)
                    }.call(this)
            },
            2473: function(e, n, t) {
                "use strict";
                var r = t(1594);
                var o = "function" == typeof Object.is ? Object.is : function(e, n) {
                        return e === n && (0 !== e || 1 / e == 1 / n) || e != e && n != n
                    },
                    i = r.useState,
                    a = r.useEffect,
                    u = r.useLayoutEffect,
                    c = r.useDebugValue;

                function l(e) {
                    var n = e.getSnapshot;
                    e = e.value;
                    try {
                        var t = n();
                        return !o(e, t)
                    } catch (e) {
                        return !0
                    }
                }
                var s = "undefined" == typeof window || void 0 === window.document || void 0 === window.document.createElement ? function(e, n) {
                    return n()
                } : function(e, n) {
                    var t = n(),
                        r = i({
                            inst: {
                                value: t,
                                getSnapshot: n
                            }
                        }),
                        o = r[0].inst,
                        s = r[1];
                    return u((function() {
                        o.value = t, o.getSnapshot = n, l(o) && s({
                            inst: o
                        })
                    }), [e, t, n]), a((function() {
                        return l(o) && s({
                            inst: o
                        }), e((function() {
                            l(o) && s({
                                inst: o
                            })
                        }))
                    }), [e]), c(t), t
                };
                n.useSyncExternalStore = void 0 !== r.useSyncExternalStore ? r.useSyncExternalStore : s
            },
            1750: function(e, n, t) {
                "use strict";
                var r = t(1594),
                    o = t(3676);
                var i = "function" == typeof Object.is ? Object.is : function(e, n) {
                        return e === n && (0 !== e || 1 / e == 1 / n) || e != e && n != n
                    },
                    a = o.useSyncExternalStore,
                    u = r.useRef,
                    c = r.useEffect,
                    l = r.useMemo,
                    s = r.useDebugValue;
                n.useSyncExternalStoreWithSelector = function(e, n, t, r, o) {
                    var f = u(null);
                    if (null === f.current) {
                        var d = {
                            hasValue: !1,
                            value: null
                        };
                        f.current = d
                    } else d = f.current;
                    f = l((function() {
                        function e(e) {
                            if (!c) {
                                if (c = !0, a = e, e = r(e), void 0 !== o && d.hasValue) {
                                    var n = d.value;
                                    if (o(n, e)) return u = n
                                }
                                return u = e
                            }
                            if (n = u, i(a, e)) return n;
                            var t = r(e);
                            return void 0 !== o && o(n, t) ? (a = e, n) : (a = e, u = t)
                        }
                        var a, u, c = !1,
                            l = void 0 === t ? null : t;
                        return [function() {
                            return e(n())
                        }, null === l ? void 0 : function() {
                            return e(l())
                        }]
                    }), [n, t, r, o]);
                    var p = a(e, f[0], f[1]);
                    return c((function() {
                        d.hasValue = !0, d.value = p
                    }), [p]), s(p), p
                }
            },
            3676: function(e, n, t) {
                "use strict";
                e.exports = t(2473)
            },
            5390: function(e, n, t) {
                "use strict";
                e.exports = t(1750)
            },
            8217: function(e) {
                e.exports = "https://images.rbxcdn.com/659c7cbd7c9751056ba457f5dfc98aef-game_grid.webp"
            },
            1594: function(e) {
                "use strict";
                e.exports = React
            },
            4452: function(e, n) {
                var t;
                ! function() {
                    "use strict";
                    var r = {}.hasOwnProperty;

                    function o() {
                        for (var e = "", n = 0; n < arguments.length; n++) {
                            var t = arguments[n];
                            t && (e = a(e, i(t)))
                        }
                        return e
                    }

                    function i(e) {
                        if ("string" == typeof e || "number" == typeof e) return e;
                        if ("object" != typeof e) return "";
                        if (Array.isArray(e)) return o.apply(null, e);
                        if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                        var n = "";
                        for (var t in e) r.call(e, t) && e[t] && (n = a(n, t));
                        return n
                    }

                    function a(e, n) {
                        return n ? e ? e + " " + n : e + n : e
                    }
                    e.exports ? (o.default = o, e.exports = o) : void 0 === (t = function() {
                        return o
                    }.apply(n, [])) || (e.exports = t)
                }()
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
            var e, n = t(1594),
                r = t.n(n),
                o = ReactDOM,
                i = t.n(o),
                a = CoreUtilities,
                u = Roblox,
                c = HeaderScripts,
                l = ReactUtilities,
                s = ReactStyleGuide,
                f = CoreRobloxUtilities,
                d = {
                    ActionSwitch: "Action.Switch",
                    ActionAdd: "Action.Add",
                    ActionAddAccount: "Action.AddAccount",
                    ActionLogOutAllAccounts: "Action.LogoutAllAccounts",
                    HeadingSwitchAccount: "Heading.SwitchAccount",
                    LabelAddAccountWithoutLoggingOut: "Label.AddAccountWithoutLoggingOut",
                    LabelAddOrSwitchAccount: "Label.AddOrSwitchAccount",
                    DescriptionAccountLimit: "Description.AccountLimit"
                },
                p = {
                    HeadingAccountLimitReached: "Heading.AccountLimitReached",
                    LabelAccountLimitReached: "Label.AccountLimitReached",
                    ActionOK: "Action.OK"
                },
                h = {
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
                v = "Header.LogOutOfOtherAccounts",
                g = "Action.Logout",
                m = "Action.Cancel",
                y = "Description.LogoutConfirmation",
                b = "Description.ParentLogoutConfirmation",
                w = "Header.LogOutOfOtherAccounts",
                S = "Action.Logout",
                E = "Action.Cancel",
                A = "Description.LogoutConfirmation",
                x = "Description.ParentLogoutConfirmation",
                C = (u.EnvironmentUrls.websiteUrl, "RBXASBlob");
            ! function(e) {
                e[e.AccountSwitcherModalType = 0] = "AccountSwitcherModalType", e[e.LogoutAllAccountsModalType = 1] = "LogoutAllAccountsModalType", e[e.LoginConfirmationForLogoutAllAccountsModalType = 2] = "LoginConfirmationForLogoutAllAccountsModalType", e[e.SignupConfirmationForLogoutAllAccountsModalType = 3] = "SignupConfirmationForLogoutAllAccountsModalType"
            }(e || (e = {}));
            var _, k, L, P = {
                    ActionSignUpCapitalized: "Action.SignUpCapitalized",
                    ActionLogInCapitalized: "Action.LogInCapitalized",
                    ActionDeviceCode: "Action.DeviceCode",
                    ActionResendEmail: "Action.ResendEmail",
                    ActionSendVerificationEmail: "Action.SendVerificationEmail",
                    ActionOk: "Action.Ok",
                    ActionAnotherLoggedInDevice: "Action.AnotherLoggedInDevice",
                    ActionForgotPasswordOrUsernameQuestionCapitalized: "Action.ForgotPasswordOrUsernameQuestionCapitalized",
                    ActionLogInEmailOneTimeCode: "Action.LogInEmailOneTimeCode",
                    ActionLogInWithOneTimeCode: "Action.LogInWithOneTimeCode",
                    ActionLogInAnotherDevice: "Action.LogInAnotherDevice",
                    ActionLogInPasskey: "Action.LogInPasskey",
                    ActionNeedHelp: "Action.NeedHelp",
                    ActionUseAnotherDevice: "Action.UseAnotherDevice",
                    ActionCreateANewAccount: "Action.CreateANewAccount",
                    ActionAddAccount: "Action.AddAccount",
                    ActionRecoverYourAccount: "Action.RecoverYourAccount",
                    DescriptionCurfewMessage: "Description.CurfewMessage",
                    DescriptionAccountSelectorHelp: "Description.AccountSelectorHelp",
                    DescriptionEnterOneTimeCodeHelp: "Description.EnterOneTimeCodeHelp",
                    DescriptionGetOneTimeCodeHelp: "Description.GetOneTimeCodeHelp",
                    DescriptionAccountSelectorOtpTimeWarning: "Description.AccountSelectorOtpTimeWarning",
                    DescriptionLogBackIn: "Description.LogBackIn",
                    DescriptionLogoutFirst: "Description.LogoutFirst",
                    DescriptionRecoverYourAccount: "Description.RecoverYourAccount",
                    DescriptionLinkExpired: "Description.LinkExpired",
                    HeadingLoginRoblox: "Heading.LoginRoblox",
                    HeadingLoginRobloxAccountSwitching: "Heading.LoginRobloxAccountSwitching",
                    HeadingContinueToEnjoyRoblox: "Heading.ContinueToEnjoyRoblox",
                    HeadingLoginRequired: "Heading.LoginRequired",
                    HeadingYouHaveLoggedOut: "Heading.YouHaveLoggedOut",
                    HeadingAddAccount: "Heading.AddAccount",
                    HeadingSecurityNotification: "Heading.SecurityNotification",
                    HeaderLinkExpired: "Header.LinkExpired",
                    LabelEnterOneTimeCode: "Label.EnterOneTimeCode",
                    LabelGetOneTimeCode: "Label.GetOneTimeCode",
                    LabelNoAccount: "Label.NoAccount",
                    LabelPassword: "Label.Password",
                    LabelUsername: "Label.Username",
                    LabelUsernameEmailPhone: "Label.UsernameEmailPhone",
                    LabelLoginWithYour: "Label.LoginWithYour",
                    LabelUnverifiedEmailInstructions: "Label.UnverifiedEmailInstructions",
                    LabelNotReceived: "Label.NotReceived",
                    LabelVerificationEmailSent: "Label.VerificationEmailSent",
                    LabelEmailNeedsVerification: "Label.EmailNeedsVerification",
                    LabelAccountSelector: "Label.AccountSelectorTitle",
                    LabelLoginSwitchAccounts: "Label.LoginSwitchAccounts",
                    LabelChooseAccountToUse: "Label.ChooseAccountToUse",
                    MessageUnknownErrorTryAgain: "Message.UnknownErrorTryAgain",
                    MessageUsernameAndPasswordRequired: "Message.UsernameAndPasswordRequired",
                    ResponseAccountNotFound: "Response.AccountNotFound",
                    ResponseAccountIssueErrorContactSupport: "Response.AccountIssueErrorContactSupport",
                    ResponseTooManyAttemptsPleaseWait: "Response.TooManyAttemptsPleaseWait",
                    ResponseCaptchaErrorFailedToLoad: "Response.CaptchaErrorFailedToLoad",
                    ResponseCaptchaErrorFailedToVerify: "Response.CaptchaErrorFailedToVerify",
                    ResponseGlobalAppAccessError: "Response.GlobalAppAccessError",
                    ResponseIncorrectCredentials: "Response.IncorrectCredentialsForgotPasswordMessage",
                    ResponseIncorrectEmailOrPassword: "Response.IncorrectEmailOrPassword",
                    ResponseIncorrectPhoneOrPassword: "Response.IncorrectPhoneOrPassword",
                    ResponseIncorrectUsernamePassword: "Response.IncorrectUsernamePassword",
                    ResponseEmailLinkedToMultipleAccountsLoginWithUsername: "Response.EmailLinkedToMultipleAccountsLoginWithUsername",
                    ResponseLoginWithUsername: "Response.LoginWithUsername",
                    ResponseUnverifiedEmailLoginWithUsername: "Response.UnverifiedEmailLoginWithUsername",
                    ResponseUnverifiedPhoneLoginWithUsername: "Response.UnverifiedPhoneLoginWithUsername",
                    ResponseVerificationError: "Response.VerificationError",
                    ResponseOtpUnder13NotAllowed: "Response.OtpUnder13NotAllowed",
                    ResponseLoginBlocked: "Response.LoginBlocked",
                    ResponseInvalidPasskeyCredential: "Response.InvalidPasskeyCredential",
                    ErrorPasskeyOnlyAccount: "Error.PasskeyOnlyAccount"
                },
                O = {
                    upgradeKey: "RBXPasskeyUpgradePending",
                    upgradeUserIdKey: "RBXPasskeyUpgradeUserId",
                    upgradeImmediateLogin: "ImmediateLogin",
                    upgradeDelayedLogin: "DelayedLogin",
                    upgradeDelayedSignup: "DelayedSignup"
                },
                I = u.Endpoints.getAbsoluteUrl,
                T = {
                    securityNotification: u.EnvironmentUrls.websiteUrl + "/login/securityNotification",
                    koreaIdVerification: u.EnvironmentUrls.websiteUrl + "/id-verification/korea/login",
                    forgotCredentialsUrl: u.EnvironmentUrls.websiteUrl + "/login/forgot-password-or-username"
                },
                R = "Heading.SignIn",
                U = "Action.ForgotPasswordOrUsernameQuestion",
                N = "Label.Or",
                D = "Action.EmailACode",
                j = "Authentication.QuickSignInLowercase",
                M = "Label.DontHaveAnAccountCreateOne",
                z = "Label.UsernameEmailOrPhone",
                B = "Label.Password",
                F = "Heading.AddAccount",
                W = "Heading.SignIn",
                V = "Header.JumpBackIn",
                q = "Header.ChooseAnAccount",
                H = "Header.PickUpWhereYouLeftOff",
                G = "Action.SignInToAnotherAccount",
                K = "Action.CreateAccountFromSwitcher",
                Q = "WebsiteLogin_",
                $ = "react-2sv-container",
                Y = "react-captcha-container",
                X = "react-security-questions-container",
                Z = "react-account-selector-container",
                J = "otp-login-container",
                ee = "react-login-account-switcher-container",
                ne = "react-login-account-limit-error-container",
                te = "account-switcher-confirmation-modal-container",
                re = 1,
                oe = 2,
                ie = 3,
                ae = 4,
                ue = 6,
                ce = 7,
                le = 9,
                se = 10,
                fe = 11,
                de = 12,
                pe = 13,
                he = 14,
                ve = 16,
                ge = 18,
                me = 20,
                ye = 22,
                be = 23,
                we = 24,
                Se = 25,
                Ee = 26,
                Ae = 28,
                xe = 3,
                Ce = "FirstAttempt",
                _e = "Attempt",
                ke = "SuccessWithSAI",
                Le = "SuccessWithGameIntent",
                Pe = "Success",
                Oe = "Captcha",
                Ie = "PasswordResetRequired",
                Te = "UnverifiedAccount",
                Re = "InvalidCredentials",
                Ue = "AccountNotFound",
                Ne = "AccountIssue",
                De = "TooManyAttempts",
                je = "DefaultLoginRequired",
                Me = "CaptchaLoadFailed",
                ze = "CaptchaVerifyFailed",
                Be = "CaptchaUnknownError",
                Fe = "LuoBuUserDenied",
                We = "ScreenTimeRestricted",
                Ve = "UnknownError",
                qe = "SecurityQuestionRequired",
                He = "login",
                Ge = "Website.Login",
                Ke = I("/CreateAccount"),
                Qe = "Roblox.Login",
                $e = {
                    schematizedEventTypes: {
                        authFormInteraction: "authFormInteraction",
                        authButtonClick: "authButtonClick",
                        authMsgShown: "authMsgShown",
                        authPageLoad: "authPageload",
                        authModalShown: "authModalShown",
                        authClientError: "authClientError",
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
                        passkeyRegistration: "passkeyRegistration"
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
                        exitSignupConfirmation: "exitSignupConfirmation"
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
                        logout: "logout"
                    },
                    input: {
                        redacted: "[Redacted]"
                    },
                    origin: {
                        webVerifiedSignup: "WebVerifiedSignup",
                        signup: "signup",
                        login: "login"
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
                        }
                    },
                    passkeyRegistrationSource: {
                        signup: "signup"
                    },
                    passkeyRegistrationState: {
                        signupPreauthSuccess: "SignupPreauthSuccess",
                        signupPreauthDismissed: "SignupPreauthDismissed",
                        signupPreauthUnsupported: "SignupPreauthUnsupported",
                        signupPreauthError: "SignupPreauthError"
                    }
                };
            ! function(e) {
                e.Username = "Username", e.Email = "Email", e.PhoneNumber = "PhoneNumber", e.AuthToken = "AuthToken", e.EmailOtpSessionToken = "EmailOtpSessionToken", e.Passkey = "Passkey", e.MagicLink = "MagicLink"
            }(_ || (_ = {})),
            function(e) {
                e.Email = "Email", e.Authenticator = "Authenticator", e.RecoveryCode = "RecoveryCode"
            }(k || (k = {}));
            var Ye, Xe = "studio_trace_id",
                Ze = function() {
                    if (void 0 === L) {
                        var e = new URLSearchParams(window.location.search),
                            n = e.get(Xe);
                        if (!n) {
                            var t = e.get("returnUrl") || e.get("ReturnUrl");
                            if (t) try {
                                n = new URL(t).searchParams.get(Xe)
                            } catch (e) {}
                        }
                        L = n || ""
                    }
                    return L || void 0
                },
                Je = function() {
                    return Je = Object.assign || function(e) {
                        for (var n, t = 1, r = arguments.length; t < r; t++)
                            for (var o in n = arguments[t]) Object.prototype.hasOwnProperty.call(n, o) && (e[o] = n[o]);
                        return e
                    }, Je.apply(this, arguments)
                },
                en = f.eventStreamService.eventTypes,
                nn = function(e, n, t) {
                    var r, o = Ze();
                    f.eventStreamService.sendEventWithTarget(e, n, Je(Je({}, t), o ? ((r = {})[Xe] = o, r) : {}))
                },
                tn = function() {
                    nn(en.formInteraction, $e.context.loginPage, {
                        field: $e.field.loginOtherDevice,
                        aType: $e.aType.click
                    })
                },
                rn = function() {
                    nn(en.formInteraction, $e.context.loginPage, {
                        field: $e.field.loginSubmitButtonName,
                        aType: $e.aType.click
                    })
                },
                on = function() {
                    nn(en.formInteraction, $e.context.loginPage, {
                        field: $e.field.loginOTP,
                        aType: $e.aType.click
                    }), nn($e.schematizedEventTypes.authButtonClick, $e.context.schematizedLoginForm, {
                        btn: $e.field.OTP
                    })
                },
                an = function(e) {
                    nn(en.formInteraction, $e.context.enterOTP, {
                        field: $e.field.errorMessage,
                        aType: $e.aType.shown,
                        btn: $e.btn.login,
                        errorCode: e
                    })
                },
                un = function(e) {
                    nn(en.formInteraction, $e.context.loginForm, {
                        field: e.field,
                        aType: e.aType
                    })
                },
                cn = function() {
                    un({
                        field: $e.field.username,
                        aType: $e.aType.focus
                    })
                },
                ln = function() {
                    un({
                        field: $e.field.username,
                        aType: $e.aType.offFocus
                    })
                },
                sn = function() {
                    un({
                        field: $e.field.password,
                        aType: $e.aType.focus
                    })
                },
                fn = function() {
                    un({
                        field: $e.field.password,
                        aType: $e.aType.offFocus
                    })
                },
                dn = function(e, n, t) {
                    t === _.EmailOtpSessionToken && (nn(en.pageLoad, $e.context.disambiguationOTP, {
                        numUsers: String(e)
                    }), nn($e.schematizedEventTypes.authPageLoad, $e.context.disambigOTP, {
                        state: n
                    }))
                },
                pn = function(e, n) {
                    e === _.EmailOtpSessionToken ? (nn(en.formInteraction, $e.context.disambiguationOTP, {
                        field: $e.field.accountSelection
                    }), nn($e.schematizedEventTypes.authButtonClick, $e.context.disambigOTP, {
                        btn: $e.btn.select,
                        state: String(n)
                    })) : nn(en.formInteraction, "", {
                        field: $e.field.accountSelection
                    })
                },
                hn = function(e) {
                    nn($e.schematizedEventTypes.authPageLoad, $e.context.accountSwitcherLogin, {
                        state: e,
                        field: $e.field.accountSwitcher
                    })
                },
                vn = function() {
                    nn($e.schematizedEventTypes.authButtonClick, $e.context.loginPage, {
                        btn: $e.btn.logoutAll,
                        origin: $e.origin.login
                    })
                },
                gn = function(e) {
                    nn($e.schematizedEventTypes.authPageLoad, $e.context.passkeyLogin, {
                        state: String(e)
                    })
                },
                mn = function(e) {
                    nn($e.schematizedEventTypes.authPageLoad, $e.context.platformAuthenticatorSupport, {
                        state: String(e)
                    })
                },
                yn = function(e, n, t) {
                    nn($e.schematizedEventTypes.authButtonClick, t, {
                        btn: e,
                        state: n
                    })
                },
                bn = function(e, n) {
                    nn($e.schematizedEventTypes.authPageLoad, e, n ? {
                        state: n
                    } : {})
                },
                wn = function(e, n, t) {
                    nn($e.schematizedEventTypes.authFormInteraction, e, {
                        field: n,
                        state: t
                    })
                };
            ! function(e) {
                e[e.NotEnrolled = 0] = "NotEnrolled", e[e.WithBrowserCheck = 1] = "WithBrowserCheck", e[e.SkipBrowserCheck = 2] = "SkipBrowserCheck"
            }(Ye || (Ye = {}));
            var Sn, En = function(e) {
                    var n = e.credentialType,
                        t = e.isPasskeyLoginSupported,
                        r = e.isConditionalCreateSupported,
                        o = e.isPasswordAutofilled,
                        i = e.loginSilentUpgradeBrowserCheck,
                        a = e.userId;
                    ! function(e) {
                        var n = e.credentialType,
                            t = e.sourceCtx,
                            r = e.upgradeType,
                            o = e.upgradeCtx,
                            i = e.isPasskeyLoginSupported,
                            a = e.isConditionalCreateSupported,
                            u = e.silentUpgradeBrowserCheck,
                            c = e.userId;
                        n !== _.Username && n !== _.Email && n !== _.PhoneNumber || u && (i ? u !== Ye.WithBrowserCheck || a ? (null !== sessionStorage.getItem(O.upgradeKey) && bn(t, $e.state.passkeyUpselling.unclearedWebSessionFlag), sessionStorage.setItem(O.upgradeKey, r), c ? sessionStorage.setItem(O.upgradeUserIdKey, c) : sessionStorage.removeItem(O.upgradeUserIdKey), bn(o, "set" + r)) : bn(t, $e.state.passkeyUpselling.filteredByNoSilentUpgradeSupport) : bn(t, $e.state.passkeyUpselling.filteredByNoPasskeySupport))
                    }({
                        credentialType: n,
                        sourceCtx: $e.context.silentPasskeyUpgradeWebLogin,
                        upgradeType: o ? O.upgradeImmediateLogin : O.upgradeDelayedLogin,
                        upgradeCtx: o ? $e.context.silentPasskeyUpgradeWebLoginImmediate : $e.context.silentPasskeyUpgradeWebLoginDelayed,
                        isPasskeyLoginSupported: t,
                        isConditionalCreateSupported: r,
                        silentUpgradeBrowserCheck: i,
                        userId: a
                    })
                },
                An = {
                    common: ["Common.Captcha", "CommonUI.Controls", "Authentication.AccountSwitch", "Feature.Landing"],
                    feature: "Authentication.Login"
                },
                xn = {
                    common: [],
                    feature: "Feature.IdVerification"
                },
                Cn = {
                    common: ["CommonUI.Controls"],
                    feature: "Authentication.AccountSwitch"
                },
                _n = function(e, n, t, r) {
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
                kn = function(e, n) {
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
                Ln = function(e) {
                    return _n(void 0, void 0, Promise, (function() {
                        var n, t, r, o;
                        return kn(this, (function(i) {
                            switch (i.label) {
                                case 0:
                                    return c = "/otp-service/v1/metadata", n = u.EnvironmentUrls.apiGatewayUrl + c, t = {
                                        Origin: e
                                    }, r = n + "?" + a.urlService.composeQueryString(t), o = {
                                        url: r,
                                        withCredentials: !0
                                    }, [4, a.httpService.get(o)];
                                case 1:
                                    return [2, i.sent().data]
                            }
                            var c
                        }))
                    }))
                },
                Pn = "?",
                On = "&",
                In = "/v1/passkey/StartAuthentication",
                Tn = function(e, n, t, r) {
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
                Rn = function(e, n) {
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
                Un = function() {
                    return Tn(void 0, void 0, Promise, (function() {
                        var e, n;
                        return Rn(this, (function(t) {
                            switch (t.label) {
                                case 0:
                                    return r = In, e = u.EnvironmentUrls.authApi + r, n = {
                                        url: e
                                    }, [4, a.httpService.post(n)];
                                case 1:
                                    return [2, t.sent().data]
                            }
                            var r
                        }))
                    }))
                },
                Nn = function() {
                    var e = document.querySelector('meta[name="passkey-data"]');
                    return "true" === ((null == e ? void 0 : e.dataset) || {}).isPasskeyLoginEnabled
                },
                Dn = function(e, n, t, r) {
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
                jn = function(e, n) {
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
                Mn = function(e) {
                    return u.EnvironmentUrls.authApi + e
                },
                zn = function(e, n) {
                    return Dn(void 0, void 0, Promise, (function() {
                        var t, r;
                        return jn(this, (function(o) {
                            switch (o.label) {
                                case 0:
                                    return t = Mn("/v3/users/" + e + "/two-step-verification/login"), r = {
                                        url: t,
                                        withCredentials: !0
                                    }, [4, a.httpService.post(r, n)];
                                case 1:
                                    return [2, o.sent().data]
                            }
                        }))
                    }))
                },
                Bn = function(e) {
                    return Dn(void 0, void 0, Promise, (function() {
                        var n, t;
                        return jn(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return n = Mn("/v2/login"), t = {
                                        url: n,
                                        withCredentials: !0
                                    }, [4, a.httpService.post(t, e)];
                                case 1:
                                    return [2, r.sent().data]
                            }
                        }))
                    }))
                };
            ! function(e) {
                e.Pasted = "pasted", e.Autofilled = "autofilled"
            }(Sn || (Sn = {}));
            var Fn, Wn = function(e) {
                    var n = e;
                    if ("insertFromPaste" === n.inputType || "insertFromDrop" === n.inputType) return Sn.Pasted;
                    if ("insertReplacementText" === n.inputType) return Sn.Autofilled;
                    var t = e.target;
                    return "" !== (null == t ? void 0 : t.value) && void 0 === n.inputType && void 0 === n.data && void 0 === n.isComposing ? Sn.Autofilled : null
                },
                Vn = function() {
                    return document.getElementById("react-login-container")
                },
                qn = function() {
                    return document.getElementById("react-login-web-app")
                },
                Hn = "returnUrl",
                Gn = function(e) {
                    window.location.href = e
                },
                Kn = function() {
                    var e = a.urlService.getQueryParam(Hn);
                    if (e) {
                        var n = {
                            ReturnUrl: e
                        };
                        return a.urlService.getUrlWithQueries("/account/signupredir", n)
                    }
                    return a.urlService.getAbsoluteUrl("/CreateAccount")
                },
                Qn = function() {
                    window.location.href = a.urlService.getAbsoluteUrl("/home")
                },
                $n = function(e, n, t, r) {
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
                Yn = function(e, n) {
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
                Xn = function(e) {
                    return u.EnvironmentUrls.apiGatewayUrl + e
                },
                Zn = function(e) {
                    return $n(void 0, void 0, Promise, (function() {
                        var n, t;
                        return Yn(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return n = Xn("/account-switcher/v1/logoutAllLoggedInUsers"), t = {
                                        url: n,
                                        withCredentials: !0
                                    }, [4, a.httpService.post(t, e)];
                                case 1:
                                    return r.sent(), [2]
                            }
                        }))
                    }))
                },
                Jn = function() {
                    return Jn = Object.assign || function(e) {
                        for (var n, t = 1, r = arguments.length; t < r; t++)
                            for (var o in n = arguments[t]) Object.prototype.hasOwnProperty.call(n, o) && (e[o] = n[o]);
                        return e
                    }, Jn.apply(this, arguments)
                },
                et = function(e, n, t) {
                    void 0 === t && (t = {}), f.eventStreamService.sendEventWithTarget($e.schematizedEventTypes.authClientError, e, Jn({
                        state: n
                    }, t))
                },
                nt = function(e, n, t) {
                    void 0 === t && (t = {}), f.eventStreamService.sendEventWithTarget($e.schematizedEventTypes.authButtonClick, e, Jn({
                        btn: n
                    }, t))
                },
                tt = t(7243),
                rt = function(e, n, t, r) {
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
                ot = function(e, n) {
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
                it = function() {
                    var e = document.querySelector('meta[name="account-switching-data"]');
                    return "true" === ((null == e ? void 0 : e.dataset) || {}).isAccountSwitchingEnabled
                },
                at = function() {
                    if (!it()) return "";
                    try {
                        return f.localStorageService.getLocalStorage(C)
                    } catch (e) {
                        return console.warn(e), et($e.context.accountSwitcherLocalStorageFailure, $e.clientErrorTypes.localStorageGetFailure), ""
                    }
                },
                ut = function() {
                    try {
                        f.localStorageService.removeLocalStorage(C)
                    } catch (e) {
                        console.warn(e), et($e.context.accountSwitcherLocalStorageFailure, $e.clientErrorTypes.localStorageRemoveFailure)
                    }
                },
                ct = (0, tt.memoize)((function() {
                    return rt(void 0, void 0, Promise, (function() {
                        var e, n;
                        return ot(this, (function(t) {
                            switch (t.label) {
                                case 0:
                                    return t.trys.push([0, 2, , 3]), [4, null === u.ExperimentationService || void 0 === u.ExperimentationService ? void 0 : u.ExperimentationService.getAllValuesForLayer("Accounts.AccountSwitcher")];
                                case 1:
                                    return [2, !!(null == (e = t.sent()) ? void 0 : e.isAccountSwitcherEnabled)];
                                case 2:
                                    return n = t.sent(), console.info("Failed to get experiment parameter values for Account Switching", n), [2, !1];
                                case 3:
                                    return [2]
                            }
                        }))
                    }))
                })),
                lt = function() {
                    return rt(void 0, void 0, Promise, (function() {
                        var e;
                        return ot(this, (function(n) {
                            return it() ? (null === c.authenticatedUser || void 0 === c.authenticatedUser ? void 0 : c.authenticatedUser.isAuthenticated) && (null === c.authenticatedUser || void 0 === c.authenticatedUser ? void 0 : c.authenticatedUser.isUnder13) ? [2, !1] : null !== (e = at()) && "" !== e.trim() ? [2, !0] : (null === c.authenticatedUser || void 0 === c.authenticatedUser ? void 0 : c.authenticatedUser.isAuthenticated) ? [2, ct()] : [2, !1] : [2, !1]
                        }))
                    }))
                },
                st = function() {
                    return window.EventTracker
                },
                ft = function(e) {
                    try {
                        var n = new XMLHttpRequest;
                        n.open("POST", "/game/report-event?name=" + encodeURIComponent(e), !0), n.timeout = 5e4, n.withCredentials = !0, n.send()
                    } catch (e) {}
                },
                dt = {
                    start: function() {
                        for (var e, n = [], t = 0; t < arguments.length; t++) n[t] = arguments[t];
                        null === (e = st()) || void 0 === e || e.start.apply(e, n)
                    },
                    endSuccess: function() {
                        for (var e, n = [], t = 0; t < arguments.length; t++) n[t] = arguments[t];
                        null === (e = st()) || void 0 === e || e.endSuccess.apply(e, n)
                    },
                    endCancel: function() {
                        for (var e, n = [], t = 0; t < arguments.length; t++) n[t] = arguments[t];
                        null === (e = st()) || void 0 === e || e.endCancel.apply(e, n)
                    },
                    endFailure: function() {
                        for (var e, n = [], t = 0; t < arguments.length; t++) n[t] = arguments[t];
                        null === (e = st()) || void 0 === e || e.endFailure.apply(e, n)
                    },
                    fireEvent: function() {
                        for (var e = [], n = 0; n < arguments.length; n++) e[n] = arguments[n];
                        var t = st();
                        (null == t ? void 0 : t.fireEvent) ? t.fireEvent.apply(t, e): e.forEach(ft)
                    }
                },
                pt = dt;
            ! function(e) {
                e.Production = "production", e.Sitetest1 = "sitetest1", e.Sitetest2 = "sitetest2", e.Sitetest3 = "sitetest3"
            }(Fn || (Fn = {}));
            var ht = function() {
                    var e = window.location.hostname;
                    return e.includes(Fn.Sitetest3) ? Fn.Sitetest3 : e.includes(Fn.Sitetest2) ? Fn.Sitetest2 : e.includes(Fn.Sitetest1) ? Fn.Sitetest1 : Fn.Production
                },
                vt = ["{{", "/getauthticket", "/placelauncher.ashx"],
                gt = ["http:", "https:"],
                mt = ["#", "?", "//", ".", "mailto:", "javascript:", "rbxmobile:"],
                yt = ["survey.roblox.com"],
                bt = "/",
                wt = function(e) {
                    return e.split(".").slice(-2).join(".")
                },
                St = function(e) {
                    if (!0 === u.Endpoints.isAbsolute(e)) {
                        var n = new URL(e),
                            t = n.hostname,
                            r = n.protocol;
                        if (wt(window.location.hostname) !== wt(t)) return bt;
                        if (! function() {
                                switch (ht()) {
                                    case Fn.Sitetest3:
                                    case Fn.Sitetest2:
                                    case Fn.Sitetest1:
                                        return ["robloxlabs.com"];
                                    case Fn.Production:
                                    default:
                                        return ["roblox.com"]
                                }
                            }().some((function(e) {
                                return e === wt(t)
                            })) || yt.some((function(e) {
                                return t.includes(e)
                            }))) return bt;
                        if (!gt.some((function(e) {
                                return r === e
                            }))) return bt
                    } else if (e !== decodeURIComponent(e)) return bt;
                    return e
                },
                Et = function() {
                    var e, n = a.urlService.parseQueryString() || {},
                        t = Object.keys(n).find((function(e) {
                            return "returnurl" === e.toLowerCase()
                        })),
                        r = t ? String(null !== (e = n["" + t]) && void 0 !== e ? e : "") : "";
                    if (!r || "" === r.trim() || mt.some((function(e) {
                            return r.startsWith(e)
                        })) || vt.some((function(e) {
                            return r.includes(e)
                        }))) return bt;
                    if (function() {
                            var e = ht();
                            switch (e) {
                                case Fn.Sitetest3:
                                case Fn.Sitetest2:
                                case Fn.Sitetest1:
                                    return ["https://apis." + e + ".robloxlabs.com/application-authorization/v1/authorize", "https://authorize." + e + ".robloxlabs.com", "https://www." + e + ".robloxlabs.com"];
                                case Fn.Production:
                                default:
                                    return ["https://apis.roblox.com/oauth/v1/authorize", "https://authorize.roblox.com", "https://www.roblox.com"]
                            }
                        }().some((function(e) {
                            return function(e, n) {
                                try {
                                    var t = new URL(n),
                                        r = new URL(e);
                                    return t.hostname === r.hostname && t.protocol === r.protocol && (t.pathname === r.pathname || "/" === r.pathname)
                                } catch (e) {
                                    return !1
                                }
                            }(r, e)
                        }))) return r;
                    try {
                        return u.Endpoints.getAbsoluteUrl(St(r))
                    } catch (e) {
                        return bt
                    }
                },
                At = function(e, n, t, r) {
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
                xt = function(e, n) {
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
                Ct = a.urlService.composeQueryString,
                _t = function(e) {
                    pt && e && pt.fireEvent(Q + e)
                },
                kt = function(e, n, t) {
                    void 0 === n && (n = "conditional");
                    var r = f.fido2Util.convertPublicKeyParametersToStandardBase64(e);
                    return navigator.credentials.get({
                        publicKey: f.fido2Util.formatCredentialRequestWeb(JSON.stringify(r)),
                        mediation: n,
                        signal: t
                    })
                },
                Lt = function(e) {
                    var n = Ve;
                    switch (e) {
                        case re:
                            n = Re;
                            break;
                        case ie:
                            n = Ue;
                            break;
                        case ue:
                            n = Ne;
                            break;
                        case ce:
                            n = De;
                            break;
                        case le:
                            n = je;
                            break;
                        case se:
                            n = Te;
                            break;
                        case fe:
                            n = Me;
                            break;
                        case de:
                            n = ze;
                            break;
                        case he:
                            n = Fe;
                            break;
                        case pe:
                            n = Be;
                            break;
                        case ve:
                            n = We;
                            break;
                        default:
                            n = Ve
                    }
                    return n
                },
                Pt = function(e, n) {
                    switch (e) {
                        case le:
                        case se:
                        case re:
                            return function(e, n) {
                                switch (e) {
                                    case re:
                                        return n === _.Email ? P.ResponseIncorrectEmailOrPassword : n === _.PhoneNumber ? P.ResponseIncorrectPhoneOrPassword : n === _.EmailOtpSessionToken ? P.ResponseIncorrectCredentials : n === _.Passkey ? P.ResponseInvalidPasskeyCredential : n === _.MagicLink ? P.MessageUnknownErrorTryAgain : P.ResponseIncorrectUsernamePassword;
                                    case le:
                                        return n === _.Email ? P.ResponseEmailLinkedToMultipleAccountsLoginWithUsername : n === _.PhoneNumber ? P.ResponseLoginWithUsername : "";
                                    case se:
                                        return n === _.Email ? P.ResponseUnverifiedEmailLoginWithUsername : n === _.PhoneNumber ? P.ResponseUnverifiedPhoneLoginWithUsername : "";
                                    default:
                                        return ""
                                }
                            }(e, n);
                        case ie:
                            return P.ResponseAccountNotFound;
                        case ue:
                            return P.ResponseAccountIssueErrorContactSupport;
                        case ce:
                            return P.ResponseTooManyAttemptsPleaseWait;
                        case fe:
                            return P.ResponseCaptchaErrorFailedToLoad;
                        case de:
                            return P.ResponseCaptchaErrorFailedToVerify;
                        case he:
                            return P.ResponseGlobalAppAccessError;
                        case pe:
                            return P.MessageUnknownErrorTryAgain;
                        case ve:
                            return P.DescriptionCurfewMessage;
                        case ye:
                            return P.ResponseOtpUnder13NotAllowed;
                        case be:
                            return P.ResponseLoginBlocked;
                        case Ae:
                            return P.ErrorPasskeyOnlyAccount;
                        default:
                            return P.MessageUnknownErrorTryAgain
                    }
                },
                Ot = function(e) {
                    return n = e, new RegExp("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$").test(n) ? _.Email : (t = e) && !(t.length < 4) && /\d/.test(t) && /^[\d|\W|_]+$/.test(t) ? _.PhoneNumber : _.Username;
                    var n, t
                },
                It = function() {
                    var e, n, t = Vn(),
                        r = qn();
                    return "" + ("true" === (null === (e = null == t ? void 0 : t.getAttribute("data-enable-frontend-return-url")) || void 0 === e ? void 0 : e.toLowerCase()) || r ? Et() : (null == t ? void 0 : t.getAttribute("data-return-url")) || "") + (null !== (n = window.location.hash) && void 0 !== n ? n : "")
                },
                Tt = function() {
                    var e = function(e) {
                        if (!e) return "/";
                        var n = e;
                        return e.indexOf(Pn) > -1 ? n += On : n += Pn, n + "nl=true"
                    }(It());
                    return a.urlService.getAbsoluteUrl(e)
                },
                Rt = function(e) {
                    if (!e.trim()) return !1;
                    try {
                        var n = new URL(e);
                        return "https:" === n.protocol && n.hostname === function() {
                            var e = ht();
                            switch (e) {
                                case Fn.Sitetest3:
                                case Fn.Sitetest2:
                                case Fn.Sitetest1:
                                    return "authorize." + e + ".robloxlabs.com";
                                case Fn.Production:
                                default:
                                    return "authorize.roblox.com"
                            }
                        }()
                    } catch (e) {
                        return !1
                    }
                },
                Ut = function(e, n) {
                    return e === _.EmailOtpSessionToken ? n(P.DescriptionAccountSelectorHelp) + " " + n(P.DescriptionAccountSelectorOtpTimeWarning, {
                        timeLimitSec: "60"
                    }) : n(P.DescriptionAccountSelectorHelp)
                },
                Nt = function() {
                    var e = Tt();
                    return Ke + "?" + Ct({
                        returnUrl: e
                    })
                },
                Dt = function(e) {
                    var n = [];
                    if (!e || "object" != typeof e) return [];
                    var t = e.errors;
                    return t instanceof Array ? (t.forEach((function(e) {
                        if (e && "object" == typeof e) {
                            var t = e.code;
                            "number" == typeof t && n.push(t)
                        }
                    })), n) : []
                },
                jt = function(e) {
                    var n = Dt(e);
                    return "object" == typeof e && Dt(e.data).forEach((function(e) {
                        return n.push(e)
                    })), n[0] || null
                },
                Mt = function(e) {
                    var n = [];
                    if (!e || "object" != typeof e) return [];
                    var t = e.errors;
                    return t instanceof Array ? (t.forEach((function(e) {
                        if (e && "object" == typeof e) {
                            var t = e.fieldData;
                            "string" == typeof t && n.push(t)
                        }
                    })), n) : []
                },
                zt = function(e) {
                    var n = Mt(e);
                    "object" == typeof e && Mt(e.data).forEach((function(e) {
                        return n.push(e)
                    }));
                    var t = n[0] || "",
                        r = JSON.parse(t);
                    return {
                        userId: r.userId,
                        sessionId: r.sessionId
                    }
                },
                Bt = function(e) {
                    var n = {
                            users: [],
                            invalidUsers: []
                        },
                        t = Mt(e);
                    if ("object" == typeof e) {
                        Mt(e.data).forEach((function(e) {
                            return t.push(e)
                        }));
                        var r = t[0] || "",
                            o = JSON.parse(r),
                            i = o.users,
                            a = o.invalidUsers;
                        n.users = null != i ? i : [], n.invalidUsers = null != a ? a : []
                    }
                    return n
                },
                Ft = (0, l.withTranslations)((function(e) {
                    var t = e.captchaId,
                        o = e.captchaToken,
                        i = e.credentialValue,
                        a = e.password,
                        u = e.isLoading,
                        c = e.errorMsg,
                        l = e.translate,
                        f = e.onFormSubmit,
                        d = e.onCredentialValueChange,
                        p = e.onPasswordChange,
                        h = e.isLoginFormDisabled,
                        v = function(e, n) {
                            var t = Wn(e.nativeEvent);
                            t && wn($e.context.loginForm, n, t)
                        };
                    return (0, n.useEffect)((function() {
                        t && o && f(!1)
                    }), [t + o]), r().createElement("div", {
                        id: "login-form"
                    }, r().createElement("div", null, r().createElement("div", {
                        className: "login-form-container"
                    }, r().createElement("form", {
                        className: "login-form",
                        name: "loginForm",
                        onSubmit: function(e) {
                            e.preventDefault(), e.stopPropagation()
                        }
                    }, r().createElement("div", {
                        className: "form-group username-form-group"
                    }, r().createElement("label", {
                        htmlFor: "login-username",
                        className: "sr-only"
                    }, l(P.LabelUsernameEmailPhone)), r().createElement("input", {
                        id: "login-username",
                        name: "username",
                        type: "text",
                        className: "form-control input-field",
                        autoComplete: "username webauthn",
                        onFocus: cn,
                        onBlur: ln,
                        placeholder: l(P.LabelUsernameEmailPhone),
                        value: i,
                        onChange: function(e) {
                            v(e, $e.field.username), d(e.target.value)
                        }
                    })), r().createElement("div", {
                        className: "form-group password-form-group"
                    }, r().createElement("label", {
                        htmlFor: "login-password",
                        className: "sr-only"
                    }, l(P.LabelPassword)), r().createElement("input", {
                        id: "login-password",
                        name: "password",
                        type: "password",
                        className: "form-control input-field",
                        onFocus: sn,
                        onBlur: fn,
                        placeholder: l(P.LabelPassword),
                        value: a,
                        onChange: function(e) {
                            v(e, $e.field.password), p(e)
                        },
                        onKeyPress: function(e) {
                            return function(e) {
                                "Enter" === e.key && f()
                            }(e)
                        }
                    }), r().createElement("div", {
                        "aria-live": "polite"
                    }, c.length > 0 && r().createElement("p", {
                        className: "form-control-label xsmall text-error login-error",
                        id: "login-form-error"
                    }, c))), u ? r().createElement(s.Loading, null) : r().createElement("button", {
                        type: "button",
                        id: "login-button",
                        className: "btn-full-width login-button btn-secondary-md",
                        onClick: function(e) {
                            return f()
                        },
                        disabled: h
                    }, l(P.ActionLogInCapitalized))))))
                }), An),
                Wt = u.AccountIntegrityChallengeService.Captcha,
                Vt = function(e) {
                    var t = e.containerId,
                        o = e.actionType,
                        i = e.dataExchange,
                        a = e.unifiedCaptchaId,
                        u = e.onCaptchaChallengeCompleted,
                        c = e.onCaptchaChallengeInvalidated,
                        l = e.onCaptchaChallengeAbandoned,
                        s = e.onUnknownError,
                        f = (0, n.useState)(null),
                        d = f[0],
                        p = f[1];
                    return (0, n.useEffect)((function() {
                        i && a && function(e) {
                            if (null === d) {
                                var n = {
                                    containerId: t,
                                    actionType: o,
                                    appType: null,
                                    dataExchangeBlob: e.dataExchange,
                                    unifiedCaptchaId: e.unifiedCaptchaId,
                                    onChallengeDisplayed: function(e) {
                                        return null
                                    },
                                    onChallengeCompleted: function(e) {
                                        p(null), u(e)
                                    },
                                    onChallengeInvalidated: function(e) {
                                        p(null), c(e)
                                    },
                                    renderInline: !1,
                                    onModalChallengeAbandoned: function(e) {
                                        return p((function() {
                                            return e
                                        })), l(), null
                                    }
                                };
                                Wt ? Wt.renderChallenge(n).then((function(e) {
                                    e || s()
                                })).catch((function() {
                                    s()
                                })) : console.error("no captcha service available")
                            } else d()
                        }({
                            dataExchange: i,
                            unifiedCaptchaId: a
                        })
                    }), [i + a]), r().createElement("div", {
                        id: t
                    })
                },
                qt = u.AccountIntegrityChallengeService.TwoStepVerification,
                Ht = function(e) {
                    var t = e.userId,
                        o = e.challengeId,
                        i = e.on2svChallengeCompleted,
                        a = e.on2svChallengeInvalidated,
                        u = e.on2svChallengeAbandoned,
                        c = e.onUnknownError,
                        l = $;
                    return (0, n.useEffect)((function() {
                        t && o && function() {
                            try {
                                qt.renderChallenge({
                                    containerId: l,
                                    userId: t,
                                    challengeId: o,
                                    actionType: qt.ActionType.Login,
                                    renderInline: !1,
                                    shouldShowRememberDeviceCheckbox: !0,
                                    recoveryParameters: {
                                        clientSupports2svRecovery: !0
                                    },
                                    onChallengeCompleted: i,
                                    onChallengeInvalidated: a,
                                    onModalChallengeAbandoned: u
                                }) || c()
                            } catch (e) {
                                c()
                            }
                        }()
                    }), [t, o]), r().createElement("div", {
                        id: l
                    })
                },
                Gt = (0, l.withTranslations)((function(e) {
                    var t = e.onCrossDeviceLoginCodeValidated,
                        o = e.isOtpLoginEnabled,
                        i = e.openOtpLoginModal,
                        a = e.showPasskeyLoginButton,
                        c = e.openPasskeyLoginFlow,
                        l = e.isOneTimeCodeDesignUpdated,
                        s = e.translate;
                    return (0, n.useEffect)((function() {
                        var e = function(e) {
                            e.detail && t(e.detail)
                        };
                        return window.addEventListener("OnCrossDeviceCodeValidated", e),
                            function() {
                                window.removeEventListener("OnCrossDeviceCodeValidated", e)
                            }
                    }), []), r().createElement("div", null, r().createElement("div", {
                        className: "alternative-login-divider-container"
                    }, r().createElement("div", {
                        className: "rbx-divider alternative-login-divider"
                    }), !o && r().createElement("div", {
                        className: "divider-text-container"
                    }, r().createElement("span", {
                        className: "divider-text"
                    }, s(P.LabelLoginWithYour)))), o && r().createElement("button", {
                        type: "button",
                        id: "otp-login-button",
                        className: "btn-full-width btn-control-md otp-login-button",
                        onClick: i
                    }, s(P.ActionLogInEmailOneTimeCode)), a && r().createElement("button", {
                        type: "button",
                        id: "passkey-login-button",
                        className: "btn-full-width btn-control-md passkey-login-button",
                        onClick: function() {
                            c("required")
                        }
                    }, s(P.ActionLogInPasskey)), r().createElement("button", {
                        type: "button",
                        id: "cross-device-login-button",
                        className: "btn-full-width btn-control-md cross-device-login-button",
                        onClick: function() {
                            tn(), u.CrossDeviceLoginDisplayCodeService.openModal()
                        }
                    }, r().createElement("span", null, s(o ? l ? P.ActionUseAnotherDevice : P.ActionLogInAnotherDevice : P.ActionAnotherLoggedInDevice))))
                }), An),
                Kt = function(e) {
                    f.localStorageService.setLocalStorage("identityVerificationLoginTicket", e)
                },
                Qt = function() {
                    var e = T.koreaIdVerification;
                    window.location.href = e
                },
                $t = (0, l.withTranslations)((function(e) {
                    var t = e.identityVerificationLoginTicket,
                        o = e.translate,
                        i = (0, s.createModal)(),
                        a = i[0],
                        u = i[1];
                    return (0, n.useEffect)((function() {
                        Kt(t), t && u.open()
                    }), [t]), {
                        identityVerificationLoginTicket: t
                    } && r().createElement(a, {
                        title: o("Title.VerificationRequired"),
                        body: o("Description.VerificationRequired"),
                        neutralButtonText: o("Action.StartVerification"),
                        onNeutral: Qt,
                        closeable: !1
                    })
                }), xn),
                Yt = u.AccountIntegrityChallengeService.SecurityQuestions,
                Xt = function(e) {
                    var t = e.userId,
                        o = e.sessionId,
                        i = e.onSecurityQuestionsChallengeCompleted,
                        a = e.onSecurityQuestionsChallengeInvalidated,
                        u = e.onSecurityQuestionsChallengeAbandoned,
                        c = e.onUnknownError,
                        l = X;
                    return (0, n.useEffect)((function() {
                        t && o && function() {
                            try {
                                Yt.renderChallenge({
                                    containerId: l,
                                    userId: t,
                                    sessionId: o,
                                    renderInline: !1,
                                    onChallengeCompleted: i,
                                    onChallengeInvalidated: a,
                                    onModalChallengeAbandoned: u
                                }) || c()
                            } catch (e) {
                                c()
                            }
                        }()
                    }), [t, o]), r().createElement("div", {
                        id: l
                    })
                },
                Zt = function(e, n, t, r) {
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
                Jt = function(e, n) {
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
                er = (0, l.withTranslations)((function(e) {
                    var t = e.translate,
                        o = (0, n.useState)(!1),
                        i = o[0],
                        a = o[1],
                        l = u.AccountSwitcherService && c.authenticatedUser.isAuthenticated,
                        s = l ? Nt() : Kn();
                    return (0, n.useEffect)((function() {
                        Zt(void 0, void 0, void 0, (function() {
                            var e, n;
                            return Jt(this, (function(t) {
                                switch (t.label) {
                                    case 0:
                                        return t.trys.push([0, 2, , 3]), [4, null === u.NavigationService || void 0 === u.NavigationService ? void 0 : u.NavigationService.getIsVNGLandingRedirectEnabled()];
                                    case 1:
                                        return e = t.sent(), a(l || !e), [3, 3];
                                    case 2:
                                        return n = t.sent(), console.error("Error fetching data:", n), a(!0), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            }))
                        }))
                    }), [l]), r().createElement("div", {
                        className: "text-center"
                    }, i && r().createElement("div", {
                        className: "signup-option"
                    }, !l && r().createElement("span", {
                        className: "no-account-text"
                    }, t(P.LabelNoAccount)), r().createElement("a", {
                        id: "sign-up-link",
                        className: "text-link signup-link",
                        href: s,
                        target: "_self"
                    }, t(l ? P.ActionCreateANewAccount : P.ActionSignUpCapitalized))))
                }), An),
                nr = (0, l.withTranslations)((function(e) {
                    var n = e.credentialValue,
                        t = e.translate,
                        o = T.forgotCredentialsUrl,
                        i = n ? o + "?identifier=" + encodeURIComponent(n) : o,
                        a = P.ActionForgotPasswordOrUsernameQuestionCapitalized;
                    return r().createElement("div", {
                        className: "text-center forgot-credentials-link"
                    }, r().createElement("a", {
                        id: "forgot-credentials-link",
                        className: "text-link",
                        href: i,
                        target: "_self"
                    }, t(a)))
                }), An),
                tr = function(e) {
                    var t = e.containerId,
                        o = e.users,
                        i = e.invalidUsers,
                        a = e.onAccountSelection,
                        c = e.onAccountSelectorAbandoned,
                        l = e.titleText,
                        s = e.helpText,
                        f = e.translate,
                        d = {
                            containerId: t,
                            users: o,
                            invalidUsers: i,
                            onAccountSelection: a,
                            onAccountSelectorAbandoned: c,
                            titleText: l,
                            helpText: s,
                            translate: f
                        };
                    return (0, n.useEffect)((function() {
                        o.length > 0 && u.AccountSelectorService && u.AccountSelectorService.renderAccountSelectorModal(d)
                    }), [o, i]), r().createElement("div", {
                        id: t
                    })
                },
                rr = function() {
                    return rr = Object.assign || function(e) {
                        for (var n, t = 1, r = arguments.length; t < r; t++)
                            for (var o in n = arguments[t]) Object.prototype.hasOwnProperty.call(n, o) && (e[o] = n[o]);
                        return e
                    }, rr.apply(this, arguments)
                },
                or = function(e, n, t, r) {
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
                ir = function(e, n) {
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
                ar = function(e) {
                    var t = (0, n.useState)({}),
                        r = t[0],
                        o = t[1],
                        i = (0, n.useState)(!0),
                        a = i[0],
                        c = i[1];
                    return (0, n.useEffect)((function() {
                        c(!0),
                            function(e) {
                                return or(void 0, void 0, Promise, (function() {
                                    return ir(this, (function(n) {
                                        switch (n.label) {
                                            case 0:
                                                return (null === u.ExperimentationService || void 0 === u.ExperimentationService ? void 0 : u.ExperimentationService.getAllValuesForLayer) ? [4, u.ExperimentationService.getAllValuesForLayer(e)] : [3, 2];
                                            case 1:
                                                return [2, n.sent()];
                                            case 2:
                                                return [2, {}]
                                        }
                                    }))
                                }))
                            }(e).then((function(e) {
                                o(e), c(!1)
                            }), (function() {
                                o({}), c(!1)
                            }))
                    }), [e]), rr(rr({}, r), {
                        isLoading: a
                    })
                },
                ur = function(e) {
                    var t, o = e.containerId,
                        i = e.titleText,
                        a = e.helpText,
                        c = e.onAccountSwitched,
                        l = e.handleAddAccount,
                        s = e.suppressAddAccountRow,
                        f = e.removeInvalidActiveUser,
                        d = e.isModal,
                        p = e.translate,
                        h = e.loggedInUsers,
                        v = (0, n.useRef)(!1),
                        g = {
                            containerId: o,
                            titleText: i,
                            helpText: a,
                            onAccountSwitched: c,
                            handleAddAccount: l,
                            suppressAddAccountRow: s,
                            removeInvalidActiveUser: f,
                            isModal: d,
                            translate: p,
                            loggedInUsers: h
                        },
                        m = (null !== (t = null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService ? void 0 : u.AccountSwitcherService.useIsAccountSwitcherAvailableForBrowser()) && void 0 !== t ? t : [!1])[0];
                    return (0, n.useEffect)((function() {
                        m && !v.current && (v.current = !0, null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService || u.AccountSwitcherService.renderAccountSwitcher(g))
                    }), [g, m]), r().createElement("div", {
                        id: o
                    })
                },
                cr = function(e, n, t, r) {
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
                lr = function(e, n) {
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
                sr = (0, l.withTranslations)((function(e) {
                    var t, o = e.origin,
                        i = e.containerId,
                        a = e.hasMaxLoggedInAccountsSignupError,
                        c = e.isAccountLimitReached,
                        l = e.handleRedirectHome,
                        s = e.translate,
                        f = e.isParentUser,
                        v = (null !== (t = null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService ? void 0 : u.AccountSwitcherService.useIsAccountSwitcherAvailableForBrowser()) && void 0 !== t ? t : [!1])[0];
                    return (0, n.useEffect)((function() {
                        if (v) {
                            if (c || a) {
                                var e = function() {
                                    var e = this,
                                        n = {
                                            containerId: i,
                                            origin: o,
                                            localizedTitleText: s(p.HeadingAccountLimitReached),
                                            localizedBodyText: s(p.LabelAccountLimitReached),
                                            localizedPrimaryButtonText: s(p.ActionOK),
                                            primaryButtonCallback: l,
                                            isModalDismissable: !1
                                        };
                                    return a && (n.localizedSecondaryButtonText = s(d.ActionLogOutAllAccounts), n.secondaryButtonCallback = function() {
                                        return cr(e, void 0, void 0, (function() {
                                            var e;
                                            return lr(this, (function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        if (!(e = at())) return [3, 4];
                                                        n.label = 1;
                                                    case 1:
                                                        return n.trys.push([1, 3, , 4]), [4, Zn({
                                                            encrypted_users_data_blob: e
                                                        })];
                                                    case 2:
                                                        return n.sent(), [3, 4];
                                                    case 3:
                                                        return n.sent(), et($e.context.accountSwitcherLimitError, $e.clientErrorTypes.logoutAllAccountSwitcherAccounts), [3, 4];
                                                    case 4:
                                                        ut();
                                                        try {
                                                            null === u.NavigationService || void 0 === u.NavigationService || u.NavigationService.logoutAndRedirect()
                                                        } catch (e) {
                                                            window.location.reload()
                                                        }
                                                        return [2]
                                                }
                                            }))
                                        }))
                                    }), n
                                }();
                                null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService || u.AccountSwitcherService.renderBaseConfirmationModal(e)
                            }
                            var n, t, r;
                            f && (n = o === h.LoginEmptyBlobRequiredError ? $e.context.accountSwitcherVpcLogin : $e.context.accountSwitcherVpcSignup, t = $e.clientErrorTypes.logoutAllAccountSwitcherAccounts, r = {
                                containerId: i,
                                origin: o,
                                localizedTitleText: s("Header.LogoutAllAccounts"),
                                localizedBodyText: s("Description.ParentLogoutConfirmation"),
                                localizedPrimaryButtonText: s("Action.LogoutAllAccounts"),
                                primaryButtonCallback: function() {
                                    return cr(void 0, void 0, void 0, (function() {
                                        var e;
                                        return lr(this, (function(r) {
                                            switch (r.label) {
                                                case 0:
                                                    if (vn(), !(e = at())) return [3, 4];
                                                    r.label = 1;
                                                case 1:
                                                    return r.trys.push([1, 3, , 4]), [4, Zn({
                                                        encrypted_users_data_blob: e
                                                    })];
                                                case 2:
                                                    return r.sent(), [3, 4];
                                                case 3:
                                                    return r.sent(), et(n, t), [3, 4];
                                                case 4:
                                                    return ut(), window.location.reload(), [2]
                                            }
                                        }))
                                    }))
                                },
                                isModalDismissable: !1
                            }, null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService || u.AccountSwitcherService.renderBaseConfirmationModal(r))
                        }
                    }), [v, c, a]), r().createElement("div", {
                        id: i
                    })
                }), Cn),
                fr = (u.EnvironmentUrls.authApi, u.EnvironmentUrls.authApi, u.EnvironmentUrls.authApi, u.EnvironmentUrls.userAgreementsServiceApi, u.EnvironmentUrls.authApi, u.EnvironmentUrls.authApi, u.EnvironmentUrls.authApi, u.Endpoints.getAbsoluteUrl("/login"), u.EnvironmentUrls.websiteUrl, u.EnvironmentUrls.websiteUrl, u.EnvironmentUrls.usersApi, new Map([
                    [1, "Response.UsernameAlreadyInUse"],
                    [2, "Response.BadUsername"],
                    [10, "Response.UsernamePrivateInfo"],
                    [12, "Response.UsernameNotAvailable"]
                ]), function(e, n, t, r) {
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
                }),
                dr = function(e, n) {
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
                };
            var pr = function(e) {
                var t = this;
                void 0 === e && (e = !0);
                var r = (0, n.useState)({
                        usersAvailableForSwitching: [],
                        isAccountLimitReached: !1
                    }),
                    o = r[0],
                    i = r[1],
                    a = (0, n.useState)(!0),
                    l = a[0],
                    s = a[1];
                return (0, n.useEffect)((function() {
                    fr(t, void 0, Promise, (function() {
                        var n, t;
                        return dr(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return r.trys.push([0, 2, 3, 4]), [4, null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService ? void 0 : u.AccountSwitcherService.parseLoggedInUsers(!c.authenticatedUser.isAuthenticated, e)];
                                case 1:
                                    return n = r.sent(), i(n), [3, 4];
                                case 2:
                                    return t = r.sent(), console.warn("account switching has issues", t), [3, 4];
                                case 3:
                                    return s(!1), [7];
                                case 4:
                                    return [2]
                            }
                        }))
                    }))
                }), []), {
                    loggedInUsers: o,
                    isGettingLoggedInUsers: l
                }
            };
            var hr, vr = function(e) {
                    (0, n.useEffect)((function() {
                        e && Qn()
                    }), [e])
                },
                gr = function() {
                    var e = (0, n.useState)(!1),
                        t = e[0],
                        r = e[1];
                    return (0, n.useEffect)((function() {
                        var e = new URLSearchParams(window.location.search),
                            n = String(e.get("returnUrl"));
                        r(n.includes("parental-requests"))
                    }), []), t
                },
                mr = {
                    qualifiedSignup: u.EnvironmentUrls.apiGatewayUrl + "/affiliate-links/v1/events/qualified-signup",
                    qualifiedLogin: u.EnvironmentUrls.apiGatewayUrl + "/affiliate-links/v1/events/authenticated-visit"
                },
                yr = ["/share-links"],
                br = ["ExperienceAffiliate", "ExperienceInvite"],
                wr = function(e) {
                    var n;
                    return yr.includes(e.pathname) && br.includes(null !== (n = e.searchParams.get("type")) && void 0 !== n ? n : "")
                },
                Sr = function(e) {
                    var n;
                    try {
                        var t = new URL(e);
                        return yr.includes(t.pathname) && (null !== (n = t.searchParams.get("code")) && void 0 !== n) ? n : ""
                    } catch (e) {
                        return ""
                    }
                },
                Er = function(e) {
                    try {
                        var n = new URL(e).searchParams.get("referralUrl");
                        if (!n) return null;
                        var t = new URL(decodeURIComponent(n));
                        return wr(t) ? t.href : null
                    } catch (e) {
                        return null
                    }
                },
                Ar = function(e) {
                    var n;
                    try {
                        var t = new URL(e);
                        return yr.includes(t.pathname) && (null !== (n = t.searchParams.get("type")) && void 0 !== n) ? n : ""
                    } catch (e) {
                        return ""
                    }
                };
            ! function(e) {
                e.SavePaymentMethods = "SavePaymentMethods", e.UpdateUserSetting = "UpdateUserSetting", e.UpdateBirthdate = "UpdateBirthdate", e.LinkToChild = "LinkToChild", e.LiftPunishment = "LiftPunishment", e.Unknown = "Unknown"
            }(hr || (hr = {}));
            f.eventStreamService.eventTypes;
            var xr = function(e) {
                    a.httpService.post({
                        withCredentials: !0,
                        url: mr.qualifiedLogin
                    }, e).catch((function(e) {
                        console.error("Failed to send login event for affiliate links:", e)
                    }))
                },
                Cr = (0, l.withTranslations)((function(e) {
                    var n = e.credentialValue,
                        t = e.translate;
                    return r().createElement(s.Modal, {
                        className: "security-notification-modal",
                        show: !0,
                        backdrop: "static",
                        keyboard: !1
                    }, r().createElement(s.Modal.Header, {
                        useBaseBootstrapComponent: !0
                    }, r().createElement("div", null), r().createElement("span", {
                        className: "text-heading-small text-align-x-center padding-large"
                    }, t(P.HeadingSecurityNotification))), r().createElement(s.Modal.Body, null, r().createElement("p", {
                        className: "text-center text-body-large modal-margin-bottom"
                    }, t(P.DescriptionRecoverYourAccount))), r().createElement(s.Modal.Footer, null, r().createElement("div", {
                        className: "security-notification-modal-footer-buttons"
                    }, r().createElement("button", {
                        type: "button",
                        className: "btn-growth-md security-notification-modal-footer-button update-email-button",
                        "aria-label": t(P.ActionRecoverYourAccount),
                        onClick: function() {
                            ! function(e) {
                                Gn("" === e ? T.forgotCredentialsUrl : T.forgotCredentialsUrl + "?identifier=" + encodeURIComponent(e))
                            }(n)
                        }
                    }, t(P.ActionRecoverYourAccount)))))
                }), An),
                _r = function(e, n, t, r) {
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
                kr = function(e, n) {
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
                Lr = f.dataStores.localeDataStore;

            function Pr() {
                var e = (0, n.useState)(void 0),
                    t = e[0],
                    r = e[1],
                    o = (0, n.useState)(!0),
                    i = o[0],
                    a = o[1],
                    u = (0, n.useState)(!1),
                    c = u[0],
                    l = u[1];
                return (0, n.useEffect)((function() {
                    a(!0), l(!1), _r(void 0, void 0, Promise, (function() {
                        var e, n;
                        return kr(this, (function(t) {
                            switch (t.label) {
                                case 0:
                                    return t.trys.push([0, 2, , 3]), [4, Lr.getUserLocale()];
                                case 1:
                                    return (e = t.sent()) && e.data && 200 === e.status ? [2, null === (n = e.data.signupAndLogin) || void 0 === n ? void 0 : n.locale] : [2, void 0];
                                case 2:
                                    return t.sent(), [2, void 0];
                                case 3:
                                    return [2]
                            }
                        }))
                    })).then((function(e) {
                        r(e), a(!1)
                    }), (function() {
                        l(!0), a(!1)
                    }))
                }), []), {
                    data: t,
                    isLoading: i,
                    isError: c
                }
            }
            var Or = function(e) {
                    switch (e.toLowerCase()) {
                        case "en_us":
                            return "us";
                        case "de_de":
                            return "de";
                        case "id_id":
                            return "id";
                        case "ja_jp":
                            return "jp";
                        default:
                            return null
                    }
                },
                Ir = function() {
                    var e = ar(Ge),
                        n = Pr();
                    if (e.isLoading) return {
                        isLoginBackgroundImageEnabled: !1,
                        loginBackgroundClass: ""
                    };
                    var t = e.IsLoginBackgroundImageEnabled,
                        r = e.LoginBackgroundClass,
                        o = e.UseLocalizedLoginBackground;
                    return {
                        isLoginBackgroundImageEnabled: t,
                        loginBackgroundClass: function() {
                            if (!t || !r) return "";
                            if (!o) return r;
                            if (n.isLoading) return "";
                            if (!n.data || n.isError) return r;
                            var e = Or(n.data);
                            return e ? r + "-localized-" + e : r
                        }()
                    }
                },
                Tr = {
                    common: ["CommonUI.Controls"],
                    feature: "Feature.Landing"
                },
                Rr = (u.Intl && new u.Intl).getRobloxLocale(),
                Ur = function(e) {
                    return "ja_jp" === Rr ? e.concat("-jp") : e
                },
                Nr = (u.EnvironmentUrls.websiteUrl, "Label.RobloxAmazonStore"),
                Dr = "Link.AmazonStoreRobloxApp",
                jr = "Label.RobloxAppStore",
                Mr = "Label.BrazilContentRatingLogoTitleSixteen",
                zr = "Label.BrazilContentDescriptorViolence",
                Br = "Label.BrazilInteractiveElementDescriptorInGamePurchases",
                Fr = "Label.BrazilInteractiveElementDescriptorUsersInteract",
                Wr = "Label.GetOnGooglePlay",
                Vr = "Link.GooglePlayStoreRobloxApp",
                qr = "Label.ItalyContentRatingLogoTitle",
                Hr = "Label.RobloxWindowsStore",
                Gr = "Link.WindowsStoreRobloxApp",
                Kr = "Label.RobloxOnXbox",
                Qr = "Link.XboxStoreRobloxApp",
                $r = (Ur("apple-badge"), Ur("google-badge"), Ur("amazon-badge"), Ur("microsoft-badge"), (0, l.withTranslations)((function(e) {
                    var n = e.shouldDisplayBrazilRatingLogo,
                        t = e.shouldDisplayItalyRatingLogo,
                        o = e.onContentRatingLogoClick,
                        i = e.translate;
                    return r().createElement("div", null, n && r().createElement("div", {
                        id: "brazil-rating-logo"
                    }, r().createElement("div", {
                        id: "brazil-rating-header"
                    }, r().createElement("span", null, i(Mr))), r().createElement("div", {
                        id: "brazil-rating-content"
                    }, r().createElement("div", {
                        role: "button",
                        tabIndex: 0,
                        id: "brazil-icon",
                        "aria-label": "brazil-content-rating",
                        onClick: o
                    }), r().createElement("div", {
                        id: "brazil-logo-text-container"
                    }, r().createElement("div", {
                        className: "brazil-logo-content-text"
                    }, r().createElement("span", null, i(zr))))), r().createElement("div", {
                        id: "brazil-rating-footer"
                    }, r().createElement("div", {
                        className: "brazil-logo-footer-text"
                    }, r().createElement("span", null, i(Fr))), r().createElement("div", {
                        className: "brazil-logo-footer-text"
                    }, r().createElement("span", null, i(Br))))), t && r().createElement("div", {
                        role: "button",
                        tabIndex: 0,
                        id: "italy-rating-logo",
                        onClick: o
                    }, r().createElement("div", {
                        id: "italy-icon-container"
                    }, r().createElement("div", {
                        id: "pegi-icon"
                    }), r().createElement("div", {
                        id: "fear-icon"
                    }), r().createElement("div", {
                        id: "violence-icon"
                    }), r().createElement("div", {
                        id: "purchases-icon"
                    })), r().createElement("div", {
                        id: "italy-logo-text"
                    }, r().createElement("span", null, i(qr)))))
                }), Tr)),
                Yr = function(e, n, t, r) {
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
                Xr = function(e, n) {
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
                Zr = function() {
                    return Yr(void 0, void 0, Promise, (function() {
                        return Xr(this, (function(e) {
                            return [2, u.Guac.callBehaviour("content-rating-logo")]
                        }))
                    }))
                },
                Jr = function(e, n, t, r) {
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
                eo = function(e, n) {
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
                };
            var no = function() {
                    var e = (0, n.useState)(!1),
                        t = e[0],
                        r = e[1],
                        o = (0, n.useState)(!1),
                        i = o[0],
                        a = o[1];
                    return (0, n.useEffect)((function() {
                        ! function() {
                            Jr(this, void 0, void 0, (function() {
                                var e;
                                return eo(this, (function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return [4, Zr()];
                                        case 1:
                                            return (e = n.sent()) && (r(e.displayBrazilRatingLogo), a(e.displayItalyRatingLogo)), [2]
                                    }
                                }))
                            }))
                        }()
                    }), []), {
                        shouldDisplayBrazilRatingLogo: t,
                        shouldDisplayItalyRatingLogo: i
                    }
                },
                to = "magicLinkToken",
                ro = function() {
                    return new URLSearchParams(window.location.search).get(to)
                },
                oo = function() {
                    return oo = Object.assign || function(e) {
                        for (var n, t = 1, r = arguments.length; t < r; t++)
                            for (var o in n = arguments[t]) Object.prototype.hasOwnProperty.call(n, o) && (e[o] = n[o]);
                        return e
                    }, oo.apply(this, arguments)
                };

            function io(e, n) {
                var t = {};
                for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && n.indexOf(r) < 0 && (t[r] = e[r]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                    var o = 0;
                    for (r = Object.getOwnPropertySymbols(e); o < r.length; o++) n.indexOf(r[o]) < 0 && Object.prototype.propertyIsEnumerable.call(e, r[o]) && (t[r[o]] = e[r[o]])
                }
                return t
            }

            function ao(e) {
                var n, t, r = "";
                if ("string" == typeof e || "number" == typeof e) r += e;
                else if ("object" == typeof e)
                    if (Array.isArray(e)) {
                        var o = e.length;
                        for (n = 0; n < o; n++) e[n] && (t = ao(e[n])) && (r && (r += " "), r += t)
                    } else
                        for (t in e) e[t] && (r && (r += " "), r += t);
                return r
            }
            var uo = function() {
                    for (var e, n, t = 0, r = "", o = arguments.length; t < o; t++)(e = arguments[t]) && (n = ao(e)) && (r && (r += " "), r += n);
                    return r
                },
                co = ReactJSX;

            function lo(e, n) {
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
                    if ("string" == typeof e) return so(e, n);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === t && e.constructor && (t = e.constructor.name);
                    if ("Map" === t || "Set" === t) return Array.from(e);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return so(e, n)
                }(e, n) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function so(e, n) {
                (null == n || n > e.length) && (n = e.length);
                for (var t = 0, r = new Array(n); t < n; t++) r[t] = e[t];
                return r
            }
            var fo = null !== globalThis && void 0 !== globalThis && globalThis.document ? n.useLayoutEffect : function() {},
                po = n[" useId ".trim().toString()] || function() {},
                ho = 0;

            function vo(e) {
                var t = lo(n.useState(po()), 2),
                    r = t[0],
                    o = t[1];
                return fo((function() {
                    e || o((function(e) {
                        return null != e ? e : String(ho++)
                    }))
                }), [e]), e || (r ? "radix-".concat(r) : "")
            }

            function go(e, n) {
                var t;
                if ("undefined" == typeof Symbol || null == e[Symbol.iterator]) {
                    if (Array.isArray(e) || (t = bo(e)) || n && e && "number" == typeof e.length) {
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

            function mo(e) {
                return function(e) {
                    if (Array.isArray(e)) return wo(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || bo(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function yo(e, n) {
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
                }(e, n) || bo(e, n) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function bo(e, n) {
                if (e) {
                    if ("string" == typeof e) return wo(e, n);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t ? Array.from(e) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? wo(e, n) : void 0
                }
            }

            function wo(e, n) {
                (null == n || n > e.length) && (n = e.length);
                for (var t = 0, r = new Array(n); t < n; t++) r[t] = e[t];
                return r
            }

            function So(e, n) {
                var t = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    n && (r = r.filter((function(n) {
                        return Object.getOwnPropertyDescriptor(e, n).enumerable
                    }))), t.push.apply(t, r)
                }
                return t
            }

            function Eo(e) {
                for (var n = 1; n < arguments.length; n++) {
                    var t = null != arguments[n] ? arguments[n] : {};
                    n % 2 ? So(Object(t), !0).forEach((function(n) {
                        Ao(e, n, t[n])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : So(Object(t)).forEach((function(n) {
                        Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                    }))
                }
                return e
            }

            function Ao(e, n, t) {
                return n in e ? Object.defineProperty(e, n, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[n] = t, e
            }

            function xo(e, n) {
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

            function Co(e, n) {
                var t = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    r = void 0 === t || t;
                return function(t) {
                    if (null != e && e(t), !1 === r || !t.defaultPrevented) return null == n ? void 0 : n(t)
                }
            }

            function _o(e, n) {
                if ("function" == typeof e) return e(n);
                null != e && (e.current = n)
            }

            function ko() {
                for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                return function(e) {
                    var t = !1,
                        r = n.map((function(n) {
                            var r = _o(n, e);
                            return t || "function" != typeof r || (t = !0), r
                        }));
                    if (t) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var t = r[e];
                            "function" == typeof t ? t() : _o(n[e], null)
                        }
                    }
                }
            }

            function Lo() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return n.useCallback(ko.apply(void 0, t), t)
            }
            var Po = Symbol("radix.slottable");

            function Oo(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === Po
            }
            var Io = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, t) {
                var r = function(e) {
                        var t = function(e) {
                                var t = n.forwardRef((function(e, t) {
                                    var r = e.children,
                                        o = xo(e, ["children"]);
                                    if (n.isValidElement(r)) {
                                        var i = function(e) {
                                                var n, t, r = null === (n = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === n ? void 0 : n.get,
                                                    o = r && "isReactWarning" in r && r.isReactWarning;
                                                return o ? e.ref : (o = (r = null === (t = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === t ? void 0 : t.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                            }(r),
                                            a = function(e, n) {
                                                var t = Eo({}, n),
                                                    r = function(r) {
                                                        var o = e[r],
                                                            i = n[r];
                                                        /^on[A-Z]/.test(r) ? o && i ? t[r] = function() {
                                                            i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                        } : o && (t[r] = o) : "style" === r ? t[r] = Eo(Eo({}, o), i) : "className" === r && (t[r] = [o, i].filter(Boolean).join(" "))
                                                    };
                                                for (var o in n) r(o);
                                                return Eo(Eo({}, e), t)
                                            }(o, r.props);
                                        return r.type !== n.Fragment && (a.ref = t ? ko(t, i) : i), n.cloneElement(r, a)
                                    }
                                    return n.Children.count(r) > 1 ? n.Children.only(null) : null
                                }));
                                return t.displayName = "".concat(e, ".SlotClone"), t
                            }(e),
                            r = n.forwardRef((function(e, r) {
                                var o = e.children,
                                    i = xo(e, ["children"]),
                                    a = n.Children.toArray(o),
                                    u = a.find(Oo);
                                if (u) {
                                    var c = u.props.children,
                                        l = a.map((function(e) {
                                            return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                        }));
                                    return (0, co.jsx)(t, Eo(Eo({}, i), {}, {
                                        ref: r,
                                        children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                                    }))
                                }
                                return (0, co.jsx)(t, Eo(Eo({}, i), {}, {
                                    ref: r,
                                    children: o
                                }))
                            }));
                        return r.displayName = "".concat(e, ".Slot"), r
                    }("Primitive.".concat(t)),
                    o = n.forwardRef((function(e, n) {
                        var o = e.asChild,
                            i = xo(e, ["asChild"]),
                            a = o ? r : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, co.jsx)(a, Eo(Eo({}, i), {}, {
                            ref: n
                        }))
                    }));
                return o.displayName = "Primitive.".concat(t), Eo(Eo({}, e), {}, Ao({}, t, o))
            }), {});

            function To(e) {
                var t = n.useRef(e);
                return n.useEffect((function() {
                    t.current = e
                })), n.useMemo((function() {
                    return function() {
                        for (var e, n = arguments.length, r = new Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                        return null === (e = t.current) || void 0 === e ? void 0 : e.call.apply(e, [t].concat(r))
                    }
                }), [])
            }
            var Ro, Uo = "dismissableLayer.update",
                No = n.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                Do = n.forwardRef((function(e, t) {
                    var r, o = e.disableOutsidePointerEvents,
                        i = void 0 !== o && o,
                        a = e.onEscapeKeyDown,
                        u = e.onPointerDownOutside,
                        c = e.onFocusOutside,
                        l = e.onInteractOutside,
                        s = e.onDismiss,
                        f = xo(e, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        d = n.useContext(No),
                        p = yo(n.useState(null), 2),
                        h = p[0],
                        v = p[1],
                        g = null !== (r = null == h ? void 0 : h.ownerDocument) && void 0 !== r ? r : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                        m = yo(n.useState({}), 2)[1],
                        y = Lo(t, (function(e) {
                            return v(e)
                        })),
                        b = Array.from(d.layers),
                        w = yo(mo(d.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        S = b.indexOf(w),
                        E = h ? b.indexOf(h) : -1,
                        A = d.layersWithOutsidePointerEventsDisabled.size > 0,
                        x = E >= S,
                        C = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                                r = To(e),
                                o = n.useRef(!1),
                                i = n.useRef((function() {}));
                            return n.useEffect((function() {
                                var e = function(e) {
                                        if (e.target && !o.current) {
                                            var n = function() {
                                                    Mo("dismissableLayer.pointerDownOutside", r, a, {
                                                        discrete: !0
                                                    })
                                                },
                                                a = {
                                                    originalEvent: e
                                                };
                                            "touch" === e.pointerType ? (t.removeEventListener("click", i.current), i.current = n, t.addEventListener("click", i.current, {
                                                once: !0
                                            })) : n()
                                        } else t.removeEventListener("click", i.current);
                                        o.current = !1
                                    },
                                    n = window.setTimeout((function() {
                                        t.addEventListener("pointerdown", e)
                                    }), 0);
                                return function() {
                                    window.clearTimeout(n), t.removeEventListener("pointerdown", e), t.removeEventListener("click", i.current)
                                }
                            }), [t, r]), {
                                onPointerDownCapture: function() {
                                    return o.current = !0
                                }
                            }
                        }((function(e) {
                            var n = e.target,
                                t = mo(d.branches).some((function(e) {
                                    return e.contains(n)
                                }));
                            x && !t && (null != u && u(e), null != l && l(e), e.defaultPrevented || null == s || s())
                        }), g),
                        _ = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                                r = To(e),
                                o = n.useRef(!1);
                            return n.useEffect((function() {
                                var e = function(e) {
                                    e.target && !o.current && Mo("dismissableLayer.focusOutside", r, {
                                        originalEvent: e
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return t.addEventListener("focusin", e),
                                    function() {
                                        return t.removeEventListener("focusin", e)
                                    }
                            }), [t, r]), {
                                onFocusCapture: function() {
                                    return o.current = !0
                                },
                                onBlurCapture: function() {
                                    return o.current = !1
                                }
                            }
                        }((function(e) {
                            var n = e.target;
                            mo(d.branches).some((function(e) {
                                return e.contains(n)
                            })) || (null != c && c(e), null != l && l(e), e.defaultPrevented || null == s || s())
                        }), g);
                    return function(e) {
                        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                            r = function(e) {
                                var t = n.useRef(e);
                                return n.useEffect((function() {
                                    t.current = e
                                })), n.useMemo((function() {
                                    return function() {
                                        for (var e, n = arguments.length, r = new Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                                        return null === (e = t.current) || void 0 === e ? void 0 : e.call.apply(e, [t].concat(r))
                                    }
                                }), [])
                            }(e);
                        n.useEffect((function() {
                            var e = function(e) {
                                "Escape" === e.key && r(e)
                            };
                            return t.addEventListener("keydown", e, {
                                    capture: !0
                                }),
                                function() {
                                    return t.removeEventListener("keydown", e, {
                                        capture: !0
                                    })
                                }
                        }), [r, t])
                    }((function(e) {
                        E === d.layers.size - 1 && (null != a && a(e), !e.defaultPrevented && s && (e.preventDefault(), s()))
                    }), g), n.useEffect((function() {
                        if (h) return i && (0 === d.layersWithOutsidePointerEventsDisabled.size && (Ro = g.body.style.pointerEvents, g.body.style.pointerEvents = "none"), d.layersWithOutsidePointerEventsDisabled.add(h)), d.layers.add(h), jo(),
                            function() {
                                i && 1 === d.layersWithOutsidePointerEventsDisabled.size && (g.body.style.pointerEvents = Ro)
                            }
                    }), [h, g, i, d]), n.useEffect((function() {
                        return function() {
                            h && (d.layers.delete(h), d.layersWithOutsidePointerEventsDisabled.delete(h), jo())
                        }
                    }), [h, d]), n.useEffect((function() {
                        var e = function() {
                            return m({})
                        };
                        return document.addEventListener(Uo, e),
                            function() {
                                return document.removeEventListener(Uo, e)
                            }
                    }), []), (0, co.jsx)(Io.div, Eo(Eo({}, f), {}, {
                        ref: y,
                        style: Eo({
                            pointerEvents: A ? x ? "auto" : "none" : void 0
                        }, e.style),
                        onFocusCapture: Co(e.onFocusCapture, _.onFocusCapture),
                        onBlurCapture: Co(e.onBlurCapture, _.onBlurCapture),
                        onPointerDownCapture: Co(e.onPointerDownCapture, C.onPointerDownCapture)
                    }))
                }));

            function jo() {
                var e = new CustomEvent(Uo);
                document.dispatchEvent(e)
            }

            function Mo(e, n, t, r) {
                var i = r.discrete,
                    a = t.originalEvent.target,
                    u = new CustomEvent(e, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: t
                    });
                n && a.addEventListener(e, n, {
                    once: !0
                }), i ? function(e, n) {
                    e && o.flushSync((function() {
                        return e.dispatchEvent(n)
                    }))
                }(a, u) : a.dispatchEvent(u)
            }

            function zo(e, n) {
                if ("function" == typeof e) return e(n);
                null != e && (e.current = n)
            }

            function Bo() {
                for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                return function(e) {
                    var t = !1,
                        r = n.map((function(n) {
                            var r = zo(n, e);
                            return t || "function" != typeof r || (t = !0), r
                        }));
                    if (t) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var t = r[e];
                            "function" == typeof t ? t() : zo(n[e], null)
                        }
                    }
                }
            }
            Do.displayName = "DismissableLayer", n.forwardRef((function(e, t) {
                var r = n.useContext(No),
                    o = n.useRef(null),
                    i = Lo(t, o);
                return n.useEffect((function() {
                    var e = o.current;
                    if (e) return r.branches.add(e),
                        function() {
                            r.branches.delete(e)
                        }
                }), [r.branches]), (0, co.jsx)(Io.div, Eo(Eo({}, e), {}, {
                    ref: i
                }))
            })).displayName = "DismissableLayerBranch";
            var Fo = Symbol("radix.slottable");

            function Wo(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === Fo
            }
            var Vo = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, t) {
                var r = function(e) {
                        var t = function(e) {
                                var t = n.forwardRef((function(e, t) {
                                    var r = e.children,
                                        o = xo(e, ["children"]);
                                    if (n.isValidElement(r)) {
                                        var i = function(e) {
                                                var n, t, r = null === (n = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === n ? void 0 : n.get,
                                                    o = r && "isReactWarning" in r && r.isReactWarning;
                                                return o ? e.ref : (o = (r = null === (t = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === t ? void 0 : t.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                            }(r),
                                            a = function(e, n) {
                                                var t = Eo({}, n),
                                                    r = function(r) {
                                                        var o = e[r],
                                                            i = n[r];
                                                        /^on[A-Z]/.test(r) ? o && i ? t[r] = function() {
                                                            i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                        } : o && (t[r] = o) : "style" === r ? t[r] = Eo(Eo({}, o), i) : "className" === r && (t[r] = [o, i].filter(Boolean).join(" "))
                                                    };
                                                for (var o in n) r(o);
                                                return Eo(Eo({}, e), t)
                                            }(o, r.props);
                                        return r.type !== n.Fragment && (a.ref = t ? Bo(t, i) : i), n.cloneElement(r, a)
                                    }
                                    return n.Children.count(r) > 1 ? n.Children.only(null) : null
                                }));
                                return t.displayName = "".concat(e, ".SlotClone"), t
                            }(e),
                            r = n.forwardRef((function(e, r) {
                                var o = e.children,
                                    i = xo(e, ["children"]),
                                    a = n.Children.toArray(o),
                                    u = a.find(Wo);
                                if (u) {
                                    var c = u.props.children,
                                        l = a.map((function(e) {
                                            return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                        }));
                                    return (0, co.jsx)(t, Eo(Eo({}, i), {}, {
                                        ref: r,
                                        children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                                    }))
                                }
                                return (0, co.jsx)(t, Eo(Eo({}, i), {}, {
                                    ref: r,
                                    children: o
                                }))
                            }));
                        return r.displayName = "".concat(e, ".Slot"), r
                    }("Primitive.".concat(t)),
                    o = n.forwardRef((function(e, n) {
                        var o = e.asChild,
                            i = xo(e, ["asChild"]),
                            a = o ? r : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, co.jsx)(a, Eo(Eo({}, i), {}, {
                            ref: n
                        }))
                    }));
                return o.displayName = "Primitive.".concat(t), Eo(Eo({}, e), {}, Ao({}, t, o))
            }), {});

            function qo(e) {
                var t = n.useRef(e);
                return n.useEffect((function() {
                    t.current = e
                })), n.useMemo((function() {
                    return function() {
                        for (var e, n = arguments.length, r = new Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                        return null === (e = t.current) || void 0 === e ? void 0 : e.call.apply(e, [t].concat(r))
                    }
                }), [])
            }
            var Ho = "focusScope.autoFocusOnMount",
                Go = "focusScope.autoFocusOnUnmount",
                Ko = {
                    bubbles: !1,
                    cancelable: !0
                },
                Qo = n.forwardRef((function(e, t) {
                    var r = e.loop,
                        o = void 0 !== r && r,
                        i = e.trapped,
                        a = void 0 !== i && i,
                        u = e.onMountAutoFocus,
                        c = e.onUnmountAutoFocus,
                        l = xo(e, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        s = yo(n.useState(null), 2),
                        f = s[0],
                        d = s[1],
                        p = qo(u),
                        h = qo(c),
                        v = n.useRef(null),
                        g = function() {
                            for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                            return n.useCallback(Bo.apply(void 0, t), t)
                        }(t, (function(e) {
                            return d(e)
                        })),
                        m = n.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    n.useEffect((function() {
                        if (a) {
                            var e = function(e) {
                                    if (!m.paused && f) {
                                        var n = e.target;
                                        f.contains(n) ? v.current = n : Zo(v.current, {
                                            select: !0
                                        })
                                    }
                                },
                                n = function(e) {
                                    if (!m.paused && f) {
                                        var n = e.relatedTarget;
                                        null !== n && (f.contains(n) || Zo(v.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", e), document.addEventListener("focusout", n);
                            var t = new MutationObserver((function(e) {
                                if (document.activeElement === document.body) {
                                    var n, t = go(e);
                                    try {
                                        for (t.s(); !(n = t.n()).done;) {
                                            n.value.removedNodes.length > 0 && Zo(f)
                                        }
                                    } catch (e) {
                                        t.e(e)
                                    } finally {
                                        t.f()
                                    }
                                }
                            }));
                            return f && t.observe(f, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", e), document.removeEventListener("focusout", n), t.disconnect()
                                }
                        }
                    }), [a, f, m.paused]), n.useEffect((function() {
                        if (f) {
                            Jo.add(m);
                            var e = document.activeElement;
                            if (!f.contains(e)) {
                                var n = new CustomEvent(Ho, Ko);
                                f.addEventListener(Ho, p), f.dispatchEvent(n), n.defaultPrevented || (function(e) {
                                    var n, t = (arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}).select,
                                        r = void 0 !== t && t,
                                        o = document.activeElement,
                                        i = go(e);
                                    try {
                                        for (i.s(); !(n = i.n()).done;) {
                                            if (Zo(n.value, {
                                                    select: r
                                                }), document.activeElement !== o) return
                                        }
                                    } catch (e) {
                                        i.e(e)
                                    } finally {
                                        i.f()
                                    }
                                }($o(f).filter((function(e) {
                                    return "A" !== e.tagName
                                })), {
                                    select: !0
                                }), document.activeElement === e && Zo(f))
                            }
                            return function() {
                                f.removeEventListener(Ho, p), setTimeout((function() {
                                    var n = new CustomEvent(Go, Ko);
                                    f.addEventListener(Go, h), f.dispatchEvent(n), n.defaultPrevented || Zo(null != e ? e : document.body, {
                                        select: !0
                                    }), f.removeEventListener(Go, h), Jo.remove(m)
                                }), 0)
                            }
                        }
                    }), [f, p, h, m]);
                    var y = n.useCallback((function(e) {
                        if ((o || a) && !m.paused) {
                            var n = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                t = document.activeElement;
                            if (n && t) {
                                var r = e.currentTarget,
                                    i = function(e) {
                                        var n = $o(e);
                                        return [Yo(n, e), Yo(n.reverse(), e)]
                                    }(r),
                                    u = yo(i, 2),
                                    c = u[0],
                                    l = u[1];
                                c && l ? e.shiftKey || t !== l ? e.shiftKey && t === c && (e.preventDefault(), o && Zo(l, {
                                    select: !0
                                })) : (e.preventDefault(), o && Zo(c, {
                                    select: !0
                                })) : t === r && e.preventDefault()
                            }
                        }
                    }), [o, a, m.paused]);
                    return (0, co.jsx)(Vo.div, Eo(Eo({
                        tabIndex: -1
                    }, l), {}, {
                        ref: g,
                        onKeyDown: y
                    }))
                }));

            function $o(e) {
                for (var n = [], t = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var n = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || n ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); t.nextNode();) n.push(t.currentNode);
                return n
            }

            function Yo(e, n) {
                var t, r = go(e);
                try {
                    for (r.s(); !(t = r.n()).done;) {
                        var o = t.value;
                        if (!Xo(o, {
                                upTo: n
                            })) return o
                    }
                } catch (e) {
                    r.e(e)
                } finally {
                    r.f()
                }
            }

            function Xo(e, n) {
                var t = n.upTo;
                if ("hidden" === getComputedStyle(e).visibility) return !0;
                for (; e;) {
                    if (void 0 !== t && e === t) return !1;
                    if ("none" === getComputedStyle(e).display) return !0;
                    e = e.parentElement
                }
                return !1
            }

            function Zo(e) {
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
            Qo.displayName = "FocusScope";
            var Jo = function() {
                var e = [];
                return {
                    add: function(n) {
                        var t = e[0];
                        n !== t && null != t && t.pause(), (e = ei(e, n)).unshift(n)
                    },
                    remove: function(n) {
                        var t;
                        null === (t = (e = ei(e, n))[0]) || void 0 === t || t.resume()
                    }
                }
            }();

            function ei(e, n) {
                var t = mo(e),
                    r = t.indexOf(n);
                return -1 !== r && t.splice(r, 1), t
            }

            function ni(e, n) {
                if ("function" == typeof e) return e(n);
                null != e && (e.current = n)
            }
            var ti = Symbol("radix.slottable");

            function ri(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === ti
            }
            var oi = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, t) {
                    var r = function(e) {
                            var t = function(e) {
                                    var t = n.forwardRef((function(e, t) {
                                        var r = e.children,
                                            o = xo(e, ["children"]);
                                        if (n.isValidElement(r)) {
                                            var i = function(e) {
                                                    var n, t, r = null === (n = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === n ? void 0 : n.get,
                                                        o = r && "isReactWarning" in r && r.isReactWarning;
                                                    return o ? e.ref : (o = (r = null === (t = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === t ? void 0 : t.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                                }(r),
                                                a = function(e, n) {
                                                    var t = Eo({}, n),
                                                        r = function(r) {
                                                            var o = e[r],
                                                                i = n[r];
                                                            /^on[A-Z]/.test(r) ? o && i ? t[r] = function() {
                                                                i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                            } : o && (t[r] = o) : "style" === r ? t[r] = Eo(Eo({}, o), i) : "className" === r && (t[r] = [o, i].filter(Boolean).join(" "))
                                                        };
                                                    for (var o in n) r(o);
                                                    return Eo(Eo({}, e), t)
                                                }(o, r.props);
                                            return r.type !== n.Fragment && (a.ref = t ? function() {
                                                for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                                                return function(e) {
                                                    var t = !1,
                                                        r = n.map((function(n) {
                                                            var r = ni(n, e);
                                                            return t || "function" != typeof r || (t = !0), r
                                                        }));
                                                    if (t) return function() {
                                                        for (var e = 0; e < r.length; e++) {
                                                            var t = r[e];
                                                            "function" == typeof t ? t() : ni(n[e], null)
                                                        }
                                                    }
                                                }
                                            }(t, i) : i), n.cloneElement(r, a)
                                        }
                                        return n.Children.count(r) > 1 ? n.Children.only(null) : null
                                    }));
                                    return t.displayName = "".concat(e, ".SlotClone"), t
                                }(e),
                                r = n.forwardRef((function(e, r) {
                                    var o = e.children,
                                        i = xo(e, ["children"]),
                                        a = n.Children.toArray(o),
                                        u = a.find(ri);
                                    if (u) {
                                        var c = u.props.children,
                                            l = a.map((function(e) {
                                                return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                            }));
                                        return (0, co.jsx)(t, Eo(Eo({}, i), {}, {
                                            ref: r,
                                            children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                                        }))
                                    }
                                    return (0, co.jsx)(t, Eo(Eo({}, i), {}, {
                                        ref: r,
                                        children: o
                                    }))
                                }));
                            return r.displayName = "".concat(e, ".Slot"), r
                        }("Primitive.".concat(t)),
                        o = n.forwardRef((function(e, n) {
                            var o = e.asChild,
                                i = xo(e, ["asChild"]),
                                a = o ? r : t;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, co.jsx)(a, Eo(Eo({}, i), {}, {
                                ref: n
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(t), Eo(Eo({}, e), {}, Ao({}, t, o))
                }), {}),
                ii = null !== globalThis && void 0 !== globalThis && globalThis.document ? n.useLayoutEffect : function() {},
                ai = n.forwardRef((function(e, t) {
                    var r, o = e.container,
                        a = xo(e, ["container"]),
                        u = yo(n.useState(!1), 2),
                        c = u[0],
                        l = u[1];
                    ii((function() {
                        return l(!0)
                    }), []);
                    var s = o || c && (null === globalThis || void 0 === globalThis || null === (r = globalThis.document) || void 0 === r ? void 0 : r.body);
                    return s ? i().createPortal((0, co.jsx)(oi.div, Eo(Eo({}, a), {}, {
                        ref: t
                    })), s) : null
                }));
            ai.displayName = "Portal";
            var ui = 0;

            function ci() {
                var e = document.createElement("span");
                return e.setAttribute("data-radix-focus-guard", ""), e.tabIndex = 0, e.style.outline = "none", e.style.opacity = "0", e.style.position = "fixed", e.style.pointerEvents = "none", e
            }
            var li = "right-scroll-bar-position",
                si = "width-before-scroll-bar";

            function fi(e, n) {
                return "function" == typeof e ? e(n) : e && (e.current = n), e
            }
            var di = "undefined" != typeof window ? n.useLayoutEffect : n.useEffect,
                pi = new WeakMap;

            function hi(e) {
                return e
            }
            var vi = function(e) {
                var t = e.sideCar,
                    r = io(e, ["sideCar"]);
                if (!t) throw new Error("Sidecar: please provide `sideCar` property to import the right car");
                var o = t.read();
                if (!o) throw new Error("Sidecar medium not found");
                return n.createElement(o, oo({}, r))
            };
            vi.isSideCarExport = !0;
            var gi = function(e) {
                    void 0 === e && (e = {});
                    var n = function(e, n) {
                        void 0 === n && (n = hi);
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
                    return n.options = oo({
                        async: !0,
                        ssr: !1
                    }, e), n
                }(),
                mi = function() {},
                yi = n.forwardRef((function(e, t) {
                    var r = n.useRef(null),
                        o = n.useState({
                            onScrollCapture: mi,
                            onWheelCapture: mi,
                            onTouchMoveCapture: mi
                        }),
                        i = o[0],
                        a = o[1],
                        u = e.forwardProps,
                        c = e.children,
                        l = e.className,
                        s = e.removeScrollBar,
                        f = e.enabled,
                        d = e.shards,
                        p = e.sideCar,
                        h = e.noIsolation,
                        v = e.inert,
                        g = e.allowPinchZoom,
                        m = e.as,
                        y = void 0 === m ? "div" : m,
                        b = e.gapMode,
                        w = io(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = p,
                        E = function(e, t) {
                            var r, o, i, a = (r = t || null, o = function(n) {
                                return e.forEach((function(e) {
                                    return fi(e, n)
                                }))
                            }, (i = (0, n.useState)((function() {
                                return {
                                    value: r,
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
                            return di((function() {
                                var n = pi.get(a);
                                if (n) {
                                    var t = new Set(n),
                                        r = new Set(e),
                                        o = a.current;
                                    t.forEach((function(e) {
                                        r.has(e) || fi(e, null)
                                    })), r.forEach((function(e) {
                                        t.has(e) || fi(e, o)
                                    }))
                                }
                                pi.set(a, e)
                            }), [e]), a
                        }([r, t]),
                        A = oo(oo({}, w), i);
                    return n.createElement(n.Fragment, null, f && n.createElement(S, {
                        sideCar: gi,
                        removeScrollBar: s,
                        shards: d,
                        noIsolation: h,
                        inert: v,
                        setCallbacks: a,
                        allowPinchZoom: !!g,
                        lockRef: r,
                        gapMode: b
                    }), u ? n.cloneElement(n.Children.only(c), oo(oo({}, A), {
                        ref: E
                    })) : n.createElement(y, oo({}, A, {
                        className: l,
                        ref: E
                    }), c))
                }));
            yi.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, yi.classNames = {
                fullWidth: si,
                zeroRight: li
            };
            var bi = function() {
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
                wi = function() {
                    var e, t = (e = bi(), function(t, r) {
                        n.useEffect((function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }), [t && r])
                    });
                    return function(e) {
                        var n = e.styles,
                            r = e.dynamic;
                        return t(n, r), null
                    }
                },
                Si = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                Ei = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                Ai = wi(),
                xi = "data-scroll-locked",
                Ci = function(e, n, t, r) {
                    var o = e.left,
                        i = e.top,
                        a = e.right,
                        u = e.gap;
                    return void 0 === t && (t = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(u, "px ").concat(r, ";\n  }\n  body[").concat(xi, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([n && "position: relative ".concat(r, ";"), "margin" === t && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(u, "px ").concat(r, ";\n    "), "padding" === t && "padding-right: ".concat(u, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(li, " {\n    right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(si, " {\n    margin-right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(li, " .").concat(li, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(si, " .").concat(si, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(xi, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(u, "px;\n  }\n")
                },
                _i = function() {
                    var e = parseInt(document.body.getAttribute(xi) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                ki = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        o = e.gapMode,
                        i = void 0 === o ? "margin" : o;
                    n.useEffect((function() {
                        return document.body.setAttribute(xi, (_i() + 1).toString()),
                            function() {
                                var e = _i() - 1;
                                e <= 0 ? document.body.removeAttribute(xi) : document.body.setAttribute(xi, e.toString())
                            }
                    }), []);
                    var a = n.useMemo((function() {
                        return function(e) {
                            if (void 0 === e && (e = "margin"), "undefined" == typeof window) return Si;
                            var n = function(e) {
                                    var n = window.getComputedStyle(document.body),
                                        t = n["padding" === e ? "paddingLeft" : "marginLeft"],
                                        r = n["padding" === e ? "paddingTop" : "marginTop"],
                                        o = n["padding" === e ? "paddingRight" : "marginRight"];
                                    return [Ei(t), Ei(r), Ei(o)]
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
                    return n.createElement(Ai, {
                        styles: Ci(a, !t, i, r ? "" : "!important")
                    })
                },
                Li = !1;
            if ("undefined" != typeof window) try {
                var Pi = Object.defineProperty({}, "passive", {
                    get: function() {
                        return Li = !0, !0
                    }
                });
                window.addEventListener("test", Pi, Pi), window.removeEventListener("test", Pi, Pi)
            } catch (po) {
                Li = !1
            }
            var Oi = !!Li && {
                    passive: !1
                },
                Ii = function(e, n) {
                    if (!(e instanceof Element)) return !1;
                    var t = window.getComputedStyle(e);
                    return "hidden" !== t[n] && !(t.overflowY === t.overflowX && ! function(e) {
                        return "TEXTAREA" === e.tagName
                    }(e) && "visible" === t[n])
                },
                Ti = function(e, n) {
                    var t = n.ownerDocument,
                        r = n;
                    do {
                        if ("undefined" != typeof ShadowRoot && r instanceof ShadowRoot && (r = r.host), Ri(e, r)) {
                            var o = Ui(e, r);
                            if (o[1] > o[2]) return !0
                        }
                        r = r.parentNode
                    } while (r && r !== t.body);
                    return !1
                },
                Ri = function(e, n) {
                    return "v" === e ? function(e) {
                        return Ii(e, "overflowY")
                    }(n) : function(e) {
                        return Ii(e, "overflowX")
                    }(n)
                },
                Ui = function(e, n) {
                    return "v" === e ? [(t = n).scrollTop, t.scrollHeight, t.clientHeight] : function(e) {
                        return [e.scrollLeft, e.scrollWidth, e.clientWidth]
                    }(n);
                    var t
                },
                Ni = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                Di = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                ji = function(e) {
                    return e && "current" in e ? e.current : e
                },
                Mi = function(e) {
                    return "\n  .block-interactivity-".concat(e, " {pointer-events: none;}\n  .allow-interactivity-").concat(e, " {pointer-events: all;}\n")
                },
                zi = 0,
                Bi = [];

            function Fi(e) {
                for (var n = null; null !== e;) e instanceof ShadowRoot && (n = e.host, e = e.host), e = e.parentNode;
                return n
            }
            var Wi, Vi = (Wi = function(e) {
                    var t = n.useRef([]),
                        r = n.useRef([0, 0]),
                        o = n.useRef(),
                        i = n.useState(zi++)[0],
                        a = n.useState(wi)[0],
                        u = n.useRef(e);
                    n.useEffect((function() {
                        u.current = e
                    }), [e]), n.useEffect((function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(i));
                            var n = function(e, n, t) {
                                if (t || 2 === arguments.length)
                                    for (var r, o = 0, i = n.length; o < i; o++) !r && o in n || (r || (r = Array.prototype.slice.call(n, 0, o)), r[o] = n[o]);
                                return e.concat(r || Array.prototype.slice.call(n))
                            }([e.lockRef.current], (e.shards || []).map(ji), !0).filter(Boolean);
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
                    var c = n.useCallback((function(e, n) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !u.current.allowPinchZoom;
                            var t, i = Ni(e),
                                a = r.current,
                                c = "deltaX" in e ? e.deltaX : a[0] - i[0],
                                l = "deltaY" in e ? e.deltaY : a[1] - i[1],
                                s = e.target,
                                f = Math.abs(c) > Math.abs(l) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var d = Ti(f, s);
                            if (!d) return !0;
                            if (d ? t = f : (t = "v" === f ? "h" : "v", d = Ti(f, s)), !d) return !1;
                            if (!o.current && "changedTouches" in e && (c || l) && (o.current = t), !t) return !0;
                            var p = o.current || t;
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
                                    var p = Ui(e, u),
                                        h = p[0],
                                        v = p[1] - p[2] - i * h;
                                    (h || v) && Ri(e, u) && (f += v, d += h), u = u instanceof ShadowRoot ? u.host : u.parentNode
                                } while (!c && u !== document.body || c && (n.contains(u) || n === u));
                                return (s && (o && Math.abs(f) < 1 || !o && a > f) || !s && (o && Math.abs(d) < 1 || !o && -a > d)) && (l = !0), l
                            }(p, n, e, "h" === p ? c : l, !0)
                        }), []),
                        l = n.useCallback((function(e) {
                            var n = e;
                            if (Bi.length && Bi[Bi.length - 1] === a) {
                                var r = "deltaY" in n ? Di(n) : Ni(n),
                                    o = t.current.filter((function(e) {
                                        return e.name === n.type && (e.target === n.target || n.target === e.shadowParent) && function(e, n) {
                                            return e[0] === n[0] && e[1] === n[1]
                                        }(e.delta, r)
                                    }))[0];
                                if (o && o.should) n.cancelable && n.preventDefault();
                                else if (!o) {
                                    var i = (u.current.shards || []).map(ji).filter(Boolean).filter((function(e) {
                                        return e.contains(n.target)
                                    }));
                                    (i.length > 0 ? c(n, i[0]) : !u.current.noIsolation) && n.cancelable && n.preventDefault()
                                }
                            }
                        }), []),
                        s = n.useCallback((function(e, n, r, o) {
                            var i = {
                                name: e,
                                delta: n,
                                target: r,
                                should: o,
                                shadowParent: Fi(r)
                            };
                            t.current.push(i), setTimeout((function() {
                                t.current = t.current.filter((function(e) {
                                    return e !== i
                                }))
                            }), 1)
                        }), []),
                        f = n.useCallback((function(e) {
                            r.current = Ni(e), o.current = void 0
                        }), []),
                        d = n.useCallback((function(n) {
                            s(n.type, Di(n), n.target, c(n, e.lockRef.current))
                        }), []),
                        p = n.useCallback((function(n) {
                            s(n.type, Ni(n), n.target, c(n, e.lockRef.current))
                        }), []);
                    n.useEffect((function() {
                        return Bi.push(a), e.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", l, Oi), document.addEventListener("touchmove", l, Oi), document.addEventListener("touchstart", f, Oi),
                            function() {
                                Bi = Bi.filter((function(e) {
                                    return e !== a
                                })), document.removeEventListener("wheel", l, Oi), document.removeEventListener("touchmove", l, Oi), document.removeEventListener("touchstart", f, Oi)
                            }
                    }), []);
                    var h = e.removeScrollBar,
                        v = e.inert;
                    return n.createElement(n.Fragment, null, v ? n.createElement(a, {
                        styles: Mi(i)
                    }) : null, h ? n.createElement(ki, {
                        gapMode: e.gapMode
                    }) : null)
                }, gi.useMedium(Wi), vi),
                qi = n.forwardRef((function(e, t) {
                    return n.createElement(yi, oo({}, e, {
                        ref: t,
                        sideCar: Vi
                    }))
                }));
            qi.classNames = yi.classNames;
            var Hi = qi,
                Gi = new WeakMap,
                Ki = new WeakMap,
                Qi = {},
                $i = 0,
                Yi = function e(n) {
                    return n && (n.host || e(n.parentNode))
                },
                Xi = function(e, n, t) {
                    void 0 === t && (t = "data-aria-hidden");
                    var r = Array.from(Array.isArray(e) ? e : [e]),
                        o = n || function(e) {
                            return "undefined" == typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body
                        }(e);
                    return o ? (r.push.apply(r, Array.from(o.querySelectorAll("[aria-live]"))), function(e, n, t, r) {
                        var o = function(e, n) {
                            return n.map((function(n) {
                                if (e.contains(n)) return n;
                                var t = Yi(n);
                                return t && e.contains(t) ? t : (console.error("aria-hidden", n, "in not contained inside", e, ". Doing nothing"), null)
                            })).filter((function(e) {
                                return Boolean(e)
                            }))
                        }(n, Array.isArray(e) ? e : [e]);
                        Qi[t] || (Qi[t] = new WeakMap);
                        var i = Qi[t],
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
                                            l = (Gi.get(n) || 0) + 1,
                                            s = (i.get(n) || 0) + 1;
                                        Gi.set(n, l), i.set(n, s), a.push(n), 1 === l && c && Ki.set(n, !0), 1 === s && n.setAttribute(t, "true"), c || n.setAttribute(r, "true")
                                    } catch (o) {
                                        console.error("aria-hidden: cannot operate on ", n, o)
                                    }
                                }))
                            }(n), u.clear(), $i++,
                            function() {
                                a.forEach((function(e) {
                                    var n = Gi.get(e) - 1,
                                        o = i.get(e) - 1;
                                    Gi.set(e, n), i.set(e, o), n || (Ki.has(e) || e.removeAttribute(r), Ki.delete(e)), o || e.removeAttribute(t)
                                })), --$i || (Gi = new WeakMap, Gi = new WeakMap, Ki = new WeakMap, Qi = {})
                            }
                    }(r, o, t, "aria-hidden")) : function() {
                        return null
                    }
                };

            function Zi(e) {
                return function(e) {
                    if (Array.isArray(e)) return ta(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || na(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Ji(e, n) {
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

            function ea(e, n) {
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
                }(e, n) || na(e, n) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function na(e, n) {
                if (e) {
                    if ("string" == typeof e) return ta(e, n);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t ? Array.from(e) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? ta(e, n) : void 0
                }
            }

            function ta(e, n) {
                (null == n || n > e.length) && (n = e.length);
                for (var t = 0, r = new Array(n); t < n; t++) r[t] = e[t];
                return r
            }

            function ra(e, n) {
                var t = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    n && (r = r.filter((function(n) {
                        return Object.getOwnPropertyDescriptor(e, n).enumerable
                    }))), t.push.apply(t, r)
                }
                return t
            }

            function oa(e) {
                for (var n = 1; n < arguments.length; n++) {
                    var t = null != arguments[n] ? arguments[n] : {};
                    n % 2 ? ra(Object(t), !0).forEach((function(n) {
                        ia(e, n, t[n])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : ra(Object(t)).forEach((function(n) {
                        Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                    }))
                }
                return e
            }

            function ia(e, n, t) {
                return n in e ? Object.defineProperty(e, n, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[n] = t, e
            }

            function aa(e, n) {
                var t = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    r = void 0 === t || t;
                return function(t) {
                    if (null != e && e(t), !1 === r || !t.defaultPrevented) return null == n ? void 0 : n(t)
                }
            }

            function ua(e, n) {
                if ("function" == typeof e) return e(n);
                null != e && (e.current = n)
            }

            function ca() {
                for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                return function(e) {
                    var t = !1,
                        r = n.map((function(n) {
                            var r = ua(n, e);
                            return t || "function" != typeof r || (t = !0), r
                        }));
                    if (t) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var t = r[e];
                            "function" == typeof t ? t() : ua(n[e], null)
                        }
                    }
                }
            }

            function la() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return n.useCallback(ca.apply(void 0, t), t)
            }

            function sa() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var o = t[0];
                if (1 === t.length) return o;
                var i = function() {
                    var e = t.map((function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    }));
                    return function(t) {
                        var r = e.reduce((function(e, n) {
                            var r = n.useScope,
                                o = n.scopeName;
                            return oa(oa({}, e), r(t)["__scope".concat(o)])
                        }), {});
                        return n.useMemo((function() {
                            return ia({}, "__scope".concat(o.scopeName), r)
                        }), [r])
                    }
                };
                return i.scopeName = o.scopeName, i
            }

            function fa(e) {
                var t = n.useRef(e);
                return n.useEffect((function() {
                    t.current = e
                })), n.useMemo((function() {
                    return function() {
                        for (var e, n = arguments.length, r = new Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                        return null === (e = t.current) || void 0 === e ? void 0 : e.call.apply(e, [t].concat(r))
                    }
                }), [])
            }
            var da = null !== globalThis && void 0 !== globalThis && globalThis.document ? n.useLayoutEffect : function() {},
                pa = function(e) {
                    var t = e.present,
                        r = e.children,
                        o = function(e) {
                            var t = ea(n.useState(), 2),
                                r = t[0],
                                o = t[1],
                                i = n.useRef({}),
                                a = n.useRef(e),
                                u = n.useRef("none"),
                                c = function(e, t) {
                                    return n.useReducer((function(e, n) {
                                        var r;
                                        return null !== (r = t[e][n]) && void 0 !== r ? r : e
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
                                l = ea(c, 2),
                                s = l[0],
                                f = l[1];
                            return n.useEffect((function() {
                                var e = ha(i.current);
                                u.current = "mounted" === s ? e : "none"
                            }), [s]), da((function() {
                                var n = i.current,
                                    t = a.current;
                                if (t !== e) {
                                    var r = u.current,
                                        o = ha(n);
                                    e ? f("MOUNT") : "none" === o || "none" === (null == n ? void 0 : n.display) ? f("UNMOUNT") : f(t && r !== o ? "ANIMATION_OUT" : "UNMOUNT"), a.current = e
                                }
                            }), [e, f]), da((function() {
                                if (r) {
                                    var e, n, t = null !== (e = r.ownerDocument.defaultView) && void 0 !== e ? e : window,
                                        o = function(e) {
                                            var o = ha(i.current).includes(e.animationName);
                                            if (e.target === r && o && (f("ANIMATION_END"), !a.current)) {
                                                var u = r.style.animationFillMode;
                                                r.style.animationFillMode = "forwards", n = t.setTimeout((function() {
                                                    "forwards" === r.style.animationFillMode && (r.style.animationFillMode = u)
                                                }))
                                            }
                                        },
                                        c = function(e) {
                                            e.target === r && (u.current = ha(i.current))
                                        };
                                    return r.addEventListener("animationstart", c), r.addEventListener("animationcancel", o), r.addEventListener("animationend", o),
                                        function() {
                                            t.clearTimeout(n), r.removeEventListener("animationstart", c), r.removeEventListener("animationcancel", o), r.removeEventListener("animationend", o)
                                        }
                                }
                                f("ANIMATION_END")
                            }), [r, f]), {
                                isPresent: ["mounted", "unmountSuspended"].includes(s),
                                ref: n.useCallback((function(e) {
                                    e && (i.current = getComputedStyle(e)), o(e)
                                }), [])
                            }
                        }(t),
                        i = "function" == typeof r ? r({
                            present: o.isPresent
                        }) : n.Children.only(r),
                        a = la(o.ref, function(e) {
                            var n, t, r = null === (n = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === n ? void 0 : n.get,
                                o = r && "isReactWarning" in r && r.isReactWarning;
                            return o ? e.ref : (o = (r = null === (t = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === t ? void 0 : t.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                        }(i));
                    return "function" == typeof r || o.isPresent ? n.cloneElement(i, {
                        ref: a
                    }) : null
                };

            function ha(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function va(e) {
                var t = function(e) {
                        var t = n.forwardRef((function(e, t) {
                            var r = e.children,
                                o = Ji(e, ["children"]);
                            if (n.isValidElement(r)) {
                                var i = function(e) {
                                        var n, t, r = null === (n = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === n ? void 0 : n.get,
                                            o = r && "isReactWarning" in r && r.isReactWarning;
                                        return o ? e.ref : (o = (r = null === (t = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === t ? void 0 : t.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                    }(r),
                                    a = function(e, n) {
                                        var t = oa({}, n),
                                            r = function(r) {
                                                var o = e[r],
                                                    i = n[r];
                                                /^on[A-Z]/.test(r) ? o && i ? t[r] = function() {
                                                    i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                } : o && (t[r] = o) : "style" === r ? t[r] = oa(oa({}, o), i) : "className" === r && (t[r] = [o, i].filter(Boolean).join(" "))
                                            };
                                        for (var o in n) r(o);
                                        return oa(oa({}, e), t)
                                    }(o, r.props);
                                return r.type !== n.Fragment && (a.ref = t ? ca(t, i) : i), n.cloneElement(r, a)
                            }
                            return n.Children.count(r) > 1 ? n.Children.only(null) : null
                        }));
                        return t.displayName = "".concat(e, ".SlotClone"), t
                    }(e),
                    r = n.forwardRef((function(e, r) {
                        var o = e.children,
                            i = Ji(e, ["children"]),
                            a = n.Children.toArray(o),
                            u = a.find(ma);
                        if (u) {
                            var c = u.props.children,
                                l = a.map((function(e) {
                                    return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                }));
                            return (0, co.jsx)(t, oa(oa({}, i), {}, {
                                ref: r,
                                children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                            }))
                        }
                        return (0, co.jsx)(t, oa(oa({}, i), {}, {
                            ref: r,
                            children: o
                        }))
                    }));
                return r.displayName = "".concat(e, ".Slot"), r
            }
            pa.displayName = "Presence";
            var ga = Symbol("radix.slottable");

            function ma(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === ga
            }
            var ya = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, t) {
                    var r = va("Primitive.".concat(t)),
                        o = n.forwardRef((function(e, n) {
                            var o = e.asChild,
                                i = Ji(e, ["asChild"]),
                                a = o ? r : t;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, co.jsx)(a, oa(oa({}, i), {}, {
                                ref: n
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(t), oa(oa({}, e), {}, ia({}, t, o))
                }), {}),
                ba = "Dialog",
                wa = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var t = r.map((function(e) {
                                return n.createContext(e)
                            }));
                            return function(r) {
                                var o = (null == r ? void 0 : r[e]) || t;
                                return n.useMemo((function() {
                                    return ia({}, "__scope".concat(e), oa(oa({}, r), {}, ia({}, e, o)))
                                }), [r, o])
                            }
                        };
                    return o.scopeName = e, [function(t, o) {
                        var i = n.createContext(o),
                            a = r.length;
                        r = [].concat(Zi(r), [o]);
                        var u = function(t) {
                            var r, o = t.scope,
                                u = t.children,
                                c = Ji(t, ["scope", "children"]),
                                l = (null == o || null === (r = o[e]) || void 0 === r ? void 0 : r[a]) || i,
                                s = n.useMemo((function() {
                                    return c
                                }), Object.values(c));
                            return (0, co.jsx)(l.Provider, {
                                value: s,
                                children: u
                            })
                        };
                        return u.displayName = t + "Provider", [u, function(r, u) {
                            var c, l = (null == u || null === (c = u[e]) || void 0 === c ? void 0 : c[a]) || i,
                                s = n.useContext(l);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw new Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, sa.apply(void 0, [o].concat(Zi(t)))]
                }(ba),
                Sa = ea(wa, 2),
                Ea = Sa[0],
                Aa = (Sa[1], ea(Ea(ba), 2)),
                xa = Aa[0],
                Ca = Aa[1],
                _a = function(e) {
                    var t = e.__scopeDialog,
                        r = e.children,
                        o = e.open,
                        i = e.defaultOpen,
                        a = e.onOpenChange,
                        u = e.modal,
                        c = void 0 === u || u,
                        l = n.useRef(null),
                        s = n.useRef(null),
                        f = function(e) {
                            var t = e.prop,
                                r = e.defaultProp,
                                o = e.onChange,
                                i = void 0 === o ? function() {} : o,
                                a = function(e) {
                                    var t = e.defaultProp,
                                        r = e.onChange,
                                        o = n.useState(t),
                                        i = ea(o, 1)[0],
                                        a = n.useRef(i),
                                        u = fa(r);
                                    return n.useEffect((function() {
                                        a.current !== i && (u(i), a.current = i)
                                    }), [i, a, u]), o
                                }({
                                    defaultProp: r,
                                    onChange: i
                                }),
                                u = ea(a, 2),
                                c = u[0],
                                l = u[1],
                                s = void 0 !== t,
                                f = s ? t : c,
                                d = fa(i);
                            return [f, n.useCallback((function(e) {
                                if (s) {
                                    var n = "function" == typeof e ? e(t) : e;
                                    n !== t && d(n)
                                } else l(e)
                            }), [s, t, l, d])]
                        }({
                            prop: o,
                            defaultProp: i,
                            onChange: a
                        }),
                        d = ea(f, 2),
                        p = d[0],
                        h = void 0 !== p && p,
                        v = d[1];
                    return (0, co.jsx)(xa, {
                        scope: t,
                        triggerRef: l,
                        contentRef: s,
                        contentId: vo(),
                        titleId: vo(),
                        descriptionId: vo(),
                        open: h,
                        onOpenChange: v,
                        onOpenToggle: n.useCallback((function() {
                            return v((function(e) {
                                return !e
                            }))
                        }), [v]),
                        modal: c,
                        children: r
                    })
                };
            _a.displayName = ba;
            var ka = "DialogTrigger",
                La = n.forwardRef((function(e, n) {
                    var t = e.__scopeDialog,
                        r = Ji(e, ["__scopeDialog"]),
                        o = Ca(ka, t),
                        i = la(n, o.triggerRef);
                    return (0, co.jsx)(ya.button, oa(oa({
                        type: "button",
                        "aria-haspopup": "dialog",
                        "aria-expanded": o.open,
                        "aria-controls": o.contentId,
                        "data-state": $a(o.open)
                    }, r), {}, {
                        ref: i,
                        onClick: aa(e.onClick, o.onOpenToggle)
                    }))
                }));
            La.displayName = ka;
            var Pa = "DialogPortal",
                Oa = ea(Ea(Pa, {
                    forceMount: void 0
                }), 2),
                Ia = Oa[0],
                Ta = Oa[1],
                Ra = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        o = e.children,
                        i = e.container,
                        a = Ca(Pa, t);
                    return (0, co.jsx)(Ia, {
                        scope: t,
                        forceMount: r,
                        children: n.Children.map(o, (function(e) {
                            return (0, co.jsx)(pa, {
                                present: r || a.open,
                                children: (0, co.jsx)(ai, {
                                    asChild: !0,
                                    container: i,
                                    children: e
                                })
                            })
                        }))
                    })
                };
            Ra.displayName = Pa;
            var Ua = "DialogOverlay",
                Na = n.forwardRef((function(e, n) {
                    var t = Ta(Ua, e.__scopeDialog),
                        r = e.forceMount,
                        o = void 0 === r ? t.forceMount : r,
                        i = Ji(e, ["forceMount"]),
                        a = Ca(Ua, e.__scopeDialog);
                    return a.modal ? (0, co.jsx)(pa, {
                        present: o || a.open,
                        children: (0, co.jsx)(ja, oa(oa({}, i), {}, {
                            ref: n
                        }))
                    }) : null
                }));
            Na.displayName = Ua;
            var Da = va("DialogOverlay.RemoveScroll"),
                ja = n.forwardRef((function(e, n) {
                    var t = e.__scopeDialog,
                        r = Ji(e, ["__scopeDialog"]),
                        o = Ca(Ua, t);
                    return (0, co.jsx)(Hi, {
                        as: Da,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, co.jsx)(ya.div, oa(oa({
                            "data-state": $a(o.open)
                        }, r), {}, {
                            ref: n,
                            style: oa({
                                pointerEvents: "auto"
                            }, r.style)
                        }))
                    })
                })),
                Ma = "DialogContent",
                za = n.forwardRef((function(e, n) {
                    var t = Ta(Ma, e.__scopeDialog),
                        r = e.forceMount,
                        o = void 0 === r ? t.forceMount : r,
                        i = Ji(e, ["forceMount"]),
                        a = Ca(Ma, e.__scopeDialog);
                    return (0, co.jsx)(pa, {
                        present: o || a.open,
                        children: a.modal ? (0, co.jsx)(Ba, oa(oa({}, i), {}, {
                            ref: n
                        })) : (0, co.jsx)(Fa, oa(oa({}, i), {}, {
                            ref: n
                        }))
                    })
                }));
            za.displayName = Ma;
            var Ba = n.forwardRef((function(e, t) {
                    var r = Ca(Ma, e.__scopeDialog),
                        o = n.useRef(null),
                        i = la(t, r.contentRef, o);
                    return n.useEffect((function() {
                        var e = o.current;
                        if (e) return Xi(e)
                    }), []), (0, co.jsx)(Wa, oa(oa({}, e), {}, {
                        ref: i,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: aa(e.onCloseAutoFocus, (function(e) {
                            var n;
                            e.preventDefault(), null === (n = r.triggerRef.current) || void 0 === n || n.focus()
                        })),
                        onPointerDownOutside: aa(e.onPointerDownOutside, (function(e) {
                            var n = e.detail.originalEvent,
                                t = 0 === n.button && !0 === n.ctrlKey;
                            (2 === n.button || t) && e.preventDefault()
                        })),
                        onFocusOutside: aa(e.onFocusOutside, (function(e) {
                            return e.preventDefault()
                        }))
                    }))
                })),
                Fa = n.forwardRef((function(e, t) {
                    var r = Ca(Ma, e.__scopeDialog),
                        o = n.useRef(!1),
                        i = n.useRef(!1);
                    return (0, co.jsx)(Wa, oa(oa({}, e), {}, {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(n) {
                            var t, a;
                            null !== (t = e.onCloseAutoFocus) && void 0 !== t && t.call(e, n), n.defaultPrevented || (o.current || null !== (a = r.triggerRef.current) && void 0 !== a && a.focus(), n.preventDefault()), o.current = !1, i.current = !1
                        },
                        onInteractOutside: function(n) {
                            var t, a;
                            null !== (t = e.onInteractOutside) && void 0 !== t && t.call(e, n), n.defaultPrevented || (o.current = !0, "pointerdown" === n.detail.originalEvent.type && (i.current = !0));
                            var u = n.target;
                            (null === (a = r.triggerRef.current) || void 0 === a ? void 0 : a.contains(u)) && n.preventDefault(), "focusin" === n.detail.originalEvent.type && i.current && n.preventDefault()
                        }
                    }))
                })),
                Wa = n.forwardRef((function(e, t) {
                    var r = e.__scopeDialog,
                        o = e.trapFocus,
                        i = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        u = Ji(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        c = Ca(Ma, r),
                        l = n.useRef(null),
                        s = la(t, l);
                    return n.useEffect((function() {
                        var e, n, t = document.querySelectorAll("[data-radix-focus-guard]");
                        return document.body.insertAdjacentElement("afterbegin", null !== (e = t[0]) && void 0 !== e ? e : ci()), document.body.insertAdjacentElement("beforeend", null !== (n = t[1]) && void 0 !== n ? n : ci()), ui++,
                            function() {
                                1 === ui && document.querySelectorAll("[data-radix-focus-guard]").forEach((function(e) {
                                    return e.remove()
                                })), ui--
                            }
                    }), []), (0, co.jsxs)(co.Fragment, {
                        children: [(0, co.jsx)(Qo, {
                            asChild: !0,
                            loop: !0,
                            trapped: o,
                            onMountAutoFocus: i,
                            onUnmountAutoFocus: a,
                            children: (0, co.jsx)(Do, oa(oa({
                                role: "dialog",
                                id: c.contentId,
                                "aria-describedby": c.descriptionId,
                                "aria-labelledby": c.titleId,
                                "data-state": $a(c.open)
                            }, u), {}, {
                                ref: s,
                                onDismiss: function() {
                                    return c.onOpenChange(!1)
                                }
                            }))
                        }), (0, co.jsxs)(co.Fragment, {
                            children: [(0, co.jsx)(eu, {
                                titleId: c.titleId
                            }), (0, co.jsx)(nu, {
                                contentRef: l,
                                descriptionId: c.descriptionId
                            })]
                        })]
                    })
                })),
                Va = "DialogTitle",
                qa = n.forwardRef((function(e, n) {
                    var t = e.__scopeDialog,
                        r = Ji(e, ["__scopeDialog"]),
                        o = Ca(Va, t);
                    return (0, co.jsx)(ya.h2, oa(oa({
                        id: o.titleId
                    }, r), {}, {
                        ref: n
                    }))
                }));
            qa.displayName = Va;
            var Ha = "DialogDescription",
                Ga = n.forwardRef((function(e, n) {
                    var t = e.__scopeDialog,
                        r = Ji(e, ["__scopeDialog"]),
                        o = Ca(Ha, t);
                    return (0, co.jsx)(ya.p, oa(oa({
                        id: o.descriptionId
                    }, r), {}, {
                        ref: n
                    }))
                }));
            Ga.displayName = Ha;
            var Ka = "DialogClose",
                Qa = n.forwardRef((function(e, n) {
                    var t = e.__scopeDialog,
                        r = Ji(e, ["__scopeDialog"]),
                        o = Ca(Ka, t);
                    return (0, co.jsx)(ya.button, oa(oa({
                        type: "button"
                    }, r), {}, {
                        ref: n,
                        onClick: aa(e.onClick, (function() {
                            return o.onOpenChange(!1)
                        }))
                    }))
                }));

            function $a(e) {
                return e ? "open" : "closed"
            }
            Qa.displayName = Ka;
            var Ya = "DialogTitleWarning",
                Xa = function(e, t) {
                    var r = n.createContext(t),
                        o = function(e) {
                            var t = e.children,
                                o = Ji(e, ["children"]),
                                i = n.useMemo((function() {
                                    return o
                                }), Object.values(o));
                            return (0, co.jsx)(r.Provider, {
                                value: i,
                                children: t
                            })
                        };
                    return o.displayName = e + "Provider", [o, function(o) {
                        var i = n.useContext(r);
                        if (i) return i;
                        if (void 0 !== t) return t;
                        throw new Error("`".concat(o, "` must be used within `").concat(e, "`"))
                    }]
                }(Ya, {
                    contentName: Ma,
                    titleName: Va,
                    docsSlug: "dialog"
                }),
                Za = ea(Xa, 2),
                Ja = (Za[0], Za[1]),
                eu = function(e) {
                    var t = e.titleId,
                        r = Ja(Ya),
                        o = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return n.useEffect((function() {
                        t && (document.getElementById(t) || console.error(o))
                    }), [o, t]), null
                },
                nu = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(Ja("DialogDescriptionWarning").contentName, "}.");
                    return n.useEffect((function() {
                        var e, n = null === (e = t.current) || void 0 === e ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(o))
                    }), [o, t, r]), null
                },
                tu = _a,
                ru = Ra,
                ou = Na,
                iu = za,
                au = qa,
                uu = Qa;

            function cu(e, n) {
                void 0 === n && (n = {});
                var t = n.insertAt;
                if (e && "undefined" != typeof document) {
                    var r = document.head || document.getElementsByTagName("head")[0],
                        o = document.createElement("style");
                    o.type = "text/css", "top" === t && r.firstChild ? r.insertBefore(o, r.firstChild) : r.appendChild(o), o.styleSheet ? o.styleSheet.cssText = e : o.appendChild(document.createTextNode(e))
                }
            }
            cu(".bg-common-backdrop{background-color:var(--color-common-backdrop)}:root{--alpha-color-shadow-subtle:rgba(0,0,0,.08)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}@media (prefers-color-scheme:dark){:root{--alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.light-theme,:root{--alpha-color-shadow-subtle:rgba(0,0,0,.08);--fui-future-alpha-color-shadow-subtle:rgba(0,0,0,.08);--fui-future-alpha-color-system-progress:#335fff}.dark-theme{--alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}.system-theme{--alpha-color-shadow-subtle:rgba(0,0,0,.08);--fui-future-alpha-color-shadow-subtle:rgba(0,0,0,.08);--fui-future-alpha-color-system-progress:#335fff}@media (prefers-color-scheme:dark){.system-theme{--alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}:root .stroke-contrast-alpha{border-color:rgba(208,217,251,.4)}}:is(:root,.light-theme) .stroke-contrast-alpha{border-color:rgba(27,37,75,.5)}.dark-theme .stroke-contrast-alpha{border-color:rgba(208,217,251,.4)}.system-theme .stroke-contrast-alpha{border-color:rgba(27,37,75,.5)}@media (prefers-color-scheme:dark){.system-theme .stroke-contrast-alpha{border-color:rgba(208,217,251,.4)}}");
            var lu = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]"
                },
                su = r().forwardRef((function(e, n) {
                    var t = e.name,
                        o = e.size,
                        i = void 0 === o ? "Medium" : o,
                        a = e.className;
                    e.children;
                    var u = io(e, ["name", "size", "className", "children"]);
                    return r().createElement("span", oo({
                        ref: n,
                        role: "presentation",
                        className: uo("grow-0 shrink-0 basis-auto icon", t, lu[i], a)
                    }, u))
                }));
            su.displayName = "Icon";
            var fu = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                du = function() {
                    return r().createElement("div", {
                        role: "presentation",
                        className: "absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none"
                    })
                },
                pu = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                hu = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                vu = function(e) {
                    var n = e.variant,
                        t = e.size,
                        o = e.isCircular,
                        i = e.className,
                        a = io(e, ["variant", "size", "isCircular", "className"]);
                    return r().createElement("button", oo({
                        type: "button",
                        className: uo("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", fu, hu[n], pu[t], o && "radius-circle", i)
                    }, a), r().createElement(du, null), r().createElement(su, {
                        name: "icon-regular-x",
                        size: t
                    }))
                };

            function gu(e, n) {
                var t = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    n && (r = r.filter((function(n) {
                        return Object.getOwnPropertyDescriptor(e, n).enumerable
                    }))), t.push.apply(t, r)
                }
                return t
            }

            function mu(e) {
                for (var n = 1; n < arguments.length; n++) {
                    var t = null != arguments[n] ? arguments[n] : {};
                    n % 2 ? gu(Object(t), !0).forEach((function(n) {
                        yu(e, n, t[n])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : gu(Object(t)).forEach((function(n) {
                        Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                    }))
                }
                return e
            }

            function yu(e, n, t) {
                return n in e ? Object.defineProperty(e, n, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[n] = t, e
            }

            function bu(e, n) {
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

            function wu(e, n) {
                if ("function" == typeof e) return e(n);
                null != e && (e.current = n)
            }
            var Su = Symbol("radix.slottable");

            function Eu(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === Su
            }
            var Au = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((function(e, t) {
                    var r = function(e) {
                            var t = function(e) {
                                    var t = n.forwardRef((function(e, t) {
                                        var r = e.children,
                                            o = bu(e, ["children"]);
                                        if (n.isValidElement(r)) {
                                            var i = function(e) {
                                                    var n, t, r = null === (n = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === n ? void 0 : n.get,
                                                        o = r && "isReactWarning" in r && r.isReactWarning;
                                                    return o ? e.ref : (o = (r = null === (t = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === t ? void 0 : t.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                                }(r),
                                                a = function(e, n) {
                                                    var t = mu({}, n),
                                                        r = function(r) {
                                                            var o = e[r],
                                                                i = n[r];
                                                            /^on[A-Z]/.test(r) ? o && i ? t[r] = function() {
                                                                var e = i.apply(void 0, arguments);
                                                                return o.apply(void 0, arguments), e
                                                            } : o && (t[r] = o) : "style" === r ? t[r] = mu(mu({}, o), i) : "className" === r && (t[r] = [o, i].filter(Boolean).join(" "))
                                                        };
                                                    for (var o in n) r(o);
                                                    return mu(mu({}, e), t)
                                                }(o, r.props);
                                            return r.type !== n.Fragment && (a.ref = t ? function() {
                                                for (var e = arguments.length, n = new Array(e), t = 0; t < e; t++) n[t] = arguments[t];
                                                return function(e) {
                                                    var t = !1,
                                                        r = n.map((function(n) {
                                                            var r = wu(n, e);
                                                            return t || "function" != typeof r || (t = !0), r
                                                        }));
                                                    if (t) return function() {
                                                        for (var e = 0; e < r.length; e++) {
                                                            var t = r[e];
                                                            "function" == typeof t ? t() : wu(n[e], null)
                                                        }
                                                    }
                                                }
                                            }(t, i) : i), n.cloneElement(r, a)
                                        }
                                        return n.Children.count(r) > 1 ? n.Children.only(null) : null
                                    }));
                                    return t.displayName = "".concat(e, ".SlotClone"), t
                                }(e),
                                r = n.forwardRef((function(e, r) {
                                    var o = e.children,
                                        i = bu(e, ["children"]),
                                        a = n.Children.toArray(o),
                                        u = a.find(Eu);
                                    if (u) {
                                        var c = u.props.children,
                                            l = a.map((function(e) {
                                                return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                            }));
                                        return (0, co.jsx)(t, mu(mu({}, i), {}, {
                                            ref: r,
                                            children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                                        }))
                                    }
                                    return (0, co.jsx)(t, mu(mu({}, i), {}, {
                                        ref: r,
                                        children: o
                                    }))
                                }));
                            return r.displayName = "".concat(e, ".Slot"), r
                        }("Primitive.".concat(t)),
                        o = n.forwardRef((function(e, n) {
                            var o = e.asChild,
                                i = bu(e, ["asChild"]),
                                a = o ? r : t;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, co.jsx)(a, mu(mu({}, i), {}, {
                                ref: n
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(t), mu(mu({}, e), {}, yu({}, t, o))
                }), {}),
                xu = Object.freeze({
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
                Cu = n.forwardRef((function(e, n) {
                    return (0, co.jsx)(Au.span, mu(mu({}, e), {}, {
                        ref: n,
                        style: mu(mu({}, xu), e.style)
                    }))
                }));
            Cu.displayName = "VisuallyHidden", cu(".foundation-web-dialog-overlay{bottom:0;display:grid;left:0;overflow-y:auto;place-items:center;position:fixed;right:0;top:0}.foundation-web-dialog-close-container{right:var(--size-300);top:var(--size-300);z-index:1}.foundation-web-dialog-hero-media{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:calc(var(--stroke-standard)*-1);margin-right:calc(var(--stroke-standard)*-1);margin-top:calc(var(--stroke-standard)*-1);overflow:clip}.foundation-web-dialog-content[data-size=Small]{max-width:calc(var(--size-100)*80);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Medium]{max-width:calc(var(--size-100)*120);min-width:calc(var(--size-100)*94)}.foundation-web-dialog-content[data-size=Large]{max-width:calc(var(--size-100)*160);min-width:calc(var(--size-100)*94)}");
            var _u = (0, n.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    type: "Default"
                }),
                ku = function() {
                    var e = (0, n.useContext)(_u);
                    if (!e) throw new Error("Dialog components must be used within a Dialog");
                    return e
                },
                Lu = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                Pu = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                Ou = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                Iu = function(e) {
                    var t = e.open,
                        o = e.onOpenChange,
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
                        g = e.experimentalDisablePointerEventsStylingOnBody,
                        m = void 0 !== g && g,
                        y = (0, n.useMemo)((function() {
                            return {
                                size: a,
                                isModal: l,
                                type: c,
                                hasCloseAffordance: s,
                                closeLabel: f,
                                hasMarginTop: p,
                                hasMarginBottom: v
                            }
                        }), [a, l, c, s, f, p, v]);
                    return (0, n.useEffect)((function() {
                        m && setTimeout((function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }), 0)
                    }), [m, t]), r().createElement(_u.Provider, {
                        value: y
                    }, r().createElement(tu, {
                        open: t,
                        onOpenChange: o
                    }, i))
                };
            Iu.displayName = "Dialog";
            var Tu = function(e) {
                var n = e.children,
                    t = e.className,
                    o = e.overlayClassName,
                    i = io(e, ["children", "className", "overlayClassName"]),
                    a = ku(),
                    u = a.size,
                    c = a.isModal,
                    l = a.hasCloseAffordance,
                    s = a.closeLabel,
                    f = uo("foundation-web-dialog-overlay padding-y-medium foundation-web-portal-zindex", c && "bg-common-backdrop", o),
                    d = uo("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", t);
                return r().createElement(ru, null, r().createElement(ou, {
                    className: f
                }, r().createElement(iu, oo({
                    className: d,
                    "data-size": u
                }, i), l && r().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, r().createElement(uu, {
                    asChild: !0
                }, r().createElement(vu, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": s
                }))), n)))
            };
            Tu.displayName = "DialogContent";
            var Ru = function(e) {
                var n = e.children,
                    t = e.className,
                    o = io(e, ["children", "className"]),
                    i = ku(),
                    a = i.size,
                    u = i.hasMarginTop,
                    c = i.hasMarginBottom,
                    l = uo(Lu[a], u && Pu[a], c && Ou[a], t);
                return r().createElement("div", oo({
                    className: l
                }, o), n)
            };
            Ru.displayName = "DialogBody";
            var Uu = function(e) {
                var n = e.children,
                    t = e.className,
                    o = e.hidden,
                    i = io(e, ["children", "className", "hidden"]),
                    a = r().createElement(au, oo({
                        className: t
                    }, i), n);
                return o ? r().createElement(Cu, null, a) : a
            };
            Uu.displayName = "DialogTitle";
            var Nu = function(e) {
                var n = e.children,
                    t = e.className,
                    o = io(e, ["children", "className"]),
                    i = ku().size,
                    a = uo(Lu[i], Ou[i], t);
                return r().createElement("div", oo({
                    className: a
                }, o), n)
            };
            Nu.displayName = "DialogFooter";
            var Du = "opacity-[0.5]";
            cu("@keyframes rotation{0%{transform:rotate(0deg)}to{transform:rotate(359deg)}}.foundation-web-loading-spinner{animation:rotation 1s linear infinite normal}");
            var ju = function(e) {
                    var n = e.width,
                        t = e.height;
                    return r().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: n,
                        height: t,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, r().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                Mu = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                zu = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-large"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                Bu = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"],
                    Alert: ["bg-action-alert", "content-action-alert"]
                },
                Fu = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"],
                    Alert: ["bg-action-standard", "content-action-standard"]
                },
                Wu = (0, n.forwardRef)((function(e, n) {
                    var t = e.children,
                        o = e.className,
                        i = e.style,
                        a = e.isDisabled,
                        u = void 0 !== a && a,
                        c = e.isLoading,
                        l = void 0 !== c && c,
                        s = e.size,
                        f = void 0 === s ? "Large" : s,
                        d = e.variant,
                        p = void 0 === d ? "Emphasis" : d,
                        h = io(e, ["children", "className", "style", "isDisabled", "isLoading", "size", "variant"]),
                        v = uo("foundation-web-button", u ? Du : [fu, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", zu[f], u ? Fu[p] : Bu[p], o),
                        g = r().createElement(r().Fragment, null, r().createElement(du, null), l && r().createElement("div", {
                            "aria-hidden": "true",
                            className: "absolute flex"
                        }, r().createElement(ju, {
                            width: Mu[f],
                            height: Mu[f]
                        })), r().createElement("span", {
                            className: uo("padding-y-xsmall text-truncate-end text-no-wrap", l && "invisible")
                        }, t)),
                        m = oo({
                            textDecoration: "none"
                        }, i);
                    if ("a" === h.as) {
                        h.as;
                        var y = h.href,
                            b = io(h, ["as", "href"]);
                        return r().createElement("a", oo({
                            ref: n
                        }, b, {
                            "aria-disabled": u,
                            href: u ? void 0 : y,
                            className: v,
                            style: m
                        }), g)
                    }
                    h.as;
                    var w = io(h, ["as"]);
                    return r().createElement("button", oo({
                        ref: n,
                        type: "button"
                    }, w, {
                        disabled: u,
                        className: v,
                        style: m
                    }), g)
                })),
                Vu = function(e) {
                    var n = e.isOpen,
                        t = e.onClose,
                        o = e.translate;
                    return r().createElement(Iu, {
                        open: n,
                        isModal: !0,
                        size: "Small",
                        type: "Default",
                        hasCloseAffordance: !1
                    }, r().createElement(Tu, null, r().createElement(Ru, {
                        className: "flex flex-col gap-xsmall"
                    }, r().createElement(Uu, {
                        className: "text-heading-small content-emphasis"
                    }, o(P.HeaderLinkExpired)), r().createElement("p", {
                        className: "text-body-medium content-default"
                    }, o(P.DescriptionLinkExpired))), r().createElement(Nu, {
                        className: "flex flex-col padding-top-medium"
                    }, r().createElement(Wu, {
                        variant: "Emphasis",
                        size: "Medium",
                        onClick: t
                    }, o(P.ActionOk)))))
                },
                qu = function() {
                    return qu = Object.assign || function(e) {
                        for (var n, t = 1, r = arguments.length; t < r; t++)
                            for (var o in n = arguments[t]) Object.prototype.hasOwnProperty.call(n, o) && (e[o] = n[o]);
                        return e
                    }, qu.apply(this, arguments)
                },
                Hu = function(e, n, t, r) {
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
                Gu = function(e, n) {
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
                Ku = (0, l.withTranslations)((function(e) {
                    var t, o, i, l, d, p = e.translate,
                        w = (0, n.useState)(!1),
                        S = w[0],
                        E = w[1],
                        A = (0, n.useState)(""),
                        x = A[0],
                        C = A[1],
                        k = (0, n.useState)(""),
                        L = k[0],
                        O = k[1],
                        I = (0, n.useState)(""),
                        T = I[0],
                        R = I[1],
                        U = (0, n.useState)(""),
                        N = U[0],
                        D = U[1],
                        j = (0, n.useState)(""),
                        M = j[0],
                        z = j[1],
                        B = (0, n.useState)(""),
                        F = B[0],
                        W = B[1],
                        V = (0, n.useState)(0),
                        q = V[0],
                        H = V[1],
                        G = (0, n.useState)(""),
                        K = G[0],
                        Q = G[1],
                        $ = (0, n.useState)(""),
                        X = $[0],
                        re = $[1],
                        ie = (0, n.useState)({
                            users: [],
                            invalidUsers: []
                        }),
                        ue = ie[0],
                        ce = ie[1],
                        se = (0, n.useState)(0),
                        he = se[0],
                        ve = se[1],
                        be = (0, n.useState)(""),
                        Ae = be[0],
                        Te = be[1],
                        Re = (0, n.useState)(_.Username),
                        Ue = Re[0],
                        Ne = Re[1],
                        De = (0, n.useState)(""),
                        Me = De[0],
                        ze = De[1],
                        Be = (0, n.useRef)(!1),
                        Fe = (0, n.useRef)(ro()),
                        We = (0, n.useRef)(Boolean(Fe.current)).current,
                        Ve = (0, n.useState)(!1),
                        Ke = Ve[0],
                        Ye = Ve[1],
                        Xe = (0, n.useState)(""),
                        Ze = Xe[0],
                        Je = Xe[1],
                        en = (0, n.useState)(!1),
                        nn = en[0],
                        tn = en[1],
                        un = (0, n.useState)(""),
                        cn = un[0],
                        ln = un[1],
                        sn = (0, n.useState)(""),
                        fn = sn[0],
                        yn = sn[1],
                        wn = (0, n.useState)(""),
                        An = wn[0],
                        xn = wn[1],
                        Cn = (0, n.useState)(""),
                        _n = Cn[0],
                        kn = Cn[1],
                        Pn = (0, n.useState)(!1),
                        On = Pn[0],
                        In = Pn[1],
                        Tn = (0, n.useState)(""),
                        Rn = Tn[0],
                        Dn = Tn[1],
                        jn = (0, n.useState)(""),
                        Mn = jn[0],
                        Fn = jn[1],
                        Vn = (0, n.useState)(0),
                        qn = Vn[0],
                        Kn = Vn[1],
                        $n = (0, n.useState)(!1),
                        Yn = $n[0],
                        Xn = $n[1],
                        Jn = (0, n.useState)(!1),
                        nt = Jn[0],
                        tt = Jn[1],
                        rt = (0, n.useState)(!1),
                        ot = rt[0],
                        it = rt[1],
                        ct = (0, n.useRef)(new AbortController),
                        lt = (0, n.useState)(!1),
                        st = lt[0],
                        ft = lt[1],
                        dt = (0, n.useState)(!1),
                        pt = dt[0],
                        ht = dt[1],
                        vt = no().shouldDisplayBrazilRatingLogo,
                        gt = (0, n.useState)(100),
                        mt = gt[0],
                        yt = gt[1],
                        bt = !0,
                        wt = (0, n.useState)(""),
                        St = wt[0],
                        Et = wt[1],
                        Ct = ar(Ge),
                        It = Ct.IsLoginUiUpdatesEnabled,
                        Nt = Ct.loginSilentUpgradeBrowserCheck,
                        Dt = Ir(),
                        Wt = Dt.isLoginBackgroundImageEnabled,
                        qt = Dt.loginBackgroundClass,
                        Kt = (0, n.useState)(!0),
                        Qt = Kt[0],
                        Yt = Kt[1],
                        Zt = (0, n.useState)(!1),
                        Jt = Zt[0],
                        rr = Zt[1],
                        or = pr(!(null !== (t = null === c.authenticatedUser || void 0 === c.authenticatedUser ? void 0 : c.authenticatedUser.isAuthenticated) && void 0 !== t && t)),
                        ir = or.loggedInUsers,
                        cr = or.isGettingLoggedInUsers,
                        lr = null !== (o = null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService ? void 0 : u.AccountSwitcherService.useIsAccountSwitcherAvailableForBrowser()) && void 0 !== o ? o : [!1, !1],
                        fr = lr[0],
                        dr = lr[1],
                        hr = gr(),
                        mr = function(e) {
                            return Boolean(null == e ? void 0 : e.identityVerificationLoginTicket)
                        },
                        yr = function(e) {
                            Et(e.identityVerificationLoginTicket)
                        },
                        br = function() {
                            var e = Tt(),
                                n = Er(e);
                            if (n) {
                                var t = Sr(n),
                                    r = Ar(n);
                                xr({
                                    referralUrl: null != n ? n : "",
                                    linkId: t,
                                    linkType: r,
                                    userDidLogIn: !0
                                })
                            }
                            Gn(e)
                        },
                        wr = function(e) {
                            Ye(!0), br()
                        },
                        _r = function(e) {
                            z(e.userId), W(e.challengeId)
                        },
                        kr = function(e) {
                            if (function(e) {
                                    var n;
                                    return Boolean(null === (n = null == e ? void 0 : e.twoStepVerificationData) || void 0 === n ? void 0 : n.ticket)
                                }(e)) ! function(e) {
                                var n = {
                                    userId: e.user.id.toString(),
                                    challengeId: e.twoStepVerificationData.ticket
                                };
                                Ye(!1), _r(n), ct.current.abort()
                            }(e);
                            else if (mr(e)) yr(e);
                            else {
                                try {
                                    null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService || u.AccountSwitcherService.storeAccountSwitcherBlob(e.accountBlob ? e.accountBlob : "")
                                } catch (e) {
                                    console.warn("Failed to save blob.", e)
                                }
                                try {
                                    if (e.user.id)(0, f.dataStores.authIntentDataStore.applyUserAuthIntent)(e.user.id.toString())
                                } catch (e) {
                                    console.error("Error applying auth intent data:", e)
                                }
                                var n = e.user.id.toString();
                                window.dispatchEvent(new CustomEvent(Qe, {
                                    detail: {
                                        userId: n
                                    }
                                })), En({
                                    credentialType: Ue,
                                    isPasskeyLoginSupported: Yn,
                                    isConditionalCreateSupported: ot,
                                    isPasswordAutofilled: Be.current,
                                    loginSilentUpgradeBrowserCheck: Nt,
                                    userId: n
                                }), wr()
                            }
                        },
                        Lr = function() {
                            O(""), C("")
                        },
                        Pr = function(e) {
                            var n, t = function(e) {
                                var n = Mt(e);
                                "object" == typeof e && Mt(e.data).forEach((function(e) {
                                    return n.push(e)
                                }));
                                var t = n[0] || ",";
                                try {
                                    var r = JSON.parse(t);
                                    return {
                                        dataExchange: r.dxBlob,
                                        unifiedCaptchaId: r.unifiedCaptchaId
                                    }
                                } catch (e) {
                                    var o = t.split(",");
                                    return {
                                        unifiedCaptchaId: o[0],
                                        dataExchange: o[1]
                                    }
                                }
                            }(e);
                            _t(Oe), C((n = t).unifiedCaptchaId), O(n.dataExchange)
                        },
                        Or = function(e) {
                            var n, t = zt(e);
                            _t(qe), z((n = t).userId), Q(n.sessionId)
                        },
                        Tr = function() {
                            _t(Ie), ft(!0)
                        },
                        Rr = function() {
                            Lr(), tn(!0), _t(je)
                        },
                        Ur = function() {
                            Je(p(P.MessageUnknownErrorTryAgain))
                        },
                        Nr = function() {
                            ce({
                                users: [],
                                invalidUsers: []
                            }), ve(0), Ye(!1), Fr("")
                        },
                        Dr = function(e) {
                            Lr();
                            var n = Bt(e);
                            ce(n);
                            var t = n.users.map((function(e) {
                                return e.id
                            })).join(",");
                            dn(n.users.length, t, Ue)
                        },
                        jr = function(e, n) {
                            ! function(e, n, t, r) {
                                var o = r ? h.LoginVpcEmptyBlobRequiredError : h.LoginEmptyBlobRequiredError,
                                    i = r ? b : y,
                                    a = r ? $e.context.accountSwitcherVpcLogin : $e.context.accountSwitcherLogin,
                                    c = $e.clientErrorTypes.logoutAllAccountSwitcherAccounts,
                                    l = {
                                        containerId: te,
                                        origin: o,
                                        localizedTitleText: e(v),
                                        localizedBodyText: e(i),
                                        localizedPrimaryButtonText: e(g),
                                        localizedSecondaryButtonText: e(m),
                                        primaryButtonCallback: function() {
                                            return At(void 0, void 0, void 0, (function() {
                                                var e;
                                                return xt(this, (function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            if (vn(), !(e = at())) return [3, 4];
                                                            t.label = 1;
                                                        case 1:
                                                            return t.trys.push([1, 3, , 4]), [4, Zn({
                                                                encrypted_users_data_blob: e
                                                            })];
                                                        case 2:
                                                            return t.sent(), [3, 4];
                                                        case 3:
                                                            return t.sent(), et(a, c), [3, 4];
                                                        case 4:
                                                            return ut(), n(!1), [2]
                                                    }
                                                }))
                                            }))
                                        },
                                        secondaryButtonCallback: function() {
                                            t()
                                        }
                                    };
                                null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService || u.AccountSwitcherService.renderBaseConfirmationModal(l)
                            }(p, Gr, (function() {
                                e === _.EmailOtpSessionToken && (Nr(), window.dispatchEvent(new CustomEvent("onEnterEmailVerifyCodeError", {
                                    detail: {
                                        errorMessage: "",
                                        shouldCloseModal: !0
                                    }
                                })))
                            }), n), Ye(!1)
                        },
                        Mr = function() {
                            rr(!0), Ye(!1)
                        },
                        zr = function(e, n) {
                            Ne(_.EmailOtpSessionToken), xn(e), kn(n)
                        },
                        Br = function() {
                            Ne(_.Username), xn(""), kn("")
                        },
                        Fr = function(e, n) {
                            void 0 === n && (n = !1);
                            var t = !1,
                                r = e;
                            (he > 0 || n) && (t = !0, r = "", Je(e)), window.dispatchEvent(new CustomEvent("onEnterEmailVerifyCodeError", {
                                detail: {
                                    errorMessage: r,
                                    shouldCloseModal: t
                                }
                            })), kn("")
                        },
                        Wr = function() {
                            Kn(qn + 1), Fn(""), Dn("")
                        },
                        Vr = function(e, n) {
                            void 0 === n && (n = !1), Je(e), Wr()
                        },
                        qr = function(e) {
                            void 0 === e && (e = ""), Lr(), ve(0), Fr(e), Ye(!1)
                        },
                        Hr = function(e) {
                            return Hu(void 0, void 0, void 0, (function() {
                                var n, t, r, o;
                                return Gu(this, (function(i) {
                                    switch (i.label) {
                                        case 0:
                                            return i.trys.push([0, 3, , 4]), [4, f.cryptoUtil.generateSecureAuthIntentV2()];
                                        case 1:
                                            return n = i.sent(), t = qu(qu({}, e), {
                                                secureAuthenticationIntent: n
                                            }), [4, Bn(t)];
                                        case 2:
                                            return r = i.sent(), t.secureAuthenticationIntent && _t(ke), (null === (o = null === f.dataStores || void 0 === f.dataStores ? void 0 : f.dataStores.authIntentDataStore) || void 0 === o ? void 0 : o.hasUnclaimedAuthIntent()) && _t(Le), _t(Pe), kr(r), [3, 4];
                                        case 3:
                                            return function(e, n) {
                                                if (u.AccountIntegrityChallengeService.Generic.ChallengeError.matchAbandoned(e)) return Wr(), Ye(!1), Fr(""), void ve(0);
                                                var t, r = jt(e);
                                                switch (r) {
                                                    case oe:
                                                        return void Pr(e);
                                                    case ae:
                                                        return void Tr();
                                                    case ge:
                                                        return void Or(e);
                                                    case le:
                                                        return void Rr();
                                                    case me:
                                                        return void Dr(e);
                                                    case we:
                                                        return void jr(n, !1);
                                                    case Se:
                                                        return void Mr();
                                                    case Ee:
                                                        return void jr(n, !0);
                                                    default:
                                                        Lr(), Ye(!1), _t(Lt(r)), t = p(Pt(r, n)), n === _.MagicLink ? (Je(""), Fe.current = null, ht(!0)) : n === _.EmailOtpSessionToken ? (an(String(r)), Fr(t, r === ye)) : n === _.Passkey ? Vr(t, r === ye) : Je(t), ve(0)
                                                }
                                            }(i.sent(), e.ctype), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                }))
                            }))
                        },
                        Gr = function(e) {
                            void 0 === e && (e = !0);
                            var n = function() {
                                var e;
                                if (e = Ue === _.MagicLink && Fe.current ? {
                                        ctype: Ue,
                                        cvalue: Fe.current,
                                        password: Fe.current
                                    } : Ue === _.AuthToken ? {
                                        ctype: Ue,
                                        cvalue: cn,
                                        password: fn
                                    } : Ue === _.EmailOtpSessionToken ? {
                                        ctype: Ue,
                                        cvalue: An,
                                        password: _n
                                    } : Ue === _.Passkey ? {
                                        ctype: Ue,
                                        cvalue: Mn,
                                        password: Rn
                                    } : {
                                        ctype: nn ? _.Username : Ue,
                                        cvalue: Ae,
                                        password: Me
                                    }, T && N && (e.captchaId = T, e.captchaToken = N), K && X && (e.securityQuestionSessionId = K, e.securityQuestionRedemptionToken = X, Q(""), re("")), fr) {
                                    var n = null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService ? void 0 : u.AccountSwitcherService.getStoredAccountSwitcherBlob();
                                    n && (e.accountBlob = n)
                                }
                                return e
                            }();
                            if (he && (n.userId = he), e) {
                                if (!Ae || !Me) return void Je(p(P.MessageUsernameAndPasswordRequired));
                                rn(), _t(_e), bt && (_t(Ce), bt = !1)
                            }
                            Ye(!0), Hr(n)
                        },
                        Kr = function(e) {
                            return void 0 === e && (e = "conditional"), Hu(void 0, void 0, void 0, (function() {
                                var n, t, r, o, i;
                                return Gu(this, (function(a) {
                                    switch (a.label) {
                                        case 0:
                                            n = null, a.label = 1;
                                        case 1:
                                            return a.trys.push([1, 3, , 4]), [4, Un()];
                                        case 2:
                                            return n = a.sent(), [3, 4];
                                        case 3:
                                            return a.sent(), [2];
                                        case 4:
                                            return a.trys.push([4, 6, , 7]), [4, kt(n.authenticationOptions, e, ct.current.signal)];
                                        case 5:
                                            return t = a.sent(), r = f.fido2Util.formatCredentialAuthenticationResponseWeb(t),
                                                function(e, n) {
                                                    Ne(_.Passkey), Dn(e), Fn(n)
                                                }(n.sessionId, r), [3, 7];
                                        case 6:
                                            return o = a.sent(), "AbortError" === (null === (i = o) || void 0 === i ? void 0 : i.name) ? ct.current = new AbortController : console.error(o), [3, 7];
                                        case 7:
                                            return [2]
                                    }
                                }))
                            }))
                        };
                    (0, n.useEffect)((function() {
                        Hu(void 0, void 0, Promise, (function() {
                            var e, n, t;
                            return Gu(this, (function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, Ln(He)];
                                    case 1:
                                        return (e = r.sent()) && (In(null !== (n = e.IsOtpEnabled) && void 0 !== n && n), yt(null !== (t = e.OtpCodeLength) && void 0 !== t ? t : 0)), [2]
                                }
                            }))
                        }))
                    }), []), (0, n.useEffect)((function() {
                        bn($e.context.loginPage)
                    }), []), (0, n.useEffect)((function() {
                        try {
                            (0, f.dataStores.authIntentDataStore.saveGameIntentFromReturnUrl)()
                        } catch (e) {
                            console.error("intent saving error: ", e)
                        }
                    }), []), (0, n.useEffect)((function() {
                        Hu(void 0, void 0, void 0, (function() {
                            var e, n, t, r, o, i, a, u, c, l, s, f, d, p;
                            return Gu(this, (function(h) {
                                switch (h.label) {
                                    case 0:
                                        return window.PublicKeyCredential ? [4, Promise.all([null === (l = (c = window.PublicKeyCredential).isConditionalMediationAvailable) || void 0 === l ? void 0 : l.call(c), null === (f = (s = window.PublicKeyCredential).isUserVerifyingPlatformAuthenticatorAvailable) || void 0 === f ? void 0 : f.call(s), null === (p = (d = window.PublicKeyCredential).getClientCapabilities) || void 0 === p ? void 0 : p.call(d)])] : [3, 2];
                                    case 1:
                                        return e = h.sent(), n = e[0], t = e[1], r = e[2], o = Boolean((null == r ? void 0 : r.passkeyPlatformAuthenticator) || (null == r ? void 0 : r.userVerifyingPlatformAuthenticator)), i = Boolean(n || t || o), a = Boolean(n), Xn(i), tt(a), u = Boolean(null == r ? void 0 : r.conditionalCreate), it(u), mn(i), gn(a), [3, 3];
                                    case 2:
                                        Xn(!1), tt(!1), it(!1), mn(!1), gn(!1), h.label = 3;
                                    case 3:
                                        return [2]
                                }
                            }))
                        }))
                    }), []), (0, n.useEffect)((function() {
                        Nn() && nt && Kr("conditional")
                    }), [qn, nt]), (0, n.useEffect)((function() {
                        Rn && Mn && Gr(!1)
                    }), [Mn, Rn]), (0, n.useEffect)((function() {
                        K && X && Gr(!1)
                    }), [K && X]), (0, n.useEffect)((function() {
                        fn && cn && Gr(!1)
                    }), [fn, cn]), (0, n.useEffect)((function() {
                        An && _n && Gr(!1)
                    }), [An, _n]), (0, n.useEffect)((function() {
                        if (Fe.current) return Ue !== _.MagicLink ? (function() {
                            var e = new URLSearchParams(window.location.search);
                            e.delete(to);
                            var n = e.toString();
                            window.history.replaceState(null, "", window.location.pathname + (n ? "?" + n : "") + window.location.hash)
                        }(), void Ne(_.MagicLink)) : void Gr(!1)
                    }), [Ue]), (0, n.useEffect)((function() {
                        nn && Gr(!1)
                    }), [nn]), (0, n.useEffect)((function() {
                        he && Gr(!1)
                    }), [he]), (0, n.useEffect)((function() {
                        var e;
                        if (!cr && dr && fr) {
                            var n = null === (e = null == ir ? void 0 : ir.usersAvailableForSwitching) || void 0 === e ? void 0 : e.map((function(e) {
                                return e.id
                            })).join(",");
                            hn(n)
                        }
                    }), [ir, cr, fr, dr]), vr(c.authenticatedUser.isAuthenticated && dr && !fr && !We);
                    var Qr = Qt && !We && !hr && (c.authenticatedUser.isAuthenticated && function() {
                            var e;
                            return "true" === (null === (e = new URLSearchParams(window.location.search).get("openSwitchAccount")) || void 0 === e ? void 0 : e.toLowerCase())
                        }() && fr || !c.authenticatedUser.isAuthenticated && !!(null === (i = null == ir ? void 0 : ir.usersAvailableForSwitching) || void 0 === i ? void 0 : i.length)),
                        Yr = !Qr || c.authenticatedUser.isAuthenticated;
                    if (cr || S) return r().createElement(s.Loading, null);
                    var Xr = r().createElement("div", {
                            id: "login-base",
                            className: "login-base-container"
                        }, Qr && r().createElement(ur, {
                            containerId: ee,
                            titleText: p(P.HeadingYouHaveLoggedOut),
                            helpText: p(P.LabelChooseAccountToUse),
                            onAccountSwitched: function() {
                                E(!0);
                                var e = Tt();
                                Rt(e) ? br() : Qn()
                            },
                            handleAddAccount: function() {
                                if (c.authenticatedUser.isAuthenticated) {
                                    var e = Tt();
                                    Rt(e) ? function() {
                                        window.location.href = "/login";
                                        var e = a.urlService.getQueryParam(Hn) || "";
                                        window.location.href = e ? "/login?" + a.urlService.composeQueryString({
                                            returnUrl: e
                                        }) : "/login"
                                    }() : Gn("/login")
                                } else Yt(!1)
                            },
                            removeInvalidActiveUser: !c.authenticatedUser.isAuthenticated,
                            isModal: c.authenticatedUser.isAuthenticated,
                            translate: p,
                            loggedInUsers: c.authenticatedUser.isAuthenticated ? void 0 : ir
                        }), Yr && r().createElement("div", {
                            className: "section-content login-section"
                        }, r().createElement("h1", {
                            className: "login-header"
                        }, function(e, n, t) {
                            return n(t || e ? P.HeadingAddAccount : P.HeadingLoginRoblox)
                        }(c.authenticatedUser.isAuthenticated, p, !!(null === (l = null == ir ? void 0 : ir.usersAvailableForSwitching) || void 0 === l ? void 0 : l.length))), r().createElement(Ft, {
                            captchaId: T,
                            captchaToken: N,
                            credentialValue: Ae,
                            password: Me,
                            isLoading: Ke,
                            errorMsg: Ze,
                            translate: p,
                            onFormSubmit: Gr,
                            onCredentialValueChange: function(e) {
                                Je(""), Te(e), Ne(Ot(e))
                            },
                            onPasswordChange: function(e) {
                                Je(""), ze(e.target.value);
                                var n = Wn(e.nativeEvent);
                                Be.current = n === Sn.Autofilled
                            },
                            isLoginFormDisabled: null !== (d = null == ir ? void 0 : ir.isAccountLimitReached) && void 0 !== d && d
                        }), r().createElement(nr, {
                            credentialValue: Ae,
                            translate: p
                        }), r().createElement(Gt, {
                            onCrossDeviceLoginCodeValidated: function(e) {
                                Ye(!0), Ne(_.AuthToken), ln(e.code), yn(e.privateKey)
                            },
                            isOtpLoginEnabled: On,
                            openOtpLoginModal: function() {
                                if (on(), u.EmailVerifyCodeModalService) {
                                    var e = {
                                        containerId: J,
                                        codeLength: mt,
                                        onEmailCodeEntered: zr,
                                        onModalAbandoned: Br,
                                        enterEmailTitle: p(P.LabelGetOneTimeCode),
                                        enterEmailDescription: p(P.DescriptionGetOneTimeCodeHelp),
                                        enterCodeTitle: p(P.LabelEnterOneTimeCode),
                                        enterCodeDescription: p(P.DescriptionEnterOneTimeCodeHelp),
                                        origin: He,
                                        translate: p,
                                        isChangeEmailEnabled: It
                                    };
                                    u.EmailVerifyCodeModalService.renderEmailVerifyCodeModal(e)
                                }
                            },
                            showPasskeyLoginButton: !1,
                            openPasskeyLoginFlow: Kr,
                            isOneTimeCodeDesignUpdated: It,
                            translate: p
                        }), r().createElement("div", {
                            id: "crossDeviceLoginDisplayCodeModal-container"
                        }), r().createElement("div", {
                            id: J
                        }), r().createElement("div", {
                            id: "account-switcher-confirmation-modal-container"
                        }), st && r().createElement(Cr, {
                            credentialValue: Ae,
                            translate: p
                        }), r().createElement(Vu, {
                            isOpen: pt,
                            onClose: function() {
                                return ht(!1)
                            },
                            translate: p
                        }), r().createElement(er, null)), x && L && r().createElement(Vt, {
                            containerId: Y,
                            actionType: u.AccountIntegrityChallengeService.Captcha.ActionType.Login,
                            unifiedCaptchaId: x,
                            dataExchange: L,
                            onCaptchaChallengeCompleted: function(e) {
                                R(e.captchaId), D(e.captchaToken)
                            },
                            onCaptchaChallengeInvalidated: function(e) {
                                var n = function(e) {
                                        var n = u.CaptchaConstants.errorCodes,
                                            t = n.failedToLoadProviderScript,
                                            r = n.failedToVerify,
                                            o = fe,
                                            i = de,
                                            a = pe;
                                        switch (e) {
                                            case t:
                                                return o;
                                            case r:
                                                return i;
                                            default:
                                                return a
                                        }
                                    }(e.errorCode),
                                    t = Ot(Ae),
                                    r = p(Pt(n, t));
                                Je(r), qr(r)
                            },
                            onCaptchaChallengeAbandoned: function() {
                                qr()
                            },
                            onUnknownError: Ur
                        }), M && K && r().createElement(Xt, {
                            userId: M,
                            sessionId: K,
                            onSecurityQuestionsChallengeCompleted: function(e) {
                                re(e.redemptionToken)
                            },
                            onSecurityQuestionsChallengeInvalidated: function(e) {
                                Q(""), re(""), Gr(!1)
                            },
                            onSecurityQuestionsChallengeAbandoned: function(e) {
                                z(""), Q(""), qr()
                            },
                            onUnknownError: Ur
                        }), M && F && r().createElement(Ht, {
                            userId: M,
                            challengeId: F,
                            on2svChallengeCompleted: function(e) {
                                return Hu(void 0, void 0, void 0, (function() {
                                    var n, t, r, o;
                                    return Gu(this, (function(i) {
                                        switch (i.label) {
                                            case 0:
                                                return i.trys.push([0, 3, , 4]), n = {
                                                    challengeId: F,
                                                    verificationToken: e.verificationToken,
                                                    rememberDevice: e.rememberDevice,
                                                    accountBlob: null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService ? void 0 : u.AccountSwitcherService.getStoredAccountSwitcherBlob()
                                                }, [4, f.cryptoUtil.generateSecureAuthIntentV2()];
                                            case 1:
                                                return t = i.sent(), r = qu(qu({}, n), {
                                                    secureAuthenticationIntent: t
                                                }), [4, zn(M, r)];
                                            case 2:
                                                return o = i.sent(), r.secureAuthenticationIntent && _t(ke), mr(o) ? yr(o) : (null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService || u.AccountSwitcherService.storeAccountSwitcherBlob(o.accountBlob ? o.accountBlob : ""), window.dispatchEvent(new CustomEvent(Qe, {
                                                    detail: {
                                                        userId: M
                                                    }
                                                })), En({
                                                    credentialType: Ue,
                                                    isPasskeyLoginSupported: Yn,
                                                    isConditionalCreateSupported: ot,
                                                    isPasswordAutofilled: Be.current,
                                                    loginSilentUpgradeBrowserCheck: Nt,
                                                    userId: M
                                                }), wr()), [3, 4];
                                            case 3:
                                                return i.sent(), Ur(), [3, 4];
                                            case 4:
                                                return [2]
                                        }
                                    }))
                                }))
                            },
                            on2svChallengeInvalidated: function(e) {
                                H(q + 1);
                                var n = p(P.ResponseVerificationError);
                                Je(n), q < xe ? Gr(!1) : qr(n)
                            },
                            on2svChallengeAbandoned: function(e) {
                                Wr(), z(""), W(""), qr()
                            },
                            onUnknownError: Ur
                        }), r().createElement($t, {
                            identityVerificationLoginTicket: St,
                            translate: p
                        }), ue.users.length > 0 && r().createElement(tr, {
                            containerId: Z,
                            users: ue.users,
                            invalidUsers: [],
                            onAccountSelection: function(e) {
                                ce({
                                    users: [],
                                    invalidUsers: []
                                }), ve(e), pn(Ue, e)
                            },
                            onAccountSelectorAbandoned: Nr,
                            titleText: p(P.LabelAccountSelector),
                            helpText: Ut(Ue, p),
                            translate: p
                        }), r().createElement(sr, {
                            origin: h.LoginAccountLimit,
                            containerId: ne,
                            handleRedirectHome: function() {
                                E(!0), Gn(Tt())
                            },
                            hasMaxLoggedInAccountsSignupError: Jt,
                            isAccountLimitReached: ir.isAccountLimitReached,
                            translate: p,
                            isParentUser: hr
                        })),
                        Zr = r().createElement("div", null, r().createElement($r, {
                            shouldDisplayBrazilRatingLogo: vt,
                            shouldDisplayItalyRatingLogo: !1,
                            translate: p
                        }));
                    return Wt && qt ? r().createElement("div", {
                        id: "background-image",
                        className: "background-image " + qt
                    }, r().createElement("div", {
                        className: "login-content-wrapper"
                    }, Xr, Zr)) : r().createElement(r().Fragment, null, Xr, Zr)
                }), An),
                Qu = TanstackQuery,
                $u = t(4452),
                Yu = t.n($u),
                Xu = function(e) {
                    var n = e.left,
                        t = e.right,
                        o = e.className,
                        i = e.style,
                        a = e.leftClassName,
                        u = e.rightClassName;
                    return r().createElement("div", {
                        className: Yu()("flex", o),
                        style: i
                    }, r().createElement("div", {
                        className: Yu()("grow basis-0", "large:min-width-[calc(var(--breakpoint-medium)/2)] max-width-[calc(var(--breakpoint-medium)/2)]", "xlarge:max-width-[calc(var(--breakpoint-xlarge)/3)]", a)
                    }, n), r().createElement("div", {
                        className: Yu()("hidden large:block grow-2 shrink-0 basis-0", u)
                    }, t))
                },
                Zu = (0, n.forwardRef)((function(e, n) {
                    var t, o = e.className,
                        i = e.style,
                        a = e.orientation,
                        u = void 0 === a ? "horizontal" : a,
                        c = e.variant,
                        l = void 0 === c ? "Standard" : c,
                        s = io(e, ["className", "style", "orientation", "variant"]),
                        f = "vertical" === u;
                    t = f ? {
                        height: "100%",
                        width: 0,
                        borderLeftWidth: "var(--stroke-standard)",
                        borderTopWidth: 0
                    } : "Thick" === l ? {
                        height: "var(--size-250)",
                        borderTop: "var(--stroke-standard)",
                        borderLeftWidth: 0,
                        background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                    } : {
                        height: 0,
                        borderTopWidth: "var(--stroke-standard)",
                        borderLeftWidth: 0
                    };
                    var d = {};
                    return f || "Inset" !== l ? f || "InsetLeft" !== l ? f || "InsetRight" !== l || (d = {
                        marginRight: "var(--padding-xlarge)"
                    }) : d = {
                        marginLeft: "var(--padding-xlarge)"
                    } : d = {
                        marginLeft: "var(--padding-xlarge)",
                        marginRight: "var(--padding-xlarge)"
                    }, r().createElement("div", oo({
                        ref: n
                    }, s, {
                        role: "separator",
                        "data-orientation": u,
                        "aria-orientation": u,
                        style: oo(oo(oo({
                            borderRightWidth: 0,
                            borderBottomWidth: 0,
                            boxSizing: "border-box",
                            borderStyle: "solid"
                        }, t), d), i),
                        className: uo("stroke-default self-stretch", o)
                    }))
                }));
            Zu.displayName = "Divider";
            var Ju = 0,
                ec = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-medium"
                },
                nc = {
                    XSmall: "gap-x-xsmall",
                    Small: "gap-x-small",
                    Medium: "gap-x-small",
                    Large: "gap-x-small"
                },
                tc = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                rc = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                oc = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                ic = {
                    XSmall: ["text-body-small", "placeholder:text-body-small"],
                    Small: ["text-body-small", "placeholder:text-body-small"],
                    Medium: ["text-body-medium", "placeholder:text-body-medium"],
                    Large: ["text-body-large", "placeholder:text-body-large"]
                },
                ac = (0, n.forwardRef)((function(e, t) {
                    var o, i = e.label,
                        a = e.leadingIconName,
                        u = e.trailingIconName,
                        c = e.leadingIconNode,
                        l = e.trailingIconNode,
                        s = e.hasError,
                        f = e.error,
                        d = e.helperText,
                        p = e.size,
                        h = e.isRequired,
                        v = e.isDisabled,
                        g = e.className,
                        m = e.style,
                        y = e.inputContainerClassName,
                        b = e.inputContainerClassStyle,
                        w = e.id,
                        S = io(e, ["label", "leadingIconName", "trailingIconName", "leadingIconNode", "trailingIconNode", "hasError", "error", "helperText", "size", "isRequired", "isDisabled", "className", "style", "inputContainerClassName", "inputContainerClassStyle", "id"]),
                        E = function(e) {
                            void 0 === e && (e = ":r");
                            var t = (0, n.useRef)();
                            return t.current || (Ju += 1, t.current = "".concat(e).concat(Ju)), t.current
                        }(),
                        A = w || E,
                        x = "".concat(A, "-description"),
                        C = null != p ? p : "Large",
                        _ = s || Boolean(f),
                        k = f || d,
                        L = (0, n.useMemo)((function() {
                            return a ? r().createElement(su, {
                                name: a,
                                size: C,
                                className: "content-emphasis",
                                "data-testid": "text-input-leading-icon"
                            }) : c
                        }), [a, c, C]),
                        P = (0, n.useMemo)((function() {
                            return u ? r().createElement(su, {
                                name: u,
                                size: C,
                                className: "content-emphasis",
                                "data-testid": "text-input-trailing-icon"
                            }) : l
                        }), [C, u, l]);
                    return r().createElement("div", {
                        "data-testid": "text-input-wrapper",
                        className: uo("flex width-full flex-col gap-small ".concat(g), (o = {}, o[Du] = v, o)),
                        style: m
                    }, i && r().createElement("label", {
                        htmlFor: A,
                        className: uo(oc[C], "content-emphasis")
                    }, i, h && r().createElement(r().Fragment, null, " ", r().createElement("span", {
                        className: "content-default"
                    }, "*"))), r().createElement("div", {
                        "data-testid": "text-input-container",
                        className: uo("flex items-center width-full stroke-standard focus-within:outline-focus", y, tc[C], rc[C], ec[C], nc[C], {
                            "stroke-system-alert": _,
                            "stroke-contrast-alpha": !_
                        }),
                        style: b
                    }, L, r().createElement("input", oo({
                        type: "text",
                        id: A,
                        ref: t,
                        className: uo("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", ic[C]),
                        style: {
                            appearance: "none"
                        },
                        "aria-invalid": _,
                        "aria-describedby": k ? x : void 0,
                        required: h
                    }, S, {
                        disabled: v
                    })), P), k && r().createElement("span", {
                        id: x,
                        className: uo("text-caption-small", {
                            "content-system-alert": _,
                            "content-default": !_
                        })
                    }, k))
                }));
            ac.displayName = "TextInput";
            var uc = function() {
                    return uc = Object.assign || function(e) {
                        for (var n, t = 1, r = arguments.length; t < r; t++)
                            for (var o in n = arguments[t]) Object.prototype.hasOwnProperty.call(n, o) && (e[o] = n[o]);
                        return e
                    }, uc.apply(this, arguments)
                },
                cc = function(e, n) {
                    var t = {};
                    for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && n.indexOf(r) < 0 && (t[r] = e[r]);
                    if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                        var o = 0;
                        for (r = Object.getOwnPropertySymbols(e); o < r.length; o++) n.indexOf(r[o]) < 0 && Object.prototype.propertyIsEnumerable.call(e, r[o]) && (t[r[o]] = e[r[o]])
                    }
                    return t
                },
                lc = (0, n.forwardRef)((function(e, n) {
                    var t = e.reserveErrorSpace,
                        o = void 0 === t || t,
                        i = e.isSignup,
                        a = void 0 === i || i,
                        u = e.onChange,
                        c = cc(e, ["reserveErrorSpace", "isSignup", "onChange"]),
                        l = a ? 21 : 320;
                    return r().createElement("div", {
                        className: "flex flex-col gap-small"
                    }, r().createElement(ac, uc({
                        size: "Medium",
                        minLength: 3,
                        required: !0,
                        autoComplete: "username"
                    }, c, {
                        maxLength: l,
                        ref: n,
                        onChange: function(e) {
                            return u(e.target.value)
                        },
                        onFocus: c.onFocus,
                        onBlur: c.onBlur
                    })), !o || c.error || c.helperText ? null : r().createElement("span", {
                        className: "height-350"
                    }))
                }));
            lc.displayName = "UsernameInput";
            var sc = lc,
                fc = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                dc = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-500"
                },
                pc = {
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
                hc = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                vc = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                gc = {
                    Emphasis: "content-action-emphasis",
                    Standard: "content-action-standard",
                    Alert: "content-action-alert",
                    Utility: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                mc = {
                    Emphasis: "content-action-standard",
                    Standard: "content-action-standard",
                    Alert: "content-action-standard",
                    Utility: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                yc = (0, n.forwardRef)((function(e, n) {
                    var t = e.className,
                        o = e.icon,
                        i = e.ariaLabel,
                        a = e.isDisabled,
                        u = void 0 !== a && a,
                        c = e.isCircular,
                        l = void 0 !== c && c,
                        s = e.size,
                        f = void 0 === s ? "Large" : s,
                        d = e.variant,
                        p = void 0 === d ? "Emphasis" : d,
                        h = io(e, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "size", "variant"]),
                        v = uo("foundation-web-icon-button", u ? Du : [fu, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", fc[f], pc[f][l ? "circular" : "square"], u ? vc[p] : hc[p], t),
                        g = r().createElement(r().Fragment, null, r().createElement(du, null), r().createElement("span", {
                            className: uo("icon", o, dc[f], u ? mc[p] : gc[p])
                        }));
                    if ("a" === h.as) {
                        h.as;
                        var m = h.href,
                            y = io(h, ["as", "href"]);
                        return r().createElement("a", oo({
                            ref: n
                        }, y, {
                            "aria-label": i,
                            "aria-disabled": u,
                            href: u ? void 0 : m,
                            className: v
                        }), g)
                    }
                    h.as;
                    var b = io(h, ["as"]);
                    return r().createElement("button", oo({
                        ref: n,
                        type: "button"
                    }, b, {
                        "aria-label": i,
                        disabled: u,
                        className: v
                    }), g)
                })),
                bc = function() {
                    return bc = Object.assign || function(e) {
                        for (var n, t = 1, r = arguments.length; t < r; t++)
                            for (var o in n = arguments[t]) Object.prototype.hasOwnProperty.call(n, o) && (e[o] = n[o]);
                        return e
                    }, bc.apply(this, arguments)
                },
                wc = function(e, n) {
                    var t = {};
                    for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && n.indexOf(r) < 0 && (t[r] = e[r]);
                    if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                        var o = 0;
                        for (r = Object.getOwnPropertySymbols(e); o < r.length; o++) n.indexOf(r[o]) < 0 && Object.prototype.propertyIsEnumerable.call(e, r[o]) && (t[r[o]] = e[r[o]])
                    }
                    return t
                },
                Sc = (0, n.forwardRef)((function(e, t) {
                    var o = e.reserveErrorSpace,
                        i = void 0 === o || o,
                        a = e.onChange,
                        u = e.onShowPassword,
                        c = e.onHidePassword,
                        l = wc(e, ["reserveErrorSpace", "onChange", "onShowPassword", "onHidePassword"]),
                        s = (0, n.useState)(!1),
                        f = s[0],
                        d = s[1];
                    return r().createElement("div", {
                        className: "flex flex-col gap-small"
                    }, r().createElement(ac, bc({
                        size: "Medium",
                        minLength: 8,
                        maxLength: 200,
                        required: !0,
                        autoComplete: "new-password"
                    }, l, {
                        ref: t,
                        type: f ? "text" : "password",
                        className: "relative",
                        trailingIconNode: r().createElement(r().Fragment, null, r().createElement("div", {
                            className: "width-600 grow-0 shrink-0 basis-auto"
                        }), r().createElement("div", {
                            className: "absolute ltr:right-[0] rtl:left-[0]"
                        }, r().createElement(yc, {
                            size: "Medium",
                            variant: "Utility",
                            icon: f ? "icon-regular-eye-slash" : "icon-regular-eye",
                            ariaLabel: f ? "Hide Password" : "Show Password",
                            onClick: function() {
                                var e = !f;
                                d(e), e ? null == u || u() : null == c || c()
                            }
                        }))),
                        onChange: function(e) {
                            return a(e.target.value)
                        },
                        onFocus: l.onFocus,
                        onBlur: l.onBlur
                    })), !i || l.error || l.helperText ? null : r().createElement("span", {
                        className: "height-350"
                    }))
                }));
            Sc.displayName = "PasswordInput";
            var Ec = Sc;

            function Ac(e) {
                return Ac = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                }, Ac(e)
            }
            var xc = function(e) {
                    var n, t = new Set,
                        r = function(e, r) {
                            var o = "function" == typeof e ? e(n) : e;
                            if (!Object.is(o, n)) {
                                var i = n;
                                n = (null != r ? r : "object" !== Ac(o) || null === o) ? o : Object.assign({}, n, o), t.forEach((function(e) {
                                    return e(n, i)
                                }))
                            }
                        },
                        o = function() {
                            return n
                        },
                        i = {
                            setState: r,
                            getState: o,
                            getInitialState: function() {
                                return a
                            },
                            subscribe: function(e) {
                                return t.add(e),
                                    function() {
                                        return t.delete(e)
                                    }
                            },
                            destroy: function() {
                                console.warn("[DEPRECATED] The `destroy` method will be unsupported in a future version. Instead use unsubscribe function returned by subscribe. Everything will be garbage-collected if store is garbage-collected."), t.clear()
                            }
                        },
                        a = n = e(r, o, i);
                    return i
                },
                Cc = function(e) {
                    return e ? xc(e) : xc
                },
                _c = t(5390),
                kc = n.useDebugValue,
                Lc = _c.useSyncExternalStoreWithSelector,
                Pc = !1,
                Oc = function(e) {
                    return e
                };
            var Ic = function(e) {
                    "function" != typeof e && console.warn("[DEPRECATED] Passing a vanilla store will be unsupported in a future version. Instead use `import { useStore } from 'zustand'`.");
                    var n = "function" == typeof e ? Cc(e) : e,
                        t = function(e, t) {
                            return function(e) {
                                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : Oc,
                                    t = arguments.length > 2 ? arguments[2] : void 0;
                                t && !Pc && (console.warn("[DEPRECATED] Use `createWithEqualityFn` instead of `create` or use `useStoreWithEqualityFn` instead of `useStore`. They can be imported from 'zustand/traditional'. https://github.com/pmndrs/zustand/discussions/1937"), Pc = !0);
                                var r = Lc(e.subscribe, e.getState, e.getServerState || e.getInitialState, n, t);
                                return kc(r), r
                            }(n, e, t)
                        };
                    return Object.assign(t, n), t
                },
                Tc = function(e) {
                    return e ? Ic(e) : Ic
                },
                Rc = Tc()((function() {
                    return {
                        step: "loading",
                        identifier: "",
                        password: ""
                    }
                })),
                Uc = function(e) {
                    return Rc.setState({
                        identifier: e
                    })
                },
                Nc = function(e) {
                    return Rc.setState({
                        password: e
                    })
                },
                Dc = function(e) {
                    var n = e.switchAccount;
                    return Rc.setState({
                        step: "login",
                        switchAccount: n
                    })
                },
                jc = function(e) {
                    return Rc.setState({
                        step: "login",
                        errorMessage: e
                    })
                },
                Mc = function() {
                    return Mc = Object.assign || function(e) {
                        for (var n, t = 1, r = arguments.length; t < r; t++)
                            for (var o in n = arguments[t]) Object.prototype.hasOwnProperty.call(n, o) && (e[o] = n[o]);
                        return e
                    }, Mc.apply(this, arguments)
                },
                zc = function(e, n, t, r) {
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
                Bc = function(e, n) {
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
                Fc = "auth-error-modal-container",
                Wc = function(e) {
                    return "login" === e ? v : w
                },
                Vc = function(e) {
                    return "login" === e ? g : S
                },
                qc = function(e) {
                    return "login" === e ? m : E
                },
                Hc = function(e, n) {
                    var t = {
                        containerId: Fc,
                        origin: h.SignupAccountLimit,
                        localizedTitleText: e(p.HeadingAccountLimitReached),
                        localizedBodyText: e(p.LabelAccountLimitReached),
                        localizedPrimaryButtonText: e(p.ActionOK),
                        primaryButtonCallback: n,
                        localizedSecondaryButtonText: e(d.ActionLogOutAllAccounts),
                        secondaryButtonCallback: function() {
                            return zc(void 0, void 0, void 0, (function() {
                                var e;
                                return Bc(this, (function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (!(e = at())) return [3, 4];
                                            n.label = 1;
                                        case 1:
                                            return n.trys.push([1, 3, , 4]), [4, Zn({
                                                encrypted_users_data_blob: e
                                            })];
                                        case 2:
                                            return n.sent(), [3, 4];
                                        case 3:
                                            return n.sent(), et($e.context.accountSwitcherLimitError, $e.clientErrorTypes.logoutAllAccountSwitcherAccounts), [3, 4];
                                        case 4:
                                            ut();
                                            try {
                                                null === u.NavigationService || void 0 === u.NavigationService || u.NavigationService.logoutAndRedirect()
                                            } catch (e) {
                                                window.location.reload()
                                            }
                                            return [2]
                                    }
                                }))
                            }))
                        },
                        isModalDismissable: !1
                    };
                    null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService || u.AccountSwitcherService.renderBaseConfirmationModal(t)
                },
                Gc = function(e, n, t) {
                    var r, o, i;
                    void 0 === t && (t = {});
                    var a = null !== (r = t.isVPCParentFocused) && void 0 !== r && r,
                        c = null !== (o = t.origin) && void 0 !== o ? o : "signup",
                        l = null !== (i = t.containerId) && void 0 !== i ? i : Fc,
                        s = function(e, n) {
                            return "login" === n ? e ? h.LoginVpcEmptyBlobRequiredError : h.LoginEmptyBlobRequiredError : e ? h.SignupVpcEmptyBlobRequiredError : h.SignupEmptyBlobRequiredError
                        }(a, c),
                        f = e(function(e, n) {
                            return "login" === n ? e ? b : y : e ? x : A
                        }(a, c)),
                        d = function(e, n) {
                            return "login" === n ? e ? $e.context.accountSwitcherVpcLogin : $e.context.accountSwitcherLogin : e ? $e.context.accountSwitcherVpcSignup : $e.context.accountSwitcherSignup
                        }(a, c),
                        p = Mc(Mc({
                            containerId: l,
                            origin: s,
                            localizedTitleText: e(Wc(c)),
                            localizedBodyText: f,
                            localizedPrimaryButtonText: e(Vc(c)),
                            primaryButtonCallback: function() {
                                return zc(void 0, void 0, void 0, (function() {
                                    var e;
                                    return Bc(this, (function(t) {
                                        switch (t.label) {
                                            case 0:
                                                if (!(e = at())) return [3, 4];
                                                t.label = 1;
                                            case 1:
                                                return t.trys.push([1, 3, , 4]), [4, Zn({
                                                    encrypted_users_data_blob: e
                                                })];
                                            case 2:
                                                return t.sent(), [3, 4];
                                            case 3:
                                                return t.sent(), et(d, $e.clientErrorTypes.logoutAllAccountSwitcherAccounts), [3, 4];
                                            case 4:
                                                return ut(), n(), [2]
                                        }
                                    }))
                                }))
                            },
                            localizedSecondaryButtonText: e(qc(c))
                        }, t.onCancel ? {
                            secondaryButtonCallback: t.onCancel
                        } : {}), {
                            isModalDismissable: !1
                        });
                    null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService || u.AccountSwitcherService.renderBaseConfirmationModal(p)
                },
                Kc = function() {
                    return Kc = Object.assign || function(e) {
                        for (var n, t = 1, r = arguments.length; t < r; t++)
                            for (var o in n = arguments[t]) Object.prototype.hasOwnProperty.call(n, o) && (e[o] = n[o]);
                        return e
                    }, Kc.apply(this, arguments)
                },
                Qc = function(e, n, t, r) {
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
                $c = function(e, n) {
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
                Yc = function(e, n) {
                    Rc.setState({
                        step: "finish",
                        errorMessage: void 0
                    });
                    try {
                        null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService || u.AccountSwitcherService.storeAccountSwitcherBlob(null != n ? n : "")
                    } catch (e) {
                        console.error("Failed to save blob.", e)
                    }
                    try {
                        f.dataStores.authIntentDataStore.applyUserAuthIntent(e)
                    } catch (e) {
                        console.error("Error applying auth intent data:", e)
                    }
                    window.dispatchEvent(new CustomEvent(Qe, {
                            detail: {
                                userId: e
                            }
                        })),
                        function() {
                            var e = Tt(),
                                n = Er(e);
                            if (n) {
                                var t = Sr(n),
                                    r = Ar(n);
                                xr({
                                    referralUrl: null != n ? n : "",
                                    linkId: t,
                                    linkType: r,
                                    userDidLogIn: !0
                                })
                            }
                            Gn(e)
                        }()
                },
                Xc = function(e) {
                    var n = e.credential,
                        t = e.userId,
                        r = e.securityQuestionSessionId,
                        o = e.securityQuestionRedemptionToken;
                    return Qc(void 0, void 0, Promise, (function() {
                        var e, i, a, c, l;
                        return $c(this, (function(s) {
                            switch (s.label) {
                                case 0:
                                    return e = n.type, i = n.value, a = n.password, c = {
                                        ctype: e,
                                        cvalue: i,
                                        password: a,
                                        userId: t,
                                        securityQuestionSessionId: r,
                                        securityQuestionRedemptionToken: o
                                    }, [4, lt()];
                                case 1:
                                    return s.sent() && (l = null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService ? void 0 : u.AccountSwitcherService.getStoredAccountSwitcherBlob()) && (c.accountBlob = l), [2, c]
                            }
                        }))
                    }))
                },
                Zc = function(e, n, t, r) {
                    Gc(e, r, {
                        origin: "login",
                        isVPCParentFocused: t,
                        onCancel: function() {
                            jc()
                        }
                    })
                },
                Jc = function(e, n, t, r, o) {
                    var i;
                    void 0 === o && (o = {});
                    var a = jt(t);
                    switch (a) {
                        case ae:
                            return _t(Ie), void
                            function(e) {
                                var n = e.credential;
                                Rc.setState({
                                    step: "security-notification",
                                    credential: n
                                })
                            }({
                                credential: n
                            });
                        case ge:
                            var u = zt(t);
                            return _t(qe), void
                            function(e) {
                                var n = e.credential,
                                    t = e.userId,
                                    r = e.sessionId;
                                Rc.setState({
                                    step: "security-questions",
                                    credential: n,
                                    userId: t,
                                    sessionId: r
                                })
                            }(Kc({
                                credential: n
                            }, u));
                        case me:
                            var c = Bt(t).users,
                                l = c.map((function(e) {
                                    return e.id
                                })).join(",");
                            return dn(c.length, l, n.type), void
                            function(e) {
                                var n = e.credential,
                                    t = e.users;
                                Rc.setState({
                                    step: "select-account",
                                    credential: n,
                                    users: t
                                })
                            }({
                                credential: n,
                                users: c
                            });
                        case we:
                            return void Zc(e, 0, !1, r);
                        case Ee:
                            return void Zc(e, 0, !0, r);
                        case Se:
                            return void Hc(e, (function() {
                                return Gn(Tt())
                            }));
                        default:
                            _t(Lt(a));
                            var s = Pt(a, n.type);
                            if (n.type === _.EmailOtpSessionToken) an(String(a));
                            else {
                                if (n.type === _.Passkey) throw jc(e(s)), t;
                                if (n.type === _.MagicLink) return jc(), void(null === (i = o.onMagicLinkLoginError) || void 0 === i || i.call(o))
                            }
                            jc(e(s))
                    }
                },
                el = function(e) {
                    void 0 === e && (e = {});
                    var n = (0, l.useTranslation)().translate,
                        t = (0, Qu.useMutation)({
                            mutationFn: function(r) {
                                return Qc(void 0, void 0, void 0, (function() {
                                    var o, i, a, u, c, l, s, d, p, h, v;
                                    return $c(this, (function(g) {
                                        switch (g.label) {
                                            case 0:
                                                return o = r.credential, ![_.Username, _.PhoneNumber, _.Email].includes(o.type) || "" !== o.value && "" !== o.password ? [4, Xc(r)] : (_t(_e), jc(n(P.MessageUsernameAndPasswordRequired)), [2]);
                                            case 1:
                                                return i = g.sent(), [4, f.cryptoUtil.generateSecureAuthIntentV2()];
                                            case 2:
                                                a = null !== (p = g.sent()) && void 0 !== p ? p : void 0, u = Kc(Kc({}, i), {
                                                    secureAuthenticationIntent: a
                                                }), g.label = 3;
                                            case 3:
                                                return g.trys.push([3, 5, , 6]), [4, Bn(u)];
                                            case 4:
                                                return c = g.sent(), [3, 6];
                                            case 5:
                                                return l = g.sent(), Jc(n, o, l, (function() {
                                                    t.mutate({
                                                        credential: o
                                                    })
                                                }), e), [2];
                                            case 6:
                                                return a && _t(ke), (null === (h = null === f.dataStores || void 0 === f.dataStores ? void 0 : f.dataStores.authIntentDataStore) || void 0 === h ? void 0 : h.hasUnclaimedAuthIntent()) && _t(Le), _t(Pe), s = null === (v = c.twoStepVerificationData) || void 0 === v ? void 0 : v.ticket, d = c.user.id.toString(), null != s ? function(e) {
                                                    var n = e.credential,
                                                        t = e.userId,
                                                        r = e.challengeId;
                                                    Rc.setState({
                                                        step: "2sv",
                                                        credential: n,
                                                        userId: t,
                                                        challengeId: r
                                                    })
                                                }({
                                                    credential: o,
                                                    userId: d,
                                                    challengeId: s
                                                }) : Yc(d, c.accountBlob), [2]
                                        }
                                    }))
                                }))
                            }
                        });
                    return t
                },
                nl = function() {
                    return nl = Object.assign || function(e) {
                        for (var n, t = 1, r = arguments.length; t < r; t++)
                            for (var o in n = arguments[t]) Object.prototype.hasOwnProperty.call(n, o) && (e[o] = n[o]);
                        return e
                    }, nl.apply(this, arguments)
                },
                tl = function(e, n, t, r) {
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
                rl = function(e, n) {
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
                ol = function(e, n) {
                    return tl(void 0, void 0, void 0, (function() {
                        var t, r, o;
                        return rl(this, (function(i) {
                            switch (i.label) {
                                case 0:
                                    return [4, f.cryptoUtil.generateSecureAuthIntentV2()];
                                case 1:
                                    return t = i.sent(), r = nl(nl({}, n), {
                                        secureAuthenticationIntent: t
                                    }), [4, zn(e, r)];
                                case 2:
                                    return o = i.sent(), t && _t(ke), Yc(e, o.accountBlob), [2]
                            }
                        }))
                    }))
                },
                il = function(e) {
                    var t = e.credential,
                        o = e.userId,
                        i = e.challengeId,
                        a = (0, l.useTranslation)().translate,
                        c = function() {
                            return jc(a(P.ResponseVerificationError))
                        },
                        s = el(),
                        f = (0, n.useState)(0),
                        d = f[0],
                        p = f[1],
                        h = (0, Qu.useMutation)({
                            mutationFn: function(e) {
                                var n = e.verificationToken,
                                    t = e.rememberDevice;
                                return tl(void 0, void 0, void 0, (function() {
                                    var e;
                                    return rl(this, (function(r) {
                                        switch (r.label) {
                                            case 0:
                                                return e = {
                                                    challengeId: i,
                                                    verificationToken: n,
                                                    rememberDevice: t,
                                                    accountBlob: null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService ? void 0 : u.AccountSwitcherService.getStoredAccountSwitcherBlob(),
                                                    secureAuthenticationIntent: null
                                                }, [4, ol(o.toString(), e)];
                                            case 1:
                                                return r.sent(), [2]
                                        }
                                    }))
                                }))
                            },
                            onError: c
                        });
                    return r().createElement(Ht, {
                        userId: o.toString(),
                        challengeId: i,
                        on2svChallengeCompleted: function(e) {
                            h.isPending || h.mutate(e)
                        },
                        on2svChallengeInvalidated: function() {
                            d < xe ? (p((function(e) {
                                return e + 1
                            })), s.mutate({
                                credential: t
                            })) : (p(0), c())
                        },
                        on2svChallengeAbandoned: function() {
                            return jc()
                        },
                        onUnknownError: c
                    })
                },
                al = function(e, n, t, r) {
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
                ul = function(e, n) {
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
                cl = function(e) {
                    var t = e.login,
                        r = (0, Qu.useQuery)({
                            queryKey: ["passkey-support"],
                            queryFn: function() {
                                return al(void 0, void 0, void 0, (function() {
                                    var e, n, t, r;
                                    return ul(this, (function(o) {
                                        switch (o.label) {
                                            case 0:
                                                return Nn() ? window.PublicKeyCredential ? [4, null === (r = (t = window.PublicKeyCredential).isConditionalMediationAvailable) || void 0 === r ? void 0 : r.call(t)] : [3, 2] : [2, !1];
                                            case 1:
                                                return e = o.sent(), n = Boolean(e), gn(n), [2, n];
                                            case 2:
                                                return [2, !1]
                                        }
                                    }))
                                }))
                            },
                            placeholderData: !1
                        }),
                        o = (0, n.useRef)(new AbortController),
                        i = (0, Qu.useMutation)({
                            mutationFn: function() {
                                return al(void 0, void 0, void 0, (function() {
                                    var e, n, r, i, a, u;
                                    return ul(this, (function(c) {
                                        switch (c.label) {
                                            case 0:
                                                return c.trys.push([0, 2, , 3]), [4, Un()];
                                            case 1:
                                                return e = c.sent(), [3, 3];
                                            case 2:
                                                return n = c.sent(), console.error(n), [2];
                                            case 3:
                                                return c.trys.push([3, 5, , 6]), [4, kt(e.authenticationOptions, "conditional", o.current.signal)];
                                            case 4:
                                                return r = c.sent(), [3, 6];
                                            case 5:
                                                if (null != (i = c.sent()) && "object" == typeof i && "AbortError" === i.name) return [2];
                                                throw console.error(i), i;
                                            case 6:
                                                return a = f.fido2Util.formatCredentialAuthenticationResponseWeb(r), u = {
                                                    type: _.Passkey,
                                                    value: a,
                                                    password: e.sessionId
                                                }, [4, t.mutateAsync({
                                                    credential: u
                                                })];
                                            case 7:
                                                return c.sent(), [2]
                                        }
                                    }))
                                }))
                            },
                            retry: 1 / 0,
                            retryDelay: 100
                        });
                    return (0, n.useEffect)((function() {
                        r.data && i.isIdle && i.mutate()
                    }), [r.data, i]), (0, n.useEffect)((function() {
                        return function() {
                            o.current.abort()
                        }
                    }), []), null
                },
                ll = function(e) {
                    var t = e.codeLength,
                        o = (0, l.useTranslation)().translate,
                        i = el();
                    return (0, n.useEffect)((function() {
                        null != u.EmailVerifyCodeModalService ? u.EmailVerifyCodeModalService.renderEmailVerifyCodeModal({
                            containerId: J,
                            codeLength: t,
                            onEmailCodeEntered: function(e, n) {
                                if (!i.isPending) {
                                    var t = {
                                        type: _.EmailOtpSessionToken,
                                        value: e,
                                        password: n
                                    };
                                    i.mutate({
                                        credential: t
                                    })
                                }
                            },
                            onModalAbandoned: jc,
                            enterEmailTitle: o(P.LabelGetOneTimeCode),
                            enterEmailDescription: o(P.DescriptionGetOneTimeCodeHelp),
                            enterCodeTitle: o(P.LabelEnterOneTimeCode),
                            enterCodeDescription: o(P.DescriptionEnterOneTimeCodeHelp),
                            origin: He,
                            translate: o,
                            isChangeEmailEnabled: !0
                        }) : jc()
                    }), [t, i, o]), r().createElement("div", {
                        id: J
                    })
                },
                sl = function(e) {
                    var n = e.credential,
                        t = e.userId,
                        o = e.sessionId,
                        i = el();
                    return r().createElement(Xt, {
                        userId: t,
                        sessionId: o,
                        onSecurityQuestionsChallengeCompleted: function(e) {
                            var t = e.redemptionToken;
                            i.isPending || i.mutate({
                                credential: n,
                                securityQuestionSessionId: o,
                                securityQuestionRedemptionToken: t
                            })
                        },
                        onSecurityQuestionsChallengeInvalidated: function(e) {
                            var n = e.errorMessage;
                            return jc(n)
                        },
                        onSecurityQuestionsChallengeAbandoned: function() {
                            return jc()
                        },
                        onUnknownError: jc
                    })
                },
                fl = function(e) {
                    var n = e.credential,
                        t = (0, l.useTranslation)().translate;
                    return r().createElement(Cr, {
                        credentialValue: n.value,
                        translate: t
                    })
                },
                dl = function(e) {
                    var t = e.credential,
                        o = e.users,
                        i = (0, l.useTranslation)().translate,
                        a = (0, n.useState)(!1),
                        u = a[0],
                        c = a[1],
                        s = el();
                    return u ? null : r().createElement(tr, {
                        containerId: Z,
                        users: o,
                        invalidUsers: [],
                        onAccountSelection: function(e) {
                            s.isPending || (pn(t.type, e), c(!0), s.mutate({
                                credential: t,
                                userId: e
                            }))
                        },
                        onAccountSelectorAbandoned: jc,
                        titleText: i(P.LabelAccountSelector),
                        helpText: Ut(t.type, i),
                        translate: i
                    })
                },
                pl = function() {
                    return r().createElement("div", {
                        id: "crossDeviceLoginDisplayCodeModal-container"
                    })
                },
                hl = function() {
                    return (0, n.useEffect)((function() {
                        null == u.CrossDeviceLoginDisplayCodeService || u.CrossDeviceLoginDisplayCodeService.openModal(), jc()
                    }), []), null
                },
                vl = function() {
                    return vl = Object.assign || function(e) {
                        for (var n, t = 1, r = arguments.length; t < r; t++)
                            for (var o in n = arguments[t]) Object.prototype.hasOwnProperty.call(n, o) && (e[o] = n[o]);
                        return e
                    }, vl.apply(this, arguments)
                },
                gl = function(e, n) {
                    var t = {};
                    for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && n.indexOf(r) < 0 && (t[r] = e[r]);
                    if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                        var o = 0;
                        for (r = Object.getOwnPropertySymbols(e); o < r.length; o++) n.indexOf(r[o]) < 0 && Object.prototype.propertyIsEnumerable.call(e, r[o]) && (t[r[o]] = e[r[o]])
                    }
                    return t
                },
                ml = $e.context.lrLoginForm,
                yl = $e.field,
                bl = yl.username,
                wl = yl.password,
                Sl = yl.OTP,
                El = $e.btn,
                Al = El.login,
                xl = El.xdl,
                Cl = El.forgotCredentials,
                _l = El.createAccount,
                kl = El.showPassword,
                Ll = El.hidePassword,
                Pl = $e.state,
                Ol = Pl.focused,
                Il = Pl.unfocused,
                Tl = function() {
                    var e, t, o, i = (0, n.useRef)(ro()).current,
                        a = (0, n.useState)(!1),
                        u = a[0],
                        c = a[1],
                        s = (0, Qu.useQuery)({
                            queryKey: ["otp-metadata"],
                            queryFn: function() {
                                return Ln(He)
                            },
                            placeholderData: {
                                OtpCodeLength: 100,
                                IsOtpEnabled: !0
                            }
                        }),
                        f = (0, l.useTranslation)().translate,
                        d = Rc(),
                        p = d.identifier,
                        h = d.password,
                        v = d.errorMessage,
                        g = gl(d, ["identifier", "password", "errorMessage"]),
                        m = el({
                            onMagicLinkLoginError: function() {
                                return c(!0)
                            }
                        }),
                        y = m.isPending || "login" !== g.step,
                        b = "limit-reached" === g.switchAccount,
                        w = y || b,
                        S = "adding-account" === g.switchAccount ? Ke + "?" + new URLSearchParams({
                            returnUrl: Tt()
                        }).toString() : Kn(),
                        E = "" === p ? "" : "?" + new URLSearchParams({
                            identifier: p
                        }).toString();
                    return (0, n.useEffect)((function() {
                        b && Hc(f, (function() {
                            return Gn(Tt())
                        }))
                    }), [b, f]), (0, n.useEffect)((function() {
                        if (i) {
                            var e = new URLSearchParams(window.location.search);
                            e.delete(to);
                            var n = e.toString();
                            window.history.replaceState(null, "", window.location.pathname + (n ? "?" + n : "") + window.location.hash), m.mutate({
                                credential: {
                                    type: _.MagicLink,
                                    value: i,
                                    password: i
                                }
                            })
                        }
                    }), []), (0, n.useEffect)((function() {
                        var e = function(e) {
                            return function(n) {
                                if (n.detail && !e.isPending) {
                                    var t = n.detail,
                                        r = t.code,
                                        o = t.privateKey,
                                        i = {
                                            type: _.AuthToken,
                                            value: r,
                                            password: o
                                        };
                                    e.mutate({
                                        credential: i
                                    })
                                }
                            }
                        }(m);
                        return window.addEventListener("OnCrossDeviceCodeValidated", e),
                            function() {
                                window.removeEventListener("OnCrossDeviceCodeValidated", e)
                            }
                    }), [m]), r().createElement(r().Fragment, null, r().createElement("style", null, "\nlabel {\n  margin-bottom: 0;\n}\nh3 {\n  text-transform: none;\n}"), r().createElement("div", {
                        className: "flex flex-col gap-xsmall"
                    }, r().createElement("h2", {
                        className: "content-emphasis text-heading-large padding-none"
                    }, "adding-account" === g.switchAccount ? f(F) : f(W)), r().createElement("span", {
                        className: "content-default text-body-large"
                    }, f(V))), r().createElement("form", {
                        className: "flex flex-col gap-xlarge",
                        onSubmit: function(e) {
                            if (e.preventDefault(), !w) {
                                rn(), yn(Al, "", ml);
                                var n = {
                                    type: Ot(p),
                                    value: p,
                                    password: h
                                };
                                m.mutate({
                                    credential: n
                                })
                            }
                        }
                    }, r().createElement("div", {
                        className: "flex flex-col gap-medium"
                    }, r().createElement(sc, {
                        label: f(z),
                        placeholder: f(z),
                        autoComplete: "username webauthn",
                        id: "login-username",
                        name: "username",
                        value: p,
                        isSignup: !1,
                        reserveErrorSpace: !1,
                        onChange: Uc,
                        hasError: null != v,
                        isDisabled: w,
                        onFocus: function() {
                            return wn(ml, bl, Ol)
                        },
                        onBlur: function() {
                            return wn(ml, bl, Il)
                        }
                    }), r().createElement(Ec, {
                        label: f(B),
                        placeholder: f(B),
                        id: "login-password",
                        name: "password",
                        autoComplete: "current-password",
                        value: h,
                        onChange: Nc,
                        error: v,
                        isDisabled: w,
                        onFocus: function() {
                            return wn(ml, wl, Ol)
                        },
                        onBlur: function() {
                            return wn(ml, wl, Il)
                        },
                        onShowPassword: function() {
                            return yn(kl, "", ml)
                        },
                        onHidePassword: function() {
                            return yn(Ll, "", ml)
                        }
                    })), r().createElement("div", {
                        className: "flex flex-col gap-medium"
                    }, r().createElement(Wu, {
                        isLoading: y,
                        isDisabled: b,
                        size: "Medium",
                        variant: "Emphasis",
                        type: "submit",
                        formNoValidate: !0
                    }, f(R)), r().createElement(Wu, {
                        size: "Medium",
                        variant: "ActionUtility",
                        as: "a",
                        href: "" + T.forgotCredentialsUrl + E,
                        isDisabled: w,
                        onClick: function() {
                            return yn(Cl, "", ml)
                        }
                    }, f(U))), r().createElement("div", {
                        className: "flex items-center gap-medium"
                    }, r().createElement("div", {
                        className: "fill"
                    }, r().createElement(Zu, null)), r().createElement("span", {
                        className: "content-default text-label-medium"
                    }, f(N)), r().createElement("div", {
                        className: "fill"
                    }, r().createElement(Zu, null))), r().createElement("div", {
                        className: "flex flex-col gap-small"
                    }, (null === (e = s.data) || void 0 === e ? void 0 : e.IsOtpEnabled) && r().createElement(Wu, {
                        size: "Medium",
                        variant: "Standard",
                        isDisabled: w,
                        onClick: function() {
                            on(), yn(Sl, "", ml), Rc.setState({
                                step: "otp"
                            })
                        }
                    }, r().createElement("span", {
                        className: "flex items-center gap-small"
                    }, r().createElement(su, {
                        name: "icon-regular-envelope"
                    }), f(D))), r().createElement(Wu, {
                        size: "Medium",
                        variant: "Standard",
                        isDisabled: w,
                        onClick: function() {
                            tn(), yn(xl, "", ml), Rc.setState({
                                step: "xdl"
                            })
                        }
                    }, r().createElement("span", {
                        className: "flex items-center gap-small"
                    }, r().createElement(su, {
                        name: "icon-regular-squares-grid-qr"
                    }), f(j))), r().createElement(Wu, {
                        size: "Medium",
                        variant: "ActionUtility",
                        as: "a",
                        href: S,
                        isDisabled: w,
                        onClick: function() {
                            return yn(_l, "", ml)
                        }
                    }, r().createElement("span", {
                        dangerouslySetInnerHTML: {
                            __html: f(M, {
                                startTag: '<span style="text-decoration: underline; text-decoration-skip-ink: none;">',
                                endTag: "</span>"
                            })
                        }
                    })))), "login" === g.step ? r().createElement(cl, {
                        login: m
                    }) : null, "otp" === g.step ? r().createElement(ll, {
                        codeLength: null !== (o = null === (t = s.data) || void 0 === t ? void 0 : t.OtpCodeLength) && void 0 !== o ? o : 100
                    }) : null, r().createElement(pl, null), "xdl" === g.step ? r().createElement(hl, null) : null, "select-account" === g.step ? r().createElement(dl, vl({}, g)) : null, "security-questions" === g.step ? r().createElement(sl, vl({}, g)) : null, "security-notification" === g.step ? r().createElement(fl, vl({}, g)) : null, "2sv" === g.step ? r().createElement(il, vl({}, g)) : null, r().createElement(Vu, {
                        isOpen: u,
                        onClose: function() {
                            return c(!1)
                        },
                        translate: f
                    }))
                },
                Rl = t(8217),
                Ul = t.n(Rl),
                Nl = function(e) {
                    var t = e.loggedInUsers,
                        o = (0, l.useTranslation)().translate,
                        i = (0, n.useState)(!1),
                        a = i[0],
                        u = i[1];
                    if (a) return r().createElement("div", {
                        className: "height-full flex items-center"
                    }, r().createElement(s.Loading, null));
                    var c = Nt(),
                        f = function() {
                            return Dc({
                                switchAccount: "adding-account"
                            })
                        };
                    return r().createElement("div", {
                        className: "login-revamp-account-switcher flex flex-col width-full gap-xlarge"
                    }, r().createElement("div", {
                        className: "flex flex-col gap-xsmall"
                    }, r().createElement("h2", {
                        className: "content-emphasis text-heading-large padding-none"
                    }, o(q)), r().createElement("span", {
                        className: "content-default text-body-large"
                    }, o(H))), r().createElement(ur, {
                        containerId: ee,
                        onAccountSwitched: function() {
                            u(!0), Qn()
                        },
                        handleAddAccount: f,
                        suppressAddAccountRow: !0,
                        removeInvalidActiveUser: !0,
                        translate: o,
                        loggedInUsers: t
                    }), r().createElement("div", {
                        className: "flex flex-col gap-medium"
                    }, r().createElement(Wu, {
                        size: "Medium",
                        variant: "Standard",
                        onClick: function() {
                            nt($e.context.accountSwitcherLogin, $e.btn.addAccount), f()
                        }
                    }, o(G)), r().createElement(Wu, {
                        size: "Medium",
                        variant: "Standard",
                        as: "a",
                        href: c,
                        onClick: function() {
                            return nt($e.context.accountSwitcherLogin, $e.btn.createAccount)
                        }
                    }, o(K))))
                },
                Dl = $e.context.lrLoginForm,
                jl = function() {
                    var e, t, o, i = pr(!(null !== (e = null === c.authenticatedUser || void 0 === c.authenticatedUser ? void 0 : c.authenticatedUser.isAuthenticated) && void 0 !== e && e)),
                        a = i.loggedInUsers,
                        l = i.isGettingLoggedInUsers,
                        f = null !== (t = null === u.AccountSwitcherService || void 0 === u.AccountSwitcherService ? void 0 : u.AccountSwitcherService.useIsAccountSwitcherAvailableForBrowser()) && void 0 !== t ? t : [!1, !1],
                        d = f[0],
                        p = f[1],
                        h = l || !p,
                        v = (0, n.useRef)(Boolean(ro())).current,
                        g = Rc((function(e) {
                            return e.step
                        })),
                        m = !h && !v && d && !c.authenticatedUser.isAuthenticated && Boolean(null === (o = null == a ? void 0 : a.usersAvailableForSwitching) || void 0 === o ? void 0 : o.length);
                    switch ((0, n.useEffect)((function() {
                            if (!h)
                                if (m) {
                                    var e = a.usersAvailableForSwitching.map((function(e) {
                                        return e.id
                                    })).join(",");
                                    bn(Dl, $e.field.accountSwitcher), hn(e), Rc.setState({
                                        step: "switch-account"
                                    })
                                } else Dc({
                                    switchAccount: a.isAccountLimitReached ? "limit-reached" : void 0
                                })
                        }), [h, m, a]), vr(c.authenticatedUser.isAuthenticated && p && !d && !v), g) {
                        case "loading":
                            return r().createElement("div", {
                                className: "height-full flex items-center"
                            }, r().createElement(s.Loading, null));
                        case "switch-account":
                            return r().createElement(Nl, {
                                loggedInUsers: a
                            });
                        default:
                            return r().createElement(Tl, null)
                    }
                },
                Ml = function() {
                    return (0, n.useEffect)((function() {
                        bn(Dl)
                    }), []), (0, n.useEffect)((function() {
                        try {
                            (0, f.dataStores.authIntentDataStore.saveGameIntentFromReturnUrl)()
                        } catch (e) {
                            console.error("intent saving error: ", e)
                        }
                    }), []), r().createElement("div", {
                        className: "login-revamp-container"
                    }, r().createElement(Xu, {
                        className: "bg-surface-0 justify-center",
                        style: {
                            width: "100%",
                            minHeight: "100vh"
                        },
                        left: r().createElement("div", {
                            className: Yu()("flex flex-col gap-xlarge size-full", "padding-top-[var(--size-2200)] padding-x-xlarge medium:padding-x-[var(--size-1200)] large:padding-x-[var(--size-1600)]")
                        }, r().createElement(jl, null)),
                        right: r().createElement("div", {
                            className: "relative size-full clip"
                        }, r().createElement("img", {
                            className: "absolute size-full select-none",
                            style: {
                                objectFit: "cover",
                                opacity: .7
                            },
                            src: Ul(),
                            alt: "",
                            draggable: !1
                        }))
                    }), r().createElement("div", {
                        id: Fc
                    }))
                },
                zl = function() {
                    return r().createElement(l.TranslationProvider, {
                        config: An
                    }, r().createElement(Qu.QueryClientProvider, {
                        client: l.queryClient
                    }, r().createElement(Ml, null)))
                },
                Bl = function() {
                    var e;
                    if (function() {
                            var e, n = document.querySelector('meta[name="page-meta"]');
                            return "Landing" === (null === (e = null == n ? void 0 : n.dataset) || void 0 === e ? void 0 : e.internalPageName)
                        }() && new URLSearchParams(window.location.search).get("dataToken")) return !1;
                    var n = document.querySelector('meta[name="account-experience-revamp-data"]');
                    return "true" === (null !== (e = null == n ? void 0 : n.dataset) && void 0 !== e ? e : {}).isAccountExperienceRevampEnabled
                };

            function Fl() {
                var e = qn() || Vn();
                if (e) {
                    "react-login-web-app" === e.id && e.classList.add("login-container");
                    var n = Bl() ? r().createElement(zl, null) : r().createElement(Ku, null);
                    (0, o.render)(n, e)
                } else window.requestAnimationFrame(Fl)
            }(0, a.ready)((function() {
                var e, n;
                if (c.authenticatedUser && c.authenticatedUser.isAuthenticated && c.authenticatedUser.isUnder13) {
                    var t = It();
                    window.location.href = t || u.EnvironmentUrls.websiteUrl + "/home"
                } else null === (n = null === (e = null === u.AccountIntegrityChallengeService || void 0 === u.AccountIntegrityChallengeService ? void 0 : u.AccountIntegrityChallengeService.CaptchaV2) || void 0 === e ? void 0 : e.preloadSensor) || void 0 === n || n.call(e), Fl()
            }))
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/d92012a9589ae31c61c5657587f57bdf-reactLogin.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ReactLogin");