local parent = script:FindFirstAncestor("SponsoredTiles").Parent
local reactModule = require(parent.React)
local useOverflowMenuOpen = require(parent.AppBlox).useOverflowMenuOpen
local gameTileOverflowMenuAction = require(parent.DiscoveryAnalytics).Events.gameTileOverflowMenuAction
local gameTileModule = require(parent.GameTile)
local gameTileContextualActions = gameTileModule.GameTileContextualActions
local gameTileOverflowMenu = gameTileModule.GameTileOverflowMenu
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppGameTileNotInterestedDirectAction = sharedFlagsModule.FFlagLuaAppGameTileNotInterestedDirectAction
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppEnableHomepageOneByTwoTile = sharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId

return function(p0) --[[ line: 40 | named "SpanTileOverflowMenu" ]]
	-- upvalues: useOverflowMenuOpen (ref), reactModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppGameTileNotInterestedDirectAction (ref), gameTileContextualActions (ref), gameTileOverflowMenu (ref), fFlagLuaAppNotInterestedReportPlaceId (ref)
	local var9
	local hoverKey = p0.hoverKey
	local var3 = useOverflowMenuOpen(hoverKey)
	local var4 = reactModule.useMemo(function() --[[ line: 44 ]]
		-- upvalues: p0 (ref)
		local t = {}
		
		for i, v in p0.availableMenuItems do
			table.insert(t, i)
		end
		return table.concat(t, ",")
	end, { p0.availableMenuItems })
	local var5 = reactModule.useCallback(function(p1, p2) --[[ line: 53 ]]
		-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), gameTileOverflowMenuAction (copy)
		gameTileOverflowMenuAction({
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
			universeId = if fFlagLuaAppEnableHomepageOneByTwoTile then tostring(p0.universeId or "") else p0.universeId,
			sortId = p0.topicId,
			actionType = if p1 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = p2,
			contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p0.contentType else nil
		}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage or "Unknown" else nil)
	end, {
		p0.universeId,
		p0.appPage,
		p0.topicId,
		if fFlagLuaAppEnableHomepageOneByTwoTile then p0.contentType else nil
	})
	local var6 = reactModule.useRef(false)
	local var7 = reactModule.useCallback(function(p3, p4) --[[ line: 82 ]]
		-- upvalues: var6 (ref), var5 (ref)
		var6.current = true
		var5(p3, p4)
	end, { var5 })
	local var8 = reactModule.useRef(var3)
	reactModule.useEffect(function() --[[ line: 90 ]]
		-- upvalues: var3 (ref), var8 (ref), var6 (ref), var5 (ref), var4 (ref)
		if var3 ~= var8.current then
			var8.current = var3
			
			if var3 and not var6.current then
				var5(false, var4)
			end
			var6.current = false
		end
	end, { var3, var4, var5 })
	
	if not p0.isHovered and not p0.isSelected then
		var9 = var3 and next(p0.availableMenuItems) ~= nil
	end
	return if var9 then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p0.zIndex
	}, {
		OverflowMenu = reactModule.createElement(if fFlagLuaAppGameTileNotInterestedDirectAction then gameTileContextualActions else gameTileOverflowMenu, {
			isHovered = p0.isHovered,
			isSelected = p0.isSelected,
			universeId = tostring(p0.universeId or ""),
			placeId = if fFlagLuaAppNotInterestedReportPlaceId then p0.placeId else nil,
			collectionId = p0.topicId,
			appPage = p0.appPage,
			setGameHidden = p0.setGameHidden,
			menuKey = hoverKey,
			menuOpen = var3,
			onMenuOpenChanged = var7,
			parentRef = p0.parentRef,
			isSponsored = p0.isSponsored,
			payerName = p0.payerName,
			sponsoredUserCohort = p0.sponsoredUserCohort,
			adId = p0.adId,
			availableMenuItems = p0.availableMenuItems,
			contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p0.contentType else nil
		})
	}) else nil
end