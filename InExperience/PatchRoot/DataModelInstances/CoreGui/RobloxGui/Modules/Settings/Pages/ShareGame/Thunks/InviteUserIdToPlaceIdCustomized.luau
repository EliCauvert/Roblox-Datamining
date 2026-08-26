local corePackagesService = game:GetService("CorePackages")
local shareGame = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Pages.ShareGame
local gameInviteEvents = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteEvents
local promiseModule = require(corePackagesService.Packages.Promise)
local receivedUserInviteStatusModule = require(shareGame.Actions.ReceivedUserInviteStatus)
local inviteStatus = require(shareGame.Constants).InviteStatus
local postSendExperienceInvite = require(corePackagesService.Workspace.Packages.GameInvite).PostSendExperienceInvite

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: receivedUserInviteStatusModule (ref), inviteStatus (ref), promiseModule (ref), postSendExperienceInvite (ref), gameInviteEvents (ref)
	return function(p8)
		-- upvalues: p3 (ref), receivedUserInviteStatusModule (copy), p2 (ref), inviteStatus (copy), promiseModule (copy), postSendExperienceInvite (copy), p1 (ref), p5 (ref), p6 (ref), p7 (ref), p4 (ref), gameInviteEvents (copy)
		if p3 == "0" then
			warn("Game Invite failed to send. Cannot send invite to unpublished Place.")
			p8:dispatch(receivedUserInviteStatusModule(p2, inviteStatus.Failed))
			
			return promiseModule.reject()
		end
		local state = p8:getState()
		
		return promiseModule.new(function(p9, p10)
			-- upvalues: state (ref), p2 (copy), inviteStatus (copy)
			if state.Invites[p2] == inviteStatus.Pending then
				p10()
				
				return
			end
			p9()
		end):andThen(function()
			-- upvalues: p8 (ref), receivedUserInviteStatusModule (copy), p2 (copy), inviteStatus (copy), postSendExperienceInvite (copy), p1 (copy), p3 (copy), p5 (copy), p6 (copy), p7 (copy)
			p8:dispatch(receivedUserInviteStatusModule(p2, inviteStatus.Pending))
			
			return postSendExperienceInvite(p1, p2, p3, p5, p6, p7)
		end):andThen(function(p9)
			-- upvalues: p8 (ref), receivedUserInviteStatusModule (copy), p2 (copy), inviteStatus (copy)
			p8:dispatch(receivedUserInviteStatusModule(p2, inviteStatus.Success))
			
			return p9
		end, function()
			-- upvalues: p4 (copy), p5 (copy), gameInviteEvents (copy), p8 (ref), receivedUserInviteStatusModule (copy), p2 (copy), inviteStatus (copy)
			p4:sendEvent(p5, gameInviteEvents.ErrorShown)
			p8:dispatch(receivedUserInviteStatusModule(p2, inviteStatus.Failed))
		end)
	end
end