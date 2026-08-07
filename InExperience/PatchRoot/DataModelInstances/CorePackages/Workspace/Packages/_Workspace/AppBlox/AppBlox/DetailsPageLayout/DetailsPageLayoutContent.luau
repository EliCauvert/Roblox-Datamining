local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local reactUtilsModule = require(parent.ReactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagLuaAppClampBannerPaddingToViewport = sharedFlagsModule.FFlagLuaAppClampBannerPaddingToViewport
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local detailsPageLayoutContextModule = require(script.Parent.DetailsPageLayoutContext)
local detailsPageLayoutUtilsModule = require(script.Parent.DetailsPageLayoutUtils)
local t = { Selectable = false }
local var7 = if fFlagLuaAppClampBannerPaddingToViewport then reactModule.createBinding(0) else nil
local _ = nil

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 39 | named "DetailsPageLayoutContent" ]]
	-- upvalues: reactModule (ref), detailsPageLayoutContextModule (ref), reactUtilsModule (ref), fFlagLuaAppClampBannerPaddingToViewport (ref), var7 (ref), detailsPageLayoutUtilsModule (ref), view (ref), scrollView (ref), fFlagSduiExperienceDetailsSupport (ref), t (ref)
	local var8 = reactModule.useContext(detailsPageLayoutContextModule)
	local contentTopOffset = var8.contentTopOffset
	local hasFullBleed = var8.hasFullBleed
	local isFullscreen = var8.isFullscreen
	local isFullscreenOverlay = var8.isFullscreenOverlay
	local headerBarHeight = var8.headerBarHeight
	local hasHeader = var8.hasHeader
	local onCanvasPositionChanged = var8.onCanvasPositionChanged
	local fullBleedOverlapOffset = var8.fullBleedOverlapOffset
	local initialScrollY = var8.initialScrollY
	local hasValidContainerSize = var8.hasValidContainerSize
	local containerHeight = var8.containerHeight
	local onCanvasSizeChanged = var8.onCanvasSizeChanged
	local hasActions = var8.hasActions
	local actionBarHeight = var8.actionBarHeight
	local testId = var8.testId
	local gradientTopBleedOffset = var8.gradientTopBleedOffset
	assert(testId, "DetailsPageLayout.Content must be used within DetailsPageLayout.Root")
	local var9 = reactUtilsModule.useComposedRef(p0.scrollingFrameRef, reactModule.useCallback(function(p2) --[[ line: 61 ]]
		-- upvalues: initialScrollY (ref)
		if p2 and initialScrollY > 0 then
			p2.CanvasPosition = Vector2.new(0, initialScrollY)
		end
	end, { initialScrollY }))
	local var10, var11 = reactModule.useBinding(initialScrollY)
	local var12, var13 = reactModule.useBinding(0)
	local var14 = reactModule.useCallback(function(p3) --[[ line: 74 ]]
		-- upvalues: var11 (ref), onCanvasPositionChanged (ref)
		var11(p3.CanvasPosition.Y)
		
		if onCanvasPositionChanged then
			onCanvasPositionChanged(p3)
		end
	end, { onCanvasPositionChanged })
	local var15 = reactModule.useMemo(function() --[[ line: 84 ]]
		-- upvalues: hasHeader (ref), hasActions (ref), actionBarHeight (ref), reactModule (copy), headerBarHeight (ref)
		return if hasHeader and hasActions and actionBarHeight then reactModule.joinBindings({ hasHeader, hasActions, actionBarHeight }):map(function(p4) --[[ line: 88 ]]
			-- upvalues: headerBarHeight (copy)
			return UDim2.new(1, 0, 1, -((if p4[1] then headerBarHeight else 0) + (if p4[2] then p4[3] else 0)))
		end) else nil
	end, { hasHeader, hasActions, actionBarHeight, headerBarHeight })
	local var16 = reactModule.useMemo(function() --[[ line: 98 ]]
		-- upvalues: hasHeader (ref), headerBarHeight (ref)
		return if hasHeader then hasHeader:map(function(p5) --[[ line: 102 ]]
			-- upvalues: headerBarHeight (copy)
			return UDim2.new(0, 0, 0, if p5 then headerBarHeight else 0)
		end) else nil
	end, { hasHeader, headerBarHeight })
	local var17 = reactModule.useMemo(function() --[[ line: 111 ]]
		-- upvalues: contentTopOffset (ref), fFlagLuaAppClampBannerPaddingToViewport (copy), reactModule (copy), containerHeight (ref), var7 (copy), detailsPageLayoutUtilsModule (copy), hasFullBleed (ref), fullBleedOverlapOffset (ref), headerBarHeight (ref)
		return if contentTopOffset then if fFlagLuaAppClampBannerPaddingToViewport then reactModule.joinBindings({ contentTopOffset, containerHeight or var7 }):map(function(p7) --[[ line: 117 ]]
			-- upvalues: detailsPageLayoutUtilsModule (copy), hasFullBleed (copy), fullBleedOverlapOffset (copy), headerBarHeight (copy)
			local var21 = p7[2]
			local var22 = detailsPageLayoutUtilsModule.computeCanvasPaddingTop(p7[1], hasFullBleed, fullBleedOverlapOffset, headerBarHeight)
			
			if var21 > 0 then
				var22 = math.min(var22, var21 * 0.75)
			end
			return UDim.new(0, var22)
		end) else contentTopOffset:map(function(p6) --[[ line: 132 ]]
			-- upvalues: detailsPageLayoutUtilsModule (copy), hasFullBleed (copy), fullBleedOverlapOffset (copy), headerBarHeight (copy)
			return UDim.new(0, detailsPageLayoutUtilsModule.computeCanvasPaddingTop(p6, hasFullBleed, fullBleedOverlapOffset, headerBarHeight))
		end) else nil
	end, {
		contentTopOffset,
		if fFlagLuaAppClampBannerPaddingToViewport then containerHeight else nil,
		hasFullBleed,
		fullBleedOverlapOffset,
		headerBarHeight
	})
	local var18 = reactModule.useMemo(function() --[[ line: 151 ]]
		-- upvalues: hasActions (ref), actionBarHeight (ref), reactModule (copy)
		return if hasActions and actionBarHeight then reactModule.joinBindings({ hasActions, actionBarHeight }):map(function(p8) --[[ line: 155 ]]
			return if p8[1] then UDim.new(0, p8[2]) else UDim.new(0, 0)
		end) else nil
	end, { hasActions, actionBarHeight })
	local var19 = reactModule.useMemo(function() --[[ line: 164 ]]
		-- upvalues: var17 (ref), reactModule (copy), var10 (ref), gradientTopBleedOffset (ref)
		return if var17 then reactModule.joinBindings({ var17, var10 }):map(function(p9) --[[ line: 168 ]]
			-- upvalues: gradientTopBleedOffset (copy)
			return UDim2.new(0, 0, 0, p9[1].Offset - p9[2] - gradientTopBleedOffset)
		end) else nil
	end, { var17, var10, gradientTopBleedOffset })
	local var20 = reactModule.useMemo(function() --[[ line: 175 ]]
		-- upvalues: containerHeight (ref), reactModule (copy), var12 (ref), gradientTopBleedOffset (ref)
		return if containerHeight then reactModule.joinBindings({ var12, containerHeight }):map(function(p10) --[[ line: 179 ]]
			-- upvalues: gradientTopBleedOffset (copy)
			local var23 = p10[1]
			
			return UDim2.new(1, 0, 0, (if var23 > 0 then var23 else math.max(p10[2], 1)) + gradientTopBleedOffset)
		end) else nil
	end, { var12, containerHeight, gradientTopBleedOffset })
	
	if isFullscreen then
		assert(var15 and var16, "bindings required in fullscreen mode")
		
		return reactModule.createElement(view, {
			ZIndex = 1,
			tag = "col bg-surface-0",
			Size = var15,
			Position = var16,
			testId = `{testId}--content`,
			ref = p1
		}, {
			Children = reactModule.createElement(reactModule.Fragment, nil, p0.children)
		})
	end
	assert(var17 and (onCanvasPositionChanged and (containerHeight and (hasActions and actionBarHeight))), "DetailsPageLayout.Content requires bindings in scroll mode")
	
	return if hasFullBleed and not hasValidContainerSize then reactModule.createElement(view, {
		tag = "size-full clip bg-surface-0",
		ZIndex = 1,
		testId = `{testId}--content`,
		ref = p1
	}) else reactModule.createElement(view, {
		tag = "size-full clip",
		ZIndex = 1,
		ref = p1,
		testId = `{testId}--content`
	}, {
		BackgroundLayers = reactModule.createElement(view, { tag = "col", ZIndex = 0, Position = var19, Size = var20 }, {
			GradientBar = if hasFullBleed and contentTopOffset then reactModule.createElement(view, {
				tag = "bg-surface-0",
				LayoutOrder = 0,
				Size = contentTopOffset:map(function(p11) --[[ line: 229 ]]
					-- upvalues: fullBleedOverlapOffset (ref), gradientTopBleedOffset (ref)
					return UDim2.new(1, 0, 0, math.min(p11, fullBleedOverlapOffset) + gradientTopBleedOffset)
				end)
			}, {
				Gradient = reactModule.createElement("UIGradient", {
					Rotation = 270,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0),
						NumberSequenceKeypoint.new(0.5, 0.25),
						NumberSequenceKeypoint.new(1, 1)
					})
				})
			}) else nil,
			SolidFill = reactModule.createElement(view, { tag = "fill size-full-0 bg-surface-0", LayoutOrder = 1 })
		}),
		ScrollContent = reactModule.createElement(scrollView, {
			tag = "size-full clip",
			ZIndex = 1,
			scrollingFrameRef = var9,
			selection = if fFlagSduiExperienceDetailsSupport then t else nil,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollingEnabled = not isFullscreenOverlay
			},
			onAbsoluteCanvasSizeChanged = function(value) --[[ line: 271 ]]
				-- upvalues: var13 (ref), onCanvasSizeChanged (ref)
				var13(value.AbsoluteCanvasSize.Y)
				
				if onCanvasSizeChanged then
					onCanvasSizeChanged(value.AbsoluteCanvasSize.Y - value.AbsoluteSize.Y)
				end
			end,
			onCanvasPositionChanged = var14
		}, reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, {
			CanvasPadding = reactModule.createElement("UIPadding", { PaddingTop = var17, PaddingBottom = var18 }),
			ContentSection = reactModule.createElement(view, {
				tag = "auto-y",
				LayoutOrder = 1,
				Size = containerHeight:map(function(p12) --[[ line: 291 ]]
					return UDim2.new(1, 0, 0, p12)
				end)
			}, {
				ContentBackground = reactModule.createElement(view, { tag = "col align-x-center size-full-0 auto-y" }, {
					Children = reactModule.createElement(reactModule.Fragment, nil, p0.children)
				})
			})
		}))
	})
end))