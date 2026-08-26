local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local roduxModule = require(profilePlatform.Parent.Rodux)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Common.Types)
local mergeProfileStateAndResponseModule = require(profilePlatform.Rodux.ProfileTypes.mergeProfileStateAndResponse)

return roduxModule.createReducer({}, {
	[require(profilePlatform.Networking.getProfilePlatform).Succeeded.name] = function(p1, p2)
		-- upvalues: enumsModule (ref), mergeProfileStateAndResponseModule (ref)
		local responseBody = p2.responseBody
		
		return if responseBody.profileType == enumsModule.ProfileTypes.Contact then mergeProfileStateAndResponseModule(p1, responseBody) else p1
	end
})