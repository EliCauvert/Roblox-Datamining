local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent

return if require(parent.Flags.FFlagTopBarDeprecateCoreGuiRodux) then nil else roduxModule.createReducer(if require(robloxGui.Modules.Flags.FFlagMountCoreGuiBackpack) then {
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
	[require(parent.Actions.UpdateCoreGuiEnabled).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		if p2.coreGuiType ~= Enum.CoreGuiType.All then
			return cryoModule.Dictionary.join(p1, { [p2.coreGuiType] = p2.enabled })
		end
		local t = {}
		
		for i, v in pairs(p1) do
			t[i] = p2.enabled
		end
		return t
	end
})