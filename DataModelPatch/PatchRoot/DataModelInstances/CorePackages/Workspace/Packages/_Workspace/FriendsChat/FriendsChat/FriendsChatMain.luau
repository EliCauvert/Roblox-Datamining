local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local EnumScreensModule = require(Parent.AppChat.EnumScreens)
local InExperienceAppChatModalModule = require(Parent.AppChat.InExperienceAppChatModal)
local GetFFlagAppChatEnableRootedNavigationModule = require(Parent.AppChat.getFFlagAppChatEnableRootedNavigation)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.RobloxAppLocales).Localization
local UseChatWindowSettingsModule = require(Parent.ExpChatIntegration.useChatWindowSettings)
local AppTelemetryLayerModule = require(Parent.AppChat.AppTelemetryLayer)
local ChatPlacementContextModule = require(Parent.AppChat.ChatPlacementContext)
local UseGetAndSetRefModule = require(Parent.AppChat.useGetAndSetRef)
local SocialCommonModule = require(Parent.SocialCommon)
local ConversationListModule = require(script.Parent.ConversationList)
local FriendsChatConversationWindowModule = require(script.Parent.ConversationWindow.FriendsChatConversationWindow)
local GetFriendsChatNavigationStoreModule = require(script.Parent.Stores.GetFriendsChatNavigationStore)
local GetFriendsChatRealtimeStoreModule = require(script.Parent.Stores.GetFriendsChatRealtimeStore)
local UseFriendsChatVisibilityTelemetryModule = require(script.Parent.Telemetry.App.useFriendsChatVisibilityTelemetry)
local FriendsChatLandingTelemetryProvidersModule = require(script.Parent.Telemetry.ChatLanding.FriendsChatLandingTelemetryProviders)
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab

local function FriendsChatMainContent(p1)
	-- upvalues: UseFriendsChatVisibilityTelemetryModule (copy), UseChatWindowSettingsModule (copy), ReactModule (copy), GetFriendsChatNavigationStoreModule (copy), GetFriendsChatRealtimeStoreModule (copy), SignalsReactModule (copy), Players (copy), Localization (copy), LocalizationService (copy), InExperienceAppChatModalModule (copy), EnumScreensModule (copy), FriendsChatLandingTelemetryProvidersModule (copy), ConversationListModule (copy), FriendsChatConversationWindowModule (copy), GetFFlagAppChatEnableRootedNavigationModule (copy), LocalizationProvider (copy), FoundationModule (copy)
	UseFriendsChatVisibilityTelemetryModule()
	local UseChatWindowSettingsModuleResult = UseChatWindowSettingsModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseChatWindowSettingsModuleResult (copy)
		return {
			BackgroundColor3 = UseChatWindowSettingsModuleResult.ChatWindowBackgroundColor3,
			BackgroundTransparency = UseChatWindowSettingsModuleResult.ChatWindowBackgroundTransparency
		}
	end, { UseChatWindowSettingsModuleResult })
	local FriendsChatNavigationStoreModule = GetFriendsChatNavigationStoreModule(false)
	local FriendsChatRealtimeStoreModule = GetFriendsChatRealtimeStoreModule(false)
	ReactModule.useEffect(function()
		-- upvalues: FriendsChatRealtimeStoreModule (copy)
		FriendsChatRealtimeStoreModule.markFriendsTabEntered()
	end, { FriendsChatRealtimeStoreModule })
	local UseSignalStateResult = SignalsReactModule.useSignalState(FriendsChatNavigationStoreModule.getSelectedConversationId)
	local ChatWindowSettings = p1.chatWindowSettings or UseMemoResult
	local ParentLayoutOrder = p1.parentLayoutOrder or 1
	local LocalPlayer = Players.LocalPlayer
	local Text = if LocalPlayer then tostring(LocalPlayer.UserId) else nil
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Localization (upval), LocalizationService (upval)
		return Localization.new(LocalizationService.RobloxLocaleId)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: FriendsChatRealtimeStoreModule (copy), UseSignalStateResult (copy)
		FriendsChatRealtimeStoreModule.setActiveConversationId(UseSignalStateResult)
		
		return function()
			-- upvalues: FriendsChatRealtimeStoreModule (upval)
			FriendsChatRealtimeStoreModule.setActiveConversationId(nil)
		end
	end, { FriendsChatRealtimeStoreModule, UseSignalStateResult })
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: FriendsChatNavigationStoreModule (copy)
		FriendsChatNavigationStoreModule.setSelectedConversationId(p2)
	end, { FriendsChatNavigationStoreModule })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: FriendsChatNavigationStoreModule (copy)
		FriendsChatNavigationStoreModule.setSelectedConversationId(nil)
	end, { FriendsChatNavigationStoreModule })
	local UseResult2 = ReactModule.useCallback(function(ConversationId)
		-- upvalues: InExperienceAppChatModalModule (upval), EnumScreensModule (upval)
		InExperienceAppChatModalModule.default:openToScreen({
			screen = EnumScreensModule.ChatDetails,
			params = { rooted = true, conversationId = ConversationId }
		})
	end, {})
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: FriendsChatNavigationStoreModule (copy)
		FriendsChatNavigationStoreModule.setSelectedConversationId(p2)
	end, { FriendsChatNavigationStoreModule })
	
	return ReactModule.createElement(LocalizationProvider, { localization = UseMemoResult1 }, {
		Content = ReactModule.createElement(FoundationModule.FoundationProvider, { theme = FoundationModule.Enums.Theme.Dark }, {
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
					onConversationActivated = UseResult,
					localUserId = Text
				})
			}) else ReactModule.createElement(FriendsChatConversationWindowModule, {
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
				onBack = UseResult1,
				onOpenDetails = if GetFFlagAppChatEnableRootedNavigationModule() then UseResult2 else nil,
				onFriendPlaceholderConversationCreated = UseResult3
			})
		})
	})
end

return function(p1)
	-- upvalues: Players (copy), LocalizationService (copy), RbxAnalyticsService (copy), ReactModule (copy), FFlagExpChatEnableFriendsTab (copy), ChatPlacementContextModule (copy), SocialCommonModule (copy), UseGetAndSetRefModule (copy), AppTelemetryLayerModule (copy), FriendsChatMainContent (copy)
	local LocalPlayer = Players.LocalPlayer
	local Text: string = if LocalPlayer then tostring(LocalPlayer.UserId) else "unknown"
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local PlaySessionId = RbxAnalyticsService:GetPlaySessionId()
	local UseMemoResult = ReactModule.useMemo(function()
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
	ReactModule.useEffect(function()
		-- upvalues: UseGetAndSetRefModuleResult2 (copy), UseMemoResult (copy)
		UseGetAndSetRefModuleResult2(UseMemoResult)
	end, { UseMemoResult, UseGetAndSetRefModuleResult2 })
	
	return ReactModule.createElement(AppTelemetryLayerModule.Provider, { value = UseGetAndSetRefModuleResult }, {
		Content = ReactModule.createElement(FriendsChatMainContent, p1)
	})
end