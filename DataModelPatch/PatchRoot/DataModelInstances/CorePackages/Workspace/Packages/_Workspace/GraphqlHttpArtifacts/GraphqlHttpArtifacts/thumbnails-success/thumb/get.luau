return {
	request = {
		method = "GET",
		cachePolicy = Enum.HttpCachePolicy.None,
		headers = {},
		url = {
			host = "thumbnails.roblox.com",
			path = "/v1/games/icons",
			scheme = "https",
			query = {
				format = "png",
				size = "150x150",
				universeIds = "65241,111958650,1954906532"
			}
		}
	},
	response = {
		body = "{\"data\":[{\"targetId\":65241,\"state\":\"Completed\",\"imageUrl\":\"https://tr.rbxcdn.com/0ae67ae1039583a9750be9a14886c471/150/150/Image/Png\"},{\"targetId\":111958650,\"state\":\"Completed\",\"imageUrl\":\"https://tr.rbxcdn.com/bd1ac92078ae55b147823d2af2a32695/150/150/Image/Png\"},{\"targetId\":1954906532,\"state\":\"Completed\",\"imageUrl\":\"https://tr.rbxcdn.com/f3917b110ed74a7b58f0dc1338470441/150/150/Image/Png\"}]}",
		isCached = false,
		type = "internal-response",
		headers = {
			["cache-control"] = "no-cache",
			["content-length"] = "394",
			["content-type"] = "application/json; charset=utf-8",
			["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}",
			["roblox-machine-id"] = "CHI1-WEB7011",
			["x-frame-options"] = "SAMEORIGIN",
			["x-powered-by"] = "ASP.NET",
			date = "Tue, 14 Feb 2023 18:16:44 GMT",
			nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}",
			p3p = "CP=\"CAO DSP COR CURa ADMa DEVa OUR IND PHY ONL UNI COM NAV INT DEM PRE\"",
			server = "Microsoft-IIS/8.5"
		},
		stats = {
			retried = false,
			durations = {
				SSLHandshake = 0,
				connect = 0,
				inQueue = 1.6381000001786106e-05,
				makeRequest = 6.300000000000012e-05,
				nameLookup = 0.001759,
				receiveResponse = 0.079814,
				roundTripTime = 0.08170131700000383
			}
		},
		status = { code = 200, message = "OK" }
	}
}