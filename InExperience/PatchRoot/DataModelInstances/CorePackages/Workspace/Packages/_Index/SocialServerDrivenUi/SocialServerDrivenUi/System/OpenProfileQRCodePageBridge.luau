local var1 = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.AppCommonLib).Signal.new()

return {
	requestOpen = function(p1)
		-- upvalues: var1 (ref)
		var1:fire(p1)
	end,
	subscribe = function(p1)
		-- upvalues: var1 (ref)
		return var1:connect(p1)
	end
}