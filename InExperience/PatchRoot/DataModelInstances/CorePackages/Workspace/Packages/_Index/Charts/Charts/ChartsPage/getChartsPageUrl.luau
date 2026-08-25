local parent = script:FindFirstAncestor("Charts").Parent
local addSystemInfoToArgs = require(parent.DiscoveryUtils).AddSystemInfoToArgs
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local fFlagSduiChartsRequestPlaceholders = require(parent.SharedFlags).FFlagSduiChartsRequestPlaceholders
local var0 = urlBuilder.new({
	path = "charts-api/v1/charts-page",
	base = require(parent.Http).Url.APIS_URL
})

return function(p0)
	-- upvalues: addSystemInfoToArgs (ref), fFlagSduiChartsRequestPlaceholders (ref), urlBuilder (ref), var0 (ref)
	local t = {}
	addSystemInfoToArgs(t)
	
	if p0 then
		if p0.feedPageToken and p0.feedPageToken ~= "" then
			t.feedPageToken = p0.feedPageToken
		end
		if p0.sessionId and p0.sessionId ~= "" then
			t.sessionId = p0.sessionId
		end
		if p0.entryPaginationKey and p0.entryPaginationKey ~= "" then
			t.entryPaginationKey = p0.entryPaginationKey
		end
		if p0.entryPageToken and p0.entryPageToken ~= "" then
			t.entryPageToken = p0.entryPageToken
		end
		if p0.pageType and p0.pageType ~= "" then
			t.pageType = p0.pageType
		end
		if p0.filterSelections then
			for i, v in p0.filterSelections do
				t[i] = v
			end
		end
		if fFlagSduiChartsRequestPlaceholders and p0.includePlaceholders then
			t.includePlaceholders = "true"
		end
	end
	return urlBuilder.addQueryString(var0(), t)
end