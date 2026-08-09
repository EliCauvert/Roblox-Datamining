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

return function(p0) --[[ line: 16 ]]
	-- upvalues: playersService (ref), networkingFriendsModule (ref), roduxNetworkingModule (ref), promiseModule (ref), userModel (ref), setUserIsFriend (ref), llama (ref), addUsers (ref), networkingPresenceModule (ref), receiveUsersPresence (ref)
	return function(p1) --[[ line: 17 ]]
		-- upvalues: playersService (copy), networkingFriendsModule (copy), roduxNetworkingModule (copy), promiseModule (copy), p0 (ref), userModel (copy), setUserIsFriend (copy), llama (copy), addUsers (copy), networkingPresenceModule (copy), receiveUsersPresence (copy)
		local localPlayer = playersService.LocalPlayer
		assert(localPlayer, "Local Player not found")
		local userId = localPlayer.UserId
		
		return if networkingFriendsModule.GetFriendsFromUserId.getStatus(p1:getState(), userId) == roduxNetworkingModule.Enum.NetworkStatus.Fetching then promiseModule.resolve({}) else p1:dispatch(networkingFriendsModule.GetFriendsFromUserId.API(userId)):andThen(function(p3) --[[ line: 30 ]]
			-- upvalues: p1 (ref), p0 (copy), userModel (copy), setUserIsFriend (copy), llama (copy), addUsers (copy), networkingPresenceModule (copy), receiveUsersPresence (copy)
			local data = p3.responseBody.data
			local users = p1:getState().Users or {}
			local t = {}
			local var8 = if p0 then {} else nil
			
			for i, v in ipairs(data) do
				local var10 = tostring(v.id)
				
				if p0 then
					table.insert(var8, var10)
				end
				if users[var10] == nil then
					t[var10] = userModel.fromDataTable({
						isFriend = true,
						id = v.id,
						name = v.name,
						displayName = v.displayName
					})
				else
					p1:dispatch(setUserIsFriend(var10, true))
				end
			end
			local var9 = llama.Dictionary.keys(t)
			p1:dispatch(addUsers(t))
			
			if p0 then
				p1:dispatch(networkingPresenceModule.GetPresencesFromUserIds.API(var8)):andThen(function(p5) --[[ line: 67 ]]
					-- upvalues: receiveUsersPresence (copy), p1 (copy)
					receiveUsersPresence(p5.responseBody.userPresences, p1)
					
					return p5
				end):catch(function(p4) --[[ line: 72 ]]
					warn("NetworkingPresence failure in getAllFriendsAsync, Status: " .. tostring(p4))
				end)
				
				return p3
			end
			p1:dispatch(networkingPresenceModule.GetPresencesFromUserIds.API(var9)):catch(function(p6) --[[ line: 78 ]]
				warn("NetworkingPresence failure in getAllFriendsAsync, Status: " .. tostring(p6))
			end)
			
			return p3
		end):catch(function(p2) --[[ line: 85 ]]
			warn("NetworkingFriends failure in getAllFriendsAsync, Status: " .. tostring(p2))
		end)
	end
end