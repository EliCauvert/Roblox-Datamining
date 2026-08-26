local uiblox = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons).Migration.uiblox
local isBuilderIconModule = require(script.Parent.isBuilderIcon)

return {
	isMigrated = function(p1)
		-- upvalues: uiblox (ref)
		return uiblox[p1] ~= nil
	end,
	isBuilderOrMigratedIcon = function(p1)
		-- upvalues: isBuilderIconModule (ref), uiblox (ref)
		return isBuilderIconModule(p1) or uiblox[p1] ~= nil
	end,
	normalizeIconName = function(p1)
		-- upvalues: uiblox (ref)
		if uiblox[p1] ~= nil then
			local var1 = uiblox[p1]
			
			return { name = var1.name, variant = var1.variant }
		end
		return { variant = nil, name = p1 }
	end
}