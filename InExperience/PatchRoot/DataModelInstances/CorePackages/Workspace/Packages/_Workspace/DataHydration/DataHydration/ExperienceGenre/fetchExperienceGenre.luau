local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBuilderModule = require(parent.UrlBuilder)
local urlBase = urlBuilderModule.UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local experienceGenreStoreTypesModule = require(script.Parent.ExperienceGenreStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p1)
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref)
	return (p1 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
end

return {
	fetchExperienceGenre = function(p1, p2, p3)
		-- upvalues: urlBase (ref), experienceGenreStoreTypesModule (ref), fetch (ref), urlBuilderModule (ref), asPromise (ref)
		p3 = p3 or {}
		local baseUrl = p3.baseUrl or urlBase.APIS
		p2 = p2 or {}
		local t = {
			universeId = p1,
			genreTaxonomyVersion = p2.genreTaxonomyVersion or experienceGenreStoreTypesModule.DEFAULT_TAXONOMY_VERSION
		}
		
		if p2.includeGenreTaxonomyVersion then
			t["responseOptions.includeGenreTaxonomyVersion"] = "true"
		end
		if p2.includeUpdateLockExpirationTime then
			t["responseOptions.includeUpdateLockExpirationTime"] = "true"
		end
		if p2.includeVerificationState then
			t["responseOptions.includeVerificationState"] = "true"
		end
		if p2.includeAppealState then
			t["responseOptions.includeAppealState"] = "true"
		end
		if p2.includeCreatorSelectedGenre then
			t["responseOptions.includeCreatorSelectedGenre"] = "true"
		end
		if p2.includeNotifyGenreChange then
			t["responseOptions.includeNotifyGenreChange"] = "true"
		end
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "experience-genre.get",
			network = p3.network,
			url = urlBuilderModule.UrlBuilder.addQueryString(baseUrl .. "/experience-genre-api/v1/Creator/ExperienceGenre", t),
			decode = function(p4)
				return p4
			end
		}))
	end,
	setExperienceGenre = function(value, p1)
		-- upvalues: urlBase (ref), experienceGenreStoreTypesModule (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		local baseUrl = (p1 or {}).baseUrl or urlBase.APIS
		local t = {
			universeId = value.universeId,
			genre = value.genre,
			genreTaxonomyVersion = value.genreTaxonomyVersion or experienceGenreStoreTypesModule.DEFAULT_TAXONOMY_VERSION
		}
		
		if value.responseOptions then
			t.responseOptions = value.responseOptions
		end
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "experience-genre.set",
			network = (p1 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = baseUrl .. "/experience-genre-api/v1/Creator/ExperienceGenre",
			body = t,
			decode = function(p2)
				return p2
			end
		}))
	end
}