local shareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local receivedUserInviteStatusModule = require(shareGame.Actions.ReceivedUserInviteStatus)
local stoppedToastTimerModule = require(shareGame.Actions.StoppedToastTimer)
local inviteStatus = require(shareGame.Constants).InviteStatus

return function(p1, p2)
	-- upvalues: receivedUserInviteStatusModule (ref), inviteStatus (ref), immutable (ref), stoppedToastTimerModule (ref)
	p1 = p1 or { failedInvites = {} }
	
	if p2.type == receivedUserInviteStatusModule.name then
		local inviteStatus_1 = p2.inviteStatus
		
		if inviteStatus_1 == inviteStatus.Moderated or inviteStatus_1 == inviteStatus.Failed then
			p1 = immutable.JoinDictionaries(p1, {
				failedInvites = immutable.JoinDictionaries(p1.failedInvites, immutable.Append(p1.failedInvites, {
					timeStamp = tick(),
					userId = p2.userId,
					status = inviteStatus_1
				}))
			})
			
			return p1
		end
	elseif p2.type == stoppedToastTimerModule.name then
		p1 = immutable.JoinDictionaries(p1, { failedInvites = {} })
	end
	return p1
end