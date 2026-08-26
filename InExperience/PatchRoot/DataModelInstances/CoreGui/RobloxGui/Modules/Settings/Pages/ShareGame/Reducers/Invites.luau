local immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local receivedUserInviteStatusModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Actions.ReceivedUserInviteStatus)

return function(p1, p2)
	-- upvalues: receivedUserInviteStatusModule (ref), immutable (ref)
	p1 = p1 or {}
	
	if p2.type == receivedUserInviteStatusModule.name then
		p1 = immutable.Set(p1, p2.userId, p2.inviteStatus)
	end
	return p1
end