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
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab

local function FriendsChatMainContent(p0) --[[ line: 60 ]]
	-- upvalues: useFriendsChatVisibilityTelemetryModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), getChatModerationStatusDataHydrationModule (ref), getFriendsChatNavigationStoreModule (ref), getFriendsChatRealtimeStoreModule (ref), fFlagExpChatEnableFriendsTab (ref), expChatPerfTracker (ref), friendsChatTabNameModule (ref), signalsReactModule (ref), playersService (ref), localization (ref), localizationService (ref), chatSessionRefCountModule (ref), inExperienceAppChatModalModule (ref), enumScreensModule (ref), socialCommonModule (ref), friendsChatLandingTelemetryProvidersModule (ref), conversationListModule (ref), friendsChatConversationTelemetryProvidersModule (ref), friendsChatConversationWindowModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), localizationProvider (ref), foundationModule (ref)
	useFriendsChatVisibilityTelemetryModule()
	local var26 = useChatWindowSettingsModule()
	local var27 = reactModule.useMemo(function() --[[ line: 64 ]]
		-- upvalues: var26 (ref)
		return {
			BackgroundColor3 = var26.ChatWindowBackgroundColor3,
			BackgroundTransparency = var26.ChatWindowBackgroundTransparency
		}
	end, { var26 })
	local var28 = getChatModerationStatusDataHydrationModule(false)
	local var29 = getFriendsChatNavigationStoreModule(false)
	local var30 = getFriendsChatRealtimeStoreModule(false)
	reactModule.useEffect(function() --[[ line: 80 ]]
		-- upvalues: var30 (ref)
		var30.markFriendsTabEntered()
	end, { var30 })
	reactModule.useEffect(function() --[[ line: 83 ]]
		-- upvalues: fFlagExpChatEnableFriendsTab (copy), var28 (ref)
		if fFlagExpChatEnableFriendsTab then
			var28.getUserStatus()
		end
	end, { var28 })
	reactModule.useEffect(function() --[[ line: 89 ]]
		-- upvalues: expChatPerfTracker (copy), friendsChatTabNameModule (copy)
		expChatPerfTracker.finish(expChatPerfTracker.Events.ChatWindowMountTTI, {}, { tabName = friendsChatTabNameModule })
		
		return function() --[[ line: 91 ]]
			-- upvalues: expChatPerfTracker (copy)
			expChatPerfTracker.cancelAll()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 95 ]]
		-- upvalues: expChatPerfTracker (copy), friendsChatTabNameModule (copy)
		expChatPerfTracker.finish(expChatPerfTracker.Events.ChatWindowTabSwitchTTI, { tabId = friendsChatTabNameModule }, { tabName = friendsChatTabNameModule })
	end, {})
	local var31 = signalsReactModule.useSignalState(var29.getEffectiveConversationId)
	local chatWindowSettings = p0.chatWindowSettings or var27
	local parentLayoutOrder = p0.parentLayoutOrder or 1
	local localPlayer = playersService.LocalPlayer
	local var34 = if localPlayer then tostring(localPlayer.UserId) else nil
	local var35 = reactModule.useMemo(function() --[[ line: 106 ]]
		-- upvalues: localization (copy), localizationService (copy)
		return localization.new(localizationService.RobloxLocaleId)
	end, {})
	reactModule.useEffect(function() --[[ line: 110 ]]
		-- upvalues: var30 (ref), var31 (ref)
		var30.setActiveConversationId(var31)
		
		return function() --[[ line: 112 ]]
			-- upvalues: var30 (copy)
			var30.setActiveConversationId(nil)
		end
	end, { var30, var31 })
	
	return reactModule.createElement(localizationProvider, { localization = var35 }, {
		Content = reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
			Content = if var31 == nil then reactModule.createElement(friendsChatLandingTelemetryProvidersModule, nil, {
				ConversationList = reactModule.createElement(conversationListModule, {
					LayoutOrder = parentLayoutOrder,
					chatWindowSettings = chatWindowSettings,
					transparencyValue = p0.transparencyValue,
					textTransparency = p0.textTransparency,
					isSpatialUIEnabled = p0.isSpatialUIEnabled,
					onHovered = p0.onHovered,
					onUnhovered = p0.onUnhovered,
					onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged,
					onAbsolutePositionChanged = p0.onAbsolutePositionChanged,
					onConversationActivated = reactModule.useCallback(function(p3) --[[ line: 117 ]]
						-- upvalues: var29 (ref)
						var29.setSelectedConversationId(p3)
					end, { var29 }),
					localUserId = var34
				})
			}) else reactModule.createElement(friendsChatConversationTelemetryProvidersModule, { conversationId = var31 }, {
				ConversationWindow = reactModule.createElement(friendsChatConversationWindowModule, {
					conversationId = var31,
					parentLayoutOrder = parentLayoutOrder,
					chatWindowSettings = chatWindowSettings,
					transparencyValue = p0.transparencyValue,
					textTransparency = p0.textTransparency,
					isSpatialUIEnabled = p0.isSpatialUIEnabled,
					isChannelBarVisible = p0.isChannelBarVisible,
					onHovered = p0.onHovered,
					onUnhovered = p0.onUnhovered,
					onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged,
					onAbsolutePositionChanged = p0.onAbsolutePositionChanged,
					onBack = reactModule.useCallback(function() --[[ line: 121 ]]
						-- upvalues: var29 (ref)
						var29.setSelectedConversationId(nil)
					end, { var29 }),
					onOpenDetails = if getFFlagAppChatEnableRootedNavigationModule() then reactModule.useCallback(function(p1) --[[ line: 125 ]]
						-- upvalues: chatSessionRefCountModule (copy), inExperienceAppChatModalModule (copy), enumScreensModule (copy), socialCommonModule (copy)
						chatSessionRefCountModule.reserve()
						inExperienceAppChatModalModule.default:openToScreen({
							screen = enumScreensModule.ChatDetails,
							params = {
								rooted = true,
								conversationId = p1,
								entryPoint = socialCommonModule.Enums.ChatEntryPointNames.ExperienceChatTabBar
							}
						})
					end, {}) else nil,
					onFriendPlaceholderConversationCreated = reactModule.useCallback(function(p2) --[[ line: 137 ]]
						-- upvalues: var29 (ref)
						var29.setSelectedConversationId(p2)
					end, { var29 })
				})
			})
		})
	})
