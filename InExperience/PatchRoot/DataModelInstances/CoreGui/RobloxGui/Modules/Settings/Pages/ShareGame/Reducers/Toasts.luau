local shareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local receivedUserInviteStatusModule = require(shareGame.Actions.ReceivedUserInviteStatus)
local stoppedToastTimerModule = require(shareGame.Actions.StoppedToastTimer)
local inviteStatus = require(shareGame.Constants).InviteStatus

return function(p0, p1) --[[ line: 13 ]]
	-- upvalues: receivedUserInviteStatusModule (ref), inviteStatus (ref), immutable (ref), stoppedToastTimerModule (ref)
	p0 = p0 or { failedInvites = {} }
	
	if p1.type == receivedUserInviteStatusModule.name then
		local inviteStatus_1 = p1.inviteStatus
		
		if inviteStatus_1 == inviteStatus.Moderated or inviteStatus_1 == inviteStatus.Failed then
			p0 = immutable.JoinDictionaries(p0, {
				failedInvites = immutable.JoinDictionaries(p0.failedInvites, immutable.Append(p0.failedInvites, {
					timeStamp = tick(),
					userId = p1.userId,
					status = inviteStatus_1
				}))
			})
			
			return p0
		end
	elseif p1.type == stoppedToastTimerModule.name then
		p0 = immutable.JoinDictionaries(p0, { failedInvites = {} })
	end
	return p0
end