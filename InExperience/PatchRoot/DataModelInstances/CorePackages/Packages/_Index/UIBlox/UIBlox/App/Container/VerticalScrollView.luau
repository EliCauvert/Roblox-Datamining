local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent
local CryoModule = require(Parent1.Cryo)
local OtterModule = require(Parent1.Otter)
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local Focusable = require(Parent1.RoactGamepad).Focusable
local WithStyleModule = require(Parent1.UIBlox.Core.Style.withStyle)
local UseCursorByTypeModule = require(Parent.SelectionCursor.useCursorByType)
local CursorTypeModule = require(Parent.SelectionCursor.CursorType)
local ImagesModule = require(Parent1.UIBlox.App.ImageSet.Images)
local ScrollBarTypeModule = require(script.Parent.Enum.ScrollBarType)
local ScrollBarModule = require(script.Parent.ScrollBar)
local config = { frequency = 3, dampingRatio = 1.5 }
local VerticalScrollView = RoactModule.Component:extend("VerticalScrollView")
VerticalScrollView.validateProps = TModule.strictInterface({
	size = TModule.optional(TModule.UDim2),
	position = TModule.optional(TModule.UDim2),
	layoutOrder = TModule.optional(TModule.number),
	elasticBehavior = TModule.optional(TModule.EnumItem),
	canvasSizeY = TModule.optional(TModule.UDim),
	automaticSize = TModule.optional(TModule.enum(Enum.AutomaticSize)),
	useAutomaticCanvasSize = TModule.optional(TModule.boolean),
	isGamepadFocusable = TModule.optional(TModule.boolean),
	scrollingEnabled = TModule.optional(TModule.boolean),
	selectable = TModule.optional(TModule.boolean),
	[RoactModule.Change.CanvasPosition] = TModule.optional(TModule.callback),
	[RoactModule.Change.CanvasSize] = TModule.optional(TModule.callback),
	scrollingFrameRef = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	[RoactModule.Children] = TModule.optional(TModule.table),
	scrollBarType = TModule.optional(TModule.string),
	cursor = TModule.table
})
VerticalScrollView.defaultProps = {
	useAutomaticCanvasSize = false,
	isGamepadFocusable = false,
	selectable = nil,
	scrollingEnabled = true,
	size = UDim2.new(1, 0, 1, 0),
	canvasSizeY = UDim.new(2, 0),
	automaticSize = Enum.AutomaticSize.None,
	scrollBarType = ScrollBarTypeModule.Compact
}

