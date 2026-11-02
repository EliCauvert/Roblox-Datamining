local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Common.Types)
local MergeProfileStateAndResponseModule = require(ProfilePlatform.Rodux.ProfileTypes.mergeProfileStateAndResponse)
local FFlagProfilePlatformGracefulVisibilityModule = require(ProfilePlatform.Flags.FFlagProfilePlatformGracefulVisibility)
local _ = require(ProfilePlatform.Types.Component)

return require(ProfilePlatform.Parent.Rodux).createReducer({}, {
	[require(ProfilePlatform.Networking.getProfilePlatform).Succeeded.name] = function(p1, p2)
		-- upvalues: EnumsModule (copy), FFlagProfilePlatformGracefulVisibilityModule (copy), MergeProfileStateAndResponseModule (copy)
		local ResponseBody = p2.responseBody
		
		if ResponseBody.profileType ~= EnumsModule.ProfileTypes.User then
			return p1
		end
		local v1 = nil
		
		if FFlagProfilePlatformGracefulVisibilityModule and ResponseBody.onlyEssentialComponents ~= true then
			local Components = if p2.postBody and p2.postBody.components then p2.postBody.components else {}
			for _, component in Components do
				if component.component == EnumsModule.Components.Friends and ResponseBody.components[EnumsModule.Components.Friends] == nil then
					v1 = { EnumsModule.Components.Friends }
					break
				end
			end
		end
		return MergeProfileStateAndResponseModule(p1, ResponseBody, v1)
	end
})