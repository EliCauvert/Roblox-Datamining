local userInputService = game:GetService("UserInputService")
local reactModule = require(game:GetService("CorePackages").Packages._Index.Foundation.Foundation.Parent.React)

local function _(p1)
	return if p1 ~= Enum.KeyCode.Return then p1 == Enum.KeyCode.KeypadEnter else true
end

return function(p1)
	-- upvalues: reactModule (ref), userInputService (ref)
	local var1 = reactModule.useRef(false)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var1 (ref)
		if var2.current then
			var2.current:Disconnect()
			var2.current = nil
		end
		var1.current = false
	end, {})
	local var4 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var1 (ref), var2 (ref), userInputService (copy)
		if p1.enabled and not var1.current then
			var2.current = userInputService.InputBegan:Connect(function(p2, p3)
				-- upvalues: p1 (copy), userInputService (copy)
				local keyCode = p2.KeyCode
				
				if if keyCode ~= Enum.KeyCode.Return then keyCode == Enum.KeyCode.KeypadEnter else true then
					p1.onReturnPressed(p3, userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift))
				end
			end)
			var1.current = true
			
			return
		end
	end, { p1.enabled, p1.onReturnPressed })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		return function()
			-- upvalues: var3 (copy)
			var3()
		end
	end, { var3 })
	
	return { connect = var4, disconnect = var3 }
end