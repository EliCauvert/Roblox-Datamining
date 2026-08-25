local squadsCore = script:FindFirstAncestor("SquadsCore")
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local deleteScheduledSquadModule = require(squadsCore.NetworkRequests.deleteScheduledSquad)

return function(p0, p1, p2)
	-- upvalues: squadPromptTypeModule (ref), deleteScheduledSquadModule (ref)
	return function(p3)
		-- upvalues: p1 (ref), squadPromptTypeModule (copy), deleteScheduledSquadModule (copy), p0 (ref), p2 (ref)
		local var3 = function()
			-- upvalues: p1 (copy), p3 (ref), squadPromptTypeModule (copy)
			p1(p3, { promptType = squadPromptTypeModule.Error })
		end
		
		return p1(p3, {
			onConfirm = function()
				-- upvalues: deleteScheduledSquadModule (copy), p0 (copy), p2 (copy), var3 (ref)
				deleteScheduledSquadModule({ scheduledGroupUpId = p0 }, p2, var3)
			end,
			promptType = squadPromptTypeModule.ConfirmDeleteScheduledSquad
		})
	end
end