local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local buttonVariant = require(profilePlatform.Parent.Foundation).Enums.ButtonVariant
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.JoinExperience] = function(p1)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref)
		return {
			variant = buttonVariant.Emphasis,
			isLoading = p1.experienceUtilities.isLoading,
			isDisabled = not p1.experienceUtilities.isInExperience,
			text = p1.localized[enumsModule.ProfileActions.JoinExperience],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref)
					p1.experienceUtilities.joinExperience()
				end
			}
		}
	end
}