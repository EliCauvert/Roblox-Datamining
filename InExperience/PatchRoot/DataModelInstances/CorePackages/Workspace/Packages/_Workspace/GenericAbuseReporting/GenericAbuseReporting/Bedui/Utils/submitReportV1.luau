local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Http).Url

return function(p1, p2)
	-- upvalues: httpService (ref), url (ref)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p2 (ref)
		return httpService:JSONEncode(p2)
	end)
	
	if not ok then
		warn("Failed to encode v1 report body")
	end
	return p1(url.APIS_URL .. "abuse-reporting/v1/abuse-report", "POST", { postBody = status })
end