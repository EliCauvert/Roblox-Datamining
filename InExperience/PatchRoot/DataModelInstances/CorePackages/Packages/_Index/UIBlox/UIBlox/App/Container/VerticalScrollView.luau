local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local parent = script.Parent
local parent_1 = script.Parent.Parent
local parent_2 = parent_1.Parent.Parent
local cryoModule = require(parent_2.Cryo)
local otterModule = require(parent_2.Otter)
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local focusable = require(parent_2.RoactGamepad).Focusable
local withStyleModule = require(parent_2.UIBlox.Core.Style.withStyle)
local useCursorByTypeModule = require(parent_1.SelectionCursor.useCursorByType)
local cursorTypeModule = require(parent_1.SelectionCursor.CursorType)
local imagesModule = require(parent_2.UIBlox.App.ImageSet.Images)
local scrollBarTypeModule = require(parent.Enum.ScrollBarType)
local scrollBarModule = require(script.Parent.ScrollBar)
local t = { frequency = 3, dampingRatio = 1.5 }
local verticalScrollView = roactModule.Component:extend("VerticalScrollView")
verticalScrollView.validateProps = tModule.strictInterface({
	size = tModule.optional(tModule.UDim2),
	position = tModule.optional(tModule.UDim2),
	layoutOrder = tModule.optional(tModule.number),
	elasticBehavior = tModule.optional(tModule.EnumItem),
	canvasSizeY = tModule.optional(tModule.UDim),
	automaticSize = tModule.optional(tModule.enum(Enum.AutomaticSize)),
	useAutomaticCanvasSize = tModule.optional(tModule.boolean),
	isGamepadFocusable = tModule.optional(tModule.boolean),
	scrollingEnabled = tModule.optional(tModule.boolean),
	selectable = tModule.optional(tModule.boolean),
	[roactModule.Change.CanvasPosition] = tModule.optional(tModule.callback),
	[roactModule.Change.CanvasSize] = tModule.optional(tModule.callback),
	scrollingFrameRef = tModule.optional(tModule.table),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	[roactModule.Children] = tModule.optional(tModule.table),
	scrollBarType = tModule.optional(tModule.string),
	cursor = tModule.table
})
verticalScrollView.defaultProps = {
	useAutomaticCanvasSize = false,
	isGamepadFocusable = false,
	selectable = nil,
	scrollingEnabled = true,
	size = UDim2.new(1, 0, 1, 0),
	canvasSizeY = UDim.new(2, 0),
	automaticSize = Enum.AutomaticSize.None,
	scrollBarType = scrollBarTypeModule.Compact
}

