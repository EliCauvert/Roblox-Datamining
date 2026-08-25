local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactUtilsModule = require(parent_1.ReactUtils)
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent_1.React)
local useEventConnection = reactUtilsModule.useEventConnection
local inputUtilitiesModule = require(parent.Utils.InputUtilities)

return function()
	-- upvalues: reactModule (ref), inputUtilitiesModule (ref), useEventConnection (ref), userInputService (ref)
	local var4, var5 = reactModule.useState(false)
	local var6 = reactModule.useCallback(function(p0)
		-- upvalues: inputUtilitiesModule (copy), var5 (ref)
		if inputUtilitiesModule.isTouchInput(p0) then
			var5(false)
		end
	end, { var5 })
	useEventConnection(userInputService.InputBegan, reactModule.useCallback(function(p1)
		-- upvalues: inputUtilitiesModule (copy), var5 (ref)
		if inputUtilitiesModule.isTouchInput(p1) then
			var5(true)
		end
	end, { var5 }))
	useEventConnection(userInputService.InputEnded, var6)
	
	return var4
end