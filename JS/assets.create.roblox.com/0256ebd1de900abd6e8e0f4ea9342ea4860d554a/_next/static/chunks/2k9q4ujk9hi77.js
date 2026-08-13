;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "bbb8dadc-be39-6235-d82a-246a28a56ba7")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 968284, 129882, e => {
    "use strict";
    var s, t, r = e.i(721281),
        n = e.i(408068),
        i = e.i(284856),
        o = ((s = {}).MD5_CALCULATION = "MD5_CALCULATION", s.MULTIPART_START = "MULTIPART_START", s.CHUNK_UPLOAD = "CHUNK_UPLOAD", s.CHUNK_COMPLETE = "CHUNK_COMPLETE", s.MULTIPART_COMPLETE = "MULTIPART_COMPLETE", s.CHUNK_UPLOAD_ABORT = "CHUNK_UPLOAD_ABORT", s.CHUNK_COMPLETE_ABORT = "CHUNK_COMPLETE_ABORT", s);
    class a extends Error {
        constructor(e, s, t, n, i, o, a) {
            super(e), (0, r._)(this, "stage", void 0), (0, r._)(this, "operationId", void 0), (0, r._)(this, "chunkIndex", void 0), (0, r._)(this, "httpStatus", void 0), (0, r._)(this, "errorCode", void 0), (0, r._)(this, "retryAttempt", void 0), this.name = "MultipartUploadError", this.stage = s, this.operationId = t, this.chunkIndex = n, this.httpStatus = i, this.errorCode = o, this.retryAttempt = a
        }
    }
    e.s(["MultipartUploadError", 0, a, "MultipartUploadStage", () => o], 129882);
    var u = e.i(650502),
        c = e.i(272593),
        d = ((t = {}).ASSET_TYPE = "assetType", t.DESCRIPTION = "description", t.DISPLAY_NAME = "displayName", t.ICON = "icon", t.MODERATION_RESULT = "moderationResult", t.PREVIEWS = "previews", t.FACEBOOK_SOCIAL_LINK = "facebookSocialLink", t.TWITTER_SOCIAL_LINK = "twitterSocialLink", t.YOUTUBE_SOCIAL_LINK = "youtubeSocialLink", t.TWITCH_SOCIAL_LINK = "twitchSocialLink", t.DISCORD_SOCIAL_LINK = "discordSocialLink", t.GITHUB_SOCIAL_LINK = "githubSocialLink", t.ROBLOX_SOCIAL_LINK = "robloxSocialLink", t.DEVFORUM_SOCIAL_LINK = "devForumSocialLink", t.TRY_ASSET_SOCIAL_LINK = "tryAssetSocialLink", t);
    let l = (0, u.getBEDEV2ServiceBasePath)("assets/user-auth"),
        p = "x-csrf-token",
        h = JSON.stringify({
            AssetPrivacy: "OpenUse"
        });
    async function f(e, s, t) {
        let r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 0;
        try {
            return await e()
        } catch (i) {
            let n = i instanceof Error ? i : Error(String(i));
            if (r < s) {
                let n = t(r);
                return await new Promise(e => {
                    setTimeout(e, n)
                }), f(e, s, t, r + 1)
            }
            throw n
        }
    }
    let m = async () => {
        try {
            return (await fetch("".concat(l, "/v1/assets"), {
                method: "PATCH",
                credentials: "include"
            })).headers.get(p)
        } catch (e) {
            return null
        }
    }, v = new class e {
        async createAssetAndGetOperationId(s, t) {
            let r = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                n = r ? e.generateRequestInitForCreatingOpenUseAsset(s, t) : {},
                i = await m();
            i && (n.headers = {
                [p]: i
            });
            let o = await this.assetsUploadApi.assetsCreateAsset({
                request: s,
                fileContent: t
            }, n);
            return e.parseOperationId(o.path)
        }
        async createAssetAndGetOperationIdWithMultipart(s, t, r, n) {
            var i;
            let u, c, d, l, h = null != r && r ? e.generateRequestInitForCreatingOpenUseAsset(s, t) : {},
                v = await m();
            v && (h.headers = {
                [p]: v,
                "Content-Type": "application/json; charset=utf-8"
            }), n && n(1);
            try {
                let s = await e.calculateMD5(t);
                u = s.hash, c = s.data
            } catch (e) {
                throw new a("Failed to calculate MD5 for file: ".concat(e instanceof Error ? e.message : String(e)), o.MD5_CALCULATION, void 0, void 0, void 0, "MD5_CALCULATION_FAILED")
            }
            n && n(5);
            let A = e.makeUploadPlan(t.size);
            n && n(10);
            let y = {
                    asset: s,
                    file: {
                        filesize: t.size,
                        md5CheckSum: u,
                        chunkPlan: A,
                        contentType: t.type
                    }
                },
                P = [];
            try {
                d = await this.multipartUploadApi.assetsCreateAssetWithMultipartUpload({
                    multipartUploadStartRequest: y
                }, h)
            } catch (e) {
                throw new a("Failed to start multipart upload: ".concat(e instanceof Error ? e.message : String(e)), o.MULTIPART_START, void 0, void 0, e instanceof Error && "status" in e ? e.status : void 0, "MULTIPART_START_FAILED")
            }
            if (n && n(15), 0 === (P = null != (i = d.uploadUrls) ? i : []).length) throw new a("Upload URLs are empty from multipart start response", o.MULTIPART_START, void 0, void 0, void 0, "EMPTY_UPLOAD_URLS");
            let I = e.parseOperationId(d.operationPath);
            if ("" === I) throw new a("Operation ID is empty from multipart start response", o.MULTIPART_START, void 0, void 0, void 0, "EMPTY_OPERATION_ID");
            try {
                l = await e.uploadChunks(P, c, I, n ? e => {
                    n(Math.min(15 + .65 * e, 80))
                } : void 0)
            } catch (e) {
                try {
                    await this.multipartUploadApi.assetsMultipartUploadAbort({
                        operationId: I
                    }, h)
                } catch (s) {
                    throw new a("Chunk upload failed and abort also failed. Original error: ".concat(e instanceof Error ? e.message : String(e), ". Abort error: ").concat(s instanceof Error ? s.message : String(s)), o.CHUNK_UPLOAD_ABORT, I, void 0, void 0, "ABORT_FAILED")
                }
                if (e instanceof a) throw e;
                throw new a("Chunk upload failed: ".concat(e instanceof Error ? e.message : String(e)), o.CHUNK_UPLOAD, I, void 0, void 0, "CHUNK_UPLOAD_FAILED")
            }
            n && n(80);
            try {
                await Promise.all(l.map((e, s) => {
                    let t = s + 1;
                    return f(async () => {
                        try {
                            await this.multipartUploadApi.assetsMultipartUploadChunkComplete({
                                operationId: I,
                                multipartUploadChunkCompleteRequest: {
                                    chunkNum: t,
                                    eTag: e
                                }
                            }, h)
                        } catch (e) {
                            throw new a("Failed to complete chunk ".concat(t, ": ").concat(e instanceof Error ? e.message : String(e)), o.CHUNK_COMPLETE, I, t, e instanceof Error && "status" in e ? e.status : void 0, "CHUNK_COMPLETE_FAILED")
                        }
                    }, 3, e => 1e3 * 2 ** e)
                }))
            } catch (e) {
                try {
                    await this.multipartUploadApi.assetsMultipartUploadAbort({
                        operationId: I
                    }, h)
                } catch (s) {
                    throw new a("Chunk complete failed and abort also failed. Original error: ".concat(e instanceof Error ? e.message : String(e), ". Abort error: ").concat(s instanceof Error ? s.message : String(s)), o.CHUNK_COMPLETE_ABORT, I, void 0, void 0, "ABORT_FAILED")
                }
                if (e instanceof a) throw e;
                throw new a("Chunk complete failed: ".concat(e instanceof Error ? e.message : String(e)), o.CHUNK_COMPLETE, I, void 0, void 0, "CHUNK_COMPLETE_FAILED")
            }
            n && n(90);
            try {
                await this.multipartUploadApi.assetsMultipartUploadComplete({
                    operationId: I
                }, h)
            } catch (e) {
                throw new a("Failed to complete multipart upload: ".concat(e instanceof Error ? e.message : String(e)), o.MULTIPART_COMPLETE, I, void 0, e instanceof Error && "status" in e ? e.status : void 0, "MULTIPART_COMPLETE_FAILED")
            }
            return n && n(100), I
        }
        async updateAssetAndGetOperationId(s, t, r, n) {
            let i = await this.assetsUploadApi.assetsUpdateAsset({
                assetId: s,
                updateMask: t,
                request: r,
                fileContent: n
            });
            return e.parseOperationId(i.path)
        }
        async getAsset(e, s) {
            return await this.assetsUploadApi.assetsGetAsset({
                assetId: e,
                readMask: s
            })
        }
        async getOperationStatus(e) {
            return await this.uploadStatusApi.assetsGetOperation({
                operationId: e
            })
        }
        async getOperationStatusRaw(e) {
            let s = await this.uploadStatusApi.assetsGetOperationRaw({
                    operationId: e
                }),
                t = await s.raw.json();
            return null !== t && "object" == typeof t ? t : {}
        }
        async getOperationStatusWithMetadata(e) {
            let s = await this.getOperationStatusRaw(e);
            return {
                operation: s,
                metadata: s.metadata
            }
        }
        static parseOperationId(e) {
            if (!e) throw Error("Operation path is missing or empty");
            let s = e.split("/");
            return s[s.length - 1]
        }
        static generateRequestInitForCreatingOpenUseAsset(e, s) {
            let t = new FormData;
            return t.append("request", JSON.stringify(e)), t.append("fileContent", s), t.append("additionalParameters", h), {
                body: t
            }
        }
        static async calculateMD5(e) {
            let s = await new Promise((s, t) => {
                let r = new FileReader;
                r.onload = e => {
                    var r;
                    let n = null == e || null == (r = e.target) ? void 0 : r.result;
                    n instanceof ArrayBuffer ? s(new Uint8Array(n)) : t(Error("Failed to read file"))
                }, r.onerror = () => t(r.error), r.readAsArrayBuffer(e)
            });
            return {
                hash: (0, n.md5)(s),
                data: s
            }
        }
        static makeUploadPlan(e) {
            let s = [],
                t = 0;
            for (; t < e;) {
                let r = Math.min(5242880, e - t);
                s.push(r), t += 5242880
            }
            return s
        }
        static async uploadChunks(e, s, t, r) {
            let n = e.length,
                i = 0,
                u = r ? () => {
                    r(Math.min((i += 1) / n * 100, 99))
                } : void 0,
                c = e.map((e, r) => {
                    let n = Number(e.contentStart || 0),
                        i = Number(e.contentLength || 0);
                    return f(async () => {
                        if (!(null == e ? void 0 : e.url)) throw new a("No URL found for chunk ".concat(r + 1), o.CHUNK_UPLOAD, t, r + 1, void 0, "MISSING_UPLOAD_URL");
                        let c = s.slice(n, n + i);
                        if (c.length !== i) throw new a("Chunk size mismatch for chunk ".concat(r + 1, ": expected ").concat(i, ", got ").concat(c.length), o.CHUNK_UPLOAD, t, r + 1, void 0, "CHUNK_SIZE_MISMATCH");
                        let d = await fetch(e.url, {
                            method: "PUT",
                            body: c
                        });
                        if (!d.ok) throw new a("Failed to upload chunk ".concat(r + 1, ": ").concat(d.status, " ").concat(d.statusText), o.CHUNK_UPLOAD, t, r + 1, d.status, "CHUNK_UPLOAD_HTTP_ERROR");
                        let l = d.headers.get("ETag");
                        if (!l) throw new a("No ETag received for chunk ".concat(r + 1), o.CHUNK_UPLOAD, t, r + 1, d.status, "MISSING_ETAG");
                        return u && u(), l.replaceAll(/['"]/g, "")
                    }, 3, e => 1e3 * 2 ** e)
                }),
                d = await Promise.all(c);
            return r && r(100), d
        }
        constructor() {
            (0, r._)(this, "assetsUploadApi", void 0), (0, r._)(this, "uploadStatusApi", void 0), (0, r._)(this, "multipartUploadApi", void 0);
            const e = (0, c.createClientConfiguration)("assets/user-auth", "bedev2");
            this.assetsUploadApi = new i.AssetApi(e), this.uploadStatusApi = new i.UploadStatusApi(e), this.multipartUploadApi = new i.MultipartUploadApi(e)
        }
    };
    e.s(["FieldMask", () => d, "default", 0, v], 968284)
}, 929286, 255382, e => {
    "use strict";
    var s = e.i(677753),
        t = function(e, s) {
            return (t = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, s) {
                e.__proto__ = s
            } || function(e, s) {
                for (var t in s) Object.prototype.hasOwnProperty.call(s, t) && (e[t] = s[t])
            })(e, s)
        };

    function r(e, s, t, r) {
        return new(t || (t = Promise))(function(n, i) {
            function o(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function a(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var s;
                e.done ? n(e.value) : ((s = e.value) instanceof t ? s : new t(function(e) {
                    e(s)
                })).then(o, a)
            }
            u((r = r.apply(e, s || [])).next())
        })
    }

    function n(e, s) {
        var t, r, n, i = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = a(0), o.throw = a(1), o.return = a(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function a(a) {
            return function(u) {
                var c = [a, u];
                if (t) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, c[0] && (i = 0)), i;) try {
                    if (t = 1, r && (n = 2 & c[0] ? r.return : c[0] ? r.throw || ((n = r.return) && n.call(r), 0) : r.next) && !(n = n.call(r, c[1])).done) return n;
                    switch (r = 0, n && (c = [2 & c[0], n.value]), c[0]) {
                        case 0:
                        case 1:
                            n = c;
                            break;
                        case 4:
                            return i.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = c[1], c = [0];
                            continue;
                        case 7:
                            c = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = i.trys).length > 0 && n[n.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === c[0] && (!n || c[1] > n[0] && c[1] < n[3])) {
                                i.label = c[1];
                                break
                            }
                            if (6 === c[0] && i.label < n[1]) {
                                i.label = n[1], n = c;
                                break
                            }
                            if (n && i.label < n[2]) {
                                i.label = n[2], i.ops.push(c);
                                break
                            }
                            n[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    c = s.call(e, i)
                } catch (e) {
                    c = [6, e], r = 0
                } finally {
                    t = n = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function i(e, t) {
        return null == e ? e : {
            status: (0, s.exists)(e, "status") ? e.status : void 0
        }
    }

    function o(e) {
        var t;
        return null == (t = e) ? t : {
            typeUrl: (0, s.exists)(t, "typeUrl") ? t.typeUrl : void 0,
            value: (0, s.exists)(t, "value") ? t.value : void 0
        }
    }

    function a(e) {
        return e
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            assetId: e.assetId,
            grantToDependencies: e.grantToDependencies,
            parentVersionNumber: e.parentVersionNumber
        }
    }

    function c(e) {
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

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            assetId: e.assetId
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            subjectType: e.subjectType,
            subjectId: e.subjectId,
            action: e.action
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(l),
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

    function f(e) {
        var t, r;
        return null == (t = e) ? t : {
            value: (0, s.exists)(t, "value") ? null == (r = t.value) ? r : {
                status: (0, s.exists)(r, "status") ? r.status : void 0
            } : void 0,
            error: (0, s.exists)(t, "error") ? t.error : void 0
        }
    }

    function m(e) {
        var t, r;
        return null == (t = e) ? t : {
            value: (0, s.exists)(t, "value") ? null == (r = t.value) ? r : {
                isOpenUse: (0, s.exists)(r, "isOpenUse") ? r.isOpenUse : void 0
            } : void 0,
            error: (0, s.exists)(t, "error") ? t.error : void 0
        }
    }

    function v(e) {
        var t;
        return null == (t = e) ? t : {
            parentAssetId: (0, s.exists)(t, "parentAssetId") ? t.parentAssetId : void 0,
            grantedDependentAssetIds: (0, s.exists)(t, "grantedDependentAssetIds") ? t.grantedDependentAssetIds : void 0
        }
    }

    function A(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, s.exists)(t, "assetId") ? t.assetId : void 0,
            code: (0, s.exists)(t, "code") ? t.code : void 0
        }
    }

    function y(e) {
        var t;
        return null == (t = e) ? t : {
            action: (0, s.exists)(t, "action") ? t.action : void 0,
            assetId: (0, s.exists)(t, "assetId") ? t.assetId : void 0,
            error: (0, s.exists)(t, "error") ? t.error : void 0
        }
    }

    function P(e, t) {
        return null == e ? e : {
            creatorType: (0, s.exists)(e, "creatorType") ? e.creatorType : void 0,
            creatorId: (0, s.exists)(e, "creatorId") ? e.creatorId : void 0,
            createAssetsAsRestricted: (0, s.exists)(e, "createAssetsAsRestricted") ? e.createAssetsAsRestricted : void 0
        }
    }

    function I(e) {
        var t, r;
        return null == (t = e) ? t : {
            assetId: (0, s.exists)(t, "assetId") ? t.assetId : void 0,
            assetName: (0, s.exists)(t, "assetName") ? t.assetName : void 0,
            assetType: (0, s.exists)(t, "assetType") ? t.assetType : void 0,
            accessStatus: (0, s.exists)(t, "accessStatus") ? t.accessStatus : void 0,
            creator: (0, s.exists)(t, "creator") ? null == (r = t.creator) ? r : {
                type: (0, s.exists)(r, "type") ? r.type : void 0,
                id: (0, s.exists)(r, "id") ? r.id : void 0
            } : void 0
        }
    }

    function w(e) {
        var t;
        return null == (t = e) ? t : {
            action: (0, s.exists)(t, "action") ? t.action : void 0,
            subjectId: (0, s.exists)(t, "subjectId") ? t.subjectId : void 0,
            subjectType: (0, s.exists)(t, "subjectType") ? t.subjectType : void 0,
            permissionLevel: (0, s.exists)(t, "permissionLevel") ? t.permissionLevel : void 0,
            permissionSource: (0, s.exists)(t, "permissionSource") ? t.permissionSource : void 0
        }
    }

    function g(e, t) {
        return null == e ? e : {
            isEligible: (0, s.exists)(e, "isEligible") ? e.isEligible : void 0
        }
    }

    function b(e) {
        var t;
        return null == (t = e) ? t : {
            action: (0, s.exists)(t, "action") ? t.action : void 0,
            assetId: (0, s.exists)(t, "assetId") ? t.assetId : void 0
        }
    }
    var S = function(e) {
        function l() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, s) {
            if ("function" != typeof s && null !== s) throw TypeError("Class extends value " + String(s) + " is not a constructor or null");

            function r() {
                this.constructor = e
            }
            t(e, s), e.prototype = null === s ? Object.create(s) : (r.prototype = s.prototype, new r)
        }(l, e), l.prototype.assetPermissionsBatchCheckAssetPermissionsRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/assets/check-permissions",
                                schemaPath: "/v1/assets/check-permissions",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(c)
                                    }
                                }(e.assetPermissionsBatchCheckAssetPermissionsRequest)
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    results: (0, s.exists)(e, "results") ? null === e.results ? null : e.results.map(f) : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsBatchCheckAssetPermissions = function() {
            return r(this, arguments, void 0, function(e, s) {
                return void 0 === e && (e = {}), n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsBatchCheckAssetPermissionsRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsBatchGetAssetAccessPropertiesRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/assets/access-properties",
                                schemaPath: "/v1/assets/access-properties",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(d)
                                    }
                                }(e.assetPermissionsBatchGetAssetAccessPropertiesRequest)
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    results: (0, s.exists)(e, "results") ? null === e.results ? null : e.results.map(m) : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsBatchGetAssetAccessProperties = function() {
            return r(this, arguments, void 0, function(e, s) {
                return void 0 === e && (e = {}), n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsBatchGetAssetAccessPropertiesRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsBatchGrantPermissionsRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/assets/permissions",
                                schemaPath: "/v1/assets/permissions",
                                method: "PATCH",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        subjectType: e.subjectType,
                                        subjectId: e.subjectId,
                                        action: e.action,
                                        assetIds: e.assetIds,
                                        enableDeepAccessCheck: e.enableDeepAccessCheck,
                                        requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(u)
                                    }
                                }(e.assetPermissionsBatchGrantPermissionsRequest)
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    successAssetIds: (0, s.exists)(e, "successAssetIds") ? e.successAssetIds : void 0,
                                    dependenciesGrantResults: (0, s.exists)(e, "dependenciesGrantResults") ? null === e.dependenciesGrantResults ? null : e.dependenciesGrantResults.map(v) : void 0,
                                    errors: (0, s.exists)(e, "errors") ? null === e.errors ? null : e.errors.map(A) : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsBatchGrantPermissions = function() {
            return r(this, arguments, void 0, function(e, s) {
                return void 0 === e && (e = {}), n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsBatchGrantPermissionsRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsCheckActionsRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/assets/check-actions",
                                schemaPath: "/v1/assets/check-actions",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        actions: void 0 === e.actions ? void 0 : null === e.actions ? null : e.actions.map(a),
                                        assetIds: e.assetIds
                                    }
                                }(e.assetPermissionsCheckActionsRequest)
                            }, t)];
                        case 1:
                            return o = n.sent(), this.isJsonMime(o.headers.get("content-type")) ? [2, new s.JSONApiResponse(o)] : [2, new s.TextApiResponse(o)]
                    }
                })
            })
        }, l.prototype.assetPermissionsCheckActions = function() {
            return r(this, arguments, void 0, function(e, s) {
                return void 0 === e && (e = {}), n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsCheckActionsRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsCopyAssetPermissionsRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling assetPermissionsCopyAssetPermissions.");
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/universes/{universeId}/permissions:copyInto".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/permissions:copyInto",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        sourceUniverseId: e.sourceUniverseId
                                    }
                                }(e.assetPermissionsCopyAssetPermissionsRequest)
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    operationId: (0, s.exists)(e, "operationId") ? e.operationId : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsCopyAssetPermissions = function(e, s) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsCopyAssetPermissionsRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetActionGatingStatusRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, o, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsGetActionGatingStatus.");
                            return r = {}, o = {}, [4, this.request({
                                path: "/v1/assets/{assetId}/eligibility-status".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/eligibility-status",
                                method: "GET",
                                headers: o,
                                query: r
                            }, t)];
                        case 1:
                            return a = n.sent(), [2, new s.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    canBeDistributedOnStore: (0, s.exists)(e, "CanBeDistributedOnStore") ? i(e.CanBeDistributedOnStore) : void 0,
                                    canBeShared: (0, s.exists)(e, "CanBeShared") ? i(e.CanBeShared) : void 0,
                                    canBeSetToOpenUse: (0, s.exists)(e, "CanBeSetToOpenUse") ? i(e.CanBeSetToOpenUse) : void 0,
                                    metadataState: (0, s.exists)(e, "MetadataState") ? e.MetadataState : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetActionGatingStatus = function(e, s) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsGetActionGatingStatusRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetAssetDependenciesRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsGetAssetDependencies.");
                            return r = {}, void 0 !== e.versionNumber && (r.versionNumber = e.versionNumber), void 0 !== e.dependenciesDegree && (r.dependenciesDegree = e.dependenciesDegree), void 0 !== e.includeAccessStatus && (r.includeAccessStatus = e.includeAccessStatus), void 0 !== e.maxPageSize && (r.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (r.pageToken = e.pageToken), void 0 !== e.returnCountOnly && (r.returnCountOnly = e.returnCountOnly), i = {}, [4, this.request({
                                path: "/v1/assets/{assetId}/dependencies".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/dependencies",
                                method: "GET",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    results: (0, s.exists)(e, "results") ? null === e.results ? null : e.results.map(I) : void 0,
                                    hasMore: (0, s.exists)(e, "hasMore") ? e.hasMore : void 0,
                                    nextPageToken: (0, s.exists)(e, "nextPageToken") ? e.nextPageToken : void 0,
                                    dependenciesCount: (0, s.exists)(e, "dependenciesCount") ? e.dependenciesCount : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetAssetDependencies = function(e, s) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsGetAssetDependenciesRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetAssetPermissionsRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsGetAssetPermissions.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/assets/{assetId}/permissions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/permissions",
                                method: "GET",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    results: (0, s.exists)(e, "results") ? null === e.results ? null : e.results.map(w) : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetAssetPermissions = function(e, s) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsGetAssetPermissionsRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetGroupSettingsRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new s.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling assetPermissionsGetGroupSettings.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/settings".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/settings",
                                method: "GET",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                return P(e)
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetGroupSettings = function(e, s) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsGetGroupSettingsRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetIsGroupEligibleForBetaRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new s.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling assetPermissionsGetIsGroupEligibleForBeta.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/is-group-eligible-for-beta/{groupId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/is-group-eligible-for-beta/{groupId}",
                                method: "GET",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetIsGroupEligibleForBeta = function(e, s) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsGetIsGroupEligibleForBetaRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetIsUserEligibleForBetaRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new s.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling assetPermissionsGetIsUserEligibleForBeta.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/is-user-eligible-for-beta/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/is-user-eligible-for-beta/{userId}",
                                method: "GET",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetIsUserEligibleForBeta = function(e, s) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsGetIsUserEligibleForBetaRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetOperationStatusRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.operationId || void 0 === e.operationId) throw new s.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetPermissionsGetOperationStatus.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                schemaPath: "/v1/operations/{operationId}",
                                method: "GET",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return a = n.sent(), [2, new s.JSONApiResponse(a, function(e) {
                                var t, r;
                                return null == e ? e : {
                                    path: (0, s.exists)(e, "path") ? e.path : void 0,
                                    operationId: (0, s.exists)(e, "operationId") ? e.operationId : void 0,
                                    done: (0, s.exists)(e, "done") ? e.done : void 0,
                                    error: (0, s.exists)(e, "error") ? null == (t = e.error) ? t : {
                                        code: (0, s.exists)(t, "code") ? t.code : void 0,
                                        message: (0, s.exists)(t, "message") ? t.message : void 0,
                                        details: (0, s.exists)(t, "details") ? null === t.details ? null : t.details.map(o) : void 0
                                    } : void 0,
                                    response: (0, s.exists)(e, "response") ? null == (r = e.response) ? r : {
                                        errors: (0, s.exists)(r, "errors") ? null === r.errors ? null : r.errors.map(y) : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetOperationStatus = function(e, s) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsGetOperationStatusRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetUserSettingsRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new s.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling assetPermissionsGetUserSettings.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/users/{userId}/settings".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/settings",
                                method: "GET",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                return P(e)
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsGetUserSettings = function(e, s) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsGetUserSettingsRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsGrantAssetPermissionsRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsGrantAssetPermissions.");
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/assets/{assetId}/permissions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/permissions",
                                method: "PATCH",
                                headers: i,
                                query: r,
                                body: p(e.assetPermissionsRevokeAssetPermissionsRequest)
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o)]
                    }
                })
            })
        }, l.prototype.assetPermissionsGrantAssetPermissions = function(e, s) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsGrantAssetPermissionsRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsListUniverseAssetPermissionsRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new s.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling assetPermissionsListUniverseAssetPermissions.");
                            return r = {}, void 0 !== e.maxPageSize && (r.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (r.pageToken = e.pageToken), i = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/assets".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/assets",
                                method: "GET",
                                headers: i,
                                query: r
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    results: (0, s.exists)(e, "results") ? null === e.results ? null : e.results.map(b) : void 0,
                                    nextPageToken: (0, s.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsListUniverseAssetPermissions = function(e, s) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsListUniverseAssetPermissionsRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsRevokeAssetPermissionsRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new s.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetPermissionsRevokeAssetPermissions.");
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/assets/{assetId}/permissions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/permissions",
                                method: "DELETE",
                                headers: i,
                                query: r,
                                body: p(e.assetPermissionsRevokeAssetPermissionsRequest)
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o)]
                    }
                })
            })
        }, l.prototype.assetPermissionsRevokeAssetPermissions = function(e, s) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsRevokeAssetPermissionsRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsUpdateGroupSettingsRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new s.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling assetPermissionsUpdateGroupSettings.");
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/settings".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/settings",
                                method: "PATCH",
                                headers: i,
                                query: r,
                                body: h(e.assetPermissionsUpdateUserSettingsRequest)
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                return P(e)
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsUpdateGroupSettings = function(e, s) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsUpdateGroupSettingsRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l.prototype.assetPermissionsUpdateUserSettingsRaw = function(e, t) {
            return r(this, void 0, void 0, function() {
                var r, i, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new s.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling assetPermissionsUpdateUserSettings.");
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/users/{userId}/settings".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/settings",
                                method: "PATCH",
                                headers: i,
                                query: r,
                                body: h(e.assetPermissionsUpdateUserSettingsRequest)
                            }, t)];
                        case 1:
                            return o = n.sent(), [2, new s.JSONApiResponse(o, function(e) {
                                return P(e)
                            })]
                    }
                })
            })
        }, l.prototype.assetPermissionsUpdateUserSettings = function(e, s) {
            return r(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.assetPermissionsUpdateUserSettingsRaw(e, s)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, l
    }(s.BaseAPI);
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
    }, "AssetPermissionsApi", 0, S, "AssetType", 0, {
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
    let R = new S((0, e.i(272593).createClientConfiguration)("asset-permissions-api", "bedev2"));
    e.s(["default", 0, {
        async batchCheckAssetPermissions(e) {
            let s = {
                requests: e.map(e => ({
                    action: e.permissionType,
                    assetId: e.assetId,
                    subject: {
                        subjectId: e.subjectId,
                        subjectType: e.subject
                    }
                }))
            };
            return (await R.assetPermissionsBatchCheckAssetPermissions({
                assetPermissionsBatchCheckAssetPermissionsRequest: s
            })).results
        },
        async getAssetDependencies(e) {
            let s = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                t = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
            return await R.assetPermissionsGetAssetDependencies({
                assetId: e,
                includeAccessStatus: s,
                returnCountOnly: t
            })
        },
        getAssetEligibilityStatus: async e => await R.assetPermissionsGetActionGatingStatus({
            assetId: e
        }),
        getAssetPermissions: async e => (await R.assetPermissionsGetAssetPermissions({
            assetId: e
        })).results,
        grantAssetPermissions(e, s, t, r, n) {
            let i = {
                assetId: e
            };
            return s && (i.assetPermissionsRevokeAssetPermissionsRequest = {
                requests: s,
                grantToDependencies: t,
                parentVersionNumber: r,
                enableDeepAccessCheck: n
            }), R.assetPermissionsGrantAssetPermissions(i)
        },
        listUniverseAssetPermissions: (e, s, t) => R.assetPermissionsListUniverseAssetPermissions({
            universeId: e,
            maxPageSize: s,
            pageToken: t
        }),
        batchGrantAssetPermissions: (e, s, t, r, n, i, o) => R.assetPermissionsBatchGrantPermissions({
            assetPermissionsBatchGrantPermissionsRequest: o ? {
                requests: s,
                enableDeepAccessCheck: t,
                subjectId: n,
                subjectType: r,
                action: i
            } : {
                assetIds: e,
                subjectId: n,
                subjectType: r,
                action: i
            }
        }),
        revokeAssetPermissions(e, s) {
            let t = {
                assetId: e
            };
            return s && (t.assetPermissionsRevokeAssetPermissionsRequest = {
                requests: s
            }), R.assetPermissionsRevokeAssetPermissions(t)
        },
        getUserPermissionSettings: async e => await R.assetPermissionsGetUserSettings({
            userId: e
        }),
        getGroupPermissionSettings: async e => await R.assetPermissionsGetGroupSettings({
            groupId: e
        }),
        updateUserPermissionSettings: async (e, s) => R.assetPermissionsUpdateUserSettings({
            userId: e,
            assetPermissionsUpdateUserSettingsRequest: s
        }),
        updateGroupPermissionSettings: async (e, s) => R.assetPermissionsUpdateGroupSettings({
            groupId: e,
            assetPermissionsUpdateUserSettingsRequest: s
        }),
        batchGetAssetAccessProperties: async e => await R.assetPermissionsBatchGetAssetAccessProperties({
            assetPermissionsBatchGetAssetAccessPropertiesRequest: {
                requests: e
            }
        })
    }], 255382)
}, 408068, (e, s, t) => {
    var r = e.i(2226);
    ! function() {
        "use strict";
        var t = "input is invalid type",
            n = "object" == typeof window,
            i = n ? window : {};
        i.JS_MD5_NO_WINDOW && (n = !1);
        var o = !n && "object" == typeof self,
            a = !i.JS_MD5_NO_NODE_JS && "object" == typeof r.default && r.default.versions && r.default.versions.node;
        a ? i = e.g : o && (i = self);
        var u, c = !i.JS_MD5_NO_COMMON_JS && s.exports,
            d = "function" == typeof define && define.amd,
            l = !i.JS_MD5_NO_ARRAY_BUFFER && "u" > typeof ArrayBuffer,
            p = "0123456789abcdef".split(""),
            h = [128, 32768, 8388608, -0x80000000],
            f = [0, 8, 16, 24],
            m = ["hex", "array", "digest", "buffer", "arrayBuffer", "base64"],
            v = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".split(""),
            A = [];
        if (l) {
            var y = new ArrayBuffer(68);
            u = new Uint8Array(y), A = new Uint32Array(y)
        }
        var P = Array.isArray;
        (i.JS_MD5_NO_NODE_JS || !P) && (P = function(e) {
            return "[object Array]" === Object.prototype.toString.call(e)
        });
        var I = ArrayBuffer.isView;
        l && (i.JS_MD5_NO_ARRAY_BUFFER_IS_VIEW || !I) && (I = function(e) {
            return "object" == typeof e && e.buffer && e.buffer.constructor === ArrayBuffer
        });
        var w = function(e) {
                var s = typeof e;
                if ("string" === s) return [e, !0];
                if ("object" !== s || null === e) throw Error(t);
                if (l && e.constructor === ArrayBuffer) return [new Uint8Array(e), !1];
                if (!P(e) && !I(e)) throw Error(t);
                return [e, !1]
            },
            g = function(e) {
                return function(s) {
                    return new R(!0).update(s)[e]()
                }
            },
            b = function(e) {
                var s, r = {},
                    n = void 0;
                return s = n.from && !i.JS_MD5_NO_BUFFER_FROM ? n.from : function(e) {
                        return new n(e)
                    },
                    function(i) {
                        if ("string" == typeof i) return r.createHash("md5").update(i, "utf8").digest("hex");
                        if (null == i) throw Error(t);
                        return i.constructor === ArrayBuffer && (i = new Uint8Array(i)), P(i) || I(i) || i.constructor === n ? r.createHash("md5").update(s(i)).digest("hex") : e(i)
                    }
            },
            S = function(e) {
                return function(s, t) {
                    return new U(s, !0).update(t)[e]()
                }
            };

        function R(e) {
            if (e) A[0] = A[16] = A[1] = A[2] = A[3] = A[4] = A[5] = A[6] = A[7] = A[8] = A[9] = A[10] = A[11] = A[12] = A[13] = A[14] = A[15] = 0, this.blocks = A, this.buffer8 = u;
            else if (l) {
                var s = new ArrayBuffer(68);
                this.buffer8 = new Uint8Array(s), this.blocks = new Uint32Array(s)
            } else this.blocks = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            this.h0 = this.h1 = this.h2 = this.h3 = this.start = this.bytes = this.hBytes = 0, this.finalized = this.hashed = !1, this.first = !0
        }

        function U(e, s) {
            var t, r = w(e);
            if (e = r[0], r[1]) {
                var n, i = [],
                    o = e.length,
                    a = 0;
                for (t = 0; t < o; ++t)(n = e.charCodeAt(t)) < 128 ? i[a++] = n : (n < 2048 ? i[a++] = 192 | n >>> 6 : (n < 55296 || n >= 57344 ? i[a++] = 224 | n >>> 12 : (n = 65536 + ((1023 & n) << 10 | 1023 & e.charCodeAt(++t)), i[a++] = 240 | n >>> 18, i[a++] = 128 | n >>> 12 & 63), i[a++] = 128 | n >>> 6 & 63), i[a++] = 128 | 63 & n);
                e = i
            }
            e.length > 64 && (e = new R(!0).update(e).array());
            var u = [],
                c = [];
            for (t = 0; t < 64; ++t) {
                var d = e[t] || 0;
                u[t] = 92 ^ d, c[t] = 54 ^ d
            }
            R.call(this, s), this.update(c), this.oKeyPad = u, this.inner = !0, this.sharedMemory = s
        }
        R.prototype.update = function(e) {
            if (this.finalized) throw Error("finalize already called");
            var s = w(e);
            e = s[0];
            for (var t, r, n = s[1], i = 0, o = e.length, a = this.blocks, u = this.buffer8; i < o;) {
                if (this.hashed && (this.hashed = !1, a[0] = a[16], a[16] = a[1] = a[2] = a[3] = a[4] = a[5] = a[6] = a[7] = a[8] = a[9] = a[10] = a[11] = a[12] = a[13] = a[14] = a[15] = 0), n)
                    if (l)
                        for (r = this.start; i < o && r < 64; ++i)(t = e.charCodeAt(i)) < 128 ? u[r++] = t : (t < 2048 ? u[r++] = 192 | t >>> 6 : (t < 55296 || t >= 57344 ? u[r++] = 224 | t >>> 12 : (t = 65536 + ((1023 & t) << 10 | 1023 & e.charCodeAt(++i)), u[r++] = 240 | t >>> 18, u[r++] = 128 | t >>> 12 & 63), u[r++] = 128 | t >>> 6 & 63), u[r++] = 128 | 63 & t);
                    else
                        for (r = this.start; i < o && r < 64; ++i)(t = e.charCodeAt(i)) < 128 ? a[r >>> 2] |= t << f[3 & r++] : (t < 2048 ? a[r >>> 2] |= (192 | t >>> 6) << f[3 & r++] : (t < 55296 || t >= 57344 ? a[r >>> 2] |= (224 | t >>> 12) << f[3 & r++] : (t = 65536 + ((1023 & t) << 10 | 1023 & e.charCodeAt(++i)), a[r >>> 2] |= (240 | t >>> 18) << f[3 & r++], a[r >>> 2] |= (128 | t >>> 12 & 63) << f[3 & r++]), a[r >>> 2] |= (128 | t >>> 6 & 63) << f[3 & r++]), a[r >>> 2] |= (128 | 63 & t) << f[3 & r++]);
                else if (l)
                    for (r = this.start; i < o && r < 64; ++i) u[r++] = e[i];
                else
                    for (r = this.start; i < o && r < 64; ++i) a[r >>> 2] |= e[i] << f[3 & r++];
                this.lastByteIndex = r, this.bytes += r - this.start, r >= 64 ? (this.start = r - 64, this.hash(), this.hashed = !0) : this.start = r
            }
            return this.bytes > 0xffffffff && (this.hBytes += this.bytes / 0x100000000 | 0, this.bytes = this.bytes % 0x100000000), this
        }, R.prototype.finalize = function() {
            if (!this.finalized) {
                this.finalized = !0;
                var e = this.blocks,
                    s = this.lastByteIndex;
                e[s >>> 2] |= h[3 & s], s >= 56 && (this.hashed || this.hash(), e[0] = e[16], e[16] = e[1] = e[2] = e[3] = e[4] = e[5] = e[6] = e[7] = e[8] = e[9] = e[10] = e[11] = e[12] = e[13] = e[14] = e[15] = 0), e[14] = this.bytes << 3, e[15] = this.hBytes << 3 | this.bytes >>> 29, this.hash()
            }
        }, R.prototype.hash = function() {
            var e, s, t, r, n, i, o = this.blocks;
            this.first ? (t = ((t = (-0x10325477 ^ (r = ((r = (-0x67452302 ^ 0x77777777 & (e = ((e = o[0] - 0x28955b89) << 7 | e >>> 25) - 0x10325477 | 0)) + o[1] - 0x705f434) << 12 | r >>> 20) + e | 0) & (-0x10325477 ^ e)) + o[2] - 0x4324b227) << 17 | t >>> 15) + r | 0, s = ((s = (e ^ t & (r ^ e)) + o[3] - 0x4e748589) << 22 | s >>> 10) + t | 0) : (e = this.h0, s = this.h1, t = this.h2, e += ((r = this.h3) ^ s & (t ^ r)) + o[0] - 0x28955b88, r += (t ^ (e = (e << 7 | e >>> 25) + s | 0) & (s ^ t)) + o[1] - 0x173848aa, t += (s ^ (r = (r << 12 | r >>> 20) + e | 0) & (e ^ s)) + o[2] + 0x242070db, s += (e ^ (t = (t << 17 | t >>> 15) + r | 0) & (r ^ e)) + o[3] - 0x3e423112, s = (s << 22 | s >>> 10) + t | 0), e += (r ^ s & (t ^ r)) + o[4] - 0xa83f051, r += (t ^ (e = (e << 7 | e >>> 25) + s | 0) & (s ^ t)) + o[5] + 0x4787c62a, t += (s ^ (r = (r << 12 | r >>> 20) + e | 0) & (e ^ s)) + o[6] - 0x57cfb9ed, s += (e ^ (t = (t << 17 | t >>> 15) + r | 0) & (r ^ e)) + o[7] - 0x2b96aff, e += (r ^ (s = (s << 22 | s >>> 10) + t | 0) & (t ^ r)) + o[8] + 0x698098d8, r += (t ^ (e = (e << 7 | e >>> 25) + s | 0) & (s ^ t)) + o[9] - 0x74bb0851, t += (s ^ (r = (r << 12 | r >>> 20) + e | 0) & (e ^ s)) + o[10] - 42063, s += (e ^ (t = (t << 17 | t >>> 15) + r | 0) & (r ^ e)) + o[11] - 0x76a32842, e += (r ^ (s = (s << 22 | s >>> 10) + t | 0) & (t ^ r)) + o[12] + 0x6b901122, r += (t ^ (e = (e << 7 | e >>> 25) + s | 0) & (s ^ t)) + o[13] - 0x2678e6d, t += (s ^ (r = (r << 12 | r >>> 20) + e | 0) & (e ^ s)) + o[14] - 0x5986bc72, s += (e ^ (t = (t << 17 | t >>> 15) + r | 0) & (r ^ e)) + o[15] + 0x49b40821, s = (s << 22 | s >>> 10) + t | 0, e += (t ^ r & (s ^ t)) + o[1] - 0x9e1da9e, e = (e << 5 | e >>> 27) + s | 0, r += (s ^ t & (e ^ s)) + o[6] - 0x3fbf4cc0, r = (r << 9 | r >>> 23) + e | 0, t += (e ^ s & (r ^ e)) + o[11] + 0x265e5a51, t = (t << 14 | t >>> 18) + r | 0, s += (r ^ e & (t ^ r)) + o[0] - 0x16493856, s = (s << 20 | s >>> 12) + t | 0, e += (t ^ r & (s ^ t)) + o[5] - 0x29d0efa3, e = (e << 5 | e >>> 27) + s | 0, r += (s ^ t & (e ^ s)) + o[10] + 0x2441453, r = (r << 9 | r >>> 23) + e | 0, t += (e ^ s & (r ^ e)) + o[15] - 0x275e197f, t = (t << 14 | t >>> 18) + r | 0, s += (r ^ e & (t ^ r)) + o[4] - 0x182c0438, s = (s << 20 | s >>> 12) + t | 0, e += (t ^ r & (s ^ t)) + o[9] + 0x21e1cde6, e = (e << 5 | e >>> 27) + s | 0, r += (s ^ t & (e ^ s)) + o[14] - 0x3cc8f82a, r = (r << 9 | r >>> 23) + e | 0, t += (e ^ s & (r ^ e)) + o[3] - 0xb2af279, t = (t << 14 | t >>> 18) + r | 0, s += (r ^ e & (t ^ r)) + o[8] + 0x455a14ed, s = (s << 20 | s >>> 12) + t | 0, e += (t ^ r & (s ^ t)) + o[13] - 0x561c16fb, e = (e << 5 | e >>> 27) + s | 0, r += (s ^ t & (e ^ s)) + o[2] - 0x3105c08, r = (r << 9 | r >>> 23) + e | 0, t += (e ^ s & (r ^ e)) + o[7] + 0x676f02d9, t = (t << 14 | t >>> 18) + r | 0, s += (r ^ e & (t ^ r)) + o[12] - 0x72d5b376, e += ((n = (s = (s << 20 | s >>> 12) + t | 0) ^ t) ^ r) + o[5] - 378558, r += (n ^ (e = (e << 4 | e >>> 28) + s | 0)) + o[8] - 0x788e097f, t += ((i = (r = (r << 11 | r >>> 21) + e | 0) ^ e) ^ s) + o[11] + 0x6d9d6122, s += (i ^ (t = (t << 16 | t >>> 16) + r | 0)) + o[14] - 0x21ac7f4, e += ((n = (s = (s << 23 | s >>> 9) + t | 0) ^ t) ^ r) + o[1] - 0x5b4115bc, r += (n ^ (e = (e << 4 | e >>> 28) + s | 0)) + o[4] + 0x4bdecfa9, t += ((i = (r = (r << 11 | r >>> 21) + e | 0) ^ e) ^ s) + o[7] - 0x944b4a0, s += (i ^ (t = (t << 16 | t >>> 16) + r | 0)) + o[10] - 0x41404390, e += ((n = (s = (s << 23 | s >>> 9) + t | 0) ^ t) ^ r) + o[13] + 0x289b7ec6, r += (n ^ (e = (e << 4 | e >>> 28) + s | 0)) + o[0] - 0x155ed806, t += ((i = (r = (r << 11 | r >>> 21) + e | 0) ^ e) ^ s) + o[3] - 0x2b10cf7b, s += (i ^ (t = (t << 16 | t >>> 16) + r | 0)) + o[6] + 0x4881d05, e += ((n = (s = (s << 23 | s >>> 9) + t | 0) ^ t) ^ r) + o[9] - 0x262b2fc7, r += (n ^ (e = (e << 4 | e >>> 28) + s | 0)) + o[12] - 0x1924661b, t += ((i = (r = (r << 11 | r >>> 21) + e | 0) ^ e) ^ s) + o[15] + 0x1fa27cf8, s += (i ^ (t = (t << 16 | t >>> 16) + r | 0)) + o[2] - 0x3b53a99b, s = (s << 23 | s >>> 9) + t | 0, e += (t ^ (s | ~r)) + o[0] - 0xbd6ddbc, e = (e << 6 | e >>> 26) + s | 0, r += (s ^ (e | ~t)) + o[7] + 0x432aff97, r = (r << 10 | r >>> 22) + e | 0, t += (e ^ (r | ~s)) + o[14] - 0x546bdc59, t = (t << 15 | t >>> 17) + r | 0, s += (r ^ (t | ~e)) + o[5] - 0x36c5fc7, s = (s << 21 | s >>> 11) + t | 0, e += (t ^ (s | ~r)) + o[12] + 0x655b59c3, e = (e << 6 | e >>> 26) + s | 0, r += (s ^ (e | ~t)) + o[3] - 0x70f3336e, r = (r << 10 | r >>> 22) + e | 0, t += (e ^ (r | ~s)) + o[10] - 1051523, t = (t << 15 | t >>> 17) + r | 0, s += (r ^ (t | ~e)) + o[1] - 0x7a7ba22f, s = (s << 21 | s >>> 11) + t | 0, e += (t ^ (s | ~r)) + o[8] + 0x6fa87e4f, e = (e << 6 | e >>> 26) + s | 0, r += (s ^ (e | ~t)) + o[15] - 0x1d31920, r = (r << 10 | r >>> 22) + e | 0, t += (e ^ (r | ~s)) + o[6] - 0x5cfebcec, t = (t << 15 | t >>> 17) + r | 0, s += (r ^ (t | ~e)) + o[13] + 0x4e0811a1, s = (s << 21 | s >>> 11) + t | 0, e += (t ^ (s | ~r)) + o[4] - 0x8ac817e, e = (e << 6 | e >>> 26) + s | 0, r += (s ^ (e | ~t)) + o[11] - 0x42c50dcb, r = (r << 10 | r >>> 22) + e | 0, t += (e ^ (r | ~s)) + o[2] + 0x2ad7d2bb, t = (t << 15 | t >>> 17) + r | 0, s += (r ^ (t | ~e)) + o[9] - 0x14792c6f, s = (s << 21 | s >>> 11) + t | 0, this.first ? (this.h0 = e + 0x67452301 | 0, this.h1 = s - 0x10325477 | 0, this.h2 = t - 0x67452302 | 0, this.h3 = r + 0x10325476 | 0, this.first = !1) : (this.h0 = this.h0 + e | 0, this.h1 = this.h1 + s | 0, this.h2 = this.h2 + t | 0, this.h3 = this.h3 + r | 0)
        }, R.prototype.hex = function() {
            this.finalize();
            var e = this.h0,
                s = this.h1,
                t = this.h2,
                r = this.h3;
            return p[e >>> 4 & 15] + p[15 & e] + p[e >>> 12 & 15] + p[e >>> 8 & 15] + p[e >>> 20 & 15] + p[e >>> 16 & 15] + p[e >>> 28 & 15] + p[e >>> 24 & 15] + p[s >>> 4 & 15] + p[15 & s] + p[s >>> 12 & 15] + p[s >>> 8 & 15] + p[s >>> 20 & 15] + p[s >>> 16 & 15] + p[s >>> 28 & 15] + p[s >>> 24 & 15] + p[t >>> 4 & 15] + p[15 & t] + p[t >>> 12 & 15] + p[t >>> 8 & 15] + p[t >>> 20 & 15] + p[t >>> 16 & 15] + p[t >>> 28 & 15] + p[t >>> 24 & 15] + p[r >>> 4 & 15] + p[15 & r] + p[r >>> 12 & 15] + p[r >>> 8 & 15] + p[r >>> 20 & 15] + p[r >>> 16 & 15] + p[r >>> 28 & 15] + p[r >>> 24 & 15]
        }, R.prototype.toString = R.prototype.hex, R.prototype.digest = function() {
            this.finalize();
            var e = this.h0,
                s = this.h1,
                t = this.h2,
                r = this.h3;
            return [255 & e, e >>> 8 & 255, e >>> 16 & 255, e >>> 24 & 255, 255 & s, s >>> 8 & 255, s >>> 16 & 255, s >>> 24 & 255, 255 & t, t >>> 8 & 255, t >>> 16 & 255, t >>> 24 & 255, 255 & r, r >>> 8 & 255, r >>> 16 & 255, r >>> 24 & 255]
        }, R.prototype.array = R.prototype.digest, R.prototype.arrayBuffer = function() {
            this.finalize();
            var e = new ArrayBuffer(16),
                s = new Uint32Array(e);
            return s[0] = this.h0, s[1] = this.h1, s[2] = this.h2, s[3] = this.h3, e
        }, R.prototype.buffer = R.prototype.arrayBuffer, R.prototype.base64 = function() {
            for (var e, s, t, r = "", n = this.array(), i = 0; i < 15;) e = n[i++], s = n[i++], t = n[i++], r += v[e >>> 2] + v[(e << 4 | s >>> 4) & 63] + v[(s << 2 | t >>> 6) & 63] + v[63 & t];
            return r + (v[(e = n[i]) >>> 2] + v[e << 4 & 63] + "==")
        }, U.prototype = new R, U.prototype.finalize = function() {
            if (R.prototype.finalize.call(this), this.inner) {
                this.inner = !1;
                var e = this.array();
                R.call(this, this.sharedMemory), this.update(this.oKeyPad), this.update(e), R.prototype.finalize.call(this)
            }
        };
        var T = function() {
            var e = g("hex");
            a && (e = b(e)), e.create = function() {
                return new R
            }, e.update = function(s) {
                return e.create().update(s)
            };
            for (var s = 0; s < m.length; ++s) {
                var t = m[s];
                e[t] = g(t)
            }
            return e
        }();
        if (T.md5 = T, T.md5.hmac = function() {
                var e = S("hex");
                e.create = function(e) {
                    return new U(e)
                }, e.update = function(s, t) {
                    return e.create(s).update(t)
                };
                for (var s = 0; s < m.length; ++s) {
                    var t = m[s];
                    e[t] = S(t)
                }
                return e
            }(), c) s.exports = T;
        else i.md5 = T, d && (e.r, void 0 !== T && e.v(T))
    }()
}]);

//# debugId=bbb8dadc-be39-6235-d82a-246a28a56ba7
//# sourceMappingURL=2qbcyvmau-rm9.js.map