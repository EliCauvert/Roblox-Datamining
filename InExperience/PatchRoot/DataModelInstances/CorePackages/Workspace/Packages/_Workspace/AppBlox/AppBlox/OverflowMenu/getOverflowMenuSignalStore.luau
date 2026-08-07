local createOverflowMenuSignalStoreModule = require(script:FindFirstAncestor("AppBlox").OverflowMenu.createOverflowMenuSignalStore)
local var1 = nil

return function() --[[ line: 8 | named "getOverflowMenuSignalStore" ]]
	-- upvalues: var1 (write), createOverflowMenuSignalStoreModule (ref)
	if var1 == nil then
		var1 = createOverflowMenuSignalStoreModule()
	end
	return var1
end