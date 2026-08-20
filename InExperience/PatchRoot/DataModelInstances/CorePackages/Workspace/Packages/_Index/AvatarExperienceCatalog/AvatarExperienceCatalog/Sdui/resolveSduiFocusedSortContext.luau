local logging = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AppCommonLib).Logging

return function(p0) --[[ line: 28 | named "resolveSduiFocusedSortContext" ]]
	-- upvalues: logging (ref)
	local selectedCategoryId = p0.selectedCategoryId
	
	if not selectedCategoryId then
		logging.warn("resolveSduiFocusedSortContext: nil selectedCategoryId at click time " .. "(sortId=" .. tostring(p0.sortId) .. ", route=" .. tostring(p0.routeName) .. "); SDUI See All handoff aborted before context lookup.")
		
		return nil
	end
	local contextForWidgetsById = p0.getContextForWidgetsById(p0.routeName, selectedCategoryId, p0.selectedSubcategoryId)
	
	if contextForWidgetsById then
		return contextForWidgetsById
	end
	logging.warn("resolveSduiFocusedSortContext: getContextForWidgetsById returned nil " .. "(sortId=" .. tostring(p0.sortId) .. ", route=" .. tostring(p0.routeName) .. ", categoryId=" .. tostring(selectedCategoryId) .. ", subcategoryId=" .. tostring(p0.selectedSubcategoryId) .. "); SDUI See All handoff aborted because the reader-aligned " .. "ContextWidgetInfo key could not be built.")
	
	return nil
end