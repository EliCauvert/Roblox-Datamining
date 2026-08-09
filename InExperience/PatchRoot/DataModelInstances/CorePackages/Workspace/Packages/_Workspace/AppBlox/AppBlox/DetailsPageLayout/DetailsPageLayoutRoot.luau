local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local sharedFlagsModule = require(parent.SharedFlags)
local view = foundationModule.View
local withDefaults = foundationModule.Utility.withDefaults
local useTokens = foundationModule.Hooks.useTokens
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useDeviceInsets = responsiveModule.useDeviceInsets
local compositionTags = require(parent.AppComposition).CompositionTags
local detailsPageLayoutContextModule = require(script.Parent.DetailsPageLayoutContext)
local detailsPageLayoutUtilsModule = require(script.Parent.DetailsPageLayoutUtils)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagLuaAppClampBannerPaddingToViewport = sharedFlagsModule.FFlagLuaAppClampBannerPaddingToViewport
local t = {
	testId = "app-blox-details-page",
	fullBleedAspectRatio = 1.777777777778,
	fullBleedOverlapOffset = 180
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 63 | named "DetailsPageLayoutRoot" ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), withDefaults (ref), t (ref), compositionTags (ref), reactModule (ref), responsiveModule (ref), detailsPageLayoutUtilsModule (ref), fFlagLuaAppClampBannerPaddingToViewport (ref), detailsPageLayoutContextModule (ref), view (ref), stateLayerAffordance (ref), fFlagSduiExperienceDetailsSupport (ref)
	local var7 = useDeviceInsets()
	local var8 = useTokens()
	local var9 = withDefaults(p0, t)
	local compositionLayoutTag = var9.compositionLayoutTag or compositionTags.Layout.Detail
	local fullBleedAspectRatio = var9.fullBleedAspectRatio
	local var11 = if fullBleedAspectRatio == nil or fullBleedAspectRatio <= 0 then 1.777777777778 else fullBleedAspectRatio
	local var12 = var9.fullBleedContent ~= nil and not var9.isFullscreen
	local var13, var14 = reactModule.useBinding(false)
	local var15, var16 = reactModule.useBinding(false)
	local var17, var18 = reactModule.useBinding(0)
	local scale = var8.Config.UI.Scale
	local var19 = var9.fullBleedOverlapOffset * scale
	local var20 = if var9.gradientTopBleedOffset then var9.gradientTopBleedOffset * scale else var8.Size.Size_2000
	local var21 = (if responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small) then var8.Size.Size_1000 + var8.Padding.Large + var8.Padding.Medium else var8.Size.Size_2000) + var7.top
	local var22, var23 = reactModule.useState(nil)
	local var24 = var22 ~= nil
	local var25, var26 = reactModule.useState(nil)
	local var27, var28 = reactModule.useState(false)
	local var29 = not var12 or (var27 or var24)
	local var30, var31 = reactModule.useBinding(Vector2.new(0, 0))
	local var32, var33 = reactModule.useBinding(0)
	local var34, var35 = reactModule.useBinding(0)
	local var36, var37 = reactModule.useState(0)
	local var38, var39 = reactModule.useState(false)
	local var40 = reactModule.useRef(false)
	local var41 = var30:map(function(p2) --[[ line: 111 ]]
		return p2.Y
	end)
	local var42 = var30:map(function(p3) --[[ line: 115 ]]
		-- upvalues: var11 (ref)
		return UDim2.new(0, p3.X, 0, p3.X / var11)
	end)
	local var43 = var30:map(function(p4) --[[ line: 121 ]]
		-- upvalues: var12 (ref), detailsPageLayoutUtilsModule (copy), var11 (ref), var21 (ref)
		return if var12 then detailsPageLayoutUtilsModule.computeContentTopOffset(p4.X, var11, var21) else 0
	end)
	local var44 = reactModule.joinBindings({ var43, var32 }):map(function(p5) --[[ line: 130 ]]
		-- upvalues: var21 (ref)
		return UDim2.new(0.5, 0, 0, math.max(0, p5[1] + var21 - p5[2]) / 2)
	end)
	local var45 = reactModule.joinBindings({ var32, var43, var34 }):map(function(p6) --[[ line: 140 ]]
		-- upvalues: detailsPageLayoutUtilsModule (copy), var21 (ref), var19 (ref)
		local var50 = p6[1]
		local var51 = p6[2]
		local var52 = p6[3]
		
		if var51 == 0 then
			return math.clamp(var50 / detailsPageLayoutUtilsModule.getNoBannerFadeParams(var21), 0, 1)
		end
		local headerFadeParams, headerFadeParams_1 = detailsPageLayoutUtilsModule.getHeaderFadeParams(var51, var52, var19)
		
		return math.clamp((var50 - headerFadeParams) / headerFadeParams_1, 0, 1)
	end)
	local var46 = reactModule.useCallback(function(p7) --[[ line: 156 ]]
		-- upvalues: var31 (ref), var39 (ref), var12 (ref), var40 (ref), var11 (ref), p0 (ref), detailsPageLayoutUtilsModule (copy), var21 (ref), var19 (ref), fFlagLuaAppClampBannerPaddingToViewport (copy), var37 (ref), var33 (ref)
		local absoluteSize = p7.AbsoluteSize
		var31(absoluteSize)
		
		if absoluteSize.X > 0 and absoluteSize.Y > 0 then
			var39(true)
			
			if var12 and not var40.current then
				var40.current = true
				local var55 = absoluteSize.X / var11
				local var56 = if p0.bannerBottomVisiblePercent ~= nil then detailsPageLayoutUtilsModule.computeInitialScrollY(absoluteSize.X, var11, var21, var19) else math.max(0, math.floor(var55 - p0.bannerBottomVisiblePercent * var55))
				local var57 = detailsPageLayoutUtilsModule.computeCanvasPaddingTop(detailsPageLayoutUtilsModule.computeContentTopOffset(absoluteSize.X, var11, var21), var12, var19, var21)
				
				if fFlagLuaAppClampBannerPaddingToViewport then
					var57 = math.min(var57, absoluteSize.Y * 0.75)
				end
				var56 = math.min(var56, math.max(0, var57 - var21))
				var37(var56)
				var33(var56)
			end
		end
	end, {
		var12,
		var11,
		var21,
		var19,
		p0.bannerBottomVisiblePercent
	})
	local var47 = reactModule.useRef(0)
	local var48 = reactModule.useCallback(function(p8) --[[ line: 204 ]]
		-- upvalues: var47 (ref), var35 (ref)
		if math.abs(p8 - var47.current) > 0.5 then
			var47.current = p8
			var35(p8)
		end
	end, {})
	local var49 = reactModule.useCallback(function(p9) --[[ line: 211 ]]
		-- upvalues: var33 (ref), var12 (ref), var43 (ref), var34 (ref), detailsPageLayoutUtilsModule (copy), var19 (ref), var28 (ref)
		local y = p9.CanvasPosition.Y
		var33(y)
		
		if var12 then
			local value = var43:getValue()
			local headerFadeParams, headerFadeParams_1 = detailsPageLayoutUtilsModule.getHeaderFadeParams(value, var34:getValue(), var19)
			var28(detailsPageLayoutUtilsModule.shouldShowStickyBar(y, value, headerFadeParams, headerFadeParams_1))
		end
	end, { var12, var19 })
	
	return reactModule.createElement(detailsPageLayoutContextModule.Provider, {
		value = reactModule.useMemo(function() --[[ line: 233 ]]
			-- upvalues: var12 (ref), var13 (ref), var14 (ref), var15 (ref), var16 (ref), var9 (ref), var21 (ref), var17 (ref), var18 (ref), var49 (ref), var43 (ref), var19 (ref), var20 (ref), var36 (ref), var38 (ref), var41 (ref), var45 (ref), var29 (ref), var48 (ref), var24 (ref), var23 (ref), var25 (ref), var26 (ref)
			return {
				hasFullBleed = var12,
				hasHeader = var13,
				setHasHeader = var14,
				hasActions = var15,
				setHasActions = var16,
				isFullscreen = var9.isFullscreen,
				headerBarHeight = var21,
				actionBarHeight = var17,
				setActionBarHeight = var18,
				onCanvasPositionChanged = var49,
				contentTopOffset = var43,
				fullBleedOverlapOffset = var19,
				gradientTopBleedOffset = var20,
				initialScrollY = var36,
				hasValidContainerSize = var38,
				containerHeight = var41,
				headerOpacity = var45,
				stickyHeaderActive = var29,
				onClose = var9.onClose,
				testId = var9.testId,
				onCanvasSizeChanged = var48,
				isFullscreenOverlay = var24,
				setFullscreenContent = var23,
				onExitFullscreenOverlay = var25,
				setOnExitFullscreenOverlay = var26
			}
		end, {
			var12, var9.isFullscreen, var21, var19, var20, var36, var38, var29,
			var9.onClose, var9.testId, var41, var45, var49, var48, var24, var25
		})
	}, reactModule.createElement(view, {
		tag = `size-full clip bg-surface-0 {compositionLayoutTag}`,
		stateLayer = { affordance = stateLayerAffordance.None },
		onAbsoluteSizeChanged = var46,
		ref = p1,
		selectionGroup = var9.selectionGroup,
		testId = `{var9.testId}--root`
	}, {
		FullBleed = if var12 then reactModule.createElement(view, {
			tag = "position-top-center anchor-top-center size-full clip",
			ZIndex = 0,
			testId = `{var9.testId}--fullbleed`
		}, {
			ParallaxFrame = reactModule.createElement(view, {
				tag = "anchor-center-center clip",
				Position = var44,
				Size = var42
			}, var9.fullBleedContent)
		}) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, var9.children),
		FullscreenOverlay = if var24 then reactModule.createElement(view, {
			ZIndex = 10,
			tag = "clip",
			Size = if fFlagSduiExperienceDetailsSupport then var13:map(function(p10) --[[ line: 311 ]]
				-- upvalues: var21 (ref)
				return if p10 then UDim2.new(1, 0, 1, -var21) else UDim2.fromScale(1, 1)
			end) else UDim2.new(1, 0, 1, -var21),
			Position = if fFlagSduiExperienceDetailsSupport then var13:map(function(p11) --[[ line: 316 ]]
				-- upvalues: var21 (ref)
				return if p11 then UDim2.fromOffset(0, var21) else UDim2.fromOffset(0, 0)
			end) else UDim2.fromOffset(0, var21),
			testId = `{var9.testId}--fullscreen-overlay`
		}, var22) else nil
	}))
end))