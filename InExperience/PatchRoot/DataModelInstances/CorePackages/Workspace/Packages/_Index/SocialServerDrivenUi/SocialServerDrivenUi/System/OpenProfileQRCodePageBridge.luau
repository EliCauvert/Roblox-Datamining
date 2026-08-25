local var0 = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.AppCommonLib).Signal.new()

return {
	requestOpen = function(p0)
		-- upvalues: var0 (ref)
		var0:fire(p0)
	end,
	subscribe = function(p1)
		-- upvalues: var0 (ref)
		return var0:connect(p1)
	end
}