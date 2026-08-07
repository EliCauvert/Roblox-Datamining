local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local iconName = require(profilePlatform.Parent.Foundation).Enums.IconName
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.QrCode] = function(p0) --[[ line: 14 ]]
		-- upvalues: iconName (ref), profileTypes (ref), eventNamesModule (ref)
		return {
			icon = iconName.SquaresGridQr,
			onActivated = {
				[profileTypes.User] = function() --[[ line: 18 ]]
					-- upvalues: p0 (ref), eventNamesModule (copy)
					p0.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonShareProfileQRCode, { buttonSurface = p0.buttonSurface })
					p0.navigateTo.qRCodePage()
				end
			}
		}
	end
}