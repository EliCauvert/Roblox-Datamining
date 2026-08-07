local var0 = nil
local var1 = require(script:FindFirstAncestor("ContactImporter").Parent.AppCommonLib).Signal.new()

return {
	getStatus = function() --[[ line: 14 ]]
		-- upvalues: var0 (write)
		return var0
	end,
	setStatus = function(value) --[[ line: 9 ]]
		-- upvalues: var0 (write), var1 (ref)
		var0 = value
		var1:fire(value)
	end,
	statusChanged = var1
}