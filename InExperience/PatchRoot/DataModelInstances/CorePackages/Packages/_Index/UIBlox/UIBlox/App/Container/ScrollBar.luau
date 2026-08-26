local userInputService = game:GetService("UserInputService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.Parent.React)
local _ = require(parent.Style.StyleTypes)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local _ = require(parent.ImageSet.ImagesTypes)

return function(p1)
	-- upvalues: reactModule (ref), userInputService (ref), imageSetComponentModule (ref)
	local userInteractionEnabled = p1.userInteractionEnabled
	local width = p1.width
	local anchorPoint = p1.anchorPoint
	local position = p1.position
	local zIndex = p1.zIndex
	local transparency = p1.transparency
	local backgroundColor = p1.backgroundColor
	local paddingStartEnd = p1.paddingStartEnd
	local handleWidth = p1.handleWidth
	local handleColor = p1.handleColor
	local handleCornerRadius = p1.handleCornerRadius
	local handleIcon = p1.handleIcon
	local handleIconSize = p1.handleIconSize
	local handleIconColor = p1.handleIconColor
	local onDragging = p1.onDragging
	local viewSize = p1.viewSize
	local canvasSize = p1.canvasSize
	local canvasPosition = p1.canvasPosition
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useBinding(0)
	local var5, var6 = reactModule.useState(false)
	local var7 = reactModule.useRef(0)
	local var8 = reactModule.useRef(0)
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref)
		var4(p2.AbsoluteSize.Y)
	end, { var4 })
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref)
		local parent = p2.Parent
		
		if parent == nil or math.ceil(p2.AbsoluteSize.Y) >= parent.AbsoluteSize.Y then
			var2(false)
			
			return
		end
		var2(true)
	end, { var2 })
	local var11 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), viewSize (ref), canvasSize (ref), handleWidth (ref)
		return reactModule.joinBindings({ viewSize = viewSize, canvasSize = canvasSize }):map(function(p2)
			-- upvalues: handleWidth (copy)
			return UDim2.new(0, handleWidth, math.clamp(p2.viewSize.Y / p2.canvasSize.Y, 0, 1), 0)
		end)
	end, { handleWidth, viewSize, canvasSize })
	local var12 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), canvasPosition (ref), canvasSize (ref)
		return reactModule.joinBindings({ canvasPosition = canvasPosition, canvasSize = canvasSize }):map(function(p2)
			return UDim2.fromScale(0.5, p2.canvasPosition.Y / p2.canvasSize.Y)
		end)
	end, { canvasSize, canvasPosition })
	local var13 = reactModule.useCallback(function(_, p2)
		-- upvalues: var1 (ref), userInteractionEnabled (ref), var5 (ref), var7 (ref), var8 (ref), canvasPosition (ref), var6 (ref)
		if not var1 or not userInteractionEnabled or var5 then return end
		if p2 and p2.UserInputType == Enum.UserInputType.MouseButton1 then
			var7.current = p2.Position.Y
			var8.current = canvasPosition:getValue().Y
			var6(true)
		end
	end, {
		var1, userInteractionEnabled, var5, var7, var8, canvasPosition, var6
	})
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: userInteractionEnabled (ref), var5 (ref), var7 (ref), var3 (ref), paddingStartEnd (ref), viewSize (ref), var8 (ref), canvasSize (ref), onDragging (ref)
		if not userInteractionEnabled or not var5 then return end
		if p2.UserInputType == Enum.UserInputType.MouseMovement then
			local y = canvasSize:getValue().Y
			onDragging(math.clamp(var8.current + (p2.Position.Y - var7.current) / (var3:getValue() - paddingStartEnd) * y, 0, y - viewSize:getValue().Y))
			
			return
		end
	end, {
		userInteractionEnabled, var5, var7, var3, paddingStartEnd, viewSize, var8,
		canvasSize, onDragging
	})
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: userInteractionEnabled (ref), var5 (ref), var6 (ref)
		if not userInteractionEnabled or not var5 then return end
		if p2 and p2.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
		var6(false)
	end, { userInteractionEnabled, var5, var6 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var5 (ref), userInputService (copy), var14 (ref), var15 (ref)
		if var1 and var5 then
			local inputChangedConnection = userInputService.InputChanged:Connect(var14)
			local inputEndedConnection = userInputService.InputEnded:Connect(var15)
			local windowFocusReleasedConnection = userInputService.WindowFocusReleased:Connect(var15)
			
			return function()
				-- upvalues: inputChangedConnection (ref), inputEndedConnection (ref), windowFocusReleasedConnection (ref)
				inputChangedConnection:Disconnect()
				inputEndedConnection:Disconnect()
				windowFocusReleasedConnection:Disconnect()
			end
		end
		return function() end
	end, { var1, var5, var14, var15 })
	local var16 = transparency
	
	if not var1 then
		var16 = 1
	elseif var5 then
		var16 = 0
	end
	return reactModule.createElement("CanvasGroup", {
		Selectable = false,
		BorderSizePixel = 0,
		Size = UDim2.new(0, width, 1, 0),
		AnchorPoint = anchorPoint,
		Position = position,
		GroupTransparency = var16,
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
			[reactModule.Change.AbsoluteSize] = var9
		}, {
			TrackUICorner = if handleCornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, handleCornerRadius) }) else nil,
			Handle = reactModule.createElement("Frame", {
				Active = var1 and userInteractionEnabled,
				Selectable = false,
				Size = var11,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = var12,
				BackgroundColor3 = if handleColor then handleColor.Color else nil,
				BackgroundTransparency = if handleColor then handleColor.Transparency else 0,
				BorderSizePixel = 0,
				[reactModule.Change.AbsoluteSize] = var10,
				[reactModule.Event.InputBegan] = var13
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