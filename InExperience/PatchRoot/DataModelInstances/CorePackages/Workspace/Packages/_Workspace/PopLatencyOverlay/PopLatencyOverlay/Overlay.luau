local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script.Parent.Parent.React)
local CanToggleForProbeModule = require(script.Parent.canToggleForProbe)
local FormatModule = require(script.Parent.format)
local IsToggleChordModule = require(script.Parent.isToggleChord)

return function(p1)
	-- upvalues: ReactModule (copy), UserInputService (copy), IsToggleChordModule (copy), CanToggleForProbeModule (copy), FormatModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local WaitingForFirstProbeRound, WaitingForFirstProbeRound2 = ReactModule.useState("Waiting for first probe round…")
	local IsFailClosedOnProbeCheck = p1.failClosedOnProbeCheck == true
	local AuthorizeToggleFunction = p1.authorizeToggle
	local AuthorizationVersion = p1.authorizationVersion
	local IsDeferServiceUntilToggle = p1.deferServiceUntilToggle == true
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(os.clock())
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			return UseRefResult.current
		end
		local Success, Result = pcall(function()
			return game:GetService("PopLatencyService")
		end)
		
		if Success and Result then
			UseRefResult.current = Result
		else
			warn("[PopLatencyOverlay] PopLatencyService not available in this build")
		end
		return UseRefResult.current
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: IsDeferServiceUntilToggle (copy), UseResult (copy)
		if not IsDeferServiceUntilToggle then
			UseResult()
		end
	end, { UseResult, IsDeferServiceUntilToggle })
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), IsToggleChordModule (upval), UseRefResult (copy), UseResult (copy), CanToggleForProbeModule (upval), IsFailClosedOnProbeCheck (copy), UseStateResult2 (copy), AuthorizeToggleFunction (copy)
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input)
			-- upvalues: IsToggleChordModule (upval), UseRefResult (upval), UseResult (upval), CanToggleForProbeModule (upval), IsFailClosedOnProbeCheck (upval), UseStateResult2 (upval), AuthorizeToggleFunction (upval)
			if not IsToggleChordModule(Input) then return end
			if not CanToggleForProbeModule(UseRefResult.current or UseResult(), IsFailClosedOnProbeCheck) then return end
			local function _()
				-- upvalues: CanToggleForProbeModule (upval), UseRefResult (upval), IsFailClosedOnProbeCheck (upval), UseStateResult2 (upval)
				if CanToggleForProbeModule(UseRefResult.current, IsFailClosedOnProbeCheck) then
					UseStateResult2(function(p2): boolean
						return not p2
					end)
				end
			end
			
			if AuthorizeToggleFunction then
				task.spawn(function()
					-- upvalues: AuthorizeToggleFunction (upval), CanToggleForProbeModule (upval), UseRefResult (upval), IsFailClosedOnProbeCheck (upval), UseStateResult2 (upval)
					if AuthorizeToggleFunction() and CanToggleForProbeModule(UseRefResult.current, IsFailClosedOnProbeCheck) then
						UseStateResult2(function(p2): boolean
							return not p2
						end)
					end
				end)
				
				return
			end
			if CanToggleForProbeModule(UseRefResult.current, IsFailClosedOnProbeCheck) then
				UseStateResult2(function(p2): boolean
					return not p2
				end)
			end
		end)
		
		return function()
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, {
		UseResult,
		AuthorizeToggleFunction,
		IsFailClosedOnProbeCheck
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, { AuthorizationVersion })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult (copy), WaitingForFirstProbeRound2 (copy), FormatModule (upval), UseRefResult1 (copy)
		if not UseStateResult then return end
		local Current = UseRefResult.current
		
		if not Current then
			WaitingForFirstProbeRound2(FormatModule.colorTag(FormatModule.COLOR_RED, FormatModule.escapeRich("PopLatencyService not available in this build.")))
			
			return
		end
		local Flag = true
		task.spawn(function()
			-- upvalues: Flag (ref), Current (copy), WaitingForFirstProbeRound2 (upval), FormatModule (upval), UseRefResult1 (upval)
			while Flag do
				local Success, Result = pcall(function()
					-- upvalues: Current (upval)
					return Current:GetSnapshot()
				end)
				
				if Flag then
					if Success and Result then
						WaitingForFirstProbeRound2(FormatModule.renderSnapshot(Result, Result[1] and Result[1].roundCount or 0, os.clock() - UseRefResult1.current, Result[1] and Result[1].intervalMs or 0))
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
		Size = UDim2.new(0, 960, 0, 660),
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = FormatModule.COLOR_BG
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingRight = UDim.new(0, 8),
			PaddingBottom = UDim.new(0, 6)
		}),
		Stroke = ReactModule.createElement("UIStroke", { Thickness = 1, Color = FormatModule.COLOR_BORDER }),
		Panel = ReactModule.createElement("TextLabel", {
			Name = "Panel",
			BackgroundTransparency = 1,
			RichText = true,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.new(0, 8, 0, 6),
			Size = UDim2.new(0, 944, 0, 648),
			AutomaticSize = Enum.AutomaticSize.XY,
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
			Position = UDim2.new(1, -2, 0, 4),
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