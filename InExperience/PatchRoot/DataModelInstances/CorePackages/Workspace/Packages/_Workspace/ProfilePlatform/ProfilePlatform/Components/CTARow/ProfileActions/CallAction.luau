local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagFriendsCallingServiceLuaMigration = SharedFlagsModule.FFlagFriendsCallingServiceLuaMigration
local NewResult = require(Parent.Loggers).Logger:new(script.Name)
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes

return {
	[EnumsModule.ProfileActions.Call] = if SharedFlagsModule.FFlagFriendsCallingClientGate_DEV then function(p1)
		-- upvalues: ButtonVariant (copy), ProfileTypes (copy), EnumsModule (copy), EventNamesModule (copy), FFlagFriendsCallingServiceLuaMigration (copy), NewResult (copy)
		return {
			text = "Call",
			variant = ButtonVariant.Standard,
			onActivated = {
				[ProfileTypes.User] = function()
					-- upvalues: p1 (copy), EnumsModule (upval), EventNamesModule (upval), FFlagFriendsCallingServiceLuaMigration (upval), NewResult (upval)
					if p1.buttonSurface == EnumsModule.ButtonSurface.ContextualMenu then
						p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonCall, { buttonSurface = p1.buttonSurface })
					else
						p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonCall, { buttonSurface = p1.buttonSurface })
					end
					if FFlagFriendsCallingServiceLuaMigration then
						local FriendsCallingService = p1.friendsCallingService or game:GetService("FriendsCallingService")
						local Success, Result = pcall(function()
							-- upvalues: FriendsCallingService (copy), p1 (upval)
							FriendsCallingService:StartCall({ participantIds = { (tonumber(p1.profileId)) } })
						end)
						
						if not Success then
							NewResult:debug("FriendsCallingService:StartCall failed: {}", Result)
							
							return
						end
					else
						task.spawn(function()
							-- upvalues: p1 (upval)
							pcall(function()
								-- upvalues: p1 (upval)
								(p1.callingService or game:GetService("CallingService")):CreateCallAsync({ (tonumber(p1.profileId)) }, "")
							end)
						end)
					end
				end
			}
		}
	end else nil
}