function VerticalScrollView.init(p1) --[[ Line: 90 ]]
	-- upvalues: RoactModule (copy), OtterModule (copy), config (copy), UserInputService (copy), RunService (copy)
	p1.parentFrameRef = RoactModule.createRef()
	p1.mainCanvasRef = RoactModule.createRef()
	p1.scrollPosition, p1.updateScroll = RoactModule.createBinding(0)
	p1.mainCanvasSize, p1.updateCanvasSize = RoactModule.createBinding(Vector2.new(0, 0))
	p1:setState({ scrollingWithTouch = false })
	p1.scrollBarImageTransparency, p1.updateScrollBarImageTransparency = RoactModule.createBinding(1)
	p1.scrollBarImageTransparencyMotor = OtterModule.createSingleMotor(0)
	p1.scrollBarImageTransparencyMotor:onStep(p1.updateScrollBarImageTransparency)
	p1.lastTimeCanvasPositionChanged = tick()
	p1.waitToHideSidebarConnection = nil
	
	function p1.waitToHideSidebar() --[[ Line: 108 ]]
		-- upvalues: p1 (copy), OtterModule (upval), config (upval)
		if tick() - p1.lastTimeCanvasPositionChanged > 0.7 then
			p1.scrollBarImageTransparencyMotor:setGoal(OtterModule.spring(1, config))
			p1.disconnectWaitToHideSidebar()
		end
	end
	
	function p1.disconnectWaitToHideSidebar() --[[ Line: 116 ]]
		-- upvalues: p1 (copy)
		if p1.waitToHideSidebarConnection then
			p1.waitToHideSidebarConnection:Disconnect()
			p1.waitToHideSidebarConnection = nil
		end
	end
	
	function p1:inputBegan(Input) --[[ Line: 122 ]]
		-- upvalues: p1 (copy), OtterModule (upval)
		if not p1.props.scrollingEnabled then return end
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			p1.disconnectWaitToHideSidebar()
			p1.scrollBarImageTransparencyMotor:setGoal(OtterModule.instant(0))
		end
	end
	
	function p1:inputEnded(Input) --[[ Line: 132 ]]
		-- upvalues: p1 (copy), OtterModule (upval)
		if not p1.props.scrollingEnabled then return end
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			p1.disconnectWaitToHideSidebar()
			p1.scrollBarImageTransparencyMotor:setGoal(OtterModule.instant(1))
		end
	end
	
	function p1.canvasPosition(ScrollFrame) --[[ Line: 142 ]]
		-- upvalues: p1 (copy), UserInputService (upval), OtterModule (upval), RunService (upval), RoactModule (upval)
		p1.lastTimeCanvasPositionChanged = tick()
		
		if not p1.waitToHideSidebarConnection and UserInputService:GetLastInputType() == Enum.UserInputType.Touch then
			p1.scrollBarImageTransparencyMotor:setGoal(OtterModule.instant(0))
			p1.waitToHideSidebarConnection = RunService.Heartbeat:Connect(p1.waitToHideSidebar)
		end
		p1.updateScroll(ScrollFrame.CanvasPosition.Y)
		
		if p1.props[RoactModule.Change.CanvasPosition] then
			p1.props[RoactModule.Change.CanvasPosition](ScrollFrame)
		end
	end
	
	function p1.onGamepadFocused() --[[ Line: 156 ]]
		-- upvalues: p1 (copy), OtterModule (upval)
		p1.scrollBarImageTransparencyMotor:setGoal(OtterModule.instant(0))
	end
	
	function p1.onGamepadFocusLost() --[[ Line: 160 ]]
		-- upvalues: p1 (copy), OtterModule (upval)
		p1.scrollBarImageTransparencyMotor:setGoal(OtterModule.instant(1))
	end
	
	function p1.getMainCanvasPosition() --[[ Line: 164 ]]
		-- upvalues: p1 (copy)
		return p1.scrollPosition:map(function(Y): Vector2 --[[ Line: 165 ]]
			return Vector2.new(0, Y)
		end)
	end
	
	function p1.onMainCanvasSizeChange(ScrollFrame) --[[ Line: 170 ]]
		-- upvalues: p1 (copy)
		p1.updateCanvasSize(ScrollFrame.AbsoluteCanvasSize)
	end
	
	function p1.getMainCanvasSize() --[[ Line: 174 ]]
		-- upvalues: p1 (copy)
		return p1.mainCanvasSize:map(function(p2): UDim2 --[[ Line: 175 ]]
			return UDim2.new(0, 2, 0, p2.Y)
		end)
	end
	
	p1.viewSize, p1.updateViewSize = RoactModule.createBinding(Vector2.new(0, 0))
	p1.mainCanvasPosition, p1.updateMainCanvasPosition = RoactModule.createBinding(Vector2.new(0, 0))
	
	function p1.onScrollBarDragging(Y) --[[ Line: 183 ]]
		-- upvalues: p1 (copy)
		p1.updateMainCanvasPosition(Vector2.new(0, Y))
	end
	
	function p1.onViewSizeChange(Frame) --[[ Line: 187 ]]
		-- upvalues: p1 (copy)
		p1.updateViewSize(Frame.AbsoluteSize)
	end
	
	function p1.onSelectionChanged(Ancestor, p2, _, Object) --[[ Line: 191 ]]
		-- upvalues: p1 (copy)
		if not p2 and Object == nil then
			p1.onGamepadFocusLost()
			
			return
		end
		if p2 or Object:IsDescendantOf(Ancestor) then
			p1.onGamepadFocused()
			
			return
		else
			p1.onGamepadFocusLost()
		end
	end
end

function VerticalScrollView:getScrollBarStyleProps(p1, ScrollBarType) --[[ Line: 205 ]]
	-- upvalues: ScrollBarTypeModule (copy), ImagesModule (copy)
	local Tokens = p1.Tokens
	
	return if ScrollBarType == ScrollBarTypeModule.Wide then {
		userInteractionEnabled = true,
		marginRight = 0,
		width = Tokens.Size.Size_400,
		handleWidth = Tokens.Size.Size_200,
		paddingStartEnd = Tokens.Size.Size_100
	} elseif ScrollBarType == ScrollBarTypeModule.Gamepad then {
		userInteractionEnabled = false,
		width = Tokens.Size.Size_400,
		handleWidth = Tokens.Size.Size_200,
		handleIcon = ImagesModule["icons/controls/keys/xboxRSVertical"],
		handleIconSize = Tokens.Size.Size_900,
		handleIconColor = {
			Color = Tokens.Color.Content.Emphasis.Color3,
			Transparency = Tokens.Color.Content.Emphasis.Transparency
		},
		paddingStartEnd = Tokens.Size.Size_600,
		marginRight = Tokens.Size.Size_600
	} else {
		userInteractionEnabled = false,
		marginRight = 0,
		width = Tokens.Size.Size_300,
		handleWidth = Tokens.Size.Size_50,
		paddingStartEnd = Tokens.Size.Size_100
	}
end

