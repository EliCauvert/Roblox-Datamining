local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local loggerModule = require(squadsCore.Logger)
local squadLocationEnumModule = require(squadsCore.Enums.SquadLocationEnum)
local _ = require(squadsCore.Enums.SquadPromptType)
local squadRccEventManagerModule = require(squadsCore.ServiceManager.SquadRccEventManager)
local promiseModule = require(parent.Promise)
local currentSquadUpdated = require(squadsCore.RoduxSquads).Actions.CurrentSquadUpdated
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)

return function(p0, p1, p2, p3, p4) --[[ line: 14 ]]
	-- upvalues: promiseModule (ref), squadLocationEnumModule (ref), squadRccEventManagerModule (ref), currentSquadUpdated (ref), networkingSquadsModule (ref), loggerModule (ref)
	return function(p5) --[[ line: 21 ]]
		-- upvalues: promiseModule (copy), p2 (ref), p3 (ref), squadLocationEnumModule (copy), squadRccEventManagerModule (copy), p4 (ref), currentSquadUpdated (copy), networkingSquadsModule (copy), loggerModule (copy), p0 (ref), p1 (ref)
		local state = p5:getState()
		local squadId = state.Squad and (state.Squad.Squad and (state.Squad.Squad.currentSquad and state.Squad.Squad.currentSquad.squadId))
		
		if not squadId then
			return promiseModule.resolve()
		end
		local var8 = function() --[[ line: 33 ]]
			-- upvalues: p2 (copy), p3 (copy), squadLocationEnumModule (copy), squadRccEventManagerModule (copy), p4 (copy), p5 (ref), currentSquadUpdated (copy), networkingSquadsModule (copy), squadId (ref), loggerModule (copy)
			if p2 then
				p2()
			end
			if p3 == squadLocationEnumModule.InExperience then
				squadRccEventManagerModule:setLeaveSquadPendingAndFireEvent(true, p4)
			end
			p5:dispatch(currentSquadUpdated(nil))
			p5:dispatch(networkingSquadsModule.LeaveSquad.API({ squadId = squadId })):andThen(function() --[[ line: 45 ]]
				-- upvalues: p3 (copy), squadLocationEnumModule (copy), squadRccEventManagerModule (copy), p4 (copy)
				if p3 == squadLocationEnumModule.InExperience then
					squadRccEventManagerModule:setLeaveSquadPendingAndFireEvent(false, p4)
				end
			end):catch(function(p6) --[[ line: 50 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:error("Error occured with NetworkingSquads.LeaveSquad: {}", tostring(p6))
			end)
		end
		
		if p0 then
			return p1(p5, { onConfirm = var8, promptType = p0 })
		end
		var8()
		
		return promiseModule.resolve()
	end
end