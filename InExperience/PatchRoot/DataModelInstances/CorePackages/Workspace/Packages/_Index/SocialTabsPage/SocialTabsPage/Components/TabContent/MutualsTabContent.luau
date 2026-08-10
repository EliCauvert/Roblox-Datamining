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
local fFlagSocialTabsPagePresenceSignalsMigrationModule = require(socialTabsPage.Flags.FFlagSocialTabsPagePresenceSignalsMigration)

return function() --[[ line: 26 | named "MutualsTabContent" ]]
	-- upvalues: useSocialTabsContextModule (ref), useMutualsListModule (ref), reactModule (ref), dashModule (ref), entityType (ref), fFlagSocialTabsPagePresenceSignalsMigrationModule (ref), useFetchPresencesModule (ref), useSortedEntitiesByPresenceModule (ref), useUserListCTAsModule (ref), useCTAActionHandlersModule (ref), rowDataProviderModule (ref), view (ref), loading (ref), userListLayoutAdaptor (ref), layoutMode (ref)
	local var13 = useMutualsListModule(useSocialTabsContextModule().profileId)
	local var14 = reactModule.useMemo(function() --[[ line: 32 ]]
		-- upvalues: dashModule (copy), var13 (ref), entityType (copy)
		return dashModule.map(var13.mutualFriends, function(p0) --[[ line: 33 ]]
			-- upvalues: entityType (copy)
			return { id = p0.id, type = entityType.User }
		end)
	end, { var13.mutualFriends })
	local var15 = reactModule.useMemo(function() --[[ line: 38 ]]
		-- upvalues: dashModule (copy), var14 (ref)
		return dashModule.map(var14, function(p1) --[[ line: 39 ]]
			return p1.id
		end)
	end, { var14 })
	
	if not fFlagSocialTabsPagePresenceSignalsMigrationModule then
		useFetchPresencesModule(var15)
	end
	local var16 = useSortedEntitiesByPresenceModule(var14)
	local var17 = useUserListCTAsModule(var15)
	local var18 = useCTAActionHandlersModule()
	
	return if var13.isLoading and #var14 == 0 then reactModule.createElement(view, { tag = "col align-x-center align-y-center size-full" }, { LoadingIndicator = reactModule.createElement(loading) }) else reactModule.createElement(view, { tag = "col size-full padding-x-xlarge" }, {
		MutualsList = reactModule.createElement(userListLayoutAdaptor, {
			isScrollEnabled = true,
			entities = var16,
			layoutMode = layoutMode.Vertical,
			hasMore = var13.hasMore,
			onLoadMore = if var13.hasMore then var13.loadMore else nil,
			renderRow = reactModule.useCallback(function(p2, p3, _) --[[ line: 55 ]]
				-- upvalues: reactModule (copy), rowDataProviderModule (copy), var17 (ref), var18 (ref)
				return reactModule.createElement(rowDataProviderModule, {
					createRow = p2,
					entity = p3,
					ctaResult = var17[p3.id],
					actionHandlers = var18
				})
			end, { var17, var18 })
		})
	})
end