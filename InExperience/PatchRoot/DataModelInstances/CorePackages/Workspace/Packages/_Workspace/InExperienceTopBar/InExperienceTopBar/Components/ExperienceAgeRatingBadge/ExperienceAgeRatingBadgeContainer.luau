local reactModule = require(script:FindFirstAncestor("InExperienceTopBar").Parent.React)
local experienceAgeRatingBadgeViewModule = require(script.Parent.ExperienceAgeRatingBadgeView)
local useExperienceAgeRatingBadgeViewModelModule = require(script.Parent.useExperienceAgeRatingBadgeViewModel)

return function(p1)
	-- upvalues: useExperienceAgeRatingBadgeViewModelModule (ref), reactModule (ref), experienceAgeRatingBadgeViewModule (ref)
	local var1 = useExperienceAgeRatingBadgeViewModelModule(p1)
	
	return if var1 then reactModule.createElement(experienceAgeRatingBadgeViewModule, var1) else nil
end