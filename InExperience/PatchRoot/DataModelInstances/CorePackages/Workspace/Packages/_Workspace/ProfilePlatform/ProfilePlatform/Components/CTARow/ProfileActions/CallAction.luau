local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local fFlagFriendsCallingClientGateDEV = require(parent.SharedFlags).FFlagFriendsCallingClientGate_DEV
local buttonVariant = require(parent.Foundation).Enums.ButtonVariant
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.Call] = if fFlagFriendsCallingClientGateDEV then function(p1)
		-- upvalues: buttonVariant (ref), profileTypes (ref), enumsModule (ref), eventNamesModule (ref)
		return {
			text = "Call",
			variant = buttonVariant.Standard,
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), enumsModule (copy), eventNamesModule (copy)
					if p1.buttonSurface == enumsModule.ButtonSurface.ContextualMenu then
						p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonCall, { buttonSurface = p1.buttonSurface })
					else
						p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonCall, { buttonSurface = p1.buttonSurface })
					end;
					(p1.callingService or game:GetService("CallingService")):CreateCall({ tonumber(p1.profileId) }, "")
				end
			}
		}
	end else nil
}