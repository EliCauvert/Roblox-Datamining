local parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local useWearTimeSelectedOptionViewModelModule = require(script.Parent.useWearTimeSelectedOptionViewModel)
local wearTimeSelectedOptionViewModule = require(script.Parent.WearTimeSelectedOptionView)
local _ = require(parent.AvatarExperienceCommon)

return function(p1)
	-- upvalues: useWearTimeSelectedOptionViewModelModule (ref), wearTimeSelectedOptionViewModule (ref)
	return wearTimeSelectedOptionViewModule(useWearTimeSelectedOptionViewModelModule(p1))
end