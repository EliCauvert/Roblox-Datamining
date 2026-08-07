local appBlox = script:FindFirstAncestor("AppBlox")
local useSignalState = require(appBlox.Parent.SignalsReact).useSignalState
local getOverflowMenuSignalStoreModule = require(appBlox.OverflowMenu.getOverflowMenuSignalStore)

return function(p0) --[[ line: 9 | named "useOverflowMenuOpen" ]]
	-- upvalues: getOverflowMenuSignalStoreModule (ref), useSignalState (ref)
	return useSignalState(getOverflowMenuSignalStoreModule().getActiveMenuKey) == p0
end