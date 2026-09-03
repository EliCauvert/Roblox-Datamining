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

local function _(p1, p2, p3, p4)
	-- upvalues: responsiveModule (ref), fFlagLuaAppEnableVRCarouselScrolling (ref)
	local var1
	if not p3 then
		return false
	elseif p1 == responsiveModule.Input.Pointer then
		var1 = if p2 == responsiveModule.Input.Directional then fFlagLuaAppEnableVRCarouselScrolling and p4 else true
	end
	return var1
end

function VariableItemWidthCarousel(p1, p2)
	-- upvalues: useDesignTokens (ref), useLastInput (ref), usePreferredInput (ref), useIsSpatial (ref), fFlagLuaAppEnableVRCarouselScrolling (ref), responsiveModule (ref), reactModule (ref), useVariableItemWidthScrollHandlersModule (ref), collectionHeader (ref), carouselScrollButtons (ref)
	local var1 = useDesignTokens()
	local var2 = useLastInput()
	local var3 = usePreferredInput()
	local var4 = useIsSpatial()
	local items = p1.items
	local renderItem = p1.renderItem
	local itemPadding = p1.itemPadding
	local itemHeight = p1.itemHeight
	local sideMargin = p1.sideMargin or 0
	local calculateItemWidth = p1.calculateItemWidth
	local scrollingFrameRef = p1.scrollingFrameRef
	local var5 = p1.title and p1.title ~= ""
	local var6 = var5 or (if p1.subtitle == nil then p1.tooltipInfoText ~= nil else true)
	local scrollButtonsEnabled = p1.scrollButtonsEnabled
	
	if scrollButtonsEnabled then
		local var7 = if fFlagLuaAppEnableVRCarouselScrolling then var4 else nil
		
		if not (if fFlagLuaAppEnableVRCarouselScrolling then true else not var4) then
			scrollButtonsEnabled = false
		elseif var2 == responsiveModule.Input.Pointer then
			scrollButtonsEnabled = if var3 == responsiveModule.Input.Directional then fFlagLuaAppEnableVRCarouselScrolling and var7 else true
		end
	end
	local var8
	local var9 = reactModule.useMemo(function()
		-- upvalues: items (ref), renderItem (ref)
		local t = {}
		
		for i, v in ipairs(items) do
			t[i] = renderItem(v, i)
		end
		return t
	end, { items, renderItem })
	local var10, var11, var12, var13, var14 = useVariableItemWidthScrollHandlersModule(items, itemPadding, calculateItemWidth, scrollingFrameRef, p1.scrollSpeed)
	local var15 = reactModule.useCallback(function(p3)
		-- upvalues: var14 (ref), p1 (ref)
		var14()
		
		if p1.onCanvasPositionChanged and p3 then
			p1.onCanvasPositionChanged(p3.CanvasPosition)
		end
	end, { var14, p1.onCanvasPositionChanged })
	local createElement = reactModule.createElement
	local var16 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = p1.Position,
		LayoutOrder = p1.LayoutOrder,
		ref = p2
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
			Padding = UDim.new(0, if var6 then p1.headerContentPadding or var1.Size.Size_400 else 0)
		})
	}
	
	if var6 then
		var8 = reactModule.createElement
		var8 = var8(collectionHeader, {
			LayoutOrder = 1,
			title = p1.title,
			subtitle = p1.subtitle,
			tooltipInfoText = p1.tooltipInfoText,
			onActivateInfoIcon = p1.onActivateInfoIcon,
			tooltipSupportsVR = p1.tooltipSupportsVR,
			tooltipSupportsTenFootUi = p1.tooltipSupportsTenFootUi,
			hideButton = if #items >= 1 then p1.hideHeaderButton or not var5 else true,
			onActivate = p1.onActivateHeader,
			buttonText = p1.headerButtonText
		})
	else
		var8 = nil
	end
	t_1.Header = var8
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
			[reactModule.Change.AbsoluteSize] = var14,
			[reactModule.Change.CanvasPosition] = var15
		}, {
			reactModule.createElement(reactModule.Fragment, nil, {
				reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, itemPadding),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				reactModule.createElement(reactModule.Fragment, nil, var9)
			})
		}),
		ScrollButtons = if scrollButtonsEnabled then reactModule.createElement(carouselScrollButtons, {
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			Size = UDim2.new(1, 2 * sideMargin, 0, itemHeight),
			buttonOffsetFromEdge = var1.Size.Size_200,
			handleScrollLeft = var10,
			handleScrollRight = var11,
			leftScrollingEnabled = var12,
			rightScrollingEnabled = var13
		}) else nil
	})
	
	return createElement(var16, t, t_1)
end

return reactModule.forwardRef(VariableItemWidthCarousel)