local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local ApiFetchUsersPresencesFunction = require(CorePackages.Workspace.Packages.UserLib).Thunks.ApiFetchUsersPresences
local DEPRECATEDUsersGetFriendsFunction = require(CorePackages.Workspace.Packages.Http).Requests.DEPRECATED_UsersGetFriends
local FetchUserFriendsStartedFunction = require(CorePackages.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsStarted
local FetchUserFriendsFailedFunction = require(CorePackages.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsFailed
local FetchUserFriendsCompletedFunction = require(CorePackages.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsCompleted
local UserModel = require(CorePackages.Workspace.Packages.UserLib).Models.UserModel
local UpdateUsersFunction = require(CorePackages.Workspace.Packages.UserLib).Thunks.UpdateUsers
local GetFFlagInviteListRerankFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank

return function(p1, p2, _, p3)
	-- upvalues: FetchUserFriendsStartedFunction (copy), DEPRECATEDUsersGetFriendsFunction (copy), GetFFlagInviteListRerankFunction (copy), UserModel (copy), UpdateUsersFunction (copy), ApiFetchUsersPresencesFunction (copy), FetchUserFriendsCompletedFunction (copy), PromiseModule (copy), FetchUserFriendsFailedFunction (copy)
	return function(p4)
		-- upvalues: FetchUserFriendsStartedFunction (upval), p2 (copy), DEPRECATEDUsersGetFriendsFunction (upval), p1 (copy), p3 (copy), GetFFlagInviteListRerankFunction (upval), UserModel (upval), UpdateUsersFunction (upval), ApiFetchUsersPresencesFunction (upval), FetchUserFriendsCompletedFunction (upval), PromiseModule (upval), FetchUserFriendsFailedFunction (upval)
		p4:dispatch(FetchUserFriendsStartedFunction(p2))
		
		return DEPRECATEDUsersGetFriendsFunction(p1, p2, p3):andThen(function(Result)
			-- upvalues: GetFFlagInviteListRerankFunction (upval), UserModel (upval), p4 (copy), UpdateUsersFunction (upval)
			local List = {}
			local FromDataTableResults = {}
			
			for FriendRank, entry in pairs(Result.responseBody.data) do
				local Text = tostring(entry.id)
				entry.isFriend = true
				
				if GetFFlagInviteListRerankFunction() then
					entry.friendRank = FriendRank
				end
				local FromDataTableResult = UserModel.fromDataTable(entry)
				table.insert(List, Text)
				FromDataTableResults[FromDataTableResult.id] = FromDataTableResult
			end
			p4:dispatch(UpdateUsersFunction(FromDataTableResults))
			
			return List
		end):andThen(function(Result)
			-- upvalues: p4 (copy), ApiFetchUsersPresencesFunction (upval), p1 (upval)
			return p4:dispatch(ApiFetchUsersPresencesFunction(p1, Result))
		end):andThen(function(Result)
			-- upvalues: p4 (copy), FetchUserFriendsCompletedFunction (upval), p2 (upval), PromiseModule (upval)
			p4:dispatch(FetchUserFriendsCompletedFunction(p2))
			
			return PromiseModule.resolve(Result)
		end, function(p5)
			-- upvalues: p4 (copy), FetchUserFriendsFailedFunction (upval), p2 (upval), PromiseModule (upval)
			p4:dispatch(FetchUserFriendsFailedFunction(p2, p5))
			
			return PromiseModule.reject(p5)
		end)
	end
end