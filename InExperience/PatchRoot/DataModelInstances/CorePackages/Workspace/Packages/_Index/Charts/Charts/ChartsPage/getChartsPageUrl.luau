local parent = script:FindFirstAncestor("Charts").Parent
local addSystemInfoToArgs = require(parent.DiscoveryUtils).AddSystemInfoToArgs
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local fFlagSduiChartsRequestPlaceholders = require(parent.SharedFlags).FFlagSduiChartsRequestPlaceholders
local var1 = urlBuilder.new({
	path = "charts-api/v1/charts-page",
	base = require(parent.Http).Url.APIS_URL
})

return function(p1)
	-- upvalues: addSystemInfoToArgs (ref), fFlagSduiChartsRequestPlaceholders (ref), urlBuilder (ref), var1 (ref)
	local t = {}
	addSystemInfoToArgs(t)
	
	if p1 then
		if p1.feedPageToken and p1.feedPageToken ~= "" then
			t.feedPageToken = p1.feedPageToken
		end
		if p1.sessionId and p1.sessionId ~= "" then
			t.sessionId = p1.sessionId
		end
		if p1.entryPaginationKey and p1.entryPaginationKey ~= "" then
			t.entryPaginationKey = p1.entryPaginationKey
		end
		if p1.entryPageToken and p1.entryPageToken ~= "" then
			t.entryPageToken = p1.entryPageToken
		end
		if p1.pageType and p1.pageType ~= "" then
			t.pageType = p1.pageType
		end
		if p1.filterSelections then
			for i, v in p1.filterSelections do
				t[i] = v
			end
		end
		if fFlagSduiChartsRequestPlaceholders and p1.includePlaceholders then
			t.includePlaceholders = "true"
		end
	end
	return urlBuilder.addQueryString(var1(), t)
end