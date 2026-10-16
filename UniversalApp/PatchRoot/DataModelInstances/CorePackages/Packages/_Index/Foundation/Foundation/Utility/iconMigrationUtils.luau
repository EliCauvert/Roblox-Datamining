local Uiblox = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons).Migration.uiblox
local IsBuilderIconModule = require(script.Parent.isBuilderIcon)

return {
	isMigrated = function(p1): boolean --[[ Line: 22 ]]
		-- upvalues: Uiblox (copy)
		return Uiblox[p1] ~= nil
	end,
	isBuilderOrMigratedIcon = function(p1) --[[ Line: 25 ]]
		-- upvalues: IsBuilderIconModule (copy), Uiblox (copy)
		return IsBuilderIconModule(p1) or Uiblox[p1] ~= nil
	end,
	normalizeIconName = function(Name) --[[ Line: 31 ]]
		-- upvalues: Uiblox (copy)
		if Uiblox[Name] ~= nil then
			local UibloxEntry = Uiblox[Name]
			
			return { name = UibloxEntry.name, variant = UibloxEntry.variant }
		else
			return { variant = nil, name = Name }
		end
	end
}