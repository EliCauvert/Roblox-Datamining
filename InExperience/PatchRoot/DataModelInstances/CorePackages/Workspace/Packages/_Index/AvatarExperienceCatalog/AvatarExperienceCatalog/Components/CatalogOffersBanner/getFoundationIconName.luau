local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local iconName = require(parent.Foundation).Enums.IconName
local fFlagAXRemoveOfferBannerIcon = require(parent.AvatarExperienceFlags).FFlagAXRemoveOfferBannerIcon

return function(p1)
	-- upvalues: iconName (ref), fFlagAXRemoveOfferBannerIcon (ref)
	if p1 then
		local var1 = iconName[p1]
		
		return var1 or (if fFlagAXRemoveOfferBannerIcon then nil else iconName.TagSparkle)
	end
end