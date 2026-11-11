local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local FetchDialogModule = require(ChallengeDialog.Requests.FetchDialog)
local PerformFetch = require(ChallengeDialog.Parent.Http).PerformFetch

return function(p1)
	-- upvalues: PerformFetch (copy), FetchDialogModule (copy)
	return PerformFetch.Single("FetchDialog", function(_)
		-- upvalues: FetchDialogModule (upval), p1 (copy)
		return FetchDialogModule(p1):andThen(function(Result)
			return Result.responseBody
		end)
	end)
end