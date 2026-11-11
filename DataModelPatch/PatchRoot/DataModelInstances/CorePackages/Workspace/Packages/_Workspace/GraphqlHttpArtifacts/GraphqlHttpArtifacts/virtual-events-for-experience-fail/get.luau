return {
	request = {
		method = "GET",
		cachePolicy = Enum.HttpCachePolicy.None,
		headers = {},
		url = {
			host = "apis.roblox.com",
			path = "/virtual-events/v1/universes/-1/virtual-events",
			scheme = "https",
			query = { limit = "25" }
		}
	},
	response = {
		body = "",
		isCached = false,
		type = "internal-response",
		headers = {
			["content-length"] = "0",
			["strict-transport-security"] = "max-age=3600",
			["x-envoy-upstream-service-time"] = "19",
			date = "Fri, 03 Feb 2023 19:20:21 GMT",
			server = "envoy"
		},
		stats = {
			retried = false,
			durations = {
				SSLHandshake = 0.05134000000000001,
				connect = 0.023109,
				inQueue = 9.806900015973952e-05,
				makeRequest = 5.7999999999988616e-05,
				nameLookup = 0.002309,
				receiveResponse = 0.09068200000000001,
				roundTripTime = 0.167601255000136
			}
		},
		status = { code = 500, message = "Internal Server Error" }
	}
}