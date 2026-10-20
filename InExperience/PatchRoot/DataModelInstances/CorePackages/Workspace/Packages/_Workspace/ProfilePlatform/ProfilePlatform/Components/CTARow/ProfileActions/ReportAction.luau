local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local Url = require(Parent.Http).Url
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local OpenDynamicAbuseReportModule = require(Parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local RefreshProfilePlatformActionInfoModule = require(ProfilePlatform.Networking.refreshProfilePlatformActionInfo)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes
local FFlagEnableAbuseReportRevampFlow = SharedFlagsModule.FFlagEnableAbuseReportRevampFlow
local FFlagEnableAbuseReportRevampProfileAndGroupModule = require(ProfilePlatform.Flags.FFlagEnableAbuseReportRevampProfileAndGroup)

return {
	[EnumsModule.ProfileActions.Report] = function(p1)
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), FFlagEnableAbuseReportRevampFlow (copy), FFlagEnableAbuseReportRevampProfileAndGroupModule (copy), OpenDynamicAbuseReportModule (copy), AbuseVectorModule (copy), CloseCentralOverlayFunction (copy), RefreshProfilePlatformActionInfoModule (copy), AppPage (copy), Url (copy), TextKeysModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.Report],
			onActivated = {
				[ProfileTypes.User] = function()
					-- upvalues: p1 (copy), EventNamesModule (upval), FFlagEnableAbuseReportRevampFlow (upval), FFlagEnableAbuseReportRevampProfileAndGroupModule (upval), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), CloseCentralOverlayFunction (upval), RefreshProfilePlatformActionInfoModule (upval), AppPage (upval), Url (upval), TextKeysModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonReport, { buttonSurface = p1.buttonSurface })
					
					if FFlagEnableAbuseReportRevampFlow and FFlagEnableAbuseReportRevampProfileAndGroupModule then
						p1.dispatch(OpenDynamicAbuseReportModule({
							abuseVector = AbuseVectorModule.UserProfile,
							targetId = p1.profileId,
							onClose = function()
								-- upvalues: p1 (upval), CloseCentralOverlayFunction (upval), RefreshProfilePlatformActionInfoModule (upval)
								p1.dispatch(CloseCentralOverlayFunction())
								p1.dispatch(RefreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
							end
						}))
						
						return
					end
					local config = {
						name = AppPage.GenericWebPage,
						detail = `{Url.BASE_URL}abusereport/userprofile?id={p1.profileId}`,
						extraProps = { titleKey = TextKeysModule.Report }
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						p1.dispatch(NavigateDownFunction(config))
					end
				end,
				[ProfileTypes.Community] = function()
					-- upvalues: p1 (copy), EventNamesModule (upval), FFlagEnableAbuseReportRevampFlow (upval), FFlagEnableAbuseReportRevampProfileAndGroupModule (upval), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), CloseCentralOverlayFunction (upval), RefreshProfilePlatformActionInfoModule (upval), AppPage (upval), Url (upval), TextKeysModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonReport, { buttonSurface = p1.buttonSurface })
					
					if FFlagEnableAbuseReportRevampFlow and FFlagEnableAbuseReportRevampProfileAndGroupModule then
						p1.dispatch(OpenDynamicAbuseReportModule({
							abuseVector = AbuseVectorModule.Group,
							targetId = p1.profileId,
							onClose = function()
								-- upvalues: p1 (upval), CloseCentralOverlayFunction (upval), RefreshProfilePlatformActionInfoModule (upval)
								p1.dispatch(CloseCentralOverlayFunction())
								p1.dispatch(RefreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
							end
						}))
						
						return
					end
					local config = {
						name = AppPage.GenericWebPage,
						detail = `{Url.BASE_URL}abusereport/group?id={p1.profileId}`,
						extraProps = { titleKey = TextKeysModule.Report }
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						p1.dispatch(NavigateDownFunction(config))
					end
				end
			}
		}
	end
}