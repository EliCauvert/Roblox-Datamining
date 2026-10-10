local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local virtualList = roactModule.Component:extend("VirtualList")

function virtualList.init(p1)
	-- upvalues: roactModule (ref)
	p1.scrollingRef = roactModule.createRef()
	p1.state = { canvasPosY = 0, absSizeY = 0 }
	
	function p0.onScrollPropertyChanged()
		-- upvalues: p1 (ref)
		local current = p1.scrollingRef.current
		
		if not current then return end
		local y = current.CanvasPosition.Y
		local y_1 = current.AbsoluteSize.Y
		
		if y ~= p1.state.canvasPosY or y_1 ~= p1.state.absSizeY then
			p1:setState({ canvasPosY = y, absSizeY = y_1 })
		end
	end
end

function virtualList.connectScrollListenersIfNeeded(p1)
	local current = p1.scrollingRef.current
	
	if current == p1.connectedFrame then return end
	p1:disconnectScrollListeners()
	
	if current then
		p1.connectedFrame = current
		p1.canvasPosConnector = current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onScrollPropertyChanged)
		p1.absSizeConnector = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(p1.onScrollPropertyChanged)
		p1.onScrollPropertyChanged()
		
		return
	end
end

function virtualList.disconnectScrollListeners(p1)
	if p1.canvasPosConnector then
		p1.canvasPosConnector:Disconnect()
		p1.canvasPosConnector = nil
	end
	if p1.absSizeConnector then
		p1.absSizeConnector:Disconnect()
		p1.absSizeConnector = nil
	end
	p1.connectedFrame = nil
end

function virtualList.didMount(p1)
	p1:connectScrollListenersIfNeeded()
end

function virtualList.willUnmount(p1)
	p1:disconnectScrollListeners()
end

function virtualList.didUpdate(p1, p2)
	p1:connectScrollListenersIfNeeded()
	local current = p1.scrollingRef.current
	
	if not current then return end
	local y = current.AbsoluteSize.Y
	local y_1 = current.CanvasPosition.Y
	
	if y ~= p1.state.absSizeY or y_1 ~= p1.state.canvasPosY then
		p1:setState({ absSizeY = y, canvasPosY = y_1 })
	end
	local count = #(p1.props.items or {})
	
	if #(p2.items or {}) == count then return end
	local minValue = math.min(y_1, math.max(0, count * p1.props.rowHeight - y))
	
	if minValue ~= current.CanvasPosition.Y then
		current.CanvasPosition = Vector2.new(current.CanvasPosition.X, minValue)
	end
	if minValue ~= p1.state.canvasPosY then
		p1:setState({ canvasPosY = minValue })
	end
end

function virtualList.render(p1)
	-- upvalues: roactModule (ref), constantsModule (ref)
	local items = p1.props.items or {}
	local rowHeight = p1.props.rowHeight
	local renderItem = p1.props.renderItem
	local itemsCount = #items
	
	if itemsCount == 0 then
		return roactModule.createElement("TextLabel", {
			TextTransparency = 0.5,
			BackgroundTransparency = 1,
			Size = p1.props.size or UDim2.new(1, 0, 1, 0),
			Position = p1.props.position,
			LayoutOrder = p1.props.layoutOrder,
			Text = p1.props.emptyText or "",
			TextColor3 = constantsModule.Color.Text
		})
	end
	local var1 = math.floor(p1.state.canvasPosY / rowHeight) - 4 + 1
	local t = {}
	
	for i = math.clamp(var1, 1, itemsCount), math.clamp(var1 + (math.ceil(p1.state.absSizeY / rowHeight) + 8) - 1, 1, itemsCount) do
		t["row" .. i] = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, rowHeight),
			Position = UDim2.new(0, 0, 0, (i - 1) * rowHeight)
		}, { Item = renderItem(items[i], i) })
	end
	return roactModule.createElement("ScrollingFrame", {
		Size = p1.props.size or UDim2.new(1, 0, 1, 0),
		Position = p1.props.position,
		LayoutOrder = p1.props.layoutOrder,
		CanvasSize = UDim2.new(0, 0, 0, itemsCount * rowHeight),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 6,
		VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
		[roactModule.Ref] = p1.scrollingRef
	}, t)
end

return virtualList