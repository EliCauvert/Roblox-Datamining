local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local collectionViewsModule = require(parent.CollectionViews)
local displayModule = require(parent.Display)
local fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx = require(parent.SharedFlags).FIntLuaAppSduiCarouselPlaceholderHeaderHeightPx

return function(p0, p1) --[[ line: 26 | named "buildSduiCollectionInfo" ]]
	-- upvalues: displayModule (ref), collectionViewsModule (ref), fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx (ref)
	local displayStore = displayModule.GetDisplayStore(false)
	local mainCollectionLayoutStore = collectionViewsModule.getMainCollectionLayoutStore(false)
	local viewportSize = displayStore.getViewportSize(false)
	local topBarHeight = displayStore.getTopBarHeight(false)
	local platformScale = displayStore.getPlatformScale(false)
	local var7 = if platformScale and platformScale > 0 then platformScale else 1
	local numItemsForAllCategories = mainCollectionLayoutStore.getNumItemsForAllCategories(false)
	local var9 = fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx + 12 + (mainCollectionLayoutStore.getDesignSpaceContainerWidth(false) / math.max(1, numItemsForAllCategories[p0] or 1) * p1.Scale + p1.Offset) + 16
	
	return {
		items_per_row = numItemsForAllCategories,
		rows_above_fold = if var9 > 0 then math.max(1, math.floor((viewportSize.Y - topBarHeight) / var7 / var9)) + 1 else 1
	}
end