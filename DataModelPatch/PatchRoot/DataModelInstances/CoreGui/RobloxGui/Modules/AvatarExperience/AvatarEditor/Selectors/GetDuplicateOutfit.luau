local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local _ = require(Modules.AvatarExperience.AvatarEditor.Reducers.Character)
local _ = require(Modules.AvatarExperience.Common.Types)
local FFlagAXBackgroundsOutfitPersistence = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXBackgroundsOutfitPersistence
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local SelectActiveBackgroundFunction = AvatarExperienceCommonModule.Backgrounds.selectActiveBackground
local NOBACKGROUNDASSETID = AvatarExperienceCommonModule.Backgrounds.NO_BACKGROUND_ASSET_ID

local function _(NOBACKGROUNDASSETID1)
	-- upvalues: NOBACKGROUNDASSETID (copy)
	return if NOBACKGROUNDASSETID1 == nil or NOBACKGROUNDASSETID1 == NOBACKGROUNDASSETID then nil else NOBACKGROUNDASSETID1
end

local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(p1, p2, p3, p4)
	-- upvalues: UtilsModule (copy)
	return UtilsModule.getIdOfOutfitBeingWorn(p2, p4, p3) or UtilsModule.getIdOfOutfitBeingWorn(p1, p4, p3)
end)

return function(p1)
	-- upvalues: ConstantsModule (copy), MemoizeResult (copy), FFlagAXBackgroundsOutfitPersistence (copy), SelectActiveBackgroundFunction (copy), NOBACKGROUNDASSETID (copy)
	local OwnedItemIdsBySubtype = p1.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype
	local OutfitInfos = p1.AvatarExperience.AvatarEditor.OutfitInfos
	local MemoizeResultResult = MemoizeResult(OwnedItemIdsBySubtype[ConstantsModule.PurchasedCharacterKey] or {}, OwnedItemIdsBySubtype[ConstantsModule.EditableCharacterKey] or {}, p1.AvatarExperience.AvatarEditor.Character, OutfitInfos)
	
	if FFlagAXBackgroundsOutfitPersistence and MemoizeResultResult ~= nil then
		local OutfitInfo = OutfitInfos[tostring(MemoizeResultResult)]
		local BackgroundAssetId = OutfitInfo and (OutfitInfo.profileConfiguration and OutfitInfo.profileConfiguration.BackgroundAssetId)
		local SelectActiveBackgroundResult = SelectActiveBackgroundFunction(p1)
		
		if (if SelectActiveBackgroundResult == nil or SelectActiveBackgroundResult == NOBACKGROUNDASSETID then nil else SelectActiveBackgroundResult) ~= (if BackgroundAssetId == nil or BackgroundAssetId == NOBACKGROUNDASSETID then nil else BackgroundAssetId) then
			return nil
		end
	end
	return MemoizeResultResult
end