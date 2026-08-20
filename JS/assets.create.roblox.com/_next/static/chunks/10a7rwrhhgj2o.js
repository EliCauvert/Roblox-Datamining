;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "9ff32f76-a373-53e6-9793-b3a2cc99ab94")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 156071, e => {
    "use strict";
    var r = e.i(232060),
        t = e.i(206944),
        o = e.i(677753);
    let s = (0, e.i(272593).createClientConfiguration)("groups", "bedev1");
    class n extends o.BaseAPI {
        isAnnouncementEntry(e) {
            return !(null == e || "object" != typeof e || Array.isArray(e)) && "id" in e && "name" in e && "string" == typeof e.id && "string" == typeof e.name && e.id.length > 0 && e.name.length > 0
        }
        async getAnnouncementNames(e, r) {
            try {
                let t = await this.request({
                        path: "/v1/groups/".concat(e, "/announcements"),
                        method: "GET",
                        headers: {},
                        query: {
                            announcementIds: r
                        },
                        schemaPath: "/v1/groups/{groupId}/announcements"
                    }),
                    o = await t.json();
                if (null == o || "object" != typeof o || !("data" in o) || !Array.isArray(o.data)) return new Map;
                let s = new Map;
                for (let e of o.data) this.isAnnouncementEntry(e) && s.set(e.id, e.name);
                return s
            } catch (e) {
                return new Map
            }
        }
        constructor() {
            super(s)
        }
    }
    let i = new n,
        u = new r.GroupSearchApi(s),
        a = new r.GroupsApi(s),
        d = new t.GroupsV2Api(s),
        p = new r.GroupFeaturesApi(s),
        l = new r.RolesApi(s),
        c = new r.MembershipApi(s),
        v = new r.SocialLinksApi(s),
        h = new r.RevenueApi(s),
        I = new r.MigrationApi(s),
        g = {
            On: r.RobloxGroupsApiSetFeaturesRequestModelFeaturesPayoutsEnum.On,
            Blocked: r.RobloxGroupsApiSetFeaturesRequestModelFeaturesPayoutsEnum.Blocked
        },
        m = r.V1GroupsGroupIdAuditLogGetActionTypeEnum,
        R = r.V1GroupsGroupIdAuditLogGetLimitEnum,
        w = r.RobloxGroupsApiGroupFeatureResponseFeatureEnum;
    e.s(["GroupAuditLimitEnum", 0, R, "GroupAuditLogActionTypeEnum", 0, m, "GroupFeatureTypeEnum", 0, w, "SetGroupFeaturesEnum", 0, g, "default", 0, {
        searchGroups: (e, r, t) => u.v1GroupsSearchGet({
            keyword: e,
            limit: r,
            cursor: t
        }),
        getGroupInfo: e => a.v1GroupsGroupIdGet({
            groupId: e
        }),
        getGroupsInfo: e => 0 === e.length ? Promise.resolve({
            data: []
        }) : d.v2GroupsGet({
            groupIds: e
        }),
        getRolesInfo: e => l.v1RolesGet({
            ids: e
        }),
        getGroupRolesSetsInfo: e => c.v1GroupsGroupIdRolesGet({
            groupId: e
        }),
        getUsersGroupRoles: e => c.v1UsersUserIdGroupsRolesGet({
            userId: e
        }),
        getUsersGroupRolesV2(e) {
            let r = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                o = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                s = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : t.V2UsersUserIdGroupsRolesGetDiscoveryTypeEnum.NUMBER_0;
            return d.v2UsersUserIdGroupsRolesGet({
                userId: e,
                includeLocked: r,
                includeNotificationPreferences: o,
                discoveryType: s
            })
        },
        getGroupMembershipMetadata: e => c.v1GroupsGroupIdMembershipGet(e),
        patchGroupIcon: e => a.v1GroupsIconPatch(e),
        patchGroupName: e => a.v1GroupsGroupIdNamePatch(e),
        patchGroupDescription: e => a.v1GroupsGroupIdDescriptionPatch(e),
        createGroup: e => a.v1GroupsCreatePost(e),
        postGroupOwner: e => c.v1GroupsGroupIdChangeOwnerPost(e),
        getGroupSocialLinks: e => v.v1GroupsGroupIdSocialLinksGet({
            groupId: e
        }),
        patchGroupSocialLink: e => v.v1GroupsGroupIdSocialLinksSocialLinkIdPatch(e),
        postGroupSocialLink: e => v.v1GroupsGroupIdSocialLinksPost(e),
        deleteGroupSocialLink: e => v.v1GroupsGroupIdSocialLinksSocialLinkIdDelete(e),
        getGroupPayouts: e => h.v1GroupsGroupIdPayoutsGet({
            groupId: e
        }),
        updateGroupRecurringPayouts: (e, r) => h.v1GroupsGroupIdPayoutsRecurringPost({
            groupId: e,
            request: r
        }),
        updateGroupPayouts: (e, r) => h.v1GroupsGroupIdPayoutsPost({
            groupId: e,
            request: r
        }),
        getGroupPayoutRestriction: e => h.v1GroupsGroupIdPayoutRestrictionGet({
            groupId: e
        }),
        getGroupAuditLog: (e, r, t, o, s) => a.v1GroupsGroupIdAuditLogGet({
            groupId: e,
            actionType: r,
            userId: t,
            limit: o,
            cursor: s
        }),
        getGroupFeatures: e => p.v1GroupsGroupIdFeaturesGet({
            groupId: e
        }),
        getGroupFeaturesStatus: e => p.v1GroupsGroupIdFeaturesStatusGet({
            groupId: e
        }),
        setGroupFeatures: (e, r) => p.v1GroupsGroupIdFeaturesPatch({
            groupId: e,
            request: r
        }),
        getGroupMigrationStatus: e => I.v1GroupsGroupIdMigrationGet({
            groupId: e
        }),
        getGroupProductFeatures: e => a.v1GroupsGroupIdProductFeaturesGet({
            groupId: e
        }),
        getAnnouncementNames: (e, r) => i.getAnnouncementNames(e, r)
    }])
}, 232060, e => {
    "use strict";
    var r = e.i(677753),
        t = e.i(956378);

    function o(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            keyword: (0, r.exists)(t, "keyword") ? t.keyword : void 0,
            createdBy: (0, r.exists)(t, "createdBy") ? t.createdBy : void 0,
            isPrivate: (0, r.exists)(t, "isPrivate") ? t.isPrivate : void 0,
            createdAt: (0, r.exists)(t, "createdAt") ? new Date(t.createdAt) : void 0,
            updatedAt: (0, r.exists)(t, "updatedAt") ? new Date(t.updatedAt) : void 0
        }
    }

    function s(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            isOrgRole: (0, r.exists)(t, "isOrgRole") ? t.isOrgRole : void 0,
            permissions: (0, r.exists)(t, "permissions") ? t.permissions : void 0,
            color: (0, r.exists)(t, "color") ? t.color : void 0
        }
    }

    function n(e) {
        var t;
        return null == (t = e) ? t : {
            type: (0, r.exists)(t, "type") ? t.type : void 0,
            roles: (0, r.exists)(t, "roles") ? t.roles.map(s) : void 0
        }
    }

    function i(e) {
        var t;
        return null == (t = e) ? t : {
            feature: (0, r.exists)(t, "feature") ? t.feature : void 0,
            isFeatureBlocked: (0, r.exists)(t, "isFeatureBlocked") ? t.isFeatureBlocked : void 0,
            expiration: (0, r.exists)(t, "expiration") ? new Date(t.expiration) : void 0
        }
    }

    function u(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            type: (0, r.exists)(t, "type") ? t.type : void 0,
            url: (0, r.exists)(t, "url") ? t.url : void 0,
            title: (0, r.exists)(t, "title") ? t.title : void 0
        }
    }

    function a(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            description: (0, r.exists)(t, "description") ? t.description : void 0,
            rank: (0, r.exists)(t, "rank") ? t.rank : void 0,
            memberCount: (0, r.exists)(t, "memberCount") ? t.memberCount : void 0,
            isBase: (0, r.exists)(t, "isBase") ? t.isBase : void 0,
            color: (0, r.exists)(t, "color") ? t.color : void 0,
            isPrivate: (0, r.exists)(t, "isPrivate") ? t.isPrivate : void 0
        }
    }

    function d(e) {
        var t;
        return null == (t = e) ? t : {
            buildersClubMembershipType: (0, r.exists)(t, "buildersClubMembershipType") ? t.buildersClubMembershipType : void 0,
            hasVerifiedBadge: (0, r.exists)(t, "hasVerifiedBadge") ? t.hasVerifiedBadge : void 0,
            userId: (0, r.exists)(t, "userId") ? t.userId : void 0,
            username: (0, r.exists)(t, "username") ? t.username : void 0,
            displayName: (0, r.exists)(t, "displayName") ? t.displayName : void 0
        }
    }

    function p(e) {
        var t;
        return null == (t = e) ? t : {
            user: (0, r.exists)(t, "user") ? d(t.user) : void 0,
            role: (0, r.exists)(t, "role") ? a(t.role) : void 0
        }
    }

    function l(e) {
        var t;
        return null == (t = e) ? t : {
            actor: (0, r.exists)(t, "actor") ? p(t.actor) : void 0,
            actionType: (0, r.exists)(t, "actionType") ? t.actionType : void 0,
            description: (0, r.exists)(t, "description") ? t.description : void 0,
            created: (0, r.exists)(t, "created") ? new Date(t.created) : void 0
        }
    }

    function c(e) {
        var t;
        return null == (t = e) ? t : {
            user: (0, r.exists)(t, "user") ? d(t.user) : void 0,
            actingUser: (0, r.exists)(t, "actingUser") ? p(t.actingUser) : void 0,
            created: (0, r.exists)(t, "created") ? new Date(t.created) : void 0
        }
    }

    function v(e, t) {
        return null == e ? e : {
            viewForums: (0, r.exists)(e, "viewForums") ? e.viewForums : void 0,
            manageCategories: (0, r.exists)(e, "manageCategories") ? e.manageCategories : void 0,
            createPosts: (0, r.exists)(e, "createPosts") ? e.createPosts : void 0,
            removePosts: (0, r.exists)(e, "removePosts") ? e.removePosts : void 0,
            lockPosts: (0, r.exists)(e, "lockPosts") ? e.lockPosts : void 0,
            pinPosts: (0, r.exists)(e, "pinPosts") ? e.pinPosts : void 0,
            createComments: (0, r.exists)(e, "createComments") ? e.createComments : void 0,
            removeComments: (0, r.exists)(e, "removeComments") ? e.removeComments : void 0
        }
    }

    function h(e) {
        var t;
        return null == (t = e) ? t : {
            channelId: (0, r.exists)(t, "channelId") ? t.channelId : void 0,
            groupForumsPermissions: (0, r.exists)(t, "groupForumsPermissions") ? v(t.groupForumsPermissions) : void 0
        }
    }

    function I(e, t) {
        return null == e ? e : {
            body: (0, r.exists)(e, "body") ? e.body : void 0,
            poster: (0, r.exists)(e, "poster") ? d(e.poster) : void 0,
            created: (0, r.exists)(e, "created") ? new Date(e.created) : void 0,
            updated: (0, r.exists)(e, "updated") ? new Date(e.updated) : void 0
        }
    }

    function g(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            description: (0, r.exists)(t, "description") ? t.description : void 0,
            owner: (0, r.exists)(t, "owner") ? d(t.owner) : void 0,
            shout: (0, r.exists)(t, "shout") ? I(t.shout) : void 0,
            memberCount: (0, r.exists)(t, "memberCount") ? t.memberCount : void 0,
            isBuildersClubOnly: (0, r.exists)(t, "isBuildersClubOnly") ? t.isBuildersClubOnly : void 0,
            publicEntryAllowed: (0, r.exists)(t, "publicEntryAllowed") ? t.publicEntryAllowed : void 0,
            isLocked: (0, r.exists)(t, "isLocked") ? t.isLocked : void 0,
            hasVerifiedBadge: (0, r.exists)(t, "hasVerifiedBadge") ? t.hasVerifiedBadge : void 0,
            hasSocialModules: (0, r.exists)(t, "hasSocialModules") ? t.hasSocialModules : void 0
        }
    }

    function m(e) {
        var t;
        return null == (t = e) ? t : {
            requester: (0, r.exists)(t, "requester") ? d(t.requester) : void 0,
            created: (0, r.exists)(t, "created") ? new Date(t.created) : void 0
        }
    }

    function R(e) {
        var t;
        return null == (t = e) ? t : {
            type: (0, r.exists)(t, "type") ? t.type : void 0,
            enabled: (0, r.exists)(t, "enabled") ? t.enabled : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            description: (0, r.exists)(t, "description") ? t.description : void 0
        }
    }

    function w(e) {
        var t;
        return null == (t = e) ? t : {
            group: (0, r.exists)(t, "group") ? g(t.group) : void 0,
            role: (0, r.exists)(t, "role") ? a(t.role) : void 0,
            isPrimaryGroup: (0, r.exists)(t, "isPrimaryGroup") ? t.isPrimaryGroup : void 0,
            isNotificationsEnabled: (0, r.exists)(t, "isNotificationsEnabled") ? t.isNotificationsEnabled : void 0,
            notificationPreferences: (0, r.exists)(t, "notificationPreferences") ? t.notificationPreferences.map(R) : void 0
        }
    }

    function G(e, t) {
        var o, s, n, i, u, a;
        return null == e ? e : {
            groupPostsPermissions: (0, r.exists)(e, "groupPostsPermissions") ? null == (o = e.groupPostsPermissions) ? o : {
                viewWall: (0, r.exists)(o, "viewWall") ? o.viewWall : void 0,
                postToWall: (0, r.exists)(o, "postToWall") ? o.postToWall : void 0,
                deleteFromWall: (0, r.exists)(o, "deleteFromWall") ? o.deleteFromWall : void 0,
                viewStatus: (0, r.exists)(o, "viewStatus") ? o.viewStatus : void 0,
                postToStatus: (0, r.exists)(o, "postToStatus") ? o.postToStatus : void 0
            } : void 0,
            groupForumsPermissions: (0, r.exists)(e, "groupForumsPermissions") ? v(e.groupForumsPermissions) : void 0,
            groupContentModerationPermissions: (0, r.exists)(e, "groupContentModerationPermissions") ? null == (s = e.groupContentModerationPermissions) ? s : {
                manageKeywordBlockList: (0, r.exists)(s, "manageKeywordBlockList") ? s.manageKeywordBlockList : void 0,
                viewKeywordBlockList: (0, r.exists)(s, "viewKeywordBlockList") ? s.viewKeywordBlockList : void 0
            } : void 0,
            groupMembershipPermissions: (0, r.exists)(e, "groupMembershipPermissions") ? null == (n = e.groupMembershipPermissions) ? n : {
                changeRank: (0, r.exists)(n, "changeRank") ? n.changeRank : void 0,
                inviteMembers: (0, r.exists)(n, "inviteMembers") ? n.inviteMembers : void 0,
                removeMembers: (0, r.exists)(n, "removeMembers") ? n.removeMembers : void 0,
                banMembers: (0, r.exists)(n, "banMembers") ? n.banMembers : void 0
            } : void 0,
            groupManagementPermissions: (0, r.exists)(e, "groupManagementPermissions") ? null == (i = e.groupManagementPermissions) ? i : {
                manageRelationships: (0, r.exists)(i, "manageRelationships") ? i.manageRelationships : void 0,
                manageClan: (0, r.exists)(i, "manageClan") ? i.manageClan : void 0,
                viewAuditLogs: (0, r.exists)(i, "viewAuditLogs") ? i.viewAuditLogs : void 0,
                bypassSlowmode: (0, r.exists)(i, "bypassSlowmode") ? i.bypassSlowmode : void 0,
                viewCommunityAnalytics: (0, r.exists)(i, "viewCommunityAnalytics") ? i.viewCommunityAnalytics : void 0
            } : void 0,
            groupEconomyPermissions: (0, r.exists)(e, "groupEconomyPermissions") ? null == (u = e.groupEconomyPermissions) ? u : {
                spendGroupFunds: (0, r.exists)(u, "spendGroupFunds") ? u.spendGroupFunds : void 0,
                advertiseGroup: (0, r.exists)(u, "advertiseGroup") ? u.advertiseGroup : void 0,
                createItems: (0, r.exists)(u, "createItems") ? u.createItems : void 0,
                manageItems: (0, r.exists)(u, "manageItems") ? u.manageItems : void 0,
                addGroupPlaces: (0, r.exists)(u, "addGroupPlaces") ? u.addGroupPlaces : void 0,
                manageGroupGames: (0, r.exists)(u, "manageGroupGames") ? u.manageGroupGames : void 0,
                viewGroupPayouts: (0, r.exists)(u, "viewGroupPayouts") ? u.viewGroupPayouts : void 0,
                viewAnalytics: (0, r.exists)(u, "viewAnalytics") ? u.viewAnalytics : void 0
            } : void 0,
            groupOpenCloudPermissions: (0, r.exists)(e, "groupOpenCloudPermissions") ? null == (a = e.groupOpenCloudPermissions) ? a : {
                useCloudAuthentication: (0, r.exists)(a, "useCloudAuthentication") ? a.useCloudAuthentication : void 0,
                administerCloudAuthentication: (0, r.exists)(a, "administerCloudAuthentication") ? a.administerCloudAuthentication : void 0
            } : void 0
        }
    }

    function f(e) {
        var t;
        return null == (t = e) ? t : {
            user: (0, r.exists)(t, "user") ? d(t.user) : void 0,
            percentage: (0, r.exists)(t, "percentage") ? t.percentage : void 0
        }
    }

    function y(e) {
        var t;
        return null == (t = e) ? t : {
            groupId: (0, r.exists)(t, "groupId") ? t.groupId : void 0,
            role: (0, r.exists)(t, "role") ? a(t.role) : void 0,
            permissions: (0, r.exists)(t, "permissions") ? G(t.permissions) : void 0
        }
    }

    function P(e) {
        var t;
        return null == (t = e) ? t : {
            canViewGroup: (0, r.exists)(t, "canViewGroup") ? t.canViewGroup : void 0,
            groupId: (0, r.exists)(t, "groupId") ? t.groupId : void 0
        }
    }

    function q(e, t) {
        return null == e ? e : {
            groupId: (0, r.exists)(e, "groupId") ? e.groupId : void 0,
            relationshipType: (0, r.exists)(e, "relationshipType") ? e.relationshipType : void 0,
            totalGroupCount: (0, r.exists)(e, "totalGroupCount") ? e.totalGroupCount : void 0,
            relatedGroups: (0, r.exists)(e, "relatedGroups") ? e.relatedGroups.map(g) : void 0,
            nextRowIndex: (0, r.exists)(e, "nextRowIndex") ? e.nextRowIndex : void 0
        }
    }

    function b(e) {
        var t;
        return null == (t = e) ? t : {
            groupId: (0, r.exists)(t, "groupId") ? t.groupId : void 0,
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            description: (0, r.exists)(t, "description") ? t.description : void 0,
            rank: (0, r.exists)(t, "rank") ? t.rank : void 0,
            memberCount: (0, r.exists)(t, "memberCount") ? t.memberCount : void 0,
            isBase: (0, r.exists)(t, "isBase") ? t.isBase : void 0,
            color: (0, r.exists)(t, "color") ? t.color : void 0,
            isPrivate: (0, r.exists)(t, "isPrivate") ? t.isPrivate : void 0
        }
    }

    function x(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            description: (0, r.exists)(t, "description") ? t.description : void 0,
            memberCount: (0, r.exists)(t, "memberCount") ? t.memberCount : void 0,
            previousName: (0, r.exists)(t, "previousName") ? t.previousName : void 0,
            publicEntryAllowed: (0, r.exists)(t, "publicEntryAllowed") ? t.publicEntryAllowed : void 0,
            created: (0, r.exists)(t, "created") ? new Date(t.created) : void 0,
            updated: (0, r.exists)(t, "updated") ? new Date(t.updated) : void 0,
            hasVerifiedBadge: (0, r.exists)(t, "hasVerifiedBadge") ? t.hasVerifiedBadge : void 0
        }
    }

    function C(e) {
        if (void 0 !== e) return null === e ? null : {
            UserIds: e.userIds
        }
    }

    function E(e) {
        var t;
        return null == (t = e) ? t : {
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            created: (0, r.exists)(t, "created") ? new Date(t.created) : void 0
        }
    }

    function S(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            poster: (0, r.exists)(t, "poster") ? d(t.poster) : void 0,
            body: (0, r.exists)(t, "body") ? t.body : void 0,
            created: (0, r.exists)(t, "created") ? new Date(t.created) : void 0,
            updated: (0, r.exists)(t, "updated") ? new Date(t.updated) : void 0
        }
    }

    function T(e) {
        if (void 0 !== e) return null === e ? null : {
            recipientId: e.recipientId,
            recipientType: e.recipientType,
            amount: e.amount
        }
    }

    function U(e) {
        if (void 0 !== e) return null === e ? null : {
            balanceKey: e.balanceKey,
            amount: e.amount
        }
    }

    function A(e) {
        if (void 0 !== e) return null === e ? null : {
            PayoutType: e.payoutType,
            Recipients: void 0 === e.recipients ? void 0 : e.recipients.map(T),
            IdempotencyKey: e.idempotencyKey,
            WatermarkContributions: void 0 === e.watermarkContributions ? void 0 : e.watermarkContributions.map(U)
        }
    }

    function k(e) {
        if (void 0 !== e) return null === e ? null : {
            GroupIds: e.groupIds
        }
    }

    function N(e) {
        if (void 0 !== e) return null === e ? null : {
            type: e.type,
            url: e.url,
            title: e.title
        }
    }

    function O(e) {
        var t;
        return null == (t = e) ? t : {
            user: (0, r.exists)(t, "user") ? d(t.user) : void 0,
            groups: (0, r.exists)(t, "groups") ? t.groups.map(w) : void 0
        }
    }

    function M(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0
        }
    }

    function B(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            emotes: (0, r.exists)(t, "emotes") ? t.emotes.map(M) : void 0
        }
    }

    function D(e, t) {
        return null == e ? e : {
            groupId: (0, r.exists)(e, "groupId") ? e.groupId : void 0,
            contentType: (0, r.exists)(e, "contentType") ? e.contentType : void 0,
            contentId: (0, r.exists)(e, "contentId") ? e.contentId : void 0
        }
    }

    function L(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            memberCount: (0, r.exists)(t, "memberCount") ? t.memberCount : void 0,
            hasVerifiedBadge: (0, r.exists)(t, "hasVerifiedBadge") ? t.hasVerifiedBadge : void 0
        }
    }(function(e) {
        function s() {
            return null !== e && e.apply(this, arguments) || this
        }(0, t._)(s, e), s.prototype.v1GroupsGroupIdBlockedKeywordsGetRaw = function(e, s) {
            return (0, t.a)(this, void 0, void 0, function() {
                var n, i, u;
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdBlockedKeywordsGet.");
                            return n = {}, void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), i = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/blocked-keywords".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/blocked-keywords",
                                method: "GET",
                                headers: i,
                                query: n
                            }, s)];
                        case 1:
                            return u = t.sent(), [2, new r.JSONApiResponse(u, function(e) {
                                return null == e ? e : {
                                    totalActiveKeywordsCount: (0, r.exists)(e, "totalActiveKeywordsCount") ? e.totalActiveKeywordsCount : void 0,
                                    previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                    data: (0, r.exists)(e, "data") ? e.data.map(o) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1GroupsGroupIdBlockedKeywordsGet = function(e, r) {
            return (0, t.a)(this, void 0, void 0, function() {
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GroupsGroupIdBlockedKeywordsGetRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, s.prototype.v1GroupsGroupIdBlockedKeywordsKeywordIdDeleteRaw = function(e, o) {
            return (0, t.a)(this, void 0, void 0, function() {
                var s, n, i;
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdBlockedKeywordsKeywordIdDelete.");
                            if (null === e.keywordId || void 0 === e.keywordId) throw new r.RequiredError("keywordId", "Required parameter requestParameters.keywordId was null or undefined when calling v1GroupsGroupIdBlockedKeywordsKeywordIdDelete.");
                            return s = {}, n = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/blocked-keywords/{keywordId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("keywordId", "}"), encodeURIComponent(String(e.keywordId))),
                                schemaPath: "/v1/groups/{groupId}/blocked-keywords/{keywordId}",
                                method: "DELETE",
                                headers: n,
                                query: s
                            }, o)];
                        case 1:
                            return i = t.sent(), [2, new r.VoidApiResponse(i)]
                    }
                })
            })
        }, s.prototype.v1GroupsGroupIdBlockedKeywordsKeywordIdDelete = function(e, r) {
            return (0, t.a)(this, void 0, void 0, function() {
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GroupsGroupIdBlockedKeywordsKeywordIdDeleteRaw(e, r)];
                        case 1:
                            return t.sent(), [2]
                    }
                })
            })
        }, s.prototype.v1GroupsGroupIdBlockedKeywordsKeywordIdPatchRaw = function(e, s) {
            return (0, t.a)(this, void 0, void 0, function() {
                var n, i, u;
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdBlockedKeywordsKeywordIdPatch.");
                            if (null === e.keywordId || void 0 === e.keywordId) throw new r.RequiredError("keywordId", "Required parameter requestParameters.keywordId was null or undefined when calling v1GroupsGroupIdBlockedKeywordsKeywordIdPatch.");
                            if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdBlockedKeywordsKeywordIdPatch.");
                            return n = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/groups/{groupId}/blocked-keywords/{keywordId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("keywordId", "}"), encodeURIComponent(String(e.keywordId))),
                                schemaPath: "/v1/groups/{groupId}/blocked-keywords/{keywordId}",
                                method: "PATCH",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        keyword: e.keyword,
                                        isPrivate: e.isPrivate
                                    }
                                }(e.request)
                            }, s)];
                        case 1:
                            return u = t.sent(), [2, new r.JSONApiResponse(u, function(e) {
                                return o(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1GroupsGroupIdBlockedKeywordsKeywordIdPatch = function(e, r) {
            return (0, t.a)(this, void 0, void 0, function() {
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GroupsGroupIdBlockedKeywordsKeywordIdPatchRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, s.prototype.v1GroupsGroupIdBlockedKeywordsPostRaw = function(e, s) {
            return (0, t.a)(this, void 0, void 0, function() {
                var n, i, u;
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdBlockedKeywordsPost.");
                            if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdBlockedKeywordsPost.");
                            return n = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/groups/{groupId}/blocked-keywords".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/blocked-keywords",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        keywords: e.keywords,
                                        isPrivate: e.isPrivate
                                    }
                                }(e.request)
                            }, s)];
                        case 1:
                            return u = t.sent(), [2, new r.JSONApiResponse(u, function(e) {
                                return null == e ? e : {
                                    createdKeywords: (0, r.exists)(e, "createdKeywords") ? e.createdKeywords.map(o) : void 0,
                                    hadModeratedKeywords: (0, r.exists)(e, "hadModeratedKeywords") ? e.hadModeratedKeywords : void 0,
                                    hadDuplicateKeywords: (0, r.exists)(e, "hadDuplicateKeywords") ? e.hadDuplicateKeywords : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1GroupsGroupIdBlockedKeywordsPost = function(e, r) {
            return (0, t.a)(this, void 0, void 0, function() {
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GroupsGroupIdBlockedKeywordsPostRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    })(r.BaseAPI),
    function(e) {
        function o() {
            return null !== e && e.apply(this, arguments) || this
        }(0, t._)(o, e), o.prototype.v1GroupsGroupIdEmotesGetRaw = function(e, o) {
            return (0, t.a)(this, void 0, void 0, function() {
                var s, n, i;
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdEmotesGet.");
                            return s = {}, n = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/emotes".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/emotes",
                                method: "GET",
                                headers: n,
                                query: s
                            }, o)];
                        case 1:
                            return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    emoteSets: (0, r.exists)(e, "emoteSets") ? e.emoteSets.map(B) : void 0
                                }
                            })]
                    }
                })
            })
        }, o.prototype.v1GroupsGroupIdEmotesGet = function(e, r) {
            return (0, t.a)(this, void 0, void 0, function() {
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GroupsGroupIdEmotesGetRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    }(r.BaseAPI),
    function(e) {
        function o() {
            return null !== e && e.apply(this, arguments) || this
        }(0, t._)(o, e), o.prototype.v1FeaturedContentEventDeleteRaw = function(e, o) {
            return (0, t.a)(this, void 0, void 0, function() {
                var s, n, i;
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1FeaturedContentEventDelete.");
                            if (null === e.eventId || void 0 === e.eventId) throw new r.RequiredError("eventId", "Required parameter requestParameters.eventId was null or undefined when calling v1FeaturedContentEventDelete.");
                            return s = {}, void 0 !== e.groupId && (s.groupId = e.groupId), void 0 !== e.eventId && (s.eventId = e.eventId), n = {}, [4, this.request({
                                path: "/v1/featured-content/event",
                                schemaPath: "/v1/featured-content/event",
                                method: "DELETE",
                                headers: n,
                                query: s
                            }, o)];
                        case 1:
                            return i = t.sent(), [2, new r.VoidApiResponse(i)]
                    }
                })
            })
        }, o.prototype.v1FeaturedContentEventDelete = function(e, r) {
            return (0, t.a)(this, void 0, void 0, function() {
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1FeaturedContentEventDeleteRaw(e, r)];
                        case 1:
                            return t.sent(), [2]
                    }
                })
            })
        }, o.prototype.v1FeaturedContentEventGetRaw = function(e, o) {
            return (0, t.a)(this, void 0, void 0, function() {
                var s, n, i;
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1FeaturedContentEventGet.");
                            return s = {}, void 0 !== e.groupId && (s.groupId = e.groupId), n = {}, [4, this.request({
                                path: "/v1/featured-content/event",
                                schemaPath: "/v1/featured-content/event",
                                method: "GET",
                                headers: n,
                                query: s
                            }, o)];
                        case 1:
                            return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                return D(e)
                            })]
                    }
                })
            })
        }, o.prototype.v1FeaturedContentEventGet = function(e, r) {
            return (0, t.a)(this, void 0, void 0, function() {
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1FeaturedContentEventGetRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, o.prototype.v1FeaturedContentEventPostRaw = function(e, o) {
            return (0, t.a)(this, void 0, void 0, function() {
                var s, n, i;
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1FeaturedContentEventPost.");
                            if (null === e.eventId || void 0 === e.eventId) throw new r.RequiredError("eventId", "Required parameter requestParameters.eventId was null or undefined when calling v1FeaturedContentEventPost.");
                            return s = {}, void 0 !== e.groupId && (s.groupId = e.groupId), void 0 !== e.eventId && (s.eventId = e.eventId), n = {}, [4, this.request({
                                path: "/v1/featured-content/event",
                                schemaPath: "/v1/featured-content/event",
                                method: "POST",
                                headers: n,
                                query: s
                            }, o)];
                        case 1:
                            return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                return D(e)
                            })]
                    }
                })
            })
        }, o.prototype.v1FeaturedContentEventPost = function(e, r) {
            return (0, t.a)(this, void 0, void 0, function() {
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1FeaturedContentEventPostRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    }(r.BaseAPI);
    var F = function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }
            return (0, t._)(o, e), o.prototype.v1GroupsGroupIdFeaturesGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, u;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdFeaturesGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/features".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/features",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return u = t.sent(), [2, new r.JSONApiResponse(u, function(e) {
                                    return null == e ? e : {
                                        isLocked: (0, r.exists)(e, "isLocked") ? e.isLocked : void 0,
                                        features: (0, r.exists)(e, "features") ? e.features.map(i) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdFeaturesGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdFeaturesGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdFeaturesPatchRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdFeaturesPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdFeaturesPatch.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/features".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/features",
                                    method: "PATCH",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            Features: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    Payouts: e.payouts,
                                                    ContentUpload: e.contentUpload,
                                                    GroupOwnershipTransfer: e.groupOwnershipTransfer,
                                                    GameOwnershipTransfer: e.gameOwnershipTransfer
                                                }
                                            }(e.features)
                                        }
                                    }(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        updated: e.Updated
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdFeaturesPatch = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdFeaturesPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdFeaturesStatusGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdFeaturesStatusGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/features/status".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/features/status",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        hasFeaturesBlocked: (0, r.exists)(e, "hasFeaturesBlocked") ? e.hasFeaturesBlocked : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdFeaturesStatusGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdFeaturesStatusGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o
        }(r.BaseAPI),
        J = function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }
            return (0, t._)(o, e), o.prototype.v1GroupsSearchGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.keyword || void 0 === e.keyword) throw new r.RequiredError("keyword", "Required parameter requestParameters.keyword was null or undefined when calling v1GroupsSearchGet.");
                                return s = {}, void 0 !== e.keyword && (s.keyword = e.keyword), void 0 !== e.prioritizeExactMatch && (s.prioritizeExactMatch = e.prioritizeExactMatch), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), n = {}, [4, this.request({
                                    path: "/v1/groups/search",
                                    schemaPath: "/v1/groups/search",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        keyword: (0, r.exists)(e, "keyword") ? e.keyword : void 0,
                                        previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, r.exists)(e, "data") ? e.data.map(x) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsSearchGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsSearchGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsSearchLookupGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupName || void 0 === e.groupName) throw new r.RequiredError("groupName", "Required parameter requestParameters.groupName was null or undefined when calling v1GroupsSearchLookupGet.");
                                return s = {}, void 0 !== e.groupName && (s.groupName = e.groupName), n = {}, [4, this.request({
                                    path: "/v1/groups/search/lookup",
                                    schemaPath: "/v1/groups/search/lookup",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(L) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsSearchLookupGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsSearchLookupGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsSearchMetadataGetRaw = function(e) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var o, s, n;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return o = {}, s = {}, [4, this.request({
                                    path: "/v1/groups/search/metadata",
                                    schemaPath: "/v1/groups/search/metadata",
                                    method: "GET",
                                    headers: s,
                                    query: o
                                }, e)];
                            case 1:
                                return n = t.sent(), [2, new r.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        suggestedGroupKeywords: (0, r.exists)(e, "SuggestedGroupKeywords") ? e.SuggestedGroupKeywords : void 0,
                                        showFriendsGroupsSort: (0, r.exists)(e, "ShowFriendsGroupsSort") ? e.ShowFriendsGroupsSort : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsSearchMetadataGet = function(e) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsSearchMetadataGetRaw(e)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, o
        }(r.BaseAPI),
        V = function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }
            return (0, t._)(o, e), o.prototype.v1GroupsConfigurationMetadataGetRaw = function(e) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var o, s, n;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return o = {}, s = {}, [4, this.request({
                                    path: "/v1/groups/configuration/metadata",
                                    schemaPath: "/v1/groups/configuration/metadata",
                                    method: "GET",
                                    headers: s,
                                    query: o
                                }, e)];
                            case 1:
                                return n = t.sent(), [2, new r.JSONApiResponse(n, function(e) {
                                    var t, o, s, n;
                                    return null == e ? e : {
                                        groupConfiguration: (0, r.exists)(e, "groupConfiguration") ? null == (t = e.groupConfiguration) ? t : {
                                            nameMaxLength: (0, r.exists)(t, "nameMaxLength") ? t.nameMaxLength : void 0,
                                            descriptionMaxLength: (0, r.exists)(t, "descriptionMaxLength") ? t.descriptionMaxLength : void 0,
                                            iconMaxFileSizeMb: (0, r.exists)(t, "iconMaxFileSizeMb") ? t.iconMaxFileSizeMb : void 0,
                                            coverPhotoMaxFileSizeMb: (0, r.exists)(t, "coverPhotoMaxFileSizeMb") ? t.coverPhotoMaxFileSizeMb : void 0,
                                            validCoverPhotoDimensions: (0, r.exists)(t, "validCoverPhotoDimensions") ? t.validCoverPhotoDimensions : void 0,
                                            cost: (0, r.exists)(t, "cost") ? t.cost : void 0,
                                            isUsingTwoStepWebviewComponent: (0, r.exists)(t, "isUsingTwoStepWebviewComponent") ? t.isUsingTwoStepWebviewComponent : void 0
                                        } : void 0,
                                        recurringPayoutsConfiguration: (0, r.exists)(e, "recurringPayoutsConfiguration") ? null == (o = e.recurringPayoutsConfiguration) ? o : {
                                            maxPayoutPartners: (0, r.exists)(o, "maxPayoutPartners") ? o.maxPayoutPartners : void 0
                                        } : void 0,
                                        roleConfiguration: (0, r.exists)(e, "roleConfiguration") ? null == (s = e.roleConfiguration) ? s : {
                                            nameMaxLength: (0, r.exists)(s, "nameMaxLength") ? s.nameMaxLength : void 0,
                                            descriptionMaxLength: (0, r.exists)(s, "descriptionMaxLength") ? s.descriptionMaxLength : void 0,
                                            limit: (0, r.exists)(s, "limit") ? s.limit : void 0,
                                            cost: (0, r.exists)(s, "cost") ? s.cost : void 0,
                                            minRank: (0, r.exists)(s, "minRank") ? s.minRank : void 0,
                                            maxRank: (0, r.exists)(s, "maxRank") ? s.maxRank : void 0
                                        } : void 0,
                                        groupNameChangeConfiguration: (0, r.exists)(e, "groupNameChangeConfiguration") ? null == (n = e.groupNameChangeConfiguration) ? n : {
                                            cost: (0, r.exists)(n, "cost") ? n.cost : void 0,
                                            cooldownInDays: (0, r.exists)(n, "cooldownInDays") ? n.cooldownInDays : void 0,
                                            ownershipCooldownInDays: (0, r.exists)(n, "ownershipCooldownInDays") ? n.ownershipCooldownInDays : void 0
                                        } : void 0,
                                        isPremiumPayoutsEnabled: (0, r.exists)(e, "isPremiumPayoutsEnabled") ? e.isPremiumPayoutsEnabled : void 0,
                                        isDefaultEmblemPolicyEnabled: (0, r.exists)(e, "isDefaultEmblemPolicyEnabled") ? e.isDefaultEmblemPolicyEnabled : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsConfigurationMetadataGet = function(e) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsConfigurationMetadataGetRaw(e)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsCreatePostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i, u;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return s = {}, n = {}, i = (0, r.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.name && i.append("name", e.name), void 0 !== e.description && i.append("description", e.description), void 0 !== e.publicGroup && i.append("publicGroup", e.publicGroup), void 0 !== e.buildersClubMembersOnly && i.append("buildersClubMembersOnly", e.buildersClubMembersOnly), void 0 !== e.files && i.append("Files", e.files), [4, this.request({
                                    path: "/v1/groups/create",
                                    schemaPath: "/v1/groups/create",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: i
                                }, o)];
                            case 1:
                                return u = t.sent(), [2, new r.JSONApiResponse(u, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        id: (0, r.exists)(e, "id") ? e.id : void 0,
                                        name: (0, r.exists)(e, "name") ? e.name : void 0,
                                        description: (0, r.exists)(e, "description") ? e.description : void 0,
                                        owner: (0, r.exists)(e, "owner") ? null == (t = e.owner) ? t : {
                                            id: (0, r.exists)(t, "id") ? t.id : void 0,
                                            type: (0, r.exists)(t, "type") ? t.type : void 0,
                                            name: (0, r.exists)(t, "name") ? t.name : void 0
                                        } : void 0,
                                        memberCount: (0, r.exists)(e, "memberCount") ? e.memberCount : void 0,
                                        created: (0, r.exists)(e, "created") ? new Date(e.created) : void 0,
                                        hasVerifiedBadge: (0, r.exists)(e, "hasVerifiedBadge") ? e.hasVerifiedBadge : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsCreatePost = function() {
                return (0, t.a)(this, arguments, void 0, function(e, r) {
                    return void 0 === e && (e = {}), (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsCreatePostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdAuditLogGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdAuditLogGet.");
                                return s = {}, void 0 !== e.actionType && (s.actionType = e.actionType), void 0 !== e.userId && (s.userId = e.userId), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/audit-log".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/audit-log",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, r.exists)(e, "data") ? e.data.map(l) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdAuditLogGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdAuditLogGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdConfigurationGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdConfigurationGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/configuration".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/configuration",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        groupId: (0, r.exists)(e, "groupId") ? e.groupId : void 0,
                                        emblemId: (0, r.exists)(e, "emblemId") ? e.emblemId : void 0,
                                        coverPhotoId: (0, r.exists)(e, "coverPhotoId") ? e.coverPhotoId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdConfigurationGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdConfigurationGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdDescriptionPatchRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdDescriptionPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdDescriptionPatch.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/description".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/description",
                                    method: "PATCH",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            description: e.description
                                        }
                                    }(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        newDescription: (0, r.exists)(e, "newDescription") ? e.newDescription : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdDescriptionPatch = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdDescriptionPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdNameHistoryGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdNameHistoryGet.");
                                return s = {}, void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/name-history".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/name-history",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, r.exists)(e, "data") ? e.data.map(E) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdNameHistoryGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdNameHistoryGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdNamePatchRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdNamePatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdNamePatch.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/name".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/name",
                                    method: "PATCH",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name
                                        }
                                    }(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        newName: (0, r.exists)(e, "newName") ? e.newName : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdNamePatch = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdNamePatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdNotificationPreferencePatchRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdNotificationPreferencePatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdNotificationPreferencePatch.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/notification-preference".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/notification-preference",
                                    method: "PATCH",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            notificationsEnabled: e.notificationsEnabled,
                                            type: e.type
                                        }
                                    }(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), this.isJsonMime(i.headers.get("content-type")) ? [2, new r.JSONApiResponse(i)] : [2, new r.TextApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdNotificationPreferencePatch = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdNotificationPreferencePatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdProductFeaturesGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdProductFeaturesGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/product-features".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/product-features",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        forumsRichTextRead: (0, r.exists)(e, "ForumsRichTextRead") ? e.ForumsRichTextRead : void 0,
                                        forumsRichTextWrite: (0, r.exists)(e, "ForumsRichTextWrite") ? e.ForumsRichTextWrite : void 0,
                                        announcementsRichTextRead: (0, r.exists)(e, "AnnouncementsRichTextRead") ? e.AnnouncementsRichTextRead : void 0,
                                        announcementsRichTextWrite: (0, r.exists)(e, "AnnouncementsRichTextWrite") ? e.AnnouncementsRichTextWrite : void 0,
                                        forumsAgeCheck: (0, r.exists)(e, "ForumsAgeCheck") ? e.ForumsAgeCheck : void 0,
                                        forumsRestrictedCategories: (0, r.exists)(e, "ForumsRestrictedCategories") ? e.ForumsRestrictedCategories : void 0,
                                        creatorAnalytics: (0, r.exists)(e, "CreatorAnalytics") ? e.CreatorAnalytics : void 0,
                                        realtimeMessaging: (0, r.exists)(e, "RealtimeMessaging") ? e.RealtimeMessaging : void 0,
                                        announcementsUsingCommsPlat: (0, r.exists)(e, "AnnouncementsUsingCommsPlat") ? e.AnnouncementsUsingCommsPlat : void 0,
                                        announcementPolls: (0, r.exists)(e, "AnnouncementPolls") ? e.AnnouncementPolls : void 0,
                                        announcementAnalytics: (0, r.exists)(e, "AnnouncementAnalytics") ? e.AnnouncementAnalytics : void 0,
                                        isOwnerRolesetDeprecated: (0, r.exists)(e, "IsOwnerRolesetDeprecated") ? e.IsOwnerRolesetDeprecated : void 0,
                                        forumsAttachmentsCreate: (0, r.exists)(e, "ForumsAttachmentsCreate") ? e.ForumsAttachmentsCreate : void 0,
                                        forumsAttachmentsView: (0, r.exists)(e, "ForumsAttachmentsView") ? e.ForumsAttachmentsView : void 0,
                                        reactGroupAffiliates: (0, r.exists)(e, "ReactGroupAffiliates") ? e.ReactGroupAffiliates : void 0,
                                        reactGroupAuditLog: (0, r.exists)(e, "ReactGroupAuditLog") ? e.ReactGroupAuditLog : void 0,
                                        reactGroupSearch: (0, r.exists)(e, "ReactGroupSearch") ? e.ReactGroupSearch : void 0,
                                        communityTiersDisclosureBanner: (0, r.exists)(e, "CommunityTiersDisclosureBanner") ? e.CommunityTiersDisclosureBanner : void 0,
                                        isUnifiedUIEnabled: (0, r.exists)(e, "IsUnifiedUIEnabled") ? e.IsUnifiedUIEnabled : void 0,
                                        forumConcealment: (0, r.exists)(e, "ForumConcealment") ? e.ForumConcealment : void 0,
                                        forumPreventSimilar: (0, r.exists)(e, "ForumPreventSimilar") ? e.ForumPreventSimilar : void 0,
                                        forumsSearch: (0, r.exists)(e, "ForumsSearch") ? e.ForumsSearch : void 0,
                                        communityCompletionCarousel: (0, r.exists)(e, "CommunityCompletionCarousel") ? e.CommunityCompletionCarousel : void 0,
                                        communityTiers: (0, r.exists)(e, "CommunityTiers") ? e.CommunityTiers : void 0,
                                        hideRoleDescription: (0, r.exists)(e, "HideRoleDescription") ? e.HideRoleDescription : void 0,
                                        isPrivateRolesEnabled: (0, r.exists)(e, "IsPrivateRolesEnabled") ? e.IsPrivateRolesEnabled : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdProductFeaturesGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdProductFeaturesGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdSettingsGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdSettingsGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/settings".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/settings",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        isApprovalRequired: (0, r.exists)(e, "isApprovalRequired") ? e.isApprovalRequired : void 0,
                                        isBuildersClubRequired: (0, r.exists)(e, "isBuildersClubRequired") ? e.isBuildersClubRequired : void 0,
                                        areEnemiesAllowed: (0, r.exists)(e, "areEnemiesAllowed") ? e.areEnemiesAllowed : void 0,
                                        areGroupFundsVisible: (0, r.exists)(e, "areGroupFundsVisible") ? e.areGroupFundsVisible : void 0,
                                        areGroupGamesVisible: (0, r.exists)(e, "areGroupGamesVisible") ? e.areGroupGamesVisible : void 0,
                                        isGroupNameChangeEnabled: (0, r.exists)(e, "isGroupNameChangeEnabled") ? e.isGroupNameChangeEnabled : void 0,
                                        verificationLevel: (0, r.exists)(e, "verificationLevel") ? e.verificationLevel : void 0,
                                        accountTenureRequirement: (0, r.exists)(e, "accountTenureRequirement") ? e.accountTenureRequirement : void 0,
                                        slowmode: (0, r.exists)(e, "slowmode") ? e.slowmode : void 0,
                                        isMemberListVisibleToPublic: (0, r.exists)(e, "isMemberListVisibleToPublic") ? e.isMemberListVisibleToPublic : void 0,
                                        isAutoAssignRoleDisabled: (0, r.exists)(e, "isAutoAssignRoleDisabled") ? e.isAutoAssignRoleDisabled : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdSettingsGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdSettingsGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdSettingsPatchRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdSettingsPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdSettingsPatch.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/settings".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/settings",
                                    method: "PATCH",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            isApprovalRequired: e.isApprovalRequired,
                                            areEnemiesAllowed: e.areEnemiesAllowed,
                                            areGroupFundsVisible: e.areGroupFundsVisible,
                                            areGroupGamesVisible: e.areGroupGamesVisible,
                                            verificationLevel: e.verificationLevel,
                                            accountTenureRequirement: e.accountTenureRequirement,
                                            slowmode: e.slowmode,
                                            isMemberListVisibleToPublic: e.isMemberListVisibleToPublic
                                        }
                                    }(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdSettingsPatch = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdSettingsPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdStatusPatchRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdStatusPatch.");
                                if (null === e.statusRequest || void 0 === e.statusRequest) throw new r.RequiredError("statusRequest", "Required parameter requestParameters.statusRequest was null or undefined when calling v1GroupsGroupIdStatusPatch.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/status".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/status",
                                    method: "PATCH",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            message: e.message
                                        }
                                    }(e.statusRequest)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdStatusPatch = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdStatusPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsIconPatchRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i, u;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsIconPatch.");
                                return s = {}, void 0 !== e.groupId && (s.groupId = e.groupId), n = {}, i = (0, r.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.files && i.append("Files", e.files), [4, this.request({
                                    path: "/v1/groups/icon",
                                    schemaPath: "/v1/groups/icon",
                                    method: "PATCH",
                                    headers: n,
                                    query: s,
                                    body: i
                                }, o)];
                            case 1:
                                return u = t.sent(), [2, new r.JSONApiResponse(u)]
                        }
                    })
                })
            }, o.prototype.v1GroupsIconPatch = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsIconPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsMetadataGetRaw = function(e) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var o, s, n;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return o = {}, s = {}, [4, this.request({
                                    path: "/v1/groups/metadata",
                                    schemaPath: "/v1/groups/metadata",
                                    method: "GET",
                                    headers: s,
                                    query: o
                                }, e)];
                            case 1:
                                return n = t.sent(), [2, new r.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        groupLimit: (0, r.exists)(e, "groupLimit") ? e.groupLimit : void 0,
                                        currentGroupCount: (0, r.exists)(e, "currentGroupCount") ? e.currentGroupCount : void 0,
                                        groupStatusMaxLength: (0, r.exists)(e, "groupStatusMaxLength") ? e.groupStatusMaxLength : void 0,
                                        groupPostMaxLength: (0, r.exists)(e, "groupPostMaxLength") ? e.groupPostMaxLength : void 0,
                                        isGroupWallNotificationsEnabled: (0, r.exists)(e, "isGroupWallNotificationsEnabled") ? e.isGroupWallNotificationsEnabled : void 0,
                                        groupWallNotificationsSubscribeIntervalInMilliseconds: (0, r.exists)(e, "groupWallNotificationsSubscribeIntervalInMilliseconds") ? e.groupWallNotificationsSubscribeIntervalInMilliseconds : void 0,
                                        areProfileGroupsHidden: (0, r.exists)(e, "areProfileGroupsHidden") ? e.areProfileGroupsHidden : void 0,
                                        isGroupDetailsPolicyEnabled: (0, r.exists)(e, "isGroupDetailsPolicyEnabled") ? e.isGroupDetailsPolicyEnabled : void 0,
                                        showPreviousGroupNames: (0, r.exists)(e, "showPreviousGroupNames") ? e.showPreviousGroupNames : void 0,
                                        areGroupBansEnabled: (0, r.exists)(e, "areGroupBansEnabled") ? e.areGroupBansEnabled : void 0,
                                        canEnableGroupNotifications: (0, r.exists)(e, "canEnableGroupNotifications") ? e.canEnableGroupNotifications : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsMetadataGet = function(e) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsMetadataGetRaw(e)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsPoliciesPostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupPolicyRequest || void 0 === e.groupPolicyRequest) throw new r.RequiredError("groupPolicyRequest", "Required parameter requestParameters.groupPolicyRequest was null or undefined when calling v1GroupsPoliciesPost.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/policies",
                                    schemaPath: "/v1/groups/policies",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            groupIds: e.groupIds
                                        }
                                    }(e.groupPolicyRequest)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        groups: (0, r.exists)(e, "groups") ? e.groups.map(P) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsPoliciesPost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsPoliciesPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o
        }(r.BaseAPI),
        _ = function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }
            return (0, t._)(o, e), o.prototype.v1GroupsGroupIdBansGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdBansGet.");
                                return s = {}, void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/bans".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/bans",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, r.exists)(e, "data") ? e.data.map(c) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdBansGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdBansGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdBansUserIdDeleteRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdBansUserIdDelete.");
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1GroupsGroupIdBansUserIdDelete.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/bans/{userId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/groups/{groupId}/bans/{userId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdBansUserIdDelete = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdBansUserIdDeleteRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdBansUserIdGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdBansUserIdGet.");
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1GroupsGroupIdBansUserIdGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/bans/{userId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/groups/{groupId}/bans/{userId}",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdBansUserIdGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdBansUserIdGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdBansUserIdPostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdBansUserIdPost.");
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1GroupsGroupIdBansUserIdPost.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/bans/{userId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/groups/{groupId}/bans/{userId}",
                                    method: "POST",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdBansUserIdPost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdBansUserIdPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdChangeOwnerPostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdChangeOwnerPost.");
                                if (null === e.changeOwnerRequest || void 0 === e.changeOwnerRequest) throw new r.RequiredError("changeOwnerRequest", "Required parameter requestParameters.changeOwnerRequest was null or undefined when calling v1GroupsGroupIdChangeOwnerPost.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/change-owner".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/change-owner",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            userId: e.userId
                                        }
                                    }(e.changeOwnerRequest)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdChangeOwnerPost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdChangeOwnerPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdClaimOwnershipPostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdClaimOwnershipPost.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/claim-ownership".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/claim-ownership",
                                    method: "POST",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdClaimOwnershipPost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdClaimOwnershipPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdJoinRequestsDeleteRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdJoinRequestsDelete.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdJoinRequestsDelete.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/join-requests".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/join-requests",
                                    method: "DELETE",
                                    headers: n,
                                    query: s,
                                    body: C(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdJoinRequestsDelete = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdJoinRequestsDeleteRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdJoinRequestsGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdJoinRequestsGet.");
                                return s = {}, void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/join-requests".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/join-requests",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, r.exists)(e, "data") ? e.data.map(m) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdJoinRequestsGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdJoinRequestsGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdJoinRequestsPostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdJoinRequestsPost.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdJoinRequestsPost.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/join-requests".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/join-requests",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: C(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdJoinRequestsPost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdJoinRequestsPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdJoinRequestsUsersUserIdDeleteRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdJoinRequestsUsersUserIdDelete.");
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1GroupsGroupIdJoinRequestsUsersUserIdDelete.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/join-requests/users/{userId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/groups/{groupId}/join-requests/users/{userId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdJoinRequestsUsersUserIdDelete = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdJoinRequestsUsersUserIdDeleteRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdJoinRequestsUsersUserIdGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdJoinRequestsUsersUserIdGet.");
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1GroupsGroupIdJoinRequestsUsersUserIdGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/join-requests/users/{userId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/groups/{groupId}/join-requests/users/{userId}",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdJoinRequestsUsersUserIdGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdJoinRequestsUsersUserIdGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdJoinRequestsUsersUserIdPostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdJoinRequestsUsersUserIdPost.");
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1GroupsGroupIdJoinRequestsUsersUserIdPost.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/join-requests/users/{userId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/groups/{groupId}/join-requests/users/{userId}",
                                    method: "POST",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdJoinRequestsUsersUserIdPost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdJoinRequestsUsersUserIdPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdMembershipGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdMembershipGet.");
                                if (null === e.includeNotificationPreferences || void 0 === e.includeNotificationPreferences) throw new r.RequiredError("includeNotificationPreferences", "Required parameter requestParameters.includeNotificationPreferences was null or undefined when calling v1GroupsGroupIdMembershipGet.");
                                return s = {}, void 0 !== e.includeNotificationPreferences && (s.includeNotificationPreferences = e.includeNotificationPreferences), n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/membership".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/membership",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        groupId: (0, r.exists)(e, "groupId") ? e.groupId : void 0,
                                        isPrimary: (0, r.exists)(e, "isPrimary") ? e.isPrimary : void 0,
                                        isPendingJoin: (0, r.exists)(e, "isPendingJoin") ? e.isPendingJoin : void 0,
                                        userRole: (0, r.exists)(e, "userRole") ? p(e.userRole) : void 0,
                                        permissions: (0, r.exists)(e, "permissions") ? G(e.permissions) : void 0,
                                        channelPermissions: (0, r.exists)(e, "channelPermissions") ? e.channelPermissions.map(h) : void 0,
                                        areGroupGamesVisible: (0, r.exists)(e, "areGroupGamesVisible") ? e.areGroupGamesVisible : void 0,
                                        areGroupFundsVisible: (0, r.exists)(e, "areGroupFundsVisible") ? e.areGroupFundsVisible : void 0,
                                        areEnemiesAllowed: (0, r.exists)(e, "areEnemiesAllowed") ? e.areEnemiesAllowed : void 0,
                                        canConfigure: (0, r.exists)(e, "canConfigure") ? e.canConfigure : void 0,
                                        isNotificationsEnabled: (0, r.exists)(e, "isNotificationsEnabled") ? e.isNotificationsEnabled : void 0,
                                        notificationPreferences: (0, r.exists)(e, "notificationPreferences") ? e.notificationPreferences.map(R) : void 0,
                                        isBannedFromGroup: (0, r.exists)(e, "isBannedFromGroup") ? e.isBannedFromGroup : void 0,
                                        canViewMemberList: (0, r.exists)(e, "canViewMemberList") ? e.canViewMemberList : void 0,
                                        isOwner: (0, r.exists)(e, "isOwner") ? e.isOwner : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdMembershipGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdMembershipGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRolesGet.");
                                return s = {}, void 0 !== e.includePrivate && (s.includePrivate = e.includePrivate), n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/roles".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/roles",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        groupId: (0, r.exists)(e, "groupId") ? e.groupId : void 0,
                                        roles: (0, r.exists)(e, "roles") ? e.roles.map(a) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRolesGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesRoleIdUsersUserIdDeleteRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRolesRoleIdUsersUserIdDelete.");
                                if (null === e.roleId || void 0 === e.roleId) throw new r.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1GroupsGroupIdRolesRoleIdUsersUserIdDelete.");
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1GroupsGroupIdRolesRoleIdUsersUserIdDelete.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/roles/{roleId}/users/{userId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/groups/{groupId}/roles/{roleId}/users/{userId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesRoleIdUsersUserIdDelete = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRolesRoleIdUsersUserIdDeleteRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesRoleIdUsersUserIdPutRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRolesRoleIdUsersUserIdPut.");
                                if (null === e.roleId || void 0 === e.roleId) throw new r.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v1GroupsGroupIdRolesRoleIdUsersUserIdPut.");
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1GroupsGroupIdRolesRoleIdUsersUserIdPut.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/roles/{roleId}/users/{userId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/groups/{groupId}/roles/{roleId}/users/{userId}",
                                    method: "PUT",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesRoleIdUsersUserIdPut = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRolesRoleIdUsersUserIdPutRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesRoleSetIdUsersGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRolesRoleSetIdUsersGet.");
                                if (null === e.roleSetId || void 0 === e.roleSetId) throw new r.RequiredError("roleSetId", "Required parameter requestParameters.roleSetId was null or undefined when calling v1GroupsGroupIdRolesRoleSetIdUsersGet.");
                                return s = {}, void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/roles/{roleSetId}/users".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("roleSetId", "}"), encodeURIComponent(String(e.roleSetId))),
                                    schemaPath: "/v1/groups/{groupId}/roles/{roleSetId}/users",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, r.exists)(e, "data") ? e.data.map(d) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesRoleSetIdUsersGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRolesRoleSetIdUsersGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdUsersGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdUsersGet.");
                                return s = {}, void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/users".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/users",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, r.exists)(e, "data") ? e.data.map(p) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdUsersGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdUsersGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdUsersPostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdUsersPost.");
                                if (null === e.joinGroupModel || void 0 === e.joinGroupModel) throw new r.RequiredError("joinGroupModel", "Required parameter requestParameters.joinGroupModel was null or undefined when calling v1GroupsGroupIdUsersPost.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (n["Roblox-Game-Id"] = String(e.robloxGameId)), void 0 !== e.robloxSessionId && null !== e.robloxSessionId && (n["Roblox-Session-Id"] = String(e.robloxSessionId)), [4, this.request({
                                    path: "/v1/groups/{groupId}/users".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/users",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            sessionId: e.sessionId,
                                            redemptionToken: e.redemptionToken,
                                            captchaId: e.captchaId,
                                            captchaToken: e.captchaToken,
                                            captchaProvider: e.captchaProvider,
                                            challengeId: e.challengeId
                                        }
                                    }(e.joinGroupModel)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdUsersPost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdUsersPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdUsersUserIdDeleteRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdUsersUserIdDelete.");
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1GroupsGroupIdUsersUserIdDelete.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/users/{userId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/groups/{groupId}/users/{userId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdUsersUserIdDelete = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdUsersUserIdDeleteRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdUsersUserIdPatchRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdUsersUserIdPatch.");
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1GroupsGroupIdUsersUserIdPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdUsersUserIdPatch.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/users/{userId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/groups/{groupId}/users/{userId}",
                                    method: "PATCH",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            roleId: e.roleId
                                        }
                                    }(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdUsersUserIdPatch = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdUsersUserIdPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1UserGroupsPendingGetRaw = function(e) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var o, s, n;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return o = {}, s = {}, [4, this.request({
                                    path: "/v1/user/groups/pending",
                                    schemaPath: "/v1/user/groups/pending",
                                    method: "GET",
                                    headers: s,
                                    query: o
                                }, e)];
                            case 1:
                                return n = t.sent(), [2, new r.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(g) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1UserGroupsPendingGet = function(e) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UserGroupsPendingGetRaw(e)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, o.prototype.v1UsersUserIdFriendsGroupsRolesGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdFriendsGroupsRolesGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/users/{userId}/friends/groups/roles".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/friends/groups/roles",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(O) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1UsersUserIdFriendsGroupsRolesGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UsersUserIdFriendsGroupsRolesGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1UsersUserIdGroupsRolesGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdGroupsRolesGet.");
                                return s = {}, void 0 !== e.includeLocked && (s.includeLocked = e.includeLocked), void 0 !== e.includeNotificationPreferences && (s.includeNotificationPreferences = e.includeNotificationPreferences), void 0 !== e.discoveryType && (s.discoveryType = e.discoveryType), n = {}, [4, this.request({
                                    path: "/v1/users/{userId}/groups/roles".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/groups/roles",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(w) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1UsersUserIdGroupsRolesGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UsersUserIdGroupsRolesGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o
        }(r.BaseAPI),
        K = function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }
            return (0, t._)(o, e), o.prototype.v1GroupsGroupIdMigrationBreakingChangesGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, i, u;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdMigrationBreakingChangesGet.");
                                return s = {}, i = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/migration/breaking-changes".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/migration/breaking-changes",
                                    method: "GET",
                                    headers: i,
                                    query: s
                                }, o)];
                            case 1:
                                return u = t.sent(), [2, new r.JSONApiResponse(u, function(e) {
                                    return null == e ? e : {
                                        breakingChanges: (0, r.exists)(e, "breakingChanges") ? e.breakingChanges.map(n) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdMigrationBreakingChangesGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdMigrationBreakingChangesGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdMigrationGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdMigrationGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/migration".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/migration",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        status: (0, r.exists)(e, "status") ? e.status : void 0,
                                        source: (0, r.exists)(e, "source") ? e.source : void 0,
                                        migrationTime: (0, r.exists)(e, "migrationTime") ? new Date(e.migrationTime) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdMigrationGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdMigrationGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdMigrationMigratePostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdMigrationMigratePost.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/migration/migrate".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/migration/migrate",
                                    method: "POST",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.VoidApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdMigrationMigratePost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdMigrationMigratePostRaw(e, r)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, o
        }(r.BaseAPI),
        j = (function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }(0, t._)(o, e), o.prototype.v1GroupsGroupIdRolesGuestPermissionsGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRolesGuestPermissionsGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/roles/guest/permissions".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/roles/guest/permissions",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesGuestPermissionsGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRolesGuestPermissionsGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesPermissionsGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRolesPermissionsGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/roles/permissions".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/roles/permissions",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(y) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesPermissionsGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRolesPermissionsGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesRoleSetIdPermissionsGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRolesRoleSetIdPermissionsGet.");
                                if (null === e.roleSetId || void 0 === e.roleSetId) throw new r.RequiredError("roleSetId", "Required parameter requestParameters.roleSetId was null or undefined when calling v1GroupsGroupIdRolesRoleSetIdPermissionsGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/roles/{roleSetId}/permissions".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("roleSetId", "}"), encodeURIComponent(String(e.roleSetId))),
                                    schemaPath: "/v1/groups/{groupId}/roles/{roleSetId}/permissions",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesRoleSetIdPermissionsGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRolesRoleSetIdPermissionsGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesRoleSetIdPermissionsPatchRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRolesRoleSetIdPermissionsPatch.");
                                if (null === e.roleSetId || void 0 === e.roleSetId) throw new r.RequiredError("roleSetId", "Required parameter requestParameters.roleSetId was null or undefined when calling v1GroupsGroupIdRolesRoleSetIdPermissionsPatch.");
                                if (null === e.updatePermissionsRequest || void 0 === e.updatePermissionsRequest) throw new r.RequiredError("updatePermissionsRequest", "Required parameter requestParameters.updatePermissionsRequest was null or undefined when calling v1GroupsGroupIdRolesRoleSetIdPermissionsPatch.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/roles/{roleSetId}/permissions".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("roleSetId", "}"), encodeURIComponent(String(e.roleSetId))),
                                    schemaPath: "/v1/groups/{groupId}/roles/{roleSetId}/permissions",
                                    method: "PATCH",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            permissions: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    DeleteFromWall: e.deleteFromWall,
                                                    PostToWall: e.postToWall,
                                                    InviteMembers: e.inviteMembers,
                                                    PostToStatus: e.postToStatus,
                                                    RemoveMembers: e.removeMembers,
                                                    BanMembers: e.banMembers,
                                                    ViewStatus: e.viewStatus,
                                                    ViewWall: e.viewWall,
                                                    ChangeRank: e.changeRank,
                                                    AdvertiseGroup: e.advertiseGroup,
                                                    ManageRelationships: e.manageRelationships,
                                                    AddGroupPlaces: e.addGroupPlaces,
                                                    ViewAuditLogs: e.viewAuditLogs,
                                                    CreateItems: e.createItems,
                                                    ManageItems: e.manageItems,
                                                    SpendGroupFunds: e.spendGroupFunds,
                                                    ManageClan: e.manageClan,
                                                    ManageGroupGames: e.manageGroupGames,
                                                    UseCloudAuthentication: e.useCloudAuthentication,
                                                    AdministerCloudAuthentication: e.administerCloudAuthentication,
                                                    ViewAnalytics: e.viewAnalytics,
                                                    ViewForums: e.viewForums,
                                                    ManageCategories: e.manageCategories,
                                                    CreatePosts: e.createPosts,
                                                    RemovePosts: e.removePosts,
                                                    LockPosts: e.lockPosts,
                                                    PinPosts: e.pinPosts,
                                                    CreateComments: e.createComments,
                                                    RemoveComments: e.removeComments,
                                                    ManageKeywordBlockList: e.manageKeywordBlockList,
                                                    ViewKeywordBlockList: e.viewKeywordBlockList,
                                                    BypassSlowmode: e.bypassSlowmode,
                                                    ViewCommunityAnalytics: e.viewCommunityAnalytics
                                                }
                                            }(e.permissions)
                                        }
                                    }(e.updatePermissionsRequest)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesRoleSetIdPermissionsPatch = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRolesRoleSetIdPermissionsPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdUsersUserIdPermissionsGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdUsersUserIdPermissionsGet.");
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1GroupsGroupIdUsersUserIdPermissionsGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/users/{userId}/permissions".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/groups/{groupId}/users/{userId}/permissions",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdUsersUserIdPermissionsGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdUsersUserIdPermissionsGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }
        }(r.BaseAPI), function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }(0, t._)(o, e), o.prototype.v1UserGroupsPrimaryDeleteRaw = function(e) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var o, s, n;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return o = {}, s = {}, [4, this.request({
                                    path: "/v1/user/groups/primary",
                                    schemaPath: "/v1/user/groups/primary",
                                    method: "DELETE",
                                    headers: s,
                                    query: o
                                }, e)];
                            case 1:
                                return n = t.sent(), [2, new r.JSONApiResponse(n)]
                        }
                    })
                })
            }, o.prototype.v1UserGroupsPrimaryDelete = function(e) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UserGroupsPrimaryDeleteRaw(e)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, o.prototype.v1UserGroupsPrimaryPostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UserGroupsPrimaryPost.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/user/groups/primary",
                                    schemaPath: "/v1/user/groups/primary",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            groupId: e.groupId
                                        }
                                    }(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1UserGroupsPrimaryPost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UserGroupsPrimaryPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1UsersUserIdGroupsPrimaryRoleGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdGroupsPrimaryRoleGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/users/{userId}/groups/primary/role".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/groups/primary/role",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return w(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v1UsersUserIdGroupsPrimaryRoleGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UsersUserIdGroupsPrimaryRoleGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }
        }(r.BaseAPI), function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }(0, t._)(o, e), o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeGet.");
                                if (null === e.groupRelationshipType || void 0 === e.groupRelationshipType) throw new r.RequiredError("groupRelationshipType", "Required parameter requestParameters.groupRelationshipType was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeGet.");
                                if (null === e.startRowIndex || void 0 === e.startRowIndex) throw new r.RequiredError("startRowIndex", "Required parameter requestParameters.startRowIndex was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeGet.");
                                if (null === e.maxRows || void 0 === e.maxRows) throw new r.RequiredError("maxRows", "Required parameter requestParameters.maxRows was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeGet.");
                                return s = {}, void 0 !== e.startRowIndex && (s.StartRowIndex = e.startRowIndex), void 0 !== e.maxRows && (s.MaxRows = e.maxRows), n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/relationships/{groupRelationshipType}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("groupRelationshipType", "}"), encodeURIComponent(String(e.groupRelationshipType))),
                                    schemaPath: "/v1/groups/{groupId}/relationships/{groupRelationshipType}",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return q(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRelationshipsGroupRelationshipTypeGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRelatedGroupIdDeleteRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRelatedGroupIdDelete.");
                                if (null === e.groupRelationshipType || void 0 === e.groupRelationshipType) throw new r.RequiredError("groupRelationshipType", "Required parameter requestParameters.groupRelationshipType was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRelatedGroupIdDelete.");
                                if (null === e.relatedGroupId || void 0 === e.relatedGroupId) throw new r.RequiredError("relatedGroupId", "Required parameter requestParameters.relatedGroupId was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRelatedGroupIdDelete.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/relationships/{groupRelationshipType}/{relatedGroupId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("groupRelationshipType", "}"), encodeURIComponent(String(e.groupRelationshipType))).replace("{".concat("relatedGroupId", "}"), encodeURIComponent(String(e.relatedGroupId))),
                                    schemaPath: "/v1/groups/{groupId}/relationships/{groupRelationshipType}/{relatedGroupId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRelatedGroupIdDelete = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRelatedGroupIdDeleteRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRelatedGroupIdPostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRelatedGroupIdPost.");
                                if (null === e.groupRelationshipType || void 0 === e.groupRelationshipType) throw new r.RequiredError("groupRelationshipType", "Required parameter requestParameters.groupRelationshipType was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRelatedGroupIdPost.");
                                if (null === e.relatedGroupId || void 0 === e.relatedGroupId) throw new r.RequiredError("relatedGroupId", "Required parameter requestParameters.relatedGroupId was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRelatedGroupIdPost.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/relationships/{groupRelationshipType}/{relatedGroupId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("groupRelationshipType", "}"), encodeURIComponent(String(e.groupRelationshipType))).replace("{".concat("relatedGroupId", "}"), encodeURIComponent(String(e.relatedGroupId))),
                                    schemaPath: "/v1/groups/{groupId}/relationships/{groupRelationshipType}/{relatedGroupId}",
                                    method: "POST",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRelatedGroupIdPost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRelatedGroupIdPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsDeleteRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsDelete.");
                                if (null === e.groupRelationshipType || void 0 === e.groupRelationshipType) throw new r.RequiredError("groupRelationshipType", "Required parameter requestParameters.groupRelationshipType was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsDelete.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsDelete.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/relationships/{groupRelationshipType}/requests".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("groupRelationshipType", "}"), encodeURIComponent(String(e.groupRelationshipType))),
                                    schemaPath: "/v1/groups/{groupId}/relationships/{groupRelationshipType}/requests",
                                    method: "DELETE",
                                    headers: n,
                                    query: s,
                                    body: k(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsDelete = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsDeleteRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsGet.");
                                if (null === e.groupRelationshipType || void 0 === e.groupRelationshipType) throw new r.RequiredError("groupRelationshipType", "Required parameter requestParameters.groupRelationshipType was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsGet.");
                                if (null === e.startRowIndex || void 0 === e.startRowIndex) throw new r.RequiredError("startRowIndex", "Required parameter requestParameters.startRowIndex was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsGet.");
                                if (null === e.maxRows || void 0 === e.maxRows) throw new r.RequiredError("maxRows", "Required parameter requestParameters.maxRows was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsGet.");
                                return s = {}, void 0 !== e.startRowIndex && (s.StartRowIndex = e.startRowIndex), void 0 !== e.maxRows && (s.MaxRows = e.maxRows), n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/relationships/{groupRelationshipType}/requests".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("groupRelationshipType", "}"), encodeURIComponent(String(e.groupRelationshipType))),
                                    schemaPath: "/v1/groups/{groupId}/relationships/{groupRelationshipType}/requests",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return q(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsPostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsPost.");
                                if (null === e.groupRelationshipType || void 0 === e.groupRelationshipType) throw new r.RequiredError("groupRelationshipType", "Required parameter requestParameters.groupRelationshipType was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsPost.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsPost.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/relationships/{groupRelationshipType}/requests".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("groupRelationshipType", "}"), encodeURIComponent(String(e.groupRelationshipType))),
                                    schemaPath: "/v1/groups/{groupId}/relationships/{groupRelationshipType}/requests",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: k(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsPost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsRelatedGroupIdDeleteRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsRelatedGroupIdDelete.");
                                if (null === e.groupRelationshipType || void 0 === e.groupRelationshipType) throw new r.RequiredError("groupRelationshipType", "Required parameter requestParameters.groupRelationshipType was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsRelatedGroupIdDelete.");
                                if (null === e.relatedGroupId || void 0 === e.relatedGroupId) throw new r.RequiredError("relatedGroupId", "Required parameter requestParameters.relatedGroupId was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsRelatedGroupIdDelete.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/relationships/{groupRelationshipType}/requests/{relatedGroupId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("groupRelationshipType", "}"), encodeURIComponent(String(e.groupRelationshipType))).replace("{".concat("relatedGroupId", "}"), encodeURIComponent(String(e.relatedGroupId))),
                                    schemaPath: "/v1/groups/{groupId}/relationships/{groupRelationshipType}/requests/{relatedGroupId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsRelatedGroupIdDelete = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsRelatedGroupIdDeleteRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsRelatedGroupIdPostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsRelatedGroupIdPost.");
                                if (null === e.groupRelationshipType || void 0 === e.groupRelationshipType) throw new r.RequiredError("groupRelationshipType", "Required parameter requestParameters.groupRelationshipType was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsRelatedGroupIdPost.");
                                if (null === e.relatedGroupId || void 0 === e.relatedGroupId) throw new r.RequiredError("relatedGroupId", "Required parameter requestParameters.relatedGroupId was null or undefined when calling v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsRelatedGroupIdPost.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/relationships/{groupRelationshipType}/requests/{relatedGroupId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("groupRelationshipType", "}"), encodeURIComponent(String(e.groupRelationshipType))).replace("{".concat("relatedGroupId", "}"), encodeURIComponent(String(e.relatedGroupId))),
                                    schemaPath: "/v1/groups/{groupId}/relationships/{groupRelationshipType}/requests/{relatedGroupId}",
                                    method: "POST",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsRelatedGroupIdPost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsRelatedGroupIdPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }
        }(r.BaseAPI), function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }
            return (0, t._)(o, e), o.prototype.v1GroupsGroupIdPayoutRestrictionGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdPayoutRestrictionGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/payout-restriction".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/payout-restriction",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        canUseRecurringPayout: (0, r.exists)(e, "canUseRecurringPayout") ? e.canUseRecurringPayout : void 0,
                                        canUseOneTimePayout: (0, r.exists)(e, "canUseOneTimePayout") ? e.canUseOneTimePayout : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdPayoutRestrictionGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdPayoutRestrictionGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdPayoutsGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdPayoutsGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/payouts".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/payouts",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(f) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdPayoutsGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdPayoutsGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdPayoutsPostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdPayoutsPost.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdPayoutsPost.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/payouts".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/payouts",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: A(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        status: (0, r.exists)(e, "status") ? e.status : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdPayoutsPost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdPayoutsPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdPayoutsRecurringPostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdPayoutsRecurringPost.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdPayoutsRecurringPost.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/payouts/recurring".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/payouts/recurring",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: A(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdPayoutsRecurringPost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdPayoutsRecurringPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o
        }(r.BaseAPI)),
        W = function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }
            return (0, t._)(o, e), o.prototype.v1GroupsGroupIdRolesetsCreatePostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRolesetsCreatePost.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdRolesetsCreatePost.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/rolesets/create".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/rolesets/create",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            description: e.description,
                                            rank: e.rank,
                                            usingGroupFunds: e.usingGroupFunds,
                                            isPrivate: e.isPrivate
                                        }
                                    }(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return a(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesetsCreatePost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRolesetsCreatePostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesetsRolesetIdDeleteRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRolesetsRolesetIdDelete.");
                                if (null === e.rolesetId || void 0 === e.rolesetId) throw new r.RequiredError("rolesetId", "Required parameter requestParameters.rolesetId was null or undefined when calling v1GroupsGroupIdRolesetsRolesetIdDelete.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/rolesets/{rolesetId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("rolesetId", "}"), encodeURIComponent(String(e.rolesetId))),
                                    schemaPath: "/v1/groups/{groupId}/rolesets/{rolesetId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesetsRolesetIdDelete = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRolesetsRolesetIdDeleteRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesetsRolesetIdPatchRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRolesetsRolesetIdPatch.");
                                if (null === e.rolesetId || void 0 === e.rolesetId) throw new r.RequiredError("rolesetId", "Required parameter requestParameters.rolesetId was null or undefined when calling v1GroupsGroupIdRolesetsRolesetIdPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdRolesetsRolesetIdPatch.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/rolesets/{rolesetId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("rolesetId", "}"), encodeURIComponent(String(e.rolesetId))),
                                    schemaPath: "/v1/groups/{groupId}/rolesets/{rolesetId}",
                                    method: "PATCH",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            description: e.description,
                                            rank: e.rank,
                                            color: e.color,
                                            isPrivate: e.isPrivate
                                        }
                                    }(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return a(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdRolesetsRolesetIdPatch = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdRolesetsRolesetIdPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o
        }(r.BaseAPI),
        H = function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }
            return (0, t._)(o, e), o.prototype.v1RolesGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.ids || void 0 === e.ids) throw new r.RequiredError("ids", "Required parameter requestParameters.ids was null or undefined when calling v1RolesGet.");
                                return s = {}, e.ids && (s.ids = e.ids.join(r.COLLECTION_FORMATS.csv)), void 0 !== e.includePrivate && (s.includePrivate = e.includePrivate), n = {}, [4, this.request({
                                    path: "/v1/roles",
                                    schemaPath: "/v1/roles",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(b) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1RolesGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1RolesGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o
        }(r.BaseAPI),
        z = function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }
            return (0, t._)(o, e), o.prototype.v1GroupsGroupIdSocialLinksGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdSocialLinksGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/social-links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/social-links",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(u) : void 0,
                                        socialLinksVerificationStatus: (0, r.exists)(e, "socialLinksVerificationStatus") ? e.socialLinksVerificationStatus : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdSocialLinksGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdSocialLinksGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdSocialLinksPostRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdSocialLinksPost.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdSocialLinksPost.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/social-links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/social-links",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: N(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return u(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdSocialLinksPost = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdSocialLinksPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdSocialLinksSocialLinkIdDeleteRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdSocialLinksSocialLinkIdDelete.");
                                if (null === e.socialLinkId || void 0 === e.socialLinkId) throw new r.RequiredError("socialLinkId", "Required parameter requestParameters.socialLinkId was null or undefined when calling v1GroupsGroupIdSocialLinksSocialLinkIdDelete.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/social-links/{socialLinkId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("socialLinkId", "}"), encodeURIComponent(String(e.socialLinkId))),
                                    schemaPath: "/v1/groups/{groupId}/social-links/{socialLinkId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdSocialLinksSocialLinkIdDelete = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdSocialLinksSocialLinkIdDeleteRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdSocialLinksSocialLinkIdPatchRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdSocialLinksSocialLinkIdPatch.");
                                if (null === e.socialLinkId || void 0 === e.socialLinkId) throw new r.RequiredError("socialLinkId", "Required parameter requestParameters.socialLinkId was null or undefined when calling v1GroupsGroupIdSocialLinksSocialLinkIdPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdSocialLinksSocialLinkIdPatch.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/social-links/{socialLinkId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("socialLinkId", "}"), encodeURIComponent(String(e.socialLinkId))),
                                    schemaPath: "/v1/groups/{groupId}/social-links/{socialLinkId}",
                                    method: "PATCH",
                                    headers: n,
                                    query: s,
                                    body: N(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v1GroupsGroupIdSocialLinksSocialLinkIdPatch = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdSocialLinksSocialLinkIdPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o
        }(r.BaseAPI);
    (function(e) {
        function o() {
            return null !== e && e.apply(this, arguments) || this
        }(0, t._)(o, e), o.prototype.v1GroupsGroupIdWallPostsGetRaw = function(e, o) {
            return (0, t.a)(this, void 0, void 0, function() {
                var s, n, i;
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdWallPostsGet.");
                            return s = {}, void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/wall/posts".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/wall/posts",
                                method: "GET",
                                headers: n,
                                query: s
                            }, o)];
                        case 1:
                            return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                    data: (0, r.exists)(e, "data") ? e.data.map(S) : void 0
                                }
                            })]
                    }
                })
            })
        }, o.prototype.v1GroupsGroupIdWallPostsGet = function(e, r) {
            return (0, t.a)(this, void 0, void 0, function() {
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GroupsGroupIdWallPostsGetRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, o.prototype.v1GroupsGroupIdWallPostsPostRaw = function(e, o) {
            return (0, t.a)(this, void 0, void 0, function() {
                var s, n, i;
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdWallPostsPost.");
                            if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdWallPostsPost.");
                            return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/groups/{groupId}/wall/posts".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/wall/posts",
                                method: "POST",
                                headers: n,
                                query: s,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        body: e.body,
                                        captchaId: e.captchaId,
                                        captchaToken: e.captchaToken,
                                        captchaProvider: e.captchaProvider,
                                        challengeId: e.challengeId
                                    }
                                }(e.request)
                            }, o)];
                        case 1:
                            return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                return S(e)
                            })]
                    }
                })
            })
        }, o.prototype.v1GroupsGroupIdWallPostsPost = function(e, r) {
            return (0, t.a)(this, void 0, void 0, function() {
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GroupsGroupIdWallPostsPostRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, o.prototype.v1GroupsGroupIdWallPostsPostIdDeleteRaw = function(e, o) {
            return (0, t.a)(this, void 0, void 0, function() {
                var s, n, i;
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdWallPostsPostIdDelete.");
                            if (null === e.postId || void 0 === e.postId) throw new r.RequiredError("postId", "Required parameter requestParameters.postId was null or undefined when calling v1GroupsGroupIdWallPostsPostIdDelete.");
                            return s = {}, n = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/wall/posts/{postId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("postId", "}"), encodeURIComponent(String(e.postId))),
                                schemaPath: "/v1/groups/{groupId}/wall/posts/{postId}",
                                method: "DELETE",
                                headers: n,
                                query: s
                            }, o)];
                        case 1:
                            return i = t.sent(), [2, new r.JSONApiResponse(i)]
                    }
                })
            })
        }, o.prototype.v1GroupsGroupIdWallPostsPostIdDelete = function(e, r) {
            return (0, t.a)(this, void 0, void 0, function() {
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GroupsGroupIdWallPostsPostIdDeleteRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, o.prototype.v1GroupsGroupIdWallSubscribePostRaw = function(e, o) {
            return (0, t.a)(this, void 0, void 0, function() {
                var s, n, i;
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdWallSubscribePost.");
                            return s = {}, n = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/wall/subscribe".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/wall/subscribe",
                                method: "POST",
                                headers: n,
                                query: s
                            }, o)];
                        case 1:
                            return i = t.sent(), [2, new r.VoidApiResponse(i)]
                    }
                })
            })
        }, o.prototype.v1GroupsGroupIdWallSubscribePost = function(e, r) {
            return (0, t.a)(this, void 0, void 0, function() {
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GroupsGroupIdWallSubscribePostRaw(e, r)];
                        case 1:
                            return t.sent(), [2]
                    }
                })
            })
        }, o.prototype.v1GroupsGroupIdWallUsersUserIdPostsDeleteRaw = function(e, o) {
            return (0, t.a)(this, void 0, void 0, function() {
                var s, n, i;
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdWallUsersUserIdPostsDelete.");
                            if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1GroupsGroupIdWallUsersUserIdPostsDelete.");
                            return s = {}, n = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/wall/users/{userId}/posts".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/groups/{groupId}/wall/users/{userId}/posts",
                                method: "DELETE",
                                headers: n,
                                query: s
                            }, o)];
                        case 1:
                            return i = t.sent(), [2, new r.JSONApiResponse(i)]
                    }
                })
            })
        }, o.prototype.v1GroupsGroupIdWallUsersUserIdPostsDelete = function(e, r) {
            return (0, t.a)(this, void 0, void 0, function() {
                return (0, t.b)(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GroupsGroupIdWallUsersUserIdPostsDeleteRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    })(r.BaseAPI), e.s(["GroupFeaturesApi", 0, F, "GroupSearchApi", 0, J, "GroupsApi", 0, V, "MembershipApi", 0, _, "MigrationApi", 0, K, "RevenueApi", 0, j, "RobloxGroupsApiGroupFeatureResponseFeatureEnum", 0, {
        Payouts: "Payouts",
        ContentUpload: "ContentUpload",
        GroupOwnershipTransfer: "GroupOwnershipTransfer",
        GameOwnershipTransfer: "GameOwnershipTransfer"
    }, "RobloxGroupsApiGroupRoleResponseColorEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4,
        NUMBER_5: 5,
        NUMBER_6: 6,
        NUMBER_7: 7,
        NUMBER_8: 8,
        NUMBER_9: 9,
        NUMBER_10: 10,
        NUMBER_11: 11,
        NUMBER_12: 12,
        NUMBER_13: 13,
        NUMBER_14: 14,
        NUMBER_15: 15,
        NUMBER_16: 16
    }, "RobloxGroupsApiPayoutRecipientRequestRecipientTypeEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1
    }, "RobloxGroupsApiPayoutRequestPayoutTypeEnum", 0, {
        NUMBER_1: 1,
        NUMBER_2: 2
    }, "RobloxGroupsApiSetFeaturesRequestModelFeaturesPayoutsEnum", 0, {
        On: "On",
        Blocked: "Blocked"
    }, "RobloxGroupsApiSocialLinkRequestTypeEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4,
        NUMBER_5: 5,
        NUMBER_6: 6,
        NUMBER_7: 7,
        NUMBER_8: 8
    }, "RobloxGroupsApiSocialLinkResponseTypeEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4,
        NUMBER_5: 5,
        NUMBER_6: 6,
        NUMBER_7: 7,
        NUMBER_8: 8
    }, "RobloxGroupsApiWatermarkContributionRequestBalanceKeyEnum", 0, {
        NUMBER_1: 1,
        NUMBER_2: 2
    }, "RoleSetsApi", 0, W, "RolesApi", 0, H, "SocialLinksApi", 0, z, "V1GroupsGroupIdAuditLogGetActionTypeEnum", 0, {
        DeletePost: "DeletePost",
        RemoveMember: "RemoveMember",
        AcceptJoinRequest: "AcceptJoinRequest",
        DeclineJoinRequest: "DeclineJoinRequest",
        PostStatus: "PostStatus",
        ChangeRank: "ChangeRank",
        BuyAd: "BuyAd",
        SendAllyRequest: "SendAllyRequest",
        CreateEnemy: "CreateEnemy",
        AcceptAllyRequest: "AcceptAllyRequest",
        DeclineAllyRequest: "DeclineAllyRequest",
        DeleteAlly: "DeleteAlly",
        DeleteEnemy: "DeleteEnemy",
        AddGroupPlace: "AddGroupPlace",
        RemoveGroupPlace: "RemoveGroupPlace",
        CreateItems: "CreateItems",
        ConfigureItems: "ConfigureItems",
        SpendGroupFunds: "SpendGroupFunds",
        ChangeOwner: "ChangeOwner",
        Delete: "Delete",
        AdjustCurrencyAmounts: "AdjustCurrencyAmounts",
        Abandon: "Abandon",
        Claim: "Claim",
        Rename: "Rename",
        ChangeDescription: "ChangeDescription",
        InviteToClan: "InviteToClan",
        KickFromClan: "KickFromClan",
        CancelClanInvite: "CancelClanInvite",
        BuyClan: "BuyClan",
        CreateGroupAsset: "CreateGroupAsset",
        UpdateGroupAsset: "UpdateGroupAsset",
        ConfigureGroupAsset: "ConfigureGroupAsset",
        RevertGroupAsset: "RevertGroupAsset",
        CreateGroupDeveloperProduct: "CreateGroupDeveloperProduct",
        ConfigureGroupGame: "ConfigureGroupGame",
        CreateGroupDeveloperSubscriptionProduct: "CreateGroupDeveloperSubscriptionProduct",
        Lock: "Lock",
        Unlock: "Unlock",
        CreateGamePass: "CreateGamePass",
        CreateBadge: "CreateBadge",
        ConfigureBadge: "ConfigureBadge",
        SavePlace: "SavePlace",
        PublishPlace: "PublishPlace",
        UpdateRolesetRank: "UpdateRolesetRank",
        UpdateRolesetData: "UpdateRolesetData",
        BanMember: "BanMember",
        UnbanMember: "UnbanMember",
        CreateForumCategory: "CreateForumCategory",
        UpdateForumCategory: "UpdateForumCategory",
        ArchiveForumCategory: "ArchiveForumCategory",
        DeleteForumCategory: "DeleteForumCategory",
        DeleteForumPost: "DeleteForumPost",
        DeleteForumComment: "DeleteForumComment",
        PinForumPost: "PinForumPost",
        UnpinForumPost: "UnpinForumPost",
        LockForumPost: "LockForumPost",
        UnlockForumPost: "UnlockForumPost",
        CreateRoleset: "CreateRoleset",
        DeleteRoleset: "DeleteRoleset",
        CreateCommerceProduct: "CreateCommerceProduct",
        SetCommerceProductActive: "SetCommerceProductActive",
        ArchiveCommerceProduct: "ArchiveCommerceProduct",
        AcceptCommerceProductBundlingFee: "AcceptCommerceProductBundlingFee",
        SetCommerceProductInactive: "SetCommerceProductInactive",
        ConnectMerchant: "ConnectMerchant",
        DisconnectMerchant: "DisconnectMerchant",
        JoinGroup: "JoinGroup",
        LeaveGroup: "LeaveGroup",
        UpdateGroupIcon: "UpdateGroupIcon",
        UpdateGroupCoverPhoto: "UpdateGroupCoverPhoto",
        AssignRole: "AssignRole",
        UnassignRole: "UnassignRole",
        PublishAnnouncement: "PublishAnnouncement",
        DeleteAnnouncement: "DeleteAnnouncement",
        UpdateRoleSetPermissions: "UpdateRoleSetPermissions"
    }, "V1GroupsGroupIdAuditLogGetLimitEnum", 0, {
        NUMBER_10: 10,
        NUMBER_25: 25,
        NUMBER_50: 50,
        NUMBER_100: 100
    }, "V1GroupsGroupIdUsersGetLimitEnum", 0, {
        NUMBER_10: 10,
        NUMBER_25: 25,
        NUMBER_50: 50,
        NUMBER_100: 100
    }])
}, 206944, e => {
    "use strict";
    var r = e.i(677753),
        t = e.i(956378);

    function o(e, t) {
        return null == e ? e : {
            buildersClubMembershipType: (0, r.exists)(e, "buildersClubMembershipType") ? e.buildersClubMembershipType : void 0,
            hasVerifiedBadge: (0, r.exists)(e, "hasVerifiedBadge") ? e.hasVerifiedBadge : void 0,
            userId: (0, r.exists)(e, "userId") ? e.userId : void 0,
            username: (0, r.exists)(e, "username") ? e.username : void 0,
            displayName: (0, r.exists)(e, "displayName") ? e.displayName : void 0
        }
    }

    function s(e) {
        var t;
        return null == (t = e) ? t : {
            key: (0, r.exists)(t, "key") ? t.key : void 0,
            satisfied: (0, r.exists)(t, "satisfied") ? t.satisfied : void 0
        }
    }

    function n(e) {
        var t, n, i;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            description: (0, r.exists)(t, "description") ? t.description : void 0,
            owner: (0, r.exists)(t, "owner") ? o(t.owner) : void 0,
            shout: (0, r.exists)(t, "shout") ? null == (n = t.shout) ? n : {
                body: (0, r.exists)(n, "body") ? n.body : void 0,
                poster: (0, r.exists)(n, "poster") ? o(n.poster) : void 0,
                created: (0, r.exists)(n, "created") ? new Date(n.created) : void 0,
                updated: (0, r.exists)(n, "updated") ? new Date(n.updated) : void 0
            } : void 0,
            memberCount: (0, r.exists)(t, "memberCount") ? t.memberCount : void 0,
            isBuildersClubOnly: (0, r.exists)(t, "isBuildersClubOnly") ? t.isBuildersClubOnly : void 0,
            publicEntryAllowed: (0, r.exists)(t, "publicEntryAllowed") ? t.publicEntryAllowed : void 0,
            isLocked: (0, r.exists)(t, "isLocked") ? t.isLocked : void 0,
            hasVerifiedBadge: (0, r.exists)(t, "hasVerifiedBadge") ? t.hasVerifiedBadge : void 0,
            hasSocialModules: (0, r.exists)(t, "hasSocialModules") ? t.hasSocialModules : void 0,
            communityTier: (0, r.exists)(t, "communityTier") ? null == (i = t.communityTier) ? i : {
                groupId: (0, r.exists)(i, "groupId") ? i.groupId : void 0,
                currentTier: (0, r.exists)(i, "currentTier") ? i.currentTier : void 0,
                previousTier: (0, r.exists)(i, "previousTier") ? i.previousTier : void 0,
                tierUpdatedTime: (0, r.exists)(i, "tierUpdatedTime") ? new Date(i.tierUpdatedTime) : void 0,
                lastEvaluatedTime: (0, r.exists)(i, "lastEvaluatedTime") ? new Date(i.lastEvaluatedTime) : void 0,
                requirements: (0, r.exists)(i, "requirements") ? i.requirements.map(s) : void 0
            } : void 0
        }
    }

    function i(e) {
        var t;
        return null == (t = e) ? t : {
            type: (0, r.exists)(t, "type") ? t.type : void 0,
            enabled: (0, r.exists)(t, "enabled") ? t.enabled : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            description: (0, r.exists)(t, "description") ? t.description : void 0
        }
    }

    function u(e) {
        var t, o, s;
        return null == (t = e) ? t : {
            group: (0, r.exists)(t, "group") ? null == (o = t.group) ? o : {
                id: (0, r.exists)(o, "id") ? o.id : void 0,
                name: (0, r.exists)(o, "name") ? o.name : void 0,
                memberCount: (0, r.exists)(o, "memberCount") ? o.memberCount : void 0,
                hasVerifiedBadge: (0, r.exists)(o, "hasVerifiedBadge") ? o.hasVerifiedBadge : void 0
            } : void 0,
            role: (0, r.exists)(t, "role") ? null == (s = t.role) ? s : {
                id: (0, r.exists)(s, "id") ? s.id : void 0,
                name: (0, r.exists)(s, "name") ? s.name : void 0,
                rank: (0, r.exists)(s, "rank") ? s.rank : void 0
            } : void 0,
            isNotificationsEnabled: (0, r.exists)(t, "isNotificationsEnabled") ? t.isNotificationsEnabled : void 0,
            notificationPreferences: (0, r.exists)(t, "notificationPreferences") ? t.notificationPreferences.map(i) : void 0
        }
    }

    function a(e) {
        if (void 0 !== e) return null === e ? null : {
            permissions: e.permissions
        }
    }

    function d(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            rank: (0, r.exists)(t, "rank") ? t.rank : void 0,
            color: (0, r.exists)(t, "color") ? t.color : void 0,
            isPrivate: (0, r.exists)(t, "isPrivate") ? t.isPrivate : void 0
        }
    }

    function p(e) {
        var t;
        return null == (t = e) ? t : {
            user: (0, r.exists)(t, "user") ? o(t.user) : void 0,
            roles: (0, r.exists)(t, "roles") ? t.roles.map(d) : void 0
        }
    }

    function l(e) {
        var t, o, s;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            description: (0, r.exists)(t, "description") ? t.description : void 0,
            creator: (0, r.exists)(t, "creator") ? null == (o = t.creator) ? o : {
                id: (0, r.exists)(o, "id") ? o.id : void 0,
                type: (0, r.exists)(o, "type") ? o.type : void 0,
                name: (0, r.exists)(o, "name") ? o.name : void 0
            } : void 0,
            rootPlace: (0, r.exists)(t, "rootPlace") ? null == (s = t.rootPlace) ? s : {
                id: (0, r.exists)(s, "id") ? s.id : void 0,
                type: (0, r.exists)(s, "type") ? s.type : void 0,
                name: (0, r.exists)(s, "name") ? s.name : void 0
            } : void 0,
            created: (0, r.exists)(t, "created") ? new Date(t.created) : void 0,
            updated: (0, r.exists)(t, "updated") ? new Date(t.updated) : void 0,
            placeVisits: (0, r.exists)(t, "placeVisits") ? t.placeVisits : void 0
        }
    }

    function c(e, t) {
        var o;
        return null == e ? e : {
            groupId: (0, r.exists)(e, "groupId") ? e.groupId : void 0,
            relationshipType: (0, r.exists)(e, "relationshipType") ? e.relationshipType : void 0,
            groupResponses: (0, r.exists)(e, "groupResponses") ? null == (o = e.groupResponses) ? o : {
                previousPageCursor: (0, r.exists)(o, "previousPageCursor") ? o.previousPageCursor : void 0,
                nextPageCursor: (0, r.exists)(o, "nextPageCursor") ? o.nextPageCursor : void 0,
                data: (0, r.exists)(o, "data") ? o.data.map(n) : void 0
            } : void 0
        }
    }

    function v(e) {
        var t;
        return null == (t = e) ? t : {
            entityId: (0, r.exists)(t, "entityId") ? t.entityId : void 0,
            permissions: (0, r.exists)(t, "permissions") ? t.permissions : void 0
        }
    }

    function h(e) {
        var t;
        return null == (t = e) ? t : {
            isGranted: (0, r.exists)(t, "isGranted") ? t.isGranted : void 0,
            isGrantedByParentScope: (0, r.exists)(t, "isGrantedByParentScope") ? t.isGrantedByParentScope : void 0,
            canEdit: (0, r.exists)(t, "canEdit") ? t.canEdit : void 0
        }
    }

    function I(e, t) {
        return null == e ? e : {
            permissions: (0, r.exists)(e, "permissions") ? e.permissions : void 0
        }
    }

    function g(e, t) {
        return null == e ? e : {
            permissions: (0, r.exists)(e, "permissions") ? (0, r.mapValues)(e.permissions, h) : void 0
        }
    }

    function m(e) {
        var t, o;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            description: (0, r.exists)(t, "description") ? t.description : void 0,
            owner: (0, r.exists)(t, "owner") ? null == (o = t.owner) ? o : {
                id: (0, r.exists)(o, "id") ? o.id : void 0,
                type: (0, r.exists)(o, "type") ? o.type : void 0,
                name: (0, r.exists)(o, "name") ? o.name : void 0
            } : void 0,
            memberCount: (0, r.exists)(t, "memberCount") ? t.memberCount : void 0,
            created: (0, r.exists)(t, "created") ? new Date(t.created) : void 0,
            hasVerifiedBadge: (0, r.exists)(t, "hasVerifiedBadge") ? t.hasVerifiedBadge : void 0
        }
    }
    var R = function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }
            return (0, t._)(o, e), o.prototype.v2GroupsGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupIds || void 0 === e.groupIds) throw new r.RequiredError("groupIds", "Required parameter requestParameters.groupIds was null or undefined when calling v2GroupsGet.");
                                return s = {}, e.groupIds && (s.groupIds = e.groupIds.join(r.COLLECTION_FORMATS.csv)), n = {}, [4, this.request({
                                    path: "/v2/groups",
                                    schemaPath: "/v2/groups",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(m) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v2GroupsGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2GroupsGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdExperiencesGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v2GroupsGroupIdExperiencesGet.");
                                return s = {}, void 0 !== e.accessFilter && (s.accessFilter = e.accessFilter), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                    path: "/v2/groups/{groupId}/experiences".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v2/groups/{groupId}/experiences",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, r.exists)(e, "data") ? e.data.map(l) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdExperiencesGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2GroupsGroupIdExperiencesGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v2UsersUserIdGroupsRolesGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v2UsersUserIdGroupsRolesGet.");
                                if (null === e.includeLocked || void 0 === e.includeLocked) throw new r.RequiredError("includeLocked", "Required parameter requestParameters.includeLocked was null or undefined when calling v2UsersUserIdGroupsRolesGet.");
                                if (null === e.includeNotificationPreferences || void 0 === e.includeNotificationPreferences) throw new r.RequiredError("includeNotificationPreferences", "Required parameter requestParameters.includeNotificationPreferences was null or undefined when calling v2UsersUserIdGroupsRolesGet.");
                                if (null === e.discoveryType || void 0 === e.discoveryType) throw new r.RequiredError("discoveryType", "Required parameter requestParameters.discoveryType was null or undefined when calling v2UsersUserIdGroupsRolesGet.");
                                return s = {}, void 0 !== e.includeLocked && (s.includeLocked = e.includeLocked), void 0 !== e.includeNotificationPreferences && (s.includeNotificationPreferences = e.includeNotificationPreferences), void 0 !== e.discoveryType && (s.discoveryType = e.discoveryType), n = {}, [4, this.request({
                                    path: "/v2/users/{userId}/groups/roles".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v2/users/{userId}/groups/roles",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(u) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v2UsersUserIdGroupsRolesGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2UsersUserIdGroupsRolesGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o
        }(r.BaseAPI),
        w = function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }
            return (0, t._)(o, e), o.prototype.v2GroupsGroupIdUsersGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v2GroupsGroupIdUsersGet.");
                                return s = {}, void 0 !== e.roleSetId && (s.roleSetId = e.roleSetId), e.userIds && (s.userIds = e.userIds), void 0 !== e.includePrivate && (s.includePrivate = e.includePrivate), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                    path: "/v2/groups/{groupId}/users".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v2/groups/{groupId}/users",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, r.exists)(e, "data") ? e.data.map(p) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdUsersGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2GroupsGroupIdUsersGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdUsersSearchGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v2GroupsGroupIdUsersSearchGet.");
                                if (null === e.query || void 0 === e.query) throw new r.RequiredError("query", "Required parameter requestParameters.query was null or undefined when calling v2GroupsGroupIdUsersSearchGet.");
                                if (null === e.limit || void 0 === e.limit) throw new r.RequiredError("limit", "Required parameter requestParameters.limit was null or undefined when calling v2GroupsGroupIdUsersSearchGet.");
                                if (null === e.cursor || void 0 === e.cursor) throw new r.RequiredError("cursor", "Required parameter requestParameters.cursor was null or undefined when calling v2GroupsGroupIdUsersSearchGet.");
                                return s = {}, void 0 !== e.query && (s.query = e.query), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.includeRoles && (s.includeRoles = e.includeRoles), void 0 !== e.includePrivate && (s.includePrivate = e.includePrivate), n = {}, [4, this.request({
                                    path: "/v2/groups/{groupId}/users/search".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v2/groups/{groupId}/users/search",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        totalResults: (0, r.exists)(e, "totalResults") ? e.totalResults : void 0,
                                        previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, r.exists)(e, "data") ? e.data.map(p) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdUsersSearchGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2GroupsGroupIdUsersSearchGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o
        }(r.BaseAPI),
        G = function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }
            return (0, t._)(o, e), o.prototype.v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet.");
                                if (null === e.entityType || void 0 === e.entityType) throw new r.RequiredError("entityType", "Required parameter requestParameters.entityType was null or undefined when calling v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet.");
                                if (null === e.entityId || void 0 === e.entityId) throw new r.RequiredError("entityId", "Required parameter requestParameters.entityId was null or undefined when calling v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v2/groups/{groupId}/{entityType}/{entityId}/permissions/resolved".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("entityType", "}"), encodeURIComponent(String(e.entityType))).replace("{".concat("entityId", "}"), encodeURIComponent(String(e.entityId))),
                                    schemaPath: "/v2/groups/{groupId}/{entityType}/{entityId}/permissions/resolved",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdEntityTypePermissionsResolvedGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v2GroupsGroupIdEntityTypePermissionsResolvedGet.");
                                if (null === e.entityType || void 0 === e.entityType) throw new r.RequiredError("entityType", "Required parameter requestParameters.entityType was null or undefined when calling v2GroupsGroupIdEntityTypePermissionsResolvedGet.");
                                return s = {}, void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                    path: "/v2/groups/{groupId}/{entityType}/permissions/resolved".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("entityType", "}"), encodeURIComponent(String(e.entityType))),
                                    schemaPath: "/v2/groups/{groupId}/{entityType}/permissions/resolved",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, r.exists)(e, "data") ? e.data.map(v) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdEntityTypePermissionsResolvedGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2GroupsGroupIdEntityTypePermissionsResolvedGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdPermissionsResolvedGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v2GroupsGroupIdPermissionsResolvedGet.");
                                return s = {}, void 0 !== e.entityType && (s.entityType = e.entityType), void 0 !== e.entityId && (s.entityId = e.entityId), n = {}, [4, this.request({
                                    path: "/v2/groups/{groupId}/permissions/resolved".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v2/groups/{groupId}/permissions/resolved",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdPermissionsResolvedGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2GroupsGroupIdPermissionsResolvedGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdGet.");
                                if (null === e.roleId || void 0 === e.roleId) throw new r.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdGet.");
                                if (null === e.entityType || void 0 === e.entityType) throw new r.RequiredError("entityType", "Required parameter requestParameters.entityType was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdGet.");
                                if (null === e.entityId || void 0 === e.entityId) throw new r.RequiredError("entityId", "Required parameter requestParameters.entityId was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v2/groups/{groupId}/roles/{roleId}/permissions/{entityType}/{entityId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))).replace("{".concat("entityType", "}"), encodeURIComponent(String(e.entityType))).replace("{".concat("entityId", "}"), encodeURIComponent(String(e.entityId))),
                                    schemaPath: "/v2/groups/{groupId}/roles/{roleId}/permissions/{entityType}/{entityId}",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdPatchRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdPatch.");
                                if (null === e.roleId || void 0 === e.roleId) throw new r.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdPatch.");
                                if (null === e.entityType || void 0 === e.entityType) throw new r.RequiredError("entityType", "Required parameter requestParameters.entityType was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdPatch.");
                                if (null === e.entityId || void 0 === e.entityId) throw new r.RequiredError("entityId", "Required parameter requestParameters.entityId was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdPatch.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/groups/{groupId}/roles/{roleId}/permissions/{entityType}/{entityId}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))).replace("{".concat("entityType", "}"), encodeURIComponent(String(e.entityType))).replace("{".concat("entityId", "}"), encodeURIComponent(String(e.entityId))),
                                    schemaPath: "/v2/groups/{groupId}/roles/{roleId}/permissions/{entityType}/{entityId}",
                                    method: "PATCH",
                                    headers: n,
                                    query: s,
                                    body: a(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdPatch = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2GroupsGroupIdRolesRoleIdPermissionsEntityTypeEntityIdPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdRolesRoleIdPermissionsGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsGet.");
                                if (null === e.roleId || void 0 === e.roleId) throw new r.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsGet.");
                                if (null === e.entityType || void 0 === e.entityType) throw new r.RequiredError("entityType", "Required parameter requestParameters.entityType was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsGet.");
                                if (null === e.entityId || void 0 === e.entityId) throw new r.RequiredError("entityId", "Required parameter requestParameters.entityId was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v2/groups/{groupId}/roles/{roleId}/permissions".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))).replace("{".concat("entityType", "}"), encodeURIComponent(String(e.entityType))).replace("{".concat("entityId", "}"), encodeURIComponent(String(e.entityId))),
                                    schemaPath: "/v2/groups/{groupId}/roles/{roleId}/permissions",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdRolesRoleIdPermissionsGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2GroupsGroupIdRolesRoleIdPermissionsGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdRolesRoleIdPermissionsPatchRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsPatch.");
                                if (null === e.roleId || void 0 === e.roleId) throw new r.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsPatch.");
                                if (null === e.entityType || void 0 === e.entityType) throw new r.RequiredError("entityType", "Required parameter requestParameters.entityType was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsPatch.");
                                if (null === e.entityId || void 0 === e.entityId) throw new r.RequiredError("entityId", "Required parameter requestParameters.entityId was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v2GroupsGroupIdRolesRoleIdPermissionsPatch.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/groups/{groupId}/roles/{roleId}/permissions".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))).replace("{".concat("entityType", "}"), encodeURIComponent(String(e.entityType))).replace("{".concat("entityId", "}"), encodeURIComponent(String(e.entityId))),
                                    schemaPath: "/v2/groups/{groupId}/roles/{roleId}/permissions",
                                    method: "PATCH",
                                    headers: n,
                                    query: s,
                                    body: a(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdRolesRoleIdPermissionsPatch = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2GroupsGroupIdRolesRoleIdPermissionsPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o
        }(r.BaseAPI),
        f = (function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }(0, t._)(o, e), o.prototype.v2GroupsGroupIdRelationshipsGroupRelationshipTypeGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v2GroupsGroupIdRelationshipsGroupRelationshipTypeGet.");
                                if (null === e.groupRelationshipType || void 0 === e.groupRelationshipType) throw new r.RequiredError("groupRelationshipType", "Required parameter requestParameters.groupRelationshipType was null or undefined when calling v2GroupsGroupIdRelationshipsGroupRelationshipTypeGet.");
                                return s = {}, void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                    path: "/v2/groups/{groupId}/relationships/{groupRelationshipType}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("groupRelationshipType", "}"), encodeURIComponent(String(e.groupRelationshipType))),
                                    schemaPath: "/v2/groups/{groupId}/relationships/{groupRelationshipType}",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdRelationshipsGroupRelationshipTypeGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2GroupsGroupIdRelationshipsGroupRelationshipTypeGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsGetRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v2GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsGet.");
                                if (null === e.groupRelationshipType || void 0 === e.groupRelationshipType) throw new r.RequiredError("groupRelationshipType", "Required parameter requestParameters.groupRelationshipType was null or undefined when calling v2GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsGet.");
                                return s = {}, void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                    path: "/v2/groups/{groupId}/relationships/{groupRelationshipType}/requests".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("groupRelationshipType", "}"), encodeURIComponent(String(e.groupRelationshipType))),
                                    schemaPath: "/v2/groups/{groupId}/relationships/{groupRelationshipType}/requests",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsGet = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2GroupsGroupIdRelationshipsGroupRelationshipTypeRequestsGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }
        }(r.BaseAPI), function(e) {
            function o() {
                return null !== e && e.apply(this, arguments) || this
            }
            return (0, t._)(o, e), o.prototype.v2GroupsGroupIdRolesRoleIdPositionPatchRaw = function(e, o) {
                return (0, t.a)(this, void 0, void 0, function() {
                    var s, n, i;
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v2GroupsGroupIdRolesRoleIdPositionPatch.");
                                if (null === e.roleId || void 0 === e.roleId) throw new r.RequiredError("roleId", "Required parameter requestParameters.roleId was null or undefined when calling v2GroupsGroupIdRolesRoleIdPositionPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v2GroupsGroupIdRolesRoleIdPositionPatch.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/groups/{groupId}/roles/{roleId}/position".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("roleId", "}"), encodeURIComponent(String(e.roleId))),
                                    schemaPath: "/v2/groups/{groupId}/roles/{roleId}/position",
                                    method: "PATCH",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            previousRoleId: e.previousRoleId,
                                            nextRoleId: e.nextRoleId
                                        }
                                    }(e.request)
                                }, o)];
                            case 1:
                                return i = t.sent(), [2, new r.JSONApiResponse(i)]
                        }
                    })
                })
            }, o.prototype.v2GroupsGroupIdRolesRoleIdPositionPatch = function(e, r) {
                return (0, t.a)(this, void 0, void 0, function() {
                    return (0, t.b)(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v2GroupsGroupIdRolesRoleIdPositionPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, o
        }(r.BaseAPI));
    e.s(["GroupsV2Api", 0, R, "MembershipV2Api", 0, w, "PermissionsV2Api", 0, G, "RobloxGroupsApiModelsRequestUpdateRolePermissionsForEntityRequestPermissionsEnum", 0, {
        Granted: "granted",
        Denied: "denied"
    }, "RolesetsV2Api", 0, f, "V2GroupsGroupIdUsersGetLimitEnum", 0, {
        NUMBER_10: 10,
        NUMBER_25: 25,
        NUMBER_50: 50,
        NUMBER_100: 100
    }, "V2GroupsGroupIdUsersGetSortOrderEnum", 0, {
        Asc: "Asc",
        Desc: "Desc"
    }, "V2UsersUserIdGroupsRolesGetDiscoveryTypeEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2
    }])
}, 956378, e => {
    "use strict";
    var r = function(e, t) {
        return (r = Object.setPrototypeOf || ({
            __proto__: []
        }) instanceof Array && function(e, r) {
            e.__proto__ = r
        } || function(e, r) {
            for (var t in r) Object.prototype.hasOwnProperty.call(r, t) && (e[t] = r[t])
        })(e, t)
    };
    "function" == typeof SuppressedError && SuppressedError, e.s(["_", 0, function(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function o() {
            this.constructor = e
        }
        r(e, t), e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o)
    }, "a", 0, function(e, r, t, o) {
        return new(t || (t = Promise))(function(s, n) {
            function i(e) {
                try {
                    a(o.next(e))
                } catch (e) {
                    n(e)
                }
            }

            function u(e) {
                try {
                    a(o.throw(e))
                } catch (e) {
                    n(e)
                }
            }

            function a(e) {
                var r;
                e.done ? s(e.value) : ((r = e.value) instanceof t ? r : new t(function(e) {
                    e(r)
                })).then(i, u)
            }
            a((o = o.apply(e, r || [])).next())
        })
    }, "b", 0, function(e, r) {
        var t, o, s, n = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function u(u) {
            return function(a) {
                var d = [u, a];
                if (t) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, d[0] && (n = 0)), n;) try {
                    if (t = 1, o && (s = 2 & d[0] ? o.return : d[0] ? o.throw || ((s = o.return) && s.call(o), 0) : o.next) && !(s = s.call(o, d[1])).done) return s;
                    switch (o = 0, s && (d = [2 & d[0], s.value]), d[0]) {
                        case 0:
                        case 1:
                            s = d;
                            break;
                        case 4:
                            return n.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            n.label++, o = d[1], d = [0];
                            continue;
                        case 7:
                            d = n.ops.pop(), n.trys.pop();
                            continue;
                        default:
                            if (!(s = (s = n.trys).length > 0 && s[s.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                n = 0;
                                continue
                            }
                            if (3 === d[0] && (!s || d[1] > s[0] && d[1] < s[3])) {
                                n.label = d[1];
                                break
                            }
                            if (6 === d[0] && n.label < s[1]) {
                                n.label = s[1], s = d;
                                break
                            }
                            if (s && n.label < s[2]) {
                                n.label = s[2], n.ops.push(d);
                                break
                            }
                            s[2] && n.ops.pop(), n.trys.pop();
                            continue
                    }
                    d = r.call(e, n)
                } catch (e) {
                    d = [6, e], o = 0
                } finally {
                    t = s = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }])
}]);

//# debugId=9ff32f76-a373-53e6-9793-b3a2cc99ab94
//# sourceMappingURL=1jdv2rnh3r2on.js.map