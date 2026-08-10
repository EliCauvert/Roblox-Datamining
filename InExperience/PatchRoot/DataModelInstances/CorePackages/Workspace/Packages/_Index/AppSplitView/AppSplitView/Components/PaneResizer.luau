local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AppSplitView").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens

local function VisualPaneResizer(p0) --[[ line: 22 ]]
	-- upvalues: useTokens (ref), reactModule (ref)
	local var4 = useTokens()
	local lineTopInset = p0.lineTopInset or 0
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Active = false,
		Name = p0.Name or "PaneResizer",
		Position = p0.position,
		Size = UDim2.new(0, p0.hitWidth, 1, 0),
		ZIndex = p0.ZIndex
	}, {
		Line = reactModule.createElement("Frame", {
			Name = "Line",
			BorderSizePixel = 0,
			Active = false,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, lineTopInset),
			Size = UDim2.new(0, 1, 1, -lineTopInset),
			BackgroundColor3 = var4.Color.Stroke.Emphasis.Color3,
			BackgroundTransparency = var4.Color.Stroke.Emphasis.Transparency
		})
	})
end

local function InteractivePaneResizer(p1) --[[ line: 49 ]]
	-- upvalues: useTokens (ref), reactModule (ref), userInputService (ref)
	local var6 = useTokens()
	local name = p1.Name or "PaneResizer"
	local lineTopInset = p1.lineTopInset or 0
	local var9, var10 = reactModule.useBinding(false)
	local var11 = reactModule.useRef(p1.onDrag)
	local var12 = reactModule.useRef(p1.onDragStart)
	local var13 = reactModule.useRef(p1.onDragEnd)
	var11.current = p1.onDrag
	var12.current = p1.onDragStart
	var13.current = p1.onDragEnd
	local var14 = reactModule.useRef(false)
	local var15 = reactModule.useRef(false)
	local var16 = reactModule.useCallback(function() --[[ line: 65 ]]
		-- upvalues: var10 (ref), var14 (ref), var15 (ref)
		var10(var14.current or var15.current)
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
		[reactModule.Event.InputBegan] = reactModule.useCallback(function(_, p2) --[[ line: 69 ]]
			-- upvalues: var14 (ref), var16 (ref), var12 (ref), userInputService (copy), var11 (ref), var13 (ref)
			if p2.UserInputType ~= Enum.UserInputType.MouseButton1 and p2.UserInputType ~= Enum.UserInputType.Touch then return end
			local position = p2.Position
			var14.current = true
			var16()
			
			if var12.current then
				var12.current()
			end
			local _ = nil
			local changedConnection = nil
			local inputChangedConnection = userInputService.InputChanged:Connect(function(p3) --[[ line: 87 ]]
				-- upvalues: var11 (copy), position (write)
				if p3.UserInputType ~= Enum.UserInputType.MouseMovement and p3.UserInputType ~= Enum.UserInputType.Touch then return end
				if var11.current then
					local var19 = p3.Position - position
					position = p3.Position
					var11.current(Vector2.new(var19.X, var19.Y))
				end
			end)
			changedConnection = p2.Changed:Connect(function(p4) --[[ line: 101 ]]
				-- upvalues: p2 (ref), inputChangedConnection (write), changedConnection (write), var14 (copy), var16 (copy), var13 (copy)
				if p4 == "UserInputState" and p2.UserInputState == Enum.UserInputState.End then
					if inputChangedConnection then
						inputChangedConnection:Disconnect()
					end
					if changedConnection then
						changedConnection:Disconnect()
					end
					var14.current = false
					var16()
					
					if var13.current then
						var13.current()
					end
				end
			end)
		end, { var16 }),
		[reactModule.Event.MouseEnter] = reactModule.useCallback(function(_, _) --[[ line: 118 ]]
			-- upvalues: var15 (ref), var16 (ref)
			var15.current = true
			var16()
		end, { var16 }),
		[reactModule.Event.MouseLeave] = reactModule.useCallback(function(_, _) --[[ line: 122 ]]
			-- upvalues: var15 (ref), var16 (ref)
			var15.current = false
			var16()
		end, { var16 })
	}, {
		Line = reactModule.createElement("Frame", {
			Name = "Line",
			BorderSizePixel = 0,
			Active = false,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, lineTopInset),
			Size = UDim2.new(0, 1, 1, -lineTopInset),
			BackgroundColor3 = var9:map(function(p5) --[[ line: 127 ]]
				-- upvalues: var6 (ref)
				return if p5 then var6.Color.System.Emphasis.Color3 else var6.Color.Stroke.Emphasis.Color3
			end),
			BackgroundTransparency = var9:map(function(p6) --[[ line: 130 ]]
				-- upvalues: var6 (ref)
				return if p6 then var6.Color.System.Emphasis.Transparency else var6.Color.Stroke.Emphasis.Transparency
			end)
		})
	})
end

return reactModule.memo(function(p7) --[[ line: 161 | named "PaneResizer" ]]
	-- upvalues: reactModule (ref), VisualPaneResizer (ref), InteractivePaneResizer (ref)
	return if p7.interactive == false then reactModule.createElement(VisualPaneResizer, p7) else reactModule.createElement(InteractivePaneResizer, p7)
end)