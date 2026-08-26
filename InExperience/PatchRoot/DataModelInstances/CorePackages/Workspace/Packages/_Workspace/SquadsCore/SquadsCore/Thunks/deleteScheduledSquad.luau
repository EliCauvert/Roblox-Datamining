local squadsCore = script:FindFirstAncestor("SquadsCore")
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local deleteScheduledSquadModule = require(squadsCore.NetworkRequests.deleteScheduledSquad)

return function(p1, p2, p3)
	-- upvalues: squadPromptTypeModule (ref), deleteScheduledSquadModule (ref)
	return function(p4)
		-- upvalues: p2 (ref), squadPromptTypeModule (copy), deleteScheduledSquadModule (copy), p1 (ref), p3 (ref)
		local var1 = function()
			-- upvalues: p2 (copy), p4 (ref), squadPromptTypeModule (copy)
			p2(p4, { promptType = squadPromptTypeModule.Error })
		end
		
		return p2(p4, {
			onConfirm = function()
				-- upvalues: deleteScheduledSquadModule (copy), p1 (copy), p3 (copy), var1 (ref)
				deleteScheduledSquadModule({ scheduledGroupUpId = p1 }, p3, var1)
			end,
			promptType = squadPromptTypeModule.ConfirmDeleteScheduledSquad
		})
	end
end