end

return function(p4) --[[ line: 192 | named "FriendsChatMain" ]]
	-- upvalues: playersService (ref), localizationService (ref), rbxAnalyticsService (ref), useAppChatUpdateSessionModule (ref), reactModule (ref), fFlagExpChatEnableFriendsTab (ref), chatPlacementContextModule (ref), socialCommonModule (ref), useGetAndSetRefModule (ref), appTelemetryLayerModule (ref), FriendsChatMainContent (ref)
	local localPlayer = playersService.LocalPlayer
	local var36 = if localPlayer then tostring(localPlayer.UserId) else "unknown"
	local robloxLocaleId = localizationService.RobloxLocaleId
	local playSessionId = rbxAnalyticsService:GetPlaySessionId()
	useAppChatUpdateSessionModule()
	local var38 = reactModule.useMemo(function() --[[ line: 200 ]]
		-- upvalues: fFlagExpChatEnableFriendsTab (copy), chatPlacementContextModule (copy), robloxLocaleId (ref), socialCommonModule (copy), var36 (ref), playSessionId (ref)
		return {
			context = "platformChat",
			currentSquadId = nil,
			locale = robloxLocaleId,
			entryPoint = socialCommonModule.Enums.ChatEntryPointNames.ExperienceChatTabBar,
			userId = var36,
			placement = if fFlagExpChatEnableFriendsTab then chatPlacementContextModule.Enum.InExperienceFriendsTab else chatPlacementContextModule.Enum.InExperienceDefault,
			playSessionId = playSessionId
		}
	end, { robloxLocaleId, var36, playSessionId })
	local var39, var40 = useGetAndSetRefModule(var38)
	reactModule.useEffect(function() --[[ line: 217 ]]
		-- upvalues: var40 (ref), var38 (ref)
		var40(var38)
	end, { var38, var40 })
	
	return reactModule.createElement(appTelemetryLayerModule.Provider, { value = var39 }, {
		Content = reactModule.createElement(FriendsChatMainContent, p4)
	})
end