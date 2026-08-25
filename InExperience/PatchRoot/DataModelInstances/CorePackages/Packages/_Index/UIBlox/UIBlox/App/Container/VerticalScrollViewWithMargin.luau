local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local cryoModule = require(parent_2.Cryo)
local otterModule = require(parent_2.Otter)
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local focusable = require(parent_2.RoactGamepad).Focusable
local withStyleModule = require(parent_2.UIBlox.Core.Style.withStyle)
local useCursorByTypeModule = require(parent.SelectionCursor.useCursorByType)
local cursorTypeModule = require(parent.SelectionCursor.CursorType)
local getPageMarginModule = require(parent_1.App.Container.getPageMargin)
local uDim = UDim.new(0, 0)
local t = { frequency = 3, dampingRatio = 1.5 }
local verticalScrollView = roactModule.Component:extend("VerticalScrollView")
verticalScrollView.validateProps = tModule.strictInterface({
	size = tModule.optional(tModule.UDim2),
	position = tModule.optional(tModule.UDim2),
	elasticBehavior = tModule.optional(tModule.EnumItem),
	canvasSizeY = tModule.optional(tModule.UDim),
	useAutomaticCanvasSize = tModule.optional(tModule.boolean),
	paddingHorizontal = tModule.optional(tModule.number),
	paddingTop = tModule.optional(tModule.number),
	isGamepadFocusable = tModule.optional(tModule.boolean),
	Selectable = tModule.optional(tModule.boolean),
	[roactModule.Change.CanvasPosition] = tModule.optional(tModule.callback),
	[roactModule.Change.CanvasSize] = tModule.optional(tModule.callback),
	scrollingFrameRef = tModule.optional(tModule.table),
	onSelectionChanged = tModule.optional(tModule.callback),
	CanvasPosition = tModule.optional(tModule.union(tModule.table, tModule.Vector2)),
	ScrollingEnabled = tModule.optional(tModule.boolean),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	cursor = tModule.table,
	[roactModule.Children] = tModule.optional(tModule.table)
})
verticalScrollView.defaultProps = {
	useAutomaticCanvasSize = false,
	isGamepadFocusable = false,
	Selectable = true,
	size = UDim2.new(1, 0, 1, 0),
	canvasSizeY = UDim.new(2, 0)
}

function verticalScrollView.init(p0)
	-- upvalues: roactModule (ref), otterModule (ref), t (ref), userInputService (ref), runService (ref), getPageMarginModule (ref)
	p0:setState({ scrollBarThickness = 0, scrollingWithTouch = false })
	local var13, var14 = roactModule.createBinding(0)
	p0.scrollBarImageTransparency = var13
	p0.updateScrollBarImageTransparency = var14
	p0.scrollBarImageTransparencyMotor = otterModule.createSingleMotor(0)
	p0.scrollBarImageTransparencyMotor:onStep(p0.updateScrollBarImageTransparency)
	p0.lastTimeCanvasPositionChanged = tick()
	p0.waitToHideSidebarConnection = nil
	
	function p0.waitToHideSidebar()
		-- upvalues: p0 (ref), otterModule (copy), t (copy)
		if tick() - p0.lastTimeCanvasPositionChanged > 0.7 then
			p0.scrollBarImageTransparencyMotor:setGoal(otterModule.spring(1, t))
			p0.disconnectWaitToHideSidebar()
		end
	end
	
	function p0.disconnectWaitToHideSidebar()
		-- upvalues: p0 (ref)
		if p0.waitToHideSidebarConnection then
			p0.waitToHideSidebarConnection:Disconnect()
			p0.waitToHideSidebarConnection = nil
		end
	end
	
	function p0.inputBegan(_, p1)
		-- upvalues: p0 (ref), otterModule (copy)
		if p1.UserInputType == Enum.UserInputType.MouseMovement then
			p0.disconnectWaitToHideSidebar()
			p0:setState({ scrollBarThickness = 8 })
			p0.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(0))
		end
	end
	
	function p0.inputEnded(_, p2)
		-- upvalues: p0 (ref), otterModule (copy)
		if p2.UserInputType == Enum.UserInputType.MouseMovement then
			p0.disconnectWaitToHideSidebar()
			p0.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(1))
		end
	end
	
	function p0.canvasPosition(p3)
		-- upvalues: p0 (ref), userInputService (copy), otterModule (copy), runService (copy), roactModule (copy)
		p0.lastTimeCanvasPositionChanged = tick()
		
		if not p0.waitToHideSidebarConnection and userInputService:GetLastInputType() == Enum.UserInputType.Touch then
			p0.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(0))
			p0:setState({ scrollBarThickness = 2 })
			p0.waitToHideSidebarConnection = runService.Heartbeat:Connect(p0.waitToHideSidebar)
		end
		if p0.props[roactModule.Change.CanvasPosition] then
			p0.props[roactModule.Change.CanvasPosition](p3)
		end
	end
	
	function p0.onGamepadFocused()
		-- upvalues: p0 (ref), otterModule (copy)
		p0.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(0))
		p0:setState({ scrollBarThickness = 2 })
	end
	
	function p0.onGamepadFocusLost()
		-- upvalues: p0 (ref), otterModule (copy)
		p0.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(1))
	end
	
	p0.parentFrameRef = roactModule.createRef()
	local var15, var16 = roactModule.createBinding(0)
	p0.paddingBinding = var15
	p0.updatePaddingBinding = var16
	
	function p0.getPadding(p4)
		-- upvalues: p0 (ref), getPageMarginModule (copy)
		p4 = p4 or 0
		
		return if p0.props.paddingHorizontal then UDim.new(0, math.max(0, p0.props.paddingHorizontal - p4)) else p0.paddingBinding:map(function(p5)
			-- upvalues: getPageMarginModule (copy), p4 (write)
			return UDim.new(0, getPageMarginModule(p5) - p4)
		end)
	end
