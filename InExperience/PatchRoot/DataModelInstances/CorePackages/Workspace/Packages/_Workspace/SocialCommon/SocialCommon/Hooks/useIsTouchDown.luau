local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactUtilsModule = require(parent_1.ReactUtils)
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent_1.React)
local useEventConnection = reactUtilsModule.useEventConnection
local inputUtilitiesModule = require(parent.Utils.InputUtilities)

return function()
	-- upvalues: reactModule (ref), inputUtilitiesModule (ref), useEventConnection (ref), userInputService (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useCallback(function(p1)
		-- upvalues: inputUtilitiesModule (copy), var2 (ref)
		if inputUtilitiesModule.isTouchInput(p1) then
			var2(false)
		end
	end, { var2 })
	useEventConnection(userInputService.InputBegan, reactModule.useCallback(function(p1)
		-- upvalues: inputUtilitiesModule (copy), var2 (ref)
		if inputUtilitiesModule.isTouchInput(p1) then
			var2(true)
		end
	end, { var2 }))
	useEventConnection(userInputService.InputEnded, var3)
	
	return var1
end