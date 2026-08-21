local parent = script:FindFirstAncestor("SponsoredTiles").Parent
local reactModule = require(parent.React)
local useOverflowMenuOpen = require(parent.AppBlox).useOverflowMenuOpen
local gameTileOverflowMenuAction = require(parent.DiscoveryAnalytics).Events.gameTileOverflowMenuAction
local gameTileOverflowMenu = require(parent.GameTile).GameTileOverflowMenu
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppEnableHomepageOneByTwoTile = sharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId

return function(p0) --[[ line: 38 | named "SpanTileOverflowMenu" ]]
	-- upvalues: useOverflowMenuOpen (ref), reactModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), gameTileOverflowMenuAction (ref), gameTileOverflowMenu (ref), fFlagLuaAppNotInterestedReportPlaceId (ref)
	local var8
	local hoverKey = p0.hoverKey
	local var2 = useOverflowMenuOpen(hoverKey)
	local var3 = reactModule.useMemo(function() --[[ line: 42 ]]
		-- upvalues: p0 (ref)
		local t = {}
		
		for i, v in p0.availableMenuItems do
			table.insert(t, i)
		end
		return table.concat(t, ",")
	end, { p0.availableMenuItems })
	local var4 = reactModule.useCallback(function(p1, p2) --[[ line: 51 ]]
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
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useCallback(function(p3, p4) --[[ line: 80 ]]
		-- upvalues: var5 (ref), var4 (ref)
		var5.current = true
		var4(p3, p4)
	end, { var4 })
	local var7 = reactModule.useRef(var2)
	reactModule.useEffect(function() --[[ line: 88 ]]
		-- upvalues: var2 (ref), var7 (ref), var5 (ref), var4 (ref), var3 (ref)
		if var2 ~= var7.current then
			var7.current = var2
			
			if var2 and not var5.current then
				var4(false, var3)
			end
			var5.current = false
		end
	end, { var2, var3, var4 })
	
	if not p0.isHovered and not p0.isSelected then
		var8 = var2 and next(p0.availableMenuItems) ~= nil
	end
	return if var8 then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p0.zIndex
	}, {
		OverflowMenu = reactModule.createElement(gameTileOverflowMenu, {
			isHovered = p0.isHovered,
			isSelected = p0.isSelected,
			universeId = tostring(p0.universeId or ""),
			placeId = if fFlagLuaAppNotInterestedReportPlaceId then p0.placeId else nil,
			collectionId = p0.topicId,
			appPage = p0.appPage,
			setGameHidden = p0.setGameHidden,
			menuKey = hoverKey,
			menuOpen = var2,
			onMenuOpenChanged = var6,
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