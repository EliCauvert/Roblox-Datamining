return {
	request = {
		method = "GET",
		cachePolicy = Enum.HttpCachePolicy.None,
		headers = {},
		url = {
			host = "friends.roblox.com",
			path = "/v1/users/1942512143/friends/online",
			scheme = "https",
			query = { userSort = "1" }
		}
	},
	response = {
		body = "{\"data\":[{\"userPresence\":{\"UserPresenceType\":\"Online\",\"UserLocationType\":\"Page\",\"lastLocation\":\"Website\",\"placeId\":null,\"rootPlaceId\":null,\"gameInstanceId\":null,\"universeId\":null,\"lastOnline\":\"2023-11-27T22:09:22.327Z\"},\"id\":3931497001,\"name\":\"mrmahdibot\",\"displayName\":\"Sub2AlzzieMad\"},{\"userPresence\":{\"UserPresenceType\":\"InGame\",\"UserLocationType\":\"Game\",\"lastLocation\":\"[❄️UPD] Blade Ball\",\"placeId\":13772394625,\"rootPlaceId\":13772394625,\"gameInstanceId\":\"aa012ae8-6b08-4c23-bc18-ee32b79b686b\",\"universeId\":4777817887,\"lastOnline\":\"2023-11-27T22:09:14.833Z\"},\"id\":1184287654,\"name\":\"TheSavionCruz\",\"displayName\":\"TheSavionCruz\"},{\"userPresence\":{\"UserPresenceType\":\"Online\",\"UserLocationType\":\"Page\",\"lastLocation\":\"Website\",\"placeId\":null,\"rootPlaceId\":null,\"gameInstanceId\":null,\"universeId\":null,\"lastOnline\":\"2023-11-27T22:09:31.38Z\"},\"id\":4770149502,\"name\":\"exotic_y2k1\",\"displayName\":\"C0LDFEEL1NGS\"}]}",
		isCached = false,
		type = "internal-response",
		headers = {
			["cache-control"] = "no-cache",
			["content-length"] = "915",
			["content-type"] = "application/json; charset=utf-8",
			["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}",
			["roblox-machine-id"] = "a1e9c5255831",
			["strict-transport-security"] = "max-age=3600",
			["x-frame-options"] = "SAMEORIGIN",
			["x-roblox-edge"] = "lax2",
			["x-roblox-region"] = "us-central",
			date = "Mon, 27 Nov 2023 22:10:52 GMT",
			nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}",
			server = "Kestrel"
		},
		stats = {
			retried = false,
			durations = {
				SSLHandshake = 0.027378000000000006,
				connect = 0.026396999999999997,
				inQueue = 0.10806258333332153,
				makeRequest = 5.8999999999989616e-05,
				nameLookup = 0.024895,
				receiveResponse = 0.18103000000000002,
				roundTripTime = 0.26040999999986525
			}
		},
		status = { code = 200, message = "OK" }
	}
}