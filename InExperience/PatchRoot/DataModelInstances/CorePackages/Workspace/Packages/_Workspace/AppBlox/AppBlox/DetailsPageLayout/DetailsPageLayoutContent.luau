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
local var1 = if fFlagLuaAppClampBannerPaddingToViewport then reactModule.createBinding(0) else nil
local _ = nil

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), detailsPageLayoutContextModule (ref), reactUtilsModule (ref), fFlagLuaAppClampBannerPaddingToViewport (ref), var1 (ref), detailsPageLayoutUtilsModule (ref), view (ref), scrollView (ref), fFlagSduiExperienceDetailsSupport (ref), t (ref)
	local var2 = reactModule.useContext(detailsPageLayoutContextModule)
	local contentTopOffset = var2.contentTopOffset
	local hasFullBleed = var2.hasFullBleed
	local isFullscreen = var2.isFullscreen
	local isFullscreenOverlay = var2.isFullscreenOverlay
	local headerBarHeight = var2.headerBarHeight
	local hasHeader = var2.hasHeader
	local onCanvasPositionChanged = var2.onCanvasPositionChanged
	local fullBleedOverlapOffset = var2.fullBleedOverlapOffset
	local initialScrollY = var2.initialScrollY
	local hasValidContainerSize = var2.hasValidContainerSize
	local containerHeight = var2.containerHeight
	local onCanvasSizeChanged = var2.onCanvasSizeChanged
	local hasActions = var2.hasActions
	local actionBarHeight = var2.actionBarHeight
	local testId = var2.testId
	local gradientTopBleedOffset = var2.gradientTopBleedOffset
	assert(testId, "DetailsPageLayout.Content must be used within DetailsPageLayout.Root")
	local var3 = reactUtilsModule.useComposedRef(p1.scrollingFrameRef, reactModule.useCallback(function(p3)
		-- upvalues: initialScrollY (ref)
		if p3 and initialScrollY > 0 then
			p3.CanvasPosition = Vector2.new(0, initialScrollY)
		end
	end, { initialScrollY }))
	local var4, var5 = reactModule.useBinding(initialScrollY)
	local var6, var7 = reactModule.useBinding(0)
	local var8 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), onCanvasPositionChanged (ref)
		var5(p3.CanvasPosition.Y)
		
		if onCanvasPositionChanged then
			onCanvasPositionChanged(p3)
		end
	end, { onCanvasPositionChanged })
	local var9 = reactModule.useMemo(function()
		-- upvalues: hasHeader (ref), hasActions (ref), actionBarHeight (ref), reactModule (copy), headerBarHeight (ref)
		return if hasHeader and hasActions and actionBarHeight then reactModule.joinBindings({ hasHeader, hasActions, actionBarHeight }):map(function(p3)
			-- upvalues: headerBarHeight (copy)
			return UDim2.new(1, 0, 1, -((if p3[1] then headerBarHeight else 0) + (if p3[2] then p3[3] else 0)))
		end) else nil
	end, { hasHeader, hasActions, actionBarHeight, headerBarHeight })
	local var10 = reactModule.useMemo(function()
		-- upvalues: hasHeader (ref), headerBarHeight (ref)
		return if hasHeader then hasHeader:map(function(p3)
			-- upvalues: headerBarHeight (copy)
			return UDim2.new(0, 0, 0, if p3 then headerBarHeight else 0)
		end) else nil
	end, { hasHeader, headerBarHeight })
	local var11 = reactModule.useMemo(function()
		-- upvalues: contentTopOffset (ref), fFlagLuaAppClampBannerPaddingToViewport (copy), reactModule (copy), containerHeight (ref), var1 (copy), detailsPageLayoutUtilsModule (copy), hasFullBleed (ref), fullBleedOverlapOffset (ref), headerBarHeight (ref)
		return if contentTopOffset then if fFlagLuaAppClampBannerPaddingToViewport then reactModule.joinBindings({ contentTopOffset, containerHeight or var1 }):map(function(p3)
			-- upvalues: detailsPageLayoutUtilsModule (copy), hasFullBleed (copy), fullBleedOverlapOffset (copy), headerBarHeight (copy)
			local var12 = p3[2]
			local var13 = detailsPageLayoutUtilsModule.computeCanvasPaddingTop(p3[1], hasFullBleed, fullBleedOverlapOffset, headerBarHeight)
			
			if var12 > 0 then
				var13 = math.min(var13, var12 * 0.75)
			end
			return UDim.new(0, var13)
		end) else contentTopOffset:map(function(p3)
			-- upvalues: detailsPageLayoutUtilsModule (copy), hasFullBleed (copy), fullBleedOverlapOffset (copy), headerBarHeight (copy)
			return UDim.new(0, detailsPageLayoutUtilsModule.computeCanvasPaddingTop(p3, hasFullBleed, fullBleedOverlapOffset, headerBarHeight))
		end) else nil
	end, {
		contentTopOffset,
		if fFlagLuaAppClampBannerPaddingToViewport then containerHeight else nil,
		hasFullBleed,
		fullBleedOverlapOffset,
		headerBarHeight
	})
	local var12 = reactModule.useMemo(function()
		-- upvalues: hasActions (ref), actionBarHeight (ref), reactModule (copy)
		return if hasActions and actionBarHeight then reactModule.joinBindings({ hasActions, actionBarHeight }):map(function(p3)
			return if p3[1] then UDim.new(0, p3[2]) else UDim.new(0, 0)
		end) else nil
	end, { hasActions, actionBarHeight })
	local var13 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), reactModule (copy), var4 (ref), gradientTopBleedOffset (ref)
		return if var11 then reactModule.joinBindings({ var11, var4 }):map(function(p3)
			-- upvalues: gradientTopBleedOffset (copy)
			return UDim2.new(0, 0, 0, p3[1].Offset - p3[2] - gradientTopBleedOffset)
		end) else nil
	end, { var11, var4, gradientTopBleedOffset })
	local var14 = reactModule.useMemo(function()
		-- upvalues: containerHeight (ref), reactModule (copy), var6 (ref), gradientTopBleedOffset (ref)
		return if containerHeight then reactModule.joinBindings({ var6, containerHeight }):map(function(p3)
			-- upvalues: gradientTopBleedOffset (copy)
			local var15 = p3[1]
			
			return UDim2.new(1, 0, 0, (if var15 > 0 then var15 else math.max(p3[2], 1)) + gradientTopBleedOffset)
		end) else nil
	end, { var6, containerHeight, gradientTopBleedOffset })
	
	if isFullscreen then
		assert(var9 and var10, "bindings required in fullscreen mode")
		
		return reactModule.createElement(view, {
			ZIndex = 1,
			tag = "col bg-surface-0",
			Size = var9,
			Position = var10,
			testId = `{testId}--content`,
			ref = p2
		}, {
			Children = reactModule.createElement(reactModule.Fragment, nil, p1.children)
		})
	end
	assert(var11 and (onCanvasPositionChanged and (containerHeight and (hasActions and actionBarHeight))), "DetailsPageLayout.Content requires bindings in scroll mode")
	
	return if hasFullBleed and not hasValidContainerSize then reactModule.createElement(view, {
		tag = "size-full clip bg-surface-0",
		ZIndex = 1,
		testId = `{testId}--content`,
		ref = p2
	}) else reactModule.createElement(view, {
		tag = "size-full clip",
		ZIndex = 1,
		ref = p2,
		testId = `{testId}--content`
	}, {
		BackgroundLayers = reactModule.createElement(view, { tag = "col", ZIndex = 0, Position = var13, Size = var14 }, {
			GradientBar = if hasFullBleed and contentTopOffset then reactModule.createElement(view, {
				tag = "bg-surface-0",
				LayoutOrder = 0,
				Size = contentTopOffset:map(function(p3)
					-- upvalues: fullBleedOverlapOffset (ref), gradientTopBleedOffset (ref)
					return UDim2.new(1, 0, 0, math.min(p3, fullBleedOverlapOffset) + gradientTopBleedOffset)
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
			scrollingFrameRef = var3,
			selection = if fFlagSduiExperienceDetailsSupport then t else nil,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollingEnabled = not isFullscreenOverlay
			},
			onAbsoluteCanvasSizeChanged = function(value)
				-- upvalues: var7 (ref), onCanvasSizeChanged (ref)
				var7(value.AbsoluteCanvasSize.Y)
				
				if onCanvasSizeChanged then
					onCanvasSizeChanged(value.AbsoluteCanvasSize.Y - value.AbsoluteSize.Y)
				end
			end,
			onCanvasPositionChanged = var8
		}, reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, {
			CanvasPadding = reactModule.createElement("UIPadding", { PaddingTop = var11, PaddingBottom = var12 }),
			ContentSection = reactModule.createElement(view, {
				tag = "auto-y",
				LayoutOrder = 1,
				Size = containerHeight:map(function(p3)
					return UDim2.new(1, 0, 0, p3)
				end)
			}, {
				ContentBackground = reactModule.createElement(view, { tag = "col align-x-center size-full-0 auto-y" }, {
					Children = reactModule.createElement(reactModule.Fragment, nil, p1.children)
				})
			})
		}))
	})
end))