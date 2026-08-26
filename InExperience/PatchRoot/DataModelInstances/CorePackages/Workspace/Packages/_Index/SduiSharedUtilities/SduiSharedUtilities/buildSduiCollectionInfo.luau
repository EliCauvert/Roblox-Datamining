local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local collectionViewsModule = require(parent.CollectionViews)
local displayModule = require(parent.Display)
local fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx = require(parent.SharedFlags).FIntLuaAppSduiCarouselPlaceholderHeaderHeightPx

return function(p1, p2)
	-- upvalues: displayModule (ref), collectionViewsModule (ref), fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx (ref)
	local displayStore = displayModule.GetDisplayStore(false)
	local mainCollectionLayoutStore = collectionViewsModule.getMainCollectionLayoutStore(false)
	local viewportSize = displayStore.getViewportSize(false)
	local topBarHeight = displayStore.getTopBarHeight(false)
	local platformScale = displayStore.getPlatformScale(false)
	local var1 = if platformScale and platformScale > 0 then platformScale else 1
	local numItemsForAllCategories = mainCollectionLayoutStore.getNumItemsForAllCategories(false)
	local var2 = fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx + 12 + (mainCollectionLayoutStore.getDesignSpaceContainerWidth(false) / math.max(1, numItemsForAllCategories[p1] or 1) * p2.Scale + p2.Offset) + 16
	
	return {
		items_per_row = numItemsForAllCategories,
		rows_above_fold = if var2 > 0 then math.max(1, math.floor((viewportSize.Y - topBarHeight) / var1 / var2)) + 1 else 1
	}
end