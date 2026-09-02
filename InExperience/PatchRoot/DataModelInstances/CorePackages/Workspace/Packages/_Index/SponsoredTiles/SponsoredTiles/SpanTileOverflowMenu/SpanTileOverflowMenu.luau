local parent = script:FindFirstAncestor("SponsoredTiles").Parent
local reactModule = require(parent.React)
local useOverflowMenuOpen = require(parent.AppBlox).useOverflowMenuOpen
local gameTileOverflowMenuAction = require(parent.DiscoveryAnalytics).Events.gameTileOverflowMenuAction
local gameTileModule = require(parent.GameTile)
local gameTileContextualActions = gameTileModule.GameTileContextualActions
local gameTileOverflowMenu = gameTileModule.GameTileOverflowMenu
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppGameTileNotInterestedDirectAction = sharedFlagsModule.FFlagLuaAppGameTileNotInterestedDirectAction
local fFlagLuaAppEnableHomepageOneByTwoTile = sharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId

return function(p1)
	-- upvalues: useOverflowMenuOpen (ref), reactModule (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppGameTileNotInterestedDirectAction (ref), gameTileContextualActions (ref), gameTileOverflowMenu (ref), fFlagLuaAppNotInterestedReportPlaceId (ref)
	local var1
	local hoverKey = p1.hoverKey
	local var2 = useOverflowMenuOpen(hoverKey)
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		local t = {}
		
		for i, v in p1.availableMenuItems do
			table.insert(t, i)
		end
		return table.concat(t, ",")
	end, { p1.availableMenuItems })
	local var4 = reactModule.useCallback(function(p2, p3)
		-- upvalues: fFlagLuaAppEnableHomepageOneByTwoTile (copy), p1 (ref), gameTileOverflowMenuAction (copy)
		gameTileOverflowMenuAction({
			universeId = if fFlagLuaAppEnableHomepageOneByTwoTile then tostring(p1.universeId or "") else p1.universeId,
			sortId = p1.topicId,
			actionType = if p2 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = p3,
			contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
		}, p1.appPage or "Unknown")
	end, {
		p1.universeId,
		p1.appPage,
		p1.topicId,
		if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
	})
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var5 (ref), var4 (ref)
		var5.current = true
		var4(p2, p3)
	end, { var4 })
	local var7 = reactModule.useRef(var2)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var7 (ref), var5 (ref), var4 (ref), var3 (ref)
		if var2 ~= var7.current then
			var7.current = var2
			
			if var2 and not var5.current then
				var4(false, var3)
			end
			var5.current = false
		end
	end, { var2, var3, var4 })
	
	if not p1.isHovered and not p1.isSelected then
		var1 = var2 and next(p1.availableMenuItems) ~= nil
	end
	return if var1 then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p1.zIndex
	}, {
		OverflowMenu = reactModule.createElement(if fFlagLuaAppGameTileNotInterestedDirectAction then gameTileContextualActions else gameTileOverflowMenu, {
			isHovered = p1.isHovered,
			isSelected = p1.isSelected,
			universeId = tostring(p1.universeId or ""),
			placeId = if fFlagLuaAppNotInterestedReportPlaceId then p1.placeId else nil,
			collectionId = p1.topicId,
			appPage = p1.appPage,
			setGameHidden = p1.setGameHidden,
			menuKey = hoverKey,
			menuOpen = var2,
			onMenuOpenChanged = var6,
			parentRef = p1.parentRef,
			isSponsored = p1.isSponsored,
			payerName = p1.payerName,
			sponsoredUserCohort = p1.sponsoredUserCohort,
			adId = p1.adId,
			availableMenuItems = p1.availableMenuItems,
			contentType = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
		})
	}) else nil
end