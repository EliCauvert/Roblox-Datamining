local UserService = game:GetService("UserService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local PromiseModule = require(Parent.Promise)
local UserLibModule = require(Parent.UserLib)
local USERCAROUSELHEADSHOT = UserLibModule.Utils.AvatarThumbnailRequests.USER_CAROUSEL_HEAD_SHOT
local GetConversationMetadata = require(Parent.AppChatNetworking).rodux.GetConversationMetadata
local PreloadUsersThumbnailFunction = UserLibModule.Thunks.PreloadUsersThumbnail
local UpdateUsersFunction = UserLibModule.Thunks.UpdateUsers
local UserModel = UserLibModule.Models.UserModel
local ReceiveUsersPresenceFunction = UserLibModule.Utils.receiveUsersPresence
local NetworkingPresenceModule = require(AppChat.Http.NetworkingPresence)

local function AddNewFriend(p1, Id, p2)
	-- upvalues: UserService (copy), UserModel (copy), UpdateUsersFunction (copy), PreloadUsersThumbnailFunction (copy), USERCAROUSELHEADSHOT (copy), NetworkingPresenceModule (copy), ReceiveUsersPresenceFunction (copy), GetConversationMetadata (copy), PromiseModule (copy)
	local UserService1 = p2 and p2.UserService or UserService
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
		local list1 = {
			p1:dispatch(NetworkingPresenceModule.GetPresencesFromUserIds.API(list)):andThen(function(Result)
				-- upvalues: ReceiveUsersPresenceFunction (upval), p1 (copy)
				ReceiveUsersPresenceFunction(Result.responseBody.userPresences, p1)
				
				return Result
			end):catch(function(Err)
				warn("NetworkingPresence failure in ChatFriendshipCreated, Status: " .. tostring(Err))
			end),
			(p1:dispatch(PreloadUsersThumbnailFunction(list, USERCAROUSELHEADSHOT, nil)))
		}
		p1:dispatch(GetConversationMetadata.API())
		PromiseModule.all(list1)
		
		return
	end
end

return function(Id)
	-- upvalues: AddNewFriend (copy)
	return function(p1, p2)
		-- upvalues: AddNewFriend (upval), Id (copy)
		AddNewFriend(p1, Id, p2)
	end
end