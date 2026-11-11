return {
	request = {
		body = "{\"isEnabled\":true}",
		method = "POST",
		cachePolicy = Enum.HttpCachePolicy.None,
		headers = {
			["content-type"] = "application/json",
			accept = "application/json"
		},
		url = {
			host = "apis.roblox.com",
			path = "/virtual-events/v1/notifications/preferences",
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
			["x-envoy-upstream-service-time"] = "30",
			date = "Tue, 28 Feb 2023 00:52:28 GMT",
			server = "envoy"
		},
		stats = {
			retried = false,
			durations = {
				SSLHandshake = 0,
				connect = 1.7999999999999787e-05,
				inQueue = 7.93759999986321e-05,
				makeRequest = 0.00016599999999999991,
				nameLookup = 0.002935,
				receiveResponse = 0.282859,
				roundTripTime = 0.28607101800000123
			}
		},
		status = { code = 200, message = "OK" }
	}
}