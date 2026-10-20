local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local IconName = require(Parent.Foundation).Enums.IconName
local FFlagAXRemoveOfferBannerIcon = require(Parent.AvatarExperienceFlags).FFlagAXRemoveOfferBannerIcon

return function(p1)
	-- upvalues: IconName (copy), FFlagAXRemoveOfferBannerIcon (copy)
	if p1 then
		local IconNameEntry = IconName[p1]
		
		if IconNameEntry then
			return IconNameEntry
		end
	end
	return if FFlagAXRemoveOfferBannerIcon then nil else IconName.TagSparkle
end