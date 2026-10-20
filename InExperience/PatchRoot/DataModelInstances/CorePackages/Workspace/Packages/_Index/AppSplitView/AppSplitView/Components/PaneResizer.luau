local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("AppSplitView").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

local function VisualPaneResizer(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy)
	local UseTokensResult = UseTokensFunction()
	local LineTopInset = p1.lineTopInset or 0
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Active = false,
		Name = p1.Name or "PaneResizer",
		Position = p1.position,
		Size = UDim2.new(0, p1.hitWidth, 1, 0),
		ZIndex = p1.ZIndex
	}, {
		Line = ReactModule.createElement("Frame", {
			Name = "Line",
			BorderSizePixel = 0,
			Active = false,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, LineTopInset),
			Size = UDim2.new(0, 1, 1, -LineTopInset),
			BackgroundColor3 = UseTokensResult.Color.Stroke.Emphasis.Color3,
			BackgroundTransparency = UseTokensResult.Color.Stroke.Emphasis.Transparency
		})
	})
end

local function InteractivePaneResizer(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UserInputService (copy)
	local UseTokensResult = UseTokensFunction()
	local Name = p1.Name or "PaneResizer"
	local LineTopInset = p1.lineTopInset or 0
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseRefResult = ReactModule.useRef(p1.onDrag)
	local UseRefResult1 = ReactModule.useRef(p1.onDragStart)
	local UseRefResult2 = ReactModule.useRef(p1.onDragEnd)
	UseRefResult.current = p1.onDrag
	UseRefResult1.current = p1.onDragStart
	UseRefResult2.current = p1.onDragEnd
	local UseRefResult3 = ReactModule.useRef(false)
	local UseRefResult4 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseBindingResult2 (copy), UseRefResult3 (copy), UseRefResult4 (copy)
		UseBindingResult2(UseRefResult3.current or UseRefResult4.current)
	end, {})
	
	return ReactModule.createElement("TextButton", {
		Name = Name,
		Text = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Active = true,
		Position = p1.position,
		Size = UDim2.new(0, p1.hitWidth, 1, 0),
		ZIndex = p1.ZIndex,
		[ReactModule.Event.InputBegan] = ReactModule.useCallback(function(_, Input)
			-- upvalues: UseRefResult3 (copy), UseResult (copy), UseRefResult1 (copy), UserInputService (upval), UseRefResult (copy), UseRefResult2 (copy)
			if Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Touch then return end
			local Position = Input.Position
			UseRefResult3.current = true
			UseResult()
			
			if UseRefResult1.current then
				UseRefResult1.current()
			end
			local InputChangedConnection = nil
			local Connection = nil
			InputChangedConnection = UserInputService.InputChanged:Connect(function(Input)
				-- upvalues: UseRefResult (upval), Position (ref)
				if Input.UserInputType ~= Enum.UserInputType.MouseMovement and Input.UserInputType ~= Enum.UserInputType.Touch then return end
				if UseRefResult.current then
					local PositionDelta = Input.Position - Position
					Position = Input.Position
					UseRefResult.current(Vector2.new(PositionDelta.X, PositionDelta.Y))
				end
			end)
			Connection = Input.Changed:Connect(function(p2)
				-- upvalues: Input (copy), InputChangedConnection (ref), Connection (ref), UseRefResult3 (upval), UseResult (upval), UseRefResult2 (upval)
				if p2 == "UserInputState" and Input.UserInputState == Enum.UserInputState.End then
					if InputChangedConnection then
						InputChangedConnection:Disconnect()
					end
					if Connection then
						Connection:Disconnect()
					end
					UseRefResult3.current = false
					UseResult()
					
					if UseRefResult2.current then
						UseRefResult2.current()
					end
				end
			end)
		end, { UseResult }),
		[ReactModule.Event.MouseEnter] = ReactModule.useCallback(function(_, _)
			-- upvalues: UseRefResult4 (copy), UseResult (copy)
			UseRefResult4.current = true
			UseResult()
		end, { UseResult }),
		[ReactModule.Event.MouseLeave] = ReactModule.useCallback(function(_, _)
			-- upvalues: UseRefResult4 (copy), UseResult (copy)
			UseRefResult4.current = false
			UseResult()
		end, { UseResult })
	}, {
		Line = ReactModule.createElement("Frame", {
			Name = "Line",
			BorderSizePixel = 0,
			Active = false,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, LineTopInset),
			Size = UDim2.new(0, 1, 1, -LineTopInset),
			BackgroundColor3 = UseBindingResult:map(function(p2)
				-- upvalues: UseTokensResult (copy)
				return if p2 then UseTokensResult.Color.System.Emphasis.Color3 else UseTokensResult.Color.Stroke.Emphasis.Color3
			end),
			BackgroundTransparency = UseBindingResult:map(function(p2)
				-- upvalues: UseTokensResult (copy)
				return if p2 then UseTokensResult.Color.System.Emphasis.Transparency else UseTokensResult.Color.Stroke.Emphasis.Transparency
			end)
		})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), VisualPaneResizer (copy), InteractivePaneResizer (copy)
	return if p1.interactive == false then ReactModule.createElement(VisualPaneResizer, p1) else ReactModule.createElement(InteractivePaneResizer, p1)
end)