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

return function(p0, p1, p2, p3, p4)
	-- upvalues: promiseModule (ref), squadLocationEnumModule (ref), squadRccEventManagerModule (ref), fFlagSquadExperienceInviteRetryAfterModule (ref), getExperienceInviteRetryAfterStoreModule (ref), currentSquadUpdated (ref), networkingSquadsModule (ref), loggerModule (ref)
	return function(p5)
		-- upvalues: promiseModule (copy), p2 (ref), p3 (ref), squadLocationEnumModule (copy), squadRccEventManagerModule (copy), p4 (ref), fFlagSquadExperienceInviteRetryAfterModule (copy), getExperienceInviteRetryAfterStoreModule (copy), currentSquadUpdated (copy), networkingSquadsModule (copy), loggerModule (copy), p0 (ref), p1 (ref)
		local state = p5:getState()
		local squadId = state.Squad and (state.Squad.Squad and (state.Squad.Squad.currentSquad and state.Squad.Squad.currentSquad.squadId))
		
		if not squadId then
			return promiseModule.resolve()
		end
		local var10 = function()
			-- upvalues: p2 (copy), p3 (copy), squadLocationEnumModule (copy), squadRccEventManagerModule (copy), p4 (copy), fFlagSquadExperienceInviteRetryAfterModule (copy), getExperienceInviteRetryAfterStoreModule (copy), squadId (ref), p5 (ref), currentSquadUpdated (copy), networkingSquadsModule (copy), loggerModule (copy)
			if p2 then
				p2()
			end
			if p3 == squadLocationEnumModule.InExperience then
				squadRccEventManagerModule:setLeaveSquadPendingAndFireEvent(true, p4)
			end
			if fFlagSquadExperienceInviteRetryAfterModule then
				getExperienceInviteRetryAfterStoreModule(false).unblock(squadId)
			end
			p5:dispatch(currentSquadUpdated(nil))
			p5:dispatch(networkingSquadsModule.LeaveSquad.API({ squadId = squadId })):andThen(function()
				-- upvalues: p3 (copy), squadLocationEnumModule (copy), squadRccEventManagerModule (copy), p4 (copy)
				if p3 == squadLocationEnumModule.InExperience then
					squadRccEventManagerModule:setLeaveSquadPendingAndFireEvent(false, p4)
				end
			end):catch(function(p6)
				-- upvalues: loggerModule (copy)
				loggerModule:error("Error occured with NetworkingSquads.LeaveSquad: {}", tostring(p6))
			end)
		end
		
		if p0 then
			return p1(p5, { onConfirm = var10, promptType = p0 })
		end
		var10()
		
		return promiseModule.resolve()
	end
end