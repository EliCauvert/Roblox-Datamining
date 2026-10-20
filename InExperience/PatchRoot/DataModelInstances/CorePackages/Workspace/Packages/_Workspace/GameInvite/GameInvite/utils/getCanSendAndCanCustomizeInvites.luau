local GameInvite = script:FindFirstAncestor("GameInvite")
local NetworkImpl = require(GameInvite.GameInviteDependencies).networkImpl
local _ = require(GameInvite.gameInviteModalType)
local GetCanSendAndCanCustomizeInvitesModule = require(GameInvite.Requests.GetCanSendAndCanCustomizeInvites)
local FFlagGameInviteOpenModalWithoutBlockingOnCanPrompt = require(GameInvite.Parent.SharedFlags).FFlagGameInviteOpenModalWithoutBlockingOnCanPrompt

return function(p1, p2)
	-- upvalues: GetCanSendAndCanCustomizeInvitesModule (copy), NetworkImpl (copy), FFlagGameInviteOpenModalWithoutBlockingOnCanPrompt (copy)
	local v1, v2 = GetCanSendAndCanCustomizeInvitesModule(NetworkImpl, p1, p2):await()
	
	if v1 and v2 and v2.responseBody then
		return v2.responseBody.canPrompt or false, v2.responseBody.canCustomize or false
	elseif FFlagGameInviteOpenModalWithoutBlockingOnCanPrompt then
		return true, false
	else
		return false, false
	end
end