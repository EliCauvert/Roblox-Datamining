local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)

return require(CorePackages.Packages.Rodux).createReducer({ grantedAssetsByType = {}, grantedOutfitsByType = {} }, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.GrantAsset).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			grantedAssetsByType = CryoModule.Dictionary.join(p1.grantedAssetsByType, {
				[tostring(p2.assetTypeId)] = CryoModule.List.join({ (tostring(p2.assetId)) }, p1.grantedAssetsByType[tostring(p2.assetTypeId)] or {})
			})
		})
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.RevokeAsset).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			grantedAssetsByType = CryoModule.Dictionary.join(p1.grantedAssetsByType, {
				[tostring(p2.assetTypeId)] = CryoModule.List.removeValue(p1.grantedAssetsByType[tostring(p2.assetTypeId)] or {}, (tostring(p2.assetId)))
			})
		})
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.GrantOutfit).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			grantedOutfitsByType = CryoModule.Dictionary.join(p1.grantedOutfitsByType, {
				[tostring(p2.outfitType)] = CryoModule.List.join({ (tostring(p2.outfitId)) }, p1.grantedOutfitsByType[p2.outfitType] or {})
			})
		})
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.RevokeOutfit).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local GrantedOutfitsByType = {}
		
		for i, value in p1.grantedOutfitsByType do
			GrantedOutfitsByType[i] = CryoModule.List.removeValue(value, (tostring(p2.outfitId)))
		end
		return CryoModule.Dictionary.join(p1, { grantedOutfitsByType = GrantedOutfitsByType })
	end
})