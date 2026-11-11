return {
	request = {
		body = "{\"linkType\":\"ExperienceDetails\",\"data\":\"{\\\"universeId\\\":\\\"994732206\\\"}\"}",
		method = "POST",
		cachePolicy = Enum.HttpCachePolicy.None,
		headers = {
			["content-type"] = "application/json",
			accept = "application/json"
		},
		url = {
			host = "apis.roblox.com",
			path = "/sharelinks/v1/get-or-create-link",
			scheme = "https",
			query = {}
		}
	},
	response = {
		body = "{\"code\":\"17623523\",\"shortUrl\":\"https://roblox.com/share?code=17623523&type=ExperienceDetails\"}",
		isCached = false,
		type = "internal-response",
		headers = {
			["content-length"] = "0",
			["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}",
			["strict-transport-security"] = "max-age=3600",
			["x-roblox-edge"] = "lax2",
			["x-roblox-region"] = "us-central",
			date = "Thu, 14 Dec 2023 19:29:35 GMT",
			nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}",
			server = "Kestrel"
		},
		stats = {
			retried = false,
			durations = {
				SSLHandshake = 0,
				connect = -0.000044,
				inQueue = 2.2875000000865953e-05,
				makeRequest = 0.000167,
				nameLookup = 0.000044,
				receiveResponse = 0.069409,
				roundTripTime = 0.06984316700000015
			}
		},
		status = { code = 200, message = "OK" }
	}
}