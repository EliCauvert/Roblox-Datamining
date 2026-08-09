local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local reactModule = require(momentsCreation.Parent.React)
local userInputService = game:GetService("UserInputService")
local computeKeyboardInsetModule = require(momentsCreation.Utils.computeKeyboardInset)
local getFFlagMomentsDescriptionKeyboardAvoidanceFixModule = require(momentsCreation.Flags.GetFFlagMomentsDescriptionKeyboardAvoidanceFix)

return function(value) --[[ line: 33 | named "useDescriptionKeyboardInset" ]]
	-- upvalues: getFFlagMomentsDescriptionKeyboardAvoidanceFixModule (ref), reactModule (ref), computeKeyboardInsetModule (ref), userInputService (ref)
	local var5 = getFFlagMomentsDescriptionKeyboardAvoidanceFixModule()
	local var6, var7 = reactModule.useBinding(0)
	local var8, var9 = reactModule.useState(0)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useCallback(function() --[[ line: 42 ]]
		-- upvalues: var10 (ref), computeKeyboardInsetModule (copy), value (ref), userInputService (copy), var5 (ref), var7 (ref), var9 (ref)
		local current = var10.current
		local var13 = computeKeyboardInsetModule(value, userInputService.OnScreenKeyboardVisible, userInputService.OnScreenKeyboardPosition.Y, if current ~= nil then 0 else current.AbsolutePosition.Y + current.AbsoluteSize.Y, if var5 then userInputService.OnScreenKeyboardSize.Y else 1e999)
		
		if var5 then
			var7(var13)
			
			return
		end
		var9(var13)
	end, { value, var5 })
	local var12 = reactModule.useCallback(function(p0) --[[ line: 63 ]]
		-- upvalues: var10 (ref), var11 (ref)
		var10.current = p0
		var11()
	end, { var11 })
	reactModule.useEffect(function() --[[ line: 68 ]]
		-- upvalues: var11 (ref), value (ref), userInputService (copy)
		var11()
		
		if value then
			local list = {
				userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var11),
				userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(var11),
				userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(var11)
			}
			
			return function() --[[ line: 80 ]]
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end
	end, { value, var11 })
	
	return if var5 then var6 else var8, var12
end