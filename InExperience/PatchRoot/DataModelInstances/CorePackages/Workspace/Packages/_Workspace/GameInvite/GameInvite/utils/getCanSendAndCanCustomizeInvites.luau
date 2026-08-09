local gameInvite = script:FindFirstAncestor("GameInvite")
local networkImpl = require(gameInvite.GameInviteDependencies).networkImpl
local _ = require(gameInvite.gameInviteModalType)
local getCanSendAndCanCustomizeInvitesModule = require(gameInvite.Requests.GetCanSendAndCanCustomizeInvites)

return function(p0, p1) --[[ line: 9 ]]
	-- upvalues: getCanSendAndCanCustomizeInvitesModule (ref), networkImpl (ref)
	local var2, var3 = getCanSendAndCanCustomizeInvitesModule(networkImpl, p0, p1):await()
	
	if var2 and var3 and var3.responseBody then
		return var3.responseBody.canPrompt or false, var3.responseBody.canCustomize or false
	end
	return false, false
end