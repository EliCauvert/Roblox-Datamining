local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local buttonVariant = require(profilePlatform.Parent.Foundation).Enums.ButtonVariant
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.PendingFriendRequest] = function(p0)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref)
		return {
			isDisabled = true,
			variant = buttonVariant.Subtle,
			text = p0.localized[enumsModule.ProfileActions.PendingFriendRequest],
			onActivated = { [profileTypes.User] = function() end }
		}
	end
}