local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local useExternalEvent = require(parent.RoactUtils).Hooks.useExternalEvent

return function(p1, p2, p3)
	-- upvalues: useExternalEvent (ref), userInputService (ref), cryoModule (ref)
	useExternalEvent(userInputService.InputBegan, function(p4)
		-- upvalues: p1 (ref), p2 (ref)
		if p4.KeyCode == p1.keyCode and (p1.modifierKey == nil or p4:IsModifierKeyDown(p1.modifierKey)) then
			p2()
		end
	end, cryoModule.List.join({ p1 }, { p2 }, p3))
end