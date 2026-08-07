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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 68 | named "DetailsPageLayoutRoot" ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), withDefaults (ref), t (ref), compositionTags (ref), reactModule (ref), responsiveModule (ref), fFlagDetailsPageLayoutSeedContainerSize (ref), useNavBarSize (ref), useNavBarPlacement (ref), displayModule (ref), appNavBarModule (ref), detailsPageLayoutUtilsModule (ref), fFlagLuaAppClampBannerPaddingToViewport (ref), detailsPageLayoutContextModule (ref), view (ref), stateLayerAffordance (ref), fFlagSduiExperienceDetailsSupport (ref)
	local var9 = useDeviceInsets()
	local var10 = useTokens()
	local var11 = withDefaults(p0, t)
	local compositionLayoutTag = var11.compositionLayoutTag or compositionTags.Layout.Detail
	local fullBleedAspectRatio = var11.fullBleedAspectRatio
	local var13 = if fullBleedAspectRatio == nil or fullBleedAspectRatio <= 0 then 1.777777777778 else fullBleedAspectRatio
	local var14 = var11.fullBleedContent ~= nil and not var11.isFullscreen
	local var15, var16 = reactModule.useBinding(false)
	local var17, var18 = reactModule.useBinding(false)
	local var19, var20 = reactModule.useBinding(0)
	local scale = var10.Config.UI.Scale
	local var21 = var11.fullBleedOverlapOffset * scale
	local var22 = if var11.gradientTopBleedOffset then var11.gradientTopBleedOffset * scale else var10.Size.Size_2000
	local var23 = (if responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small) then var10.Size.Size_1000 + var10.Padding.Large + var10.Padding.Medium else var10.Size.Size_2000) + var9.top
	local var24, var25 = reactModule.useState(nil)
	local var26 = var24 ~= nil
	local var27, var28 = reactModule.useState(nil)
	local var29, var30 = reactModule.useState(false)
	local var31 = not var14 or (var29 or var26)
	local containerSize = nil
	local var32 = 0
	
	if fFlagDetailsPageLayoutSeedContainerSize then
		local var33 = useNavBarSize()
		local var34 = useNavBarPlacement()
		local var35 = reactModule.useMemo(function() --[[ line: 119 ]]
			-- upvalues: displayModule (copy), var34 (ref), appNavBarModule (copy), var33 (ref), var14 (ref), detailsPageLayoutUtilsModule (copy), var13 (ref), var23 (ref), var21 (ref), p0 (ref)
			local viewportSize = displayModule.GetDisplayStore(false).getViewportSize(false)
			local vector2 = Vector2.new(if var34 == appNavBarModule.Placement.Left then math.max(0, viewportSize.X - var33) else viewportSize.X, viewportSize.Y)
			
			return {
				containerSize = vector2,
				initialScrollY = if var14 then detailsPageLayoutUtilsModule.computeInitialScrollYForSize(vector2, {
					fullBleedAspectRatio = var13,
					headerBarHeight = var23,
					fullBleedOverlapOffset = var21,
					hasFullBleed = var14,
					bannerBottomVisiblePercent = p0.bannerBottomVisiblePercent
				}) else 0
			}
		end, {})
		containerSize = var35.containerSize
		var32 = var35.initialScrollY
	end
	local var36, var37 = reactModule.useBinding(if fFlagDetailsPageLayoutSeedContainerSize then containerSize else Vector2.new(0, 0))
	local var38, var39 = reactModule.useBinding(if fFlagDetailsPageLayoutSeedContainerSize then var32 else 0)
	local var40, var41 = reactModule.useBinding(0)
	local var42, var43 = reactModule.useState(if fFlagDetailsPageLayoutSeedContainerSize then var32 else 0)
	local var44, var45 = reactModule.useState(if fFlagDetailsPageLayoutSeedContainerSize then true else false)
	local var46 = reactModule.useRef(if fFlagDetailsPageLayoutSeedContainerSize then var14 else false)
	local var47 = var36:map(function(p2) --[[ line: 157 ]]
		return p2.Y
	end)
	local var48 = var36:map(function(p3) --[[ line: 161 ]]
		-- upvalues: var13 (ref)
		return UDim2.new(0, p3.X, 0, p3.X / var13)
	end)
	local var49 = var36:map(function(p4) --[[ line: 167 ]]
		-- upvalues: var14 (ref), detailsPageLayoutUtilsModule (copy), var13 (ref), var23 (ref)
		return if var14 then detailsPageLayoutUtilsModule.computeContentTopOffset(p4.X, var13, var23) else 0
	end)
	local var50 = reactModule.joinBindings({ var49, var38 }):map(function(p5) --[[ line: 176 ]]
		-- upvalues: var23 (ref)
		return UDim2.new(0.5, 0, 0, math.max(0, p5[1] + var23 - p5[2]) / 2)
	end)
	local var51 = reactModule.joinBindings({ var38, var49, var40 }):map(function(p6) --[[ line: 186 ]]
		-- upvalues: detailsPageLayoutUtilsModule (copy), var23 (ref), var21 (ref)
		local var58 = p6[1]
		local var59 = p6[2]
		local var60 = p6[3]
		
		if var59 == 0 then
			return math.clamp(var58 / detailsPageLayoutUtilsModule.getNoBannerFadeParams(var23), 0, 1)
		end
		local headerFadeParams, headerFadeParams_1 = detailsPageLayoutUtilsModule.getHeaderFadeParams(var59, var60, var21)
		
		return math.clamp((var58 - headerFadeParams) / headerFadeParams_1, 0, 1)
	end)
	local var52 = reactModule.useCallback(function(p7) --[[ line: 202 ]]
		-- upvalues: var37 (ref), var45 (ref), var14 (ref), var46 (ref), fFlagDetailsPageLayoutSeedContainerSize (copy), detailsPageLayoutUtilsModule (copy), var13 (ref), var23 (ref), var21 (ref), p0 (ref), fFlagLuaAppClampBannerPaddingToViewport (copy), var43 (ref), var39 (ref)
		local absoluteSize = p7.AbsoluteSize
		var37(absoluteSize)
		
		if absoluteSize.X > 0 and absoluteSize.Y > 0 then
			var45(true)
			
			if var14 and not var46.current then
				local var63
				var46.current = true
				local _ = nil
				
				if fFlagDetailsPageLayoutSeedContainerSize then
					var63 = detailsPageLayoutUtilsModule.computeInitialScrollYForSize(absoluteSize, {
						fullBleedAspectRatio = var13,
						headerBarHeight = var23,
						fullBleedOverlapOffset = var21,
						hasFullBleed = var14,
						bannerBottomVisiblePercent = p0.bannerBottomVisiblePercent
					})
				else
					local var64 = absoluteSize.X / var13
					var63 = if p0.bannerBottomVisiblePercent ~= nil then detailsPageLayoutUtilsModule.computeInitialScrollY(absoluteSize.X, var13, var23, var21) else math.max(0, math.floor(var64 - p0.bannerBottomVisiblePercent * var64))
					local var65 = detailsPageLayoutUtilsModule.computeCanvasPaddingTop(detailsPageLayoutUtilsModule.computeContentTopOffset(absoluteSize.X, var13, var23), var14, var21, var23)
					
					if fFlagLuaAppClampBannerPaddingToViewport then
						var65 = math.min(var65, absoluteSize.Y * 0.75)
					end
					var63 = math.min(var63, math.max(0, var65 - var23))
				end
				var43(var63)
				var39(var63)
			end
		end
	end, {
		var14, var13, var23, var21, p0.bannerBottomVisiblePercent,
		if fFlagDetailsPageLayoutSeedContainerSize then containerSize else nil
	})
	local var53 = reactModule.useRef(0)
	local var54 = reactModule.useCallback(function(p8) --[[ line: 264 ]]
		-- upvalues: var53 (ref), var41 (ref)
		if math.abs(p8 - var53.current) > 0.5 then
			var53.current = p8
			var41(p8)
		end
	end, {})
	local var55 = reactModule.useCallback(function(p9) --[[ line: 271 ]]
		-- upvalues: var39 (ref), var14 (ref), var49 (ref), var40 (ref), detailsPageLayoutUtilsModule (copy), var21 (ref), var30 (ref)
		local y = p9.CanvasPosition.Y
		var39(y)
		
		if var14 then
			local value = var49:getValue()
			local headerFadeParams, headerFadeParams_1 = detailsPageLayoutUtilsModule.getHeaderFadeParams(value, var40:getValue(), var21)
			var30(detailsPageLayoutUtilsModule.shouldShowStickyBar(y, value, headerFadeParams, headerFadeParams_1))
		end
	end, { var14, var21 })
	
	return reactModule.createElement(detailsPageLayoutContextModule.Provider, {
		value = reactModule.useMemo(function() --[[ line: 293 ]]
			-- upvalues: var14 (ref), var15 (ref), var16 (ref), var17 (ref), var18 (ref), var11 (ref), var23 (ref), var19 (ref), var20 (ref), var55 (ref), var49 (ref), var21 (ref), var22 (ref), var42 (ref), var44 (ref), var47 (ref), var51 (ref), var31 (ref), var54 (ref), var26 (ref), var25 (ref), var27 (ref), var28 (ref)
			return {
				hasFullBleed = var14,
				hasHeader = var15,
				setHasHeader = var16,
				hasActions = var17,
				setHasActions = var18,
				isFullscreen = var11.isFullscreen,
				headerBarHeight = var23,
				actionBarHeight = var19,
				setActionBarHeight = var20,
				onCanvasPositionChanged = var55,
				contentTopOffset = var49,
				fullBleedOverlapOffset = var21,
				gradientTopBleedOffset = var22,
				initialScrollY = var42,
				hasValidContainerSize = var44,
				containerHeight = var47,
				headerOpacity = var51,
				stickyHeaderActive = var31,
				onClose = var11.onClose,
				testId = var11.testId,
				onCanvasSizeChanged = var54,
				isFullscreenOverlay = var26,
				setFullscreenContent = var25,
				onExitFullscreenOverlay = var27,
				setOnExitFullscreenOverlay = var28
			}
		end, {
			var14, var11.isFullscreen, var23, var21, var22, var42, var44, var31,
			var11.onClose, var11.testId, var47, var51, var55, var54, var26, var27
		})
	}, reactModule.createElement(view, {
		tag = `size-full clip bg-surface-0 {compositionLayoutTag}`,
		stateLayer = { affordance = stateLayerAffordance.None },
		onAbsoluteSizeChanged = var52,
		ref = p1,
		selectionGroup = var11.selectionGroup,
		testId = `{var11.testId}--root`
	}, {
		FullBleed = if var14 then reactModule.createElement(view, {
			tag = "position-top-center anchor-top-center size-full clip",
			ZIndex = 0,
			testId = `{var11.testId}--fullbleed`
		}, {
			ParallaxFrame = reactModule.createElement(view, {
				tag = "anchor-center-center clip",
				Position = var50,
				Size = var48
			}, var11.fullBleedContent)
		}) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, var11.children),
		FullscreenOverlay = if var26 then reactModule.createElement(view, {
			ZIndex = 10,
			tag = "clip",
			Size = if fFlagSduiExperienceDetailsSupport then var15:map(function(p10) --[[ line: 371 ]]
				-- upvalues: var23 (ref)
				return if p10 then UDim2.new(1, 0, 1, -var23) else UDim2.fromScale(1, 1)
			end) else UDim2.new(1, 0, 1, -var23),
			Position = if fFlagSduiExperienceDetailsSupport then var15:map(function(p11) --[[ line: 376 ]]
				-- upvalues: var23 (ref)
				return if p11 then UDim2.fromOffset(0, var23) else UDim2.fromOffset(0, 0)
			end) else UDim2.fromOffset(0, var23),
			testId = `{var11.testId}--fullscreen-overlay`
		}, var24) else nil
	}))
end))