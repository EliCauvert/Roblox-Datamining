local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local CollectionViewsModule = require(Parent.CollectionViews)
local DisplayModule = require(Parent.Display)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetPreferredTextSizeLineBudgetModule = require(SduiSharedUtilities.getPreferredTextSizeLineBudget)
local FIntLuaAppSduiCarouselPlaceholderHeaderHeightPx = SharedFlagsModule.FIntLuaAppSduiCarouselPlaceholderHeaderHeightPx
local FFlagSduiPreferredTextSizeLineBudgets = SharedFlagsModule.FFlagSduiPreferredTextSizeLineBudgets

return function(p1, p2, p3) --[[ Line: 30 | Named "buildSduiCollectionInfo" ]]
	-- upvalues: DisplayModule (copy), CollectionViewsModule (copy), FFlagSduiPreferredTextSizeLineBudgets (copy), Parent (copy), GetPreferredTextSizeLineBudgetModule (copy), FIntLuaAppSduiCarouselPlaceholderHeaderHeightPx (copy)
	local DisplayStore = DisplayModule.GetDisplayStore(false)
	local MainCollectionLayoutStore = CollectionViewsModule.getMainCollectionLayoutStore(false)
	local PlatformScale: number = DisplayStore.getPlatformScale(false)
	local PlatformScale1 = if PlatformScale and PlatformScale > 0 then PlatformScale else 1
	local NumItemsForAllCategories = MainCollectionLayoutStore.getNumItemsForAllCategories(false)
	local YRatio = (DisplayStore.getViewportSize(false).Y - DisplayStore.getTopBarHeight(false)) / PlatformScale1
	local NewDesignSpaceContainerWidth = MainCollectionLayoutStore.getDesignSpaceContainerWidth(false) / math.max(1, NumItemsForAllCategories[p1] or 1) * p2.Scale + p2.Offset
	
	if FFlagSduiPreferredTextSizeLineBudgets then
		local Largest = math.max(p3 or 0, 0)
		
		if Largest > 0 then
			NewDesignSpaceContainerWidth += GetPreferredTextSizeLineBudgetModule(require(Parent.TextSize).getTextSizeStore(false).getTextSizeOffset(false) or 0, Largest) / PlatformScale1
		end
	end
	local NewFIntLuaAppSduiCarouselPlaceholderHeaderHeightPx = FIntLuaAppSduiCarouselPlaceholderHeaderHeightPx + 12 + NewDesignSpaceContainerWidth + 16
	
	return {
		items_per_row = NumItemsForAllCategories,
		rows_above_fold = if NewFIntLuaAppSduiCarouselPlaceholderHeaderHeightPx > 0 then math.max(1, (math.floor(YRatio / NewFIntLuaAppSduiCarouselPlaceholderHeaderHeightPx))) + 1 else 1
	}
end