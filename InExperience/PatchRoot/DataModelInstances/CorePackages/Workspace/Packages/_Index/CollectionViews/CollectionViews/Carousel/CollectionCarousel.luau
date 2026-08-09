local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local useDesignTokens = require(parent.Style).useDesignTokens
local responsiveModule = require(parent.Responsive)
local useLastInput = responsiveModule.useLastInput
local usePreferredInput = responsiveModule.usePreferredInput
local useIsSpatial = responsiveModule.useIsSpatial
local tModule = require(parent.t)
local validateProps = require(parent.DiscoveryUtils).validateProps
local useCollectionSizeBindingsModule = require(collectionViews.useCollectionSizeBindings)
local useScrollButtonHandlersModule = require(collectionViews.Carousel.useScrollButtonHandlers)
local useCarouselScrollingBindingModule = require(collectionViews.Carousel.useCarouselScrollingBinding)
local collectionBackgroundMuralModule = require(collectionViews.Carousel.CollectionBackgroundMural)
local collectionHeaderModule = require(collectionViews.CollectionHeader)
local scrollingRowOfCollectionItemsModule = require(collectionViews.Carousel.ScrollingRowOfCollectionItems)
local maybeForceDarkThemeModule = require(collectionViews.maybeForceDarkTheme)
local carouselScrollButtonsModule = require(collectionViews.Carousel.CarouselScrollButtons)
local _ = require(collectionViews.CollectionViewTypes)
local useCollectionLayoutModule = require(collectionViews.CollectionLayoutStore.useCollectionLayout)
local compositionTags = require(parent.AppComposition).CompositionTags
local calculateCarouselSpacingMetricsModule = require(collectionViews.Carousel.calculateCarouselSpacingMetrics)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagRenameDeprecatedUIBloxTokens = sharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local fFlagLuaAppCompositionSupport = sharedFlagsModule.FFlagLuaAppCompositionSupport
local fFlagCollectionViewMathChanges = sharedFlagsModule.FFlagCollectionViewMathChanges
local fFlagLuaAppEnableVRCarouselScrolling = sharedFlagsModule.FFlagLuaAppEnableVRCarouselScrolling
local fFlagSduiCarouselHoverFixes = sharedFlagsModule.FFlagSduiCarouselHoverFixes
local fFlagLuaAppFixCarouselPeekInControl = sharedFlagsModule.FFlagLuaAppFixCarouselPeekInControl
local fFlagLuaAppHideCarouselSubtitleChevron = sharedFlagsModule.FFlagLuaAppHideCarouselSubtitleChevron
local var17 = tModule.strictInterface({
	testId = tModule.optional(tModule.string),
	Position = tModule.optional(tModule.UDim2),
	LayoutOrder = tModule.optional(tModule.number),
	containerRef = tModule.optional(tModule.union(tModule.table, tModule.callback)),
	scrollingFrameRef = tModule.optional(tModule.table),
	onScrollingFrameRefCallback = tModule.optional(tModule.callback),
	numColumns = if fFlagLuaAppCompositionSupport then tModule.optional(tModule.number) else tModule.number,
	fractionalItemAmount = tModule.optional(tModule.number),
	items = tModule.table,
	renderItem = tModule.callback,
	getItemHeight = tModule.callback,
	columnGap = tModule.optional(tModule.number),
	sideMargin = tModule.optional(tModule.number),
	backgroundMuralUrl = tModule.optional(tModule.string),
	title = tModule.optional(tModule.union(tModule.string, tModule.callback)),
	subtitle = tModule.optional(tModule.string),
	tooltipInfoText = tModule.optional(tModule.string),
	onActivateInfoIcon = tModule.optional(tModule.callback),
	tooltipSupportsVR = tModule.optional(tModule.boolean),
	tooltipSupportsTenFootUi = tModule.optional(tModule.boolean),
	onActivateHeader = tModule.optional(tModule.callback),
	onActivateSubtitle = tModule.optional(tModule.callback),
	headerButtonText = tModule.optional(tModule.string),
	onViewableItemsChanged = tModule.optional(tModule.callback),
	onContainerSizeChanged = tModule.optional(tModule.callback),
	onChangeCanvasPosition = tModule.optional(tModule.callback),
	onReachedThresholdFromEnd = tModule.optional(tModule.union(tModule.callback, tModule.table)),
	thresholdFromEnd = tModule.optional(tModule.number),
	scrollingEnabledOverride = tModule.optional(tModule.boolean),
	shouldShowScrollButtonsOverride = tModule.optional(tModule.boolean),
	hideHeaderButton = tModule.optional(tModule.boolean),
	maxItemsToShow = tModule.optional(tModule.number),
	numItemsToRenderOffScreen = tModule.optional(tModule.number),
	onScrollButtonEnter = tModule.optional(tModule.callback),
	onScrollButtonLeave = tModule.optional(tModule.callback),
	AutomaticSize = tModule.optional(tModule.enum(Enum.AutomaticSize)),
	headerComponent = tModule.optional(tModule.table),
	collectionItemSize = if fFlagLuaAppCompositionSupport then tModule.optional(tModule.string) else nil,
	enableHoverOverflow = if fFlagLuaAppCompositionSupport then tModule.optional(tModule.boolean) else nil,
	hideSubtitleChevron = if fFlagLuaAppHideCarouselSubtitleChevron then tModule.optional(tModule.boolean) else nil
})
local t = {
	numColumns = 0,
	fractionalItemAmount = 0,
	columnGap = 0,
	sideMargin = 0
}

local function _(p0, p1) --[[ line: 224 | named "isScrollingEnabled" ]]
	-- upvalues: fFlagLuaAppEnableVRCarouselScrolling (ref)
	return if p0 == nil then if fFlagLuaAppEnableVRCarouselScrolling then true else not p1 else p0
end

local _ = function(p2, _, p3, p4, p5) --[[ line: 237 | named "areScrollButtonsEnabled" ]]
	-- upvalues: responsiveModule (ref), fFlagLuaAppEnableVRCarouselScrolling (ref)
	if not p3 then
		return false
	elseif p4 == nil then
		local _ = true
		local pointer = responsiveModule.Input.Pointer
		local _ = p2 == pointer and ((if p2 == pointer then fFlagLuaAppEnableVRCarouselScrolling else nil) and p5)
		
		return u461
	end
	return p4
end

return reactModule.memo(function(_) --[[ line: 257 | named "CollectionCarousel" ]]
	-- upvalues: validateProps (ref), var17 (ref), cryoModule (ref), t (ref), fFlagLuaAppCompositionSupport (ref), useCollectionLayoutModule (ref), fFlagLuaAppFixCarouselPeekInControl (ref), argCheckModule (ref), reactModule (ref), fFlagCollectionViewMathChanges (ref), useLastInput (ref), usePreferredInput (ref), useIsSpatial (ref), responsiveModule (ref), fFlagLuaAppEnableVRCarouselScrolling (ref), useCollectionSizeBindingsModule (ref), calculateCarouselSpacingMetricsModule (ref), useScrollButtonHandlersModule (ref), useCarouselScrollingBindingModule (ref), fFlagSduiCarouselHoverFixes (ref), useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), scrollingRowOfCollectionItemsModule (ref), collectionBackgroundMuralModule (ref), maybeForceDarkThemeModule (ref), collectionHeaderModule (ref), fFlagLuaAppHideCarouselSubtitleChevron (ref), compositionTags (ref), carouselScrollButtonsModule (ref)
-- FATAL: Failed to generate AST for `CollectionCarousel` function:
runtime : [KeyError] :11990: 105
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end)