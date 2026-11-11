return {
	request = {
		body = "{\"rsvpStatus\":\"going\"}",
		method = "POST",
		cachePolicy = Enum.HttpCachePolicy.None,
		headers = {
			["content-type"] = "application/json",
			accept = "application/json"
		},
		url = {
			host = "apis.roblox.com",
			path = "/virtual-events/v1/virtual-events/badVirtualEvent/rsvps",
			scheme = "https",
			query = {}
		}
	},
	response = {
		body = "{\"errors\":[{\"message\":\"Virtual event not found.\",\"code\":\"VirtualEventNotFound\"}]}",
		isCached = false,
		type = "internal-response",
		headers = {
			["content-length"] = "81",
			["content-type"] = "application/json; charset=utf-8",
			["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}",
			["strict-transport-security"] = "max-age=3600",
			["x-envoy-upstream-service-time"] = "1",
			date = "Wed, 08 Feb 2023 22:42:54 GMT",
			nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}",
			server = "envoy"
		},
		stats = {
			retried = false,
			durations = {
				SSLHandshake = 0.015665000000000002,
				connect = 0.013330999999999999,
				inQueue = 9.652899996126507e-05,
				makeRequest = 5.9000000000000025e-05,
				nameLookup = 0.000229,
				receiveResponse = 0.11011699999999999,
				roundTripTime = 0.13948440500007564
			}
		},
		status = { code = 404, message = "Not Found" }
	}
}