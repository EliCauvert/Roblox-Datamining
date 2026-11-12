local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local HttpService = game:GetService("HttpService")
local Base64 = require(GenericChallenges.Parent.AuthCommon).Utils.Base64
local _ = require(GenericChallenges.Types.ChallengeMetadata)

return function(p1)
	-- upvalues: HttpService (copy), Base64 (copy)
	if p1 == nil or p1 == "" then
		return nil
	else
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), Base64 (upval), p1 (copy)
			return HttpService:JSONDecode(Base64.Decode(p1))
		end)
		
		return if Success and typeof(Result) == "table" then Result else nil
	end
end