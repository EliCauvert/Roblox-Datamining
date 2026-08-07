local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Http).Url

return function(p0, p1) --[[ line: 10 ]]
	-- upvalues: httpService (ref), url (ref)
	local ok, status = pcall(function() --[[ line: 11 ]]
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONEncode(p1)
	end)
	
	if not ok then
		warn("Failed to encode v1 report body")
	end
	return p0(url.APIS_URL .. "abuse-reporting/v1/abuse-report", "POST", { postBody = status })
end