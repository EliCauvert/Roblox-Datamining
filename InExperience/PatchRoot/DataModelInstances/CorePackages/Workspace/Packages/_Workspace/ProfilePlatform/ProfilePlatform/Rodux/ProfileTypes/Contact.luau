local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local roduxModule = require(profilePlatform.Parent.Rodux)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Common.Types)
local mergeProfileStateAndResponseModule = require(profilePlatform.Rodux.ProfileTypes.mergeProfileStateAndResponse)

return roduxModule.createReducer({}, {
	[require(profilePlatform.Networking.getProfilePlatform).Succeeded.name] = function(p0, p1) --[[ line: 13 ]]
		-- upvalues: enumsModule (ref), mergeProfileStateAndResponseModule (ref)
		local responseBody = p1.responseBody
		
		return if responseBody.profileType == enumsModule.ProfileTypes.Contact then mergeProfileStateAndResponseModule(p0, responseBody) else p0
	end
})