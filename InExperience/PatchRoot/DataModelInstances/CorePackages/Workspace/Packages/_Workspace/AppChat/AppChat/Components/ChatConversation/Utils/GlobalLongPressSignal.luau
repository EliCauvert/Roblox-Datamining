local var0 = require(script:FindFirstAncestor("AppChat").Parent.AppCommonLib).Signal.new()

return {
	dismissed = var0,
	dismiss = function()
		-- upvalues: var0 (ref)
		var0:fire()
	end
}