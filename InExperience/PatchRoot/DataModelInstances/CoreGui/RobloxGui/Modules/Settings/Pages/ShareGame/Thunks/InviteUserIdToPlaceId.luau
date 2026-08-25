local corePackagesService = game:GetService("CorePackages")
local shareGame = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Pages.ShareGame
local apiSendGameInviteModule = require(shareGame.Thunks.ApiSendGameInvite)
local apiFetchPlaceInfos = require(corePackagesService.Workspace.Packages.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos
local promiseModule = require(corePackagesService.Packages.Promise)
local receivedUserInviteStatusModule = require(shareGame.Actions.ReceivedUserInviteStatus)
local inviteStatus = require(shareGame.Constants).InviteStatus

return function(p0, p1, p2)
	-- upvalues: receivedUserInviteStatusModule (ref), inviteStatus (ref), promiseModule (ref), apiFetchPlaceInfos (ref), apiSendGameInviteModule (ref)
	return function(p3)
		-- upvalues: p2 (ref), receivedUserInviteStatusModule (copy), p1 (ref), inviteStatus (copy), promiseModule (copy), apiFetchPlaceInfos (copy), p0 (ref), apiSendGameInviteModule (copy)
		if p2 == "0" then
			warn("Game Invite failed to send. Cannot send invite to unpublished Place.")
			p3:dispatch(receivedUserInviteStatusModule(p1, inviteStatus.Failed))
			
			return promiseModule.reject()
		end
		local state = p3:getState()
		
		return promiseModule.new(function(p9, p10)
			-- upvalues: state (ref), p1 (copy), inviteStatus (copy)
			if state.Invites[tostring(p1)] == inviteStatus.Pending then
				p10()
				
				return
			end
			p9()
		end):andThen(function()
			-- upvalues: state (ref), p2 (copy), promiseModule (copy), p3 (ref), receivedUserInviteStatusModule (copy), p1 (copy), inviteStatus (copy), apiFetchPlaceInfos (copy), p0 (copy), apiSendGameInviteModule (copy)
			local var5 = state.PlaceInfos[p2]
			
			return promiseModule.new(function(p6, p7)
				-- upvalues: p3 (copy), receivedUserInviteStatusModule (copy), p1 (copy), inviteStatus (copy), var5 (ref), apiFetchPlaceInfos (copy), p0 (copy), p2 (copy)
				p3:dispatch(receivedUserInviteStatusModule(p1, inviteStatus.Pending))
				
				if var5 then
					p6(var5)
					
					return
				end
				p3:dispatch(apiFetchPlaceInfos(p0, { p2 })):andThen(function(p8)
					-- upvalues: p6 (ref), p7 (ref)
					if p8[1] == nil then
						p7()
						
						return
					end
					p6(p8[1])
				end, function()
					-- upvalues: p7 (ref)
					p7()
				end)
			end):andThen(function(p5)
				-- upvalues: p3 (copy), apiSendGameInviteModule (copy), p0 (copy), p1 (copy)
				return p3:dispatch(apiSendGameInviteModule(p0, p1, p5))
			end):andThen(function(p4)
				-- upvalues: p3 (copy), receivedUserInviteStatusModule (copy), p1 (copy)
				p3:dispatch(receivedUserInviteStatusModule(p1, p4.resultType))
				
				return p4
			end, function()
				-- upvalues: p3 (copy), receivedUserInviteStatusModule (copy), p1 (copy), inviteStatus (copy)
				p3:dispatch(receivedUserInviteStatusModule(p1, inviteStatus.Failed))
			end)
		end)
	end
end