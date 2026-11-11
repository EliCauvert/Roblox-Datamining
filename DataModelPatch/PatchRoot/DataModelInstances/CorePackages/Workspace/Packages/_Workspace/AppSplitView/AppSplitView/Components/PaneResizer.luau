local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("AppSplitView").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UserInputService (copy)
	local UseTokensResult = UseTokensFunction()
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
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			Size = UDim2.new(0, UseTokensResult.Stroke.Thicker, 1, 0),
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
end)