local Parent = script:FindFirstAncestor("Charts").Parent
local AddSystemInfoToArgsFunction = require(Parent.DiscoveryUtils).AddSystemInfoToArgs
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local FFlagSduiChartsRequestPlaceholders = require(Parent.SharedFlags).FFlagSduiChartsRequestPlaceholders
local NewUrlBuilder = UrlBuilder.new({
	path = "charts-api/v1/charts-page",
	base = require(Parent.Http).Url.APIS_URL
})

return function(p1)
	-- upvalues: AddSystemInfoToArgsFunction (copy), FFlagSduiChartsRequestPlaceholders (copy), UrlBuilder (copy), NewUrlBuilder (copy)
	local t = {}
	AddSystemInfoToArgsFunction(t)
	
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
			for i, filterSelection in p1.filterSelections do
				t[i] = filterSelection
			end
		end
		if FFlagSduiChartsRequestPlaceholders and p1.includePlaceholders then
			t.includePlaceholders = "true"
		end
	end
	return UrlBuilder.addQueryString(NewUrlBuilder(), t)
end