local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script.Parent.Parent.React)
local FormatModule = require(script.Parent.format)
local L = Enum.KeyCode.L

return function()
	-- upvalues: ReactModule (copy), UserInputService (copy), L (copy), FormatModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local WaitingForFirstProbeRound, WaitingForFirstProbeRound2 = ReactModule.useState("Waiting for first probe round…")
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef(0)
	local UseRefResult3 = ReactModule.useRef(os.clock())
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		local Success, Result = pcall(function()
			return game:GetService("PopLatencyService")
		end)
		
		if Success and Result then
			UseRefResult.current = Result
			
			return
		else
			warn("[PopLatencyOverlay] PopLatencyService not available in this build")
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), L (upval), UseRefResult (copy), UseStateResult2 (copy)
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input)
			-- upvalues: L (upval), UserInputService (upval), UseRefResult (upval), UseStateResult2 (upval)
			if Input.KeyCode ~= L then return end
			local IsKeyDown = UserInputService:IsKeyDown(Enum.KeyCode.LeftMeta) or (UserInputService:IsKeyDown(Enum.KeyCode.RightMeta) or (UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl)))
			
			if not UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and not UserInputService:IsKeyDown(Enum.KeyCode.RightShift) or not IsKeyDown then return end
			local Current = UseRefResult.current
			
			if Current then
				local Success, Result = pcall(function()
					-- upvalues: Current (copy)
					return Current:IsEnabled()
				end)
				
				if Success and not Result then return end
			end
			UseStateResult2(function(p1): boolean
				return not p1
			end)
		end)
		
		return function()
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult (copy), WaitingForFirstProbeRound2 (copy), FormatModule (upval), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy)
		if not UseStateResult then return end
		local Current = UseRefResult.current
		
		if not Current then
			WaitingForFirstProbeRound2(FormatModule.colorTag(FormatModule.COLOR_RED, FormatModule.escapeRich("PopLatencyService not available in this build.")))
			
			return
		end
		local Flag = true
		task.spawn(function()
			-- upvalues: Flag (ref), Current (copy), FormatModule (upval), UseRefResult1 (upval), UseRefResult2 (upval), WaitingForFirstProbeRound2 (upval), UseRefResult3 (upval)
			while Flag do
				local Success, Result = pcall(function()
					-- upvalues: Current (upval)
					return Current:GetSnapshot()
				end)
				
				if Flag then
					if Success and Result then
						for _, value in ipairs(Result) do
							FormatModule.appendHistory(UseRefResult1.current, tostring(value.popCode or "?"), value.rttMs or -1)
						end
						UseRefResult2.current += 1
						WaitingForFirstProbeRound2(FormatModule.renderSnapshot(Result, UseRefResult1.current, UseRefResult2.current, os.clock() - UseRefResult3.current))
					elseif not Success then
						WaitingForFirstProbeRound2(FormatModule.colorTag(FormatModule.COLOR_RED, FormatModule.escapeRich("error: " .. tostring(Result))))
					end
				end
				task.wait(FormatModule.POLL_INTERVAL_SECONDS)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = false
		end
	end, { UseStateResult })
	
	return if UseStateResult then ReactModule.createElement("Frame", {
		Name = "Container",
		BackgroundTransparency = 0.05,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 880, 0, 660),
		BackgroundColor3 = FormatModule.COLOR_BG
	}, {
		Stroke = ReactModule.createElement("UIStroke", { Thickness = 1, Color = FormatModule.COLOR_BORDER }),
		Panel = ReactModule.createElement("TextLabel", {
			Name = "Panel",
			BackgroundTransparency = 1,
			RichText = true,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.new(0, 8, 0, 6),
			Size = UDim2.new(1, -16, 1, -12),
			Font = Enum.Font.Code,
			TextSize = FormatModule.TEXT_SIZE,
			TextColor3 = FormatModule.COLOR_HEADER,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Text = WaitingForFirstProbeRound
		}),
		Close = ReactModule.createElement("TextButton", {
			Name = "Close",
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -10, 0, 4),
			Size = UDim2.new(0, 22, 0, 22),
			BackgroundTransparency = 1,
			Font = Enum.Font.Code,
			TextSize = 18,
			TextColor3 = FormatModule.COLOR_CLOSE,
			Text = "×",
			AutoButtonColor = false,
			[ReactModule.Event.Activated] = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end
		})
	}) else nil
end