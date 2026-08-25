local var0 = require(script:FindFirstAncestor("ServerDrivenUi").Parent.AppCommonLib).Signal.new()

return {
	run = function(p0, p1)
		-- upvalues: var0 (ref)
		var0:fire(p0, p1)
	end,
	connect = function(p2)
		-- upvalues: var0 (ref)
		return var0:connect(p2)
	end
}