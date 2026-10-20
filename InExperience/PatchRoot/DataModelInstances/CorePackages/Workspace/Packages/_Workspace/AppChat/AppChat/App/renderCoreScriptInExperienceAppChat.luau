local CoreGui = game:GetService("CoreGui")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ReactRobloxModule = require(Parent.ReactRoblox)
local RoduxModule = require(Parent.Rodux)
local Provider = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local AppChatReducerModule = require(AppChat.App.AppChatReducer)
local InExperienceAppChatModule = require(AppChat.App.InExperienceAppChat)
local InExperienceAppChatProvidersModule = require(AppChat.App.InExperienceAppChatProviders)
local FFlagAppChatSignalsMessageStoreModule = require(AppChat.Flags.FFlagAppChatSignalsMessageStore)
local FFlagAppChatConversationStoreModule = require(AppChat.Flags.FFlagAppChatConversationStore)
local FFlagAppChatFriendsTabIxpEnabledModule = require(AppChat.Flags.FFlagAppChatFriendsTabIxpEnabled)
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local FFlagUseSignalsForSquadExperienceInvite = require(Parent.SharedFlags).FFlagUseSignalsForSquadExperienceInvite
local ChatModerationStatusHydrationMiddlewareModule = require(AppChat.Middleware.ChatModerationStatusHydrationMiddleware)
local SignalsConversationMiddlewareModule = require(AppChat.Middleware.SignalsConversationMiddleware)
local SignalsMessageIngestionMiddlewareModule = require(AppChat.Middleware.SignalsMessageIngestionMiddleware)
local SignalsUnreadMessageCountMiddlewareModule = require(AppChat.Middleware.SignalsUnreadMessageCountMiddleware)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local ChatPlacementContextModule = require(AppChat.Contexts.ChatPlacementContext)

return function(ApolloClient, ParentContainerContext, UpdateAppChatUnreadMessagesCount)
	-- upvalues: CoreGui (copy), FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), ChatPlacementContextModule (copy), ReactRobloxModule (copy), RoduxModule (copy), FFlagAppChatSignalsMessageStoreModule (copy), SignalsMessageIngestionMiddlewareModule (copy), FFlagAppChatConversationStoreModule (copy), SignalsConversationMiddlewareModule (copy), FFlagAppChatFriendsTabIxpEnabledModule (copy), FFlagExpChatEnableFriendsTab (copy), AppChat (copy), ChatModerationStatusHydrationMiddlewareModule (copy), SignalsUnreadMessageCountMiddlewareModule (copy), FFlagUseSignalsForSquadExperienceInvite (copy), Parent (copy), AppChatReducerModule (copy), ReactFocusNavigationModule (copy), ReactModule (copy), Provider (copy), InExperienceAppChatProvidersModule (copy), InExperienceAppChatModule (copy)
	local AppChat1 = Instance.new("Folder")
	AppChat1.Name = "AppChat"
	AppChat1.Parent = CoreGui
	
	if FFlagAppChatPerfTrackingModule then
		AppChatPerfTrackerModule.setSharedContext({
			placement = ChatPlacementContextModule.Enum.InExperienceDefault
		})
	end
	local Root = ReactRobloxModule.createRoot(AppChat1)
	local List = { RoduxModule.thunkMiddleware }
	
	if FFlagAppChatSignalsMessageStoreModule then
		table.insert(List, SignalsMessageIngestionMiddlewareModule)
	end
	if FFlagAppChatConversationStoreModule then
		table.insert(List, SignalsConversationMiddlewareModule)
	end
	if FFlagAppChatFriendsTabIxpEnabledModule or FFlagExpChatEnableFriendsTab then
		table.insert(List, require(AppChat.Middleware.SignalsFriendsChatSettingsMiddleware))
	end
	if FFlagExpChatEnableFriendsTab then
		table.insert(List, ChatModerationStatusHydrationMiddlewareModule)
	end
	table.insert(List, SignalsUnreadMessageCountMiddlewareModule)
	
	if FFlagUseSignalsForSquadExperienceInvite then
		table.insert(List, require(Parent.SquadsCore.Middleware).SignalsSquadMiddleware)
	end
	local NewResult = RoduxModule.Store.new(AppChatReducerModule, nil, List)
	local NewResult1 = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
	Root:render(((function()
		-- upvalues: ReactModule (upval), ReactFocusNavigationModule (upval), NewResult1 (copy), Provider (upval), InExperienceAppChatProvidersModule (upval), NewResult (copy), UpdateAppChatUnreadMessagesCount (copy), ParentContainerContext (copy), ApolloClient (copy), InExperienceAppChatModule (upval)
		return ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult1 }, {
			FocusNavigationRegistryProvider = ReactModule.createElement(Provider, nil, {
				InExperienceAppChatProviders = ReactModule.createElement(InExperienceAppChatProvidersModule, {
					store = NewResult,
					updateAppChatUnreadMessagesCount = UpdateAppChatUnreadMessagesCount,
					parentContainerContext = ParentContainerContext,
					apolloClient = ApolloClient
				}, {
					appChat = ReactModule.createElement(InExperienceAppChatModule)
				})
			})
		})
	end)()))
	
	return Root
end