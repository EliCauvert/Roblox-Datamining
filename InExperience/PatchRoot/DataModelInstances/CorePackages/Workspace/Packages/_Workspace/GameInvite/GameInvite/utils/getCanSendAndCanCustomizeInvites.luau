local gameInvite = script:FindFirstAncestor("GameInvite")
local parent = gameInvite.Parent
local networkImpl = require(gameInvite.GameInviteDependencies).networkImpl
local _ = require(gameInvite.gameInviteModalType)
local getCanSendAndCanCustomizeInvitesModule = require(gameInvite.Requests.GetCanSendAndCanCustomizeInvites)
local fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt = require(parent.SharedFlags).FFlagGameInviteOpenModalWithoutBlockingOnCanPrompt

return function(p1, p2)
	-- upvalues: getCanSendAndCanCustomizeInvitesModule (ref), networkImpl (ref), fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt (ref)
	local var1, var2 = getCanSendAndCanCustomizeInvitesModule(networkImpl, p1, p2):await()
	
	if var1 and var2 and var2.responseBody then
		return var2.responseBody.canPrompt or false, var2.responseBody.canCustomize or false
	elseif fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt then
		return true, false
	end
	return false, false
end