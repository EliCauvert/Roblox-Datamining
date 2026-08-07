return {
	new = function() --[[ line: 13 ]]
		return {}
	end,
	fromGetCollectibleItemInstances = function(a) --[[ line: 19 ]]
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