;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "7938aef0-562d-deaa-44bd-e9e8349f157e")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 718067, e => {
    "use strict";
    var t, i, a, n = ((t = {})[t.Unknown = -1] = "Unknown", t[t.Init = 0] = "Init", t[t.ArchivedExperience = 1] = "ArchivedExperience", t[t.PlayabilityChanged = 2] = "PlayabilityChanged", t[t.NotificationStringCreated = 3] = "NotificationStringCreated", t[t.NotificationStringDeleted = 4] = "NotificationStringDeleted", t[t.NotificationStringUpdated = 5] = "NotificationStringUpdated", t[t.AvatarSettingsAvatarType = 6] = "AvatarSettingsAvatarType", t[t.AvatarSettingsAnimation = 7] = "AvatarSettingsAnimation", t[t.AvatarSettingsCollision = 8] = "AvatarSettingsCollision", t[t.AvatarSettingsScaleHeight = 9] = "AvatarSettingsScaleHeight", t[t.AvatarSettingsScaleWidth = 10] = "AvatarSettingsScaleWidth", t[t.AvatarSettingsScaleHead = 11] = "AvatarSettingsScaleHead", t[t.AvatarSettingsScaleBodyType = 12] = "AvatarSettingsScaleBodyType", t[t.AvatarSettingsScaleProportions = 13] = "AvatarSettingsScaleProportions", t[t.AvatarSettingsBodyParts = 14] = "AvatarSettingsBodyParts", t[t.AvatarSettingsClothing = 15] = "AvatarSettingsClothing", t[t.ExperienceName = 16] = "ExperienceName", t[t.ExperienceDescription = 17] = "ExperienceDescription", t[t.ExperienceGenre = 18] = "ExperienceGenre", t[t.SecuritySettingsHTTPRequests = 19] = "SecuritySettingsHTTPRequests", t[t.SecuritySettingsStudioAccessToAPI = 20] = "SecuritySettingsStudioAccessToAPI", t[t.SecuritySettingsThirdPartySales = 21] = "SecuritySettingsThirdPartySales", t[t.SecuritySettingsThirdPartyTeleports = 22] = "SecuritySettingsThirdPartyTeleports", t[t.ExperienceShutDown = 23] = "ExperienceShutDown", t[t.SocialLinksAdded = 24] = "SocialLinksAdded", t[t.SocialLinksRemoved = 25] = "SocialLinksRemoved", t[t.SocialLinksUpdated = 26] = "SocialLinksUpdated", t[t.SpatialVoice = 27] = "SpatialVoice", t[t.WorldSettingsWorkSpaceGravity = 28] = "WorldSettingsWorkSpaceGravity", t[t.WorldSettingsJumpHeight = 29] = "WorldSettingsJumpHeight", t[t.WorldSettingsJumpPower = 30] = "WorldSettingsJumpPower", t[t.WorldSettingsWalkSpeed = 31] = "WorldSettingsWalkSpeed", t[t.WorldSettingsMaxSlopeAngle = 32] = "WorldSettingsMaxSlopeAngle", t[t.SentUpdate = 33] = "SentUpdate", t[t.SupportedLanguages = 34] = "SupportedLanguages", t[t.AutoTranslationExperienceInformation = 35] = "AutoTranslationExperienceInformation", t[t.AutoTranslationExperienceStringsAndProducts = 36] = "AutoTranslationExperienceStringsAndProducts", t[t.LocalizationSettingsAutomaticTextCapture = 37] = "LocalizationSettingsAutomaticTextCapture", t[t.LocalizationSettingsUserTranslatedContent = 38] = "LocalizationSettingsUserTranslatedContent", t[t.ClearUnmodifiedAutoCaptureEntries = 39] = "ClearUnmodifiedAutoCaptureEntries", t[t.AnalyticsReport = 40] = "AnalyticsReport", t[t.TranslationIconAdded = 41] = "TranslationIconAdded", t[t.TranslationIconDeleted = 42] = "TranslationIconDeleted", t[t.TranslationExperienceName = 43] = "TranslationExperienceName", t[t.TranslationExperienceDescription = 44] = "TranslationExperienceDescription", t[t.TranslationThumbnailAltText = 45] = "TranslationThumbnailAltText", t[t.TranslationThumbnailAdded = 46] = "TranslationThumbnailAdded", t[t.TranslationThumbnailDeleted = 47] = "TranslationThumbnailDeleted", t[t.TranslationThumbnailOrder = 48] = "TranslationThumbnailOrder", t[t.TranslationStringAdded = 49] = "TranslationStringAdded", t[t.TranslationStringDeleted = 50] = "TranslationStringDeleted", t[t.TranslationStringUpdated = 51] = "TranslationStringUpdated", t[t.TranslationBadgeIconDeleted = 52] = "TranslationBadgeIconDeleted", t[t.TranslationBadgeDescription = 53] = "TranslationBadgeDescription", t[t.TranslationBadgeIconAdded = 54] = "TranslationBadgeIconAdded", t[t.TranslationBadgeName = 55] = "TranslationBadgeName", t[t.TranslationDeveloperProductIconDeleted = 56] = "TranslationDeveloperProductIconDeleted", t[t.TranslationDeveloperProductDescription = 57] = "TranslationDeveloperProductDescription", t[t.TranslationDeveloperProductIconAdded = 58] = "TranslationDeveloperProductIconAdded", t[t.TranslationDeveloperProductName = 59] = "TranslationDeveloperProductName", t[t.TranslationGamePassIconDeleted = 60] = "TranslationGamePassIconDeleted", t[t.TranslationGamePassDescription = 61] = "TranslationGamePassDescription", t[t.TranslationGamePassIconAdded = 62] = "TranslationGamePassIconAdded", t[t.TranslationGamePassName = 63] = "TranslationGamePassName", t[t.UserTranslator = 64] = "UserTranslator", t[t.GroupTranslator = 65] = "GroupTranslator", t[t.ExperienceAdvertisement = 66] = "ExperienceAdvertisement", t[t.MonetizationSettingsAccessType = 67] = "MonetizationSettingsAccessType", t[t.MonetizationSettingsRequiresRobux = 68] = "MonetizationSettingsRequiresRobux", t[t.MonetizationSettingsRobuxPrice = 69] = "MonetizationSettingsRobuxPrice", t[t.MonetizationSettingsPlayableDevices = 70] = "MonetizationSettingsPlayableDevices", t[t.MonetizationSettingsAllowPrivateServers = 71] = "MonetizationSettingsAllowPrivateServers", t[t.MonetizationSettingsPrivateServerPrice = 72] = "MonetizationSettingsPrivateServerPrice", t[t.ExperienceSponsor = 73] = "ExperienceSponsor", t[t.BadgeName = 74] = "BadgeName", t[t.BadgeDescription = 75] = "BadgeDescription", t[t.BadgeIcon = 76] = "BadgeIcon", t[t.BadgeCreate = 77] = "BadgeCreate", t[t.DeveloperProductName = 78] = "DeveloperProductName", t[t.DeveloperProductDescription = 79] = "DeveloperProductDescription", t[t.DeveloperProductIcon = 80] = "DeveloperProductIcon", t[t.DeveloperProductPrice = 81] = "DeveloperProductPrice", t[t.DeveloperProductCreate = 82] = "DeveloperProductCreate", t[t.GamePassName = 83] = "GamePassName", t[t.GamePassDescription = 84] = "GamePassDescription", t[t.GamePassIcon = 85] = "GamePassIcon", t[t.GamePassPrice = 86] = "GamePassPrice", t[t.GamePassCreate = 87] = "GamePassCreate", t[t.PermissionsUserAdded = 88] = "PermissionsUserAdded", t[t.PermissionsGroupAdded = 89] = "PermissionsGroupAdded", t[t.PermissionsUserChanged = 90] = "PermissionsUserChanged", t[t.PermissionsUserRemoved = 91] = "PermissionsUserRemoved", t[t.PermissionsGroupChanged = 92] = "PermissionsGroupChanged", t[t.PermissionsGroupRemoved = 93] = "PermissionsGroupRemoved", t[t.TeamCreate = 94] = "TeamCreate", t[t.PlaceIconAutoGenerated = 95] = "PlaceIconAutoGenerated", t[t.PlaceIconChanged = 96] = "PlaceIconChanged", t[t.PlaceIconRemoved = 97] = "PlaceIconRemoved", t[t.PlaceGearGenresOnlyAllowFromExperiencesGenre = 98] = "PlaceGearGenresOnlyAllowFromExperiencesGenre", t[t.PlaceGearGenresAllowAllGearGenres = 99] = "PlaceGearGenresAllowAllGearGenres", t[t.PlaceGearTypes = 100] = "PlaceGearTypes", t[t.PlaceDownloadPermission = 101] = "PlaceDownloadPermission", t[t.PlaceGenre = 102] = "PlaceGenre", t[t.PlaceName = 103] = "PlaceName", t[t.PlaceDescription = 104] = "PlaceDescription", t[t.PlaceMaxVisitorCount = 105] = "PlaceMaxVisitorCount", t[t.PlaceSocialSlotsRobloxOptimized = 106] = "PlaceSocialSlotsRobloxOptimized", t[t.PlaceSocialSlotsDisabled = 107] = "PlaceSocialSlotsDisabled", t[t.PlaceSocialSlotsCustomize = 108] = "PlaceSocialSlotsCustomize", t[t.PlacePermissionsCreatePlaceAPI = 109] = "PlacePermissionsCreatePlaceAPI", t[t.PlacePermissionsSavePlaceAPI = 110] = "PlacePermissionsSavePlaceAPI", t[t.PlaceRevert = 111] = "PlaceRevert", t[t.PlaceShutDown = 112] = "PlaceShutDown", t[t.PlaceRestart = 113] = "PlaceRestart", t[t.PlaceThumbnailAltText = 114] = "PlaceThumbnailAltText", t[t.PlaceThumbnailAdded = 115] = "PlaceThumbnailAdded", t[t.PlaceThumbnailOrder = 116] = "PlaceThumbnailOrder", t[t.PlaceThumbnailDeleted = 117] = "PlaceThumbnailDeleted", t[t.PlaceAdded = 118] = "PlaceAdded", t[t.PlaceRemoved = 119] = "PlaceRemoved", t[t.PlacePublished = 120] = "PlacePublished", t[t.CompletedQuestionnaire = 121] = "CompletedQuestionnaire", t[t.MonetizationSettingsPrivateServerRequiresRobux = 122] = "MonetizationSettingsPrivateServerRequiresRobux", t[t.SecuritySettingsEditableMeshAndTextureAPIAccess = 123] = "SecuritySettingsEditableMeshAndTextureAPIAccess", t[t.PackagePublish = 124] = "PackagePublish", t[t.PackageManualUpdate = 125] = "PackageManualUpdate", t[t.PackageAutoUpdate = 126] = "PackageAutoUpdate", t[t.PackageAutoUpdateToggle = 127] = "PackageAutoUpdateToggle", t[t.RoleCreated = 128] = "RoleCreated", t[t.RoleDeleted = 129] = "RoleDeleted", t[t.RolePermissionsUpdated = 130] = "RolePermissionsUpdated", t[t.RoleNameUpdated = 131] = "RoleNameUpdated", t[t.MemberRemoved = 132] = "MemberRemoved", t[t.MemberInvited = 133] = "MemberInvited", t[t.InviteRevoked = 134] = "InviteRevoked", t[t.MemberJoined = 135] = "MemberJoined", t[t.RoleAssigned = 136] = "RoleAssigned", t[t.RoleUnassigned = 137] = "RoleUnassigned", t[t.GroupIconUpdated = 138] = "GroupIconUpdated", t[t.GroupNameUpdated = 139] = "GroupNameUpdated", t[t.GroupDescriptionUpdated = 140] = "GroupDescriptionUpdated", t[t.GroupSocialLinksUpdated = 141] = "GroupSocialLinksUpdated", t[t.GroupOwnerUpdated = 142] = "GroupOwnerUpdated", t[t.OneTimePayoutSent = 143] = "OneTimePayoutSent", t[t.PayoutsConfigured = 144] = "PayoutsConfigured", t[t.DraftCommit = 145] = "DraftCommit", t[t.ExperiencePermissionsUpdated = 146] = "ExperiencePermissionsUpdated", t[t.ExperienceCreated = 147] = "ExperienceCreated", t[t.AdCreated = 148] = "AdCreated", t[t.PlaceModerated = 149] = "PlaceModerated", t[t.AssetModerated = 150] = "AssetModerated", t[t.EscapeHatchSaveCopyToCloud = 151] = "EscapeHatchSaveCopyToCloud", t),
        o = ((i = {})[i.Universe = 0] = "Universe", i[i.Place = 1] = "Place", i[i.User = 2] = "User", i[i.Badge = 3] = "Badge", i[i.DeveloperProduct = 4] = "DeveloperProduct", i[i.GamePass = 5] = "GamePass", i[i.Group = 6] = "Group", i[i.Robux = 7] = "Robux", i[i.Asset = 8] = "Asset", i),
        r = ((a = {}).ExperienceConfiguration = "Experience Configuration", a.Localization = "Localization", a.Permissions = "Permissions", a.PlaceConfiguration = "Place Configuration", a.PlacePublish = "Place Publish", a.Content = "Content", a);
    let s = new Set([64, 88, 90, 91, 132, 133, 134, 135, 136, 137]);
    e.s(["Categories", () => r, "EventType", () => n, "ResourceType", () => o, "allCategoriesEnums", 0, ["Experience Configuration", "Permissions", "Place Configuration", "Place Publish", "Content"], "categoriesToTranslationKey", 0, {
        "Experience Configuration": "Label.ExperienceConfiguration",
        Localization: "Label.FilterOptionLocalization",
        Permissions: "Label.FilterOptionPermissions",
        "Place Configuration": "Label.FilterOptionPlaceConfiguration",
        "Place Publish": "Label.FilterOptionPlacePublish",
        Content: "Label.FilterOptionContent"
    }, "categoryEventMapping", 0, {
        "Experience Configuration": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 121, 122, 123, 144, 148],
        Localization: [34, 35, 36, 37, 38, 41, 42, 43, 44, 45, 46, 47, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65],
        Permissions: [88, 89, 90, 91, 92, 93, 94, 146],
        "Place Configuration": [95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 117],
        "Place Publish": [118, 119, 120, 151],
        Content: [147, 149, 150]
    }, "playabilityTranslationKeys", 0, {
        Private: "Description.ActionPrivate",
        Public: "Description.ActionPublic",
        Friends: "Description.ActionFriendsTitle"
    }, "usernameEvents", 0, s])
}, 582977, e => {
    "use strict";
    var t, i, a, n = e.i(520004),
        o = e.i(156071),
        r = e.i(581548),
        s = e.i(718067);
    let l = new Map([
            ["Facebook", /^\s*((http|https):\/\/)?(www\.)?facebook\.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[?\w-]*\/)?(?:profile\.php\?id=(?=\d.*))?([\w-]*)\s*$/],
            ["Twitter", /^\s*(((http|https):\/\/)?(www\.)?(twitter\.com|x\.com)\/|@)([a-zA-Z0-9_]{1,15})\s*$/],
            ["YouTube", /^((http|https):\/\/)?(www\.)?youtube\.com\/(?!logout(\/|$))[@a-zA-Z0-9\-/_]+$/],
            ["Twitch", /^\s*((http|https):\/\/)?(www\.)?twitch\.tv\/[a-zA-Z0-9\-/_]+\s*$/],
            ["GooglePlus", /{}/],
            ["Discord", /^\s*((http|https):\/\/)?(www\.)?discord\.(gg|io|me|li)\/[a-zA-Z0-9\-_/]+\s*$/],
            ["RobloxGroup", /^\s*(?:https?):\/\/(?:[a-z0-9-]{2,}\.)*(?:roblox(labs)?\.com\/)(?:[Gg]roups\/[Gg]roup\.aspx\?gid=|[Mm]y\/[Gg]roups\.aspx\?gid=|groups\/|communities\/)([\d]+)\s*$/],
            ["Amazon", /^((https?):\/\/)?(www\.)?amazon\.com\/stores\/page\/[\w\-/]+(\?[\w\-/]+(=[\w\-/]*)?(&[\w\-/]+(=[\w\-/]*)?)*)?$/]
        ]),
        u = new Map([
            [n.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_0, "Facebook"],
            [n.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_1, "Twitter"],
            [n.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_2, "YouTube"],
            [n.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_3, "Twitch"],
            [n.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_4, "GooglePlus"],
            [n.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_5, "Discord"],
            [n.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_6, "RobloxGroup"],
            [n.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_7, "Amazon"]
        ]),
        d = new Map([
            [r.RoleColorType.Invalid, "A1A2A5"],
            [r.RoleColorType.Blue, "00A2FF"],
            [r.RoleColorType.LightBlue, "55C1FF"],
            [r.RoleColorType.Green, "00B864"],
            [r.RoleColorType.LightGreen, "26FF9C"],
            [r.RoleColorType.Purple, "9E78EC"],
            [r.RoleColorType.LightPurple, "B69AF1"],
            [r.RoleColorType.Yellow, "D8A009"],
            [r.RoleColorType.LightYellow, "F7C744"],
            [r.RoleColorType.Orange, "EF7A36"],
            [r.RoleColorType.LightOrange, "F29057"],
            [r.RoleColorType.Red, "F2453D"],
            [r.RoleColorType.LightRed, "F4645D"],
            [r.RoleColorType.Pink, "E245CD"],
            [r.RoleColorType.LightPink, "EC83DE"],
            [r.RoleColorType.Teal, "00D0D0"],
            [r.RoleColorType.LightTeal, "36FFFF"],
            [r.RoleColorType.Standard, "FFFFFF"]
        ]),
        p = [r.RoleColorType.Blue, r.RoleColorType.Green, r.RoleColorType.Purple, r.RoleColorType.Yellow, r.RoleColorType.Orange, r.RoleColorType.Red, r.RoleColorType.Pink, r.RoleColorType.Teal];
    var c = ((t = c || {}).Creator = "Creator", t.Content = "Content", t.Membership = "Membership", t.Monetization = "Monetization", t.GroupSettings = "GroupSettings", t.Roles = "Roles", t.GroupMembers = "GroupMembers", t),
        g = ((i = g || {}).CreateOrDeleteRoles = "CreateOrDeleteRoles", i.ConfigureRolesPermissions = "ConfigureRolesPermissions", i.ConfigureRolesSettings = "ConfigureRolesSettings", i.CreateExperience = "CreateExperience", i.UploadAsset = "UploadAsset", i.Invitation = "Invitation", i.ManageMembers = "ManageMembers", i.RoleAssignment = "RoleAssignment", i.SendOneTimePayout = "SendOneTimePayout", i.ConfigureRecurringPayouts = "ConfigureRecurringPayouts", i.GroupInformationUpdate = "GroupInformationUpdate", i.TransferOwnership = "TransferOwnership", i.SpendGroupFunds = "SpendGroupFunds", i.AdCreated = "AdCreated", i.AssetModerated = "AssetModerated", i),
        h = ((a = h || {}).Members = "Members", a.Invited = "Invited", a);
    let m = {
            CreateOrDeleteRoles: [s.EventType.RoleCreated, s.EventType.RoleDeleted],
            ConfigureRolesPermissions: [s.EventType.RolePermissionsUpdated, s.EventType.ExperiencePermissionsUpdated, o.GroupAuditLogActionTypeEnum.UpdateRoleSetPermissions],
            ConfigureRolesSettings: [s.EventType.RoleNameUpdated, o.GroupAuditLogActionTypeEnum.UpdateRolesetData, o.GroupAuditLogActionTypeEnum.UpdateRoleSetPosition],
            Invitation: [s.EventType.MemberInvited, s.EventType.InviteRevoked],
            ManageMembers: [o.GroupAuditLogActionTypeEnum.JoinGroup, o.GroupAuditLogActionTypeEnum.LeaveGroup, o.GroupAuditLogActionTypeEnum.RemoveMember],
            RoleAssignment: [s.EventType.RoleAssigned, s.EventType.RoleUnassigned],
            SendOneTimePayout: [s.EventType.OneTimePayoutSent],
            GroupInformationUpdate: [o.GroupAuditLogActionTypeEnum.Rename, o.GroupAuditLogActionTypeEnum.UpdateGroupIcon],
            TransferOwnership: [o.GroupAuditLogActionTypeEnum.ChangeOwner],
            CreateExperience: [s.EventType.ExperienceCreated],
            UploadAsset: [o.GroupAuditLogActionTypeEnum.CreateGroupAsset],
            ConfigureRecurringPayouts: [s.EventType.PayoutsConfigured],
            AssetModerated: [s.EventType.AssetModerated, s.EventType.PlaceModerated],
            SpendGroupFunds: [o.GroupAuditLogActionTypeEnum.SpendGroupFunds],
            AdCreated: [o.GroupAuditLogActionTypeEnum.BuyAd]
        },
        P = new Set([s.EventType.ExperiencePermissionsUpdated, s.EventType.ExperienceCreated, s.EventType.PayoutsConfigured, s.EventType.PlaceModerated]);
    e.s(["ActivityHistoryPageSize", 0, 20, "DefaultMemberIdPlaceholder", 0, "-1", "DefaultMemberRoleId", 0, "12884901889", "GroupActivityHistoryEventTypesMapping", 0, m, "GroupActivityHistoryFilterCategoriesMapping", 0, {
        Creator: [],
        Content: [],
        Membership: ["Roles", "GroupMembers"],
        Monetization: [],
        GroupSettings: [],
        Roles: [],
        GroupMembers: []
    }, "GroupActivityHistoryFilterDimensions", () => c, "GroupActivityHistoryFilterOptionsMapping", 0, {
        Creator: [],
        Content: ["UploadAsset", "CreateExperience", "AssetModerated"],
        Membership: [],
        Monetization: ["SpendGroupFunds", "ConfigureRecurringPayouts", "AdCreated"],
        GroupSettings: ["GroupInformationUpdate", "TransferOwnership"],
        Roles: ["CreateOrDeleteRoles", "ConfigureRolesPermissions", "ConfigureRolesSettings"],
        GroupMembers: ["Invitation", "RoleAssignment", "ManageMembers"]
    }, "GroupActivityHistoryFilterOptionsToTranslationKey", 0, {
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
    }, "GroupMembersMenuState", () => h, "GroupNameChangeCost", 0, 100, "GroupSocialLinkTypesPatternMap", 0, l, "GroupSocialLinkTypesToNameMap", 0, u, "InviteQueryKey", 0, "invitationGroupId", "MaximumRoles", 0, 99, "MembersPageSize", 0, 10, "MigratedGroupStatus", 0, "Migrated", "NewGroupPrice", 0, 100, "RoleColorTypeToHexMap", 0, d, "SocialLinksLimit", 0, 3, "SupportedRoleColorTypes", 0, p, "THIRTY_DAYS", 0, 2592e6, "getEndOfDay", 0, function(e) {
        return new Date(e.getFullYear(), e.getMonth(), e.getDate(), 23, 59, 59, 999)
    }, "noResultsIconPath", 0, "".concat("https://assets.create.roblox.com/45060ef210e7c81806370d564f9803e3f4295ceb/assets", "/group/no_results.svg"), "universeEvents", 0, P])
}, 592171, e => {
    "use strict";
    var t = e.i(591598);
    e.s(["DialogProvider", () => t.default])
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function i(e, t) {
        let {
            pages: i,
            pageParams: a
        } = t, n = i.length - 1;
        return i.length > 0 ? e.getNextPageParam(i[n], i, a[n], a) : void 0
    }

    function a(e, t) {
        var i;
        let {
            pages: a,
            pageParams: n
        } = t;
        return a.length > 0 ? null == (i = e.getPreviousPageParam) ? void 0 : i.call(e, a[0], a, n[0], n) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != i(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != a(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (n, o) => {
                var r, s, l, u, d;
                let p = n.options,
                    c = null == (l = n.fetchOptions) || null == (s = l.meta) || null == (r = s.fetchMore) ? void 0 : r.direction,
                    g = (null == (u = n.state.data) ? void 0 : u.pages) || [],
                    h = (null == (d = n.state.data) ? void 0 : d.pageParams) || [],
                    m = {
                        pages: [],
                        pageParams: []
                    },
                    P = 0,
                    y = async () => {
                        let o = !1,
                            r = (0, t.ensureQueryFn)(n.options, n.fetchOptions),
                            s = async (e, i, a) => {
                                let s;
                                if (o) return Promise.reject();
                                if (null == i && e.pages.length) return Promise.resolve(e);
                                let l = (Object.defineProperty(s = {
                                        client: n.client,
                                        queryKey: n.queryKey,
                                        pageParam: i,
                                        direction: a ? "backward" : "forward",
                                        meta: n.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (n.signal.aborted ? o = !0 : n.signal.addEventListener("abort", () => {
                                            o = !0
                                        }), n.signal)
                                    }), s),
                                    u = await r(l),
                                    {
                                        maxPages: d
                                    } = n.options,
                                    p = a ? t.addToStart : t.addToEnd;
                                return {
                                    pages: p(e.pages, u, d),
                                    pageParams: p(e.pageParams, i, d)
                                }
                            };
                        if (c && g.length) {
                            let e = "backward" === c,
                                t = {
                                    pages: g,
                                    pageParams: h
                                },
                                n = (e ? a : i)(p, t);
                            m = await s(t, n, e)
                        } else {
                            let t = null != e ? e : g.length;
                            do {
                                var l;
                                let e = 0 === P ? null != (l = h[0]) ? l : p.initialPageParam : i(p, m);
                                if (P > 0 && null == e) break;
                                m = await s(m, e), P++
                            } while (P < t)
                        }
                        return m
                    };
                n.options.persister ? n.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = n.options).persister) ? void 0 : e.call(t, y, {
                        client: n.client,
                        queryKey: n.queryKey,
                        meta: n.options.meta,
                        signal: n.signal
                    }, o)
                } : n.fetchFn = y
            }
        }
    }])
}, 387125, e => {
    "use strict";
    var t, i, a, n, o, r, s, l, u, d, p, c, g = e.i(711300),
        h = e.i(634203),
        m = e.i(35877),
        P = e.i(747304);

    function y(e, t) {
        var i = (0, P._)(e, t, "update");
        if (i.set) {
            if (!i.get) throw TypeError("attempted to read set only private field");
            return "__destrWrapper" in i || (i.__destrWrapper = {
                set value(v) {
                    i.set.call(e, v)
                },
                get value() {
                    return i.get.call(e)
                }
            }), i.__destrWrapper
        }
        if (!i.writable) throw TypeError("attempted to set read only private field");
        return i
    }
    var T = e.i(711367),
        f = e.i(772278),
        A = e.i(665564),
        S = e.i(211089),
        b = (t = new WeakMap, class extends S.Subscribable {
            build(e, t, i) {
                var a;
                let n = t.queryKey,
                    o = null != (a = t.queryHash) ? a : (0, T.hashQueryKeyByOptions)(n, t),
                    r = this.get(o);
                return r || (r = new f.Query({
                    client: e,
                    queryKey: n,
                    queryHash: o,
                    options: e.defaultQueryOptions(t),
                    state: i,
                    defaultOptions: e.getQueryDefaults(n)
                }), this.add(r)), r
            }
            add(e) {
                (0, g._)(this, t).has(e.queryHash) || ((0, g._)(this, t).set(e.queryHash, e), this.notify({
                    type: "added",
                    query: e
                }))
            }
            remove(e) {
                let i = (0, g._)(this, t).get(e.queryHash);
                i && (e.destroy(), i === e && (0, g._)(this, t).delete(e.queryHash), this.notify({
                    type: "removed",
                    query: e
                }))
            }
            clear() {
                A.notifyManager.batch(() => {
                    this.getAll().forEach(e => {
                        this.remove(e)
                    })
                })
            }
            get(e) {
                return (0, g._)(this, t).get(e)
            }
            getAll() {
                return [...(0, g._)(this, t).values()]
            }
            find(e) {
                let t = {
                    exact: !0,
                    ...e
                };
                return this.getAll().find(e => (0, T.matchQuery)(t, e))
            }
            findAll() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    t = this.getAll();
                return Object.keys(e).length > 0 ? t.filter(t => (0, T.matchQuery)(e, t)) : t
            }
            notify(e) {
                A.notifyManager.batch(() => {
                    this.listeners.forEach(t => {
                        t(e)
                    })
                })
            }
            onFocus() {
                A.notifyManager.batch(() => {
                    this.getAll().forEach(e => {
                        e.onFocus()
                    })
                })
            }
            onOnline() {
                A.notifyManager.batch(() => {
                    this.getAll().forEach(e => {
                        e.onOnline()
                    })
                })
            }
            constructor(e = {}) {
                super(), (0, h._)(this, t, {
                    writable: !0,
                    value: void 0
                }), this.config = e, (0, m._)(this, t, new Map)
            }
        }),
        C = e.i(436175),
        R = S,
        M = (i = new WeakMap, a = new WeakMap, n = new WeakMap, class extends R.Subscribable {
            build(e, t, i) {
                let a = new C.Mutation({
                    client: e,
                    mutationCache: this,
                    mutationId: ++y(this, n).value,
                    options: e.defaultMutationOptions(t),
                    state: i
                });
                return this.add(a), a
            }
            add(e) {
                (0, g._)(this, i).add(e);
                let t = G(e);
                if ("string" == typeof t) {
                    let i = (0, g._)(this, a).get(t);
                    i ? i.push(e) : (0, g._)(this, a).set(t, [e])
                }
                this.notify({
                    type: "added",
                    mutation: e
                })
            }
            remove(e) {
                if ((0, g._)(this, i).delete(e)) {
                    let t = G(e);
                    if ("string" == typeof t) {
                        let i = (0, g._)(this, a).get(t);
                        if (i)
                            if (i.length > 1) {
                                let t = i.indexOf(e); - 1 !== t && i.splice(t, 1)
                            } else i[0] === e && (0, g._)(this, a).delete(t)
                    }
                }
                this.notify({
                    type: "removed",
                    mutation: e
                })
            }
            canRun(e) {
                let t = G(e);
                if ("string" != typeof t) return !0;
                {
                    let i = (0, g._)(this, a).get(t),
                        n = null == i ? void 0 : i.find(e => "pending" === e.state.status);
                    return !n || n === e
                }
            }
            runNext(e) {
                let t = G(e);
                if ("string" != typeof t) return Promise.resolve();
                {
                    var i, n;
                    let o = null == (n = (0, g._)(this, a).get(t)) ? void 0 : n.find(t => t !== e && t.state.isPaused);
                    return null != (i = null == o ? void 0 : o.continue()) ? i : Promise.resolve()
                }
            }
            clear() {
                A.notifyManager.batch(() => {
                    (0, g._)(this, i).forEach(e => {
                        this.notify({
                            type: "removed",
                            mutation: e
                        })
                    }), (0, g._)(this, i).clear(), (0, g._)(this, a).clear()
                })
            }
            getAll() {
                return Array.from((0, g._)(this, i))
            }
            find(e) {
                let t = {
                    exact: !0,
                    ...e
                };
                return this.getAll().find(e => (0, T.matchMutation)(t, e))
            }
            findAll() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                return this.getAll().filter(t => (0, T.matchMutation)(e, t))
            }
            notify(e) {
                A.notifyManager.batch(() => {
                    this.listeners.forEach(t => {
                        t(e)
                    })
                })
            }
            resumePausedMutations() {
                let e = this.getAll().filter(e => e.state.isPaused);
                return A.notifyManager.batch(() => Promise.all(e.map(e => e.continue().catch(T.noop))))
            }
            constructor(e = {}) {
                super(), (0, h._)(this, i, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, n, {
                    writable: !0,
                    value: void 0
                }), this.config = e, (0, m._)(this, i, new Set), (0, m._)(this, a, new Map), (0, m._)(this, n, 0)
            }
        });

    function G(e) {
        var t;
        return null == (t = e.options.scope) ? void 0 : t.id
    }
    var E = e.i(549772),
        w = e.i(841246),
        D = e.i(117437),
        _ = (o = new WeakMap, r = new WeakMap, s = new WeakMap, l = new WeakMap, u = new WeakMap, d = new WeakMap, p = new WeakMap, c = new WeakMap, class {
            mount() {
                y(this, d).value++, 1 === (0, g._)(this, d) && ((0, m._)(this, p, E.focusManager.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, g._)(this, o).onFocus())
                })), (0, m._)(this, c, w.onlineManager.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, g._)(this, o).onOnline())
                })))
            }
            unmount() {
                var e, t;
                y(this, d).value--, 0 === (0, g._)(this, d) && (null == (e = (0, g._)(this, p)) || e.call(this), (0, m._)(this, p, void 0), null == (t = (0, g._)(this, c)) || t.call(this), (0, m._)(this, c, void 0))
            }
            isFetching(e) {
                return (0, g._)(this, o).findAll({
                    ...e,
                    fetchStatus: "fetching"
                }).length
            }
            isMutating(e) {
                return (0, g._)(this, r).findAll({
                    ...e,
                    status: "pending"
                }).length
            }
            getQueryData(e) {
                var t;
                let i = this.defaultQueryOptions({
                    queryKey: e
                });
                return null == (t = (0, g._)(this, o).get(i.queryHash)) ? void 0 : t.state.data
            }
            ensureQueryData(e) {
                let t = this.defaultQueryOptions(e),
                    i = (0, g._)(this, o).build(this, t),
                    a = i.state.data;
                return void 0 === a ? this.fetchQuery(e) : (e.revalidateIfStale && i.isStaleByTime((0, T.resolveStaleTime)(t.staleTime, i)) && this.prefetchQuery(t), Promise.resolve(a))
            }
            getQueriesData(e) {
                return (0, g._)(this, o).findAll(e).map(e => {
                    let {
                        queryKey: t,
                        state: i
                    } = e;
                    return [t, i.data]
                })
            }
            setQueryData(e, t, i) {
                let a = this.defaultQueryOptions({
                        queryKey: e
                    }),
                    n = (0, g._)(this, o).get(a.queryHash),
                    r = null == n ? void 0 : n.state.data,
                    s = (0, T.functionalUpdate)(t, r);
                if (void 0 !== s) return (0, g._)(this, o).build(this, a).setData(s, {
                    ...i,
                    manual: !0
                })
            }
            setQueriesData(e, t, i) {
                return A.notifyManager.batch(() => (0, g._)(this, o).findAll(e).map(e => {
                    let {
                        queryKey: a
                    } = e;
                    return [a, this.setQueryData(a, t, i)]
                }))
            }
            getQueryState(e) {
                var t;
                let i = this.defaultQueryOptions({
                    queryKey: e
                });
                return null == (t = (0, g._)(this, o).get(i.queryHash)) ? void 0 : t.state
            }
            removeQueries(e) {
                let t = (0, g._)(this, o);
                A.notifyManager.batch(() => {
                    t.findAll(e).forEach(e => {
                        t.remove(e)
                    })
                })
            }
            resetQueries(e, t) {
                let i = (0, g._)(this, o);
                return A.notifyManager.batch(() => (i.findAll(e).forEach(e => {
                    e.reset()
                }), this.refetchQueries({
                    type: "active",
                    ...e
                }, t)))
            }
            cancelQueries(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    i = {
                        revert: !0,
                        ...t
                    };
                return Promise.all(A.notifyManager.batch(() => (0, g._)(this, o).findAll(e).map(e => e.cancel(i)))).then(T.noop).catch(T.noop)
            }
            invalidateQueries(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                return A.notifyManager.batch(() => {
                    var i, a;
                    return ((0, g._)(this, o).findAll(e).forEach(e => {
                        e.invalidate()
                    }), (null == e ? void 0 : e.refetchType) === "none") ? Promise.resolve() : this.refetchQueries({
                        ...e,
                        type: null != (i = null != (a = null == e ? void 0 : e.refetchType) ? a : null == e ? void 0 : e.type) ? i : "active"
                    }, t)
                })
            }
            refetchQueries(e) {
                var t;
                let i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    a = {
                        ...i,
                        cancelRefetch: null == (t = i.cancelRefetch) || t
                    };
                return Promise.all(A.notifyManager.batch(() => (0, g._)(this, o).findAll(e).filter(e => !e.isDisabled() && !e.isStatic()).map(e => {
                    let t = e.fetch(void 0, a);
                    return a.throwOnError || (t = t.catch(T.noop)), "paused" === e.state.fetchStatus ? Promise.resolve() : t
                }))).then(T.noop)
            }
            fetchQuery(e) {
                let t = this.defaultQueryOptions(e);
                void 0 === t.retry && (t.retry = !1);
                let i = (0, g._)(this, o).build(this, t);
                return i.isStaleByTime((0, T.resolveStaleTime)(t.staleTime, i)) ? i.fetch(t) : Promise.resolve(i.state.data)
            }
            prefetchQuery(e) {
                return this.fetchQuery(e).then(T.noop).catch(T.noop)
            }
            fetchInfiniteQuery(e) {
                return e.behavior = (0, D.infiniteQueryBehavior)(e.pages), this.fetchQuery(e)
            }
            prefetchInfiniteQuery(e) {
                return this.fetchInfiniteQuery(e).then(T.noop).catch(T.noop)
            }
            ensureInfiniteQueryData(e) {
                return e.behavior = (0, D.infiniteQueryBehavior)(e.pages), this.ensureQueryData(e)
            }
            resumePausedMutations() {
                return w.onlineManager.isOnline() ? (0, g._)(this, r).resumePausedMutations() : Promise.resolve()
            }
            getQueryCache() {
                return (0, g._)(this, o)
            }
            getMutationCache() {
                return (0, g._)(this, r)
            }
            getDefaultOptions() {
                return (0, g._)(this, s)
            }
            setDefaultOptions(e) {
                (0, m._)(this, s, e)
            }
            setQueryDefaults(e, t) {
                (0, g._)(this, l).set((0, T.hashKey)(e), {
                    queryKey: e,
                    defaultOptions: t
                })
            }
            getQueryDefaults(e) {
                let t = [...(0, g._)(this, l).values()],
                    i = {};
                return t.forEach(t => {
                    (0, T.partialMatchKey)(e, t.queryKey) && Object.assign(i, t.defaultOptions)
                }), i
            }
            setMutationDefaults(e, t) {
                (0, g._)(this, u).set((0, T.hashKey)(e), {
                    mutationKey: e,
                    defaultOptions: t
                })
            }
            getMutationDefaults(e) {
                let t = [...(0, g._)(this, u).values()],
                    i = {};
                return t.forEach(t => {
                    (0, T.partialMatchKey)(e, t.mutationKey) && Object.assign(i, t.defaultOptions)
                }), i
            }
            defaultQueryOptions(e) {
                if (e._defaulted) return e;
                let t = {
                    ...(0, g._)(this, s).queries,
                    ...this.getQueryDefaults(e.queryKey),
                    ...e,
                    _defaulted: !0
                };
                return t.queryHash || (t.queryHash = (0, T.hashQueryKeyByOptions)(t.queryKey, t)), void 0 === t.refetchOnReconnect && (t.refetchOnReconnect = "always" !== t.networkMode), void 0 === t.throwOnError && (t.throwOnError = !!t.suspense), !t.networkMode && t.persister && (t.networkMode = "offlineFirst"), t.queryFn === T.skipToken && (t.enabled = !1), t
            }
            defaultMutationOptions(e) {
                return (null == e ? void 0 : e._defaulted) ? e : {
                    ...(0, g._)(this, s).mutations,
                    ...(null == e ? void 0 : e.mutationKey) && this.getMutationDefaults(e.mutationKey),
                    ...e,
                    _defaulted: !0
                }
            }
            clear() {
                (0, g._)(this, o).clear(), (0, g._)(this, r).clear()
            }
            constructor(e = {}) {
                (0, h._)(this, o, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, l, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, u, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, d, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, p, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, o, e.queryCache || new b), (0, m._)(this, r, e.mutationCache || new M), (0, m._)(this, s, e.defaultOptions || {}), (0, m._)(this, l, new Map), (0, m._)(this, u, new Map), (0, m._)(this, d, 0)
            }
        });
    e.s(["QueryClient", 0, _], 387125)
}]);

//# debugId=7938aef0-562d-deaa-44bd-e9e8349f157e
//# sourceMappingURL=23dtmnxw991z7.js.map