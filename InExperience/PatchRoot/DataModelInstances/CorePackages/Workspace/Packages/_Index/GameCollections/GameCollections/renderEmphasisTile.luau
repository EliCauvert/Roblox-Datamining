local parent = script:FindFirstAncestor("GameCollections").Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppEmphasisGameTileVideo = require(parent.SharedFlags).FFlagLuaAppEmphasisGameTileVideo
local reactModule = require(parent.React)
local emphasisGameTile = require(parent.GameTile).EmphasisGameTile
local _ = require(parent.VideoUtils)
local var1 = reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), emphasisGameTile (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), fFlagLuaAppEmphasisGameTileVideo (ref)
	return reactModule.createElement(emphasisGameTile, {
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
		onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1.onTileImageLoaded else nil,
		videoPlaybackContext = p1.videoPlaybackContext,
		appPage = if fFlagLuaAppEmphasisGameTileVideo then p1.appPage else nil,
		videoAnalytics = if fFlagLuaAppEmphasisGameTileVideo then p1.videoAnalytics else nil
	})
end)

return function(p1)
	-- upvalues: reactModule (ref), var1 (ref), gameCollectionItemTypes (ref)
	return reactModule.createElement(var1, p1), gameCollectionItemTypes.GameCollectionItemType.EmphasisTile
end