local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local iconName = require(profilePlatform.Parent.Foundation).Enums.IconName
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.QrCode] = function(p1)
		-- upvalues: iconName (ref), profileTypes (ref), eventNamesModule (ref)
		return {
			icon = iconName.SquaresGridQr,
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonShareProfileQRCode, { buttonSurface = p1.buttonSurface })
					p1.navigateTo.qRCodePage()
				end
			}
		}
	end
}