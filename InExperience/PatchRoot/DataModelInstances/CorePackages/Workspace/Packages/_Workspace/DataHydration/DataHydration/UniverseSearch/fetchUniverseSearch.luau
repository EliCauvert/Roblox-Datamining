local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local urlBuilderModule = require(parent.UrlBuilder)
local urlBase = urlBuilderModule.UrlBase
local _ = require(script.Parent.UniverseSearchStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p0, p1) --[[ line: 19 | named "fetchUniverseSearch" ]]
	-- upvalues: urlBase (ref), fetch (ref), urlBuilderModule (ref), asPromise (ref)
	p1 = p1 or {}
	local baseUrl = p1.baseUrl or urlBase.APIS
	local t = {}
	
	if p0.creatorType ~= nil then
		t.CreatorType = p0.creatorType
	end
	if p0.creatorTargetId ~= nil then
		t.CreatorTargetId = p0.creatorTargetId
	end
	if p0.surface ~= nil then
		t.Surface = p0.surface
	end
	if p0.search ~= nil then
		t.Search = p0.search
	end
	if p0.isArchived ~= nil then
		t.IsArchived = tostring(p0.isArchived)
	end
	if p0.isPublic ~= nil then
		t.IsPublic = tostring(p0.isPublic)
	end
	if p0.isShared ~= nil then
		t.IsShared = tostring(p0.isShared)
	end
	if p0.isTeamCreateEnabled ~= nil then
		t.IsTeamCreateEnabled = tostring(p0.isTeamCreateEnabled)
	end
	if p0.sortParam ~= nil then
		t.SortParam = p0.sortParam
	end
	if p0.sortOrder ~= nil then
		t.SortOrder = p0.sortOrder
	end
	if p0.needsAssetOptions ~= nil then
		t.NeedsAssetOptions = tostring(p0.needsAssetOptions)
	end
	if p0.pageIndex ~= nil then
		t.PageIndex = p0.pageIndex
	end
	if p0.pageSize ~= nil then
		t.PageSize = p0.pageSize
	end
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "universes-search.search",
		network = p1.network,
		url = urlBuilderModule.UrlBuilder.addQueryString(baseUrl .. "/universes/v1/search", t),
		decode = function(p2) --[[ line: 73 ]]
			return p2
		end
	}))
end