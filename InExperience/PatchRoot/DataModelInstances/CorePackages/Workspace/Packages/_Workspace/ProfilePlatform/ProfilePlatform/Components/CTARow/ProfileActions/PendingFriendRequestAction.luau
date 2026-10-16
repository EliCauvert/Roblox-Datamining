local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ButtonVariant = require(ProfilePlatform.Parent.Foundation).Enums.ButtonVariant
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local ProfileTypes = EnumsModule.ProfileTypes

return {
	[EnumsModule.ProfileActions.PendingFriendRequest] = function(p1) --[[ Line: 13 ]]
		-- upvalues: ButtonVariant (copy), EnumsModule (copy), ProfileTypes (copy)
		return {
			isDisabled = true,
			variant = ButtonVariant.Subtle,
			text = p1.localized[EnumsModule.ProfileActions.PendingFriendRequest],
			onActivated = { [ProfileTypes.User] = function() --[[ Line: 18 ]] end }
		}
	end
}