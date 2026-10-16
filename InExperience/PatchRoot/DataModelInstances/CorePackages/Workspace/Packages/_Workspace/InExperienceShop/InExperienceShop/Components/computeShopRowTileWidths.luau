return {
	SHOP_ITEM_MEDIA_HEIGHT_SCALE = 0.85,
	MEDIA_HEIGHT_SCALE_FALLBACK = 0.425,
	computeShopRowTileWidths = function(p1: number, p2, p3: number, p4) --[[ Line: 21 ]]
		if p1 <= 0 or p3 <= 0 then
			return {
				shopWidth = 0,
				featuredRobuxWidth = if p4 then 0 else nil
			}
		else
			local ShopWidth = (p1 - (p3 - 1) * p2) / p3
			
			return {
				shopWidth = ShopWidth,
				featuredRobuxWidth = if p4 then ShopWidth * 2 + p2 else nil
			}
		end
	end,
	computeRobuxPackageMediaHeightScale = function(p1: number, p2): number --[[ Line: 44 ]]
		if p1 <= 0 then
			return 0.425
		else
			local v1 = p1 * 2 + p2
			
			return if v1 <= 0 then 0.425 else p1 * 0.85 / v1
		end
	end
}