local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Common.Types)
local MergeProfileStateAndResponseModule = require(ProfilePlatform.Rodux.ProfileTypes.mergeProfileStateAndResponse)

return require(ProfilePlatform.Parent.Rodux).createReducer({}, {
	[require(ProfilePlatform.Networking.getProfilePlatform).Succeeded.name] = function(p1, p2)
		-- upvalues: EnumsModule (copy), MergeProfileStateAndResponseModule (copy)
		local ResponseBody = p2.responseBody
		
		return if ResponseBody.profileType == EnumsModule.ProfileTypes.User then MergeProfileStateAndResponseModule(p1, ResponseBody) else p1
	end
})