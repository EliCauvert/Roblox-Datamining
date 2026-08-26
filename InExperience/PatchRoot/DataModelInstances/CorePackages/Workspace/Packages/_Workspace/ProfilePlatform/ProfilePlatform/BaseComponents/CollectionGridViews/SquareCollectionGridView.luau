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

return function(p1)
	-- upvalues: reactModule (ref), fFlagProfilePlatformEnableImpressions (ref), useProfileAnalyticsContextModule (ref), useCollectionImpressionsSignal (ref), profileCollectionGridConfigModule (ref), useDynamicSizeMarginModule (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), collectionGrid (ref), screenSizeImpressionsTracker (ref), appPage (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = if fFlagProfilePlatformEnableImpressions then reactModule.useRef(nil) else nil
	local var4 = if fFlagProfilePlatformEnableImpressions then useProfileAnalyticsContextModule() else nil
	local var5 = nil
	local var6 = nil
	
	if fFlagProfilePlatformEnableImpressions then
		local var7, var8 = useCollectionImpressionsSignal(var4.scrollViewPositionChangedSignal)
		var5 = var7
		var6 = var8
	end
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref), fFlagProfilePlatformEnableImpressions (copy), var3 (ref)
		if p1.setForwardRef then
			p1.setForwardRef(var1)
		end
		if fFlagProfilePlatformEnableImpressions then
			var3.current = var1
		end
	end, { var1 })
	local maxNumRows = p1.maxNumRows or profileCollectionGridConfigModule.Constants.DEFAULT_MAX_NUM_ROWS
	local t = { sideMargin = 0 }
	local var9, var10 = useDynamicSizeMarginModule()
	local var11 = useCollectionLayoutParams(collectionItemSize.Small, var1, false, t)
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		[reactModule.Change.AbsoluteSize] = var10
	}, {
		CollectionGrid = reactModule.createElement(collectionGrid, {
			columnGap = var11.columnGap,
			containerRef = var2,
			getItemHeight = p1.getItemHeight,
			headerButtonText = p1.headerButtonText,
			hideHeaderButton = p1.hideHeaderButton,
			items = p1.items,
			LayoutOrder = p1.layoutOrder,
			maxNumRows = maxNumRows,
			numColumns = if p1.overrides then p1.overrides.numColumns else var11.numColumns,
			onActivateHeader = p1.onActivateHeader,
			onActivateInfoIcon = p1.onActivateInfoIcon,
			onContainerSizeChanged = if fFlagProfilePlatformEnableImpressions then if fFlagProfilePlatformEnableImpressions then reactModule.useCallback(function(p2)
				-- upvalues: p1 (ref), var6 (write)
				if p1.onContainerSizeChanged then
					p1.onContainerSizeChanged(p2)
				end
				var6()
			end, { p1.onContainerSizeChanged, var6 }) else nil else p1.onContainerSizeChanged,
			onViewableItemsChanged = if fFlagProfilePlatformEnableImpressions then if fFlagProfilePlatformEnableImpressions then reactModule.useCallback(function(p2, p3)
				-- upvalues: p1 (ref), var6 (write)
				if p1.onViewableItemsChanged then
					p1.onViewableItemsChanged(p2, p3)
				end
				var6()
			end, { p1.onViewableItemsChanged, var6 }) else nil else p1.onViewableItemsChanged,
			verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
			renderItem = p1.renderItem,
			sideMargin = var9,
			subtitle = p1.subtitle,
			title = p1.title,
			tooltipInfoText = p1.tooltipInfoText,
			verticalPadding = var11.verticalPadding
		}),
		ScreenSizeImpressionsTracker = if fFlagProfilePlatformEnableImpressions and p1.impressionsTag and p1.sendImpressions then reactModule.createElement(screenSizeImpressionsTracker, {
			pageContext = appPage.ProfilePlatform,
			parentRef = var3,
			impressionsTag = p1.impressionsTag,
			scrollViewPositionChangedSignal = var5,
			sendImpressions = p1.sendImpressions
		}) else nil
	})
end