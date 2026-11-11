;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f1a79e46-eb47-a01c-77fc-49b3bd2d9d01")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 11682, (e, t, r) => {
    var a = e.i(163021);
    ! function() {
        "use strict";
        var r = "input is invalid type",
            i = "object" == typeof window,
            n = i ? window : {};
        n.JS_MD5_NO_WINDOW && (i = !1);
        var o = !i && "object" == typeof self,
            s = !n.JS_MD5_NO_NODE_JS && "object" == typeof a.default && a.default.versions && a.default.versions.node;
        s ? n = e.g : o && (n = self);
        var l, u = !n.JS_MD5_NO_COMMON_JS && t.exports,
            d = "function" == typeof define && define.amd,
            c = !n.JS_MD5_NO_ARRAY_BUFFER && "u" > typeof ArrayBuffer,
            h = "0123456789abcdef".split(""),
            p = [128, 32768, 8388608, -0x80000000],
            A = [0, 8, 16, 24],
            T = ["hex", "array", "digest", "buffer", "arrayBuffer", "base64"],
            f = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".split(""),
            S = [];
        if (c) {
            var E = new ArrayBuffer(68);
            l = new Uint8Array(E), S = new Uint32Array(E)
        }
        var _ = Array.isArray;
        (n.JS_MD5_NO_NODE_JS || !_) && (_ = function(e) {
            return "[object Array]" === Object.prototype.toString.call(e)
        });
        var v = ArrayBuffer.isView;
        c && (n.JS_MD5_NO_ARRAY_BUFFER_IS_VIEW || !v) && (v = function(e) {
            return "object" == typeof e && e.buffer && e.buffer.constructor === ArrayBuffer
        });
        var y = function(e) {
                var t = typeof e;
                if ("string" === t) return [e, !0];
                if ("object" !== t || null === e) throw Error(r);
                if (c && e.constructor === ArrayBuffer) return [new Uint8Array(e), !1];
                if (!_(e) && !v(e)) throw Error(r);
                return [e, !1]
            },
            m = function(e) {
                return function(t) {
                    return new P(!0).update(t)[e]()
                }
            },
            I = function(e) {
                var t, a = {},
                    i = void 0;
                return t = i.from && !n.JS_MD5_NO_BUFFER_FROM ? i.from : function(e) {
                        return new i(e)
                    },
                    function(n) {
                        if ("string" == typeof n) return a.createHash("md5").update(n, "utf8").digest("hex");
                        if (null == n) throw Error(r);
                        return n.constructor === ArrayBuffer && (n = new Uint8Array(n)), _(n) || v(n) || n.constructor === i ? a.createHash("md5").update(t(n)).digest("hex") : e(n)
                    }
            },
            C = function(e) {
                return function(t, r) {
                    return new O(t, !0).update(r)[e]()
                }
            };

        function P(e) {
            if (e) S[0] = S[16] = S[1] = S[2] = S[3] = S[4] = S[5] = S[6] = S[7] = S[8] = S[9] = S[10] = S[11] = S[12] = S[13] = S[14] = S[15] = 0, this.blocks = S, this.buffer8 = l;
            else if (c) {
                var t = new ArrayBuffer(68);
                this.buffer8 = new Uint8Array(t), this.blocks = new Uint32Array(t)
            } else this.blocks = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            this.h0 = this.h1 = this.h2 = this.h3 = this.start = this.bytes = this.hBytes = 0, this.finalized = this.hashed = !1, this.first = !0
        }

        function O(e, t) {
            var r, a = y(e);
            if (e = a[0], a[1]) {
                var i, n = [],
                    o = e.length,
                    s = 0;
                for (r = 0; r < o; ++r)(i = e.charCodeAt(r)) < 128 ? n[s++] = i : (i < 2048 ? n[s++] = 192 | i >>> 6 : (i < 55296 || i >= 57344 ? n[s++] = 224 | i >>> 12 : (i = 65536 + ((1023 & i) << 10 | 1023 & e.charCodeAt(++r)), n[s++] = 240 | i >>> 18, n[s++] = 128 | i >>> 12 & 63), n[s++] = 128 | i >>> 6 & 63), n[s++] = 128 | 63 & i);
                e = n
            }
            e.length > 64 && (e = new P(!0).update(e).array());
            var l = [],
                u = [];
            for (r = 0; r < 64; ++r) {
                var d = e[r] || 0;
                l[r] = 92 ^ d, u[r] = 54 ^ d
            }
            P.call(this, t), this.update(u), this.oKeyPad = l, this.inner = !0, this.sharedMemory = t
        }
        P.prototype.update = function(e) {
            if (this.finalized) throw Error("finalize already called");
            var t = y(e);
            e = t[0];
            for (var r, a, i = t[1], n = 0, o = e.length, s = this.blocks, l = this.buffer8; n < o;) {
                if (this.hashed && (this.hashed = !1, s[0] = s[16], s[16] = s[1] = s[2] = s[3] = s[4] = s[5] = s[6] = s[7] = s[8] = s[9] = s[10] = s[11] = s[12] = s[13] = s[14] = s[15] = 0), i)
                    if (c)
                        for (a = this.start; n < o && a < 64; ++n)(r = e.charCodeAt(n)) < 128 ? l[a++] = r : (r < 2048 ? l[a++] = 192 | r >>> 6 : (r < 55296 || r >= 57344 ? l[a++] = 224 | r >>> 12 : (r = 65536 + ((1023 & r) << 10 | 1023 & e.charCodeAt(++n)), l[a++] = 240 | r >>> 18, l[a++] = 128 | r >>> 12 & 63), l[a++] = 128 | r >>> 6 & 63), l[a++] = 128 | 63 & r);
                    else
                        for (a = this.start; n < o && a < 64; ++n)(r = e.charCodeAt(n)) < 128 ? s[a >>> 2] |= r << A[3 & a++] : (r < 2048 ? s[a >>> 2] |= (192 | r >>> 6) << A[3 & a++] : (r < 55296 || r >= 57344 ? s[a >>> 2] |= (224 | r >>> 12) << A[3 & a++] : (r = 65536 + ((1023 & r) << 10 | 1023 & e.charCodeAt(++n)), s[a >>> 2] |= (240 | r >>> 18) << A[3 & a++], s[a >>> 2] |= (128 | r >>> 12 & 63) << A[3 & a++]), s[a >>> 2] |= (128 | r >>> 6 & 63) << A[3 & a++]), s[a >>> 2] |= (128 | 63 & r) << A[3 & a++]);
                else if (c)
                    for (a = this.start; n < o && a < 64; ++n) l[a++] = e[n];
                else
                    for (a = this.start; n < o && a < 64; ++n) s[a >>> 2] |= e[n] << A[3 & a++];
                this.lastByteIndex = a, this.bytes += a - this.start, a >= 64 ? (this.start = a - 64, this.hash(), this.hashed = !0) : this.start = a
            }
            return this.bytes > 0xffffffff && (this.hBytes += this.bytes / 0x100000000 | 0, this.bytes = this.bytes % 0x100000000), this
        }, P.prototype.finalize = function() {
            if (!this.finalized) {
                this.finalized = !0;
                var e = this.blocks,
                    t = this.lastByteIndex;
                e[t >>> 2] |= p[3 & t], t >= 56 && (this.hashed || this.hash(), e[0] = e[16], e[16] = e[1] = e[2] = e[3] = e[4] = e[5] = e[6] = e[7] = e[8] = e[9] = e[10] = e[11] = e[12] = e[13] = e[14] = e[15] = 0), e[14] = this.bytes << 3, e[15] = this.hBytes << 3 | this.bytes >>> 29, this.hash()
            }
        }, P.prototype.hash = function() {
            var e, t, r, a, i, n, o = this.blocks;
            this.first ? (r = ((r = (-0x10325477 ^ (a = ((a = (-0x67452302 ^ 0x77777777 & (e = ((e = o[0] - 0x28955b89) << 7 | e >>> 25) - 0x10325477 | 0)) + o[1] - 0x705f434) << 12 | a >>> 20) + e | 0) & (-0x10325477 ^ e)) + o[2] - 0x4324b227) << 17 | r >>> 15) + a | 0, t = ((t = (e ^ r & (a ^ e)) + o[3] - 0x4e748589) << 22 | t >>> 10) + r | 0) : (e = this.h0, t = this.h1, r = this.h2, e += ((a = this.h3) ^ t & (r ^ a)) + o[0] - 0x28955b88, a += (r ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ r)) + o[1] - 0x173848aa, r += (t ^ (a = (a << 12 | a >>> 20) + e | 0) & (e ^ t)) + o[2] + 0x242070db, t += (e ^ (r = (r << 17 | r >>> 15) + a | 0) & (a ^ e)) + o[3] - 0x3e423112, t = (t << 22 | t >>> 10) + r | 0), e += (a ^ t & (r ^ a)) + o[4] - 0xa83f051, a += (r ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ r)) + o[5] + 0x4787c62a, r += (t ^ (a = (a << 12 | a >>> 20) + e | 0) & (e ^ t)) + o[6] - 0x57cfb9ed, t += (e ^ (r = (r << 17 | r >>> 15) + a | 0) & (a ^ e)) + o[7] - 0x2b96aff, e += (a ^ (t = (t << 22 | t >>> 10) + r | 0) & (r ^ a)) + o[8] + 0x698098d8, a += (r ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ r)) + o[9] - 0x74bb0851, r += (t ^ (a = (a << 12 | a >>> 20) + e | 0) & (e ^ t)) + o[10] - 42063, t += (e ^ (r = (r << 17 | r >>> 15) + a | 0) & (a ^ e)) + o[11] - 0x76a32842, e += (a ^ (t = (t << 22 | t >>> 10) + r | 0) & (r ^ a)) + o[12] + 0x6b901122, a += (r ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ r)) + o[13] - 0x2678e6d, r += (t ^ (a = (a << 12 | a >>> 20) + e | 0) & (e ^ t)) + o[14] - 0x5986bc72, t += (e ^ (r = (r << 17 | r >>> 15) + a | 0) & (a ^ e)) + o[15] + 0x49b40821, t = (t << 22 | t >>> 10) + r | 0, e += (r ^ a & (t ^ r)) + o[1] - 0x9e1da9e, e = (e << 5 | e >>> 27) + t | 0, a += (t ^ r & (e ^ t)) + o[6] - 0x3fbf4cc0, a = (a << 9 | a >>> 23) + e | 0, r += (e ^ t & (a ^ e)) + o[11] + 0x265e5a51, r = (r << 14 | r >>> 18) + a | 0, t += (a ^ e & (r ^ a)) + o[0] - 0x16493856, t = (t << 20 | t >>> 12) + r | 0, e += (r ^ a & (t ^ r)) + o[5] - 0x29d0efa3, e = (e << 5 | e >>> 27) + t | 0, a += (t ^ r & (e ^ t)) + o[10] + 0x2441453, a = (a << 9 | a >>> 23) + e | 0, r += (e ^ t & (a ^ e)) + o[15] - 0x275e197f, r = (r << 14 | r >>> 18) + a | 0, t += (a ^ e & (r ^ a)) + o[4] - 0x182c0438, t = (t << 20 | t >>> 12) + r | 0, e += (r ^ a & (t ^ r)) + o[9] + 0x21e1cde6, e = (e << 5 | e >>> 27) + t | 0, a += (t ^ r & (e ^ t)) + o[14] - 0x3cc8f82a, a = (a << 9 | a >>> 23) + e | 0, r += (e ^ t & (a ^ e)) + o[3] - 0xb2af279, r = (r << 14 | r >>> 18) + a | 0, t += (a ^ e & (r ^ a)) + o[8] + 0x455a14ed, t = (t << 20 | t >>> 12) + r | 0, e += (r ^ a & (t ^ r)) + o[13] - 0x561c16fb, e = (e << 5 | e >>> 27) + t | 0, a += (t ^ r & (e ^ t)) + o[2] - 0x3105c08, a = (a << 9 | a >>> 23) + e | 0, r += (e ^ t & (a ^ e)) + o[7] + 0x676f02d9, r = (r << 14 | r >>> 18) + a | 0, t += (a ^ e & (r ^ a)) + o[12] - 0x72d5b376, e += ((i = (t = (t << 20 | t >>> 12) + r | 0) ^ r) ^ a) + o[5] - 378558, a += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + o[8] - 0x788e097f, r += ((n = (a = (a << 11 | a >>> 21) + e | 0) ^ e) ^ t) + o[11] + 0x6d9d6122, t += (n ^ (r = (r << 16 | r >>> 16) + a | 0)) + o[14] - 0x21ac7f4, e += ((i = (t = (t << 23 | t >>> 9) + r | 0) ^ r) ^ a) + o[1] - 0x5b4115bc, a += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + o[4] + 0x4bdecfa9, r += ((n = (a = (a << 11 | a >>> 21) + e | 0) ^ e) ^ t) + o[7] - 0x944b4a0, t += (n ^ (r = (r << 16 | r >>> 16) + a | 0)) + o[10] - 0x41404390, e += ((i = (t = (t << 23 | t >>> 9) + r | 0) ^ r) ^ a) + o[13] + 0x289b7ec6, a += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + o[0] - 0x155ed806, r += ((n = (a = (a << 11 | a >>> 21) + e | 0) ^ e) ^ t) + o[3] - 0x2b10cf7b, t += (n ^ (r = (r << 16 | r >>> 16) + a | 0)) + o[6] + 0x4881d05, e += ((i = (t = (t << 23 | t >>> 9) + r | 0) ^ r) ^ a) + o[9] - 0x262b2fc7, a += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + o[12] - 0x1924661b, r += ((n = (a = (a << 11 | a >>> 21) + e | 0) ^ e) ^ t) + o[15] + 0x1fa27cf8, t += (n ^ (r = (r << 16 | r >>> 16) + a | 0)) + o[2] - 0x3b53a99b, t = (t << 23 | t >>> 9) + r | 0, e += (r ^ (t | ~a)) + o[0] - 0xbd6ddbc, e = (e << 6 | e >>> 26) + t | 0, a += (t ^ (e | ~r)) + o[7] + 0x432aff97, a = (a << 10 | a >>> 22) + e | 0, r += (e ^ (a | ~t)) + o[14] - 0x546bdc59, r = (r << 15 | r >>> 17) + a | 0, t += (a ^ (r | ~e)) + o[5] - 0x36c5fc7, t = (t << 21 | t >>> 11) + r | 0, e += (r ^ (t | ~a)) + o[12] + 0x655b59c3, e = (e << 6 | e >>> 26) + t | 0, a += (t ^ (e | ~r)) + o[3] - 0x70f3336e, a = (a << 10 | a >>> 22) + e | 0, r += (e ^ (a | ~t)) + o[10] - 1051523, r = (r << 15 | r >>> 17) + a | 0, t += (a ^ (r | ~e)) + o[1] - 0x7a7ba22f, t = (t << 21 | t >>> 11) + r | 0, e += (r ^ (t | ~a)) + o[8] + 0x6fa87e4f, e = (e << 6 | e >>> 26) + t | 0, a += (t ^ (e | ~r)) + o[15] - 0x1d31920, a = (a << 10 | a >>> 22) + e | 0, r += (e ^ (a | ~t)) + o[6] - 0x5cfebcec, r = (r << 15 | r >>> 17) + a | 0, t += (a ^ (r | ~e)) + o[13] + 0x4e0811a1, t = (t << 21 | t >>> 11) + r | 0, e += (r ^ (t | ~a)) + o[4] - 0x8ac817e, e = (e << 6 | e >>> 26) + t | 0, a += (t ^ (e | ~r)) + o[11] - 0x42c50dcb, a = (a << 10 | a >>> 22) + e | 0, r += (e ^ (a | ~t)) + o[2] + 0x2ad7d2bb, r = (r << 15 | r >>> 17) + a | 0, t += (a ^ (r | ~e)) + o[9] - 0x14792c6f, t = (t << 21 | t >>> 11) + r | 0, this.first ? (this.h0 = e + 0x67452301 | 0, this.h1 = t - 0x10325477 | 0, this.h2 = r - 0x67452302 | 0, this.h3 = a + 0x10325476 | 0, this.first = !1) : (this.h0 = this.h0 + e | 0, this.h1 = this.h1 + t | 0, this.h2 = this.h2 + r | 0, this.h3 = this.h3 + a | 0)
        }, P.prototype.hex = function() {
            this.finalize();
            var e = this.h0,
                t = this.h1,
                r = this.h2,
                a = this.h3;
            return h[e >>> 4 & 15] + h[15 & e] + h[e >>> 12 & 15] + h[e >>> 8 & 15] + h[e >>> 20 & 15] + h[e >>> 16 & 15] + h[e >>> 28 & 15] + h[e >>> 24 & 15] + h[t >>> 4 & 15] + h[15 & t] + h[t >>> 12 & 15] + h[t >>> 8 & 15] + h[t >>> 20 & 15] + h[t >>> 16 & 15] + h[t >>> 28 & 15] + h[t >>> 24 & 15] + h[r >>> 4 & 15] + h[15 & r] + h[r >>> 12 & 15] + h[r >>> 8 & 15] + h[r >>> 20 & 15] + h[r >>> 16 & 15] + h[r >>> 28 & 15] + h[r >>> 24 & 15] + h[a >>> 4 & 15] + h[15 & a] + h[a >>> 12 & 15] + h[a >>> 8 & 15] + h[a >>> 20 & 15] + h[a >>> 16 & 15] + h[a >>> 28 & 15] + h[a >>> 24 & 15]
        }, P.prototype.toString = P.prototype.hex, P.prototype.digest = function() {
            this.finalize();
            var e = this.h0,
                t = this.h1,
                r = this.h2,
                a = this.h3;
            return [255 & e, e >>> 8 & 255, e >>> 16 & 255, e >>> 24 & 255, 255 & t, t >>> 8 & 255, t >>> 16 & 255, t >>> 24 & 255, 255 & r, r >>> 8 & 255, r >>> 16 & 255, r >>> 24 & 255, 255 & a, a >>> 8 & 255, a >>> 16 & 255, a >>> 24 & 255]
        }, P.prototype.array = P.prototype.digest, P.prototype.arrayBuffer = function() {
            this.finalize();
            var e = new ArrayBuffer(16),
                t = new Uint32Array(e);
            return t[0] = this.h0, t[1] = this.h1, t[2] = this.h2, t[3] = this.h3, e
        }, P.prototype.buffer = P.prototype.arrayBuffer, P.prototype.base64 = function() {
            for (var e, t, r, a = "", i = this.array(), n = 0; n < 15;) e = i[n++], t = i[n++], r = i[n++], a += f[e >>> 2] + f[(e << 4 | t >>> 4) & 63] + f[(t << 2 | r >>> 6) & 63] + f[63 & r];
            return a + (f[(e = i[n]) >>> 2] + f[e << 4 & 63] + "==")
        }, O.prototype = new P, O.prototype.finalize = function() {
            if (P.prototype.finalize.call(this), this.inner) {
                this.inner = !1;
                var e = this.array();
                P.call(this, this.sharedMemory), this.update(this.oKeyPad), this.update(e), P.prototype.finalize.call(this)
            }
        };
        var w = function() {
            var e = m("hex");
            s && (e = I(e)), e.create = function() {
                return new P
            }, e.update = function(t) {
                return e.create().update(t)
            };
            for (var t = 0; t < T.length; ++t) {
                var r = T[t];
                e[r] = m(r)
            }
            return e
        }();
        if (w.md5 = w, w.md5.hmac = function() {
                var e = C("hex");
                e.create = function(e) {
                    return new O(e)
                }, e.update = function(t, r) {
                    return e.create(t).update(r)
                };
                for (var t = 0; t < T.length; ++t) {
                    var r = T[t];
                    e[r] = C(r)
                }
                return e
            }(), u) t.exports = w;
        else n.md5 = w, d && (e.r, void 0 !== w && e.v(w))
    }()
}, 968284, 129882, e => {
    "use strict";
    var t, r, a = e.i(805290),
        i = e.i(11682),
        n = e.i(317143),
        o = ((t = {}).MD5_CALCULATION = "MD5_CALCULATION", t.MULTIPART_START = "MULTIPART_START", t.CHUNK_UPLOAD = "CHUNK_UPLOAD", t.CHUNK_COMPLETE = "CHUNK_COMPLETE", t.MULTIPART_COMPLETE = "MULTIPART_COMPLETE", t.CHUNK_UPLOAD_ABORT = "CHUNK_UPLOAD_ABORT", t.CHUNK_COMPLETE_ABORT = "CHUNK_COMPLETE_ABORT", t);
    class s extends Error {
        constructor(e, t, r, i, n, o, s) {
            super(e), (0, a._)(this, "stage", void 0), (0, a._)(this, "operationId", void 0), (0, a._)(this, "chunkIndex", void 0), (0, a._)(this, "httpStatus", void 0), (0, a._)(this, "errorCode", void 0), (0, a._)(this, "retryAttempt", void 0), this.name = "MultipartUploadError", this.stage = t, this.operationId = r, this.chunkIndex = i, this.httpStatus = n, this.errorCode = o, this.retryAttempt = s
        }
    }
    e.s(["C", 0, s, "S", () => o], 129882);
    var l = e.i(650502),
        u = e.i(272593),
        d = ((r = {}).ASSET_TYPE = "assetType", r.DESCRIPTION = "description", r.DISPLAY_NAME = "displayName", r.ICON = "icon", r.MODERATION_RESULT = "moderationResult", r.PREVIEWS = "previews", r.REVISION_ID = "revisionId", r.FACEBOOK_SOCIAL_LINK = "facebookSocialLink", r.TWITTER_SOCIAL_LINK = "twitterSocialLink", r.YOUTUBE_SOCIAL_LINK = "youtubeSocialLink", r.TWITCH_SOCIAL_LINK = "twitchSocialLink", r.DISCORD_SOCIAL_LINK = "discordSocialLink", r.GITHUB_SOCIAL_LINK = "githubSocialLink", r.ROBLOX_SOCIAL_LINK = "robloxSocialLink", r.DEVFORUM_SOCIAL_LINK = "devForumSocialLink", r.TRY_ASSET_SOCIAL_LINK = "tryAssetSocialLink", r);
    let c = ["revisionId"],
        h = (0, l.l)("assets/user-auth"),
        p = "x-csrf-token",
        A = JSON.stringify({
            AssetPrivacy: "OpenUse"
        }),
        T = {
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
    async function f(e, t) {
        null == t || t.throwIfAborted(), await new Promise((r, a) => {
            let i = setTimeout(() => {
                    null == t || t.removeEventListener("abort", n), r()
                }, e),
                n = () => {
                    clearTimeout(i), a(null == t ? void 0 : t.reason)
                };
            null == t || t.addEventListener("abort", n, {
                once: !0
            })
        })
    }
    async function S(e, t, r, a) {
        let i = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : 0;
        null == a || a.throwIfAborted();
        try {
            return await e()
        } catch (o) {
            if (null == a ? void 0 : a.aborted) throw o;
            let n = o instanceof Error ? o : Error(String(o));
            if (i < t) {
                let n = r(i);
                return await f(n, a), S(e, t, r, a, i + 1)
            }
            throw n
        }
    }
    let E = async e => {
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
    }, _ = new class e {
        async createAssetAndGetOperationId(t, r) {
            let a = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                i = arguments.length > 3 ? arguments[3] : void 0,
                n = a ? e.generateRequestInitForCreatingOpenUseAsset(t, r) : {};
            n.signal = i;
            let o = await E(i);
            o && (n.headers = {
                [p]: o
            });
            let s = await this.assetsUploadApi.assetsCreateAsset({
                request: t,
                fileContent: r
            }, n);
            return e.parseOperationId(s.path)
        }
        async abortMultipartUpload(e) {
            let t = {},
                r = await E();
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
        async createAssetAndGetOperationIdWithMultipart(t, r, a, i, n, l, u, d) {
            var c;
            let h, A, T, f, _ = null != a && a ? e.generateRequestInitForCreatingOpenUseAsset(t, r) : {};
            _.signal = n;
            let v = await E(n);
            v && (_.headers = {
                [p]: v,
                "Content-Type": "application/json; charset=utf-8"
            }), i && i(1);
            try {
                let t = await e.calculateMD5(r, n);
                h = t.hash, A = t.data
            } catch (e) {
                throw new s("Failed to calculate MD5 for file: ".concat(e instanceof Error ? e.message : String(e)), o.MD5_CALCULATION, void 0, void 0, void 0, "MD5_CALCULATION_FAILED")
            }
            i && i(5);
            let y = e.makeUploadPlan(r.size);
            i && i(10);
            let m = {
                    asset: t,
                    file: {
                        filesize: r.size,
                        md5CheckSum: h,
                        chunkPlan: y,
                        contentType: e.getMultipartContentType(r)
                    }
                },
                I = [];
            try {
                T = await this.multipartUploadApi.assetsCreateAssetWithMultipartUpload({
                    multipartUploadStartRequest: m
                }, _)
            } catch (e) {
                throw new s("Failed to start multipart upload: ".concat(e instanceof Error ? e.message : String(e)), o.MULTIPART_START, void 0, void 0, e instanceof Error && "status" in e ? e.status : void 0, "MULTIPART_START_FAILED")
            }
            if (i && i(15), 0 === (I = null != (c = T.uploadUrls) ? c : []).length) throw new s("Upload URLs are empty from multipart start response", o.MULTIPART_START, void 0, void 0, void 0, "EMPTY_UPLOAD_URLS");
            let C = e.parseOperationId(T.operationPath);
            if ("" === C) throw new s("Operation ID is empty from multipart start response", o.MULTIPART_START, void 0, void 0, void 0, "EMPTY_OPERATION_ID");
            null == l || l(C);
            try {
                f = await e.uploadChunks(I, A, C, i ? e => {
                    i(Math.min(15 + .65 * e, 80))
                } : void 0, n)
            } catch (e) {
                try {
                    await this.abortMultipartUploadAfterFailure(C, _, n), (null == n ? void 0 : n.aborted) || null == d || d(C)
                } catch (t) {
                    throw new s("Chunk upload failed and abort also failed. Original error: ".concat(e instanceof Error ? e.message : String(e), ". Abort error: ").concat(t instanceof Error ? t.message : String(t)), o.CHUNK_UPLOAD_ABORT, C, void 0, void 0, "ABORT_FAILED")
                }
                if (e instanceof s) throw e;
                throw new s("Chunk upload failed: ".concat(e instanceof Error ? e.message : String(e)), o.CHUNK_UPLOAD, C, void 0, void 0, "CHUNK_UPLOAD_FAILED")
            }
            i && i(80);
            try {
                await Promise.all(f.map((e, t) => {
                    let r = t + 1;
                    return S(async () => {
                        try {
                            await this.multipartUploadApi.assetsMultipartUploadChunkComplete({
                                operationId: C,
                                multipartUploadChunkCompleteRequest: {
                                    chunkNum: r,
                                    eTag: e
                                }
                            }, _)
                        } catch (e) {
                            throw new s("Failed to complete chunk ".concat(r, ": ").concat(e instanceof Error ? e.message : String(e)), o.CHUNK_COMPLETE, C, r, e instanceof Error && "status" in e ? e.status : void 0, "CHUNK_COMPLETE_FAILED")
                        }
                    }, 3, e => 1e3 * 2 ** e, n)
                }))
            } catch (e) {
                try {
                    await this.abortMultipartUploadAfterFailure(C, _, n), (null == n ? void 0 : n.aborted) || null == d || d(C)
                } catch (t) {
                    throw new s("Chunk complete failed and abort also failed. Original error: ".concat(e instanceof Error ? e.message : String(e), ". Abort error: ").concat(t instanceof Error ? t.message : String(t)), o.CHUNK_COMPLETE_ABORT, C, void 0, void 0, "ABORT_FAILED")
                }
                if (e instanceof s) throw e;
                throw new s("Chunk complete failed: ".concat(e instanceof Error ? e.message : String(e)), o.CHUNK_COMPLETE, C, void 0, void 0, "CHUNK_COMPLETE_FAILED")
            }
            i && i(90), null == u || u();
            try {
                await this.multipartUploadApi.assetsMultipartUploadComplete({
                    operationId: C
                }, _)
            } catch (e) {
                throw new s("Failed to complete multipart upload: ".concat(e instanceof Error ? e.message : String(e)), o.MULTIPART_COMPLETE, C, void 0, e instanceof Error && "status" in e ? e.status : void 0, "MULTIPART_COMPLETE_FAILED")
            }
            return i && i(100), C
        }
        async updateAssetAndGetOperationId(t, r, a, i) {
            let n = await this.assetsUploadApi.assetsUpdateAsset({
                assetId: t,
                updateMask: r,
                request: a,
                fileContent: i
            });
            return e.parseOperationId(n.path)
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
            let t = Number((await this.getAsset(e, c)).revisionId);
            if (!Number.isSafeInteger(t) || t <= 0) throw Error("Could not resolve latest version number for asset ".concat(e));
            let r = await this.getAssetVersion(e, t);
            return {
                latestVersionNumber: t,
                latestVersionState: !0 === r.published ? n.x.Published : n.x.Draft
            }
        }
        async publishAssetVersionAndGetOperationId(t, r, a) {
            let i = {
                    signal: a
                },
                o = await E(a);
            i.headers = {
                "Content-Type": "application/json",
                ...o ? {
                    [p]: o
                } : {}
            };
            let s = await this.assetsUploadApi.assetsChangeAssetVersionState({
                assetId: t,
                versionNumber: r,
                changeAssetVersionStateRequest: {
                    intendedVersionState: n.n.Published
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
            return r.append("request", JSON.stringify(e)), r.append("fileContent", t), r.append("additionalParameters", A), {
                body: r
            }
        }
        static async calculateMD5(e, t) {
            null == t || t.throwIfAborted();
            let r = await new Promise((r, a) => {
                let i = new FileReader,
                    n = () => null == t ? void 0 : t.removeEventListener("abort", o),
                    o = () => {
                        i.abort(), a(null == t ? void 0 : t.reason)
                    };
                null == t || t.addEventListener("abort", o, {
                    once: !0
                }), i.onload = e => {
                    var t;
                    n();
                    let i = null == e || null == (t = e.target) ? void 0 : t.result;
                    i instanceof ArrayBuffer ? r(new Uint8Array(i)) : a(Error("Failed to read file"))
                }, i.onerror = () => {
                    n(), a(i.error)
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
            return null != (t = T[a < 0 ? "" : e.name.slice(a).toLowerCase()]) ? t : "application/octet-stream"
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
            let n = e.length,
                l = 0,
                u = a ? () => {
                    a(Math.min((l += 1) / n * 100, 99))
                } : void 0,
                d = Array.from({
                    length: n
                }, () => ""),
                c = async a => {
                    let n = e[a],
                        l = Number((null == n ? void 0 : n.contentStart) || 0),
                        c = Number((null == n ? void 0 : n.contentLength) || 0);
                    d[a] = await S(async () => {
                        if (null == i || i.throwIfAborted(), !(null == n ? void 0 : n.url)) throw new s("No URL found for chunk ".concat(a + 1), o.CHUNK_UPLOAD, r, a + 1, void 0, "MISSING_UPLOAD_URL");
                        let e = t.slice(l, l + c);
                        if (e.length !== c) throw new s("Chunk size mismatch for chunk ".concat(a + 1, ": expected ").concat(c, ", got ").concat(e.length), o.CHUNK_UPLOAD, r, a + 1, void 0, "CHUNK_SIZE_MISMATCH");
                        let d = await fetch(n.url, {
                            method: "PUT",
                            body: e,
                            signal: i
                        });
                        if (!d.ok) throw new s("Failed to upload chunk ".concat(a + 1, ": ").concat(d.status, " ").concat(d.statusText), o.CHUNK_UPLOAD, r, a + 1, d.status, "CHUNK_UPLOAD_HTTP_ERROR");
                        let h = d.headers.get("ETag");
                        if (!h) throw new s("No ETag received for chunk ".concat(a + 1), o.CHUNK_UPLOAD, r, a + 1, d.status, "MISSING_ETAG");
                        return u && u(), h.replaceAll(/['"]/g, "")
                    }, 3, e => 1e3 * 2 ** e, i)
                }, h = 0, p = async () => {
                    for (; h < n;) {
                        null == i || i.throwIfAborted();
                        let e = h;
                        h += 1, await c(e)
                    }
                }, A = Math.min(3, n);
            return await Promise.all(Array.from({
                length: A
            }, p)), a && a(100), d
        }
        constructor() {
            (0, a._)(this, "assetsUploadApi", void 0), (0, a._)(this, "assetVersionApi", void 0), (0, a._)(this, "uploadStatusApi", void 0), (0, a._)(this, "multipartUploadApi", void 0);
            let e = (0, u.f)("assets/user-auth", "bedev2");
            this.assetsUploadApi = new n.k(e), this.assetVersionApi = new n.l(e), this.uploadStatusApi = new n.y(e), this.multipartUploadApi = new n.a(e)
        }
    };
    e.s(["b", () => d, "U", 0, _], 968284)
}, 970494, 391643, 557638, e => {
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
        return new(r || (r = Promise))(function(i, n) {
            function o(e) {
                try {
                    l(a.next(e))
                } catch (e) {
                    n(e)
                }
            }

            function s(e) {
                try {
                    l(a.throw(e))
                } catch (e) {
                    n(e)
                }
            }

            function l(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(o, s)
            }
            l((a = a.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var r, a, i, n = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(l) {
                var u = [s, l];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (n = 0)), n;) try {
                    if (r = 1, a && (i = 2 & u[0] ? a.return : u[0] ? a.throw || ((i = a.return) && i.call(a), 0) : a.next) && !(i = i.call(a, u[1])).done) return i;
                    switch (a = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                        case 0:
                        case 1:
                            i = u;
                            break;
                        case 4:
                            return n.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            n.label++, a = u[1], u = [0];
                            continue;
                        case 7:
                            u = n.ops.pop(), n.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = n.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                n = 0;
                                continue
                            }
                            if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                n.label = u[1];
                                break
                            }
                            if (6 === u[0] && n.label < i[1]) {
                                n.label = i[1], i = u;
                                break
                            }
                            if (i && n.label < i[2]) {
                                n.label = i[2], n.ops.push(u);
                                break
                            }
                            i[2] && n.ops.pop(), n.trys.pop();
                            continue
                    }
                    u = t.call(e, n)
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
    var n = {
        Invalid: "ASSET_TYPE_INVALID",
        Image: "ASSET_TYPE_IMAGE",
        Tshirt: "ASSET_TYPE_TSHIRT",
        Audio: "ASSET_TYPE_AUDIO",
        Mesh: "ASSET_TYPE_MESH",
        Lua: "ASSET_TYPE_LUA",
        Html: "ASSET_TYPE_HTML",
        Text: "ASSET_TYPE_TEXT",
        Hat: "ASSET_TYPE_HAT",
        Place: "ASSET_TYPE_PLACE",
        Model: "ASSET_TYPE_MODEL",
        Shirt: "ASSET_TYPE_SHIRT",
        Pants: "ASSET_TYPE_PANTS",
        Decal: "ASSET_TYPE_DECAL",
        Avatar: "ASSET_TYPE_AVATAR",
        Head: "ASSET_TYPE_HEAD",
        Face: "ASSET_TYPE_FACE",
        Gear: "ASSET_TYPE_GEAR",
        Badge: "ASSET_TYPE_BADGE",
        GroupEmblem: "ASSET_TYPE_GROUP_EMBLEM",
        Animation: "ASSET_TYPE_ANIMATION",
        Arms: "ASSET_TYPE_ARMS",
        Legs: "ASSET_TYPE_LEGS",
        Torso: "ASSET_TYPE_TORSO",
        RightArm: "ASSET_TYPE_RIGHT_ARM",
        LeftArm: "ASSET_TYPE_LEFT_ARM",
        LeftLeg: "ASSET_TYPE_LEFT_LEG",
        RightLeg: "ASSET_TYPE_RIGHT_LEG",
        Package: "ASSET_TYPE_PACKAGE",
        YoutubeVideo: "ASSET_TYPE_YOUTUBE_VIDEO",
        GamePass: "ASSET_TYPE_GAME_PASS",
        App: "ASSET_TYPE_APP",
        Code: "ASSET_TYPE_CODE",
        Plugin: "ASSET_TYPE_PLUGIN",
        SolidModel: "ASSET_TYPE_SOLID_MODEL",
        MeshPart: "ASSET_TYPE_MESH_PART",
        HairAccessory: "ASSET_TYPE_HAIR_ACCESSORY",
        FaceAccessory: "ASSET_TYPE_FACE_ACCESSORY",
        NeckAccessory: "ASSET_TYPE_NECK_ACCESSORY",
        ShoulderAccessory: "ASSET_TYPE_SHOULDER_ACCESSORY",
        FrontAccessory: "ASSET_TYPE_FRONT_ACCESSORY",
        BackAccessory: "ASSET_TYPE_BACK_ACCESSORY",
        WaistAccessory: "ASSET_TYPE_WAIST_ACCESSORY",
        ClimbAnimation: "ASSET_TYPE_CLIMB_ANIMATION",
        DeathAnimation: "ASSET_TYPE_DEATH_ANIMATION",
        FallAnimation: "ASSET_TYPE_FALL_ANIMATION",
        IdleAnimation: "ASSET_TYPE_IDLE_ANIMATION",
        JumpAnimation: "ASSET_TYPE_JUMP_ANIMATION",
        RunAnimation: "ASSET_TYPE_RUN_ANIMATION",
        SwimAnimation: "ASSET_TYPE_SWIM_ANIMATION",
        WalkAnimation: "ASSET_TYPE_WALK_ANIMATION",
        PoseAnimation: "ASSET_TYPE_POSE_ANIMATION",
        LocalizationTableManifest: "ASSET_TYPE_LOCALIZATION_TABLE_MANIFEST",
        LocalizationTableTranslation: "ASSET_TYPE_LOCALIZATION_TABLE_TRANSLATION",
        EmoteAnimation: "ASSET_TYPE_EMOTE_ANIMATION",
        Video: "ASSET_TYPE_VIDEO",
        TexturePack: "ASSET_TYPE_TEXTURE_PACK",
        TshirtAccessory: "ASSET_TYPE_TSHIRT_ACCESSORY",
        ShirtAccessory: "ASSET_TYPE_SHIRT_ACCESSORY",
        PantsAccessory: "ASSET_TYPE_PANTS_ACCESSORY",
        JacketAccessory: "ASSET_TYPE_JACKET_ACCESSORY",
        SweaterAccessory: "ASSET_TYPE_SWEATER_ACCESSORY",
        ShortsAccessory: "ASSET_TYPE_SHORTS_ACCESSORY",
        LeftShoeAccessory: "ASSET_TYPE_LEFT_SHOE_ACCESSORY",
        RightShoeAccessory: "ASSET_TYPE_RIGHT_SHOE_ACCESSORY",
        DressSkirtAccessory: "ASSET_TYPE_DRESS_SKIRT_ACCESSORY",
        FontFamily: "ASSET_TYPE_FONT_FAMILY",
        FontFace: "ASSET_TYPE_FONT_FACE",
        MeshHiddenSurfaceRemoval: "ASSET_TYPE_MESH_HIDDEN_SURFACE_REMOVAL",
        EyebrowAccessory: "ASSET_TYPE_EYEBROW_ACCESSORY",
        EyelashAccessory: "ASSET_TYPE_EYELASH_ACCESSORY",
        MoodAnimation: "ASSET_TYPE_MOOD_ANIMATION",
        DynamicHead: "ASSET_TYPE_DYNAMIC_HEAD",
        CodeSnippet: "ASSET_TYPE_CODE_SNIPPET",
        AdsVideo: "ASSET_TYPE_ADS_VIDEO",
        TextDocument: "ASSET_TYPE_TEXT_DOCUMENT"
    };

    function o(e) {
        var r;
        return null == (r = e) ? r : {
            createdDetails: (0, t.u)(r, "createdDetails") ? r.createdDetails : void 0,
            purchasedDetails: (0, t.u)(r, "purchasedDetails") ? r.purchasedDetails : void 0,
            sharedDetails: (0, t.u)(r, "sharedDetails") ? r.sharedDetails : void 0
        }
    }

    function s(e) {
        var r, a, i, n, s, l, u;
        return null == (r = e) ? r : {
            path: (0, t.u)(r, "path") ? r.path : void 0,
            assetItem: (0, t.u)(r, "assetItem") ? null == (a = r.assetItem) ? a : {
                asset: (0, t.u)(a, "asset") ? null == (i = a.asset) ? i : {
                    createTime: (0, t.u)(i, "createTime") ? new Date(i.createTime) : void 0,
                    updateTime: (0, t.u)(i, "updateTime") ? new Date(i.updateTime) : void 0,
                    assetId: (0, t.u)(i, "assetId") ? i.assetId : void 0,
                    displayName: (0, t.u)(i, "displayName") ? i.displayName : void 0,
                    description: (0, t.u)(i, "description") ? i.description : void 0,
                    assetType: (0, t.u)(i, "assetType") ? i.assetType : void 0,
                    creationContext: (0, t.u)(i, "creationContext") ? null == (n = i.creationContext) ? n : {
                        creator: (0, t.u)(n, "creator") ? null == (s = n.creator) ? s : {
                            userId: (0, t.u)(s, "userId") ? s.userId : void 0,
                            groupId: (0, t.u)(s, "groupId") ? s.groupId : void 0,
                            name: (0, t.u)(s, "name") ? s.name : void 0
                        } : void 0
                    } : void 0,
                    state: (0, t.u)(i, "state") ? i.state : void 0,
                    assetSubType: (0, t.u)(i, "assetSubType") ? i.assetSubType : void 0
                } : void 0,
                sources: (0, t.u)(a, "sources") ? a.sources.map(o) : void 0,
                isPackage: (0, t.u)(a, "isPackage") ? a.isPackage : void 0
            } : void 0,
            folderItem: (0, t.u)(r, "folderItem") ? null == (l = r.folderItem) ? l : {
                folder: (0, t.u)(l, "folder") ? null == (u = l.folder) ? u : {
                    folderId: (0, t.u)(u, "folderId") ? u.folderId : void 0,
                    parentFolderId: (0, t.u)(u, "parentFolderId") ? u.parentFolderId : void 0,
                    displayName: (0, t.u)(u, "displayName") ? u.displayName : void 0,
                    createTime: (0, t.u)(u, "createTime") ? new Date(u.createTime) : void 0,
                    updateTime: (0, t.u)(u, "updateTime") ? new Date(u.updateTime) : void 0
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
        d = function(e) {
            return Object.fromEntries(Object.entries(e).map(function(e) {
                var t = e[0];
                return [e[1], t]
            }))
        },
        c = {
            assetTypes: d(n),
            sources: d(l)
        };

    function h(e, t) {
        var r, a = String(e);
        return t && null != (r = t[a]) ? r : a
    }
    var p = function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function a() {
                this.constructor = e
            }
            r(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
        }(n, e), n.prototype.creatorInventorySearchCreatorInventoryItemsRaw = function(e, r) {
            return a(this, void 0, void 0, function() {
                var a, n, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.filter || void 0 === e.filter) throw new t.w("filter", "Required parameter requestParameters.filter was null or undefined when calling creatorInventorySearchCreatorInventoryItems.");
                            return a = {}, void 0 !== e.query && (a.query = e.query), void 0 !== e.filter && (a.filter = function(e) {
                                for (var t = [], r = 0; r < u.length; r++) ! function(r) {
                                    var a = e[r];
                                    if (null != a) {
                                        var i = c[r];
                                        if (Array.isArray(a)) {
                                            if (0 === a.length) return;
                                            t.push("".concat(r, "=").concat(a.map(function(e) {
                                                return h(e, i)
                                            }).join(",")))
                                        } else t.push("".concat(r, "=").concat(h(a, i)))
                                    }
                                }(u[r]);
                                return t.join(";")
                            }(e.filter)), void 0 !== e.maxPageSize && (a.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), n = {}, [4, this.request({
                                path: "/v1/-/creator-inventory-items:search",
                                schemaPath: "/v1/-/creator-inventory-items:search",
                                method: "GET",
                                headers: n,
                                query: a
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    items: (0, t.u)(e, "items") ? e.items.map(s) : void 0,
                                    nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.creatorInventorySearchCreatorInventoryItems = function(e, t) {
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
        }, n
    }(t._);
    e.s(["s", 0, n, "a", 0, p, "S", 0, l, "A", 0, {
        Invalid: "STATE_INVALID",
        Active: "STATE_ACTIVE",
        Archived: "STATE_ARCHIVED"
    }], 391643), e.s(["f", 0, l], 557638);
    let A = ["development-items-inventory"],
        T = ["development-item-metadata-overrides"],
        f = ["development-item-upload-overrides"],
        S = e => null != e ? e : "",
        E = e => {
            var t;
            return null != (t = null == e ? void 0 : e.trim()) ? t : ""
        },
        _ = (e, t) => {
            e.setQueryData(T, e => {
                if ((null == e ? void 0 : e.has(t)) !== !0) return e;
                let r = new Map(e);
                return r.delete(t), r
            })
        },
        v = (e, t) => {
            var r;
            let a = null == (r = e.getQueryData(T)) ? void 0 : r.get(t);
            return null != a && a.expiresAt <= Date.now() ? void _(e, t) : a
        },
        y = (e, t) => {
            e.setQueryData(f, e => {
                if ((null == e ? void 0 : e.has(t)) !== !0) return e;
                let r = new Map(e);
                return r.delete(t), r
            })
        },
        m = e => e[0] === A[0],
        I = e => null == e || "updateTime desc" === e,
        C = e => I(e[9]),
        P = (e, t, r) => {
            e.setQueryData(T, e => {
                let a = null == e ? void 0 : e.get(t);
                if (null == a) return e;
                let i = {
                        ...a,
                        developConfirmed: "develop" === r || a.developConfirmed,
                        inventoryConfirmed: "inventory" === r || a.inventoryConfirmed
                    },
                    n = new Map(e);
                return i.developConfirmed && i.inventoryConfirmed ? n.delete(t) : n.set(t, i), n
            })
        },
        O = (e, t) => E(null == t ? void 0 : t.name) === E(e.name) && S(null == t ? void 0 : t.description) === S(e.description);
    e.s(["E", 0, A, "J", 0, (e, t) => {
        let {
            assetId: r,
            state: a
        } = t;
        e.setQueriesData({
            queryKey: A
        }, e => null == e ? e : {
            ...e,
            items: e.items.map(e => e.assetId === r ? {
                ...e,
                state: a
            } : e)
        }), e.invalidateQueries({
            queryKey: A,
            refetchType: "none"
        })
    }, "x", 0, (e, t) => {
        let {
            assetId: r,
            description: a,
            name: i
        } = t, n = new Date, o = {
            assetId: r,
            description: S(a),
            developConfirmed: !1,
            expiresAt: n.getTime() + 3e4,
            inventoryConfirmed: !1,
            name: i,
            updated: n
        };
        e.setQueryData(T, e => {
            let t = new Map(e);
            return t.set(r, o), t
        });
        let s = e => t => {
            let a = null == t ? void 0 : t.items.find(e => e.assetId === r);
            if (null == t || null == a) return t;
            let o = {
                ...a,
                name: i,
                updated: n
            };
            return {
                ...t,
                items: e ? [o, ...t.items.filter(e => e.assetId !== r)] : t.items.map(e => e.assetId === r ? o : e)
            }
        };
        e.setQueriesData({
            predicate: e => {
                let {
                    queryKey: t
                } = e;
                return m(t) && C(t)
            }
        }, s(!0)), e.setQueriesData({
            predicate: e => {
                let {
                    queryKey: t
                } = e;
                return m(t) && !C(t)
            }
        }, s(!1)), e.invalidateQueries({
            queryKey: A,
            refetchType: "active"
        }), window.setTimeout(() => {
            let t = v(e, r);
            (null == t ? void 0 : t.expiresAt) === o.expiresAt && (_(e, r), e.invalidateQueries({
                queryKey: A,
                refetchType: "active"
            }))
        }, 3e4)
    }, "S", 0, (e, t) => {
        let {
            assetId: r,
            assetType: a,
            name: i,
            scope: n
        } = t, o = new Date, s = {
            expiresAt: o.getTime() + 3e5,
            item: {
                assetId: r,
                assetType: a,
                created: o,
                id: r.toString(),
                isPackage: !1,
                name: i,
                sources: [l.Created],
                state: "Active",
                updated: o
            },
            scope: n
        };
        e.setQueryData(f, e => {
            let t = new Map(e);
            return t.set(r, s), t
        }), e.setQueriesData({
            predicate: e => {
                let {
                    queryKey: t
                } = e;
                return ((e, t) => {
                    let [, r, a, i, n, o, , s, u, d] = t;
                    return m(t) && r === e.scope.type && a === e.scope.id && Array.isArray(i) && (0 === i.length || i.includes(e.item.assetType)) && (n === l.Created || "All" === n) && "string" == typeof o && null == s && !0 !== u && (null == d || "string" == typeof d && d.endsWith(" desc")) && e.item.name.toLocaleLowerCase().includes(o.trim().toLocaleLowerCase())
                })(s, t)
            }
        }, e => null == e || e.items.some(e => e.assetId === r) ? e : {
            ...e,
            items: [s.item, ...e.items]
        }), e.invalidateQueries({
            queryKey: A,
            refetchType: "none"
        }), window.setTimeout(() => {
            var t;
            let a = null == (t = e.getQueryData(f)) ? void 0 : t.get(r);
            (null == a ? void 0 : a.expiresAt) === s.expiresAt && (y(e, r), e.invalidateQueries({
                queryKey: A,
                refetchType: "active"
            }))
        }, 3e5)
    }, "W", 0, I, "e", 0, (e, t, r) => {
        let a = v(e, t);
        return null == a ? {
            details: r
        } : O(a, r) ? (P(e, t, "develop"), {
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
        } = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {}, i = [], n = [];
        return t.forEach(t => {
            let o = v(e, t.assetId);
            if (null == o) return void n.push(t);
            if (O(o, r.get(t.assetId))) {
                P(e, t.assetId, "inventory"), n.push(t);
                return
            }
            let s = {
                ...t,
                name: o.name,
                updated: o.updated
            };
            (a ? n : i).push(s)
        }), i.sort((e, t) => {
            var r, a, i, n;
            return (null != (r = null == (i = t.updated) ? void 0 : i.getTime()) ? r : 0) - (null != (a = null == (n = e.updated) ? void 0 : n.getTime()) ? a : 0)
        }), [...i, ...n]
    }, "A", 0, (e, t, r) => {
        let {
            assetTypes: a,
            pageToken: i,
            query: n,
            scope: o,
            source: s
        } = r, u = e.getQueryData(f);
        if (null == u || 0 === u.size) return [...t];
        let d = new Set(t.map(e => e.assetId)),
            c = [];
        return u.forEach((t, r) => {
            if (t.expiresAt <= Date.now()) return void y(e, r);
            if (((e, t) => {
                    let {
                        assetTypes: r,
                        pageToken: a,
                        query: i,
                        scope: n,
                        source: o
                    } = t;
                    return null == a && (null == n ? void 0 : n.type) === e.scope.type && n.id === e.scope.id && (0 === r.length || r.includes(e.item.assetType)) && (o === l.Created || "All" === o) && e.item.name.toLocaleLowerCase().includes(i.trim().toLocaleLowerCase())
                })(t, {
                    assetTypes: a,
                    pageToken: i,
                    query: n,
                    scope: o,
                    source: s
                })) {
                if (d.has(r)) return void y(e, r);
                c.push(t.item)
            }
        }), c.sort((e, t) => {
            var r, a, i, n;
            return (null != (r = null == (i = t.updated) ? void 0 : i.getTime()) ? r : 0) - (null != (a = null == (n = e.updated) ? void 0 : n.getTime()) ? a : 0)
        }), [...c, ...t]
    }], 970494)
}]);

//# debugId=f1a79e46-eb47-a01c-77fc-49b3bd2d9d01
//# sourceMappingURL=2wviyb4swwzs1.js.map