end

function verticalScrollView.renderWithProviders(p6, p7, _, p8)
	-- upvalues: roactModule (ref), cryoModule (ref), focusable (ref), uDim (ref)
	local isGamepadFocusable = p6.props.isGamepadFocusable
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = p6.props.position,
		Size = p6.props.size,
		[roactModule.Change.AbsoluteSize] = function(p9)
			-- upvalues: p6 (ref)
			p6.updatePaddingBinding(p9.AbsoluteSize.X)
		end,
		[roactModule.Ref] = p6.parentFrameRef
	}, {
		scrollingFrameOuterMargins = roactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 4) }),
		scrollingFrame = roactModule.createElement(if isGamepadFocusable then focusable.ScrollingFrame else "ScrollingFrame", {
			Active = true,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			ElasticBehavior = p6.props.elasticBehavior,
			CanvasSize = UDim2.new(uDim, p6.props.canvasSizeY),
			AutomaticCanvasSize = if p6.props.useAutomaticCanvasSize then Enum.AutomaticSize.Y else nil,
			ScrollBarImageColor3 = p7.Theme.UIEmphasis.Color,
			ScrollBarImageTransparency = p6.scrollBarImageTransparency,
			ScrollBarThickness = p6.state.scrollBarThickness,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = p6.props.ScrollingEnabled,
			CanvasPosition = p6.props.CanvasPosition,
			SelectionImageObject = p8,
			onFocusGained = if isGamepadFocusable then p6.onGamepadFocused else nil,
			onFocusLost = if isGamepadFocusable then p6.onGamepadFocusLost else nil,
			Selectable = p6.props.Selectable,
			NextSelectionLeft = p6.props.NextSelectionLeft,
			NextSelectionRight = p6.props.NextSelectionRight,
			NextSelectionUp = p6.props.NextSelectionUp,
			NextSelectionDown = p6.props.NextSelectionDown,
			[roactModule.Event.InputBegan] = p6.inputBegan,
			[roactModule.Event.InputEnded] = p6.inputEnded,
			[roactModule.Change.CanvasPosition] = p6.canvasPosition,
			[roactModule.Change.CanvasSize] = p6.props[roactModule.Change.CanvasSize],
			[roactModule.Event.SelectionChanged] = p6.props.onSelectionChanged,
			[roactModule.Ref] = p6.props.scrollingFrameRef
		}, cryoModule.Dictionary.join({
			scrollingFrameInnerMargin = roactModule.createElement("UIPadding", {
				PaddingTop = if p6.props.paddingTop ~= nil then nil else UDim.new(0, p6.props.paddingTop),
				PaddingLeft = p6.getPadding(),
				PaddingRight = p6.getPadding(4)
			})
		}, p6.props[roactModule.Children] or {}))
	})
end

function verticalScrollView.render(p10)
	-- upvalues: withStyleModule (ref)
	return withStyleModule(function(p11)
		-- upvalues: p10 (ref)
		return p10:renderWithProviders(p11, nil, p10.props.cursor)
	end)
end

function verticalScrollView.didMount(p12)
	local value = p12.parentFrameRef:getValue()
	
	if value then
		p12.updatePaddingBinding(value.AbsoluteSize.X)
	end
end

function verticalScrollView.willUnmount(p13)
	p13.disconnectWaitToHideSidebar()
end

return roactModule.forwardRef(function(p14, p15)
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), roactModule (ref), verticalScrollView (ref), cryoModule (ref)
	return roactModule.createElement(verticalScrollView, cryoModule.Dictionary.join(p14, {
		scrollingFrameRef = p15,
		cursor = useCursorByTypeModule(cursorTypeModule.RoundedRect)
	}))
end)