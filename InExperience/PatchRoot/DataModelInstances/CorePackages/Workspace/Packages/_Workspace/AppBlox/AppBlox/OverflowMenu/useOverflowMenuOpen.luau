local appBlox = script:FindFirstAncestor("AppBlox")
local useSignalState = require(appBlox.Parent.SignalsReact).useSignalState
local getOverflowMenuSignalStoreModule = require(appBlox.OverflowMenu.getOverflowMenuSignalStore)

return function(p1)
	-- upvalues: getOverflowMenuSignalStoreModule (ref), useSignalState (ref)
	return useSignalState(getOverflowMenuSignalStoreModule().getActiveMenuKey) == p1
end