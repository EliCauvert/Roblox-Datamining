local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local dataHydrationModule = require(parent.DataHydration)
local reactModule = require(parent.React)
local setUserPresences = require(parent.UserLib).Thunks.SetUserPresences
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local var1 = require(appChat.Logger):new("AppChat.RealtimeExternal")
local networkingPresenceModule = require(appChat.Http.NetworkingPresence)
local chatFriendshipDestroyedModule = require(appChat.App.Thunks.ChatFriendshipDestroyed)
local chatFriendshipCreatedModule = require(appChat.App.Thunks.ChatFriendshipCreated)
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local var2 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceStore.get() else nil
local t = { localUserId = 0 }

function ChatExternalEventReceiver(p1)
	-- upvalues: cryoModule (ref), t (ref), useDispatch (ref), useEffect (ref), fFlagAppChatPresenceStoreMigrationModule (ref), var2 (ref), networkingPresenceModule (ref), setUserPresences (ref), var1 (ref), chatFriendshipDestroyedModule (ref), chatFriendshipCreatedModule (ref)
	local var3 = cryoModule.Dictionary.join(t, p1)
	local var4 = useDispatch()
	useEffect(function()
		-- upvalues: var3 (ref), cryoModule (copy), fFlagAppChatPresenceStoreMigrationModule (copy), var2 (copy), var4 (ref), networkingPresenceModule (copy), setUserPresences (copy), var1 (copy)
		local presenceBulkNotifications = var3.robloxEventReceiver:observeEvent("PresenceBulkNotifications", function(p2)
			-- upvalues: cryoModule (copy), fFlagAppChatPresenceStoreMigrationModule (copy), var2 (copy), var4 (copy), networkingPresenceModule (copy), setUserPresences (copy), var1 (copy)
			local var5 = cryoModule.List.map(p2, function(p3)
				return tostring(p3.UserId)
			end)
			
			if not fFlagAppChatPresenceStoreMigrationModule then
				var4(networkingPresenceModule.GetPresencesFromUserIds.API(var5)):andThen(function(p3)
					-- upvalues: var4 (copy), setUserPresences (copy)
					var4(setUserPresences(p3.responseBody.userPresences))
				end):catch(function(p3)
					-- upvalues: var1 (copy)
					var1:warning("NetworkingPresence failure in ChatExternalEventReceiver->PresenceBulkNotifications, Status: " .. tostring(p3))
				end)
				
				return
			end
			for i, v in var5 do
				var2.RefreshPresenceByUserId(v)
			end
		end)
		
		return function()
			-- upvalues: presenceBulkNotifications (ref)
			if presenceBulkNotifications and presenceBulkNotifications.disconnect then
				presenceBulkNotifications:disconnect()
			end
		end
	end, { var4, var3.robloxEventReceiver })
	useEffect(function()
		-- upvalues: var3 (ref), var4 (ref), chatFriendshipDestroyedModule (copy), chatFriendshipCreatedModule (copy)
		local friendshipNotifications = var3.robloxEventReceiver:observeEvent("FriendshipNotifications", function(p2)
			-- upvalues: var3 (copy), var4 (copy), chatFriendshipDestroyedModule (copy), chatFriendshipCreatedModule (copy)
			local userId2 = tostring(var3.localUserId) == tostring(p2.EventArgs.UserId1) and tostring(p2.EventArgs.UserId2) or tostring(p2.EventArgs.UserId1)
			
			if p2.Type == "FriendshipDestroyed" then
				var4(chatFriendshipDestroyedModule(userId2))
				
				return
			elseif p2.Type == "FriendshipCreated" then
				var4(chatFriendshipCreatedModule(userId2))
			end
		end)
		
		return function()
			-- upvalues: friendshipNotifications (ref)
			if friendshipNotifications and friendshipNotifications.disconnect then
				friendshipNotifications:disconnect()
			end
		end
	end, { var4, var3.robloxEventReceiver, var3.localUserId })
	
	return nil
end

return ChatExternalEventReceiver