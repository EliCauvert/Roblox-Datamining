local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local CryoModule = require(Parent2.Cryo)
local OtterModule = require(Parent2.Otter)
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local Focusable = require(Parent2.RoactGamepad).Focusable
local WithStyleModule = require(Parent2.UIBlox.Core.Style.withStyle)
local UseCursorByTypeModule = require(Parent.SelectionCursor.useCursorByType)
local CursorTypeModule = require(Parent.SelectionCursor.CursorType)
local GetPageMarginModule = require(Parent1.App.Container.getPageMargin)
local _UDim = UDim.new(0, 0)
local config = { frequency = 3, dampingRatio = 1.5 }
local VerticalScrollView = RoactModule.Component:extend("VerticalScrollView")
VerticalScrollView.validateProps = TModule.strictInterface({
	size = TModule.optional(TModule.UDim2),
	position = TModule.optional(TModule.UDim2),
	elasticBehavior = TModule.optional(TModule.EnumItem),
	canvasSizeY = TModule.optional(TModule.UDim),
	useAutomaticCanvasSize = TModule.optional(TModule.boolean),
	paddingHorizontal = TModule.optional(TModule.number),
	paddingTop = TModule.optional(TModule.number),
	isGamepadFocusable = TModule.optional(TModule.boolean),
	Selectable = TModule.optional(TModule.boolean),
	[RoactModule.Change.CanvasPosition] = TModule.optional(TModule.callback),
	[RoactModule.Change.CanvasSize] = TModule.optional(TModule.callback),
	scrollingFrameRef = TModule.optional(TModule.table),
	onSelectionChanged = TModule.optional(TModule.callback),
	CanvasPosition = TModule.optional(TModule.union(TModule.table, TModule.Vector2)),
	ScrollingEnabled = TModule.optional(TModule.boolean),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	cursor = TModule.table,
	[RoactModule.Children] = TModule.optional(TModule.table)
})
VerticalScrollView.defaultProps = {
	useAutomaticCanvasSize = false,
	isGamepadFocusable = false,
	Selectable = true,
	size = UDim2.new(1, 0, 1, 0),
	canvasSizeY = UDim.new(2, 0)
}

function VerticalScrollView.init(p1)
	-- upvalues: RoactModule (copy), OtterModule (copy), config (copy), UserInputService (copy), RunService (copy), GetPageMarginModule (copy)
	p1:setState({ scrollBarThickness = 0, scrollingWithTouch = false })
	p1.scrollBarImageTransparency, p1.updateScrollBarImageTransparency = RoactModule.createBinding(0)
	p1.scrollBarImageTransparencyMotor = OtterModule.createSingleMotor(0)
	p1.scrollBarImageTransparencyMotor:onStep(p1.updateScrollBarImageTransparency)
	p1.lastTimeCanvasPositionChanged = tick()
	p1.waitToHideSidebarConnection = nil
	
	function p1.waitToHideSidebar()
		-- upvalues: p1 (copy), OtterModule (upval), config (upval)
		if tick() - p1.lastTimeCanvasPositionChanged > 0.7 then
			p1.scrollBarImageTransparencyMotor:setGoal(OtterModule.spring(1, config))
			p1.disconnectWaitToHideSidebar()
		end
	end
	
	function p1.disconnectWaitToHideSidebar()
		-- upvalues: p1 (copy)
		if p1.waitToHideSidebarConnection then
			p1.waitToHideSidebarConnection:Disconnect()
			p1.waitToHideSidebarConnection = nil
		end
	end
	
	function p1:inputBegan(Input)
		-- upvalues: p1 (copy), OtterModule (upval)
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			p1.disconnectWaitToHideSidebar()
			p1:setState({ scrollBarThickness = 8 })
			p1.scrollBarImageTransparencyMotor:setGoal(OtterModule.instant(0))
		end
	end
	
	function p1:inputEnded(Input)
		-- upvalues: p1 (copy), OtterModule (upval)
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			p1.disconnectWaitToHideSidebar()
			p1.scrollBarImageTransparencyMotor:setGoal(OtterModule.instant(1))
		end
	end
	
	function p1.canvasPosition(p2)
		-- upvalues: p1 (copy), UserInputService (upval), OtterModule (upval), RunService (upval), RoactModule (upval)
		p1.lastTimeCanvasPositionChanged = tick()
		
		if not p1.waitToHideSidebarConnection and UserInputService:GetLastInputType() == Enum.UserInputType.Touch then
			p1.scrollBarImageTransparencyMotor:setGoal(OtterModule.instant(0))
			p1:setState({ scrollBarThickness = 2 })
			p1.waitToHideSidebarConnection = RunService.Heartbeat:Connect(p1.waitToHideSidebar)
		end
		if p1.props[RoactModule.Change.CanvasPosition] then
			p1.props[RoactModule.Change.CanvasPosition](p2)
		end
	end
	
	function p1.onGamepadFocused()
		-- upvalues: p1 (copy), OtterModule (upval)
		p1.scrollBarImageTransparencyMotor:setGoal(OtterModule.instant(0))
		p1:setState({ scrollBarThickness = 2 })
	end
	
	function p1.onGamepadFocusLost()
		-- upvalues: p1 (copy), OtterModule (upval)
		p1.scrollBarImageTransparencyMotor:setGoal(OtterModule.instant(1))
	end
	
	p1.parentFrameRef = RoactModule.createRef()
	p1.paddingBinding, p1.updatePaddingBinding = RoactModule.createBinding(0)
	
	function p1.getPadding(p2)
		-- upvalues: p1 (copy), GetPageMarginModule (upval)
		local P6 = p2 or 0
		
		return if p1.props.paddingHorizontal then UDim.new(0, (math.max(0, p1.props.paddingHorizontal - P6))) else p1.paddingBinding:map(function(p3): UDim
			-- upvalues: GetPageMarginModule (upval), P6 (ref)
			return UDim.new(0, GetPageMarginModule(p3) - P6)
		end)
	end
