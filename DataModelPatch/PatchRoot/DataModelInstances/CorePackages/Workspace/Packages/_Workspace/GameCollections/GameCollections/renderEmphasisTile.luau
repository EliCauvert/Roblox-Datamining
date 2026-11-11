local Parent = script:FindFirstAncestor("GameCollections").Parent
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(Parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppFixCustomTileBugs = require(Parent.SharedFlags).FFlagLuaAppFixCustomTileBugs
local ReactModule = require(Parent.React)
local EmphasisGameTile = require(Parent.GameTile).EmphasisGameTile
local _ = require(Parent.VideoUtils)
local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), EmphasisGameTile (copy), FFlagLuaAppFixCustomTileBugs (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppHomeTouchAutoplay (copy)
	return ReactModule.createElement(EmphasisGameTile, {
		size = p1.item.sizeOverride,
		index = p1.index,
		layoutOrder = p1.index,
		selectionOrder = if FFlagLuaAppFixCustomTileBugs then nil else p1.selectionOrder,
		SelectionOrder = if FFlagLuaAppFixCustomTileBugs then p1.SelectionOrder else nil,
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
		onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1.onTileImageLoaded else nil,
		videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then p1.videoPlaybackContext else nil
	})
end)

return function(p1)
	-- upvalues: ReactModule (copy), MemoResult (copy), GameCollectionItemTypes (copy)
	return ReactModule.createElement(MemoResult, p1), GameCollectionItemTypes.GameCollectionItemType.EmphasisTile
end