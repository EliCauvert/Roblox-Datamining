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
local textKeysModule = require(socialTabsPage.Common.TextKeys)

return function() --[[ line: 26 | named "FriendsTabContent" ]]
	-- upvalues: useSocialTabsContextModule (ref), useFriendsListModule (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), dashModule (ref), entityType (ref), useFetchPresencesModule (ref), useSortedEntitiesByPresenceModule (ref), useUserListCTAsModule (ref), useCTAActionHandlersModule (ref), rowDataProviderModule (ref), view (ref), loading (ref), socialTabsEmptyStateModule (ref), userListLayoutAdaptor (ref), layoutMode (ref)
	local var14 = useSocialTabsContextModule()
	local title = var14.title
	local var15 = useFriendsListModule({ targetUserId = var14.profileId })
	local friends = var15.friends
	local loading_1 = var15.loading
	local hasMore = var15.hasMore
	local fetchMore = var15.fetchMore
	local var16 = useLocalization({
		emptyText = { textKeysModule.NoConnectionYet, name = title or "" }
	})
	local var17 = reactModule.useMemo(function() --[[ line: 46 ]]
		-- upvalues: dashModule (copy), friends (ref), entityType (copy)
		return dashModule.map(friends, function(p0) --[[ line: 47 ]]
			-- upvalues: entityType (copy)
			return { id = tostring(p0.id), type = entityType.User }
		end)
	end, { friends })
	local var18 = reactModule.useMemo(function() --[[ line: 52 ]]
		-- upvalues: dashModule (copy), var17 (ref)
		return dashModule.map(var17, function(p1) --[[ line: 53 ]]
			return p1.id
		end)
	end, { var17 })
	useFetchPresencesModule(var18)
	local var19 = useSortedEntitiesByPresenceModule(var17)
	local var20 = useUserListCTAsModule(var18)
	local var21 = useCTAActionHandlersModule()
	
	return if loading_1 and #var17 == 0 then reactModule.createElement(view, { tag = "col align-x-center align-y-center size-full" }, { LoadingIndicator = reactModule.createElement(loading) }) elseif loading_1 or #var17 ~= 0 then reactModule.createElement(view, { tag = "col size-full padding-x-xlarge" }, {
		FriendsList = reactModule.createElement(userListLayoutAdaptor, {
			isScrollEnabled = true,
			entities = var19,
			layoutMode = layoutMode.Vertical,
			hasMore = hasMore,
			onLoadMore = if hasMore then fetchMore else nil,
			renderRow = reactModule.useCallback(function(p2, p3, _) --[[ line: 65 ]]
				-- upvalues: reactModule (copy), rowDataProviderModule (copy), var20 (ref), var21 (ref)
				return reactModule.createElement(rowDataProviderModule, {
					createRow = p2,
					entity = p3,
					ctaResult = var20[p3.id],
					actionHandlers = var21
				})
			end, { var20, var21 })
		})
	}) else reactModule.createElement(socialTabsEmptyStateModule, { text = var16.emptyText })
end