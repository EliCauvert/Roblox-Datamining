local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(Modules.AvatarExperience.Common.Types)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetOutfitInfo).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [tostring(p2.outfit.outfitId)] = p2.outfit })
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.RevokeOutfit).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [tostring(p2.outfitId)] = CryoModule.None })
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.UpdateOutfit).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [tostring(p2.outfitId)] = CryoModule.None })
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.OutfitRenamed).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local v1 = p1[p2.outfitId]
		
		return if v1 then CryoModule.Dictionary.join(p1, {
			[p2.outfitId] = CryoModule.Dictionary.join(v1, { name = p2.name })
		}) else p1
	end,
	[require(Modules.AvatarExperience.Common.Actions.OutfitInformationReceived).name] = if require(Modules.AvatarExperience.Experiments.AXCombineGetOutfitDispatchesIXP).isEnabled() then function(Tbl, p1)
		local Copy = table.clone(Tbl)
		
		for i, outfit in p1.outfits do
			Copy[i] = outfit.outfitInfo
		end
		return Copy
	end else nil
})