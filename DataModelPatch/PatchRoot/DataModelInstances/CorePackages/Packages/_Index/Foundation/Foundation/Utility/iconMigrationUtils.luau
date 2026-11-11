local Uiblox = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons).Migration.uiblox
local IsBuilderIconModule = require(script.Parent.isBuilderIcon)

return {
	isMigrated = function(p1): boolean
		-- upvalues: Uiblox (copy)
		return Uiblox[p1] ~= nil
	end,
	isBuilderOrMigratedIcon = function(p1)
		-- upvalues: IsBuilderIconModule (copy), Uiblox (copy)
		return IsBuilderIconModule(p1) or Uiblox[p1] ~= nil
	end
}