local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.Parent.React)
local _ = require(Parent.Style.StyleTypes)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local _ = require(Parent.ImageSet.ImagesTypes)

return function(p1) --[[ Line: 55 | Named "ScrollBar" ]]
	-- upvalues: ReactModule (copy), UserInputService (copy), ImageSetComponentModule (copy)
	local UserInteractionEnabled = p1.userInteractionEnabled
	local Width = p1.width
	local AnchorPoint = p1.anchorPoint
	local Position = p1.position
	local ZIndex = p1.zIndex
	local Transparency = p1.transparency
	local BackgroundColor = p1.backgroundColor
	local PaddingStartEnd = p1.paddingStartEnd
	local HandleWidth = p1.handleWidth
	local HandleColor = p1.handleColor
	local HandleCornerRadius = p1.handleCornerRadius
	local HandleIcon = p1.handleIcon
	local HandleIconSize = p1.handleIconSize
	local HandleIconColor = p1.handleIconColor
	local OnDraggingFunction = p1.onDragging
	local ViewSize = p1.viewSize
	local CanvasSize = p1.canvasSize
	local CanvasPosition = p1.canvasPosition
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 83 ]]
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.Y)
	end, { UseBindingResult2 })
	local UseResult1 = ReactModule.useCallback(function(Frame) --[[ Line: 87 ]]
		-- upvalues: UseStateResult2 (copy)
		local Parent = Frame.Parent
		
		if Parent == nil or math.ceil(Frame.AbsoluteSize.Y) >= Parent.AbsoluteSize.Y then
			UseStateResult2(false)
			
			return
		else
			UseStateResult2(true)
		end
	end, { UseStateResult2 })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 96 ]]
		-- upvalues: ReactModule (upval), ViewSize (copy), CanvasSize (copy), HandleWidth (copy)
		return ReactModule.joinBindings({ viewSize = ViewSize, canvasSize = CanvasSize }):map(function(p2): UDim2 --[[ Line: 100 ]]
			-- upvalues: HandleWidth (upval)
			return UDim2.new(0, HandleWidth, math.clamp(p2.viewSize.Y / p2.canvasSize.Y, 0, 1), 0)
		end)
	end, { HandleWidth, ViewSize, CanvasSize })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 108 ]]
		-- upvalues: ReactModule (upval), CanvasPosition (copy), CanvasSize (copy)
		return ReactModule.joinBindings({ canvasPosition = CanvasPosition, canvasSize = CanvasSize }):map(function(p2): UDim2 --[[ Line: 112 ]]
			return UDim2.fromScale(0.5, p2.canvasPosition.Y / p2.canvasSize.Y)
		end)
	end, { CanvasSize, CanvasPosition })
	local UseResult2 = ReactModule.useCallback(function(_, Input) --[[ Line: 120 ]]
		-- upvalues: UseStateResult (copy), UserInteractionEnabled (copy), UseStateResult1 (copy), UseRefResult (copy), UseRefResult1 (copy), CanvasPosition (copy), UseStateResult2_1 (copy)
		if not UseStateResult or not UserInteractionEnabled or UseStateResult1 then return end
		if Input and Input.UserInputType == Enum.UserInputType.MouseButton1 then
			UseRefResult.current = Input.Position.Y
			UseRefResult1.current = CanvasPosition:getValue().Y
			UseStateResult2_1(true)
		end
	end, {
		UseStateResult, UserInteractionEnabled, UseStateResult1, UseRefResult,
		UseRefResult1, CanvasPosition, UseStateResult2_1
	})
	local UseResult3 = ReactModule.useCallback(function(Input) --[[ Line: 141 ]]
		-- upvalues: UserInteractionEnabled (copy), UseStateResult1 (copy), UseRefResult (copy), UseBindingResult (copy), PaddingStartEnd (copy), ViewSize (copy), UseRefResult1 (copy), CanvasSize (copy), OnDraggingFunction (copy)
		if not UserInteractionEnabled or not UseStateResult1 then return end
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			local Y = CanvasSize:getValue().Y
			OnDraggingFunction((math.clamp(UseRefResult1.current + (Input.Position.Y - UseRefResult.current) / (UseBindingResult:getValue() - PaddingStartEnd) * Y, 0, Y - ViewSize:getValue().Y)))
			
			return
		end
	end, {
		UserInteractionEnabled, UseStateResult1, UseRefResult, UseBindingResult,
		PaddingStartEnd, ViewSize, UseRefResult1, CanvasSize, OnDraggingFunction
	})
	local UseResult4 = ReactModule.useCallback(function(Input) --[[ Line: 172 ]]
		-- upvalues: UserInteractionEnabled (copy), UseStateResult1 (copy), UseStateResult2_1 (copy)
		if not UserInteractionEnabled or not UseStateResult1 then return end
		if not Input or Input.UserInputType == Enum.UserInputType.MouseButton1 then
			UseStateResult2_1(false)
			
			return
		end
	end, {
		UserInteractionEnabled,
		UseStateResult1,
		UseStateResult2_1
	})
	ReactModule.useEffect(function() --[[ Line: 184 ]]
		-- upvalues: UseStateResult (copy), UseStateResult1 (copy), UserInputService (upval), UseResult3 (copy), UseResult4 (copy)
		if UseStateResult and UseStateResult1 then
			local InputChangedConnection = UserInputService.InputChanged:Connect(UseResult3)
			local InputEndedConnection = UserInputService.InputEnded:Connect(UseResult4)
			local WindowFocusReleasedConnection = UserInputService.WindowFocusReleased:Connect(UseResult4)
			
			return function() --[[ Line: 193 ]]
				-- upvalues: InputChangedConnection (copy), InputEndedConnection (copy), WindowFocusReleasedConnection (copy)
				InputChangedConnection:Disconnect()
				InputEndedConnection:Disconnect()
				WindowFocusReleasedConnection:Disconnect()
			end
		else
			return function() --[[ Line: 186 ]] end
		end
	end, { UseStateResult, UseStateResult1, UseResult3, UseResult4 })
	
	return ReactModule.createElement("CanvasGroup", {
		Selectable = false,
		BorderSizePixel = 0,
		Size = UDim2.new(0, Width, 1, 0),
		AnchorPoint = AnchorPoint,
		Position = Position,
		GroupTransparency = if UseStateResult then if UseStateResult1 then 0 else Transparency else 1,
		BackgroundColor3 = if BackgroundColor then BackgroundColor.Color else nil,
		BackgroundTransparency = if BackgroundColor then BackgroundColor.Transparency else 1,
		ZIndex = ZIndex
	}, {
		Padding = if PaddingStartEnd then ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, PaddingStartEnd),
			PaddingBottom = UDim.new(0, PaddingStartEnd)
		}) else nil,
		Track = ReactModule.createElement("Frame", {
			Selectable = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			[ReactModule.Change.AbsoluteSize] = UseResult
		}, {
			TrackUICorner = if HandleCornerRadius then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, HandleCornerRadius) }) else nil,
			Handle = ReactModule.createElement("Frame", {
				Active = UseStateResult and UserInteractionEnabled,
				Selectable = false,
				Size = UseMemoResult,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UseMemoResult1,
				BackgroundColor3 = if HandleColor then HandleColor.Color else nil,
				BackgroundTransparency = if HandleColor then HandleColor.Transparency else 0,
				BorderSizePixel = 0,
				[ReactModule.Change.AbsoluteSize] = UseResult1,
				[ReactModule.Event.InputBegan] = UseResult2
			}, {
				HandleUICorner = if HandleCornerRadius then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, HandleCornerRadius) }) else nil,
				Icon = if HandleIcon then ReactModule.createElement(ImageSetComponentModule.Label, {
					Selectable = false,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(HandleIconSize, HandleIconSize),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = HandleIcon,
					ImageColor3 = if HandleIconColor then HandleIconColor.Color else nil,
					ImageTransparency = if HandleIconColor then HandleIconColor.Transparency else nil
				}) else nil
			})
		})
	})
end