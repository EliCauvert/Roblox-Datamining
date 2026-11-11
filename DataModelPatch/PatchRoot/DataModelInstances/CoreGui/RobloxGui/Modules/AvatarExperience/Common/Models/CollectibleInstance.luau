return {
	fromGetCollectibleItemInstances = function(p1)
		return {
			collectibleInstanceId = p1.collectibleInstanceId,
			collectibleItemId = p1.collectibleItemId,
			collectibleProductId = p1.collectibleProductId,
			serialNumber = p1.serialNumber,
			isHeld = p1.isHeld,
			saleState = p1.saleState,
			price = p1.price
		}
	end,
	fromGetCollectibleResellers = function(p1, CollectibleItemId)
		return {
			collectibleInstanceId = p1.collectibleItemInstanceId,
			collectibleItemId = CollectibleItemId,
			collectibleProductId = p1.collectibleProductId,
			serialNumber = p1.serialNumber,
			price = p1.price,
			seller = if p1.seller then {
				sellerId = p1.seller.sellerId,
				sellerType = p1.seller.sellerType,
				name = p1.seller.name,
				hasVerifiedBadge = p1.seller.hasVerifiedBadge
			} else nil
		}
	end
}