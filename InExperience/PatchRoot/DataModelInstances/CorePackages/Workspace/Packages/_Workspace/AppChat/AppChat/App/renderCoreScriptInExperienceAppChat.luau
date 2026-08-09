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
local signalsConversationMiddlewareModule = require(appChat.Middleware.SignalsConversationMiddleware)
local signalsMessageIngestionMiddlewareModule = require(appChat.Middleware.SignalsMessageIngestionMiddleware)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local chatPlacementContextModule = require(appChat.Contexts.ChatPlacementContext)

return function(p0, p1, p2) --[[ line: 28 ]]
	-- upvalues: coreGuiService (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), chatPlacementContextModule (ref), reactRobloxModule (ref), roduxModule (ref), fFlagAppChatSignalsMessageStoreModule (ref), signalsMessageIngestionMiddlewareModule (ref), fFlagAppChatConversationStoreModule (ref), signalsConversationMiddlewareModule (ref), appChatReducerModule (ref), reactFocusNavigationModule (ref), reactModule (ref), provider (ref), inExperienceAppChatProvidersModule (ref), inExperienceAppChatModule (ref)
	local appChat = Instance.new("Folder")
	appChat.Name = "AppChat"
	appChat.Parent = coreGuiService
	
	if fFlagAppChatPerfTrackingModule then
		appChatPerfTrackerModule.setSharedContext({
			placement = chatPlacementContextModule.Enum.InExperienceDefault
		})
	end
	local var18 = reactRobloxModule.createRoot(appChat)
	local list = { roduxModule.thunkMiddleware }
	
	if fFlagAppChatSignalsMessageStoreModule then
		table.insert(list, signalsMessageIngestionMiddlewareModule)
	end
	if fFlagAppChatConversationStoreModule then
		table.insert(list, signalsConversationMiddlewareModule)
	end
	local var20 = roduxModule.Store.new(appChatReducerModule, nil, list)
	local var21 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
	var18:render((function() --[[ line: 64 | named "AppChatMainWithFocusRoot" ]]
		-- upvalues: reactModule (copy), reactFocusNavigationModule (copy), var21 (ref), provider (copy), inExperienceAppChatProvidersModule (copy), var20 (ref), p2 (ref), p1 (ref), p0 (ref), inExperienceAppChatModule (copy)
		return reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var21 }, {
			FocusNavigationRegistryProvider = reactModule.createElement(provider, nil, {
				InExperienceAppChatProviders = reactModule.createElement(inExperienceAppChatProvidersModule, {
					store = var20,
					updateAppChatUnreadMessagesCount = p2,
					parentContainerContext = p1,
					apolloClient = p0
				}, {
					appChat = reactModule.createElement(inExperienceAppChatModule)
				})
			})
		})
	end)())
	
	return var18
end