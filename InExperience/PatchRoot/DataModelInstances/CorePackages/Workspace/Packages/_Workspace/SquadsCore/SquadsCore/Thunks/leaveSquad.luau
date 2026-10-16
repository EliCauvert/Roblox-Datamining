local SquadsCore = script:FindFirstAncestor("SquadsCore")
local LoggerModule = require(SquadsCore.Logger)
local SquadLocationEnumModule = require(SquadsCore.Enums.SquadLocationEnum)
local _ = require(SquadsCore.Enums.SquadPromptType)
local SquadRccEventManagerModule = require(SquadsCore.ServiceManager.SquadRccEventManager)
local PromiseModule = require(SquadsCore.Parent.Promise)
local CurrentSquadUpdatedFunction = require(SquadsCore.RoduxSquads).Actions.CurrentSquadUpdated
local NetworkingSquadsModule = require(SquadsCore.Http.NetworkingSquads)
local GetExperienceInviteRetryAfterStoreModule = require(SquadsCore.Stores.GetExperienceInviteRetryAfterStore)

return function(PromptType, Callback, Callback1, InExperience, p1) --[[ Line: 16 ]]
	-- upvalues: PromiseModule (copy), SquadLocationEnumModule (copy), SquadRccEventManagerModule (copy), GetExperienceInviteRetryAfterStoreModule (copy), CurrentSquadUpdatedFunction (copy), NetworkingSquadsModule (copy), LoggerModule (copy)
	return function(p2) --[[ Line: 23 ]]
		-- upvalues: PromiseModule (upval), Callback1 (copy), InExperience (copy), SquadLocationEnumModule (upval), SquadRccEventManagerModule (upval), p1 (copy), GetExperienceInviteRetryAfterStoreModule (upval), CurrentSquadUpdatedFunction (upval), NetworkingSquadsModule (upval), LoggerModule (upval), PromptType (copy), Callback (copy)
		local State = p2:getState()
		local SquadId = State.Squad and (State.Squad.Squad and (State.Squad.Squad.currentSquad and State.Squad.Squad.currentSquad.squadId))
		
		if not SquadId then
			return PromiseModule.resolve()
		end
		local function OnConfirm() --[[ Line: 35 ]]
			-- upvalues: Callback1 (upval), InExperience (upval), SquadLocationEnumModule (upval), SquadRccEventManagerModule (upval), p1 (upval), GetExperienceInviteRetryAfterStoreModule (upval), SquadId (copy), p2 (copy), CurrentSquadUpdatedFunction (upval), NetworkingSquadsModule (upval), LoggerModule (upval)
			if Callback1 then
				Callback1()
			end
			if InExperience == SquadLocationEnumModule.InExperience then
				SquadRccEventManagerModule:setLeaveSquadPendingAndFireEvent(true, p1)
			end
			GetExperienceInviteRetryAfterStoreModule(false).unblock(SquadId)
			p2:dispatch(CurrentSquadUpdatedFunction(nil))
			p2:dispatch(NetworkingSquadsModule.LeaveSquad.API({ squadId = SquadId })):andThen(function() --[[ Line: 51 ]]
				-- upvalues: InExperience (upval), SquadLocationEnumModule (upval), SquadRccEventManagerModule (upval), p1 (upval)
				if InExperience == SquadLocationEnumModule.InExperience then
					SquadRccEventManagerModule:setLeaveSquadPendingAndFireEvent(false, p1)
				end
			end):catch(function(Err) --[[ Line: 56 ]]
				-- upvalues: LoggerModule (upval)
				LoggerModule:error("Error occured with NetworkingSquads.LeaveSquad: {}", (tostring(Err)))
			end)
		end
		
		if PromptType then
			return Callback(p2, { onConfirm = OnConfirm, promptType = PromptType })
		else
			OnConfirm()
			
			return PromiseModule.resolve()
		end
	end
end