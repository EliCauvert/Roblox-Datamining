local Url = require(script:FindFirstAncestor("GraphqlHttpArtifacts").Parent.Http).Url

return {
	request = {
		body = "{\"userIds\":[\"2705220939\",\"9999999\"],\"fields\":[\"names.combinedName\"]}",
		method = "POST",
		cachePolicy = Enum.HttpCachePolicy.None,
		headers = {
			["content-type"] = "application/json",
			accept = "application/json"
		},
		url = {
			path = "/user-profile-api/v1/user/profiles/get-profiles",
			scheme = "https",
			host = Url.stripHttpsAndTrailingSlash(Url.APIS_URL),
			query = {}
		}
	},
	response = {
		body = "{\"profileDetails\":[{\"userId\":9999999,\"names\": { \"combinedName\": \"CarleyRJep\" }},{\"userId\":2705220939,\"names\": { \"combinedName\": \"Julian\" }}]}",
		isCached = false,
		type = "internal-response",
		headers = {
			["content-length"] = "312",
			["content-type"] = "application/json; charset=utf-8",
			["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}",
			["strict-transport-security"] = "max-age=3600",
			["x-envoy-upstream-service-time"] = "123",
			date = "Tue, 6 Apr 2023 23:54:34 GMT",
			nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}",
			server = "envoy"
		},
		stats = {
			retried = false,
			durations = {
				SSLHandshake = 0.015057000000000001,
				connect = 0.007671,
				inQueue = 4.848499997933686e-05,
				makeRequest = 5.9000000000000025e-05,
				nameLookup = 0.004717,
				receiveResponse = 0.190536,
				roundTripTime = 0.21809353899993766
			}
		},
		status = { code = 200, message = "OK" }
	}
}