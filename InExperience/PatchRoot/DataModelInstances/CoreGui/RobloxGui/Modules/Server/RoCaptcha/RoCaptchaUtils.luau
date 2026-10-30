local HttpService = game:GetService("HttpService")
local FFlagRoCaptchaReturnToServerInstanceModule = require(script.Parent.Parent.Parent.Common.Flags.FFlagRoCaptchaReturnToServerInstance)

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
		-- upvalues: HttpService (copy), FFlagRoCaptchaReturnToServerInstanceModule (copy)
		if type(p2) ~= "string" or p2 == "" then
			return nil
		end
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, p2)
		
		if not Success or type(Result) ~= "table" then
			return nil
		end
		local ChallengeId = Result.challengeId
		local Number: number? = tonumber(Result.desiredPlaceId)
		
		if type(ChallengeId) ~= "string" or ChallengeId == "" then
			return nil
		end
		if not Number or Number <= 0 or Number % 1 ~= 0 then
			return nil
		end
		local Text = nil
		
		if FFlagRoCaptchaReturnToServerInstanceModule then
			Text = Result.serverInstanceId
			
			if type(Text) ~= "string" or not string.match(Text, "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
				Text = nil
			end
		end
		return {
			challengeId = ChallengeId,
			desiredPlaceId = Number,
			serverInstanceId = Text
		}
	end
}