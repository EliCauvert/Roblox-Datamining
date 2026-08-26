local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local loggerModule = require(squadsCore.Logger)
local squadLocationEnumModule = require(squadsCore.Enums.SquadLocationEnum)
local _ = require(squadsCore.Enums.SquadPromptType)
local squadRccEventManagerModule = require(squadsCore.ServiceManager.SquadRccEventManager)
local promiseModule = require(parent.Promise)
local currentSquadUpdated = require(squadsCore.RoduxSquads).Actions.CurrentSquadUpdated
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local getExperienceInviteRetryAfterStoreModule = require(squadsCore.Stores.GetExperienceInviteRetryAfterStore)
local fFlagSquadExperienceInviteRetryAfterModule = require(squadsCore.Flags.FFlagSquadExperienceInviteRetryAfter)

return function(p1, p2, p3, p4, p5)
	-- upvalues: promiseModule (ref), squadLocationEnumModule (ref), squadRccEventManagerModule (ref), fFlagSquadExperienceInviteRetryAfterModule (ref), getExperienceInviteRetryAfterStoreModule (ref), currentSquadUpdated (ref), networkingSquadsModule (ref), loggerModule (ref)
	return function(p6)
		-- upvalues: promiseModule (copy), p3 (ref), p4 (ref), squadLocationEnumModule (copy), squadRccEventManagerModule (copy), p5 (ref), fFlagSquadExperienceInviteRetryAfterModule (copy), getExperienceInviteRetryAfterStoreModule (copy), currentSquadUpdated (copy), networkingSquadsModule (copy), loggerModule (copy), p1 (ref), p2 (ref)
		local state = p6:getState()
		local squadId = state.Squad and (state.Squad.Squad and (state.Squad.Squad.currentSquad and state.Squad.Squad.currentSquad.squadId))
		
		if not squadId then
			return promiseModule.resolve()
		end
		local var1 = function()
			-- upvalues: p3 (copy), p4 (copy), squadLocationEnumModule (copy), squadRccEventManagerModule (copy), p5 (copy), fFlagSquadExperienceInviteRetryAfterModule (copy), getExperienceInviteRetryAfterStoreModule (copy), squadId (ref), p6 (ref), currentSquadUpdated (copy), networkingSquadsModule (copy), loggerModule (copy)
			if p3 then
				p3()
			end
			if p4 == squadLocationEnumModule.InExperience then
				squadRccEventManagerModule:setLeaveSquadPendingAndFireEvent(true, p5)
			end
			if fFlagSquadExperienceInviteRetryAfterModule then
				getExperienceInviteRetryAfterStoreModule(false).unblock(squadId)
			end
			p6:dispatch(currentSquadUpdated(nil))
			p6:dispatch(networkingSquadsModule.LeaveSquad.API({ squadId = squadId })):andThen(function()
				-- upvalues: p4 (copy), squadLocationEnumModule (copy), squadRccEventManagerModule (copy), p5 (copy)
				if p4 == squadLocationEnumModule.InExperience then
					squadRccEventManagerModule:setLeaveSquadPendingAndFireEvent(false, p5)
				end
			end):catch(function(p7)
				-- upvalues: loggerModule (copy)
				loggerModule:error("Error occured with NetworkingSquads.LeaveSquad: {}", tostring(p7))
			end)
		end
		
		if p1 then
			return p2(p6, { onConfirm = var1, promptType = p1 })
		end
		var1()
		
		return promiseModule.resolve()
	end
end