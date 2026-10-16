local AppBlox = script:FindFirstAncestor("AppBlox")
local Parent = AppBlox.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local SharedFlagsModule = require(Parent.SharedFlags)
local DisplayModule = require(Parent.Display)
local AppNavBarModule = require(Parent.AppNavBar)
local View = FoundationModule.View
local WithDefaultsFunction = FoundationModule.Utility.withDefaults
local UseTokensFunction = FoundationModule.Hooks.useTokens
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseDeviceInsetsFunction = ResponsiveModule.useDeviceInsets
local UseNavBarSizeFunction = AppNavBarModule.useNavBarSize
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local CompositionTags = require(Parent.AppComposition).CompositionTags
local DetailsPageLayoutContextModule = require(script.Parent.DetailsPageLayoutContext)
local DetailsPageLayoutUtilsModule = require(script.Parent.DetailsPageLayoutUtils)
local FFlagDetailsPageLayoutUseMeasuredSizeForInitialScrollModule = require(AppBlox.Flags.FFlagDetailsPageLayoutUseMeasuredSizeForInitialScroll)
local FFlagLuaAppMediaGalleryGamepadSupport = SharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local FFlagLuaAppEdpDirectionalGradientMidTransparency = SharedFlagsModule.FFlagLuaAppEdpDirectionalGradientMidTransparency
local config = {
	testId = "app-blox-details-page",
	fullBleedAspectRatio = 1.7777777777777777,
	fullBleedOverlapOffset = 180,
	reserveHeaderBarSpace = true
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 75 | Named "DetailsPageLayoutRoot" ]]
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), WithDefaultsFunction (copy), config (copy), CompositionTags (copy), ReactModule (copy), ResponsiveModule (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy), UseNavBarSizeFunction (copy), UseNavBarPlacementFunction (copy), DisplayModule (copy), AppNavBarModule (copy), DetailsPageLayoutUtilsModule (copy), FFlagDetailsPageLayoutUseMeasuredSizeForInitialScrollModule (copy), FFlagLuaAppEdpDirectionalGradientMidTransparency (copy), DetailsPageLayoutContextModule (copy), View (copy), StateLayerAffordance (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local WithDefaultsResult = WithDefaultsFunction(p1, config)
	local CompositionLayoutTag = WithDefaultsResult.compositionLayoutTag or CompositionTags.Layout.Detail
	local FullBleedAspectRatio: number = WithDefaultsResult.fullBleedAspectRatio
	local FullBleedAspectRatio1 = if FullBleedAspectRatio == nil or FullBleedAspectRatio <= 0 then 1.7777777777777777 else FullBleedAspectRatio
	local NoIsFullscreen: boolean = WithDefaultsResult.fullBleedContent ~= nil and not WithDefaultsResult.isFullscreen
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(false)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(0)
	local Scale = UseTokensResult.Config.UI.Scale
	local ScaledFullBleedOverlapOffset = WithDefaultsResult.fullBleedOverlapOffset * Scale
	local ScaledGradientTopBleedOffset = if WithDefaultsResult.gradientTopBleedOffset then WithDefaultsResult.gradientTopBleedOffset * Scale else UseTokensResult.Size.Size_2000
	local NewSize = UseTokensResult.Size.Size_1000 + UseTokensResult.Padding.Large + UseTokensResult.Padding.Medium
	local UseBreakpointXOrSmallerResult = ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.Keys.Small)
	local NewTop = if FFlagLuaAppMediaGalleryGamepadSupport then (if WithDefaultsResult.reserveHeaderBarSpace then if UseBreakpointXOrSmallerResult then NewSize else UseTokensResult.Size.Size_2000 else 0) + UseDeviceInsetsResult.top else (if UseBreakpointXOrSmallerResult then NewSize else UseTokensResult.Size.Size_2000) + UseDeviceInsetsResult.top
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local HasUseStateResult = UseStateResult ~= nil
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local NoNoIsFullscreen = not NoIsFullscreen or (UseStateResult3 or HasUseStateResult)
	local UseNavBarSizeResult = UseNavBarSizeFunction()
	local UseNavBarPlacementResult = UseNavBarPlacementFunction()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 128 ]]
		-- upvalues: DisplayModule (upval), UseNavBarPlacementResult (copy), AppNavBarModule (upval), UseNavBarSizeResult (copy), NoIsFullscreen (copy), DetailsPageLayoutUtilsModule (upval), FullBleedAspectRatio1 (copy), NewTop (copy), ScaledFullBleedOverlapOffset (copy), p1 (copy)
		local ViewportSize = DisplayModule.GetDisplayStore(false).getViewportSize(false)
		local _Vector2 = Vector2.new(if UseNavBarPlacementResult == AppNavBarModule.Placement.Left then math.max(0, ViewportSize.X - UseNavBarSizeResult) else ViewportSize.X, ViewportSize.Y)
		
		return {
			containerSize = _Vector2,
			initialScrollY = if NoIsFullscreen then DetailsPageLayoutUtilsModule.computeInitialScrollYForSize(_Vector2, {
				fullBleedAspectRatio = FullBleedAspectRatio1,
				headerBarHeight = NewTop,
				fullBleedOverlapOffset = ScaledFullBleedOverlapOffset,
				hasFullBleed = NoIsFullscreen,
				bannerBottomVisiblePercent = p1.bannerBottomVisiblePercent
			}) else 0
		}
	end, {})
	local ContainerSize = UseMemoResult.containerSize
	local InitialScrollY = UseMemoResult.initialScrollY
	local UseBindingResult4, UseBindingResult2_3 = ReactModule.useBinding(ContainerSize)
	local UseBindingResult5, UseBindingResult2_4 = ReactModule.useBinding(InitialScrollY)
	local UseBindingResult6, UseBindingResult2_5 = ReactModule.useBinding(0)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(InitialScrollY)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(true)
	local UseRefResult = ReactModule.useRef(NoIsFullscreen and not FFlagDetailsPageLayoutUseMeasuredSizeForInitialScrollModule)
	local MapResult = UseBindingResult4:map(function(p2) --[[ Line: 162 ]]
		return p2.Y
	end)
	local MapResult1 = UseBindingResult4:map(function(Vector): UDim2 --[[ Line: 166 ]]
		-- upvalues: FullBleedAspectRatio1 (copy)
		return UDim2.new(0, Vector.X, 0, Vector.X / FullBleedAspectRatio1)
	end)
	local MapResult2 = UseBindingResult4:map(function(p2) --[[ Line: 172 ]]
		-- upvalues: NoIsFullscreen (copy), DetailsPageLayoutUtilsModule (upval), FullBleedAspectRatio1 (copy), NewTop (copy)
		return if NoIsFullscreen then DetailsPageLayoutUtilsModule.computeContentTopOffset(p2.X, FullBleedAspectRatio1, NewTop) else 0
	end)
	local MapResult3 = ReactModule.joinBindings({ MapResult2, UseBindingResult5 }):map(function(Entry): UDim2 --[[ Line: 181 ]]
		-- upvalues: NewTop (copy)
		return UDim2.new(0.5, 0, 0, math.max(0, Entry[1] + NewTop - Entry[2]) / 2)
	end)
	local MapResult4 = ReactModule.joinBindings({ UseBindingResult5, MapResult2, UseBindingResult6 }):map(function(Entry): number --[[ Line: 191 ]]
		-- upvalues: DetailsPageLayoutUtilsModule (upval), NewTop (copy), ScaledFullBleedOverlapOffset (copy)
		local Entry1 = Entry[1]
		local Entry2 = Entry[2]
		local Entry3 = Entry[3]
		
		if Entry2 == 0 then
			return (math.clamp(Entry1 / DetailsPageLayoutUtilsModule.getNoBannerFadeParams(NewTop), 0, 1))
		else
			local HeaderFadeParams, HeaderFadeParams2 = DetailsPageLayoutUtilsModule.getHeaderFadeParams(Entry2, Entry3, ScaledFullBleedOverlapOffset)
			
			return (math.clamp((Entry1 - HeaderFadeParams) / HeaderFadeParams2, 0, 1))
		end
	end)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseResult = ReactModule.useCallback(function(Current) --[[ Line: 237 ]]
		-- upvalues: UseRefResult1 (copy), UseBindingResult2_5 (copy)
		if math.abs(Current - UseRefResult1.current) > 0.5 then
			UseRefResult1.current = Current
			UseBindingResult2_5(Current)
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(ScrollFrame) --[[ Line: 244 ]]
		-- upvalues: UseBindingResult2_4 (copy), NoIsFullscreen (copy), MapResult2 (copy), UseBindingResult6 (copy), DetailsPageLayoutUtilsModule (upval), ScaledFullBleedOverlapOffset (copy), UseStateResult2_2 (copy)
		local Y = ScrollFrame.CanvasPosition.Y
		UseBindingResult2_4(Y)
		
		if NoIsFullscreen then
			local Value = MapResult2:getValue()
			local HeaderFadeParams, HeaderFadeParams2 = DetailsPageLayoutUtilsModule.getHeaderFadeParams(Value, UseBindingResult6:getValue(), ScaledFullBleedOverlapOffset)
			UseStateResult2_2(DetailsPageLayoutUtilsModule.shouldShowStickyBar(Y, Value, HeaderFadeParams, HeaderFadeParams2))
		end
	end, { NoIsFullscreen, ScaledFullBleedOverlapOffset })
	
	return ReactModule.createElement(DetailsPageLayoutContextModule.Provider, {
		value = ReactModule.useMemo(function() --[[ Line: 266 ]]
			-- upvalues: NoIsFullscreen (copy), UseBindingResult (copy), UseBindingResult2 (copy), UseBindingResult1 (copy), UseBindingResult2_1 (copy), WithDefaultsResult (copy), NewTop (copy), UseBindingResult3 (copy), UseBindingResult2_2 (copy), UseResult1 (copy), MapResult2 (copy), ScaledFullBleedOverlapOffset (copy), ScaledGradientTopBleedOffset (copy), FFlagLuaAppEdpDirectionalGradientMidTransparency (upval), UseStateResult4 (copy), UseStateResult5 (copy), FFlagLuaAppMediaGalleryGamepadSupport (upval), MapResult (copy), MapResult4 (copy), NoNoIsFullscreen (copy), UseResult (copy), HasUseStateResult (copy), UseStateResult2 (copy), UseStateResult1 (copy), UseStateResult2_1 (copy)
			return {
				hasFullBleed = NoIsFullscreen,
				hasHeader = UseBindingResult,
				setHasHeader = UseBindingResult2,
				hasActions = UseBindingResult1,
				setHasActions = UseBindingResult2_1,
				isFullscreen = WithDefaultsResult.isFullscreen,
				headerBarHeight = NewTop,
				actionBarHeight = UseBindingResult3,
				setActionBarHeight = UseBindingResult2_2,
				onCanvasPositionChanged = UseResult1,
				contentTopOffset = MapResult2,
				fullBleedOverlapOffset = ScaledFullBleedOverlapOffset,
				gradientTopBleedOffset = ScaledGradientTopBleedOffset,
				gradientMidTransparency = if FFlagLuaAppEdpDirectionalGradientMidTransparency then WithDefaultsResult.gradientMidTransparency else nil,
				initialScrollY = UseStateResult4,
				hasValidContainerSize = UseStateResult5,
				disableFocusNavEngineScroll = if FFlagLuaAppMediaGalleryGamepadSupport then WithDefaultsResult.disableFocusNavEngineScroll else nil,
				containerHeight = MapResult,
				headerOpacity = MapResult4,
				stickyHeaderActive = NoNoIsFullscreen,
				onClose = WithDefaultsResult.onClose,
				testId = WithDefaultsResult.testId,
				onCanvasSizeChanged = UseResult,
				isFullscreenOverlay = HasUseStateResult,
				setFullscreenContent = UseStateResult2,
				onExitFullscreenOverlay = UseStateResult1,
				setOnExitFullscreenOverlay = UseStateResult2_1
			}
		end, {
			NoIsFullscreen, WithDefaultsResult.isFullscreen, NewTop,
			ScaledFullBleedOverlapOffset, ScaledGradientTopBleedOffset,
			if FFlagLuaAppEdpDirectionalGradientMidTransparency then WithDefaultsResult.gradientMidTransparency else nil,
			UseStateResult4, UseStateResult5, NoNoIsFullscreen, WithDefaultsResult.onClose,
			WithDefaultsResult.testId, MapResult, MapResult4, UseResult1, UseResult,
			HasUseStateResult, UseStateResult1,
			if FFlagLuaAppMediaGalleryGamepadSupport then WithDefaultsResult.disableFocusNavEngineScroll else nil
		})
	}, ReactModule.createElement(View, {
		tag = `size-full clip bg-surface-0 {CompositionLayoutTag}`,
		stateLayer = { affordance = StateLayerAffordance.None },
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame) --[[ Line: 207 ]]
			-- upvalues: UseBindingResult2_3 (copy), UseStateResult2_4 (copy), NoIsFullscreen (copy), UseRefResult (copy), DetailsPageLayoutUtilsModule (upval), FullBleedAspectRatio1 (copy), NewTop (copy), ScaledFullBleedOverlapOffset (copy), p1 (copy), UseStateResult2_3 (copy), UseBindingResult2_4 (copy)
			local AbsoluteSize = Frame.AbsoluteSize
			UseBindingResult2_3(AbsoluteSize)
			
			if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then
				UseStateResult2_4(true)
				
				if NoIsFullscreen and not UseRefResult.current then
					UseRefResult.current = true
					local InitialScrollYForSize = DetailsPageLayoutUtilsModule.computeInitialScrollYForSize(AbsoluteSize, {
						fullBleedAspectRatio = FullBleedAspectRatio1,
						headerBarHeight = NewTop,
						fullBleedOverlapOffset = ScaledFullBleedOverlapOffset,
						hasFullBleed = NoIsFullscreen,
						bannerBottomVisiblePercent = p1.bannerBottomVisiblePercent
					})
					UseStateResult2_3(InitialScrollYForSize)
					UseBindingResult2_4(InitialScrollYForSize)
				end
			end
		end, {
			NoIsFullscreen, FullBleedAspectRatio1, NewTop, ScaledFullBleedOverlapOffset,
			p1.bannerBottomVisiblePercent, ContainerSize
		}),
		ref = Ref,
		selectionGroup = WithDefaultsResult.selectionGroup,
		testId = `{WithDefaultsResult.testId}--root`
	}, {
		FullBleed = if NoIsFullscreen then ReactModule.createElement(View, {
			tag = "position-top-center anchor-top-center size-full clip",
			ZIndex = 0,
			testId = `{WithDefaultsResult.testId}--fullbleed`
		}, {
			ParallaxFrame = ReactModule.createElement(View, {
				tag = "anchor-center-center clip",
				Position = MapResult3,
				Size = MapResult1
			}, WithDefaultsResult.fullBleedContent)
		}) else nil,
		Children = ReactModule.createElement(ReactModule.Fragment, nil, WithDefaultsResult.children),
		FullscreenOverlay = if HasUseStateResult then ReactModule.createElement(View, {
			ZIndex = 10,
			tag = "clip",
			Size = UseBindingResult:map(function(p2): UDim2 --[[ Line: 351 ]]
				-- upvalues: NewTop (copy)
				return if p2 then UDim2.new(1, 0, 1, -NewTop) else UDim2.fromScale(1, 1)
			end),
			Position = UseBindingResult:map(function(p2): UDim2 --[[ Line: 354 ]]
				-- upvalues: NewTop (copy)
				return if p2 then UDim2.fromOffset(0, NewTop) else UDim2.fromOffset(0, 0)
			end),
			testId = `{WithDefaultsResult.testId}--fullscreen-overlay`
		}, UseStateResult) else nil
	}))
end))