local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FoundationModule = require(Parent.Foundation)
local EnumScreensModule = require(Parent.AppChat.EnumScreens)
local GetChatModerationStatusDataHydrationModule = require(Parent.AppChat.GetChatModerationStatusDataHydration)
local InExperienceAppChatModalModule = require(Parent.AppChat.InExperienceAppChatModal)
local IXPNavigationUtilsModule = require(Parent.AppChat.IXPNavigationUtils)
local GetFFlagAppChatEnableRootedNavigationModule = require(Parent.AppChat.getFFlagAppChatEnableRootedNavigation)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.RobloxAppLocales).Localization
local UseChatWindowSettingsModule = require(Parent.ExpChatIntegration.useChatWindowSettings)
local AppTelemetryLayerModule = require(Parent.AppChat.AppTelemetryLayer)
local ChatPlacementContextModule = require(Parent.AppChat.ChatPlacementContext)
local ChatSessionRefCountModule = require(Parent.AppChat.ChatSessionRefCount)
local UseAppChatUpdateSessionModule = require(Parent.AppChat.useAppChatUpdateSession)
local UseGetAndSetRefModule = require(Parent.AppChat.useGetAndSetRef)
local UsePartyChatReactiveFeatureRestrictionModule = require(Parent.AppChat.usePartyChatReactiveFeatureRestriction)
local SocialCommonModule = require(Parent.SocialCommon)
local FriendsChatTabNameModule = require(script.Parent.FriendsChatTabName)
local ConversationListModule = require(script.Parent.ConversationList)
local FriendsChatConversationWindowModule = require(script.Parent.ConversationWindow.FriendsChatConversationWindow)
local GetFriendsChatNavigationStoreModule = require(script.Parent.Stores.GetFriendsChatNavigationStore)
local GetFriendsChatRealtimeStoreModule = require(script.Parent.Stores.GetFriendsChatRealtimeStore)
local UseFriendsChatVisibilityTelemetryModule = require(script.Parent.Telemetry.App.useFriendsChatVisibilityTelemetry)
local FriendsChatLandingTelemetryProvidersModule = require(script.Parent.Telemetry.ChatLanding.FriendsChatLandingTelemetryProviders)
local FriendsChatConversationTelemetryProvidersModule = require(script.Parent.Telemetry.ChatConversation.FriendsChatConversationTelemetryProviders)
local ExpChatPerfTracker = require(Parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAppChatReactiveFeatureRestrictions = SharedFlagsModule.FFlagAppChatReactiveFeatureRestrictions
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FFlagFriendsChatConversationListFocusNav = SharedFlagsModule.FFlagFriendsChatConversationListFocusNav
local FFlagFriendsChatFocusInputOnConversationActivatedModule = require(script.Parent.Flags.FFlagFriendsChatFocusInputOnConversationActivated)
local FFlagFriendsChatIxpScreenExposureModule = require(script.Parent.Flags.FFlagFriendsChatIxpScreenExposure)
local Exposure = IXPNavigationUtilsModule.createExposureHandler((require(script.Parent.Flags.FStringFriendsChatLandingPageIxpLayer)))
local Exposure1 = IXPNavigationUtilsModule.createExposureHandler((require(script.Parent.Flags.FStringFriendsChatConversationPageIxpLayer)))

local function FriendsChatMainContent(p1) --[[ Line: 77 ]]
	-- upvalues: UseFriendsChatVisibilityTelemetryModule (copy), UseChatWindowSettingsModule (copy), ReactModule (copy), GetChatModerationStatusDataHydrationModule (copy), GetFriendsChatNavigationStoreModule (copy), GetFriendsChatRealtimeStoreModule (copy), FFlagFriendsChatConversationListFocusNav (copy), ReactFocusNavigationModule (copy), FFlagAppChatReactiveFeatureRestrictions (copy), UsePartyChatReactiveFeatureRestrictionModule (copy), FFlagExpChatEnableFriendsTab (copy), ExpChatPerfTracker (copy), FriendsChatTabNameModule (copy), SignalsReactModule (copy), FFlagFriendsChatIxpScreenExposureModule (copy), Exposure1 (copy), Exposure (copy), Players (copy), Localization (copy), LocalizationService (copy), FFlagFriendsChatFocusInputOnConversationActivatedModule (copy), ChatSessionRefCountModule (copy), InExperienceAppChatModalModule (copy), EnumScreensModule (copy), SocialCommonModule (copy), FriendsChatLandingTelemetryProvidersModule (copy), ConversationListModule (copy), FriendsChatConversationTelemetryProvidersModule (copy), FriendsChatConversationWindowModule (copy), GetFFlagAppChatEnableRootedNavigationModule (copy), LocalizationProvider (copy), FoundationModule (copy)
	UseFriendsChatVisibilityTelemetryModule()
	local UseChatWindowSettingsModuleResult = UseChatWindowSettingsModule()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 81 ]]
		-- upvalues: UseChatWindowSettingsModuleResult (copy)
		return {
			BackgroundColor3 = UseChatWindowSettingsModuleResult.ChatWindowBackgroundColor3,
			BackgroundTransparency = UseChatWindowSettingsModuleResult.ChatWindowBackgroundTransparency
		}
	end, { UseChatWindowSettingsModuleResult })
	local ChatModerationStatusDataHydrationModule = GetChatModerationStatusDataHydrationModule(false)
	local FriendsChatNavigationStoreModule = GetFriendsChatNavigationStoreModule(false)
	local FriendsChatRealtimeStoreModule = GetFriendsChatRealtimeStoreModule(false)
	local UseContextResult = if FFlagFriendsChatConversationListFocusNav then ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext) else nil
	
	if FFlagAppChatReactiveFeatureRestrictions then
		UsePartyChatReactiveFeatureRestrictionModule(true)
	end
	ReactModule.useEffect(function() --[[ Line: 111 ]]
		-- upvalues: FriendsChatRealtimeStoreModule (copy)
		FriendsChatRealtimeStoreModule.markFriendsTabEntered()
	end, { FriendsChatRealtimeStoreModule })
	ReactModule.useEffect(function() --[[ Line: 114 ]]
		-- upvalues: FFlagExpChatEnableFriendsTab (upval), FFlagAppChatReactiveFeatureRestrictions (upval), ChatModerationStatusDataHydrationModule (copy)
		if FFlagExpChatEnableFriendsTab and not FFlagAppChatReactiveFeatureRestrictions then
			ChatModerationStatusDataHydrationModule.getUserStatus()
		end
	end, { ChatModerationStatusDataHydrationModule })
	ReactModule.useEffect(function() --[[ Line: 120 ]]
		-- upvalues: ExpChatPerfTracker (upval), FriendsChatTabNameModule (upval)
		ExpChatPerfTracker.finish(ExpChatPerfTracker.Events.ChatWindowMountTTI, {}, { tabName = FriendsChatTabNameModule })
		
		return function() --[[ Line: 122 ]]
			-- upvalues: ExpChatPerfTracker (upval)
			ExpChatPerfTracker.cancelAll()
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 126 ]]
		-- upvalues: ExpChatPerfTracker (upval), FriendsChatTabNameModule (upval)
		ExpChatPerfTracker.finish(ExpChatPerfTracker.Events.ChatWindowTabSwitchTTI, { tabId = FriendsChatTabNameModule }, { tabName = FriendsChatTabNameModule })
	end, {})
	local UseSignalStateResult = SignalsReactModule.useSignalState(FriendsChatNavigationStoreModule.getEffectiveConversationId)
	
	if FFlagFriendsChatIxpScreenExposureModule then
		local HasUseSignalStateResult = UseSignalStateResult ~= nil
		local UseRefResult = ReactModule.useRef(nil)
		
		if UseRefResult.current ~= HasUseSignalStateResult then
			UseRefResult.current = HasUseSignalStateResult
			pcall(if HasUseSignalStateResult then Exposure1 else Exposure)
		end
	end
	local ChatWindowSettings = p1.chatWindowSettings or UseMemoResult
	local ParentLayoutOrder = p1.parentLayoutOrder or 1
	local LocalPlayer = Players.LocalPlayer
	local Text = if LocalPlayer then tostring(LocalPlayer.UserId) else nil
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 152 ]]
		-- upvalues: Localization (upval), LocalizationService (upval)
		return Localization.new(LocalizationService.RobloxLocaleId)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 156 ]]
		-- upvalues: FriendsChatRealtimeStoreModule (copy), UseSignalStateResult (copy)
		FriendsChatRealtimeStoreModule.setActiveConversationId(UseSignalStateResult)
		
		return function() --[[ Line: 158 ]]
			-- upvalues: FriendsChatRealtimeStoreModule (upval)
			FriendsChatRealtimeStoreModule.setActiveConversationId(nil)
		end
	end, { FriendsChatRealtimeStoreModule, UseSignalStateResult })
	local UseResult = if FFlagFriendsChatConversationListFocusNav then ReactModule.useCallback(function(): boolean --[[ Line: 171 ]]
		-- upvalues: UseContextResult (ref)
		return UseContextResult ~= nil and UseContextResult.focusedGuiObject:getValue() ~= nil
	end, { UseContextResult }) else nil
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 176 ]]
		-- upvalues: FFlagFriendsChatConversationListFocusNav (upval), UseResult (ref), FFlagFriendsChatFocusInputOnConversationActivatedModule (upval), FriendsChatNavigationStoreModule (copy)
		if FFlagFriendsChatConversationListFocusNav and UseResult() or FFlagFriendsChatFocusInputOnConversationActivatedModule then
			FriendsChatNavigationStoreModule.requestFocusInputBar()
		end
		FriendsChatNavigationStoreModule.setSelectedConversationId(p2)
	end, { FriendsChatNavigationStoreModule, UseResult })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 189 ]]
		-- upvalues: FFlagFriendsChatConversationListFocusNav (upval), UseResult (ref), FriendsChatNavigationStoreModule (copy)
		if FFlagFriendsChatConversationListFocusNav and UseResult() then
			FriendsChatNavigationStoreModule.requestFocusConversationList()
		end
		FriendsChatNavigationStoreModule.setSelectedConversationId(nil)
	end, { FriendsChatNavigationStoreModule, UseResult })
	local UseResult3 = ReactModule.useCallback(function(ConversationId) --[[ Line: 198 ]]
		-- upvalues: ChatSessionRefCountModule (upval), InExperienceAppChatModalModule (upval), EnumScreensModule (upval), SocialCommonModule (upval)
		ChatSessionRefCountModule.reserve()
		InExperienceAppChatModalModule.default:openToScreen({
			screen = EnumScreensModule.ChatDetails,
			params = {
				rooted = true,
				conversationId = ConversationId,
				entryPoint = SocialCommonModule.Enums.ChatEntryPointNames.ExperienceChatTabBar
			}
		})
	end, {})
	local UseResult4 = ReactModule.useCallback(function(p2) --[[ Line: 210 ]]
		-- upvalues: FriendsChatNavigationStoreModule (copy)
		FriendsChatNavigationStoreModule.setSelectedConversationId(p2)
	end, { FriendsChatNavigationStoreModule })
	
	return ReactModule.createElement(LocalizationProvider, { localization = UseMemoResult1 }, {
		Content = ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
			Content = if UseSignalStateResult == nil then ReactModule.createElement(FriendsChatLandingTelemetryProvidersModule, nil, {
				ConversationList = ReactModule.createElement(ConversationListModule, {
					LayoutOrder = ParentLayoutOrder,
					chatWindowSettings = ChatWindowSettings,
					transparencyValue = p1.transparencyValue,
					textTransparency = p1.textTransparency,
					isSpatialUIEnabled = p1.isSpatialUIEnabled,
					onHovered = p1.onHovered,
					onUnhovered = p1.onUnhovered,
					onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
					onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
					onConversationActivated = UseResult1,
					localUserId = Text
				})
			}) else ReactModule.createElement(FriendsChatConversationTelemetryProvidersModule, { conversationId = UseSignalStateResult }, {
				ConversationWindow = ReactModule.createElement(FriendsChatConversationWindowModule, {
					conversationId = UseSignalStateResult,
					parentLayoutOrder = ParentLayoutOrder,
					chatWindowSettings = ChatWindowSettings,
					transparencyValue = p1.transparencyValue,
					textTransparency = p1.textTransparency,
					isSpatialUIEnabled = p1.isSpatialUIEnabled,
					isChannelBarVisible = p1.isChannelBarVisible,
					onHovered = p1.onHovered,
					onUnhovered = p1.onUnhovered,
					onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
					onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
					onBack = UseResult2,
					onOpenDetails = if GetFFlagAppChatEnableRootedNavigationModule() then UseResult3 else nil,
					onFriendPlaceholderConversationCreated = UseResult4
				})
			})
		})
	})
