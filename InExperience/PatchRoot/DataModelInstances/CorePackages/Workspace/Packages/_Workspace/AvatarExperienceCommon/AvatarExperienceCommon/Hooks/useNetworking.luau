local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking

return function() --[[ Line: 8 | Named "useNetworking" ]]
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy)
	return UseRoactServiceFunction(RoactNetworking)
end