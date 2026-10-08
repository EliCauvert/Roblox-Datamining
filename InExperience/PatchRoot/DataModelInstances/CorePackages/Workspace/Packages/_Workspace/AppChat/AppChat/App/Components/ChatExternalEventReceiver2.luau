local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local dataHydrationModule = require(parent.DataHydration)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local roactUtilsModule = require(parent.RoactUtils)
local setUserPresences = require(parent.UserLib).Thunks.SetUserPresences
local dependencyArray = roactUtilsModule.Hooks.dependencyArray
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local var1 = require(appChat.Logger):new("AppChat.Realtime.ChatExternalEventReceiver2")
local networkingPresenceModule = require(appChat.Http.NetworkingPresence)
local chatFriendshipDestroyedModule = require(appChat.App.Thunks.ChatFriendshipDestroyed)
local chatFriendshipCreatedModule = require(appChat.App.Thunks.ChatFriendshipCreated)
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local var2 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceStore.get() else nil
local t = { localUserId = 0 }

function ChatExternalEventReceiver2(p1)
	-- upvalues: cryoModule (ref), t (ref), useDispatch (ref), realtimeDeliveryModule (ref), var1 (ref), fFlagAppChatPresenceStoreMigrationModule (ref), var2 (ref), networkingPresenceModule (ref), setUserPresences (ref), dependencyArray (ref), chatFriendshipDestroyedModule (ref), chatFriendshipCreatedModule (ref)
	local var3 = cryoModule.Dictionary.join(t, p1)
	local var4 = useDispatch()
	realtimeDeliveryModule.useRealtimeNamespace("PresenceBulkNotifications", function(p2)
		-- upvalues: cryoModule (copy), var1 (copy), fFlagAppChatPresenceStoreMigrationModule (copy), var2 (copy), var4 (ref), networkingPresenceModule (copy), setUserPresences (copy)
		local var5 = cryoModule.List.map(p2, function(p3)
			return tostring(p3.UserId)
		end)
		var1:info("Received PresenceBulkNotifications, user count: {}.", #var5)
		
		if var5 == nil or #var5 == 0 then return end
		if not fFlagAppChatPresenceStoreMigrationModule then
			var1:info("\tfetching user presence with a coroutine..")
			task.spawn(function()
				-- upvalues: var4 (copy), networkingPresenceModule (copy), var5 (ref), var1 (copy), setUserPresences (copy)
				var4(networkingPresenceModule.GetPresencesFromUserIds.API(var5)):andThen(function(p3)
					-- upvalues: var1 (copy), var4 (copy), setUserPresences (copy)
					var1:info("\tfetched user presence, storing response..")
					var4(setUserPresences(p3.responseBody.userPresences))
				end):catch(function(p3)
					-- upvalues: var1 (copy)
					var1:warning("NetworkingPresence failure in PresenceBulkNotifications->GetPresencesFromUserIds, Status: " .. tostring(p3))
				end)
			end)
			
			return
		end
		for i, v in var5 do
			var2.RefreshPresenceByUserId(v)
		end
	end, dependencyArray(var4))
	realtimeDeliveryModule.useRealtimeNamespace("FriendshipNotifications", function(p3)
		-- upvalues: var3 (ref), var1 (copy), var4 (ref), chatFriendshipDestroyedModule (copy), chatFriendshipCreatedModule (copy)
		local var6 = if tostring(var3.localUserId) == tostring(p3.EventArgs.UserId1) then tostring(p3.EventArgs.UserId2) else tostring(p3.EventArgs.UserId1)
		var1:info("Received FriendshipNotifications: {}, otherUserId: {}.", p3.Type, var6)
		
		if p3.Type == "FriendshipDestroyed" then
			var4(chatFriendshipDestroyedModule(var6))
			
			return
		elseif p3.Type == "FriendshipCreated" then
			var4(chatFriendshipCreatedModule(var6))
		end
	end, dependencyArray(var4, var3.localUserId))
	
	return nil
end

return ChatExternalEventReceiver2