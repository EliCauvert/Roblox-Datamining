local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local AbuseVectorModule = require(Parent.UniversalFeatureRestrictions.AbuseVector)
local ShowFeatureRestrictionModule = require(Parent.UniversalFeatureRestrictions.showFeatureRestriction)

return function()
	-- upvalues: ShowFeatureRestrictionModule (copy), AbuseVectorModule (copy)
	ShowFeatureRestrictionModule(AbuseVectorModule.AvatarChange)
end