local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RoduxModule = require(CorePackages.Packages.Rodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent

return if require(Parent.Flags.FFlagTopBarDeprecateCoreGuiRodux) then nil else RoduxModule.createReducer(if require(RobloxGui.Modules.Flags.FFlagMountCoreGuiBackpack) then {
	[Enum.CoreGuiType.PlayerList] = true,
	[Enum.CoreGuiType.Health] = true,
	[Enum.CoreGuiType.Chat] = true,
	[Enum.CoreGuiType.EmotesMenu] = true
} else {
	[Enum.CoreGuiType.PlayerList] = true,
	[Enum.CoreGuiType.Health] = true,
	[Enum.CoreGuiType.Backpack] = true,
	[Enum.CoreGuiType.Chat] = true,
	[Enum.CoreGuiType.EmotesMenu] = true
}, {
	[require(Parent.Actions.UpdateCoreGuiEnabled).name] = function(List, p1) --[[ Line: 41 ]]
		-- upvalues: CryoModule (copy)
		if p1.coreGuiType ~= Enum.CoreGuiType.All then
			return CryoModule.Dictionary.join(List, { [p1.coreGuiType] = p1.enabled })
		end
		local t = {}
		
		for i, _ in pairs(List) do
			t[i] = p1.enabled
		end
		return t
	end
})