local immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local receivedUserInviteStatusModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Actions.ReceivedUserInviteStatus)

return function(p0, p1) --[[ line: 9 ]]
	-- upvalues: receivedUserInviteStatusModule (ref), immutable (ref)
	p0 = p0 or {}
	
	if p1.type == receivedUserInviteStatusModule.name then
		p0 = immutable.Set(p0, p1.userId, p1.inviteStatus)
	end
	return p0
end