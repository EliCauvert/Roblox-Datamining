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

function verticalScrollView.init(p1)
	-- upvalues: roactModule (ref), otterModule (ref), t (ref), userInputService (ref), runService (ref), getPageMarginModule (ref)
	p1:setState({ scrollBarThickness = 0, scrollingWithTouch = false })
	local var1, var2 = roactModule.createBinding(0)
	p1.scrollBarImageTransparency = var1
	p1.updateScrollBarImageTransparency = var2
	p1.scrollBarImageTransparencyMotor = otterModule.createSingleMotor(0)
	p1.scrollBarImageTransparencyMotor:onStep(p1.updateScrollBarImageTransparency)
	p1.lastTimeCanvasPositionChanged = tick()
	p1.waitToHideSidebarConnection = nil
	
	function p0.waitToHideSidebar()
		-- upvalues: p1 (ref), otterModule (copy), t (copy)
		if tick() - p1.lastTimeCanvasPositionChanged > 0.7 then
			p1.scrollBarImageTransparencyMotor:setGoal(otterModule.spring(1, t))
			p1.disconnectWaitToHideSidebar()
		end
	end
	
	function p0.disconnectWaitToHideSidebar()
		-- upvalues: p1 (ref)
		if p1.waitToHideSidebarConnection then
			p1.waitToHideSidebarConnection:Disconnect()
			p1.waitToHideSidebarConnection = nil
		end
	end
	
	function p0.inputBegan(_, p2)
		-- upvalues: p1 (ref), otterModule (copy)
		if p2.UserInputType == Enum.UserInputType.MouseMovement then
			p1.disconnectWaitToHideSidebar()
			p1:setState({ scrollBarThickness = 8 })
			p1.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(0))
		end
	end
	
	function p0.inputEnded(_, p2)
		-- upvalues: p1 (ref), otterModule (copy)
		if p2.UserInputType == Enum.UserInputType.MouseMovement then
			p1.disconnectWaitToHideSidebar()
			p1.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(1))
		end
	end
	
	function p0.canvasPosition(p2)
		-- upvalues: p1 (ref), userInputService (copy), otterModule (copy), runService (copy), roactModule (copy)
		p1.lastTimeCanvasPositionChanged = tick()
		
		if not p1.waitToHideSidebarConnection and userInputService:GetLastInputType() == Enum.UserInputType.Touch then
			p1.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(0))
			p1:setState({ scrollBarThickness = 2 })
			p1.waitToHideSidebarConnection = runService.Heartbeat:Connect(p1.waitToHideSidebar)
		end
		if p1.props[roactModule.Change.CanvasPosition] then
			p1.props[roactModule.Change.CanvasPosition](p2)
		end
	end
	
	function p0.onGamepadFocused()
		-- upvalues: p1 (ref), otterModule (copy)
		p1.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(0))
		p1:setState({ scrollBarThickness = 2 })
	end
	
	function p0.onGamepadFocusLost()
		-- upvalues: p1 (ref), otterModule (copy)
		p1.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(1))
	end
	
	p1.parentFrameRef = roactModule.createRef()
	local var3, var4 = roactModule.createBinding(0)
	p1.paddingBinding = var3
	p1.updatePaddingBinding = var4
	
	function p0.getPadding(p2)
		-- upvalues: p1 (ref), getPageMarginModule (copy)
		p2 = p2 or 0
		
		return if p1.props.paddingHorizontal then UDim.new(0, math.max(0, p1.props.paddingHorizontal - p2)) else p1.paddingBinding:map(function(p3)
			-- upvalues: getPageMarginModule (copy), p2 (write)
			return UDim.new(0, getPageMarginModule(p3) - p2)
		end)
	end
end

function verticalScrollView.renderWithProviders(p1, p2, _, p3)
	-- upvalues: roactModule (ref), cryoModule (ref), focusable (ref), uDim (ref)
	local isGamepadFocusable = p1.props.isGamepadFocusable
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = p1.props.position,
		Size = p1.props.size,
		[roactModule.Change.AbsoluteSize] = function(p4)
			-- upvalues: p1 (ref)
			p1.updatePaddingBinding(p4.AbsoluteSize.X)
		end,
		[roactModule.Ref] = p1.parentFrameRef
	}, {
		scrollingFrameOuterMargins = roactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 4) }),
		scrollingFrame = roactModule.createElement(if isGamepadFocusable then focusable.ScrollingFrame else "ScrollingFrame", {
			Active = true,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			ElasticBehavior = p1.props.elasticBehavior,
			CanvasSize = UDim2.new(uDim, p1.props.canvasSizeY),
			AutomaticCanvasSize = if p1.props.useAutomaticCanvasSize then Enum.AutomaticSize.Y else nil,
			ScrollBarImageColor3 = p2.Theme.UIEmphasis.Color,
			ScrollBarImageTransparency = p1.scrollBarImageTransparency,
			ScrollBarThickness = p1.state.scrollBarThickness,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = p1.props.ScrollingEnabled,
			CanvasPosition = p1.props.CanvasPosition,
			SelectionImageObject = p3,
			onFocusGained = if isGamepadFocusable then p1.onGamepadFocused else nil,
			onFocusLost = if isGamepadFocusable then p1.onGamepadFocusLost else nil,
			Selectable = p1.props.Selectable,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			[roactModule.Event.InputBegan] = p1.inputBegan,
			[roactModule.Event.InputEnded] = p1.inputEnded,
			[roactModule.Change.CanvasPosition] = p1.canvasPosition,
			[roactModule.Change.CanvasSize] = p1.props[roactModule.Change.CanvasSize],
			[roactModule.Event.SelectionChanged] = p1.props.onSelectionChanged,
			[roactModule.Ref] = p1.props.scrollingFrameRef
		}, cryoModule.Dictionary.join({
			scrollingFrameInnerMargin = roactModule.createElement("UIPadding", {
				PaddingTop = if p1.props.paddingTop ~= nil then nil else UDim.new(0, p1.props.paddingTop),
				PaddingLeft = p1.getPadding(),
				PaddingRight = p1.getPadding(4)
			})
		}, p1.props[roactModule.Children] or {}))
	})
end

function verticalScrollView.render(p1)
	-- upvalues: withStyleModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithProviders(p2, nil, p1.props.cursor)
	end)
end

function verticalScrollView.didMount(p1)
	local value = p1.parentFrameRef:getValue()
	
	if value then
		p1.updatePaddingBinding(value.AbsoluteSize.X)
	end
end

function verticalScrollView.willUnmount(p1)
	p1.disconnectWaitToHideSidebar()
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), roactModule (ref), verticalScrollView (ref), cryoModule (ref)
	return roactModule.createElement(verticalScrollView, cryoModule.Dictionary.join(p1, {
		scrollingFrameRef = p2,
		cursor = useCursorByTypeModule(cursorTypeModule.RoundedRect)
	}))
end)