local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AppSplitView").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens

local function VisualPaneResizer(p1)
	-- upvalues: useTokens (ref), reactModule (ref)
	local var1 = useTokens()
	local lineTopInset = p1.lineTopInset or 0
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Active = false,
		Name = p1.Name or "PaneResizer",
		Position = p1.position,
		Size = UDim2.new(0, p1.hitWidth, 1, 0),
		ZIndex = p1.ZIndex
	}, {
		Line = reactModule.createElement("Frame", {
			Name = "Line",
			BorderSizePixel = 0,
			Active = false,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, lineTopInset),
			Size = UDim2.new(0, 1, 1, -lineTopInset),
			BackgroundColor3 = var1.Color.Stroke.Emphasis.Color3,
			BackgroundTransparency = var1.Color.Stroke.Emphasis.Transparency
		})
	})
end

local function InteractivePaneResizer(p1)
	-- upvalues: useTokens (ref), reactModule (ref), userInputService (ref)
	local var1 = useTokens()
	local name = p1.Name or "PaneResizer"
	local lineTopInset = p1.lineTopInset or 0
	local var2, var3 = reactModule.useBinding(false)
	local var4 = reactModule.useRef(p1.onDrag)
	local var5 = reactModule.useRef(p1.onDragStart)
	local var6 = reactModule.useRef(p1.onDragEnd)
	var4.current = p1.onDrag
	var5.current = p1.onDragStart
	var6.current = p1.onDragEnd
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useRef(false)
	local var9 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var7 (ref), var8 (ref)
		var3(var7.current or var8.current)
	end, {})
	
	return reactModule.createElement("TextButton", {
		Name = name,
		Text = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Active = true,
		Position = p1.position,
		Size = UDim2.new(0, p1.hitWidth, 1, 0),
		ZIndex = p1.ZIndex,
		[reactModule.Event.InputBegan] = reactModule.useCallback(function(_, p2)
			-- upvalues: var7 (ref), var9 (ref), var5 (ref), userInputService (copy), var4 (ref), var6 (ref)
			if p2.UserInputType ~= Enum.UserInputType.MouseButton1 and p2.UserInputType ~= Enum.UserInputType.Touch then return end
			local position = p2.Position
			var7.current = true
			var9()
			
			if var5.current then
				var5.current()
			end
			local _ = nil
			local changedConnection = nil
			local inputChangedConnection = userInputService.InputChanged:Connect(function(p3)
				-- upvalues: var4 (copy), position (write)
				if p3.UserInputType ~= Enum.UserInputType.MouseMovement and p3.UserInputType ~= Enum.UserInputType.Touch then return end
				if var4.current then
					local var10 = p3.Position - position
					position = p3.Position
					var4.current(Vector2.new(var10.X, var10.Y))
				end
			end)
			changedConnection = p2.Changed:Connect(function(p3)
				-- upvalues: p2 (ref), inputChangedConnection (write), changedConnection (write), var7 (copy), var9 (copy), var6 (copy)
				if p3 == "UserInputState" and p2.UserInputState == Enum.UserInputState.End then
					if inputChangedConnection then
						inputChangedConnection:Disconnect()
					end
					if changedConnection then
						changedConnection:Disconnect()
					end
					var7.current = false
					var9()
					
					if var6.current then
						var6.current()
					end
				end
			end)
		end, { var9 }),
		[reactModule.Event.MouseEnter] = reactModule.useCallback(function(_, _)
			-- upvalues: var8 (ref), var9 (ref)
			var8.current = true
			var9()
		end, { var9 }),
		[reactModule.Event.MouseLeave] = reactModule.useCallback(function(_, _)
			-- upvalues: var8 (ref), var9 (ref)
			var8.current = false
			var9()
		end, { var9 })
	}, {
		Line = reactModule.createElement("Frame", {
			Name = "Line",
			BorderSizePixel = 0,
			Active = false,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, lineTopInset),
			Size = UDim2.new(0, 1, 1, -lineTopInset),
			BackgroundColor3 = var2:map(function(p2)
				-- upvalues: var1 (ref)
				return if p2 then var1.Color.System.Emphasis.Color3 else var1.Color.Stroke.Emphasis.Color3
			end),
			BackgroundTransparency = var2:map(function(p2)
				-- upvalues: var1 (ref)
				return if p2 then var1.Color.System.Emphasis.Transparency else var1.Color.Stroke.Emphasis.Transparency
			end)
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), VisualPaneResizer (ref), InteractivePaneResizer (ref)
	return if p1.interactive == false then reactModule.createElement(VisualPaneResizer, p1) else reactModule.createElement(InteractivePaneResizer, p1)
end)