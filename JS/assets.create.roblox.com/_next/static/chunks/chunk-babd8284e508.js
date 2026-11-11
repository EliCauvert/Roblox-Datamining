;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "ce587e39-e58a-2327-e306-d0a4b9514921")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 803087, e => {
    "use strict";
    var t = e.i(415858),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function r(e, t, n, r) {
        return new(n || (n = Promise))(function(s, i) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var t;
                e.done ? s(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var n, r, s, i = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var l = [o, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                    if (n = 1, r && (s = 2 & l[0] ? r.return : l[0] ? r.throw || ((s = r.return) && s.call(r), 0) : r.next) && !(s = s.call(r, l[1])).done) return s;
                    switch (r = 0, s && (l = [2 & l[0], s.value]), l[0]) {
                        case 0:
                        case 1:
                            s = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(s = (s = i.trys).length > 0 && s[s.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!s || l[1] > s[0] && l[1] < s[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < s[1]) {
                                i.label = s[1], s = l;
                                break
                            }
                            if (s && i.label < s[2]) {
                                i.label = s[2], i.ops.push(l);
                                break
                            }
                            s[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = s = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function i(e) {
        return e
    }

    function a(e) {
        return e
    }

    function o(e) {
        return e
    }

    function u(e) {
        return e
    }

    function l(e) {
        var n;
        return null == (n = e) ? n : {
            duration: (0, t.u)(n, "duration") ? n.duration : void 0,
            usage: (0, t.u)(n, "usage") ? n.usage : void 0,
            capacity: (0, t.u)(n, "capacity") ? n.capacity : void 0,
            expirationTime: (0, t.u)(n, "expirationTime") ? null === n.expirationTime ? null : new Date(n.expirationTime) : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var d = function(e) {
        function d() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function r() {
                this.constructor = e
            }
            n(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
        }(d, e), d.prototype.marketplacePublishingRequirementsApiGetRequirementsRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, d, c;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return r = {}, void 0 !== e.marketplaceType && (r.MarketplaceType = e.marketplaceType), void 0 !== e.assetType && (r.AssetType = e.assetType), e.assetSubTypes && (r.AssetSubTypes = e.assetSubTypes), void 0 !== e.assetId && (r.AssetId = e.assetId), void 0 !== e.assetVersionNumber && (r.AssetVersionNumber = e.assetVersionNumber), e.requirementChecks && (r.RequirementChecks = e.requirementChecks), d = {}, [4, this.request({
                                path: "/v1/requirements",
                                schemaPath: "/v1/requirements",
                                method: "GET",
                                headers: d,
                                query: r
                            }, n)];
                        case 1:
                            return c = s.sent(), [2, new t.H(c, function(e) {
                                var n, r, s, d, c, p, v;
                                return null == e ? e : {
                                    publishing: (0, t.u)(e, "publishing") ? null == (n = e.publishing) ? n : {
                                        restrictions: (0, t.u)(n, "restrictions") ? null === n.restrictions ? null : n.restrictions.map(i) : void 0,
                                        allowedSubTypes: (0, t.u)(n, "allowedSubTypes") ? null === n.allowedSubTypes ? null : n.allowedSubTypes.map(a) : void 0,
                                        isAllowed: (0, t.u)(n, "isAllowed") ? n.isAllowed : void 0
                                    } : void 0,
                                    verification: (0, t.u)(e, "verification") ? null == (r = e.verification) ? r : {
                                        isVerified: (0, t.u)(r, "isVerified") ? r.isVerified : void 0,
                                        status: (0, t.u)(r, "status") ? r.status : void 0,
                                        supportedTypes: (0, t.u)(r, "supportedTypes") ? null === r.supportedTypes ? null : r.supportedTypes.map(u) : void 0
                                    } : void 0,
                                    sellerOnboarding: (0, t.u)(e, "sellerOnboarding") ? null == (s = e.sellerOnboarding) ? s : {
                                        restrictions: (0, t.u)(s, "restrictions") ? null === s.restrictions ? null : s.restrictions.map(i) : void 0,
                                        isAllowed: (0, t.u)(s, "isAllowed") ? s.isAllowed : void 0
                                    } : void 0,
                                    pricing: (0, t.u)(e, "pricing") ? null == (d = e.pricing) ? d : {
                                        restrictions: (0, t.u)(d, "restrictions") ? null === d.restrictions ? null : d.restrictions.map(i) : void 0,
                                        isAllowed: (0, t.u)(d, "isAllowed") ? d.isAllowed : void 0
                                    } : void 0,
                                    openUse: (0, t.u)(e, "openUse") ? null == (c = e.openUse) ? c : {
                                        restrictions: (0, t.u)(c, "restrictions") ? null === c.restrictions ? null : c.restrictions.map(i) : void 0,
                                        isAllowed: (0, t.u)(c, "isAllowed") ? c.isAllowed : void 0
                                    } : void 0,
                                    roles: (0, t.u)(e, "roles") ? null == (p = e.roles) ? p : {
                                        roles: (0, t.u)(p, "roles") ? null === p.roles ? null : p.roles.map(o) : void 0
                                    } : void 0,
                                    assetConfigMetadata: (0, t.u)(e, "assetConfigMetadata") ? null == (v = e.assetConfigMetadata) ? v : {
                                        restrictions: (0, t.u)(v, "restrictions") ? null === v.restrictions ? null : v.restrictions.map(i) : void 0
                                    } : void 0,
                                    quotas: (0, t.u)(e, "quotas") ? null === e.quotas ? null : e.quotas.map(l) : void 0
                                }
                            })]
                    }
                })
            })
        }, d.prototype.marketplacePublishingRequirementsApiGetRequirements = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.marketplacePublishingRequirementsApiGetRequirementsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, d
    }(t._);
    e.s(["s", 0, {
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
        EyeMakeup: "EyeMakeup"
    }, "v", 0, d, "Y", 0, {
        Invalid: "Invalid",
        Creator: "Creator"
    }, "y", 0, {
        Invalid: "Invalid",
        SellerOnboarding: "SellerOnboarding",
        Publishing: "Publishing",
        Pricing: "Pricing",
        Roles: "Roles",
        Sharing: "Sharing",
        OpenUse: "OpenUse",
        AssetConfig: "AssetConfig"
    }, "J", 0, {
        Invalid: "Invalid",
        Authorization: "Authorization",
        Verification: "Verification",
        Quota: "Quota",
        AssetType: "AssetType",
        SafetyStatus: "SafetyStatus",
        KillSwitch: "KillSwitch",
        SellerAccountNotOnboarded: "SellerAccountNotOnboarded",
        SellerAccountRestricted: "SellerAccountRestricted",
        UnsupportedAssetOwner: "UnsupportedAssetOwner",
        Chargebacks: "Chargebacks",
        Moderation: "Moderation",
        ModerationHistory: "ModerationHistory",
        AssetModeration: "AssetModeration",
        AudioDuration: "AudioDuration",
        Packages: "Packages",
        CompositeAssetSubcomponentsRestricted: "CompositeAssetSubcomponentsRestricted",
        PricedAsset: "PricedAsset",
        RightsClaim: "RightsClaim",
        CompositeAssetSubcomponentsEligibilityPending: "CompositeAssetSubcomponentsEligibilityPending",
        UnsupportedSellerCountry: "UnsupportedSellerCountry",
        CompositeAssetLatestVersionUnverified: "CompositeAssetLatestVersionUnverified",
        CompositeAssetBrokenUnknownPermissions: "CompositeAssetBrokenUnknownPermissions",
        CompositeAssetBrokenDependenciesLimit: "CompositeAssetBrokenDependenciesLimit",
        CompositeAssetBrokenReferencedAssetNotFound: "CompositeAssetBrokenReferencedAssetNotFound",
        NotOriginalCreatorOfGroupAsset: "NotOriginalCreatorOfGroupAsset",
        CompositeAssetRevertedToUnevaluatedVersion: "CompositeAssetRevertedToUnevaluatedVersion",
        TwoStepVerification: "TwoStepVerification",
        AgeVerification: "AgeVerification",
        SocialLinkCreate: "SocialLinkCreate",
        SocialLinkView: "SocialLinkView",
        NoPublishedVersion: "NoPublishedVersion"
    }, "n", 0, {
        Invalid: "Invalid",
        Reseller: "Reseller"
    }])
}, 261482, 858148, 966956, 719743, 477749, e => {
    "use strict";
    var t, n = e.i(910272),
        r = e.i(805290),
        s = e.i(415858),
        i = function(e, t) {
            return (i = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function a(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        i(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function o(e, t, n, r) {
        return new(n || (n = Promise))(function(s, i) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var t;
                e.done ? s(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function u(e, t) {
        var n, r, s, i = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var l = [o, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                    if (n = 1, r && (s = 2 & l[0] ? r.return : l[0] ? r.throw || ((s = r.return) && s.call(r), 0) : r.next) && !(s = s.call(r, l[1])).done) return s;
                    switch (r = 0, s && (l = [2 & l[0], s.value]), l[0]) {
                        case 0:
                        case 1:
                            s = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(s = (s = i.trys).length > 0 && s[s.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!s || l[1] > s[0] && l[1] < s[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < s[1]) {
                                i.label = s[1], s = l;
                                break
                            }
                            if (s && i.label < s[2]) {
                                i.label = s[2], i.ops.push(l);
                                break
                            }
                            s[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = s = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            label_id: e.labelId,
            target_id: e.targetId,
            target_type: e.targetType,
            values: e.values,
            attributes: e.attributes,
            from_name_ls: e.fromNameLs,
            type_ls: e.typeLs,
            omit_alignment: e.omitAlignment,
            raw_ls: e.rawLs
        }
    }

    function d(e) {
        var t, n;
        return null == (t = e) ? t : {
            virtualPurchasingProductId: (0, s.u)(t, "virtualPurchasingProductId") ? t.virtualPurchasingProductId : void 0,
            virtualPurchasingProductType: (0, s.u)(t, "virtualPurchasingProductType") ? t.virtualPurchasingProductType : void 0,
            virtualPurchasingProductTargetId: (0, s.u)(t, "virtualPurchasingProductTargetId") ? t.virtualPurchasingProductTargetId : void 0,
            universalProductIdentifier: (0, s.u)(t, "universalProductIdentifier") ? null == (n = t.universalProductIdentifier) ? n : {
                namespace: (0, s.u)(n, "namespace") ? n.namespace : void 0,
                targetIdentifier: (0, s.u)(n, "targetIdentifier") ? n.targetIdentifier : void 0
            } : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function c(e) {
        var t, n, r;
        return null == (t = e) ? t : {
            bonus: (0, s.u)(t, "bonus") ? d(t.bonus) : void 0,
            gamePassPayload: (0, s.u)(t, "gamePassPayload") ? null == (n = t.gamePassPayload) ? n : {
                rootPlaceId: (0, s.u)(n, "rootPlaceId") ? n.rootPlaceId : void 0,
                gamePassDisplayName: (0, s.u)(n, "gamePassDisplayName") ? n.gamePassDisplayName : void 0,
                experienceDisplayName: (0, s.u)(n, "experienceDisplayName") ? n.experienceDisplayName : void 0,
                gamePassDisplayImageUrl: (0, s.u)(n, "gamePassDisplayImageUrl") ? n.gamePassDisplayImageUrl : void 0,
                experienceImageUrl: (0, s.u)(n, "experienceImageUrl") ? n.experienceImageUrl : void 0,
                experienceRatingText: (0, s.u)(n, "experienceRatingText") ? n.experienceRatingText : void 0
            } : void 0,
            avatarItemPayload: (0, s.u)(t, "avatarItemPayload") ? null == (r = t.avatarItemPayload) ? r : {
                assetId: (0, s.u)(r, "assetId") ? r.assetId : void 0,
                displayName: (0, s.u)(r, "displayName") ? r.displayName : void 0,
                thumbnailUrl: (0, s.u)(r, "thumbnailUrl") ? r.thumbnailUrl : void 0,
                hasThumbnailUrl: (0, s.u)(r, "hasThumbnailUrl") ? r.hasThumbnailUrl : void 0,
                creatorName: (0, s.u)(r, "creatorName") ? r.creatorName : void 0,
                hasCreatorName: (0, s.u)(r, "hasCreatorName") ? r.hasCreatorName : void 0,
                creatorIsVerified: (0, s.u)(r, "creatorIsVerified") ? r.creatorIsVerified : void 0,
                hasCreatorIsVerified: (0, s.u)(r, "hasCreatorIsVerified") ? r.hasCreatorIsVerified : void 0,
                backgroundImageUrl: (0, s.u)(r, "backgroundImageUrl") ? r.backgroundImageUrl : void 0,
                hasBackgroundImageUrl: (0, s.u)(r, "hasBackgroundImageUrl") ? r.hasBackgroundImageUrl : void 0,
                thumbnailAnimatedUrl: (0, s.u)(r, "thumbnailAnimatedUrl") ? r.thumbnailAnimatedUrl : void 0,
                hasThumbnailAnimatedUrl: (0, s.u)(r, "hasThumbnailAnimatedUrl") ? r.hasThumbnailAnimatedUrl : void 0
            } : void 0,
            offeringType: (0, s.u)(t, "offeringType") ? t.offeringType : void 0,
            expirationTimestampMs: (0, s.u)(t, "expirationTimestampMs") ? t.expirationTimestampMs : void 0
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            productNamespace: e.productNamespace,
            productId: e.productId,
            bonusPoliciesName: e.bonusPoliciesName
        }
    }

    function v(e) {
        var t, n;
        return null == (t = e) ? t : {
            key: (0, s.u)(t, "key") ? null == (n = t.key) ? n : {
                productNamespace: (0, s.u)(n, "productNamespace") ? n.productNamespace : void 0,
                productId: (0, s.u)(n, "productId") ? n.productId : void 0,
                bonusPoliciesName: (0, s.u)(n, "bonusPoliciesName") ? n.bonusPoliciesName : void 0,
                hasBonusPoliciesName: (0, s.u)(n, "hasBonusPoliciesName") ? n.hasBonusPoliciesName : void 0
            } : void 0,
            displayableBonuses: (0, s.u)(t, "displayableBonuses") ? null === t.displayableBonuses ? null : t.displayableBonuses.map(c) : void 0
        }
    }

    function m(e, t) {
        return null == e ? e : {
            selectedDisplayableBonuses: (0, s.u)(e, "selectedDisplayableBonuses") ? null === e.selectedDisplayableBonuses ? null : e.selectedDisplayableBonuses.map(c) : void 0
        }
    }
    var h = s._;

    function f() {
        return null !== h && h.apply(this, arguments) || this
    }
    a(f, h), f.prototype.paymentsBonusModerationApplyBonusModerationDecisionRaw = function(e, t) {
        return o(this, void 0, void 0, function() {
            var n, r, i;
            return u(this, function(a) {
                switch (a.label) {
                    case 0:
                        return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                            path: "/v1/moderation-decision",
                            schemaPath: "/v1/moderation-decision",
                            method: "POST",
                            headers: r,
                            query: n,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    decision_id: e.decisionId,
                                    decision_event_id: e.decisionEventId,
                                    idempotency_key: e.idempotencyKey,
                                    reasons: e.reasons,
                                    associated_entity: e.associatedEntity,
                                    decider_id: e.deciderId,
                                    decider_type: e.deciderType,
                                    labels: e.labels,
                                    ticket_id: e.ticketId,
                                    annotations: void 0 === e.annotations ? void 0 : null === e.annotations ? null : e.annotations.map(l),
                                    raw_ls: e.rawLs,
                                    category: e.category,
                                    run_id: e.runId,
                                    correlation_id: e.correlationId,
                                    user: e.user,
                                    report: e.report,
                                    appeal: e.appeal,
                                    media: e.media,
                                    content: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            id: e.id,
                                            type: e.type,
                                            update_time: e.updateTime,
                                            custom: e.custom,
                                            user_id: e.userId,
                                            locale: e.locale,
                                            content_type: e.contentType,
                                            media_type: e.mediaType
                                        }
                                    }(e.content),
                                    custom: e.custom
                                }
                            }(e.paymentsBonusModerationApplyBonusModerationDecisionRequest)
                        }, t)];
                    case 1:
                        return i = a.sent(), [2, new s.H(i)]
                }
            })
        })
    }, f.prototype.paymentsBonusModerationApplyBonusModerationDecision = function() {
        return o(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), u(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.paymentsBonusModerationApplyBonusModerationDecisionRaw(e, t)];
                    case 1:
                        return [4, n.sent().value()];
                    case 2:
                        return [2, n.sent()]
                }
            })
        })
    }, f.prototype.paymentsBonusModerationFixBonusOptInStatusRaw = function(e, t) {
        return o(this, void 0, void 0, function() {
            var n, r, i;
            return u(this, function(a) {
                switch (a.label) {
                    case 0:
                        return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                            path: "/v1/fix-bonus-opt-in-status",
                            schemaPath: "/v1/fix-bonus-opt-in-status",
                            method: "POST",
                            headers: r,
                            query: n,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    gamePassId: e.gamePassId
                                }
                            }(e.paymentsBonusModerationFixBonusOptInStatusRequest)
                        }, t)];
                    case 1:
                        return i = a.sent(), [2, new s.H(i)]
                }
            })
        })
    }, f.prototype.paymentsBonusModerationFixBonusOptInStatus = function() {
        return o(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), u(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.paymentsBonusModerationFixBonusOptInStatusRaw(e, t)];
                    case 1:
                        return [4, n.sent().value()];
                    case 2:
                        return [2, n.sent()]
                }
            })
        })
    };
    var g = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(t, e), t.prototype.paymentsBonusServiceCreateOrUpdateBonusOptInStatusRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var n, r, i;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/opt-in-status",
                                    schemaPath: "/v1/opt-in-status",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            virtualPurchasingProductType: e.virtualPurchasingProductType,
                                            virtualPurchasingProductTargetId: e.virtualPurchasingProductTargetId,
                                            isOptedIn: e.isOptedIn
                                        }
                                    }(e.paymentsBonusServiceCreateOrUpdateBonusOptInStatusRequest)
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new s.H(i)]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceCreateOrUpdateBonusOptInStatus = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), u(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.paymentsBonusServiceCreateOrUpdateBonusOptInStatusRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetBonusOptInInfoRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var n, r, i;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return n = {}, void 0 !== e.productType && (n.productType = e.productType), void 0 !== e.productTargetId && (n.productTargetId = e.productTargetId), r = {}, [4, this.request({
                                    path: "/v1/opt-in-status",
                                    schemaPath: "/v1/opt-in-status",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new s.H(i, function(e) {
                                    return null == e ? e : {
                                        isBonusOptedIn: (0, s.u)(e, "isBonusOptedIn") ? e.isBonusOptedIn : void 0,
                                        isEligible: (0, s.u)(e, "isEligible") ? e.isEligible : void 0,
                                        moderationStatus: (0, s.u)(e, "moderationStatus") ? e.moderationStatus : void 0,
                                        isBonusOptInVisible: (0, s.u)(e, "isBonusOptInVisible") ? e.isBonusOptInVisible : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetBonusOptInInfo = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), u(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.paymentsBonusServiceGetBonusOptInInfoRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetBonusSessionRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var n, r, i;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return n = {}, void 0 !== e.paymentSessionId && (n.paymentSessionId = e.paymentSessionId), r = {}, [4, this.request({
                                    path: "/v1/bonus-sessions",
                                    schemaPath: "/v1/bonus-sessions",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new s.H(i, function(e) {
                                    return null == e ? e : {
                                        selectedBonuses: (0, s.u)(e, "selectedBonuses") ? null === e.selectedBonuses ? null : e.selectedBonuses.map(d) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetBonusSession = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), u(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.paymentsBonusServiceGetBonusSessionRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetOrCreateBonusSessionRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var n, r, i;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/bonus-sessions",
                                    schemaPath: "/v1/bonus-sessions",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            paymentSessionId: e.paymentSessionId,
                                            productBonusKeys: void 0 === e.productBonusKeys ? void 0 : null === e.productBonusKeys ? null : e.productBonusKeys.map(p)
                                        }
                                    }(e.paymentsBonusServiceGetOrCreateBonusSessionRequest)
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new s.H(i, function(e) {
                                    return null == e ? e : {
                                        selectedDisplayableBonuses: (0, s.u)(e, "selectedDisplayableBonuses") ? null === e.selectedDisplayableBonuses ? null : e.selectedDisplayableBonuses.map(c) : void 0,
                                        created: (0, s.u)(e, "created") ? e.created : void 0,
                                        productDisplayableBonuses: (0, s.u)(e, "productDisplayableBonuses") ? null === e.productDisplayableBonuses ? null : e.productDisplayableBonuses.map(v) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetOrCreateBonusSession = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), u(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.paymentsBonusServiceGetOrCreateBonusSessionRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetPaymentBonusByCheckoutSessionIdRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var n, r, i;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.checkoutSessionId || void 0 === e.checkoutSessionId) throw new s.w("checkoutSessionId", "Required parameter requestParameters.checkoutSessionId was null or undefined when calling paymentsBonusServiceGetPaymentBonusByCheckoutSessionId.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/checkout-session/{checkoutSessionId}/payment-bonus".replace("{".concat("checkoutSessionId", "}"), encodeURIComponent(String(e.checkoutSessionId))),
                                    schemaPath: "/v1/checkout-session/{checkoutSessionId}/payment-bonus",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new s.H(i, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetPaymentBonusByCheckoutSessionId = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return u(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.paymentsBonusServiceGetPaymentBonusByCheckoutSessionIdRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetPaymentBonusByPaymentSessionIdRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var n, r, i;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.paymentSessionId || void 0 === e.paymentSessionId) throw new s.w("paymentSessionId", "Required parameter requestParameters.paymentSessionId was null or undefined when calling paymentsBonusServiceGetPaymentBonusByPaymentSessionId.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/payment-session/{paymentSessionId}/payment-bonus".replace("{".concat("paymentSessionId", "}"), encodeURIComponent(String(e.paymentSessionId))),
                                    schemaPath: "/v1/payment-session/{paymentSessionId}/payment-bonus",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new s.H(i, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceGetPaymentBonusByPaymentSessionId = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return u(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.paymentsBonusServiceGetPaymentBonusByPaymentSessionIdRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceHandleGameJoinEventRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var n, r, i;
                    return u(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/handle-game-join-event",
                                    schemaPath: "/v1/handle-game-join-event",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            gamePassId: e.gamePassId,
                                            rootPlaceId: e.rootPlaceId,
                                            checkoutSessionId: e.checkoutSessionId,
                                            paymentSessionId: e.paymentSessionId
                                        }
                                    }(e.paymentsBonusServiceHandleGameJoinEventRequest)
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new s.H(i)]
                        }
                    })
                })
            }, t.prototype.paymentsBonusServiceHandleGameJoinEvent = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), u(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.paymentsBonusServiceHandleGameJoinEventRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(s._),
        I = e.i(272593),
        P = ((t = {})[t.Unspecified = 0] = "Unspecified", t[t.PendingReview = 1] = "PendingReview", t[t.Approved = 2] = "Approved", t[t.Rejected = 3] = "Rejected", t);
    let y = new class {
        getOptInStatus(e) {
            return this.bonusItemApi.paymentsBonusServiceGetBonusOptInInfo(e)
        }
        updateOptInStatus(e) {
            return this.bonusItemApi.paymentsBonusServiceCreateOrUpdateBonusOptInStatus(e)
        }
        constructor() {
            (0, r._)(this, "bonusItemApi", void 0), this.bonusItemApi = new g((0, I.f)("payments-bonus-service", "bedev2"))
        }
    };
    e.s(["T", () => P, "I", 0, 6, "U", 0, y], 858148);
    let w = {
        all: e => ["passes", e],
        listAll: (e, t) => [...w.all(e), "listAll", t],
        config: (e, t) => [...w.all(e), "config", t],
        batchConfigs: (e, t) => [...w.all(e), "batchConfigs", [...t].sort((e, t) => e - t)],
        create: e => [...w.all(e), "create"],
        update: (e, t) => [...w.all(e), t, "update"],
        batchUpdate: e => [...w.all(e), "batchUpdate"],
        bonusOptIn: (e, t) => [...w.all(e), t, "bonusOptIn"],
        metadata: () => ["passes", "metadata"]
    };
    e.s(["M", 0, 1, "e", 0, 1 / 0, "f", 0, w, "z", 0, function(e, t) {
        let n = e.queryKey;
        return "passes" === n[0] && n[1] === t && "batchConfigs" === n[2] && Array.isArray(n[3])
    }, "c", 0, function(e, t) {
        let n = e.queryKey;
        return "passes" === n[0] && n[1] === t && "listAll" === n[2]
    }], 966956), e.s(["M", 0, 1, "e", 0, 1 / 0], 719743), e.s(["f", 0, function(e) {
        var t;
        let {
            universeId: r,
            gamePassId: s
        } = e, i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return (0, n.f)({
            queryKey: w.bonusOptIn(r, s),
            queryFn: () => y.getOptInStatus({
                productTargetId: s,
                productType: 6
            }),
            staleTime: 1 / 0,
            retry: 1,
            ...i,
            enabled: (null == (t = i.enabled) || t) && !!r && !!s
        })
    }], 261482);
    var b = e.i(341260);
    e.s(["f", 0, function() {
        let e = (0, b.useRouter)(),
            t = e.query.passId;
        if (!e.isReady) return {
            isLoading: !0,
            isError: !1
        };
        if (!t || Array.isArray(t)) return {
            isLoading: !1,
            isError: !0
        };
        let n = Number(t);
        return Number.isNaN(n) || !Number.isInteger(n) ? {
            isLoading: !1,
            isError: !0
        } : {
            passId: n,
            isLoading: !1,
            isError: !1
        }
    }], 477749)
}, 503725, 517176, e => {
    "use strict";
    var t = e.i(805290),
        n = e.i(415858),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function s(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        r(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }
    var i = function() {
        return (i = Object.assign || function(e) {
            for (var t, n = 1, r = arguments.length; n < r; n++)
                for (var s in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s]);
            return e
        }).apply(this, arguments)
    };

    function a(e, t, n, r) {
        return new(n || (n = Promise))(function(s, i) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var t;
                e.done ? s(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var n, r, s, i = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var l = [o, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                    if (n = 1, r && (s = 2 & l[0] ? r.return : l[0] ? r.throw || ((s = r.return) && s.call(r), 0) : r.next) && !(s = s.call(r, l[1])).done) return s;
                    switch (r = 0, s && (l = [2 & l[0], s.value]), l[0]) {
                        case 0:
                        case 1:
                            s = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(s = (s = i.trys).length > 0 && s[s.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!s || l[1] > s[0] && l[1] < s[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < s[1]) {
                                i.label = s[1], s = l;
                                break
                            }
                            if (s && i.label < s[2]) {
                                i.label = s[2], i.ops.push(l);
                                break
                            }
                            s[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = s = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function u(e) {
        return e
    }
    "function" == typeof SuppressedError && SuppressedError;

    function l(e, t) {
        return null == e ? e : {
            defaultPriceInRobux: e.defaultPriceInRobux,
            enabledFeatures: e.enabledFeatures.map(u)
        }
    }

    function d(e) {
        var t;
        return null == (t = e) ? t : {
            productId: t.productId,
            name: t.name,
            description: t.description,
            iconImageAssetId: t.iconImageAssetId,
            universeId: t.universeId,
            isForSale: t.isForSale,
            priceInformation: l(t.priceInformation),
            isImmutable: t.isImmutable,
            createdTimestamp: new Date(t.createdTimestamp),
            updatedTimestamp: new Date(t.updatedTimestamp),
            isArchived: null == t.isArchived ? void 0 : t.isArchived,
            isManagedPricingEnabled: t.isManagedPricingEnabled
        }
    }
    var c = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return s(t, e), t.prototype.developerProductsBatchGetDeveloperProductConfigsRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, r;
                return o(this, function(s) {
                    var i;
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsBatchGetDeveloperProductConfigs().');
                    return t = {}, (r = {})["Content-Type"] = "application/json", [2, {
                        path: "/v2/universes/{universeId}/developer-products/creator:batchGet".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v2/universes/{universeId}/developer-products/creator:batchGet",
                        method: "POST",
                        headers: r,
                        query: t,
                        body: null == (i = e.batchGetDeveloperProductConfigsRequest) ? i : {
                            productIds: i.productIds
                        }
                    }]
                })
            })
        }, t.prototype.developerProductsBatchGetDeveloperProductConfigsRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsBatchGetDeveloperProductConfigsRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    developerProducts: e.developerProducts.map(d)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsBatchGetDeveloperProductConfigs = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsBatchGetDeveloperProductConfigsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsCreateDeveloperProductV2RequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, r, s;
                return o(this, function(i) {
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsCreateDeveloperProductV2().');
                    if (null == e.name) throw new n.w("name", 'Required parameter "name" was null or undefined when calling developerProductsCreateDeveloperProductV2().');
                    return t = {}, r = {}, s = (0, n.I)([{
                        contentType: "multipart/form-data"
                    }]) ? new FormData : new URLSearchParams, null != e.name && s.append("name", e.name), null != e.description && s.append("description", e.description), null != e.isForSale && s.append("isForSale", e.isForSale), null != e.price && s.append("price", e.price), null != e.imageFile && s.append("imageFile", e.imageFile), null != e.isManagedPricingEnabled && s.append("isManagedPricingEnabled", e.isManagedPricingEnabled), [2, {
                        path: "/v2/universes/{universeId}/developer-products".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v2/universes/{universeId}/developer-products",
                        method: "POST",
                        headers: r,
                        query: t,
                        body: s
                    }]
                })
            })
        }, t.prototype.developerProductsCreateDeveloperProductV2Raw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsCreateDeveloperProductV2RequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return d(e)
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsCreateDeveloperProductV2 = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsCreateDeveloperProductV2Raw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsGetDeveloperProductConfigV2RequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, r;
                return o(this, function(s) {
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsGetDeveloperProductConfigV2().');
                    if (null == e.productId) throw new n.w("productId", 'Required parameter "productId" was null or undefined when calling developerProductsGetDeveloperProductConfigV2().');
                    return t = {}, r = {}, [2, {
                        path: "/v2/universes/{universeId}/developer-products/{productId}/creator".replace("{universeId}", encodeURIComponent(String(e.universeId))).replace("{productId}", encodeURIComponent(String(e.productId))),
                        schemaPath: "/v2/universes/{universeId}/developer-products/{productId}/creator",
                        method: "GET",
                        headers: r,
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsGetDeveloperProductConfigV2Raw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsGetDeveloperProductConfigV2RequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return d(e)
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsGetDeveloperProductConfigV2 = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsGetDeveloperProductConfigV2Raw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsListDeveloperProductConfigsByUniverseV2RequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, r;
                return o(this, function(s) {
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsListDeveloperProductConfigsByUniverseV2().');
                    return t = {}, null != e.pageSize && (t.pageSize = e.pageSize), null != e.pageToken && (t.pageToken = e.pageToken), null != e.isForSale && (t.isForSale = e.isForSale), null != e.isArchived && (t.isArchived = e.isArchived), r = {}, [2, {
                        path: "/v2/universes/{universeId}/developer-products/creator".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v2/universes/{universeId}/developer-products/creator",
                        method: "GET",
                        headers: r,
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsListDeveloperProductConfigsByUniverseV2Raw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsListDeveloperProductConfigsByUniverseV2RequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    developerProducts: e.developerProducts.map(d),
                                    nextPageToken: e.nextPageToken
                                }
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsListDeveloperProductConfigsByUniverseV2 = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsListDeveloperProductConfigsByUniverseV2Raw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsUpdateDeveloperProductV2RequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, r, s;
                return o(this, function(i) {
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsUpdateDeveloperProductV2().');
                    if (null == e.productId) throw new n.w("productId", 'Required parameter "productId" was null or undefined when calling developerProductsUpdateDeveloperProductV2().');
                    return t = {}, r = {}, s = (0, n.I)([{
                        contentType: "multipart/form-data"
                    }]) ? new FormData : new URLSearchParams, null != e.name && s.append("name", e.name), null != e.description && s.append("description", e.description), null != e.isForSale && s.append("isForSale", e.isForSale), null != e.price && s.append("price", e.price), null != e.imageFile && s.append("imageFile", e.imageFile), null != e.isManagedPricingEnabled && s.append("isManagedPricingEnabled", e.isManagedPricingEnabled), null != e.isArchived && s.append("isArchived", e.isArchived), [2, {
                        path: "/v2/universes/{universeId}/developer-products/{productId}".replace("{universeId}", encodeURIComponent(String(e.universeId))).replace("{productId}", encodeURIComponent(String(e.productId))),
                        schemaPath: "/v2/universes/{universeId}/developer-products/{productId}",
                        method: "PATCH",
                        headers: r,
                        query: t,
                        body: s
                    }]
                })
            })
        }, t.prototype.developerProductsUpdateDeveloperProductV2Raw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsUpdateDeveloperProductV2RequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.V(s)]
                    }
                })
            })
        }, t.prototype.developerProductsUpdateDeveloperProductV2 = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsUpdateDeveloperProductV2Raw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t
    }(n._);

    function p(e) {
        var t, n;
        return null == (t = e) ? t : {
            productId: t.productId,
            changedProperties: null == (n = t.changedProperties) ? n : {
                isManagedPricingEnabled: n.isManagedPricingEnabled,
                isArchived: n.isArchived
            }
        }
    }

    function v(e) {
        var t, n;
        return null == (t = e) ? t : {
            productId: t.productId,
            error: null == (n = t.error) ? n : {
                errorCode: null == n.errorCode ? void 0 : n.errorCode,
                errorMessage: null == n.errorMessage ? void 0 : n.errorMessage,
                field: void 0 === n.field ? void 0 : null === n.field ? null : n.field,
                hint: void 0 === n.hint ? void 0 : null === n.hint ? null : n.hint
            }
        }
    }

    function m(e) {
        var t;
        return null == (t = e) ? t : {
            type: null == t.Type ? void 0 : t.Type,
            amountInRobux: null == t.AmountInRobux ? void 0 : t.AmountInRobux,
            percent: null == t.Percent ? void 0 : t.Percent,
            endTime: void 0 === t.EndTime ? void 0 : null === t.EndTime ? null : new Date(t.EndTime)
        }
    }

    function h(e, t) {
        return null == e ? e : {
            id: null == e.Id ? void 0 : e.Id,
            name: void 0 === e.Name ? void 0 : null === e.Name ? null : e.Name,
            creatorType: void 0 === e.CreatorType ? void 0 : null === e.CreatorType ? null : e.CreatorType,
            creatorTargetId: null == e.CreatorTargetId ? void 0 : e.CreatorTargetId
        }
    }

    function f(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? i(i({}, w(e, !0)), {
            universeId: e.universeId,
            placeId: e.placeId,
            location: function(e) {
                if (null == e) return e;
                switch (e.locationType) {
                    case "developerPrompted":
                        return Object.assign({}, e, {
                            locationType: "developerPrompted"
                        });
                    case "personalizedShop":
                        return Object.assign({}, function e(t, n) {
                            return void 0 === n && (n = !1), null == t ? t : n ? i(i({}, function(t, n) {
                                if (void 0 === n && (n = !1), null == t) return t;
                                if (!n) switch (t.locationType) {
                                    case "developerPrompted":
                                    default:
                                        return t;
                                    case "personalizedShop":
                                        return e(t, n)
                                }
                                return {
                                    locationType: t.locationType
                                }
                            }(t, !0)), {
                                stableCategoryId: t.stableCategoryId,
                                categoryGroup: t.categoryGroup,
                                categoryPosition: t.categoryPosition,
                                gridPositionRow: t.gridPositionRow,
                                gridPositionColumn: t.gridPositionColumn,
                                categoryName: t.categoryName
                            }) : (t.locationType, t)
                        }(e, !1), {
                            locationType: "personalizedShop"
                        });
                    default:
                        return e
                }
            }(e.location)
        }) : (e.scopeType, e)
    }

    function g(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? i(i({}, I(e, !0)), {
            profileId: e.profileId,
            type: e.type
        }) : (e.pageType, e)
    }

    function I(e, t) {
        if (void 0 === t && (t = !1), null == e) return e;
        if (!t) switch (e.pageType) {
            case "experienceDetail":
                return P(e, t);
            case "marketplace":
            case "postPurchase":
            default:
                return e;
            case "profile":
                return g(e, t)
        }
        return {
            pageType: e.pageType
        }
    }

    function P(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? i(i({}, I(e, !0)), {
            universeId: e.universeId
        }) : (e.pageType, e)
    }

    function y(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? i(i({}, w(e, !0)), {
            page: function(e) {
                if (null == e) return e;
                switch (e.pageType) {
                    case "experienceDetail":
                        return Object.assign({}, P(e, !1), {
                            pageType: "experienceDetail"
                        });
                    case "marketplace":
                        return Object.assign({}, e, {
                            pageType: "marketplace"
                        });
                    case "postPurchase":
                        return Object.assign({}, e, {
                            pageType: "postPurchase"
                        });
                    case "profile":
                        return Object.assign({}, g(e, !1), {
                            pageType: "profile"
                        });
                    default:
                        return e
                }
            }(e.page)
        }) : (e.scopeType, e)
    }

    function w(e, t) {
        if (void 0 === t && (t = !1), null == e) return e;
        if (!t) switch (e.scopeType) {
            case "api":
            default:
                return e;
            case "inExperience":
                return f(e, t);
            case "lua":
                return b(e, t);
            case "web":
                return y(e, t)
        }
        return {
            scopeType: e.scopeType
        }
    }

    function b(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? i(i({}, w(e, !0)), {
            location: function(e) {
                if (null == e) return e;
                switch (e.locationType) {
                    case "homePageGameItemShop":
                        return Object.assign({}, e, {
                            locationType: "homePageGameItemShop"
                        });
                    case "searchPageGameItemShop":
                        return Object.assign({}, e, {
                            locationType: "searchPageGameItemShop"
                        });
                    default:
                        return e
                }
            }(e.location)
        }) : (e.scopeType, e)
    }

    function A(e) {
        var t;
        return null == (t = e) ? t : {
            source: t.source,
            discountId: t.discountId
        }
    }

    function T(e) {
        var t;
        return null == (t = e) ? t : {
            productId: void 0 === t.ProductId ? void 0 : null === t.ProductId ? null : t.ProductId,
            developerProductId: null == t.DeveloperProductId ? void 0 : t.DeveloperProductId,
            name: null == t.Name ? void 0 : t.Name,
            description: null == t.Description ? void 0 : t.Description,
            iconImageAssetId: void 0 === t.IconImageAssetId ? void 0 : null === t.IconImageAssetId ? null : t.IconImageAssetId,
            displayIcon: void 0 === t.displayIcon ? void 0 : null === t.displayIcon ? null : t.displayIcon,
            priceInRobux: void 0 === t.PriceInRobux ? void 0 : null === t.PriceInRobux ? null : t.PriceInRobux,
            isForSale: null == t.IsForSale ? void 0 : t.IsForSale,
            created: null == t.Created ? void 0 : new Date(t.Created),
            updated: null == t.Updated ? void 0 : new Date(t.Updated),
            isNew: null == t.IsNew ? void 0 : t.IsNew,
            universeId: null == t.UniverseId ? void 0 : t.UniverseId,
            productType: void 0 === t.ProductType ? void 0 : null === t.ProductType ? null : t.ProductType,
            creator: null == t.Creator ? void 0 : h(t.Creator),
            targetId: void 0 === t.TargetId ? void 0 : null === t.TargetId ? null : t.TargetId,
            displayIconImageAssetId: void 0 === t.DisplayIconImageAssetId ? void 0 : null === t.DisplayIconImageAssetId ? null : t.DisplayIconImageAssetId,
            displayName: void 0 === t.DisplayName ? void 0 : null === t.DisplayName ? null : t.DisplayName,
            displayDescription: void 0 === t.DisplayDescription ? void 0 : null === t.DisplayDescription ? null : t.DisplayDescription,
            isPublicDomain: void 0 === t.IsPublicDomain ? void 0 : null === t.IsPublicDomain ? null : t.IsPublicDomain,
            isLimited: void 0 === t.IsLimited ? void 0 : null === t.IsLimited ? null : t.IsLimited,
            minimumMembershipLevel: void 0 === t.MinimumMembershipLevel ? void 0 : null === t.MinimumMembershipLevel ? null : t.MinimumMembershipLevel,
            isLimitedUnique: void 0 === t.IsLimitedUnique ? void 0 : null === t.IsLimitedUnique ? null : t.IsLimitedUnique,
            assetId: void 0 === t.AssetId ? void 0 : null === t.AssetId ? null : t.AssetId,
            assetTypeId: void 0 === t.AssetTypeId ? void 0 : null === t.AssetTypeId ? null : t.AssetTypeId,
            userBasePriceInRobux: null == t.UserBasePriceInRobux ? void 0 : t.UserBasePriceInRobux,
            priceDiscountDetails: null == t.PriceDiscountDetails ? void 0 : t.PriceDiscountDetails.map(m)
        }
    }

    function S(e, t) {
        return null == e ? e : {
            developerProducts: e.developerProducts.map(T),
            nextPageCursor: e.nextPageCursor
        }
    }

    function R(e, t) {
        return null == e ? e : {
            purchased: void 0 === e.purchased ? void 0 : null === e.purchased ? null : e.purchased,
            transactionStatus: void 0 === e.transactionStatus ? void 0 : null === e.transactionStatus ? null : e.transactionStatus,
            productId: void 0 === e.productId ? void 0 : null === e.productId ? null : e.productId,
            price: void 0 === e.price ? void 0 : null === e.price ? null : e.price,
            receipt: null == e.receipt ? void 0 : e.receipt,
            receiptType: null == e.receiptType ? void 0 : e.receiptType,
            success: null == e.success ? void 0 : e.success
        }
    }
    var C = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return s(t, e), t.prototype.developerProductsApiBatchGetDeveloperProductsTempRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n;
                return o(this, function(r) {
                    return t = {}, null != e.productIds && (t.productIds = e.productIds), n = {}, null != e.robloxUniverseId && (n["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/developer-products/batch",
                        schemaPath: "/v1/developer-products/batch",
                        method: "GET",
                        headers: n,
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsApiBatchGetDeveloperProductsTempRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiBatchGetDeveloperProductsTempRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return S(e)
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiBatchGetDeveloperProductsTemp = function() {
            return a(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsApiBatchGetDeveloperProductsTempRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsApiBulkUpdateDeveloperProductsRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, r;
                return o(this, function(s) {
                    var i;
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsApiBulkUpdateDeveloperProducts().');
                    return t = {}, (r = {})["Content-Type"] = "application/json", [2, {
                        path: "/v1/universes/{universeId}/developer-products".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/developer-products",
                        method: "PATCH",
                        headers: r,
                        query: t,
                        body: null == (i = e.bulkUpdateDeveloperProductsRequest) ? i : {
                            developerProductUpdates: i.developerProductUpdates.map(p)
                        }
                    }]
                })
            })
        }, t.prototype.developerProductsApiBulkUpdateDeveloperProductsRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiBulkUpdateDeveloperProductsRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    errors: e.errors.map(v)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiBulkUpdateDeveloperProducts = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsApiBulkUpdateDeveloperProductsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsApiConsumePendingDeveloperProductPurchaseRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, n;
                return o(this, function(r) {
                    var s;
                    return t = {}, (n = {})["Content-Type"] = "application/json", [2, {
                        path: "/v1/developer-products/enforce-consume",
                        schemaPath: "/v1/developer-products/enforce-consume",
                        method: "POST",
                        headers: n,
                        query: t,
                        body: null == (s = e.virtualPurchaseV2CallBackModel) ? s : {
                            PurchaseToken: s.purchaseToken,
                            PurchaseStatusType: s.purchaseStatusType
                        }
                    }]
                })
            })
        }, t.prototype.developerProductsApiConsumePendingDeveloperProductPurchaseRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiConsumePendingDeveloperProductPurchaseRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return R(e)
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiConsumePendingDeveloperProductPurchase = function() {
            return a(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsApiConsumePendingDeveloperProductPurchaseRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsApiGetDeveloperProductDetailsRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, r;
                return o(this, function(s) {
                    if (null == e.productId) throw new n.w("productId", 'Required parameter "productId" was null or undefined when calling developerProductsApiGetDeveloperProductDetails().');
                    return t = {}, r = {}, null != e.robloxUniverseId && (r["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/developer-products/{productId}/details".replace("{productId}", encodeURIComponent(String(e.productId))),
                        schemaPath: "/v1/developer-products/{productId}/details",
                        method: "GET",
                        headers: r,
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsApiGetDeveloperProductDetailsRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiGetDeveloperProductDetailsRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    displayName: null == e.DisplayName ? void 0 : e.DisplayName,
                                    displayDescription: null == e.DisplayDescription ? void 0 : e.DisplayDescription,
                                    displayIconImageAssetId: null == e.DisplayIconImageAssetId ? void 0 : e.DisplayIconImageAssetId,
                                    priceInformation: void 0 === e.PriceInformation ? void 0 : null === e.PriceInformation ? null : l(e.PriceInformation),
                                    storePageEnabled: void 0 === e.StorePageEnabled ? void 0 : null === e.StorePageEnabled ? null : e.StorePageEnabled,
                                    universeId: void 0 === e.UniverseId ? void 0 : null === e.UniverseId ? null : e.UniverseId,
                                    isImmutable: void 0 === e.IsImmutable ? void 0 : null === e.IsImmutable ? null : e.IsImmutable,
                                    userBasePriceInRobux: null == e.UserBasePriceInRobux ? void 0 : e.UserBasePriceInRobux,
                                    priceDiscountDetails: null == e.PriceDiscountDetails ? void 0 : e.PriceDiscountDetails.map(m),
                                    targetId: null == e.TargetId ? void 0 : e.TargetId,
                                    productType: void 0 === e.ProductType ? void 0 : null === e.ProductType ? null : e.ProductType,
                                    assetId: null == e.AssetId ? void 0 : e.AssetId,
                                    productId: null == e.ProductId ? void 0 : e.ProductId,
                                    name: void 0 === e.Name ? void 0 : null === e.Name ? null : e.Name,
                                    description: void 0 === e.Description ? void 0 : null === e.Description ? null : e.Description,
                                    assetTypeId: null == e.AssetTypeId ? void 0 : e.AssetTypeId,
                                    creator: null == e.Creator ? void 0 : h(e.Creator),
                                    iconImageAssetId: null == e.IconImageAssetId ? void 0 : e.IconImageAssetId,
                                    created: null == e.Created ? void 0 : new Date(e.Created),
                                    updated: null == e.Updated ? void 0 : new Date(e.Updated),
                                    priceInRobux: void 0 === e.PriceInRobux ? void 0 : null === e.PriceInRobux ? null : e.PriceInRobux,
                                    premiumPriceInRobux: void 0 === e.PremiumPriceInRobux ? void 0 : null === e.PremiumPriceInRobux ? null : e.PremiumPriceInRobux,
                                    priceInTickets: void 0 === e.PriceInTickets ? void 0 : null === e.PriceInTickets ? null : e.PriceInTickets,
                                    isNew: null == e.IsNew ? void 0 : e.IsNew,
                                    isForSale: null == e.IsForSale ? void 0 : e.IsForSale,
                                    isPublicDomain: null == e.IsPublicDomain ? void 0 : e.IsPublicDomain,
                                    isLimited: null == e.IsLimited ? void 0 : e.IsLimited,
                                    isLimitedUnique: null == e.IsLimitedUnique ? void 0 : e.IsLimitedUnique,
                                    remaining: void 0 === e.Remaining ? void 0 : null === e.Remaining ? null : e.Remaining,
                                    sales: void 0 === e.Sales ? void 0 : null === e.Sales ? null : e.Sales,
                                    minimumMembershipLevel: null == e.MinimumMembershipLevel ? void 0 : e.MinimumMembershipLevel
                                }
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiGetDeveloperProductDetails = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsApiGetDeveloperProductDetailsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsApiGetGiftingTradingStatusRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, r;
                return o(this, function(s) {
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsApiGetGiftingTradingStatus().');
                    return t = {}, r = {}, [2, {
                        path: "/v1/universes/{universeId}/gifting-trading".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/gifting-trading",
                        method: "GET",
                        headers: r,
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsApiGetGiftingTradingStatusRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiGetGiftingTradingStatusRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    giftingTradingStatus: e.giftingTradingStatus
                                }
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiGetGiftingTradingStatus = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsApiGetGiftingTradingStatusRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsApiGetUsersPriceLevelsRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, r;
                return o(this, function(s) {
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsApiGetUsersPriceLevels().');
                    return t = {}, null != e.userIds && (t.userIds = e.userIds), r = {}, [2, {
                        path: "/v1/universes/{universeId}/price-levels".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/price-levels",
                        method: "GET",
                        headers: r,
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsApiGetUsersPriceLevelsRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiGetUsersPriceLevelsRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    userPriceLevels: null == e.userPriceLevels ? void 0 : e.userPriceLevels
                                }
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiGetUsersPriceLevels = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsApiGetUsersPriceLevelsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsApiListDeveloperProductsCursoredRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, r;
                return o(this, function(s) {
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsApiListDeveloperProductsCursored().');
                    return t = {}, null != e.productIds && (t.productIds = e.productIds), null != e.cursor && (t.cursor = e.cursor), null != e.limit && (t.limit = e.limit), r = {}, null != e.robloxUniverseId && (r["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v2/universes/{universeId}/developerproducts".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v2/universes/{universeId}/developerproducts",
                        method: "GET",
                        headers: r,
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsApiListDeveloperProductsCursoredRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiListDeveloperProductsCursoredRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return S(e)
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiListDeveloperProductsCursored = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsApiListDeveloperProductsCursoredRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsApiListGameTransactionsRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t;
                return o(this, function(n) {
                    return t = {}, null != e.playerId && (t.playerId = e.playerId), null != e.placeId && (t.placeId = e.placeId), null != e.status && (t.status = e.status), null != e.locationType && (t.locationType = e.locationType), [2, {
                        path: "/v1/game-transactions",
                        schemaPath: "/v1/game-transactions",
                        method: "GET",
                        headers: {},
                        query: t
                    }]
                })
            })
        }, t.prototype.developerProductsApiListGameTransactionsRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiListGameTransactionsRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.V(s)]
                    }
                })
            })
        }, t.prototype.developerProductsApiListGameTransactions = function() {
            return a(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsApiListGameTransactionsRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.developerProductsApiPurchaseDeveloperProductRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, r;
                return o(this, function(s) {
                    var i, a;
                    if (null == e.productId) throw new n.w("productId", 'Required parameter "productId" was null or undefined when calling developerProductsApiPurchaseDeveloperProduct().');
                    return t = {}, null != e.requestLocationType && (t.requestLocationType = e.requestLocationType), (r = {})["Content-Type"] = "application/json", null != e.robloxPlaceId && (r["roblox-Place-Id"] = String(e.robloxPlaceId)), null != e.robloxGameId && (r["roblox-Game-Id"] = String(e.robloxGameId)), [2, {
                        path: "/v1/developer-products/{productId}/purchase".replace("{productId}", encodeURIComponent(String(e.productId))),
                        schemaPath: "/v1/developer-products/{productId}/purchase",
                        method: "POST",
                        headers: r,
                        query: t,
                        body: null == (i = e.developerProductPurchaseRequest) ? i : {
                            expectedPrice: i.expectedPrice,
                            saleLocationType: i.saleLocationType,
                            saleLocationId: i.saleLocationId,
                            requestId: i.requestId,
                            idempotencyKey: i.idempotencyKey,
                            purchasePayload: null == (a = i.purchasePayload) ? a : {
                                surface: function(e) {
                                    if (null == e) return e;
                                    switch (e.scopeType) {
                                        case "api":
                                            return Object.assign({}, e, {
                                                scopeType: "api"
                                            });
                                        case "inExperience":
                                            return Object.assign({}, f(e, !1), {
                                                scopeType: "inExperience"
                                            });
                                        case "lua":
                                            return Object.assign({}, b(e, !1), {
                                                scopeType: "lua"
                                            });
                                        case "web":
                                            return Object.assign({}, y(e, !1), {
                                                scopeType: "web"
                                            });
                                        default:
                                            return e
                                    }
                                }(a.surface),
                                discounts: null == a.discounts ? void 0 : a.discounts.map(A)
                            }
                        }
                    }]
                })
            })
        }, t.prototype.developerProductsApiPurchaseDeveloperProductRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiPurchaseDeveloperProductRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return R(e)
                            })]
                    }
                })
            })
        }, t.prototype.developerProductsApiPurchaseDeveloperProduct = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsApiPurchaseDeveloperProductRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.developerProductsApiSetGiftingTradingStatusRequestOpts = function(e) {
            return a(this, void 0, void 0, function() {
                var t, r;
                return o(this, function(s) {
                    var i;
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling developerProductsApiSetGiftingTradingStatus().');
                    return t = {}, (r = {})["Content-Type"] = "application/json", [2, {
                        path: "/v1/universes/{universeId}/gifting-trading".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/gifting-trading",
                        method: "POST",
                        headers: r,
                        query: t,
                        body: null == (i = e.setGiftingTradingStatusRequest) ? i : {
                            hasGiftingTrading: i.hasGiftingTrading
                        }
                    }]
                })
            })
        }, t.prototype.developerProductsApiSetGiftingTradingStatusRaw = function(e, t) {
            return a(this, void 0, void 0, function() {
                var r, s;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.developerProductsApiSetGiftingTradingStatusRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.V(s)]
                    }
                })
            })
        }, t.prototype.developerProductsApiSetGiftingTradingStatus = function(e, t) {
            return a(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.developerProductsApiSetGiftingTradingStatusRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t
    }(n._);
    e.s(["P", 0, c, "Q", 0, C, "p", 0, {
        InvalidImageFile: "InvalidImageFile",
        ImageFileTooLarge: "ImageFileTooLarge",
        UnauthorizedAccess: "UnauthorizedAccess",
        NotAuthenticated: "NotAuthenticated",
        NotFound: "NotFound",
        Internal: "Internal",
        BadRequest: "BadRequest",
        InvalidProductId: "InvalidProductId",
        UnauthorizedProductAccess: "UnauthorizedProductAccess",
        InvalidDeveloperProductId: "InvalidDeveloperProductId",
        DuplicateProductName: "DuplicateProductName",
        InvalidUniverseId: "InvalidUniverseId",
        UnauthorizedUniverseAccess: "UnauthorizedUniverseAccess",
        InvalidShopId: "InvalidShopId",
        UnknownError: "UnknownError",
        InvalidPriceInRobux: "InvalidPriceInRobux",
        InvalidPostBody: "InvalidPostBody",
        InvalidPageNumber: "InvalidPageNumber",
        InvalidPageSize: "InvalidPageSize",
        UnsupportedDeveloperProductUpdate: "UnsupportedDeveloperProductUpdate",
        PendingProductsLimitExceeded: "PendingProductsLimitExceeded",
        InvalidCursor: "InvalidCursor",
        InvalidRegionalPricing: "InvalidRegionalPricing",
        ProductRetrievalLimitExceeded: "ProductRetrievalLimitExceeded",
        InvalidProductIds: "InvalidProductIds",
        InvalidName: "InvalidName",
        InvalidDescription: "InvalidDescription",
        InvalidIsForSale: "InvalidIsForSale",
        InvalidStorePageEnabled: "InvalidStorePageEnabled",
        Unavailable: "Unavailable",
        InvalidPrice: "InvalidPrice",
        Blocked: "Blocked",
        Conflict: "Conflict",
        InvalidManagedPricing: "InvalidManagedPricing"
    }], 517176);
    var G = e.i(272593);
    let q = new class {
        listDeveloperProducts(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsApi.developerProductsApiListDeveloperProductsCursored(e, t)
        }
        getDeveloperProductDetails(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsApi.developerProductsApiGetDeveloperProductDetails({
                productId: e
            }, t)
        }
        createDeveloperProduct(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsV2Api.developerProductsCreateDeveloperProductV2(e, t)
        }
        updateDeveloperProduct(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsV2Api.developerProductsUpdateDeveloperProductV2(e, t)
        }
        batchUpdateDeveloperProducts(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsApi.developerProductsApiBulkUpdateDeveloperProducts({
                universeId: e.universeId,
                bulkUpdateDeveloperProductsRequest: e.body
            }, t)
        }
        getGiftingTradingStatus(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsApi.developerProductsApiGetGiftingTradingStatus({
                universeId: e
            }, t)
        }
        setGiftingTradingStatus(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsApi.developerProductsApiSetGiftingTradingStatus({
                universeId: e.universeId,
                setGiftingTradingStatusRequest: {
                    hasGiftingTrading: e.hasGiftingTrading
                }
            }, t)
        }
        getDeveloperProductConfig(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsV2Api.developerProductsGetDeveloperProductConfigV2(e, t)
        }
        batchGetDeveloperProductConfigs(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsV2Api.developerProductsBatchGetDeveloperProductConfigs({
                universeId: e.universeId,
                batchGetDeveloperProductConfigsRequest: {
                    productIds: e.productIds
                }
            }, t)
        }
        listDeveloperProductConfigsByUniverse(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return this.developerProductsV2Api.developerProductsListDeveloperProductConfigsByUniverseV2(e, t)
        }
        constructor() {
            (0, t._)(this, "developerProductsApi", void 0), (0, t._)(this, "developerProductsV2Api", void 0);
            let e = (0, G.f)("developer-products", "bedev2");
            this.developerProductsApi = new C(e), this.developerProductsV2Api = new c(e)
        }
    };
    e.s(["f", 0, q], 503725)
}, 851130, 266061, e => {
    "use strict";
    var t = e.i(805290),
        n = e.i(415858),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        },
        s = function() {
            return (s = Object.assign || function(e) {
                for (var t, n = 1, r = arguments.length; n < r; n++)
                    for (var s in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s]);
                return e
            }).apply(this, arguments)
        };

    function i(e, t, n, r) {
        return new(n || (n = Promise))(function(s, i) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var t;
                e.done ? s(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var n, r, s, i = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var l = [o, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                    if (n = 1, r && (s = 2 & l[0] ? r.return : l[0] ? r.throw || ((s = r.return) && s.call(r), 0) : r.next) && !(s = s.call(r, l[1])).done) return s;
                    switch (r = 0, s && (l = [2 & l[0], s.value]), l[0]) {
                        case 0:
                        case 1:
                            s = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(s = (s = i.trys).length > 0 && s[s.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!s || l[1] > s[0] && l[1] < s[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < s[1]) {
                                i.label = s[1], s = l;
                                break
                            }
                            if (s && i.label < s[2]) {
                                i.label = s[2], i.ops.push(l);
                                break
                            }
                            s[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = s = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function o(e) {
        return e
    }

    function u(e) {
        var t, n;
        return null == (t = e) ? t : {
            gamePassId: t.gamePassId,
            name: t.name,
            description: t.description,
            isForSale: t.isForSale,
            iconAssetId: t.iconAssetId,
            createdTimestamp: new Date(t.createdTimestamp),
            updatedTimestamp: new Date(t.updatedTimestamp),
            isArchived: null == t.isArchived ? void 0 : t.isArchived,
            priceInformation: null == (n = t.priceInformation) ? n : {
                defaultPriceInRobux: n.defaultPriceInRobux,
                enabledFeatures: n.enabledFeatures.map(o)
            },
            isManagedPricingEnabled: t.isManagedPricingEnabled,
            isTrialEnabled: null == t.isTrialEnabled ? void 0 : t.isTrialEnabled
        }
    }

    function l(e) {
        var t;
        return null == (t = e) ? t : {
            userId: t.userId,
            gamePassId: t.gamePassId
        }
    }

    function d(e) {
        var t;
        return null == (t = e) ? t : {
            userId: t.userId,
            gamePassId: t.gamePassId
        }
    }

    function c(e) {
        var t;
        return null == (t = e) ? t : {
            startTime: new Date(t.startTime),
            endTime: new Date(t.endTime)
        }
    }

    function p(e) {
        var t;
        return null == (t = e) ? t : {
            userId: t.userId,
            gamePassId: t.gamePassId,
            isOwned: t.isOwned,
            overrides: null == t.overrides ? void 0 : t.overrides.map(c)
        }
    }

    function v(e) {
        var t;
        return null == (t = e) ? t : {
            type: t.Type,
            amountInRobux: t.AmountInRobux,
            percent: t.Percent,
            endTime: t.EndTime
        }
    }

    function m(e) {
        var t, n;
        return null == (t = e) ? t : {
            id: t.id,
            productId: t.productId,
            name: t.name,
            isForSale: t.isForSale,
            price: void 0 === t.price ? void 0 : null === t.price ? null : t.price,
            userBasePriceInRobux: null == t.userBasePriceInRobux ? void 0 : t.userBasePriceInRobux,
            priceDiscountDetails: null == t.priceDiscountDetails ? void 0 : t.priceDiscountDetails.map(v),
            isOwned: null == t.isOwned ? void 0 : t.isOwned,
            creator: void 0 === t.creator ? void 0 : null === t.creator ? null : null == (n = t.creator) ? n : {
                creatorType: n.creatorType,
                creatorId: n.creatorId,
                name: n.name,
                deprecatedId: null == n.deprecatedId ? void 0 : n.deprecatedId
            },
            displayName: t.displayName,
            displayDescription: t.displayDescription,
            displayIconImageAssetId: t.displayIconImageAssetId,
            created: new Date(t.created),
            updated: new Date(t.updated)
        }
    }

    function h(e) {
        return e
    }

    function f(e) {
        var t, n;
        return null == (t = e) ? t : {
            gamePassId: t.gamePassId,
            changedPropertyNames: t.changedPropertyNames.map(h),
            changedProperties: null == (n = t.changedProperties) ? n : {
                ManagedPricing: n.managedPricing,
                Archived: n.archived,
                Trial: n.trial
            }
        }
    }

    function g(e) {
        var t, n;
        return null == (t = e) ? t : {
            gamePassId: t.gamePassId,
            error: null == (n = t.error) ? n : {
                errorCode: n.errorCode,
                errorMessage: n.errorMessage,
                field: void 0 === n.field ? void 0 : null === n.field ? null : n.field,
                hint: void 0 === n.hint ? void 0 : null === n.hint ? null : n.hint
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function I(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? s(s({}, A(e, !0)), {
            universeId: e.universeId,
            placeId: e.placeId,
            location: function(e) {
                if (null == e) return e;
                switch (e.locationType) {
                    case "developerPrompted":
                        return Object.assign({}, e, {
                            locationType: "developerPrompted"
                        });
                    case "personalizedShop":
                        return Object.assign({}, function e(t, n) {
                            return void 0 === n && (n = !1), null == t ? t : n ? s(s({}, function(t, n) {
                                if (void 0 === n && (n = !1), null == t) return t;
                                if (!n) switch (t.locationType) {
                                    case "developerPrompted":
                                    default:
                                        return t;
                                    case "personalizedShop":
                                        return e(t, n)
                                }
                                return {
                                    locationType: t.locationType
                                }
                            }(t, !0)), {
                                stableCategoryId: t.stableCategoryId,
                                categoryGroup: t.categoryGroup,
                                categoryPosition: t.categoryPosition,
                                gridPositionRow: t.gridPositionRow,
                                gridPositionColumn: t.gridPositionColumn,
                                categoryName: t.categoryName
                            }) : (t.locationType, t)
                        }(e, !1), {
                            locationType: "personalizedShop"
                        });
                    default:
                        return e
                }
            }(e.location)
        }) : (e.scopeType, e)
    }

    function P(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? s(s({}, y(e, !0)), {
            profileId: e.profileId,
            type: e.type
        }) : (e.pageType, e)
    }

    function y(e, t) {
        if (void 0 === t && (t = !1), null == e) return e;
        if (!t) switch (e.pageType) {
            case "experienceDetail":
                return w(e, t);
            case "marketplace":
            case "postPurchase":
            default:
                return e;
            case "profile":
                return P(e, t)
        }
        return {
            pageType: e.pageType
        }
    }

    function w(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? s(s({}, y(e, !0)), {
            universeId: e.universeId
        }) : (e.pageType, e)
    }

    function b(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? s(s({}, A(e, !0)), {
            page: function(e) {
                if (null == e) return e;
                switch (e.pageType) {
                    case "experienceDetail":
                        return Object.assign({}, w(e, !1), {
                            pageType: "experienceDetail"
                        });
                    case "marketplace":
                        return Object.assign({}, e, {
                            pageType: "marketplace"
                        });
                    case "postPurchase":
                        return Object.assign({}, e, {
                            pageType: "postPurchase"
                        });
                    case "profile":
                        return Object.assign({}, P(e, !1), {
                            pageType: "profile"
                        });
                    default:
                        return e
                }
            }(e.page)
        }) : (e.scopeType, e)
    }

    function A(e, t) {
        if (void 0 === t && (t = !1), null == e) return e;
        if (!t) switch (e.scopeType) {
            case "api":
            default:
                return e;
            case "inExperience":
                return I(e, t);
            case "lua":
                return T(e, t);
            case "web":
                return b(e, t)
        }
        return {
            scopeType: e.scopeType
        }
    }

    function T(e, t) {
        return void 0 === t && (t = !1), null == e ? e : t ? s(s({}, A(e, !0)), {
            location: function(e) {
                if (null == e) return e;
                switch (e.locationType) {
                    case "homePageGameItemShop":
                        return Object.assign({}, e, {
                            locationType: "homePageGameItemShop"
                        });
                    case "searchPageGameItemShop":
                        return Object.assign({}, e, {
                            locationType: "searchPageGameItemShop"
                        });
                    default:
                        return e
                }
            }(e.location)
        }) : (e.scopeType, e)
    }

    function S(e) {
        var t;
        return null == (t = e) ? t : {
            source: t.source,
            discountId: t.discountId
        }
    }

    function R(e) {
        var t;
        return null == (t = e) ? t : {
            gamePassId: t.gamePassId,
            status: t.status,
            startTime: null == t.startTime ? void 0 : new Date(t.startTime),
            endTime: null == t.endTime ? void 0 : new Date(t.endTime)
        }
    }

    function C(e) {
        var t, n;
        return null == (t = e) ? t : {
            gamePassId: t.gamePassId,
            iconAssetId: t.iconAssetId,
            name: t.name,
            description: t.description,
            isForSale: t.isForSale,
            price: t.price,
            creator: null == (n = t.creator) ? n : {
                creatorType: n.creatorType,
                creatorId: n.creatorId,
                name: n.name
            }
        }
    }
    var G = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            r(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(t, e), t.prototype.gamePassesBatchGetGamePassConfigsRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r;
                return a(this, function(s) {
                    var i;
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesBatchGetGamePassConfigs().');
                    return t = {}, (r = {})["Content-Type"] = "application/json", [2, {
                        path: "/v1/universes/{universeId}/game-passes/creator:batchGet".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/game-passes/creator:batchGet",
                        method: "POST",
                        headers: r,
                        query: t,
                        body: null == (i = e.batchGetGamePassConfigsRequest) ? i : {
                            gamePassIds: i.gamePassIds
                        }
                    }]
                })
            })
        }, t.prototype.gamePassesBatchGetGamePassConfigsRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesBatchGetGamePassConfigsRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    gamePasses: e.gamePasses.map(u)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesBatchGetGamePassConfigs = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesBatchGetGamePassConfigsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesBatchGetGamePassOwnershipsRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    var s;
                    return t = {}, (n = {})["Content-Type"] = "application/json", null != e.robloxUniverseId && (n["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/game-passes:batchGetOwnership",
                        schemaPath: "/v1/game-passes:batchGetOwnership",
                        method: "POST",
                        headers: n,
                        query: t,
                        body: null == (s = e.batchGetGamePassOwnershipsRequest) ? s : {
                            ownershipIdentifiers: s.ownershipIdentifiers.map(d),
                            includeOverrides: s.includeOverrides
                        }
                    }]
                })
            })
        }, t.prototype.gamePassesBatchGetGamePassOwnershipsRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesBatchGetGamePassOwnershipsRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    ownershipIdentifiers: e.ownershipIdentifiers.map(l),
                                    ownerships: null == e.ownerships ? void 0 : e.ownerships.map(p)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesBatchGetGamePassOwnerships = function() {
            return i(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesBatchGetGamePassOwnershipsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesBatchGetGamePassesRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, n;
                return a(this, function(r) {
                    var s;
                    return t = {}, (n = {})["Content-Type"] = "application/json", null != e.robloxUniverseId && (n["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/game-passes:batchGet",
                        schemaPath: "/v1/game-passes:batchGet",
                        method: "POST",
                        headers: n,
                        query: t,
                        body: null == (s = e.batchGetGamePassesRequest) ? s : {
                            gamePassIds: s.gamePassIds,
                            passView: s.passView
                        }
                    }]
                })
            })
        }, t.prototype.gamePassesBatchGetGamePassesRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesBatchGetGamePassesRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    gamePasses: e.gamePasses.map(m)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesBatchGetGamePasses = function() {
            return i(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesBatchGetGamePassesRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesBulkUpdateRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r;
                return a(this, function(s) {
                    var i;
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesBulkUpdate().');
                    return t = {}, (r = {})["Content-Type"] = "application/json", [2, {
                        path: "/v1/game-passes/universes/{universeId}/bulk-update".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/game-passes/universes/{universeId}/bulk-update",
                        method: "POST",
                        headers: r,
                        query: t,
                        body: null == (i = e.gamePassBulkUpdateRequest) ? i : {
                            gamePassUpdates: i.gamePassUpdates.map(f)
                        }
                    }]
                })
            })
        }, t.prototype.gamePassesBulkUpdateRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesBulkUpdateRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    errors: e.errors.map(g)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesBulkUpdate = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesBulkUpdateRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesCreateGamePassRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r, s;
                return a(this, function(i) {
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesCreateGamePass().');
                    if (null == e.name) throw new n.w("name", 'Required parameter "name" was null or undefined when calling gamePassesCreateGamePass().');
                    return t = {}, r = {}, s = (0, n.I)([{
                        contentType: "multipart/form-data"
                    }]) ? new FormData : new URLSearchParams, null != e.name && s.append("name", e.name), null != e.description && s.append("description", e.description), null != e.imageFile && s.append("imageFile", e.imageFile), null != e.isForSale && s.append("isForSale", e.isForSale), null != e.price && s.append("price", e.price), null != e.isManagedPricingEnabled && s.append("isManagedPricingEnabled", e.isManagedPricingEnabled), null != e.isTrialEnabled && s.append("isTrialEnabled", e.isTrialEnabled), [2, {
                        path: "/v1/universes/{universeId}/game-passes".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/game-passes",
                        method: "POST",
                        headers: r,
                        query: t,
                        body: s
                    }]
                })
            })
        }, t.prototype.gamePassesCreateGamePassRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesCreateGamePassRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return u(e)
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesCreateGamePass = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesCreateGamePassRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesGetGamePassConfigRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r;
                return a(this, function(s) {
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesGetGamePassConfig().');
                    if (null == e.gamePassId) throw new n.w("gamePassId", 'Required parameter "gamePassId" was null or undefined when calling gamePassesGetGamePassConfig().');
                    return t = {}, r = {}, [2, {
                        path: "/v1/universes/{universeId}/game-passes/{gamePassId}/creator".replace("{universeId}", encodeURIComponent(String(e.universeId))).replace("{gamePassId}", encodeURIComponent(String(e.gamePassId))),
                        schemaPath: "/v1/universes/{universeId}/game-passes/{gamePassId}/creator",
                        method: "GET",
                        headers: r,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesGetGamePassConfigRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesGetGamePassConfigRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return u(e)
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetGamePassConfig = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesGetGamePassConfigRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesGetGamePassMetadataRequestOpts = function() {
            return i(this, void 0, void 0, function() {
                return a(this, function(e) {
                    return [2, {
                        path: "/v1/metadata",
                        schemaPath: "/v1/metadata",
                        method: "GET",
                        headers: {},
                        query: {}
                    }]
                })
            })
        }, t.prototype.gamePassesGetGamePassMetadataRaw = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r;
                return a(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gamePassesGetGamePassMetadataRequestOpts()];
                        case 1:
                            return t = s.sent(), [4, this.request(t, e)];
                        case 2:
                            return r = s.sent(), [2, new n.H(r, function(e) {
                                return null == e ? e : {
                                    gamePassMaxNameLength: e.gamePassMaxNameLength,
                                    gamePassMaxDescriptionLength: e.gamePassMaxDescriptionLength,
                                    gamePassMinPrice: e.gamePassMinPrice,
                                    gamePassMaxPrice: e.gamePassMaxPrice,
                                    gamePassPixelImageSize: e.GamePassPixelImageSize,
                                    gamePassDefaultIconAssetId: e.gamePassDefaultIconAssetId
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetGamePassMetadata = function(e) {
            return i(this, void 0, void 0, function() {
                return a(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.gamePassesGetGamePassMetadataRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesGetPassProductInfoRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r;
                return a(this, function(s) {
                    if (null == e.gamePassId) throw new n.w("gamePassId", 'Required parameter "gamePassId" was null or undefined when calling gamePassesGetPassProductInfo().');
                    return t = {}, r = {}, null != e.robloxUniverseId && (r["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/game-passes/{gamePassId}/product-info".replace("{gamePassId}", encodeURIComponent(String(e.gamePassId))),
                        schemaPath: "/v1/game-passes/{gamePassId}/product-info",
                        method: "GET",
                        headers: r,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesGetPassProductInfoRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesGetPassProductInfoRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                var t;
                                return null == e ? e : {
                                    targetId: null == e.TargetId ? void 0 : e.TargetId,
                                    productType: null == e.ProductType ? void 0 : e.ProductType,
                                    assetId: null == e.AssetId ? void 0 : e.AssetId,
                                    productId: null == e.ProductId ? void 0 : e.ProductId,
                                    name: null == e.Name ? void 0 : e.Name,
                                    description: null == e.Description ? void 0 : e.Description,
                                    assetTypeId: null == e.AssetTypeId ? void 0 : e.AssetTypeId,
                                    creator: void 0 === e.Creator ? void 0 : null === e.Creator ? null : null == (t = e.Creator) ? t : {
                                        id: null == t.Id ? void 0 : t.Id,
                                        name: null == t.Name ? void 0 : t.Name,
                                        creatorType: null == t.CreatorType ? void 0 : t.CreatorType,
                                        creatorTargetId: null == t.CreatorTargetId ? void 0 : t.CreatorTargetId
                                    },
                                    iconImageAssetId: null == e.IconImageAssetId ? void 0 : e.IconImageAssetId,
                                    created: null == e.Created ? void 0 : new Date(e.Created),
                                    updated: null == e.Updated ? void 0 : new Date(e.Updated),
                                    priceInRobux: void 0 === e.PriceInRobux ? void 0 : null === e.PriceInRobux ? null : e.PriceInRobux,
                                    premiumPriceInRobux: void 0 === e.PremiumPriceInRobux ? void 0 : null === e.PremiumPriceInRobux ? null : e.PremiumPriceInRobux,
                                    priceInTickets: void 0 === e.PriceInTickets ? void 0 : null === e.PriceInTickets ? null : e.PriceInTickets,
                                    sales: null == e.Sales ? void 0 : e.Sales,
                                    isNew: null == e.IsNew ? void 0 : e.IsNew,
                                    isForSale: null == e.IsForSale ? void 0 : e.IsForSale,
                                    isPublicDomain: null == e.IsPublicDomain ? void 0 : e.IsPublicDomain,
                                    isLimited: null == e.IsLimited ? void 0 : e.IsLimited,
                                    isLimitedUnique: null == e.IsLimitedUnique ? void 0 : e.IsLimitedUnique,
                                    remaining: void 0 === e.Remaining ? void 0 : null === e.Remaining ? null : e.Remaining,
                                    minimumMembershipLevel: null == e.MinimumMembershipLevel ? void 0 : e.MinimumMembershipLevel,
                                    userBasePriceInRobux: null == e.UserBasePriceInRobux ? void 0 : e.UserBasePriceInRobux,
                                    priceDiscountDetails: null == e.PriceDiscountDetails ? void 0 : e.PriceDiscountDetails.map(v)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetPassProductInfo = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesGetPassProductInfoRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesGetSalesLimitInfoRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r;
                return a(this, function(s) {
                    if (null == e.universeid) throw new n.w("universeid", 'Required parameter "universeid" was null or undefined when calling gamePassesGetSalesLimitInfo().');
                    return t = {}, r = {}, [2, {
                        path: "/v1/game-passes/universes/{universeid}/sales-limit".replace("{universeid}", encodeURIComponent(String(e.universeid))),
                        schemaPath: "/v1/game-passes/universes/{universeid}/sales-limit",
                        method: "GET",
                        headers: r,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesGetSalesLimitInfoRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesGetSalesLimitInfoRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    salesLimit: e.salesLimit,
                                    hasLimitBeenReached: e.hasLimitBeenReached
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetSalesLimitInfo = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesGetSalesLimitInfoRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesGetTrialAvailabilitiesRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r;
                return a(this, function(s) {
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesGetTrialAvailabilities().');
                    return t = {}, r = {}, [2, {
                        path: "/v1/universes/{universeId}/trial-availabilities".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/trial-availabilities",
                        method: "GET",
                        headers: r,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesGetTrialAvailabilitiesRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesGetTrialAvailabilitiesRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    trialAvailabilities: e.trialAvailabilities.map(R)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetTrialAvailabilities = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesGetTrialAvailabilitiesRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesGetUserGamePassesRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r;
                return a(this, function(s) {
                    if (null == e.userId) throw new n.w("userId", 'Required parameter "userId" was null or undefined when calling gamePassesGetUserGamePasses().');
                    return t = {}, null != e.exclusiveStartId && (t.exclusiveStartId = e.exclusiveStartId), null != e.count && (t.count = e.count), r = {}, [2, {
                        path: "/v1/users/{userId}/game-passes".replace("{userId}", encodeURIComponent(String(e.userId))),
                        schemaPath: "/v1/users/{userId}/game-passes",
                        method: "GET",
                        headers: r,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesGetUserGamePassesRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesGetUserGamePassesRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    gamePasses: e.gamePasses.map(C)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesGetUserGamePasses = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesGetUserGamePassesRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesListGamePassConfigsByUniverseRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r;
                return a(this, function(s) {
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesListGamePassConfigsByUniverse().');
                    return t = {}, null != e.pageSize && (t.pageSize = e.pageSize), null != e.pageToken && (t.pageToken = e.pageToken), null != e.isForSale && (t.isForSale = e.isForSale), null != e.isArchived && (t.isArchived = e.isArchived), r = {}, [2, {
                        path: "/v1/universes/{universeId}/game-passes/creator".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/game-passes/creator",
                        method: "GET",
                        headers: r,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesListGamePassConfigsByUniverseRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesListGamePassConfigsByUniverseRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    gamePasses: e.gamePasses.map(u),
                                    nextPageToken: e.nextPageToken
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesListGamePassConfigsByUniverse = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesListGamePassConfigsByUniverseRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesListGamePassesByUniverseRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r;
                return a(this, function(s) {
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesListGamePassesByUniverse().');
                    return t = {}, null != e.pageSize && (t.pageSize = e.pageSize), null != e.pageToken && (t.pageToken = e.pageToken), null != e.passView && (t.passView = e.passView), r = {}, null != e.robloxUniverseId && (r["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/universes/{universeId}/game-passes".replace("{universeId}", encodeURIComponent(String(e.universeId))),
                        schemaPath: "/v1/universes/{universeId}/game-passes",
                        method: "GET",
                        headers: r,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesListGamePassesByUniverseRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesListGamePassesByUniverseRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    gamePasses: e.gamePasses.map(m),
                                    nextPageToken: e.nextPageToken
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesListGamePassesByUniverse = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesListGamePassesByUniverseRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesPurchaseGamePassRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r;
                return a(this, function(s) {
                    var i, a;
                    if (null == e.productId) throw new n.w("productId", 'Required parameter "productId" was null or undefined when calling gamePassesPurchaseGamePass().');
                    return t = {}, (r = {})["Content-Type"] = "application/json", null != e.robloxPlaceId && (r["roblox-Place-Id"] = String(e.robloxPlaceId)), null != e.robloxGameId && (r["roblox-Game-Id"] = String(e.robloxGameId)), null != e.robloxUniverseId && (r["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/game-passes/{productId}/purchase".replace("{productId}", encodeURIComponent(String(e.productId))),
                        schemaPath: "/v1/game-passes/{productId}/purchase",
                        method: "POST",
                        headers: r,
                        query: t,
                        body: null == (i = e.gamePassPurchaseRequest) ? i : {
                            expectedPrice: i.expectedPrice,
                            purchasePayload: null == (a = i.purchasePayload) ? a : {
                                surface: function(e) {
                                    if (null == e) return e;
                                    switch (e.scopeType) {
                                        case "api":
                                            return Object.assign({}, e, {
                                                scopeType: "api"
                                            });
                                        case "inExperience":
                                            return Object.assign({}, I(e, !1), {
                                                scopeType: "inExperience"
                                            });
                                        case "lua":
                                            return Object.assign({}, T(e, !1), {
                                                scopeType: "lua"
                                            });
                                        case "web":
                                            return Object.assign({}, b(e, !1), {
                                                scopeType: "web"
                                            });
                                        default:
                                            return e
                                    }
                                }(a.surface),
                                discounts: null == a.discounts ? void 0 : a.discounts.map(S)
                            },
                            idempotencyKey: i.idempotencyKey
                        }
                    }]
                })
            })
        }, t.prototype.gamePassesPurchaseGamePassRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesPurchaseGamePassRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    reason: void 0 === e.reason ? void 0 : null === e.reason ? null : e.reason,
                                    productId: void 0 === e.productId ? void 0 : null === e.productId ? null : e.productId,
                                    statusCode: void 0 === e.statusCode ? void 0 : null === e.statusCode ? null : e.statusCode,
                                    title: void 0 === e.title ? void 0 : null === e.title ? null : e.title,
                                    errorMsg: void 0 === e.errorMsg ? void 0 : null === e.errorMsg ? null : e.errorMsg,
                                    showDivId: void 0 === e.showDivId ? void 0 : null === e.showDivId ? null : e.showDivId,
                                    shortfallPrice: void 0 === e.shortfallPrice ? void 0 : null === e.shortfallPrice ? null : e.shortfallPrice,
                                    balanceAfterSale: void 0 === e.balanceAfterSale ? void 0 : null === e.balanceAfterSale ? null : e.balanceAfterSale,
                                    expectedPrice: void 0 === e.expectedPrice ? void 0 : null === e.expectedPrice ? null : e.expectedPrice,
                                    currency: void 0 === e.currency ? void 0 : null === e.currency ? null : e.currency,
                                    price: void 0 === e.price ? void 0 : null === e.price ? null : e.price,
                                    assetId: void 0 === e.assetId ? void 0 : null === e.assetId ? null : e.assetId,
                                    assetName: void 0 === e.assetName ? void 0 : null === e.assetName ? null : e.assetName,
                                    assetType: void 0 === e.assetType ? void 0 : null === e.assetType ? null : e.assetType,
                                    assetTypeDisplayName: void 0 === e.assetTypeDisplayName ? void 0 : null === e.assetTypeDisplayName ? null : e.assetTypeDisplayName,
                                    assetIsWearable: void 0 === e.assetIsWearable ? void 0 : null === e.assetIsWearable ? null : e.assetIsWearable,
                                    sellerName: void 0 === e.sellerName ? void 0 : null === e.sellerName ? null : e.sellerName,
                                    transactionVerb: void 0 === e.transactionVerb ? void 0 : null === e.transactionVerb ? null : e.transactionVerb,
                                    isMultiPrivateSale: void 0 === e.isMultiPrivateSale ? void 0 : null === e.isMultiPrivateSale ? null : e.isMultiPrivateSale,
                                    purchased: void 0 === e.purchased ? void 0 : null === e.purchased ? null : e.purchased
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesPurchaseGamePass = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesPurchaseGamePassRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesRedeemTrialRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r;
                return a(this, function(s) {
                    var i;
                    if (null == e.gamePassId) throw new n.w("gamePassId", 'Required parameter "gamePassId" was null or undefined when calling gamePassesRedeemTrial().');
                    return t = {}, (r = {})["Content-Type"] = "application/json", null != e.robloxUniverseId && (r["roblox-Universe-Id"] = String(e.robloxUniverseId)), [2, {
                        path: "/v1/game-passes/{gamePassId}/trial:redeem".replace("{gamePassId}", encodeURIComponent(String(e.gamePassId))),
                        schemaPath: "/v1/game-passes/{gamePassId}/trial:redeem",
                        method: "POST",
                        headers: r,
                        query: t,
                        body: null == (i = e.redeemTrialRequest) ? i : {
                            surface: function(e) {
                                if (null == e) return e;
                                switch (e.scopeType) {
                                    case "api":
                                        return Object.assign({}, e, {
                                            scopeType: "api"
                                        });
                                    case "inExperience":
                                        return Object.assign({}, I(e, !1), {
                                            scopeType: "inExperience"
                                        });
                                    case "lua":
                                        return Object.assign({}, T(e, !1), {
                                            scopeType: "lua"
                                        });
                                    case "web":
                                        return Object.assign({}, b(e, !1), {
                                            scopeType: "web"
                                        });
                                    default:
                                        return e
                                }
                            }(i.surface)
                        }
                    }]
                })
            })
        }, t.prototype.gamePassesRedeemTrialRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesRedeemTrialRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.H(s, function(e) {
                                return null == e ? e : {
                                    gamePassId: e.gamePassId,
                                    startTime: new Date(e.startTime),
                                    endTime: new Date(e.endTime)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.gamePassesRedeemTrial = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesRedeemTrialRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.gamePassesRevokeGamePassRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r;
                return a(this, function(s) {
                    if (null == e.gamePassId) throw new n.w("gamePassId", 'Required parameter "gamePassId" was null or undefined when calling gamePassesRevokeGamePass().');
                    return t = {}, r = {}, [2, {
                        path: "/v1/game-passes/{gamePassId}:revokeOwnership".replace("{gamePassId}", encodeURIComponent(String(e.gamePassId))),
                        schemaPath: "/v1/game-passes/{gamePassId}:revokeOwnership",
                        method: "POST",
                        headers: r,
                        query: t
                    }]
                })
            })
        }, t.prototype.gamePassesRevokeGamePassRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesRevokeGamePassRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.V(s)]
                    }
                })
            })
        }, t.prototype.gamePassesRevokeGamePass = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesRevokeGamePassRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.gamePassesUpdateGamePassRequestOpts = function(e) {
            return i(this, void 0, void 0, function() {
                var t, r, s;
                return a(this, function(i) {
                    if (null == e.universeId) throw new n.w("universeId", 'Required parameter "universeId" was null or undefined when calling gamePassesUpdateGamePass().');
                    if (null == e.gamePassId) throw new n.w("gamePassId", 'Required parameter "gamePassId" was null or undefined when calling gamePassesUpdateGamePass().');
                    return t = {}, r = {}, s = (0, n.I)([{
                        contentType: "multipart/form-data"
                    }]) ? new FormData : new URLSearchParams, null != e.name && s.append("name", e.name), null != e.description && s.append("description", e.description), null != e.file && s.append("file", e.file), null != e.imageFile && s.append("imageFile", e.imageFile), null != e.isForSale && s.append("isForSale", e.isForSale), null != e.price && s.append("price", e.price), null != e.isManagedPricingEnabled && s.append("isManagedPricingEnabled", e.isManagedPricingEnabled), null != e.isArchived && s.append("isArchived", e.isArchived), null != e.isTrialEnabled && s.append("isTrialEnabled", e.isTrialEnabled), [2, {
                        path: "/v1/universes/{universeId}/game-passes/{gamePassId}".replace("{universeId}", encodeURIComponent(String(e.universeId))).replace("{gamePassId}", encodeURIComponent(String(e.gamePassId))),
                        schemaPath: "/v1/universes/{universeId}/game-passes/{gamePassId}",
                        method: "PATCH",
                        headers: r,
                        query: t,
                        body: s
                    }]
                })
            })
        }, t.prototype.gamePassesUpdateGamePassRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var r, s;
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.gamePassesUpdateGamePassRequestOpts(e)];
                        case 1:
                            return r = i.sent(), [4, this.request(r, t)];
                        case 2:
                            return s = i.sent(), [2, new n.V(s)]
                    }
                })
            })
        }, t.prototype.gamePassesUpdateGamePass = function(e, t) {
            return i(this, void 0, void 0, function() {
                return a(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gamePassesUpdateGamePassRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t
    }(n._);
    e.s(["p", 0, {
        InternalError: "InternalError",
        BadRequest: "BadRequest",
        NotFound: "NotFound",
        UnauthorizedAccess: "UnauthorizedAccess",
        NotAuthenticated: "NotAuthenticated",
        PassNotFound: "PassNotFound",
        TargetUnauthorizedAccess: "TargetUnauthorizedAccess",
        UniverseNotFound: "UniverseNotFound",
        MissingArgument: "MissingArgument",
        AssetCreationFailure: "AssetCreationFailure",
        PassRevokeFailure: "PassRevokeFailure",
        PassAlreadyRevoked: "PassAlreadyRevoked",
        SalesNotFound: "SalesNotFound",
        CommissionRateNotFound: "CommissionRateNotFound",
        AssetNotFound: "AssetNotFound",
        FileTooLarge: "FileTooLarge",
        ActiveInPo: "ActiveInPO",
        NotForSale: "NotForSale",
        NotSameUniverse: "NotSameUniverse",
        PricingConfigError: "PricingConfigError",
        InvalidCount: "InvalidCount",
        Blocked: "Blocked",
        InvalidPageSize: "InvalidPageSize",
        InvalidRegionalPricing: "InvalidRegionalPricing",
        InvalidManagedPricing: "InvalidManagedPricing",
        UnsupportedGamePassUpdate: "UnsupportedGamePassUpdate"
    }, "v", 0, G], 266061);
    var q = e.i(272593);
    let D = new class {
        getPassSalesLimitInfo(e, t) {
            return this.passesApi.gamePassesGetSalesLimitInfo(e, t)
        }
        getPassMetadata(e) {
            return this.passesApi.gamePassesGetGamePassMetadata(e)
        }
        getPassProductInfo(e, t) {
            return this.passesApi.gamePassesGetPassProductInfo({
                gamePassId: e
            }, t)
        }
        batchUpdateGamePasses(e, t) {
            return this.passesApi.gamePassesBulkUpdate(e, t)
        }
        listGamePassesByUniverse(e, t) {
            return this.passesApi.gamePassesListGamePassesByUniverse(e, t)
        }
        getGamePassConfig(e, t) {
            return this.passesApi.gamePassesGetGamePassConfig(e, t)
        }
        listGamePassConfigsByUniverse(e, t) {
            return this.passesApi.gamePassesListGamePassConfigsByUniverse(e, t)
        }
        batchGetGamePassConfigs(e, t) {
            return this.passesApi.gamePassesBatchGetGamePassConfigs({
                universeId: e.universeId,
                batchGetGamePassConfigsRequest: {
                    gamePassIds: e.gamePassIds
                }
            }, t)
        }
        createGamePass(e, t) {
            return this.passesApi.gamePassesCreateGamePass(e, t)
        }
        updateGamePass(e, t) {
            return this.passesApi.gamePassesUpdateGamePass(e, t)
        }
        constructor() {
            (0, t._)(this, "passesApi", void 0), this.passesApi = new G((0, q.f)("game-passes", "bedev2"))
        }
    };
    e.s(["f", 0, D], 851130)
}, 239320, e => {
    "use strict";
    var t, n = e.i(415858),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function s(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        r(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function i(e, t, n, r) {
        return new(n || (n = Promise))(function(s, i) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var t;
                e.done ? s(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var n, r, s, i = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var l = [o, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                    if (n = 1, r && (s = 2 & l[0] ? r.return : l[0] ? r.throw || ((s = r.return) && s.call(r), 0) : r.next) && !(s = s.call(r, l[1])).done) return s;
                    switch (r = 0, s && (l = [2 & l[0], s.value]), l[0]) {
                        case 0:
                        case 1:
                            s = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(s = (s = i.trys).length > 0 && s[s.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!s || l[1] > s[0] && l[1] < s[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < s[1]) {
                                i.label = s[1], s = l;
                                break
                            }
                            if (s && i.label < s[2]) {
                                i.label = s[2], i.ops.push(l);
                                break
                            }
                            s[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = s = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function o(e) {
        var t;
        return null == (t = e) ? t : {
            duration: (0, n.u)(t, "duration") ? t.duration : void 0,
            usage: (0, n.u)(t, "usage") ? t.usage : void 0,
            capacity: (0, n.u)(t, "capacity") ? t.capacity : void 0,
            expirationTime: (0, n.u)(t, "expirationTime") ? t.expirationTime : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function u(e, t) {
        return null == e ? e : {
            targetId: (0, n.u)(e, "targetId") ? e.targetId : void 0
        }
    }

    function l(e, t) {
        return null == e ? e : {
            data: (0, n.u)(e, "data") ? e.data : void 0
        }
    }
    var d = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return s(t, e), t.prototype.v1AssetQuotasGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.resourceType || void 0 === e.resourceType) throw new n.w("resourceType", "Required parameter requestParameters.resourceType was null or undefined when calling v1AssetQuotasGet.");
                                if (null === e.assetType || void 0 === e.assetType) throw new n.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling v1AssetQuotasGet.");
                                return r = {}, void 0 !== e.resourceType && (r.resourceType = e.resourceType), void 0 !== e.assetType && (r.assetType = e.assetType), void 0 !== e.useDummyData && (r.useDummyData = e.useDummyData), s = {}, [4, this.request({
                                    path: "/v1/asset-quotas",
                                    schemaPath: "/v1/asset-quotas",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new n.H(i, function(e) {
                                    return null == e ? e : {
                                        quotas: (0, n.u)(e, "quotas") ? e.quotas.map(o) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetQuotasGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetQuotasGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(n._),
        c = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return s(t, e), t.prototype.v1AssetsAssetIdMediaGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new n.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdMediaGet.");
                                return r = {}, s = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/media".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/media",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new n.H(i, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdMediaGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaMediaAssetIdDeleteRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new n.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdMediaMediaAssetIdDelete.");
                                if (null === e.mediaAssetId || void 0 === e.mediaAssetId) throw new n.w("mediaAssetId", "Required parameter requestParameters.mediaAssetId was null or undefined when calling v1AssetsAssetIdMediaMediaAssetIdDelete.");
                                return r = {}, s = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/media/{mediaAssetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))).replace("{".concat("mediaAssetId", "}"), encodeURIComponent(String(e.mediaAssetId))),
                                    schemaPath: "/v1/assets/{assetId}/media/{mediaAssetId}",
                                    method: "DELETE",
                                    headers: s,
                                    query: r
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new n.H(i)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaMediaAssetIdDelete = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdMediaMediaAssetIdDeleteRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaOrderPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new n.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdMediaOrderPost.");
                                if (null === e.mediaAssetIds || void 0 === e.mediaAssetIds) throw new n.w("mediaAssetIds", "Required parameter requestParameters.mediaAssetIds was null or undefined when calling v1AssetsAssetIdMediaOrderPost.");
                                return r = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets/{assetId}/media/order".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/media/order",
                                    method: "POST",
                                    headers: s,
                                    query: r,
                                    body: e.mediaAssetIds
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new n.H(i)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaOrderPost = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdMediaOrderPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new n.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdMediaPost.");
                                return r = {}, s = {}, i = (0, n.I)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && i.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/assets/{assetId}/media".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/media",
                                    method: "POST",
                                    headers: s,
                                    query: r,
                                    body: i
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new n.H(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdMediaPost = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdMediaPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailDeleteRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new n.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdThumbnailDelete.");
                                return r = {}, s = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/thumbnail".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/thumbnail",
                                    method: "DELETE",
                                    headers: s,
                                    query: r
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new n.H(i)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailDelete = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdThumbnailDeleteRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new n.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdThumbnailGet.");
                                return r = {}, s = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/thumbnail".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/thumbnail",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new n.H(i, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdThumbnailGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new n.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdThumbnailPost.");
                                return r = {}, s = {}, i = (0, n.I)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && i.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/assets/{assetId}/thumbnail".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/thumbnail",
                                    method: "POST",
                                    headers: s,
                                    query: r,
                                    body: i
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new n.H(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdThumbnailPost = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdThumbnailPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(n._),
        p = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            s(t, e), t.prototype.v1AudioPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new n.w("request", "Required parameter requestParameters.request was null or undefined when calling v1AudioPost.");
                                return r = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/audio",
                                    schemaPath: "/v1/audio",
                                    method: "POST",
                                    headers: s,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            file: e.file,
                                            groupId: e.groupId,
                                            paymentSource: e.paymentSource,
                                            estimatedFileSize: e.estimatedFileSize,
                                            estimatedDuration: e.estimatedDuration,
                                            assetPrivacy: e.assetPrivacy
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new n.H(i, function(e) {
                                    return null == e ? e : {
                                        id: (0, n.u)(e, "Id") ? e.Id : void 0,
                                        name: (0, n.u)(e, "Name") ? e.Name : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AudioPost = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AudioPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AudioVerifyPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new n.w("request", "Required parameter requestParameters.request was null or undefined when calling v1AudioVerifyPost.");
                                return r = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/audio/verify",
                                    schemaPath: "/v1/audio/verify",
                                    method: "POST",
                                    headers: s,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            file: e.file,
                                            groupId: e.groupId,
                                            paymentSource: e.paymentSource,
                                            fileSize: e.fileSize,
                                            duration: e.duration
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new n.H(i, function(e) {
                                    return null == e ? e : {
                                        name: (0, n.u)(e, "name") ? e.name : void 0,
                                        price: (0, n.u)(e, "price") ? e.price : void 0,
                                        balance: (0, n.u)(e, "balance") ? e.balance : void 0,
                                        canAfford: (0, n.u)(e, "canAfford") ? e.canAfford : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AudioVerifyPost = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AudioVerifyPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }
        }(n._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return s(t, e), t.prototype.v1BadgesBadgeIdIconPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.badgeId || void 0 === e.badgeId) throw new n.w("badgeId", "Required parameter requestParameters.badgeId was null or undefined when calling v1BadgesBadgeIdIconPost.");
                                return r = {}, s = {}, i = (0, n.I)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && i.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/badges/{badgeId}/icon".replace("{".concat("badgeId", "}"), encodeURIComponent(String(e.badgeId))),
                                    schemaPath: "/v1/badges/{badgeId}/icon",
                                    method: "POST",
                                    headers: s,
                                    query: r,
                                    body: i
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new n.H(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1BadgesBadgeIdIconPost = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1BadgesBadgeIdIconPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(n._)),
        v = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return s(t, e), t.prototype.v1GamesGameIdIconPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.gameId || void 0 === e.gameId) throw new n.w("gameId", "Required parameter requestParameters.gameId was null or undefined when calling v1GamesGameIdIconPost.");
                                return r = {}, s = {}, i = (0, n.I)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && i.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/games/{gameId}/icon".replace("{".concat("gameId", "}"), encodeURIComponent(String(e.gameId))),
                                    schemaPath: "/v1/games/{gameId}/icon",
                                    method: "POST",
                                    headers: s,
                                    query: r,
                                    body: i
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new n.H(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesGameIdIconPost = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GamesGameIdIconPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(n._),
        m = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return s(t, e), t.prototype.v1GamesGameIdThumbnailImagePostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.gameId || void 0 === e.gameId) throw new n.w("gameId", "Required parameter requestParameters.gameId was null or undefined when calling v1GamesGameIdThumbnailImagePost.");
                                return r = {}, s = {}, i = (0, n.I)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && i.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/games/{gameId}/thumbnail/image".replace("{".concat("gameId", "}"), encodeURIComponent(String(e.gameId))),
                                    schemaPath: "/v1/games/{gameId}/thumbnail/image",
                                    method: "POST",
                                    headers: s,
                                    query: r,
                                    body: i
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new n.H(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesGameIdThumbnailImagePost = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GamesGameIdThumbnailImagePostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(n._),
        h = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return s(t, e), t.prototype.v1PluginsPluginIdIconPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, s, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.pluginId || void 0 === e.pluginId) throw new n.w("pluginId", "Required parameter requestParameters.pluginId was null or undefined when calling v1PluginsPluginIdIconPost.");
                                return r = {}, s = {}, i = (0, n.I)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.requestFiles && i.append("request.files", e.requestFiles), [4, this.request({
                                    path: "/v1/plugins/{pluginId}/icon".replace("{".concat("pluginId", "}"), encodeURIComponent(String(e.pluginId))),
                                    schemaPath: "/v1/plugins/{pluginId}/icon",
                                    method: "POST",
                                    headers: s,
                                    query: r,
                                    body: i
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new n.H(o, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdIconPost = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PluginsPluginIdIconPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(n._),
        f = e.i(213067),
        g = e.i(272593),
        I = e.i(227987),
        P = ((t = {}).Month = "Month", t);
    let y = (0, g.f)("publish", "bedev1"),
        w = new p(y),
        b = new m(y),
        A = new v(y),
        T = new d(y),
        S = new h(y),
        R = new c(y);
    e.s(["e", () => P, "Y", 0, {
        Month: "30"
    }, "U", 0, {
        async patchBadgeIcon(e, t) {
            try {
                return await w.v1BadgesBadgeIdIconPost({
                    badgeId: e,
                    requestFiles: t
                })
            } catch (t) {
                let e = await (0, I.f)(t);
                if (e) throw new f.f(e.code, e.message);
                throw t
            }
        },
        async patchPluginIcon(e, t) {
            try {
                return await S.v1PluginsPluginIdIconPost({
                    pluginId: e,
                    requestFiles: t
                })
            } catch (t) {
                let e = await (0, I.f)(t);
                if (e) throw new f.f(e.code, e.message);
                throw t
            }
        },
        uploadThumbnailImage: async (e, t) => b.v1GamesGameIdThumbnailImagePost({
            gameId: e,
            requestFiles: t
        }),
        async patchUniverseIcon(e, t) {
            try {
                return await A.v1GamesGameIdIconPost({
                    gameId: e,
                    requestFiles: t
                })
            } catch (t) {
                let e = await (0, I.f)(t);
                if (e) throw new f.f(e.code, e.message);
                throw t
            }
        },
        async getAssetQuotas(e, t) {
            try {
                return await T.v1AssetQuotasGet({
                    resourceType: e,
                    assetType: t
                })
            } catch (t) {
                let e = await (0, I.f)(t);
                if (e) throw new f.f(e.code, e.message);
                throw t
            }
        },
        async getAssetMedia(e) {
            try {
                return await R.v1AssetsAssetIdMediaGet({
                    assetId: e
                })
            } catch (t) {
                let e = await (0, I.f)(t);
                if (e) throw new f.f(e.code, e.message);
                throw t
            }
        },
        async postAssetMedia(e, t) {
            try {
                return await R.v1AssetsAssetIdMediaPost({
                    assetId: e,
                    requestFiles: t
                })
            } catch (t) {
                let e = await (0, I.f)(t);
                if (e) throw new f.f(e.code, e.message);
                throw t
            }
        },
        async deleteAssetMedia(e, t) {
            try {
                await R.v1AssetsAssetIdMediaMediaAssetIdDelete({
                    assetId: e,
                    mediaAssetId: t
                })
            } catch (t) {
                let e = await (0, I.f)(t);
                if (e) throw new f.f(e.code, e.message);
                throw t
            }
        },
        async postOrderAssetMedia(e, t) {
            try {
                await R.v1AssetsAssetIdMediaOrderPost({
                    assetId: e,
                    mediaAssetIds: t
                })
            } catch (t) {
                let e = await (0, I.f)(t);
                if (e) throw new f.f(e.code, e.message);
                throw t
            }
        }
    }], 239320)
}, 663629, 205769, e => {
    "use strict";
    var t = e.i(643766);
    let n = (0, t.createContext)({
        isBadgeRefreshRequired: !1,
        badgeDetails: void 0,
        refreshBadgeDetails: () => ({}),
        isBadgeLoading: !1
    });
    n.displayName = "Badge", e.s(["f", 0, n], 205769), e.s(["f", 0, function() {
        return (0, t.useContext)(n)
    }], 663629)
}, 691450, 720054, e => {
    "use strict";
    var t, n = e.i(785517),
        r = e.i(643766),
        s = e.i(341260),
        i = e.i(228096),
        a = e.i(218701),
        o = e.i(814975),
        u = e.i(968284),
        l = e.i(773057),
        d = e.i(759283),
        c = e.i(671376),
        p = e.i(627636),
        v = e.i(450639),
        m = e.i(970494),
        h = e.i(631401),
        f = e.i(803087),
        g = e.i(894432),
        I = e.i(255382),
        P = e.i(392782),
        y = e.i(239320),
        w = e.i(17829);
    let b = async e => {
        var t;
        let n = null == (t = (await y.U.getAssetQuotas("RateLimitCreatorMarketplaceDistribute", e)).quotas) ? void 0 : t[0];
        if (n && void 0 !== n.usage && void 0 !== n.capacity && void 0 !== n.duration && n.duration in y.e) return {
            capacity: n.capacity,
            duration: n.duration,
            expirationTime: n.expirationTime ? new Date(n.expirationTime) : void 0,
            usage: n.usage
        };
        throw Error("empty quota")
    }, A = async e => await I.f.getAssetPermissions(e), T = async (e, t) => await I.f.batchCheckAssetPermissions(t.map(t => ({
        assetId: e,
        subject: h.$.Universe,
        subjectId: t.toString(),
        permissionType: h._.Use
    }))), S = async (e, t) => {
        var n, r, s, i;
        let a = await I.f.batchCheckAssetPermissions([{
            assetId: t,
            subject: h.$.User,
            subjectId: e.toString(),
            permissionType: h._.Edit
        }]);
        if (!a || a.length < 1 || a[0].error) throw Error(null != (r = null == a || null == (i = a[0]) || null == (s = i.error) ? void 0 : s.message) ? r : "Something went wrong fetching asset edit permissions");
        return (null == (n = a[0].value) ? void 0 : n.status) === h.W.HasPermission
    }, R = async e => {
        if (0 === e.length) return null;
        let t = await P.f.getDetails(e);
        return t.data && t.data.length > 0 ? t.data.filter(e => e && e.id && e.name && e.creator && e.creator.name && e.creator.id && e.creator.type).map(e => {
            var t, n, r;
            return {
                universeId: e.id,
                experienceName: e.name,
                creatorName: null == (t = e.creator) ? void 0 : t.name,
                creatorId: null == (n = e.creator) ? void 0 : n.id,
                creatorType: null == (r = e.creator) ? void 0 : r.type
            }
        }) : null
    };
    var C = ((t = {}).AssetNotPublic = "AssetNotPublic", t.UserNotVerified = "UserNotVerified", t.InvalidAssetType = "InvalidAssetType", t.PotentialPolicyViolation = "PotentialPolicyViolation", t.IneligibleFiatSeller = "IneligibleFiatSeller", t.Other = "Other", t.Unauthorized = "Unauthorized", t.NotStarted = "NotStarted", t.NotStartedAudioDistribution = "NotStartedAudioDistribution", t.Approved = "Approved", t.PackageIneligible = "PackageIneligible", t.RightsClaim = "RightsClaim", t.CompositeAssetBrokenDependencies = "CompositeAssetBrokenDependencies", t.CompositeAssetIneligibleDependencies = "CompositeAssetIneligibleDependencies", t.CompositeAssetDependenciesLimit = "CompositeAssetDependenciesLimit", t.HiddenFromSearch = "HiddenFromSearch", t.IneligiblePublisher = "IneligiblePublisher", t.NoPublishedVersion = "NoPublishedVersion", t);
    e.s(["e", () => C, "A", 0, A, "O", 0, e => {
        let t = "/dashboard/creations";
        return (null == e ? void 0 : e.type) && ((null == e ? void 0 : e.creator.type) === w.f.Group ? t += "?activeTab=".concat(e.type, "&groupId=").concat(e.creator.id) : t += "?activeTab=".concat(e.type)), t
    }, "c", 0, b, "W", 0, (e, t, n, r, s, i, a) => e.includes(f.J.NoPublishedVersion) ? "NoPublishedVersion" : e.includes(f.J.CompositeAssetSubcomponentsRestricted) ? "CompositeAssetIneligibleDependencies" : e.includes(f.J.CompositeAssetBrokenUnknownPermissions) || e.includes(f.J.CompositeAssetBrokenReferencedAssetNotFound) ? "CompositeAssetBrokenDependencies" : e.includes(f.J.CompositeAssetBrokenDependenciesLimit) ? "CompositeAssetDependenciesLimit" : e.includes(f.J.AgeVerification) || e.includes(f.J.Moderation) ? "IneligiblePublisher" : e.includes(f.J.SafetyStatus) ? "PotentialPolicyViolation" : e.includes(f.J.AssetType) ? "InvalidAssetType" : e.includes(f.J.Authorization) ? "Unauthorized" : e.includes(f.J.Packages) ? "PackageIneligible" : t ? i && (n.includes(f.J.Moderation) || n.includes(f.J.ModerationHistory) || n.includes(f.J.TwoStepVerification) || n.includes(f.J.Verification)) ? "IneligibleFiatSeller" : e.includes(f.J.RightsClaim) || n.includes(f.J.RightsClaim) ? "RightsClaim" : !r && i ? "Other" : a === g.o.Hidden ? "HiddenFromSearch" : void 0 : "Other", "o", 0, R, "$", 0, T, "I", 0, S, "l", 0, (e, t) => l.f.updateAsset(parseInt(e, 10), {
        ...t
    })], 720054);
    let G = (0, r.createContext)({
        canConfigureDeveloperItem: void 0,
        developerItemDetails: null,
        developerItemId: void 0,
        developerItemImage: "no image",
        iconAssetId: null,
        isLoadingDeveloperItem: !0,
        refreshDeveloperItemDetails: () => {
            throw Error("function is not implemented")
        },
        updateIconAssetId: () => {
            throw Error("function is not implemented")
        }
    });
    G.displayName = "DeveloperItemDetail", e.s(["U", 0, e => {
        var t;
        let {
            children: h
        } = e, [f, g] = (0, r.useState)(!0), [I, P] = (0, r.useState)(void 0), [y, w] = (0, r.useState)(null), [b, A] = (0, r.useState)(), T = (0, i.d)(), {
            user: R
        } = (0, o.f)(), {
            query: C,
            isReady: q
        } = (0, s.useRouter)(), D = (0, r.useMemo)(() => {
            if (q) {
                let {
                    id: e
                } = C;
                if (e) {
                    let t = parseInt(String(e), 10);
                    return t > 0 ? t : void 0
                }
            }
        }, [C, q]), [U, x] = (0, r.useState)(null);
        (0, r.useEffect)(() => {
            D && (null == y ? void 0 : y.type) === c.f.Audio && u.U.getAsset(D, [u.b.ICON]).then(e => {
                if (e.icon) {
                    let t = parseInt(e.icon.replace("assets/", ""), 10);
                    Number.isNaN(t) || x(t)
                }
            })
        }, [D, null == y ? void 0 : y.type]);
        let B = null != (t = null != U ? U : D) ? t : 0,
            {
                thumbnailImage: O,
                refreshThumbnail: k
            } = (0, v.f)({
                targetId: B,
                targetType: a.V.assetThumbnail,
                fontColor: "dark",
                returnPolicy: a.X.PlaceHolder
            }),
            E = (0, r.useCallback)(e => {
                var t, n;
                let r = Object.values(c.f),
                    s = e.type && r.includes(e.type);
                return e.id && s && e.name && (null == (t = e.creator) ? void 0 : t.targetId) && (null == (n = e.creator) ? void 0 : n.type) && void 0 !== e.enableComments && void 0 !== e.isCopyingAllowed
            }, []),
            L = (0, r.useCallback)(async (e, t) => {
                g(!0);
                let [n, r] = await Promise.allSettled([l.f.getAssetDetails([e]), S(t, e)]);
                if (n.status === d.Z && r.status === d.Z) {
                    var s, i, a, o, u, v, h, f;
                    let t = null == (s = n.value.data) ? void 0 : s[0];
                    if (t && E(t)) {
                        let n = Object.values(c.f).find(e => e === t.type),
                            r = Object.values(p.f).find(e => {
                                var n;
                                return e === (null == (n = t.creator) ? void 0 : n.type)
                            });
                        if (!n || !r) {
                            w(null), A(void 0), g(!1);
                            return
                        }
                        let s = {
                                id: (null != (i = t.id) ? i : 0).toString(),
                                type: n,
                                name: null != (a = t.name) ? a : "",
                                creator: {
                                    id: null != (o = null == (f = t.creator) ? void 0 : f.targetId) ? o : 0,
                                    type: r
                                },
                                enableComments: null != (u = t.enableComments) && u,
                                isCopyingAllowed: null != (v = t.isCopyingAllowed) && v,
                                isVersioningEnabled: null != (h = t.isVersioningEnabled) && h,
                                description: t.description
                            },
                            l = (0, m.e)(T, e, s);
                        w(l.details), A(l.expiresAt)
                    } else w(null), A(void 0);
                    P(r.value)
                } else w(null), A(void 0);
                g(!1)
            }, [E, T]),
            M = (0, r.useCallback)(async function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                if (e && k(), D && (null == R ? void 0 : R.id)) return L(D, R.id)
            }, [R, D, L, k]);
        (0, r.useEffect)(() => {
            let e = window.setTimeout(() => {
                M()
            }, 0);
            return () => window.clearTimeout(e)
        }, [M]), (0, r.useEffect)(() => {
            if (null == b) return;
            let e = window.setTimeout(() => {
                A(void 0), M()
            }, Math.max(0, b - Date.now()));
            return () => window.clearTimeout(e)
        }, [b, M]);
        let N = (0, r.useMemo)(() => ({
            canConfigureDeveloperItem: I,
            developerItemId: D,
            iconAssetId: U,
            isLoadingDeveloperItem: f,
            developerItemDetails: y,
            refreshDeveloperItemDetails: M,
            developerItemImage: O,
            updateIconAssetId: x
        }), [I, y, D, U, f, M, O]);
        return (0, n.jsx)(G.Provider, {
            value: N,
            children: h
        })
    }, "x", 0, function() {
        return (0, r.useContext)(G)
    }], 691450)
}, 914570, e => {
    "use strict";
    var t = e.i(785517),
        n = e.i(643766),
        r = e.i(863755),
        s = e.i(495011),
        i = e.i(92653);
    let a = (0, n.createContext)({
        developerProductDetails: void 0,
        isLoading: !1,
        isPending: !1,
        isError: !1,
        isStale: !1,
        isRefetching: !1
    });
    e.s(["e", 0, e => {
        let {
            children: o
        } = e, {
            universeId: u
        } = (0, i.f)(), {
            productId: l
        } = (0, s.f)(), d = (0, r.f)({
            universeId: u,
            productId: l
        }, {
            enabled: !!l && !!u
        });
        return (0, t.jsx)(a.Provider, {
            value: (0, n.useMemo)(() => ({
                ...d,
                developerProductDetails: d.data
            }), [d]),
            children: o
        })
    }, "u", 0, function() {
        return (0, n.useContext)(a)
    }])
}, 768243, 4843, e => {
    "use strict";
    var t = e.i(643766);
    let n = (0, t.createContext)({
        isLoading: !1,
        eventDetails: null,
        refreshEventDetails: () => {
            throw Error("Cannot refresh event details prior to fetching for the first time")
        }
    });
    e.s(["f", 0, n], 4843), e.s(["f", 0, function() {
        return (0, t.useContext)(n)
    }], 768243)
}, 199186, 293293, e => {
    "use strict";
    var t = e.i(643766);
    let n = (0, t.createContext)({
        experienceSubscriptionDetails: void 0,
        usedSubscriptionNames: [],
        isExperienceSubscriptionLoading: !1,
        isExperienceSubscriptionRefreshRequired: !1,
        priceTierMap: void 0,
        revshareStatModelMap: void 0,
        canAccessExperienceSubscription: !1,
        refreshExperienceSubscriptionDetails: () => ({})
    });
    n.displayName = "experienceSubscriptions", e.s(["f", 0, n], 293293), e.s(["f", 0, function() {
        return (0, t.useContext)(n)
    }], 199186)
}, 731815, 213465, e => {
    "use strict";
    var t = e.i(643766);
    let n = (0, t.createContext)({
        isLoadingItem: !1,
        isErrorLoadingItem: !1,
        refreshItemDetails: () => {
            throw Error("function is not implemented")
        },
        collectiblesMetadata: void 0,
        marketplaceItemDetails: void 0
    });
    n.displayName = "ItemDetails", e.s(["f", 0, n], 213465), e.s(["f", 0, function() {
        return (0, t.useContext)(n)
    }], 731815)
}, 882221, e => {
    "use strict";
    var t = e.i(785517),
        n = e.i(643766),
        r = e.i(261482),
        s = e.i(477749),
        i = e.i(92653),
        a = e.i(910272),
        o = e.i(851130),
        u = e.i(966956);
    let l = (0, n.createContext)({
        passDetails: void 0,
        passPromotionsStatus: void 0,
        isPassLoading: !1,
        isPassDetailsRefetching: !1
    });
    l.displayName = "Pass", e.s(["d", 0, function(e) {
        let {
            children: d
        } = e, {
            universeId: c
        } = (0, i.f)(), {
            passId: p
        } = (0, s.f)(), v = !!c && !!p, {
            data: m,
            isLoading: h,
            isRefetching: f
        } = function(e) {
            var t;
            let {
                universeId: n,
                gamePassId: r
            } = e, s = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return (0, a.f)({
                queryKey: u.f.config(n, r),
                queryFn: e => {
                    let {
                        signal: t
                    } = e;
                    return o.f.getGamePassConfig({
                        universeId: n,
                        gamePassId: r
                    }, {
                        signal: t
                    })
                },
                staleTime: u.e,
                retry: u.M,
                ...s,
                enabled: (null == (t = s.enabled) || t) && !!n && n > 0 && !!r
            })
        }({
            universeId: c,
            gamePassId: p
        }, {
            enabled: v
        }), {
            data: g,
            isLoading: I
        } = (0, r.f)({
            universeId: c,
            gamePassId: p
        }, {
            enabled: v
        }), P = h || I;
        return (0, t.jsx)(l.Provider, {
            value: (0, n.useMemo)(() => ({
                passDetails: m,
                passPromotionsStatus: g,
                isPassLoading: P,
                isPassDetailsRefetching: f
            }), [m, g, P, f]),
            children: d
        })
    }, "b", 0, function() {
        return (0, n.useContext)(l)
    }], 882221)
}, 967775, 946897, e => {
    "use strict";
    var t = e.i(643766);
    let n = (0, t.createContext)({
        placeDetails: void 0,
        refreshPlaceDetails: () => Promise.reject(Error("not implemented")),
        canConfigurePlace: !1,
        containingUniverse: 0,
        isPlaceLoading: !1,
        placeIcon: void 0,
        refreshPlaceIcon: () => Promise.reject(Error("not implemented"))
    });
    n.displayName = "PlaceDetails", e.s(["f", 0, n], 946897), e.s(["f", 0, function() {
        return (0, t.useContext)(n)
    }], 967775)
}, 863755, 285040, 495011, e => {
    "use strict";
    var t = e.i(910272),
        n = e.i(503725);
    let r = {
        all: e => ["universes", e, "developerproducts"],
        list: (e, t) => [...r.all(e), "list", t],
        config: (e, t) => [...r.all(e), "config", t],
        batchConfigs: (e, t) => [...r.all(e), "batchConfigs", [...t].sort((e, t) => e - t)],
        create: e => [...r.all(e), "create"],
        update: (e, t) => [...r.all(e), t, "update"],
        batchUpdate: e => [...r.all(e), "batchUpdate"]
    };
    e.s(["i", 0, 3e3, "$", 0, 400, "M", 0, 3, "e", 0, 6e5, "f", 0, 3e3, "I", 0, r, "A", 0, function(e, t) {
        let n = e.queryKey;
        return "universes" === n[0] && n[1] === t && "developerproducts" === n[2] && "batchConfigs" === n[3] && Array.isArray(n[4])
    }, "g", 0, function(e, t) {
        let n = e.queryKey;
        return "universes" === n[0] && n[1] === t && "developerproducts" === n[2] && "list" === n[3]
    }], 285040), e.s(["f", 0, function(e) {
        let {
            universeId: s,
            productId: i
        } = e, a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return (0, t.f)({
            queryKey: r.config(s, i),
            queryFn: e => {
                let {
                    signal: t
                } = e;
                return n.f.getDeveloperProductConfig({
                    universeId: s,
                    productId: i
                }, {
                    signal: t
                })
            },
            retry: 3,
            ...a
        })
    }], 863755);
    var s = e.i(341260);
    e.s(["f", 0, function() {
        let e = (0, s.useRouter)(),
            t = e.query.productId;
        if (!e.isReady) return {
            isLoading: !0,
            isError: !1
        };
        if (!t || Array.isArray(t)) return {
            isLoading: !1,
            isError: !0
        };
        let n = Number(t);
        return Number.isNaN(n) || !Number.isInteger(n) ? {
            isLoading: !1,
            isError: !0
        } : {
            productId: n,
            isLoading: !1,
            isError: !1
        }
    }], 495011)
}, 92653, e => {
    "use strict";
    var t = e.i(341260);
    e.s(["f", 0, function() {
        let e = (0, t.useRouter)(),
            n = e.query.id;
        if (!e.isReady) return {
            isLoading: !0,
            isError: !1
        };
        if (!n || Array.isArray(n)) return {
            isLoading: !1,
            isError: !0
        };
        let r = Number(n);
        return Number.isNaN(r) || !Number.isInteger(r) ? {
            isLoading: !1,
            isError: !0
        } : {
            universeId: r,
            isLoading: !1,
            isError: !1
        }
    }])
}, 943758, e => {
    "use strict";
    var t = e.i(785517),
        n = e.i(643766);
    let r = (0, n.createContext)(null);
    e.s(["U", 0, function(e) {
        let {
            children: s
        } = e, i = (0, n.useRef)({}), a = (0, n.useRef)(new Set), o = (0, n.useCallback)(() => i.current, []), u = (0, n.useCallback)(e => (a.current.add(e), () => {
            a.current.delete(e)
        }), []), l = (0, n.useCallback)(() => {
            for (let e of a.current) e()
        }, []), d = (0, n.useCallback)((e, t) => {
            i.current[e] !== t && (i.current = {
                ...i.current,
                [e]: t
            }, l())
        }, [l]), c = (0, n.useCallback)(e => {
            if (e in i.current) {
                let t = {
                    ...i.current
                };
                delete t[e], i.current = t, l()
            }
        }, [l]), p = (0, n.useMemo)(() => ({
            getSnapshot: o,
            subscribe: u,
            register: d,
            unregister: c
        }), [o, u, d, c]);
        return (0, t.jsx)(r.Provider, {
            value: p,
            children: s
        })
    }, "m", 0, function() {
        let e = (0, n.useContext)(r);
        if (!e) throw Error("useBreadcrumbItemNames must be used within an BreadcrumbItemNameProvider");
        return (0, n.useSyncExternalStore)(e.subscribe, e.getSnapshot, e.getSnapshot)
    }, "D", 0, function() {
        let e = (0, n.useContext)(r);
        if (!e) throw Error("useBreadcrumbRegister must be used within an BreadcrumbItemNameProvider");
        return e
    }])
}, 128106, e => {
    "use strict";
    var t, n = ((t = n || {}).Creations = "creations", t.Games = "games", t.GamePass = "passes", t.Badge = "badges", t.Bundle = "bundle", t.DeveloperProduct = "developer-products", t.ExternalPurchaseSettings = "external-purchase-settings", t.Catalog = "catalog", t.AssociatedItems = "associated-items", t.Localization = "localization", t.ActivityHistory = "activity-history", t.Notifications = "notifications", t.SocialLinks = "social-links", t.Translation = "translation", t.Overview = "overview", t.ContributionReport = "contribution-report", t.Alerts = "alerts", t.AnalyticsMonetization = "analytics-monetization", t.AnalyticsRetention = "analytics-retention", t.AnalyticsEngagement = "analytics-engagement", t.AnalyticsAcquisition = "analytics-acquisition", t.AnalyticsPerformance = "analytics-performance", t.AnalyticsCrashes = "analytics-crashes", t.AnalyticsExploreMode = "analytics-explore-mode", t.AnalyticsCustomDashboards = "analytics-custom-dashboards", t.AnalyticsAudience = "analytics-audience", t.AnalyticsEconomy = "analytics-economy", t.AnalyticsFunnels = "analytics-funnels", t.AnalyticsErrorReport = "analytics-error-report", t.AnalyticsMemoryStores = "analytics-memory-stores", t.AnalyticsQueueService = "analytics-queue-service", t.AnalyticsDataStores = "analytics-data-stores", t.AnalyticsHttpServicce = "analytics-http-service", t.AnalyticsMessagingService = "analytics-messaging-service", t.AnalyticsSpeechToText = "analytics-speech-to-text", t.AnalyticsTextToSpeech = "analytics-text-to-speech", t.AnalyticsVideoService = "analytics-video-service", t.AnalyticsGenerativeAI = "analytics-generative-ai", t.AnalyticCustomEvents = "analytics-custom-events", t.ImmersiveAds = "immersive-ads", t.ImmersiveAdsCreatePlacement = "immersive-ads-create-placement", t.Questionnaire = "experience-questionnaire", t.Guidelines = "guidelines", t.Configure = "configure", t.CommunicationSettings = "communication-settings", t.Sales = "sales", t.Promotions = "promotions", t.Create = "create", t.ConfigCreate = "config-create", t.Updates = "updates", t.Places = "places", t.Manage = "manage", t.Icon = "icon", t.Event = "event", t.SelectEligibility = "selectEligibility", t.Thumbnails = "thumbnails", t.Videos = "videos", t.Access = "access", t.Secrets = "secrets", t.CreatorStore = "store", t.Settings = "settings", t.Permissions = "permissions", t.Webhooks = "webhooks", t.Community = "community", t.Category = "category", t.Experiences = "experiences", t.ExperienceSubscription = "experience-subscriptions", t.Commerce = "commerce", t.CreateProducts = "create-products", t.Preferences = "preferences", t.Advanced = "advanced", t.DataSharing = "data-collection", t.PricedAssets = "priced-assets", t.Eligibility = "eligibility", t.AudioDistribution = "audio-distribution", t.PriceOptimization = "price-optimization", t.PriceCheck = "price-check", t.Bans = "bans", t.AntiCheat = "anti-cheat", t.IssuesAndAppeals = "issues-and-appeals", t.Add = "add", t.Reorder = "reorder", t.AvatarCreationTokens = "avatar-creation-tokens", t.CustomMatchmaking = "custom-matchmaking", t.CreateMatchmakingConfiguration = "create-configuration", t.CreateMatchmakingAttribute = "create-attribute", t.EditMatchmakingConfiguration = "edit-configuration", t.EditMatchmakingServerAttribute = "edit-server-attribute", t.EditMatchmakingPlayerAttribute = "edit-player-attribute", t.PaidAccess = "paid-access", t.ExtendedServices = "extended-services", t.PublicPublish = "public-publish", t.PublishingPermissions = "publishing-permissions", t.UsO18DevexRate = "us-o18-devex-rate", t.Feedback = "feedback", t.ApiSettings = "api-settings", t.Configs = "configs", t.ConfigsHistory = "configs-history", t.Experiments = "experiments", t.ExperimentCreate = "experiment-create", t.ExperimentDetails = "experiment-details", t.ReferralRewards = "referral-reward-details", t.Environments = "environments", t.Collaborators = "collaborators", t.Look = "look", t.AnalyticsJourneys = "analytics-journeys", t.AnalyticsJourneyDetail = "analytics-journey-detail", t.RecommendationService = "recommendation-service", t.Observability = "observability", t.ServerManagement = "server-management-service", t.ClientSessions = "client-sessions", t.ClientSession = "client-session", t.DataCaptures = "data-captures", t.ManagedPricing = "managed-pricing", t.HardCodedPrices = "hard-coded-prices", t.DeveloperProductPurchasesBlocked = "developer-product-purchases-blocked", t.Leaderboard = "leaderboard", t.PersonalizedShop = "personalized-shop", t.AudienceReach = "audience-reach", t.PlayerSupport = "player-support", t.PlayerSupportTicket = "player-support-ticket", t.GameDetails = "game-details", t.ContentRating = "content-rating", t.AdvancedSettings = "advanced-settings", t.GameJoin = "game-join", t.Publishing = "publishing", t.GameViolation = "game-violation", t);
    e.s(["f", 0, n])
}, 509049, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(341260),
        r = e.i(79187),
        s = e.i(482979),
        i = e.i(663629),
        a = e.i(691450),
        o = e.i(914570),
        u = e.i(768243),
        l = e.i(199186),
        d = e.i(731815),
        c = e.i(105098),
        p = e.i(882221),
        v = e.i(967775),
        m = e.i(475360),
        h = e.i(759283),
        f = e.i(17829),
        g = e.i(251622),
        I = e.i(692587),
        P = e.i(114209),
        y = e.i(943758),
        w = e.i(128106);
    e.s(["f", 0, function() {
        let {
            pathname: e
        } = (0, n.useRouter)(), {
            translate: b
        } = (0, r.A)(), {
            itemNameMapping: A,
            currentItemType: T,
            currentItemGroupId: S,
            isCurrentItemLoading: R,
            hasCurrentItemLoadError: C,
            id: G,
            badgeId: q,
            passId: D,
            groupId: U,
            assetId: x,
            bundleId: B,
            experienceSubscriptionId: O,
            lookId: k,
            developerItemDetails: E,
            experimentId: L,
            environmentId: M
        } = function() {
            var e, b, A, T, S, R, C, G, q, D, U, x;
            let {
                translate: B
            } = (0, r.A)(), {
                gameDetails: O,
                isLoadingGame: k,
                isErrorLoadingGame: E
            } = (0, P.i)(), {
                isLoadingItem: L,
                isErrorLoadingItem: M,
                marketplaceItemDetails: N
            } = (0, d.f)(), {
                badgeDetails: F
            } = (0, i.f)(), {
                developerProductDetails: V
            } = (0, o.u)(), {
                passDetails: j
            } = (0, p.b)(), {
                lookDetail: H,
                isLoadingLook: _
            } = (0, c.f)(), {
                placeDetails: z
            } = (0, v.f)(), {
                eventDetails: J,
                isLoading: K
            } = (0, u.f)(), {
                developerItemDetails: Q,
                isLoadingDeveloperItem: W
            } = (0, a.x)(), {
                experienceSubscriptionDetails: Y
            } = (0, l.f)(), $ = (0, y.m)(), {
                query: Z,
                pathname: X
            } = (0, n.useRouter)(), {
                id: ee,
                badgeId: et,
                notificationCategory: en,
                activeTab: er,
                experimentId: es,
                environmentId: ei
            } = (0, I.U)(Z), ea = (0, t.useMemo)(() => {
                var e, t;
                return (null == O || null == (e = O.creator) ? void 0 : e.type) === "Group" ? null == O || null == (t = O.creator) ? void 0 : t.id : void 0
            }, [O]), eo = (0, t.useMemo)(() => {
                var e, t, n, r;
                if (null == N || null == (t = N.item) || null == (e = t.marketplaceItemDetails) ? void 0 : e.assetDetails) return null == N || null == (r = N.item) || null == (n = r.id) ? void 0 : n.toString()
            }, [N]), eu = (0, t.useMemo)(() => {
                var e;
                return null == j || null == (e = j.gamePassId) ? void 0 : e.toString()
            }, [j]), el = (0, t.useMemo)(() => {
                var e, t, n, r;
                if (null == N || null == (t = N.item) || null == (e = t.marketplaceItemDetails) ? void 0 : e.bundleDetails) return null == N || null == (r = N.item) || null == (n = r.id) ? void 0 : n.toString()
            }, [N]), ed = (0, t.useMemo)(() => {
                var e;
                return null != (e = null == Y ? void 0 : Y.id) ? e : void 0
            }, [Y]), ec = (0, t.useMemo)(() => {
                var e, t, n, r, s;
                return (null == N || null == (t = N.item) || null == (e = t.creator) ? void 0 : e.kindCase) === 2 ? null == N || null == (s = N.item) || null == (r = s.creator) || null == (n = r.group) ? void 0 : n.groupId : ea
            }, [ea, null == N || null == (A = N.item) || null == (b = A.creator) || null == (e = b.group) ? void 0 : e.groupId, null == N || null == (S = N.item) || null == (T = S.creator) ? void 0 : T.kindCase]), ep = (0, t.useMemo)(() => null == H ? void 0 : H.lookId, [H]), ev = (0, t.useMemo)(() => {
                var e, t, n, r, s, i, a;
                return {
                    [w.f.Bundle]: null == N || null == (i = N.item) ? void 0 : i.name,
                    [w.f.Games]: null == O ? void 0 : O.name,
                    [w.f.Badge]: null == F ? void 0 : F.name,
                    [w.f.DeveloperProduct]: null != (e = null == V ? void 0 : V.name) ? e : void 0,
                    [w.f.GamePass]: null != (t = null == j ? void 0 : j.name) ? t : void 0,
                    [w.f.Catalog]: null == N || null == (a = N.item) ? void 0 : a.name,
                    [w.f.Places]: null == z ? void 0 : z.name,
                    [w.f.Event]: null != (n = null == J ? void 0 : J.title) ? n : void 0,
                    [w.f.CreatorStore]: null == Q ? void 0 : Q.name,
                    [w.f.Category]: en ? B("Label.Category".concat(en)) : void 0,
                    [w.f.ExperienceSubscription]: null != (r = null == Y ? void 0 : Y.name) ? r : void 0,
                    [w.f.Look]: null != (s = null == H ? void 0 : H.name) ? s : void 0,
                    ...$
                }
            }, [null == N || null == (R = N.item) ? void 0 : R.name, null == O ? void 0 : O.name, null == F ? void 0 : F.name, null == V ? void 0 : V.name, null == j ? void 0 : j.name, null == z ? void 0 : z.name, null == J ? void 0 : J.title, null == Q ? void 0 : Q.name, en, B, null == Y ? void 0 : Y.name, null == H ? void 0 : H.name, $]), em = (0, t.useMemo)(() => X.includes(w.f.ExperienceSubscription) ? m.f.ExperienceSubscription : X.includes(w.f.Badge) ? m.f.Badge : X.includes(w.f.ReferralRewards) ? m.f.ReferralRewards : X.includes(w.f.Bundle) ? m.f.Bundle : X.includes(w.f.GamePass) ? m.f.GamePass : X.includes(w.f.DeveloperProduct) ? m.f.DeveloperProduct : X.includes(w.f.Catalog) ? m.f.CatalogAsset : X.includes(w.f.CreatorStore) ? m.f.LibraryAsset : X.includes(w.f.Places) ? m.f.Places : X.includes(w.f.Environments) ? m.f.Environment : X.includes(w.f.Alerts) ? m.f.Alert : X.includes(w.f.Event) ? m.f.Event : X.includes(w.f.Notifications) ? m.f.Notifications : X.includes(w.f.AssociatedItems) && "string" == typeof er && (0, g.T)(er) ? er : X.includes(w.f.AvatarCreationTokens) ? m.f.AvatarCreationToken : X.includes(h.e[m.f.Journey]) ? m.f.Journey : X.includes(h.e[m.f.DataCapture]) ? m.f.DataCapture : X.includes(w.f.Experiences) ? m.f.Game : X.includes(w.f.Advanced) ? m.f.Advanced : X.includes(w.f.Look) ? m.f.Look : void 0, [er, X]), {
                currentItemGroupId: eh,
                isCurrentItemLoading: ef,
                hasCurrentItemLoadError: eg
            } = (0, t.useMemo)(() => {
                var e, t, n, r, i, a;
                return em === m.f.Bundle || em === m.f.CatalogAsset ? {
                    currentItemGroupId: null != ec ? ec : ea,
                    isCurrentItemLoading: L,
                    hasCurrentItemLoadError: M
                } : em === m.f.DeveloperProduct || em === m.f.LibraryAsset ? {
                    currentItemGroupId: (null == Q || null == (e = Q.creator) ? void 0 : e.type) === f.f.Group ? null == Q || null == (t = Q.creator) ? void 0 : t.id : ea,
                    isCurrentItemLoading: W,
                    hasCurrentItemLoadError: !1
                } : em === m.f.Event ? {
                    currentItemGroupId: (null == J || null == (n = J.host) ? void 0 : n.hostType) === s.T.Group ? null == J || null == (r = J.host) ? void 0 : r.hostId : ea,
                    isCurrentItemLoading: K,
                    hasCurrentItemLoadError: !1
                } : em === m.f.Look ? {
                    currentItemGroupId: (null == H || null == (i = H.curator) ? void 0 : i.type) === f.f.Group ? null == H || null == (a = H.curator) ? void 0 : a.id : ea,
                    isCurrentItemLoading: _,
                    hasCurrentItemLoadError: !1
                } : {
                    currentItemGroupId: ea,
                    isCurrentItemLoading: k,
                    hasCurrentItemLoadError: null != E && E
                }
            }, [em, ec, ea, L, M, null == Q || null == (C = Q.creator) ? void 0 : C.type, null == Q || null == (G = Q.creator) ? void 0 : G.id, W, null == J || null == (q = J.host) ? void 0 : q.hostType, null == J || null == (D = J.host) ? void 0 : D.hostId, K, k, E, null == H || null == (U = H.curator) ? void 0 : U.type, null == H || null == (x = H.curator) ? void 0 : x.id, _]);
            return {
                itemNameMapping: ev,
                currentItemType: em,
                currentItemGroupId: eh,
                isCurrentItemLoading: ef,
                hasCurrentItemLoadError: eg,
                pathname: X,
                id: ee,
                badgeId: et,
                passId: eu,
                groupId: ea,
                assetId: eo,
                bundleId: el,
                experienceSubscriptionId: ed,
                getMarketplaceItemGroupId: ec,
                lookId: ep,
                developerItemDetails: Q,
                experimentId: es,
                environmentId: ei
            }
        }(), N = (0, t.useMemo)(() => ({
            translate: b,
            itemType: T,
            pathname: e
        }), [T, e, b]);
        return {
            itemNameMapping: A,
            pathLinkParams: (0, t.useMemo)(() => {
                var t, n;
                return {
                    baseId: null == G ? void 0 : G.toString(),
                    badgeId: null == q ? void 0 : q.toString(),
                    passId: D,
                    groupId: null != (t = null == U ? void 0 : U.toString()) ? t : S ? S.toString() : void 0,
                    assetId: x,
                    bundleId: B,
                    developerItemId: null != (n = null == E ? void 0 : E.id) ? n : void 0,
                    associatedItemType: T,
                    experienceSubscriptionId: O,
                    environmentId: null != M ? M : void 0,
                    experimentId: null != L ? L : void 0,
                    lookId: null != k ? k : void 0,
                    pathname: e
                }
            }, [G, q, D, U, S, x, B, null == E ? void 0 : E.id, T, O, M, L, k, e]),
            displayNameParam: N,
            currentItemType: T,
            currentItemGroupId: S,
            isCurrentItemLoading: R,
            hasCurrentItemLoadError: C
        }
    }], 509049)
}]);

//# debugId=ce587e39-e58a-2327-e306-d0a4b9514921
//# sourceMappingURL=33ks9af4b6dek.js.map