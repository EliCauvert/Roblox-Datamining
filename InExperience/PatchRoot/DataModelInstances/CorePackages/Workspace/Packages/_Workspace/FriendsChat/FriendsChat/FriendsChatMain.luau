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
local IXPNavigationUtilsModule = require(parent.AppChat.IXPNavigationUtils)
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
local fFlagFriendsChatIxpScreenExposureModule = require(script.Parent.Flags.FFlagFriendsChatIxpScreenExposure)
local var1 = IXPNavigationUtilsModule.createExposureHandler(require(script.Parent.Flags.FStringFriendsChatLandingPageIxpLayer))
local var2 = IXPNavigationUtilsModule.createExposureHandler(require(script.Parent.Flags.FStringFriendsChatConversationPageIxpLayer))

local function FriendsChatMainContent(p1)
	-- upvalues: useFriendsChatVisibilityTelemetryModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), getChatModerationStatusDataHydrationModule (ref), getFriendsChatNavigationStoreModule (ref), getFriendsChatRealtimeStoreModule (ref), fFlagAppChatReactiveFeatureRestrictions (ref), usePartyChatReactiveFeatureRestrictionModule (ref), fFlagExpChatEnableFriendsTab (ref), expChatPerfTracker (ref), friendsChatTabNameModule (ref), signalsReactModule (ref), fFlagFriendsChatIxpScreenExposureModule (ref), var2 (ref), var1 (ref), playersService (ref), localization (ref), localizationService (ref), chatSessionRefCountModule (ref), inExperienceAppChatModalModule (ref), enumScreensModule (ref), socialCommonModule (ref), friendsChatLandingTelemetryProvidersModule (ref), conversationListModule (ref), friendsChatConversationTelemetryProvidersModule (ref), friendsChatConversationWindowModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), localizationProvider (ref), foundationModule (ref)
	useFriendsChatVisibilityTelemetryModule()
	local var3 = useChatWindowSettingsModule()
	local var4 = reactModule.useMemo(function()
		-- upvalues: var3 (ref)
		return {
			BackgroundColor3 = var3.ChatWindowBackgroundColor3,
			BackgroundTransparency = var3.ChatWindowBackgroundTransparency
		}
	end, { var3 })
	local var5 = getChatModerationStatusDataHydrationModule(false)
	local var6 = getFriendsChatNavigationStoreModule(false)
	local var7 = getFriendsChatRealtimeStoreModule(false)
	
	if fFlagAppChatReactiveFeatureRestrictions then
		usePartyChatReactiveFeatureRestrictionModule(true)
	end
	reactModule.useEffect(function()
		-- upvalues: var7 (ref)
		var7.markFriendsTabEntered()
	end, { var7 })
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatEnableFriendsTab (copy), fFlagAppChatReactiveFeatureRestrictions (copy), var5 (ref)
		if fFlagExpChatEnableFriendsTab and not fFlagAppChatReactiveFeatureRestrictions then
			var5.getUserStatus()
		end
	end, { var5 })
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
	local var8 = signalsReactModule.useSignalState(var6.getEffectiveConversationId)
	
	if fFlagFriendsChatIxpScreenExposureModule then
		local var9 = var8 ~= nil
		local var10 = reactModule.useRef(nil)
		
		if var10.current ~= var9 then
			var10.current = var9
			pcall(if var9 then var2 else var1)
		end
	end
	local chatWindowSettings = p1.chatWindowSettings or var4
	local parentLayoutOrder = p1.parentLayoutOrder or 1
	local localPlayer = playersService.LocalPlayer
	local var11 = if localPlayer then tostring(localPlayer.UserId) else nil
	local var12 = reactModule.useMemo(function()
		-- upvalues: localization (copy), localizationService (copy)
		return localization.new(localizationService.RobloxLocaleId)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var8 (ref)
		var7.setActiveConversationId(var8)
		
		return function()
			-- upvalues: var7 (copy)
			var7.setActiveConversationId(nil)
		end
	end, { var7, var8 })
	
	return reactModule.createElement(localizationProvider, { localization = var12 }, {
		Content = reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
			Content = if var8 == nil then reactModule.createElement(friendsChatLandingTelemetryProvidersModule, nil, {
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
						-- upvalues: var6 (ref)
						var6.setSelectedConversationId(p2)
					end, { var6 }),
					localUserId = var11
				})
			}) else reactModule.createElement(friendsChatConversationTelemetryProvidersModule, { conversationId = var8 }, {
				ConversationWindow = reactModule.createElement(friendsChatConversationWindowModule, {
					conversationId = var8,
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
						-- upvalues: var6 (ref)
						var6.setSelectedConversationId(nil)
					end, { var6 }),
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
						-- upvalues: var6 (ref)
						var6.setSelectedConversationId(p2)
					end, { var6 })
				})
			})
		})
	})
end

return function(p1)
	-- upvalues: playersService (ref), localizationService (ref), rbxAnalyticsService (ref), useAppChatUpdateSessionModule (ref), reactModule (ref), fFlagExpChatEnableFriendsTab (ref), chatPlacementContextModule (ref), socialCommonModule (ref), useGetAndSetRefModule (ref), appTelemetryLayerModule (ref), FriendsChatMainContent (ref)
	local localPlayer = playersService.LocalPlayer
	local var3 = if localPlayer then tostring(localPlayer.UserId) else "unknown"
	local robloxLocaleId = localizationService.RobloxLocaleId
	local playSessionId = rbxAnalyticsService:GetPlaySessionId()
	useAppChatUpdateSessionModule()
	local var4 = reactModule.useMemo(function()
		-- upvalues: fFlagExpChatEnableFriendsTab (copy), chatPlacementContextModule (copy), robloxLocaleId (ref), socialCommonModule (copy), var3 (ref), playSessionId (ref)
		return {
			context = "platformChat",
			currentSquadId = nil,
			locale = robloxLocaleId,
			entryPoint = socialCommonModule.Enums.ChatEntryPointNames.ExperienceChatTabBar,
			userId = var3,
			placement = if fFlagExpChatEnableFriendsTab then chatPlacementContextModule.Enum.InExperienceFriendsTab else chatPlacementContextModule.Enum.InExperienceDefault,
			playSessionId = playSessionId
		}
	end, { robloxLocaleId, var3, playSessionId })
	local var5, var6 = useGetAndSetRefModule(var4)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var4 (ref)
		var6(var4)
	end, { var4, var6 })
	
	return reactModule.createElement(appTelemetryLayerModule.Provider, { value = var5 }, {
		Content = reactModule.createElement(FriendsChatMainContent, p1)
	})
end