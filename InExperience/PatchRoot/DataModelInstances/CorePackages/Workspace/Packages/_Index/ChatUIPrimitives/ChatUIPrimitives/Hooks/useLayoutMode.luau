local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection

local function _(p1)
	return if p1.PreferredInput == Enum.PreferredInput.Gamepad then "FlyOut" elseif p1.TouchEnabled and not p1.MouseEnabled then "Tray" else "FlyOut"
end

return function(p1)
	-- upvalues: userInputService (ref), reactModule (ref), useEventConnection (ref)
	p1 = p1 or userInputService
	local var1, var2 = reactModule.useState(function()
		-- upvalues: p1 (ref)
		return if p1.PreferredInput == Enum.PreferredInput.Gamepad then "FlyOut" elseif p1.TouchEnabled and not p1.MouseEnabled then "Tray" else "FlyOut"
	end)
	useEventConnection(p1:GetPropertyChangedSignal("PreferredInput"), reactModule.useCallback(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2(if p1.PreferredInput == Enum.PreferredInput.Gamepad then "FlyOut" elseif p1.TouchEnabled and not p1.MouseEnabled then "Tray" else "FlyOut")
	end, { p1 }))
	
	return var1
end