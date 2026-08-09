local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local setUserPresences = require(parent.UserLib).Thunks.SetUserPresences
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local var3 = require(appChat.Logger):new("AppChat.RealtimeExternal")
local networkingPresenceModule = require(appChat.Http.NetworkingPresence)
local chatFriendshipDestroyedModule = require(appChat.App.Thunks.ChatFriendshipDestroyed)
local chatFriendshipCreatedModule = require(appChat.App.Thunks.ChatFriendshipCreated)
local t = { localUserId = 0 }

function ChatExternalEventReceiver(p0) --[[ line: 31 ]]
	-- upvalues: cryoModule (ref), t (ref), useDispatch (ref), useEffect (ref), networkingPresenceModule (ref), setUserPresences (ref), var3 (ref), chatFriendshipDestroyedModule (ref), chatFriendshipCreatedModule (ref)
	local var8 = cryoModule.Dictionary.join(t, p0)
	local var9 = useDispatch()
	useEffect(function() --[[ line: 36 ]]
		-- upvalues: var8 (ref), cryoModule (copy), var9 (ref), networkingPresenceModule (copy), setUserPresences (copy), var3 (copy)
		local presenceBulkNotifications = var8.robloxEventReceiver:observeEvent("PresenceBulkNotifications", function(p1) --[[ line: 37 ]]
			-- upvalues: cryoModule (copy), var9 (copy), networkingPresenceModule (copy), setUserPresences (copy), var3 (copy)
			var9(networkingPresenceModule.GetPresencesFromUserIds.API(cryoModule.List.map(p1, function(p4) --[[ line: 38 ]]
				return tostring(p4.UserId)
			end))):andThen(function(p3) --[[ line: 43 ]]
				-- upvalues: var9 (copy), setUserPresences (copy)
				var9(setUserPresences(p3.responseBody.userPresences))
			end):catch(function(p2) --[[ line: 46 ]]
				-- upvalues: var3 (copy)
				var3:warning("NetworkingPresence failure in ChatExternalEventReceiver->PresenceBulkNotifications, Status: " .. tostring(p2))
			end)
		end)
		
		return function() --[[ line: 54 ]]
			-- upvalues: presenceBulkNotifications (ref)
			if presenceBulkNotifications and presenceBulkNotifications.disconnect then
				presenceBulkNotifications:disconnect()
			end
		end
	end, { var9, var8.robloxEventReceiver })
	useEffect(function() --[[ line: 62 ]]
		-- upvalues: var8 (ref), var9 (ref), chatFriendshipDestroyedModule (copy), chatFriendshipCreatedModule (copy)
		local friendshipNotifications = var8.robloxEventReceiver:observeEvent("FriendshipNotifications", function(p5) --[[ line: 63 ]]
			-- upvalues: var8 (copy), var9 (copy), chatFriendshipDestroyedModule (copy), chatFriendshipCreatedModule (copy)
			local userId2 = tostring(var8.localUserId) == tostring(p5.EventArgs.UserId1) and tostring(p5.EventArgs.UserId2) or tostring(p5.EventArgs.UserId1)
			
			if p5.Type == "FriendshipDestroyed" then
				var9(chatFriendshipDestroyedModule(userId2))
				
				return
			elseif p5.Type == "FriendshipCreated" then
				var9(chatFriendshipCreatedModule(userId2))
			end
		end)
		
		return function() --[[ line: 75 ]]
			-- upvalues: friendshipNotifications (ref)
			if friendshipNotifications and friendshipNotifications.disconnect then
				friendshipNotifications:disconnect()
			end
		end
	end, { var9, var8.robloxEventReceiver, var8.localUserId })
	
	return nil
end

return ChatExternalEventReceiver