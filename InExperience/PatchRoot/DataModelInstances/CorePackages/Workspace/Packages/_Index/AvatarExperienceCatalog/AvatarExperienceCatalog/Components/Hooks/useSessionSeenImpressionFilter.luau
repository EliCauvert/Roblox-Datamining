local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local SeenImpressionsStore = require(Parent.AvatarExperienceAnalytics).Store.SeenImpressionsStore
local Category = SeenImpressionsStore.Category

return function(p1)
	-- upvalues: ReactModule (copy), SeenImpressionsStore (copy), Category (copy)
	return ReactModule.useCallback(function(Text): boolean
		-- upvalues: p1 (copy), SeenImpressionsStore (upval), Category (upval)
		local Text1 = "CatalogSort_" .. p1 .. "_" .. Text
		
		if SeenImpressionsStore.hasSeen(Category.WidgetItems, Text1) then
			return false
		else
			SeenImpressionsStore.markSeen(Category.WidgetItems, Text1)
			
			return true
		end
	end, { p1 })
end