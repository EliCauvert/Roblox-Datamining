local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local SetAliasModule = require(Parent.SetAlias)
local SocialStopwatchModule = require(Parent.SocialStopwatch)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes

return {
	[EnumsModule.ProfileActions.EditAlias] = function(p1)
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), SocialStopwatchModule (copy), EventNamesModule (copy), SetAliasModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.EditAlias],
			onActivated = {
				[ProfileTypes.User] = function()
					-- upvalues: SocialStopwatchModule (upval), p1 (copy), EventNamesModule (upval), EnumsModule (upval), SetAliasModule (upval)
					SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.CustomizeNameOpened)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonSetAlias, { buttonSurface = p1.buttonSurface })
					p1.navigation.navigate(EnumsModule.Screens.SetAliasModal, {
						profileUserId = p1.profileId,
						origin = SetAliasModule.Analytics.EntryPoints.ContextualMenu
					})
				end
			}
		}
	end
}