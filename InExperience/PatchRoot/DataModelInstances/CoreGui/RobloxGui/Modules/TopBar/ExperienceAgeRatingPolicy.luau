local corePackagesService = game:GetService("CorePackages")
local fFlagExperienceAgeRatingBadge = require(corePackagesService.Workspace.Packages.InExperienceTopBar).Flags.FFlagExperienceAgeRatingBadge
local fFlagShowGameAgeRating = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagShowGameAgeRating

return {
	keepOutAreaId = "experience-age-rating",
	isEligible = function(p1, p2, p3, p4)
		-- upvalues: fFlagExperienceAgeRatingBadge (ref), fFlagShowGameAgeRating (ref)
		return fFlagExperienceAgeRatingBadge and (fFlagShowGameAgeRating and (p1 == true and (p2 and (p3 and not p4))))
	end
}