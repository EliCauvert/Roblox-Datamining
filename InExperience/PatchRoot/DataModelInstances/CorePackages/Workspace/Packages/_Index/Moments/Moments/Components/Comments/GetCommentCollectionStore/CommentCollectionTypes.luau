local _ = require(script:FindFirstAncestor("Moments").Parent.MomentsTypes)

return {
	LoadStatus = {
		Idle = "Idle",
		Loading = "Loading",
		Success = "Success",
		Failed = "Failed"
	},
	pendingSentinel = function(p1): string
		return `pending:{p1}`
	end,
	isPendingSentinel = function(Text: string): boolean
		return string.sub(Text, 1, 8) == "pending:"
	end
}