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

return function(p0, p1, _, p2) --[[ line: 16 ]]
	-- upvalues: fetchUserFriendsStarted (ref), DEPRECATED_UsersGetFriends (ref), getFFlagInviteListRerank (ref), userModel (ref), updateUsers (ref), apiFetchUsersPresences (ref), fetchUserFriendsCompleted (ref), promiseModule (ref), fetchUserFriendsFailed (ref)
	return function(p3) --[[ line: 17 ]]
		-- upvalues: fetchUserFriendsStarted (copy), p1 (ref), DEPRECATED_UsersGetFriends (copy), p0 (ref), p2 (ref), getFFlagInviteListRerank (copy), userModel (copy), updateUsers (copy), apiFetchUsersPresences (copy), fetchUserFriendsCompleted (copy), promiseModule (copy), fetchUserFriendsFailed (copy)
		p3:dispatch(fetchUserFriendsStarted(p1))
		
		return DEPRECATED_UsersGetFriends(p0, p1, p2):andThen(function(p7) --[[ line: 21 ]]
			-- upvalues: getFFlagInviteListRerank (copy), userModel (copy), p3 (ref), updateUsers (copy)
			local responseBody = p7.responseBody
			local t = {}
			local t_1 = {}
			
			for i, v in pairs(responseBody.data) do
				local var4 = tostring(v.id)
				v.isFriend = true
				
				if getFFlagInviteListRerank() then
					v.friendRank = i
				end
				local var5 = userModel.fromDataTable(v)
				table.insert(t, var4)
				t_1[var5.id] = var5
			end
			p3:dispatch(updateUsers(t_1))
			
			return t
		end):andThen(function(p6) --[[ line: 43 ]]
			-- upvalues: p3 (ref), apiFetchUsersPresences (copy), p0 (copy)
			return p3:dispatch(apiFetchUsersPresences(p0, p6))
		end):andThen(function(p4) --[[ line: 46 ]]
			-- upvalues: p3 (ref), fetchUserFriendsCompleted (copy), p1 (copy), promiseModule (copy)
			p3:dispatch(fetchUserFriendsCompleted(p1))
			
			return promiseModule.resolve(p4)
		end, function(p5) --[[ line: 50 ]]
			-- upvalues: p3 (ref), fetchUserFriendsFailed (copy), p1 (copy), promiseModule (copy)
			p3:dispatch(fetchUserFriendsFailed(p1, p5))
			
			return promiseModule.reject(p5)
		end)
	end
end