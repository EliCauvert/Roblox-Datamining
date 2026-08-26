return {
	SHOP_ITEM_MEDIA_HEIGHT_SCALE = 0.85,
	MEDIA_HEIGHT_SCALE_FALLBACK = 0.425,
	computeShopRowTileWidths = function(p1, p2, p3, p4)
		if p1 <= 0 or p3 <= 0 then
			return {
				shopWidth = 0,
				featuredRobuxWidth = if p4 then 0 else nil
			}
		end
		local var1 = (p1 - (p3 - 1) * p2) / p3
		
		return {
			shopWidth = var1,
			featuredRobuxWidth = if p4 then var1 * 2 + p2 else nil
		}
	end,
	computeRobuxPackageMediaHeightScale = function(p1, p2)
		if p1 <= 0 then
			return 0.425
		end
		local var1 = p1 * 2 + p2
		
		return if var1 <= 0 then 0.425 else p1 * 0.85 / var1
	end
}