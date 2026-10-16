local Logging = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AppCommonLib).Logging

return function(p1) --[[ Line: 28 | Named "resolveSduiFocusedSortContext" ]]
	-- upvalues: Logging (copy)
	local SelectedCategoryId = p1.selectedCategoryId
	
	if not SelectedCategoryId then
		Logging.warn("resolveSduiFocusedSortContext: nil selectedCategoryId at click time " .. "(sortId=" .. tostring(p1.sortId) .. ", route=" .. tostring(p1.routeName) .. "); SDUI See All handoff aborted before context lookup.")
		
		return nil
	end
	local ContextForWidgetsById = p1.getContextForWidgetsById(p1.routeName, SelectedCategoryId, p1.selectedSubcategoryId)
	
	if ContextForWidgetsById then
		return ContextForWidgetsById
	else
		Logging.warn("resolveSduiFocusedSortContext: getContextForWidgetsById returned nil " .. "(sortId=" .. tostring(p1.sortId) .. ", route=" .. tostring(p1.routeName) .. ", categoryId=" .. tostring(SelectedCategoryId) .. ", subcategoryId=" .. tostring(p1.selectedSubcategoryId) .. "); SDUI See All handoff aborted because the reader-aligned " .. "ContextWidgetInfo key could not be built.")
		
		return nil
	end
end