function verticalScrollView.init(p0) --[[ line: 90 ]]
	-- upvalues: roactModule (ref), otterModule (ref), t (ref), userInputService (ref), runService (ref)
	p0.parentFrameRef = roactModule.createRef()
	p0.mainCanvasRef = roactModule.createRef()
	local var14, var15 = roactModule.createBinding(0)
	p0.scrollPosition = var14
	p0.updateScroll = var15
	local var16, var17 = roactModule.createBinding(Vector2.new(0, 0))
	p0.mainCanvasSize = var16
	p0.updateCanvasSize = var17
	p0:setState({ scrollingWithTouch = false })
	local var18, var19 = roactModule.createBinding(1)
	p0.scrollBarImageTransparency = var18
	p0.updateScrollBarImageTransparency = var19
	p0.scrollBarImageTransparencyMotor = otterModule.createSingleMotor(0)
	p0.scrollBarImageTransparencyMotor:onStep(p0.updateScrollBarImageTransparency)
	p0.lastTimeCanvasPositionChanged = tick()
	p0.waitToHideSidebarConnection = nil
	
	function p0.waitToHideSidebar() --[[ line: 108 ]]
		-- upvalues: p0 (ref), otterModule (copy), t (copy)
		if tick() - p0.lastTimeCanvasPositionChanged > 0.7 then
			p0.scrollBarImageTransparencyMotor:setGoal(otterModule.spring(1, t))
			p0.disconnectWaitToHideSidebar()
		end
	end
	
	function p0.disconnectWaitToHideSidebar() --[[ line: 116 ]]
		-- upvalues: p0 (ref)
		if p0.waitToHideSidebarConnection then
			p0.waitToHideSidebarConnection:Disconnect()
			p0.waitToHideSidebarConnection = nil
		end
	end
	
	function p0.inputBegan(_, p1) --[[ line: 122 ]]
		-- upvalues: p0 (ref), otterModule (copy)
		if not p0.props.scrollingEnabled then return end
		if p1.UserInputType == Enum.UserInputType.MouseMovement then
			p0.disconnectWaitToHideSidebar()
			p0.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(0))
		end
	end
	
	function p0.inputEnded(_, p2) --[[ line: 132 ]]
		-- upvalues: p0 (ref), otterModule (copy)
		if not p0.props.scrollingEnabled then return end
		if p2.UserInputType == Enum.UserInputType.MouseMovement then
			p0.disconnectWaitToHideSidebar()
			p0.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(1))
		end
	end
	
	function p0.canvasPosition(p3) --[[ line: 142 ]]
		-- upvalues: p0 (ref), userInputService (copy), otterModule (copy), runService (copy), roactModule (copy)
		p0.lastTimeCanvasPositionChanged = tick()
		
		if not p0.waitToHideSidebarConnection and userInputService:GetLastInputType() == Enum.UserInputType.Touch then
			p0.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(0))
			p0.waitToHideSidebarConnection = runService.Heartbeat:Connect(p0.waitToHideSidebar)
		end
		p0.updateScroll(p3.CanvasPosition.Y)
		
		if p0.props[roactModule.Change.CanvasPosition] then
			p0.props[roactModule.Change.CanvasPosition](p3)
		end
	end
	
	function p0.onGamepadFocused() --[[ line: 156 ]]
		-- upvalues: p0 (ref), otterModule (copy)
		p0.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(0))
	end
	
	function p0.onGamepadFocusLost() --[[ line: 160 ]]
		-- upvalues: p0 (ref), otterModule (copy)
		p0.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(1))
	end
	
	function p0.getMainCanvasPosition() --[[ line: 164 ]]
		-- upvalues: p0 (ref)
		return p0.scrollPosition:map(function(p4) --[[ line: 165 ]]
			return Vector2.new(0, p4)
		end)
	end
	
	function p0.onMainCanvasSizeChange(p5) --[[ line: 170 ]]
		-- upvalues: p0 (ref)
		p0.updateCanvasSize(p5.AbsoluteCanvasSize)
	end
	
	function p0.getMainCanvasSize() --[[ line: 174 ]]
		-- upvalues: p0 (ref)
		return p0.mainCanvasSize:map(function(p6) --[[ line: 175 ]]
			return UDim2.new(0, 2, 0, p6.Y)
		end)
	end
	
	local var20, var21 = roactModule.createBinding(Vector2.new(0, 0))
	p0.viewSize = var20
	p0.updateViewSize = var21
	local var22, var23 = roactModule.createBinding(Vector2.new(0, 0))
	p0.mainCanvasPosition = var22
	p0.updateMainCanvasPosition = var23
	
	function p0.onScrollBarDragging(p7) --[[ line: 183 ]]
		-- upvalues: p0 (ref)
		p0.updateMainCanvasPosition(Vector2.new(0, p7))
	end
	
	function p0.onViewSizeChange(p8) --[[ line: 187 ]]
		-- upvalues: p0 (ref)
		p0.updateViewSize(p8.AbsoluteSize)
	end
	
	function p0.onSelectionChanged(p9, p10, _, p11) --[[ line: 191 ]]
		-- upvalues: p0 (ref)
		if not p10 and p11 == nil then
			p0.onGamepadFocusLost()
			
			return
		elseif p10 or p11:IsDescendantOf(p9) then
			p0.onGamepadFocused()
			
			return
		end
		p0.onGamepadFocusLost()
	end
end

function verticalScrollView.getScrollBarStyleProps(_, p12, p13) --[[ line: 205 ]]
	-- upvalues: scrollBarTypeModule (ref), imagesModule (ref)
	local tokens = p12.Tokens
	
	return if p13 == scrollBarTypeModule.Wide then {
		userInteractionEnabled = true,
		marginRight = 0,
		width = tokens.Global.Size_200,
		handleWidth = tokens.Global.Size_100,
		paddingStartEnd = tokens.Global.Space_50
	} elseif p13 == scrollBarTypeModule.Gamepad then {
		userInteractionEnabled = false,
		width = tokens.Global.Space_200,
		handleWidth = tokens.Global.Space_100,
		handleIcon = imagesModule["icons/controls/keys/xboxRSVertical"],
		handleIconSize = tokens.Semantic.Icon.Size.Medium,
		handleIconColor = {
			Color = tokens.Semantic.Color.Icon.Emphasis.Color3,
			Transparency = tokens.Semantic.Color.Icon.Emphasis.Transparency
		},
		paddingStartEnd = tokens.Global.Space_300,
		marginRight = tokens.Global.Space_300
	} else {
		userInteractionEnabled = false,
		marginRight = 0,
		width = tokens.Global.Space_150,
		handleWidth = tokens.Global.Size_25,
		paddingStartEnd = tokens.Global.Space_50
	}
end

