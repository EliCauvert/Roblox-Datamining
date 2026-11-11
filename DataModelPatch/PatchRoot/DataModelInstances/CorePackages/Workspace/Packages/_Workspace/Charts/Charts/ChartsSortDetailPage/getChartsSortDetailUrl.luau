local Parent = script:FindFirstAncestor("Charts").Parent
local AddSystemInfoToArgsFunction = require(Parent.DiscoveryUtils).AddSystemInfoToArgs
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local NewUrlBuilder = UrlBuilder.new({
	path = "charts-api/v1/charts-sort-detail",
	base = require(Parent.Http).Url.APIS_URL
})

return function(p1)
	-- upvalues: AddSystemInfoToArgsFunction (copy), UrlBuilder (copy), NewUrlBuilder (copy)
	local t = {}
	AddSystemInfoToArgsFunction(t)
	t.sortId = p1.sortId
	
	if p1.contentPageToken and p1.contentPageToken ~= "" then
		t.contentPageToken = p1.contentPageToken
	end
	if p1.sessionId and p1.sessionId ~= "" then
		t.sessionId = p1.sessionId
	end
	if p1.filterSelections then
		for i, filterSelection in p1.filterSelections do
			t[i] = filterSelection
		end
	end
	return UrlBuilder.addQueryString(NewUrlBuilder(), t)
end