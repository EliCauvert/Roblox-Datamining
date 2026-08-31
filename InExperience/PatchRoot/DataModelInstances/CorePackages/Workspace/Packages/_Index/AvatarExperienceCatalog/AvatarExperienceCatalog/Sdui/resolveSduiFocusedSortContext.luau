local logging = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AppCommonLib).Logging

return function(p1)
	-- upvalues: logging (ref)
	local selectedCategoryId = p1.selectedCategoryId
	
	if not selectedCategoryId then
		logging.warn("resolveSduiFocusedSortContext: nil selectedCategoryId at click time " .. "(sortId=" .. tostring(p1.sortId) .. ", route=" .. tostring(p1.routeName) .. "); SDUI See All handoff aborted before context lookup.")
		
		return nil
	end
	local contextForWidgetsById = p1.getContextForWidgetsById(p1.routeName, selectedCategoryId, p1.selectedSubcategoryId)
	
	if contextForWidgetsById then
		return contextForWidgetsById
	end
	logging.warn("resolveSduiFocusedSortContext: getContextForWidgetsById returned nil " .. "(sortId=" .. tostring(p1.sortId) .. ", route=" .. tostring(p1.routeName) .. ", categoryId=" .. tostring(selectedCategoryId) .. ", subcategoryId=" .. tostring(p1.selectedSubcategoryId) .. "); SDUI See All handoff aborted because the reader-aligned " .. "ContextWidgetInfo key could not be built.")
	
	return nil
end