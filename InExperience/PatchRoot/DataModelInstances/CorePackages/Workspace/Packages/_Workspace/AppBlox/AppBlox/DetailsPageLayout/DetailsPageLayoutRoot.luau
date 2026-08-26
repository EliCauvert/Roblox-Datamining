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
local t = {
	testId = "app-blox-details-page",
	fullBleedAspectRatio = 1.777777777778,
	fullBleedOverlapOffset = 180
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), withDefaults (ref), t (ref), compositionTags (ref), reactModule (ref), responsiveModule (ref), fFlagDetailsPageLayoutSeedContainerSize (ref), useNavBarSize (ref), useNavBarPlacement (ref), displayModule (ref), appNavBarModule (ref), detailsPageLayoutUtilsModule (ref), fFlagLuaAppClampBannerPaddingToViewport (ref), detailsPageLayoutContextModule (ref), view (ref), stateLayerAffordance (ref), fFlagSduiExperienceDetailsSupport (ref)
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
	local var14 = (if responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small) then var2.Size.Size_1000 + var2.Padding.Large + var2.Padding.Medium else var2.Size.Size_2000) + var1.top
	local var15, var16 = reactModule.useState(nil)
	local var17 = var15 ~= nil
	local var18, var19 = reactModule.useState(nil)
	local var20, var21 = reactModule.useState(false)
	local var22 = not var5 or (var20 or var17)
	local containerSize = nil
	local var23 = 0
	
	if fFlagDetailsPageLayoutSeedContainerSize then
		local var24 = useNavBarSize()
		local var25 = useNavBarPlacement()
		local var26 = reactModule.useMemo(function()
			-- upvalues: displayModule (copy), var25 (ref), appNavBarModule (copy), var24 (ref), var5 (ref), detailsPageLayoutUtilsModule (copy), var4 (ref), var14 (ref), var12 (ref), p1 (ref)
			local viewportSize = displayModule.GetDisplayStore(false).getViewportSize(false)
			local vector2 = Vector2.new(if var25 == appNavBarModule.Placement.Left then math.max(0, viewportSize.X - var24) else viewportSize.X, viewportSize.Y)
			
			return {
				containerSize = vector2,
				initialScrollY = if var5 then detailsPageLayoutUtilsModule.computeInitialScrollYForSize(vector2, {
					fullBleedAspectRatio = var4,
					headerBarHeight = var14,
					fullBleedOverlapOffset = var12,
					hasFullBleed = var5,
					bannerBottomVisiblePercent = p1.bannerBottomVisiblePercent
				}) else 0
			}
		end, {})
		containerSize = var26.containerSize
		var23 = var26.initialScrollY
	end
	local var27, var28 = reactModule.useBinding(if fFlagDetailsPageLayoutSeedContainerSize then containerSize else Vector2.new(0, 0))
	local var29, var30 = reactModule.useBinding(if fFlagDetailsPageLayoutSeedContainerSize then var23 else 0)
	local var31, var32 = reactModule.useBinding(0)
	local var33, var34 = reactModule.useState(if fFlagDetailsPageLayoutSeedContainerSize then var23 else 0)
	local var35, var36 = reactModule.useState(if fFlagDetailsPageLayoutSeedContainerSize then true else false)
	local var37 = reactModule.useRef(if fFlagDetailsPageLayoutSeedContainerSize then var5 else false)
	local var38 = var27:map(function(p3)
		return p3.Y
	end)
	local var39 = var27:map(function(p3)
		-- upvalues: var4 (ref)
		return UDim2.new(0, p3.X, 0, p3.X / var4)
	end)
	local var40 = var27:map(function(p3)
		-- upvalues: var5 (ref), detailsPageLayoutUtilsModule (copy), var4 (ref), var14 (ref)
		return if var5 then detailsPageLayoutUtilsModule.computeContentTopOffset(p3.X, var4, var14) else 0
	end)
	local var41 = reactModule.joinBindings({ var40, var29 }):map(function(p3)
		-- upvalues: var14 (ref)
		return UDim2.new(0.5, 0, 0, math.max(0, p3[1] + var14 - p3[2]) / 2)
	end)
	local var42 = reactModule.joinBindings({ var29, var40, var31 }):map(function(p3)
		-- upvalues: detailsPageLayoutUtilsModule (copy), var14 (ref), var12 (ref)
		local var43 = p3[1]
		local var44 = p3[2]
		local var45 = p3[3]
		
		if var44 == 0 then
			return math.clamp(var43 / detailsPageLayoutUtilsModule.getNoBannerFadeParams(var14), 0, 1)
		end
		local headerFadeParams, headerFadeParams_1 = detailsPageLayoutUtilsModule.getHeaderFadeParams(var44, var45, var12)
		
		return math.clamp((var43 - headerFadeParams) / headerFadeParams_1, 0, 1)
	end)
	local var43 = reactModule.useCallback(function(p3)
		-- upvalues: var28 (ref), var36 (ref), var5 (ref), var37 (ref), fFlagDetailsPageLayoutSeedContainerSize (copy), detailsPageLayoutUtilsModule (copy), var4 (ref), var14 (ref), var12 (ref), p1 (ref), fFlagLuaAppClampBannerPaddingToViewport (copy), var34 (ref), var30 (ref)
		local absoluteSize = p3.AbsoluteSize
		var28(absoluteSize)
		
		if absoluteSize.X > 0 and absoluteSize.Y > 0 then
			var36(true)
			
			if var5 and not var37.current then
				local var44
				var37.current = true
				local _ = nil
				
				if fFlagDetailsPageLayoutSeedContainerSize then
					var44 = detailsPageLayoutUtilsModule.computeInitialScrollYForSize(absoluteSize, {
						fullBleedAspectRatio = var4,
						headerBarHeight = var14,
						fullBleedOverlapOffset = var12,
						hasFullBleed = var5,
						bannerBottomVisiblePercent = p1.bannerBottomVisiblePercent
					})
				else
					local var45 = absoluteSize.X / var4
					var44 = if p1.bannerBottomVisiblePercent ~= nil then detailsPageLayoutUtilsModule.computeInitialScrollY(absoluteSize.X, var4, var14, var12) else math.max(0, math.floor(var45 - p1.bannerBottomVisiblePercent * var45))
					local var46 = detailsPageLayoutUtilsModule.computeCanvasPaddingTop(detailsPageLayoutUtilsModule.computeContentTopOffset(absoluteSize.X, var4, var14), var5, var12, var14)
					
					if fFlagLuaAppClampBannerPaddingToViewport then
						var46 = math.min(var46, absoluteSize.Y * 0.75)
					end
					var44 = math.min(var44, math.max(0, var46 - var14))
				end
				var34(var44)
				var30(var44)
			end
		end
	end, {
		var5, var4, var14, var12, p1.bannerBottomVisiblePercent,
		if fFlagDetailsPageLayoutSeedContainerSize then containerSize else nil
	})
	local var44 = reactModule.useRef(0)
	local var45 = reactModule.useCallback(function(p3)
		-- upvalues: var44 (ref), var32 (ref)
		if math.abs(p3 - var44.current) > 0.5 then
			var44.current = p3
			var32(p3)
		end
	end, {})
	local var46 = reactModule.useCallback(function(p3)
		-- upvalues: var30 (ref), var5 (ref), var40 (ref), var31 (ref), detailsPageLayoutUtilsModule (copy), var12 (ref), var21 (ref)
		local y = p3.CanvasPosition.Y
		var30(y)
		
		if var5 then
			local value = var40:getValue()
			local headerFadeParams, headerFadeParams_1 = detailsPageLayoutUtilsModule.getHeaderFadeParams(value, var31:getValue(), var12)
			var21(detailsPageLayoutUtilsModule.shouldShowStickyBar(y, value, headerFadeParams, headerFadeParams_1))
		end
	end, { var5, var12 })
	
	return reactModule.createElement(detailsPageLayoutContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var5 (ref), var6 (ref), var7 (ref), var8 (ref), var9 (ref), var3 (ref), var14 (ref), var10 (ref), var11 (ref), var46 (ref), var40 (ref), var12 (ref), var13 (ref), var33 (ref), var35 (ref), var38 (ref), var42 (ref), var22 (ref), var45 (ref), var17 (ref), var16 (ref), var18 (ref), var19 (ref)
			return {
				hasFullBleed = var5,
				hasHeader = var6,
				setHasHeader = var7,
				hasActions = var8,
				setHasActions = var9,
				isFullscreen = var3.isFullscreen,
				headerBarHeight = var14,
				actionBarHeight = var10,
				setActionBarHeight = var11,
				onCanvasPositionChanged = var46,
				contentTopOffset = var40,
				fullBleedOverlapOffset = var12,
				gradientTopBleedOffset = var13,
				initialScrollY = var33,
				hasValidContainerSize = var35,
				containerHeight = var38,
				headerOpacity = var42,
				stickyHeaderActive = var22,
				onClose = var3.onClose,
				testId = var3.testId,
				onCanvasSizeChanged = var45,
				isFullscreenOverlay = var17,
				setFullscreenContent = var16,
				onExitFullscreenOverlay = var18,
				setOnExitFullscreenOverlay = var19
			}
		end, {
			var5, var3.isFullscreen, var14, var12, var13, var33, var35, var22,
			var3.onClose, var3.testId, var38, var42, var46, var45, var17, var18
		})
	}, reactModule.createElement(view, {
		tag = `size-full clip bg-surface-0 {compositionLayoutTag}`,
		stateLayer = { affordance = stateLayerAffordance.None },
		onAbsoluteSizeChanged = var43,
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
				Position = var41,
				Size = var39
			}, var3.fullBleedContent)
		}) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, var3.children),
		FullscreenOverlay = if var17 then reactModule.createElement(view, {
			ZIndex = 10,
			tag = "clip",
			Size = if fFlagSduiExperienceDetailsSupport then var6:map(function(p3)
				-- upvalues: var14 (ref)
				return if p3 then UDim2.new(1, 0, 1, -var14) else UDim2.fromScale(1, 1)
			end) else UDim2.new(1, 0, 1, -var14),
			Position = if fFlagSduiExperienceDetailsSupport then var6:map(function(p3)
				-- upvalues: var14 (ref)
				return if p3 then UDim2.fromOffset(0, var14) else UDim2.fromOffset(0, 0)
			end) else UDim2.fromOffset(0, var14),
			testId = `{var3.testId}--fullscreen-overlay`
		}, var15) else nil
	}))
end))