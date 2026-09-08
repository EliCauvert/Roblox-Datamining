local _ = require(script:FindFirstAncestor("Moments").Parent.MomentsTypes)

return {
	LoadStatus = {
		Idle = "Idle",
		Loading = "Loading",
		Success = "Success",
		Failed = "Failed"
	},
	pendingSentinel = function(p1)
		return `pending:{p1}`
	end,
	isPendingSentinel = function(p1)
		return string.sub(p1, 1, 8) == "pending:"
	end
}