end

return function(p1) --[[ Line: 265 | Named "FriendsChatMain" ]]
	-- upvalues: Players (copy), LocalizationService (copy), RbxAnalyticsService (copy), UseAppChatUpdateSessionModule (copy), ReactModule (copy), FFlagExpChatEnableFriendsTab (copy), ChatPlacementContextModule (copy), SocialCommonModule (copy), UseGetAndSetRefModule (copy), AppTelemetryLayerModule (copy), FriendsChatMainContent (copy)
	local LocalPlayer = Players.LocalPlayer
	local Text: string = if LocalPlayer then tostring(LocalPlayer.UserId) else "unknown"
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local PlaySessionId = RbxAnalyticsService:GetPlaySessionId()
	UseAppChatUpdateSessionModule()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 273 ]]
		-- upvalues: FFlagExpChatEnableFriendsTab (upval), ChatPlacementContextModule (upval), RobloxLocaleId (copy), SocialCommonModule (upval), Text (copy), PlaySessionId (copy)
		return {
			context = "platformChat",
			currentSquadId = nil,
			locale = RobloxLocaleId,
			entryPoint = SocialCommonModule.Enums.ChatEntryPointNames.ExperienceChatTabBar,
			userId = Text,
			placement = if FFlagExpChatEnableFriendsTab then ChatPlacementContextModule.Enum.InExperienceFriendsTab else ChatPlacementContextModule.Enum.InExperienceDefault,
			playSessionId = PlaySessionId
		}
	end, { RobloxLocaleId, Text, PlaySessionId })
	local UseGetAndSetRefModuleResult, UseGetAndSetRefModuleResult2 = UseGetAndSetRefModule(UseMemoResult)
	ReactModule.useEffect(function() --[[ Line: 290 ]]
		-- upvalues: UseGetAndSetRefModuleResult2 (copy), UseMemoResult (copy)
		UseGetAndSetRefModuleResult2(UseMemoResult)
	end, { UseMemoResult, UseGetAndSetRefModuleResult2 })
	
	return ReactModule.createElement(AppTelemetryLayerModule.Provider, { value = UseGetAndSetRefModuleResult }, {
		Content = ReactModule.createElement(FriendsChatMainContent, p1)
	})
end