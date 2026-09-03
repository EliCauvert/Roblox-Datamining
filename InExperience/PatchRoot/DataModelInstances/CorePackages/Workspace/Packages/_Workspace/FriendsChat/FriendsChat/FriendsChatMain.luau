local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local enumScreensModule = require(parent.AppChat.EnumScreens)
local getChatModerationStatusDataHydrationModule = require(parent.AppChat.GetChatModerationStatusDataHydration)
local inExperienceAppChatModalModule = require(parent.AppChat.InExperienceAppChatModal)
local getFFlagAppChatEnableRootedNavigationModule = require(parent.AppChat.getFFlagAppChatEnableRootedNavigation)
local localizationProvider = require(parent.Localization).LocalizationProvider
local localization = require(parent.RobloxAppLocales).Localization
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local appTelemetryLayerModule = require(parent.AppChat.AppTelemetryLayer)
local chatPlacementContextModule = require(parent.AppChat.ChatPlacementContext)
local chatSessionRefCountModule = require(parent.AppChat.ChatSessionRefCount)
local useAppChatUpdateSessionModule = require(parent.AppChat.useAppChatUpdateSession)
local useGetAndSetRefModule = require(parent.AppChat.useGetAndSetRef)
local usePartyChatReactiveFeatureRestrictionModule = require(parent.AppChat.usePartyChatReactiveFeatureRestriction)
local socialCommonModule = require(parent.SocialCommon)
local friendsChatTabNameModule = require(script.Parent.FriendsChatTabName)
local conversationListModule = require(script.Parent.ConversationList)
local friendsChatConversationWindowModule = require(script.Parent.ConversationWindow.FriendsChatConversationWindow)
local getFriendsChatNavigationStoreModule = require(script.Parent.Stores.GetFriendsChatNavigationStore)
local getFriendsChatRealtimeStoreModule = require(script.Parent.Stores.GetFriendsChatRealtimeStore)
local useFriendsChatVisibilityTelemetryModule = require(script.Parent.Telemetry.App.useFriendsChatVisibilityTelemetry)
local friendsChatLandingTelemetryProvidersModule = require(script.Parent.Telemetry.ChatLanding.FriendsChatLandingTelemetryProviders)
local friendsChatConversationTelemetryProvidersModule = require(script.Parent.Telemetry.ChatConversation.FriendsChatConversationTelemetryProviders)
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAppChatReactiveFeatureRestrictions = sharedFlagsModule.FFlagAppChatReactiveFeatureRestrictions
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab

