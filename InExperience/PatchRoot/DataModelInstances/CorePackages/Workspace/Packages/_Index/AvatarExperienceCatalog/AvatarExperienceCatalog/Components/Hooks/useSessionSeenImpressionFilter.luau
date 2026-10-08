local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local seenImpressionsStore = require(parent.AvatarExperienceAnalytics).Store.SeenImpressionsStore
local category = seenImpressionsStore.Category

return function(p1)
	-- upvalues: reactModule (ref), seenImpressionsStore (ref), category (ref)
	return reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), seenImpressionsStore (copy), category (copy)
		local text = "CatalogSort_" .. p0 .. "_" .. p1
		
		if seenImpressionsStore.hasSeen(category.WidgetItems, text) then
			return false
		end
		seenImpressionsStore.markSeen(category.WidgetItems, text)
		
		return true
	end, { p1 })
end