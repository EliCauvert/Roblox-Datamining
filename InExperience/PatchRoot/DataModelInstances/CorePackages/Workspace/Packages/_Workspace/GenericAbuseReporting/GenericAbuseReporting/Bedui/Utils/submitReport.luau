local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local httpService = game:GetService("HttpService")
local url = require(parent.Http).Url
local fFlagAddThumbnailSelectorReport = require(parent.SharedFlags).FFlagAddThumbnailSelectorReport

return function(p1, p2)
	-- upvalues: fFlagAddThumbnailSelectorReport (ref), httpService (ref), url (ref)
	if fFlagAddThumbnailSelectorReport and p2 == nil then
		p2 = {}
	end
	local t = { tags = {} }
	
	for i, v in p2 do
		local v
		if typeof(v) ~= "table" then
			v = if fFlagAddThumbnailSelectorReport then tostring(v):split(",") else { tostring(v) }
		end
		local t_1 = {}
		
		for i_1, v_1 in v do
			table.insert(t_1, { data = tostring(v_1) })
		end
		t.tags[i] = { valueList = t_1 }
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), t (ref)
		return httpService:JSONEncode(t)
	end)
	
	if not ok then
		warn("Failed to encode report data")
	end
	return p1(url.APIS_URL .. "abuse-reporting/v2/abuse-report", "POST", { postBody = status })
end