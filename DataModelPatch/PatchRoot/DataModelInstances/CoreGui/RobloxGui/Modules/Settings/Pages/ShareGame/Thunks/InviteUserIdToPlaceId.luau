local CorePackages = game:GetService("CorePackages")
local ShareGame = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Pages.ShareGame
local ApiSendGameInviteModule = require(ShareGame.Thunks.ApiSendGameInvite)
local ApiFetchPlaceInfosFunction = require(CorePackages.Workspace.Packages.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos
local PromiseModule = require(CorePackages.Packages.Promise)
local ReceivedUserInviteStatusModule = require(ShareGame.Actions.ReceivedUserInviteStatus)
local InviteStatus = require(ShareGame.Constants).InviteStatus

return function(p1, p2, p3)
	-- upvalues: ReceivedUserInviteStatusModule (copy), InviteStatus (copy), PromiseModule (copy), ApiFetchPlaceInfosFunction (copy), ApiSendGameInviteModule (copy)
	return function(p4)
		-- upvalues: p3 (copy), ReceivedUserInviteStatusModule (upval), p2 (copy), InviteStatus (upval), PromiseModule (upval), ApiFetchPlaceInfosFunction (upval), p1 (copy), ApiSendGameInviteModule (upval)
		if p3 == "0" then
			warn("Game Invite failed to send. Cannot send invite to unpublished Place.")
			p4:dispatch(ReceivedUserInviteStatusModule(p2, InviteStatus.Failed))
			
			return PromiseModule.reject()
		else
			local State = p4:getState()
			
			return PromiseModule.new(function(Callback1: () -> (), Callback: () -> ())
				-- upvalues: State (copy), p2 (upval), InviteStatus (upval)
				if State.Invites[tostring(p2)] == InviteStatus.Pending then
					Callback()
					
					return
				else
					Callback1()
				end
			end):andThen(function()
				-- upvalues: State (copy), p3 (upval), PromiseModule (upval), p4 (copy), ReceivedUserInviteStatusModule (upval), p2 (upval), InviteStatus (upval), ApiFetchPlaceInfosFunction (upval), p1 (upval), ApiSendGameInviteModule (upval)
				local PlaceInfo = State.PlaceInfos[p3]
				
				return PromiseModule.new(function(Callback: (any) -> (), Callback1)
					-- upvalues: p4 (upval), ReceivedUserInviteStatusModule (upval), p2 (upval), InviteStatus (upval), PlaceInfo (copy), ApiFetchPlaceInfosFunction (upval), p1 (upval), p3 (upval)
					p4:dispatch(ReceivedUserInviteStatusModule(p2, InviteStatus.Pending))
					
					if PlaceInfo then
						Callback(PlaceInfo)
						
						return
					else
						p4:dispatch(ApiFetchPlaceInfosFunction(p1, { p3 })):andThen(function(Entry)
							-- upvalues: Callback (copy), Callback1 (copy)
							if Entry[1] == nil then
								Callback1()
								
								return
							else
								Callback(Entry[1])
							end
						end, function()
							-- upvalues: Callback1 (copy)
							Callback1()
						end)
					end
				end):andThen(function(Result)
					-- upvalues: p4 (upval), ApiSendGameInviteModule (upval), p1 (upval), p2 (upval)
					return p4:dispatch(ApiSendGameInviteModule(p1, p2, Result))
				end):andThen(function(Result)
					-- upvalues: p4 (upval), ReceivedUserInviteStatusModule (upval), p2 (upval)
					p4:dispatch(ReceivedUserInviteStatusModule(p2, Result.resultType))
					
					return Result
				end, function()
					-- upvalues: p4 (upval), ReceivedUserInviteStatusModule (upval), p2 (upval), InviteStatus (upval)
					p4:dispatch(ReceivedUserInviteStatusModule(p2, InviteStatus.Failed))
				end)
			end)
		end
	end
end