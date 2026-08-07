local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local buttonVariant = require(profilePlatform.Parent.Foundation).Enums.ButtonVariant
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.JoinExperience] = function(p0) --[[ line: 13 ]]
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref)
		return {
			variant = buttonVariant.Emphasis,
			isLoading = p0.experienceUtilities.isLoading,
			isDisabled = not p0.experienceUtilities.isInExperience,
			text = p0.localized[enumsModule.ProfileActions.JoinExperience],
			onActivated = {
				[profileTypes.User] = function() --[[ line: 20 ]]
					-- upvalues: p0 (ref)
					p0.experienceUtilities.joinExperience()
				end
			}
		}
	end
}