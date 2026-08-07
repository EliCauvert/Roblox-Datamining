local variableItemWidthCarousel = script:FindFirstAncestor("VariableItemWidthCarousel")
local parent = variableItemWidthCarousel.Parent
local collectionViewsModule = require(parent.CollectionViews)
local reactModule = require(parent.React)
local carouselScrollButtons = collectionViewsModule.CarouselScrollButtons
local collectionHeader = collectionViewsModule.CollectionHeader
local useDesignTokens = require(parent.Style).useDesignTokens
local responsiveModule = require(parent.Responsive)
local useLastInput = responsiveModule.useLastInput
local usePreferredInput = responsiveModule.usePreferredInput
local useIsSpatial = responsiveModule.useIsSpatial
local useVariableItemWidthScrollHandlersModule = require(variableItemWidthCarousel.useVariableItemWidthScrollHandlers)
local fFlagLuaAppEnableVRCarouselScrolling = require(parent.SharedFlags).FFlagLuaAppEnableVRCarouselScrolling
local fFlagLuaAppHideEmptyCarouselHeader = require(parent.SharedFlags).FFlagLuaAppHideEmptyCarouselHeader

local function _(p0, p1, p2, p3) --[[ line: 50 | named "areScrollButtonsEnabled" ]]
	-- upvalues: responsiveModule (ref), fFlagLuaAppEnableVRCarouselScrolling (ref)
	local var5
	if not p2 then
		return false
	elseif p0 == responsiveModule.Input.Pointer then
		var5 = if p1 == responsiveModule.Input.Directional then fFlagLuaAppEnableVRCarouselScrolling and p3 else true
	end
	return var5
end

function VariableItemWidthCarousel(p4, p5) --[[ line: 68 ]]
	-- upvalues: useDesignTokens (ref), useLastInput (ref), usePreferredInput (ref), useIsSpatial (ref), fFlagLuaAppHideEmptyCarouselHeader (ref), fFlagLuaAppEnableVRCarouselScrolling (ref), responsiveModule (ref), reactModule (ref), useVariableItemWidthScrollHandlersModule (ref), collectionHeader (ref), carouselScrollButtons (ref)
	local var12
	local var6 = useDesignTokens()
	local var7 = useLastInput()
	local var8 = usePreferredInput()
	local var9 = useIsSpatial()
	local items = p4.items
	local renderItem = p4.renderItem
	local itemPadding = p4.itemPadding
	local itemHeight = p4.itemHeight
	local sideMargin = p4.sideMargin or 0
	local calculateItemWidth = p4.calculateItemWidth
	local scrollingFrameRef = p4.scrollingFrameRef
	local var11 = p4.title and p4.title ~= ""
	
	if fFlagLuaAppHideEmptyCarouselHeader then
		var12 = var11
		
		if not var12 then
			var12 = true
			
			if p4.subtitle == nil then
				var12 = p4.tooltipInfoText ~= nil
				var12 = nil
			end
		end
	else
		var12 = true
	end
	local scrollButtonsEnabled = p4.scrollButtonsEnabled
	
	if scrollButtonsEnabled then
		local var13 = if fFlagLuaAppEnableVRCarouselScrolling then var9 else nil
		
		if not (if fFlagLuaAppEnableVRCarouselScrolling then true else not var9) then
			scrollButtonsEnabled = false
		elseif var7 == responsiveModule.Input.Pointer then
			scrollButtonsEnabled = if var8 == responsiveModule.Input.Directional then fFlagLuaAppEnableVRCarouselScrolling and var13 else true
		end
	end
	local var24
	local var14 = reactModule.useMemo(function() --[[ line: 93 ]]
		-- upvalues: items (ref), renderItem (ref)
		local t = {}
		
		for i, v in ipairs(items) do
			t[i] = renderItem(v, i)
		end
		return t
	end, { items, renderItem })
	local var15, var16, var17, var18, var19 = useVariableItemWidthScrollHandlersModule(items, itemPadding, calculateItemWidth, scrollingFrameRef, p4.scrollSpeed)
	local var20 = reactModule.useCallback(function(p6) --[[ line: 105 ]]
		-- upvalues: var19 (ref), p4 (ref)
		var19()
		
		if p4.onCanvasPositionChanged and p6 then
			p4.onCanvasPositionChanged(p6.CanvasPosition)
		end
	end, { var19, p4.onCanvasPositionChanged })
	local createElement = reactModule.createElement
	local var21 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = p4.Position,
		LayoutOrder = p4.LayoutOrder,
		ref = p5
	}
	local t_1 = {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, sideMargin),
			PaddingRight = UDim.new(0, sideMargin)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if if fFlagLuaAppHideEmptyCarouselHeader then var12 else var11 then p4.headerContentPadding or var6.Size.Size_400 else 0)
		})
	}
	
	if var12 then
		var24 = reactModule.createElement
		var24 = var24(collectionHeader, {
			LayoutOrder = 1,
			title = p4.title,
			subtitle = p4.subtitle,
			tooltipInfoText = p4.tooltipInfoText,
			onActivateInfoIcon = p4.onActivateInfoIcon,
			tooltipSupportsVR = p4.tooltipSupportsVR,
			tooltipSupportsTenFootUi = p4.tooltipSupportsTenFootUi,
			hideButton = if #items >= 1 then p4.hideHeaderButton or not var11 else true,
			onActivate = p4.onActivateHeader,
			buttonText = p4.headerButtonText
		})
	else
		var24 = nil
	end
	t_1.Header = var24
	t_1.ContentFrame = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, itemHeight)
	}, {
		DynamicScrollingFrame = reactModule.createElement("ScrollingFrame", {
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			CanvasSize = UDim2.new(0, 0, 0, itemHeight),
			ClipsDescendants = false,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.X,
			Selectable = false,
			Size = UDim2.new(1, 0, 0, itemHeight),
			ZIndex = 1,
			ref = scrollingFrameRef,
			[reactModule.Change.AbsoluteSize] = var19,
			[reactModule.Change.CanvasPosition] = var20
		}, {
			reactModule.createElement(reactModule.Fragment, nil, {
				reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, itemPadding),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				reactModule.createElement(reactModule.Fragment, nil, var14)
			})
		}),
		ScrollButtons = if scrollButtonsEnabled then reactModule.createElement(carouselScrollButtons, {
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			Size = UDim2.new(1, 2 * sideMargin, 0, itemHeight),
			buttonOffsetFromEdge = var6.Size.Size_200,
			handleScrollLeft = var15,
			handleScrollRight = var16,
			leftScrollingEnabled = var17,
			rightScrollingEnabled = var18
		}) else nil
	})
	
	return createElement(var21, t, t_1)
end

return reactModule.forwardRef(VariableItemWidthCarousel)