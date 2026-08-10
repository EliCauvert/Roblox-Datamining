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

local function AddNewFriend(p0, p1, p2) --[[ line: 24 ]]
	-- upvalues: userService (ref), userModel (ref), updateUsers (ref), preloadUsersThumbnail (ref), USER_CAROUSEL_HEAD_SHOT (ref), fFlagAppChatPresenceStoreMigrationModule (ref), networkingPresenceModule (ref), receiveUsersPresence (ref), getConversationMetadata (ref), promiseModule (ref)
	local var8 = if p2 then p2.UserService else userService
	local ok, status = pcall(function() --[[ line: 28 ]]
		-- upvalues: var8 (ref), p1 (ref)
		return var8:GetUserInfosByUserIdsAsync({ tonumber(p1) })[1]
	end)
	
	if not ok then return end
	if not status or not status.Username or not status.DisplayName then return end
	p0:dispatch(updateUsers({
		userModel.fromDataTable({
			isFriend = true,
			friendRank = 0,
			id = p1,
			name = status.Username,
			displayName = status.DisplayName,
			hasVerifiedBadge = status.HasVerifiedBadge
		})
	}))
	local list = { p1 }
	local list_1 = {
		p0:dispatch(preloadUsersThumbnail(list, USER_CAROUSEL_HEAD_SHOT, nil))
	}
	
	if not fFlagAppChatPresenceStoreMigrationModule then
		table.insert(list_1, p0:dispatch(networkingPresenceModule.GetPresencesFromUserIds.API(list)):andThen(function(p4) --[[ line: 66 ]]
			-- upvalues: receiveUsersPresence (copy), p0 (ref)
			receiveUsersPresence(p4.responseBody.userPresences, p0)
			
			return p4
		end):catch(function(p3) --[[ line: 71 ]]
			warn("NetworkingPresence failure in ChatFriendshipCreated, Status: " .. tostring(p3))
		end))
	end
	p0:dispatch(getConversationMetadata.API())
	promiseModule.all(list_1)
end

return function(p5) --[[ line: 83 ]]
	-- upvalues: AddNewFriend (ref)
	return function(p6, p7) --[[ line: 84 ]]
		-- upvalues: AddNewFriend (copy), p5 (ref)
		AddNewFriend(p6, p5, p7)
	end
end