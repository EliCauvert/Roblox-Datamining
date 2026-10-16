local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local HttpService = game:GetService("HttpService")
local Url = require(Parent.Http).Url
local FFlagAddThumbnailSelectorReport = require(Parent.SharedFlags).FFlagAddThumbnailSelectorReport

return function(Callback, List) --[[ Line: 9 ]]
	-- upvalues: FFlagAddThumbnailSelectorReport (copy), HttpService (copy), Url (copy)
	if FFlagAddThumbnailSelectorReport and List == nil then
		List = {}
	end
	local config = { tags = {} }
	
	for i, value in List do
		if typeof(value) ~= "table" then
			if FFlagAddThumbnailSelectorReport then
				value = tostring(value):split(",")
			else
				value = { (tostring(value)) }
			end
		end
		local ValueList = {}
		
		for _, value1 in value do
			table.insert(ValueList, { data = tostring(value1) })
		end
		config.tags[i] = { valueList = ValueList }
	end
	local Success, Result = pcall(function() --[[ Line: 46 ]]
		-- upvalues: HttpService (upval), config (copy)
		return HttpService:JSONEncode(config)
	end)
	
	if not Success then
		warn("Failed to encode report data")
	end
	return Callback(Url.APIS_URL .. "abuse-reporting/v2/abuse-report", "POST", { postBody = Result })
end