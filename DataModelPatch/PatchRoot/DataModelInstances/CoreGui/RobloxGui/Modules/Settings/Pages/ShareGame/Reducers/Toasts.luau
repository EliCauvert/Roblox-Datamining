local ShareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local Immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local ReceivedUserInviteStatusModule = require(ShareGame.Actions.ReceivedUserInviteStatus)
local StoppedToastTimerModule = require(ShareGame.Actions.StoppedToastTimer)
local InviteStatus = require(ShareGame.Constants).InviteStatus

return function(p1, p2)
	-- upvalues: ReceivedUserInviteStatusModule (copy), InviteStatus (copy), Immutable (copy), StoppedToastTimerModule (copy)
	local P0 = p1 or { failedInvites = {} }
	
	if p2.type == ReceivedUserInviteStatusModule.name then
		local InviteStatus1 = p2.inviteStatus
		
		if InviteStatus1 == InviteStatus.Moderated or InviteStatus1 == InviteStatus.Failed then
			P0 = Immutable.JoinDictionaries(P0, {
				failedInvites = Immutable.JoinDictionaries(P0.failedInvites, Immutable.Append(P0.failedInvites, {
					timeStamp = tick(),
					userId = p2.userId,
					status = InviteStatus1
				}))
			})
			
			return P0
		end
	elseif p2.type == StoppedToastTimerModule.name then
		P0 = Immutable.JoinDictionaries(P0, { failedInvites = {} })
	end
	return P0
end