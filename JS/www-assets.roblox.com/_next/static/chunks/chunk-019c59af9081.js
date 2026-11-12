;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "cbf709a1-b94d-bd34-bc39-4cd08cd863b4")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 721037, e => {
    "use strict";
    e.s(["isMessage", 0, function(e, t) {
        return !!(null !== e && "object" == typeof e && "$typeName" in e && "string" == typeof e.$typeName) && (void 0 === t || t.typeName === e.$typeName)
    }])
}, 491819, e => {
    "use strict";
    var t, n;
    (n = t || (t = {}))[n.DOUBLE = 1] = "DOUBLE", n[n.FLOAT = 2] = "FLOAT", n[n.INT64 = 3] = "INT64", n[n.UINT64 = 4] = "UINT64", n[n.INT32 = 5] = "INT32", n[n.FIXED64 = 6] = "FIXED64", n[n.FIXED32 = 7] = "FIXED32", n[n.BOOL = 8] = "BOOL", n[n.STRING = 9] = "STRING", n[n.BYTES = 12] = "BYTES", n[n.UINT32 = 13] = "UINT32", n[n.SFIXED32 = 15] = "SFIXED32", n[n.SFIXED64 = 16] = "SFIXED64", n[n.SINT32 = 17] = "SINT32", n[n.SINT64 = 18] = "SINT64", e.s(["ScalarType", 0, t])
}, 669207, 512551, e => {
    "use strict";
    var t = e.i(737344);

    function n(e) {
        let t = "-" === e[0];
        t && (e = e.slice(1));
        let n = 0,
            a = 0;

        function r(t, r) {
            let i = Number(e.slice(t, r));
            a *= 1e6, (n = 1e6 * n + i) >= 0x100000000 && (a += n / 0x100000000 | 0, n %= 0x100000000)
        }
        return r(-24, -18), r(-18, -12), r(-12, -6), r(-6), t ? o(n, a) : i(n, a)
    }

    function a(e, t) {
        let n = i(e, t),
            a = 0x80000000 & n.hi;
        a && (n = o(n.lo, n.hi));
        let s = r(n.lo, n.hi);
        return a ? "-" + s : s
    }

    function r(e, t) {
        if ({
                lo: e,
                hi: t
            } = {
                lo: e >>> 0,
                hi: t >>> 0
            }, t <= 2097151) return String(0x100000000 * t + e);
        let n = 0xffffff & e,
            a = (e >>> 24 | t << 8) & 0xffffff,
            r = t >> 16 & 65535,
            i = n + 6777216 * a + 6710656 * r,
            o = a + 8147497 * r,
            l = 2 * r;
        return i >= 1e7 && (o += Math.floor(i / 1e7), i %= 1e7), o >= 1e7 && (l += Math.floor(o / 1e7), o %= 1e7), l.toString() + s(o) + s(i)
    }

    function i(e, t) {
        return {
            lo: 0 | e,
            hi: 0 | t
        }
    }

    function o(e, t) {
        return t = ~t, e ? e = ~e + 1 : t += 1, i(e, t)
    }
    let s = e => {
        let t = String(e);
        return "0000000".slice(t.length) + t
    };
    e.s(["int64FromString", 0, n, "int64ToString", 0, a, "uInt64ToString", 0, r, "varint32read", 0, function() {
        let e = this.buf[this.pos++],
            t = 127 & e;
        if ((128 & e) == 0 || (t |= (127 & (e = this.buf[this.pos++])) << 7, (128 & e) == 0) || (t |= (127 & (e = this.buf[this.pos++])) << 14, (128 & e) == 0) || (t |= (127 & (e = this.buf[this.pos++])) << 21, (128 & e) == 0)) return this.assertBounds(), t;
        t |= (15 & (e = this.buf[this.pos++])) << 28;
        for (let t = 5;
            (128 & e) != 0 && t < 10; t++) e = this.buf[this.pos++];
        if ((128 & e) != 0) throw Error("invalid varint");
        return this.assertBounds(), t >>> 0
    }, "varint32write", 0, function(e, t) {
        if (e >= 0) {
            for (; e > 127;) t.push(127 & e | 128), e >>>= 7;
            t.push(e)
        } else {
            for (let n = 0; n < 9; n++) t.push(127 & e | 128), e >>= 7;
            t.push(1)
        }
    }, "varint64read", 0, function() {
        let e = 0,
            t = 0;
        for (let n = 0; n < 28; n += 7) {
            let a = this.buf[this.pos++];
            if (e |= (127 & a) << n, (128 & a) == 0) return this.assertBounds(), [e, t]
        }
        let n = this.buf[this.pos++];
        if (e |= (15 & n) << 28, t = (112 & n) >> 4, (128 & n) == 0) return this.assertBounds(), [e, t];
        for (let n = 3; n <= 31; n += 7) {
            let a = this.buf[this.pos++];
            if (t |= (127 & a) << n, (128 & a) == 0) return this.assertBounds(), [e, t]
        }
        throw Error("invalid varint")
    }, "varint64write", 0, function(e, t, n) {
        for (let a = 0; a < 28; a += 7) {
            let r = e >>> a,
                i = r >>> 7 != 0 || 0 != t,
                o = (i ? 128 | r : r) & 255;
            if (n.push(o), !i) return
        }
        let a = e >>> 28 & 15 | (7 & t) << 4,
            r = t >> 3 != 0;
        if (n.push((r ? 128 | a : a) & 255), r) {
            for (let e = 3; e < 31; e += 7) {
                let a = t >>> e,
                    r = a >>> 7 != 0,
                    i = (r ? 128 | a : a) & 255;
                if (n.push(i), !r) return
            }
            n.push(t >>> 31 & 1)
        }
    }], 512551);
    let l = function() {
        let e = new DataView(new ArrayBuffer(8));
        if ("function" == typeof BigInt && "function" == typeof e.getBigInt64 && "function" == typeof e.getBigUint64 && "function" == typeof e.setBigInt64 && "function" == typeof e.setBigUint64 && (globalThis.Deno || globalThis.Bun || "object" != typeof t.default || "object" != typeof t.default.env || "1" !== t.default.env.BUF_BIGINT_DISABLE)) {
            let t = BigInt("-9223372036854775808"),
                n = BigInt("9223372036854775807"),
                a = BigInt("0"),
                r = BigInt("18446744073709551615");
            return {
                zero: BigInt(0),
                supported: !0,
                parse(e) {
                    let a = "bigint" == typeof e ? e : BigInt(e);
                    if (a > n || a < t) throw Error(`invalid int64: ${e}`);
                    return a
                },
                uParse(e) {
                    let t = "bigint" == typeof e ? e : BigInt(e);
                    if (t > r || t < a) throw Error(`invalid uint64: ${e}`);
                    return t
                },
                enc(t) {
                    return e.setBigInt64(0, this.parse(t), !0), {
                        lo: e.getInt32(0, !0),
                        hi: e.getInt32(4, !0)
                    }
                },
                uEnc(t) {
                    return e.setBigInt64(0, this.uParse(t), !0), {
                        lo: e.getInt32(0, !0),
                        hi: e.getInt32(4, !0)
                    }
                },
                dec: (t, n) => (e.setInt32(0, t, !0), e.setInt32(4, n, !0), e.getBigInt64(0, !0)),
                uDec: (t, n) => (e.setInt32(0, t, !0), e.setInt32(4, n, !0), e.getBigUint64(0, !0))
            }
        }
        return {
            zero: "0",
            supported: !1,
            parse: e => ("string" != typeof e && (e = e.toString()), u(e), e),
            uParse: e => ("string" != typeof e && (e = e.toString()), p(e), e),
            enc: e => ("string" != typeof e && (e = e.toString()), u(e), n(e)),
            uEnc: e => ("string" != typeof e && (e = e.toString()), p(e), n(e)),
            dec: (e, t) => a(e, t),
            uDec: (e, t) => r(e, t)
        }
    }();

    function u(e) {
        if (!/^-?[0-9]+$/.test(e)) throw Error("invalid int64: " + e)
    }

    function p(e) {
        if (!/^[0-9]+$/.test(e)) throw Error("invalid uint64: " + e)
    }
    e.s(["protoInt64", 0, l], 669207)
}, 747690, 7657, e => {
    "use strict";
    var t = e.i(669207),
        n = e.i(491819);

    function a(e, a) {
        switch (e) {
            case n.ScalarType.STRING:
                return "";
            case n.ScalarType.BOOL:
                return !1;
            case n.ScalarType.DOUBLE:
            case n.ScalarType.FLOAT:
                return 0;
            case n.ScalarType.INT64:
            case n.ScalarType.UINT64:
            case n.ScalarType.SFIXED64:
            case n.ScalarType.FIXED64:
            case n.ScalarType.SINT64:
                return a ? "0" : t.protoInt64.zero;
            case n.ScalarType.BYTES:
                return new Uint8Array(0);
            default:
                return 0
        }
    }

    function r(e, t) {
        switch (e) {
            case n.ScalarType.BOOL:
                return !1 === t;
            case n.ScalarType.STRING:
                return "" === t;
            case n.ScalarType.BYTES:
                return t instanceof Uint8Array && !t.byteLength;
            case n.ScalarType.DOUBLE:
            case n.ScalarType.FLOAT:
                return Object.is(t, 0);
            default:
                return 0 == t
        }
    }
    e.s(["isScalarZeroValue", 0, r, "scalarZeroValue", 0, a], 7657);
    let i = Symbol.for("reflect unsafe local");
    e.s(["unsafeClear", 0, function(e, t) {
        let n = t.localName;
        if (t.oneof) {
            let a = t.oneof.localName;
            e[a].case === n && (e[a] = {
                case: void 0
            })
        } else if (2 != t.presence) delete e[n];
        else switch (t.fieldKind) {
            case "map":
                e[n] = {};
                break;
            case "list":
                e[n] = [];
                break;
            case "enum":
                e[n] = t.enum.values[0].number;
                break;
            case "scalar":
                e[n] = a(t.scalar, t.longAsString)
        }
    }, "unsafeGet", 0, function(e, t) {
        if (t.oneof) {
            let n = e[t.oneof.localName];
            return n.case === t.localName ? n.value : void 0
        }
        return e[t.localName]
    }, "unsafeIsSet", 0, function(e, t) {
        let n = t.localName;
        if (t.oneof) return e[t.oneof.localName].case === n;
        if (2 != t.presence) return void 0 !== e[n] && Object.prototype.hasOwnProperty.call(e, n);
        switch (t.fieldKind) {
            case "list":
                return e[n].length > 0;
            case "map":
                return Object.keys(e[n]).length > 0;
            case "scalar":
                return !r(t.scalar, e[n]);
            case "enum":
                return e[n] !== t.enum.values[0].number
        }
        throw Error("message field with implicit presence")
    }, "unsafeIsSetExplicit", 0, function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t) && void 0 !== e[t]
    }, "unsafeLocal", 0, i, "unsafeOneofCase", 0, function(e, t) {
        let n = e[t.localName].case;
        return void 0 === n ? n : t.fields.find(e => e.localName === n)
    }, "unsafeSet", 0, function(e, t, n) {
        t.oneof ? e[t.oneof.localName] = {
            case: t.localName,
            value: n
        } : e[t.localName] = n
    }], 747690)
}, 114052, e => {
    "use strict";
    var t = e.i(747690);

    function n(e) {
        return null !== e && "object" == typeof e && !Array.isArray(e)
    }
    e.s(["isObject", 0, n, "isReflectList", 0, function(e, a) {
        var r, i, o, s;
        if (n(e) && t.unsafeLocal in e && "add" in e && "field" in e && "function" == typeof e.field) {
            if (void 0 !== a) {
                let t = e.field();
                return a.listKind == t.listKind && a.scalar === t.scalar && (null == (r = a.message) ? void 0 : r.typeName) === (null == (i = t.message) ? void 0 : i.typeName) && (null == (o = a.enum) ? void 0 : o.typeName) === (null == (s = t.enum) ? void 0 : s.typeName)
            }
            return !0
        }
        return !1
    }, "isReflectMap", 0, function(e, a) {
        var r, i, o, s;
        if (n(e) && t.unsafeLocal in e && "has" in e && "field" in e && "function" == typeof e.field) {
            if (void 0 !== a) {
                let t = e.field();
                return a.mapKey === t.mapKey && a.mapKind == t.mapKind && a.scalar === t.scalar && (null == (r = a.message) ? void 0 : r.typeName) === (null == (i = t.message) ? void 0 : i.typeName) && (null == (o = a.enum) ? void 0 : o.typeName) === (null == (s = t.enum) ? void 0 : s.typeName)
            }
            return !0
        }
        return !1
    }, "isReflectMessage", 0, function(e, a) {
        return n(e) && t.unsafeLocal in e && "desc" in e && n(e.desc) && "message" === e.desc.kind && (void 0 === a || e.desc.typeName == a.typeName)
    }])
}, 343549, 465336, e => {
    "use strict";
    var t = e.i(721037),
        n = e.i(491819),
        a = e.i(7657),
        r = e.i(114052),
        i = e.i(747690);

    function o(e) {
        let t = e.fields[0];
        return s(e.typeName) && void 0 !== t && "scalar" == t.fieldKind && "value" == t.name && 1 == t.number
    }

    function s(e) {
        return e.startsWith("google.protobuf.") && ["DoubleValue", "FloatValue", "Int64Value", "UInt64Value", "Int32Value", "UInt32Value", "BoolValue", "StringValue", "BytesValue"].includes(e.substring(16))
    }

    function l(e, a) {
        if ((0, t.isMessage)(a, e)) return a;
        let o = function(e) {
            let t;
            if (function(e) {
                    switch (e.file.edition) {
                        case 999:
                            return !1;
                        case 998:
                            return !0;
                        default:
                            return e.fields.some(e => 2 != e.presence && "message" != e.fieldKind && !e.oneof)
                    }
                }(e)) {
                let n, a, r = d.get(e);
                if (r)({
                    prototype: n,
                    members: a
                } = r);
                else {
                    for (let t of (n = {}, a = new Set, e.members)) "oneof" != t.kind && ("scalar" == t.fieldKind || "enum" == t.fieldKind) && 2 != t.presence && (a.add(t), n[t.localName] = b(t));
                    d.set(e, {
                        prototype: n,
                        members: a
                    })
                }
                for (let r of ((t = Object.create(n)).$typeName = e.typeName, e.members))
                    if (!a.has(r)) {
                        if ("field" == r.kind && ("message" == r.fieldKind || ("scalar" == r.fieldKind || "enum" == r.fieldKind) && 2 != r.presence)) continue;
                        t[r.localName] = b(r)
                    }
            } else
                for (let n of (t = {
                        $typeName: e.typeName
                    }, e.members))("oneof" == n.kind || 2 == n.presence) && (t[n.localName] = b(n));
            return t
        }(e);
        return void 0 !== a && function(e, t, a) {
            for (let o of e.members) {
                let e, s = a[o.localName];
                if (null != s) {
                    if ("oneof" == o.kind) {
                        let t = (0, i.unsafeOneofCase)(a, o);
                        if (!t) continue;
                        e = t, s = (0, i.unsafeGet)(a, t)
                    } else e = o;
                    switch (e.fieldKind) {
                        case "message":
                            s = p(e, s);
                            break;
                        case "scalar":
                            s = u(e, s);
                            break;
                        case "list":
                            s = function(e, t) {
                                if (Array.isArray(t)) {
                                    if (e.scalar == n.ScalarType.BYTES) return t.map(m);
                                    if ("message" == e.listKind) return t.map(t => p(e, t))
                                }
                                return t
                            }(e, s);
                            break;
                        case "map":
                            s = function(e, t) {
                                if ((0, r.isObject)(t)) {
                                    if (e.scalar == n.ScalarType.BYTES) return c(t, m);
                                    if ("message" == e.mapKind) return c(t, t => p(e, t))
                                }
                                return t
                            }(e, s)
                    }(0, i.unsafeSet)(t, e, s)
                }
            }
        }(e, o, a), o
    }

    function u(e, t) {
        return e.scalar == n.ScalarType.BYTES ? m(t) : t
    }

    function p(e, n) {
        if ("message" == e.fieldKind && !e.oneof && o(e.message)) return u(e.message.fields[0], n);
        if ((0, r.isObject)(n)) {
            if ("google.protobuf.Struct" == e.message.typeName && "google.protobuf.Value" !== e.parent.typeName) return n;
            if (!(0, t.isMessage)(n, e.message)) return l(e.message, n)
        }
        return n
    }

    function m(e) {
        return Array.isArray(e) ? new Uint8Array(e) : e
    }

    function c(e, t) {
        let n = {};
        for (let a of Object.entries(e)) n[a[0]] = t(a[1]);
        return n
    }
    e.s(["hasCustomJsonRepresentation", 0, function(e) {
        switch (e.typeName) {
            case "google.protobuf.Any":
            case "google.protobuf.Timestamp":
            case "google.protobuf.Duration":
            case "google.protobuf.FieldMask":
            case "google.protobuf.Struct":
            case "google.protobuf.Value":
            case "google.protobuf.ListValue":
                return !0;
            default:
                return o(e)
        }
    }, "isWrapper", 0, function(e) {
        return s(e.$typeName)
    }, "isWrapperDesc", 0, o], 465336);
    let f = Symbol(),
        d = new WeakMap;

    function b(e) {
        if ("oneof" == e.kind) return {
            case: void 0
        };
        if ("list" == e.fieldKind) return [];
        if ("map" == e.fieldKind) return {};
        if ("message" == e.fieldKind) return f;
        let t = e.getDefaultValue();
        return void 0 !== t ? "scalar" == e.fieldKind && e.longAsString ? t.toString() : t : "scalar" == e.fieldKind ? (0, a.scalarZeroValue)(e.scalar, e.longAsString) : e.enum.values[0].number
    }
    e.s(["create", 0, l], 343549)
}, 1558, 123982, e => {
    "use strict";
    let t, n;
    e.s(["base64Decode", 0, function(e) {
        let a = function() {
                if (!n) {
                    n = [];
                    let e = (t || (t = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".split("")).slice(0, -2).concat("-", "_"), t);
                    for (let t = 0; t < e.length; t++) n[e[t].charCodeAt(0)] = t;
                    n[45] = e.indexOf("+"), n[95] = e.indexOf("/")
                }
                return n
            }(),
            r = 3 * e.length / 4;
        "=" == e[e.length - 2] ? r -= 2 : "=" == e[e.length - 1] && (r -= 1);
        let i = new Uint8Array(r),
            o = 0,
            s = 0,
            l, u = 0;
        for (let t = 0; t < e.length; t++) {
            if (void 0 === (l = a[e.charCodeAt(t)])) switch (e[t]) {
                case "=":
                    s = 0;
                case "\n":
                case "\r":
                case "	":
                case " ":
                    continue;
                default:
                    throw Error("invalid base64 string")
            }
            switch (s) {
                case 0:
                    u = l, s = 1;
                    break;
                case 1:
                    i[o++] = u << 2 | (48 & l) >> 4, u = l, s = 2;
                    break;
                case 2:
                    i[o++] = (15 & u) << 4 | (60 & l) >> 2, u = l, s = 3;
                    break;
                case 3:
                    i[o++] = (3 & u) << 6 | l, s = 0
            }
        }
        if (1 == s) throw Error("invalid base64 string");
        return i.subarray(0, o)
    }], 1558);
    let a = new Set(["constructor", "toString", "toJSON", "valueOf"]);
    e.s(["protoCamelCase", 0, function(e) {
        let t = !1,
            n = [];
        for (let a = 0; a < e.length; a++) {
            let r = e.charAt(a);
            switch (r) {
                case "_":
                    t = !0;
                    break;
                case "0":
                case "1":
                case "2":
                case "3":
                case "4":
                case "5":
                case "6":
                case "7":
                case "8":
                case "9":
                    n.push(r), t = !1;
                    break;
                default:
                    t && (t = !1, r = r.toUpperCase()), n.push(r)
            }
        }
        return n.join("")
    }, "protoSnakeCase", 0, function(e) {
        return e.replace(/[A-Z]/g, e => "_" + e.toLowerCase())
    }, "safeObjectProperty", 0, function(e) {
        return a.has(e) ? e + "$" : e
    }], 123982)
}, 996251, 757886, 114283, 84523, e => {
    "use strict";
    var t = e.i(123982),
        n = e.i(747690);

    function a(e) {
        for (let a of e.field)(0, n.unsafeIsSetExplicit)(a, "jsonName") || (a.jsonName = (0, t.protoCamelCase)(a.name));
        e.nestedType.forEach(a)
    }
    e.s(["restoreJsonNames", 0, a], 757886);
    var r = e.i(491819),
        i = e.i(669207);

    function o() {
        let e, t, n;
        for (var a = arguments.length, r = Array(a), i = 0; i < a; i++) r[i] = arguments[i];
        let o = (e = new Map, t = new Map, n = new Map, {
            kind: "registry",
            types: e,
            extendees: t,
            [Symbol.iterator]: () => e.values(),
            get files() {
                return n.values()
            },
            addFile(e, t, a) {
                if (n.set(e.proto.name, e), !t)
                    for (let t of function* e(t) {
                            switch (t.kind) {
                                case "file":
                                    for (let n of t.messages) yield n, yield* e(n);
                                    yield* t.enums, yield* t.services, yield* t.extensions;
                                    break;
                                case "message":
                                    for (let n of t.nestedMessages) yield n, yield* e(n);
                                    yield* t.nestedEnums, yield* t.nestedExtensions
                            }
                        }(e)) this.add(t);
                if (a)
                    for (let n of e.dependencies) this.addFile(n, t, a)
            },
            add(n) {
                if ("extension" == n.kind) {
                    let e = t.get(n.extendee.typeName);
                    e || t.set(n.extendee.typeName, e = new Map), e.set(n.number, n)
                }
                e.set(n.typeName, n)
            },
            get: t => e.get(t),
            getFile: e => n.get(e),
            getMessage(t) {
                let n = e.get(t);
                return (null == n ? void 0 : n.kind) == "message" ? n : void 0
            },
            getEnum(t) {
                let n = e.get(t);
                return (null == n ? void 0 : n.kind) == "enum" ? n : void 0
            },
            getExtension(t) {
                let n = e.get(t);
                return (null == n ? void 0 : n.kind) == "extension" ? n : void 0
            },
            getExtensionFor(e, n) {
                var a;
                return null == (a = t.get(e.typeName)) ? void 0 : a.get(n)
            },
            getService(t) {
                let n = e.get(t);
                return (null == n ? void 0 : n.kind) == "service" ? n : void 0
            }
        });
        if (!r.length) return o;
        if ("$typeName" in r[0] && "google.protobuf.FileDescriptorSet" == r[0].$typeName) {
            for (let e of r[0].file) l(e, o);
            return o
        }
        if ("$typeName" in r[0]) {
            let e = r[0],
                t = r[1],
                n = new Set;
            for (let a of [e, ... function e(a) {
                    let r = [];
                    for (let e of a.dependency) {
                        if (void 0 != o.getFile(e) || n.has(e)) continue;
                        let i = t(e);
                        if (!i) throw Error(`Unable to resolve ${e}, imported by ${a.name}`);
                        "kind" in i ? o.addFile(i, !1, !0) : (n.add(i.name), r.push(i))
                    }
                    return r.concat(...r.map(e))
                }(e)].reverse()) l(a, o)
        } else
            for (let e of r)
                for (let t of e.files) o.addFile(t);
        return o
    }
    let s = {
        998: {
            fieldPresence: 1,
            enumType: 2,
            repeatedFieldEncoding: 2,
            utf8Validation: 3,
            messageEncoding: 1,
            jsonFormat: 2,
            enforceNamingStyle: 2,
            defaultSymbolVisibility: 1
        },
        999: {
            fieldPresence: 2,
            enumType: 1,
            repeatedFieldEncoding: 1,
            utf8Validation: 2,
            messageEncoding: 1,
            jsonFormat: 1,
            enforceNamingStyle: 2,
            defaultSymbolVisibility: 1
        },
        1e3: {
            fieldPresence: 1,
            enumType: 1,
            repeatedFieldEncoding: 1,
            utf8Validation: 2,
            messageEncoding: 1,
            jsonFormat: 1,
            enforceNamingStyle: 2,
            defaultSymbolVisibility: 1
        },
        1001: {
            fieldPresence: 1,
            enumType: 1,
            repeatedFieldEncoding: 1,
            utf8Validation: 2,
            messageEncoding: 1,
            jsonFormat: 1,
            enforceNamingStyle: 1,
            defaultSymbolVisibility: 2
        }
    };

    function l(e, n) {
        var a, r, i, o;
        let l = {
                kind: "file",
                proto: e,
                deprecated: null != (r = null == (a = e.options) ? void 0 : a.deprecated) && r,
                edition: function(e) {
                    switch (e.syntax) {
                        case "":
                        case "proto2":
                            return 998;
                        case "proto3":
                            return 999;
                        case "editions":
                            if (9999 === e.edition) return 1001;
                            if (e.edition in s) return e.edition;
                            throw Error(`${e.name}: unsupported edition`);
                        default:
                            throw Error(`${e.name}: unsupported syntax "${e.syntax}"`)
                    }
                }(e),
                name: e.name.replace(/\.proto$/, ""),
                dependencies: (i = e, o = n, i.dependency.map(e => {
                    let t = o.getFile(e);
                    if (!t) throw Error(`Cannot find ${e}, imported by ${i.name}`);
                    return t
                })),
                enums: [],
                messages: [],
                extensions: [],
                services: [],
                toString: () => `file ${e.name}`
            },
            c = new Map,
            b = {
                get: e => c.get(e),
                add(e) {
                    var t;
                    g((null == (t = e.proto.options) ? void 0 : t.mapEntry) === !0), c.set(e.typeName, e)
                }
            };
        for (let t of e.enumType) m(t, l, void 0, n);
        for (let t of e.messageType) ! function e(t, n, a, r, i) {
            var o, s, l, u;
            let p = {
                kind: "message",
                proto: t,
                deprecated: null != (s = null == (o = t.options) ? void 0 : o.deprecated) && s,
                file: n,
                parent: a,
                name: t.name,
                typeName: f(t, a, n),
                fields: [],
                field: {},
                oneofs: [],
                members: [],
                nestedEnums: [],
                nestedMessages: [],
                nestedExtensions: [],
                toString() {
                    return `message ${this.typeName}`
                }
            };
            for (let e of ((null == (l = t.options) ? void 0 : l.mapEntry) === !0 ? i.add(p) : ((null != (u = null == a ? void 0 : a.nestedMessages) ? u : n.messages).push(p), r.add(p)), t.enumType)) m(e, n, p, r);
            for (let a of t.nestedType) e(a, n, p, r, i)
        }(t, l, void 0, n, b);
        for (let a of e.service) ! function(e, n, a) {
            var r, i;
            let o = {
                kind: "service",
                proto: e,
                deprecated: null != (i = null == (r = e.options) ? void 0 : r.deprecated) && i,
                file: n,
                name: e.name,
                typeName: f(e, void 0, n),
                methods: [],
                method: {},
                toString() {
                    return `service ${this.typeName}`
                }
            };
            for (let r of (n.services.push(o), a.add(o), e.method)) {
                let e = function(e, n, a) {
                    var r, i, o, s;
                    let l;
                    l = e.clientStreaming && e.serverStreaming ? "bidi_streaming" : e.clientStreaming ? "client_streaming" : e.serverStreaming ? "server_streaming" : "unary";
                    let u = a.getMessage(d(e.inputType)),
                        p = a.getMessage(d(e.outputType));
                    g(u, `invalid MethodDescriptorProto: input_type ${e.inputType} not found`), g(p, `invalid MethodDescriptorProto: output_type ${e.inputType} not found`);
                    let m = e.name;
                    return {
                        kind: "rpc",
                        proto: e,
                        deprecated: null != (i = null == (r = e.options) ? void 0 : r.deprecated) && i,
                        parent: n,
                        name: m,
                        localName: (0, t.safeObjectProperty)(m.length ? (0, t.safeObjectProperty)(m[0].toLowerCase() + m.substring(1)) : m),
                        methodKind: l,
                        input: u,
                        output: p,
                        idempotency: null != (s = null == (o = e.options) ? void 0 : o.idempotencyLevel) ? s : 0,
                        toString: () => `rpc ${n.typeName}.${m}`
                    }
                }(r, o, a);
                o.methods.push(e), o.method[e.localName] = e
            }
        }(a, l, n);
        for (let e of (u(l, n), c.values())) p(e, n, b);
        for (let e of l.messages) p(e, n, b), u(e, n);
        n.addFile(l, !0)
    }

    function u(e, t) {
        switch (e.kind) {
            case "file":
                for (let n of e.proto.extension) {
                    let a = c(n, e, t);
                    e.extensions.push(a), t.add(a)
                }
                break;
            case "message":
                for (let n of e.proto.extension) {
                    let a = c(n, e, t);
                    e.nestedExtensions.push(a), t.add(a)
                }
                for (let n of e.nestedMessages) u(n, t)
        }
    }

    function p(e, a, r) {
        let i = e.proto.oneofDecl.map(n => {
                var a, r;
                return a = n, {
                    kind: "oneof",
                    proto: a,
                    deprecated: !1,
                    parent: r = e,
                    fields: [],
                    name: a.name,
                    localName: (0, t.safeObjectProperty)((0, t.protoCamelCase)(a.name)),
                    toString() {
                        return `oneof ${r.typeName}.${this.name}`
                    }
                }
            }),
            o = new Set;
        for (let t of e.proto.field) {
            let s = function(e, t) {
                    if (!(0, n.unsafeIsSetExplicit)(e, "oneofIndex") || e.proto3Optional) return;
                    let a = t[e.oneofIndex];
                    return g(a, `invalid FieldDescriptorProto: oneof #${e.oneofIndex} for field #${e.number} not found`), a
                }(t, i),
                l = c(t, e, a, s, r);
            e.fields.push(l), e.field[l.localName] = l, void 0 === s ? e.members.push(l) : (s.fields.push(l), o.has(s) || (o.add(s), e.members.push(s)))
        }
        for (let t of i.filter(e => o.has(e))) e.oneofs.push(t);
        for (let t of e.nestedMessages) p(t, a, r)
    }

    function m(e, n, a, r) {
        var i, o, s, l, u, p, m;
        let c = function(e, t) {
                var n;
                let a = ((n = e).substring(0, 1) + n.substring(1).replace(/[A-Z]/g, e => "_" + e)).toLowerCase() + "_";
                for (let e of t) {
                    if (!e.name.toLowerCase().startsWith(a)) return;
                    let t = e.name.substring(a.length);
                    if (0 == t.length || /^\d/.test(t)) return
                }
                return a
            }(e.name, e.value),
            d = {
                kind: "enum",
                proto: e,
                deprecated: null != (o = null == (i = e.options) ? void 0 : i.deprecated) && o,
                file: n,
                parent: a,
                open: !0,
                name: e.name,
                typeName: f(e, a, n),
                value: {},
                values: [],
                sharedPrefix: c,
                toString() {
                    return `enum ${this.typeName}`
                }
            };
        for (let n of (d.open = 1 == y("enumType", {
                proto: (p = d).proto,
                parent: null != (m = p.parent) ? m : p.file
            }), r.add(d), e.value)) {
            let e = n.name;
            d.values.push(d.value[n.number] = {
                kind: "enum_value",
                proto: n,
                deprecated: null != (l = null == (s = n.options) ? void 0 : s.deprecated) && l,
                parent: d,
                name: e,
                localName: (0, t.safeObjectProperty)(void 0 == c ? e : e.substring(c.length)),
                number: n.number,
                toString: () => `enum value ${d.typeName}.${e}`
            })
        }(null != (u = null == a ? void 0 : a.nestedEnums) ? u : n.enums).push(d)
    }

    function c(e, a, o, s, l) {
        var u, p, m, c, T;
        let E = void 0 === l,
            N = {
                kind: "field",
                proto: e,
                deprecated: null != (p = null == (u = e.options) ? void 0 : u.deprecated) && p,
                name: e.name,
                number: e.number,
                scalar: void 0,
                message: void 0,
                enum: void 0,
                presence: function(e, t, n, a) {
                    if (2 == e.label) return 3;
                    if (3 == e.label) return 2;
                    if (t || e.proto3Optional || n) return 1;
                    let r = y("fieldPresence", {
                        proto: e,
                        parent: a
                    });
                    return 2 == r && (11 == e.type || 10 == e.type) ? 1 : r
                }(e, s, E, a),
                utf8Validation: (c = e, 2 == y("utf8Validation", {
                    proto: c,
                    parent: a
                })),
                listKind: void 0,
                mapKind: void 0,
                mapKey: void 0,
                delimitedEncoding: void 0,
                packed: void 0,
                longAsString: !1,
                getDefaultValue: void 0
            };
        if (E) {
            let t = "file" == a.kind ? a : a.file,
                n = "file" == a.kind ? void 0 : a,
                r = f(e, n, t);
            N.kind = "extension", N.file = t, N.parent = n, N.oneof = void 0, N.typeName = r, N.jsonName = `[${r}]`, N.toString = () => `extension ${r}`;
            let i = o.getMessage(d(e.extendee));
            g(i, `invalid FieldDescriptorProto: extendee ${e.extendee} not found`), N.extendee = i
        } else g("message" == a.kind), N.parent = a, N.oneof = s, N.localName = s ? (0, t.protoCamelCase)(e.name) : (0, t.safeObjectProperty)((0, t.protoCamelCase)(e.name)), N.jsonName = e.jsonName, N.toString = () => `field ${a.typeName}.${e.name}`;
        let h = e.label,
            I = e.type,
            S = null == (m = e.options) ? void 0 : m.jstype;
        if (3 === h) {
            let t = 11 == I ? null == l ? void 0 : l.get(d(e.typeName)) : void 0;
            if (t) {
                let e, n;
                N.fieldKind = "map";
                let {
                    key: a,
                    value: i
                } = (e = (T = t).fields.find(e => 1 === e.number), n = T.fields.find(e => 2 === e.number), g(e && "scalar" == e.fieldKind && e.scalar != r.ScalarType.BYTES && e.scalar != r.ScalarType.FLOAT && e.scalar != r.ScalarType.DOUBLE && n && "list" != n.fieldKind && "map" != n.fieldKind), {
                    key: e,
                    value: n
                });
                return N.mapKey = a.scalar, N.mapKind = i.fieldKind, N.message = i.message, N.delimitedEncoding = !1, N.enum = i.enum, N.scalar = i.scalar, N
            }
            switch (N.fieldKind = "list", I) {
                case 11:
                case 10:
                    N.listKind = "message", N.message = o.getMessage(d(e.typeName)), g(N.message), N.delimitedEncoding = b(e, a);
                    break;
                case 14:
                    N.listKind = "enum", N.enum = o.getEnum(d(e.typeName)), g(N.enum);
                    break;
                default:
                    N.listKind = "scalar", N.scalar = I, N.longAsString = 1 == S
            }
            return N.packed = function(e, t) {
                if (3 != e.label) return !1;
                switch (e.type) {
                    case 9:
                    case 12:
                    case 10:
                    case 11:
                        return !1
                }
                let a = e.options;
                return a && (0, n.unsafeIsSetExplicit)(a, "packed") ? a.packed : 1 == y("repeatedFieldEncoding", {
                    proto: e,
                    parent: t
                })
            }(e, a), N
        }
        switch (I) {
            case 11:
            case 10:
                N.fieldKind = "message", N.message = o.getMessage(d(e.typeName)), g(N.message, `invalid FieldDescriptorProto: type_name ${e.typeName} not found`), N.delimitedEncoding = b(e, a), N.getDefaultValue = () => void 0;
                break;
            case 14: {
                let t = o.getEnum(d(e.typeName));
                g(void 0 !== t, `invalid FieldDescriptorProto: type_name ${e.typeName} not found`), N.fieldKind = "enum", N.enum = o.getEnum(d(e.typeName)), N.getDefaultValue = () => (0, n.unsafeIsSetExplicit)(e, "defaultValue") ? function(e, t) {
                    let n = e.values.find(e => e.name === t);
                    if (!n) throw Error(`cannot parse ${e} default value: ${t}`);
                    return n.number
                }(t, e.defaultValue) : void 0;
                break
            }
            default:
                N.fieldKind = "scalar", N.scalar = I, N.longAsString = 1 == S, N.getDefaultValue = () => (0, n.unsafeIsSetExplicit)(e, "defaultValue") ? function(e, t) {
                    switch (e) {
                        case r.ScalarType.STRING:
                            return t;
                        case r.ScalarType.BYTES: {
                            let n = function(e) {
                                let t = [],
                                    n = {
                                        tail: e,
                                        c: "",
                                        next() {
                                            return 0 != this.tail.length && (this.c = this.tail[0], this.tail = this.tail.substring(1), !0)
                                        },
                                        take(e) {
                                            if (this.tail.length >= e) {
                                                let t = this.tail.substring(0, e);
                                                return this.tail = this.tail.substring(e), t
                                            }
                                            return !1
                                        }
                                    };
                                for (; n.next();)
                                    if ("\\" === n.c) {
                                        if (n.next()) switch (n.c) {
                                            case "\\":
                                                t.push(n.c.charCodeAt(0));
                                                break;
                                            case "b":
                                                t.push(8);
                                                break;
                                            case "f":
                                                t.push(12);
                                                break;
                                            case "n":
                                                t.push(10);
                                                break;
                                            case "r":
                                                t.push(13);
                                                break;
                                            case "t":
                                                t.push(9);
                                                break;
                                            case "v":
                                                t.push(11);
                                                break;
                                            case "0":
                                            case "1":
                                            case "2":
                                            case "3":
                                            case "4":
                                            case "5":
                                            case "6":
                                            case "7": {
                                                let e = n.c,
                                                    a = n.take(2);
                                                if (!1 === a) return !1;
                                                let r = parseInt(e + a, 8);
                                                if (Number.isNaN(r)) return !1;
                                                t.push(r);
                                                break
                                            }
                                            case "x": {
                                                let e = n.c,
                                                    a = n.take(2);
                                                if (!1 === a) return !1;
                                                let r = parseInt(e + a, 16);
                                                if (Number.isNaN(r)) return !1;
                                                t.push(r);
                                                break
                                            }
                                            case "u": {
                                                let e = n.c,
                                                    a = n.take(4);
                                                if (!1 === a) return !1;
                                                let r = parseInt(e + a, 16);
                                                if (Number.isNaN(r)) return !1;
                                                let i = new Uint8Array(4);
                                                new DataView(i.buffer).setInt32(0, r, !0), t.push(i[0], i[1], i[2], i[3]);
                                                break
                                            }
                                            case "U": {
                                                let e = n.c,
                                                    a = n.take(8);
                                                if (!1 === a) return !1;
                                                let r = i.protoInt64.uEnc(e + a),
                                                    o = new Uint8Array(8),
                                                    s = new DataView(o.buffer);
                                                s.setInt32(0, r.lo, !0), s.setInt32(4, r.hi, !0), t.push(o[0], o[1], o[2], o[3], o[4], o[5], o[6], o[7])
                                            }
                                        }
                                    } else t.push(n.c.charCodeAt(0));
                                return new Uint8Array(t)
                            }(t);
                            if (!1 === n) throw Error(`cannot parse ${r.ScalarType[e]} default value: ${t}`);
                            return n
                        }
                        case r.ScalarType.INT64:
                        case r.ScalarType.SFIXED64:
                        case r.ScalarType.SINT64:
                            return i.protoInt64.parse(t);
                        case r.ScalarType.UINT64:
                        case r.ScalarType.FIXED64:
                            return i.protoInt64.uParse(t);
                        case r.ScalarType.DOUBLE:
                        case r.ScalarType.FLOAT:
                            switch (t) {
                                case "inf":
                                    return 1 / 0;
                                case "-inf":
                                    return -1 / 0;
                                case "nan":
                                    return NaN;
                                default:
                                    return parseFloat(t)
                            }
                        case r.ScalarType.BOOL:
                            return "true" === t;
                        case r.ScalarType.INT32:
                        case r.ScalarType.UINT32:
                        case r.ScalarType.SINT32:
                        case r.ScalarType.FIXED32:
                        case r.ScalarType.SFIXED32:
                            return parseInt(t, 10)
                    }
                }(I, e.defaultValue) : void 0
        }
        return N
    }

    function f(e, t, n) {
        return t ? `${t.typeName}.${e.name}` : n.proto.package.length > 0 ? `${n.proto.package}.${e.name}` : `${e.name}`
    }

    function d(e) {
        return e.startsWith(".") ? e.substring(1) : e
    }

    function b(e, t) {
        return 10 == e.type || 2 == y("messageEncoding", {
            proto: e,
            parent: t
        })
    }

    function y(e, t) {
        var n, a;
        let r = null == (n = t.proto.options) ? void 0 : n.features;
        if (r) {
            let t = r[e];
            if (0 != t) return t
        }
        if ("kind" in t) {
            if ("message" == t.kind) return y(e, null != (a = t.parent) ? a : t.file);
            let n = s[t.edition];
            if (!n) throw Error(`feature default for edition ${t.edition} not found`);
            return n[e]
        }
        return y(e, t.parent)
    }

    function g(e, t) {
        if (!e) throw Error(t)
    }

    function T(e) {
        var t, n, a, r, i, o, s, l;
        return Object.assign(Object.create({
            visibility: 0
        }), {
            $typeName: "google.protobuf.DescriptorProto",
            name: e.name,
            field: null != (n = null == (t = e.field) ? void 0 : t.map(E)) ? n : [],
            extension: [],
            nestedType: null != (r = null == (a = e.nestedType) ? void 0 : a.map(T)) ? r : [],
            enumType: null != (o = null == (i = e.enumType) ? void 0 : i.map(N)) ? o : [],
            extensionRange: null != (l = null == (s = e.extensionRange) ? void 0 : s.map(e => Object.assign({
                $typeName: "google.protobuf.DescriptorProto.ExtensionRange"
            }, e))) ? l : [],
            oneofDecl: [],
            reservedRange: [],
            reservedName: []
        })
    }

    function E(e) {
        var t, n, a, r;
        return Object.assign(Object.create({
            label: 1,
            typeName: "",
            extendee: "",
            defaultValue: "",
            oneofIndex: 0,
            jsonName: "",
            proto3Optional: !1
        }), Object.assign(Object.assign({
            $typeName: "google.protobuf.FieldDescriptorProto"
        }, e), {
            options: e.options ? (t = e.options, Object.assign(Object.create({
                ctype: 0,
                packed: !1,
                jstype: 0,
                lazy: !1,
                unverifiedLazy: !1,
                deprecated: !1,
                weak: !1,
                debugRedact: !1,
                retention: 0
            }), Object.assign(Object.assign({
                $typeName: "google.protobuf.FieldOptions"
            }, t), {
                targets: null != (n = t.targets) ? n : [],
                editionDefaults: null != (r = null == (a = t.editionDefaults) ? void 0 : a.map(e => Object.assign({
                    $typeName: "google.protobuf.FieldOptions.EditionDefault"
                }, e))) ? r : [],
                uninterpretedOption: []
            }))) : void 0
        }))
    }

    function N(e) {
        return Object.assign(Object.create({
            visibility: 0
        }), {
            $typeName: "google.protobuf.EnumDescriptorProto",
            name: e.name,
            reservedName: [],
            reservedRange: [],
            value: e.value.map(e => Object.assign({
                $typeName: "google.protobuf.EnumValueDescriptorProto"
            }, e))
        })
    }
    e.s(["createFileRegistry", 0, o], 114283), e.s(["boot", 0, function(e) {
        var t;
        let n = (t = e, Object.assign(Object.create({
            syntax: "",
            edition: 0
        }), Object.assign(Object.assign({
            $typeName: "google.protobuf.FileDescriptorProto",
            dependency: [],
            publicDependency: [],
            weakDependency: [],
            optionDependency: [],
            service: [],
            extension: []
        }, t), {
            messageType: t.messageType.map(T),
            enumType: t.enumType.map(N)
        })));
        return n.messageType.forEach(a), o(n, () => void 0).getFile(n.name)
    }], 996251), e.s(["messageDesc", 0, function(e, t) {
        for (var n = arguments.length, a = Array(n > 2 ? n - 2 : 0), r = 2; r < n; r++) a[r - 2] = arguments[r];
        return a.reduce((e, t) => e.nestedMessages[t], e.messages[t])
    }], 84523)
}, 649464, e => {
    "use strict";
    e.s(["enumDesc", 0, function(e, t) {
        for (var n = arguments.length, a = Array(n > 2 ? n - 2 : 0), r = 2; r < n; r++) a[r - 2] = arguments[r];
        if (0 == a.length) return e.enums[t];
        let i = a.pop();
        return a.reduce((e, t) => e.nestedMessages[t], e.messages[t]).nestedEnums[i]
    }, "tsEnum", 0, function(e) {
        let t = {};
        for (let n of e.values) t[n.localName] = n.number, t[n.number] = n.localName;
        return t
    }])
}, 675618, e => {
    "use strict";
    var t, n, a, r, i, o, s, l, u, p, m, c, f, d, b, y, g, T, E, N, h, I, S, _, O, v, D, L, F, R, k, A, w, U, P, V, x, Y, M, B, C = e.i(996251),
        G = e.i(84523);
    e.i(649464);
    let K = (0, C.boot)({
            name: "google/protobuf/descriptor.proto",
            package: "google.protobuf",
            messageType: [{
                name: "FileDescriptorSet",
                field: [{
                    name: "file",
                    number: 1,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.FileDescriptorProto"
                }],
                extensionRange: [{
                    start: 536e6,
                    end: 0x1ff2b601
                }]
            }, {
                name: "FileDescriptorProto",
                field: [{
                    name: "name",
                    number: 1,
                    type: 9,
                    label: 1
                }, {
                    name: "package",
                    number: 2,
                    type: 9,
                    label: 1
                }, {
                    name: "dependency",
                    number: 3,
                    type: 9,
                    label: 3
                }, {
                    name: "public_dependency",
                    number: 10,
                    type: 5,
                    label: 3
                }, {
                    name: "weak_dependency",
                    number: 11,
                    type: 5,
                    label: 3
                }, {
                    name: "option_dependency",
                    number: 15,
                    type: 9,
                    label: 3
                }, {
                    name: "message_type",
                    number: 4,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.DescriptorProto"
                }, {
                    name: "enum_type",
                    number: 5,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.EnumDescriptorProto"
                }, {
                    name: "service",
                    number: 6,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.ServiceDescriptorProto"
                }, {
                    name: "extension",
                    number: 7,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.FieldDescriptorProto"
                }, {
                    name: "options",
                    number: 8,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.FileOptions"
                }, {
                    name: "source_code_info",
                    number: 9,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.SourceCodeInfo"
                }, {
                    name: "syntax",
                    number: 12,
                    type: 9,
                    label: 1
                }, {
                    name: "edition",
                    number: 14,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.Edition"
                }]
            }, {
                name: "DescriptorProto",
                field: [{
                    name: "name",
                    number: 1,
                    type: 9,
                    label: 1
                }, {
                    name: "field",
                    number: 2,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.FieldDescriptorProto"
                }, {
                    name: "extension",
                    number: 6,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.FieldDescriptorProto"
                }, {
                    name: "nested_type",
                    number: 3,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.DescriptorProto"
                }, {
                    name: "enum_type",
                    number: 4,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.EnumDescriptorProto"
                }, {
                    name: "extension_range",
                    number: 5,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.DescriptorProto.ExtensionRange"
                }, {
                    name: "oneof_decl",
                    number: 8,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.OneofDescriptorProto"
                }, {
                    name: "options",
                    number: 7,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.MessageOptions"
                }, {
                    name: "reserved_range",
                    number: 9,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.DescriptorProto.ReservedRange"
                }, {
                    name: "reserved_name",
                    number: 10,
                    type: 9,
                    label: 3
                }, {
                    name: "visibility",
                    number: 11,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.SymbolVisibility"
                }],
                nestedType: [{
                    name: "ExtensionRange",
                    field: [{
                        name: "start",
                        number: 1,
                        type: 5,
                        label: 1
                    }, {
                        name: "end",
                        number: 2,
                        type: 5,
                        label: 1
                    }, {
                        name: "options",
                        number: 3,
                        type: 11,
                        label: 1,
                        typeName: ".google.protobuf.ExtensionRangeOptions"
                    }]
                }, {
                    name: "ReservedRange",
                    field: [{
                        name: "start",
                        number: 1,
                        type: 5,
                        label: 1
                    }, {
                        name: "end",
                        number: 2,
                        type: 5,
                        label: 1
                    }]
                }]
            }, {
                name: "ExtensionRangeOptions",
                field: [{
                    name: "uninterpreted_option",
                    number: 999,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.UninterpretedOption"
                }, {
                    name: "declaration",
                    number: 2,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.ExtensionRangeOptions.Declaration",
                    options: {
                        retention: 2
                    }
                }, {
                    name: "features",
                    number: 50,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet"
                }, {
                    name: "verification",
                    number: 3,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.ExtensionRangeOptions.VerificationState",
                    defaultValue: "UNVERIFIED",
                    options: {
                        retention: 2
                    }
                }],
                nestedType: [{
                    name: "Declaration",
                    field: [{
                        name: "number",
                        number: 1,
                        type: 5,
                        label: 1
                    }, {
                        name: "full_name",
                        number: 2,
                        type: 9,
                        label: 1
                    }, {
                        name: "type",
                        number: 3,
                        type: 9,
                        label: 1
                    }, {
                        name: "reserved",
                        number: 5,
                        type: 8,
                        label: 1
                    }, {
                        name: "repeated",
                        number: 6,
                        type: 8,
                        label: 1
                    }]
                }],
                enumType: [{
                    name: "VerificationState",
                    value: [{
                        name: "DECLARATION",
                        number: 0
                    }, {
                        name: "UNVERIFIED",
                        number: 1
                    }]
                }],
                extensionRange: [{
                    start: 1e3,
                    end: 0x20000000
                }]
            }, {
                name: "FieldDescriptorProto",
                field: [{
                    name: "name",
                    number: 1,
                    type: 9,
                    label: 1
                }, {
                    name: "number",
                    number: 3,
                    type: 5,
                    label: 1
                }, {
                    name: "label",
                    number: 4,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.FieldDescriptorProto.Label"
                }, {
                    name: "type",
                    number: 5,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.FieldDescriptorProto.Type"
                }, {
                    name: "type_name",
                    number: 6,
                    type: 9,
                    label: 1
                }, {
                    name: "extendee",
                    number: 2,
                    type: 9,
                    label: 1
                }, {
                    name: "default_value",
                    number: 7,
                    type: 9,
                    label: 1
                }, {
                    name: "oneof_index",
                    number: 9,
                    type: 5,
                    label: 1
                }, {
                    name: "json_name",
                    number: 10,
                    type: 9,
                    label: 1
                }, {
                    name: "options",
                    number: 8,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.FieldOptions"
                }, {
                    name: "proto3_optional",
                    number: 17,
                    type: 8,
                    label: 1
                }],
                enumType: [{
                    name: "Type",
                    value: [{
                        name: "TYPE_DOUBLE",
                        number: 1
                    }, {
                        name: "TYPE_FLOAT",
                        number: 2
                    }, {
                        name: "TYPE_INT64",
                        number: 3
                    }, {
                        name: "TYPE_UINT64",
                        number: 4
                    }, {
                        name: "TYPE_INT32",
                        number: 5
                    }, {
                        name: "TYPE_FIXED64",
                        number: 6
                    }, {
                        name: "TYPE_FIXED32",
                        number: 7
                    }, {
                        name: "TYPE_BOOL",
                        number: 8
                    }, {
                        name: "TYPE_STRING",
                        number: 9
                    }, {
                        name: "TYPE_GROUP",
                        number: 10
                    }, {
                        name: "TYPE_MESSAGE",
                        number: 11
                    }, {
                        name: "TYPE_BYTES",
                        number: 12
                    }, {
                        name: "TYPE_UINT32",
                        number: 13
                    }, {
                        name: "TYPE_ENUM",
                        number: 14
                    }, {
                        name: "TYPE_SFIXED32",
                        number: 15
                    }, {
                        name: "TYPE_SFIXED64",
                        number: 16
                    }, {
                        name: "TYPE_SINT32",
                        number: 17
                    }, {
                        name: "TYPE_SINT64",
                        number: 18
                    }]
                }, {
                    name: "Label",
                    value: [{
                        name: "LABEL_OPTIONAL",
                        number: 1
                    }, {
                        name: "LABEL_REPEATED",
                        number: 3
                    }, {
                        name: "LABEL_REQUIRED",
                        number: 2
                    }]
                }]
            }, {
                name: "OneofDescriptorProto",
                field: [{
                    name: "name",
                    number: 1,
                    type: 9,
                    label: 1
                }, {
                    name: "options",
                    number: 2,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.OneofOptions"
                }]
            }, {
                name: "EnumDescriptorProto",
                field: [{
                    name: "name",
                    number: 1,
                    type: 9,
                    label: 1
                }, {
                    name: "value",
                    number: 2,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.EnumValueDescriptorProto"
                }, {
                    name: "options",
                    number: 3,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.EnumOptions"
                }, {
                    name: "reserved_range",
                    number: 4,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.EnumDescriptorProto.EnumReservedRange"
                }, {
                    name: "reserved_name",
                    number: 5,
                    type: 9,
                    label: 3
                }, {
                    name: "visibility",
                    number: 6,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.SymbolVisibility"
                }],
                nestedType: [{
                    name: "EnumReservedRange",
                    field: [{
                        name: "start",
                        number: 1,
                        type: 5,
                        label: 1
                    }, {
                        name: "end",
                        number: 2,
                        type: 5,
                        label: 1
                    }]
                }]
            }, {
                name: "EnumValueDescriptorProto",
                field: [{
                    name: "name",
                    number: 1,
                    type: 9,
                    label: 1
                }, {
                    name: "number",
                    number: 2,
                    type: 5,
                    label: 1
                }, {
                    name: "options",
                    number: 3,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.EnumValueOptions"
                }]
            }, {
                name: "ServiceDescriptorProto",
                field: [{
                    name: "name",
                    number: 1,
                    type: 9,
                    label: 1
                }, {
                    name: "method",
                    number: 2,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.MethodDescriptorProto"
                }, {
                    name: "options",
                    number: 3,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.ServiceOptions"
                }]
            }, {
                name: "MethodDescriptorProto",
                field: [{
                    name: "name",
                    number: 1,
                    type: 9,
                    label: 1
                }, {
                    name: "input_type",
                    number: 2,
                    type: 9,
                    label: 1
                }, {
                    name: "output_type",
                    number: 3,
                    type: 9,
                    label: 1
                }, {
                    name: "options",
                    number: 4,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.MethodOptions"
                }, {
                    name: "client_streaming",
                    number: 5,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "server_streaming",
                    number: 6,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }]
            }, {
                name: "FileOptions",
                field: [{
                    name: "java_package",
                    number: 1,
                    type: 9,
                    label: 1
                }, {
                    name: "java_outer_classname",
                    number: 8,
                    type: 9,
                    label: 1
                }, {
                    name: "java_multiple_files",
                    number: 10,
                    type: 8,
                    label: 1,
                    defaultValue: "false",
                    options: {}
                }, {
                    name: "java_generate_equals_and_hash",
                    number: 20,
                    type: 8,
                    label: 1,
                    options: {
                        deprecated: !0
                    }
                }, {
                    name: "java_string_check_utf8",
                    number: 27,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "optimize_for",
                    number: 9,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.FileOptions.OptimizeMode",
                    defaultValue: "SPEED"
                }, {
                    name: "go_package",
                    number: 11,
                    type: 9,
                    label: 1
                }, {
                    name: "cc_generic_services",
                    number: 16,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "java_generic_services",
                    number: 17,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "py_generic_services",
                    number: 18,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "deprecated",
                    number: 23,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "cc_enable_arenas",
                    number: 31,
                    type: 8,
                    label: 1,
                    defaultValue: "true"
                }, {
                    name: "objc_class_prefix",
                    number: 36,
                    type: 9,
                    label: 1
                }, {
                    name: "csharp_namespace",
                    number: 37,
                    type: 9,
                    label: 1
                }, {
                    name: "swift_prefix",
                    number: 39,
                    type: 9,
                    label: 1
                }, {
                    name: "php_class_prefix",
                    number: 40,
                    type: 9,
                    label: 1
                }, {
                    name: "php_namespace",
                    number: 41,
                    type: 9,
                    label: 1
                }, {
                    name: "php_metadata_namespace",
                    number: 44,
                    type: 9,
                    label: 1
                }, {
                    name: "ruby_package",
                    number: 45,
                    type: 9,
                    label: 1
                }, {
                    name: "features",
                    number: 50,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet"
                }, {
                    name: "uninterpreted_option",
                    number: 999,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.UninterpretedOption"
                }],
                enumType: [{
                    name: "OptimizeMode",
                    value: [{
                        name: "SPEED",
                        number: 1
                    }, {
                        name: "CODE_SIZE",
                        number: 2
                    }, {
                        name: "LITE_RUNTIME",
                        number: 3
                    }]
                }],
                extensionRange: [{
                    start: 1e3,
                    end: 0x20000000
                }]
            }, {
                name: "MessageOptions",
                field: [{
                    name: "message_set_wire_format",
                    number: 1,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "no_standard_descriptor_accessor",
                    number: 2,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "deprecated",
                    number: 3,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "map_entry",
                    number: 7,
                    type: 8,
                    label: 1
                }, {
                    name: "deprecated_legacy_json_field_conflicts",
                    number: 11,
                    type: 8,
                    label: 1,
                    options: {
                        deprecated: !0
                    }
                }, {
                    name: "features",
                    number: 12,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet"
                }, {
                    name: "uninterpreted_option",
                    number: 999,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.UninterpretedOption"
                }],
                extensionRange: [{
                    start: 1e3,
                    end: 0x20000000
                }]
            }, {
                name: "FieldOptions",
                field: [{
                    name: "ctype",
                    number: 1,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.FieldOptions.CType",
                    defaultValue: "STRING"
                }, {
                    name: "packed",
                    number: 2,
                    type: 8,
                    label: 1
                }, {
                    name: "jstype",
                    number: 6,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.FieldOptions.JSType",
                    defaultValue: "JS_NORMAL"
                }, {
                    name: "lazy",
                    number: 5,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "unverified_lazy",
                    number: 15,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "deprecated",
                    number: 3,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "weak",
                    number: 10,
                    type: 8,
                    label: 1,
                    defaultValue: "false",
                    options: {
                        deprecated: !0
                    }
                }, {
                    name: "debug_redact",
                    number: 16,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "retention",
                    number: 17,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.FieldOptions.OptionRetention"
                }, {
                    name: "targets",
                    number: 19,
                    type: 14,
                    label: 3,
                    typeName: ".google.protobuf.FieldOptions.OptionTargetType"
                }, {
                    name: "edition_defaults",
                    number: 20,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.FieldOptions.EditionDefault"
                }, {
                    name: "features",
                    number: 21,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet"
                }, {
                    name: "feature_support",
                    number: 22,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.FieldOptions.FeatureSupport"
                }, {
                    name: "uninterpreted_option",
                    number: 999,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.UninterpretedOption"
                }],
                nestedType: [{
                    name: "EditionDefault",
                    field: [{
                        name: "edition",
                        number: 3,
                        type: 14,
                        label: 1,
                        typeName: ".google.protobuf.Edition"
                    }, {
                        name: "value",
                        number: 2,
                        type: 9,
                        label: 1
                    }]
                }, {
                    name: "FeatureSupport",
                    field: [{
                        name: "edition_introduced",
                        number: 1,
                        type: 14,
                        label: 1,
                        typeName: ".google.protobuf.Edition"
                    }, {
                        name: "edition_deprecated",
                        number: 2,
                        type: 14,
                        label: 1,
                        typeName: ".google.protobuf.Edition"
                    }, {
                        name: "deprecation_warning",
                        number: 3,
                        type: 9,
                        label: 1
                    }, {
                        name: "edition_removed",
                        number: 4,
                        type: 14,
                        label: 1,
                        typeName: ".google.protobuf.Edition"
                    }, {
                        name: "removal_error",
                        number: 5,
                        type: 9,
                        label: 1
                    }]
                }],
                enumType: [{
                    name: "CType",
                    value: [{
                        name: "STRING",
                        number: 0
                    }, {
                        name: "CORD",
                        number: 1
                    }, {
                        name: "STRING_PIECE",
                        number: 2
                    }]
                }, {
                    name: "JSType",
                    value: [{
                        name: "JS_NORMAL",
                        number: 0
                    }, {
                        name: "JS_STRING",
                        number: 1
                    }, {
                        name: "JS_NUMBER",
                        number: 2
                    }]
                }, {
                    name: "OptionRetention",
                    value: [{
                        name: "RETENTION_UNKNOWN",
                        number: 0
                    }, {
                        name: "RETENTION_RUNTIME",
                        number: 1
                    }, {
                        name: "RETENTION_SOURCE",
                        number: 2
                    }]
                }, {
                    name: "OptionTargetType",
                    value: [{
                        name: "TARGET_TYPE_UNKNOWN",
                        number: 0
                    }, {
                        name: "TARGET_TYPE_FILE",
                        number: 1
                    }, {
                        name: "TARGET_TYPE_EXTENSION_RANGE",
                        number: 2
                    }, {
                        name: "TARGET_TYPE_MESSAGE",
                        number: 3
                    }, {
                        name: "TARGET_TYPE_FIELD",
                        number: 4
                    }, {
                        name: "TARGET_TYPE_ONEOF",
                        number: 5
                    }, {
                        name: "TARGET_TYPE_ENUM",
                        number: 6
                    }, {
                        name: "TARGET_TYPE_ENUM_ENTRY",
                        number: 7
                    }, {
                        name: "TARGET_TYPE_SERVICE",
                        number: 8
                    }, {
                        name: "TARGET_TYPE_METHOD",
                        number: 9
                    }]
                }],
                extensionRange: [{
                    start: 1e3,
                    end: 0x20000000
                }]
            }, {
                name: "OneofOptions",
                field: [{
                    name: "features",
                    number: 1,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet"
                }, {
                    name: "uninterpreted_option",
                    number: 999,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.UninterpretedOption"
                }],
                extensionRange: [{
                    start: 1e3,
                    end: 0x20000000
                }]
            }, {
                name: "EnumOptions",
                field: [{
                    name: "allow_alias",
                    number: 2,
                    type: 8,
                    label: 1
                }, {
                    name: "deprecated",
                    number: 3,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "deprecated_legacy_json_field_conflicts",
                    number: 6,
                    type: 8,
                    label: 1,
                    options: {
                        deprecated: !0
                    }
                }, {
                    name: "features",
                    number: 7,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet"
                }, {
                    name: "uninterpreted_option",
                    number: 999,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.UninterpretedOption"
                }],
                extensionRange: [{
                    start: 1e3,
                    end: 0x20000000
                }]
            }, {
                name: "EnumValueOptions",
                field: [{
                    name: "deprecated",
                    number: 1,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "features",
                    number: 2,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet"
                }, {
                    name: "debug_redact",
                    number: 3,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "feature_support",
                    number: 4,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.FieldOptions.FeatureSupport"
                }, {
                    name: "uninterpreted_option",
                    number: 999,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.UninterpretedOption"
                }],
                extensionRange: [{
                    start: 1e3,
                    end: 0x20000000
                }]
            }, {
                name: "ServiceOptions",
                field: [{
                    name: "features",
                    number: 34,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet"
                }, {
                    name: "deprecated",
                    number: 33,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "uninterpreted_option",
                    number: 999,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.UninterpretedOption"
                }],
                extensionRange: [{
                    start: 1e3,
                    end: 0x20000000
                }]
            }, {
                name: "MethodOptions",
                field: [{
                    name: "deprecated",
                    number: 33,
                    type: 8,
                    label: 1,
                    defaultValue: "false"
                }, {
                    name: "idempotency_level",
                    number: 34,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.MethodOptions.IdempotencyLevel",
                    defaultValue: "IDEMPOTENCY_UNKNOWN"
                }, {
                    name: "features",
                    number: 35,
                    type: 11,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet"
                }, {
                    name: "uninterpreted_option",
                    number: 999,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.UninterpretedOption"
                }],
                enumType: [{
                    name: "IdempotencyLevel",
                    value: [{
                        name: "IDEMPOTENCY_UNKNOWN",
                        number: 0
                    }, {
                        name: "NO_SIDE_EFFECTS",
                        number: 1
                    }, {
                        name: "IDEMPOTENT",
                        number: 2
                    }]
                }],
                extensionRange: [{
                    start: 1e3,
                    end: 0x20000000
                }]
            }, {
                name: "UninterpretedOption",
                field: [{
                    name: "name",
                    number: 2,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.UninterpretedOption.NamePart"
                }, {
                    name: "identifier_value",
                    number: 3,
                    type: 9,
                    label: 1
                }, {
                    name: "positive_int_value",
                    number: 4,
                    type: 4,
                    label: 1
                }, {
                    name: "negative_int_value",
                    number: 5,
                    type: 3,
                    label: 1
                }, {
                    name: "double_value",
                    number: 6,
                    type: 1,
                    label: 1
                }, {
                    name: "string_value",
                    number: 7,
                    type: 12,
                    label: 1
                }, {
                    name: "aggregate_value",
                    number: 8,
                    type: 9,
                    label: 1
                }],
                nestedType: [{
                    name: "NamePart",
                    field: [{
                        name: "name_part",
                        number: 1,
                        type: 9,
                        label: 2
                    }, {
                        name: "is_extension",
                        number: 2,
                        type: 8,
                        label: 2
                    }]
                }]
            }, {
                name: "FeatureSet",
                field: [{
                    name: "field_presence",
                    number: 1,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet.FieldPresence",
                    options: {
                        retention: 1,
                        targets: [4, 1],
                        editionDefaults: [{
                            value: "EXPLICIT",
                            edition: 900
                        }, {
                            value: "IMPLICIT",
                            edition: 999
                        }, {
                            value: "EXPLICIT",
                            edition: 1e3
                        }]
                    }
                }, {
                    name: "enum_type",
                    number: 2,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet.EnumType",
                    options: {
                        retention: 1,
                        targets: [6, 1],
                        editionDefaults: [{
                            value: "CLOSED",
                            edition: 900
                        }, {
                            value: "OPEN",
                            edition: 999
                        }]
                    }
                }, {
                    name: "repeated_field_encoding",
                    number: 3,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet.RepeatedFieldEncoding",
                    options: {
                        retention: 1,
                        targets: [4, 1],
                        editionDefaults: [{
                            value: "EXPANDED",
                            edition: 900
                        }, {
                            value: "PACKED",
                            edition: 999
                        }]
                    }
                }, {
                    name: "utf8_validation",
                    number: 4,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet.Utf8Validation",
                    options: {
                        retention: 1,
                        targets: [4, 1],
                        editionDefaults: [{
                            value: "NONE",
                            edition: 900
                        }, {
                            value: "VERIFY",
                            edition: 999
                        }]
                    }
                }, {
                    name: "message_encoding",
                    number: 5,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet.MessageEncoding",
                    options: {
                        retention: 1,
                        targets: [4, 1],
                        editionDefaults: [{
                            value: "LENGTH_PREFIXED",
                            edition: 900
                        }]
                    }
                }, {
                    name: "json_format",
                    number: 6,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet.JsonFormat",
                    options: {
                        retention: 1,
                        targets: [3, 6, 1],
                        editionDefaults: [{
                            value: "LEGACY_BEST_EFFORT",
                            edition: 900
                        }, {
                            value: "ALLOW",
                            edition: 999
                        }]
                    }
                }, {
                    name: "enforce_naming_style",
                    number: 7,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet.EnforceNamingStyle",
                    options: {
                        retention: 2,
                        targets: [1, 2, 3, 4, 5, 6, 7, 8, 9],
                        editionDefaults: [{
                            value: "STYLE_LEGACY",
                            edition: 900
                        }, {
                            value: "STYLE2024",
                            edition: 1001
                        }]
                    }
                }, {
                    name: "default_symbol_visibility",
                    number: 8,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.FeatureSet.VisibilityFeature.DefaultSymbolVisibility",
                    options: {
                        retention: 2,
                        targets: [1],
                        editionDefaults: [{
                            value: "EXPORT_ALL",
                            edition: 900
                        }, {
                            value: "EXPORT_TOP_LEVEL",
                            edition: 1001
                        }]
                    }
                }],
                nestedType: [{
                    name: "VisibilityFeature",
                    enumType: [{
                        name: "DefaultSymbolVisibility",
                        value: [{
                            name: "DEFAULT_SYMBOL_VISIBILITY_UNKNOWN",
                            number: 0
                        }, {
                            name: "EXPORT_ALL",
                            number: 1
                        }, {
                            name: "EXPORT_TOP_LEVEL",
                            number: 2
                        }, {
                            name: "LOCAL_ALL",
                            number: 3
                        }, {
                            name: "STRICT",
                            number: 4
                        }]
                    }]
                }],
                enumType: [{
                    name: "FieldPresence",
                    value: [{
                        name: "FIELD_PRESENCE_UNKNOWN",
                        number: 0
                    }, {
                        name: "EXPLICIT",
                        number: 1
                    }, {
                        name: "IMPLICIT",
                        number: 2
                    }, {
                        name: "LEGACY_REQUIRED",
                        number: 3
                    }]
                }, {
                    name: "EnumType",
                    value: [{
                        name: "ENUM_TYPE_UNKNOWN",
                        number: 0
                    }, {
                        name: "OPEN",
                        number: 1
                    }, {
                        name: "CLOSED",
                        number: 2
                    }]
                }, {
                    name: "RepeatedFieldEncoding",
                    value: [{
                        name: "REPEATED_FIELD_ENCODING_UNKNOWN",
                        number: 0
                    }, {
                        name: "PACKED",
                        number: 1
                    }, {
                        name: "EXPANDED",
                        number: 2
                    }]
                }, {
                    name: "Utf8Validation",
                    value: [{
                        name: "UTF8_VALIDATION_UNKNOWN",
                        number: 0
                    }, {
                        name: "VERIFY",
                        number: 2
                    }, {
                        name: "NONE",
                        number: 3
                    }]
                }, {
                    name: "MessageEncoding",
                    value: [{
                        name: "MESSAGE_ENCODING_UNKNOWN",
                        number: 0
                    }, {
                        name: "LENGTH_PREFIXED",
                        number: 1
                    }, {
                        name: "DELIMITED",
                        number: 2
                    }]
                }, {
                    name: "JsonFormat",
                    value: [{
                        name: "JSON_FORMAT_UNKNOWN",
                        number: 0
                    }, {
                        name: "ALLOW",
                        number: 1
                    }, {
                        name: "LEGACY_BEST_EFFORT",
                        number: 2
                    }]
                }, {
                    name: "EnforceNamingStyle",
                    value: [{
                        name: "ENFORCE_NAMING_STYLE_UNKNOWN",
                        number: 0
                    }, {
                        name: "STYLE2024",
                        number: 1
                    }, {
                        name: "STYLE_LEGACY",
                        number: 2
                    }]
                }],
                extensionRange: [{
                    start: 1e3,
                    end: 9995
                }, {
                    start: 9995,
                    end: 1e4
                }, {
                    start: 1e4,
                    end: 10001
                }]
            }, {
                name: "FeatureSetDefaults",
                field: [{
                    name: "defaults",
                    number: 1,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.FeatureSetDefaults.FeatureSetEditionDefault"
                }, {
                    name: "minimum_edition",
                    number: 4,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.Edition"
                }, {
                    name: "maximum_edition",
                    number: 5,
                    type: 14,
                    label: 1,
                    typeName: ".google.protobuf.Edition"
                }],
                nestedType: [{
                    name: "FeatureSetEditionDefault",
                    field: [{
                        name: "edition",
                        number: 3,
                        type: 14,
                        label: 1,
                        typeName: ".google.protobuf.Edition"
                    }, {
                        name: "overridable_features",
                        number: 4,
                        type: 11,
                        label: 1,
                        typeName: ".google.protobuf.FeatureSet"
                    }, {
                        name: "fixed_features",
                        number: 5,
                        type: 11,
                        label: 1,
                        typeName: ".google.protobuf.FeatureSet"
                    }]
                }]
            }, {
                name: "SourceCodeInfo",
                field: [{
                    name: "location",
                    number: 1,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.SourceCodeInfo.Location"
                }],
                nestedType: [{
                    name: "Location",
                    field: [{
                        name: "path",
                        number: 1,
                        type: 5,
                        label: 3,
                        options: {
                            packed: !0
                        }
                    }, {
                        name: "span",
                        number: 2,
                        type: 5,
                        label: 3,
                        options: {
                            packed: !0
                        }
                    }, {
                        name: "leading_comments",
                        number: 3,
                        type: 9,
                        label: 1
                    }, {
                        name: "trailing_comments",
                        number: 4,
                        type: 9,
                        label: 1
                    }, {
                        name: "leading_detached_comments",
                        number: 6,
                        type: 9,
                        label: 3
                    }]
                }],
                extensionRange: [{
                    start: 536e6,
                    end: 0x1ff2b601
                }]
            }, {
                name: "GeneratedCodeInfo",
                field: [{
                    name: "annotation",
                    number: 1,
                    type: 11,
                    label: 3,
                    typeName: ".google.protobuf.GeneratedCodeInfo.Annotation"
                }],
                nestedType: [{
                    name: "Annotation",
                    field: [{
                        name: "path",
                        number: 1,
                        type: 5,
                        label: 3,
                        options: {
                            packed: !0
                        }
                    }, {
                        name: "source_file",
                        number: 2,
                        type: 9,
                        label: 1
                    }, {
                        name: "begin",
                        number: 3,
                        type: 5,
                        label: 1
                    }, {
                        name: "end",
                        number: 4,
                        type: 5,
                        label: 1
                    }, {
                        name: "semantic",
                        number: 5,
                        type: 14,
                        label: 1,
                        typeName: ".google.protobuf.GeneratedCodeInfo.Annotation.Semantic"
                    }],
                    enumType: [{
                        name: "Semantic",
                        value: [{
                            name: "NONE",
                            number: 0
                        }, {
                            name: "SET",
                            number: 1
                        }, {
                            name: "ALIAS",
                            number: 2
                        }]
                    }]
                }]
            }],
            enumType: [{
                name: "Edition",
                value: [{
                    name: "EDITION_UNKNOWN",
                    number: 0
                }, {
                    name: "EDITION_LEGACY",
                    number: 900
                }, {
                    name: "EDITION_PROTO2",
                    number: 998
                }, {
                    name: "EDITION_PROTO3",
                    number: 999
                }, {
                    name: "EDITION_2023",
                    number: 1e3
                }, {
                    name: "EDITION_2024",
                    number: 1001
                }, {
                    name: "EDITION_UNSTABLE",
                    number: 9999
                }, {
                    name: "EDITION_1_TEST_ONLY",
                    number: 1
                }, {
                    name: "EDITION_2_TEST_ONLY",
                    number: 2
                }, {
                    name: "EDITION_99997_TEST_ONLY",
                    number: 99997
                }, {
                    name: "EDITION_99998_TEST_ONLY",
                    number: 99998
                }, {
                    name: "EDITION_99999_TEST_ONLY",
                    number: 99999
                }, {
                    name: "EDITION_MAX",
                    number: 0x7fffffff
                }]
            }, {
                name: "SymbolVisibility",
                value: [{
                    name: "VISIBILITY_UNSET",
                    number: 0
                }, {
                    name: "VISIBILITY_LOCAL",
                    number: 1
                }, {
                    name: "VISIBILITY_EXPORT",
                    number: 2
                }]
            }]
        }),
        $ = (0, G.messageDesc)(K, 1);
    (t = h || (h = {}))[t.DECLARATION = 0] = "DECLARATION", t[t.UNVERIFIED = 1] = "UNVERIFIED", (n = I || (I = {}))[n.DOUBLE = 1] = "DOUBLE", n[n.FLOAT = 2] = "FLOAT", n[n.INT64 = 3] = "INT64", n[n.UINT64 = 4] = "UINT64", n[n.INT32 = 5] = "INT32", n[n.FIXED64 = 6] = "FIXED64", n[n.FIXED32 = 7] = "FIXED32", n[n.BOOL = 8] = "BOOL", n[n.STRING = 9] = "STRING", n[n.GROUP = 10] = "GROUP", n[n.MESSAGE = 11] = "MESSAGE", n[n.BYTES = 12] = "BYTES", n[n.UINT32 = 13] = "UINT32", n[n.ENUM = 14] = "ENUM", n[n.SFIXED32 = 15] = "SFIXED32", n[n.SFIXED64 = 16] = "SFIXED64", n[n.SINT32 = 17] = "SINT32", n[n.SINT64 = 18] = "SINT64", (a = S || (S = {}))[a.OPTIONAL = 1] = "OPTIONAL", a[a.REPEATED = 3] = "REPEATED", a[a.REQUIRED = 2] = "REQUIRED", (r = _ || (_ = {}))[r.SPEED = 1] = "SPEED", r[r.CODE_SIZE = 2] = "CODE_SIZE", r[r.LITE_RUNTIME = 3] = "LITE_RUNTIME", (i = O || (O = {}))[i.STRING = 0] = "STRING", i[i.CORD = 1] = "CORD", i[i.STRING_PIECE = 2] = "STRING_PIECE", (o = v || (v = {}))[o.JS_NORMAL = 0] = "JS_NORMAL", o[o.JS_STRING = 1] = "JS_STRING", o[o.JS_NUMBER = 2] = "JS_NUMBER", (s = D || (D = {}))[s.RETENTION_UNKNOWN = 0] = "RETENTION_UNKNOWN", s[s.RETENTION_RUNTIME = 1] = "RETENTION_RUNTIME", s[s.RETENTION_SOURCE = 2] = "RETENTION_SOURCE", (l = L || (L = {}))[l.TARGET_TYPE_UNKNOWN = 0] = "TARGET_TYPE_UNKNOWN", l[l.TARGET_TYPE_FILE = 1] = "TARGET_TYPE_FILE", l[l.TARGET_TYPE_EXTENSION_RANGE = 2] = "TARGET_TYPE_EXTENSION_RANGE", l[l.TARGET_TYPE_MESSAGE = 3] = "TARGET_TYPE_MESSAGE", l[l.TARGET_TYPE_FIELD = 4] = "TARGET_TYPE_FIELD", l[l.TARGET_TYPE_ONEOF = 5] = "TARGET_TYPE_ONEOF", l[l.TARGET_TYPE_ENUM = 6] = "TARGET_TYPE_ENUM", l[l.TARGET_TYPE_ENUM_ENTRY = 7] = "TARGET_TYPE_ENUM_ENTRY", l[l.TARGET_TYPE_SERVICE = 8] = "TARGET_TYPE_SERVICE", l[l.TARGET_TYPE_METHOD = 9] = "TARGET_TYPE_METHOD", (u = F || (F = {}))[u.IDEMPOTENCY_UNKNOWN = 0] = "IDEMPOTENCY_UNKNOWN", u[u.NO_SIDE_EFFECTS = 1] = "NO_SIDE_EFFECTS", u[u.IDEMPOTENT = 2] = "IDEMPOTENT", (p = R || (R = {}))[p.DEFAULT_SYMBOL_VISIBILITY_UNKNOWN = 0] = "DEFAULT_SYMBOL_VISIBILITY_UNKNOWN", p[p.EXPORT_ALL = 1] = "EXPORT_ALL", p[p.EXPORT_TOP_LEVEL = 2] = "EXPORT_TOP_LEVEL", p[p.LOCAL_ALL = 3] = "LOCAL_ALL", p[p.STRICT = 4] = "STRICT", (m = k || (k = {}))[m.FIELD_PRESENCE_UNKNOWN = 0] = "FIELD_PRESENCE_UNKNOWN", m[m.EXPLICIT = 1] = "EXPLICIT", m[m.IMPLICIT = 2] = "IMPLICIT", m[m.LEGACY_REQUIRED = 3] = "LEGACY_REQUIRED", (c = A || (A = {}))[c.ENUM_TYPE_UNKNOWN = 0] = "ENUM_TYPE_UNKNOWN", c[c.OPEN = 1] = "OPEN", c[c.CLOSED = 2] = "CLOSED", (f = w || (w = {}))[f.REPEATED_FIELD_ENCODING_UNKNOWN = 0] = "REPEATED_FIELD_ENCODING_UNKNOWN", f[f.PACKED = 1] = "PACKED", f[f.EXPANDED = 2] = "EXPANDED", (d = U || (U = {}))[d.UTF8_VALIDATION_UNKNOWN = 0] = "UTF8_VALIDATION_UNKNOWN", d[d.VERIFY = 2] = "VERIFY", d[d.NONE = 3] = "NONE", (b = P || (P = {}))[b.MESSAGE_ENCODING_UNKNOWN = 0] = "MESSAGE_ENCODING_UNKNOWN", b[b.LENGTH_PREFIXED = 1] = "LENGTH_PREFIXED", b[b.DELIMITED = 2] = "DELIMITED", (y = V || (V = {}))[y.JSON_FORMAT_UNKNOWN = 0] = "JSON_FORMAT_UNKNOWN", y[y.ALLOW = 1] = "ALLOW", y[y.LEGACY_BEST_EFFORT = 2] = "LEGACY_BEST_EFFORT", (g = x || (x = {}))[g.ENFORCE_NAMING_STYLE_UNKNOWN = 0] = "ENFORCE_NAMING_STYLE_UNKNOWN", g[g.STYLE2024 = 1] = "STYLE2024", g[g.STYLE_LEGACY = 2] = "STYLE_LEGACY", (T = Y || (Y = {}))[T.NONE = 0] = "NONE", T[T.SET = 1] = "SET", T[T.ALIAS = 2] = "ALIAS", (E = M || (M = {}))[E.EDITION_UNKNOWN = 0] = "EDITION_UNKNOWN", E[E.EDITION_LEGACY = 900] = "EDITION_LEGACY", E[E.EDITION_PROTO2 = 998] = "EDITION_PROTO2", E[E.EDITION_PROTO3 = 999] = "EDITION_PROTO3", E[E.EDITION_2023 = 1e3] = "EDITION_2023", E[E.EDITION_2024 = 1001] = "EDITION_2024", E[E.EDITION_UNSTABLE = 9999] = "EDITION_UNSTABLE", E[E.EDITION_1_TEST_ONLY = 1] = "EDITION_1_TEST_ONLY", E[E.EDITION_2_TEST_ONLY = 2] = "EDITION_2_TEST_ONLY", E[E.EDITION_99997_TEST_ONLY = 99997] = "EDITION_99997_TEST_ONLY", E[E.EDITION_99998_TEST_ONLY = 99998] = "EDITION_99998_TEST_ONLY", E[E.EDITION_99999_TEST_ONLY = 99999] = "EDITION_99999_TEST_ONLY", E[E.EDITION_MAX = 0x7fffffff] = "EDITION_MAX", (N = B || (B = {}))[N.VISIBILITY_UNSET = 0] = "VISIBILITY_UNSET", N[N.VISIBILITY_LOCAL = 1] = "VISIBILITY_LOCAL", N[N.VISIBILITY_EXPORT = 2] = "VISIBILITY_EXPORT", e.s(["FileDescriptorProtoSchema", 0, $, "file_google_protobuf_descriptor", 0, K])
}, 55738, e => {
    "use strict";
    let t = ["FieldValueInvalidError", "FieldListRangeError", "ForeignFieldError"];
    e.s(["FieldError", 0, class extends Error {
        constructor(e, t, n = "FieldValueInvalidError") {
            super(t), this.name = n, this.field = () => e
        }
    }, "isFieldError", 0, function(e) {
        return e instanceof Error && t.includes(e.name) && "field" in e && "function" == typeof e.field
    }])
}, 864858, 306541, e => {
    "use strict";
    var t, n, a = e.i(491819),
        r = e.i(721037),
        i = e.i(55738),
        o = e.i(114052),
        s = e.i(512551),
        l = e.i(669207);
    let u = Symbol.for("@bufbuild/protobuf/text-encoding");

    function p() {
        if (void 0 == globalThis[u]) {
            let e, t = new globalThis.TextEncoder,
                n = new globalThis.TextDecoder;
            globalThis[u] = {
                encodeUtf8: e => t.encode(e),
                decodeUtf8: (t, a) => a ? (void 0 === e && (e = new globalThis.TextDecoder("utf-8", {
                    fatal: !0
                })), e.decode(t)) : n.decode(t),
                checkUtf8(e) {
                    try {
                        return encodeURIComponent(e), !0
                    } catch (e) {
                        return !1
                    }
                }
            }
        }
        return globalThis[u]
    }

    function m(e) {
        if ("string" == typeof e) e = Number(e);
        else if ("number" != typeof e) throw Error("invalid int32: " + typeof e);
        if (!Number.isInteger(e) || e > 0x7fffffff || e < -0x80000000) throw Error("invalid int32: " + e)
    }

    function c(e) {
        if ("string" == typeof e) e = Number(e);
        else if ("number" != typeof e) throw Error("invalid uint32: " + typeof e);
        if (!Number.isInteger(e) || e > 0xffffffff || e < 0) throw Error("invalid uint32: " + e)
    }

    function f(e, t) {
        return void 0 !== e.scalar ? d(t, e.scalar) : void 0 !== e.enum ? e.enum.open ? d(t, a.ScalarType.INT32) : e.enum.values.some(e => e.number === t) : (0, o.isReflectMessage)(t, e.message)
    }

    function d(e, t) {
        switch (t) {
            case a.ScalarType.DOUBLE:
                return "number" == typeof e;
            case a.ScalarType.FLOAT:
                if ("number" != typeof e) return !1;
                if (Number.isNaN(e) || !Number.isFinite(e)) return !0;
                if (e > 34028234663852886e22 || e < -34028234663852886e22) return `${e.toFixed()} out of range`;
                return !0;
            case a.ScalarType.INT32:
            case a.ScalarType.SFIXED32:
            case a.ScalarType.SINT32:
                if ("number" != typeof e || !Number.isInteger(e)) return !1;
                if (e > 0x7fffffff || e < -0x80000000) return `${e.toFixed()} out of range`;
                return !0;
            case a.ScalarType.FIXED32:
            case a.ScalarType.UINT32:
                if ("number" != typeof e || !Number.isInteger(e)) return !1;
                if (e > 0xffffffff || e < 0) return `${e.toFixed()} out of range`;
                return !0;
            case a.ScalarType.BOOL:
                return "boolean" == typeof e;
            case a.ScalarType.STRING:
                if ("string" != typeof e) return !1;
                return p().checkUtf8(e) || "invalid UTF8";
            case a.ScalarType.BYTES:
                return e instanceof Uint8Array;
            case a.ScalarType.INT64:
            case a.ScalarType.SFIXED64:
            case a.ScalarType.SINT64:
                if ("bigint" == typeof e || "number" == typeof e || "string" == typeof e && e.length > 0) try {
                    return l.protoInt64.parse(e), !0
                } catch (t) {
                    return `${e} out of range`
                }
                return !1;
            case a.ScalarType.FIXED64:
            case a.ScalarType.UINT64:
                if ("bigint" == typeof e || "number" == typeof e || "string" == typeof e && e.length > 0) try {
                    return l.protoInt64.uParse(e), !0
                } catch (t) {
                    return `${e} out of range`
                }
                return !1
        }
    }

    function b(e, t, n) {
        return (n = "string" == typeof n ? `: ${n}` : `, got ${y(t)}`, void 0 !== e.scalar) ? `expected ${function(e){switch(e){case a.ScalarType.STRING:return"string";case a.ScalarType.BOOL:return"boolean";case a.ScalarType.INT64:case a.ScalarType.SINT64:case a.ScalarType.SFIXED64:return"bigint (int64)";case a.ScalarType.UINT64:case a.ScalarType.FIXED64:return"bigint (uint64)";case a.ScalarType.BYTES:return"Uint8Array";case a.ScalarType.DOUBLE:return"number (float64)";case a.ScalarType.FLOAT:return"number (float32)";case a.ScalarType.FIXED32:case a.ScalarType.UINT32:return"number (uint32)";case a.ScalarType.INT32:case a.ScalarType.SFIXED32:case a.ScalarType.SINT32:return"number (int32)"}}(e.scalar)}` + n : void 0 !== e.enum ? `expected ${e.enum.toString()}` + n : `expected ${g(e.message)}` + n
    }

    function y(e) {
        switch (typeof e) {
            case "object":
                if (null === e) return "null";
                if (e instanceof Uint8Array) return `Uint8Array(${e.length})`;
                if (Array.isArray(e)) return `Array(${e.length})`;
                if ((0, o.isReflectList)(e)) return T(e.field());
                if ((0, o.isReflectMap)(e)) return E(e.field());
                if ((0, o.isReflectMessage)(e)) return g(e.desc);
                if ((0, r.isMessage)(e)) return `message ${e.$typeName}`;
                return "object";
            case "string":
                return e.length > 30 ? "string" : `"${e.split('"').join('\\"')}"`;
            case "boolean":
            case "number":
                return String(e);
            case "bigint":
                return String(e) + "n";
            default:
                return typeof e
        }
    }

    function g(e) {
        return `ReflectMessage (${e.typeName})`
    }

    function T(e) {
        switch (e.listKind) {
            case "message":
                return `ReflectList (${e.message.toString()})`;
            case "enum":
                return `ReflectList (${e.enum.toString()})`;
            case "scalar":
                return `ReflectList (${a.ScalarType[e.scalar]})`
        }
    }

    function E(e) {
        switch (e.mapKind) {
            case "message":
                return `ReflectMap (${a.ScalarType[e.mapKey]}, ${e.message.toString()})`;
            case "enum":
                return `ReflectMap (${a.ScalarType[e.mapKey]}, ${e.enum.toString()})`;
            case "scalar":
                return `ReflectMap (${a.ScalarType[e.mapKey]}, ${a.ScalarType[e.scalar]})`
        }
    }(t = n || (n = {}))[t.Varint = 0] = "Varint", t[t.Bit64 = 1] = "Bit64", t[t.LengthDelimited = 2] = "LengthDelimited", t[t.StartGroup = 3] = "StartGroup", t[t.EndGroup = 4] = "EndGroup", t[t.Bit32 = 5] = "Bit32", e.s(["BinaryReader", 0, class {
        tag() {
            let e = this.pos,
                t = this.uint32(),
                n = this.pos - e;
            if (n > 5 || 5 == n && this.buf[this.pos - 1] > 15) throw Error("illegal tag: varint overflows uint32");
            let a = t >>> 3,
                r = 7 & t;
            if (a <= 0 || r > 5) throw Error("illegal tag: field no " + a + " wire type " + r);
            return [a, r]
        }
        skip(e, t) {
            let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 100,
                r = this.pos;
            switch (e) {
                case n.Varint:
                    for (; 128 & this.buf[this.pos++];);
                    break;
                case n.Bit64:
                    this.pos += 4;
                case n.Bit32:
                    this.pos += 4;
                    break;
                case n.LengthDelimited:
                    let i = this.uint32();
                    this.pos += i;
                    break;
                case n.StartGroup:
                    if (a <= 0) throw Error("maximum recursion depth reached");
                    for (;;) {
                        let [e, r] = this.tag();
                        if (r === n.EndGroup) {
                            if (void 0 !== t && e !== t) throw Error("invalid end group tag");
                            break
                        }
                        this.skip(r, e, a - 1)
                    }
                    break;
                default:
                    throw Error("cant skip wire type " + e)
            }
            return this.assertBounds(), this.buf.subarray(r, this.pos)
        }
        assertBounds() {
            if (this.pos > this.len) throw RangeError("premature EOF")
        }
        int32() {
            return 0 | this.uint32()
        }
        sint32() {
            let e = this.uint32();
            return e >>> 1 ^ -(1 & e)
        }
        int64() {
            return l.protoInt64.dec(...this.varint64())
        }
        uint64() {
            return l.protoInt64.uDec(...this.varint64())
        }
        sint64() {
            let [e, t] = this.varint64(), n = -(1 & e);
            return e = (e >>> 1 | (1 & t) << 31) ^ n, t = t >>> 1 ^ n, l.protoInt64.dec(e, t)
        }
        bool() {
            let [e, t] = this.varint64();
            return 0 !== e || 0 !== t
        }
        fixed32() {
            return this.view.getUint32((this.pos += 4) - 4, !0)
        }
        sfixed32() {
            return this.view.getInt32((this.pos += 4) - 4, !0)
        }
        fixed64() {
            return l.protoInt64.uDec(this.sfixed32(), this.sfixed32())
        }
        sfixed64() {
            return l.protoInt64.dec(this.sfixed32(), this.sfixed32())
        }
        float() {
            return this.view.getFloat32((this.pos += 4) - 4, !0)
        }
        double() {
            return this.view.getFloat64((this.pos += 8) - 8, !0)
        }
        bytes() {
            let e = this.uint32(),
                t = this.pos;
            return this.pos += e, this.assertBounds(), this.buf.subarray(t, t + e)
        }
        string(e) {
            return this.decodeUtf8(this.bytes(), e)
        }
        constructor(e, t = p().decodeUtf8) {
            this.decodeUtf8 = t, this.varint64 = s.varint64read, this.uint32 = s.varint32read, this.buf = e, this.len = e.length, this.pos = 0, this.view = new DataView(e.buffer, e.byteOffset, e.byteLength)
        }
    }, "BinaryWriter", 0, class {
        finish() {
            this.buf.length && (this.chunks.push(new Uint8Array(this.buf)), this.buf = []);
            let e = 0;
            for (let t = 0; t < this.chunks.length; t++) e += this.chunks[t].length;
            let t = new Uint8Array(e),
                n = 0;
            for (let e = 0; e < this.chunks.length; e++) t.set(this.chunks[e], n), n += this.chunks[e].length;
            return this.chunks = [], t
        }
        fork() {
            return this.stack.push({
                chunks: this.chunks,
                buf: this.buf
            }), this.chunks = [], this.buf = [], this
        }
        join() {
            let e = this.finish(),
                t = this.stack.pop();
            if (!t) throw Error("invalid state, fork stack empty");
            return this.chunks = t.chunks, this.buf = t.buf, this.uint32(e.byteLength), this.raw(e)
        }
        tag(e, t) {
            return this.uint32((e << 3 | t) >>> 0)
        }
        raw(e) {
            return this.buf.length && (this.chunks.push(new Uint8Array(this.buf)), this.buf = []), this.chunks.push(e), this
        }
        uint32(e) {
            for (c(e); e > 127;) this.buf.push(127 & e | 128), e >>>= 7;
            return this.buf.push(e), this
        }
        int32(e) {
            return m(e), (0, s.varint32write)(e, this.buf), this
        }
        bool(e) {
            return this.buf.push(+!!e), this
        }
        bytes(e) {
            return this.uint32(e.byteLength), this.raw(e)
        }
        string(e) {
            let t = this.encodeUtf8(e);
            return this.uint32(t.byteLength), this.raw(t)
        }
        float(e) {
            var t = e;
            if ("string" == typeof t) {
                let e = t;
                if (Number.isNaN(t = Number(t)) && "NaN" !== e) throw Error("invalid float32: " + e)
            } else if ("number" != typeof t) throw Error("invalid float32: " + typeof t);
            if (Number.isFinite(t) && (t > 34028234663852886e22 || t < -34028234663852886e22)) throw Error("invalid float32: " + t);
            let n = new Uint8Array(4);
            return new DataView(n.buffer).setFloat32(0, e, !0), this.raw(n)
        }
        double(e) {
            let t = new Uint8Array(8);
            return new DataView(t.buffer).setFloat64(0, e, !0), this.raw(t)
        }
        fixed32(e) {
            c(e);
            let t = new Uint8Array(4);
            return new DataView(t.buffer).setUint32(0, e, !0), this.raw(t)
        }
        sfixed32(e) {
            m(e);
            let t = new Uint8Array(4);
            return new DataView(t.buffer).setInt32(0, e, !0), this.raw(t)
        }
        sint32(e) {
            return m(e), e = (e << 1 ^ e >> 31) >>> 0, (0, s.varint32write)(e, this.buf), this
        }
        sfixed64(e) {
            let t = new Uint8Array(8),
                n = new DataView(t.buffer),
                a = l.protoInt64.enc(e);
            return n.setInt32(0, a.lo, !0), n.setInt32(4, a.hi, !0), this.raw(t)
        }
        fixed64(e) {
            let t = new Uint8Array(8),
                n = new DataView(t.buffer),
                a = l.protoInt64.uEnc(e);
            return n.setInt32(0, a.lo, !0), n.setInt32(4, a.hi, !0), this.raw(t)
        }
        int64(e) {
            let t = l.protoInt64.enc(e);
            return (0, s.varint64write)(t.lo, t.hi, this.buf), this
        }
        sint64(e) {
            let t = l.protoInt64.enc(e),
                n = t.hi >> 31,
                a = t.lo << 1 ^ n,
                r = (t.hi << 1 | t.lo >>> 31) ^ n;
            return (0, s.varint64write)(a, r, this.buf), this
        }
        uint64(e) {
            let t = l.protoInt64.uEnc(e);
            return (0, s.varint64write)(t.lo, t.hi, this.buf), this
        }
        constructor(e = p().encodeUtf8) {
            this.encodeUtf8 = e, this.stack = [], this.chunks = [], this.buf = []
        }
    }, "FLOAT32_MAX", 0, 34028234663852886e22, "FLOAT32_MIN", 0, -34028234663852886e22, "INT32_MAX", 0, 0x7fffffff, "INT32_MIN", 0, -0x80000000, "UINT32_MAX", 0, 0xffffffff, "WireType", 0, n], 306541), e.s(["checkField", 0, function(e, t) {
        let n, a = "list" == e.fieldKind ? (0, o.isReflectList)(t, e) : "map" == e.fieldKind ? (0, o.isReflectMap)(t, e) : f(e, t);
        if (!0 !== a) {
            switch (e.fieldKind) {
                case "list":
                    n = `expected ${T(e)}, got ${y(t)}`;
                    break;
                case "map":
                    n = `expected ${E(e)}, got ${y(t)}`;
                    break;
                default:
                    n = b(e, t, a)
            }
            return new i.FieldError(e, n)
        }
    }, "checkListItem", 0, function(e, t, n) {
        let a = f(e, n);
        if (!0 !== a) return new i.FieldError(e, `list item #${t+1}: ${b(e,n,a)}`)
    }, "checkMapEntry", 0, function(e, t, n) {
        let a = d(t, e.mapKey);
        if (!0 !== a) return new i.FieldError(e, `invalid map key: ${b({scalar:e.mapKey},t,a)}`);
        let r = f(e, n);
        if (!0 !== r) return new i.FieldError(e, `map entry ${y(t)}: ${b(e,n,r)}`)
    }, "formatVal", 0, y], 864858)
}, 860430, 855988, 939850, e => {
    "use strict";
    var t = e.i(1558),
        n = e.i(675618),
        a = e.i(114283),
        r = e.i(757886),
        i = e.i(491819),
        o = e.i(7657),
        s = e.i(864858),
        l = e.i(55738),
        u = e.i(747690),
        p = e.i(343549),
        m = e.i(465336),
        c = e.i(669207),
        f = e.i(114052);

    function d(e, t) {
        let n = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
        return new y(e, t, n)
    }
    let b = new WeakMap;
    class y {
        get sortedFields() {
            let e = b.get(this.desc);
            if (e) return e;
            let t = this.desc.fields.concat().sort((e, t) => e.number - t.number);
            return b.set(this.desc, t), t
        }
        findNumber(e) {
            return this._fieldsByNumber || (this._fieldsByNumber = new Map(this.desc.fields.map(e => [e.number, e]))), this._fieldsByNumber.get(e)
        }
        oneofCase(e) {
            return g(this.message, e), (0, u.unsafeOneofCase)(this.message, e)
        }
        isSet(e) {
            return g(this.message, e), (0, u.unsafeIsSet)(this.message, e)
        }
        clear(e) {
            g(this.message, e), (0, u.unsafeClear)(this.message, e)
        }
        get(e) {
            g(this.message, e);
            let t = (0, u.unsafeGet)(this.message, e);
            switch (e.fieldKind) {
                case "list":
                    let n = this.lists.get(e);
                    return n && n[u.unsafeLocal] === t || this.lists.set(e, n = new T(e, t, this.check)), n;
                case "map":
                    let a = this.maps.get(e);
                    return a && a[u.unsafeLocal] === t || this.maps.set(e, a = new E(e, t, this.check)), a;
                case "message":
                    return h(e, t, this.check);
                case "scalar":
                    return void 0 === t ? (0, o.scalarZeroValue)(e.scalar, !1) : D(e, t);
                case "enum":
                    return null != t ? t : e.enum.values[0].number
            }
        }
        set(e, t) {
            let n;
            if (g(this.message, e), this.check) {
                let n = (0, s.checkField)(e, t);
                if (n) throw n
            }
            n = "message" == e.fieldKind ? N(e, t) : (0, f.isReflectMap)(t) || (0, f.isReflectList)(t) ? t[u.unsafeLocal] : L(e, t), (0, u.unsafeSet)(this.message, e, n)
        }
        getUnknown() {
            return this.message.$unknown
        }
        setUnknown(e) {
            this.message.$unknown = e
        }
        constructor(e, t, n = !0) {
            this.lists = new Map, this.maps = new Map, this.check = n, this.desc = e, this.message = this[u.unsafeLocal] = null != t ? t : (0, p.create)(e), this.fields = e.fields, this.oneofs = e.oneofs, this.members = e.members
        }
    }

    function g(e, t) {
        if (t.parent.typeName !== e.$typeName) throw new l.FieldError(t, `cannot use ${t.toString()} with message ${e.$typeName}`, "ForeignFieldError")
    }
    class T {
        field() {
            return this._field
        }
        get size() {
            return this._arr.length
        }
        get(e) {
            let t = this._arr[e];
            return void 0 === t ? void 0 : S(this._field, t, this.check)
        }
        set(e, t) {
            if (e < 0 || e >= this._arr.length) throw new l.FieldError(this._field, `list item #${e+1}: out of range`);
            if (this.check) {
                let n = (0, s.checkListItem)(this._field, e, t);
                if (n) throw n
            }
            this._arr[e] = I(this._field, t)
        }
        add(e) {
            if (this.check) {
                let t = (0, s.checkListItem)(this._field, this._arr.length, e);
                if (t) throw t
            }
            this._arr.push(I(this._field, e))
        }
        clear() {
            this._arr.splice(0, this._arr.length)
        } [Symbol.iterator]() {
            return this.values()
        }
        keys() {
            return this._arr.keys()
        }* values() {
            for (let e of this._arr) yield S(this._field, e, this.check)
        }* entries() {
            for (let e = 0; e < this._arr.length; e++) yield [e, S(this._field, this._arr[e], this.check)]
        }
        constructor(e, t, n) {
            this._field = e, this._arr = this[u.unsafeLocal] = t, this.check = n
        }
    }
    class E {
        field() {
            return this._field
        }
        set(e, t) {
            var n, a;
            if (this.check) {
                let n = (0, s.checkMapEntry)(this._field, e, t);
                if (n) throw n
            }
            return this.obj[O(e)] = (n = this._field, a = t, "message" == n.mapKind ? N(n, a) : L(n, a)), this
        }
        delete(e) {
            let t = O(e),
                n = Object.prototype.hasOwnProperty.call(this.obj, t);
            return n && delete this.obj[t], n
        }
        clear() {
            for (let e of Object.keys(this.obj)) delete this.obj[e]
        }
        get(e) {
            let t = this.obj[O(e)];
            return void 0 !== t && (t = _(this._field, t, this.check)), t
        }
        has(e) {
            return Object.prototype.hasOwnProperty.call(this.obj, O(e))
        }* keys() {
            for (let e of Object.keys(this.obj)) yield v(e, this._field.mapKey)
        }* entries() {
            for (let e of Object.entries(this.obj)) yield [v(e[0], this._field.mapKey), _(this._field, e[1], this.check)]
        } [Symbol.iterator]() {
            return this.entries()
        }
        get size() {
            return Object.keys(this.obj).length
        }* values() {
            for (let e of Object.values(this.obj)) yield _(this._field, e, this.check)
        }
        forEach(e, t) {
            for (let n of this.entries()) e.call(t, n[1], n[0], this)
        }
        constructor(e, t, n = !0) {
            this.obj = this[u.unsafeLocal] = null != t ? t : {}, this.check = n, this._field = e
        }
    }

    function N(e, t) {
        return (0, f.isReflectMessage)(t) ? (0, m.isWrapper)(t.message) && !e.oneof && "message" == e.fieldKind ? t.message.value : "google.protobuf.Struct" == t.desc.typeName && "google.protobuf.Value" != e.parent.typeName ? function e(t) {
            let n = {};
            for (let [a, r] of Object.entries(t.fields)) n[a] = function t(n) {
                switch (n.kind.case) {
                    case "structValue":
                        return e(n.kind.value);
                    case "listValue":
                        return n.kind.value.values.map(t);
                    case "nullValue":
                    case void 0:
                        return null;
                    default:
                        return n.kind.value
                }
            }(r);
            return n
        }(t.message) : t.message : t
    }

    function h(e, t, n) {
        return void 0 !== t && ((0, m.isWrapperDesc)(e.message) && !e.oneof && "message" == e.fieldKind ? t = {
            $typeName: e.message.typeName,
            value: D(e.message.fields[0], t)
        } : "google.protobuf.Struct" == e.message.typeName && "google.protobuf.Value" != e.parent.typeName && (0, f.isObject)(t) && (t = function e(t) {
            let n = {
                $typeName: "google.protobuf.Struct",
                fields: {}
            };
            if ((0, f.isObject)(t))
                for (let [a, r] of Object.entries(t)) n.fields[a] = function t(n) {
                    let a = {
                        $typeName: "google.protobuf.Value",
                        kind: {
                            case: void 0
                        }
                    };
                    switch (typeof n) {
                        case "number":
                            a.kind = {
                                case: "numberValue",
                                value: n
                            };
                            break;
                        case "string":
                            a.kind = {
                                case: "stringValue",
                                value: n
                            };
                            break;
                        case "boolean":
                            a.kind = {
                                case: "boolValue",
                                value: n
                            };
                            break;
                        case "object":
                            if (null === n) a.kind = {
                                case: "nullValue",
                                value: 0
                            };
                            else if (Array.isArray(n)) {
                                let e = {
                                    $typeName: "google.protobuf.ListValue",
                                    values: []
                                };
                                if (Array.isArray(n))
                                    for (let a of n) e.values.push(t(a));
                                a.kind = {
                                    case: "listValue",
                                    value: e
                                }
                            } else a.kind = {
                                case: "structValue",
                                value: e(n)
                            }
                    }
                    return a
                }(r);
            return n
        }(t))), new y(e.message, t, n)
    }

    function I(e, t) {
        return "message" == e.listKind ? N(e, t) : L(e, t)
    }

    function S(e, t, n) {
        return "message" == e.listKind ? h(e, t, n) : D(e, t)
    }

    function _(e, t, n) {
        return "message" == e.mapKind ? h(e, t, n) : t
    }

    function O(e) {
        return "string" == typeof e || "number" == typeof e ? e : String(e)
    }

    function v(e, t) {
        switch (t) {
            case i.ScalarType.STRING:
                break;
            case i.ScalarType.INT32:
            case i.ScalarType.FIXED32:
            case i.ScalarType.UINT32:
            case i.ScalarType.SFIXED32:
            case i.ScalarType.SINT32: {
                let t = Number.parseInt(e);
                if (Number.isFinite(t)) return t;
                break
            }
            case i.ScalarType.BOOL:
                switch (e) {
                    case "true":
                        return !0;
                    case "false":
                        return !1
                }
                break;
            case i.ScalarType.UINT64:
            case i.ScalarType.FIXED64:
                try {
                    return c.protoInt64.uParse(e)
                } catch (e) {}
                break;
            default:
                try {
                    return c.protoInt64.parse(e)
                } catch (e) {}
        }
        return e
    }

    function D(e, t) {
        switch (e.scalar) {
            case i.ScalarType.INT64:
            case i.ScalarType.SFIXED64:
            case i.ScalarType.SINT64:
                "longAsString" in e && e.longAsString && "string" == typeof t && (t = c.protoInt64.parse(t));
                break;
            case i.ScalarType.FIXED64:
            case i.ScalarType.UINT64:
                "longAsString" in e && e.longAsString && "string" == typeof t && (t = c.protoInt64.uParse(t))
        }
        return t
    }

    function L(e, t) {
        switch (e.scalar) {
            case i.ScalarType.INT64:
            case i.ScalarType.SFIXED64:
            case i.ScalarType.SINT64:
                "longAsString" in e && e.longAsString ? t = String(t) : ("string" == typeof t || "number" == typeof t) && (t = c.protoInt64.parse(t));
                break;
            case i.ScalarType.FIXED64:
            case i.ScalarType.UINT64:
                "longAsString" in e && e.longAsString ? t = String(t) : ("string" == typeof t || "number" == typeof t) && (t = c.protoInt64.uParse(t))
        }
        return t
    }
    e.s(["reflect", 0, d], 855988);
    var F = e.i(306541),
        R = e.i(512551);

    function k(e, t, n) {
        let a = d(e, void 0, !1);
        return A(a, new F.BinaryReader(t), Object.assign(Object.assign({
            readUnknownFields: !0,
            recursionLimit: 100
        }, n), {
            depth: 0
        }), !1, t.byteLength), a.message
    }

    function A(e, t, n, a, r) {
        var s;
        let l, u;
        if (++n.depth > n.recursionLimit) throw Error(`cannot decode ${e.desc} from binary: maximum recursion depth of ${n.recursionLimit} reached`);
        let p = a ? t.len : t.pos + r,
            m = null != (s = e.getUnknown()) ? s : [];
        for (; t.pos < p && ([l, u] = t.tag(), !a || u != F.WireType.EndGroup);) {
            let a = e.findNumber(l);
            if (!a) {
                let e = n.recursionLimit - n.depth,
                    a = t.skip(u, l, e);
                n.readUnknownFields && m.push({
                    no: l,
                    wireType: u,
                    data: a
                });
                continue
            }! function(e, t, n, a, r) {
                var s;
                switch (n.fieldKind) {
                    case "scalar":
                        e.set(n, U(t, n.scalar, n.utf8Validation));
                        break;
                    case "enum":
                        let l = U(t, i.ScalarType.INT32);
                        if (n.enum.open) e.set(n, l);
                        else if (n.enum.values.some(e => e.number === l)) e.set(n, l);
                        else if (r.readUnknownFields) {
                            let t = [];
                            (0, R.varint32write)(l, t);
                            let r = null != (s = e.getUnknown()) ? s : [];
                            r.push({
                                no: n.number,
                                wireType: a,
                                data: new Uint8Array(t)
                            }), e.setUnknown(r)
                        }
                        break;
                    case "message":
                        e.set(n, w(t, r, n, e.get(n)));
                        break;
                    case "list":
                        ! function(e, t, n, a) {
                            var r;
                            let o = n.field();
                            if ("message" === o.listKind) return n.add(w(e, a, o));
                            let s = null != (r = o.scalar) ? r : i.ScalarType.INT32;
                            if (t != F.WireType.LengthDelimited || s == i.ScalarType.STRING || s == i.ScalarType.BYTES) return n.add(U(e, s, o.utf8Validation));
                            let l = e.uint32() + e.pos;
                            for (; e.pos < l;) n.add(U(e, s, o.utf8Validation))
                        }(t, a, e.get(n), r);
                        break;
                    case "map":
                        ! function(e, t, n) {
                            let a, r, i = t.field(),
                                s = e.uint32(),
                                l = e.pos + s;
                            for (; e.pos < l;) {
                                let [t] = e.tag();
                                switch (t) {
                                    case 1:
                                        a = U(e, i.mapKey, i.utf8Validation);
                                        break;
                                    case 2:
                                        switch (i.mapKind) {
                                            case "scalar":
                                                r = U(e, i.scalar, i.utf8Validation);
                                                break;
                                            case "enum":
                                                r = e.int32();
                                                break;
                                            case "message":
                                                r = w(e, n, i)
                                        }
                                }
                            }
                            if (void 0 === a && (a = (0, o.scalarZeroValue)(i.mapKey, !1)), void 0 === r) switch (i.mapKind) {
                                case "scalar":
                                    r = (0, o.scalarZeroValue)(i.scalar, !1);
                                    break;
                                case "enum":
                                    r = i.enum.values[0].number;
                                    break;
                                case "message":
                                    r = d(i.message, void 0, !1)
                            }
                            t.set(a, r)
                        }(t, e.get(n), r)
                }
            }(e, t, a, u, n)
        }
        if (a && (u != F.WireType.EndGroup || l !== r)) throw Error("invalid end group tag");
        m.length > 0 && e.setUnknown(m), n.depth--
    }

    function w(e, t, n, a) {
        let r = n.delimitedEncoding,
            i = null != a ? a : d(n.message, void 0, !1);
        return A(i, e, t, r, r ? n.number : e.uint32()), i
    }

    function U(e, t) {
        let n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
        switch (t) {
            case i.ScalarType.STRING:
                return e.string(n);
            case i.ScalarType.BOOL:
                return e.bool();
            case i.ScalarType.DOUBLE:
                return e.double();
            case i.ScalarType.FLOAT:
                return e.float();
            case i.ScalarType.INT32:
                return e.int32();
            case i.ScalarType.INT64:
                return e.int64();
            case i.ScalarType.UINT64:
                return e.uint64();
            case i.ScalarType.FIXED64:
                return e.fixed64();
            case i.ScalarType.BYTES:
                return e.bytes();
            case i.ScalarType.FIXED32:
                return e.fixed32();
            case i.ScalarType.SFIXED32:
                return e.sfixed32();
            case i.ScalarType.SFIXED64:
                return e.sfixed64();
            case i.ScalarType.SINT64:
                return e.sint64();
            case i.ScalarType.UINT32:
                return e.uint32();
            case i.ScalarType.SINT32:
                return e.sint32()
        }
    }
    e.s(["fromBinary", 0, k], 939850), e.s(["fileDesc", 0, function(e, i) {
        var o;
        let s = k(n.FileDescriptorProtoSchema, (0, t.base64Decode)(e));
        return s.messageType.forEach(r.restoreJsonNames), s.dependency = null != (o = null == i ? void 0 : i.map(e => e.proto.name)) ? o : [], (0, a.createFileRegistry)(s, e => null == i ? void 0 : i.find(t => t.proto.name === e)).getFile(s.name)
    }], 860430)
}, 778365, e => {
    "use strict";
    e.s(["extDesc", 0, function(e, t) {
        for (var n = arguments.length, a = Array(n > 2 ? n - 2 : 0), r = 2; r < n; r++) a[r - 2] = arguments[r];
        if (0 == a.length) return e.extensions[t];
        let i = a.pop();
        return a.reduce((e, t) => e.nestedMessages[t], e.messages[t]).nestedExtensions[i]
    }])
}, 400661, e => {
    "use strict";
    var t = e.i(855988),
        n = e.i(306541),
        a = e.i(491819);
    let r = {
        writeUnknownFields: !0
    };

    function i(e, t, n) {
        var a;
        for (let a of n.sortedFields) {
            if (!n.isSet(a)) {
                if (3 == a.presence) throw Error(`cannot encode ${a} to binary: required field not set`);
                continue
            }
            o(e, t, n, a)
        }
        if (t.writeUnknownFields)
            for (let {
                    no: t,
                    wireType: r,
                    data: i
                }
                of null != (a = n.getUnknown()) ? a : []) e.tag(t, r).raw(i);
        return e
    }

    function o(e, t, r, o) {
        var p;
        switch (o.fieldKind) {
            case "scalar":
            case "enum":
                s(e, r.desc.typeName, o.name, null != (p = o.scalar) ? p : a.ScalarType.INT32, o.number, r.get(o));
                break;
            case "list":
                ! function(e, t, r, i) {
                    var o;
                    if ("message" == r.listKind) {
                        for (let n of i) l(e, t, r, n);
                        return
                    }
                    let p = null != (o = r.scalar) ? o : a.ScalarType.INT32;
                    if (r.packed) {
                        if (!i.size) return;
                        for (let t of (e.tag(r.number, n.WireType.LengthDelimited).fork(), i)) u(e, r.parent.typeName, r.name, p, t);
                        e.join();
                        return
                    }
                    for (let t of i) s(e, r.parent.typeName, r.name, p, r.number, t)
                }(e, t, o, r.get(o));
                break;
            case "message":
                l(e, t, o, r.get(o));
                break;
            case "map":
                for (let [l, u] of r.get(o)) ! function(e, t, r, o, l) {
                    var u;
                    switch (e.tag(r.number, n.WireType.LengthDelimited).fork(), s(e, r.parent.typeName, r.name, r.mapKey, 1, o), r.mapKind) {
                        case "scalar":
                        case "enum":
                            s(e, r.parent.typeName, r.name, null != (u = r.scalar) ? u : a.ScalarType.INT32, 2, l);
                            break;
                        case "message":
                            i(e.tag(2, n.WireType.LengthDelimited).fork(), t, l).join()
                    }
                    e.join()
                }(e, t, o, l, u)
        }
    }

    function s(e, t, r, i, o, s) {
        u(e.tag(o, function(e) {
            switch (e) {
                case a.ScalarType.BYTES:
                case a.ScalarType.STRING:
                    return n.WireType.LengthDelimited;
                case a.ScalarType.DOUBLE:
                case a.ScalarType.FIXED64:
                case a.ScalarType.SFIXED64:
                    return n.WireType.Bit64;
                case a.ScalarType.FIXED32:
                case a.ScalarType.SFIXED32:
                case a.ScalarType.FLOAT:
                    return n.WireType.Bit32;
                default:
                    return n.WireType.Varint
            }
        }(i)), t, r, i, s)
    }

    function l(e, t, a, r) {
        a.delimitedEncoding ? i(e.tag(a.number, n.WireType.StartGroup), t, r).tag(a.number, n.WireType.EndGroup) : i(e.tag(a.number, n.WireType.LengthDelimited).fork(), t, r).join()
    }

    function u(e, t, n, r, i) {
        try {
            switch (r) {
                case a.ScalarType.STRING:
                    e.string(i);
                    break;
                case a.ScalarType.BOOL:
                    e.bool(i);
                    break;
                case a.ScalarType.DOUBLE:
                    e.double(i);
                    break;
                case a.ScalarType.FLOAT:
                    e.float(i);
                    break;
                case a.ScalarType.INT32:
                    e.int32(i);
                    break;
                case a.ScalarType.INT64:
                    e.int64(i);
                    break;
                case a.ScalarType.UINT64:
                    e.uint64(i);
                    break;
                case a.ScalarType.FIXED64:
                    e.fixed64(i);
                    break;
                case a.ScalarType.BYTES:
                    e.bytes(i);
                    break;
                case a.ScalarType.FIXED32:
                    e.fixed32(i);
                    break;
                case a.ScalarType.SFIXED32:
                    e.sfixed32(i);
                    break;
                case a.ScalarType.SFIXED64:
                    e.sfixed64(i);
                    break;
                case a.ScalarType.SINT64:
                    e.sint64(i);
                    break;
                case a.ScalarType.UINT32:
                    e.uint32(i);
                    break;
                case a.ScalarType.SINT32:
                    e.sint32(i)
            }
        } catch (e) {
            if (e instanceof Error) throw Error(`cannot encode field ${t}.${n} to binary: ${e.message}`);
            throw e
        }
    }
    e.s(["toBinary", 0, function(e, a, o) {
        return i(new n.BinaryWriter, o ? Object.assign(Object.assign({}, r), o) : r, (0, t.reflect)(e, a)).finish()
    }, "writeField", 0, o])
}]);

//# debugId=cbf709a1-b94d-bd34-bc39-4cd08cd863b4
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0vtnzdg5w9_k5.js.map