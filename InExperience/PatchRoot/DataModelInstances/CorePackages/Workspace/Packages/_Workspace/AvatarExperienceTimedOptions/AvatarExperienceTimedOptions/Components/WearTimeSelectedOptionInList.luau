local parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local useWearTimeSelectedOptionViewModelModule = require(script.Parent.useWearTimeSelectedOptionViewModel)
local wearTimeSelectedOptionInListViewModule = require(script.Parent.WearTimeSelectedOptionInListView)
local _ = require(parent.AvatarExperienceCommon)

return function(p0) --[[ line: 18 | named "WearTimeSelectedOptionContainer" ]]
	-- upvalues: useWearTimeSelectedOptionViewModelModule (ref), wearTimeSelectedOptionInListViewModule (ref)
	return wearTimeSelectedOptionInListViewModule(useWearTimeSelectedOptionViewModelModule(p0))
end