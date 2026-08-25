local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local reactModule = require(momentsCreation.Parent.React)
local userInputService = game:GetService("UserInputService")
local computeKeyboardInsetModule = require(momentsCreation.Utils.computeKeyboardInset)

return function(value)
	-- upvalues: reactModule (ref), computeKeyboardInsetModule (ref), userInputService (ref)
	local var4, var5 = reactModule.useBinding(0)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), computeKeyboardInsetModule (copy), value (ref), userInputService (copy), var5 (ref)
		local current = var6.current
		var5(computeKeyboardInsetModule(value, userInputService.OnScreenKeyboardVisible, userInputService.OnScreenKeyboardPosition.Y, if current ~= nil then 0 else current.AbsolutePosition.Y + current.AbsoluteSize.Y, userInputService.OnScreenKeyboardSize.Y))
	end, { value })
	local var8 = reactModule.useCallback(function(p0)
		-- upvalues: var6 (ref), var7 (ref)
		var6.current = p0
		var7()
	end, { var7 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), value (ref), userInputService (copy)
		var7()
		
		if value then
			local list = {
				userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var7),
				userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(var7),
				userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(var7)
			}
			
			return function()
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end
	end, { value, var7 })
	
	return var4, var8
end