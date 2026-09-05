;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "a45a134d-999a-3be7-fe09-7e7d8809275e")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 968284, 129882, e => {
    "use strict";
    var t, r, a = e.i(721281),
        i = e.i(408068),
        o = e.i(284856),
        n = ((t = {}).MD5_CALCULATION = "MD5_CALCULATION", t.MULTIPART_START = "MULTIPART_START", t.CHUNK_UPLOAD = "CHUNK_UPLOAD", t.CHUNK_COMPLETE = "CHUNK_COMPLETE", t.MULTIPART_COMPLETE = "MULTIPART_COMPLETE", t.CHUNK_UPLOAD_ABORT = "CHUNK_UPLOAD_ABORT", t.CHUNK_COMPLETE_ABORT = "CHUNK_COMPLETE_ABORT", t);
    class s extends Error {
        constructor(e, t, r, i, o, n, s) {
            super(e), (0, a._)(this, "stage", void 0), (0, a._)(this, "operationId", void 0), (0, a._)(this, "chunkIndex", void 0), (0, a._)(this, "httpStatus", void 0), (0, a._)(this, "errorCode", void 0), (0, a._)(this, "retryAttempt", void 0), this.name = "MultipartUploadError", this.stage = t, this.operationId = r, this.chunkIndex = i, this.httpStatus = o, this.errorCode = n, this.retryAttempt = s
        }
    }
    e.s(["MultipartUploadError", 0, s, "MultipartUploadStage", () => n], 129882);
    var l = e.i(650502),
        u = e.i(272593),
        c = ((r = {}).ASSET_TYPE = "assetType", r.DESCRIPTION = "description", r.DISPLAY_NAME = "displayName", r.ICON = "icon", r.MODERATION_RESULT = "moderationResult", r.PREVIEWS = "previews", r.FACEBOOK_SOCIAL_LINK = "facebookSocialLink", r.TWITTER_SOCIAL_LINK = "twitterSocialLink", r.YOUTUBE_SOCIAL_LINK = "youtubeSocialLink", r.TWITCH_SOCIAL_LINK = "twitchSocialLink", r.DISCORD_SOCIAL_LINK = "discordSocialLink", r.GITHUB_SOCIAL_LINK = "githubSocialLink", r.ROBLOX_SOCIAL_LINK = "robloxSocialLink", r.DEVFORUM_SOCIAL_LINK = "devForumSocialLink", r.TRY_ASSET_SOCIAL_LINK = "tryAssetSocialLink", r);
    let d = (0, l.getBEDEV2ServiceBasePath)("assets/user-auth"),
        p = "x-csrf-token",
        h = JSON.stringify({
            AssetPrivacy: "OpenUse"
        }),
        A = {
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
    async function T(e, t) {
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
    async function f(e, t, r, a) {
        let i = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : 0;
        null == a || a.throwIfAborted();
        try {
            return await e()
        } catch (n) {
            if (null == a ? void 0 : a.aborted) throw n;
            let o = n instanceof Error ? n : Error(String(n));
            if (i < t) {
                let o = r(i);
                return await T(o, a), f(e, t, r, a, i + 1)
            }
            throw o
        }
    }
    let E = async e => {
        try {
            return (await fetch("".concat(d, "/v1/assets"), {
                method: "PATCH",
                credentials: "include",
                signal: e
            })).headers.get(p)
        } catch (t) {
            if (null == e ? void 0 : e.aborted) throw t;
            return null
        }
    }, S = new class e {
        async createAssetAndGetOperationId(t, r) {
            let a = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                i = arguments.length > 3 ? arguments[3] : void 0,
                o = a ? e.generateRequestInitForCreatingOpenUseAsset(t, r) : {};
            o.signal = i;
            let n = await E(i);
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
        async createAssetAndGetOperationIdWithMultipart(t, r, a, i, o, l, u, c) {
            var d;
            let h, A, T, S, _ = null != a && a ? e.generateRequestInitForCreatingOpenUseAsset(t, r) : {};
            _.signal = o;
            let v = await E(o);
            v && (_.headers = {
                [p]: v,
                "Content-Type": "application/json; charset=utf-8"
            }), i && i(1);
            try {
                let t = await e.calculateMD5(r, o);
                h = t.hash, A = t.data
            } catch (e) {
                throw new s("Failed to calculate MD5 for file: ".concat(e instanceof Error ? e.message : String(e)), n.MD5_CALCULATION, void 0, void 0, void 0, "MD5_CALCULATION_FAILED")
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
                throw new s("Failed to start multipart upload: ".concat(e instanceof Error ? e.message : String(e)), n.MULTIPART_START, void 0, void 0, e instanceof Error && "status" in e ? e.status : void 0, "MULTIPART_START_FAILED")
            }
            if (i && i(15), 0 === (I = null != (d = T.uploadUrls) ? d : []).length) throw new s("Upload URLs are empty from multipart start response", n.MULTIPART_START, void 0, void 0, void 0, "EMPTY_UPLOAD_URLS");
            let C = e.parseOperationId(T.operationPath);
            if ("" === C) throw new s("Operation ID is empty from multipart start response", n.MULTIPART_START, void 0, void 0, void 0, "EMPTY_OPERATION_ID");
            null == l || l(C);
            try {
                S = await e.uploadChunks(I, A, C, i ? e => {
                    i(Math.min(15 + .65 * e, 80))
                } : void 0, o)
            } catch (e) {
                try {
                    await this.abortMultipartUploadAfterFailure(C, _, o), (null == o ? void 0 : o.aborted) || null == c || c(C)
                } catch (t) {
                    throw new s("Chunk upload failed and abort also failed. Original error: ".concat(e instanceof Error ? e.message : String(e), ". Abort error: ").concat(t instanceof Error ? t.message : String(t)), n.CHUNK_UPLOAD_ABORT, C, void 0, void 0, "ABORT_FAILED")
                }
                if (e instanceof s) throw e;
                throw new s("Chunk upload failed: ".concat(e instanceof Error ? e.message : String(e)), n.CHUNK_UPLOAD, C, void 0, void 0, "CHUNK_UPLOAD_FAILED")
            }
            i && i(80);
            try {
                await Promise.all(S.map((e, t) => {
                    let r = t + 1;
                    return f(async () => {
                        try {
                            await this.multipartUploadApi.assetsMultipartUploadChunkComplete({
                                operationId: C,
                                multipartUploadChunkCompleteRequest: {
                                    chunkNum: r,
                                    eTag: e
                                }
                            }, _)
                        } catch (e) {
                            throw new s("Failed to complete chunk ".concat(r, ": ").concat(e instanceof Error ? e.message : String(e)), n.CHUNK_COMPLETE, C, r, e instanceof Error && "status" in e ? e.status : void 0, "CHUNK_COMPLETE_FAILED")
                        }
                    }, 3, e => 1e3 * 2 ** e, o)
                }))
            } catch (e) {
                try {
                    await this.abortMultipartUploadAfterFailure(C, _, o), (null == o ? void 0 : o.aborted) || null == c || c(C)
                } catch (t) {
                    throw new s("Chunk complete failed and abort also failed. Original error: ".concat(e instanceof Error ? e.message : String(e), ". Abort error: ").concat(t instanceof Error ? t.message : String(t)), n.CHUNK_COMPLETE_ABORT, C, void 0, void 0, "ABORT_FAILED")
                }
                if (e instanceof s) throw e;
                throw new s("Chunk complete failed: ".concat(e instanceof Error ? e.message : String(e)), n.CHUNK_COMPLETE, C, void 0, void 0, "CHUNK_COMPLETE_FAILED")
            }
            i && i(90), null == u || u();
            try {
                await this.multipartUploadApi.assetsMultipartUploadComplete({
                    operationId: C
                }, _)
            } catch (e) {
                throw new s("Failed to complete multipart upload: ".concat(e instanceof Error ? e.message : String(e)), n.MULTIPART_COMPLETE, C, void 0, e instanceof Error && "status" in e ? e.status : void 0, "MULTIPART_COMPLETE_FAILED")
            }
            return i && i(100), C
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
            return r.append("request", JSON.stringify(e)), r.append("fileContent", t), r.append("additionalParameters", h), {
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
            return null != (t = A[a < 0 ? "" : e.name.slice(a).toLowerCase()]) ? t : "application/octet-stream"
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
                    c[a] = await f(async () => {
                        if (null == i || i.throwIfAborted(), !(null == o ? void 0 : o.url)) throw new s("No URL found for chunk ".concat(a + 1), n.CHUNK_UPLOAD, r, a + 1, void 0, "MISSING_UPLOAD_URL");
                        let e = t.slice(l, l + d);
                        if (e.length !== d) throw new s("Chunk size mismatch for chunk ".concat(a + 1, ": expected ").concat(d, ", got ").concat(e.length), n.CHUNK_UPLOAD, r, a + 1, void 0, "CHUNK_SIZE_MISMATCH");
                        let c = await fetch(o.url, {
                            method: "PUT",
                            body: e,
                            signal: i
                        });
                        if (!c.ok) throw new s("Failed to upload chunk ".concat(a + 1, ": ").concat(c.status, " ").concat(c.statusText), n.CHUNK_UPLOAD, r, a + 1, c.status, "CHUNK_UPLOAD_HTTP_ERROR");
                        let p = c.headers.get("ETag");
                        if (!p) throw new s("No ETag received for chunk ".concat(a + 1), n.CHUNK_UPLOAD, r, a + 1, c.status, "MISSING_ETAG");
                        return u && u(), p.replaceAll(/['"]/g, "")
                    }, 3, e => 1e3 * 2 ** e, i)
                }, p = 0, h = async () => {
                    for (; p < o;) {
                        null == i || i.throwIfAborted();
                        let e = p;
                        p += 1, await d(e)
                    }
                }, A = Math.min(3, o);
            return await Promise.all(Array.from({
                length: A
            }, h)), a && a(100), c
        }
        constructor() {
            (0, a._)(this, "assetsUploadApi", void 0), (0, a._)(this, "uploadStatusApi", void 0), (0, a._)(this, "multipartUploadApi", void 0);
            const e = (0, u.createClientConfiguration)("assets/user-auth", "bedev2");
            this.assetsUploadApi = new o.AssetApi(e), this.uploadStatusApi = new o.UploadStatusApi(e), this.multipartUploadApi = new o.MultipartUploadApi(e)
        }
    };
    e.s(["FieldMask", () => c, "default", 0, S], 968284)
}, 970494, 102211, 361738, e => {
    "use strict";
    var t = e.i(677753),
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

    function n(e) {
        var r;
        return null == (r = e) ? r : {
            createdDetails: (0, t.exists)(r, "createdDetails") ? r.createdDetails : void 0,
            purchasedDetails: (0, t.exists)(r, "purchasedDetails") ? r.purchasedDetails : void 0,
            sharedDetails: (0, t.exists)(r, "sharedDetails") ? r.sharedDetails : void 0
        }
    }

    function s(e) {
        var r, a, i, o, s, l, u;
        return null == (r = e) ? r : {
            path: (0, t.exists)(r, "path") ? r.path : void 0,
            assetItem: (0, t.exists)(r, "assetItem") ? null == (a = r.assetItem) ? a : {
                asset: (0, t.exists)(a, "asset") ? null == (i = a.asset) ? i : {
                    createTime: (0, t.exists)(i, "createTime") ? new Date(i.createTime) : void 0,
                    updateTime: (0, t.exists)(i, "updateTime") ? new Date(i.updateTime) : void 0,
                    assetId: (0, t.exists)(i, "assetId") ? i.assetId : void 0,
                    displayName: (0, t.exists)(i, "displayName") ? i.displayName : void 0,
                    description: (0, t.exists)(i, "description") ? i.description : void 0,
                    assetType: (0, t.exists)(i, "assetType") ? i.assetType : void 0,
                    creationContext: (0, t.exists)(i, "creationContext") ? null == (o = i.creationContext) ? o : {
                        creator: (0, t.exists)(o, "creator") ? null == (s = o.creator) ? s : {
                            userId: (0, t.exists)(s, "userId") ? s.userId : void 0,
                            groupId: (0, t.exists)(s, "groupId") ? s.groupId : void 0,
                            name: (0, t.exists)(s, "name") ? s.name : void 0
                        } : void 0
                    } : void 0,
                    state: (0, t.exists)(i, "state") ? i.state : void 0,
                    assetSubType: (0, t.exists)(i, "assetSubType") ? i.assetSubType : void 0
                } : void 0,
                sources: (0, t.exists)(a, "sources") ? a.sources.map(n) : void 0,
                isPackage: (0, t.exists)(a, "isPackage") ? a.isPackage : void 0
            } : void 0,
            folderItem: (0, t.exists)(r, "folderItem") ? null == (l = r.folderItem) ? l : {
                folder: (0, t.exists)(l, "folder") ? null == (u = l.folder) ? u : {
                    folderId: (0, t.exists)(u, "folderId") ? u.folderId : void 0,
                    parentFolderId: (0, t.exists)(u, "parentFolderId") ? u.parentFolderId : void 0,
                    displayName: (0, t.exists)(u, "displayName") ? u.displayName : void 0,
                    createTime: (0, t.exists)(u, "createTime") ? new Date(u.createTime) : void 0,
                    updateTime: (0, t.exists)(u, "updateTime") ? new Date(u.updateTime) : void 0
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

    function p(e, t) {
        var r, a = String(e);
        return t && null != (r = t[a]) ? r : a
    }
    var h = function(e) {
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
                            if (null === e.filter || void 0 === e.filter) throw new t.RequiredError("filter", "Required parameter requestParameters.filter was null or undefined when calling creatorInventorySearchCreatorInventoryItems.");
                            return a = {}, void 0 !== e.query && (a.query = e.query), void 0 !== e.filter && (a.filter = function(e) {
                                for (var t = [], r = 0; r < u.length; r++) ! function(r) {
                                    var a = e[r];
                                    if (null != a) {
                                        var i = d[r];
                                        if (Array.isArray(a)) {
                                            if (0 === a.length) return;
                                            t.push("".concat(r, "=").concat(a.map(function(e) {
                                                return p(e, i)
                                            }).join(",")))
                                        } else t.push("".concat(r, "=").concat(p(a, i)))
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
                            return n = i.sent(), [2, new t.JSONApiResponse(n, function(e) {
                                return null == e ? e : {
                                    items: (0, t.exists)(e, "items") ? e.items.map(s) : void 0,
                                    nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
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
    }(t.BaseAPI);
    e.s(["AssetType", 0, o, "CreatorInventoryApi", 0, h, "SourceType", 0, l, "State", 0, {
        Invalid: "STATE_INVALID",
        Active: "STATE_ACTIVE",
        Archived: "STATE_ARCHIVED"
    }], 102211), e.s(["CreatorInventorySourceType", 0, l], 361738);
    let A = ["development-items-inventory"],
        T = ["development-item-metadata-overrides"],
        f = ["development-item-upload-overrides"],
        E = e => null != e ? e : "",
        S = e => {
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
        m = (e, t, r) => {
            e.setQueryData(T, e => {
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
        I = (e, t) => S(null == t ? void 0 : t.name) === S(e.name) && E(null == t ? void 0 : t.description) === E(e.description);
    e.s(["DEVELOPMENT_ITEMS_INVENTORY_QUERY_KEY", 0, A, "cacheDevelopmentItemMetadataUpdate", 0, (e, t) => {
        let {
            assetId: r,
            description: a,
            name: i
        } = t, o = new Date, n = {
            assetId: r,
            description: E(a),
            developConfirmed: !1,
            expiresAt: o.getTime() + 3e4,
            inventoryConfirmed: !1,
            name: i,
            updated: o
        };
        e.setQueryData(T, e => {
            let t = new Map(e);
            return t.set(r, n), t
        }), e.setQueriesData({
            queryKey: A
        }, e => {
            let t = null == e ? void 0 : e.items.find(e => e.assetId === r);
            return null == e || null == t ? e : {
                ...e,
                items: [{
                    ...t,
                    name: i,
                    updated: o
                }, ...e.items.filter(e => e.assetId !== r)]
            }
        }), e.invalidateQueries({
            queryKey: A,
            refetchType: "active"
        }), window.setTimeout(() => {
            let t = v(e, r);
            (null == t ? void 0 : t.expiresAt) === n.expiresAt && (_(e, r), e.invalidateQueries({
                queryKey: A,
                refetchType: "active"
            }))
        }, 3e4)
    }, "cacheDevelopmentItemUpload", 0, (e, t) => {
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
        e.setQueryData(f, e => {
            let t = new Map(e);
            return t.set(r, s), t
        }), e.setQueriesData({
            predicate: e => {
                let {
                    queryKey: t
                } = e;
                return ((e, t) => {
                    let [, r, a, i, o, n, , s] = t;
                    return t[0] === A[0] && r === e.scope.type && a === e.scope.id && i === e.item.assetType && (o === l.Created || "All" === o) && "string" == typeof n && null == s && e.item.name.toLocaleLowerCase().includes(n.trim().toLocaleLowerCase())
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
    }, "reconcileDeveloperItemDetailsMetadata", 0, (e, t, r) => {
        let a = v(e, t);
        return null == a ? {
            details: r
        } : I(a, r) ? (m(e, t, "develop"), {
            details: r
        }) : {
            details: {
                ...r,
                description: a.description,
                name: a.name
            },
            expiresAt: a.expiresAt
        }
    }, "reconcileDevelopmentItemsInventoryMetadata", 0, (e, t, r) => {
        let a = [],
            i = [];
        return t.forEach(t => {
            let o = v(e, t.assetId);
            if (null == o) return void i.push(t);
            if (I(o, r.get(t.assetId))) {
                m(e, t.assetId, "inventory"), i.push(t);
                return
            }
            a.push({
                ...t,
                name: o.name,
                updated: o.updated
            })
        }), a.sort((e, t) => {
            var r, a, i, o;
            return (null != (r = null == (i = t.updated) ? void 0 : i.getTime()) ? r : 0) - (null != (a = null == (o = e.updated) ? void 0 : o.getTime()) ? a : 0)
        }), [...a, ...i]
    }, "reconcileDevelopmentItemsInventoryUploads", 0, (e, t, r) => {
        let {
            assetType: a,
            pageToken: i,
            query: o,
            scope: n,
            source: s
        } = r, u = e.getQueryData(f);
        if (null == u || 0 === u.size) return [...t];
        let c = new Set(t.map(e => e.assetId)),
            d = [];
        return u.forEach((t, r) => {
            if (t.expiresAt <= Date.now()) return void y(e, r);
            if (((e, t) => {
                    let {
                        assetType: r,
                        pageToken: a,
                        query: i,
                        scope: o,
                        source: n
                    } = t;
                    return null == a && (null == o ? void 0 : o.type) === e.scope.type && o.id === e.scope.id && r === e.item.assetType && (n === l.Created || "All" === n) && e.item.name.toLocaleLowerCase().includes(i.trim().toLocaleLowerCase())
                })(t, {
                    assetType: a,
                    pageToken: i,
                    query: o,
                    scope: n,
                    source: s
                })) {
                if (c.has(r)) return void y(e, r);
                d.push(t.item)
            }
        }), d.sort((e, t) => {
            var r, a, i, o;
            return (null != (r = null == (i = t.updated) ? void 0 : i.getTime()) ? r : 0) - (null != (a = null == (o = e.updated) ? void 0 : o.getTime()) ? a : 0)
        }), [...d, ...t]
    }], 970494)
}, 408068, (e, t, r) => {
    var a = e.i(2226);
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
            p = "0123456789abcdef".split(""),
            h = [128, 32768, 8388608, -0x80000000],
            A = [0, 8, 16, 24],
            T = ["hex", "array", "digest", "buffer", "arrayBuffer", "base64"],
            f = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".split(""),
            E = [];
        if (d) {
            var S = new ArrayBuffer(68);
            l = new Uint8Array(S), E = new Uint32Array(S)
        }
        var _ = Array.isArray;
        (o.JS_MD5_NO_NODE_JS || !_) && (_ = function(e) {
            return "[object Array]" === Object.prototype.toString.call(e)
        });
        var v = ArrayBuffer.isView;
        d && (o.JS_MD5_NO_ARRAY_BUFFER_IS_VIEW || !v) && (v = function(e) {
            return "object" == typeof e && e.buffer && e.buffer.constructor === ArrayBuffer
        });
        var y = function(e) {
                var t = typeof e;
                if ("string" === t) return [e, !0];
                if ("object" !== t || null === e) throw Error(r);
                if (d && e.constructor === ArrayBuffer) return [new Uint8Array(e), !1];
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
                return t = i.from && !o.JS_MD5_NO_BUFFER_FROM ? i.from : function(e) {
                        return new i(e)
                    },
                    function(o) {
                        if ("string" == typeof o) return a.createHash("md5").update(o, "utf8").digest("hex");
                        if (null == o) throw Error(r);
                        return o.constructor === ArrayBuffer && (o = new Uint8Array(o)), _(o) || v(o) || o.constructor === i ? a.createHash("md5").update(t(o)).digest("hex") : e(o)
                    }
            },
            C = function(e) {
                return function(t, r) {
                    return new O(t, !0).update(r)[e]()
                }
            };

        function P(e) {
            if (e) E[0] = E[16] = E[1] = E[2] = E[3] = E[4] = E[5] = E[6] = E[7] = E[8] = E[9] = E[10] = E[11] = E[12] = E[13] = E[14] = E[15] = 0, this.blocks = E, this.buffer8 = l;
            else if (d) {
                var t = new ArrayBuffer(68);
                this.buffer8 = new Uint8Array(t), this.blocks = new Uint32Array(t)
            } else this.blocks = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            this.h0 = this.h1 = this.h2 = this.h3 = this.start = this.bytes = this.hBytes = 0, this.finalized = this.hashed = !1, this.first = !0
        }

        function O(e, t) {
            var r, a = y(e);
            if (e = a[0], a[1]) {
                var i, o = [],
                    n = e.length,
                    s = 0;
                for (r = 0; r < n; ++r)(i = e.charCodeAt(r)) < 128 ? o[s++] = i : (i < 2048 ? o[s++] = 192 | i >>> 6 : (i < 55296 || i >= 57344 ? o[s++] = 224 | i >>> 12 : (i = 65536 + ((1023 & i) << 10 | 1023 & e.charCodeAt(++r)), o[s++] = 240 | i >>> 18, o[s++] = 128 | i >>> 12 & 63), o[s++] = 128 | i >>> 6 & 63), o[s++] = 128 | 63 & i);
                e = o
            }
            e.length > 64 && (e = new P(!0).update(e).array());
            var l = [],
                u = [];
            for (r = 0; r < 64; ++r) {
                var c = e[r] || 0;
                l[r] = 92 ^ c, u[r] = 54 ^ c
            }
            P.call(this, t), this.update(u), this.oKeyPad = l, this.inner = !0, this.sharedMemory = t
        }
        P.prototype.update = function(e) {
            if (this.finalized) throw Error("finalize already called");
            var t = y(e);
            e = t[0];
            for (var r, a, i = t[1], o = 0, n = e.length, s = this.blocks, l = this.buffer8; o < n;) {
                if (this.hashed && (this.hashed = !1, s[0] = s[16], s[16] = s[1] = s[2] = s[3] = s[4] = s[5] = s[6] = s[7] = s[8] = s[9] = s[10] = s[11] = s[12] = s[13] = s[14] = s[15] = 0), i)
                    if (d)
                        for (a = this.start; o < n && a < 64; ++o)(r = e.charCodeAt(o)) < 128 ? l[a++] = r : (r < 2048 ? l[a++] = 192 | r >>> 6 : (r < 55296 || r >= 57344 ? l[a++] = 224 | r >>> 12 : (r = 65536 + ((1023 & r) << 10 | 1023 & e.charCodeAt(++o)), l[a++] = 240 | r >>> 18, l[a++] = 128 | r >>> 12 & 63), l[a++] = 128 | r >>> 6 & 63), l[a++] = 128 | 63 & r);
                    else
                        for (a = this.start; o < n && a < 64; ++o)(r = e.charCodeAt(o)) < 128 ? s[a >>> 2] |= r << A[3 & a++] : (r < 2048 ? s[a >>> 2] |= (192 | r >>> 6) << A[3 & a++] : (r < 55296 || r >= 57344 ? s[a >>> 2] |= (224 | r >>> 12) << A[3 & a++] : (r = 65536 + ((1023 & r) << 10 | 1023 & e.charCodeAt(++o)), s[a >>> 2] |= (240 | r >>> 18) << A[3 & a++], s[a >>> 2] |= (128 | r >>> 12 & 63) << A[3 & a++]), s[a >>> 2] |= (128 | r >>> 6 & 63) << A[3 & a++]), s[a >>> 2] |= (128 | 63 & r) << A[3 & a++]);
                else if (d)
                    for (a = this.start; o < n && a < 64; ++o) l[a++] = e[o];
                else
                    for (a = this.start; o < n && a < 64; ++o) s[a >>> 2] |= e[o] << A[3 & a++];
                this.lastByteIndex = a, this.bytes += a - this.start, a >= 64 ? (this.start = a - 64, this.hash(), this.hashed = !0) : this.start = a
            }
            return this.bytes > 0xffffffff && (this.hBytes += this.bytes / 0x100000000 | 0, this.bytes = this.bytes % 0x100000000), this
        }, P.prototype.finalize = function() {
            if (!this.finalized) {
                this.finalized = !0;
                var e = this.blocks,
                    t = this.lastByteIndex;
                e[t >>> 2] |= h[3 & t], t >= 56 && (this.hashed || this.hash(), e[0] = e[16], e[16] = e[1] = e[2] = e[3] = e[4] = e[5] = e[6] = e[7] = e[8] = e[9] = e[10] = e[11] = e[12] = e[13] = e[14] = e[15] = 0), e[14] = this.bytes << 3, e[15] = this.hBytes << 3 | this.bytes >>> 29, this.hash()
            }
        }, P.prototype.hash = function() {
            var e, t, r, a, i, o, n = this.blocks;
            this.first ? (r = ((r = (-0x10325477 ^ (a = ((a = (-0x67452302 ^ 0x77777777 & (e = ((e = n[0] - 0x28955b89) << 7 | e >>> 25) - 0x10325477 | 0)) + n[1] - 0x705f434) << 12 | a >>> 20) + e | 0) & (-0x10325477 ^ e)) + n[2] - 0x4324b227) << 17 | r >>> 15) + a | 0, t = ((t = (e ^ r & (a ^ e)) + n[3] - 0x4e748589) << 22 | t >>> 10) + r | 0) : (e = this.h0, t = this.h1, r = this.h2, e += ((a = this.h3) ^ t & (r ^ a)) + n[0] - 0x28955b88, a += (r ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ r)) + n[1] - 0x173848aa, r += (t ^ (a = (a << 12 | a >>> 20) + e | 0) & (e ^ t)) + n[2] + 0x242070db, t += (e ^ (r = (r << 17 | r >>> 15) + a | 0) & (a ^ e)) + n[3] - 0x3e423112, t = (t << 22 | t >>> 10) + r | 0), e += (a ^ t & (r ^ a)) + n[4] - 0xa83f051, a += (r ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ r)) + n[5] + 0x4787c62a, r += (t ^ (a = (a << 12 | a >>> 20) + e | 0) & (e ^ t)) + n[6] - 0x57cfb9ed, t += (e ^ (r = (r << 17 | r >>> 15) + a | 0) & (a ^ e)) + n[7] - 0x2b96aff, e += (a ^ (t = (t << 22 | t >>> 10) + r | 0) & (r ^ a)) + n[8] + 0x698098d8, a += (r ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ r)) + n[9] - 0x74bb0851, r += (t ^ (a = (a << 12 | a >>> 20) + e | 0) & (e ^ t)) + n[10] - 42063, t += (e ^ (r = (r << 17 | r >>> 15) + a | 0) & (a ^ e)) + n[11] - 0x76a32842, e += (a ^ (t = (t << 22 | t >>> 10) + r | 0) & (r ^ a)) + n[12] + 0x6b901122, a += (r ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ r)) + n[13] - 0x2678e6d, r += (t ^ (a = (a << 12 | a >>> 20) + e | 0) & (e ^ t)) + n[14] - 0x5986bc72, t += (e ^ (r = (r << 17 | r >>> 15) + a | 0) & (a ^ e)) + n[15] + 0x49b40821, t = (t << 22 | t >>> 10) + r | 0, e += (r ^ a & (t ^ r)) + n[1] - 0x9e1da9e, e = (e << 5 | e >>> 27) + t | 0, a += (t ^ r & (e ^ t)) + n[6] - 0x3fbf4cc0, a = (a << 9 | a >>> 23) + e | 0, r += (e ^ t & (a ^ e)) + n[11] + 0x265e5a51, r = (r << 14 | r >>> 18) + a | 0, t += (a ^ e & (r ^ a)) + n[0] - 0x16493856, t = (t << 20 | t >>> 12) + r | 0, e += (r ^ a & (t ^ r)) + n[5] - 0x29d0efa3, e = (e << 5 | e >>> 27) + t | 0, a += (t ^ r & (e ^ t)) + n[10] + 0x2441453, a = (a << 9 | a >>> 23) + e | 0, r += (e ^ t & (a ^ e)) + n[15] - 0x275e197f, r = (r << 14 | r >>> 18) + a | 0, t += (a ^ e & (r ^ a)) + n[4] - 0x182c0438, t = (t << 20 | t >>> 12) + r | 0, e += (r ^ a & (t ^ r)) + n[9] + 0x21e1cde6, e = (e << 5 | e >>> 27) + t | 0, a += (t ^ r & (e ^ t)) + n[14] - 0x3cc8f82a, a = (a << 9 | a >>> 23) + e | 0, r += (e ^ t & (a ^ e)) + n[3] - 0xb2af279, r = (r << 14 | r >>> 18) + a | 0, t += (a ^ e & (r ^ a)) + n[8] + 0x455a14ed, t = (t << 20 | t >>> 12) + r | 0, e += (r ^ a & (t ^ r)) + n[13] - 0x561c16fb, e = (e << 5 | e >>> 27) + t | 0, a += (t ^ r & (e ^ t)) + n[2] - 0x3105c08, a = (a << 9 | a >>> 23) + e | 0, r += (e ^ t & (a ^ e)) + n[7] + 0x676f02d9, r = (r << 14 | r >>> 18) + a | 0, t += (a ^ e & (r ^ a)) + n[12] - 0x72d5b376, e += ((i = (t = (t << 20 | t >>> 12) + r | 0) ^ r) ^ a) + n[5] - 378558, a += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + n[8] - 0x788e097f, r += ((o = (a = (a << 11 | a >>> 21) + e | 0) ^ e) ^ t) + n[11] + 0x6d9d6122, t += (o ^ (r = (r << 16 | r >>> 16) + a | 0)) + n[14] - 0x21ac7f4, e += ((i = (t = (t << 23 | t >>> 9) + r | 0) ^ r) ^ a) + n[1] - 0x5b4115bc, a += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + n[4] + 0x4bdecfa9, r += ((o = (a = (a << 11 | a >>> 21) + e | 0) ^ e) ^ t) + n[7] - 0x944b4a0, t += (o ^ (r = (r << 16 | r >>> 16) + a | 0)) + n[10] - 0x41404390, e += ((i = (t = (t << 23 | t >>> 9) + r | 0) ^ r) ^ a) + n[13] + 0x289b7ec6, a += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + n[0] - 0x155ed806, r += ((o = (a = (a << 11 | a >>> 21) + e | 0) ^ e) ^ t) + n[3] - 0x2b10cf7b, t += (o ^ (r = (r << 16 | r >>> 16) + a | 0)) + n[6] + 0x4881d05, e += ((i = (t = (t << 23 | t >>> 9) + r | 0) ^ r) ^ a) + n[9] - 0x262b2fc7, a += (i ^ (e = (e << 4 | e >>> 28) + t | 0)) + n[12] - 0x1924661b, r += ((o = (a = (a << 11 | a >>> 21) + e | 0) ^ e) ^ t) + n[15] + 0x1fa27cf8, t += (o ^ (r = (r << 16 | r >>> 16) + a | 0)) + n[2] - 0x3b53a99b, t = (t << 23 | t >>> 9) + r | 0, e += (r ^ (t | ~a)) + n[0] - 0xbd6ddbc, e = (e << 6 | e >>> 26) + t | 0, a += (t ^ (e | ~r)) + n[7] + 0x432aff97, a = (a << 10 | a >>> 22) + e | 0, r += (e ^ (a | ~t)) + n[14] - 0x546bdc59, r = (r << 15 | r >>> 17) + a | 0, t += (a ^ (r | ~e)) + n[5] - 0x36c5fc7, t = (t << 21 | t >>> 11) + r | 0, e += (r ^ (t | ~a)) + n[12] + 0x655b59c3, e = (e << 6 | e >>> 26) + t | 0, a += (t ^ (e | ~r)) + n[3] - 0x70f3336e, a = (a << 10 | a >>> 22) + e | 0, r += (e ^ (a | ~t)) + n[10] - 1051523, r = (r << 15 | r >>> 17) + a | 0, t += (a ^ (r | ~e)) + n[1] - 0x7a7ba22f, t = (t << 21 | t >>> 11) + r | 0, e += (r ^ (t | ~a)) + n[8] + 0x6fa87e4f, e = (e << 6 | e >>> 26) + t | 0, a += (t ^ (e | ~r)) + n[15] - 0x1d31920, a = (a << 10 | a >>> 22) + e | 0, r += (e ^ (a | ~t)) + n[6] - 0x5cfebcec, r = (r << 15 | r >>> 17) + a | 0, t += (a ^ (r | ~e)) + n[13] + 0x4e0811a1, t = (t << 21 | t >>> 11) + r | 0, e += (r ^ (t | ~a)) + n[4] - 0x8ac817e, e = (e << 6 | e >>> 26) + t | 0, a += (t ^ (e | ~r)) + n[11] - 0x42c50dcb, a = (a << 10 | a >>> 22) + e | 0, r += (e ^ (a | ~t)) + n[2] + 0x2ad7d2bb, r = (r << 15 | r >>> 17) + a | 0, t += (a ^ (r | ~e)) + n[9] - 0x14792c6f, t = (t << 21 | t >>> 11) + r | 0, this.first ? (this.h0 = e + 0x67452301 | 0, this.h1 = t - 0x10325477 | 0, this.h2 = r - 0x67452302 | 0, this.h3 = a + 0x10325476 | 0, this.first = !1) : (this.h0 = this.h0 + e | 0, this.h1 = this.h1 + t | 0, this.h2 = this.h2 + r | 0, this.h3 = this.h3 + a | 0)
        }, P.prototype.hex = function() {
            this.finalize();
            var e = this.h0,
                t = this.h1,
                r = this.h2,
                a = this.h3;
            return p[e >>> 4 & 15] + p[15 & e] + p[e >>> 12 & 15] + p[e >>> 8 & 15] + p[e >>> 20 & 15] + p[e >>> 16 & 15] + p[e >>> 28 & 15] + p[e >>> 24 & 15] + p[t >>> 4 & 15] + p[15 & t] + p[t >>> 12 & 15] + p[t >>> 8 & 15] + p[t >>> 20 & 15] + p[t >>> 16 & 15] + p[t >>> 28 & 15] + p[t >>> 24 & 15] + p[r >>> 4 & 15] + p[15 & r] + p[r >>> 12 & 15] + p[r >>> 8 & 15] + p[r >>> 20 & 15] + p[r >>> 16 & 15] + p[r >>> 28 & 15] + p[r >>> 24 & 15] + p[a >>> 4 & 15] + p[15 & a] + p[a >>> 12 & 15] + p[a >>> 8 & 15] + p[a >>> 20 & 15] + p[a >>> 16 & 15] + p[a >>> 28 & 15] + p[a >>> 24 & 15]
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
            for (var e, t, r, a = "", i = this.array(), o = 0; o < 15;) e = i[o++], t = i[o++], r = i[o++], a += f[e >>> 2] + f[(e << 4 | t >>> 4) & 63] + f[(t << 2 | r >>> 6) & 63] + f[63 & r];
            return a + (f[(e = i[o]) >>> 2] + f[e << 4 & 63] + "==")
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
        else o.md5 = w, c && (e.r, void 0 !== w && e.v(w))
    }()
}]);

//# debugId=a45a134d-999a-3be7-fe09-7e7d8809275e
//# sourceMappingURL=38znjfh_7e1_h.js.map