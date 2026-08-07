local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking

return function() --[[ line: 8 | named "useNetworking" ]]
	-- upvalues: useRoactService (ref), roactNetworking (ref)
	return useRoactService(roactNetworking)
end