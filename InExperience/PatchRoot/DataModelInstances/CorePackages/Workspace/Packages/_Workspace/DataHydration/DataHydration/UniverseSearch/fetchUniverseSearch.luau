local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBuilderModule = require(Parent.UrlBuilder)
local UrlBase = UrlBuilderModule.UrlBase
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local FFlagBuildWithGroups = require(Parent.SharedFlags).FFlagBuildWithGroups
local _ = require(script.Parent.UniverseSearchStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function(p1, p2) --[[ Line: 22 | Named "fetchUniverseSearch" ]]
	-- upvalues: UrlBase (copy), FFlagBuildWithGroups (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), AsPromiseFunction (copy), UrlBuilderModule (copy)
	local P1 = p2 or {}
	local BaseUrl = P1.baseUrl or UrlBase.APIS
	
	if FFlagBuildWithGroups and p1.creators ~= nil then
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "universes-search.multi-creator-search",
			network = WithCsrfRetryModule(P1.network or HttpClientModule.createRequestInternalNetwork()),
			url = BaseUrl .. "/universes/v1/search",
			body = {
				creators = p1.creators,
				surface = p1.surface,
				search = p1.search,
				isArchived = p1.isArchived,
				isPublic = p1.isPublic,
				isTeamCreateEnabled = p1.isTeamCreateEnabled,
				sortParam = p1.sortParam,
				sortOrder = p1.sortOrder,
				needsAssetOptions = p1.needsAssetOptions,
				limit = p1.pageSize,
				cursor = p1.cursor
			},
			decode = function(p3) --[[ Line: 48 ]]
				return p3
			end
		})))
	end
	local t = {}
	
	if p1.creatorType ~= nil then
		t.CreatorType = p1.creatorType
	end
	if p1.creatorTargetId ~= nil then
		t.CreatorTargetId = p1.creatorTargetId
	end
	if p1.surface ~= nil then
		t.Surface = p1.surface
	end
	if p1.search ~= nil then
		t.Search = p1.search
	end
	if p1.isArchived ~= nil then
		t.IsArchived = tostring(p1.isArchived)
	end
	if p1.isPublic ~= nil then
		t.IsPublic = tostring(p1.isPublic)
	end
	if p1.isShared ~= nil then
		t.IsShared = tostring(p1.isShared)
	end
	if p1.isTeamCreateEnabled ~= nil then
		t.IsTeamCreateEnabled = tostring(p1.isTeamCreateEnabled)
	end
	if p1.sortParam ~= nil then
		t.SortParam = p1.sortParam
	end
	if p1.sortOrder ~= nil then
		t.SortOrder = p1.sortOrder
	end
	if p1.needsAssetOptions ~= nil then
		t.NeedsAssetOptions = tostring(p1.needsAssetOptions)
	end
	if p1.pageIndex ~= nil then
		t.PageIndex = p1.pageIndex
	end
	if p1.pageSize ~= nil then
		t.PageSize = p1.pageSize
	end
	return AsPromiseFunction((FetchFunction({
		method = "GET",
		analyticsKey = "universes-search.search",
		network = P1.network,
		url = UrlBuilderModule.UrlBuilder.addQueryString(BaseUrl .. "/universes/v1/search", t),
		decode = function(p3) --[[ Line: 102 ]]
			return p3
		end
	})))
end