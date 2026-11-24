local FFlagExperienceAgeRatingBadge = require(game:GetService("CorePackages").Workspace.Packages.InExperienceTopBar).Flags.FFlagExperienceAgeRatingBadge

return {
	keepOutAreaId = "experience-age-rating",
	isEligible = function(Enabled, p1, p2, p3): boolean
		-- upvalues: FFlagExperienceAgeRatingBadge (copy)
		return FFlagExperienceAgeRatingBadge and (Enabled == true and (p1 and (p2 and not p3)))
	end
}