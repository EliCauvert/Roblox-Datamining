local UserInputService = game:GetService("UserInputService")
local ReactModule = require(game:GetService("CorePackages").Packages._Index.Foundation.Foundation.Parent.React)

local function _(KeyCode): boolean
	return KeyCode == Enum.KeyCode.Return or KeyCode == Enum.KeyCode.KeypadEnter
end

return function(p1)
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy)
		if UseRefResult1.current then
			UseRefResult1.current:Disconnect()
			UseRefResult1.current = nil
		end
		UseRefResult.current = false
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseRefResult (copy), UseRefResult1 (copy), UserInputService (upval)
		if p1.enabled and not UseRefResult.current then
			UseRefResult1.current = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
				-- upvalues: p1 (upval), UserInputService (upval)
				local KeyCode = Input.KeyCode
				
				if KeyCode == Enum.KeyCode.Return or KeyCode == Enum.KeyCode.KeypadEnter then
					p1.onReturnPressed(GameProcessed, UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift))
				end
			end)
			UseRefResult.current = true
			
			return
		end
	end, { p1.enabled, p1.onReturnPressed })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		return function()
			-- upvalues: UseResult (upval)
			UseResult()
		end
	end, { UseResult })
	
	return { connect = UseResult1, disconnect = UseResult }
end