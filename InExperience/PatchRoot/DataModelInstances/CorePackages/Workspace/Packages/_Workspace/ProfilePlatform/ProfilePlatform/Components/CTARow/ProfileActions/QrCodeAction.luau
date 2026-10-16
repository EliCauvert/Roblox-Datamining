local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local IconName = require(ProfilePlatform.Parent.Foundation).Enums.IconName
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes

return {
	[EnumsModule.ProfileActions.QrCode] = function(p1) --[[ Line: 14 ]]
		-- upvalues: IconName (copy), ProfileTypes (copy), EventNamesModule (copy)
		return {
			icon = IconName.SquaresGridQr,
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 18 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonShareProfileQRCode, { buttonSurface = p1.buttonSurface })
					p1.navigateTo.qRCodePage()
				end
			}
		}
	end
}