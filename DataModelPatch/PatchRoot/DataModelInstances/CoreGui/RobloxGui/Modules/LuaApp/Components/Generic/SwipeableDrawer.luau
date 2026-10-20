local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local FitChildrenModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.FitChildren)
local SwipeableDrawer = RoactModule.PureComponent:extend("SwipeableDrawer")

function SwipeableDrawer.init(p1)
	-- upvalues: RoactModule (copy)
	p1.frameRef = nil
	
	function p1.onFrameRef(FrameRef)
		-- upvalues: p1 (copy)
		if FrameRef then
			p1.frameRef = FrameRef
			p1.frameRef.Position = UDim2.new(0, 0, 0, p1.props.startPosition)
		end
	end
	
	p1.scrollingFrameRef = RoactModule.createRef()
	
	function p1.recalculateDrawerPosition()
		-- upvalues: p1 (copy)
		if p1.frameRef and p1.scrollingFrameRef.current then
			local StartPosition: number = p1.props.startPosition
			local Largest = math.max(0, p1.props.containerHeight - p1.scrollingFrameRef.current.CanvasSize.Y.Offset)
			local Offset: number = p1.frameRef.Position.Y.Offset
			local Y: number = p1.scrollingFrameRef.current.CanvasPosition.Y
			
			if Offset == Largest and Y > 0 or Offset == StartPosition and Y < 0 then return end
			p1.frameRef.Position = UDim2.new(0, 0, 0, (math.min(math.max(Offset - Y, Largest), StartPosition)))
			p1.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, 0)
		end
	end
end

function SwipeableDrawer.render(p1)
	-- upvalues: RoactModule (copy), FitChildrenModule (copy)
	return RoactModule.createElement("Frame", {
		Size = p1.props.Size,
		AnchorPoint = p1.props.AnchorPoint,
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		[RoactModule.Ref] = p1.onFrameRef
	}, {
		ScrollingFrame = RoactModule.createElement(FitChildrenModule.FitScrollingFrame, {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			ClipsDescendants = false,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			fitFields = { CanvasSize = FitChildrenModule.FitAxis.Height },
			[RoactModule.Ref] = p1.scrollingFrameRef,
			[RoactModule.Change.CanvasSize] = p1.recalculateDrawerPosition,
			[RoactModule.Change.CanvasPosition] = p1.recalculateDrawerPosition
		}, p1.props[RoactModule.Children])
	})
end

function SwipeableDrawer.didUpdate(p1, p2)
	if p2.startPosition ~= p1.props.startPosition or p2.containerHeight ~= p1.props.containerHeight then
		p1.recalculateDrawerPosition()
	end
end

return SwipeableDrawer