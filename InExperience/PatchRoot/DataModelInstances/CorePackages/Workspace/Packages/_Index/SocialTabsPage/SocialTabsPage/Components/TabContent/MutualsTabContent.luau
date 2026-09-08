local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local loading = foundationModule.Loading
local userListModule = require(parent.UserList)
local userListLayoutAdaptor = userListModule.UserListLayoutAdaptor
local layoutMode = userListModule.Enums.LayoutMode
local entityType = userListModule.Enums.EntityType
local rowDataProviderModule = require(socialTabsPage.Components.RowDataProvider)
local useSocialTabsContextModule = require(socialTabsPage.Contexts.useSocialTabsContext)
local useMutualsListModule = require(socialTabsPage.Hooks.useMutualsList)
local useFetchPresencesModule = require(socialTabsPage.Hooks.useFetchPresences)
local useSortedEntitiesByPresenceModule = require(socialTabsPage.Hooks.useSortedEntitiesByPresence)
local useUserListCTAsModule = require(socialTabsPage.Hooks.useUserListCTAs)
local useCTAActionHandlersModule = require(socialTabsPage.Hooks.useCTAActionHandlers)
local socialTabsCtaConfigModule = require(socialTabsPage.Common.SocialTabsCtaConfig)
local fFlagSocialTabsPagePresenceSignalsMigrationModule = require(socialTabsPage.Flags.FFlagSocialTabsPagePresenceSignalsMigration)
local fFlagUserListCtaIntegrationEnabled = require(parent.SharedFlags).FFlagUserListCtaIntegrationEnabled

return function()
	-- upvalues: useSocialTabsContextModule (ref), useMutualsListModule (ref), reactModule (ref), dashModule (ref), entityType (ref), fFlagSocialTabsPagePresenceSignalsMigrationModule (ref), useFetchPresencesModule (ref), useSortedEntitiesByPresenceModule (ref), fFlagUserListCtaIntegrationEnabled (ref), useUserListCTAsModule (ref), useCTAActionHandlersModule (ref), rowDataProviderModule (ref), view (ref), loading (ref), userListLayoutAdaptor (ref), layoutMode (ref), socialTabsCtaConfigModule (ref)
	local var1 = useMutualsListModule(useSocialTabsContextModule().profileId)
	local var2 = reactModule.useMemo(function()
		-- upvalues: dashModule (copy), var1 (ref), entityType (copy)
		return dashModule.map(var1.mutualFriends, function(p1)
			-- upvalues: entityType (copy)
			return { id = p1.id, type = entityType.User }
		end)
	end, { var1.mutualFriends })
	local var3 = reactModule.useMemo(function()
		-- upvalues: dashModule (copy), var2 (ref)
		return dashModule.map(var2, function(p1)
			return p1.id
		end)
	end, { var2 })
	
	if not fFlagSocialTabsPagePresenceSignalsMigrationModule then
		useFetchPresencesModule(var3)
	end
	local var4 = useSortedEntitiesByPresenceModule(var2)
	local var5 = nil
	
	if not fFlagUserListCtaIntegrationEnabled then
		local var6 = useUserListCTAsModule(var3)
		local var7 = useCTAActionHandlersModule()
		var5 = reactModule.useCallback(function(p1, p2, _)
			-- upvalues: reactModule (copy), rowDataProviderModule (copy), var6 (ref), var7 (ref)
			return reactModule.createElement(rowDataProviderModule, {
				createRow = p1,
				entity = p2,
				ctaResult = var6[p2.id],
				actionHandlers = var7
			})
		end, { var6, var7 })
	end
	return if var1.isLoading and #var2 == 0 then reactModule.createElement(view, { tag = "col align-x-center align-y-center size-full" }, { LoadingIndicator = reactModule.createElement(loading) }) else reactModule.createElement(view, { tag = "col size-full padding-x-xlarge" }, {
		MutualsList = reactModule.createElement(userListLayoutAdaptor, {
			isScrollEnabled = true,
			entities = var4,
			layoutMode = layoutMode.Vertical,
			hasMore = var1.hasMore,
			onLoadMore = if var1.hasMore then var1.loadMore else nil,
			renderRow = var5,
			ctaConfig = if fFlagUserListCtaIntegrationEnabled then socialTabsCtaConfigModule else nil
		})
	})
end