local Immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local ReceivedUserInviteStatusModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Actions.ReceivedUserInviteStatus)

return function(p1, p2) --[[ Line: 9 ]]
	-- upvalues: ReceivedUserInviteStatusModule (copy), Immutable (copy)
	local P0 = p1 or {}
	
	if p2.type == ReceivedUserInviteStatusModule.name then
		P0 = Immutable.Set(P0, p2.userId, p2.inviteStatus)
	end
	return P0
end