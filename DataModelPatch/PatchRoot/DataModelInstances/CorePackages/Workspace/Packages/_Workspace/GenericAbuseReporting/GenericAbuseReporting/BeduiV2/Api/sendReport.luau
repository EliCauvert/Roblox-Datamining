local HttpService = game:GetService("HttpService")
local Url = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Http).Url

return function(Callback, Text, Input)
	-- upvalues: HttpService (copy), Url (copy)
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), Input (copy)
		return HttpService:JSONEncode(Input)
	end)
	
	if not Success then
		warn("Failed to encode v1 report body")
	end
	return Callback(Url.APIS_URL .. Text, "POST", { postBody = Result })
end