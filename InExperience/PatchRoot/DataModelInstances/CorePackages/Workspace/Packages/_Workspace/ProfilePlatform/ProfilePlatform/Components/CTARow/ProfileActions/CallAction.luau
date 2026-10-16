local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes

return {
	[EnumsModule.ProfileActions.Call] = if require(Parent.SharedFlags).FFlagFriendsCallingClientGate_DEV then function(p1) --[[ Line: 16 ]]
		-- upvalues: ButtonVariant (copy), ProfileTypes (copy), EnumsModule (copy), EventNamesModule (copy)
		return {
			text = "Call",
			variant = ButtonVariant.Standard,
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 21 ]]
					-- upvalues: p1 (copy), EnumsModule (upval), EventNamesModule (upval)
					if p1.buttonSurface == EnumsModule.ButtonSurface.ContextualMenu then
						p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonCall, { buttonSurface = p1.buttonSurface })
					else
						p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonCall, { buttonSurface = p1.buttonSurface })
					end
					local CallingService = p1.callingService or game:GetService("CallingService")
					task.spawn(function() --[[ Line: 35 ]]
						-- upvalues: CallingService (copy), p1 (upval)
						pcall(function() --[[ Line: 36 ]]
							-- upvalues: CallingService (upval), p1 (upval)
							CallingService:CreateCallAsync({ (tonumber(p1.profileId)) }, "")
						end)
					end)
				end
			}
		}
	end else nil
}