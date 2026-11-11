local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UpdateOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Actions.UpdateOutfit)
local GetOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfit)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local _ = require(Modules.AvatarExperience.Common.Types)
local FFlagAXFixMakeupLookGrantOutfitHoisting = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixMakeupLookGrantOutfitHoisting

return function(p1, p2)
	-- upvalues: ArgCheckModule (copy), FFlagAXFixMakeupLookGrantOutfitHoisting (copy), UpdateOutfitModule (copy), GetOutfitModule (copy)
	ArgCheckModule.isType(p1, "string", "UpdateOutfit thunk expects outfitId to be a string")
	
	return function(p3)
		-- upvalues: p1 (copy), FFlagAXFixMakeupLookGrantOutfitHoisting (upval), UpdateOutfitModule (upval), GetOutfitModule (upval), p2 (copy)
		local OutfitInfo = p3:getState().AvatarExperience.AvatarEditor.OutfitInfos[p1]
		local v1 = (OutfitInfo and OutfitInfo.updateCounter or 0) + 1
		local OutfitType = FFlagAXFixMakeupLookGrantOutfitHoisting and (OutfitInfo and OutfitInfo.outfitType) or nil
		p3:dispatch(UpdateOutfitModule(p1, OutfitInfo and OutfitInfo.isEditable or nil, if FFlagAXFixMakeupLookGrantOutfitHoisting then OutfitType else nil))
		p3:dispatch(GetOutfitModule(p1, v1, nil, p2))
	end
end