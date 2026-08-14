;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "d24539a3-4270-46d6-fe3f-4c5fd91d6791")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 968284, 129882, e => {
    "use strict";
    var t, s, r = e.i(721281),
        n = e.i(408068),
        a = e.i(284856),
        o = ((t = {}).MD5_CALCULATION = "MD5_CALCULATION", t.MULTIPART_START = "MULTIPART_START", t.CHUNK_UPLOAD = "CHUNK_UPLOAD", t.CHUNK_COMPLETE = "CHUNK_COMPLETE", t.MULTIPART_COMPLETE = "MULTIPART_COMPLETE", t.CHUNK_UPLOAD_ABORT = "CHUNK_UPLOAD_ABORT", t.CHUNK_COMPLETE_ABORT = "CHUNK_COMPLETE_ABORT", t);
    class i extends Error {
        constructor(e, t, s, n, a, o, i) {
            super(e), (0, r._)(this, "stage", void 0), (0, r._)(this, "operationId", void 0), (0, r._)(this, "chunkIndex", void 0), (0, r._)(this, "httpStatus", void 0), (0, r._)(this, "errorCode", void 0), (0, r._)(this, "retryAttempt", void 0), this.name = "MultipartUploadError", this.stage = t, this.operationId = s, this.chunkIndex = n, this.httpStatus = a, this.errorCode = o, this.retryAttempt = i
        }
    }
    e.s(["MultipartUploadError", 0, i, "MultipartUploadStage", () => o], 129882);
    var c = e.i(650502),
        l = e.i(272593),
        u = ((s = {}).ASSET_TYPE = "assetType", s.DESCRIPTION = "description", s.DISPLAY_NAME = "displayName", s.ICON = "icon", s.MODERATION_RESULT = "moderationResult", s.PREVIEWS = "previews", s.FACEBOOK_SOCIAL_LINK = "facebookSocialLink", s.TWITTER_SOCIAL_LINK = "twitterSocialLink", s.YOUTUBE_SOCIAL_LINK = "youtubeSocialLink", s.TWITCH_SOCIAL_LINK = "twitchSocialLink", s.DISCORD_SOCIAL_LINK = "discordSocialLink", s.GITHUB_SOCIAL_LINK = "githubSocialLink", s.ROBLOX_SOCIAL_LINK = "robloxSocialLink", s.DEVFORUM_SOCIAL_LINK = "devForumSocialLink", s.TRY_ASSET_SOCIAL_LINK = "tryAssetSocialLink", s);
    let d = (0, c.getBEDEV2ServiceBasePath)("assets/user-auth"),
        p = "x-csrf-token",
        h = JSON.stringify({
            AssetPrivacy: "OpenUse"
        });
    async function m(e, t, s) {
        let r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 0;
        try {
            return await e()
        } catch (a) {
            let n = a instanceof Error ? a : Error(String(a));
            if (r < t) {
                let n = s(r);
                return await new Promise(e => {
                    setTimeout(e, n)
                }), m(e, t, s, r + 1)
            }
            throw n
        }
    }
    let f = async () => {
        try {
            return (await fetch("".concat(d, "/v1/assets"), {
                method: "PATCH",
                credentials: "include"
            })).headers.get(p)
        } catch (e) {
            return null
        }
    }, v = new class e {
        async createAssetAndGetOperationId(t, s) {
            let r = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                n = r ? e.generateRequestInitForCreatingOpenUseAsset(t, s) : {},
                a = await f();
            a && (n.headers = {
                [p]: a
            });
            let o = await this.assetsUploadApi.assetsCreateAsset({
                request: t,
                fileContent: s
            }, n);
            return e.parseOperationId(o.path)
        }
        async createAssetAndGetOperationIdWithMultipart(t, s, r, n) {
            var a;
            let c, l, u, d, h = null != r && r ? e.generateRequestInitForCreatingOpenUseAsset(t, s) : {},
                v = await f();
            v && (h.headers = {
                [p]: v,
                "Content-Type": "application/json; charset=utf-8"
            }), n && n(1);
            try {
                let t = await e.calculateMD5(s);
                c = t.hash, l = t.data
            } catch (e) {
                throw new i("Failed to calculate MD5 for file: ".concat(e instanceof Error ? e.message : String(e)), o.MD5_CALCULATION, void 0, void 0, void 0, "MD5_CALCULATION_FAILED")
            }
            n && n(5);
            let y = e.makeUploadPlan(s.size);
            n && n(10);
            let g = {
                    asset: t,
                    file: {
                        filesize: s.size,
                        md5CheckSum: c,
                        chunkPlan: y,
                        contentType: s.type
                    }
                },
                A = [];
            try {
                u = await this.multipartUploadApi.assetsCreateAssetWithMultipartUpload({
                    multipartUploadStartRequest: g
                }, h)
            } catch (e) {
                throw new i("Failed to start multipart upload: ".concat(e instanceof Error ? e.message : String(e)), o.MULTIPART_START, void 0, void 0, e instanceof Error && "status" in e ? e.status : void 0, "MULTIPART_START_FAILED")
            }
            if (n && n(15), 0 === (A = null != (a = u.uploadUrls) ? a : []).length) throw new i("Upload URLs are empty from multipart start response", o.MULTIPART_START, void 0, void 0, void 0, "EMPTY_UPLOAD_URLS");
            let b = e.parseOperationId(u.operationPath);
            if ("" === b) throw new i("Operation ID is empty from multipart start response", o.MULTIPART_START, void 0, void 0, void 0, "EMPTY_OPERATION_ID");
            try {
                d = await e.uploadChunks(A, l, b, n ? e => {
                    n(Math.min(15 + .65 * e, 80))
                } : void 0)
            } catch (e) {
                try {
                    await this.multipartUploadApi.assetsMultipartUploadAbort({
                        operationId: b
                    }, h)
                } catch (t) {
                    throw new i("Chunk upload failed and abort also failed. Original error: ".concat(e instanceof Error ? e.message : String(e), ". Abort error: ").concat(t instanceof Error ? t.message : String(t)), o.CHUNK_UPLOAD_ABORT, b, void 0, void 0, "ABORT_FAILED")
                }
                if (e instanceof i) throw e;
                throw new i("Chunk upload failed: ".concat(e instanceof Error ? e.message : String(e)), o.CHUNK_UPLOAD, b, void 0, void 0, "CHUNK_UPLOAD_FAILED")
            }
            n && n(80);
            try {
                await Promise.all(d.map((e, t) => {
                    let s = t + 1;
                    return m(async () => {
                        try {
                            await this.multipartUploadApi.assetsMultipartUploadChunkComplete({
                                operationId: b,
                                multipartUploadChunkCompleteRequest: {
                                    chunkNum: s,
                                    eTag: e
                                }
                            }, h)
                        } catch (e) {
                            throw new i("Failed to complete chunk ".concat(s, ": ").concat(e instanceof Error ? e.message : String(e)), o.CHUNK_COMPLETE, b, s, e instanceof Error && "status" in e ? e.status : void 0, "CHUNK_COMPLETE_FAILED")
                        }
                    }, 3, e => 1e3 * 2 ** e)
                }))
            } catch (e) {
                try {
                    await this.multipartUploadApi.assetsMultipartUploadAbort({
                        operationId: b
                    }, h)
                } catch (t) {
                    throw new i("Chunk complete failed and abort also failed. Original error: ".concat(e instanceof Error ? e.message : String(e), ". Abort error: ").concat(t instanceof Error ? t.message : String(t)), o.CHUNK_COMPLETE_ABORT, b, void 0, void 0, "ABORT_FAILED")
                }
                if (e instanceof i) throw e;
                throw new i("Chunk complete failed: ".concat(e instanceof Error ? e.message : String(e)), o.CHUNK_COMPLETE, b, void 0, void 0, "CHUNK_COMPLETE_FAILED")
            }
            n && n(90);
            try {
                await this.multipartUploadApi.assetsMultipartUploadComplete({
                    operationId: b
                }, h)
            } catch (e) {
                throw new i("Failed to complete multipart upload: ".concat(e instanceof Error ? e.message : String(e)), o.MULTIPART_COMPLETE, b, void 0, e instanceof Error && "status" in e ? e.status : void 0, "MULTIPART_COMPLETE_FAILED")
            }
            return n && n(100), b
        }
        async updateAssetAndGetOperationId(t, s, r, n) {
            let a = await this.assetsUploadApi.assetsUpdateAsset({
                assetId: t,
                updateMask: s,
                request: r,
                fileContent: n
            });
            return e.parseOperationId(a.path)
        }
        async getAsset(e, t) {
            return await this.assetsUploadApi.assetsGetAsset({
                assetId: e,
                readMask: t
            })
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
                s = await t.raw.json();
            return null !== s && "object" == typeof s ? s : {}
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
            let s = new FormData;
            return s.append("request", JSON.stringify(e)), s.append("fileContent", t), s.append("additionalParameters", h), {
                body: s
            }
        }
        static async calculateMD5(e) {
            let t = await new Promise((t, s) => {
                let r = new FileReader;
                r.onload = e => {
                    var r;
                    let n = null == e || null == (r = e.target) ? void 0 : r.result;
                    n instanceof ArrayBuffer ? t(new Uint8Array(n)) : s(Error("Failed to read file"))
                }, r.onerror = () => s(r.error), r.readAsArrayBuffer(e)
            });
            return {
                hash: (0, n.md5)(t),
                data: t
            }
        }
        static makeUploadPlan(e) {
            let t = [],
                s = 0;
            for (; s < e;) {
                let r = Math.min(5242880, e - s);
                t.push(r), s += 5242880
            }
            return t
        }
        static async uploadChunks(e, t, s, r) {
            let n = e.length,
                a = 0,
                c = r ? () => {
                    r(Math.min((a += 1) / n * 100, 99))
                } : void 0,
                l = e.map((e, r) => {
                    let n = Number(e.contentStart || 0),
                        a = Number(e.contentLength || 0);
                    return m(async () => {
                        if (!(null == e ? void 0 : e.url)) throw new i("No URL found for chunk ".concat(r + 1), o.CHUNK_UPLOAD, s, r + 1, void 0, "MISSING_UPLOAD_URL");
                        let l = t.slice(n, n + a);
                        if (l.length !== a) throw new i("Chunk size mismatch for chunk ".concat(r + 1, ": expected ").concat(a, ", got ").concat(l.length), o.CHUNK_UPLOAD, s, r + 1, void 0, "CHUNK_SIZE_MISMATCH");
                        let u = await fetch(e.url, {
                            method: "PUT",
                            body: l
                        });
                        if (!u.ok) throw new i("Failed to upload chunk ".concat(r + 1, ": ").concat(u.status, " ").concat(u.statusText), o.CHUNK_UPLOAD, s, r + 1, u.status, "CHUNK_UPLOAD_HTTP_ERROR");
                        let d = u.headers.get("ETag");
                        if (!d) throw new i("No ETag received for chunk ".concat(r + 1), o.CHUNK_UPLOAD, s, r + 1, u.status, "MISSING_ETAG");
                        return c && c(), d.replaceAll(/['"]/g, "")
                    }, 3, e => 1e3 * 2 ** e)
                }),
                u = await Promise.all(l);
            return r && r(100), u
        }
        constructor() {
            (0, r._)(this, "assetsUploadApi", void 0), (0, r._)(this, "uploadStatusApi", void 0), (0, r._)(this, "multipartUploadApi", void 0);
            const e = (0, l.createClientConfiguration)("assets/user-auth", "bedev2");
            this.assetsUploadApi = new a.AssetApi(e), this.uploadStatusApi = new a.UploadStatusApi(e), this.multipartUploadApi = new a.MultipartUploadApi(e)
        }
    };
    e.s(["FieldMask", () => u, "default", 0, v], 968284)
}, 729904, e => {
    "use strict";
    e.s(["default", 0, function() {
        return "production"
    }])
}, 929286, 255382, e => {
    "use strict";
    var t = e.i(677753),
        s = function(e, t) {
            return (s = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var s in t) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s])
            })(e, t)
        };

    function r(e, t, s, r) {
        return new(s || (s = Promise))(function(n, a) {
            function o(e) {
                try {
                    c(r.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function i(e) {
                try {
                    c(r.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function c(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(o, i)
            }
            c((r = r.apply(e, t || [])).next())
        })
    }

    function n(e, t) {
        var s, r, n, a = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = i(0), o.throw = i(1), o.return = i(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function i(i) {
            return function(c) {
                var l = [i, c];
                if (s) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, l[0] && (a = 0)), a;) try {
                    if (s = 1, r && (n = 2 & l[0] ? r.return : l[0] ? r.throw || ((n = r.return) && n.call(r), 0) : r.next) && !(n = n.call(r, l[1])).done) return n;
                    switch (r = 0, n && (l = [2 & l[0], n.value]), l[0]) {
                        case 0:
                        case 1:
                            n = l;
                            break;
                        case 4:
                            return a.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            a.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = a.trys).length > 0 && n[n.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
                                a.label = l[1];
                                break
                            }
                            if (6 === l[0] && a.label < n[1]) {
                                a.label = n[1], n = l;
                                break
                            }
                            if (n && a.label < n[2]) {
                                a.label = n[2], a.ops.push(l);
                                break
                            }
                            n[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    l = t.call(e, a)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    s = n = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function a(e, s) {
        return null == e ? e : {
            status: (0, t.exists)(e, "status") ? e.status : void 0
        }
    }

    function o(e) {
        var s;
        return null == (s = e) ? s : {
            typeUrl: (0, t.exists)(s, "typeUrl") ? s.typeUrl : void 0,
            value: (0, t.exists)(s, "value") ? s.value : void 0
        }
    }

    function i(e) {
        return e
    }

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            assetId: e.assetId,
            grantToDependencies: e.grantToDependencies,
            parentVersionNumber: e.parentVersionNumber
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            subject: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    subjectType: e.subjectType,
                    subjectId: e.subjectId
                }
            }(e.subject),
            action: e.action,
            assetId: e.assetId,
            enableDeepAccessCheck: e.enableDeepAccessCheck
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            assetId: e.assetId
        }
    }

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            subjectType: e.subjectType,
            subjectId: e.subjectId,
            action: e.action
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(d),
            grantToDependencies: e.grantToDependencies,
            parentVersionNumber: e.parentVersionNumber,
            enableDeepAccessCheck: e.enableDeepAccessCheck
        }
    }

    function h(e) {
        if (void 0 !== e) return null === e ? null : {
            createAssetsAsRestricted: e.createAssetsAsRestricted
        }
    }

    function m(e) {
        var s, r;
        return null == (s = e) ? s : {
            value: (0, t.exists)(s, "value") ? null == (r = s.value) ? r : {
                status: (0, t.exists)(r, "status") ? r.status : void 0
            } : void 0,
            error: (0, t.exists)(s, "error") ? s.error : void 0
        }
    }

    function f(e) {
        var s, r;
        return null == (s = e) ? s : {
            value: (0, t.exists)(s, "value") ? null == (r = s.value) ? r : {
                isOpenUse: (0, t.exists)(r, "isOpenUse") ? r.isOpenUse : void 0
            } : void 0,
            error: (0, t.exists)(s, "error") ? s.error : void 0
        }
    }

    function v(e) {
        var s;
        return null == (s = e) ? s : {
            parentAssetId: (0, t.exists)(s, "parentAssetId") ? s.parentAssetId : void 0,
            grantedDependentAssetIds: (0, t.exists)(s, "grantedDependentAssetIds") ? s.grantedDependentAssetIds : void 0
        }
    }

    function y(e) {
        var s;
        return null == (s = e) ? s : {
            assetId: (0, t.exists)(s, "assetId") ? s.assetId : void 0,
            code: (0, t.exists)(s, "code") ? s.code : void 0
        }
    }

    function g(e) {
        var s;
        return null == (s = e) ? s : {
            action: (0, t.exists)(s, "action") ? s.action : void 0,
            assetId: (0, t.exists)(s, "assetId") ? s.assetId : void 0,
            error: (0, t.exists)(s, "error") ? s.error : void 0
        }
    }

    function A(e, s) {
        return null == e ? e : {
            creatorType: (0, t.exists)(e, "creatorType") ? e.creatorType : void 0,
            creatorId: (0, t.exists)(e, "creatorId") ? e.creatorId : void 0,
            createAssetsAsRestricted: (0, t.exists)(e, "createAssetsAsRestricted") ? e.createAssetsAsRestricted : void 0
        }
    }

    function b(e) {
        var s, r;
        return null == (s = e) ? s : {
            assetId: (0, t.exists)(s, "assetId") ? s.assetId : void 0,
            assetName: (0, t.exists)(s, "assetName") ? s.assetName : void 0,
            assetType: (0, t.exists)(s, "assetType") ? s.assetType : void 0,
            accessStatus: (0, t.exists)(s, "accessStatus") ? s.accessStatus : void 0,
            creator: (0, t.exists)(s, "creator") ? null == (r = s.creator) ? r : {
                type: (0, t.exists)(r, "type") ? r.type : void 0,
                id: (0, t.exists)(r, "id") ? r.id : void 0
            } : void 0
        }
    }

    function w(e) {
        var s;
        return null == (s = e) ? s : {
            action: (0, t.exists)(s, "action") ? s.action : void 0,
            subjectId: (0, t.exists)(s, "subjectId") ? s.subjectId : void 0,
            subjectType: (0, t.exists)(s, "subjectType") ? s.subjectType : void 0,
            permissionLevel: (0, t.exists)(s, "permissionLevel") ? s.permissionLevel : void 0,
            permissionSource: (0, t.exists)(s, "permissionSource") ? s.permissionSource : void 0
        }
    }

    function C(e, s) {
        return null == e ? e : {
            isEligible: (0, t.exists)(e, "isEligible") ? e.isEligible : void 0
        }
    }

    function P(e) {
        var s;
        return null == (s = e) ? s : {
            action: (0, t.exists)(s, "action") ? s.action : void 0,
            assetId: (0, t.exists)(s, "assetId") ? s.assetId : void 0
        }
    }
    var I = function(e) {
        function d() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function r() {
                this.constructor = e
            }
            s(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
        }(d, e), d.prototype.assetPermissionsBatchCheckAssetPermissionsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return r = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/assets/check-permissions",
                                schemaPath: "/v1/assets/check-permissions",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(l)
                                    }
                                }(e.assetPermissionsBatchCheckAssetPermissionsRequest)
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    results: (0, t.exists)(e, "results") ? null === e.results ? null : e.results.map(m) : void 0
                                }
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsBatchCheckAssetPermissions = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsBatchCheckAssetPermissionsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsBatchGetAssetAccessPropertiesRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return r = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/assets/access-properties",
                                schemaPath: "/v1/assets/access-properties",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(u)
                                    }
                                }(e.assetPermissionsBatchGetAssetAccessPropertiesRequest)
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    results: (0, t.exists)(e, "results") ? null === e.results ? null : e.results.map(f) : void 0
                                }
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsBatchGetAssetAccessProperties = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsBatchGetAssetAccessPropertiesRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsBatchGrantPermissionsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return r = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/assets/permissions",
                                schemaPath: "/v1/assets/permissions",
                                method: "PATCH",
                                headers: a,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        subjectType: e.subjectType,
                                        subjectId: e.subjectId,
                                        action: e.action,
                                        assetIds: e.assetIds,
                                        enableDeepAccessCheck: e.enableDeepAccessCheck,
                                        requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(c)
                                    }
                                }(e.assetPermissionsBatchGrantPermissionsRequest)
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    successAssetIds: (0, t.exists)(e, "successAssetIds") ? e.successAssetIds : void 0,
                                    dependenciesGrantResults: (0, t.exists)(e, "dependenciesGrantResults") ? null === e.dependenciesGrantResults ? null : e.dependenciesGrantResults.map(v) : void 0,
                                    errors: (0, t.exists)(e, "errors") ? null === e.errors ? null : e.errors.map(y) : void 0
                                }
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsBatchGrantPermissions = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsBatchGrantPermissionsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsCheckActionsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return r = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/assets/check-actions",
                                schemaPath: "/v1/assets/check-actions",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        actions: void 0 === e.actions ? void 0 : null === e.actions ? null : e.actions.map(i),
                                        assetIds: e.assetIds
                                    }
                                }(e.assetPermissionsCheckActionsRequest)
                            }, s)];
                        case 1:
                            return o = n.sent(), this.isJsonMime(o.headers.get("content-type")) ? [2, new t.JSONApiResponse(o)] : [2, new t.TextApiResponse(o)]
                    }
                })
            })
        }, d.prototype.assetPermissionsCheckActions = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsCheckActionsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsCopyAssetPermissionsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling assetPermissionsCopyAssetPermissions.");
                            return r = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/universes/{universeId}/permissions:copyInto".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/permissions:copyInto",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        sourceUniverseId: e.sourceUniverseId
                                    }
                                }(e.assetPermissionsCopyAssetPermissionsRequest)
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    operationId: (0, t.exists)(e, "operationId") ? e.operationId : void 0
                                }
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsCopyAssetPermissions = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsCopyAssetPermissionsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetActionGatingStatusRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, o, i;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsGetActionGatingStatus.");
                            return r = {}, o = {}, [4, this.request({
                                path: "/v1/assets/{assetId}/eligibility-status".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/eligibility-status",
                                method: "GET",
                                headers: o,
                                query: r
                            }, s)];
                        case 1:
                            return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    canBeDistributedOnStore: (0, t.exists)(e, "CanBeDistributedOnStore") ? a(e.CanBeDistributedOnStore) : void 0,
                                    canBeShared: (0, t.exists)(e, "CanBeShared") ? a(e.CanBeShared) : void 0,
                                    canBeSetToOpenUse: (0, t.exists)(e, "CanBeSetToOpenUse") ? a(e.CanBeSetToOpenUse) : void 0,
                                    metadataState: (0, t.exists)(e, "MetadataState") ? e.MetadataState : void 0
                                }
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetActionGatingStatus = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsGetActionGatingStatusRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetAssetDependenciesRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsGetAssetDependencies.");
                            return r = {}, void 0 !== e.versionNumber && (r.versionNumber = e.versionNumber), void 0 !== e.dependenciesDegree && (r.dependenciesDegree = e.dependenciesDegree), void 0 !== e.includeAccessStatus && (r.includeAccessStatus = e.includeAccessStatus), void 0 !== e.maxPageSize && (r.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (r.pageToken = e.pageToken), void 0 !== e.returnCountOnly && (r.returnCountOnly = e.returnCountOnly), a = {}, [4, this.request({
                                path: "/v1/assets/{assetId}/dependencies".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/dependencies",
                                method: "GET",
                                headers: a,
                                query: r
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    results: (0, t.exists)(e, "results") ? null === e.results ? null : e.results.map(b) : void 0,
                                    hasMore: (0, t.exists)(e, "hasMore") ? e.hasMore : void 0,
                                    nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0,
                                    dependenciesCount: (0, t.exists)(e, "dependenciesCount") ? e.dependenciesCount : void 0
                                }
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetAssetDependencies = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsGetAssetDependenciesRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetAssetPermissionsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsGetAssetPermissions.");
                            return r = {}, a = {}, [4, this.request({
                                path: "/v1/assets/{assetId}/permissions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/permissions",
                                method: "GET",
                                headers: a,
                                query: r
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    results: (0, t.exists)(e, "results") ? null === e.results ? null : e.results.map(w) : void 0
                                }
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetAssetPermissions = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsGetAssetPermissionsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetGroupSettingsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling assetPermissionsGetGroupSettings.");
                            return r = {}, a = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/settings".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/settings",
                                method: "GET",
                                headers: a,
                                query: r
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return A(e)
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetGroupSettings = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsGetGroupSettingsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetIsGroupEligibleForBetaRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling assetPermissionsGetIsGroupEligibleForBeta.");
                            return r = {}, a = {}, [4, this.request({
                                path: "/v1/is-group-eligible-for-beta/{groupId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/is-group-eligible-for-beta/{groupId}",
                                method: "GET",
                                headers: a,
                                query: r
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return C(e)
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetIsGroupEligibleForBeta = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsGetIsGroupEligibleForBetaRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetIsUserEligibleForBetaRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling assetPermissionsGetIsUserEligibleForBeta.");
                            return r = {}, a = {}, [4, this.request({
                                path: "/v1/is-user-eligible-for-beta/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/is-user-eligible-for-beta/{userId}",
                                method: "GET",
                                headers: a,
                                query: r
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return C(e)
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetIsUserEligibleForBeta = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsGetIsUserEligibleForBetaRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetOperationStatusRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, i;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetPermissionsGetOperationStatus.");
                            return r = {}, a = {}, [4, this.request({
                                path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                schemaPath: "/v1/operations/{operationId}",
                                method: "GET",
                                headers: a,
                                query: r
                            }, s)];
                        case 1:
                            return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                var s, r;
                                return null == e ? e : {
                                    path: (0, t.exists)(e, "path") ? e.path : void 0,
                                    operationId: (0, t.exists)(e, "operationId") ? e.operationId : void 0,
                                    done: (0, t.exists)(e, "done") ? e.done : void 0,
                                    error: (0, t.exists)(e, "error") ? null == (s = e.error) ? s : {
                                        code: (0, t.exists)(s, "code") ? s.code : void 0,
                                        message: (0, t.exists)(s, "message") ? s.message : void 0,
                                        details: (0, t.exists)(s, "details") ? null === s.details ? null : s.details.map(o) : void 0
                                    } : void 0,
                                    response: (0, t.exists)(e, "response") ? null == (r = e.response) ? r : {
                                        errors: (0, t.exists)(r, "errors") ? null === r.errors ? null : r.errors.map(g) : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetOperationStatus = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsGetOperationStatusRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetUserSettingsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling assetPermissionsGetUserSettings.");
                            return r = {}, a = {}, [4, this.request({
                                path: "/v1/users/{userId}/settings".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/settings",
                                method: "GET",
                                headers: a,
                                query: r
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return A(e)
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsGetUserSettings = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsGetUserSettingsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsGrantAssetPermissionsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsGrantAssetPermissions.");
                            return r = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/assets/{assetId}/permissions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/permissions",
                                method: "PATCH",
                                headers: a,
                                query: r,
                                body: p(e.assetPermissionsRevokeAssetPermissionsRequest)
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o)]
                    }
                })
            })
        }, d.prototype.assetPermissionsGrantAssetPermissions = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsGrantAssetPermissionsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsListUniverseAssetPermissionsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling assetPermissionsListUniverseAssetPermissions.");
                            return r = {}, void 0 !== e.maxPageSize && (r.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (r.pageToken = e.pageToken), a = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/assets".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/assets",
                                method: "GET",
                                headers: a,
                                query: r
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    results: (0, t.exists)(e, "results") ? null === e.results ? null : e.results.map(P) : void 0,
                                    nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsListUniverseAssetPermissions = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsListUniverseAssetPermissionsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsRevokeAssetPermissionsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsRevokeAssetPermissions.");
                            return r = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/assets/{assetId}/permissions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/permissions",
                                method: "DELETE",
                                headers: a,
                                query: r,
                                body: p(e.assetPermissionsRevokeAssetPermissionsRequest)
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o)]
                    }
                })
            })
        }, d.prototype.assetPermissionsRevokeAssetPermissions = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsRevokeAssetPermissionsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsUpdateGroupSettingsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling assetPermissionsUpdateGroupSettings.");
                            return r = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/settings".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/settings",
                                method: "PATCH",
                                headers: a,
                                query: r,
                                body: h(e.assetPermissionsUpdateUserSettingsRequest)
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return A(e)
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsUpdateGroupSettings = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsUpdateGroupSettingsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d.prototype.assetPermissionsUpdateUserSettingsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling assetPermissionsUpdateUserSettings.");
                            return r = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/users/{userId}/settings".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/settings",
                                method: "PATCH",
                                headers: a,
                                query: r,
                                body: h(e.assetPermissionsUpdateUserSettingsRequest)
                            }, s)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return A(e)
                            })]
                    }
                })
            })
        }, d.prototype.assetPermissionsUpdateUserSettings = function(e, t) {
            return r(this, void 0, void 0, function() {
                return n(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.assetPermissionsUpdateUserSettingsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, d
    }(t.BaseAPI);
    e.s(["AccessStatus", 0, {
        Restricted: "Restricted",
        OpenUse: "OpenUse"
    }, "ApiPermissionStatus", 0, {
        UnknownError: "UnknownError",
        HasPermission: "HasPermission",
        NoPermission: "NoPermission",
        AssetNotFound: "AssetNotFound"
    }, "AssetConsumerAction", 0, {
        Invalid: "Invalid",
        Edit: "Edit",
        Use: "Use",
        Download: "Download",
        CreateAssetVersion: "CreateAssetVersion",
        UpdateAssetText: "UpdateAssetText",
        GrantAssetPermissions: "GrantAssetPermissions",
        CreateAssetFromAsset: "CreateAssetFromAsset",
        CopyFromRcc: "CopyFromRcc",
        UpdateFromRcc: "UpdateFromRcc"
    }, "AssetGrantableAction", 0, {
        Invalid: "Invalid",
        Edit: "Edit",
        Download: "Download",
        Use: "Use",
        CopyFromRcc: "CopyFromRcc",
        UpdateFromRcc: "UpdateFromRcc"
    }, "AssetPermissionsApi", 0, I, "AssetType", 0, {
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
        Screenshot: "Screenshot"
    }, "CreatorType", 0, {
        Invalid: "Invalid",
        User: "User",
        Group: "Group"
    }, "ErrorCode", 0, {
        UnknownError: "UnknownError",
        InvalidRequest: "InvalidRequest",
        AssetNotFound: "AssetNotFound",
        CannotManageAsset: "CannotManageAsset",
        PublicAssetCannotBeGrantedTo: "PublicAssetCannotBeGrantedTo",
        CannotManageSubject: "CannotManageSubject",
        SubjectNotFound: "SubjectNotFound",
        AssetTypeNotEnabled: "AssetTypeNotEnabled",
        PermissionLimitReached: "PermissionLimitReached"
    }, "SubjectType", 0, {
        Invalid: "Invalid",
        User: "User",
        Group: "Group",
        GroupRoleset: "GroupRoleset",
        All: "All",
        Universe: "Universe"
    }], 929286);
    let S = new I((0, e.i(272593).createClientConfiguration)("asset-permissions-api", "bedev2"));
    e.s(["default", 0, {
        async batchCheckAssetPermissions(e) {
            let t = {
                requests: e.map(e => ({
                    action: e.permissionType,
                    assetId: e.assetId,
                    subject: {
                        subjectId: e.subjectId,
                        subjectType: e.subject
                    }
                }))
            };
            return (await S.assetPermissionsBatchCheckAssetPermissions({
                assetPermissionsBatchCheckAssetPermissionsRequest: t
            })).results
        },
        async getAssetDependencies(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                s = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
            return await S.assetPermissionsGetAssetDependencies({
                assetId: e,
                includeAccessStatus: t,
                returnCountOnly: s
            })
        },
        getAssetEligibilityStatus: async e => await S.assetPermissionsGetActionGatingStatus({
            assetId: e
        }),
        getAssetPermissions: async e => (await S.assetPermissionsGetAssetPermissions({
            assetId: e
        })).results,
        grantAssetPermissions(e, t, s, r, n) {
            let a = {
                assetId: e
            };
            return t && (a.assetPermissionsRevokeAssetPermissionsRequest = {
                requests: t,
                grantToDependencies: s,
                parentVersionNumber: r,
                enableDeepAccessCheck: n
            }), S.assetPermissionsGrantAssetPermissions(a)
        },
        listUniverseAssetPermissions: (e, t, s) => S.assetPermissionsListUniverseAssetPermissions({
            universeId: e,
            maxPageSize: t,
            pageToken: s
        }),
        batchGrantAssetPermissions: (e, t, s, r, n, a, o) => S.assetPermissionsBatchGrantPermissions({
            assetPermissionsBatchGrantPermissionsRequest: o ? {
                requests: t,
                enableDeepAccessCheck: s,
                subjectId: n,
                subjectType: r,
                action: a
            } : {
                assetIds: e,
                subjectId: n,
                subjectType: r,
                action: a
            }
        }),
        revokeAssetPermissions(e, t) {
            let s = {
                assetId: e
            };
            return t && (s.assetPermissionsRevokeAssetPermissionsRequest = {
                requests: t
            }), S.assetPermissionsRevokeAssetPermissions(s)
        },
        getUserPermissionSettings: async e => await S.assetPermissionsGetUserSettings({
            userId: e
        }),
        getGroupPermissionSettings: async e => await S.assetPermissionsGetGroupSettings({
            groupId: e
        }),
        updateUserPermissionSettings: async (e, t) => S.assetPermissionsUpdateUserSettings({
            userId: e,
            assetPermissionsUpdateUserSettingsRequest: t
        }),
        updateGroupPermissionSettings: async (e, t) => S.assetPermissionsUpdateGroupSettings({
            groupId: e,
            assetPermissionsUpdateUserSettingsRequest: t
        }),
        batchGetAssetAccessProperties: async e => await S.assetPermissionsBatchGetAssetAccessProperties({
            assetPermissionsBatchGetAssetAccessPropertiesRequest: {
                requests: e
            }
        })
    }], 255382)
}, 627292, e => {
    "use strict";
    var t = e.i(485745);
    e.s(["accordionSummaryClasses", () => t.a])
}, 736186, e => {
    "use strict";
    var t = e.i(516367);
    e.s(["buttonClasses", () => t.b])
}, 438004, e => {
    "use strict";
    var t = e.i(416340);
    e.i(273589);
    var s = e.i(221628),
        r = e.i(969708);
    e.i(309742), e.s(["N", 0, function(e) {
        let {
            children: n,
            defer: a = !1,
            fallback: o = null
        } = e, [i, c] = t.useState(!1);
        return (0, r.u)(() => {
            a || c(!0)
        }, [a]), t.useEffect(() => {
            a && c(!0)
        }, [a]), (0, s.jsx)(t.Fragment, {
            children: i ? n : o
        })
    }])
}, 517379, e => {
    "use strict";
    var t = e.i(865800),
        s = e.i(416340);

    function r(e) {
        return "small" === e ? 16 : 20
    }

    function n(e) {
        return "small" === e ? 18 : 24
    }
    var a = e.i(614515),
        o = e.i(993807),
        i = e.i(696180),
        c = e.i(273589),
        l = e.i(549534),
        u = e.i(962560),
        d = e.i(42569),
        p = e.i(576881),
        h = e.i(221628),
        m = e.i(963320);

    function f(e) {
        return (0, c.g)("MuiSwitch", e)
    }
    e.i(197094);
    var v = (0, i.g)("MuiSwitch", ["root", "edgeStart", "edgeEnd", "switchBase", "colorPrimary", "colorSecondary", "sizeSmall", "sizeMedium", "checked", "disabled", "input", "thumb", "track"]);
    let y = ["className", "color", "edge", "size", "sx"],
        g = (0, d.s)("span", {
            name: "MuiSwitch",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: s
                } = e;
                return [t.root, s.edge && t["edge".concat((0, c.a)(s.edge))], t["size".concat((0, c.a)(s.size))]]
            }
        })({
            display: "inline-flex",
            width: 58,
            height: 38,
            overflow: "hidden",
            padding: 12,
            boxSizing: "border-box",
            position: "relative",
            flexShrink: 0,
            zIndex: 0,
            verticalAlign: "middle",
            "@media print": {
                colorAdjust: "exact"
            },
            variants: [{
                props: {
                    edge: "start"
                },
                style: {
                    marginLeft: -8
                }
            }, {
                props: {
                    edge: "end"
                },
                style: {
                    marginRight: -8
                }
            }, {
                props: {
                    size: "small"
                },
                style: {
                    width: 40,
                    height: 24,
                    padding: 7,
                    ["& .".concat(v.thumb)]: {
                        width: 16,
                        height: 16
                    },
                    ["& .".concat(v.switchBase)]: {
                        padding: 4,
                        ["&.".concat(v.checked)]: {
                            transform: "translateX(16px)"
                        }
                    }
                }
            }]
        }),
        A = (0, d.s)(p.S, {
            name: "MuiSwitch",
            slot: "SwitchBase",
            overridesResolver: (e, t) => {
                let {
                    ownerState: s
                } = e;
                return [t.switchBase, {
                    ["& .".concat(v.input)]: t.input
                }, "default" !== s.color && t["color".concat((0, c.a)(s.color))]]
            }
        })(e => {
            let {
                theme: t
            } = e;
            return {
                position: "absolute",
                top: 0,
                left: 0,
                zIndex: 1,
                color: t.vars ? t.vars.palette.Switch.defaultColor : "".concat("light" === t.palette.mode ? t.palette.common.white : t.palette.grey[300]),
                transition: t.transitions.create(["left", "transform"], {
                    duration: t.transitions.duration.shortest
                }),
                ["&.".concat(v.checked)]: {
                    transform: "translateX(20px)"
                },
                ["&.".concat(v.disabled)]: {
                    color: t.vars ? t.vars.palette.Switch.defaultDisabledColor : "".concat("light" === t.palette.mode ? t.palette.grey[100] : t.palette.grey[600])
                },
                ["&.".concat(v.checked, " + .").concat(v.track)]: {
                    opacity: .5
                },
                ["&.".concat(v.disabled, " + .").concat(v.track)]: {
                    opacity: t.vars ? t.vars.opacity.switchTrackDisabled : "" + ("light" === t.palette.mode ? .12 : .2)
                },
                ["& .".concat(v.input)]: {
                    left: "-100%",
                    width: "300%"
                }
            }
        }, e => {
            let {
                theme: t
            } = e;
            return {
                "&:hover": {
                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette.action.activeChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, c.b)(t.palette.action.active, t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                },
                variants: [...Object.entries(t.palette).filter(e => {
                    let [, t] = e;
                    return t.main && t.light
                }).map(e => {
                    let [s] = e;
                    return {
                        props: {
                            color: s
                        },
                        style: {
                            ["&.".concat(v.checked)]: {
                                color: (t.vars || t).palette[s].main,
                                "&:hover": {
                                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette[s].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, c.b)(t.palette[s].main, t.palette.action.hoverOpacity),
                                    "@media (hover: none)": {
                                        backgroundColor: "transparent"
                                    }
                                },
                                ["&.".concat(v.disabled)]: {
                                    color: t.vars ? t.vars.palette.Switch["".concat(s, "DisabledColor")] : "".concat("light" === t.palette.mode ? (0, c.l)(t.palette[s].main, .62) : (0, c.j)(t.palette[s].main, .55))
                                }
                            },
                            ["&.".concat(v.checked, " + .").concat(v.track)]: {
                                backgroundColor: (t.vars || t).palette[s].main
                            }
                        }
                    }
                })]
            }
        }),
        b = (0, d.s)("span", {
            name: "MuiSwitch",
            slot: "Track",
            overridesResolver: (e, t) => t.track
        })(e => {
            let {
                theme: t
            } = e;
            return {
                height: "100%",
                width: "100%",
                borderRadius: 7,
                zIndex: -1,
                transition: t.transitions.create(["opacity", "background-color"], {
                    duration: t.transitions.duration.shortest
                }),
                backgroundColor: t.vars ? t.vars.palette.common.onBackground : "".concat("light" === t.palette.mode ? t.palette.common.black : t.palette.common.white),
                opacity: t.vars ? t.vars.opacity.switchTrack : "" + ("light" === t.palette.mode ? .38 : .3)
            }
        }),
        w = (0, d.s)("span", {
            name: "MuiSwitch",
            slot: "Thumb",
            overridesResolver: (e, t) => t.thumb
        })(e => {
            let {
                theme: t
            } = e;
            return {
                boxShadow: (t.vars || t).shadows[1],
                backgroundColor: "currentColor",
                width: 20,
                height: 20,
                borderRadius: "50%"
            }
        }),
        C = s.forwardRef(function(e, t) {
            let s = (0, m.u)({
                    props: e,
                    name: "MuiSwitch"
                }),
                {
                    className: r,
                    color: n = "primary",
                    edge: a = !1,
                    size: o = "medium",
                    sx: i
                } = s,
                l = (0, c._)(s, y),
                p = (0, u._)({}, s, {
                    color: n,
                    edge: a,
                    size: o
                }),
                v = (e => {
                    let {
                        classes: t,
                        edge: s,
                        size: r,
                        color: n,
                        checked: a,
                        disabled: o
                    } = e, i = {
                        root: ["root", s && "edge".concat((0, c.a)(s)), "size".concat((0, c.a)(r))],
                        switchBase: ["switchBase", "color".concat((0, c.a)(n)), a && "checked", o && "disabled"],
                        thumb: ["thumb"],
                        track: ["track"],
                        input: ["input"]
                    }, l = (0, d.a)(i, f, t);
                    return (0, u._)({}, t, l)
                })(p),
                C = (0, h.jsx)(w, {
                    className: v.thumb,
                    ownerState: p
                });
            return (0, h.jsxs)(g, {
                className: (0, d.c)(v.root, r),
                sx: i,
                ownerState: p,
                children: [(0, h.jsx)(A, (0, u._)({
                    type: "checkbox",
                    icon: C,
                    checkedIcon: C,
                    ref: t,
                    ownerState: p
                }, l, {
                    classes: (0, u._)({}, v, {
                        root: v.switchBase
                    })
                })), (0, h.jsx)(b, {
                    className: v.track,
                    ownerState: p
                })]
            })
        });
    var P = (0, a.default)({
            name: "Switch"
        })(function(e, t, s) {
            var a, o, i, c, u = t.size;
            return {
                root: ((a = {})["&:has(> .".concat(v.colorPrimary, ".").concat(v.disabled, ".").concat(v.checked, ")")] = {
                    opacity: .5
                }, a["&:has(> .".concat(v.colorSecondary, ".").concat(v.disabled, ")")] = {
                    opacity: .5
                }, a),
                switchBase: ((o = {
                    color: e.palette.actionV2.primary.fill
                })["&.".concat(v.checked, " + .").concat(v.track, ".").concat(s.track)] = {
                    opacity: .38
                }, o["&.".concat(v.disabled, " + .").concat(v.track, ".").concat(s.track)] = {
                    opacity: .38
                }, o),
                thumb: {
                    position: "relative",
                    pointerEvents: "none",
                    width: r(u),
                    height: r(u),
                    borderRadius: "50%",
                    boxShadow: e.elevation.subtle
                },
                track: {
                    opacity: .38
                },
                progress: {
                    color: e.palette.actionV2.primaryBrand.fill,
                    position: "absolute",
                    top: (r(u) - n(u)) / 2,
                    left: (r(u) - n(u)) / 2,
                    zIndex: 1
                },
                colorPrimary: ((i = {})["& .".concat(v.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, i["& .".concat(v.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, i["&.".concat(v.checked, " .").concat(v.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, i["&.".concat(v.checked, " .").concat(v.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill,
                    opacity: .38
                }, i["&.".concat(v.checked, " .").concat(l.c.root)] = {
                    color: e.palette.actionV2.primary.fill
                }, i["&.".concat(v.disabled, " .").concat(v.thumb)] = {
                    background: e.palette.components.switch.disabledKnob
                }, i["&.".concat(v.disabled, " .").concat(v.track)] = {
                    background: e.palette.components.switch.slideFill
                }, i["&.".concat(v.disabled, ".").concat(v.checked, " .").concat(v.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, i["&.".concat(v.disabled, ".").concat(v.checked, " .").concat(v.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, i["&.".concat(v.disabled, " .").concat(l.c.root)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, i),
                colorSecondary: ((c = {})["& .".concat(v.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, c["& .".concat(v.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, c)
            }
        }),
        I = (0, s.forwardRef)(function(e, a) {
            var i, c = e.classes,
                u = e.color,
                d = e.loading,
                p = e.size,
                h = e.checkedIcon,
                m = e.icon,
                f = e["aria-label"],
                y = e.inputProps,
                g = e.className,
                A = (0, t.a)(e, ["classes", "color", "loading", "size", "checkedIcon", "icon", "aria-label", "inputProps", "className"]),
                b = P((0, t._)((0, t._)({}, A), {
                    loading: d,
                    size: p,
                    checkedIcon: h,
                    icon: m,
                    "aria-label": f
                }), {
                    props: {
                        classes: (0, o.default)(c, g)
                    }
                }).classes,
                w = b.thumb,
                I = b.progress,
                S = (0, t.a)(b, ["thumb", "progress"]),
                k = s.default.createElement("div", {
                    className: "".concat(v.thumb, " ").concat(w)
                }, d && s.default.createElement(l.C, {
                    thickness: ((i = n(p)) - r(p)) * 44 / (2 * i),
                    size: n(p),
                    classes: {
                        root: I
                    }
                }));
            return s.default.createElement(C, (0, t._)({}, A, {
                checkedIcon: null != h ? h : k,
                classes: S,
                color: void 0 === u ? "primary" : u,
                icon: null != m ? m : k,
                ref: a,
                size: p,
                inputProps: (0, t._)((0, t._)({}, y), {
                    "aria-label": f
                })
            }))
        });
    e.s(["Switch", 0, I], 517379)
}, 408068, (e, t, s) => {
    var r = e.i(2226);
    ! function() {
        "use strict";
        var s = "input is invalid type",
            n = "object" == typeof window,
            a = n ? window : {};
        a.JS_MD5_NO_WINDOW && (n = !1);
        var o = !n && "object" == typeof self,
            i = !a.JS_MD5_NO_NODE_JS && "object" == typeof r.default && r.default.versions && r.default.versions.node;
        i ? a = e.g : o && (a = self);
        var c, l = !a.JS_MD5_NO_COMMON_JS && t.exports,
            u = "function" == typeof define && define.amd,
            d = !a.JS_MD5_NO_ARRAY_BUFFER && "u" > typeof ArrayBuffer,
            p = "0123456789abcdef".split(""),
            h = [128, 32768, 8388608, -0x80000000],
            m = [0, 8, 16, 24],
            f = ["hex", "array", "digest", "buffer", "arrayBuffer", "base64"],
            v = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".split(""),
            y = [];
        if (d) {
            var g = new ArrayBuffer(68);
            c = new Uint8Array(g), y = new Uint32Array(g)
        }
        var A = Array.isArray;
        (a.JS_MD5_NO_NODE_JS || !A) && (A = function(e) {
            return "[object Array]" === Object.prototype.toString.call(e)
        });
        var b = ArrayBuffer.isView;
        d && (a.JS_MD5_NO_ARRAY_BUFFER_IS_VIEW || !b) && (b = function(e) {
            return "object" == typeof e && e.buffer && e.buffer.constructor === ArrayBuffer
        });
        var w = function(e) {
                var t = typeof e;
                if ("string" === t) return [e, !0];
                if ("object" !== t || null === e) throw Error(s);
                if (d && e.constructor === ArrayBuffer) return [new Uint8Array(e), !1];
                if (!A(e) && !b(e)) throw Error(s);
                return [e, !1]
            },
            C = function(e) {
                return function(t) {
                    return new S(!0).update(t)[e]()
                }
            },
            P = function(e) {
                var t, r = {},
                    n = void 0;
                return t = n.from && !a.JS_MD5_NO_BUFFER_FROM ? n.from : function(e) {
                        return new n(e)
                    },
                    function(a) {
                        if ("string" == typeof a) return r.createHash("md5").update(a, "utf8").digest("hex");
                        if (null == a) throw Error(s);
                        return a.constructor === ArrayBuffer && (a = new Uint8Array(a)), A(a) || b(a) || a.constructor === n ? r.createHash("md5").update(t(a)).digest("hex") : e(a)
                    }
            },
            I = function(e) {
                return function(t, s) {
                    return new k(t, !0).update(s)[e]()
                }
            };

        function S(e) {
            if (e) y[0] = y[16] = y[1] = y[2] = y[3] = y[4] = y[5] = y[6] = y[7] = y[8] = y[9] = y[10] = y[11] = y[12] = y[13] = y[14] = y[15] = 0, this.blocks = y, this.buffer8 = c;
            else if (d) {
                var t = new ArrayBuffer(68);
                this.buffer8 = new Uint8Array(t), this.blocks = new Uint32Array(t)
            } else this.blocks = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            this.h0 = this.h1 = this.h2 = this.h3 = this.start = this.bytes = this.hBytes = 0, this.finalized = this.hashed = !1, this.first = !0
        }

        function k(e, t) {
            var s, r = w(e);
            if (e = r[0], r[1]) {
                var n, a = [],
                    o = e.length,
                    i = 0;
                for (s = 0; s < o; ++s)(n = e.charCodeAt(s)) < 128 ? a[i++] = n : (n < 2048 ? a[i++] = 192 | n >>> 6 : (n < 55296 || n >= 57344 ? a[i++] = 224 | n >>> 12 : (n = 65536 + ((1023 & n) << 10 | 1023 & e.charCodeAt(++s)), a[i++] = 240 | n >>> 18, a[i++] = 128 | n >>> 12 & 63), a[i++] = 128 | n >>> 6 & 63), a[i++] = 128 | 63 & n);
                e = a
            }
            e.length > 64 && (e = new S(!0).update(e).array());
            var c = [],
                l = [];
            for (s = 0; s < 64; ++s) {
                var u = e[s] || 0;
                c[s] = 92 ^ u, l[s] = 54 ^ u
            }
            S.call(this, t), this.update(l), this.oKeyPad = c, this.inner = !0, this.sharedMemory = t
        }
        S.prototype.update = function(e) {
            if (this.finalized) throw Error("finalize already called");
            var t = w(e);
            e = t[0];
            for (var s, r, n = t[1], a = 0, o = e.length, i = this.blocks, c = this.buffer8; a < o;) {
                if (this.hashed && (this.hashed = !1, i[0] = i[16], i[16] = i[1] = i[2] = i[3] = i[4] = i[5] = i[6] = i[7] = i[8] = i[9] = i[10] = i[11] = i[12] = i[13] = i[14] = i[15] = 0), n)
                    if (d)
                        for (r = this.start; a < o && r < 64; ++a)(s = e.charCodeAt(a)) < 128 ? c[r++] = s : (s < 2048 ? c[r++] = 192 | s >>> 6 : (s < 55296 || s >= 57344 ? c[r++] = 224 | s >>> 12 : (s = 65536 + ((1023 & s) << 10 | 1023 & e.charCodeAt(++a)), c[r++] = 240 | s >>> 18, c[r++] = 128 | s >>> 12 & 63), c[r++] = 128 | s >>> 6 & 63), c[r++] = 128 | 63 & s);
                    else
                        for (r = this.start; a < o && r < 64; ++a)(s = e.charCodeAt(a)) < 128 ? i[r >>> 2] |= s << m[3 & r++] : (s < 2048 ? i[r >>> 2] |= (192 | s >>> 6) << m[3 & r++] : (s < 55296 || s >= 57344 ? i[r >>> 2] |= (224 | s >>> 12) << m[3 & r++] : (s = 65536 + ((1023 & s) << 10 | 1023 & e.charCodeAt(++a)), i[r >>> 2] |= (240 | s >>> 18) << m[3 & r++], i[r >>> 2] |= (128 | s >>> 12 & 63) << m[3 & r++]), i[r >>> 2] |= (128 | s >>> 6 & 63) << m[3 & r++]), i[r >>> 2] |= (128 | 63 & s) << m[3 & r++]);
                else if (d)
                    for (r = this.start; a < o && r < 64; ++a) c[r++] = e[a];
                else
                    for (r = this.start; a < o && r < 64; ++a) i[r >>> 2] |= e[a] << m[3 & r++];
                this.lastByteIndex = r, this.bytes += r - this.start, r >= 64 ? (this.start = r - 64, this.hash(), this.hashed = !0) : this.start = r
            }
            return this.bytes > 0xffffffff && (this.hBytes += this.bytes / 0x100000000 | 0, this.bytes = this.bytes % 0x100000000), this
        }, S.prototype.finalize = function() {
            if (!this.finalized) {
                this.finalized = !0;
                var e = this.blocks,
                    t = this.lastByteIndex;
                e[t >>> 2] |= h[3 & t], t >= 56 && (this.hashed || this.hash(), e[0] = e[16], e[16] = e[1] = e[2] = e[3] = e[4] = e[5] = e[6] = e[7] = e[8] = e[9] = e[10] = e[11] = e[12] = e[13] = e[14] = e[15] = 0), e[14] = this.bytes << 3, e[15] = this.hBytes << 3 | this.bytes >>> 29, this.hash()
            }
        }, S.prototype.hash = function() {
            var e, t, s, r, n, a, o = this.blocks;
            this.first ? (s = ((s = (-0x10325477 ^ (r = ((r = (-0x67452302 ^ 0x77777777 & (e = ((e = o[0] - 0x28955b89) << 7 | e >>> 25) - 0x10325477 | 0)) + o[1] - 0x705f434) << 12 | r >>> 20) + e | 0) & (-0x10325477 ^ e)) + o[2] - 0x4324b227) << 17 | s >>> 15) + r | 0, t = ((t = (e ^ s & (r ^ e)) + o[3] - 0x4e748589) << 22 | t >>> 10) + s | 0) : (e = this.h0, t = this.h1, s = this.h2, e += ((r = this.h3) ^ t & (s ^ r)) + o[0] - 0x28955b88, r += (s ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ s)) + o[1] - 0x173848aa, s += (t ^ (r = (r << 12 | r >>> 20) + e | 0) & (e ^ t)) + o[2] + 0x242070db, t += (e ^ (s = (s << 17 | s >>> 15) + r | 0) & (r ^ e)) + o[3] - 0x3e423112, t = (t << 22 | t >>> 10) + s | 0), e += (r ^ t & (s ^ r)) + o[4] - 0xa83f051, r += (s ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ s)) + o[5] + 0x4787c62a, s += (t ^ (r = (r << 12 | r >>> 20) + e | 0) & (e ^ t)) + o[6] - 0x57cfb9ed, t += (e ^ (s = (s << 17 | s >>> 15) + r | 0) & (r ^ e)) + o[7] - 0x2b96aff, e += (r ^ (t = (t << 22 | t >>> 10) + s | 0) & (s ^ r)) + o[8] + 0x698098d8, r += (s ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ s)) + o[9] - 0x74bb0851, s += (t ^ (r = (r << 12 | r >>> 20) + e | 0) & (e ^ t)) + o[10] - 42063, t += (e ^ (s = (s << 17 | s >>> 15) + r | 0) & (r ^ e)) + o[11] - 0x76a32842, e += (r ^ (t = (t << 22 | t >>> 10) + s | 0) & (s ^ r)) + o[12] + 0x6b901122, r += (s ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ s)) + o[13] - 0x2678e6d, s += (t ^ (r = (r << 12 | r >>> 20) + e | 0) & (e ^ t)) + o[14] - 0x5986bc72, t += (e ^ (s = (s << 17 | s >>> 15) + r | 0) & (r ^ e)) + o[15] + 0x49b40821, t = (t << 22 | t >>> 10) + s | 0, e += (s ^ r & (t ^ s)) + o[1] - 0x9e1da9e, e = (e << 5 | e >>> 27) + t | 0, r += (t ^ s & (e ^ t)) + o[6] - 0x3fbf4cc0, r = (r << 9 | r >>> 23) + e | 0, s += (e ^ t & (r ^ e)) + o[11] + 0x265e5a51, s = (s << 14 | s >>> 18) + r | 0, t += (r ^ e & (s ^ r)) + o[0] - 0x16493856, t = (t << 20 | t >>> 12) + s | 0, e += (s ^ r & (t ^ s)) + o[5] - 0x29d0efa3, e = (e << 5 | e >>> 27) + t | 0, r += (t ^ s & (e ^ t)) + o[10] + 0x2441453, r = (r << 9 | r >>> 23) + e | 0, s += (e ^ t & (r ^ e)) + o[15] - 0x275e197f, s = (s << 14 | s >>> 18) + r | 0, t += (r ^ e & (s ^ r)) + o[4] - 0x182c0438, t = (t << 20 | t >>> 12) + s | 0, e += (s ^ r & (t ^ s)) + o[9] + 0x21e1cde6, e = (e << 5 | e >>> 27) + t | 0, r += (t ^ s & (e ^ t)) + o[14] - 0x3cc8f82a, r = (r << 9 | r >>> 23) + e | 0, s += (e ^ t & (r ^ e)) + o[3] - 0xb2af279, s = (s << 14 | s >>> 18) + r | 0, t += (r ^ e & (s ^ r)) + o[8] + 0x455a14ed, t = (t << 20 | t >>> 12) + s | 0, e += (s ^ r & (t ^ s)) + o[13] - 0x561c16fb, e = (e << 5 | e >>> 27) + t | 0, r += (t ^ s & (e ^ t)) + o[2] - 0x3105c08, r = (r << 9 | r >>> 23) + e | 0, s += (e ^ t & (r ^ e)) + o[7] + 0x676f02d9, s = (s << 14 | s >>> 18) + r | 0, t += (r ^ e & (s ^ r)) + o[12] - 0x72d5b376, e += ((n = (t = (t << 20 | t >>> 12) + s | 0) ^ s) ^ r) + o[5] - 378558, r += (n ^ (e = (e << 4 | e >>> 28) + t | 0)) + o[8] - 0x788e097f, s += ((a = (r = (r << 11 | r >>> 21) + e | 0) ^ e) ^ t) + o[11] + 0x6d9d6122, t += (a ^ (s = (s << 16 | s >>> 16) + r | 0)) + o[14] - 0x21ac7f4, e += ((n = (t = (t << 23 | t >>> 9) + s | 0) ^ s) ^ r) + o[1] - 0x5b4115bc, r += (n ^ (e = (e << 4 | e >>> 28) + t | 0)) + o[4] + 0x4bdecfa9, s += ((a = (r = (r << 11 | r >>> 21) + e | 0) ^ e) ^ t) + o[7] - 0x944b4a0, t += (a ^ (s = (s << 16 | s >>> 16) + r | 0)) + o[10] - 0x41404390, e += ((n = (t = (t << 23 | t >>> 9) + s | 0) ^ s) ^ r) + o[13] + 0x289b7ec6, r += (n ^ (e = (e << 4 | e >>> 28) + t | 0)) + o[0] - 0x155ed806, s += ((a = (r = (r << 11 | r >>> 21) + e | 0) ^ e) ^ t) + o[3] - 0x2b10cf7b, t += (a ^ (s = (s << 16 | s >>> 16) + r | 0)) + o[6] + 0x4881d05, e += ((n = (t = (t << 23 | t >>> 9) + s | 0) ^ s) ^ r) + o[9] - 0x262b2fc7, r += (n ^ (e = (e << 4 | e >>> 28) + t | 0)) + o[12] - 0x1924661b, s += ((a = (r = (r << 11 | r >>> 21) + e | 0) ^ e) ^ t) + o[15] + 0x1fa27cf8, t += (a ^ (s = (s << 16 | s >>> 16) + r | 0)) + o[2] - 0x3b53a99b, t = (t << 23 | t >>> 9) + s | 0, e += (s ^ (t | ~r)) + o[0] - 0xbd6ddbc, e = (e << 6 | e >>> 26) + t | 0, r += (t ^ (e | ~s)) + o[7] + 0x432aff97, r = (r << 10 | r >>> 22) + e | 0, s += (e ^ (r | ~t)) + o[14] - 0x546bdc59, s = (s << 15 | s >>> 17) + r | 0, t += (r ^ (s | ~e)) + o[5] - 0x36c5fc7, t = (t << 21 | t >>> 11) + s | 0, e += (s ^ (t | ~r)) + o[12] + 0x655b59c3, e = (e << 6 | e >>> 26) + t | 0, r += (t ^ (e | ~s)) + o[3] - 0x70f3336e, r = (r << 10 | r >>> 22) + e | 0, s += (e ^ (r | ~t)) + o[10] - 1051523, s = (s << 15 | s >>> 17) + r | 0, t += (r ^ (s | ~e)) + o[1] - 0x7a7ba22f, t = (t << 21 | t >>> 11) + s | 0, e += (s ^ (t | ~r)) + o[8] + 0x6fa87e4f, e = (e << 6 | e >>> 26) + t | 0, r += (t ^ (e | ~s)) + o[15] - 0x1d31920, r = (r << 10 | r >>> 22) + e | 0, s += (e ^ (r | ~t)) + o[6] - 0x5cfebcec, s = (s << 15 | s >>> 17) + r | 0, t += (r ^ (s | ~e)) + o[13] + 0x4e0811a1, t = (t << 21 | t >>> 11) + s | 0, e += (s ^ (t | ~r)) + o[4] - 0x8ac817e, e = (e << 6 | e >>> 26) + t | 0, r += (t ^ (e | ~s)) + o[11] - 0x42c50dcb, r = (r << 10 | r >>> 22) + e | 0, s += (e ^ (r | ~t)) + o[2] + 0x2ad7d2bb, s = (s << 15 | s >>> 17) + r | 0, t += (r ^ (s | ~e)) + o[9] - 0x14792c6f, t = (t << 21 | t >>> 11) + s | 0, this.first ? (this.h0 = e + 0x67452301 | 0, this.h1 = t - 0x10325477 | 0, this.h2 = s - 0x67452302 | 0, this.h3 = r + 0x10325476 | 0, this.first = !1) : (this.h0 = this.h0 + e | 0, this.h1 = this.h1 + t | 0, this.h2 = this.h2 + s | 0, this.h3 = this.h3 + r | 0)
        }, S.prototype.hex = function() {
            this.finalize();
            var e = this.h0,
                t = this.h1,
                s = this.h2,
                r = this.h3;
            return p[e >>> 4 & 15] + p[15 & e] + p[e >>> 12 & 15] + p[e >>> 8 & 15] + p[e >>> 20 & 15] + p[e >>> 16 & 15] + p[e >>> 28 & 15] + p[e >>> 24 & 15] + p[t >>> 4 & 15] + p[15 & t] + p[t >>> 12 & 15] + p[t >>> 8 & 15] + p[t >>> 20 & 15] + p[t >>> 16 & 15] + p[t >>> 28 & 15] + p[t >>> 24 & 15] + p[s >>> 4 & 15] + p[15 & s] + p[s >>> 12 & 15] + p[s >>> 8 & 15] + p[s >>> 20 & 15] + p[s >>> 16 & 15] + p[s >>> 28 & 15] + p[s >>> 24 & 15] + p[r >>> 4 & 15] + p[15 & r] + p[r >>> 12 & 15] + p[r >>> 8 & 15] + p[r >>> 20 & 15] + p[r >>> 16 & 15] + p[r >>> 28 & 15] + p[r >>> 24 & 15]
        }, S.prototype.toString = S.prototype.hex, S.prototype.digest = function() {
            this.finalize();
            var e = this.h0,
                t = this.h1,
                s = this.h2,
                r = this.h3;
            return [255 & e, e >>> 8 & 255, e >>> 16 & 255, e >>> 24 & 255, 255 & t, t >>> 8 & 255, t >>> 16 & 255, t >>> 24 & 255, 255 & s, s >>> 8 & 255, s >>> 16 & 255, s >>> 24 & 255, 255 & r, r >>> 8 & 255, r >>> 16 & 255, r >>> 24 & 255]
        }, S.prototype.array = S.prototype.digest, S.prototype.arrayBuffer = function() {
            this.finalize();
            var e = new ArrayBuffer(16),
                t = new Uint32Array(e);
            return t[0] = this.h0, t[1] = this.h1, t[2] = this.h2, t[3] = this.h3, e
        }, S.prototype.buffer = S.prototype.arrayBuffer, S.prototype.base64 = function() {
            for (var e, t, s, r = "", n = this.array(), a = 0; a < 15;) e = n[a++], t = n[a++], s = n[a++], r += v[e >>> 2] + v[(e << 4 | t >>> 4) & 63] + v[(t << 2 | s >>> 6) & 63] + v[63 & s];
            return r + (v[(e = n[a]) >>> 2] + v[e << 4 & 63] + "==")
        }, k.prototype = new S, k.prototype.finalize = function() {
            if (S.prototype.finalize.call(this), this.inner) {
                this.inner = !1;
                var e = this.array();
                S.call(this, this.sharedMemory), this.update(this.oKeyPad), this.update(e), S.prototype.finalize.call(this)
            }
        };
        var R = function() {
            var e = C("hex");
            i && (e = P(e)), e.create = function() {
                return new S
            }, e.update = function(t) {
                return e.create().update(t)
            };
            for (var t = 0; t < f.length; ++t) {
                var s = f[t];
                e[s] = C(s)
            }
            return e
        }();
        if (R.md5 = R, R.md5.hmac = function() {
                var e = I("hex");
                e.create = function(e) {
                    return new k(e)
                }, e.update = function(t, s) {
                    return e.create(t).update(s)
                };
                for (var t = 0; t < f.length; ++t) {
                    var s = f[t];
                    e[s] = I(s)
                }
                return e
            }(), l) t.exports = R;
        else a.md5 = R, u && (e.r, void 0 !== R && e.v(R))
    }()
}, 283514, (e, t, s) => {
    "use strict";
    Object.defineProperty(s, "__esModule", {
        value: !0
    }), Object.defineProperty(s, "LoadableContext", {
        enumerable: !0,
        get: function() {
            return r
        }
    });
    let r = e.r(2879)._(e.r(416340)).default.createContext(null)
}, 568710, (e, t, s) => {
    "use strict";
    Object.defineProperty(s, "__esModule", {
        value: !0
    }), Object.defineProperty(s, "default", {
        enumerable: !0,
        get: function() {
            return p
        }
    });
    let r = e.r(2879)._(e.r(416340)),
        n = e.r(283514),
        a = [],
        o = [],
        i = !1;

    function c(e) {
        let t = e(),
            s = {
                loading: !0,
                loaded: null,
                error: null
            };
        return s.promise = t.then(e => (s.loading = !1, s.loaded = e, e)).catch(e => {
            throw s.loading = !1, s.error = e, e
        }), s
    }
    class l {
        promise() {
            return this._res.promise
        }
        retry() {
            this._clearTimeouts(), this._res = this._loadFn(this._opts.loader), this._state = {
                pastDelay: !1,
                timedOut: !1
            };
            let {
                _res: e,
                _opts: t
            } = this;
            e.loading && ("number" == typeof t.delay && (0 === t.delay ? this._state.pastDelay = !0 : this._delay = setTimeout(() => {
                this._update({
                    pastDelay: !0
                })
            }, t.delay)), "number" == typeof t.timeout && (this._timeout = setTimeout(() => {
                this._update({
                    timedOut: !0
                })
            }, t.timeout))), this._res.promise.then(() => {
                this._update({}), this._clearTimeouts()
            }).catch(e => {
                this._update({}), this._clearTimeouts()
            }), this._update({})
        }
        _update(e) {
            this._state = {
                ...this._state,
                error: this._res.error,
                loaded: this._res.loaded,
                loading: this._res.loading,
                ...e
            }, this._callbacks.forEach(e => e())
        }
        _clearTimeouts() {
            clearTimeout(this._delay), clearTimeout(this._timeout)
        }
        getCurrentValue() {
            return this._state
        }
        subscribe(e) {
            return this._callbacks.add(e), () => {
                this._callbacks.delete(e)
            }
        }
        constructor(e, t) {
            this._loadFn = e, this._opts = t, this._callbacks = new Set, this._delay = null, this._timeout = null, this.retry()
        }
    }

    function u(t) {
        return function(t, s) {
            let c = Object.assign({
                    loader: null,
                    loading: null,
                    delay: 200,
                    timeout: null,
                    webpack: null,
                    modules: null
                }, s),
                u = null;

            function d() {
                if (!u) {
                    let e = new l(t, c);
                    u = {
                        getCurrentValue: e.getCurrentValue.bind(e),
                        subscribe: e.subscribe.bind(e),
                        retry: e.retry.bind(e),
                        promise: e.promise.bind(e)
                    }
                }
                return u.promise()
            }
            if ("u" < typeof window && a.push(d), !i && "u" > typeof window) {
                let t = c.webpack && "function" == typeof e.t.resolveWeak ? c.webpack() : c.modules;
                t && o.push(e => {
                    for (let s of t)
                        if (e.includes(s)) return d()
                })
            }

            function p(e, t) {
                let s;
                d(), (s = r.default.useContext(n.LoadableContext)) && Array.isArray(c.modules) && c.modules.forEach(e => {
                    s(e)
                });
                let a = r.default.useSyncExternalStore(u.subscribe, u.getCurrentValue, u.getCurrentValue);
                return r.default.useImperativeHandle(t, () => ({
                    retry: u.retry
                }), []), r.default.useMemo(() => {
                    var t;
                    return a.loading || a.error ? r.default.createElement(c.loading, {
                        isLoading: a.loading,
                        pastDelay: a.pastDelay,
                        timedOut: a.timedOut,
                        error: a.error,
                        retry: u.retry
                    }) : a.loaded ? r.default.createElement((t = a.loaded) && t.default ? t.default : t, e) : null
                }, [e, a])
            }
            return p.preload = () => d(), p.displayName = "LoadableComponent", r.default.forwardRef(p)
        }(c, t)
    }

    function d(e, t) {
        let s = [];
        for (; e.length;) {
            let r = e.pop();
            s.push(r(t))
        }
        return Promise.all(s).then(() => {
            if (e.length) return d(e, t)
        })
    }
    u.preloadAll = () => new Promise((e, t) => {
        d(a).then(e, t)
    }), u.preloadReady = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
        return new Promise(t => {
            let s = () => (i = !0, t());
            d(o, e).then(s, s)
        })
    }, "u" > typeof window && (window.__NEXT_PRELOADREADY = u.preloadReady);
    let p = u
}, 810637, (e, t, s) => {
    "use strict";
    Object.defineProperty(s, "__esModule", {
        value: !0
    });
    var r = {
        default: function() {
            return d
        },
        noSSR: function() {
            return u
        }
    };
    for (var n in r) Object.defineProperty(s, n, {
        enumerable: !0,
        get: r[n]
    });
    let a = e.r(2879),
        o = e.r(221628);
    e.r(416340);
    let i = a._(e.r(568710)),
        c = "u" < typeof window;

    function l(e) {
        return {
            default: (null == e ? void 0 : e.default) || e
        }
    }

    function u(e, t) {
        if (delete t.webpack, delete t.modules, !c) return e(t);
        let s = t.loading;
        return () => (0, o.jsx)(s, {
            error: null,
            isLoading: !0,
            pastDelay: !1,
            timedOut: !1
        })
    }

    function d(e, t) {
        let s = i.default,
            r = {
                loading: e => {
                    let {
                        error: t,
                        isLoading: s,
                        pastDelay: r
                    } = e;
                    return null
                }
            };
        e instanceof Promise ? r.loader = () => e : "function" == typeof e ? r.loader = e : "object" == typeof e && (r = {
            ...r,
            ...e
        });
        let n = (r = {
            ...r,
            ...t
        }).loader;
        return (r.loadableGenerated && (r = {
            ...r,
            ...r.loadableGenerated
        }, delete r.loadableGenerated), "boolean" != typeof r.ssr || r.ssr) ? s({
            ...r,
            loader: () => null != n ? n().then(l) : Promise.resolve(l(() => null))
        }) : (delete r.webpack, delete r.modules, u(s, r))
    }("function" == typeof s.default || "object" == typeof s.default && null !== s.default) && void 0 === s.default.__esModule && (Object.defineProperty(s.default, "__esModule", {
        value: !0
    }), Object.assign(s.default, s), t.exports = s.default)
}, 109182, (e, t, s) => {
    t.exports = e.r(810637)
}, 260241, e => {
    "use strict";
    var t = e.i(79187),
        s = e.i(416340),
        r = e.i(706442),
        n = e.i(431346),
        a = e.i(620068),
        o = e.i(982234),
        i = e.i(418400),
        c = e.i(169722),
        l = e.i(199834),
        u = e.i(872204),
        d = e.i(627292),
        p = e.i(734306),
        h = e.i(731693),
        m = e.i(397810),
        f = e.i(736186),
        v = e.i(645909),
        y = e.i(517379),
        g = e.i(12839),
        g = g,
        A = e.i(291037),
        b = e.i(899819),
        w = e.i(777004),
        C = e.i(35298),
        P = e.i(252842);
    let I = "https://www.roblox.com/info/privacy",
        S = "{privacyPolicyLink}",
        k = "{googleAnalyticsLink}",
        R = [{
            label: "Label.DataCollected",
            content: "Description.DataCollected"
        }, {
            label: "Label.DataSharing",
            content: "Description.DataSharing"
        }, {
            label: "Label.DataRetention",
            content: "Description.DataRetention"
        }, {
            label: "Label.DataUse",
            content: "Description.DataUse"
        }, {
            label: "Label.DataStorage",
            content: "Description.Undisclosed"
        }];
    var x, E, T = ((x = T || {}).BannerTitle = "Heading.CookieBanner", x.CookieBannerContent = "Description.CookieBannerContent", x.CookieBannerButton = "Action.CookieBanner", x.PrivacyPolicy = "Description.PrivacyPolicy", x.ConsentToolModalTitle = "Heading.CookieSettings", x.SaveBtn = "Action.SavePreferences", x.CancelBtn = "Action.Cancel", x.InfoCollectionHeader = "Heading.InformationCollection", x.InfoCollectionContent = "Description.InformationCollection", x.InfoCollectionHeader2 = "Heading.InformationCollection2", x.InfoCollectionContent2 = "Description.InformationCollection2", x.InfoPartnerCollectionHeader = "Heading.InformationPartnerCollection", x.InfoPartnerCollectionContent = "Description.InformationPartnerCollection", x.RBXViralAcquisition = "RBXViralAcquisition", x.RBXViralAcquisitionDescription = "Description.RBXViralAcquisition", x.RBXSource = "RBXSource", x.RBXSourceDescription = "Description.RBXSource", x.GoogleAnalytics = "Heading.GoogleAnalytics", x.OwnedBy = "Label.OwnedBy", x.GoogleInc = "Google Inc.", x.Website = "Label.Website", x.GoogleAnalyticsPurposeHeader = "Heading.GoogleAnalyticsPurpose", x.GoogleAnalyticsPurposeDescription = "Description.GoogleAnalyticsPurpose", x.CompanyCollectionHeader = "Heading.CompanyCollection", x.DataCollected = "Label.DataCollected", x.DataCollectedContent = "Description.DataCollected", x.DataSharing = "Label.DataSharing", x.DataSharingContent = "Description.DataSharing", x.DataRetention = "Label.DataRetention", x.DataRetentionContent = "Description.DataRetention", x.DataUse = "Label.DataUse", x.DataUseContent = "Description.DataUse", x.DataStorage = "Label.DataStorage", x.DataStorageContent = "Description.Undisclosed", x.RequestData = "Action.RequestData", x.SetCookieOptions = "Action.SetCookieOptions", x.DeclineAll = "Action.DeclineAll", x.AcceptAll = "Action.AcceptAll", x.EssentialCookie = "Heading.EssentialCookies", x.AnalyticsCookie = "Heading.AnalyticsCookies", x.GAReadMore = "Description.GAReadMore", x.GAReadMoreUrl = "{googleAnalyticsLink}", x);
    let U = (0, r.makeStyles)()(e => ({
            root: {
                padding: 24,
                maxWidth: 1250,
                margin: "0 auto"
            },
            content: {
                marginBottom: 16
            },
            actions: {
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
                gap: 12,
                [e.breakpoints.down("Medium")]: {
                    flexDirection: "column",
                    alignItems: "flex-start"
                }
            },
            buttons: {
                display: "flex",
                gap: 12,
                [e.breakpoints.down("Medium")]: {
                    flexDirection: "column",
                    width: "100%"
                }
            },
            backdrop: {
                backgroundColor: "transparent"
            }
        })),
        _ = e => {
            let {
                onAcceptAll: r,
                onDeclineAll: d,
                onLearnMore: p,
                isOpen: h
            } = e, {
                translate: m
            } = (0, t.useTranslation)(), {
                classes: f
            } = U(), v = (0, a.useMediaQuery)((0, n.useTheme)().breakpoints.down("Medium")), y = (0, s.useMemo)(() => s.default.createElement(o.Link, {
                href: I,
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, m(T.PrivacyPolicy)), [m]), g = (0, s.useMemo)(() => {
                let e = m(T.CookieBannerContent);
                if (!e.includes(S)) return e;
                let t = e.split(S);
                return s.default.createElement(s.default.Fragment, null, t[0], y, t[1] || "")
            }, [m, y]);
            return s.default.createElement(i.Drawer, {
                open: h,
                onClose: d,
                anchor: "bottom",
                variant: "temporary",
                ModalProps: {
                    BackdropProps: {
                        classes: {
                            root: f.backdrop
                        }
                    }
                }
            }, s.default.createElement(c.Grid, {
                className: f.root
            }, s.default.createElement(c.Grid, {
                className: f.content
            }, s.default.createElement(l.Typography, {
                variant: "body2"
            }, g)), s.default.createElement(c.Grid, {
                className: f.actions
            }, s.default.createElement(u.Button, {
                variant: "text",
                onClick: p,
                color: "secondary"
            }, m(T.SetCookieOptions)), s.default.createElement(c.Grid, {
                className: f.buttons
            }, s.default.createElement(u.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: d,
                fullWidth: v
            }, m(T.DeclineAll)), s.default.createElement(u.Button, {
                color: "secondary",
                variant: "contained",
                onClick: r,
                fullWidth: v
            }, m(T.AcceptAll))))))
        },
        O = "RBXcb",
        D = {
            RBXViralAcquisition: !0,
            RBXSource: !0,
            GoogleAnalytics: !0
        },
        L = (0, s.createContext)(null),
        B = () => {
            let e = (0, s.useContext)(L);
            if (!e) throw Error("useCookieConsentContext must be used within a CookieConsentProvider");
            return e
        },
        G = e => {
            let t, s = Object.entries(e).map(e => {
                let [t, s] = e;
                return "".concat(t, "=").concat(s)
            }).join("&");
            Object.entries(e).forEach(e => {
                let [t, s] = e;
                s || (0, P.deleteCookie)(t)
            });
            let r = new Date;
            r.setDate(r.getDate() + 180), document.cookie = "".concat(O, "=").concat(s, "; expires=").concat(r.toUTCString(), "; path=/; domain=").concat((t = window.location.hostname.split(".")).length <= 2 ? window.location.hostname : ".".concat(t.slice(1).join(".")))
        },
        N = e => {
            let {
                cookieName: t,
                description: r
            } = e;
            return s.default.createElement("div", null, s.default.createElement(l.Typography, {
                variant: "codeDense"
            }, t), s.default.createElement(l.Typography, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, r))
        },
        q = (0, r.makeStyles)()(() => ({
            accordionSummary: {
                display: "flex",
                alignItems: "center",
                gap: "12px",
                ["& .".concat(d.accordionSummaryClasses.content)]: {
                    margin: 0,
                    "&.Mui-expanded": {
                        margin: 0
                    }
                },
                "&.Mui-expanded": {
                    minHeight: "48px"
                }
            },
            accordion: {
                "&::before": {
                    height: 0
                },
                "&.Mui-expanded": {
                    margin: 0
                }
            }
        })),
        M = () => {
            var e;
            let {
                translate: r
            } = (0, t.useTranslation)(), {
                cookiePolicy: n
            } = B(), {
                classes: a
            } = q();
            return n && (null == (e = n.EssentialCookieList) ? void 0 : e.length) ? s.default.createElement(p.Accordion, {
                className: a.accordion
            }, s.default.createElement(h.AccordionSummary, {
                className: a.accordionSummary
            }, s.default.createElement(l.Typography, {
                variant: "h6"
            }, r(T.EssentialCookie))), s.default.createElement(m.AccordionDetails, null, n.EssentialCookieList.map(e => s.default.createElement(N, {
                key: e.cookieName,
                cookieName: e.cookieName,
                description: r(e.description)
            })))) : null
        };
    var j = ((E = {}).RBXViralAcquisition = "RBXViralAcquisition", E.RBXSource = "RBXSource", E.GoogleAnalytics = "GoogleAnalytics", E);
    let F = e => {
            let {
                title: t,
                content: r,
                secondary: n = !1
            } = e;
            return s.default.createElement("div", null, s.default.createElement(l.Typography, {
                variant: "body2",
                color: n ? "secondary" : "primary"
            }, t), s.default.createElement(l.Typography, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, r))
        },
        H = () => {
            let {
                translate: e
            } = (0, t.useTranslation)(), r = e(T.GAReadMore);
            if (!r.includes(k)) return s.default.createElement(s.default.Fragment, null, r);
            let [n, a] = r.split(k);
            return s.default.createElement(l.Typography, {
                variant: "body2"
            }, n, s.default.createElement(o.Link, {
                href: "https://support.google.com/analytics/answer/11397207",
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, e(T.GoogleAnalytics)), a)
        },
        z = (0, r.makeStyles)()(() => ({
            button: {
                paddingLeft: 5,
                ["&.".concat(f.buttonClasses.root)]: {
                    backgroundColor: "transparent",
                    "&:hover": {
                        backgroundColor: "transparent"
                    },
                    "&:focus": {
                        backgroundColor: "transparent"
                    },
                    "&:active": {
                        backgroundColor: "transparent"
                    }
                }
            }
        })),
        V = e => {
            let {
                href: t,
                text: r
            } = e, {
                classes: n
            } = z();
            return s.default.createElement("div", null, s.default.createElement(u.Button, {
                className: n.button,
                variant: "text",
                component: "a",
                color: "primary",
                href: t,
                rel: "noreferrer",
                endIcon: s.default.createElement(v.OpenInNewIcon, null),
                size: "small",
                target: "_blank",
                disableRipple: !0
            }, r))
        },
        K = e => {
            let {
                isAnalyticsCookieAccepted: r,
                setIsAnalyticsCookieAccepted: n
            } = e, {
                classes: a
            } = q(), {
                translate: o
            } = (0, t.useTranslation)();
            return s.default.createElement(p.Accordion, {
                className: a.accordion
            }, s.default.createElement(h.AccordionSummary, {
                className: a.accordionSummary
            }, s.default.createElement(l.Typography, {
                variant: "h6"
            }, o(T.AnalyticsCookie)), s.default.createElement(y.Switch, {
                checked: r,
                onChange: (e, t) => {
                    n(t)
                },
                "aria-label": o(T.AnalyticsCookie),
                size: "small"
            })), s.default.createElement(m.AccordionDetails, null, s.default.createElement(N, {
                key: j.RBXViralAcquisition,
                cookieName: j.RBXViralAcquisition,
                description: o(T.RBXViralAcquisitionDescription)
            }), s.default.createElement(N, {
                key: j.RBXSource,
                cookieName: j.RBXSource,
                description: o(T.RBXSourceDescription)
            }), s.default.createElement(V, {
                href: "https://marketingplatform.google.com/about/analytics/",
                text: o(T.GoogleAnalytics)
            }), s.default.createElement(l.Typography, {
                variant: "body2",
                paragraph: !0
            }, o(T.OwnedBy), " ", "Google Inc."), s.default.createElement(F, {
                title: o(T.GoogleAnalyticsPurposeHeader),
                content: o(T.GoogleAnalyticsPurposeDescription)
            }), s.default.createElement(l.Typography, {
                variant: "body2"
            }, o(T.CompanyCollectionHeader)), R.map(e => s.default.createElement(F, {
                key: e.label,
                title: o(e.label),
                content: o(e.content),
                secondary: !0
            })), s.default.createElement(H, null)))
        },
        J = (0, r.makeStyles)()(e => ({
            accordionSummary: {
                display: "flex",
                alignItems: "center",
                gap: "12px",
                ["& .".concat(d.accordionSummaryClasses.content)]: {
                    margin: 0,
                    "&.Mui-expanded": {
                        margin: 0
                    }
                },
                "&.Mui-expanded": {
                    minHeight: "48px"
                }
            },
            accordion: {
                "&::before": {
                    height: 0
                },
                "&.Mui-expanded": {
                    margin: 0
                }
            },
            paragraph: {
                marginBottom: "12px"
            },
            dialogContent: {
                ["&.".concat(g.d.root)]: {
                    paddingTop: "12px"
                },
                scrollbarColor: "grey transparent",
                scrollbarWidth: "thin",
                "&::-webkit-scrollbar": {
                    width: 6
                },
                "&::-webkit-scrollbar-thumb": {
                    background: "grey",
                    borderRadius: "10rem"
                },
                "&::-webkit-scrollbar-track": {
                    background: "transparent"
                }
            },
            accordionSection: {
                marginTop: "12px"
            },
            accordionContainer: {
                border: "1px solid ".concat(e.palette.components.divider),
                "&:first-of-type": {
                    borderTopLeftRadius: "12px",
                    borderTopRightRadius: "12px"
                },
                "&:last-of-type": {
                    borderTop: "none",
                    borderBottomLeftRadius: "12px",
                    borderBottomRightRadius: "12px"
                },
                "&:first-of-type:last-of-type": {
                    borderTop: "1px solid ".concat(e.palette.components.divider)
                }
            }
        })),
        X = e => {
            var r;
            let {
                open: n,
                onClose: a,
                onSave: o,
                isAnalyticsCookieAccepted: i,
                setIsAnalyticsCookieAccepted: c
            } = e, {
                translate: d
            } = (0, t.useTranslation)(), {
                classes: p
            } = J(), {
                cookiePolicy: h
            } = B();
            return h ? s.default.createElement(A.Dialog, {
                open: n,
                onClose: a
            }, s.default.createElement(b.DialogTitle, null, d(T.ConsentToolModalTitle)), s.default.createElement(w.DialogContent, {
                className: p.dialogContent
            }, s.default.createElement(l.Typography, {
                variant: "h6"
            }, d(T.InfoCollectionHeader)), s.default.createElement(l.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, d(T.InfoCollectionContent)), s.default.createElement(l.Typography, {
                variant: "h6"
            }, d(T.InfoCollectionHeader2)), s.default.createElement(l.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, d(T.InfoCollectionContent2)), s.default.createElement(l.Typography, {
                variant: "h6"
            }, d(T.InfoPartnerCollectionHeader)), s.default.createElement(l.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, d(T.InfoPartnerCollectionContent)), s.default.createElement(V, {
                href: "https://www.roblox.com/support",
                text: d(T.RequestData)
            }), s.default.createElement(V, {
                href: I,
                text: d(T.PrivacyPolicy)
            }), s.default.createElement("div", {
                className: p.accordionSection
            }, (null == (r = h.EssentialCookieList) ? void 0 : r.length) > 0 && s.default.createElement("div", {
                className: p.accordionContainer
            }, s.default.createElement(M, null)), s.default.createElement("div", {
                className: p.accordionContainer
            }, s.default.createElement(K, {
                isAnalyticsCookieAccepted: i,
                setIsAnalyticsCookieAccepted: c
            })))), s.default.createElement(C.DialogActions, null, s.default.createElement(u.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: a
            }, d(T.CancelBtn)), s.default.createElement(u.Button, {
                color: "primaryBrand",
                variant: "contained",
                onClick: o
            }, d(T.SaveBtn)))) : null
        },
        W = e => {
            let {
                isOpen: t,
                onClose: r,
                onSave: n
            } = e, {
                cookiePolicy: a,
                acceptAll: o,
                declineAll: i,
                hasAcceptedAnalyticsCookie: c
            } = B(), [l, u] = (0, s.useState)(c), d = (0, s.useCallback)(() => {
                l ? o() : i(), n()
            }, [o, i, l, n]);
            return a ? s.default.createElement(X, {
                open: t,
                onClose: r,
                isAnalyticsCookieAccepted: l,
                setIsAnalyticsCookieAccepted: u,
                onSave: d
            }) : null
        },
        Y = (0, t.withTranslation)(() => {
            let {
                acceptAll: e,
                declineAll: t,
                shouldShowBanner: r
            } = B(), [n, a] = (0, s.useState)(!1), [o, i] = (0, s.useState)(!1);
            (0, s.useEffect)(() => {
                r && i(!0)
            }, [r]);
            let c = (0, s.useCallback)(() => {
                    e(), i(!1)
                }, [e]),
                l = (0, s.useCallback)(() => {
                    t(), i(!1)
                }, [t]),
                u = (0, s.useCallback)(() => {
                    a(!0), i(!1)
                }, []),
                d = (0, s.useCallback)(() => {
                    a(!1), i(!0)
                }, []),
                p = (0, s.useCallback)(() => {
                    a(!1), i(!1)
                }, []);
            return s.default.createElement(s.default.Fragment, null, s.default.createElement(_, {
                isOpen: o,
                onAcceptAll: c,
                onDeclineAll: l,
                onLearnMore: u
            }), s.default.createElement(W, {
                isOpen: n,
                onClose: d,
                onSave: p
            }))
        }, ["Feature.Tracking", "CommonUI.Controls"]);
    e.s(["CookieConsentBanner", 0, Y, "CookieConsentProvider", 0, e => {
        let {
            children: t,
            robloxSiteDomain: r,
            initialCookiePolicy: n,
            initialPreferences: a,
            forceShowBanner: o = !1
        } = e, [i, c] = (0, s.useState)(n || null), [l, u] = (0, s.useState)(a || (() => {
            if ("u" < typeof document) return D;
            let e = document.cookie.split("; ").find(e => e.startsWith("".concat(O, "=")));
            return e ? e.substring(O.length + 1).split("&").reduce((e, t) => {
                let [s, r] = t.split("=");
                return e[s] = "true" === r, e
            }, {}) : D
        })()), [d, p] = (0, s.useState)(!n), [h, m] = (0, s.useState)(null), f = (0, s.useMemo)(() => !!o || !!(null == i ? void 0 : i.ShouldDisplayCookieBannerV3) && !(!("u" < typeof document) && document.cookie.split("; ").some(e => e.startsWith("".concat(O, "=")))), [null == i ? void 0 : i.ShouldDisplayCookieBannerV3, o]);
        (0, s.useEffect)(() => {
            n || (async () => {
                try {
                    var e, t, s;
                    let n = await fetch("https://apis.".concat(r, "/guac-v2/v1/bundles/cookie-policy"));
                    if (!n.ok) throw Error("Failed to fetch cookie policy");
                    let a = await n.json();
                    c({
                        ShouldDisplayCookieBannerV3: null != (e = a.ShouldDisplayCookieBannerV3) && e,
                        NonEssentialCookieList: null != (t = a.NonEssentialCookieList) ? t : [],
                        EssentialCookieList: null != (s = a.EssentialCookieList) ? s : []
                    }), p(!1)
                } catch (e) {
                    m(e instanceof Error ? e : Error("Unknown error")), p(!1)
                }
            })()
        }, [r, n]);
        let v = (0, s.useCallback)((e, t) => {
                u(s => {
                    let r = {
                        ...s,
                        [e]: t
                    };
                    return G(r), r
                })
            }, []),
            y = (0, s.useCallback)(() => {
                if (!i) return;
                let e = i.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !0
                }), D);
                G(e), u(e)
            }, [i]),
            g = (0, s.useCallback)(() => {
                if (!i) return;
                let e = i.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !1
                }), D);
                G(e), u(e)
            }, [i]),
            A = (0, s.useMemo)(() => Object.values(l).some(e => !0 === e), [l]),
            b = (0, s.useMemo)(() => ({
                cookiePolicy: i,
                preferences: l,
                updatePreference: v,
                acceptAll: y,
                declineAll: g,
                isLoading: d,
                error: h,
                hasAcceptedAnalyticsCookie: A,
                shouldShowBanner: f
            }), [i, l, d, h, y, g, v, A, f]);
        return s.default.createElement(L.Provider, {
            value: b
        }, t)
    }, "useCookieConsentContext", 0, B], 260241)
}]);

//# debugId=d24539a3-4270-46d6-fe3f-4c5fd91d6791
//# sourceMappingURL=0pwkzsk_xdzcd.js.map