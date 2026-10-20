local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local ASSETTYPEIDSTRINGTOMAKEUPTYPE = require(AvatarExperienceCommon.Constants).ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local DestroyMakeupDescriptionsModule = require(AvatarExperienceCommon.Utils.Humanoid.destroyMakeupDescriptions)

return function(Parent, List)
	-- upvalues: DestroyMakeupDescriptionsModule (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy)
	DestroyMakeupDescriptionsModule(Parent)
	
	for i, value in List do
		if ASSETTYPEIDSTRINGTOMAKEUPTYPE[i] then
			for i1, value1 in value do
				local MakeupDescription = Instance.new("MakeupDescription")
				MakeupDescription.MakeupType = ASSETTYPEIDSTRINGTOMAKEUPTYPE[i]
				MakeupDescription.AssetId = tonumber(i1) or 0
				MakeupDescription.Parent = Parent
				
				if value1.order then
					MakeupDescription.Order = value1.order
				end
			end
		end
	end
end