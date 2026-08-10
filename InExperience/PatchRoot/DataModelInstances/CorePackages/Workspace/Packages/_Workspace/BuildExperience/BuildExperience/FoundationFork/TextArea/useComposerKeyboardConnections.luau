local userInputService = game:GetService("UserInputService")
local reactModule = require(game:GetService("CorePackages").Packages._Index.Foundation.Foundation.Parent.React)

local function _(p0) --[[ line: 13 | named "isReturnKey" ]]
	return if p0 ~= Enum.KeyCode.Return then p0 == Enum.KeyCode.KeypadEnter else true
end

return function(p1) --[[ line: 17 | named "useComposerKeyboardConnections" ]]
	-- upvalues: reactModule (ref), userInputService (ref)
	local var2 = reactModule.useRef(false)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useCallback(function() --[[ line: 21 ]]
		-- upvalues: var3 (ref), var2 (ref)
		if var3.current then
			var3.current:Disconnect()
			var3.current = nil
		end
		var2.current = false
	end, {})
	local var5 = reactModule.useCallback(function() --[[ line: 29 ]]
		-- upvalues: p1 (ref), var2 (ref), var3 (ref), userInputService (copy)
		if p1.enabled and not var2.current then
			var3.current = userInputService.InputBegan:Connect(function(p2, p3) --[[ line: 35 ]]
				-- upvalues: p1 (copy), userInputService (copy)
				local keyCode = p2.KeyCode
				
				if if keyCode ~= Enum.KeyCode.Return then keyCode == Enum.KeyCode.KeypadEnter else true then
					p1.onReturnPressed(p3, userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift))
				end
			end)
			var2.current = true
			
			return
		end
	end, { p1.enabled, p1.onReturnPressed })
	reactModule.useEffect(function() --[[ line: 48 ]]
		-- upvalues: var4 (ref)
		return function() --[[ line: 49 ]]
			-- upvalues: var4 (copy)
			var4()
		end
	end, { var4 })
	
	return { connect = var5, disconnect = var4 }
end