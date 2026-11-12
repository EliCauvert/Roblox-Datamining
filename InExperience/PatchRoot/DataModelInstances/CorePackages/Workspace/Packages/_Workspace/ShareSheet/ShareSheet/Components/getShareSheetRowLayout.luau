local Parent = script:FindFirstAncestor("ShareSheet").Parent
local _ = require(Parent.AppComposition)
local CollectionViewsModule = require(Parent.CollectionViews)

return function(p1, p2, DisplaySize, p3)
	-- upvalues: CollectionViewsModule (copy)
	local Margin: number = p2.margin
	local Gutter = p2.gutter
	local CarouselPeek = if DisplaySize == Enum.DisplaySize.Small then p2.carouselPeek else 0
	local NumColumns = CollectionViewsModule.calculateNumColumns(p3, Gutter, 1, 1e999, p1 - 2 * Margin - CarouselPeek)
	local ItemWidth: number = CollectionViewsModule.calculateItemWidth(NumColumns, Gutter, Margin, p1, 0, CarouselPeek)
	local Floored = math.floor(ItemWidth)
	local Rounded = math.round((ItemWidth - Floored) * NumColumns)
	
	return {
		margin = Margin,
		gap = Gutter,
		visibleTileCount = NumColumns + (if CarouselPeek > 0 then 1 else 0),
		maxTileCount = if CarouselPeek > 0 then 1e999 else NumColumns,
		getTileWidth = function(p4): number
			-- upvalues: Rounded (copy), Floored (copy)
			return if p4 <= Rounded then Floored + 1 else Floored
		end,
		isScrollingEnabled = function(p4): boolean
			-- upvalues: NumColumns (copy)
			return NumColumns < p4
		end
	}
end