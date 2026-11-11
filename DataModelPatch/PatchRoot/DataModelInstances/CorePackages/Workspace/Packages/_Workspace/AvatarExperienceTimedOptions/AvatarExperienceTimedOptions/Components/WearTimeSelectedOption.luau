local UseWearTimeSelectedOptionViewModelModule = require(script.Parent.useWearTimeSelectedOptionViewModel)
local WearTimeSelectedOptionViewModule = require(script.Parent.WearTimeSelectedOptionView)
local _ = require(script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent.AvatarExperienceCommon)

return function(p1)
	-- upvalues: UseWearTimeSelectedOptionViewModelModule (copy), WearTimeSelectedOptionViewModule (copy)
	return WearTimeSelectedOptionViewModule((UseWearTimeSelectedOptionViewModelModule(p1)))
end