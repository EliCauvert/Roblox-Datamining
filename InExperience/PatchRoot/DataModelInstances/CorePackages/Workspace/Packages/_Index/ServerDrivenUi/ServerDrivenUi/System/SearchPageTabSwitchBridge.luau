local NewResult = require(script:FindFirstAncestor("ServerDrivenUi").Parent.AppCommonLib).Signal.new()

return {
	switchTab = function(p1, p2) --[[ Line: 22 ]]
		-- upvalues: NewResult (copy)
		NewResult:fire(p1, p2)
	end,
	connect = function(p1) --[[ Line: 26 ]]
		-- upvalues: NewResult (copy)
		return NewResult:connect(p1)
	end
}