local function FriendsChatMainContent(p1)
	-- upvalues: useFriendsChatVisibilityTelemetryModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), getChatModerationStatusDataHydrationModule (ref), getFriendsChatNavigationStoreModule (ref), getFriendsChatRealtimeStoreModule (ref), fFlagAppChatReactiveFeatureRestrictions (ref), usePartyChatReactiveFeatureRestrictionModule (ref), fFlagExpChatEnableFriendsTab (ref), expChatPerfTracker (ref), friendsChatTabNameModule (ref), signalsReactModule (ref), playersService (ref), localization (ref), localizationService (ref), chatSessionRefCountModule (ref), inExperienceAppChatModalModule (ref), enumScreensModule (ref), socialCommonModule (ref), friendsChatLandingTelemetryProvidersModule (ref), conversationListModule (ref), friendsChatConversationTelemetryProvidersModule (ref), friendsChatConversationWindowModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), localizationProvider (ref), foundationModule (ref)
	useFriendsChatVisibilityTelemetryModule()
	local var1 = useChatWindowSettingsModule()
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return {
			BackgroundColor3 = var1.ChatWindowBackgroundColor3,
			BackgroundTransparency = var1.ChatWindowBackgroundTransparency
		}
	end, { var1 })
	local var3 = getChatModerationStatusDataHydrationModule(false)
	local var4 = getFriendsChatNavigationStoreModule(false)
	local var5 = getFriendsChatRealtimeStoreModule(false)
	
	if fFlagAppChatReactiveFeatureRestrictions then
		usePartyChatReactiveFeatureRestrictionModule(true)
	end
	reactModule.useEffect(function()
		-- upvalues: var5 (ref)
		var5.markFriendsTabEntered()
	end, { var5 })
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatEnableFriendsTab (copy), fFlagAppChatReactiveFeatureRestrictions (copy), var3 (ref)
		if fFlagExpChatEnableFriendsTab and not fFlagAppChatReactiveFeatureRestrictions then
			var3.getUserStatus()
		end
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: expChatPerfTracker (copy), friendsChatTabNameModule (copy)
		expChatPerfTracker.finish(expChatPerfTracker.Events.ChatWindowMountTTI, {}, { tabName = friendsChatTabNameModule })
		
		return function()
			-- upvalues: expChatPerfTracker (copy)
			expChatPerfTracker.cancelAll()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: expChatPerfTracker (copy), friendsChatTabNameModule (copy)
		expChatPerfTracker.finish(expChatPerfTracker.Events.ChatWindowTabSwitchTTI, { tabId = friendsChatTabNameModule }, { tabName = friendsChatTabNameModule })
	end, {})
	local var6 = signalsReactModule.useSignalState(var4.getEffectiveConversationId)
	local chatWindowSettings = p1.chatWindowSettings or var2
	local parentLayoutOrder = p1.parentLayoutOrder or 1
	local localPlayer = playersService.LocalPlayer
	local var7 = if localPlayer then tostring(localPlayer.UserId) else nil
	local var8 = reactModule.useMemo(function()
		-- upvalues: localization (copy), localizationService (copy)
		return localization.new(localizationService.RobloxLocaleId)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var6 (ref)
		var5.setActiveConversationId(var6)
		
		return function()
			-- upvalues: var5 (copy)
			var5.setActiveConversationId(nil)
		end
	end, { var5, var6 })
	
	return reactModule.createElement(localizationProvider, { localization = var8 }, {
		Content = reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
			Content = if var6 == nil then reactModule.createElement(friendsChatLandingTelemetryProvidersModule, nil, {
				ConversationList = reactModule.createElement(conversationListModule, {
					LayoutOrder = parentLayoutOrder,
					chatWindowSettings = chatWindowSettings,
					transparencyValue = p1.transparencyValue,
					textTransparency = p1.textTransparency,
					isSpatialUIEnabled = p1.isSpatialUIEnabled,
					onHovered = p1.onHovered,
					onUnhovered = p1.onUnhovered,
					onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
					onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
					onConversationActivated = reactModule.useCallback(function(p2)
						-- upvalues: var4 (ref)
						var4.setSelectedConversationId(p2)
					end, { var4 }),
					localUserId = var7
				})
			}) else reactModule.createElement(friendsChatConversationTelemetryProvidersModule, { conversationId = var6 }, {
				ConversationWindow = reactModule.createElement(friendsChatConversationWindowModule, {
					conversationId = var6,
					parentLayoutOrder = parentLayoutOrder,
					chatWindowSettings = chatWindowSettings,
					transparencyValue = p1.transparencyValue,
					textTransparency = p1.textTransparency,
					isSpatialUIEnabled = p1.isSpatialUIEnabled,
					isChannelBarVisible = p1.isChannelBarVisible,
					onHovered = p1.onHovered,
					onUnhovered = p1.onUnhovered,
					onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
					onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
					onBack = reactModule.useCallback(function()
						-- upvalues: var4 (ref)
						var4.setSelectedConversationId(nil)
					end, { var4 }),
					onOpenDetails = if getFFlagAppChatEnableRootedNavigationModule() then reactModule.useCallback(function(p2)
						-- upvalues: chatSessionRefCountModule (copy), inExperienceAppChatModalModule (copy), enumScreensModule (copy), socialCommonModule (copy)
						chatSessionRefCountModule.reserve()
						inExperienceAppChatModalModule.default:openToScreen({
							screen = enumScreensModule.ChatDetails,
							params = {
								rooted = true,
								conversationId = p2,
								entryPoint = socialCommonModule.Enums.ChatEntryPointNames.ExperienceChatTabBar
							}
						})
					end, {}) else nil,
					onFriendPlaceholderConversationCreated = reactModule.useCallback(function(p2)
						-- upvalues: var4 (ref)
						var4.setSelectedConversationId(p2)
					end, { var4 })
				})
			})
		})
	})
end

return function(p1)
	-- upvalues: playersService (ref), localizationService (ref), rbxAnalyticsService (ref), useAppChatUpdateSessionModule (ref), reactModule (ref), fFlagExpChatEnableFriendsTab (ref), chatPlacementContextModule (ref), socialCommonModule (ref), useGetAndSetRefModule (ref), appTelemetryLayerModule (ref), FriendsChatMainContent (ref)
	local localPlayer = playersService.LocalPlayer
	local var1 = if localPlayer then tostring(localPlayer.UserId) else "unknown"
	local robloxLocaleId = localizationService.RobloxLocaleId
	local playSessionId = rbxAnalyticsService:GetPlaySessionId()
	useAppChatUpdateSessionModule()
	local var2 = reactModule.useMemo(function()
		-- upvalues: fFlagExpChatEnableFriendsTab (copy), chatPlacementContextModule (copy), robloxLocaleId (ref), socialCommonModule (copy), var1 (ref), playSessionId (ref)
		return {
			context = "platformChat",
			currentSquadId = nil,
			locale = robloxLocaleId,
			entryPoint = socialCommonModule.Enums.ChatEntryPointNames.ExperienceChatTabBar,
			userId = var1,
			placement = if fFlagExpChatEnableFriendsTab then chatPlacementContextModule.Enum.InExperienceFriendsTab else chatPlacementContextModule.Enum.InExperienceDefault,
			playSessionId = playSessionId
		}
	end, { robloxLocaleId, var1, playSessionId })
	local var3, var4 = useGetAndSetRefModule(var2)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var2 (ref)
		var4(var2)
	end, { var2, var4 })
	
	return reactModule.createElement(appTelemetryLayerModule.Provider, { value = var3 }, {
		Content = reactModule.createElement(FriendsChatMainContent, p1)
	})
end