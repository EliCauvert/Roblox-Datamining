local CorePackages = game:GetService("CorePackages")
local NotificationService = game:GetService("NotificationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableAppRatingPromptLua = SharedFlagsModule.FFlagEnableAppRatingPromptLua
local FFlagEnableAndroidAppRatingPromptLua = SharedFlagsModule.FFlagEnableAndroidAppRatingPromptLua
local FFlagEnableUserAccessServiceIntegration = SharedFlagsModule.FFlagEnableUserAccessServiceIntegration
local FFlagEnableMagicLogin = SharedFlagsModule.FFlagEnableMagicLogin
local GetFFlagIsSquadEnabledFunction = SharedFlagsModule.GetFFlagIsSquadEnabled
local FFlagEnableAuthDeepLinkReceiver = SharedFlagsModule.FFlagEnableAuthDeepLinkReceiver
local FFlagTCStreamNotifEventReceiver = SharedFlagsModule.FFlagTCStreamNotifEventReceiver
local FFlagEnableRobloxSubscriptionEventListener = SharedFlagsModule.FFlagEnableRobloxSubscriptionEventListener
local GetFFlagEnableVREnvironmentSettingFunction = SharedFlagsModule.GetFFlagEnableVREnvironmentSetting
local GetFFlagEnableSkyStyleFunction = SharedFlagsModule.GetFFlagEnableSkyStyle
local FFlagAppNavMyStatsTab = SharedFlagsModule.FFlagAppNavMyStatsTab
local IsCsatSurveyInterceptEnabledModule = require(Modules.LuaApp.Components.OnPlatformSurveys.IsCsatSurveyInterceptEnabled)
local FFlagLuobuCJVMorePageShowTencentNoticeModule = require(Modules.Luobu.Flags.FFlagLuobuCJVMorePageShowTencentNotice)
local GetFFlagLuaAppChallengeDialogEventReceiverEnabledFunction = require(CorePackages.Workspace.Packages.ChallengeDialog).GetFFlagLuaAppChallengeDialogEventReceiverEnabled
local GetFFlagLuaAppReturnFromGameModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppReturnFromGame)
local FFlagLuobuShowTencentNoticePopupModule = require(Modules.Luobu.Flags.FFlagLuobuShowTencentNoticePopup)
local GetFFlagEnableParentalControlsScreentimeEnforcementFunction = require(CorePackages.Workspace.Packages.ScreenTime).GetFFlagEnableParentalControlsScreentimeEnforcement
local GetFFlagEnablePlatformRestrictedEventReceiverFunction = SharedFlagsModule.GetFFlagEnablePlatformRestrictedEventReceiver
local MagicLoginApprovePopupEventReceiver = require(CorePackages.Workspace.Packages.LoginV2.Thunks).MagicLoginApprovePopupEventReceiver
local SystemThemeEnabled = require(Modules.LuaApp.Components.EventReceivers.SystemThemeFeature).GetSystemThemeEnabled()
local DeviceLevelThemeChangeEventReceiverModule = SystemThemeEnabled and require(Modules.LuaApp.Components.EventReceivers.DeviceLevelThemeChangeEventReceiver) or nil
local BadgeEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.BadgeEventReceiver)
local RobuxEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.RobuxEventReceiver)
local FriendshipEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.FriendshipEventReceiver)
local TrustedConnectionEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.TrustedConnectionEventReceiver)
local NavigationEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.NavigationEventReceiver)
local EventReceiverModule = require(Modules.AvatarExperience.AvatarEditor.Components.EventReceivers.EventReceiver)
local UniversalAppRobloxHybridEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.UniversalAppRobloxHybridEventReceiver)
local ThemeChangeEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.ThemeChangeEventReceiver)
local DeepLinkEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.DeepLinkEventReceiver)
local MarketplaceServiceEventRecieverModule = require(Modules.LuaApp.Components.EventReceivers.MarketplaceServiceEventReciever)
local FullscreenEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.FullscreenEventReceiver)
local DisplayNameEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.DisplayNameEventReceiver)
local FriendRequestsEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.FriendRequestsEventReceiver)
local ScreenTimeEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.ScreenTimeEventReceiver)
local ModerationEventReceiverV2Module = require(Modules.LuaApp.Components.EventReceivers.ModerationEventReceiverV2)
local PresenceEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.PresenceEventReceiver)
local ReturnFromGameReceiverModule = require(Modules.LuaApp.Components.EventReceivers.ReturnFromGameReceiver)
local OnGameLeaveReceiver = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Components.EventReceivers.OnGameLeaveReceiver
local AppSquadEventReceiverModule = require(CorePackages.Workspace.Packages.Squads.AppSquadEventReceiver)
local PersistentEventReceiversModule = require(CorePackages.Workspace.Packages.AppChat.PersistentEventReceivers)
local DeeplinkResolutionEventReceiverModule = if require(Modules.LuaApp.Flags.FFlagEnableDeeplinkResolutionEventReceiver) then require(Modules.LuaApp.Components.EventReceivers.DeeplinkResolutionEventReceiver) else nil
local AttributionContextEventReceiverModule = if require(Modules.LuaApp.Flags.FFlagEnableAttributionContextEventReceiver) then require(Modules.LuaApp.Components.EventReceivers.AttributionContextEventReceiver) else nil
local ChallengeDialogEventReceiver = require(CorePackages.Workspace.Packages.ChallengeDialog).ChallengeDialogEventReceiver
local PurchaseProcessedEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.PurchaseProcessedEventReceiver)
local LocaleRestrictionEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.LocaleRestrictionEventReceiver)
local ParentalControlsScreentimeEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.ParentalControlsScreentimeEventReceiver)
local CsatSurveyInterceptEventReceiverModule = require(Modules.LuaApp.Components.OnPlatformSurveys.CsatSurveyInterceptEventReceiver)
local AppRatingPromptEventReceiver = (FFlagEnableAppRatingPromptLua or FFlagEnableAndroidAppRatingPromptLua) and require(CorePackages.Workspace.Packages.AppRatingPrompt).AppRatingPromptEventReceiver or nil
local InAppInterventionEventReceiver = require(CorePackages.Workspace.Packages.InAppIntervention).InAppInterventionEventReceiver
local BuildExperienceModule = if FFlagAppNavMyStatsTab then require(CorePackages.Workspace.Packages.BuildExperience) else nil
local TencentNoticeEventReceiverModule = require(Modules.Luobu.Components.EventReceivers.TencentNoticeEventReceiver)
local PerfInsightsModule = require(Modules.LuaApp.Experiment.PerfInsights)
local AccountLockEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.AccountLockEventReceiver)
local RobloxSubscriptionEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.RobloxSubscriptionEventReceiver)
local VREnvironmentSettingEventReceiverModule = if GetFFlagEnableVREnvironmentSettingFunction() then require(Modules.LuaApp.Components.EventReceivers.VREnvironmentSettingEventReceiver) else nil
local SkyStyleEventReceiverModule = if GetFFlagEnableSkyStyleFunction() then require(Modules.LuaApp.Components.EventReceivers.SkyStyleEventReceiver) else nil
local RobloxEventReceiver = require(CorePackages.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver
local EventReceiverLifecycleAdapterModule = require(Modules.LuaApp.Components.EventReceiverLifecycleAdapter)
local AuthDeeplinkEventReceiverMonoWrapperModule = require(Modules.LuaApp.Components.Authentication.AuthDeeplinkEventReceiverMonoWrapper)
local PlatformRestrictedEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.PlatformRestrictedEventReceiver)

