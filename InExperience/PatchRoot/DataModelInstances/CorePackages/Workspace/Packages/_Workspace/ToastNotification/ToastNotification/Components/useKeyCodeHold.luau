local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReactModule = require(script:FindFirstAncestor("ToastNotification").Parent.React)

return function(KeyCode, p1, p2, Callback, p3)
	-- upvalues: ReactModule (copy), UserInputService (copy), RunService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: p3 (copy), UserInputService (upval), KeyCode (copy), UseStateResult2 (copy)
		if p3 then return end
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
			-- upvalues: KeyCode (upval), UseStateResult2 (upval)
			if GameProcessed then return end
			if Input.KeyCode == KeyCode then
				UseStateResult2(true)
			end
		end)
		local InputEndedConnection = UserInputService.InputEnded:Connect(function(Input)
			-- upvalues: KeyCode (upval), UseStateResult2 (upval)
			if Input.KeyCode == KeyCode then
				UseStateResult2(false)
			end
		end)
		
		return function()
			-- upvalues: InputBeganConnection (copy), InputEndedConnection (copy), UseStateResult2 (upval)
			InputBeganConnection:Disconnect()
			InputEndedConnection:Disconnect()
			UseStateResult2(false)
		end
	end, { p3, KeyCode })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult (copy), RunService (upval), p1 (copy), p2 (copy), Callback (copy), UseBindingResult2 (copy)
		if not UseStateResult then return end
		local function _()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				UseRefResult.current:Disconnect()
				UseRefResult.current = nil
			end
		end
		
		local Total = 0
		UseRefResult.current = RunService.Heartbeat:Connect(function(DeltaTime)
			-- upvalues: Total (ref), p1 (upval), p2 (upval), UseRefResult (upval), Callback (upval), UseBindingResult2 (upval)
			Total += DeltaTime
			
			if Total < p1 then return end
			if p2 == 0 then
				if UseRefResult.current then
					UseRefResult.current:Disconnect()
					UseRefResult.current = nil
				end
				Callback()
				
				return
			else
				local ClampedValue = math.clamp((Total - p1) / p2, 0, 1)
				UseBindingResult2(ClampedValue)
				
				if ClampedValue >= 1 then
					if UseRefResult.current then
						UseRefResult.current:Disconnect()
						UseRefResult.current = nil
					end
					Callback()
				end
			end
		end)
		
		return function()
			-- upvalues: UseRefResult (upval), UseBindingResult2 (upval)
			if UseRefResult.current then
				UseRefResult.current:Disconnect()
				UseRefResult.current = nil
			end
			UseBindingResult2(0)
		end
	end, { UseStateResult, Callback, p1, p2 })
	
	return {
		holding = UseStateResult,
		holdProgress = UseBindingResult
	}
end