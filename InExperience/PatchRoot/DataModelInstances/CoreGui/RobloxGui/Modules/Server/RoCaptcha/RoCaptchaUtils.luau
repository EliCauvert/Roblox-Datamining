local HttpService = game:GetService("HttpService")

return {
	isUniverseAllowed = function(Text: string, p1): boolean
		local Text1 = tostring(p1)
		
		for i in string.gmatch(Text, "[^,]+") do
			if string.match(i, "^%s*(.-)%s*$") == Text1 then
				return true
			end
		end
		return false
	end,
	parseLaunchData = function(p2)
		-- upvalues: HttpService (copy)
		if type(p2) ~= "string" or p2 == "" then
			return nil
		end
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, p2)
		
		if Success and type(Result) == "table" then
			local ChallengeId = Result.challengeId
			local Number: number? = tonumber(Result.desiredPlaceId)
			
			return if type(ChallengeId) == "string" and ChallengeId ~= "" and (Number and Number > 0 and Number % 1 == 0) then { challengeId = ChallengeId, desiredPlaceId = Number } else nil
		else
			return nil
		end
	end
}