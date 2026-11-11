local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBuilderModule = require(Parent.UrlBuilder)
local UrlBase = UrlBuilderModule.UrlBase
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local ExperienceGenreStoreTypesModule = require(script.Parent.ExperienceGenreStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function _(p1)
	-- upvalues: WithCsrfRetryModule (copy), HttpClientModule (copy)
	return (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork())
end

return {
	fetchExperienceGenre = function(UniverseId, p1, p2)
		-- upvalues: UrlBase (copy), ExperienceGenreStoreTypesModule (copy), FetchFunction (copy), UrlBuilderModule (copy), AsPromiseFunction (copy)
		local P3 = p2 or {}
		local BaseUrl = P3.baseUrl or UrlBase.APIS
		local P2 = p1 or {}
		local config = {
			universeId = UniverseId,
			genreTaxonomyVersion = P2.genreTaxonomyVersion or ExperienceGenreStoreTypesModule.DEFAULT_TAXONOMY_VERSION
		}
		
		if P2.includeGenreTaxonomyVersion then
			config["responseOptions.includeGenreTaxonomyVersion"] = "true"
		end
		if P2.includeUpdateLockExpirationTime then
			config["responseOptions.includeUpdateLockExpirationTime"] = "true"
		end
		if P2.includeVerificationState then
			config["responseOptions.includeVerificationState"] = "true"
		end
		if P2.includeAppealState then
			config["responseOptions.includeAppealState"] = "true"
		end
		if P2.includeCreatorSelectedGenre then
			config["responseOptions.includeCreatorSelectedGenre"] = "true"
		end
		if P2.includeNotifyGenreChange then
			config["responseOptions.includeNotifyGenreChange"] = "true"
		end
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "experience-genre.get",
			network = P3.network,
			url = UrlBuilderModule.UrlBuilder.addQueryString(BaseUrl .. "/experience-genre-api/v1/Creator/ExperienceGenre", config),
			decode = function(p3)
				return p3
			end
		})))
	end,
	setExperienceGenre = function(Body, p1)
		-- upvalues: UrlBase (copy), ExperienceGenreStoreTypesModule (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), AsPromiseFunction (copy)
		local BaseUrl = (p1 or {}).baseUrl or UrlBase.APIS
		local Body1 = {
			universeId = Body.universeId,
			genre = Body.genre,
			genreTaxonomyVersion = Body.genreTaxonomyVersion or ExperienceGenreStoreTypesModule.DEFAULT_TAXONOMY_VERSION
		}
		
		if Body.responseOptions then
			Body1.responseOptions = Body.responseOptions
		end
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "experience-genre.set",
			network = (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = BaseUrl .. "/experience-genre-api/v1/Creator/ExperienceGenre",
			body = Body1,
			decode = function(p2)
				return p2
			end
		})))
	end
}