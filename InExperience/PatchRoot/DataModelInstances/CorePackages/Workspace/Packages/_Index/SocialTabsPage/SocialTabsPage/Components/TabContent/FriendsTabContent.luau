local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local loading = foundationModule.Loading
local useLocalization = require(parent.Localization).Hooks.useLocalization
local userListModule = require(parent.UserList)
local userListLayoutAdaptor = userListModule.UserListLayoutAdaptor
local layoutMode = userListModule.Enums.LayoutMode
local entityType = userListModule.Enums.EntityType
local socialTabsEmptyStateModule = require(socialTabsPage.Components.SocialTabsEmptyState)
local rowDataProviderModule = require(socialTabsPage.Components.RowDataProvider)
local useSocialTabsContextModule = require(socialTabsPage.Contexts.useSocialTabsContext)
local useFriendsListModule = require(socialTabsPage.Hooks.useFriendsList)
local useFetchPresencesModule = require(socialTabsPage.Hooks.useFetchPresences)
local useSortedEntitiesByPresenceModule = require(socialTabsPage.Hooks.useSortedEntitiesByPresence)
local useUserListCTAsModule = require(socialTabsPage.Hooks.useUserListCTAs)
local useCTAActionHandlersModule = require(socialTabsPage.Hooks.useCTAActionHandlers)
local socialTabsCtaConfigModule = require(socialTabsPage.Common.SocialTabsCtaConfig)
local textKeysModule = require(socialTabsPage.Common.TextKeys)
local fFlagSocialTabsPagePresenceSignalsMigrationModule = require(socialTabsPage.Flags.FFlagSocialTabsPagePresenceSignalsMigration)
local fFlagUserListCtaIntegrationEnabled = require(parent.SharedFlags).FFlagUserListCtaIntegrationEnabled

return function()
	-- upvalues: useSocialTabsContextModule (ref), useFriendsListModule (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), dashModule (ref), entityType (ref), fFlagSocialTabsPagePresenceSignalsMigrationModule (ref), useFetchPresencesModule (ref), useSortedEntitiesByPresenceModule (ref), fFlagUserListCtaIntegrationEnabled (ref), useUserListCTAsModule (ref), useCTAActionHandlersModule (ref), rowDataProviderModule (ref), view (ref), loading (ref), socialTabsEmptyStateModule (ref), userListLayoutAdaptor (ref), layoutMode (ref), socialTabsCtaConfigModule (ref)
	local var1 = useSocialTabsContextModule()
	local title = var1.title
	local var2 = useFriendsListModule({ targetUserId = var1.profileId })
	local friends = var2.friends
	local loading_1 = var2.loading
	local hasMore = var2.hasMore
	local fetchMore = var2.fetchMore
	local var3 = useLocalization({
		emptyText = { textKeysModule.NoConnectionYet, name = title or "" }
	})
	local var4 = reactModule.useMemo(function()
		-- upvalues: dashModule (copy), friends (ref), entityType (copy)
		return dashModule.map(friends, function(p1)
			-- upvalues: entityType (copy)
			return { id = tostring(p1.id), type = entityType.User }
		end)
	end, { friends })
	local var5 = reactModule.useMemo(function()
		-- upvalues: dashModule (copy), var4 (ref)
		return dashModule.map(var4, function(p1)
			return p1.id
		end)
	end, { var4 })
	
	if not fFlagSocialTabsPagePresenceSignalsMigrationModule then
		useFetchPresencesModule(var5)
	end
	local var6 = useSortedEntitiesByPresenceModule(var4)
	local var7 = nil
	
	if not fFlagUserListCtaIntegrationEnabled then
		local var8 = useUserListCTAsModule(var5)
		local var9 = useCTAActionHandlersModule()
		var7 = reactModule.useCallback(function(p1, p2, _)
			-- upvalues: reactModule (copy), rowDataProviderModule (copy), var8 (ref), var9 (ref)
			return reactModule.createElement(rowDataProviderModule, {
				createRow = p1,
				entity = p2,
				ctaResult = var8[p2.id],
				actionHandlers = var9
			})
		end, { var8, var9 })
	end
	return if loading_1 and #var4 == 0 then reactModule.createElement(view, { tag = "col align-x-center align-y-center size-full" }, { LoadingIndicator = reactModule.createElement(loading) }) elseif loading_1 or #var4 ~= 0 then reactModule.createElement(view, { tag = "col size-full padding-x-xlarge" }, {
		FriendsList = reactModule.createElement(userListLayoutAdaptor, {
			isScrollEnabled = true,
			entities = var6,
			layoutMode = layoutMode.Vertical,
			hasMore = hasMore,
			onLoadMore = if hasMore then fetchMore else nil,
			renderRow = var7,
			ctaConfig = if fFlagUserListCtaIntegrationEnabled then socialTabsCtaConfigModule else nil
		})
	}) else reactModule.createElement(socialTabsEmptyStateModule, { text = var3.emptyText })
end