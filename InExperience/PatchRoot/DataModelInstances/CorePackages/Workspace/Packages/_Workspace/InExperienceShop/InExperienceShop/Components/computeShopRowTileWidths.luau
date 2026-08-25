return {
	SHOP_ITEM_MEDIA_HEIGHT_SCALE = 0.85,
	MEDIA_HEIGHT_SCALE_FALLBACK = 0.425,
	computeShopRowTileWidths = function(p0, p1, p2, p3)
		if p0 <= 0 or p2 <= 0 then
			return {
				shopWidth = 0,
				featuredRobuxWidth = if p3 then 0 else nil
			}
		end
		local var0 = (p0 - (p2 - 1) * p1) / p2
		
		return {
			shopWidth = var0,
			featuredRobuxWidth = if p3 then var0 * 2 + p1 else nil
		}
	end,
	computeRobuxPackageMediaHeightScale = function(p4, p5)
		if p4 <= 0 then
			return 0.425
		end
		local var1 = p4 * 2 + p5
		
		return if var1 <= 0 then 0.425 else p4 * 0.85 / var1
	end
}