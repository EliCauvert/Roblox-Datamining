local Parent = script:FindFirstAncestor("SponsoredTiles").Parent
local ReactModule = require(Parent.React)
local UseOverflowMenuOpenFunction = require(Parent.AppBlox).useOverflowMenuOpen
local GameTileOverflowMenuActionFunction = require(Parent.DiscoveryAnalytics).Events.gameTileOverflowMenuAction
local GameTileModule = require(Parent.GameTile)
local GameTileContextualActions = GameTileModule.GameTileContextualActions
local GameTileOverflowMenu = GameTileModule.GameTileOverflowMenu
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppGameTileNotInterestedDirectAction = SharedFlagsModule.FFlagLuaAppGameTileNotInterestedDirectAction
local FFlagLuaAppEnableHomepageOneByTwoTile = SharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile

return function(p1) --[[ Line: 38 | Named "SpanTileOverflowMenu" ]]
	-- upvalues: UseOverflowMenuOpenFunction (copy), ReactModule (copy), FFlagLuaAppEnableHomepageOneByTwoTile (copy), GameTileOverflowMenuActionFunction (copy), FFlagLuaAppGameTileNotInterestedDirectAction (copy), GameTileContextualActions (copy), GameTileOverflowMenu (copy)
	local HoverKey = p1.hoverKey
	local UseOverflowMenuOpenResult = UseOverflowMenuOpenFunction(HoverKey)
	local UseMemoResult = ReactModule.useMemo(function(): string --[[ Line: 42 ]]
		-- upvalues: p1 (copy)
		local List = {}
		
		for i, _ in p1.availableMenuItems do
			table.insert(List, i)
		end
		return table.concat(List, ",")
	end, { p1.availableMenuItems })
	local UseResult = ReactModule.useCallback(function(p2, AvailableMenuItems) --[[ Line: 51 ]]
		-- upvalues: FFlagLuaAppEnableHomepageOneByTwoTile (upval), p1 (copy), GameTileOverflowMenuActionFunction (upval)
		GameTileOverflowMenuActionFunction({
			universeId = if FFlagLuaAppEnableHomepageOneByTwoTile then tostring(p1.universeId or "") else p1.universeId,
			sortId = p1.topicId,
			actionType = if p2 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = AvailableMenuItems,
			contentType = if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
		}, p1.appPage or "Unknown")
	end, {
		p1.universeId,
		p1.appPage,
		p1.topicId,
		if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
	})
	local UseRefResult = ReactModule.useRef(false)
	local UseResult1 = ReactModule.useCallback(function(p2, p3) --[[ Line: 76 ]]
		-- upvalues: UseRefResult (copy), UseResult (copy)
		UseRefResult.current = true
		UseResult(p2, p3)
	end, { UseResult })
	local UseRefResult1 = ReactModule.useRef(UseOverflowMenuOpenResult)
	ReactModule.useEffect(function() --[[ Line: 84 ]]
		-- upvalues: UseOverflowMenuOpenResult (copy), UseRefResult1 (copy), UseRefResult (copy), UseResult (copy), UseMemoResult (copy)
		if UseOverflowMenuOpenResult ~= UseRefResult1.current then
			UseRefResult1.current = UseOverflowMenuOpenResult
			
			if UseOverflowMenuOpenResult and not UseRefResult.current then
				UseResult(false, UseMemoResult)
			end
			UseRefResult.current = false
		end
	end, { UseOverflowMenuOpenResult, UseMemoResult, UseResult })
	local HasNextEntry: boolean = if p1.isHovered or p1.isSelected then next(p1.availableMenuItems) ~= nil else UseOverflowMenuOpenResult and next(p1.availableMenuItems) ~= nil
	
	return if HasNextEntry then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p1.zIndex
	}, {
		OverflowMenu = ReactModule.createElement(if FFlagLuaAppGameTileNotInterestedDirectAction then GameTileContextualActions else GameTileOverflowMenu, {
			isHovered = p1.isHovered,
			isSelected = p1.isSelected,
			universeId = tostring(p1.universeId or ""),
			placeId = p1.placeId,
			collectionId = p1.topicId,
			appPage = p1.appPage,
			setGameHidden = p1.setGameHidden,
			menuKey = HoverKey,
			menuOpen = UseOverflowMenuOpenResult,
			onMenuOpenChanged = UseResult1,
			parentRef = p1.parentRef,
			isSponsored = p1.isSponsored,
			payerName = p1.payerName,
			sponsoredUserCohort = p1.sponsoredUserCohort,
			adId = p1.adId,
			availableMenuItems = p1.availableMenuItems,
			contentType = if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
		})
	}) else nil
end