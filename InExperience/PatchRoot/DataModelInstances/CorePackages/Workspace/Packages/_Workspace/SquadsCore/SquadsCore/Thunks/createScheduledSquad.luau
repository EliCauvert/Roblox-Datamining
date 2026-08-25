local squadsCore = script:FindFirstAncestor("SquadsCore")
local createScheduledSquadModule = require(squadsCore.NetworkRequests.createScheduledSquad)
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local _ = require(squadsCore.Types)

return function(p0, p1, p2)
	-- upvalues: squadPromptTypeModule (ref), createScheduledSquadModule (ref)
	return function(p3)
		-- upvalues: p1 (ref), squadPromptTypeModule (copy), createScheduledSquadModule (copy), p0 (ref), p2 (ref)
		createScheduledSquadModule(p0, p2, function(p4)
			-- upvalues: p1 (copy), p3 (ref), squadPromptTypeModule (copy)
			p1(p3, {
				promptType = if p4 == 409 then squadPromptTypeModule.ScheduledSquadConflict else squadPromptTypeModule.Error
			})
		end)
	end
end