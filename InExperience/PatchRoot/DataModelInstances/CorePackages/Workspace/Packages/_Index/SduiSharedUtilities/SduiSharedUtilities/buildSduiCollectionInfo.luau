local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local collectionViewsModule = require(parent.CollectionViews)
local displayModule = require(parent.Display)
local sharedFlagsModule = require(parent.SharedFlags)
local getPreferredTextSizeLineBudgetModule = require(sduiSharedUtilities.getPreferredTextSizeLineBudget)
local fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx = sharedFlagsModule.FIntLuaAppSduiCarouselPlaceholderHeaderHeightPx
local fFlagSduiPreferredTextSizeLineBudgets = sharedFlagsModule.FFlagSduiPreferredTextSizeLineBudgets

return function(p1, p2, p3)
	-- upvalues: displayModule (ref), collectionViewsModule (ref), fFlagSduiPreferredTextSizeLineBudgets (ref), parent (ref), getPreferredTextSizeLineBudgetModule (ref), fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx (ref)
	local displayStore = displayModule.GetDisplayStore(false)
	local mainCollectionLayoutStore = collectionViewsModule.getMainCollectionLayoutStore(false)
	local viewportSize = displayStore.getViewportSize(false)
	local topBarHeight = displayStore.getTopBarHeight(false)
	local platformScale = displayStore.getPlatformScale(false)
	local var1 = if platformScale and platformScale > 0 then platformScale else 1
	local designSpaceContainerWidth = mainCollectionLayoutStore.getDesignSpaceContainerWidth(false)
	local numItemsForAllCategories = mainCollectionLayoutStore.getNumItemsForAllCategories(false)
	local var2 = (viewportSize.Y - topBarHeight) / var1
	local var3 = designSpaceContainerWidth / math.max(1, numItemsForAllCategories[p1] or 1) * p2.Scale + p2.Offset
	
	if fFlagSduiPreferredTextSizeLineBudgets then
		local maxValue = math.max(p3 or 0, 0)
		
		if maxValue > 0 then
			var3 += getPreferredTextSizeLineBudgetModule(require(parent.TextSize).getTextSizeStore(false).getTextSizeOffset(false) or 0, maxValue) / var1
		end
	end
	local var4 = fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx + 12 + var3 + 16
	
	return {
		items_per_row = numItemsForAllCategories,
		rows_above_fold = if var4 > 0 then math.max(1, math.floor(var2 / var4)) + 1 else 1
	}
end