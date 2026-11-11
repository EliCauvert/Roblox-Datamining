return {
	request = {
		method = "POST",
		cachePolicy = Enum.HttpCachePolicy.None,
		headers = {},
		url = {
			host = "apis.roblox.com",
			path = "/virtual-events/v1/notifications/modal-history",
			scheme = "https",
			query = {}
		}
	},
	response = {
		body = "{}",
		isCached = false,
		type = "internal-response",
		headers = {
			["content-length"] = "2",
			["content-type"] = "application/json; charset=utf-8",
			["strict-transport-security"] = "max-age=3600",
			["x-envoy-upstream-service-time"] = "54",
			date = "Fri, 24 Feb 2023 19:18:54 GMT",
			server = "envoy"
		},
		stats = {
			retried = false,
			durations = {
				SSLHandshake = 0.019820000000000004,
				connect = 0.0745,
				inQueue = 0.00013130499996805156,
				makeRequest = 5.4999999999999494e-05,
				nameLookup = 0.050218,
				receiveResponse = 0.083427,
				roundTripTime = 0.22815782899999704
			}
		},
		status = { code = 200, message = "OK" }
	}
}