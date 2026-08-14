;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "9be09e2f-23ae-d9ae-973a-77881baeace6")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 968284, 129882, e => {
    "use strict";
    var t, a, o = e.i(721281),
        r = e.i(408068),
        n = e.i(284856),
        i = ((t = {}).MD5_CALCULATION = "MD5_CALCULATION", t.MULTIPART_START = "MULTIPART_START", t.CHUNK_UPLOAD = "CHUNK_UPLOAD", t.CHUNK_COMPLETE = "CHUNK_COMPLETE", t.MULTIPART_COMPLETE = "MULTIPART_COMPLETE", t.CHUNK_UPLOAD_ABORT = "CHUNK_UPLOAD_ABORT", t.CHUNK_COMPLETE_ABORT = "CHUNK_COMPLETE_ABORT", t);
    class l extends Error {
        constructor(e, t, a, r, n, i, l) {
            super(e), (0, o._)(this, "stage", void 0), (0, o._)(this, "operationId", void 0), (0, o._)(this, "chunkIndex", void 0), (0, o._)(this, "httpStatus", void 0), (0, o._)(this, "errorCode", void 0), (0, o._)(this, "retryAttempt", void 0), this.name = "MultipartUploadError", this.stage = t, this.operationId = a, this.chunkIndex = r, this.httpStatus = n, this.errorCode = i, this.retryAttempt = l
        }
    }
    e.s(["MultipartUploadError", 0, l, "MultipartUploadStage", () => i], 129882);
    var s = e.i(650502),
        c = e.i(272593),
        d = ((a = {}).ASSET_TYPE = "assetType", a.DESCRIPTION = "description", a.DISPLAY_NAME = "displayName", a.ICON = "icon", a.MODERATION_RESULT = "moderationResult", a.PREVIEWS = "previews", a.FACEBOOK_SOCIAL_LINK = "facebookSocialLink", a.TWITTER_SOCIAL_LINK = "twitterSocialLink", a.YOUTUBE_SOCIAL_LINK = "youtubeSocialLink", a.TWITCH_SOCIAL_LINK = "twitchSocialLink", a.DISCORD_SOCIAL_LINK = "discordSocialLink", a.GITHUB_SOCIAL_LINK = "githubSocialLink", a.ROBLOX_SOCIAL_LINK = "robloxSocialLink", a.DEVFORUM_SOCIAL_LINK = "devForumSocialLink", a.TRY_ASSET_SOCIAL_LINK = "tryAssetSocialLink", a);
    let u = (0, s.getBEDEV2ServiceBasePath)("assets/user-auth"),
        p = "x-csrf-token",
        h = JSON.stringify({
            AssetPrivacy: "OpenUse"
        });
    async function f(e, t, a) {
        let o = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 0;
        try {
            return await e()
        } catch (n) {
            let r = n instanceof Error ? n : Error(String(n));
            if (o < t) {
                let r = a(o);
                return await new Promise(e => {
                    setTimeout(e, r)
                }), f(e, t, a, o + 1)
            }
            throw r
        }
    }
    let m = async () => {
        try {
            return (await fetch("".concat(u, "/v1/assets"), {
                method: "PATCH",
                credentials: "include"
            })).headers.get(p)
        } catch (e) {
            return null
        }
    }, y = new class e {
        async createAssetAndGetOperationId(t, a) {
            let o = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                r = o ? e.generateRequestInitForCreatingOpenUseAsset(t, a) : {},
                n = await m();
            n && (r.headers = {
                [p]: n
            });
            let i = await this.assetsUploadApi.assetsCreateAsset({
                request: t,
                fileContent: a
            }, r);
            return e.parseOperationId(i.path)
        }
        async createAssetAndGetOperationIdWithMultipart(t, a, o, r) {
            var n;
            let s, c, d, u, h = null != o && o ? e.generateRequestInitForCreatingOpenUseAsset(t, a) : {},
                y = await m();
            y && (h.headers = {
                [p]: y,
                "Content-Type": "application/json; charset=utf-8"
            }), r && r(1);
            try {
                let t = await e.calculateMD5(a);
                s = t.hash, c = t.data
            } catch (e) {
                throw new l("Failed to calculate MD5 for file: ".concat(e instanceof Error ? e.message : String(e)), i.MD5_CALCULATION, void 0, void 0, void 0, "MD5_CALCULATION_FAILED")
            }
            r && r(5);
            let b = e.makeUploadPlan(a.size);
            r && r(10);
            let g = {
                    asset: t,
                    file: {
                        filesize: a.size,
                        md5CheckSum: s,
                        chunkPlan: b,
                        contentType: a.type
                    }
                },
                C = [];
            try {
                d = await this.multipartUploadApi.assetsCreateAssetWithMultipartUpload({
                    multipartUploadStartRequest: g
                }, h)
            } catch (e) {
                throw new l("Failed to start multipart upload: ".concat(e instanceof Error ? e.message : String(e)), i.MULTIPART_START, void 0, void 0, e instanceof Error && "status" in e ? e.status : void 0, "MULTIPART_START_FAILED")
            }
            if (r && r(15), 0 === (C = null != (n = d.uploadUrls) ? n : []).length) throw new l("Upload URLs are empty from multipart start response", i.MULTIPART_START, void 0, void 0, void 0, "EMPTY_UPLOAD_URLS");
            let A = e.parseOperationId(d.operationPath);
            if ("" === A) throw new l("Operation ID is empty from multipart start response", i.MULTIPART_START, void 0, void 0, void 0, "EMPTY_OPERATION_ID");
            try {
                u = await e.uploadChunks(C, c, A, r ? e => {
                    r(Math.min(15 + .65 * e, 80))
                } : void 0)
            } catch (e) {
                try {
                    await this.multipartUploadApi.assetsMultipartUploadAbort({
                        operationId: A
                    }, h)
                } catch (t) {
                    throw new l("Chunk upload failed and abort also failed. Original error: ".concat(e instanceof Error ? e.message : String(e), ". Abort error: ").concat(t instanceof Error ? t.message : String(t)), i.CHUNK_UPLOAD_ABORT, A, void 0, void 0, "ABORT_FAILED")
                }
                if (e instanceof l) throw e;
                throw new l("Chunk upload failed: ".concat(e instanceof Error ? e.message : String(e)), i.CHUNK_UPLOAD, A, void 0, void 0, "CHUNK_UPLOAD_FAILED")
            }
            r && r(80);
            try {
                await Promise.all(u.map((e, t) => {
                    let a = t + 1;
                    return f(async () => {
                        try {
                            await this.multipartUploadApi.assetsMultipartUploadChunkComplete({
                                operationId: A,
                                multipartUploadChunkCompleteRequest: {
                                    chunkNum: a,
                                    eTag: e
                                }
                            }, h)
                        } catch (e) {
                            throw new l("Failed to complete chunk ".concat(a, ": ").concat(e instanceof Error ? e.message : String(e)), i.CHUNK_COMPLETE, A, a, e instanceof Error && "status" in e ? e.status : void 0, "CHUNK_COMPLETE_FAILED")
                        }
                    }, 3, e => 1e3 * 2 ** e)
                }))
            } catch (e) {
                try {
                    await this.multipartUploadApi.assetsMultipartUploadAbort({
                        operationId: A
                    }, h)
                } catch (t) {
                    throw new l("Chunk complete failed and abort also failed. Original error: ".concat(e instanceof Error ? e.message : String(e), ". Abort error: ").concat(t instanceof Error ? t.message : String(t)), i.CHUNK_COMPLETE_ABORT, A, void 0, void 0, "ABORT_FAILED")
                }
                if (e instanceof l) throw e;
                throw new l("Chunk complete failed: ".concat(e instanceof Error ? e.message : String(e)), i.CHUNK_COMPLETE, A, void 0, void 0, "CHUNK_COMPLETE_FAILED")
            }
            r && r(90);
            try {
                await this.multipartUploadApi.assetsMultipartUploadComplete({
                    operationId: A
                }, h)
            } catch (e) {
                throw new l("Failed to complete multipart upload: ".concat(e instanceof Error ? e.message : String(e)), i.MULTIPART_COMPLETE, A, void 0, e instanceof Error && "status" in e ? e.status : void 0, "MULTIPART_COMPLETE_FAILED")
            }
            return r && r(100), A
        }
        async updateAssetAndGetOperationId(t, a, o, r) {
            let n = await this.assetsUploadApi.assetsUpdateAsset({
                assetId: t,
                updateMask: a,
                request: o,
                fileContent: r
            });
            return e.parseOperationId(n.path)
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
                a = await t.raw.json();
            return null !== a && "object" == typeof a ? a : {}
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
            let a = new FormData;
            return a.append("request", JSON.stringify(e)), a.append("fileContent", t), a.append("additionalParameters", h), {
                body: a
            }
        }
        static async calculateMD5(e) {
            let t = await new Promise((t, a) => {
                let o = new FileReader;
                o.onload = e => {
                    var o;
                    let r = null == e || null == (o = e.target) ? void 0 : o.result;
                    r instanceof ArrayBuffer ? t(new Uint8Array(r)) : a(Error("Failed to read file"))
                }, o.onerror = () => a(o.error), o.readAsArrayBuffer(e)
            });
            return {
                hash: (0, r.md5)(t),
                data: t
            }
        }
        static makeUploadPlan(e) {
            let t = [],
                a = 0;
            for (; a < e;) {
                let o = Math.min(5242880, e - a);
                t.push(o), a += 5242880
            }
            return t
        }
        static async uploadChunks(e, t, a, o) {
            let r = e.length,
                n = 0,
                s = o ? () => {
                    o(Math.min((n += 1) / r * 100, 99))
                } : void 0,
                c = e.map((e, o) => {
                    let r = Number(e.contentStart || 0),
                        n = Number(e.contentLength || 0);
                    return f(async () => {
                        if (!(null == e ? void 0 : e.url)) throw new l("No URL found for chunk ".concat(o + 1), i.CHUNK_UPLOAD, a, o + 1, void 0, "MISSING_UPLOAD_URL");
                        let c = t.slice(r, r + n);
                        if (c.length !== n) throw new l("Chunk size mismatch for chunk ".concat(o + 1, ": expected ").concat(n, ", got ").concat(c.length), i.CHUNK_UPLOAD, a, o + 1, void 0, "CHUNK_SIZE_MISMATCH");
                        let d = await fetch(e.url, {
                            method: "PUT",
                            body: c
                        });
                        if (!d.ok) throw new l("Failed to upload chunk ".concat(o + 1, ": ").concat(d.status, " ").concat(d.statusText), i.CHUNK_UPLOAD, a, o + 1, d.status, "CHUNK_UPLOAD_HTTP_ERROR");
                        let u = d.headers.get("ETag");
                        if (!u) throw new l("No ETag received for chunk ".concat(o + 1), i.CHUNK_UPLOAD, a, o + 1, d.status, "MISSING_ETAG");
                        return s && s(), u.replaceAll(/['"]/g, "")
                    }, 3, e => 1e3 * 2 ** e)
                }),
                d = await Promise.all(c);
            return o && o(100), d
        }
        constructor() {
            (0, o._)(this, "assetsUploadApi", void 0), (0, o._)(this, "uploadStatusApi", void 0), (0, o._)(this, "multipartUploadApi", void 0);
            const e = (0, c.createClientConfiguration)("assets/user-auth", "bedev2");
            this.assetsUploadApi = new n.AssetApi(e), this.uploadStatusApi = new n.UploadStatusApi(e), this.multipartUploadApi = new n.MultipartUploadApi(e)
        }
    };
    e.s(["FieldMask", () => d, "default", 0, y], 968284)
}, 729904, e => {
    "use strict";
    e.s(["default", 0, function() {
        return "production"
    }])
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
    var a = e.i(221628),
        o = e.i(969708);
    e.i(309742), e.s(["N", 0, function(e) {
        let {
            children: r,
            defer: n = !1,
            fallback: i = null
        } = e, [l, s] = t.useState(!1);
        return (0, o.u)(() => {
            n || s(!0)
        }, [n]), t.useEffect(() => {
            n && s(!0)
        }, [n]), (0, a.jsx)(t.Fragment, {
            children: l ? r : i
        })
    }])
}, 517379, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340);

    function o(e) {
        return "small" === e ? 16 : 20
    }

    function r(e) {
        return "small" === e ? 18 : 24
    }
    var n = e.i(614515),
        i = e.i(993807),
        l = e.i(696180),
        s = e.i(273589),
        c = e.i(549534),
        d = e.i(962560),
        u = e.i(42569),
        p = e.i(576881),
        h = e.i(221628),
        f = e.i(963320);

    function m(e) {
        return (0, s.g)("MuiSwitch", e)
    }
    e.i(197094);
    var y = (0, l.g)("MuiSwitch", ["root", "edgeStart", "edgeEnd", "switchBase", "colorPrimary", "colorSecondary", "sizeSmall", "sizeMedium", "checked", "disabled", "input", "thumb", "track"]);
    let b = ["className", "color", "edge", "size", "sx"],
        g = (0, u.s)("span", {
            name: "MuiSwitch",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, a.edge && t["edge".concat((0, s.a)(a.edge))], t["size".concat((0, s.a)(a.size))]]
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
                    ["& .".concat(y.thumb)]: {
                        width: 16,
                        height: 16
                    },
                    ["& .".concat(y.switchBase)]: {
                        padding: 4,
                        ["&.".concat(y.checked)]: {
                            transform: "translateX(16px)"
                        }
                    }
                }
            }]
        }),
        C = (0, u.s)(p.S, {
            name: "MuiSwitch",
            slot: "SwitchBase",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.switchBase, {
                    ["& .".concat(y.input)]: t.input
                }, "default" !== a.color && t["color".concat((0, s.a)(a.color))]]
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
                ["&.".concat(y.checked)]: {
                    transform: "translateX(20px)"
                },
                ["&.".concat(y.disabled)]: {
                    color: t.vars ? t.vars.palette.Switch.defaultDisabledColor : "".concat("light" === t.palette.mode ? t.palette.grey[100] : t.palette.grey[600])
                },
                ["&.".concat(y.checked, " + .").concat(y.track)]: {
                    opacity: .5
                },
                ["&.".concat(y.disabled, " + .").concat(y.track)]: {
                    opacity: t.vars ? t.vars.opacity.switchTrackDisabled : "" + ("light" === t.palette.mode ? .12 : .2)
                },
                ["& .".concat(y.input)]: {
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
                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette.action.activeChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, s.b)(t.palette.action.active, t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                },
                variants: [...Object.entries(t.palette).filter(e => {
                    let [, t] = e;
                    return t.main && t.light
                }).map(e => {
                    let [a] = e;
                    return {
                        props: {
                            color: a
                        },
                        style: {
                            ["&.".concat(y.checked)]: {
                                color: (t.vars || t).palette[a].main,
                                "&:hover": {
                                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette[a].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, s.b)(t.palette[a].main, t.palette.action.hoverOpacity),
                                    "@media (hover: none)": {
                                        backgroundColor: "transparent"
                                    }
                                },
                                ["&.".concat(y.disabled)]: {
                                    color: t.vars ? t.vars.palette.Switch["".concat(a, "DisabledColor")] : "".concat("light" === t.palette.mode ? (0, s.l)(t.palette[a].main, .62) : (0, s.j)(t.palette[a].main, .55))
                                }
                            },
                            ["&.".concat(y.checked, " + .").concat(y.track)]: {
                                backgroundColor: (t.vars || t).palette[a].main
                            }
                        }
                    }
                })]
            }
        }),
        A = (0, u.s)("span", {
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
        k = (0, u.s)("span", {
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
        v = a.forwardRef(function(e, t) {
            let a = (0, f.u)({
                    props: e,
                    name: "MuiSwitch"
                }),
                {
                    className: o,
                    color: r = "primary",
                    edge: n = !1,
                    size: i = "medium",
                    sx: l
                } = a,
                c = (0, s._)(a, b),
                p = (0, d._)({}, a, {
                    color: r,
                    edge: n,
                    size: i
                }),
                y = (e => {
                    let {
                        classes: t,
                        edge: a,
                        size: o,
                        color: r,
                        checked: n,
                        disabled: i
                    } = e, l = {
                        root: ["root", a && "edge".concat((0, s.a)(a)), "size".concat((0, s.a)(o))],
                        switchBase: ["switchBase", "color".concat((0, s.a)(r)), n && "checked", i && "disabled"],
                        thumb: ["thumb"],
                        track: ["track"],
                        input: ["input"]
                    }, c = (0, u.a)(l, m, t);
                    return (0, d._)({}, t, c)
                })(p),
                v = (0, h.jsx)(k, {
                    className: y.thumb,
                    ownerState: p
                });
            return (0, h.jsxs)(g, {
                className: (0, u.c)(y.root, o),
                sx: l,
                ownerState: p,
                children: [(0, h.jsx)(C, (0, d._)({
                    type: "checkbox",
                    icon: v,
                    checkedIcon: v,
                    ref: t,
                    ownerState: p
                }, c, {
                    classes: (0, d._)({}, y, {
                        root: y.switchBase
                    })
                })), (0, h.jsx)(A, {
                    className: y.track,
                    ownerState: p
                })]
            })
        });
    var w = (0, n.default)({
            name: "Switch"
        })(function(e, t, a) {
            var n, i, l, s, d = t.size;
            return {
                root: ((n = {})["&:has(> .".concat(y.colorPrimary, ".").concat(y.disabled, ".").concat(y.checked, ")")] = {
                    opacity: .5
                }, n["&:has(> .".concat(y.colorSecondary, ".").concat(y.disabled, ")")] = {
                    opacity: .5
                }, n),
                switchBase: ((i = {
                    color: e.palette.actionV2.primary.fill
                })["&.".concat(y.checked, " + .").concat(y.track, ".").concat(a.track)] = {
                    opacity: .38
                }, i["&.".concat(y.disabled, " + .").concat(y.track, ".").concat(a.track)] = {
                    opacity: .38
                }, i),
                thumb: {
                    position: "relative",
                    pointerEvents: "none",
                    width: o(d),
                    height: o(d),
                    borderRadius: "50%",
                    boxShadow: e.elevation.subtle
                },
                track: {
                    opacity: .38
                },
                progress: {
                    color: e.palette.actionV2.primaryBrand.fill,
                    position: "absolute",
                    top: (o(d) - r(d)) / 2,
                    left: (o(d) - r(d)) / 2,
                    zIndex: 1
                },
                colorPrimary: ((l = {})["& .".concat(y.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, l["& .".concat(y.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, l["&.".concat(y.checked, " .").concat(y.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, l["&.".concat(y.checked, " .").concat(y.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill,
                    opacity: .38
                }, l["&.".concat(y.checked, " .").concat(c.c.root)] = {
                    color: e.palette.actionV2.primary.fill
                }, l["&.".concat(y.disabled, " .").concat(y.thumb)] = {
                    background: e.palette.components.switch.disabledKnob
                }, l["&.".concat(y.disabled, " .").concat(y.track)] = {
                    background: e.palette.components.switch.slideFill
                }, l["&.".concat(y.disabled, ".").concat(y.checked, " .").concat(y.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, l["&.".concat(y.disabled, ".").concat(y.checked, " .").concat(y.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, l["&.".concat(y.disabled, " .").concat(c.c.root)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, l),
                colorSecondary: ((s = {})["& .".concat(y.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, s["& .".concat(y.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, s)
            }
        }),
        E = (0, a.forwardRef)(function(e, n) {
            var l, s = e.classes,
                d = e.color,
                u = e.loading,
                p = e.size,
                h = e.checkedIcon,
                f = e.icon,
                m = e["aria-label"],
                b = e.inputProps,
                g = e.className,
                C = (0, t.a)(e, ["classes", "color", "loading", "size", "checkedIcon", "icon", "aria-label", "inputProps", "className"]),
                A = w((0, t._)((0, t._)({}, C), {
                    loading: u,
                    size: p,
                    checkedIcon: h,
                    icon: f,
                    "aria-label": m
                }), {
                    props: {
                        classes: (0, i.default)(s, g)
                    }
                }).classes,
                k = A.thumb,
                E = A.progress,
                _ = (0, t.a)(A, ["thumb", "progress"]),
                S = a.default.createElement("div", {
                    className: "".concat(y.thumb, " ").concat(k)
                }, u && a.default.createElement(c.C, {
                    thickness: ((l = r(p)) - o(p)) * 44 / (2 * l),
                    size: r(p),
                    classes: {
                        root: E
                    }
                }));
            return a.default.createElement(v, (0, t._)({}, C, {
                checkedIcon: null != h ? h : S,
                classes: _,
                color: void 0 === d ? "primary" : d,
                icon: null != f ? f : S,
                ref: n,
                size: p,
                inputProps: (0, t._)((0, t._)({}, b), {
                    "aria-label": m
                })
            }))
        });
    e.s(["Switch", 0, E], 517379)
}, 408068, (e, t, a) => {
    var o = e.i(2226);
    ! function() {
        "use strict";
        var a = "input is invalid type",
            r = "object" == typeof window,
            n = r ? window : {};
        n.JS_MD5_NO_WINDOW && (r = !1);
        var i = !r && "object" == typeof self,
            l = !n.JS_MD5_NO_NODE_JS && "object" == typeof o.default && o.default.versions && o.default.versions.node;
        l ? n = e.g : i && (n = self);
        var s, c = !n.JS_MD5_NO_COMMON_JS && t.exports,
            d = "function" == typeof define && define.amd,
            u = !n.JS_MD5_NO_ARRAY_BUFFER && "u" > typeof ArrayBuffer,
            p = "0123456789abcdef".split(""),
            h = [128, 32768, 8388608, -0x80000000],
            f = [0, 8, 16, 24],
            m = ["hex", "array", "digest", "buffer", "arrayBuffer", "base64"],
            y = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".split(""),
            b = [];
        if (u) {
            var g = new ArrayBuffer(68);
            s = new Uint8Array(g), b = new Uint32Array(g)
        }
        var C = Array.isArray;
        (n.JS_MD5_NO_NODE_JS || !C) && (C = function(e) {
            return "[object Array]" === Object.prototype.toString.call(e)
        });
        var A = ArrayBuffer.isView;
        u && (n.JS_MD5_NO_ARRAY_BUFFER_IS_VIEW || !A) && (A = function(e) {
            return "object" == typeof e && e.buffer && e.buffer.constructor === ArrayBuffer
        });
        var k = function(e) {
                var t = typeof e;
                if ("string" === t) return [e, !0];
                if ("object" !== t || null === e) throw Error(a);
                if (u && e.constructor === ArrayBuffer) return [new Uint8Array(e), !1];
                if (!C(e) && !A(e)) throw Error(a);
                return [e, !1]
            },
            v = function(e) {
                return function(t) {
                    return new _(!0).update(t)[e]()
                }
            },
            w = function(e) {
                var t, o = {},
                    r = void 0;
                return t = r.from && !n.JS_MD5_NO_BUFFER_FROM ? r.from : function(e) {
                        return new r(e)
                    },
                    function(n) {
                        if ("string" == typeof n) return o.createHash("md5").update(n, "utf8").digest("hex");
                        if (null == n) throw Error(a);
                        return n.constructor === ArrayBuffer && (n = new Uint8Array(n)), C(n) || A(n) || n.constructor === r ? o.createHash("md5").update(t(n)).digest("hex") : e(n)
                    }
            },
            E = function(e) {
                return function(t, a) {
                    return new S(t, !0).update(a)[e]()
                }
            };

        function _(e) {
            if (e) b[0] = b[16] = b[1] = b[2] = b[3] = b[4] = b[5] = b[6] = b[7] = b[8] = b[9] = b[10] = b[11] = b[12] = b[13] = b[14] = b[15] = 0, this.blocks = b, this.buffer8 = s;
            else if (u) {
                var t = new ArrayBuffer(68);
                this.buffer8 = new Uint8Array(t), this.blocks = new Uint32Array(t)
            } else this.blocks = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            this.h0 = this.h1 = this.h2 = this.h3 = this.start = this.bytes = this.hBytes = 0, this.finalized = this.hashed = !1, this.first = !0
        }

        function S(e, t) {
            var a, o = k(e);
            if (e = o[0], o[1]) {
                var r, n = [],
                    i = e.length,
                    l = 0;
                for (a = 0; a < i; ++a)(r = e.charCodeAt(a)) < 128 ? n[l++] = r : (r < 2048 ? n[l++] = 192 | r >>> 6 : (r < 55296 || r >= 57344 ? n[l++] = 224 | r >>> 12 : (r = 65536 + ((1023 & r) << 10 | 1023 & e.charCodeAt(++a)), n[l++] = 240 | r >>> 18, n[l++] = 128 | r >>> 12 & 63), n[l++] = 128 | r >>> 6 & 63), n[l++] = 128 | 63 & r);
                e = n
            }
            e.length > 64 && (e = new _(!0).update(e).array());
            var s = [],
                c = [];
            for (a = 0; a < 64; ++a) {
                var d = e[a] || 0;
                s[a] = 92 ^ d, c[a] = 54 ^ d
            }
            _.call(this, t), this.update(c), this.oKeyPad = s, this.inner = !0, this.sharedMemory = t
        }
        _.prototype.update = function(e) {
            if (this.finalized) throw Error("finalize already called");
            var t = k(e);
            e = t[0];
            for (var a, o, r = t[1], n = 0, i = e.length, l = this.blocks, s = this.buffer8; n < i;) {
                if (this.hashed && (this.hashed = !1, l[0] = l[16], l[16] = l[1] = l[2] = l[3] = l[4] = l[5] = l[6] = l[7] = l[8] = l[9] = l[10] = l[11] = l[12] = l[13] = l[14] = l[15] = 0), r)
                    if (u)
                        for (o = this.start; n < i && o < 64; ++n)(a = e.charCodeAt(n)) < 128 ? s[o++] = a : (a < 2048 ? s[o++] = 192 | a >>> 6 : (a < 55296 || a >= 57344 ? s[o++] = 224 | a >>> 12 : (a = 65536 + ((1023 & a) << 10 | 1023 & e.charCodeAt(++n)), s[o++] = 240 | a >>> 18, s[o++] = 128 | a >>> 12 & 63), s[o++] = 128 | a >>> 6 & 63), s[o++] = 128 | 63 & a);
                    else
                        for (o = this.start; n < i && o < 64; ++n)(a = e.charCodeAt(n)) < 128 ? l[o >>> 2] |= a << f[3 & o++] : (a < 2048 ? l[o >>> 2] |= (192 | a >>> 6) << f[3 & o++] : (a < 55296 || a >= 57344 ? l[o >>> 2] |= (224 | a >>> 12) << f[3 & o++] : (a = 65536 + ((1023 & a) << 10 | 1023 & e.charCodeAt(++n)), l[o >>> 2] |= (240 | a >>> 18) << f[3 & o++], l[o >>> 2] |= (128 | a >>> 12 & 63) << f[3 & o++]), l[o >>> 2] |= (128 | a >>> 6 & 63) << f[3 & o++]), l[o >>> 2] |= (128 | 63 & a) << f[3 & o++]);
                else if (u)
                    for (o = this.start; n < i && o < 64; ++n) s[o++] = e[n];
                else
                    for (o = this.start; n < i && o < 64; ++n) l[o >>> 2] |= e[n] << f[3 & o++];
                this.lastByteIndex = o, this.bytes += o - this.start, o >= 64 ? (this.start = o - 64, this.hash(), this.hashed = !0) : this.start = o
            }
            return this.bytes > 0xffffffff && (this.hBytes += this.bytes / 0x100000000 | 0, this.bytes = this.bytes % 0x100000000), this
        }, _.prototype.finalize = function() {
            if (!this.finalized) {
                this.finalized = !0;
                var e = this.blocks,
                    t = this.lastByteIndex;
                e[t >>> 2] |= h[3 & t], t >= 56 && (this.hashed || this.hash(), e[0] = e[16], e[16] = e[1] = e[2] = e[3] = e[4] = e[5] = e[6] = e[7] = e[8] = e[9] = e[10] = e[11] = e[12] = e[13] = e[14] = e[15] = 0), e[14] = this.bytes << 3, e[15] = this.hBytes << 3 | this.bytes >>> 29, this.hash()
            }
        }, _.prototype.hash = function() {
            var e, t, a, o, r, n, i = this.blocks;
            this.first ? (a = ((a = (-0x10325477 ^ (o = ((o = (-0x67452302 ^ 0x77777777 & (e = ((e = i[0] - 0x28955b89) << 7 | e >>> 25) - 0x10325477 | 0)) + i[1] - 0x705f434) << 12 | o >>> 20) + e | 0) & (-0x10325477 ^ e)) + i[2] - 0x4324b227) << 17 | a >>> 15) + o | 0, t = ((t = (e ^ a & (o ^ e)) + i[3] - 0x4e748589) << 22 | t >>> 10) + a | 0) : (e = this.h0, t = this.h1, a = this.h2, e += ((o = this.h3) ^ t & (a ^ o)) + i[0] - 0x28955b88, o += (a ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ a)) + i[1] - 0x173848aa, a += (t ^ (o = (o << 12 | o >>> 20) + e | 0) & (e ^ t)) + i[2] + 0x242070db, t += (e ^ (a = (a << 17 | a >>> 15) + o | 0) & (o ^ e)) + i[3] - 0x3e423112, t = (t << 22 | t >>> 10) + a | 0), e += (o ^ t & (a ^ o)) + i[4] - 0xa83f051, o += (a ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ a)) + i[5] + 0x4787c62a, a += (t ^ (o = (o << 12 | o >>> 20) + e | 0) & (e ^ t)) + i[6] - 0x57cfb9ed, t += (e ^ (a = (a << 17 | a >>> 15) + o | 0) & (o ^ e)) + i[7] - 0x2b96aff, e += (o ^ (t = (t << 22 | t >>> 10) + a | 0) & (a ^ o)) + i[8] + 0x698098d8, o += (a ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ a)) + i[9] - 0x74bb0851, a += (t ^ (o = (o << 12 | o >>> 20) + e | 0) & (e ^ t)) + i[10] - 42063, t += (e ^ (a = (a << 17 | a >>> 15) + o | 0) & (o ^ e)) + i[11] - 0x76a32842, e += (o ^ (t = (t << 22 | t >>> 10) + a | 0) & (a ^ o)) + i[12] + 0x6b901122, o += (a ^ (e = (e << 7 | e >>> 25) + t | 0) & (t ^ a)) + i[13] - 0x2678e6d, a += (t ^ (o = (o << 12 | o >>> 20) + e | 0) & (e ^ t)) + i[14] - 0x5986bc72, t += (e ^ (a = (a << 17 | a >>> 15) + o | 0) & (o ^ e)) + i[15] + 0x49b40821, t = (t << 22 | t >>> 10) + a | 0, e += (a ^ o & (t ^ a)) + i[1] - 0x9e1da9e, e = (e << 5 | e >>> 27) + t | 0, o += (t ^ a & (e ^ t)) + i[6] - 0x3fbf4cc0, o = (o << 9 | o >>> 23) + e | 0, a += (e ^ t & (o ^ e)) + i[11] + 0x265e5a51, a = (a << 14 | a >>> 18) + o | 0, t += (o ^ e & (a ^ o)) + i[0] - 0x16493856, t = (t << 20 | t >>> 12) + a | 0, e += (a ^ o & (t ^ a)) + i[5] - 0x29d0efa3, e = (e << 5 | e >>> 27) + t | 0, o += (t ^ a & (e ^ t)) + i[10] + 0x2441453, o = (o << 9 | o >>> 23) + e | 0, a += (e ^ t & (o ^ e)) + i[15] - 0x275e197f, a = (a << 14 | a >>> 18) + o | 0, t += (o ^ e & (a ^ o)) + i[4] - 0x182c0438, t = (t << 20 | t >>> 12) + a | 0, e += (a ^ o & (t ^ a)) + i[9] + 0x21e1cde6, e = (e << 5 | e >>> 27) + t | 0, o += (t ^ a & (e ^ t)) + i[14] - 0x3cc8f82a, o = (o << 9 | o >>> 23) + e | 0, a += (e ^ t & (o ^ e)) + i[3] - 0xb2af279, a = (a << 14 | a >>> 18) + o | 0, t += (o ^ e & (a ^ o)) + i[8] + 0x455a14ed, t = (t << 20 | t >>> 12) + a | 0, e += (a ^ o & (t ^ a)) + i[13] - 0x561c16fb, e = (e << 5 | e >>> 27) + t | 0, o += (t ^ a & (e ^ t)) + i[2] - 0x3105c08, o = (o << 9 | o >>> 23) + e | 0, a += (e ^ t & (o ^ e)) + i[7] + 0x676f02d9, a = (a << 14 | a >>> 18) + o | 0, t += (o ^ e & (a ^ o)) + i[12] - 0x72d5b376, e += ((r = (t = (t << 20 | t >>> 12) + a | 0) ^ a) ^ o) + i[5] - 378558, o += (r ^ (e = (e << 4 | e >>> 28) + t | 0)) + i[8] - 0x788e097f, a += ((n = (o = (o << 11 | o >>> 21) + e | 0) ^ e) ^ t) + i[11] + 0x6d9d6122, t += (n ^ (a = (a << 16 | a >>> 16) + o | 0)) + i[14] - 0x21ac7f4, e += ((r = (t = (t << 23 | t >>> 9) + a | 0) ^ a) ^ o) + i[1] - 0x5b4115bc, o += (r ^ (e = (e << 4 | e >>> 28) + t | 0)) + i[4] + 0x4bdecfa9, a += ((n = (o = (o << 11 | o >>> 21) + e | 0) ^ e) ^ t) + i[7] - 0x944b4a0, t += (n ^ (a = (a << 16 | a >>> 16) + o | 0)) + i[10] - 0x41404390, e += ((r = (t = (t << 23 | t >>> 9) + a | 0) ^ a) ^ o) + i[13] + 0x289b7ec6, o += (r ^ (e = (e << 4 | e >>> 28) + t | 0)) + i[0] - 0x155ed806, a += ((n = (o = (o << 11 | o >>> 21) + e | 0) ^ e) ^ t) + i[3] - 0x2b10cf7b, t += (n ^ (a = (a << 16 | a >>> 16) + o | 0)) + i[6] + 0x4881d05, e += ((r = (t = (t << 23 | t >>> 9) + a | 0) ^ a) ^ o) + i[9] - 0x262b2fc7, o += (r ^ (e = (e << 4 | e >>> 28) + t | 0)) + i[12] - 0x1924661b, a += ((n = (o = (o << 11 | o >>> 21) + e | 0) ^ e) ^ t) + i[15] + 0x1fa27cf8, t += (n ^ (a = (a << 16 | a >>> 16) + o | 0)) + i[2] - 0x3b53a99b, t = (t << 23 | t >>> 9) + a | 0, e += (a ^ (t | ~o)) + i[0] - 0xbd6ddbc, e = (e << 6 | e >>> 26) + t | 0, o += (t ^ (e | ~a)) + i[7] + 0x432aff97, o = (o << 10 | o >>> 22) + e | 0, a += (e ^ (o | ~t)) + i[14] - 0x546bdc59, a = (a << 15 | a >>> 17) + o | 0, t += (o ^ (a | ~e)) + i[5] - 0x36c5fc7, t = (t << 21 | t >>> 11) + a | 0, e += (a ^ (t | ~o)) + i[12] + 0x655b59c3, e = (e << 6 | e >>> 26) + t | 0, o += (t ^ (e | ~a)) + i[3] - 0x70f3336e, o = (o << 10 | o >>> 22) + e | 0, a += (e ^ (o | ~t)) + i[10] - 1051523, a = (a << 15 | a >>> 17) + o | 0, t += (o ^ (a | ~e)) + i[1] - 0x7a7ba22f, t = (t << 21 | t >>> 11) + a | 0, e += (a ^ (t | ~o)) + i[8] + 0x6fa87e4f, e = (e << 6 | e >>> 26) + t | 0, o += (t ^ (e | ~a)) + i[15] - 0x1d31920, o = (o << 10 | o >>> 22) + e | 0, a += (e ^ (o | ~t)) + i[6] - 0x5cfebcec, a = (a << 15 | a >>> 17) + o | 0, t += (o ^ (a | ~e)) + i[13] + 0x4e0811a1, t = (t << 21 | t >>> 11) + a | 0, e += (a ^ (t | ~o)) + i[4] - 0x8ac817e, e = (e << 6 | e >>> 26) + t | 0, o += (t ^ (e | ~a)) + i[11] - 0x42c50dcb, o = (o << 10 | o >>> 22) + e | 0, a += (e ^ (o | ~t)) + i[2] + 0x2ad7d2bb, a = (a << 15 | a >>> 17) + o | 0, t += (o ^ (a | ~e)) + i[9] - 0x14792c6f, t = (t << 21 | t >>> 11) + a | 0, this.first ? (this.h0 = e + 0x67452301 | 0, this.h1 = t - 0x10325477 | 0, this.h2 = a - 0x67452302 | 0, this.h3 = o + 0x10325476 | 0, this.first = !1) : (this.h0 = this.h0 + e | 0, this.h1 = this.h1 + t | 0, this.h2 = this.h2 + a | 0, this.h3 = this.h3 + o | 0)
        }, _.prototype.hex = function() {
            this.finalize();
            var e = this.h0,
                t = this.h1,
                a = this.h2,
                o = this.h3;
            return p[e >>> 4 & 15] + p[15 & e] + p[e >>> 12 & 15] + p[e >>> 8 & 15] + p[e >>> 20 & 15] + p[e >>> 16 & 15] + p[e >>> 28 & 15] + p[e >>> 24 & 15] + p[t >>> 4 & 15] + p[15 & t] + p[t >>> 12 & 15] + p[t >>> 8 & 15] + p[t >>> 20 & 15] + p[t >>> 16 & 15] + p[t >>> 28 & 15] + p[t >>> 24 & 15] + p[a >>> 4 & 15] + p[15 & a] + p[a >>> 12 & 15] + p[a >>> 8 & 15] + p[a >>> 20 & 15] + p[a >>> 16 & 15] + p[a >>> 28 & 15] + p[a >>> 24 & 15] + p[o >>> 4 & 15] + p[15 & o] + p[o >>> 12 & 15] + p[o >>> 8 & 15] + p[o >>> 20 & 15] + p[o >>> 16 & 15] + p[o >>> 28 & 15] + p[o >>> 24 & 15]
        }, _.prototype.toString = _.prototype.hex, _.prototype.digest = function() {
            this.finalize();
            var e = this.h0,
                t = this.h1,
                a = this.h2,
                o = this.h3;
            return [255 & e, e >>> 8 & 255, e >>> 16 & 255, e >>> 24 & 255, 255 & t, t >>> 8 & 255, t >>> 16 & 255, t >>> 24 & 255, 255 & a, a >>> 8 & 255, a >>> 16 & 255, a >>> 24 & 255, 255 & o, o >>> 8 & 255, o >>> 16 & 255, o >>> 24 & 255]
        }, _.prototype.array = _.prototype.digest, _.prototype.arrayBuffer = function() {
            this.finalize();
            var e = new ArrayBuffer(16),
                t = new Uint32Array(e);
            return t[0] = this.h0, t[1] = this.h1, t[2] = this.h2, t[3] = this.h3, e
        }, _.prototype.buffer = _.prototype.arrayBuffer, _.prototype.base64 = function() {
            for (var e, t, a, o = "", r = this.array(), n = 0; n < 15;) e = r[n++], t = r[n++], a = r[n++], o += y[e >>> 2] + y[(e << 4 | t >>> 4) & 63] + y[(t << 2 | a >>> 6) & 63] + y[63 & a];
            return o + (y[(e = r[n]) >>> 2] + y[e << 4 & 63] + "==")
        }, S.prototype = new _, S.prototype.finalize = function() {
            if (_.prototype.finalize.call(this), this.inner) {
                this.inner = !1;
                var e = this.array();
                _.call(this, this.sharedMemory), this.update(this.oKeyPad), this.update(e), _.prototype.finalize.call(this)
            }
        };
        var x = function() {
            var e = v("hex");
            l && (e = w(e)), e.create = function() {
                return new _
            }, e.update = function(t) {
                return e.create().update(t)
            };
            for (var t = 0; t < m.length; ++t) {
                var a = m[t];
                e[a] = v(a)
            }
            return e
        }();
        if (x.md5 = x, x.md5.hmac = function() {
                var e = E("hex");
                e.create = function(e) {
                    return new S(e)
                }, e.update = function(t, a) {
                    return e.create(t).update(a)
                };
                for (var t = 0; t < m.length; ++t) {
                    var a = m[t];
                    e[a] = E(a)
                }
                return e
            }(), c) t.exports = x;
        else n.md5 = x, d && (e.r, void 0 !== x && e.v(x))
    }()
}, 283514, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    }), Object.defineProperty(a, "LoadableContext", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let o = e.r(2879)._(e.r(416340)).default.createContext(null)
}, 568710, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    }), Object.defineProperty(a, "default", {
        enumerable: !0,
        get: function() {
            return p
        }
    });
    let o = e.r(2879)._(e.r(416340)),
        r = e.r(283514),
        n = [],
        i = [],
        l = !1;

    function s(e) {
        let t = e(),
            a = {
                loading: !0,
                loaded: null,
                error: null
            };
        return a.promise = t.then(e => (a.loading = !1, a.loaded = e, e)).catch(e => {
            throw a.loading = !1, a.error = e, e
        }), a
    }
    class c {
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

    function d(t) {
        return function(t, a) {
            let s = Object.assign({
                    loader: null,
                    loading: null,
                    delay: 200,
                    timeout: null,
                    webpack: null,
                    modules: null
                }, a),
                d = null;

            function u() {
                if (!d) {
                    let e = new c(t, s);
                    d = {
                        getCurrentValue: e.getCurrentValue.bind(e),
                        subscribe: e.subscribe.bind(e),
                        retry: e.retry.bind(e),
                        promise: e.promise.bind(e)
                    }
                }
                return d.promise()
            }
            if ("u" < typeof window && n.push(u), !l && "u" > typeof window) {
                let t = s.webpack && "function" == typeof e.t.resolveWeak ? s.webpack() : s.modules;
                t && i.push(e => {
                    for (let a of t)
                        if (e.includes(a)) return u()
                })
            }

            function p(e, t) {
                let a;
                u(), (a = o.default.useContext(r.LoadableContext)) && Array.isArray(s.modules) && s.modules.forEach(e => {
                    a(e)
                });
                let n = o.default.useSyncExternalStore(d.subscribe, d.getCurrentValue, d.getCurrentValue);
                return o.default.useImperativeHandle(t, () => ({
                    retry: d.retry
                }), []), o.default.useMemo(() => {
                    var t;
                    return n.loading || n.error ? o.default.createElement(s.loading, {
                        isLoading: n.loading,
                        pastDelay: n.pastDelay,
                        timedOut: n.timedOut,
                        error: n.error,
                        retry: d.retry
                    }) : n.loaded ? o.default.createElement((t = n.loaded) && t.default ? t.default : t, e) : null
                }, [e, n])
            }
            return p.preload = () => u(), p.displayName = "LoadableComponent", o.default.forwardRef(p)
        }(s, t)
    }

    function u(e, t) {
        let a = [];
        for (; e.length;) {
            let o = e.pop();
            a.push(o(t))
        }
        return Promise.all(a).then(() => {
            if (e.length) return u(e, t)
        })
    }
    d.preloadAll = () => new Promise((e, t) => {
        u(n).then(e, t)
    }), d.preloadReady = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
        return new Promise(t => {
            let a = () => (l = !0, t());
            u(i, e).then(a, a)
        })
    }, "u" > typeof window && (window.__NEXT_PRELOADREADY = d.preloadReady);
    let p = d
}, 810637, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    });
    var o = {
        default: function() {
            return u
        },
        noSSR: function() {
            return d
        }
    };
    for (var r in o) Object.defineProperty(a, r, {
        enumerable: !0,
        get: o[r]
    });
    let n = e.r(2879),
        i = e.r(221628);
    e.r(416340);
    let l = n._(e.r(568710)),
        s = "u" < typeof window;

    function c(e) {
        return {
            default: (null == e ? void 0 : e.default) || e
        }
    }

    function d(e, t) {
        if (delete t.webpack, delete t.modules, !s) return e(t);
        let a = t.loading;
        return () => (0, i.jsx)(a, {
            error: null,
            isLoading: !0,
            pastDelay: !1,
            timedOut: !1
        })
    }

    function u(e, t) {
        let a = l.default,
            o = {
                loading: e => {
                    let {
                        error: t,
                        isLoading: a,
                        pastDelay: o
                    } = e;
                    return null
                }
            };
        e instanceof Promise ? o.loader = () => e : "function" == typeof e ? o.loader = e : "object" == typeof e && (o = {
            ...o,
            ...e
        });
        let r = (o = {
            ...o,
            ...t
        }).loader;
        return (o.loadableGenerated && (o = {
            ...o,
            ...o.loadableGenerated
        }, delete o.loadableGenerated), "boolean" != typeof o.ssr || o.ssr) ? a({
            ...o,
            loader: () => null != r ? r().then(c) : Promise.resolve(c(() => null))
        }) : (delete o.webpack, delete o.modules, d(a, o))
    }("function" == typeof a.default || "object" == typeof a.default && null !== a.default) && void 0 === a.default.__esModule && (Object.defineProperty(a.default, "__esModule", {
        value: !0
    }), Object.assign(a.default, a), t.exports = a.default)
}, 109182, (e, t, a) => {
    t.exports = e.r(810637)
}, 260241, e => {
    "use strict";
    var t = e.i(79187),
        a = e.i(416340),
        o = e.i(706442),
        r = e.i(431346),
        n = e.i(620068),
        i = e.i(982234),
        l = e.i(418400),
        s = e.i(169722),
        c = e.i(199834),
        d = e.i(872204),
        u = e.i(627292),
        p = e.i(734306),
        h = e.i(731693),
        f = e.i(397810),
        m = e.i(736186),
        y = e.i(645909),
        b = e.i(517379),
        g = e.i(12839),
        g = g,
        C = e.i(291037),
        A = e.i(899819),
        k = e.i(777004),
        v = e.i(35298),
        w = e.i(252842);
    let E = "https://www.roblox.com/info/privacy",
        _ = "{privacyPolicyLink}",
        S = "{googleAnalyticsLink}",
        x = [{
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
    var T, D, O = ((T = O || {}).BannerTitle = "Heading.CookieBanner", T.CookieBannerContent = "Description.CookieBannerContent", T.CookieBannerButton = "Action.CookieBanner", T.PrivacyPolicy = "Description.PrivacyPolicy", T.ConsentToolModalTitle = "Heading.CookieSettings", T.SaveBtn = "Action.SavePreferences", T.CancelBtn = "Action.Cancel", T.InfoCollectionHeader = "Heading.InformationCollection", T.InfoCollectionContent = "Description.InformationCollection", T.InfoCollectionHeader2 = "Heading.InformationCollection2", T.InfoCollectionContent2 = "Description.InformationCollection2", T.InfoPartnerCollectionHeader = "Heading.InformationPartnerCollection", T.InfoPartnerCollectionContent = "Description.InformationPartnerCollection", T.RBXViralAcquisition = "RBXViralAcquisition", T.RBXViralAcquisitionDescription = "Description.RBXViralAcquisition", T.RBXSource = "RBXSource", T.RBXSourceDescription = "Description.RBXSource", T.GoogleAnalytics = "Heading.GoogleAnalytics", T.OwnedBy = "Label.OwnedBy", T.GoogleInc = "Google Inc.", T.Website = "Label.Website", T.GoogleAnalyticsPurposeHeader = "Heading.GoogleAnalyticsPurpose", T.GoogleAnalyticsPurposeDescription = "Description.GoogleAnalyticsPurpose", T.CompanyCollectionHeader = "Heading.CompanyCollection", T.DataCollected = "Label.DataCollected", T.DataCollectedContent = "Description.DataCollected", T.DataSharing = "Label.DataSharing", T.DataSharingContent = "Description.DataSharing", T.DataRetention = "Label.DataRetention", T.DataRetentionContent = "Description.DataRetention", T.DataUse = "Label.DataUse", T.DataUseContent = "Description.DataUse", T.DataStorage = "Label.DataStorage", T.DataStorageContent = "Description.Undisclosed", T.RequestData = "Action.RequestData", T.SetCookieOptions = "Action.SetCookieOptions", T.DeclineAll = "Action.DeclineAll", T.AcceptAll = "Action.AcceptAll", T.EssentialCookie = "Heading.EssentialCookies", T.AnalyticsCookie = "Heading.AnalyticsCookies", T.GAReadMore = "Description.GAReadMore", T.GAReadMoreUrl = "{googleAnalyticsLink}", T);
    let L = (0, o.makeStyles)()(e => ({
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
        I = e => {
            let {
                onAcceptAll: o,
                onDeclineAll: u,
                onLearnMore: p,
                isOpen: h
            } = e, {
                translate: f
            } = (0, t.useTranslation)(), {
                classes: m
            } = L(), y = (0, n.useMediaQuery)((0, r.useTheme)().breakpoints.down("Medium")), b = (0, a.useMemo)(() => a.default.createElement(i.Link, {
                href: E,
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, f(O.PrivacyPolicy)), [f]), g = (0, a.useMemo)(() => {
                let e = f(O.CookieBannerContent);
                if (!e.includes(_)) return e;
                let t = e.split(_);
                return a.default.createElement(a.default.Fragment, null, t[0], b, t[1] || "")
            }, [f, b]);
            return a.default.createElement(l.Drawer, {
                open: h,
                onClose: u,
                anchor: "bottom",
                variant: "temporary",
                ModalProps: {
                    BackdropProps: {
                        classes: {
                            root: m.backdrop
                        }
                    }
                }
            }, a.default.createElement(s.Grid, {
                className: m.root
            }, a.default.createElement(s.Grid, {
                className: m.content
            }, a.default.createElement(c.Typography, {
                variant: "body2"
            }, g)), a.default.createElement(s.Grid, {
                className: m.actions
            }, a.default.createElement(d.Button, {
                variant: "text",
                onClick: p,
                color: "secondary"
            }, f(O.SetCookieOptions)), a.default.createElement(s.Grid, {
                className: m.buttons
            }, a.default.createElement(d.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: u,
                fullWidth: y
            }, f(O.DeclineAll)), a.default.createElement(d.Button, {
                color: "secondary",
                variant: "contained",
                onClick: o,
                fullWidth: y
            }, f(O.AcceptAll))))))
        },
        R = "RBXcb",
        U = {
            RBXViralAcquisition: !0,
            RBXSource: !0,
            GoogleAnalytics: !0
        },
        P = (0, a.createContext)(null),
        B = () => {
            let e = (0, a.useContext)(P);
            if (!e) throw Error("useCookieConsentContext must be used within a CookieConsentProvider");
            return e
        },
        M = e => {
            let t, a = Object.entries(e).map(e => {
                let [t, a] = e;
                return "".concat(t, "=").concat(a)
            }).join("&");
            Object.entries(e).forEach(e => {
                let [t, a] = e;
                a || (0, w.deleteCookie)(t)
            });
            let o = new Date;
            o.setDate(o.getDate() + 180), document.cookie = "".concat(R, "=").concat(a, "; expires=").concat(o.toUTCString(), "; path=/; domain=").concat((t = window.location.hostname.split(".")).length <= 2 ? window.location.hostname : ".".concat(t.slice(1).join(".")))
        },
        N = e => {
            let {
                cookieName: t,
                description: o
            } = e;
            return a.default.createElement("div", null, a.default.createElement(c.Typography, {
                variant: "codeDense"
            }, t), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, o))
        },
        H = (0, o.makeStyles)()(() => ({
            accordionSummary: {
                display: "flex",
                alignItems: "center",
                gap: "12px",
                ["& .".concat(u.accordionSummaryClasses.content)]: {
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
        F = () => {
            var e;
            let {
                translate: o
            } = (0, t.useTranslation)(), {
                cookiePolicy: r
            } = B(), {
                classes: n
            } = H();
            return r && (null == (e = r.EssentialCookieList) ? void 0 : e.length) ? a.default.createElement(p.Accordion, {
                className: n.accordion
            }, a.default.createElement(h.AccordionSummary, {
                className: n.accordionSummary
            }, a.default.createElement(c.Typography, {
                variant: "h6"
            }, o(O.EssentialCookie))), a.default.createElement(f.AccordionDetails, null, r.EssentialCookieList.map(e => a.default.createElement(N, {
                key: e.cookieName,
                cookieName: e.cookieName,
                description: o(e.description)
            })))) : null
        };
    var z = ((D = {}).RBXViralAcquisition = "RBXViralAcquisition", D.RBXSource = "RBXSource", D.GoogleAnalytics = "GoogleAnalytics", D);
    let j = e => {
            let {
                title: t,
                content: o,
                secondary: r = !1
            } = e;
            return a.default.createElement("div", null, a.default.createElement(c.Typography, {
                variant: "body2",
                color: r ? "secondary" : "primary"
            }, t), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, o))
        },
        G = () => {
            let {
                translate: e
            } = (0, t.useTranslation)(), o = e(O.GAReadMore);
            if (!o.includes(S)) return a.default.createElement(a.default.Fragment, null, o);
            let [r, n] = o.split(S);
            return a.default.createElement(c.Typography, {
                variant: "body2"
            }, r, a.default.createElement(i.Link, {
                href: "https://support.google.com/analytics/answer/11397207",
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, e(O.GoogleAnalytics)), n)
        },
        K = (0, o.makeStyles)()(() => ({
            button: {
                paddingLeft: 5,
                ["&.".concat(m.buttonClasses.root)]: {
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
                text: o
            } = e, {
                classes: r
            } = K();
            return a.default.createElement("div", null, a.default.createElement(d.Button, {
                className: r.button,
                variant: "text",
                component: "a",
                color: "primary",
                href: t,
                rel: "noreferrer",
                endIcon: a.default.createElement(y.OpenInNewIcon, null),
                size: "small",
                target: "_blank",
                disableRipple: !0
            }, o))
        },
        X = e => {
            let {
                isAnalyticsCookieAccepted: o,
                setIsAnalyticsCookieAccepted: r
            } = e, {
                classes: n
            } = H(), {
                translate: i
            } = (0, t.useTranslation)();
            return a.default.createElement(p.Accordion, {
                className: n.accordion
            }, a.default.createElement(h.AccordionSummary, {
                className: n.accordionSummary
            }, a.default.createElement(c.Typography, {
                variant: "h6"
            }, i(O.AnalyticsCookie)), a.default.createElement(b.Switch, {
                checked: o,
                onChange: (e, t) => {
                    r(t)
                },
                "aria-label": i(O.AnalyticsCookie),
                size: "small"
            })), a.default.createElement(f.AccordionDetails, null, a.default.createElement(N, {
                key: z.RBXViralAcquisition,
                cookieName: z.RBXViralAcquisition,
                description: i(O.RBXViralAcquisitionDescription)
            }), a.default.createElement(N, {
                key: z.RBXSource,
                cookieName: z.RBXSource,
                description: i(O.RBXSourceDescription)
            }), a.default.createElement(V, {
                href: "https://marketingplatform.google.com/about/analytics/",
                text: i(O.GoogleAnalytics)
            }), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0
            }, i(O.OwnedBy), " ", "Google Inc."), a.default.createElement(j, {
                title: i(O.GoogleAnalyticsPurposeHeader),
                content: i(O.GoogleAnalyticsPurposeDescription)
            }), a.default.createElement(c.Typography, {
                variant: "body2"
            }, i(O.CompanyCollectionHeader)), x.map(e => a.default.createElement(j, {
                key: e.label,
                title: i(e.label),
                content: i(e.content),
                secondary: !0
            })), a.default.createElement(G, null)))
        },
        q = (0, o.makeStyles)()(e => ({
            accordionSummary: {
                display: "flex",
                alignItems: "center",
                gap: "12px",
                ["& .".concat(u.accordionSummaryClasses.content)]: {
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
        W = e => {
            var o;
            let {
                open: r,
                onClose: n,
                onSave: i,
                isAnalyticsCookieAccepted: l,
                setIsAnalyticsCookieAccepted: s
            } = e, {
                translate: u
            } = (0, t.useTranslation)(), {
                classes: p
            } = q(), {
                cookiePolicy: h
            } = B();
            return h ? a.default.createElement(C.Dialog, {
                open: r,
                onClose: n
            }, a.default.createElement(A.DialogTitle, null, u(O.ConsentToolModalTitle)), a.default.createElement(k.DialogContent, {
                className: p.dialogContent
            }, a.default.createElement(c.Typography, {
                variant: "h6"
            }, u(O.InfoCollectionHeader)), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(O.InfoCollectionContent)), a.default.createElement(c.Typography, {
                variant: "h6"
            }, u(O.InfoCollectionHeader2)), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(O.InfoCollectionContent2)), a.default.createElement(c.Typography, {
                variant: "h6"
            }, u(O.InfoPartnerCollectionHeader)), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(O.InfoPartnerCollectionContent)), a.default.createElement(V, {
                href: "https://www.roblox.com/support",
                text: u(O.RequestData)
            }), a.default.createElement(V, {
                href: E,
                text: u(O.PrivacyPolicy)
            }), a.default.createElement("div", {
                className: p.accordionSection
            }, (null == (o = h.EssentialCookieList) ? void 0 : o.length) > 0 && a.default.createElement("div", {
                className: p.accordionContainer
            }, a.default.createElement(F, null)), a.default.createElement("div", {
                className: p.accordionContainer
            }, a.default.createElement(X, {
                isAnalyticsCookieAccepted: l,
                setIsAnalyticsCookieAccepted: s
            })))), a.default.createElement(v.DialogActions, null, a.default.createElement(d.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: n
            }, u(O.CancelBtn)), a.default.createElement(d.Button, {
                color: "primaryBrand",
                variant: "contained",
                onClick: i
            }, u(O.SaveBtn)))) : null
        },
        J = e => {
            let {
                isOpen: t,
                onClose: o,
                onSave: r
            } = e, {
                cookiePolicy: n,
                acceptAll: i,
                declineAll: l,
                hasAcceptedAnalyticsCookie: s
            } = B(), [c, d] = (0, a.useState)(s), u = (0, a.useCallback)(() => {
                c ? i() : l(), r()
            }, [i, l, c, r]);
            return n ? a.default.createElement(W, {
                open: t,
                onClose: o,
                isAnalyticsCookieAccepted: c,
                setIsAnalyticsCookieAccepted: d,
                onSave: u
            }) : null
        },
        Y = (0, t.withTranslation)(() => {
            let {
                acceptAll: e,
                declineAll: t,
                shouldShowBanner: o
            } = B(), [r, n] = (0, a.useState)(!1), [i, l] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                o && l(!0)
            }, [o]);
            let s = (0, a.useCallback)(() => {
                    e(), l(!1)
                }, [e]),
                c = (0, a.useCallback)(() => {
                    t(), l(!1)
                }, [t]),
                d = (0, a.useCallback)(() => {
                    n(!0), l(!1)
                }, []),
                u = (0, a.useCallback)(() => {
                    n(!1), l(!0)
                }, []),
                p = (0, a.useCallback)(() => {
                    n(!1), l(!1)
                }, []);
            return a.default.createElement(a.default.Fragment, null, a.default.createElement(I, {
                isOpen: i,
                onAcceptAll: s,
                onDeclineAll: c,
                onLearnMore: d
            }), a.default.createElement(J, {
                isOpen: r,
                onClose: u,
                onSave: p
            }))
        }, ["Feature.Tracking", "CommonUI.Controls"]);
    e.s(["CookieConsentBanner", 0, Y, "CookieConsentProvider", 0, e => {
        let {
            children: t,
            robloxSiteDomain: o,
            initialCookiePolicy: r,
            initialPreferences: n,
            forceShowBanner: i = !1
        } = e, [l, s] = (0, a.useState)(r || null), [c, d] = (0, a.useState)(n || (() => {
            if ("u" < typeof document) return U;
            let e = document.cookie.split("; ").find(e => e.startsWith("".concat(R, "=")));
            return e ? e.substring(R.length + 1).split("&").reduce((e, t) => {
                let [a, o] = t.split("=");
                return e[a] = "true" === o, e
            }, {}) : U
        })()), [u, p] = (0, a.useState)(!r), [h, f] = (0, a.useState)(null), m = (0, a.useMemo)(() => !!i || !!(null == l ? void 0 : l.ShouldDisplayCookieBannerV3) && !(!("u" < typeof document) && document.cookie.split("; ").some(e => e.startsWith("".concat(R, "=")))), [null == l ? void 0 : l.ShouldDisplayCookieBannerV3, i]);
        (0, a.useEffect)(() => {
            r || (async () => {
                try {
                    var e, t, a;
                    let r = await fetch("https://apis.".concat(o, "/guac-v2/v1/bundles/cookie-policy"));
                    if (!r.ok) throw Error("Failed to fetch cookie policy");
                    let n = await r.json();
                    s({
                        ShouldDisplayCookieBannerV3: null != (e = n.ShouldDisplayCookieBannerV3) && e,
                        NonEssentialCookieList: null != (t = n.NonEssentialCookieList) ? t : [],
                        EssentialCookieList: null != (a = n.EssentialCookieList) ? a : []
                    }), p(!1)
                } catch (e) {
                    f(e instanceof Error ? e : Error("Unknown error")), p(!1)
                }
            })()
        }, [o, r]);
        let y = (0, a.useCallback)((e, t) => {
                d(a => {
                    let o = {
                        ...a,
                        [e]: t
                    };
                    return M(o), o
                })
            }, []),
            b = (0, a.useCallback)(() => {
                if (!l) return;
                let e = l.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !0
                }), U);
                M(e), d(e)
            }, [l]),
            g = (0, a.useCallback)(() => {
                if (!l) return;
                let e = l.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !1
                }), U);
                M(e), d(e)
            }, [l]),
            C = (0, a.useMemo)(() => Object.values(c).some(e => !0 === e), [c]),
            A = (0, a.useMemo)(() => ({
                cookiePolicy: l,
                preferences: c,
                updatePreference: y,
                acceptAll: b,
                declineAll: g,
                isLoading: u,
                error: h,
                hasAcceptedAnalyticsCookie: C,
                shouldShowBanner: m
            }), [l, c, u, h, b, g, y, C, m]);
        return a.default.createElement(P.Provider, {
            value: A
        }, t)
    }, "useCookieConsentContext", 0, B], 260241)
}]);

//# debugId=9be09e2f-23ae-d9ae-973a-77881baeace6
//# sourceMappingURL=3ostqd1-fdcbq.js.map