local parent = script:FindFirstAncestor("Charts").Parent
local addSystemInfoToArgs = require(parent.DiscoveryUtils).AddSystemInfoToArgs
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local fFlagSduiChartsSortDetailGenreFilter = require(parent.SharedFlags).FFlagSduiChartsSortDetailGenreFilter
local var0 = urlBuilder.new({
	path = "charts-api/v1/charts-sort-detail",
	base = require(parent.Http).Url.APIS_URL
})

return function(p0) --[[ line: 15 | named "getChartsSortDetailUrl" ]]
	-- upvalues: addSystemInfoToArgs (ref), fFlagSduiChartsSortDetailGenreFilter (ref), urlBuilder (ref), var0 (ref)
	local t = {}
	addSystemInfoToArgs(t)
	t.sortId = p0.sortId
	
	if p0.contentPageToken and p0.contentPageToken ~= "" then
		t.contentPageToken = p0.contentPageToken
	end
	if p0.sessionId and p0.sessionId ~= "" then
		t.sessionId = p0.sessionId
	end
	if p0.filterSelections then
		for i, v in p0.filterSelections do
			t[i] = v
		end
	end
	if fFlagSduiChartsSortDetailGenreFilter and p0.selectedGenre ~= nil then
		t.selectedGenre = p0.selectedGenre
	end
	return urlBuilder.addQueryString(var0(), t)
end