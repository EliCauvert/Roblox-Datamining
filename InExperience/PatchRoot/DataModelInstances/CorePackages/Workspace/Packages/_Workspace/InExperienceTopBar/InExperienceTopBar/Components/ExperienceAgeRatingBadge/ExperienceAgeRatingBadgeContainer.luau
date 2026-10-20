local ReactModule = require(script:FindFirstAncestor("InExperienceTopBar").Parent.React)
local ExperienceAgeRatingBadgeViewModule = require(script.Parent.ExperienceAgeRatingBadgeView)
local UseExperienceAgeRatingBadgeViewModelModule = require(script.Parent.useExperienceAgeRatingBadgeViewModel)

return function(p1)
	-- upvalues: UseExperienceAgeRatingBadgeViewModelModule (copy), ReactModule (copy), ExperienceAgeRatingBadgeViewModule (copy)
	local UseExperienceAgeRatingBadgeViewModelModuleResult = UseExperienceAgeRatingBadgeViewModelModule(p1)
	
	return if UseExperienceAgeRatingBadgeViewModelModuleResult then ReactModule.createElement(ExperienceAgeRatingBadgeViewModule, UseExperienceAgeRatingBadgeViewModelModuleResult) else nil
end