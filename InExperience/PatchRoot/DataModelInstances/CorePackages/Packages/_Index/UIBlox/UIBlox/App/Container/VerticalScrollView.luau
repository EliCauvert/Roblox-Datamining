local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local parent = script.Parent
local parent_1 = script.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local UIBloxConfigModule = require(parent_2.UIBloxConfig)
local cryoModule = require(parent_3.Cryo)
local otterModule = require(parent_3.Otter)
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local focusable = require(parent_3.RoactGamepad).Focusable
local withStyleModule = require(parent_3.UIBlox.Core.Style.withStyle)
local useCursorByTypeModule = require(parent_1.SelectionCursor.useCursorByType)
local cursorTypeModule = require(parent_1.SelectionCursor.CursorType)
local imagesModule = require(parent_3.UIBlox.App.ImageSet.Images)
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

function verticalScrollView.init(p1)
	-- upvalues: roactModule (ref), otterModule (ref), t (ref), userInputService (ref), runService (ref)
	p1.parentFrameRef = roactModule.createRef()
	p1.mainCanvasRef = roactModule.createRef()
	local var1, var2 = roactModule.createBinding(0)
	p1.scrollPosition = var1
	p1.updateScroll = var2
	local var3, var4 = roactModule.createBinding(Vector2.new(0, 0))
	p1.mainCanvasSize = var3
	p1.updateCanvasSize = var4
	p1:setState({ scrollingWithTouch = false })
	local var5, var6 = roactModule.createBinding(1)
	p1.scrollBarImageTransparency = var5
	p1.updateScrollBarImageTransparency = var6
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
		if not p1.props.scrollingEnabled then return end
		if p2.UserInputType == Enum.UserInputType.MouseMovement then
			p1.disconnectWaitToHideSidebar()
			p1.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(0))
		end
	end
	
	function p0.inputEnded(_, p2)
		-- upvalues: p1 (ref), otterModule (copy)
		if not p1.props.scrollingEnabled then return end
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
			p1.waitToHideSidebarConnection = runService.Heartbeat:Connect(p1.waitToHideSidebar)
		end
		p1.updateScroll(p2.CanvasPosition.Y)
		
		if p1.props[roactModule.Change.CanvasPosition] then
			p1.props[roactModule.Change.CanvasPosition](p2)
		end
	end
	
	function p0.onGamepadFocused()
		-- upvalues: p1 (ref), otterModule (copy)
		p1.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(0))
	end
	
	function p0.onGamepadFocusLost()
		-- upvalues: p1 (ref), otterModule (copy)
		p1.scrollBarImageTransparencyMotor:setGoal(otterModule.instant(1))
	end
	
	function p0.getMainCanvasPosition()
		-- upvalues: p1 (ref)
		return p1.scrollPosition:map(function(p2)
			return Vector2.new(0, p2)
		end)
	end
	
	function p0.onMainCanvasSizeChange(p2)
		-- upvalues: p1 (ref)
		p1.updateCanvasSize(p2.AbsoluteCanvasSize)
	end
	
	function p0.getMainCanvasSize()
		-- upvalues: p1 (ref)
		return p1.mainCanvasSize:map(function(p2)
			return UDim2.new(0, 2, 0, p2.Y)
		end)
	end
	
	local var7, var8 = roactModule.createBinding(Vector2.new(0, 0))
	p1.viewSize = var7
	p1.updateViewSize = var8
	local var9, var10 = roactModule.createBinding(Vector2.new(0, 0))
	p1.mainCanvasPosition = var9
	p1.updateMainCanvasPosition = var10
	
	function p0.onScrollBarDragging(p2)
		-- upvalues: p1 (ref)
		p1.updateMainCanvasPosition(Vector2.new(0, p2))
	end
	
	function p0.onViewSizeChange(p2)
		-- upvalues: p1 (ref)
		p1.updateViewSize(p2.AbsoluteSize)
	end
	
	function p0.onSelectionChanged(p2, p3, _, p4)
		-- upvalues: p1 (ref)
		if not p3 and p4 == nil then
			p1.onGamepadFocusLost()
			
			return
		elseif p3 or p4:IsDescendantOf(p2) then
			p1.onGamepadFocused()
			
			return
		end
		p1.onGamepadFocusLost()
	end
end

