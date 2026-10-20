return {
	request = {
		method = "GET",
		cachePolicy = Enum.HttpCachePolicy.None,
		headers = {},
		url = {
			host = "apis.roblox.com",
			path = "/access-management/v1/upsell-feature-access",
			scheme = "https",
			query = {
				featureName = "ComponentTestPhoneVerified",
				successfulActions = "GovernmentId"
			}
		}
	},
	response = {
		body = "{\"featureName\":\"ComponentTestPhoneVerified\",\"access\":\"Granted\",\"recourse\":null,\"shouldPrompt\":true}",
		isCached = false,
		type = "internal-response",
		headers = {
			["content-length"] = "99",
			["content-type"] = "application/json; charset=utf-8",
			["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}",
			["strict-transport-security"] = "max-age=3600",
			["x-envoy-upstream-service-time"] = "20",
			["x-roblox-edge"] = "sea1",
			["x-roblox-region"] = "us-central",
			date = "Tue, 13 Jun 2023 21:27:33 GMT",
			nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}",
			server = "envoy"
		},
		stats = {
			retried = false,
			durations = {
				SSLHandshake = 0,
				connect = 0,
				inQueue = 3.574998117983341e-05,
				makeRequest = 0.00010099999999999999,
				nameLookup = 0.000045,
				receiveResponse = 0.10487,
				roundTripTime = 0.10509170801378787
			}
		},
		status = { code = 200, message = "OK" }
	}
}