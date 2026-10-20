local SquadsCore = script:FindFirstAncestor("SquadsCore")
local CreateScheduledSquadModule = require(SquadsCore.NetworkRequests.createScheduledSquad)
local SquadPromptTypeModule = require(SquadsCore.Enums.SquadPromptType)
local _ = require(SquadsCore.Types)

return function(p1, Callback, p2)
	-- upvalues: SquadPromptTypeModule (copy), CreateScheduledSquadModule (copy)
	return function(p3)
		-- upvalues: Callback (copy), SquadPromptTypeModule (upval), CreateScheduledSquadModule (upval), p1 (copy), p2 (copy)
		CreateScheduledSquadModule(p1, p2, function(p4)
			-- upvalues: Callback (upval), p3 (copy), SquadPromptTypeModule (upval)
			Callback(p3, {
				promptType = if p4 == 409 then SquadPromptTypeModule.ScheduledSquadConflict else SquadPromptTypeModule.Error
			})
		end)
	end
end