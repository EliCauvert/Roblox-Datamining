local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local FFlagFriendsCallingClientGateDEV = require(Parent.SharedFlags).FFlagFriendsCallingClientGate_DEV
local NewResult = require(Parent.Loggers).Logger:new(script.Name)
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes

return {
	[EnumsModule.ProfileActions.Call] = if FFlagFriendsCallingClientGateDEV then function(p1)
		-- upvalues: ButtonVariant (copy), ProfileTypes (copy), EnumsModule (copy), EventNamesModule (copy), NewResult (copy)
		return {
			text = "Call",
			variant = ButtonVariant.Standard,
			onActivated = {
				[ProfileTypes.User] = function()
					-- upvalues: p1 (copy), EnumsModule (upval), EventNamesModule (upval), NewResult (upval)
					if p1.buttonSurface == EnumsModule.ButtonSurface.ContextualMenu then
						p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonCall, { buttonSurface = p1.buttonSurface })
					else
						p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonCall, { buttonSurface = p1.buttonSurface })
					end
					local FriendsCallingService = p1.friendsCallingService or game:GetService("FriendsCallingService")
					local Success, Result = pcall(function()
						-- upvalues: FriendsCallingService (copy), p1 (upval)
						FriendsCallingService:StartCall({ participantIds = { (tonumber(p1.profileId)) } })
					end)
					
					if not Success then
						NewResult:debug("FriendsCallingService:StartCall failed: {}", Result)
					end
				end
			}
		}
	end else nil
}