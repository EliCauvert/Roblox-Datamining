local uiblox = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons).Migration.uiblox
local isBuilderIconModule = require(script.Parent.isBuilderIcon)

return {
	isMigrated = function(p0) --[[ line: 10 ]]
		-- upvalues: uiblox (ref)
		return uiblox[p0] ~= nil
	end,
	isBuilderOrMigratedIcon = function(p1) --[[ line: 13 ]]
		-- upvalues: isBuilderIconModule (ref), uiblox (ref)
		return isBuilderIconModule(p1) or uiblox[p1] ~= nil
	end
}