local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local setAliasModule = require(parent.SetAlias)
local socialStopwatchModule = require(parent.SocialStopwatch)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.EditAlias] = function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref), socialStopwatchModule (ref), eventNamesModule (ref), setAliasModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.EditAlias],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: socialStopwatchModule (copy), p1 (ref), eventNamesModule (copy), enumsModule (copy), setAliasModule (copy)
					socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CustomizeNameOpened)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonSetAlias, { buttonSurface = p1.buttonSurface })
					p1.navigation.navigate(enumsModule.Screens.SetAliasModal, {
						profileUserId = p1.profileId,
						origin = setAliasModule.Analytics.EntryPoints.ContextualMenu
					})
				end
			}
		}
	end
}