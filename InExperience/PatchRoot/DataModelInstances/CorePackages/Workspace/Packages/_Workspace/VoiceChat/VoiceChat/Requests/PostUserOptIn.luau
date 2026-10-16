local HttpService = game:GetService("HttpService")
local Url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url

return function(Callback, IsUserOptIn, IsOptedInThroughUpsell) --[[ Line: 15 ]]
	-- upvalues: Url (copy), HttpService (copy)
	assert(type(IsUserOptIn) == "boolean", "UserOptIn request expects isUserOptIn to be a boolean")
	local Formatted = string.format("%sv1/settings/user-opt-in/", Url.VOICE_URL)
	local Json = nil
	
	if IsOptedInThroughUpsell == nil then
		Json = HttpService:JSONEncode({ isUserOptIn = IsUserOptIn })
	else
		assert(type(IsOptedInThroughUpsell) == "boolean", "UserOptIn request expects isOptedInThroughUpsell to be a boolean")
		Json = HttpService:JSONEncode({
			isUserOptIn = IsUserOptIn,
			isOptedInThroughUpsell = IsOptedInThroughUpsell
		})
	end
	return Callback(Formatted, "POST", { postBody = Json })
end