local UseWearTimeSelectedOptionViewModelModule = require(script.Parent.useWearTimeSelectedOptionViewModel)
local WearTimeSelectedOptionInListViewModule = require(script.Parent.WearTimeSelectedOptionInListView)
local _ = require(script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent.AvatarExperienceCommon)

return function(p1)
	-- upvalues: UseWearTimeSelectedOptionViewModelModule (copy), WearTimeSelectedOptionInListViewModule (copy)
	return WearTimeSelectedOptionInListViewModule((UseWearTimeSelectedOptionViewModelModule(p1)))
end