end

function VerticalScrollView.renderWithProviders(p1, p2, _, SelectionImageObject)
	-- upvalues: RoactModule (copy), CryoModule (copy), Focusable (copy), _UDim (copy)
	local IsGamepadFocusable = p1.props.isGamepadFocusable
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = p1.props.position,
		Size = p1.props.size,
		[RoactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: p1 (copy)
			p1.updatePaddingBinding(Frame.AbsoluteSize.X)
		end,
		[RoactModule.Ref] = p1.parentFrameRef
	}, {
		scrollingFrameOuterMargins = RoactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 4) }),
		scrollingFrame = RoactModule.createElement(IsGamepadFocusable and Focusable.ScrollingFrame or "ScrollingFrame", {
			Active = true,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			ElasticBehavior = p1.props.elasticBehavior,
			CanvasSize = UDim2.new(_UDim, p1.props.canvasSizeY),
			AutomaticCanvasSize = p1.props.useAutomaticCanvasSize and Enum.AutomaticSize.Y or nil,
			ScrollBarImageColor3 = p2.Theme.UIEmphasis.Color,
			ScrollBarImageTransparency = p1.scrollBarImageTransparency,
			ScrollBarThickness = p1.state.scrollBarThickness,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = p1.props.ScrollingEnabled,
			CanvasPosition = p1.props.CanvasPosition,
			SelectionImageObject = SelectionImageObject,
			onFocusGained = IsGamepadFocusable and p1.onGamepadFocused or nil,
			onFocusLost = IsGamepadFocusable and p1.onGamepadFocusLost or nil,
			Selectable = p1.props.Selectable,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			[RoactModule.Event.InputBegan] = p1.inputBegan,
			[RoactModule.Event.InputEnded] = p1.inputEnded,
			[RoactModule.Change.CanvasPosition] = p1.canvasPosition,
			[RoactModule.Change.CanvasSize] = p1.props[RoactModule.Change.CanvasSize],
			[RoactModule.Event.SelectionChanged] = p1.props.onSelectionChanged,
			[RoactModule.Ref] = p1.props.scrollingFrameRef
		}, (CryoModule.Dictionary.join({
			scrollingFrameInnerMargin = RoactModule.createElement("UIPadding", {
				PaddingTop = if p1.props.paddingTop == nil then nil else UDim.new(0, p1.props.paddingTop),
				PaddingLeft = p1.getPadding(),
				PaddingRight = p1.getPadding(4)
			})
		}, p1.props[RoactModule.Children] or {})))
	})
end

function VerticalScrollView.render(p1)
	-- upvalues: WithStyleModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2, nil, p1.props.cursor)
	end)
end

function VerticalScrollView.didMount(p1)
	local Value = p1.parentFrameRef:getValue()
	
	if Value then
		p1.updatePaddingBinding(Value.AbsoluteSize.X)
	end
end

function VerticalScrollView.willUnmount(p1)
	p1.disconnectWaitToHideSidebar()
end

return RoactModule.forwardRef(function(p1, ScrollingFrameRef)
	-- upvalues: UseCursorByTypeModule (copy), CursorTypeModule (copy), RoactModule (copy), VerticalScrollView (copy), CryoModule (copy)
	return RoactModule.createElement(VerticalScrollView, CryoModule.Dictionary.join(p1, {
		scrollingFrameRef = ScrollingFrameRef,
		cursor = UseCursorByTypeModule(CursorTypeModule.RoundedRect)
	}))
end)