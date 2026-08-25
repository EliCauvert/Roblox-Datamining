local parent = script:FindFirstAncestor("GameCollections").Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppEmphasisGameTileVideo = require(parent.SharedFlags).FFlagLuaAppEmphasisGameTileVideo
local reactModule = require(parent.React)
local emphasisGameTile = require(parent.GameTile).EmphasisGameTile
local _ = require(parent.VideoUtils)
local var1 = reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), emphasisGameTile (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), fFlagLuaAppEmphasisGameTileVideo (ref)
	return reactModule.createElement(emphasisGameTile, {
		size = p0.item.sizeOverride,
		index = p0.index,
		layoutOrder = p0.index,
		SelectionOrder = p0.SelectionOrder,
		isDisabled = p0.isDisabled,
		onSelectionGained = p0.onHoldableFocused,
		onSelectionLost = p0.onHoldableUnfocused,
		entry = p0.item,
		topicId = p0.topicId,
		source = p0.source,
		referralSource = p0.referralSource,
		playerCountStyle = p0.playerCountStyle,
		hideGameStats = p0.hideGameStats,
		gameTileLayoutType = p0.gameTileLayoutType,
		useHoverTile = p0.hoverTileEnabled,
		isContained = p0.isContained,
		reportGameDetailOpened = p0.reportGameDetailOpened,
		reportExperienceLaunched = p0.reportExperienceLaunched,
		launchExperienceEventContext = p0.launchExperienceEventContext,
		onPeekViewClosed = p0.onPeekViewClosed,
		navigateToGameDetails = p0.navigateToGameDetails,
		impressionsTag = p0.impressionsTag,
		textSizeOffset = p0.textSizeOffset,
		showDescription = p0.item.showDescription,
		zIndex = p0.zIndex,
		onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p0.onTileImageLoaded else nil,
		videoPlaybackContext = p0.videoPlaybackContext,
		appPage = if fFlagLuaAppEmphasisGameTileVideo then p0.appPage else nil,
		videoAnalytics = if fFlagLuaAppEmphasisGameTileVideo then p0.videoAnalytics else nil
	})
end)

return function(p1)
	-- upvalues: reactModule (ref), var1 (ref), gameCollectionItemTypes (ref)
	return reactModule.createElement(var1, p1), gameCollectionItemTypes.GameCollectionItemType.EmphasisTile
end