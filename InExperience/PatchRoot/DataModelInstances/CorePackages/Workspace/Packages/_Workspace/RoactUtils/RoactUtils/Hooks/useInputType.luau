local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("RoactUtils").Parent
local ReactModule = require(Parent.React)
local UseExternalEventModule = require(script.Parent.useExternalEvent)
local GetInputGroupFunction = require(Parent.InputType).getInputGroup

return function(p1)
	-- upvalues: UserInputService (copy), GetInputGroupFunction (copy), ReactModule (copy), UseExternalEventModule (copy)
	local P0 = p1 or UserInputService
	
	local function getLastInputType()
		-- upvalues: P0 (copy), GetInputGroupFunction (upval)
		return GetInputGroupFunction((P0:GetLastInputType()))
	end
	
	local UseStateResult, UseStateResult2 = ReactModule.useState(getLastInputType)
	UseExternalEventModule(P0.LastInputTypeChanged, (ReactModule.useCallback(function(p2)
		-- upvalues: GetInputGroupFunction (upval), UseStateResult2 (copy)
		local InputGroup = GetInputGroupFunction(p2)
		
		if InputGroup ~= nil then
			UseStateResult2(InputGroup)
		end
	end)))
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), getLastInputType (copy)
		UseStateResult2(getLastInputType())
	end, {})
	
	return UseStateResult
end