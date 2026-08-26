local corePackagesService = game:GetService("CorePackages")
local shareGame = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Pages.ShareGame
local apiSendGameInviteModule = require(shareGame.Thunks.ApiSendGameInvite)
local apiFetchPlaceInfos = require(corePackagesService.Workspace.Packages.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos
local promiseModule = require(corePackagesService.Packages.Promise)
local receivedUserInviteStatusModule = require(shareGame.Actions.ReceivedUserInviteStatus)
local inviteStatus = require(shareGame.Constants).InviteStatus

return function(p1, p2, p3)
	-- upvalues: receivedUserInviteStatusModule (ref), inviteStatus (ref), promiseModule (ref), apiFetchPlaceInfos (ref), apiSendGameInviteModule (ref)
	return function(p4)
		-- upvalues: p3 (ref), receivedUserInviteStatusModule (copy), p2 (ref), inviteStatus (copy), promiseModule (copy), apiFetchPlaceInfos (copy), p1 (ref), apiSendGameInviteModule (copy)
		if p3 == "0" then
			warn("Game Invite failed to send. Cannot send invite to unpublished Place.")
			p4:dispatch(receivedUserInviteStatusModule(p2, inviteStatus.Failed))
			
			return promiseModule.reject()
		end
		local state = p4:getState()
		
		return promiseModule.new(function(p5, p6)
			-- upvalues: state (ref), p2 (copy), inviteStatus (copy)
			if state.Invites[tostring(p2)] == inviteStatus.Pending then
				p6()
				
				return
			end
			p5()
		end):andThen(function()
			-- upvalues: state (ref), p3 (copy), promiseModule (copy), p4 (ref), receivedUserInviteStatusModule (copy), p2 (copy), inviteStatus (copy), apiFetchPlaceInfos (copy), p1 (copy), apiSendGameInviteModule (copy)
			local var1 = state.PlaceInfos[p3]
			
			return promiseModule.new(function(p5, p6)
				-- upvalues: p4 (copy), receivedUserInviteStatusModule (copy), p2 (copy), inviteStatus (copy), var1 (ref), apiFetchPlaceInfos (copy), p1 (copy), p3 (copy)
				p4:dispatch(receivedUserInviteStatusModule(p2, inviteStatus.Pending))
				
				if var1 then
					p5(var1)
					
					return
				end
				p4:dispatch(apiFetchPlaceInfos(p1, { p3 })):andThen(function(p7)
					-- upvalues: p5 (ref), p6 (ref)
					if p7[1] == nil then
						p6()
						
						return
					end
					p5(p7[1])
				end, function()
					-- upvalues: p6 (ref)
					p6()
				end)
			end):andThen(function(p5)
				-- upvalues: p4 (copy), apiSendGameInviteModule (copy), p1 (copy), p2 (copy)
				return p4:dispatch(apiSendGameInviteModule(p1, p2, p5))
			end):andThen(function(p5)
				-- upvalues: p4 (copy), receivedUserInviteStatusModule (copy), p2 (copy)
				p4:dispatch(receivedUserInviteStatusModule(p2, p5.resultType))
				
				return p5
			end, function()
				-- upvalues: p4 (copy), receivedUserInviteStatusModule (copy), p2 (copy), inviteStatus (copy)
				p4:dispatch(receivedUserInviteStatusModule(p2, inviteStatus.Failed))
			end)
		end)
	end
end