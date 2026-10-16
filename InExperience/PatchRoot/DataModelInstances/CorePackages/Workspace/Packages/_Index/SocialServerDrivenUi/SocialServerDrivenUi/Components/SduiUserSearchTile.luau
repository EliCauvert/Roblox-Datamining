local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local UserSearchModule = require(Parent.UserSearch)
local UserSearchTile = UserSearchModule.UserSearchTile
local AnalyticsFunction = UserSearchModule.Analytics.Analytics
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local SharedFlagsModule = require(Parent.SharedFlags)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FindAnalyticsFieldInAncestorsFunction = require(Parent.SduiCoreSystem).findAnalyticsFieldInAncestors
local CalculateRowPositionFieldsFunction = require(Parent.UnifiedLogging).calculateRowPositionFields
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local FFlagLuaAppSearchPeopleUnifiedSchemaFields = SharedFlagsModule.FFlagLuaAppSearchPeopleUnifiedSchemaFields
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return ReactModule.memo(function(p1) --[[ Line: 43 | Named "SduiUserSearchTile" ]]
	-- upvalues: UseDispatchFunction (copy), FindAnalyticsFieldInAncestorsFunction (copy), ReactModule (copy), AnalyticsFunction (copy), CalculateRowPositionFieldsFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), UserSearchTile (copy), FFlagLuaAppSearchPeopleUnifiedSchemaFields (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UserId = p1.userId
	local SearchQuery = FindAnalyticsFieldInAncestorsFunction("searchQuery", p1.analyticsContext) or ""
	local UserSearchSessionId = FindAnalyticsFieldInAncestorsFunction("userSearchSessionId", p1.analyticsContext)
	local CollectionId = FindAnalyticsFieldInAncestorsFunction("collectionId", p1.analyticsContext)
	local CollectionPosition = FindAnalyticsFieldInAncestorsFunction("collectionPosition", p1.analyticsContext)
	local AppPage1 = if p1.sduiContext then p1.sduiContext.appPage else nil
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 54 ]]
		-- upvalues: AnalyticsFunction (upval), UserSearchSessionId (copy), CollectionPosition (copy), CollectionId (copy), AppPage1 (copy)
		return AnalyticsFunction({
			infoForAllEvents = {
				userSearchSessionId = UserSearchSessionId,
				sortPosition = CollectionPosition,
				sortId = CollectionId,
				pageContext = AppPage1
			}
		}).fireAnalyticsEvent
	end, {
		UserSearchSessionId,
		CollectionPosition,
		CollectionId,
		AppPage1
	})
	local CollectionData = if p1.analyticsContext and p1.analyticsContext.getCollectionData then p1.analyticsContext.getCollectionData() else nil
	local RowPositionFields = CalculateRowPositionFieldsFunction(p1.index, if CollectionData then CollectionData.itemsPerRow else nil, if CollectionData then CollectionData.startRowNumber else nil)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 74 ]]
		-- upvalues: AppPage (upval), UserSearchSessionId (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local config = {
			name = AppPage.ProfilePlatform,
			detail = p2.userId,
			extraProps = {
				profileType = "User",
				profilePeekViewProps = {
					resetPeekView = false,
					source = "PlayerSearch",
					contextualInfoType = p2.contextualInfoType,
					contextualInfoDisplay = p2.contextualInfoDisplay,
					analyticsProps = if UserSearchSessionId then { userSearchSessionId = UserSearchSessionId } else nil
				}
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, { UseDispatchResult, UserSearchSessionId })
	
	return if UserId == nil or UserId == "" then nil else ReactModule.createElement(UserSearchTile, {
		subpage = "UserSearchFeedItem",
		shouldUseCompactTiles = true,
		user = {
			id = UserId,
			name = p1.name or "",
			displayName = p1.displayName or "",
			previousUsernames = p1.previousUsernames or {}
		},
		index = p1.index or 0,
		size = UDim2.fromScale(1, 1),
		searchParameters = { searchKeyword = SearchQuery },
		luaAppNavigation = { navigateToUserInfo = UseResult },
		fireAnalyticsEvent = UseMemoResult,
		rowInSort = RowPositionFields.rowInSort,
		positionInRow = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then RowPositionFields.positionInRow else nil,
		feedRowNumber = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then RowPositionFields.rowOnPage else nil
	})
end)