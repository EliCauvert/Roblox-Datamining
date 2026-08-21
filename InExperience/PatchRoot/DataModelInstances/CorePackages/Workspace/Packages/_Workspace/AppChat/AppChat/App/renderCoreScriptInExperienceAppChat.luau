local coreGuiService = game:GetService("CoreGui")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local reactRobloxModule = require(parent.ReactRoblox)
local roduxModule = require(parent.Rodux)
local provider = focusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider
local appChatReducerModule = require(appChat.App.AppChatReducer)
local inExperienceAppChatModule = require(appChat.App.InExperienceAppChat)
local inExperienceAppChatProvidersModule = require(appChat.App.InExperienceAppChatProviders)
local fFlagAppChatSignalsMessageStoreModule = require(appChat.Flags.FFlagAppChatSignalsMessageStore)
local fFlagAppChatConversationStoreModule = require(appChat.Flags.FFlagAppChatConversationStore)
local fFlagAppChatFriendsTabIxpEnabledModule = require(appChat.Flags.FFlagAppChatFriendsTabIxpEnabled)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local chatModerationStatusHydrationMiddlewareModule = require(appChat.Middleware.ChatModerationStatusHydrationMiddleware)
local signalsConversationMiddlewareModule = require(appChat.Middleware.SignalsConversationMiddleware)
local signalsMessageIngestionMiddlewareModule = require(appChat.Middleware.SignalsMessageIngestionMiddleware)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local chatPlacementContextModule = require(appChat.Contexts.ChatPlacementContext)

return function(p0, p1, p2) --[[ line: 31 ]]
	-- upvalues: coreGuiService (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), chatPlacementContextModule (ref), reactRobloxModule (ref), roduxModule (ref), fFlagAppChatSignalsMessageStoreModule (ref), signalsMessageIngestionMiddlewareModule (ref), fFlagAppChatConversationStoreModule (ref), signalsConversationMiddlewareModule (ref), fFlagAppChatFriendsTabIxpEnabledModule (ref), fFlagExpChatEnableFriendsTab (ref), appChat (ref), chatModerationStatusHydrationMiddlewareModule (ref), appChatReducerModule (ref), reactFocusNavigationModule (ref), reactModule (ref), provider (ref), inExperienceAppChatProvidersModule (ref), inExperienceAppChatModule (ref)
	local appChat_1 = Instance.new("Folder")
	appChat_1.Name = "AppChat"
	appChat_1.Parent = coreGuiService
	
	if fFlagAppChatPerfTrackingModule then
		appChatPerfTrackerModule.setSharedContext({
			placement = chatPlacementContextModule.Enum.InExperienceDefault
		})
	end
	local var20 = reactRobloxModule.createRoot(appChat_1)
	local list = { roduxModule.thunkMiddleware }
	
	if fFlagAppChatSignalsMessageStoreModule then
		table.insert(list, signalsMessageIngestionMiddlewareModule)
	end
	if fFlagAppChatConversationStoreModule then
		table.insert(list, signalsConversationMiddlewareModule)
	end
	if fFlagAppChatFriendsTabIxpEnabledModule or fFlagExpChatEnableFriendsTab then
		table.insert(list, require(appChat.Middleware.SignalsFriendsChatSettingsMiddleware))
	end
	if fFlagExpChatEnableFriendsTab then
		table.insert(list, chatModerationStatusHydrationMiddlewareModule)
	end
	local var22 = roduxModule.Store.new(appChatReducerModule, nil, list)
	local var23 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
	var20:render((function() --[[ line: 75 | named "AppChatMainWithFocusRoot" ]]
		-- upvalues: reactModule (copy), reactFocusNavigationModule (copy), var23 (ref), provider (copy), inExperienceAppChatProvidersModule (copy), var22 (ref), p2 (ref), p1 (ref), p0 (ref), inExperienceAppChatModule (copy)
		return reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var23 }, {
			FocusNavigationRegistryProvider = reactModule.createElement(provider, nil, {
				InExperienceAppChatProviders = reactModule.createElement(inExperienceAppChatProvidersModule, {
					store = var22,
					updateAppChatUnreadMessagesCount = p2,
					parentContainerContext = p1,
					apolloClient = p0
				}, {
					appChat = reactModule.createElement(inExperienceAppChatModule)
				})
			})
		})
	end)())
	
	return var20
end