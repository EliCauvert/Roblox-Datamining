local httpService = game:GetService("HttpService")

return {
	isUniverseAllowed = function(p1, p2)
		local var1 = tostring(p2)
		
		for i in string.gmatch(p1, "[^,]+") do
			if string.match(i, "^%s*(.-)%s*$") == var1 then
				return true
			end
		end
		return false
	end,
	parseLaunchData = function(p3)
		-- upvalues: httpService (ref)
		if type(p3) ~= "string" or p3 == "" then
			return nil
		end
		local ok, status = pcall(httpService.JSONDecode, httpService, p3)
		
		if not ok or type(status) ~= "table" then
			return nil
		end
		local challengeId = status.challengeId
		local var2 = tonumber(status.desiredPlaceId)
		
		return if not (type(challengeId) ~= "string" or challengeId == "") then if var2 and var2 > 0 and var2 % 1 == 0 then { challengeId = challengeId, desiredPlaceId = var2 } else nil else nil
	end
}