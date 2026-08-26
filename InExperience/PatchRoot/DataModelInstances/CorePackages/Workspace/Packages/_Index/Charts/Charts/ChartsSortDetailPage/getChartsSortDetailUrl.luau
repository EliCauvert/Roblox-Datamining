local parent = script:FindFirstAncestor("Charts").Parent
local addSystemInfoToArgs = require(parent.DiscoveryUtils).AddSystemInfoToArgs
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local fFlagSduiChartsSortDetailGenreFilter = require(parent.SharedFlags).FFlagSduiChartsSortDetailGenreFilter
local var1 = urlBuilder.new({
	path = "charts-api/v1/charts-sort-detail",
	base = require(parent.Http).Url.APIS_URL
})

return function(p1)
	-- upvalues: addSystemInfoToArgs (ref), fFlagSduiChartsSortDetailGenreFilter (ref), urlBuilder (ref), var1 (ref)
	local t = {}
	addSystemInfoToArgs(t)
	t.sortId = p1.sortId
	
	if p1.contentPageToken and p1.contentPageToken ~= "" then
		t.contentPageToken = p1.contentPageToken
	end
	if p1.sessionId and p1.sessionId ~= "" then
		t.sessionId = p1.sessionId
	end
	if p1.filterSelections then
		for i, v in p1.filterSelections do
			t[i] = v
		end
	end
	if fFlagSduiChartsSortDetailGenreFilter and p1.selectedGenre ~= nil then
		t.selectedGenre = p1.selectedGenre
	end
	return urlBuilder.addQueryString(var1(), t)
end