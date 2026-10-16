local Parent = script:FindFirstAncestor("GameCollections").Parent
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local FFlagLuaAppEmphasisGameTileVideo = require(Parent.SharedFlags).FFlagLuaAppEmphasisGameTileVideo
local ReactModule = require(Parent.React)
local EmphasisGameTile = require(Parent.GameTile).EmphasisGameTile
local _ = require(Parent.VideoUtils)
local MemoResult = ReactModule.memo(function(p1) --[[ Line: 48 ]]
	-- upvalues: ReactModule (copy), EmphasisGameTile (copy), FFlagLuaAppEmphasisGameTileVideo (copy)
	return ReactModule.createElement(EmphasisGameTile, {
		size = p1.item.sizeOverride,
		index = p1.index,
		layoutOrder = p1.index,
		SelectionOrder = p1.SelectionOrder,
		isDisabled = p1.isDisabled,
		onSelectionGained = p1.onHoldableFocused,
		onSelectionLost = p1.onHoldableUnfocused,
		entry = p1.item,
		topicId = p1.topicId,
		source = p1.source,
		referralSource = p1.referralSource,
		playerCountStyle = p1.playerCountStyle,
		hideGameStats = p1.hideGameStats,
		gameTileLayoutType = p1.gameTileLayoutType,
		useHoverTile = p1.hoverTileEnabled,
		isContained = p1.isContained,
		reportGameDetailOpened = p1.reportGameDetailOpened,
		reportExperienceLaunched = p1.reportExperienceLaunched,
		launchExperienceEventContext = p1.launchExperienceEventContext,
		onPeekViewClosed = p1.onPeekViewClosed,
		navigateToGameDetails = p1.navigateToGameDetails,
		impressionsTag = p1.impressionsTag,
		textSizeOffset = p1.textSizeOffset,
		showDescription = p1.item.showDescription,
		zIndex = p1.zIndex,
		videoPlaybackContext = p1.videoPlaybackContext,
		appPage = if FFlagLuaAppEmphasisGameTileVideo then p1.appPage else nil,
		videoAnalytics = if FFlagLuaAppEmphasisGameTileVideo then p1.videoAnalytics else nil
	})
end)

return function(p1) --[[ Line: 82 ]]
	-- upvalues: ReactModule (copy), MemoResult (copy), GameCollectionItemTypes (copy)
	return ReactModule.createElement(MemoResult, p1), GameCollectionItemTypes.GameCollectionItemType.EmphasisTile
end