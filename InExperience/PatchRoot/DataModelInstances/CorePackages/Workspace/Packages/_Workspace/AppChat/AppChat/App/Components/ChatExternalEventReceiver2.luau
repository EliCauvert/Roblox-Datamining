local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local DataHydrationModule = require(Parent.DataHydration)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local RoactUtilsModule = require(Parent.RoactUtils)
local SetUserPresencesFunction = require(Parent.UserLib).Thunks.SetUserPresences
local DependencyArrayFunction = RoactUtilsModule.Hooks.dependencyArray
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local AppChatRealtimeChatExternalEventReceiver2 = require(AppChat.Logger):new("AppChat.Realtime.ChatExternalEventReceiver2")
local NetworkingPresenceModule = require(AppChat.Http.NetworkingPresence)
local ChatFriendshipDestroyedModule = require(AppChat.App.Thunks.ChatFriendshipDestroyed)
local ChatFriendshipCreatedModule = require(AppChat.App.Thunks.ChatFriendshipCreated)
local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)
local GetResult = if FFlagAppChatPresenceStoreMigrationModule then DataHydrationModule.Presence.PresenceStore.get() else nil
local config = { localUserId = 0 }

function ChatExternalEventReceiver2(p1)
	-- upvalues: CryoModule (copy), config (copy), UseDispatchFunction (copy), RealtimeDeliveryModule (copy), AppChatRealtimeChatExternalEventReceiver2 (copy), FFlagAppChatPresenceStoreMigrationModule (copy), GetResult (copy), NetworkingPresenceModule (copy), SetUserPresencesFunction (copy), DependencyArrayFunction (copy), ChatFriendshipDestroyedModule (copy), ChatFriendshipCreatedModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseDispatchResult = UseDispatchFunction()
	RealtimeDeliveryModule.useRealtimeNamespace("PresenceBulkNotifications", function(p2)
		-- upvalues: CryoModule (upval), AppChatRealtimeChatExternalEventReceiver2 (upval), FFlagAppChatPresenceStoreMigrationModule (upval), GetResult (upval), UseDispatchResult (copy), NetworkingPresenceModule (upval), SetUserPresencesFunction (upval)
		local MapResult = CryoModule.List.map(p2, function(Player): string
			return (tostring(Player.UserId))
		end)
		AppChatRealtimeChatExternalEventReceiver2:info("Received PresenceBulkNotifications, user count: {}.", #MapResult)
		
		if MapResult == nil or #MapResult == 0 then return end
		if not FFlagAppChatPresenceStoreMigrationModule then
			AppChatRealtimeChatExternalEventReceiver2:info("\tfetching user presence with a coroutine..")
			task.spawn(function()
				-- upvalues: UseDispatchResult (upval), NetworkingPresenceModule (upval), MapResult (copy), AppChatRealtimeChatExternalEventReceiver2 (upval), SetUserPresencesFunction (upval)
				UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API(MapResult)):andThen(function(Result)
					-- upvalues: AppChatRealtimeChatExternalEventReceiver2 (upval), UseDispatchResult (upval), SetUserPresencesFunction (upval)
					AppChatRealtimeChatExternalEventReceiver2:info("\tfetched user presence, storing response..")
					UseDispatchResult(SetUserPresencesFunction(Result.responseBody.userPresences))
				end):catch(function(Err)
					-- upvalues: AppChatRealtimeChatExternalEventReceiver2 (upval)
					AppChatRealtimeChatExternalEventReceiver2:warning("NetworkingPresence failure in PresenceBulkNotifications->GetPresencesFromUserIds, Status: " .. tostring(Err))
				end)
			end)
			
			return
		end
		for _, value in MapResult do
			GetResult.RefreshPresenceByUserId(value)
		end
	end, DependencyArrayFunction(UseDispatchResult))
	RealtimeDeliveryModule.useRealtimeNamespace("FriendshipNotifications", function(p3)
		-- upvalues: JoinResult (copy), AppChatRealtimeChatExternalEventReceiver2 (upval), UseDispatchResult (copy), ChatFriendshipDestroyedModule (upval), ChatFriendshipCreatedModule (upval)
		local Text: string = if tostring(JoinResult.localUserId) == tostring(p3.EventArgs.UserId1) then tostring(p3.EventArgs.UserId2) else tostring(p3.EventArgs.UserId1)
		AppChatRealtimeChatExternalEventReceiver2:info("Received FriendshipNotifications: {}, otherUserId: {}.", p3.Type, Text)
		
		if p3.Type == "FriendshipDestroyed" then
			UseDispatchResult(ChatFriendshipDestroyedModule(Text))
			
			return
		end
		if p3.Type == "FriendshipCreated" then
			UseDispatchResult(ChatFriendshipCreatedModule(Text))
		end
	end, DependencyArrayFunction(UseDispatchResult, JoinResult.localUserId))
	
	return nil
end

return ChatExternalEventReceiver2