local parent = script:FindFirstAncestor("GameCollections").Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppHomeTouchAutoplay = require(parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local fFlagLuaAppFixCustomTileBugs = require(parent.SharedFlags).FFlagLuaAppFixCustomTileBugs
local reactModule = require(parent.React)
local emphasisGameTile = require(parent.GameTile).EmphasisGameTile
local _ = require(parent.VideoUtils)
local var1 = reactModule.memo(function(p0) --[[ line: 53 ]]
	-- upvalues: reactModule (ref), emphasisGameTile (ref), fFlagLuaAppFixCustomTileBugs (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), fFlagLuaAppHomeTouchAutoplay (ref)
	return reactModule.createElement(emphasisGameTile, {
		size = p0.item.sizeOverride,
		index = p0.index,
		layoutOrder = p0.index,
		selectionOrder = if fFlagLuaAppFixCustomTileBugs then nil else p0.selectionOrder,
		SelectionOrder = if fFlagLuaAppFixCustomTileBugs then p0.SelectionOrder else nil,
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
		videoPlaybackContext = if fFlagLuaAppHomeTouchAutoplay then p0.videoPlaybackContext else nil
	})
end)

return function(p1) --[[ line: 87 ]]
	-- upvalues: reactModule (ref), var1 (ref), gameCollectionItemTypes (ref)
	return reactModule.createElement(var1, p1), gameCollectionItemTypes.GameCollectionItemType.EmphasisTile
end