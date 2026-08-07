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
local fFlagSocialTabsPagePresenceSignalsMigrationModule = require(socialTabsPage.Flags.FFlagSocialTabsPagePresenceSignalsMigration)

return function() --[[ line: 29 | named "FriendsTabContent" ]]
	-- upvalues: useSocialTabsContextModule (ref), useFriendsListModule (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), dashModule (ref), entityType (ref), fFlagSocialTabsPagePresenceSignalsMigrationModule (ref), useFetchPresencesModule (ref), useSortedEntitiesByPresenceModule (ref), useUserListCTAsModule (ref), useCTAActionHandlersModule (ref), rowDataProviderModule (ref), view (ref), loading (ref), socialTabsEmptyStateModule (ref), userListLayoutAdaptor (ref), layoutMode (ref)
	local var15 = useSocialTabsContextModule()
	local title = var15.title
	local var16 = useFriendsListModule({ targetUserId = var15.profileId })
	local friends = var16.friends
	local loading_1 = var16.loading
	local hasMore = var16.hasMore
	local fetchMore = var16.fetchMore
	local var17 = useLocalization({
		emptyText = { textKeysModule.NoConnectionYet, name = title or "" }
	})
	local var18 = reactModule.useMemo(function() --[[ line: 49 ]]
		-- upvalues: dashModule (copy), friends (ref), entityType (copy)
		return dashModule.map(friends, function(p0) --[[ line: 50 ]]
			-- upvalues: entityType (copy)
			return { id = tostring(p0.id), type = entityType.User }
		end)
	end, { friends })
	local var19 = reactModule.useMemo(function() --[[ line: 55 ]]
		-- upvalues: dashModule (copy), var18 (ref)
		return dashModule.map(var18, function(p1) --[[ line: 56 ]]
			return p1.id
		end)
	end, { var18 })
	
	if not fFlagSocialTabsPagePresenceSignalsMigrationModule then
		useFetchPresencesModule(var19)
	end
	local var20 = useSortedEntitiesByPresenceModule(var18)
	local var21 = useUserListCTAsModule(var19)
	local var22 = useCTAActionHandlersModule()
	
	return if loading_1 and #var18 == 0 then reactModule.createElement(view, { tag = "col align-x-center align-y-center size-full" }, { LoadingIndicator = reactModule.createElement(loading) }) elseif loading_1 or #var18 ~= 0 then reactModule.createElement(view, { tag = "col size-full padding-x-xlarge" }, {
		FriendsList = reactModule.createElement(userListLayoutAdaptor, {
			isScrollEnabled = true,
			entities = var20,
			layoutMode = layoutMode.Vertical,
			hasMore = hasMore,
			onLoadMore = if hasMore then fetchMore else nil,
			renderRow = reactModule.useCallback(function(p2, p3, _) --[[ line: 72 ]]
				-- upvalues: reactModule (copy), rowDataProviderModule (copy), var21 (ref), var22 (ref)
				return reactModule.createElement(rowDataProviderModule, {
					createRow = p2,
					entity = p3,
					ctaResult = var21[p3.id],
					actionHandlers = var22
				})
			end, { var21, var22 })
		})
	}) else reactModule.createElement(socialTabsEmptyStateModule, { text = var17.emptyText })
end