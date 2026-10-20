local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection

local function _(UserInputService): string
	return if UserInputService.PreferredInput == Enum.PreferredInput.Gamepad then "FlyOut" elseif UserInputService.TouchEnabled and not UserInputService.MouseEnabled then "Tray" else "FlyOut"
end

return function(p1)
	-- upvalues: UserInputService (copy), ReactModule (copy), UseEventConnectionFunction (copy)
	local P1 = p1 or UserInputService
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): string
		-- upvalues: P1 (copy)
		return if P1.PreferredInput == Enum.PreferredInput.Gamepad then "FlyOut" elseif P1.TouchEnabled and not P1.MouseEnabled then "Tray" else "FlyOut"
	end)
	UseEventConnectionFunction(P1:GetPropertyChangedSignal("PreferredInput"), (ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), P1 (copy)
		UseStateResult2(if P1.PreferredInput == Enum.PreferredInput.Gamepad then "FlyOut" elseif P1.TouchEnabled and not P1.MouseEnabled then "Tray" else "FlyOut")
	end, { P1 })))
	
	return UseStateResult
end