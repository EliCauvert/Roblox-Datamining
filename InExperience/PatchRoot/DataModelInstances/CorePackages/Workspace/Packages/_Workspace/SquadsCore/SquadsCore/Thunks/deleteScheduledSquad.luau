local SquadsCore = script:FindFirstAncestor("SquadsCore")
local SquadPromptTypeModule = require(SquadsCore.Enums.SquadPromptType)
local DeleteScheduledSquadModule = require(SquadsCore.NetworkRequests.deleteScheduledSquad)

return function(ScheduledGroupUpId, Callback, p1) --[[ Line: 6 ]]
	-- upvalues: SquadPromptTypeModule (copy), DeleteScheduledSquadModule (copy)
	return function(p2) --[[ Line: 11 ]]
		-- upvalues: Callback (copy), SquadPromptTypeModule (upval), DeleteScheduledSquadModule (upval), ScheduledGroupUpId (copy), p1 (copy)
		local function v3() --[[ Line: 12 ]]
			-- upvalues: Callback (upval), p2 (copy), SquadPromptTypeModule (upval)
			Callback(p2, { promptType = SquadPromptTypeModule.Error })
		end
		
		return Callback(p2, {
			onConfirm = function() --[[ Line: 19 ]]
				-- upvalues: DeleteScheduledSquadModule (upval), ScheduledGroupUpId (upval), p1 (upval), v3 (copy)
				DeleteScheduledSquadModule({ scheduledGroupUpId = ScheduledGroupUpId }, p1, v3)
			end,
			promptType = SquadPromptTypeModule.ConfirmDeleteScheduledSquad
		})
	end
end