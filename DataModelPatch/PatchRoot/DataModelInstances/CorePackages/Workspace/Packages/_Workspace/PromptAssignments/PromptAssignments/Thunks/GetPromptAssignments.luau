local PromptAssignments = script:FindFirstAncestor("PromptAssignments")
local PerformFetch = require(PromptAssignments.Parent.Http).PerformFetch
local GetPromptAssignmentsModule = require(PromptAssignments.Requests.GetPromptAssignments)

return function(p1)
	-- upvalues: PerformFetch (copy), GetPromptAssignmentsModule (copy)
	return PerformFetch.Single("GetPromptAssignments", function(_)
		-- upvalues: GetPromptAssignmentsModule (upval), p1 (copy)
		return GetPromptAssignmentsModule(p1):andThen(function(Result)
			return Result.responseBody
		end)
	end)
end