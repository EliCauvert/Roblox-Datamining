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
	[require(parent.Actions.UpdateCoreGuiEnabled).name] = function(p0, p1) --[[ line: 41 ]]
		-- upvalues: cryoModule (ref)
		if p1.coreGuiType ~= Enum.CoreGuiType.All then
			return cryoModule.Dictionary.join(p0, { [p1.coreGuiType] = p1.enabled })
		end
		local t = {}
		
		for i, v in pairs(p0) do
			t[i] = p1.enabled
		end
		return t
	end
})