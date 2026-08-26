local squadsCore = script:FindFirstAncestor("SquadsCore")
local createScheduledSquadModule = require(squadsCore.NetworkRequests.createScheduledSquad)
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local _ = require(squadsCore.Types)

return function(p1, p2, p3)
	-- upvalues: squadPromptTypeModule (ref), createScheduledSquadModule (ref)
	return function(p4)
		-- upvalues: p2 (ref), squadPromptTypeModule (copy), createScheduledSquadModule (copy), p1 (ref), p3 (ref)
		createScheduledSquadModule(p1, p3, function(p5)
			-- upvalues: p2 (copy), p4 (ref), squadPromptTypeModule (copy)
			p2(p4, {
				promptType = if p5 == 409 then squadPromptTypeModule.ScheduledSquadConflict else squadPromptTypeModule.Error
			})
		end)
	end
end