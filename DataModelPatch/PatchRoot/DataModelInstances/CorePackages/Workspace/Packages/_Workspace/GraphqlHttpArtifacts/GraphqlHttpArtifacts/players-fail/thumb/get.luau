return {
	request = {
		method = "GET",
		cachePolicy = Enum.HttpCachePolicy.None,
		headers = {},
		url = {
			host = "thumbnails.roblox.com",
			path = "/v1/users/avatar-headshot",
			scheme = "https",
			query = {
				format = "Png",
				isCircular = "true",
				size = "48x48",
				userIds = "notAUser"
			}
		}
	},
	response = {
		body = "{\"errors\":[{\"code\":4,\"message\":\"The requested Ids are invalid, of an invalid type or missing.\",\"userFacingMessage\":\"Something went wrong\"}]}",
		isCached = false,
		type = "internal-response",
		headers = {
			["cache-control"] = "no-cache",
			["content-length"] = "140",
			["content-type"] = "application/json",
			["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}",
			["roblox-machine-id"] = "CHI2-WEB2417",
			["x-frame-options"] = "SAMEORIGIN",
			["x-powered-by"] = "ASP.NET",
			date = "Thu, 01 Dec 2022 18:51:43 GMT",
			nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}",
			p3p = "CP=\"CAO DSP COR CURa ADMa DEVa OUR IND PHY ONL UNI COM NAV INT DEM PRE\"",
			server = "Microsoft-IIS/8.5"
		},
		stats = {
			retried = false,
			durations = {
				SSLHandshake = 0,
				connect = 0,
				inQueue = 3.957300000001496e-05,
				makeRequest = 0.000041,
				nameLookup = 0.000045,
				receiveResponse = 0.138814,
				roundTripTime = 0.1389526790000004
			}
		},
		status = { code = 400, message = "Bad Request" }
	}
}