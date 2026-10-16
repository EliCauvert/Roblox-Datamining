local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local VirtualList = RoactModule.Component:extend("VirtualList")

function VirtualList.init(p1) --[[ Line: 21 ]]
	-- upvalues: RoactModule (copy)
	p1.scrollingRef = RoactModule.createRef()
	p1.state = { canvasPosY = 0, absSizeY = 0 }
	
	function p1.onScrollPropertyChanged() --[[ Line: 28 ]]
		-- upvalues: p1 (copy)
		local Current = p1.scrollingRef.current
		
		if not Current then return end
		local Y = Current.CanvasPosition.Y
		local Y1 = Current.AbsoluteSize.Y
		
		if Y ~= p1.state.canvasPosY or Y1 ~= p1.state.absSizeY then
			p1:setState({ canvasPosY = Y, absSizeY = Y1 })
		end
	end
end

function VirtualList.connectScrollListenersIfNeeded(p1) --[[ Line: 44 ]]
	local Current = p1.scrollingRef.current
	
	if Current == p1.connectedFrame then return end
	p1:disconnectScrollListeners()
	
	if Current then
		p1.connectedFrame = Current
		p1.canvasPosConnector = Current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onScrollPropertyChanged)
		p1.absSizeConnector = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(p1.onScrollPropertyChanged)
		p1.onScrollPropertyChanged()
		
		return
	end
end

function VirtualList.disconnectScrollListeners(p1) --[[ Line: 59 ]]
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

function VirtualList.didMount(p1) --[[ Line: 71 ]]
	p1:connectScrollListenersIfNeeded()
end

function VirtualList.willUnmount(p1) --[[ Line: 75 ]]
	p1:disconnectScrollListeners()
end

function VirtualList.didUpdate(p1, p2) --[[ Line: 79 ]]
	p1:connectScrollListenersIfNeeded()
	local Current = p1.scrollingRef.current
	
	if not Current then return end
	local Y = Current.AbsoluteSize.Y
	local Y1: number = Current.CanvasPosition.Y
	
	if Y ~= p1.state.absSizeY or Y1 ~= p1.state.canvasPosY then
		p1:setState({ absSizeY = Y, canvasPosY = Y1 })
	end
	local Count = #(p1.props.items or {})
	
	if #(p2.items or {}) == Count then return end
	local Smallest = math.min(Y1, (math.max(0, Count * p1.props.rowHeight - Y)))
	
	if Smallest ~= Current.CanvasPosition.Y then
		Current.CanvasPosition = Vector2.new(Current.CanvasPosition.X, Smallest)
	end
	if Smallest ~= p1.state.canvasPosY then
		p1:setState({ canvasPosY = Smallest })
	end
end

function VirtualList.render(p1) --[[ Line: 111 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy)
	local Items = p1.props.items or {}
	local RowHeight = p1.props.rowHeight
	local RenderItemFunction = p1.props.renderItem
	local CountItems = #Items
	
	if CountItems == 0 then
		return RoactModule.createElement("TextLabel", {
			TextTransparency = 0.5,
			BackgroundTransparency = 1,
			Size = p1.props.size or UDim2.new(1, 0, 1, 0),
			Position = p1.props.position,
			LayoutOrder = p1.props.layoutOrder,
			Text = p1.props.emptyText or "",
			TextColor3 = ConstantsModule.Color.Text
		})
	end
	local NewFloored = math.floor(p1.state.canvasPosY / RowHeight) - 4 + 1
	local Frames = {}
	
	for i = math.clamp(NewFloored, 1, CountItems), math.clamp(NewFloored + (math.ceil(p1.state.absSizeY / RowHeight) + 8) - 1, 1, CountItems) do
		Frames["row" .. i] = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, RowHeight),
			Position = UDim2.new(0, 0, 0, (i - 1) * RowHeight)
		}, { Item = RenderItemFunction(Items[i], i) })
	end
	return RoactModule.createElement("ScrollingFrame", {
		Size = p1.props.size or UDim2.new(1, 0, 1, 0),
		Position = p1.props.position,
		LayoutOrder = p1.props.layoutOrder,
		CanvasSize = UDim2.new(0, 0, 0, CountItems * RowHeight),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 6,
		VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
		[RoactModule.Ref] = p1.scrollingRef
	}, Frames)
end

return VirtualList