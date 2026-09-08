local graphing = script:FindFirstAncestor("Graphing")
local reactModule = require(graphing.Parent.React)
local canvasContextModule = require(graphing.CanvasContext)
local scrollbarButtonModule = require(graphing.Components.ScrollbarButton)
local styleUtilModule = require(graphing.Util.StyleUtil)
local typesModule = require(graphing.Types)
local useViewportBinding = require(graphing.Util.useViewportBinding).useViewportBinding

local function _(p1, p2)
	-- upvalues: typesModule (ref)
	return if p2 == typesModule.AXIS_X then p1.X else p1.Y
end

local _ = function(p1, p2, p3)
	-- upvalues: typesModule (ref)
	return if p3 == typesModule.AXIS_X then UDim2.new(p1, p2) else UDim2.new(p2, p1)
end

function Scrollbar(p1)
	-- upvalues: styleUtilModule (ref), reactModule (ref), canvasContextModule (ref), useViewportBinding (ref), typesModule (ref), scrollbarButtonModule (ref)
	local distance = p1.Distance or styleUtilModule.SCROLLBAR_DISTANCE
	local size = p1.Size or styleUtilModule.SCROLLBAR_SIZE
	local scrollButtonSize = p1.ScrollButtonSize or styleUtilModule.SCROLLBAR_SCROLL_BUTTON_SIZE
	local zoomButtonSize = p1.ZoomButtonSize or styleUtilModule.SCROLLBAR_ZOOM_BUTTON_SIZE
	local var1 = reactModule.useContext(canvasContextModule)
	local var2 = useViewportBinding(function(p2)
		-- upvalues: p1 (ref), typesModule (copy)
		local var3 = if p1.Axis == typesModule.AXIS_X then p2.plotToGraphX else p2.plotToGraphY
		local viewportRect = p2.getViewportRect()
		local min = viewportRect.Min
		local var4 = var3(if p1.Axis == typesModule.AXIS_X then min.X else min.Y)
		local max = viewportRect.Max
		local var5 = var3(if p1.Axis == typesModule.AXIS_X then max.X else max.Y)
		local t = {}
		local uDim = UDim.new(var4, 0)
		local uDim_1 = UDim.new(0, 0)
		t.position = if p1.Axis == typesModule.AXIS_X then UDim2.new(uDim, uDim_1) else UDim2.new(uDim_1, uDim)
		local uDim_2 = UDim.new(var5 - var4)
		local uDim_3 = UDim.new(1, 0)
		t.size = if p1.Axis == typesModule.AXIS_X then UDim2.new(uDim_2, uDim_3) else UDim2.new(uDim_3, uDim_2)
		
		return t
	end, { p1.Axis })
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), typesModule (copy), var1 (ref)
		if p1.OnViewChanged then
			local var4 = if p1.Axis == typesModule.AXIS_X then var1.plotToGraphX else var1.plotToGraphY
			local var5 = if p1.Axis == typesModule.AXIS_X then var1.graphToPlotX else var1.graphToPlotY
			local viewportRect = var1.getViewportRect()
			local min = viewportRect.Min
			local var6 = var4(if p1.Axis == typesModule.AXIS_X then min.X else min.Y)
			local max = viewportRect.Max
			local var7 = var4(if p1.Axis == typesModule.AXIS_X then max.X else max.Y)
			local var8 = if p1.ExpandedBounds then var4(p1.ExpandedBounds.Min) else 0
			local var9 = if p1.ExpandedBounds then var4(p1.ExpandedBounds.Max) else 1
			local var10 = var6 + p2
			local var11 = var7 + p2
			local var12 = 0
			local minValue = math.min(var10, var11)
			local maxValue = math.max(var10, var11)
			
			if minValue < var8 then
				var12 = var8 - minValue
			elseif var9 < maxValue then
				var12 = var9 - maxValue
			end
			p1.OnViewChanged(var5(var10 + var12), var5(var11 + var12))
		end
	end, { p1.OnViewChanged, p1.Axis, p1.ExpandedBounds })
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), typesModule (copy), var1 (ref), var3 (ref)
		local min = var1.getViewportRect().Min
		local var5 = var1.plotToView(p2)
		var3((if p1.Axis == typesModule.AXIS_X then var5.X else var5.Y) - (if p1.Axis == typesModule.AXIS_X then var1.plotToGraphX else var1.plotToGraphY)(if p1.Axis == typesModule.AXIS_X then min.X else min.Y))
	end, { var3, p1.Axis })
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var1 (ref), typesModule (copy)
		if p1.OnViewChanged then
			local var6 = var1.graphToPlot(var1.plotToView(p2))
			local min = var1.getGraphRect().Min
			local var7 = if p1.Axis == typesModule.AXIS_X then min.X else min.Y
			local max = var1.getViewportRect().Max
			local var8 = if p1.Axis == typesModule.AXIS_X then max.X else max.Y
			p1.OnViewChanged(math.max(math.min(if p1.Axis == typesModule.AXIS_X then var6.X else var6.Y, var8 - p1.MinZoom), var7), var8)
		end
	end, { p1.OnViewChanged, p1.Axis, p1.MinZoom })
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var1 (ref), typesModule (copy)
		if p1.OnViewChanged then
			local var7 = var1.graphToPlot(var1.plotToView(p2))
			local max = var1.getGraphRect().Max
			local var8 = if p1.Axis == typesModule.AXIS_X then max.X else max.Y
			local min = var1.getViewportRect().Min
			local var9 = if p1.Axis == typesModule.AXIS_X then min.X else min.Y
			p1.OnViewChanged(var9, math.min(math.max(if p1.Axis == typesModule.AXIS_X then var7.X else var7.Y, var9 + p1.MinZoom), var8))
		end
	end, { p1.OnViewChanged, p1.Axis, p1.MinZoom })
	local var7 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3(-0.04)
	end, { var3 })
	local var8 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3(0.04)
	end, { var3 })
	local uDim = UDim.new(0, (-scrollButtonSize) - zoomButtonSize)
	local var9 = UDim.new(1, 0) + distance
	local var10 = if p1.Axis == typesModule.AXIS_X then UDim2.new(uDim, var9) else UDim2.new(var9, uDim)
	local uDim_1 = UDim.new(1, 0)
	local var11 = if p1.Axis == typesModule.AXIS_X then UDim2.new(uDim_1, size) else UDim2.new(size, uDim_1)
	local uDim_2 = UDim.new(0, (scrollButtonSize + zoomButtonSize) * 2)
	local uDim_3 = UDim.new(0, 0)
	local var12 = if p1.Axis == typesModule.AXIS_X then UDim2.new(uDim_2, uDim_3) else UDim2.new(uDim_3, uDim_2)
	local uDim_4 = UDim.new(0, scrollButtonSize)
	local uDim_5 = UDim.new(1, 0)
	local var13 = if p1.Axis == typesModule.AXIS_X then UDim2.new(uDim_4, uDim_5) else UDim2.new(uDim_5, uDim_4)
	local uDim_6 = UDim.new(0, zoomButtonSize)
	local uDim_7 = UDim.new(1, 0)
	local var14 = if p1.Axis == typesModule.AXIS_X then UDim2.new(uDim_6, uDim_7) else UDim2.new(uDim_7, uDim_6)
	local var15 = if p1.Axis == typesModule.AXIS_X then 0 else 90
	local createElement = reactModule.createElement
	local var16 = "Frame"
	local t = {
		Position = var10,
		Size = var11 + var12,
		BorderSizePixel = p1.OutlineThickness or styleUtilModule.SCROLLBAR_OUTLINE_THICKNESS,
		BorderColor3 = p1.OutlineColor3 or styleUtilModule.SCROLLBAR_OUTLINE_COLOR3,
		BackgroundColor3 = p1.Color3 or styleUtilModule.SCROLLBAR_COLOR3,
		ZIndex = p1.ZIndex,
		[reactModule.Tag] = "ScrollbarFrame"
	}
	local t_1 = {
		MinScrollButton = reactModule.createElement(scrollbarButtonModule, {
			Position = UDim2.fromScale(0, 0),
			Rotation = var15,
			Size = var13,
			Image = styleUtilModule.SCROLLBAR_LEFT_SCROLL_BUTTON_IMAGE,
			OnClick = var7
		})
	}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		AnchorPoint = if p1.Axis == typesModule.AXIS_X then Vector2.new(1, 0) else Vector2.new(0, 1)
	}
	local uDim_8 = UDim.new(1, 0)
	local uDim_9 = UDim.new(0, 0)
	t_2.Position = if p1.Axis == typesModule.AXIS_X then UDim2.new(uDim_8, uDim_9) else UDim2.new(uDim_9, uDim_8)
	t_2.Rotation = var15
	t_2.Size = var13
	t_2.Image = styleUtilModule.SCROLLBAR_RIGHT_SCROLL_BUTTON_IMAGE
	t_2.OnClick = var8
	t_1.MaxScrollButton = createElement_1(scrollbarButtonModule, t_2)
	t_1.Inner = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1) - var12
	}, {
		Body = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = var2:map(function(p2)
				return p2.position
			end),
			Size = var2:map(function(p2)
				return p2.size
			end)
		}, {
			MainButton = reactModule.createElement(scrollbarButtonModule, {
				AnchorPoint = if p1.Axis == typesModule.AXIS_X then Vector2.new(0, 0) else Vector2.new(0, 1),
				Position = if p1.Axis == typesModule.AXIS_X then UDim2.fromScale(0, 0) else UDim2.fromScale(0, 1),
				Size = UDim2.fromScale(1, 1),
				OnMoved = var4
			}),
			LeftButton = reactModule.createElement(scrollbarButtonModule, {
				AnchorPoint = if p1.Axis == typesModule.AXIS_X then Vector2.new(1, 0) else Vector2.new(0, 0),
				Position = if p1.Axis == typesModule.AXIS_X then UDim2.fromScale(0, 0) else UDim2.fromScale(0, 1),
				Rotation = var15,
				Size = var14,
				Image = styleUtilModule.SCROLLBAR_LEFT_ZOOM_BUTTON_IMAGE,
				OnMoved = var5
			}),
			RightButton = reactModule.createElement(scrollbarButtonModule, {
				AnchorPoint = if p1.Axis == typesModule.AXIS_X then Vector2.new(0, 0) else Vector2.new(0, 1),
				Position = if p1.Axis == typesModule.AXIS_X then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 0),
				Rotation = var15,
				Size = var14,
				Image = styleUtilModule.SCROLLBAR_RIGHT_ZOOM_BUTTON_IMAGE,
				OnMoved = var6
			})
		})
	})
	
	return createElement(var16, t, t_1)
end

return Scrollbar