function VerticalScrollView.renderScrollBar(p1, p2) --[[ Line: 242 ]]
	-- upvalues: RoactModule (copy), ScrollBarModule (copy)
	local Tokens = p2.Tokens
	local ScrollBarStyleProps = p1:getScrollBarStyleProps(p2, p1.props.scrollBarType)
	
	return RoactModule.createElement(ScrollBarModule, {
		zIndex = 2,
		userInteractionEnabled = ScrollBarStyleProps.userInteractionEnabled,
		width = ScrollBarStyleProps.width,
		anchorPoint = Vector2.new(1, 0),
		position = UDim2.new(1, -ScrollBarStyleProps.marginRight, 0, 0),
		transparency = p1.scrollBarImageTransparency,
		backgroundColor = ScrollBarStyleProps.backgroundColor,
		paddingStartEnd = ScrollBarStyleProps.paddingStartEnd,
		handleWidth = ScrollBarStyleProps.handleWidth,
		handleColor = {
			Color = Tokens.Color.Shift.Shift_400.Color3,
			Transparency = Tokens.Color.Shift.Shift_400.Transparency
		},
		handleCornerRadius = Tokens.Radius.Circle,
		handleIcon = ScrollBarStyleProps.handleIcon,
		handleIconColor = ScrollBarStyleProps.handleIconColor,
		handleIconSize = ScrollBarStyleProps.handleIconSize,
		onDragging = p1.onScrollBarDragging,
		viewSize = p1.viewSize,
		canvasSize = p1.mainCanvasSize,
		canvasPosition = p1.getMainCanvasPosition()
	})
end

function VerticalScrollView.renderWithProviders(p1, p2, _, SelectionImageObject) --[[ Line: 274 ]]
	-- upvalues: RoactModule (copy), Focusable (copy)
	local AutomaticSize = p1.props.automaticSize
	local IsGamepadFocusable = p1.props.isGamepadFocusable
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = p1.props.position,
		Size = p1.props.size,
		AutomaticSize = AutomaticSize,
		LayoutOrder = p1.props.layoutOrder,
		ClipsDescendants = true,
		[RoactModule.Ref] = p1.parentFrameRef
	}, {
		MainCanvas = RoactModule.createElement(IsGamepadFocusable and Focusable.ScrollingFrame or "ScrollingFrame", {
			Active = false,
			AutomaticSize = AutomaticSize,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			ElasticBehavior = p1.props.elasticBehavior,
			CanvasSize = UDim2.new(UDim.new(1, 0), p1.props.canvasSizeY),
			AutomaticCanvasSize = p1.props.useAutomaticCanvasSize and Enum.AutomaticSize.Y or nil,
			CanvasPosition = p1.mainCanvasPosition,
			ScrollingEnabled = p1.props.scrollingEnabled,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarImageTransparency = 1,
			ScrollBarThickness = 0,
			Selectable = p1.props.selectable,
			SelectionImageObject = SelectionImageObject,
			onFocusGained = IsGamepadFocusable and p1.onGamepadFocused or nil,
			onFocusLost = IsGamepadFocusable and p1.onGamepadFocusLost or nil,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			[RoactModule.Event.InputBegan] = p1.inputBegan,
			[RoactModule.Event.InputEnded] = p1.inputEnded,
			[RoactModule.Change.CanvasPosition] = p1.canvasPosition,
			[RoactModule.Change.AbsoluteCanvasSize] = p1.onMainCanvasSizeChange,
			[RoactModule.Change.CanvasSize] = p1.props[RoactModule.Change.CanvasSize],
			[RoactModule.Ref] = p1.props.scrollingFrameRef,
			[RoactModule.Change.AbsoluteSize] = p1.onViewSizeChange,
			[RoactModule.Event.SelectionChanged] = if IsGamepadFocusable then p1.onSelectionChanged else nil
		}, p1.props[RoactModule.Children]),
		ScrollBar = p1:renderScrollBar(p2)
	})
end

function VerticalScrollView.render(p1) --[[ Line: 345 ]]
	-- upvalues: WithStyleModule (copy)
	return WithStyleModule(function(p2) --[[ Line: 346 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2, nil, p1.props.cursor)
	end)
end

function VerticalScrollView.willUnmount(p1) --[[ Line: 351 ]]
	p1.disconnectWaitToHideSidebar()
end

return RoactModule.forwardRef(function(p1, ScrollingFrameRef) --[[ Line: 355 ]]
	-- upvalues: UseCursorByTypeModule (copy), CursorTypeModule (copy), RoactModule (copy), VerticalScrollView (copy), CryoModule (copy)
	return RoactModule.createElement(VerticalScrollView, CryoModule.Dictionary.join(p1, {
		scrollingFrameRef = ScrollingFrameRef,
		cursor = UseCursorByTypeModule(CursorTypeModule.RoundedRect)
	}))
end)