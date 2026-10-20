local Players = game:GetService("Players")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local NetworkingFriendsModule = require(AppChat.Http.NetworkingFriends)
local NetworkingPresenceModule = require(AppChat.Http.NetworkingPresence)
local PromiseModule = require(Parent.Promise)
local RoduxNetworkingModule = require(AppChat.Http.RoduxNetworking)
local AddUsersFunction = require(Parent.UserLib).Actions.AddUsers
local SetUserIsFriendFunction = require(Parent.UserLib).Actions.SetUserIsFriend
local UserModel = require(Parent.UserLib).Models.UserModel
local Llama = require(Parent.LuaSocialLibrariesDeps).llama
local ReceiveUsersPresenceFunction = require(Parent.UserLib).Utils.receiveUsersPresence
local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)

return function(p1)
	-- upvalues: Players (copy), NetworkingFriendsModule (copy), RoduxNetworkingModule (copy), PromiseModule (copy), UserModel (copy), SetUserIsFriendFunction (copy), Llama (copy), AddUsersFunction (copy), FFlagAppChatPresenceStoreMigrationModule (copy), NetworkingPresenceModule (copy), ReceiveUsersPresenceFunction (copy)
	return function(p2)
		-- upvalues: Players (upval), NetworkingFriendsModule (upval), RoduxNetworkingModule (upval), PromiseModule (upval), p1 (copy), UserModel (upval), SetUserIsFriendFunction (upval), Llama (upval), AddUsersFunction (upval), FFlagAppChatPresenceStoreMigrationModule (upval), NetworkingPresenceModule (upval), ReceiveUsersPresenceFunction (upval)
		local LocalPlayer = Players.LocalPlayer
		assert(LocalPlayer, "Local Player not found")
		local UserId = LocalPlayer.UserId
		
		return if NetworkingFriendsModule.GetFriendsFromUserId.getStatus(p2:getState(), UserId) == RoduxNetworkingModule.Enum.NetworkStatus.Fetching then PromiseModule.resolve({}) else p2:dispatch(NetworkingFriendsModule.GetFriendsFromUserId.API(UserId)):andThen(function(Result)
			-- upvalues: p2 (copy), p1 (upval), UserModel (upval), SetUserIsFriendFunction (upval), Llama (upval), AddUsersFunction (upval), FFlagAppChatPresenceStoreMigrationModule (upval), NetworkingPresenceModule (upval), ReceiveUsersPresenceFunction (upval)
			local Data = Result.responseBody.data
			local Users = p2:getState().Users or {}
			local FromDataTableResults = {}
			local T = if p1 then {} else nil
			for _, entry in ipairs(Data) do
				local Text = tostring(entry.id)
				
				if p1 then
					table.insert(T, Text)
				end
				if Users[Text] == nil then
					FromDataTableResults[Text] = UserModel.fromDataTable({
						isFriend = true,
						id = entry.id,
						name = entry.name,
						displayName = entry.displayName
					})
				else
					p2:dispatch(SetUserIsFriendFunction(Text, true))
				end
			end
			local KeysResult = Llama.Dictionary.keys(FromDataTableResults)
			p2:dispatch(AddUsersFunction(FromDataTableResults))
			
			if not FFlagAppChatPresenceStoreMigrationModule then
				if p1 then
					p2:dispatch(NetworkingPresenceModule.GetPresencesFromUserIds.API(T)):andThen(function(Result)
						-- upvalues: ReceiveUsersPresenceFunction (upval), p2 (upval)
						ReceiveUsersPresenceFunction(Result.responseBody.userPresences, p2)
						
						return Result
					end):catch(function(Err)
						warn("NetworkingPresence failure in getAllFriendsAsync, Status: " .. tostring(Err))
					end)
					
					return Result
				end
				p2:dispatch(NetworkingPresenceModule.GetPresencesFromUserIds.API(KeysResult)):catch(function(Err)
					warn("NetworkingPresence failure in getAllFriendsAsync, Status: " .. tostring(Err))
				end)
			end
			return Result
		end):catch(function(Err)
			warn("NetworkingFriends failure in getAllFriendsAsync, Status: " .. tostring(Err))
		end)
	end
end