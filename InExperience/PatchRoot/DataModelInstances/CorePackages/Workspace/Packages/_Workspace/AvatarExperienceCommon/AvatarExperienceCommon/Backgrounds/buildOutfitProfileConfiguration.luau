local FFlagAXOutfitSaveSkipUnownedTryOnBackground = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceFlags).FFlagAXOutfitSaveSkipUnownedTryOnBackground
local SelectActiveBackgroundModule = require(script.Parent.selectActiveBackground)
local SelectTryOnBackgroundIdModule = require(script.Parent.selectTryOnBackgroundId)
local NOBACKGROUNDASSETID = require(script.Parent.constants).NO_BACKGROUND_ASSET_ID

local function _(p1, p2): boolean
	local AvatarExperience = p1 and p1.AvatarExperience or p1
	local AssetInfos = AvatarExperience and (AvatarExperience.Common and AvatarExperience.Common.AssetInfos)
	local AssetInfo = AssetInfos and AssetInfos[tostring(p2)]
	
	return AssetInfo ~= nil and AssetInfo.isOwned == true
end

return function(p1)
	-- upvalues: SelectActiveBackgroundModule (copy), FFlagAXOutfitSaveSkipUnownedTryOnBackground (copy), SelectTryOnBackgroundIdModule (copy), NOBACKGROUNDASSETID (copy)
	local SelectActiveBackgroundModuleResult = SelectActiveBackgroundModule(p1)
	
	if FFlagAXOutfitSaveSkipUnownedTryOnBackground and SelectActiveBackgroundModuleResult ~= nil and SelectActiveBackgroundModuleResult == SelectTryOnBackgroundIdModule(p1) then
		local AvatarExperience = p1 and p1.AvatarExperience or p1
		local AssetInfos = AvatarExperience and (AvatarExperience.Common and AvatarExperience.Common.AssetInfos)
		local AssetInfo = AssetInfos and AssetInfos[tostring(SelectActiveBackgroundModuleResult)]
		
		if AssetInfo == nil or AssetInfo.isOwned ~= true then
			SelectActiveBackgroundModuleResult = SelectActiveBackgroundModule(p1, { ignoreTryOn = true })
		end
	end
	return {
		BackgroundAssetId = if SelectActiveBackgroundModuleResult == nil then NOBACKGROUNDASSETID else SelectActiveBackgroundModuleResult
	}
end