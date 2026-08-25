local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local useExternalEvent = require(parent.RoactUtils).Hooks.useExternalEvent

return function(p0, p1, p2)
	-- upvalues: useExternalEvent (ref), userInputService (ref), cryoModule (ref)
	useExternalEvent(userInputService.InputBegan, function(p3)
		-- upvalues: p0 (ref), p1 (ref)
		if p3.KeyCode == p0.keyCode and (p0.modifierKey == nil or p3:IsModifierKeyDown(p0.modifierKey)) then
			p1()
		end
	end, cryoModule.List.join({ p0 }, { p1 }, p2))
end