local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local userSearchModule = require(parent.UserSearch)
local userSearchTile = userSearchModule.UserSearchTile
local analytics = userSearchModule.Analytics.Analytics
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local sharedFlagsModule = require(parent.SharedFlags)
local appPage = require(parent.RobloxAppEnums).AppPage
local findAnalyticsFieldInAncestors = sduiCoreSystemModule.findAnalyticsFieldInAncestors
local calculateRowPositionFields = require(parent.UnifiedLogging).calculateRowPositionFields
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local fFlagLuaAppSearchPeopleUnifiedSchemaFields = sharedFlagsModule.FFlagLuaAppSearchPeopleUnifiedSchemaFields
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), findAnalyticsFieldInAncestors (ref), reactModule (ref), analytics (ref), calculateRowPositionFields (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), userSearchTile (ref), fFlagLuaAppSearchPeopleUnifiedSchemaFields (ref)
	local var2 = useDispatch()
	local userId = p1.userId
	local searchQuery = findAnalyticsFieldInAncestors("searchQuery", p1.analyticsContext) or ""
	local var3 = findAnalyticsFieldInAncestors("userSearchSessionId", p1.analyticsContext)
	local var4 = findAnalyticsFieldInAncestors("collectionId", p1.analyticsContext)
	local var5 = findAnalyticsFieldInAncestors("collectionPosition", p1.analyticsContext)
	local var6 = if p1.sduiContext then p1.sduiContext.appPage else nil
	local var7 = reactModule.useMemo(function()
		-- upvalues: analytics (copy), var3 (ref), var5 (ref), var4 (ref), var6 (ref)
		return analytics({
			infoForAllEvents = {
				userSearchSessionId = var3,
				sortPosition = var5,
				sortId = var4,
				pageContext = var6
			}
		}).fireAnalyticsEvent
	end, { var3, var5, var4, var6 })
	local var8 = if p1.analyticsContext and p1.analyticsContext.getCollectionData then p1.analyticsContext.getCollectionData() else nil
	local var9 = calculateRowPositionFields(p1.index, if var8 then var8.itemsPerRow else nil, if var8 then var8.startRowNumber else nil)
	
	return if userId == nil or userId == "" then nil else reactModule.createElement(userSearchTile, {
		subpage = "UserSearchFeedItem",
		shouldUseCompactTiles = true,
		user = {
			id = userId,
			name = p1.name or "",
			displayName = p1.displayName or "",
			previousUsernames = p1.previousUsernames or {}
		},
		index = p1.index or 0,
		size = UDim2.fromScale(1, 1),
		searchParameters = { searchKeyword = searchQuery },
		luaAppNavigation = {
			navigateToUserInfo = reactModule.useCallback(function(p2)
				-- upvalues: appPage (copy), var3 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy)
				local t = {
					name = appPage.ProfilePlatform,
					detail = p2.userId,
					extraProps = {
						profileType = "User",
						profilePeekViewProps = {
							resetPeekView = false,
							source = "PlayerSearch",
							contextualInfoType = p2.contextualInfoType,
							contextualInfoDisplay = p2.contextualInfoDisplay,
							analyticsProps = if var3 then { userSearchSessionId = var3 } else nil
						}
					}
				}
				
				if fFlagSignalsNavP3Dispatch then
					var1.down(var1.fromLegacyPage(t))
					
					return
				end
				var2(navigateDown(t))
			end, { var2, var3 })
		},
		fireAnalyticsEvent = var7,
		rowInSort = var9.rowInSort,
		positionInRow = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then var9.positionInRow else nil,
		feedRowNumber = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then var9.rowOnPage else nil
	})
end)