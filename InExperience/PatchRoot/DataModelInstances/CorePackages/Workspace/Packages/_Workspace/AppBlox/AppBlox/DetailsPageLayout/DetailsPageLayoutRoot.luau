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
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagLuaAppClampBannerPaddingToViewport = sharedFlagsModule.FFlagLuaAppClampBannerPaddingToViewport
local fFlagDetailsPageLayoutSeedContainerSize = sharedFlagsModule.FFlagDetailsPageLayoutSeedContainerSize
local fFlagLuaAppMediaGalleryGamepadSupport = sharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local t = {
	testId = "app-blox-details-page",
	fullBleedAspectRatio = 1.777777777778,
	fullBleedOverlapOffset = 180,
	reserveHeaderBarSpace = true
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), withDefaults (ref), t (ref), compositionTags (ref), reactModule (ref), responsiveModule (ref), fFlagLuaAppMediaGalleryGamepadSupport (ref), fFlagDetailsPageLayoutSeedContainerSize (ref), useNavBarSize (ref), useNavBarPlacement (ref), displayModule (ref), appNavBarModule (ref), detailsPageLayoutUtilsModule (ref), fFlagLuaAppClampBannerPaddingToViewport (ref), detailsPageLayoutContextModule (ref), view (ref), stateLayerAffordance (ref), fFlagSduiExperienceDetailsSupport (ref)
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
	local containerSize = nil
	local var25 = 0
	
	if fFlagDetailsPageLayoutSeedContainerSize then
		local var26 = useNavBarSize()
		local var27 = useNavBarPlacement()
		local var28 = reactModule.useMemo(function()
			-- upvalues: displayModule (copy), var27 (ref), appNavBarModule (copy), var26 (ref), var5 (ref), detailsPageLayoutUtilsModule (copy), var4 (ref), var16 (ref), var12 (ref), p1 (ref)
			local viewportSize = displayModule.GetDisplayStore(false).getViewportSize(false)
			local vector2 = Vector2.new(if var27 == appNavBarModule.Placement.Left then math.max(0, viewportSize.X - var26) else viewportSize.X, viewportSize.Y)
			
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
		containerSize = var28.containerSize
		var25 = var28.initialScrollY
	end
	local var29, var30 = reactModule.useBinding(if fFlagDetailsPageLayoutSeedContainerSize then containerSize else Vector2.new(0, 0))
	local var31, var32 = reactModule.useBinding(if fFlagDetailsPageLayoutSeedContainerSize then var25 else 0)
	local var33, var34 = reactModule.useBinding(0)
	local var35, var36 = reactModule.useState(if fFlagDetailsPageLayoutSeedContainerSize then var25 else 0)
	local var37, var38 = reactModule.useState(if fFlagDetailsPageLayoutSeedContainerSize then true else false)
	local var39 = reactModule.useRef(if fFlagDetailsPageLayoutSeedContainerSize then var5 else false)
	local var40 = var29:map(function(p3)
		return p3.Y
	end)
	local var41 = var29:map(function(p3)
		-- upvalues: var4 (ref)
		return UDim2.new(0, p3.X, 0, p3.X / var4)
	end)
	local var42 = var29:map(function(p3)
		-- upvalues: var5 (ref), detailsPageLayoutUtilsModule (copy), var4 (ref), var16 (ref)
		return if var5 then detailsPageLayoutUtilsModule.computeContentTopOffset(p3.X, var4, var16) else 0
	end)
	local var43 = reactModule.joinBindings({ var42, var31 }):map(function(p3)
		-- upvalues: var16 (ref)
		return UDim2.new(0.5, 0, 0, math.max(0, p3[1] + var16 - p3[2]) / 2)
	end)
	local var44 = reactModule.joinBindings({ var31, var42, var33 }):map(function(p3)
		-- upvalues: detailsPageLayoutUtilsModule (copy), var16 (ref), var12 (ref)
		local var45 = p3[1]
		local var46 = p3[2]
		local var47 = p3[3]
		
		if var46 == 0 then
			return math.clamp(var45 / detailsPageLayoutUtilsModule.getNoBannerFadeParams(var16), 0, 1)
		end
		local headerFadeParams, headerFadeParams_1 = detailsPageLayoutUtilsModule.getHeaderFadeParams(var46, var47, var12)
		
		return math.clamp((var45 - headerFadeParams) / headerFadeParams_1, 0, 1)
	end)
	local var45 = reactModule.useCallback(function(p3)
		-- upvalues: var30 (ref), var38 (ref), var5 (ref), var39 (ref), fFlagDetailsPageLayoutSeedContainerSize (copy), detailsPageLayoutUtilsModule (copy), var4 (ref), var16 (ref), var12 (ref), p1 (ref), fFlagLuaAppClampBannerPaddingToViewport (copy), var36 (ref), var32 (ref)
		local absoluteSize = p3.AbsoluteSize
		var30(absoluteSize)
		
		if absoluteSize.X > 0 and absoluteSize.Y > 0 then
			var38(true)
			
			if var5 and not var39.current then
				local var46
				var39.current = true
				local _ = nil
				
				if fFlagDetailsPageLayoutSeedContainerSize then
					var46 = detailsPageLayoutUtilsModule.computeInitialScrollYForSize(absoluteSize, {
						fullBleedAspectRatio = var4,
						headerBarHeight = var16,
						fullBleedOverlapOffset = var12,
						hasFullBleed = var5,
						bannerBottomVisiblePercent = p1.bannerBottomVisiblePercent
					})
				else
					local var47 = absoluteSize.X / var4
					var46 = if p1.bannerBottomVisiblePercent ~= nil then detailsPageLayoutUtilsModule.computeInitialScrollY(absoluteSize.X, var4, var16, var12) else math.max(0, math.floor(var47 - p1.bannerBottomVisiblePercent * var47))
					local var48 = detailsPageLayoutUtilsModule.computeCanvasPaddingTop(detailsPageLayoutUtilsModule.computeContentTopOffset(absoluteSize.X, var4, var16), var5, var12, var16)
					
					if fFlagLuaAppClampBannerPaddingToViewport then
						var48 = math.min(var48, absoluteSize.Y * 0.75)
					end
					var46 = math.min(var46, math.max(0, var48 - var16))
				end
				var36(var46)
				var32(var46)
			end
		end
	end, {
		var5, var4, var16, var12, p1.bannerBottomVisiblePercent,
		if fFlagDetailsPageLayoutSeedContainerSize then containerSize else nil
	})
	local var46 = reactModule.useRef(0)
	local var47 = reactModule.useCallback(function(p3)
		-- upvalues: var46 (ref), var34 (ref)
		if math.abs(p3 - var46.current) > 0.5 then
			var46.current = p3
			var34(p3)
		end
	end, {})
	local var48 = reactModule.useCallback(function(p3)
		-- upvalues: var32 (ref), var5 (ref), var42 (ref), var33 (ref), detailsPageLayoutUtilsModule (copy), var12 (ref), var23 (ref)
		local y = p3.CanvasPosition.Y
		var32(y)
		
		if var5 then
			local value = var42:getValue()
			local headerFadeParams, headerFadeParams_1 = detailsPageLayoutUtilsModule.getHeaderFadeParams(value, var33:getValue(), var12)
			var23(detailsPageLayoutUtilsModule.shouldShowStickyBar(y, value, headerFadeParams, headerFadeParams_1))
		end
	end, { var5, var12 })
	
	return reactModule.createElement(detailsPageLayoutContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var5 (ref), var6 (ref), var7 (ref), var8 (ref), var9 (ref), var3 (ref), var16 (ref), var10 (ref), var11 (ref), var48 (ref), var42 (ref), var12 (ref), var13 (ref), var35 (ref), var37 (ref), fFlagLuaAppMediaGalleryGamepadSupport (copy), var40 (ref), var44 (ref), var24 (ref), var47 (ref), var19 (ref), var18 (ref), var20 (ref), var21 (ref)
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
				onCanvasPositionChanged = var48,
				contentTopOffset = var42,
				fullBleedOverlapOffset = var12,
				gradientTopBleedOffset = var13,
				initialScrollY = var35,
				hasValidContainerSize = var37,
				disableFocusNavEngineScroll = if fFlagLuaAppMediaGalleryGamepadSupport then var3.disableFocusNavEngineScroll else nil,
				containerHeight = var40,
				headerOpacity = var44,
				stickyHeaderActive = var24,
				onClose = var3.onClose,
				testId = var3.testId,
				onCanvasSizeChanged = var47,
				isFullscreenOverlay = var19,
				setFullscreenContent = var18,
				onExitFullscreenOverlay = var20,
				setOnExitFullscreenOverlay = var21
			}
		end, {
			var5, var3.isFullscreen, var16, var12, var13, var35, var37, var24,
			var3.onClose, var3.testId, var40, var44, var48, var47, var19, var20,
			if fFlagLuaAppMediaGalleryGamepadSupport then var3.disableFocusNavEngineScroll else nil
		})
	}, reactModule.createElement(view, {
		tag = `size-full clip bg-surface-0 {compositionLayoutTag}`,
		stateLayer = { affordance = stateLayerAffordance.None },
		onAbsoluteSizeChanged = var45,
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
				Position = var43,
				Size = var41
			}, var3.fullBleedContent)
		}) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, var3.children),
		FullscreenOverlay = if var19 then reactModule.createElement(view, {
			ZIndex = 10,
			tag = "clip",
			Size = if fFlagSduiExperienceDetailsSupport then var6:map(function(p3)
				-- upvalues: var16 (ref)
				return if p3 then UDim2.new(1, 0, 1, -var16) else UDim2.fromScale(1, 1)
			end) else UDim2.new(1, 0, 1, -var16),
			Position = if fFlagSduiExperienceDetailsSupport then var6:map(function(p3)
				-- upvalues: var16 (ref)
				return if p3 then UDim2.fromOffset(0, var16) else UDim2.fromOffset(0, 0)
			end) else UDim2.fromOffset(0, var16),
			testId = `{var3.testId}--fullscreen-overlay`
		}, var17) else nil
	}))
end))