;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "990b85f7-fe2e-ea00-2080-d55164642098")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 11682, (e, t, r) => {
    var a = e.i(163021);
    ! function() {
        "use strict";
        var r = "input is invalid type",
            i = "object" == typeof window,
            o = i ? window : {};
        o.JS_MD5_NO_WINDOW && (i = !1);
        var n = !i && "object" == typeof self,
            s = !o.JS_MD5_NO_NODE_JS && "object" == typeof a.default && a.default.versions && a.default.versions.node;
        s ? o = e.g : n && (o = self);
        var l, u = !o.JS_MD5_NO_COMMON_JS && t.exports,
            c = "function" == typeof define && define.amd,
            d = !o.JS_MD5_NO_ARRAY_BUFFER && "u" > typeof ArrayBuffer,
            h = "0123456789abcdef".split(""),
            p = [128, 32768, 8388608, -0x80000000],
            f = [0, 8, 16, 24],
            m = ["hex", "array", "digest", "buffer", "arrayBuffer", "base64"],
            v = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".split(""),
            y = [];
        if (d) {
            var A = new ArrayBuffer(68);
            l = new Uint8Array(A), y = new Uint32Array(A)
        }
        var g = Array.isArray;
        (o.JS_MD5_NO_NODE_JS || !g) && (g = function(e) {
            return "[object Array]" === Object.prototype.toString.call(e)
        });
        var w = ArrayBuffer.isView;
        d && (o.JS_MD5_NO_ARRAY_BUFFER_IS_VIEW || !w) && (w = function(e) {
            return "object" == typeof e && e.buffer && e.buffer.constructor === ArrayBuffer
        });
        var I = function(e) {
                var t = typeof e;
                if ("string" === t) return [e, !0];
                if ("object" !== t || null === e) throw Error(r);
                if (d && e.constructor === ArrayBuffer) return [new Uint8Array(e), !1];
                if (!g(e) && !w(e)) throw Error(r);
                return [e, !1]
            },
            T = function(e) {
                return function(t) {
                    return new C(!0).update(t)[e]()
                }
            },
            b = function(e) {
                var t, a = {},
                    i = void 0;
                return t = i.from && !o.JS_MD5_NO_BUFFER_FROM ? i.from : function(e) {
                        return new i(e)
                    },
                    function(o) {
                        if ("string" == typeof o) return a.createHash("md5").update(o, "utf8").digest("hex");
                        if (null == o) throw Error(r);
                        return o.constructor === ArrayBuffer && (o = new Uint8Array(o)), g(o) || w(o) || o.constructor === i ? a.createHash("md5").update(t(o)).digest("hex") : e(o)
                    }
            },
            S = function(e) {
                return function(t, r) {
                    return new x(t, !0).update(r)[e]()
                }
            };

        function C(e) {
            if (e) y[0] = y[16] = y[1] = y[2] = y[3] = y[4] = y[5] = y[6] = y[7] = y[8] = y[9] = y[10] = y[11] = y[12] = y[13] = y[14] = y[15] = 0, this.blocks = y, this.buffer8 = l;
            else if (d) {
                var t = new ArrayBuffer(68);
                this.buffer8 = new Uint8Array(t), this.blocks = new Uint32Array(t)
            } else this.blocks = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            this.h0 = this.h1 = this.h2 = this.h3 = this.start = this.bytes = this.hBytes = 0, this.finalized = this.hashed = !1, this.first = !0
        }

        function x(e, t) {
            var r, a = I(e);
            if (e = a[0], a[1]) {
                var i, o = [],
                    n = e.length,
                    s = 0;
                for (r = 0; r < n; ++r)(i = e.charCodeAt(r)) < 128 ? o[s++] = i : (i < 2048 ? o[s++] = 192 | i >>> 6 : (i < 55296 || i >= 57344 ? o[s++] = 224 | i >>> 12 : (i = 65536 + ((1023 & i) << 10 | 1023 & e.charCodeAt(++r)), o[s++] = 240 | i >>> 18, o[s++] = 128 | i >>> 12 & 63), o[s++] = 128 | i >>> 6 & 63), o[s++] = 128 | 63 & i);
                e = o
            }
            e.length > 64 && (e = new C(!0).update(e).array());
            var l = [],
                u = [];
            for (r = 0; r < 64; ++r) {
                var c = e[r] || 0;
                l[r] = 92 ^ c, u[r] = 54 ^ c
            }
            C.call(this, t), this.update(u), this.oKeyPad = l, this.inner = !0, this.sharedMemory = t
        }
        C.prototype.update = function(e) {
            if (this.finalized) throw Error("finalize already called");
            var t = I(e);
            e = t[0];
            for (var r, a, i = t[1], o = 0, n = e.length, s = this.blocks, l = this.buffer8; o < n;) {
                if (this.hashed && (this.hashed = !1, s[0] = s[16], s[16] = s[1] = s[2] = s[3] = s[4] = s[5] = s[6] = s[7] = s[8] = s[9] = s[10] = s[11] = s[12] = s[13] = s[14] = s[15] = 0), i)
                    if (d)
                        for (a = this.start; o < n && a < 64; ++o)(r = e.charCodeAt(o)) < 128 ? l[a++] = r : (r < 2048 ? l[a++] = 192 | r >>> 6 : (r < 55296 || r >= 57344 ? l[a++] = 224 | r >>> 12 : (r = 65536 + ((1023 & r) << 10 | 1023 & e.charCodeAt(++o)), l[a++] = 240 | r >>> 18, l[a++] = 128 | r >>> 12 & 63), l[a++] = 128 | r >>> 6 & 63), l[a++] = 128 | 63 & r);
                    else
                        for (a = this.start; o < n && a < 64; ++o)(r = e.charCodeAt(o)) < 128 ? s[a >>> 2] |= r << f[3 & a++] : (r < 2048 ? s[a >>> 2] |= (192 | r >>> 6) << f[3 & a++] : (r < 55296 || r >= 57344 ? s[a >>> 2] |= (224 | r >>> 12) << f[3 & a++] : (r = 65536 + ((1023 & r) << 10 | 1023 & e.charCodeAt(++o)), s[a >>> 2] |= (240 | r >>> 18) << f[3 & a++], s[a >>> 2] |= (128 | r >>> 12 & 63) << f[3 & a++]), s[a >>> 2] |= (128 | r >>> 6 & 63) << f[3 & a++]), s[a >>> 2] |= (128 | 63 & r) << f[3 & a++]);
                else if (d)
                    for (a = this.start; o < n && a < 64; ++o) l[a++] = e[o];
                else
                    for (a = this.start; o < n && a < 64; ++o) s[a >>> 2] |= e[o] << f[3 & a++];
                this.lastByteIndex = a, this.bytes += a - this.start, a >= 64 ? (this.start = a - 64, this.hash(), this.hashed = !0) : this.start = a
            }
            return this.bytes > 0xffffffff && (this.hBytes += this.bytes / 0x100000000 | 0, this.bytes = this.bytes % 0x100000000), this
        }, C.prototype.finalize = function() {
            if (!this.finalized) {
                this.finalized = !0;
                var e = this.blocks,
                    t = this.lastByteIndex;
                e[t >>> 2] |= p[3 & t], t >= 56 && (this.hashed || this.hash(), e[0] = e[16], e[16] = e[1] = e[2] = e[3] = e[4] = e[5] = e[6] = e[7] = e[8] = e[9] = e[10] = e[11] = e[12] = e[13] = e[14] = e[15] = 0), e[14] = this.bytes << 3, e[15] = this.hBytes << 3 | this.bytes >>> 29, this.hash()
            }
        }, C.prototype.hash = function() {
            var e, t, r, a, i, o, n = this.blocks;
            this.first ? (r = ((r = (-0x10325477 ^ (a = ((a = (-0x67452302 ^ 0x77777777 & (e = ((e = n[0] - 0x28955b89) << 7 | e >>> 25) - 0x10325477 | 0)) + n[1] - 0x705f434) << 12 | a >>> 20) + e | 0) & (-0x10325477 ^ e)) + n[2] - 0x4324b227) << 17 | r >>> 15) + a | 0, t = ((t = (e ^ r & (a ^ e)) + n[3] - 0x4e748589) << 22 | t >>> 10) + r | 0) : (e = this.h0, t = this.h1, r = this.h2, e += ((a = this.h3) ^ t & (r ^ a)) + n[0] - 0x28955b88, a += (r ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ r)) + n[1] - 0x173848aa, r += (t ^ (a = (a << 12 | a >>> 20) + e | 0) & (e ^ t)) + n[2] + 0x242070db, t += (e ^ (r = (r << 17 | r >>> 15) + a | 0) & (a ^ e)) + n[3] - 0x3e423112, t = (t << 22 | t >>> 10) + r | 0), e += (a ^ t & (r ^ a)) + n[4] - 0xa83f051, a += (r ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ r)) + n[5] + 0x4787c62a, r += (t ^ (a = (a << 12 | a >>> 20) + e | 0) & (e ^ t)) + n[6] - 0x57cfb9ed, t += (e ^ (r = (r << 17 | r >>> 15) + a | 0) & (a ^ e)) + n[7] - 0x2b96aff, e += (a ^ (t = (t << 22 | t >>> 10) + r | 0) & (r ^ a)) + n[8] + 0x698098d8, a += (r ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ r)) + n[9] - 0x74bb0851, r += (t ^ (a = (a << 12 | a >>> 20) + e | 0) & (e ^ t)) + n[10] - 42063, t += (e ^ (r = (r << 17 | r >>> 15) + a | 0) & (a ^ e)) + n[11] - 0x76a32842, e += (a ^ (t = (t << 22 | t >>> 10) + r | 0) & (r ^ a)) + n[12] + 0x6b901122, a += (r ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ r)) + n[13] - 0x2678e6d, r += (t ^ (a = (a << 12 | a >>> 20) + e | 0) & (e ^ t)) + n[14] - 0x5986bc72, t += (e ^ (r = (r << 17 | r >>> 15) + a | 0) & (a ^ e)) + n[15] + 0x49b40821, t = (t << 22 | t >>> 10) + r | 0, e += (r ^ a & (t ^ r)) + n[1] - 0x9e1da9e, e = (e << 5 | e >>> 27) + t | 0, a += (t ^ r & (e ^ t)) + n[6] - 0x3fbf4cc0, a = (a << 9 | a >>> 23) + e | 0, r += (e ^ t & (a ^ e)) + n[11] + 0x265e5a51, r = (r << 14 | r >>> 18) + a | 0, t += (a ^ e & (r ^ a)) + n[0] - 0x16493856, t = (t << 20 | t >>> 12) + r | 0, e += (r ^ a & (t ^ r)) + n[5] - 0x29d0efa3, e = (e << 5 | e >>> 27) + t | 0, a += (t ^ r & (e ^ t)) + n[10] + 0x2441453, a = (a << 9 | a >>> 23) + e | 0, r += (e ^ t & (a ^ e)) + n[15] - 0x275e197f, r = (r << 14 | r >>> 18) + a | 0, t += (a ^ e & (r ^ a)) + n[4] - 0x182c0438, t = (t << 20 | t >>> 12) + r | 0, e += (r ^ a & (t ^ r)) + n[9] + 0x21e1cde6, e = (e << 5 | e >>> 27) + t | 0, a += (t ^ r & (e ^ t)) + n[14] - 0x3cc8f82a, a = (a << 9 | a >>> 23) + e | 0, r += (e ^ t & (a ^ e)) + n[3] - 0xb2af279, r = (r << 14 | r >>> 18) + a | 0, t += (a ^ e & (r ^ a)) + n[8] + 0x455a14ed, t = (t << 20 | t >>> 12) + r | 0, e += (r ^ a & (t ^ r)) + n[13] - 0x561c16fb, e = (e << 5 | e >>> 27) + t | 0, a += (t ^ r & (e ^ t)) + n[2] - 0x3105c08, a = (a << 9 | a >>> 23) + e | 0, r += (e ^ t & (a ^ e)) + n[7] + 0x676f02d9, r = (r << 14 | r >>> 18) + a | 0, t += (a ^ e & (r ^ a)) + n[12] - 0x72d5b376, e += ((i = (t = (t << 20 | t >>> 12) + r | 0) ^ r) ^ a) + n[5] - 378558, a += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + n[8] - 0x788e097f, r += ((o = (a = (a << 11 | a >>> 21) + e | 0) ^ e) ^ t) + n[11] + 0x6d9d6122, t += (o ^ (r = (r << 16 | r >>> 16) + a | 0)) + n[14] - 0x21ac7f4, e += ((i = (t = (t << 23 | t >>> 9) + r | 0) ^ r) ^ a) + n[1] - 0x5b4115bc, a += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + n[4] + 0x4bdecfa9, r += ((o = (a = (a << 11 | a >>> 21) + e | 0) ^ e) ^ t) + n[7] - 0x944b4a0, t += (o ^ (r = (r << 16 | r >>> 16) + a | 0)) + n[10] - 0x41404390, e += ((i = (t = (t << 23 | t >>> 9) + r | 0) ^ r) ^ a) + n[13] + 0x289b7ec6, a += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + n[0] - 0x155ed806, r += ((o = (a = (a << 11 | a >>> 21) + e | 0) ^ e) ^ t) + n[3] - 0x2b10cf7b, t += (o ^ (r = (r << 16 | r >>> 16) + a | 0)) + n[6] + 0x4881d05, e += ((i = (t = (t << 23 | t >>> 9) + r | 0) ^ r) ^ a) + n[9] - 0x262b2fc7, a += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + n[12] - 0x1924661b, r += ((o = (a = (a << 11 | a >>> 21) + e | 0) ^ e) ^ t) + n[15] + 0x1fa27cf8, t += (o ^ (r = (r << 16 | r >>> 16) + a | 0)) + n[2] - 0x3b53a99b, t = (t << 23 | t >>> 9) + r | 0, e += (r ^ (t | ~a)) + n[0] - 0xbd6ddbc, e = (e << 6 | e >>> 26) + t | 0, a += (t ^ (e | ~r)) + n[7] + 0x432aff97, a = (a << 10 | a >>> 22) + e | 0, r += (e ^ (a | ~t)) + n[14] - 0x546bdc59, r = (r << 15 | r >>> 17) + a | 0, t += (a ^ (r | ~e)) + n[5] - 0x36c5fc7, t = (t << 21 | t >>> 11) + r | 0, e += (r ^ (t | ~a)) + n[12] + 0x655b59c3, e = (e << 6 | e >>> 26) + t | 0, a += (t ^ (e | ~r)) + n[3] - 0x70f3336e, a = (a << 10 | a >>> 22) + e | 0, r += (e ^ (a | ~t)) + n[10] - 1051523, r = (r << 15 | r >>> 17) + a | 0, t += (a ^ (r | ~e)) + n[1] - 0x7a7ba22f, t = (t << 21 | t >>> 11) + r | 0, e += (r ^ (t | ~a)) + n[8] + 0x6fa87e4f, e = (e << 6 | e >>> 26) + t | 0, a += (t ^ (e | ~r)) + n[15] - 0x1d31920, a = (a << 10 | a >>> 22) + e | 0, r += (e ^ (a | ~t)) + n[6] - 0x5cfebcec, r = (r << 15 | r >>> 17) + a | 0, t += (a ^ (r | ~e)) + n[13] + 0x4e0811a1, t = (t << 21 | t >>> 11) + r | 0, e += (r ^ (t | ~a)) + n[4] - 0x8ac817e, e = (e << 6 | e >>> 26) + t | 0, a += (t ^ (e | ~r)) + n[11] - 0x42c50dcb, a = (a << 10 | a >>> 22) + e | 0, r += (e ^ (a | ~t)) + n[2] + 0x2ad7d2bb, r = (r << 15 | r >>> 17) + a | 0, t += (a ^ (r | ~e)) + n[9] - 0x14792c6f, t = (t << 21 | t >>> 11) + r | 0, this.first ? (this.h0 = e + 0x67452301 | 0, this.h1 = t - 0x10325477 | 0, this.h2 = r - 0x67452302 | 0, this.h3 = a + 0x10325476 | 0, this.first = !1) : (this.h0 = this.h0 + e | 0, this.h1 = this.h1 + t | 0, this.h2 = this.h2 + r | 0, this.h3 = this.h3 + a | 0)
        }, C.prototype.hex = function() {
            this.finalize();
            var e = this.h0,
                t = this.h1,
                r = this.h2,
                a = this.h3;
            return h[e >>> 4 & 15] + h[15 & e] + h[e >>> 12 & 15] + h[e >>> 8 & 15] + h[e >>> 20 & 15] + h[e >>> 16 & 15] + h[e >>> 28 & 15] + h[e >>> 24 & 15] + h[t >>> 4 & 15] + h[15 & t] + h[t >>> 12 & 15] + h[t >>> 8 & 15] + h[t >>> 20 & 15] + h[t >>> 16 & 15] + h[t >>> 28 & 15] + h[t >>> 24 & 15] + h[r >>> 4 & 15] + h[15 & r] + h[r >>> 12 & 15] + h[r >>> 8 & 15] + h[r >>> 20 & 15] + h[r >>> 16 & 15] + h[r >>> 28 & 15] + h[r >>> 24 & 15] + h[a >>> 4 & 15] + h[15 & a] + h[a >>> 12 & 15] + h[a >>> 8 & 15] + h[a >>> 20 & 15] + h[a >>> 16 & 15] + h[a >>> 28 & 15] + h[a >>> 24 & 15]
        }, C.prototype.toString = C.prototype.hex, C.prototype.digest = function() {
            this.finalize();
            var e = this.h0,
                t = this.h1,
                r = this.h2,
                a = this.h3;
            return [255 & e, e >>> 8 & 255, e >>> 16 & 255, e >>> 24 & 255, 255 & t, t >>> 8 & 255, t >>> 16 & 255, t >>> 24 & 255, 255 & r, r >>> 8 & 255, r >>> 16 & 255, r >>> 24 & 255, 255 & a, a >>> 8 & 255, a >>> 16 & 255, a >>> 24 & 255]
        }, C.prototype.array = C.prototype.digest, C.prototype.arrayBuffer = function() {
            this.finalize();
            var e = new ArrayBuffer(16),
                t = new Uint32Array(e);
            return t[0] = this.h0, t[1] = this.h1, t[2] = this.h2, t[3] = this.h3, e
        }, C.prototype.buffer = C.prototype.arrayBuffer, C.prototype.base64 = function() {
            for (var e, t, r, a = "", i = this.array(), o = 0; o < 15;) e = i[o++], t = i[o++], r = i[o++], a += v[e >>> 2] + v[(e << 4 | t >>> 4) & 63] + v[(t << 2 | r >>> 6) & 63] + v[63 & r];
            return a + (v[(e = i[o]) >>> 2] + v[e << 4 & 63] + "==")
        }, x.prototype = new C, x.prototype.finalize = function() {
            if (C.prototype.finalize.call(this), this.inner) {
                this.inner = !1;
                var e = this.array();
                C.call(this, this.sharedMemory), this.update(this.oKeyPad), this.update(e), C.prototype.finalize.call(this)
            }
        };
        var _ = function() {
            var e = T("hex");
            s && (e = b(e)), e.create = function() {
                return new C
            }, e.update = function(t) {
                return e.create().update(t)
            };
            for (var t = 0; t < m.length; ++t) {
                var r = m[t];
                e[r] = T(r)
            }
            return e
        }();
        if (_.md5 = _, _.md5.hmac = function() {
                var e = S("hex");
                e.create = function(e) {
                    return new x(e)
                }, e.update = function(t, r) {
                    return e.create(t).update(r)
                };
                for (var t = 0; t < m.length; ++t) {
                    var r = m[t];
                    e[r] = S(r)
                }
                return e
            }(), u) t.exports = _;
        else o.md5 = _, c && (e.r, void 0 !== _ && e.v(_))
    }()
}, 968284, 129882, e => {
    "use strict";
    var t, r, a = e.i(805290),
        i = e.i(11682),
        o = e.i(317143),
        n = ((t = {}).MD5_CALCULATION = "MD5_CALCULATION", t.MULTIPART_START = "MULTIPART_START", t.CHUNK_UPLOAD = "CHUNK_UPLOAD", t.CHUNK_COMPLETE = "CHUNK_COMPLETE", t.MULTIPART_COMPLETE = "MULTIPART_COMPLETE", t.CHUNK_UPLOAD_ABORT = "CHUNK_UPLOAD_ABORT", t.CHUNK_COMPLETE_ABORT = "CHUNK_COMPLETE_ABORT", t);
    class s extends Error {
        constructor(e, t, r, i, o, n, s) {
            super(e), (0, a._)(this, "stage", void 0), (0, a._)(this, "operationId", void 0), (0, a._)(this, "chunkIndex", void 0), (0, a._)(this, "httpStatus", void 0), (0, a._)(this, "errorCode", void 0), (0, a._)(this, "retryAttempt", void 0), this.name = "MultipartUploadError", this.stage = t, this.operationId = r, this.chunkIndex = i, this.httpStatus = o, this.errorCode = n, this.retryAttempt = s
        }
    }
    e.s(["C", 0, s, "S", () => n], 129882);
    var l = e.i(650502),
        u = e.i(272593),
        c = ((r = {}).ASSET_TYPE = "assetType", r.DESCRIPTION = "description", r.DISPLAY_NAME = "displayName", r.ICON = "icon", r.MODERATION_RESULT = "moderationResult", r.PREVIEWS = "previews", r.REVISION_ID = "revisionId", r.FACEBOOK_SOCIAL_LINK = "facebookSocialLink", r.TWITTER_SOCIAL_LINK = "twitterSocialLink", r.YOUTUBE_SOCIAL_LINK = "youtubeSocialLink", r.TWITCH_SOCIAL_LINK = "twitchSocialLink", r.DISCORD_SOCIAL_LINK = "discordSocialLink", r.GITHUB_SOCIAL_LINK = "githubSocialLink", r.ROBLOX_SOCIAL_LINK = "robloxSocialLink", r.DEVFORUM_SOCIAL_LINK = "devForumSocialLink", r.TRY_ASSET_SOCIAL_LINK = "tryAssetSocialLink", r);
    let d = ["revisionId"],
        h = (0, l.l)("assets/user-auth"),
        p = "x-csrf-token",
        f = JSON.stringify({
            AssetPrivacy: "OpenUse"
        }),
        m = {
            ".bmp": "image/bmp",
            ".flac": "audio/flac",
            ".jpeg": "image/jpeg",
            ".jpg": "image/jpeg",
            ".mov": "video/quicktime",
            ".mp3": "audio/mpeg",
            ".mp4": "video/mp4",
            ".ogg": "audio/ogg",
            ".png": "image/png",
            ".tga": "image/x-tga",
            ".wav": "audio/wav"
        };
    async function v(e, t) {
        null == t || t.throwIfAborted(), await new Promise((r, a) => {
            let i = setTimeout(() => {
                    null == t || t.removeEventListener("abort", o), r()
                }, e),
                o = () => {
                    clearTimeout(i), a(null == t ? void 0 : t.reason)
                };
            null == t || t.addEventListener("abort", o, {
                once: !0
            })
        })
    }
    async function y(e, t, r, a) {
        let i = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : 0;
        null == a || a.throwIfAborted();
        try {
            return await e()
        } catch (n) {
            if (null == a ? void 0 : a.aborted) throw n;
            let o = n instanceof Error ? n : Error(String(n));
            if (i < t) {
                let o = r(i);
                return await v(o, a), y(e, t, r, a, i + 1)
            }
            throw o
        }
    }
    let A = async e => {
        try {
            return (await fetch("".concat(h, "/v1/assets"), {
                method: "PATCH",
                credentials: "include",
                signal: e
            })).headers.get(p)
        } catch (t) {
            if (null == e ? void 0 : e.aborted) throw t;
            return null
        }
    }, g = new class e {
        async createAssetAndGetOperationId(t, r) {
            let a = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                i = arguments.length > 3 ? arguments[3] : void 0,
                o = a ? e.generateRequestInitForCreatingOpenUseAsset(t, r) : {};
            o.signal = i;
            let n = await A(i);
            n && (o.headers = {
                [p]: n
            });
            let s = await this.assetsUploadApi.assetsCreateAsset({
                request: t,
                fileContent: r
            }, o);
            return e.parseOperationId(s.path)
        }
        async abortMultipartUpload(e) {
            let t = {},
                r = await A();
            r && (t.headers = {
                [p]: r
            }), await this.multipartUploadApi.assetsMultipartUploadAbort({
                operationId: e
            }, t)
        }
        async abortMultipartUploadAfterFailure(e, t, r) {
            null != r && r.aborted || await this.multipartUploadApi.assetsMultipartUploadAbort({
                operationId: e
            }, {
                ...t,
                signal: void 0
            })
        }
        async createAssetAndGetOperationIdWithMultipart(t, r, a, i, o, l, u, c) {
            var d;
            let h, f, m, v, g = null != a && a ? e.generateRequestInitForCreatingOpenUseAsset(t, r) : {};
            g.signal = o;
            let w = await A(o);
            w && (g.headers = {
                [p]: w,
                "Content-Type": "application/json; charset=utf-8"
            }), i && i(1);
            try {
                let t = await e.calculateMD5(r, o);
                h = t.hash, f = t.data
            } catch (e) {
                throw new s("Failed to calculate MD5 for file: ".concat(e instanceof Error ? e.message : String(e)), n.MD5_CALCULATION, void 0, void 0, void 0, "MD5_CALCULATION_FAILED")
            }
            i && i(5);
            let I = e.makeUploadPlan(r.size);
            i && i(10);
            let T = {
                    asset: t,
                    file: {
                        filesize: r.size,
                        md5CheckSum: h,
                        chunkPlan: I,
                        contentType: e.getMultipartContentType(r)
                    }
                },
                b = [];
            try {
                m = await this.multipartUploadApi.assetsCreateAssetWithMultipartUpload({
                    multipartUploadStartRequest: T
                }, g)
            } catch (e) {
                throw new s("Failed to start multipart upload: ".concat(e instanceof Error ? e.message : String(e)), n.MULTIPART_START, void 0, void 0, e instanceof Error && "status" in e ? e.status : void 0, "MULTIPART_START_FAILED")
            }
            if (i && i(15), 0 === (b = null != (d = m.uploadUrls) ? d : []).length) throw new s("Upload URLs are empty from multipart start response", n.MULTIPART_START, void 0, void 0, void 0, "EMPTY_UPLOAD_URLS");
            let S = e.parseOperationId(m.operationPath);
            if ("" === S) throw new s("Operation ID is empty from multipart start response", n.MULTIPART_START, void 0, void 0, void 0, "EMPTY_OPERATION_ID");
            null == l || l(S);
            try {
                v = await e.uploadChunks(b, f, S, i ? e => {
                    i(Math.min(15 + .65 * e, 80))
                } : void 0, o)
            } catch (e) {
                try {
                    await this.abortMultipartUploadAfterFailure(S, g, o), (null == o ? void 0 : o.aborted) || null == c || c(S)
                } catch (t) {
                    throw new s("Chunk upload failed and abort also failed. Original error: ".concat(e instanceof Error ? e.message : String(e), ". Abort error: ").concat(t instanceof Error ? t.message : String(t)), n.CHUNK_UPLOAD_ABORT, S, void 0, void 0, "ABORT_FAILED")
                }
                if (e instanceof s) throw e;
                throw new s("Chunk upload failed: ".concat(e instanceof Error ? e.message : String(e)), n.CHUNK_UPLOAD, S, void 0, void 0, "CHUNK_UPLOAD_FAILED")
            }
            i && i(80);
            try {
                await Promise.all(v.map((e, t) => {
                    let r = t + 1;
                    return y(async () => {
                        try {
                            await this.multipartUploadApi.assetsMultipartUploadChunkComplete({
                                operationId: S,
                                multipartUploadChunkCompleteRequest: {
                                    chunkNum: r,
                                    eTag: e
                                }
                            }, g)
                        } catch (e) {
                            throw new s("Failed to complete chunk ".concat(r, ": ").concat(e instanceof Error ? e.message : String(e)), n.CHUNK_COMPLETE, S, r, e instanceof Error && "status" in e ? e.status : void 0, "CHUNK_COMPLETE_FAILED")
                        }
                    }, 3, e => 1e3 * 2 ** e, o)
                }))
            } catch (e) {
                try {
                    await this.abortMultipartUploadAfterFailure(S, g, o), (null == o ? void 0 : o.aborted) || null == c || c(S)
                } catch (t) {
                    throw new s("Chunk complete failed and abort also failed. Original error: ".concat(e instanceof Error ? e.message : String(e), ". Abort error: ").concat(t instanceof Error ? t.message : String(t)), n.CHUNK_COMPLETE_ABORT, S, void 0, void 0, "ABORT_FAILED")
                }
                if (e instanceof s) throw e;
                throw new s("Chunk complete failed: ".concat(e instanceof Error ? e.message : String(e)), n.CHUNK_COMPLETE, S, void 0, void 0, "CHUNK_COMPLETE_FAILED")
            }
            i && i(90), null == u || u();
            try {
                await this.multipartUploadApi.assetsMultipartUploadComplete({
                    operationId: S
                }, g)
            } catch (e) {
                throw new s("Failed to complete multipart upload: ".concat(e instanceof Error ? e.message : String(e)), n.MULTIPART_COMPLETE, S, void 0, e instanceof Error && "status" in e ? e.status : void 0, "MULTIPART_COMPLETE_FAILED")
            }
            return i && i(100), S
        }
        async updateAssetAndGetOperationId(t, r, a, i) {
            let o = await this.assetsUploadApi.assetsUpdateAsset({
                assetId: t,
                updateMask: r,
                request: a,
                fileContent: i
            });
            return e.parseOperationId(o.path)
        }
        async getAsset(e, t) {
            return await this.assetsUploadApi.assetsGetAsset({
                assetId: e,
                readMask: t
            })
        }
        async getAssetVersion(e, t) {
            return this.assetVersionApi.assetsGetAssetVersion({
                assetId: e,
                revisionId: t
            })
        }
        async getAssetPublishState(e) {
            let t = Number((await this.getAsset(e, d)).revisionId);
            if (!Number.isSafeInteger(t) || t <= 0) throw Error("Could not resolve latest version number for asset ".concat(e));
            let r = await this.getAssetVersion(e, t);
            return {
                latestVersionNumber: t,
                latestVersionState: !0 === r.published ? o.x.Published : o.x.Draft
            }
        }
        async publishAssetVersionAndGetOperationId(t, r, a) {
            let i = {
                    signal: a
                },
                n = await A(a);
            i.headers = {
                "Content-Type": "application/json",
                ...n ? {
                    [p]: n
                } : {}
            };
            let s = await this.assetsUploadApi.assetsChangeAssetVersionState({
                assetId: t,
                versionNumber: r,
                changeAssetVersionStateRequest: {
                    intendedVersionState: o.n.Published
                }
            }, i);
            return e.parseOperationId(s.path)
        }
        async getOperationStatus(e) {
            return await this.uploadStatusApi.assetsGetOperation({
                operationId: e
            })
        }
        async getOperationStatusRaw(e) {
            let t = await this.uploadStatusApi.assetsGetOperationRaw({
                    operationId: e
                }),
                r = await t.raw.json();
            return null !== r && "object" == typeof r ? r : {}
        }
        async getOperationStatusWithMetadata(e) {
            let t = await this.getOperationStatusRaw(e);
            return {
                operation: t,
                metadata: t.metadata
            }
        }
        static parseOperationId(e) {
            if (!e) throw Error("Operation path is missing or empty");
            let t = e.split("/");
            return t[t.length - 1]
        }
        static generateRequestInitForCreatingOpenUseAsset(e, t) {
            let r = new FormData;
            return r.append("request", JSON.stringify(e)), r.append("fileContent", t), r.append("additionalParameters", f), {
                body: r
            }
        }
        static async calculateMD5(e, t) {
            null == t || t.throwIfAborted();
            let r = await new Promise((r, a) => {
                let i = new FileReader,
                    o = () => null == t ? void 0 : t.removeEventListener("abort", n),
                    n = () => {
                        i.abort(), a(null == t ? void 0 : t.reason)
                    };
                null == t || t.addEventListener("abort", n, {
                    once: !0
                }), i.onload = e => {
                    var t;
                    o();
                    let i = null == e || null == (t = e.target) ? void 0 : t.result;
                    i instanceof ArrayBuffer ? r(new Uint8Array(i)) : a(Error("Failed to read file"))
                }, i.onerror = () => {
                    o(), a(i.error)
                }, i.readAsArrayBuffer(e)
            });
            return {
                hash: (0, i.md5)(r),
                data: r
            }
        }
        static getMultipartContentType(e) {
            var t;
            let r = e.type.trim();
            if ("" !== r) return r;
            let a = e.name.lastIndexOf(".");
            return null != (t = m[a < 0 ? "" : e.name.slice(a).toLowerCase()]) ? t : "application/octet-stream"
        }
        static makeUploadPlan(e) {
            let t = [],
                r = 0;
            for (; r < e;) {
                let a = Math.min(5242880, e - r);
                t.push(a), r += 5242880
            }
            return t
        }
        static async uploadChunks(e, t, r, a, i) {
            let o = e.length,
                l = 0,
                u = a ? () => {
                    a(Math.min((l += 1) / o * 100, 99))
                } : void 0,
                c = Array.from({
                    length: o
                }, () => ""),
                d = async a => {
                    let o = e[a],
                        l = Number((null == o ? void 0 : o.contentStart) || 0),
                        d = Number((null == o ? void 0 : o.contentLength) || 0);
                    c[a] = await y(async () => {
                        if (null == i || i.throwIfAborted(), !(null == o ? void 0 : o.url)) throw new s("No URL found for chunk ".concat(a + 1), n.CHUNK_UPLOAD, r, a + 1, void 0, "MISSING_UPLOAD_URL");
                        let e = t.slice(l, l + d);
                        if (e.length !== d) throw new s("Chunk size mismatch for chunk ".concat(a + 1, ": expected ").concat(d, ", got ").concat(e.length), n.CHUNK_UPLOAD, r, a + 1, void 0, "CHUNK_SIZE_MISMATCH");
                        let c = await fetch(o.url, {
                            method: "PUT",
                            body: e,
                            signal: i
                        });
                        if (!c.ok) throw new s("Failed to upload chunk ".concat(a + 1, ": ").concat(c.status, " ").concat(c.statusText), n.CHUNK_UPLOAD, r, a + 1, c.status, "CHUNK_UPLOAD_HTTP_ERROR");
                        let h = c.headers.get("ETag");
                        if (!h) throw new s("No ETag received for chunk ".concat(a + 1), n.CHUNK_UPLOAD, r, a + 1, c.status, "MISSING_ETAG");
                        return u && u(), h.replaceAll(/['"]/g, "")
                    }, 3, e => 1e3 * 2 ** e, i)
                }, h = 0, p = async () => {
                    for (; h < o;) {
                        null == i || i.throwIfAborted();
                        let e = h;
                        h += 1, await d(e)
                    }
                }, f = Math.min(3, o);
            return await Promise.all(Array.from({
                length: f
            }, p)), a && a(100), c
        }
        constructor() {
            (0, a._)(this, "assetsUploadApi", void 0), (0, a._)(this, "assetVersionApi", void 0), (0, a._)(this, "uploadStatusApi", void 0), (0, a._)(this, "multipartUploadApi", void 0);
            let e = (0, u.f)("assets/user-auth", "bedev2");
            this.assetsUploadApi = new o.k(e), this.assetVersionApi = new o.l(e), this.uploadStatusApi = new o.y(e), this.multipartUploadApi = new o.a(e)
        }
    };
    e.s(["b", () => c, "U", 0, g], 968284)
}, 970494, 792429, 524883, e => {
    "use strict";
    var t = e.i(415858),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
            })(e, t)
        };

    function a(e, t, r, a) {
        return new(r || (r = Promise))(function(i, o) {
            function n(e) {
                try {
                    l(a.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                try {
                    l(a.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function l(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(n, s)
            }
            l((a = a.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var r, a, i, o = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            n = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return n.next = s(0), n.throw = s(1), n.return = s(2), "function" == typeof Symbol && (n[Symbol.iterator] = function() {
            return this
        }), n;

        function s(s) {
            return function(l) {
                var u = [s, l];
                if (r) throw TypeError("Generator is already executing.");
                for (; n && (n = 0, u[0] && (o = 0)), o;) try {
                    if (r = 1, a && (i = 2 & u[0] ? a.return : u[0] ? a.throw || ((i = a.return) && i.call(a), 0) : a.next) && !(i = i.call(a, u[1])).done) return i;
                    switch (a = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                        case 0:
                        case 1:
                            i = u;
                            break;
                        case 4:
                            return o.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            o.label++, a = u[1], u = [0];
                            continue;
                        case 7:
                            u = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                o.label = u[1];
                                break
                            }
                            if (6 === u[0] && o.label < i[1]) {
                                o.label = i[1], i = u;
                                break
                            }
                            if (i && o.label < i[2]) {
                                o.label = i[2], o.ops.push(u);
                                break
                            }
                            i[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    u = t.call(e, o)
                } catch (e) {
                    u = [6, e], a = 0
                } finally {
                    r = i = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var o = {
        Invalid: "Invalid",
        Image: "Image",
        Tshirt: "Tshirt",
        Audio: "Audio",
        Mesh: "Mesh",
        Lua: "Lua",
        Html: "Html",
        Text: "Text",
        Hat: "Hat",
        Place: "Place",
        Model: "Model",
        Shirt: "Shirt",
        Pants: "Pants",
        Decal: "Decal",
        Avatar: "Avatar",
        Head: "Head",
        Face: "Face",
        Gear: "Gear",
        Badge: "Badge",
        GroupEmblem: "GroupEmblem",
        Animation: "Animation",
        Arms: "Arms",
        Legs: "Legs",
        Torso: "Torso",
        RightArm: "RightArm",
        LeftArm: "LeftArm",
        LeftLeg: "LeftLeg",
        RightLeg: "RightLeg",
        Package: "Package",
        YoutubeVideo: "YoutubeVideo",
        GamePass: "GamePass",
        App: "App",
        Code: "Code",
        Plugin: "Plugin",
        SolidModel: "SolidModel",
        MeshPart: "MeshPart",
        HairAccessory: "HairAccessory",
        FaceAccessory: "FaceAccessory",
        NeckAccessory: "NeckAccessory",
        ShoulderAccessory: "ShoulderAccessory",
        FrontAccessory: "FrontAccessory",
        BackAccessory: "BackAccessory",
        WaistAccessory: "WaistAccessory",
        ClimbAnimation: "ClimbAnimation",
        DeathAnimation: "DeathAnimation",
        FallAnimation: "FallAnimation",
        IdleAnimation: "IdleAnimation",
        JumpAnimation: "JumpAnimation",
        RunAnimation: "RunAnimation",
        SwimAnimation: "SwimAnimation",
        WalkAnimation: "WalkAnimation",
        PoseAnimation: "PoseAnimation",
        LocalizationTableManifest: "LocalizationTableManifest",
        LocalizationTableTranslation: "LocalizationTableTranslation",
        EmoteAnimation: "EmoteAnimation",
        Video: "Video",
        TexturePack: "TexturePack",
        TshirtAccessory: "TshirtAccessory",
        ShirtAccessory: "ShirtAccessory",
        PantsAccessory: "PantsAccessory",
        JacketAccessory: "JacketAccessory",
        SweaterAccessory: "SweaterAccessory",
        ShortsAccessory: "ShortsAccessory",
        LeftShoeAccessory: "LeftShoeAccessory",
        RightShoeAccessory: "RightShoeAccessory",
        DressSkirtAccessory: "DressSkirtAccessory",
        FontFamily: "FontFamily",
        FontFace: "FontFace",
        MeshHiddenSurfaceRemoval: "MeshHiddenSurfaceRemoval",
        EyebrowAccessory: "EyebrowAccessory",
        EyelashAccessory: "EyelashAccessory",
        MoodAnimation: "MoodAnimation",
        DynamicHead: "DynamicHead",
        CodeSnippet: "CodeSnippet",
        AdsVideo: "AdsVideo",
        OtaUpdate: "OtaUpdate",
        Screenshot: "Screenshot",
        RuntimePropertySet: "RuntimePropertySet",
        StorePreviewVideo: "StorePreviewVideo",
        GamePreviewVideo: "GamePreviewVideo",
        CreatorExperienceConfig: "CreatorExperienceConfig",
        FaceMakeup: "FaceMakeup",
        LipMakeup: "LipMakeup",
        EyeMakeup: "EyeMakeup",
        VoxelFragment: "VoxelFragment",
        AvatarBackground: "AvatarBackground",
        TextDocument: "TextDocument",
        Post: "Post",
        AnimatedImage: "AnimatedImage",
        ComputeFunction: "ComputeFunction"
    };

    function n(e) {
        var r;
        return null == (r = e) ? r : {
            createdDetails: (0, t.u)(r, "createdDetails") ? r.createdDetails : void 0,
            purchasedDetails: (0, t.u)(r, "purchasedDetails") ? r.purchasedDetails : void 0,
            sharedDetails: (0, t.u)(r, "sharedDetails") ? r.sharedDetails : void 0
        }
    }

    function s(e) {
        var r, a, i, o, s, l, u, c;
        return null == (r = e) ? r : {
            path: (0, t.u)(r, "path") ? r.path : void 0,
            assetItem: (0, t.u)(r, "assetItem") ? null == (a = r.assetItem) ? a : {
                asset: (0, t.u)(a, "asset") ? null == (i = a.asset) ? i : {
                    createTime: (0, t.u)(i, "createTime") ? new Date(i.createTime) : void 0,
                    updateTime: (0, t.u)(i, "updateTime") ? new Date(i.updateTime) : void 0,
                    revisionId: (0, t.u)(i, "revisionId") ? i.revisionId : void 0,
                    assetId: (0, t.u)(i, "assetId") ? i.assetId : void 0,
                    displayName: (0, t.u)(i, "displayName") ? i.displayName : void 0,
                    description: (0, t.u)(i, "description") ? i.description : void 0,
                    assetType: (0, t.u)(i, "assetType") ? i.assetType : void 0,
                    creationContext: (0, t.u)(i, "creationContext") ? null == (o = i.creationContext) ? o : {
                        creator: (0, t.u)(o, "creator") ? null == (s = o.creator) ? s : {
                            userId: (0, t.u)(s, "userId") ? s.userId : void 0,
                            groupId: (0, t.u)(s, "groupId") ? s.groupId : void 0,
                            universeId: (0, t.u)(s, "universeId") ? s.universeId : void 0,
                            name: (0, t.u)(s, "name") ? s.name : void 0
                        } : void 0
                    } : void 0,
                    moderationResult: (0, t.u)(i, "moderationResult") ? null == (l = i.moderationResult) ? l : {
                        moderationState: (0, t.u)(l, "moderationState") ? l.moderationState : void 0
                    } : void 0,
                    versionStatus: (0, t.u)(i, "versionStatus") ? i.versionStatus : void 0,
                    state: (0, t.u)(i, "state") ? i.state : void 0,
                    assetSubType: (0, t.u)(i, "assetSubType") ? i.assetSubType : void 0
                } : void 0,
                sources: (0, t.u)(a, "sources") ? a.sources.map(n) : void 0,
                isPackage: (0, t.u)(a, "isPackage") ? a.isPackage : void 0
            } : void 0,
            folderItem: (0, t.u)(r, "folderItem") ? null == (u = r.folderItem) ? u : {
                folder: (0, t.u)(u, "folder") ? null == (c = u.folder) ? c : {
                    folderId: (0, t.u)(c, "folderId") ? c.folderId : void 0,
                    parentFolderId: (0, t.u)(c, "parentFolderId") ? c.parentFolderId : void 0,
                    displayName: (0, t.u)(c, "displayName") ? c.displayName : void 0,
                    createTime: (0, t.u)(c, "createTime") ? new Date(c.createTime) : void 0,
                    updateTime: (0, t.u)(c, "updateTime") ? new Date(c.updateTime) : void 0
                } : void 0
            } : void 0
        }
    }
    var l = {
            Invalid: "Invalid",
            Created: "Created",
            Purchased: "Purchased",
            Shared: "Shared"
        },
        u = ["assetTypes", "userIds", "groupIds", "universeIds", "includeFolders", "sources"],
        c = function(e) {
            return Object.fromEntries(Object.entries(e).map(function(e) {
                var t = e[0];
                return [e[1], t]
            }))
        },
        d = {
            assetTypes: c(o),
            sources: c(l)
        };

    function h(e, t) {
        var r, a = String(e);
        return t && null != (r = t[a]) ? r : a
    }
    var p = function(e) {
        function o() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function a() {
                this.constructor = e
            }
            r(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
        }(o, e), o.prototype.creatorInventorySearchCreatorInventoryItemsRaw = function(e, r) {
            return a(this, void 0, void 0, function() {
                var a, o, n;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.query || void 0 === e.query) throw new t.w("query", "Required parameter requestParameters.query was null or undefined when calling creatorInventorySearchCreatorInventoryItems.");
                            if (null === e.filter || void 0 === e.filter) throw new t.w("filter", "Required parameter requestParameters.filter was null or undefined when calling creatorInventorySearchCreatorInventoryItems.");
                            return a = {}, void 0 !== e.query && (a.query = e.query), void 0 !== e.filter && (a.filter = function(e) {
                                for (var t = [], r = 0; r < u.length; r++) ! function(r) {
                                    var a = e[r];
                                    if (null != a) {
                                        var i = d[r];
                                        if (Array.isArray(a)) {
                                            if (0 === a.length) return;
                                            t.push("".concat(r, "=").concat(a.map(function(e) {
                                                return h(e, i)
                                            }).join(",")))
                                        } else t.push("".concat(r, "=").concat(h(a, i)))
                                    }
                                }(u[r]);
                                return t.join(";")
                            }(e.filter)), void 0 !== e.maxPageSize && (a.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), o = {}, [4, this.request({
                                path: "/v1/-/creator-inventory-items:search",
                                schemaPath: "/v1/-/creator-inventory-items:search",
                                method: "GET",
                                headers: o,
                                query: a
                            }, r)];
                        case 1:
                            return n = i.sent(), [2, new t.H(n, function(e) {
                                return null == e ? e : {
                                    items: (0, t.u)(e, "items") ? e.items.map(s) : void 0,
                                    nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0,
                                    inventoryStatus: (0, t.u)(e, "inventoryStatus") ? e.inventoryStatus : void 0
                                }
                            })]
                    }
                })
            })
        }, o.prototype.creatorInventorySearchCreatorInventoryItems = function(e, t) {
            return a(this, void 0, void 0, function() {
                return i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.creatorInventorySearchCreatorInventoryItemsRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, o
    }(t._);
    e.s(["s", 0, o, "a", 0, p, "S", 0, l, "A", 0, {
        Invalid: "Invalid",
        Active: "Active",
        Archived: "Archived"
    }], 792429), e.s(["f", 0, l], 524883);
    let f = ["development-items-inventory"],
        m = ["development-item-metadata-overrides"],
        v = ["development-item-upload-overrides"],
        y = e => null != e ? e : "",
        A = e => {
            var t;
            return null != (t = null == e ? void 0 : e.trim()) ? t : ""
        },
        g = (e, t) => {
            e.setQueryData(m, e => {
                if ((null == e ? void 0 : e.has(t)) !== !0) return e;
                let r = new Map(e);
                return r.delete(t), r
            })
        },
        w = (e, t) => {
            var r;
            let a = null == (r = e.getQueryData(m)) ? void 0 : r.get(t);
            return null != a && a.expiresAt <= Date.now() ? void g(e, t) : a
        },
        I = (e, t) => {
            e.setQueryData(v, e => {
                if ((null == e ? void 0 : e.has(t)) !== !0) return e;
                let r = new Map(e);
                return r.delete(t), r
            })
        },
        T = e => e[0] === f[0],
        b = e => null == e || "updateTime desc" === e,
        S = e => b(e[9]),
        C = (e, t, r) => {
            e.setQueryData(m, e => {
                let a = null == e ? void 0 : e.get(t);
                if (null == a) return e;
                let i = {
                        ...a,
                        developConfirmed: "develop" === r || a.developConfirmed,
                        inventoryConfirmed: "inventory" === r || a.inventoryConfirmed
                    },
                    o = new Map(e);
                return i.developConfirmed && i.inventoryConfirmed ? o.delete(t) : o.set(t, i), o
            })
        },
        x = (e, t) => A(null == t ? void 0 : t.name) === A(e.name) && y(null == t ? void 0 : t.description) === y(e.description);
    e.s(["E", 0, f, "J", 0, (e, t) => {
        let {
            assetId: r,
            state: a
        } = t;
        e.setQueriesData({
            queryKey: f
        }, e => null == e ? e : {
            ...e,
            items: e.items.map(e => e.assetId === r ? {
                ...e,
                state: a
            } : e)
        }), e.invalidateQueries({
            queryKey: f,
            refetchType: "none"
        })
    }, "x", 0, (e, t) => {
        let {
            assetId: r,
            description: a,
            name: i
        } = t, o = new Date, n = {
            assetId: r,
            description: y(a),
            developConfirmed: !1,
            expiresAt: o.getTime() + 3e4,
            inventoryConfirmed: !1,
            name: i,
            updated: o
        };
        e.setQueryData(m, e => {
            let t = new Map(e);
            return t.set(r, n), t
        });
        let s = e => t => {
            let a = null == t ? void 0 : t.items.find(e => e.assetId === r);
            if (null == t || null == a) return t;
            let n = {
                ...a,
                name: i,
                updated: o
            };
            return {
                ...t,
                items: e ? [n, ...t.items.filter(e => e.assetId !== r)] : t.items.map(e => e.assetId === r ? n : e)
            }
        };
        e.setQueriesData({
            predicate: e => {
                let {
                    queryKey: t
                } = e;
                return T(t) && S(t)
            }
        }, s(!0)), e.setQueriesData({
            predicate: e => {
                let {
                    queryKey: t
                } = e;
                return T(t) && !S(t)
            }
        }, s(!1)), e.invalidateQueries({
            queryKey: f,
            refetchType: "active"
        }), window.setTimeout(() => {
            let t = w(e, r);
            (null == t ? void 0 : t.expiresAt) === n.expiresAt && (g(e, r), e.invalidateQueries({
                queryKey: f,
                refetchType: "active"
            }))
        }, 3e4)
    }, "S", 0, (e, t) => {
        let {
            assetId: r,
            assetType: a,
            name: i,
            scope: o
        } = t, n = new Date, s = {
            expiresAt: n.getTime() + 3e5,
            item: {
                assetId: r,
                assetType: a,
                created: n,
                id: r.toString(),
                isPackage: !1,
                name: i,
                sources: [l.Created],
                state: "Active",
                updated: n
            },
            scope: o
        };
        e.setQueryData(v, e => {
            let t = new Map(e);
            return t.set(r, s), t
        }), e.setQueriesData({
            predicate: e => {
                let {
                    queryKey: t
                } = e;
                return ((e, t) => {
                    let [, r, a, i, o, n, , s, u, c] = t;
                    return T(t) && r === e.scope.type && a === e.scope.id && Array.isArray(i) && (0 === i.length || i.includes(e.item.assetType)) && (o === l.Created || "All" === o) && "string" == typeof n && null == s && !0 !== u && (null == c || "string" == typeof c && c.endsWith(" desc")) && e.item.name.toLocaleLowerCase().includes(n.trim().toLocaleLowerCase())
                })(s, t)
            }
        }, e => null == e || e.items.some(e => e.assetId === r) ? e : {
            ...e,
            items: [s.item, ...e.items]
        }), e.invalidateQueries({
            queryKey: f,
            refetchType: "none"
        }), window.setTimeout(() => {
            var t;
            let a = null == (t = e.getQueryData(v)) ? void 0 : t.get(r);
            (null == a ? void 0 : a.expiresAt) === s.expiresAt && (I(e, r), e.invalidateQueries({
                queryKey: f,
                refetchType: "active"
            }))
        }, 3e5)
    }, "W", 0, b, "e", 0, (e, t, r) => {
        let a = w(e, t);
        return null == a ? {
            details: r
        } : x(a, r) ? (C(e, t, "develop"), {
            details: r
        }) : {
            details: {
                ...r,
                description: a.description,
                name: a.name
            },
            expiresAt: a.expiresAt
        }
    }, "M", 0, function(e, t, r) {
        let {
            keepServerOrder: a = !1
        } = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {}, i = [], o = [];
        return t.forEach(t => {
            let n = w(e, t.assetId);
            if (null == n) return void o.push(t);
            if (x(n, r.get(t.assetId))) {
                C(e, t.assetId, "inventory"), o.push(t);
                return
            }
            let s = {
                ...t,
                name: n.name,
                updated: n.updated
            };
            (a ? o : i).push(s)
        }), i.sort((e, t) => {
            var r, a, i, o;
            return (null != (r = null == (i = t.updated) ? void 0 : i.getTime()) ? r : 0) - (null != (a = null == (o = e.updated) ? void 0 : o.getTime()) ? a : 0)
        }), [...i, ...o]
    }, "A", 0, (e, t, r) => {
        let {
            assetTypes: a,
            pageToken: i,
            query: o,
            scope: n,
            source: s
        } = r, u = e.getQueryData(v);
        if (null == u || 0 === u.size) return [...t];
        let c = new Set(t.map(e => e.assetId)),
            d = [];
        return u.forEach((t, r) => {
            if (t.expiresAt <= Date.now()) return void I(e, r);
            if (((e, t) => {
                    let {
                        assetTypes: r,
                        pageToken: a,
                        query: i,
                        scope: o,
                        source: n
                    } = t;
                    return null == a && (null == o ? void 0 : o.type) === e.scope.type && o.id === e.scope.id && (0 === r.length || r.includes(e.item.assetType)) && (n === l.Created || "All" === n) && e.item.name.toLocaleLowerCase().includes(i.trim().toLocaleLowerCase())
                })(t, {
                    assetTypes: a,
                    pageToken: i,
                    query: o,
                    scope: n,
                    source: s
                })) {
                if (c.has(r)) return void I(e, r);
                d.push(t.item)
            }
        }), d.sort((e, t) => {
            var r, a, i, o;
            return (null != (r = null == (i = t.updated) ? void 0 : i.getTime()) ? r : 0) - (null != (a = null == (o = e.updated) ? void 0 : o.getTime()) ? a : 0)
        }), [...d, ...t]
    }], 970494)
}]);

//# debugId=990b85f7-fe2e-ea00-2080-d55164642098
//# sourceMappingURL=064t12n9y_52i.js.map