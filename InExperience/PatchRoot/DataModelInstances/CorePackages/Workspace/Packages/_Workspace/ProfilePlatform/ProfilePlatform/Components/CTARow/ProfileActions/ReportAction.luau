local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local url = require(parent.Http).Url
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var2 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local openDynamicAbuseReportModule = require(parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local refreshProfilePlatformActionInfoModule = require(profilePlatform.Networking.refreshProfilePlatformActionInfo)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes
local fFlagEnableAbuseReportRevampFlow = sharedFlagsModule.FFlagEnableAbuseReportRevampFlow
local fFlagEnableAbuseReportRevampProfileAndGroupModule = require(profilePlatform.Flags.FFlagEnableAbuseReportRevampProfileAndGroup)

return {
	[enumsModule.ProfileActions.Report] = function(p0)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), fFlagEnableAbuseReportRevampFlow (ref), fFlagEnableAbuseReportRevampProfileAndGroupModule (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), closeCentralOverlay (ref), refreshProfilePlatformActionInfoModule (ref), appPage (ref), url (ref), textKeysModule (ref), fFlagSignalsNavP3Dispatch (ref), var2 (ref), navigateDown (ref)
		return {
			text = p0.localized[enumsModule.ProfileActions.Report],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p0 (ref), eventNamesModule (copy), fFlagEnableAbuseReportRevampFlow (copy), fFlagEnableAbuseReportRevampProfileAndGroupModule (copy), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), refreshProfilePlatformActionInfoModule (copy), appPage (copy), url (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var2 (copy), navigateDown (copy)
					p0.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonReport, { buttonSurface = p0.buttonSurface })
					
					if fFlagEnableAbuseReportRevampFlow and fFlagEnableAbuseReportRevampProfileAndGroupModule then
						p0.dispatch(openDynamicAbuseReportModule({
							abuseVector = abuseVectorModule.UserProfile,
							targetId = p0.profileId,
							onClose = function()
								-- upvalues: p0 (copy), closeCentralOverlay (copy), refreshProfilePlatformActionInfoModule (copy)
								p0.dispatch(closeCentralOverlay())
								p0.dispatch(refreshProfilePlatformActionInfoModule(p0.profileId, p0.actionsComponentRequest))
							end
						}))
						
						return
					end
					local t = {
						name = appPage.GenericWebPage,
						detail = `{url.BASE_URL}abusereport/userprofile?id={p0.profileId}`,
						extraProps = { titleKey = textKeysModule.Report }
					}
					
					if fFlagSignalsNavP3Dispatch then
						var2.down(var2.fromLegacyPage(t))
						
						return
					end
					p0.dispatch(navigateDown(t))
				end,
				[profileTypes.Community] = function()
					-- upvalues: p0 (ref), eventNamesModule (copy), fFlagEnableAbuseReportRevampFlow (copy), fFlagEnableAbuseReportRevampProfileAndGroupModule (copy), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), refreshProfilePlatformActionInfoModule (copy), appPage (copy), url (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var2 (copy), navigateDown (copy)
					p0.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonReport, { buttonSurface = p0.buttonSurface })
					
					if fFlagEnableAbuseReportRevampFlow and fFlagEnableAbuseReportRevampProfileAndGroupModule then
						p0.dispatch(openDynamicAbuseReportModule({
							abuseVector = abuseVectorModule.Group,
							targetId = p0.profileId,
							onClose = function()
								-- upvalues: p0 (copy), closeCentralOverlay (copy), refreshProfilePlatformActionInfoModule (copy)
								p0.dispatch(closeCentralOverlay())
								p0.dispatch(refreshProfilePlatformActionInfoModule(p0.profileId, p0.actionsComponentRequest))
							end
						}))
						
						return
					end
					local t = {
						name = appPage.GenericWebPage,
						detail = `{url.BASE_URL}abusereport/group?id={p0.profileId}`,
						extraProps = { titleKey = textKeysModule.Report }
					}
					
					if fFlagSignalsNavP3Dispatch then
						var2.down(var2.fromLegacyPage(t))
						
						return
					end
					p0.dispatch(navigateDown(t))
				end
			}
		}
	end
}