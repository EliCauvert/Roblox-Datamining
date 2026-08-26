local playersService = game:GetService("Players")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local networkingFriendsModule = require(appChat.Http.NetworkingFriends)
local networkingPresenceModule = require(appChat.Http.NetworkingPresence)
local promiseModule = require(parent.Promise)
local roduxNetworkingModule = require(appChat.Http.RoduxNetworking)
local addUsers = require(parent.UserLib).Actions.AddUsers
local setUserIsFriend = require(parent.UserLib).Actions.SetUserIsFriend
local userModel = require(parent.UserLib).Models.UserModel
local llama = require(parent.LuaSocialLibrariesDeps).llama
local receiveUsersPresence = require(parent.UserLib).Utils.receiveUsersPresence
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)

return function(p1)
	-- upvalues: playersService (ref), networkingFriendsModule (ref), roduxNetworkingModule (ref), promiseModule (ref), userModel (ref), setUserIsFriend (ref), llama (ref), addUsers (ref), fFlagAppChatPresenceStoreMigrationModule (ref), networkingPresenceModule (ref), receiveUsersPresence (ref)
	return function(p2)
		-- upvalues: playersService (copy), networkingFriendsModule (copy), roduxNetworkingModule (copy), promiseModule (copy), p1 (ref), userModel (copy), setUserIsFriend (copy), llama (copy), addUsers (copy), fFlagAppChatPresenceStoreMigrationModule (copy), networkingPresenceModule (copy), receiveUsersPresence (copy)
		local localPlayer = playersService.LocalPlayer
		assert(localPlayer, "Local Player not found")
		local userId = localPlayer.UserId
		
		return if networkingFriendsModule.GetFriendsFromUserId.getStatus(p2:getState(), userId) == roduxNetworkingModule.Enum.NetworkStatus.Fetching then promiseModule.resolve({}) else p2:dispatch(networkingFriendsModule.GetFriendsFromUserId.API(userId)):andThen(function(p3)
			-- upvalues: p2 (ref), p1 (copy), userModel (copy), setUserIsFriend (copy), llama (copy), addUsers (copy), fFlagAppChatPresenceStoreMigrationModule (copy), networkingPresenceModule (copy), receiveUsersPresence (copy)
			local data = p3.responseBody.data
			local users = p2:getState().Users or {}
			local t = {}
			local var1 = if p1 then {} else nil
			
			for i, v in ipairs(data) do
				local var2 = tostring(v.id)
				
				if p1 then
					table.insert(var1, var2)
				end
				if users[var2] == nil then
					t[var2] = userModel.fromDataTable({
						isFriend = true,
						id = v.id,
						name = v.name,
						displayName = v.displayName
					})
				else
					p2:dispatch(setUserIsFriend(var2, true))
				end
			end
			local var3 = llama.Dictionary.keys(t)
			p2:dispatch(addUsers(t))
			
			if not fFlagAppChatPresenceStoreMigrationModule then
				if p1 then
					p2:dispatch(networkingPresenceModule.GetPresencesFromUserIds.API(var1)):andThen(function(p4)
						-- upvalues: receiveUsersPresence (copy), p2 (copy)
						receiveUsersPresence(p4.responseBody.userPresences, p2)
						
						return p4
					end):catch(function(p4)
						warn("NetworkingPresence failure in getAllFriendsAsync, Status: " .. tostring(p4))
					end)
					
					return p3
				end
				p2:dispatch(networkingPresenceModule.GetPresencesFromUserIds.API(var3)):catch(function(p4)
					warn("NetworkingPresence failure in getAllFriendsAsync, Status: " .. tostring(p4))
				end)
			end
			return p3
		end):catch(function(p4)
			warn("NetworkingFriends failure in getAllFriendsAsync, Status: " .. tostring(p4))
		end)
	end
end