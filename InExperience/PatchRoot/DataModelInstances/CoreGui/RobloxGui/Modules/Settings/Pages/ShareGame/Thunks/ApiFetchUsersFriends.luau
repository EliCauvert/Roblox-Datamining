local corePackagesService = game:GetService("CorePackages")
local requests = require(corePackagesService.Workspace.Packages.Http).Requests
local promiseModule = require(corePackagesService.Packages.Promise)
local apiFetchUsersPresences = require(corePackagesService.Workspace.Packages.UserLib).Thunks.ApiFetchUsersPresences
local DEPRECATED_UsersGetFriends = requests.DEPRECATED_UsersGetFriends
local fetchUserFriendsStarted = require(corePackagesService.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsStarted
local fetchUserFriendsFailed = require(corePackagesService.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsFailed
local fetchUserFriendsCompleted = require(corePackagesService.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsCompleted
local userModel = require(corePackagesService.Workspace.Packages.UserLib).Models.UserModel
local updateUsers = require(corePackagesService.Workspace.Packages.UserLib).Thunks.UpdateUsers
local getFFlagInviteListRerank = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank

return function(p1, p2, _, p3)
	-- upvalues: fetchUserFriendsStarted (ref), DEPRECATED_UsersGetFriends (ref), getFFlagInviteListRerank (ref), userModel (ref), updateUsers (ref), apiFetchUsersPresences (ref), fetchUserFriendsCompleted (ref), promiseModule (ref), fetchUserFriendsFailed (ref)
	return function(p4)
		-- upvalues: fetchUserFriendsStarted (copy), p2 (ref), DEPRECATED_UsersGetFriends (copy), p1 (ref), p3 (ref), getFFlagInviteListRerank (copy), userModel (copy), updateUsers (copy), apiFetchUsersPresences (copy), fetchUserFriendsCompleted (copy), promiseModule (copy), fetchUserFriendsFailed (copy)
		p4:dispatch(fetchUserFriendsStarted(p2))
		
		return DEPRECATED_UsersGetFriends(p1, p2, p3):andThen(function(p5)
			-- upvalues: getFFlagInviteListRerank (copy), userModel (copy), p4 (ref), updateUsers (copy)
			local responseBody = p5.responseBody
			local t = {}
			local t_1 = {}
			
			for i, v in pairs(responseBody.data) do
				local var1 = tostring(v.id)
				v.isFriend = true
				
				if getFFlagInviteListRerank() then
					v.friendRank = i
				end
				local var2 = userModel.fromDataTable(v)
				table.insert(t, var1)
				t_1[var2.id] = var2
			end
			p4:dispatch(updateUsers(t_1))
			
			return t
		end):andThen(function(p6)
			-- upvalues: p4 (ref), apiFetchUsersPresences (copy), p1 (copy)
			return p4:dispatch(apiFetchUsersPresences(p1, p6))
		end):andThen(function(p6)
			-- upvalues: p4 (ref), fetchUserFriendsCompleted (copy), p2 (copy), promiseModule (copy)
			p4:dispatch(fetchUserFriendsCompleted(p2))
			
			return promiseModule.resolve(p6)
		end, function(p6)
			-- upvalues: p4 (ref), fetchUserFriendsFailed (copy), p2 (copy), promiseModule (copy)
			p4:dispatch(fetchUserFriendsFailed(p2, p6))
			
			return promiseModule.reject(p6)
		end)
	end
end