local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent1.React)
local UseEventConnectionFunction = require(Parent1.ReactUtils).useEventConnection
local InputUtilitiesModule = require(Parent.Utils.InputUtilities)

return function() --[[ Line: 13 ]]
	-- upvalues: ReactModule (copy), InputUtilitiesModule (copy), UseEventConnectionFunction (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(p1) --[[ Line: 22 ]]
		-- upvalues: InputUtilitiesModule (upval), UseStateResult2 (copy)
		if InputUtilitiesModule.isTouchInput(p1) then
			UseStateResult2(false)
		end
	end, { UseStateResult2 })
	UseEventConnectionFunction(UserInputService.InputBegan, (ReactModule.useCallback(function(p1) --[[ Line: 16 ]]
		-- upvalues: InputUtilitiesModule (upval), UseStateResult2 (copy)
		if InputUtilitiesModule.isTouchInput(p1) then
			UseStateResult2(true)
		end
	end, { UseStateResult2 })))
	UseEventConnectionFunction(UserInputService.InputEnded, UseResult)
	
	return UseStateResult
end