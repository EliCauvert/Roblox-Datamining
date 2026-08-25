local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local dataHydrationModule = require(parent.DataHydration)
local reactModule = require(parent.React)
local setUserPresences = require(parent.UserLib).Thunks.SetUserPresences
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local var4 = require(appChat.Logger):new("AppChat.RealtimeExternal")
local networkingPresenceModule = require(appChat.Http.NetworkingPresence)
local chatFriendshipDestroyedModule = require(appChat.App.Thunks.ChatFriendshipDestroyed)
local chatFriendshipCreatedModule = require(appChat.App.Thunks.ChatFriendshipCreated)
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local var9 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceStore.get() else nil
local t = { localUserId = 0 }

function ChatExternalEventReceiver(p0)
	-- upvalues: cryoModule (ref), t (ref), useDispatch (ref), useEffect (ref), fFlagAppChatPresenceStoreMigrationModule (ref), var9 (ref), networkingPresenceModule (ref), setUserPresences (ref), var4 (ref), chatFriendshipDestroyedModule (ref), chatFriendshipCreatedModule (ref)
	local var11 = cryoModule.Dictionary.join(t, p0)
	local var12 = useDispatch()
	useEffect(function()
		-- upvalues: var11 (ref), cryoModule (copy), fFlagAppChatPresenceStoreMigrationModule (copy), var9 (copy), var12 (ref), networkingPresenceModule (copy), setUserPresences (copy), var4 (copy)
		local presenceBulkNotifications = var11.robloxEventReceiver:observeEvent("PresenceBulkNotifications", function(p1)
			-- upvalues: cryoModule (copy), fFlagAppChatPresenceStoreMigrationModule (copy), var9 (copy), var12 (copy), networkingPresenceModule (copy), setUserPresences (copy), var4 (copy)
			local var14 = cryoModule.List.map(p1, function(p2)
				return tostring(p2.UserId)
			end)
			
			if not fFlagAppChatPresenceStoreMigrationModule then
				var12(networkingPresenceModule.GetPresencesFromUserIds.API(var14)):andThen(function(p4)
					-- upvalues: var12 (copy), setUserPresences (copy)
					var12(setUserPresences(p4.responseBody.userPresences))
				end):catch(function(p3)
					-- upvalues: var4 (copy)
					var4:warning("NetworkingPresence failure in ChatExternalEventReceiver->PresenceBulkNotifications, Status: " .. tostring(p3))
				end)
				
				return
			end
			for i, v in var14 do
				var9.RefreshPresenceByUserId(v)
			end
		end)
		
		return function()
			-- upvalues: presenceBulkNotifications (ref)
			if presenceBulkNotifications and presenceBulkNotifications.disconnect then
				presenceBulkNotifications:disconnect()
			end
		end
	end, { var12, var11.robloxEventReceiver })
	useEffect(function()
		-- upvalues: var11 (ref), var12 (ref), chatFriendshipDestroyedModule (copy), chatFriendshipCreatedModule (copy)
		local friendshipNotifications = var11.robloxEventReceiver:observeEvent("FriendshipNotifications", function(p5)
			-- upvalues: var11 (copy), var12 (copy), chatFriendshipDestroyedModule (copy), chatFriendshipCreatedModule (copy)
			local userId2 = tostring(var11.localUserId) == tostring(p5.EventArgs.UserId1) and tostring(p5.EventArgs.UserId2) or tostring(p5.EventArgs.UserId1)
			
			if p5.Type == "FriendshipDestroyed" then
				var12(chatFriendshipDestroyedModule(userId2))
				
				return
			elseif p5.Type == "FriendshipCreated" then
				var12(chatFriendshipCreatedModule(userId2))
			end
		end)
		
		return function()
			-- upvalues: friendshipNotifications (ref)
			if friendshipNotifications and friendshipNotifications.disconnect then
				friendshipNotifications:disconnect()
			end
		end
	end, { var12, var11.robloxEventReceiver, var11.localUserId })
	
	return nil
end

return ChatExternalEventReceiver