local var1 = require(script:FindFirstAncestor("AppChat").Parent.AppCommonLib).Signal.new()

return {
	dismissed = var1,
	dismiss = function()
		-- upvalues: var1 (ref)
		var1:fire()
	end
}