local PromptAssignments = script:FindFirstAncestor("PromptAssignments")
local PostUpdatePromptAssignmentsModule = require(PromptAssignments.Requests.PostUpdatePromptAssignments)
local PromptTypeModule = require(PromptAssignments.Enum.PromptType)
local PromptAssignmentActionModule = require(PromptAssignments.Enum.PromptAssignmentAction)

return function(p1, p2, p3)
	-- upvalues: PromptTypeModule (copy), PostUpdatePromptAssignmentsModule (copy), PromptAssignmentActionModule (copy)
	return function(_)
		-- upvalues: PromptTypeModule (upval), p2 (copy), PostUpdatePromptAssignmentsModule (upval), p1 (copy), PromptAssignmentActionModule (upval), p3 (copy)
		local RawValue = PromptTypeModule.toRawValue(p2)
		
		if RawValue == nil then
			RawValue = p2
		end
		return PostUpdatePromptAssignmentsModule(p1, RawValue, PromptAssignmentActionModule.toRawValue(p3)):andThen(function(Result)
			return Result.responseBody
		end)
	end
end