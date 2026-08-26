local var1 = require(script:FindFirstAncestor("ServerDrivenUi").Parent.AppCommonLib).Signal.new()

return {
	switchTab = function(p1, p2)
		-- upvalues: var1 (ref)
		var1:fire(p1, p2)
	end,
	connect = function(p1)
		-- upvalues: var1 (ref)
		return var1:connect(p1)
	end
}