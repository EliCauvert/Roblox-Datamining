local AppChat = script:FindFirstAncestor("AppChat")

if require(AppChat.Flags.FFlagAppChatMigrateChatExternalEventReceiver) then
	return (require(script.Parent.ChatExternalEventReceiver2))
else
	local Parent = AppChat.Parent
	local CryoModule = require(Parent.Cryo)
	local DataHydrationModule = require(Parent.DataHydration)
	local SetUserPresencesFunction = require(Parent.UserLib).Thunks.SetUserPresences
	local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
	local UseEffectFunction = require(Parent.React).useEffect
	local AppChatRealtimeExternal = require(AppChat.Logger):new("AppChat.RealtimeExternal")
	local NetworkingPresenceModule = require(AppChat.Http.NetworkingPresence)
	local ChatFriendshipDestroyedModule = require(AppChat.App.Thunks.ChatFriendshipDestroyed)
	local ChatFriendshipCreatedModule = require(AppChat.App.Thunks.ChatFriendshipCreated)
	local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)
	local GetResult = if FFlagAppChatPresenceStoreMigrationModule then DataHydrationModule.Presence.PresenceStore.get() else nil
	local config = { localUserId = 0 }
	
	function ChatExternalEventReceiver(p1)
		-- upvalues: CryoModule (copy), config (copy), UseDispatchFunction (copy), UseEffectFunction (copy), FFlagAppChatPresenceStoreMigrationModule (copy), GetResult (copy), NetworkingPresenceModule (copy), SetUserPresencesFunction (copy), AppChatRealtimeExternal (copy), ChatFriendshipDestroyedModule (copy), ChatFriendshipCreatedModule (copy)
		local JoinResult = CryoModule.Dictionary.join(config, p1)
		local UseDispatchResult = UseDispatchFunction()
		UseEffectFunction(function()
			-- upvalues: JoinResult (copy), CryoModule (upval), FFlagAppChatPresenceStoreMigrationModule (upval), GetResult (upval), UseDispatchResult (copy), NetworkingPresenceModule (upval), SetUserPresencesFunction (upval), AppChatRealtimeExternal (upval)
			local PresenceBulkNotifications = JoinResult.robloxEventReceiver:observeEvent("PresenceBulkNotifications", function(p2)
				-- upvalues: CryoModule (upval), FFlagAppChatPresenceStoreMigrationModule (upval), GetResult (upval), UseDispatchResult (upval), NetworkingPresenceModule (upval), SetUserPresencesFunction (upval), AppChatRealtimeExternal (upval)
				local MapResult = CryoModule.List.map(p2, function(Player): string
					return (tostring(Player.UserId))
				end)
				
				if not FFlagAppChatPresenceStoreMigrationModule then
					UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API(MapResult)):andThen(function(Result)
						-- upvalues: UseDispatchResult (upval), SetUserPresencesFunction (upval)
						UseDispatchResult(SetUserPresencesFunction(Result.responseBody.userPresences))
					end):catch(function(Err)
						-- upvalues: AppChatRealtimeExternal (upval)
						AppChatRealtimeExternal:warning("NetworkingPresence failure in ChatExternalEventReceiver->PresenceBulkNotifications, Status: " .. tostring(Err))
					end)
					
					return
				end
				for _, value in MapResult do
					GetResult.RefreshPresenceByUserId(value)
				end
			end)
			
			return function()
				-- upvalues: PresenceBulkNotifications (copy)
				if PresenceBulkNotifications and PresenceBulkNotifications.disconnect then
					PresenceBulkNotifications:disconnect()
				end
			end
		end, { UseDispatchResult, JoinResult.robloxEventReceiver })
		UseEffectFunction(function()
			-- upvalues: JoinResult (copy), UseDispatchResult (copy), ChatFriendshipDestroyedModule (upval), ChatFriendshipCreatedModule (upval)
			local FriendshipNotifications = JoinResult.robloxEventReceiver:observeEvent("FriendshipNotifications", function(p2)
				-- upvalues: JoinResult (upval), UseDispatchResult (upval), ChatFriendshipDestroyedModule (upval), ChatFriendshipCreatedModule (upval)
				local Text: string = tostring(JoinResult.localUserId) == tostring(p2.EventArgs.UserId1) and tostring(p2.EventArgs.UserId2) or tostring(p2.EventArgs.UserId1)
				
				if p2.Type == "FriendshipDestroyed" then
					UseDispatchResult(ChatFriendshipDestroyedModule(Text))
					
					return
				end
				if p2.Type == "FriendshipCreated" then
					UseDispatchResult(ChatFriendshipCreatedModule(Text))
				end
			end)
			
			return function()
				-- upvalues: FriendshipNotifications (copy)
				if FriendshipNotifications and FriendshipNotifications.disconnect then
					FriendshipNotifications:disconnect()
				end
			end
		end, {
			UseDispatchResult,
			JoinResult.robloxEventReceiver,
			JoinResult.localUserId
		})
		
		return nil
	end
	
	return ChatExternalEventReceiver
end