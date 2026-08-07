local corePackagesService = game:GetService("CorePackages")
local shareGame = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Pages.ShareGame
local gameInviteEvents = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteEvents
local promiseModule = require(corePackagesService.Packages.Promise)
local receivedUserInviteStatusModule = require(shareGame.Actions.ReceivedUserInviteStatus)
local inviteStatus = require(shareGame.Constants).InviteStatus
local postSendExperienceInvite = require(corePackagesService.Workspace.Packages.GameInvite).PostSendExperienceInvite

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 18 ]]
	-- upvalues: receivedUserInviteStatusModule (ref), inviteStatus (ref), promiseModule (ref), postSendExperienceInvite (ref), gameInviteEvents (ref)
	return function(p7) --[[ line: 27 ]]
		-- upvalues: p2 (ref), receivedUserInviteStatusModule (copy), p1 (ref), inviteStatus (copy), promiseModule (copy), postSendExperienceInvite (copy), p0 (ref), p4 (ref), p5 (ref), p6 (ref), p3 (ref), gameInviteEvents (copy)
		if p2 == "0" then
			warn("Game Invite failed to send. Cannot send invite to unpublished Place.")
			p7:dispatch(receivedUserInviteStatusModule(p1, inviteStatus.Failed))
			
			return promiseModule.reject()
		end
		local state = p7:getState()
		
		return promiseModule.new(function(p9, p10) --[[ line: 36 ]]
			-- upvalues: state (ref), p1 (copy), inviteStatus (copy)
			if state.Invites[p1] == inviteStatus.Pending then
				p10()
				
				return
			end
			p9()
		end):andThen(function() --[[ line: 44 ]]
			-- upvalues: p7 (ref), receivedUserInviteStatusModule (copy), p1 (copy), inviteStatus (copy), postSendExperienceInvite (copy), p0 (copy), p2 (copy), p4 (copy), p5 (copy), p6 (copy)
			p7:dispatch(receivedUserInviteStatusModule(p1, inviteStatus.Pending))
			
			return postSendExperienceInvite(p0, p1, p2, p4, p5, p6)
		end):andThen(function(p8) --[[ line: 48 ]]
			-- upvalues: p7 (ref), receivedUserInviteStatusModule (copy), p1 (copy), inviteStatus (copy)
			p7:dispatch(receivedUserInviteStatusModule(p1, inviteStatus.Success))
			
			return p8
		end, function() --[[ line: 51 ]]
			-- upvalues: p3 (copy), p4 (copy), gameInviteEvents (copy), p7 (ref), receivedUserInviteStatusModule (copy), p1 (copy), inviteStatus (copy)
			p3:sendEvent(p4, gameInviteEvents.ErrorShown)
			p7:dispatch(receivedUserInviteStatusModule(p1, inviteStatus.Failed))
		end)
	end
end