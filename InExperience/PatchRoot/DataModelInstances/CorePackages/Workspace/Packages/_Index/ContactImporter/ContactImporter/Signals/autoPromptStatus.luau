local var1 = nil
local var2 = require(script:FindFirstAncestor("ContactImporter").Parent.AppCommonLib).Signal.new()

return {
	getStatus = function()
		-- upvalues: var1 (write)
		return var1
	end,
	setStatus = function(value)
		-- upvalues: var1 (write), var2 (ref)
		var1 = value
		var2:fire(value)
	end,
	statusChanged = var2
}