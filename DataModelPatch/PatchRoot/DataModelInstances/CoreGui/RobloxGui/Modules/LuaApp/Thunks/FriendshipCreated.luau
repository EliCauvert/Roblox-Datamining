local CorePackages = game:GetService("CorePackages")
local UserService = game:GetService("UserService")
local ApiFetchUsersPresencesFunction = require(CorePackages.Workspace.Packages.UserLib).Thunks.ApiFetchUsersPresences
local UserModel = require(CorePackages.Workspace.Packages.UserLib).Models.UserModel
local PromiseModule = require(CorePackages.Packages.Promise)
local UpdateUsersFunction = require(CorePackages.Workspace.Packages.UserLib).Thunks.UpdateUsers
local PreloadUsersThumbnailFunction = require(CorePackages.Workspace.Packages.UserLib).Thunks.PreloadUsersThumbnail
local USERCAROUSELHEADSHOT = require(CorePackages.Workspace.Packages.UserLib).Utils.AvatarThumbnailRequests.USER_CAROUSEL_HEAD_SHOT

local function AddNewFriend(p1, p2, Id, p3)
	-- upvalues: UserService (copy), UserModel (copy), UpdateUsersFunction (copy), PreloadUsersThumbnailFunction (copy), USERCAROUSELHEADSHOT (copy), ApiFetchUsersPresencesFunction (copy), PromiseModule (copy)
	local UserService1 = p3 and p3.UserService or UserService
	local Success, Result = pcall(function()
		-- upvalues: UserService1 (copy), Id (copy)
		return UserService1:GetUserInfosByUserIdsAsync({ (tonumber(Id)) })[1]
	end)
	
	if not Success then return end
	if Result and Result.Username and Result.DisplayName then
		p1:dispatch(UpdateUsersFunction({
			(UserModel.fromDataTable({
				isFriend = true,
				friendRank = 0,
				id = Id,
				name = Result.Username,
				displayName = Result.DisplayName,
				hasVerifiedBadge = Result.HasVerifiedBadge
			}))
		}))
		local list = { Id }
		PromiseModule.all({
			p1:dispatch(ApiFetchUsersPresencesFunction(p2, list)),
			(p1:dispatch(PreloadUsersThumbnailFunction(list, USERCAROUSELHEADSHOT, nil)))
		})
		
		return
	end
end

return function(p1, Id)
	-- upvalues: AddNewFriend (copy)
	return function(p2, p3)
		-- upvalues: AddNewFriend (upval), p1 (copy), Id (copy)
		AddNewFriend(p2, p1, Id, p3)
	end
end