return function()
	-- upvalues: ReactModule (copy), RobloxEventReceiver (copy), NotificationService (copy), AccountLockEventReceiverModule (copy), PersistentEventReceiversModule (copy), FFlagEnableAppRatingPromptLua (copy), FFlagEnableAndroidAppRatingPromptLua (copy), AppRatingPromptEventReceiver (copy), BuildExperienceModule (copy), GetFFlagIsSquadEnabledFunction (copy), AppSquadEventReceiverModule (copy), EventReceiverModule (copy), BadgeEventReceiverModule (copy), GetFFlagLuaAppChallengeDialogEventReceiverEnabledFunction (copy), ChallengeDialogEventReceiver (copy), IsCsatSurveyInterceptEnabledModule (copy), CsatSurveyInterceptEventReceiverModule (copy), FFlagEnableAuthDeepLinkReceiver (copy), AuthDeeplinkEventReceiverMonoWrapperModule (copy), DeepLinkEventReceiverModule (copy), SystemThemeEnabled (copy), DeviceLevelThemeChangeEventReceiverModule (copy), DisplayNameEventReceiverModule (copy), FriendRequestsEventReceiverModule (copy), FriendshipEventReceiverModule (copy), FullscreenEventReceiverModule (copy), InAppInterventionEventReceiver (copy), FFlagEnableUserAccessServiceIntegration (copy), LocaleRestrictionEventReceiverModule (copy), MarketplaceServiceEventRecieverModule (copy), ModerationEventReceiverV2Module (copy), NavigationEventReceiverModule (copy), OnGameLeaveReceiver (copy), DeeplinkResolutionEventReceiverModule (copy), AttributionContextEventReceiverModule (copy), GetFFlagEnableParentalControlsScreentimeEnforcementFunction (copy), ParentalControlsScreentimeEventReceiverModule (copy), PerfInsightsModule (copy), PresenceEventReceiverModule (copy), PurchaseProcessedEventReceiverModule (copy), GetFFlagLuaAppReturnFromGameModule (copy), ReturnFromGameReceiverModule (copy), RobuxEventReceiverModule (copy), ScreenTimeEventReceiverModule (copy), FFlagLuobuCJVMorePageShowTencentNoticeModule (copy), FFlagLuobuShowTencentNoticePopupModule (copy), TencentNoticeEventReceiverModule (copy), ThemeChangeEventReceiverModule (copy), UniversalAppRobloxHybridEventReceiverModule (copy), GetFFlagEnablePlatformRestrictedEventReceiverFunction (copy), PlatformRestrictedEventReceiverModule (copy), FFlagEnableMagicLogin (copy), MagicLoginApprovePopupEventReceiver (copy), FFlagTCStreamNotifEventReceiver (copy), TrustedConnectionEventReceiverModule (copy), FFlagEnableRobloxSubscriptionEventListener (copy), RobloxSubscriptionEventReceiverModule (copy), GetFFlagEnableSkyStyleFunction (copy), SkyStyleEventReceiverModule (copy), VREnvironmentSettingEventReceiverModule (copy), EventReceiverLifecycleAdapterModule (copy)
	return ReactModule.createElement(EventReceiverLifecycleAdapterModule, {
		RobloxEventReceiver = ReactModule.useMemo(function()
			-- upvalues: RobloxEventReceiver (upval), NotificationService (upval)
			return RobloxEventReceiver.new(NotificationService)
		end, {}),
		receiverComponents = ReactModule.useMemo(function()
			-- upvalues: AccountLockEventReceiverModule (upval), PersistentEventReceiversModule (upval), FFlagEnableAppRatingPromptLua (upval), FFlagEnableAndroidAppRatingPromptLua (upval), AppRatingPromptEventReceiver (upval), BuildExperienceModule (upval), GetFFlagIsSquadEnabledFunction (upval), AppSquadEventReceiverModule (upval), EventReceiverModule (upval), BadgeEventReceiverModule (upval), GetFFlagLuaAppChallengeDialogEventReceiverEnabledFunction (upval), ChallengeDialogEventReceiver (upval), IsCsatSurveyInterceptEnabledModule (upval), CsatSurveyInterceptEventReceiverModule (upval), FFlagEnableAuthDeepLinkReceiver (upval), AuthDeeplinkEventReceiverMonoWrapperModule (upval), DeepLinkEventReceiverModule (upval), SystemThemeEnabled (upval), DeviceLevelThemeChangeEventReceiverModule (upval), DisplayNameEventReceiverModule (upval), FriendRequestsEventReceiverModule (upval), FriendshipEventReceiverModule (upval), FullscreenEventReceiverModule (upval), InAppInterventionEventReceiver (upval), FFlagEnableUserAccessServiceIntegration (upval), LocaleRestrictionEventReceiverModule (upval), MarketplaceServiceEventRecieverModule (upval), ModerationEventReceiverV2Module (upval), NavigationEventReceiverModule (upval), OnGameLeaveReceiver (upval), DeeplinkResolutionEventReceiverModule (upval), AttributionContextEventReceiverModule (upval), GetFFlagEnableParentalControlsScreentimeEnforcementFunction (upval), ParentalControlsScreentimeEventReceiverModule (upval), PerfInsightsModule (upval), PresenceEventReceiverModule (upval), PurchaseProcessedEventReceiverModule (upval), GetFFlagLuaAppReturnFromGameModule (upval), ReturnFromGameReceiverModule (upval), RobuxEventReceiverModule (upval), ScreenTimeEventReceiverModule (upval), FFlagLuobuCJVMorePageShowTencentNoticeModule (upval), FFlagLuobuShowTencentNoticePopupModule (upval), TencentNoticeEventReceiverModule (upval), ThemeChangeEventReceiverModule (upval), UniversalAppRobloxHybridEventReceiverModule (upval), GetFFlagEnablePlatformRestrictedEventReceiverFunction (upval), PlatformRestrictedEventReceiverModule (upval), FFlagEnableMagicLogin (upval), MagicLoginApprovePopupEventReceiver (upval), FFlagTCStreamNotifEventReceiver (upval), TrustedConnectionEventReceiverModule (upval), FFlagEnableRobloxSubscriptionEventListener (upval), RobloxSubscriptionEventReceiverModule (upval), GetFFlagEnableSkyStyleFunction (upval), SkyStyleEventReceiverModule (upval), VREnvironmentSettingEventReceiverModule (upval)
			return {
				AccountLockEventReceiverModule, PersistentEventReceiversModule,
				if FFlagEnableAppRatingPromptLua or FFlagEnableAndroidAppRatingPromptLua then AppRatingPromptEventReceiver else nil,
				if BuildExperienceModule then BuildExperienceModule.BuildEventReceiver else nil,
				if GetFFlagIsSquadEnabledFunction() then AppSquadEventReceiverModule else nil,
				EventReceiverModule, BadgeEventReceiverModule,
				if GetFFlagLuaAppChallengeDialogEventReceiverEnabledFunction() then ChallengeDialogEventReceiver else nil,
				if IsCsatSurveyInterceptEnabledModule() then CsatSurveyInterceptEventReceiverModule else nil,
				if FFlagEnableAuthDeepLinkReceiver then AuthDeeplinkEventReceiverMonoWrapperModule else nil,
				DeepLinkEventReceiverModule,
				if SystemThemeEnabled then DeviceLevelThemeChangeEventReceiverModule else nil,
				DisplayNameEventReceiverModule, FriendRequestsEventReceiverModule,
				FriendshipEventReceiverModule, FullscreenEventReceiverModule,
				InAppInterventionEventReceiver,
				if FFlagEnableUserAccessServiceIntegration then LocaleRestrictionEventReceiverModule else nil,
				MarketplaceServiceEventRecieverModule, ModerationEventReceiverV2Module,
				NavigationEventReceiverModule, OnGameLeaveReceiver,
				DeeplinkResolutionEventReceiverModule, AttributionContextEventReceiverModule,
				if GetFFlagEnableParentalControlsScreentimeEnforcementFunction() then ParentalControlsScreentimeEventReceiverModule else nil,
				PerfInsightsModule, PresenceEventReceiverModule,
				PurchaseProcessedEventReceiverModule,
				if GetFFlagLuaAppReturnFromGameModule() then ReturnFromGameReceiverModule else nil,
				RobuxEventReceiverModule, ScreenTimeEventReceiverModule,
				if FFlagLuobuCJVMorePageShowTencentNoticeModule or FFlagLuobuShowTencentNoticePopupModule then TencentNoticeEventReceiverModule else nil,
				ThemeChangeEventReceiverModule, UniversalAppRobloxHybridEventReceiverModule,
				if GetFFlagEnablePlatformRestrictedEventReceiverFunction() then PlatformRestrictedEventReceiverModule else nil,
				if FFlagEnableMagicLogin then MagicLoginApprovePopupEventReceiver else nil,
				if FFlagTCStreamNotifEventReceiver then TrustedConnectionEventReceiverModule else nil,
				if FFlagEnableRobloxSubscriptionEventListener then RobloxSubscriptionEventReceiverModule else nil,
				if GetFFlagEnableSkyStyleFunction() then SkyStyleEventReceiverModule else VREnvironmentSettingEventReceiverModule
			}
		end, {})
	})
end