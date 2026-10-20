local NewResult = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.AppCommonLib).Signal.new()

return {
	requestOpen = function(p1)
		-- upvalues: NewResult (copy)
		NewResult:fire(p1)
	end,
	subscribe = function(p1)
		-- upvalues: NewResult (copy)
		return NewResult:connect(p1)
	end
}