local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local GetFStringTopSongsSortExploreApiPageTypeFunction = require(Parent.SharedFlags).GetFStringTopSongsSortExploreApiPageType
local FFlagEnableTopSongsSort = require(Parent.SharedFlags).FFlagEnableTopSongsSort
local NewUrlBuilder = UrlBuilder.new({
	base = require(Parent.Http).Url.APIS_URL,
	path = if require(Parent.SharedFlags).FFlagLuaAppChartsAppPage then "/charts-api/v1/get-sorts" else "/explore-api/v1/get-sorts"
})

return function(Callback, SortsPageToken, List, SessionId)
	-- upvalues: FFlagEnableTopSongsSort (copy), GetFStringTopSongsSortExploreApiPageTypeFunction (copy), UrlBuilder (copy), NewUrlBuilder (copy)
	local config = { sessionId = SessionId, sortsPageToken = SortsPageToken }
	
	for i, value in List do
		if config[i] then
			warn(`URL parameter {i} already exists`)
		else
			config[i] = value
		end
	end
	if FFlagEnableTopSongsSort then
		config.pageType = GetFStringTopSongsSortExploreApiPageTypeFunction()
	end
	return Callback(UrlBuilder.addQueryString(NewUrlBuilder(), config), "GET")
end