local CreateOverflowMenuSignalStoreModule = require(script:FindFirstAncestor("AppBlox").OverflowMenu.createOverflowMenuSignalStore)
local v1 = nil

return function() --[[ Line: 8 | Named "getOverflowMenuSignalStore" ]]
	-- upvalues: v1 (ref), CreateOverflowMenuSignalStoreModule (copy)
	if v1 == nil then
		v1 = CreateOverflowMenuSignalStoreModule()
	end
	return v1
end