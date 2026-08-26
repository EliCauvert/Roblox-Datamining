local userService = game:GetService("UserService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local promiseModule = require(parent.Promise)
local userLibModule = require(parent.UserLib)
local USER_CAROUSEL_HEAD_SHOT = userLibModule.Utils.AvatarThumbnailRequests.USER_CAROUSEL_HEAD_SHOT
local getConversationMetadata = appChatNetworkingModule.rodux.GetConversationMetadata
local preloadUsersThumbnail = userLibModule.Thunks.PreloadUsersThumbnail
local updateUsers = userLibModule.Thunks.UpdateUsers
local userModel = userLibModule.Models.UserModel
local receiveUsersPresence = userLibModule.Utils.receiveUsersPresence
local networkingPresenceModule = require(appChat.Http.NetworkingPresence)
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)

local function AddNewFriend(p1, p2, p3)
	-- upvalues: userService (ref), userModel (ref), updateUsers (ref), preloadUsersThumbnail (ref), USER_CAROUSEL_HEAD_SHOT (ref), fFlagAppChatPresenceStoreMigrationModule (ref), networkingPresenceModule (ref), receiveUsersPresence (ref), getConversationMetadata (ref), promiseModule (ref)
	local var1 = if p3 then p3.UserService else userService
	local ok, status = pcall(function()
		-- upvalues: var1 (ref), p2 (ref)
		return var1:GetUserInfosByUserIdsAsync({ tonumber(p2) })[1]
	end)
	
	if not ok then return end
	if not status or not status.Username or not status.DisplayName then return end
	p1:dispatch(updateUsers({
		userModel.fromDataTable({
			isFriend = true,
			friendRank = 0,
			id = p2,
			name = status.Username,
			displayName = status.DisplayName,
			hasVerifiedBadge = status.HasVerifiedBadge
		})
	}))
	local list = { p2 }
	local list_1 = {
		p1:dispatch(preloadUsersThumbnail(list, USER_CAROUSEL_HEAD_SHOT, nil))
	}
	
	if not fFlagAppChatPresenceStoreMigrationModule then
		table.insert(list_1, p1:dispatch(networkingPresenceModule.GetPresencesFromUserIds.API(list)):andThen(function(p4)
			-- upvalues: receiveUsersPresence (copy), p1 (ref)
			receiveUsersPresence(p4.responseBody.userPresences, p1)
			
			return p4
		end):catch(function(p4)
			warn("NetworkingPresence failure in ChatFriendshipCreated, Status: " .. tostring(p4))
		end))
	end
	p1:dispatch(getConversationMetadata.API())
	promiseModule.all(list_1)
end

return function(p1)
	-- upvalues: AddNewFriend (ref)
	return function(p2, p3)
		-- upvalues: AddNewFriend (copy), p1 (ref)
		AddNewFriend(p2, p1, p3)
	end
end