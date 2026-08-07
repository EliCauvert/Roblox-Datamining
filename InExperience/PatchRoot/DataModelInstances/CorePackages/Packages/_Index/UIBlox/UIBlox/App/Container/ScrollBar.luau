local userInputService = game:GetService("UserInputService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.Parent.React)
local _ = require(parent.Style.StyleTypes)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local _ = require(parent.ImageSet.ImagesTypes)

return function(p0) --[[ line: 55 | named "ScrollBar" ]]
	-- upvalues: reactModule (ref), userInputService (ref), imageSetComponentModule (ref)
	local userInteractionEnabled = p0.userInteractionEnabled
	local width = p0.width
	local anchorPoint = p0.anchorPoint
	local position = p0.position
	local zIndex = p0.zIndex
	local transparency = p0.transparency
	local backgroundColor = p0.backgroundColor
	local paddingStartEnd = p0.paddingStartEnd
	local handleWidth = p0.handleWidth
	local handleColor = p0.handleColor
	local handleCornerRadius = p0.handleCornerRadius
	local handleIcon = p0.handleIcon
	local handleIconSize = p0.handleIconSize
	local handleIconColor = p0.handleIconColor
	local onDragging = p0.onDragging
	local viewSize = p0.viewSize
	local canvasSize = p0.canvasSize
	local canvasPosition = p0.canvasPosition
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useBinding(0)
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useRef(0)
	local var10 = reactModule.useRef(0)
	local var11 = reactModule.useCallback(function(p1) --[[ line: 83 ]]
		-- upvalues: var6 (ref)
		var6(p1.AbsoluteSize.Y)
	end, { var6 })
	local var12 = reactModule.useCallback(function(p2) --[[ line: 87 ]]
		-- upvalues: var4 (ref)
		local parent = p2.Parent
		
		if parent == nil or math.ceil(p2.AbsoluteSize.Y) >= parent.AbsoluteSize.Y then
			var4(false)
			
			return
		end
		var4(true)
	end, { var4 })
	local var13 = reactModule.useMemo(function() --[[ line: 96 ]]
		-- upvalues: reactModule (copy), viewSize (ref), canvasSize (ref), handleWidth (ref)
		return reactModule.joinBindings({ viewSize = viewSize, canvasSize = canvasSize }):map(function(p3) --[[ line: 100 ]]
			-- upvalues: handleWidth (copy)
			return UDim2.new(0, handleWidth, math.clamp(p3.viewSize.Y / p3.canvasSize.Y, 0, 1), 0)
		end)
	end, { handleWidth, viewSize, canvasSize })
	local var14 = reactModule.useMemo(function() --[[ line: 108 ]]
		-- upvalues: reactModule (copy), canvasPosition (ref), canvasSize (ref)
		return reactModule.joinBindings({ canvasPosition = canvasPosition, canvasSize = canvasSize }):map(function(p4) --[[ line: 112 ]]
			return UDim2.fromScale(0.5, p4.canvasPosition.Y / p4.canvasSize.Y)
		end)
	end, { canvasSize, canvasPosition })
	local var15 = reactModule.useCallback(function(_, p5) --[[ line: 120 ]]
		-- upvalues: var3 (ref), userInteractionEnabled (ref), var7 (ref), var9 (ref), var10 (ref), canvasPosition (ref), var8 (ref)
		if not var3 or not userInteractionEnabled or var7 then return end
		if p5 and p5.UserInputType == Enum.UserInputType.MouseButton1 then
			var9.current = p5.Position.Y
			var10.current = canvasPosition:getValue().Y
			var8(true)
		end
	end, {
		var3, userInteractionEnabled, var7, var9, var10, canvasPosition, var8
	})
	local var16 = reactModule.useCallback(function(p6) --[[ line: 141 ]]
		-- upvalues: userInteractionEnabled (ref), var7 (ref), var9 (ref), var5 (ref), paddingStartEnd (ref), viewSize (ref), var10 (ref), canvasSize (ref), onDragging (ref)
		if not userInteractionEnabled or not var7 then return end
		if p6.UserInputType == Enum.UserInputType.MouseMovement then
			local y = canvasSize:getValue().Y
			onDragging(math.clamp(var10.current + (p6.Position.Y - var9.current) / (var5:getValue() - paddingStartEnd) * y, 0, y - viewSize:getValue().Y))
			
			return
		end
	end, {
		userInteractionEnabled, var7, var9, var5, paddingStartEnd, viewSize, var10,
		canvasSize, onDragging
	})
	local var17 = reactModule.useCallback(function(p7) --[[ line: 172 ]]
		-- upvalues: userInteractionEnabled (ref), var7 (ref), var8 (ref)
		if not userInteractionEnabled or not var7 then return end
		if p7 and p7.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
		var8(false)
	end, { userInteractionEnabled, var7, var8 })
	reactModule.useEffect(function() --[[ line: 184 ]]
		-- upvalues: var3 (ref), var7 (ref), userInputService (copy), var16 (ref), var17 (ref)
		if var3 and var7 then
			local inputChangedConnection = userInputService.InputChanged:Connect(var16)
			local inputEndedConnection = userInputService.InputEnded:Connect(var17)
			local windowFocusReleasedConnection = userInputService.WindowFocusReleased:Connect(var17)
			
			return function() --[[ line: 193 ]]
				-- upvalues: inputChangedConnection (ref), inputEndedConnection (ref), windowFocusReleasedConnection (ref)
				inputChangedConnection:Disconnect()
				inputEndedConnection:Disconnect()
				windowFocusReleasedConnection:Disconnect()
			end
		end
		return function() --[[ line: 186 ]] end
	end, { var3, var7, var16, var17 })
	local var18 = transparency
	
	if not var3 then
		var18 = 1
	elseif var7 then
		var18 = 0
	end
	return reactModule.createElement("CanvasGroup", {
		Selectable = false,
		BorderSizePixel = 0,
		Size = UDim2.new(0, width, 1, 0),
		AnchorPoint = anchorPoint,
		Position = position,
		GroupTransparency = var18,
		BackgroundColor3 = if backgroundColor then backgroundColor.Color else nil,
		BackgroundTransparency = if backgroundColor then backgroundColor.Transparency else 1,
		ZIndex = zIndex
	}, {
		Padding = if paddingStartEnd then reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, paddingStartEnd),
			PaddingBottom = UDim.new(0, paddingStartEnd)
		}) else nil,
		Track = reactModule.createElement("Frame", {
			Selectable = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			[reactModule.Change.AbsoluteSize] = var11
		}, {
			TrackUICorner = if handleCornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, handleCornerRadius) }) else nil,
			Handle = reactModule.createElement("Frame", {
				Active = var3 and userInteractionEnabled,
				Selectable = false,
				Size = var13,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = var14,
				BackgroundColor3 = if handleColor then handleColor.Color else nil,
				BackgroundTransparency = if handleColor then handleColor.Transparency else 0,
				BorderSizePixel = 0,
				[reactModule.Change.AbsoluteSize] = var12,
				[reactModule.Event.InputBegan] = var15
			}, {
				HandleUICorner = if handleCornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, handleCornerRadius) }) else nil,
				Icon = if handleIcon then reactModule.createElement(imageSetComponentModule.Label, {
					Selectable = false,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(handleIconSize, handleIconSize),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = handleIcon,
					ImageColor3 = if handleIconColor then handleIconColor.Color else nil,
					ImageTransparency = if handleIconColor then handleIconColor.Transparency else nil
				}) else nil
			})
		})
	})
end