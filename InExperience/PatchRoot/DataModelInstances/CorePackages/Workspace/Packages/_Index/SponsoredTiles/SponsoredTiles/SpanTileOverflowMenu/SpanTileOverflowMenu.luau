local parent = script:FindFirstAncestor("SponsoredTiles").Parent
local reactModule = require(parent.React)
local useOverflowMenuOpen = require(parent.AppBlox).useOverflowMenuOpen
local gameTileOverflowMenuAction = require(parent.DiscoveryAnalytics).Events.gameTileOverflowMenuAction
local gameTileOverflowMenu = require(parent.GameTile).GameTileOverflowMenu
local fFlagLuaAppFixExplicitFeedbackTelemetry = require(parent.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry

return function(p0) --[[ line: 33 | named "SpanTileOverflowMenu" ]]
	-- upvalues: useOverflowMenuOpen (ref), reactModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), gameTileOverflowMenuAction (ref), gameTileOverflowMenu (ref)
	local var7
	local hoverKey = p0.hoverKey
	local var1 = useOverflowMenuOpen(hoverKey)
	local var2 = reactModule.useMemo(function() --[[ line: 37 ]]
		-- upvalues: p0 (ref)
		local t = {}
		
		for i, v in p0.availableMenuItems do
			table.insert(t, i)
		end
		return table.concat(t, ",")
	end, { p0.availableMenuItems })
	local var3 = reactModule.useCallback(function(p1, p2) --[[ line: 46 ]]
		-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), gameTileOverflowMenuAction (copy)
		gameTileOverflowMenuAction({
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
			universeId = p0.universeId,
			sortId = p0.topicId,
			actionType = if p1 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = p2
		}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage or "Unknown" else nil)
	end, { p0.universeId, p0.appPage, p0.topicId })
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useCallback(function(p3, p4) --[[ line: 67 ]]
		-- upvalues: var4 (ref), var3 (ref)
		var4.current = true
		var3(p3, p4)
	end, { var3 })
	local var6 = reactModule.useRef(var1)
	reactModule.useEffect(function() --[[ line: 75 ]]
		-- upvalues: var1 (ref), var6 (ref), var4 (ref), var3 (ref), var2 (ref)
		if var1 ~= var6.current then
			var6.current = var1
			
			if var1 and not var4.current then
				var3(false, var2)
			end
			var4.current = false
		end
	end, { var1, var2, var3 })
	
	if not p0.isHovered and not p0.isSelected then
		var7 = var1 and next(p0.availableMenuItems) ~= nil
	end
	return if var7 then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p0.zIndex
	}, {
		OverflowMenu = reactModule.createElement(gameTileOverflowMenu, {
			isHovered = p0.isHovered,
			isSelected = p0.isSelected,
			universeId = tostring(p0.universeId or ""),
			collectionId = p0.topicId,
			appPage = p0.appPage,
			setGameHidden = p0.setGameHidden,
			menuKey = hoverKey,
			menuOpen = var1,
			onMenuOpenChanged = var5,
			parentRef = p0.parentRef,
			isSponsored = p0.isSponsored,
			payerName = p0.payerName,
			sponsoredUserCohort = p0.sponsoredUserCohort,
			adId = p0.adId,
			availableMenuItems = p0.availableMenuItems
		})
	}) else nil
end