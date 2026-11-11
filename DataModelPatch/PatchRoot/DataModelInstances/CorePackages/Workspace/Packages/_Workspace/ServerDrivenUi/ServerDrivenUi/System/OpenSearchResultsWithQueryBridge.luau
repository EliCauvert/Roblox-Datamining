local NewResult = require(script:FindFirstAncestor("ServerDrivenUi").Parent.AppCommonLib).Signal.new()

return {
	run = function(p1, p2)
		-- upvalues: NewResult (copy)
		NewResult:fire(p1, p2)
	end,
	connect = function(p1)
		-- upvalues: NewResult (copy)
		return NewResult:connect(p1)
	end
}