function verticalScrollView.getScrollBarStyleProps(_, p1, p2)
	-- upvalues: scrollBarTypeModule (ref), UIBloxConfigModule (ref), imagesModule (ref)
	local tokens = p1.Tokens
	
	return if p2 == scrollBarTypeModule.Wide then {
		userInteractionEnabled = true,
		marginRight = 0,
		width = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_400 else tokens.Global.Size_200,
		handleWidth = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Size_100,
		paddingStartEnd = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Space_50
	} elseif p2 == scrollBarTypeModule.Gamepad then {
		userInteractionEnabled = false,
		width = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_400 else tokens.Global.Space_200,
		handleWidth = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100,
		handleIcon = imagesModule["icons/controls/keys/xboxRSVertical"],
		handleIconSize = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_900 else tokens.Semantic.Icon.Size.Medium,
		handleIconColor = {
			Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis.Color3 else tokens.Semantic.Color.Icon.Emphasis.Color3,
			Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis.Transparency else tokens.Semantic.Color.Icon.Emphasis.Transparency
		},
		paddingStartEnd = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_600 else tokens.Global.Space_300,
		marginRight = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_600 else tokens.Global.Space_300
	} else {
		userInteractionEnabled = false,
		marginRight = 0,
		width = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Space_150,
		handleWidth = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Size_25,
		paddingStartEnd = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Space_50
	}
end

function verticalScrollView.renderScrollBar(p1, p2)
	-- upvalues: roactModule (ref), scrollBarModule (ref), UIBloxConfigModule (ref)
	local tokens = p2.Tokens
	local var1 = p1:getScrollBarStyleProps(p2, p1.props.scrollBarType)
	
	return roactModule.createElement(scrollBarModule, {
		zIndex = 2,
		userInteractionEnabled = var1.userInteractionEnabled,
		width = var1.width,
		anchorPoint = Vector2.new(1, 0),
		position = UDim2.new(1, -var1.marginRight, 0, 0),
		transparency = p1.scrollBarImageTransparency,
		backgroundColor = var1.backgroundColor,
		paddingStartEnd = var1.paddingStartEnd,
		handleWidth = var1.handleWidth,
		handleColor = {
			Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Shift.Shift_400.Color3 else tokens.Semantic.Color.Ui.Emphasis.Color3,
			Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Shift.Shift_400.Transparency else tokens.Semantic.Color.Ui.Emphasis.Transparency
		},
		handleCornerRadius = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Radius.Circle else tokens.Semantic.Radius.Circle,
		handleIcon = var1.handleIcon,
		handleIconColor = var1.handleIconColor,
		handleIconSize = var1.handleIconSize,
		onDragging = p1.onScrollBarDragging,
		viewSize = p1.viewSize,
		canvasSize = p1.mainCanvasSize,
		canvasPosition = p1.getMainCanvasPosition()
	})
end

function verticalScrollView.renderWithProviders(p1, p2, _, p3)
	-- upvalues: roactModule (ref), focusable (ref)
	local position = p1.props.position
	local size = p1.props.size
	local layoutOrder = p1.props.layoutOrder
	local canvasSizeY = p1.props.canvasSizeY
	local automaticSize = p1.props.automaticSize
	local isGamepadFocusable = p1.props.isGamepadFocusable
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = position,
		Size = size,
		AutomaticSize = automaticSize,
		LayoutOrder = layoutOrder,
		ClipsDescendants = true,
		[roactModule.Ref] = p1.parentFrameRef
	}, {
		MainCanvas = roactModule.createElement(if isGamepadFocusable then focusable.ScrollingFrame else "ScrollingFrame", {
			Active = false,
			AutomaticSize = automaticSize,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			ElasticBehavior = p1.props.elasticBehavior,
			CanvasSize = UDim2.new(UDim.new(1, 0), canvasSizeY),
			AutomaticCanvasSize = if p1.props.useAutomaticCanvasSize then Enum.AutomaticSize.Y else nil,
			CanvasPosition = p1.mainCanvasPosition,
			ScrollingEnabled = p1.props.scrollingEnabled,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarImageTransparency = 1,
			ScrollBarThickness = 0,
			Selectable = p1.props.selectable,
			SelectionImageObject = p3,
			onFocusGained = if isGamepadFocusable then p1.onGamepadFocused else nil,
			onFocusLost = if isGamepadFocusable then p1.onGamepadFocusLost else nil,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			[roactModule.Event.InputBegan] = p1.inputBegan,
			[roactModule.Event.InputEnded] = p1.inputEnded,
			[roactModule.Change.CanvasPosition] = p1.canvasPosition,
			[roactModule.Change.AbsoluteCanvasSize] = p1.onMainCanvasSizeChange,
			[roactModule.Change.CanvasSize] = p1.props[roactModule.Change.CanvasSize],
			[roactModule.Ref] = p1.props.scrollingFrameRef,
			[roactModule.Change.AbsoluteSize] = p1.onViewSizeChange,
			[roactModule.Event.SelectionChanged] = if isGamepadFocusable then p1.onSelectionChanged else nil
		}, p1.props[roactModule.Children]),
		ScrollBar = p1:renderScrollBar(p2)
	})
end

function verticalScrollView.render(p1)
	-- upvalues: withStyleModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithProviders(p2, nil, p1.props.cursor)
	end)
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