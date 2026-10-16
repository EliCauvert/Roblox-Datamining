local CorePackages = game:GetService("CorePackages")
local ShareGame = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Pages.ShareGame
local GameInviteEvents = require(CorePackages.Workspace.Packages.GameInvite).GameInviteEvents
local PromiseModule = require(CorePackages.Packages.Promise)
local ReceivedUserInviteStatusModule = require(ShareGame.Actions.ReceivedUserInviteStatus)
local InviteStatus = require(ShareGame.Constants).InviteStatus
local PostSendExperienceInviteFunction = require(CorePackages.Workspace.Packages.GameInvite).PostSendExperienceInvite

return function(p1, p2, p3, p4, p5, p6, p7) --[[ Line: 18 ]]
	-- upvalues: ReceivedUserInviteStatusModule (copy), InviteStatus (copy), PromiseModule (copy), PostSendExperienceInviteFunction (copy), GameInviteEvents (copy)
	return function(p8) --[[ Line: 27 ]]
		-- upvalues: p3 (copy), ReceivedUserInviteStatusModule (upval), p2 (copy), InviteStatus (upval), PromiseModule (upval), PostSendExperienceInviteFunction (upval), p1 (copy), p5 (copy), p6 (copy), p7 (copy), p4 (copy), GameInviteEvents (upval)
		if p3 == "0" then
			warn("Game Invite failed to send. Cannot send invite to unpublished Place.")
			p8:dispatch(ReceivedUserInviteStatusModule(p2, InviteStatus.Failed))
			
			return PromiseModule.reject()
		else
			local State = p8:getState()
			
			return PromiseModule.new(function(Callback1: () -> (), Callback: () -> ()) --[[ Line: 36 ]]
				-- upvalues: State (copy), p2 (upval), InviteStatus (upval)
				if State.Invites[p2] == InviteStatus.Pending then
					Callback()
					
					return
				else
					Callback1()
				end
			end):andThen(function() --[[ Line: 44 ]]
				-- upvalues: p8 (copy), ReceivedUserInviteStatusModule (upval), p2 (upval), InviteStatus (upval), PostSendExperienceInviteFunction (upval), p1 (upval), p3 (upval), p5 (upval), p6 (upval), p7 (upval)
				p8:dispatch(ReceivedUserInviteStatusModule(p2, InviteStatus.Pending))
				
				return PostSendExperienceInviteFunction(p1, p2, p3, p5, p6, p7)
			end):andThen(function(Result) --[[ Line: 48 ]]
				-- upvalues: p8 (copy), ReceivedUserInviteStatusModule (upval), p2 (upval), InviteStatus (upval)
				p8:dispatch(ReceivedUserInviteStatusModule(p2, InviteStatus.Success))
				
				return Result
			end, function() --[[ Line: 51 ]]
				-- upvalues: p4 (upval), p5 (upval), GameInviteEvents (upval), p8 (copy), ReceivedUserInviteStatusModule (upval), p2 (upval), InviteStatus (upval)
				p4:sendEvent(p5, GameInviteEvents.ErrorShown)
				p8:dispatch(ReceivedUserInviteStatusModule(p2, InviteStatus.Failed))
			end)
		end
	end
end