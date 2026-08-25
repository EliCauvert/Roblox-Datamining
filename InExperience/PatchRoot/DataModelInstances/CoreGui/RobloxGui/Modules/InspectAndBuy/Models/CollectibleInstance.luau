return {
	new = function()
		return {}
	end,
	fromGetCollectibleItemInstances = function(a)
		return {
			collectibleInstanceId = a.collectibleInstanceId,
			collectibleItemId = a.collectibleItemId,
			collectibleProductId = a.collectibleProductId,
			serialNumber = a.serialNumber,
			instanceState = a.instanceState,
			saleState = a.saleState,
			price = a.price
		}
	end
}