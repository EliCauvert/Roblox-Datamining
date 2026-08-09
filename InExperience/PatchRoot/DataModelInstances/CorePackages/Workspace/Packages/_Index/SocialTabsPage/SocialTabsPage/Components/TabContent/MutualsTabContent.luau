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

return function() --[[ line: 23 | named "MutualsTabContent" ]]
	-- upvalues: useSocialTabsContextModule (ref), useMutualsListModule (ref), reactModule (ref), dashModule (ref), entityType (ref), useFetchPresencesModule (ref), useSortedEntitiesByPresenceModule (ref), useUserListCTAsModule (ref), useCTAActionHandlersModule (ref), rowDataProviderModule (ref), view (ref), loading (ref), userListLayoutAdaptor (ref), layoutMode (ref)
	local var12 = useMutualsListModule(useSocialTabsContextModule().profileId)
	local var13 = reactModule.useMemo(function() --[[ line: 29 ]]
		-- upvalues: dashModule (copy), var12 (ref), entityType (copy)
		return dashModule.map(var12.mutualFriends, function(p0) --[[ line: 30 ]]
			-- upvalues: entityType (copy)
			return { id = p0.id, type = entityType.User }
		end)
	end, { var12.mutualFriends })
	local var14 = reactModule.useMemo(function() --[[ line: 35 ]]
		-- upvalues: dashModule (copy), var13 (ref)
		return dashModule.map(var13, function(p1) --[[ line: 36 ]]
			return p1.id
		end)
	end, { var13 })
	useFetchPresencesModule(var14)
	local var15 = useSortedEntitiesByPresenceModule(var13)
	local var16 = useUserListCTAsModule(var14)
	local var17 = useCTAActionHandlersModule()
	
	return if var12.isLoading and #var13 == 0 then reactModule.createElement(view, { tag = "col align-x-center align-y-center size-full" }, { LoadingIndicator = reactModule.createElement(loading) }) else reactModule.createElement(view, { tag = "col size-full padding-x-xlarge" }, {
		MutualsList = reactModule.createElement(userListLayoutAdaptor, {
			isScrollEnabled = true,
			entities = var15,
			layoutMode = layoutMode.Vertical,
			hasMore = var12.hasMore,
			onLoadMore = if var12.hasMore then var12.loadMore else nil,
			renderRow = reactModule.useCallback(function(p2, p3, _) --[[ line: 48 ]]
				-- upvalues: reactModule (copy), rowDataProviderModule (copy), var16 (ref), var17 (ref)
				return reactModule.createElement(rowDataProviderModule, {
					createRow = p2,
					entity = p3,
					ctaResult = var16[p3.id],
					actionHandlers = var17
				})
			end, { var16, var17 })
		})
	})
end