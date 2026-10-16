local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ButtonVariant = require(ProfilePlatform.Parent.Foundation).Enums.ButtonVariant
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local ProfileTypes = EnumsModule.ProfileTypes

return {
	[EnumsModule.ProfileActions.PlayExperience] = function(p1) --[[ Line: 14 ]]
		-- upvalues: ButtonVariant (copy), EnumsModule (copy), ProfileTypes (copy)
		return {
			variant = ButtonVariant.Emphasis,
			isLoading = p1.experienceUtilities.isLoading,
			isDisabled = not p1.experienceUtilities.isInExperience,
			text = p1.localized[EnumsModule.ProfileActions.PlayExperience],
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 21 ]]
					-- upvalues: p1 (copy)
					p1.experienceUtilities.playExperience()
				end
			}
		}
	end
}