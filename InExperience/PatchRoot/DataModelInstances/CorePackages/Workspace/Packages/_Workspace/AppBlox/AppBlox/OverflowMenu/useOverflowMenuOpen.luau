local AppBlox = script:FindFirstAncestor("AppBlox")
local UseSignalStateFunction = require(AppBlox.Parent.SignalsReact).useSignalState
local GetOverflowMenuSignalStoreModule = require(AppBlox.OverflowMenu.getOverflowMenuSignalStore)

return function(p1): boolean --[[ Line: 9 | Named "useOverflowMenuOpen" ]]
	-- upvalues: GetOverflowMenuSignalStoreModule (copy), UseSignalStateFunction (copy)
	return UseSignalStateFunction(GetOverflowMenuSignalStoreModule().getActiveMenuKey) == p1
end