return {
	mock = function()
		return { resalePercentageFee = 30, minimumFee = 1, priceFloor = 0 }
	end,
	fromGetCollectibleMarketplaceResaleParameters = function(p1, _)
		return {
			resalePercentageFee = p1.resalePercentageFee,
			minimumFee = p1.minimumFee,
			priceFloor = p1.priceFloor
		}
	end
}