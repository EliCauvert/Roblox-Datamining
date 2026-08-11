! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "412ce045ca03ebecaeaebf0a13a686bee93de84c"
        };
        var a = (new e.Error).stack;
        a && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[a] = "083a2a6e-a221-4468-9c6c-4d432f1cd059", e._sentryDebugIdIdentifier = "sentry-dbid-083a2a6e-a221-4468-9c6c-4d432f1cd059")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e = {
            851: function(e, a, o) {
                e.exports = {}
            }
        },
        a = {};

    function o(t) {
        var n = a[t];
        if (void 0 !== n) return n.exports;
        var r = a[t] = {
            exports: {}
        };
        return e[t](r, r.exports, o), r.exports
    }
    o.m = e, o.n = function(e) {
        var a = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return o.d(a, {
            a: a
        }), a
    }, o.d = function(e, a) {
        for (var t in a) o.o(a, t) && !o.o(e, t) && Object.defineProperty(e, t, {
            enumerable: !0,
            get: a[t]
        })
    }, o.k = function(e) {
        return "" + e + ".css"
    }, o.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), o.o = function(e, a) {
        return Object.prototype.hasOwnProperty.call(e, a)
    }, o.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, o.rv = function() {
        return "1.5.7"
    }, o.g.importScripts && (t = o.g.location + "");
    var t, n = o.g.document;
    if (!t && n && (n.currentScript && "SCRIPT" === n.currentScript.tagName.toUpperCase() && (t = n.currentScript.src), !t)) {
        var r = n.getElementsByTagName("script");
        if (r.length)
            for (var i = r.length - 1; i > -1 && (!t || !/^http(s?):/.test(t));) t = r[i--].src
    }
    if (!t) throw Error("Automatic publicPath is not supported in this browser");
    o.p = t.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), o.ruid = "bundler=rspack@1.5.7",
        function() {
            o(851);
            var e = window.Roblox,
                a = o.n(e),
                t = [{
                    maxNumber: 1,
                    id: 18,
                    name: "Face",
                    type: "Face",
                    catalogNameKey: "Label.Face",
                    category: "bodyPart",
                    slot: {
                        name: "FaceClassic",
                        catalogNameKey: "Label.Face",
                        groupCatalogNameKey: "Label.Body"
                    }
                }, {
                    maxNumber: 1,
                    id: 19,
                    name: "Gear",
                    type: "Gear",
                    catalogNameKey: "Label.Gear",
                    category: "accessory",
                    slot: {
                        name: "GearAccessory",
                        catalogNameKey: "Label.Gear",
                        groupCatalogNameKey: "LabelAccessories"
                    }
                }, {
                    maxNumber: 1,
                    id: 17,
                    name: "Head",
                    type: "Head",
                    assetTypesToUnequip: [76, 77, 78, 79],
                    body: !0,
                    catalogNameKey: "Label.AccessoryHead",
                    category: "bodyPart",
                    slot: {
                        name: "HeadClassic",
                        catalogNameKey: "Label.AccessoryHead",
                        groupCatalogNameKey: "Label.Body"
                    }
                }, {
                    maxNumber: 1,
                    id: 29,
                    name: "Left Arm",
                    type: "LeftArm",
                    body: !0,
                    catalogNameKey: "Label.LeftArm",
                    category: "bodyPart",
                    slot: {
                        name: "LeftArm",
                        catalogNameKey: "Label.LeftArm",
                        groupCatalogNameKey: "Label.Body"
                    }
                }, {
                    maxNumber: 1,
                    id: 30,
                    name: "Left Leg",
                    type: "LeftLeg",
                    body: !0,
                    catalogNameKey: "Label.LeftLeg",
                    category: "bodyPart",
                    slot: {
                        name: "LeftLeg",
                        catalogNameKey: "Label.LeftLeg",
                        groupCatalogNameKey: "Label.Body"
                    }
                }, {
                    maxNumber: 1,
                    id: 12,
                    name: "Pants",
                    type: "Pants",
                    catalogNameKey: "Label.Clothing.ClassicPants",
                    category: "clothing",
                    slot: {
                        name: "ClassicPants",
                        catalogNameKey: "Label.Clothing.ClassicPants",
                        groupCatalogNameKey: "Label.Clothing"
                    }
                }, {
                    maxNumber: 1,
                    id: 28,
                    name: "Right Arm",
                    type: "RightArm",
                    body: !0,
                    catalogNameKey: "Label.RightArm",
                    category: "bodyPart",
                    slot: {
                        name: "RightArm",
                        catalogNameKey: "Label.RightArm",
                        groupCatalogNameKey: "Label.Body"
                    }
                }, {
                    maxNumber: 1,
                    id: 31,
                    name: "Right Leg",
                    type: "RightLeg",
                    body: !0,
                    catalogNameKey: "Label.RightLeg",
                    category: "bodyPart",
                    slot: {
                        name: "RightLeg",
                        catalogNameKey: "Label.RightLeg",
                        groupCatalogNameKey: "Label.Body"
                    }
                }, {
                    maxNumber: 1,
                    id: 11,
                    name: "Shirt",
                    type: "Shirt",
                    catalogNameKey: "Label.ClassicShirt",
                    category: "clothing",
                    slot: {
                        name: "ClassicShirt",
                        catalogNameKey: "Label.ClassicShirt",
                        groupCatalogNameKey: "Label.Clothing"
                    }
                }, {
                    maxNumber: 1,
                    id: 2,
                    name: "T-Shirt",
                    type: "TShirt",
                    catalogNameKey: "Label.ClassicTShirt",
                    category: "clothing",
                    slot: {
                        name: "ClassicTShirt",
                        catalogNameKey: "Label.ClassicTShirt",
                        groupCatalogNameKey: "Label.Clothing"
                    }
                }, {
                    maxNumber: 1,
                    id: 27,
                    name: "Torso",
                    type: "Torso",
                    body: !0,
                    catalogNameKey: "Label.Torso",
                    category: "bodyPart",
                    slot: {
                        name: "Torso",
                        catalogNameKey: "Label.Torso",
                        groupCatalogNameKey: "Label.Body"
                    }
                }, {
                    maxNumber: 1,
                    id: 48,
                    name: "Climb Animation",
                    type: "ClimbAnimation",
                    catalogNameKey: "Label.ClimbAnimation",
                    category: "animation",
                    slot: {
                        name: "ClimbAnimation",
                        catalogNameKey: "Label.ClimbAnimation",
                        groupCatalogNameKey: "LabelAnimations"
                    }
                }, {
                    maxNumber: 1,
                    id: 49,
                    name: "Death Animation",
                    type: "DeathAnimation",
                    catalogNameKey: "Label.DeathAnimation",
                    category: "animation",
                    slot: {
                        name: "DeathAnimation",
                        catalogNameKey: "Label.DeathAnimation",
                        groupCatalogNameKey: "LabelAnimations"
                    }
                }, {
                    maxNumber: 1,
                    id: 50,
                    name: "Fall Animation",
                    type: "FallAnimation",
                    catalogNameKey: "Label.FallAnimation",
                    category: "animation",
                    slot: {
                        name: "FallAnimation",
                        catalogNameKey: "Label.FallAnimation",
                        groupCatalogNameKey: "LabelAnimations"
                    }
                }, {
                    maxNumber: 1,
                    id: 51,
                    name: "Idle Animation",
                    type: "IdleAnimation",
                    catalogNameKey: "Label.IdleAnimation",
                    category: "animation",
                    slot: {
                        name: "IdleAnimation",
                        catalogNameKey: "Label.IdleAnimation",
                        groupCatalogNameKey: "LabelAnimations"
                    }
                }, {
                    maxNumber: 1,
                    id: 52,
                    name: "Jump Animation",
                    type: "JumpAnimation",
                    catalogNameKey: "Label.JumpAnimation",
                    category: "animation",
                    slot: {
                        name: "JumpAnimation",
                        catalogNameKey: "Label.JumpAnimation",
                        groupCatalogNameKey: "LabelAnimations"
                    }
                }, {
                    maxNumber: 1,
                    id: 53,
                    name: "Run Animation",
                    type: "RunAnimation",
                    catalogNameKey: "Label.RunAnimation",
                    category: "animation",
                    slot: {
                        name: "RunAnimation",
                        catalogNameKey: "Label.RunAnimation",
                        groupCatalogNameKey: "LabelAnimations"
                    }
                }, {
                    maxNumber: 1,
                    id: 54,
                    name: "Swim Animation",
                    type: "SwimAnimation",
                    catalogNameKey: "Label.SwimAnimation",
                    category: "animation",
                    slot: {
                        name: "SwimAnimation",
                        catalogNameKey: "Label.SwimAnimation",
                        groupCatalogNameKey: "LabelAnimations"
                    }
                }, {
                    maxNumber: 1,
                    id: 55,
                    name: "Walk Animation",
                    type: "WalkAnimation",
                    catalogNameKey: "Label.WalkAnimation",
                    category: "animation",
                    slot: {
                        name: "WalkAnimation",
                        catalogNameKey: "Label.WalkAnimation",
                        groupCatalogNameKey: "LabelAnimations"
                    }
                }, {
                    maxNumber: 1,
                    id: 56,
                    name: "Pose Animation",
                    type: "PoseAnimation",
                    catalogNameKey: "Label.PoseAnimation",
                    category: "animation",
                    slot: {
                        name: "PoseAnimation",
                        catalogNameKey: "Label.PoseAnimation",
                        groupCatalogNameKey: "LabelAnimations"
                    }
                }, {
                    maxNumber: 0,
                    id: 61,
                    name: "Emote Animation",
                    type: "EmoteAnimation",
                    catalogNameKey: "Label.Emote",
                    category: "animation",
                    slot: {
                        name: "EmoteAnimation",
                        catalogNameKey: "Label.Emote",
                        groupCatalogNameKey: "LabelAnimations"
                    }
                }, {
                    maxNumber: 3,
                    id: 8,
                    name: "Hat",
                    type: "Hat",
                    catalogNameKey: "Label.Hat",
                    category: "accessory",
                    slot: {
                        name: "HeadAccessory",
                        catalogNameKey: "Label.AccessoryHead",
                        groupCatalogNameKey: "LabelAccessories"
                    }
                }, {
                    maxNumber: 1,
                    id: 41,
                    name: "Hair Accessory",
                    type: "HairAccessory",
                    catalogNameKey: "Label.HairAccessory",
                    category: "bodyPart",
                    slot: {
                        name: "HairAccessory",
                        catalogNameKey: "Label.Hair",
                        groupCatalogNameKey: "Label.Body"
                    }
                }, {
                    maxNumber: 1,
                    id: 42,
                    name: "Face Accessory",
                    type: "FaceAccessory",
                    catalogNameKey: "Label.FaceAccessory",
                    category: "accessory",
                    slot: {
                        name: "FaceAccessory",
                        catalogNameKey: "Label.Face",
                        groupCatalogNameKey: "LabelAccessories"
                    }
                }, {
                    maxNumber: 1,
                    id: 43,
                    name: "Neck Accessory",
                    type: "NeckAccessory",
                    catalogNameKey: "Label.NeckAccessory",
                    category: "accessory",
                    slot: {
                        name: "NeckAccessory",
                        catalogNameKey: "LabelAccessoryNeck",
                        groupCatalogNameKey: "LabelAccessories"
                    }
                }, {
                    maxNumber: 1,
                    id: 44,
                    name: "Shoulder Accessory",
                    type: "ShoulderAccessory",
                    catalogNameKey: "Label.ShoulderAccessory",
                    category: "accessory",
                    slot: {
                        name: "ShoulderAccessory",
                        catalogNameKey: "LabelAccessoryShoulder",
                        groupCatalogNameKey: "LabelAccessories"
                    }
                }, {
                    maxNumber: 1,
                    id: 45,
                    name: "Front Accessory",
                    type: "FrontAccessory",
                    catalogNameKey: "Label.FrontAccessory",
                    category: "accessory",
                    slot: {
                        name: "FrontAccessory",
                        catalogNameKey: "LabelAccessoryFront",
                        groupCatalogNameKey: "LabelAccessories"
                    }
                }, {
                    maxNumber: 1,
                    id: 46,
                    name: "Back Accessory",
                    type: "BackAccessory",
                    catalogNameKey: "Label.BackAccessory",
                    category: "accessory",
                    slot: {
                        name: "BackAccessory",
                        catalogNameKey: "LabelAccessoryBack",
                        groupCatalogNameKey: "LabelAccessories"
                    }
                }, {
                    maxNumber: 1,
                    id: 47,
                    name: "Waist Accessory",
                    type: "WaistAccessory",
                    catalogNameKey: "Label.WaistAccessory",
                    category: "accessory",
                    slot: {
                        name: "WaistAccessory",
                        catalogNameKey: "LabelAccessoryWaist",
                        groupCatalogNameKey: "LabelAccessories"
                    }
                }, {
                    maxNumber: 1,
                    id: 72,
                    name: "Dress Skirt Accessory",
                    type: "DressSkirtAccessory",
                    catalogNameKey: "Label.Skirt",
                    category: "clothing",
                    slot: {
                        name: "Bottoms",
                        catalogNameKey: "Label.Bottom",
                        groupCatalogNameKey: "Label.Clothing"
                    }
                }, {
                    maxNumber: 1,
                    id: 67,
                    name: "Jacket Accessory",
                    type: "JacketAccessory",
                    catalogNameKey: "Label.Jacket",
                    category: "clothing",
                    slot: {
                        name: "Outerwear",
                        catalogNameKey: "Label.Outerwear",
                        groupCatalogNameKey: "Label.Clothing"
                    }
                }, {
                    maxNumber: 1,
                    id: 70,
                    name: "Left Shoe Accessory",
                    type: "LeftShoeAccessory",
                    catalogNameKey: "Label.LeftShoe",
                    category: "clothing",
                    slot: {
                        name: "Shoes",
                        catalogNameKey: "Label.Clothing.ShoesBundles",
                        groupCatalogNameKey: "Label.Clothing"
                    }
                }, {
                    maxNumber: 1,
                    id: 71,
                    name: "Right Shoe Accessory",
                    type: "RightShoeAccessory",
                    catalogNameKey: "Label.RightShoe",
                    category: "clothing",
                    slot: {
                        name: "Shoes",
                        catalogNameKey: "Label.Clothing.ShoesBundles",
                        groupCatalogNameKey: "Label.Clothing"
                    }
                }, {
                    maxNumber: 1,
                    id: 66,
                    name: "Pants Accessory",
                    type: "PantsAccessory",
                    catalogNameKey: "Label.Clothing.PantsAccessories",
                    category: "clothing",
                    slot: {
                        name: "Bottoms",
                        catalogNameKey: "Label.Bottom",
                        groupCatalogNameKey: "Label.Clothing"
                    }
                }, {
                    maxNumber: 1,
                    id: 65,
                    name: "Shirt Accessory",
                    type: "ShirtAccessory",
                    catalogNameKey: "Label.Shirt",
                    category: "clothing",
                    slot: {
                        name: "Tops",
                        catalogNameKey: "Label.Top",
                        groupCatalogNameKey: "Label.Clothing"
                    }
                }, {
                    maxNumber: 1,
                    id: 69,
                    name: "Shorts Accessory",
                    type: "ShortsAccessory",
                    catalogNameKey: "Label.Clothing.ShortsAccessories",
                    category: "clothing",
                    slot: {
                        name: "Bottoms",
                        catalogNameKey: "Label.Bottom",
                        groupCatalogNameKey: "Label.Clothing"
                    }
                }, {
                    maxNumber: 1,
                    id: 68,
                    name: "Sweater Accessory",
                    type: "SweaterAccessory",
                    catalogNameKey: "Label.Sweater",
                    category: "clothing",
                    slot: {
                        name: "Tops",
                        catalogNameKey: "Label.Top",
                        groupCatalogNameKey: "Label.Clothing"
                    }
                }, {
                    maxNumber: 1,
                    id: 64,
                    name: "T-Shirt Accessory",
                    type: "TShirtAccessory",
                    catalogNameKey: "Label.TShirt",
                    category: "clothing",
                    slot: {
                        name: "Tops",
                        catalogNameKey: "Label.Top",
                        groupCatalogNameKey: "Label.Clothing"
                    }
                }, {
                    maxNumber: 1,
                    id: 76,
                    name: "Eyebrow Accessory",
                    type: "EyebrowAccessory",
                    blockUnequip: !1,
                    assetTypesToUnequip: [76],
                    catalogNameKey: "Label.Eyebrow",
                    category: "makeup",
                    slot: {
                        name: "Eyebrow",
                        catalogNameKey: "",
                        groupCatalogNameKey: "Label.Makeup"
                    }
                }, {
                    maxNumber: 1,
                    id: 77,
                    name: "Eyelash Accessory",
                    type: "EyelashAccessory",
                    blockUnequip: !1,
                    assetTypesToUnequip: [77],
                    catalogNameKey: "Label.Eyelash",
                    category: "makeup",
                    slot: {
                        name: "Eyelash",
                        catalogNameKey: "",
                        groupCatalogNameKey: "Label.Makeup"
                    }
                }, {
                    maxNumber: 1,
                    id: 78,
                    name: "Mood Animation",
                    type: "MoodAnimation",
                    catalogNameKey: "Label.MoodAnimation",
                    category: "animation",
                    slot: {
                        name: "MoodAnimation",
                        catalogNameKey: "",
                        groupCatalogNameKey: "LabelAnimations"
                    }
                }, {
                    maxNumber: 1,
                    id: 79,
                    name: "Dynamic Head",
                    type: "DynamicHead",
                    assetTypesToUnequip: [17, 76, 77, 78, 79],
                    body: !0,
                    catalogNameKey: "Label.DynamicHead",
                    category: "bodyPart",
                    slot: {
                        name: "Head",
                        catalogNameKey: "",
                        groupCatalogNameKey: "Label.Body"
                    }
                }, {
                    maxNumber: 8,
                    id: 88,
                    name: "Face Makeup",
                    type: "FaceMakeup",
                    blockUnequip: !1,
                    assetTypesToUnequip: [],
                    catalogNameKey: "Label.FaceMakeup",
                    category: "makeup",
                    slot: {
                        name: "FaceMakeup",
                        catalogNameKey: "Label.Face",
                        groupCatalogNameKey: "Label.Makeup"
                    }
                }, {
                    maxNumber: 8,
                    id: 89,
                    name: "Lip Makeup",
                    type: "LipMakeup",
                    blockUnequip: !1,
                    assetTypesToUnequip: [],
                    catalogNameKey: "Label.LipMakeup",
                    category: "makeup",
                    slot: {
                        name: "LipMakeup",
                        catalogNameKey: "Label.LipMakeup",
                        groupCatalogNameKey: "Label.Makeup"
                    }
                }, {
                    maxNumber: 8,
                    id: 90,
                    name: "Eye Makeup",
                    type: "EyeMakeup",
                    blockUnequip: !1,
                    assetTypesToUnequip: [],
                    catalogNameKey: "Label.EyeMakeup",
                    category: "makeup",
                    slot: {
                        name: "EyeMakeup",
                        catalogNameKey: "Label.EyeMakeup",
                        groupCatalogNameKey: "Label.Makeup"
                    }
                }, {
                    maxNumber: 1,
                    id: 92,
                    name: "Profile Background",
                    type: "ProfileBackground",
                    catalogNameKey: "Label.ProfileBackground",
                    slot: {
                        name: "ProfileBackground",
                        catalogNameKey: "Label.ProfileBackground",
                        groupCatalogNameKey: ""
                    }
                }],
                n = [92],
                r = "EmoteAnimation",
                i = "Emote Animation",
                c = {
                    64: "Tops",
                    65: "Tops",
                    66: "Bottoms",
                    69: "Bottoms",
                    72: "Bottoms",
                    67: "Outerwear",
                    68: "Tops",
                    88: "GeneralMakeup",
                    89: "GeneralMakeup",
                    90: "GeneralMakeup"
                },
                s = {
                    Tops: 1,
                    Bottoms: 1,
                    Outerwear: 1,
                    GeneralMakeup: 6
                },
                m = {
                    76: 0,
                    77: 1,
                    70: 5,
                    71: 5,
                    66: 6,
                    69: 7,
                    72: 8,
                    64: 9,
                    65: 10,
                    68: 11,
                    67: 12,
                    41: 13
                },
                l = {
                    41: 2
                },
                y = [41, 76, 77];

            function g(e) {
                switch (e) {
                    case "Hat":
                    case "HairAccessory":
                    case "FaceAccessory":
                    case "NeckAccessory":
                    case "ShoulderAccessory":
                    case "FrontAccessory":
                    case "BackAccessory":
                    case "WaistAccessory":
                    case "Hair Accessory":
                    case "Face Accessory":
                    case "Neck Accessory":
                    case "Shoulder Accessory":
                    case "Front Accessory":
                    case "Back Accessory":
                    case "Waist Accessory":
                        return !0;
                    default:
                        return !1
                }
            }

            function u(e) {
                switch (e) {
                    case "DynamicHead":
                    case "Dynamic Head":
                        return !0;
                    default:
                        return !1
                }
            }

            function d(e) {
                return n.includes(e)
            }

            function b(e) {
                var a;
                return t.forEach(function(o) {
                    o.id === e && (a = o)
                }), a
            }

            function p(e) {
                var a = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                return !(a && y.includes(e)) && void 0 !== m[e]
            }

            function A(e, a) {
                return e.id === a.id
            }

            function N(e, a) {
                var o = -1,
                    t = 0;
                return a.forEach(function(a) {
                    A(e, a) && (o = t), t += 1
                }), o
            }
            a().AvatarAccoutrementService = {
                addAssetToAvatar: function(e, a) {
                    var o = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                        t = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                        n = [],
                        r = {};
                    e.assetType.name || (e.assetType.name = b(e.assetType.id).name);
                    var i = g(e.assetType.name);

                    function m(a) {
                        var m = a.assetType;
                        if (!d(m.id)) {
                            var l, y, u, A = !i && g(m.name) ? 10 : function(e) {
                                    if (e in c) return s[c[e]];
                                    var a = b(e);
                                    return a ? a.maxNumber : 1
                                }(m.id),
                                N = (u = a.assetType, !i && g(u.name) ? "Accessory" : u.id in c ? c[u.id] : u.id);
                            if (r[N] = void 0 === r[N] ? 0 : r[N], r.LayeredClothing = void 0 === r.LayeredClothing ? 0 : r.LayeredClothing, p(m.id, !0))
                                if (!(r.LayeredClothing <= 5)) return void console.debug("Removed asset ".concat(a.name, " because it exceeded LayeredClothing wearing limits"));
                                else r.LayeredClothing += 1;
                            t || r[N] < A ? (y = (l = a).assetType, o && l !== e && (y.id in c ? e.assetType.id in c && c[y.id] === c[e.assetType.id] : !(e.assetType.id in c) && y.id === e.assetType.id)) ? console.debug("Removed asset ".concat(a.name, " because it is being cleared by the new outfit")) : (r[N] += 1, n.push(a)) : console.debug("Removed asset ".concat(a.name, " because it exceeded wearing limits"))
                        }
                    }
                    return m(e), a.forEach(function(e) {
                        m(e)
                    }), n
                },
                removeAssetFromAvatar: function(e, a) {
                    var o = [];
                    return a.forEach(function(a) {
                        a.id !== e.id && o.push(a)
                    }), o
                },
                removeAssetTypesFromAvatar: function(e, a) {
                    var o = [];
                    return a.forEach(function(a) {
                        var t = !1;
                        e.forEach(function(e) {
                            a.assetType.id === e && (t = !0)
                        }), t || o.push(a)
                    }), o
                },
                removeLayeredClothingFromAvatar: function(e) {
                    var a = [];
                    return e.forEach(function(e) {
                        p(e.assetType.id, !0) || a.push(e)
                    }), a
                },
                getAssetTypeById: b,
                getAssetTypeByName: function(e) {
                    var a;
                    return t.forEach(function(o) {
                        o.name === e && (a = o)
                    }), a
                },
                getAssetTypeByType: function(e) {
                    var a;
                    return t.forEach(function(o) {
                        o.type === e && (a = o)
                    }), a
                },
                getAssetTypeNameById: function(e) {
                    var a = b(e);
                    return a && a.name ? a.name : null
                },
                getLayeredClothingAssetOrder: function(e) {
                    return m[e]
                },
                getAdvancedAccessoryLimit: function(e) {
                    return l[e]
                },
                isAccessoryType: g,
                isAnimation: function(e) {
                    switch (e) {
                        case "ClimbAnimation":
                        case "FallAnimation":
                        case "JumpAnimation":
                        case "RunAnimation":
                        case "SwimAnimation":
                        case "WalkAnimation":
                        case r:
                        case "IdleAnimation":
                        case "Climb Animation":
                        case "Fall Animation":
                        case "Jump Animation":
                        case "Run Animation":
                        case "Swim Animation":
                        case "Walk Animation":
                        case i:
                        case "Idle Animation":
                            return !0;
                        default:
                            return !1
                    }
                },
                isEmote: function(e) {
                    switch (e) {
                        case r:
                        case i:
                            return !0;
                        default:
                            return !1
                    }
                },
                isLayeredClothing: p,
                isDynamicHead: u,
                isDynamicHeadInAssetList: function(e) {
                    var a = !1;
                    return e.forEach(function(e) {
                        u(e.assetType.name) && (a = !0)
                    }), a
                },
                isNonAvatarAssetType: d,
                isProfileBackground: function(e) {
                    return 92 === e
                },
                buildMetaForAsset: function(e, a) {
                    var o = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
                    if (!p(e.assetType.id)) return e;
                    if (t = !0, a.forEach(function(e) {
                            p(e.assetType.id, !0) && e.meta && (t = t && e.meta.order === m[e.assetType.id])
                        }), t) n = {
                        order: m[e.assetType.id]
                    };
                    else {
                        var t, n, r, i, s = 0,
                            l = m[e.assetType.id];
                        a.forEach(function(a) {
                            if (p(a.assetType.id, !0)) {
                                if (A(e, a)) n = {
                                    order: a.meta.order
                                };
                                else if (a.assetType.id === e.assetType.id) o ? n = {
                                    order: a.meta.order
                                } : (r = 0, i = a.meta.order + 1);
                                else {
                                    var t = m[a.assetType.id];
                                    t > l && (void 0 === r || t - l < r) && !(o && c[e.assetType.id] === c[a.assetType.id]) && (r = t - l, i = a.meta.order - 1)
                                }
                                s += 1
                            }
                        }), void 0 === n && (n = void 0 === i ? {
                            order: s
                        } : {
                            order: i
                        })
                    }
                    return Object.assign(e, {
                        meta: n
                    })
                },
                insertAssetMetaIntoAssetList: function(e, a) {
                    var o, t = [],
                        n = [];
                    a.forEach(function(e) {
                        var a = JSON.parse(JSON.stringify(e));
                        p(e.assetType.id, !0) && n.push(a), t.push(a)
                    });
                    var r = !0;
                    return n.forEach(function(a) {
                        A(a, e) && (o = a), !A(a, e) && e.meta && a.meta.order >= e.meta.order && (a.meta.order += 1, r = !1)
                    }), e.meta && !r && (o.meta.order += 1), t
                },
                buildMetaForAssets: function(e, a) {
                    var o = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : void 0,
                        t = [];
                    return e.forEach(function(e) {
                        if (!(e.assetType && d(e.assetType.id))) {
                            var n = JSON.parse(JSON.stringify(e));
                            !e.empty && p(e.assetType.id) && (!(a && n.meta) && o && N(e, o) >= 0 ? n.meta = {
                                order: N(e, o)
                            } : n.meta || (n.meta = {
                                order: m[e.assetType.id]
                            })), t.push(n)
                        }
                    }), t
                },
                maxNumberOfLayeredClothingItems: 5,
                maxNumberOfAdvancedAccessoryItems: 10,
                isBodyPart: function(e) {
                    return b(e).body
                },
                layeredClothingRefinementOrderOffset: 5,
                getCategories: function() {
                    var e = {};
                    return t.forEach(function(a) {
                        a.category && (e[a.category] || (e[a.category] = []), e[a.category].push(a.id))
                    }), e
                }
            }
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("AvatarAccoutrementRules");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/avatarAccoutrementRules-849f6dfea9e16201.js.map