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
local conversationListModule = require(script.Parent.ConversationList)
local friendsChatConversationWindowModule = require(script.Parent.ConversationWindow.FriendsChatConversationWindow)
local getFriendsChatNavigationStoreModule = require(script.Parent.Stores.GetFriendsChatNavigationStore)
local getFriendsChatRealtimeStoreModule = require(script.Parent.Stores.GetFriendsChatRealtimeStore)
local useFriendsChatVisibilityTelemetryModule = require(script.Parent.Telemetry.App.useFriendsChatVisibilityTelemetry)
local friendsChatLandingTelemetryProvidersModule = require(script.Parent.Telemetry.ChatLanding.FriendsChatLandingTelemetryProviders)
local friendsChatConversationTelemetryProvidersModule = require(script.Parent.Telemetry.ChatConversation.FriendsChatConversationTelemetryProviders)
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab

local function FriendsChatMainContent(p0) --[[ line: 59 ]]
	-- upvalues: useFriendsChatVisibilityTelemetryModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), getChatModerationStatusDataHydrationModule (ref), getFriendsChatNavigationStoreModule (ref), getFriendsChatRealtimeStoreModule (ref), fFlagExpChatEnableFriendsTab (ref), expChatPerfTracker (ref), signalsReactModule (ref), playersService (ref), localization (ref), localizationService (ref), chatSessionRefCountModule (ref), inExperienceAppChatModalModule (ref), enumScreensModule (ref), socialCommonModule (ref), friendsChatLandingTelemetryProvidersModule (ref), conversationListModule (ref), friendsChatConversationTelemetryProvidersModule (ref), friendsChatConversationWindowModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), localizationProvider (ref), foundationModule (ref)
	useFriendsChatVisibilityTelemetryModule()
	local var25 = useChatWindowSettingsModule()
	local var26 = reactModule.useMemo(function() --[[ line: 63 ]]
		-- upvalues: var25 (ref)
		return {
			BackgroundColor3 = var25.ChatWindowBackgroundColor3,
			BackgroundTransparency = var25.ChatWindowBackgroundTransparency
		}
	end, { var25 })
	local var27 = getChatModerationStatusDataHydrationModule(false)
	local var28 = getFriendsChatNavigationStoreModule(false)
	local var29 = getFriendsChatRealtimeStoreModule(false)
	reactModule.useEffect(function() --[[ line: 79 ]]
		-- upvalues: var29 (ref)
		var29.markFriendsTabEntered()
	end, { var29 })
	reactModule.useEffect(function() --[[ line: 82 ]]
		-- upvalues: fFlagExpChatEnableFriendsTab (copy), var27 (ref)
		if fFlagExpChatEnableFriendsTab then
			var27.getUserStatus()
		end
	end, { var27 })
	reactModule.useEffect(function() --[[ line: 89 ]]
		-- upvalues: expChatPerfTracker (copy)
		expChatPerfTracker.finish(expChatPerfTracker.Events.ChatWindowMountTTI, {}, { tabName = "FriendsChat" })
		
		return function() --[[ line: 91 ]]
			-- upvalues: expChatPerfTracker (copy)
			expChatPerfTracker.cancelAll()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 95 ]]
		-- upvalues: expChatPerfTracker (copy)
		expChatPerfTracker.finish(expChatPerfTracker.Events.ChatWindowTabSwitchTTI, { tabId = "FriendsChat" }, { tabName = "FriendsChat" })
	end, {})
	local var30 = signalsReactModule.useSignalState(var28.getSelectedConversationId)
	local chatWindowSettings = p0.chatWindowSettings or var26
	local parentLayoutOrder = p0.parentLayoutOrder or 1
	local localPlayer = playersService.LocalPlayer
	local var33 = if localPlayer then tostring(localPlayer.UserId) else nil
	local var34 = reactModule.useMemo(function() --[[ line: 106 ]]
		-- upvalues: localization (copy), localizationService (copy)
		return localization.new(localizationService.RobloxLocaleId)
	end, {})
	reactModule.useEffect(function() --[[ line: 110 ]]
		-- upvalues: var29 (ref), var30 (ref)
		var29.setActiveConversationId(var30)
		
		return function() --[[ line: 112 ]]
			-- upvalues: var29 (copy)
			var29.setActiveConversationId(nil)
		end
	end, { var29, var30 })
	
	return reactModule.createElement(localizationProvider, { localization = var34 }, {
		Content = reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
			Content = if var30 == nil then reactModule.createElement(friendsChatLandingTelemetryProvidersModule, nil, {
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
						-- upvalues: var28 (ref)
						var28.setSelectedConversationId(p3)
					end, { var28 }),
					localUserId = var33
				})
			}) else reactModule.createElement(friendsChatConversationTelemetryProvidersModule, { conversationId = var30 }, {
				ConversationWindow = reactModule.createElement(friendsChatConversationWindowModule, {
					conversationId = var30,
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
						-- upvalues: var28 (ref)
						var28.setSelectedConversationId(nil)
					end, { var28 }),
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
						-- upvalues: var28 (ref)
						var28.setSelectedConversationId(p2)
					end, { var28 })
				})
			})
		})
	})
end

return function(p4) --[[ line: 192 | named "FriendsChatMain" ]]
	-- upvalues: playersService (ref), localizationService (ref), rbxAnalyticsService (ref), useAppChatUpdateSessionModule (ref), reactModule (ref), fFlagExpChatEnableFriendsTab (ref), chatPlacementContextModule (ref), socialCommonModule (ref), useGetAndSetRefModule (ref), appTelemetryLayerModule (ref), FriendsChatMainContent (ref)
	local localPlayer = playersService.LocalPlayer
	local var35 = if localPlayer then tostring(localPlayer.UserId) else "unknown"
	local robloxLocaleId = localizationService.RobloxLocaleId
	local playSessionId = rbxAnalyticsService:GetPlaySessionId()
	useAppChatUpdateSessionModule()
	local var37 = reactModule.useMemo(function() --[[ line: 200 ]]
		-- upvalues: fFlagExpChatEnableFriendsTab (copy), chatPlacementContextModule (copy), robloxLocaleId (ref), socialCommonModule (copy), var35 (ref), playSessionId (ref)
		return {
			context = "platformChat",
			currentSquadId = nil,
			locale = robloxLocaleId,
			entryPoint = socialCommonModule.Enums.ChatEntryPointNames.ExperienceChatTabBar,
			userId = var35,
			placement = if fFlagExpChatEnableFriendsTab then chatPlacementContextModule.Enum.InExperienceFriendsTab else chatPlacementContextModule.Enum.InExperienceDefault,
			playSessionId = playSessionId
		}
	end, { robloxLocaleId, var35, playSessionId })
	local var38, var39 = useGetAndSetRefModule(var37)
	reactModule.useEffect(function() --[[ line: 217 ]]
		-- upvalues: var39 (ref), var37 (ref)
		var39(var37)
	end, { var37, var39 })
	
	return reactModule.createElement(appTelemetryLayerModule.Provider, { value = var38 }, {
		Content = reactModule.createElement(FriendsChatMainContent, p4)
	})
end