local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local TModule = require(Parent.t)
local _ = require(Parent.VideoUtils)
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(Parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppGameCarouselAmpUpsellAction = require(Parent.SharedFlags).FFlagLuaAppGameCarouselAmpUpsellAction

return {
	interface = TModule.strictInterface({
		feedItemPosition = TModule.number,
		feedItemStartRow = TModule.optional(TModule.number),
		scrollViewPositionChangedSignal = TModule.table,
		refreshSignal = TModule.table,
		appPage = TModule.string,
		verticalScrollingFrameRef = TModule.table,
		sduiContext = TModule.table,
		selectionOrderBase = TModule.optional(TModule.number),
		defaultContainerSize = TModule.optional(TModule.Vector2),
		appCompositionEnabled = TModule.optional(TModule.boolean),
		onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then TModule.optional(TModule.callback) else nil,
		videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then TModule.optional(TModule.table) else nil,
		refreshFeed = if FFlagLuaAppGameCarouselAmpUpsellAction then TModule.optional(TModule.callback) else nil
	}),
	key = require(Parent.DiscoveryTypes).OmniFeedPropsKey,
	new = function(FeedItemPosition, FeedItemStartRow, ScrollViewPositionChangedSignal, RefreshSignal, AppPage, VerticalScrollingFrameRef, SduiContext, SelectionOrderBase, DefaultContainerSize, AppCompositionEnabled, p1, p2, p3)
		-- upvalues: FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppHomeTouchAutoplay (copy), FFlagLuaAppGameCarouselAmpUpsellAction (copy)
		return {
			feedItemPosition = FeedItemPosition,
			feedItemStartRow = FeedItemStartRow,
			scrollViewPositionChangedSignal = ScrollViewPositionChangedSignal,
			refreshSignal = RefreshSignal,
			appPage = AppPage,
			verticalScrollingFrameRef = VerticalScrollingFrameRef,
			sduiContext = SduiContext,
			selectionOrderBase = SelectionOrderBase,
			defaultContainerSize = DefaultContainerSize,
			appCompositionEnabled = AppCompositionEnabled,
			onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1 else nil,
			videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then p2 else nil,
			refreshFeed = if FFlagLuaAppGameCarouselAmpUpsellAction then p3 else nil
		}
	end
}