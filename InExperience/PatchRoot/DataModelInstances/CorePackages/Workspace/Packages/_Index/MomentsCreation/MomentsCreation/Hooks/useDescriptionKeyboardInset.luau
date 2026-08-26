local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local reactModule = require(momentsCreation.Parent.React)
local userInputService = game:GetService("UserInputService")
local computeKeyboardInsetModule = require(momentsCreation.Utils.computeKeyboardInset)

return function(value)
	-- upvalues: reactModule (ref), computeKeyboardInsetModule (ref), userInputService (ref)
	local var1, var2 = reactModule.useBinding(0)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), computeKeyboardInsetModule (copy), value (ref), userInputService (copy), var2 (ref)
		local current = var3.current
		var2(computeKeyboardInsetModule(value, userInputService.OnScreenKeyboardVisible, userInputService.OnScreenKeyboardPosition.Y, if current ~= nil then 0 else current.AbsolutePosition.Y + current.AbsoluteSize.Y, userInputService.OnScreenKeyboardSize.Y))
	end, { value })
	local var5 = reactModule.useCallback(function(p1)
		-- upvalues: var3 (ref), var4 (ref)
		var3.current = p1
		var4()
	end, { var4 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), value (ref), userInputService (copy)
		var4()
		
		if value then
			local list = {
				userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var4),
				userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(var4),
				userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(var4)
			}
			
			return function()
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end
	end, { value, var4 })
	
	return var1, var5
end