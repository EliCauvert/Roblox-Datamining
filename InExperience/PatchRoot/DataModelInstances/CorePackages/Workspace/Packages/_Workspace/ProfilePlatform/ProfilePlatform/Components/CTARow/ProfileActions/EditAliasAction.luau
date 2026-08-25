local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local setAliasModule = require(parent.SetAlias)
local socialStopwatchModule = require(parent.SocialStopwatch)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.EditAlias] = function(p0)
		-- upvalues: enumsModule (ref), profileTypes (ref), socialStopwatchModule (ref), eventNamesModule (ref), setAliasModule (ref)
		return {
			text = p0.localized[enumsModule.ProfileActions.EditAlias],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: socialStopwatchModule (copy), p0 (ref), eventNamesModule (copy), enumsModule (copy), setAliasModule (copy)
					socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CustomizeNameOpened)
					p0.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonSetAlias, { buttonSurface = p0.buttonSurface })
					p0.navigation.navigate(enumsModule.Screens.SetAliasModal, {
						profileUserId = p0.profileId,
						origin = setAliasModule.Analytics.EntryPoints.ContextualMenu
					})
				end
			}
		}
	end
}