function verticalScrollView.renderScrollBar(p14, p15) --[[ line: 242 ]]
	-- upvalues: roactModule (ref), scrollBarModule (ref)
	local tokens = p15.Tokens
	local var24 = p14:getScrollBarStyleProps(p15, p14.props.scrollBarType)
	
	return roactModule.createElement(scrollBarModule, {
		zIndex = 2,
		userInteractionEnabled = var24.userInteractionEnabled,
		width = var24.width,
		anchorPoint = Vector2.new(1, 0),
		position = UDim2.new(1, -var24.marginRight, 0, 0),
		transparency = p14.scrollBarImageTransparency,
		backgroundColor = var24.backgroundColor,
		paddingStartEnd = var24.paddingStartEnd,
		handleWidth = var24.handleWidth,
		handleColor = {
			Color = tokens.Semantic.Color.Ui.Emphasis.Color3,
			Transparency = tokens.Semantic.Color.Ui.Emphasis.Transparency
		},
		handleCornerRadius = tokens.Semantic.Radius.Circle,
		handleIcon = var24.handleIcon,
		handleIconColor = var24.handleIconColor,
		handleIconSize = var24.handleIconSize,
		onDragging = p14.onScrollBarDragging,
		viewSize = p14.viewSize,
		canvasSize = p14.mainCanvasSize,
		canvasPosition = p14.getMainCanvasPosition()
	})
end

function verticalScrollView.renderWithProviders(p16, p17, _, p18) --[[ line: 274 ]]
	-- upvalues: roactModule (ref), focusable (ref)
	local position = p16.props.position
	local size = p16.props.size
	local layoutOrder = p16.props.layoutOrder
	local canvasSizeY = p16.props.canvasSizeY
	local automaticSize = p16.props.automaticSize
	local isGamepadFocusable = p16.props.isGamepadFocusable
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = position,
		Size = size,
		AutomaticSize = automaticSize,
		LayoutOrder = layoutOrder,
		ClipsDescendants = true,
		[roactModule.Ref] = p16.parentFrameRef
	}, {
		MainCanvas = roactModule.createElement(if isGamepadFocusable then focusable.ScrollingFrame else "ScrollingFrame", {
			Active = false,
			AutomaticSize = automaticSize,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			ElasticBehavior = p16.props.elasticBehavior,
			CanvasSize = UDim2.new(UDim.new(1, 0), canvasSizeY),
			AutomaticCanvasSize = if p16.props.useAutomaticCanvasSize then Enum.AutomaticSize.Y else nil,
			CanvasPosition = p16.mainCanvasPosition,
			ScrollingEnabled = p16.props.scrollingEnabled,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarImageTransparency = 1,
			ScrollBarThickness = 0,
			Selectable = p16.props.selectable,
			SelectionImageObject = p18,
			onFocusGained = if isGamepadFocusable then p16.onGamepadFocused else nil,
			onFocusLost = if isGamepadFocusable then p16.onGamepadFocusLost else nil,
			NextSelectionLeft = p16.props.NextSelectionLeft,
			NextSelectionRight = p16.props.NextSelectionRight,
			NextSelectionUp = p16.props.NextSelectionUp,
			NextSelectionDown = p16.props.NextSelectionDown,
			[roactModule.Event.InputBegan] = p16.inputBegan,
			[roactModule.Event.InputEnded] = p16.inputEnded,
			[roactModule.Change.CanvasPosition] = p16.canvasPosition,
			[roactModule.Change.AbsoluteCanvasSize] = p16.onMainCanvasSizeChange,
			[roactModule.Change.CanvasSize] = p16.props[roactModule.Change.CanvasSize],
			[roactModule.Ref] = p16.props.scrollingFrameRef,
			[roactModule.Change.AbsoluteSize] = p16.onViewSizeChange,
			[roactModule.Event.SelectionChanged] = if isGamepadFocusable then p16.onSelectionChanged else nil
		}, p16.props[roactModule.Children]),
		ScrollBar = p16:renderScrollBar(p17)
	})
end

function verticalScrollView.render(p19) --[[ line: 345 ]]
	-- upvalues: withStyleModule (ref)
	return withStyleModule(function(p20) --[[ line: 346 ]]
		-- upvalues: p19 (ref)
		return p19:renderWithProviders(p20, nil, p19.props.cursor)
	end)
end

function verticalScrollView.willUnmount(p21) --[[ line: 351 ]]
	p21.disconnectWaitToHideSidebar()
end

return roactModule.forwardRef(function(p22, p23) --[[ line: 355 ]]
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), roactModule (ref), verticalScrollView (ref), cryoModule (ref)
	return roactModule.createElement(verticalScrollView, cryoModule.Dictionary.join(p22, {
		scrollingFrameRef = p23,
		cursor = useCursorByTypeModule(cursorTypeModule.RoundedRect)
	}))
end)