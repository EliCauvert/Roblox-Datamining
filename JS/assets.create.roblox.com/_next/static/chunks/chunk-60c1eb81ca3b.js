;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "8ac2f961-1058-6060-80d8-35d66cbdef75")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 718067, e => {
    "use strict";
    var n, t, i, a = ((n = {})[n.Unknown = -1] = "Unknown", n[n.Init = 0] = "Init", n[n.ArchivedExperience = 1] = "ArchivedExperience", n[n.PlayabilityChanged = 2] = "PlayabilityChanged", n[n.NotificationStringCreated = 3] = "NotificationStringCreated", n[n.NotificationStringDeleted = 4] = "NotificationStringDeleted", n[n.NotificationStringUpdated = 5] = "NotificationStringUpdated", n[n.AvatarSettingsAvatarType = 6] = "AvatarSettingsAvatarType", n[n.AvatarSettingsAnimation = 7] = "AvatarSettingsAnimation", n[n.AvatarSettingsCollision = 8] = "AvatarSettingsCollision", n[n.AvatarSettingsScaleHeight = 9] = "AvatarSettingsScaleHeight", n[n.AvatarSettingsScaleWidth = 10] = "AvatarSettingsScaleWidth", n[n.AvatarSettingsScaleHead = 11] = "AvatarSettingsScaleHead", n[n.AvatarSettingsScaleBodyType = 12] = "AvatarSettingsScaleBodyType", n[n.AvatarSettingsScaleProportions = 13] = "AvatarSettingsScaleProportions", n[n.AvatarSettingsBodyParts = 14] = "AvatarSettingsBodyParts", n[n.AvatarSettingsClothing = 15] = "AvatarSettingsClothing", n[n.ExperienceName = 16] = "ExperienceName", n[n.ExperienceDescription = 17] = "ExperienceDescription", n[n.ExperienceGenre = 18] = "ExperienceGenre", n[n.SecuritySettingsHTTPRequests = 19] = "SecuritySettingsHTTPRequests", n[n.SecuritySettingsStudioAccessToAPI = 20] = "SecuritySettingsStudioAccessToAPI", n[n.SecuritySettingsThirdPartySales = 21] = "SecuritySettingsThirdPartySales", n[n.SecuritySettingsThirdPartyTeleports = 22] = "SecuritySettingsThirdPartyTeleports", n[n.ExperienceShutDown = 23] = "ExperienceShutDown", n[n.SocialLinksAdded = 24] = "SocialLinksAdded", n[n.SocialLinksRemoved = 25] = "SocialLinksRemoved", n[n.SocialLinksUpdated = 26] = "SocialLinksUpdated", n[n.SpatialVoice = 27] = "SpatialVoice", n[n.WorldSettingsWorkSpaceGravity = 28] = "WorldSettingsWorkSpaceGravity", n[n.WorldSettingsJumpHeight = 29] = "WorldSettingsJumpHeight", n[n.WorldSettingsJumpPower = 30] = "WorldSettingsJumpPower", n[n.WorldSettingsWalkSpeed = 31] = "WorldSettingsWalkSpeed", n[n.WorldSettingsMaxSlopeAngle = 32] = "WorldSettingsMaxSlopeAngle", n[n.SentUpdate = 33] = "SentUpdate", n[n.SupportedLanguages = 34] = "SupportedLanguages", n[n.AutoTranslationExperienceInformation = 35] = "AutoTranslationExperienceInformation", n[n.AutoTranslationExperienceStringsAndProducts = 36] = "AutoTranslationExperienceStringsAndProducts", n[n.LocalizationSettingsAutomaticTextCapture = 37] = "LocalizationSettingsAutomaticTextCapture", n[n.LocalizationSettingsUserTranslatedContent = 38] = "LocalizationSettingsUserTranslatedContent", n[n.ClearUnmodifiedAutoCaptureEntries = 39] = "ClearUnmodifiedAutoCaptureEntries", n[n.AnalyticsReport = 40] = "AnalyticsReport", n[n.TranslationIconAdded = 41] = "TranslationIconAdded", n[n.TranslationIconDeleted = 42] = "TranslationIconDeleted", n[n.TranslationExperienceName = 43] = "TranslationExperienceName", n[n.TranslationExperienceDescription = 44] = "TranslationExperienceDescription", n[n.TranslationThumbnailAltText = 45] = "TranslationThumbnailAltText", n[n.TranslationThumbnailAdded = 46] = "TranslationThumbnailAdded", n[n.TranslationThumbnailDeleted = 47] = "TranslationThumbnailDeleted", n[n.TranslationThumbnailOrder = 48] = "TranslationThumbnailOrder", n[n.TranslationStringAdded = 49] = "TranslationStringAdded", n[n.TranslationStringDeleted = 50] = "TranslationStringDeleted", n[n.TranslationStringUpdated = 51] = "TranslationStringUpdated", n[n.TranslationBadgeIconDeleted = 52] = "TranslationBadgeIconDeleted", n[n.TranslationBadgeDescription = 53] = "TranslationBadgeDescription", n[n.TranslationBadgeIconAdded = 54] = "TranslationBadgeIconAdded", n[n.TranslationBadgeName = 55] = "TranslationBadgeName", n[n.TranslationDeveloperProductIconDeleted = 56] = "TranslationDeveloperProductIconDeleted", n[n.TranslationDeveloperProductDescription = 57] = "TranslationDeveloperProductDescription", n[n.TranslationDeveloperProductIconAdded = 58] = "TranslationDeveloperProductIconAdded", n[n.TranslationDeveloperProductName = 59] = "TranslationDeveloperProductName", n[n.TranslationGamePassIconDeleted = 60] = "TranslationGamePassIconDeleted", n[n.TranslationGamePassDescription = 61] = "TranslationGamePassDescription", n[n.TranslationGamePassIconAdded = 62] = "TranslationGamePassIconAdded", n[n.TranslationGamePassName = 63] = "TranslationGamePassName", n[n.UserTranslator = 64] = "UserTranslator", n[n.GroupTranslator = 65] = "GroupTranslator", n[n.ExperienceAdvertisement = 66] = "ExperienceAdvertisement", n[n.MonetizationSettingsAccessType = 67] = "MonetizationSettingsAccessType", n[n.MonetizationSettingsRequiresRobux = 68] = "MonetizationSettingsRequiresRobux", n[n.MonetizationSettingsRobuxPrice = 69] = "MonetizationSettingsRobuxPrice", n[n.MonetizationSettingsPlayableDevices = 70] = "MonetizationSettingsPlayableDevices", n[n.MonetizationSettingsAllowPrivateServers = 71] = "MonetizationSettingsAllowPrivateServers", n[n.MonetizationSettingsPrivateServerPrice = 72] = "MonetizationSettingsPrivateServerPrice", n[n.ExperienceSponsor = 73] = "ExperienceSponsor", n[n.BadgeName = 74] = "BadgeName", n[n.BadgeDescription = 75] = "BadgeDescription", n[n.BadgeIcon = 76] = "BadgeIcon", n[n.BadgeCreate = 77] = "BadgeCreate", n[n.DeveloperProductName = 78] = "DeveloperProductName", n[n.DeveloperProductDescription = 79] = "DeveloperProductDescription", n[n.DeveloperProductIcon = 80] = "DeveloperProductIcon", n[n.DeveloperProductPrice = 81] = "DeveloperProductPrice", n[n.DeveloperProductCreate = 82] = "DeveloperProductCreate", n[n.GamePassName = 83] = "GamePassName", n[n.GamePassDescription = 84] = "GamePassDescription", n[n.GamePassIcon = 85] = "GamePassIcon", n[n.GamePassPrice = 86] = "GamePassPrice", n[n.GamePassCreate = 87] = "GamePassCreate", n[n.PermissionsUserAdded = 88] = "PermissionsUserAdded", n[n.PermissionsGroupAdded = 89] = "PermissionsGroupAdded", n[n.PermissionsUserChanged = 90] = "PermissionsUserChanged", n[n.PermissionsUserRemoved = 91] = "PermissionsUserRemoved", n[n.PermissionsGroupChanged = 92] = "PermissionsGroupChanged", n[n.PermissionsGroupRemoved = 93] = "PermissionsGroupRemoved", n[n.TeamCreate = 94] = "TeamCreate", n[n.PlaceIconAutoGenerated = 95] = "PlaceIconAutoGenerated", n[n.PlaceIconChanged = 96] = "PlaceIconChanged", n[n.PlaceIconRemoved = 97] = "PlaceIconRemoved", n[n.PlaceGearGenresOnlyAllowFromExperiencesGenre = 98] = "PlaceGearGenresOnlyAllowFromExperiencesGenre", n[n.PlaceGearGenresAllowAllGearGenres = 99] = "PlaceGearGenresAllowAllGearGenres", n[n.PlaceGearTypes = 100] = "PlaceGearTypes", n[n.PlaceDownloadPermission = 101] = "PlaceDownloadPermission", n[n.PlaceGenre = 102] = "PlaceGenre", n[n.PlaceName = 103] = "PlaceName", n[n.PlaceDescription = 104] = "PlaceDescription", n[n.PlaceMaxVisitorCount = 105] = "PlaceMaxVisitorCount", n[n.PlaceSocialSlotsRobloxOptimized = 106] = "PlaceSocialSlotsRobloxOptimized", n[n.PlaceSocialSlotsDisabled = 107] = "PlaceSocialSlotsDisabled", n[n.PlaceSocialSlotsCustomize = 108] = "PlaceSocialSlotsCustomize", n[n.PlacePermissionsCreatePlaceAPI = 109] = "PlacePermissionsCreatePlaceAPI", n[n.PlacePermissionsSavePlaceAPI = 110] = "PlacePermissionsSavePlaceAPI", n[n.PlaceRevert = 111] = "PlaceRevert", n[n.PlaceShutDown = 112] = "PlaceShutDown", n[n.PlaceRestart = 113] = "PlaceRestart", n[n.PlaceThumbnailAltText = 114] = "PlaceThumbnailAltText", n[n.PlaceThumbnailAdded = 115] = "PlaceThumbnailAdded", n[n.PlaceThumbnailOrder = 116] = "PlaceThumbnailOrder", n[n.PlaceThumbnailDeleted = 117] = "PlaceThumbnailDeleted", n[n.PlaceAdded = 118] = "PlaceAdded", n[n.PlaceRemoved = 119] = "PlaceRemoved", n[n.PlacePublished = 120] = "PlacePublished", n[n.CompletedQuestionnaire = 121] = "CompletedQuestionnaire", n[n.MonetizationSettingsPrivateServerRequiresRobux = 122] = "MonetizationSettingsPrivateServerRequiresRobux", n[n.SecuritySettingsEditableMeshAndTextureAPIAccess = 123] = "SecuritySettingsEditableMeshAndTextureAPIAccess", n[n.PackagePublish = 124] = "PackagePublish", n[n.PackageManualUpdate = 125] = "PackageManualUpdate", n[n.PackageAutoUpdate = 126] = "PackageAutoUpdate", n[n.PackageAutoUpdateToggle = 127] = "PackageAutoUpdateToggle", n[n.RoleCreated = 128] = "RoleCreated", n[n.RoleDeleted = 129] = "RoleDeleted", n[n.RolePermissionsUpdated = 130] = "RolePermissionsUpdated", n[n.RoleNameUpdated = 131] = "RoleNameUpdated", n[n.MemberRemoved = 132] = "MemberRemoved", n[n.MemberInvited = 133] = "MemberInvited", n[n.InviteRevoked = 134] = "InviteRevoked", n[n.MemberJoined = 135] = "MemberJoined", n[n.RoleAssigned = 136] = "RoleAssigned", n[n.RoleUnassigned = 137] = "RoleUnassigned", n[n.GroupIconUpdated = 138] = "GroupIconUpdated", n[n.GroupNameUpdated = 139] = "GroupNameUpdated", n[n.GroupDescriptionUpdated = 140] = "GroupDescriptionUpdated", n[n.GroupSocialLinksUpdated = 141] = "GroupSocialLinksUpdated", n[n.GroupOwnerUpdated = 142] = "GroupOwnerUpdated", n[n.OneTimePayoutSent = 143] = "OneTimePayoutSent", n[n.PayoutsConfigured = 144] = "PayoutsConfigured", n[n.DraftCommit = 145] = "DraftCommit", n[n.ExperiencePermissionsUpdated = 146] = "ExperiencePermissionsUpdated", n[n.ExperienceCreated = 147] = "ExperienceCreated", n[n.AdCreated = 148] = "AdCreated", n[n.PlaceModerated = 149] = "PlaceModerated", n[n.AssetModerated = 150] = "AssetModerated", n[n.EscapeHatchSaveCopyToCloud = 151] = "EscapeHatchSaveCopyToCloud", n),
        r = ((t = {})[t.Universe = 0] = "Universe", t[t.Place = 1] = "Place", t[t.User = 2] = "User", t[t.Badge = 3] = "Badge", t[t.DeveloperProduct = 4] = "DeveloperProduct", t[t.GamePass = 5] = "GamePass", t[t.Group = 6] = "Group", t[t.Robux = 7] = "Robux", t[t.Asset = 8] = "Asset", t),
        o = ((i = {}).ExperienceConfiguration = "Experience Configuration", i.Localization = "Localization", i.Permissions = "Permissions", i.PlaceConfiguration = "Place Configuration", i.PlacePublish = "Place Publish", i.Content = "Content", i);
    let s = new Set([64, 88, 90, 91, 132, 133, 134, 135, 136, 137]);
    e.s(["A", () => o, "H", () => a, "x", () => r, "I", 0, ["Experience Configuration", "Permissions", "Place Configuration", "Place Publish", "Content"], "B", 0, {
        "Experience Configuration": "Label.ExperienceConfiguration",
        Localization: "Label.FilterOptionLocalization",
        Permissions: "Label.FilterOptionPermissions",
        "Place Configuration": "Label.FilterOptionPlaceConfiguration",
        "Place Publish": "Label.FilterOptionPlacePublish",
        Content: "Label.FilterOptionContent"
    }, "q", 0, {
        "Experience Configuration": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 121, 122, 123, 144, 148],
        Localization: [34, 35, 36, 37, 38, 41, 42, 43, 44, 45, 46, 47, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65],
        Permissions: [88, 89, 90, 91, 92, 93, 94, 146],
        "Place Configuration": [95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 117],
        "Place Publish": [118, 119, 120, 151],
        Content: [147, 149, 150]
    }, "z", 0, {
        Private: "Description.ActionPrivate",
        Public: "Description.ActionPublic",
        Friends: "Description.ActionFriendsTitle"
    }, "C", 0, s])
}, 582977, 581395, e => {
    "use strict";
    var n, t, i, a = e.i(62877),
        r = e.i(156071),
        o = e.i(415858),
        s = function(e, n) {
            return (s = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, n) {
                e.__proto__ = n
            } || function(e, n) {
                for (var t in n) Object.prototype.hasOwnProperty.call(n, t) && (e[t] = n[t])
            })(e, n)
        };

    function d(e, n) {
        if ("function" != typeof n && null !== n) throw TypeError("Class extends value " + String(n) + " is not a constructor or null");

        function t() {
            this.constructor = e
        }
        s(e, n), e.prototype = null === n ? Object.create(n) : (t.prototype = n.prototype, new t)
    }

    function u(e, n, t, i) {
        return new(t || (t = Promise))(function(a, r) {
            function o(e) {
                try {
                    d(i.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    d(i.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function d(e) {
                var n;
                e.done ? a(e.value) : ((n = e.value) instanceof t ? n : new t(function(e) {
                    e(n)
                })).then(o, s)
            }
            d((i = i.apply(e, n || [])).next())
        })
    }

    function l(e, n) {
        var t, i, a, r = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(d) {
                var u = [s, d];
                if (t) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (r = 0)), r;) try {
                    if (t = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                    switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                        case 0:
                        case 1:
                            a = u;
                            break;
                        case 4:
                            return r.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            r.label++, i = u[1], u = [0];
                            continue;
                        case 7:
                            u = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = r.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                r.label = u[1];
                                break
                            }
                            if (6 === u[0] && r.label < a[1]) {
                                r.label = a[1], a = u;
                                break
                            }
                            if (a && r.label < a[2]) {
                                r.label = a[2], r.ops.push(u);
                                break
                            }
                            a[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    u = n.call(e, r)
                } catch (e) {
                    u = [6, e], i = 0
                } finally {
                    t = a = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function c(e) {
        var n;
        return null == (n = e) ? n : {
            userId: n.userId,
            percentage: n.percentage
        }
    }

    function g(e) {
        if (void 0 !== e) return null === e ? null : {
            userId: e.userId,
            percentage: e.percentage
        }
    }

    function I(e, n) {
        return null == e ? e : {
            payouts: e.payouts.map(c)
        }
    }

    function v(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, o.u)(n, "id") ? n.id : void 0,
            organizationId: (0, o.u)(n, "organizationId") ? n.organizationId : void 0,
            recipientUserId: (0, o.u)(n, "recipientUserId") ? n.recipientUserId : void 0,
            senderUserId: (0, o.u)(n, "senderUserId") ? n.senderUserId : void 0,
            invitationStatusType: (0, o.u)(n, "invitationStatusType") ? n.invitationStatusType : void 0,
            updatedTime: (0, o.u)(n, "updatedTime") ? new Date(n.updatedTime) : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function p(e, n) {
        return null == e ? e : {
            invitations: e.invitations.map(v),
            pageToken: (0, o.u)(e, "pageToken") ? e.pageToken : void 0
        }
    }

    function h(e) {
        var n, t;
        return null == (n = e) ? n : {
            recipientUserId: n.recipientUserId,
            status: n.status,
            oneTimePayout: (0, o.u)(n, "oneTimePayout") ? null == (t = n.oneTimePayout) ? t : {
                amount: t.amount,
                createdAt: new Date(t.createdAt)
            } : void 0
        }
    }

    function z(e, n) {
        return null == e ? e : {
            payouts: e.payouts.map(h)
        }
    }
    var w = {
        Invalid: "Invalid",
        Blue: "Blue",
        LightBlue: "LightBlue",
        Green: "Green",
        LightGreen: "LightGreen",
        Purple: "Purple",
        LightPurple: "LightPurple",
        Yellow: "Yellow",
        LightYellow: "LightYellow",
        Orange: "Orange",
        LightOrange: "LightOrange",
        Red: "Red",
        LightRed: "LightRed",
        Pink: "Pink",
        LightPink: "LightPink",
        Teal: "Teal",
        LightTeal: "LightTeal",
        Standard: "Standard"
    };

    function m(e) {
        var n;
        return null == (n = e) ? n : {
            id: n.id,
            organizationId: n.organizationId,
            name: n.name,
            color: n.color,
            updatedTime: (0, o.u)(n, "updatedTime") ? null === n.updatedTime ? null : new Date(n.updatedTime) : void 0
        }
    }

    function R(e, n) {
        return null == e ? e : {
            roles: e.roles.map(m),
            pageToken: (0, o.u)(e, "pageToken") ? e.pageToken : void 0
        }
    }

    function f(e) {
        var n;
        return null == (n = e) ? n : {
            userId: (0, o.u)(n, "userId") ? n.userId : void 0,
            roles: (0, o.u)(n, "roles") ? null === n.roles ? null : n.roles.map(m) : void 0
        }
    }

    function P(e, n) {
        return null == e ? e : {
            users: e.users.map(f),
            pageToken: (0, o.u)(e, "pageToken") ? e.pageToken : void 0
        }
    }

    function O(e) {
        if (void 0 !== e) return null === e ? null : {
            name: e.name,
            color: e.color
        }
    }

    function S(e) {
        var n;
        return null == (n = e) ? n : {
            universeId: (0, o.u)(n, "UniverseId") ? n.UniverseId : void 0,
            percentage: (0, o.u)(n, "Percentage") ? n.Percentage : void 0
        }
    }

    function U(e) {
        var n;
        return null == (n = e) ? n : {
            isGranted: n.isGranted,
            canEdit: n.canEdit
        }
    }

    function y(e, n) {
        return null == e ? e : {
            permissions: (0, o.A)(e.permissions, U)
        }
    }

    function q(e) {
        var n;
        return null == (n = e) ? n : {
            id: (0, o.u)(n, "id") ? n.id : void 0,
            name: (0, o.u)(n, "name") ? n.name : void 0
        }
    }

    function G(e, n) {
        return null == e ? e : {
            id: e.id,
            groupId: e.groupId
        }
    }

    function b(e) {
        if (void 0 !== e) return null === e ? null : {
            isGranted: e.isGranted
        }
    }

    function C(e, n) {
        return null == e ? e : {
            success: e.success
        }
    }

    function T(e) {
        if (void 0 !== e) return null === e ? null : {
            permissions: (0, o.A)(e.permissions, b)
        }
    }
    var A = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return d(n, e), n.prototype.v1OrganizationsOrganizationIdPayoutsLatestGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdPayoutsLatestGet.");
                                return t = {}, e.userIds && (t.userIds = e.userIds), i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/payouts/latest".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/payouts/latest",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return z(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdPayoutsLatestGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdPayoutsLatestGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdPayoutsSuggestedGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdPayoutsSuggestedGet.");
                                return t = {}, i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/payouts/suggested".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/payouts/suggested",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return z(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdPayoutsSuggestedGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdPayoutsSuggestedGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdPayoutsUniverseIdGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdPayoutsUniverseIdGet.");
                                if (null === e.universeId || void 0 === e.universeId) throw new o.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1OrganizationsOrganizationIdPayoutsUniverseIdGet.");
                                return t = {}, i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/payouts/{universeId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/organizations/{organizationId}/payouts/{universeId}",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdPayoutsUniverseIdGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdPayoutsUniverseIdGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdPayoutsUniverseIdPatchRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdPayoutsUniverseIdPatch.");
                                if (null === e.universeId || void 0 === e.universeId) throw new o.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1OrganizationsOrganizationIdPayoutsUniverseIdPatch.");
                                if (null === e.updateUniverseRecurringPayoutsRequestModel || void 0 === e.updateUniverseRecurringPayoutsRequestModel) throw new o.w("updateUniverseRecurringPayoutsRequestModel", "Required parameter requestParameters.updateUniverseRecurringPayoutsRequestModel was null or undefined when calling v1OrganizationsOrganizationIdPayoutsUniverseIdPatch.");
                                return t = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/organizations/{organizationId}/payouts/{universeId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/organizations/{organizationId}/payouts/{universeId}",
                                    method: "PATCH",
                                    headers: i,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            payouts: e.payouts.map(g)
                                        }
                                    }(e.updateUniverseRecurringPayoutsRequestModel)
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdPayoutsUniverseIdPatch = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdPayoutsUniverseIdPatchRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdPayoutsUniversesGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdPayoutsUniversesGet.");
                                return t = {}, void 0 !== e.limit && (t.limit = e.limit), void 0 !== e.cursor && (t.cursor = e.cursor), void 0 !== e.previous && (t.previous = e.previous), i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/payouts/universes".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/payouts/universes",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    var n;
                                    return null == e ? e : {
                                        data: (0, o.u)(e, "data") ? null == (n = e.data) ? n : {
                                            records: (0, o.u)(n, "Records") ? null === n.Records ? null : n.Records.map(S) : void 0,
                                            nextCursor: (0, o.u)(n, "NextCursor") ? n.NextCursor : void 0,
                                            previousCursor: (0, o.u)(n, "PreviousCursor") ? n.PreviousCursor : void 0,
                                            hasMore: (0, o.u)(n, "HasMore") ? n.HasMore : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdPayoutsUniversesGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdPayoutsUniversesGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n
        }(o._),
        M = (function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            d(n, e), n.prototype.v2GroupsPermissionsCreateassetsGetRaw = function(e) {
                return u(this, void 0, void 0, function() {
                    var n, t, i;
                    return l(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return n = {}, t = {}, [4, this.request({
                                    path: "/v2/groups/permissions/createassets",
                                    schemaPath: "/v2/groups/permissions/createassets",
                                    method: "GET",
                                    headers: t,
                                    query: n
                                }, e)];
                            case 1:
                                return i = a.sent(), [2, new o.H(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, o.u)(e, "data") ? null === e.data ? null : e.data.map(q) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.v2GroupsPermissionsCreateassetsGet = function(e) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2GroupsPermissionsCreateassetsGetRaw(e)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }
        }(o._), function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return d(n, e), n.prototype.v1OrganizationsOrganizationIdInvitationsGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsGet.");
                                return t = {}, void 0 !== e.maxPageSize && (t.MaxPageSize = e.maxPageSize), void 0 !== e.pageToken && (t.PageToken = e.pageToken), i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/invitations".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/invitations",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return p(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdInvitationsGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdInvitationsGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdDeleteRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdDelete.");
                                if (null === e.invitationId || void 0 === e.invitationId) throw new o.w("invitationId", "Required parameter requestParameters.invitationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdDelete.");
                                return t = {}, i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/invitations/{invitationId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("invitationId", "}"), encodeURIComponent(String(e.invitationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/invitations/{invitationId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return C(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdDelete = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdInvitationsInvitationIdDeleteRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.invitationId || void 0 === e.invitationId) throw new o.w("invitationId", "Required parameter requestParameters.invitationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdGet.");
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdGet.");
                                return t = {}, i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/invitations/{invitationId}".replace("{".concat("invitationId", "}"), encodeURIComponent(String(e.invitationId))).replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/invitations/{invitationId}",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdInvitationsInvitationIdGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdPatchRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.invitationId || void 0 === e.invitationId) throw new o.w("invitationId", "Required parameter requestParameters.invitationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdPatch.");
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdPatch.");
                                if (null === e.updateInvitationRequestModel || void 0 === e.updateInvitationRequestModel) throw new o.w("updateInvitationRequestModel", "Required parameter requestParameters.updateInvitationRequestModel was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdPatch.");
                                return t = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/organizations/{organizationId}/invitations/{invitationId}".replace("{".concat("invitationId", "}"), encodeURIComponent(String(e.invitationId))).replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/invitations/{invitationId}",
                                    method: "PATCH",
                                    headers: i,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            status: e.status
                                        }
                                    }(e.updateInvitationRequestModel)
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return C(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdPatch = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdInvitationsInvitationIdPatchRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.invitationId || void 0 === e.invitationId) throw new o.w("invitationId", "Required parameter requestParameters.invitationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet.");
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet.");
                                return t = {}, i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/invitations/{invitationId}/roleIds".replace("{".concat("invitationId", "}"), encodeURIComponent(String(e.invitationId))).replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/invitations/{invitationId}/roleIds",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return null == e ? e : {
                                        roleIds: e.roleIds
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdInvitationsPostRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdInvitationsPost.");
                                if (null === e.createInvitationRequestModel || void 0 === e.createInvitationRequestModel) throw new o.w("createInvitationRequestModel", "Required parameter requestParameters.createInvitationRequestModel was null or undefined when calling v1OrganizationsOrganizationIdInvitationsPost.");
                                return t = {}, void 0 !== e.isSecure && (t.isSecure = e.isSecure), (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/organizations/{organizationId}/invitations".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/invitations",
                                    method: "POST",
                                    headers: i,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            recipientUserId: e.recipientUserId,
                                            roleIds: e.roleIds
                                        }
                                    }(e.createInvitationRequestModel)
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdInvitationsPost = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdInvitationsPostRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n
        }(o._)),
        D = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return d(n, e), n.prototype.v1OrganizationsGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new o.w("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1OrganizationsGet.");
                                return t = {}, void 0 !== e.groupId && (t.groupId = e.groupId), i = {}, [4, this.request({
                                    path: "/v1/organizations",
                                    schemaPath: "/v1/organizations",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return G(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsPostRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.createOrganizationRequestModel || void 0 === e.createOrganizationRequestModel) throw new o.w("createOrganizationRequestModel", "Required parameter requestParameters.createOrganizationRequestModel was null or undefined when calling v1OrganizationsPost.");
                                return t = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/organizations",
                                    schemaPath: "/v1/organizations",
                                    method: "POST",
                                    headers: i,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            groupId: e.groupId
                                        }
                                    }(e.createOrganizationRequestModel)
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return G(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsPost = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsPostRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n
        }(o._),
        E = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return d(n, e), n.prototype.v1OrganizationsOrganizationIdRolesGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesGet.");
                                return t = {}, void 0 !== e.maxPageSize && (t.MaxPageSize = e.maxPageSize), void 0 !== e.pageToken && (t.PageToken = e.pageToken), i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return R(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesPostRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesPost.");
                                if (null === e.createOrUpdateRoleRequestModel || void 0 === e.createOrUpdateRoleRequestModel) throw new o.w("createOrUpdateRoleRequestModel", "Required parameter requestParameters.createOrUpdateRoleRequestModel was null or undefined when calling v1OrganizationsOrganizationIdRolesPost.");
                                return t = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles",
                                    method: "POST",
                                    headers: i,
                                    query: t,
                                    body: O(e.createOrUpdateRoleRequestModel)
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesPost = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesPostRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesRoleIdDeleteRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdDelete.");
                                if (null === e.roleId || void 0 === e.roleId) throw new o.w("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdDelete.");
                                return t = {}, i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles/{roleId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles/{roleId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return C(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesRoleIdDelete = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesRoleIdDeleteRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet.");
                                if (null === e.roleId || void 0 === e.roleId) throw new o.w("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet.");
                                return t = {}, void 0 !== e.maxPageSize && (t.MaxPageSize = e.maxPageSize), void 0 !== e.pageToken && (t.PageToken = e.pageToken), i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles/{roleId}/invitations".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles/{roleId}/invitations",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return p(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesRoleIdMetadataGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdMetadataGet.");
                                if (null === e.roleId || void 0 === e.roleId) throw new o.w("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdMetadataGet.");
                                return t = {}, void 0 !== e.isDefault && (t.isDefault = e.isDefault), i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles/{roleId}/metadata".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles/{roleId}/metadata",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesRoleIdMetadataGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesRoleIdMetadataGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatchRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch.");
                                if (null === e.roleId || void 0 === e.roleId) throw new o.w("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch.");
                                if (null === e.createOrUpdateRoleRequestModel || void 0 === e.createOrUpdateRoleRequestModel) throw new o.w("createOrUpdateRoleRequestModel", "Required parameter requestParameters.createOrUpdateRoleRequestModel was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch.");
                                return t = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles/{roleId}/metadata".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles/{roleId}/metadata",
                                    method: "PATCH",
                                    headers: i,
                                    query: t,
                                    body: O(e.createOrUpdateRoleRequestModel)
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatchRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesRoleIdPositionPatchRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdPositionPatch.");
                                if (null === e.roleId || void 0 === e.roleId) throw new o.w("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdPositionPatch.");
                                return t = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles/{roleId}/position".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles/{roleId}/position",
                                    method: "PATCH",
                                    headers: i,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            previousRoleId: e.previousRoleId,
                                            nextRoleId: e.nextRoleId
                                        }
                                    }(e.updateRolePositionRequestModel)
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return C(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesRoleIdPositionPatch = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesRoleIdPositionPatchRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesRoleIdUsersGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdUsersGet.");
                                if (null === e.roleId || void 0 === e.roleId) throw new o.w("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdRolesRoleIdUsersGet.");
                                return t = {}, void 0 !== e.maxPageSize && (t.MaxPageSize = e.maxPageSize), void 0 !== e.pageToken && (t.PageToken = e.pageToken), void 0 !== e.isDefault && (t.isDefault = e.isDefault), i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/roles/{roleId}/users".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v1/organizations/{organizationId}/roles/{roleId}/users",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return P(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdRolesRoleIdUsersGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdRolesRoleIdUsersGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v2OrganizationsOrganizationIdRolesRoleIdPermissionsGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v2OrganizationsOrganizationIdRolesRoleIdPermissionsGet.");
                                if (null === e.roleId || void 0 === e.roleId) throw new o.w("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v2OrganizationsOrganizationIdRolesRoleIdPermissionsGet.");
                                return t = {}, void 0 !== e.isDefault && (t.isDefault = e.isDefault), i = {}, [4, this.request({
                                    path: "/v2/organizations/{organizationId}/roles/{roleId}/permissions".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v2/organizations/{organizationId}/roles/{roleId}/permissions",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v2OrganizationsOrganizationIdRolesRoleIdPermissionsGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2OrganizationsOrganizationIdRolesRoleIdPermissionsGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v2OrganizationsOrganizationIdRolesRoleIdPermissionsPostRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v2OrganizationsOrganizationIdRolesRoleIdPermissionsPost.");
                                if (null === e.roleId || void 0 === e.roleId) throw new o.w("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v2OrganizationsOrganizationIdRolesRoleIdPermissionsPost.");
                                if (null === e.updatePermissionsRequestModel || void 0 === e.updatePermissionsRequestModel) throw new o.w("updatePermissionsRequestModel", "Required parameter requestParameters.updatePermissionsRequestModel was null or undefined when calling v2OrganizationsOrganizationIdRolesRoleIdPermissionsPost.");
                                return t = {}, void 0 !== e.isDefault && (t.isDefault = e.isDefault), void 0 !== e.isSecure && (t.isSecure = e.isSecure), (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v2/organizations/{organizationId}/roles/{roleId}/permissions".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v2/organizations/{organizationId}/roles/{roleId}/permissions",
                                    method: "POST",
                                    headers: i,
                                    query: t,
                                    body: T(e.updatePermissionsRequestModel)
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.V(a)]
                        }
                    })
                })
            }, n.prototype.v2OrganizationsOrganizationIdRolesRoleIdPermissionsPost = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2OrganizationsOrganizationIdRolesRoleIdPermissionsPostRaw(e, n)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, n
        }(o._),
        x = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return d(n, e), n.prototype.v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdGet.");
                                if (null === e.roleId || void 0 === e.roleId) throw new o.w("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdGet.");
                                if (null === e.universeId || void 0 === e.universeId) throw new o.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdGet.");
                                return t = {}, i = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions/organizations/{organizationId}/roles/{roleId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))).replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions/organizations/{organizationId}/roles/{roleId}",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdPostRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdPost.");
                                if (null === e.roleId || void 0 === e.roleId) throw new o.w("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdPost.");
                                if (null === e.universeId || void 0 === e.universeId) throw new o.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdPost.");
                                if (null === e.updatePermissionsRequestModel || void 0 === e.updatePermissionsRequestModel) throw new o.w("updatePermissionsRequestModel", "Required parameter requestParameters.updatePermissionsRequestModel was null or undefined when calling v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdPost.");
                                return t = {}, void 0 !== e.isSecure && (t.isSecure = e.isSecure), (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions/organizations/{organizationId}/roles/{roleId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))).replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions/organizations/{organizationId}/roles/{roleId}",
                                    method: "POST",
                                    headers: i,
                                    query: t,
                                    body: T(e.updatePermissionsRequestModel)
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.V(a)]
                        }
                    })
                })
            }, n.prototype.v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdPost = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsOrganizationsOrganizationIdRolesRoleIdPostRaw(e, n)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, n.prototype.v2UniversesUniverseIdPermissionsResolvedGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new o.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsResolvedGet.");
                                return t = {}, i = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions/resolved".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions/resolved",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return null == e ? e : {
                                        deleteDataStore: e.deleteDataStore,
                                        deleteDataStoreEntry: e.deleteDataStoreEntry,
                                        edit: e.edit,
                                        publish: e.publish,
                                        listDataStores: e.listDataStores,
                                        manageBans: e.manageBans,
                                        viewAnalytics: e.viewAnalytics,
                                        monetizeExperience: e.monetizeExperience,
                                        createSecrets: e.createSecrets,
                                        deleteSecrets: e.deleteSecrets,
                                        editSecrets: e.editSecrets,
                                        manageWebhooks: e.manageWebhooks,
                                        manageAlerts: e.manageAlerts
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.v2UniversesUniverseIdPermissionsResolvedGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsResolvedGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n
        }(o._),
        L = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return d(n, e), n.prototype.v1OrganizationsOrganizationIdUsersGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersGet.");
                                return t = {}, void 0 !== e.maxPageSize && (t.MaxPageSize = e.maxPageSize), void 0 !== e.pageToken && (t.PageToken = e.pageToken), i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return P(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersUserIdDeleteRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdDelete.");
                                if (null === e.userId || void 0 === e.userId) throw new o.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdDelete.");
                                return t = {}, i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users/{userId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users/{userId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return C(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersUserIdDelete = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersUserIdDeleteRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersUserIdInvitationsGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdInvitationsGet.");
                                if (null === e.userId || void 0 === e.userId) throw new o.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdInvitationsGet.");
                                return t = {}, i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users/{userId}/invitations".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users/{userId}/invitations",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersUserIdInvitationsGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersUserIdInvitationsGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersUserIdPermissionsGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdPermissionsGet.");
                                if (null === e.userId || void 0 === e.userId) throw new o.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdPermissionsGet.");
                                return t = {}, i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users/{userId}/permissions".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users/{userId}/permissions",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return null == e ? e : {
                                        isOwner: e.isOwner,
                                        canConfigureOrganization: e.canConfigureOrganization,
                                        assignableRoleIds: e.assignableRoleIds,
                                        canViewRoleSettings: e.canViewRoleSettings,
                                        canViewRolePermissions: e.canViewRolePermissions,
                                        permissionEditableRoleIds: e.permissionEditableRoleIds,
                                        metadataEditableRoleIds: e.metadataEditableRoleIds,
                                        canCreateRoles: e.canCreateRoles,
                                        canDeleteRoles: e.canDeleteRoles,
                                        canManageMembers: e.canManageMembers,
                                        canViewAuditLogs: e.canViewAuditLogs,
                                        canViewAnalytics: e.canViewAnalytics,
                                        canViewExperiences: e.canViewExperiences,
                                        canConfigureRevenueDetails: e.canConfigureRevenueDetails,
                                        canViewRevenueDetails: e.canViewRevenueDetails,
                                        canAdvertiseGroup: e.canAdvertiseGroup,
                                        canViewAssets: e.canViewAssets,
                                        canCreateAssets: e.canCreateAssets,
                                        canConfigureAssets: e.canConfigureAssets,
                                        canManageAssetPermissions: e.canManageAssetPermissions,
                                        canMonetizeAssets: e.canMonetizeAssets,
                                        canManageUniverseBans: e.canManageUniverseBans,
                                        canManageExperienceEvents: e.canManageExperienceEvents,
                                        canManageGroupFeatures: e.canManageGroupFeatures
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersUserIdPermissionsGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersUserIdPermissionsGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersUserIdPostRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdPost.");
                                if (null === e.userId || void 0 === e.userId) throw new o.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdPost.");
                                return t = {}, i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users/{userId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users/{userId}",
                                    method: "POST",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return C(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersUserIdPost = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersUserIdPostRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersUserIdRolesGetRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesGet.");
                                if (null === e.userId || void 0 === e.userId) throw new o.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesGet.");
                                return t = {}, void 0 !== e.maxPageSize && (t.MaxPageSize = e.maxPageSize), void 0 !== e.pageToken && (t.PageToken = e.pageToken), i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users/{userId}/roles".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users/{userId}/roles",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return R(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersUserIdRolesGet = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersUserIdRolesGetRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDeleteRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete.");
                                if (null === e.roleId || void 0 === e.roleId) throw new o.w("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete.");
                                if (null === e.userId || void 0 === e.userId) throw new o.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete.");
                                return t = {}, i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users/{userId}/roles/{roleId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users/{userId}/roles/{roleId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return C(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDeleteRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPostRaw = function(e, n) {
                return u(this, void 0, void 0, function() {
                    var t, i, a;
                    return l(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.organizationId || void 0 === e.organizationId) throw new o.w("organizationId", "Required parameter requestParameters.organizationId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost.");
                                if (null === e.roleId || void 0 === e.roleId) throw new o.w("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost.");
                                if (null === e.userId || void 0 === e.userId) throw new o.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost.");
                                return t = {}, void 0 !== e.isSecure && (t.isSecure = e.isSecure), i = {}, [4, this.request({
                                    path: "/v1/organizations/{organizationId}/users/{userId}/roles/{roleId}".replace("{".concat("organizationId", "}"), encodeURIComponent(String(e.organizationId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/organizations/{organizationId}/users/{userId}/roles/{roleId}",
                                    method: "POST",
                                    headers: i,
                                    query: t
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new o.H(a, function(e) {
                                    return C(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost = function(e, n) {
                return u(this, void 0, void 0, function() {
                    return l(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPostRaw(e, n)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, n
        }(o._);
    e.s(["B", 0, A, "R", 0, M, "P", 0, {
        Invalid: "Invalid",
        Open: "Open",
        Accepted: "Accepted",
        Declined: "Declined",
        Deleted: "Deleted"
    }, "f", 0, D, "U", 0, E, "_", 0, w, "G", 0, x, "V", 0, L], 581395);
    var k = e.i(718067);
    let H = new Map([
            ["Facebook", /^\s*((http|https):\/\/)?(www\.)?facebook\.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[?\w-]*\/)?(?:profile\.php\?id=(?=\d.*))?([\w-]*)\s*$/],
            ["Twitter", /^\s*(((http|https):\/\/)?(www\.)?(twitter\.com|x\.com)\/|@)([a-zA-Z0-9_]{1,15})\s*$/],
            ["YouTube", /^((http|https):\/\/)?(www\.)?youtube\.com\/(?!logout(\/|$))[@a-zA-Z0-9\-/_]+$/],
            ["Twitch", /^\s*((http|https):\/\/)?(www\.)?twitch\.tv\/[a-zA-Z0-9\-/_]+\s*$/],
            ["GooglePlus", /{}/],
            ["Discord", /^\s*((http|https):\/\/)?(www\.)?discord\.(gg|io|me|li)\/[a-zA-Z0-9\-_/]+\s*$/],
            ["RobloxGroup", /^\s*(?:https?):\/\/(?:[a-z0-9-]{2,}\.)*(?:roblox(labs)?\.com\/)(?:[Gg]roups\/[Gg]roup\.aspx\?gid=|[Mm]y\/[Gg]roups\.aspx\?gid=|groups\/|communities\/)([\d]+)\s*$/],
            ["Amazon", /^((https?):\/\/)?(www\.)?amazon\.com\/stores\/page\/[\w\-/]+(\?[\w\-/]+(=[\w\-/]*)?(&[\w\-/]+(=[\w\-/]*)?)*)?$/]
        ]),
        F = new Map([
            [a.M.NUMBER_0, "Facebook"],
            [a.M.NUMBER_1, "Twitter"],
            [a.M.NUMBER_2, "YouTube"],
            [a.M.NUMBER_3, "Twitch"],
            [a.M.NUMBER_4, "GooglePlus"],
            [a.M.NUMBER_5, "Discord"],
            [a.M.NUMBER_6, "RobloxGroup"],
            [a.M.NUMBER_7, "Amazon"]
        ]),
        B = new Map([
            [w.Invalid, "A1A2A5"],
            [w.Blue, "00A2FF"],
            [w.LightBlue, "55C1FF"],
            [w.Green, "00B864"],
            [w.LightGreen, "26FF9C"],
            [w.Purple, "9E78EC"],
            [w.LightPurple, "B69AF1"],
            [w.Yellow, "D8A009"],
            [w.LightYellow, "F7C744"],
            [w.Orange, "EF7A36"],
            [w.LightOrange, "F29057"],
            [w.Red, "F2453D"],
            [w.LightRed, "F4645D"],
            [w.Pink, "E245CD"],
            [w.LightPink, "EC83DE"],
            [w.Teal, "00D0D0"],
            [w.LightTeal, "36FFFF"],
            [w.Standard, "FFFFFF"]
        ]),
        N = [w.Blue, w.Green, w.Purple, w.Yellow, w.Orange, w.Red, w.Pink, w.Teal];
    var _ = ((n = _ || {}).Creator = "Creator", n.Content = "Content", n.Membership = "Membership", n.Monetization = "Monetization", n.GroupSettings = "GroupSettings", n.Roles = "Roles", n.GroupMembers = "GroupMembers", n),
        j = ((t = j || {}).CreateOrDeleteRoles = "CreateOrDeleteRoles", t.ConfigureRolesPermissions = "ConfigureRolesPermissions", t.ConfigureRolesSettings = "ConfigureRolesSettings", t.CreateExperience = "CreateExperience", t.UploadAsset = "UploadAsset", t.Invitation = "Invitation", t.ManageMembers = "ManageMembers", t.RoleAssignment = "RoleAssignment", t.SendOneTimePayout = "SendOneTimePayout", t.ConfigureRecurringPayouts = "ConfigureRecurringPayouts", t.GroupInformationUpdate = "GroupInformationUpdate", t.TransferOwnership = "TransferOwnership", t.SpendGroupFunds = "SpendGroupFunds", t.AdCreated = "AdCreated", t.AssetModerated = "AssetModerated", t),
        V = ((i = V || {}).Members = "Members", i.Invited = "Invited", i);
    let W = {
            CreateOrDeleteRoles: [k.H.RoleCreated, k.H.RoleDeleted],
            ConfigureRolesPermissions: [k.H.RolePermissionsUpdated, k.H.ExperiencePermissionsUpdated, r.D.UpdateRoleSetPermissions],
            ConfigureRolesSettings: [k.H.RoleNameUpdated, r.D.UpdateRolesetData, r.D.UpdateRoleSetPosition],
            Invitation: [k.H.MemberInvited, k.H.InviteRevoked],
            ManageMembers: [r.D.JoinGroup, r.D.LeaveGroup, r.D.RemoveMember],
            RoleAssignment: [k.H.RoleAssigned, k.H.RoleUnassigned],
            SendOneTimePayout: [k.H.OneTimePayoutSent],
            GroupInformationUpdate: [r.D.Rename, r.D.UpdateGroupIcon],
            TransferOwnership: [r.D.ChangeOwner],
            CreateExperience: [k.H.ExperienceCreated],
            UploadAsset: [r.D.CreateGroupAsset],
            ConfigureRecurringPayouts: [k.H.PayoutsConfigured],
            AssetModerated: [k.H.AssetModerated, k.H.PlaceModerated],
            SpendGroupFunds: [r.D.SpendGroupFunds],
            AdCreated: [r.D.BuyAd]
        },
        Y = new Set([k.H.ExperiencePermissionsUpdated, k.H.ExperienceCreated, k.H.PayoutsConfigured, k.H.PlaceModerated]);
    e.s(["f", 0, 20, "H", 0, "12884901889", "R", 0, W, "g", 0, {
        Creator: [],
        Content: [],
        Membership: ["Roles", "GroupMembers"],
        Monetization: [],
        GroupSettings: [],
        Roles: [],
        GroupMembers: []
    }, "O", () => _, "j", 0, {
        Creator: [],
        Content: ["UploadAsset", "CreateExperience", "AssetModerated"],
        Membership: [],
        Monetization: ["SpendGroupFunds", "ConfigureRecurringPayouts", "AdCreated"],
        GroupSettings: ["GroupInformationUpdate", "TransferOwnership"],
        Roles: ["CreateOrDeleteRoles", "ConfigureRolesPermissions", "ConfigureRolesSettings"],
        GroupMembers: ["Invitation", "RoleAssignment", "ManageMembers"]
    }, "V", 0, {
        Creator: "Label.FilterOptionCreator",
        Content: "Label.FilterOptionContent",
        Membership: "Label.FilterOptionMembership",
        Monetization: "Label.FilterOptionMonetization",
        GroupSettings: "Label.FilterOptionGroupSettings",
        Roles: "Label.FilterOptionRoles",
        GroupMembers: "Label.FilterOptionGroupMembers",
        CreateOrDeleteRoles: "Label.FilterOptionCreateOrDeleteRoles",
        ConfigureRolesPermissions: "Label.FilterOptionConfigureRolesPermissions",
        ConfigureRolesSettings: "Label.FilterOptionConfigureRolesSettings",
        CreateExperience: "Label.FilterOptionCreateExperience",
        UploadAsset: "Label.FilterOptionUploadAsset",
        Invitation: "Label.FilterOptionInvitation",
        ManageMembers: "Label.FilterOptionManageMembers",
        RoleAssignment: "Label.FilterOptionRoleAssignment",
        SendOneTimePayout: "Label.FilterOptionSendOneTimePayout",
        ConfigureRecurringPayouts: "Label.FilterOptionConfigureRecurringPayouts",
        GroupInformationUpdate: "Label.FilterOptionGroupInformationUpdate",
        TransferOwnership: "Label.FilterOptionTransferOwnership",
        SpendGroupFunds: "Label.FilterOptionSpendGroupFunds",
        AdCreated: "Label.FilterOptionAdCreated",
        AssetModerated: "Label.FilterOptionAssetModerated"
    }, "B", () => V, "S", 0, 100, "v", 0, H, "J", 0, F, "L", 0, "invitationGroupId", "Z", 0, 100, "r", 0, B, "k", 0, 3, "u", 0, N, "P", 0, 2592e6, "p", 0, function(e) {
        return new Date(e.getFullYear(), e.getMonth(), e.getDate(), 23, 59, 59, 999)
    }, "s", 0, Y], 582977)
}]);

//# debugId=8ac2f961-1058-6060-80d8-35d66cbdef75
//# sourceMappingURL=0b-qrkdcw1wij.js.map