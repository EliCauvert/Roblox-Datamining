local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("AppChat").Parent
local CryoModule = require(Parent.Cryo)
local UseExternalEventFunction = require(Parent.RoactUtils).Hooks.useExternalEvent

return function(p1, Callback, p2) --[[ Line: 15 | Named "useKeybind" ]]
	-- upvalues: UseExternalEventFunction (copy), UserInputService (copy), CryoModule (copy)
	UseExternalEventFunction(UserInputService.InputBegan, function(Input) --[[ Line: 16 ]]
		-- upvalues: p1 (copy), Callback (copy)
		if Input.KeyCode == p1.keyCode and (p1.modifierKey == nil or Input:IsModifierKeyDown(p1.modifierKey)) then
			Callback()
		end
	end, CryoModule.List.join({ p1 }, { Callback }, p2))
end