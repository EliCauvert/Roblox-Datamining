local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local collectionViewsModule = require(parent.CollectionViews)
local collectionGrid = collectionViewsModule.CollectionGrid
local collectionItemSize = collectionViewsModule.CollectionViewTypes.CollectionItemSize
local useCollectionLayoutParams = collectionViewsModule.useCollectionLayoutParams
local useCollectionImpressionsSignal = collectionViewsModule.useCollectionImpressionsSignal
local screenSizeImpressionsTracker = require(parent.Impressions).ScreenSizeImpressionsTracker
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local useDynamicSizeMarginModule = require(profilePlatform.Hooks.useDynamicSizeMargin)
local appPage = require(parent.RobloxAppEnums).AppPage
local profileCollectionGridConfigModule = require(script.Parent.ProfileCollectionGridConfig)
local fFlagProfilePlatformEnableImpressions = require(parent.SharedFlags).FFlagProfilePlatformEnableImpressions

return function(p0) --[[ line: 28 | named "SquareCollectionsGridView" ]]
	-- upvalues: reactModule (ref), fFlagProfilePlatformEnableImpressions (ref), useProfileAnalyticsContextModule (ref), useCollectionImpressionsSignal (ref), profileCollectionGridConfigModule (ref), useDynamicSizeMarginModule (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), collectionGrid (ref), screenSizeImpressionsTracker (ref), appPage (ref)
	local var6, var7 = reactModule.useState(nil)
	local var8 = if fFlagProfilePlatformEnableImpressions then reactModule.useRef(nil) else nil
	local var9 = if fFlagProfilePlatformEnableImpressions then useProfileAnalyticsContextModule() else nil
	local var10 = nil
	local var11 = nil
	
	if fFlagProfilePlatformEnableImpressions then
		local var12, var13 = useCollectionImpressionsSignal(var9.scrollViewPositionChangedSignal)
		var10 = var12
		var11 = var13
	end
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: p0 (ref), var6 (ref), fFlagProfilePlatformEnableImpressions (copy), var8 (ref)
		if p0.setForwardRef then
			p0.setForwardRef(var6)
		end
		if fFlagProfilePlatformEnableImpressions then
			var8.current = var6
		end
	end, { var6 })
	local maxNumRows = p0.maxNumRows or profileCollectionGridConfigModule.Constants.DEFAULT_MAX_NUM_ROWS
	local t = { sideMargin = 0 }
	local var16, var17 = useDynamicSizeMarginModule()
	local var18 = useCollectionLayoutParams(collectionItemSize.Small, var6, false, t)
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		[reactModule.Change.AbsoluteSize] = var17
	}, {
		CollectionGrid = reactModule.createElement(collectionGrid, {
			columnGap = var18.columnGap,
			containerRef = var7,
			getItemHeight = p0.getItemHeight,
			headerButtonText = p0.headerButtonText,
			hideHeaderButton = p0.hideHeaderButton,
			items = p0.items,
			LayoutOrder = p0.layoutOrder,
			maxNumRows = maxNumRows,
			numColumns = if p0.overrides then p0.overrides.numColumns else var18.numColumns,
			onActivateHeader = p0.onActivateHeader,
			onActivateInfoIcon = p0.onActivateInfoIcon,
			onContainerSizeChanged = if fFlagProfilePlatformEnableImpressions then if fFlagProfilePlatformEnableImpressions then reactModule.useCallback(function(p1) --[[ line: 58 ]]
				-- upvalues: p0 (ref), var11 (write)
				if p0.onContainerSizeChanged then
					p0.onContainerSizeChanged(p1)
				end
				var11()
			end, { p0.onContainerSizeChanged, var11 }) else nil else p0.onContainerSizeChanged,
			onViewableItemsChanged = if fFlagProfilePlatformEnableImpressions then if fFlagProfilePlatformEnableImpressions then reactModule.useCallback(function(p2, p3) --[[ line: 67 ]]
				-- upvalues: p0 (ref), var11 (write)
				if p0.onViewableItemsChanged then
					p0.onViewableItemsChanged(p2, p3)
				end
				var11()
			end, { p0.onViewableItemsChanged, var11 }) else nil else p0.onViewableItemsChanged,
			verticalScrollingFrameRef = p0.verticalScrollingFrameRef,
			renderItem = p0.renderItem,
			sideMargin = var16,
			subtitle = p0.subtitle,
			title = p0.title,
			tooltipInfoText = p0.tooltipInfoText,
			verticalPadding = var18.verticalPadding
		}),
		ScreenSizeImpressionsTracker = if fFlagProfilePlatformEnableImpressions and p0.impressionsTag and p0.sendImpressions then reactModule.createElement(screenSizeImpressionsTracker, {
			pageContext = appPage.ProfilePlatform,
			parentRef = var8,
			impressionsTag = p0.impressionsTag,
			scrollViewPositionChangedSignal = var10,
			sendImpressions = p0.sendImpressions
		}) else nil
	})
end