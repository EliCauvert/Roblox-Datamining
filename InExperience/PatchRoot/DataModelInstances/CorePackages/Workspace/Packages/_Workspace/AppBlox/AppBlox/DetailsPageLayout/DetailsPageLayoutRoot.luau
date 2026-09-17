local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local sharedFlagsModule = require(parent.SharedFlags)
local displayModule = require(parent.Display)
local appNavBarModule = require(parent.AppNavBar)
local view = foundationModule.View
local withDefaults = foundationModule.Utility.withDefaults
local useTokens = foundationModule.Hooks.useTokens
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useDeviceInsets = responsiveModule.useDeviceInsets
local useNavBarSize = appNavBarModule.useNavBarSize
local useNavBarPlacement = appNavBarModule.useNavBarPlacement
local compositionTags = require(parent.AppComposition).CompositionTags
local detailsPageLayoutContextModule = require(script.Parent.DetailsPageLayoutContext)
local detailsPageLayoutUtilsModule = require(script.Parent.DetailsPageLayoutUtils)
local fFlagLuaAppMediaGalleryGamepadSupport = sharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local fFlagLuaAppEdpDirectionalGradientMidTransparency = sharedFlagsModule.FFlagLuaAppEdpDirectionalGradientMidTransparency
local t = {
	testId = "app-blox-details-page",
	fullBleedAspectRatio = 1.777777777778,
	fullBleedOverlapOffset = 180,
	reserveHeaderBarSpace = true
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), withDefaults (ref), t (ref), compositionTags (ref), reactModule (ref), responsiveModule (ref), fFlagLuaAppMediaGalleryGamepadSupport (ref), useNavBarSize (ref), useNavBarPlacement (ref), displayModule (ref), appNavBarModule (ref), detailsPageLayoutUtilsModule (ref), fFlagLuaAppEdpDirectionalGradientMidTransparency (ref), detailsPageLayoutContextModule (ref), view (ref), stateLayerAffordance (ref)
	local var1 = useDeviceInsets()
	local var2 = useTokens()
	local var3 = withDefaults(p1, t)
	local compositionLayoutTag = var3.compositionLayoutTag or compositionTags.Layout.Detail
	local fullBleedAspectRatio = var3.fullBleedAspectRatio
	local var4 = if fullBleedAspectRatio == nil or fullBleedAspectRatio <= 0 then 1.777777777778 else fullBleedAspectRatio
	local var5 = var3.fullBleedContent ~= nil and not var3.isFullscreen
	local var6, var7 = reactModule.useBinding(false)
	local var8, var9 = reactModule.useBinding(false)
	local var10, var11 = reactModule.useBinding(0)
	local scale = var2.Config.UI.Scale
	local var12 = var3.fullBleedOverlapOffset * scale
	local var13 = if var3.gradientTopBleedOffset then var3.gradientTopBleedOffset * scale else var2.Size.Size_2000
	local var14 = var2.Size.Size_1000 + var2.Padding.Large + var2.Padding.Medium
	local var15 = responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	local var16 = if fFlagLuaAppMediaGalleryGamepadSupport then (if var3.reserveHeaderBarSpace then if var15 then var14 else var2.Size.Size_2000 else 0) + var1.top else (if var15 then var14 else var2.Size.Size_2000) + var1.top
	local var17, var18 = reactModule.useState(nil)
	local var19 = var17 ~= nil
	local var20, var21 = reactModule.useState(nil)
	local var22, var23 = reactModule.useState(false)
	local var24 = not var5 or (var22 or var19)
	local _ = nil
	local _ = 0
	local var25 = useNavBarSize()
	local var26 = useNavBarPlacement()
	local var27 = reactModule.useMemo(function()
		-- upvalues: displayModule (copy), var26 (ref), appNavBarModule (copy), var25 (ref), var5 (ref), detailsPageLayoutUtilsModule (copy), var4 (ref), var16 (ref), var12 (ref), p1 (ref)
		local viewportSize = displayModule.GetDisplayStore(false).getViewportSize(false)
		local vector2 = Vector2.new(if var26 == appNavBarModule.Placement.Left then math.max(0, viewportSize.X - var25) else viewportSize.X, viewportSize.Y)
		
		return {
			containerSize = vector2,
			initialScrollY = if var5 then detailsPageLayoutUtilsModule.computeInitialScrollYForSize(vector2, {
				fullBleedAspectRatio = var4,
				headerBarHeight = var16,
				fullBleedOverlapOffset = var12,
				hasFullBleed = var5,
				bannerBottomVisiblePercent = p1.bannerBottomVisiblePercent
			}) else 0
		}
	end, {})
	local containerSize = var27.containerSize
	local initialScrollY = var27.initialScrollY
	local var28, var29 = reactModule.useBinding(containerSize)
	local var30, var31 = reactModule.useBinding(initialScrollY)
	local var32, var33 = reactModule.useBinding(0)
	local var34, var35 = reactModule.useState(initialScrollY)
	local var36, var37 = reactModule.useState(true)
	local var38 = reactModule.useRef(var5)
	local var39 = var28:map(function(p3)
		return p3.Y
	end)
	local var40 = var28:map(function(p3)
		-- upvalues: var4 (ref)
		return UDim2.new(0, p3.X, 0, p3.X / var4)
	end)
	local var41 = var28:map(function(p3)
		-- upvalues: var5 (ref), detailsPageLayoutUtilsModule (copy), var4 (ref), var16 (ref)
		return if var5 then detailsPageLayoutUtilsModule.computeContentTopOffset(p3.X, var4, var16) else 0
	end)
	local var42 = reactModule.joinBindings({ var41, var30 }):map(function(p3)
		-- upvalues: var16 (ref)
		return UDim2.new(0.5, 0, 0, math.max(0, p3[1] + var16 - p3[2]) / 2)
	end)
	local var43 = reactModule.joinBindings({ var30, var41, var32 }):map(function(p3)
		-- upvalues: detailsPageLayoutUtilsModule (copy), var16 (ref), var12 (ref)
		local var44 = p3[1]
		local var45 = p3[2]
		local var46 = p3[3]
		
		if var45 == 0 then
			return math.clamp(var44 / detailsPageLayoutUtilsModule.getNoBannerFadeParams(var16), 0, 1)
		end
		local headerFadeParams, headerFadeParams_1 = detailsPageLayoutUtilsModule.getHeaderFadeParams(var45, var46, var12)
		
		return math.clamp((var44 - headerFadeParams) / headerFadeParams_1, 0, 1)
	end)
	local var44 = reactModule.useCallback(function(p3)
		-- upvalues: var29 (ref), var37 (ref), var5 (ref), var38 (ref), detailsPageLayoutUtilsModule (copy), var4 (ref), var16 (ref), var12 (ref), p1 (ref), var35 (ref), var31 (ref)
		local absoluteSize = p3.AbsoluteSize
		var29(absoluteSize)
		
		if absoluteSize.X > 0 and absoluteSize.Y > 0 then
			var37(true)
			
			if var5 and not var38.current then
				var38.current = true
				local var45 = detailsPageLayoutUtilsModule.computeInitialScrollYForSize(absoluteSize, {
					fullBleedAspectRatio = var4,
					headerBarHeight = var16,
					fullBleedOverlapOffset = var12,
					hasFullBleed = var5,
					bannerBottomVisiblePercent = p1.bannerBottomVisiblePercent
				})
				var35(var45)
				var31(var45)
			end
		end
	end, {
		var5, var4, var16, var12, p1.bannerBottomVisiblePercent, containerSize
	})
	local var45 = reactModule.useRef(0)
	local var46 = reactModule.useCallback(function(p3)
		-- upvalues: var45 (ref), var33 (ref)
		if math.abs(p3 - var45.current) > 0.5 then
			var45.current = p3
			var33(p3)
		end
	end, {})
	local var47 = reactModule.useCallback(function(p3)
		-- upvalues: var31 (ref), var5 (ref), var41 (ref), var32 (ref), detailsPageLayoutUtilsModule (copy), var12 (ref), var23 (ref)
		local y = p3.CanvasPosition.Y
		var31(y)
		
		if var5 then
			local value = var41:getValue()
			local headerFadeParams, headerFadeParams_1 = detailsPageLayoutUtilsModule.getHeaderFadeParams(value, var32:getValue(), var12)
			var23(detailsPageLayoutUtilsModule.shouldShowStickyBar(y, value, headerFadeParams, headerFadeParams_1))
		end
	end, { var5, var12 })
	
	return reactModule.createElement(detailsPageLayoutContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var5 (ref), var6 (ref), var7 (ref), var8 (ref), var9 (ref), var3 (ref), var16 (ref), var10 (ref), var11 (ref), var47 (ref), var41 (ref), var12 (ref), var13 (ref), fFlagLuaAppEdpDirectionalGradientMidTransparency (copy), var34 (ref), var36 (ref), fFlagLuaAppMediaGalleryGamepadSupport (copy), var39 (ref), var43 (ref), var24 (ref), var46 (ref), var19 (ref), var18 (ref), var20 (ref), var21 (ref)
			return {
				hasFullBleed = var5,
				hasHeader = var6,
				setHasHeader = var7,
				hasActions = var8,
				setHasActions = var9,
				isFullscreen = var3.isFullscreen,
				headerBarHeight = var16,
				actionBarHeight = var10,
				setActionBarHeight = var11,
				onCanvasPositionChanged = var47,
				contentTopOffset = var41,
				fullBleedOverlapOffset = var12,
				gradientTopBleedOffset = var13,
				gradientMidTransparency = if fFlagLuaAppEdpDirectionalGradientMidTransparency then var3.gradientMidTransparency else nil,
				initialScrollY = var34,
				hasValidContainerSize = var36,
				disableFocusNavEngineScroll = if fFlagLuaAppMediaGalleryGamepadSupport then var3.disableFocusNavEngineScroll else nil,
				containerHeight = var39,
				headerOpacity = var43,
				stickyHeaderActive = var24,
				onClose = var3.onClose,
				testId = var3.testId,
				onCanvasSizeChanged = var46,
				isFullscreenOverlay = var19,
				setFullscreenContent = var18,
				onExitFullscreenOverlay = var20,
				setOnExitFullscreenOverlay = var21
			}
		end, {
			var5, var3.isFullscreen, var16, var12, var13,
			if fFlagLuaAppEdpDirectionalGradientMidTransparency then var3.gradientMidTransparency else nil,
			var34, var36, var24, var3.onClose, var3.testId, var39, var43, var47, var46,
			var19, var20,
			if fFlagLuaAppMediaGalleryGamepadSupport then var3.disableFocusNavEngineScroll else nil
		})
	}, reactModule.createElement(view, {
		tag = `size-full clip bg-surface-0 {compositionLayoutTag}`,
		stateLayer = { affordance = stateLayerAffordance.None },
		onAbsoluteSizeChanged = var44,
		ref = p2,
		selectionGroup = var3.selectionGroup,
		testId = `{var3.testId}--root`
	}, {
		FullBleed = if var5 then reactModule.createElement(view, {
			tag = "position-top-center anchor-top-center size-full clip",
			ZIndex = 0,
			testId = `{var3.testId}--fullbleed`
		}, {
			ParallaxFrame = reactModule.createElement(view, {
				tag = "anchor-center-center clip",
				Position = var42,
				Size = var40
			}, var3.fullBleedContent)
		}) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, var3.children),
		FullscreenOverlay = if var19 then reactModule.createElement(view, {
			ZIndex = 10,
			tag = "clip",
			Size = var6:map(function(p3)
				-- upvalues: var16 (ref)
				return if p3 then UDim2.new(1, 0, 1, -var16) else UDim2.fromScale(1, 1)
			end),
			Position = var6:map(function(p3)
				-- upvalues: var16 (ref)
				return if p3 then UDim2.fromOffset(0, var16) else UDim2.fromOffset(0, 0)
			end),
			testId = `{var3.testId}--fullscreen-overlay`
		}, var17) else nil
	}))
end))