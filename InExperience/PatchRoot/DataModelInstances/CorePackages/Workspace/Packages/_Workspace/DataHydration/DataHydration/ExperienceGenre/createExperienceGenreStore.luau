local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchExperienceGenreModule = require(script.Parent.fetchExperienceGenre)
local syncExperienceGenreToGameInfo = require(script.Parent.syncExperienceGenreToGameInfo).syncExperienceGenreToGameInfo
local _ = require(script.Parent.ExperienceGenreStoreTypes)
local t = {
	includeGenreTaxonomyVersion = true,
	includeUpdateLockExpirationTime = true,
	includeVerificationState = true,
	includeAppealState = true,
	includeCreatorSelectedGenre = true,
	includeNotifyGenreChange = true
}

return function(p0)
	-- upvalues: t (ref), createSingleEntityResolverModule (ref), fetchExperienceGenreModule (ref), syncExperienceGenreToGameInfo (ref)
	p0 = p0 or {}
	local t_1 = { network = p0.network, baseUrl = p0.baseUrl }
	local defaultGetOptions = p0.defaultGetOptions or t
	local var7 = createSingleEntityResolverModule(function(p1)
		-- upvalues: fetchExperienceGenreModule (copy), defaultGetOptions (ref), t_1 (ref)
		return fetchExperienceGenreModule.fetchExperienceGenre(p1, defaultGetOptions, t_1)
	end)
	
	return {
		getExperienceGenre = var7.get,
		fetchExperienceGenre = var7.fetch,
		getAndFetchExperienceGenre = var7.getAndFetch,
		setExperienceGenre = function(value)
			-- upvalues: fetchExperienceGenreModule (copy), t_1 (ref), var7 (ref), syncExperienceGenreToGameInfo (copy)
			return fetchExperienceGenreModule.setExperienceGenre(value, t_1):andThen(function(p2)
				-- upvalues: var7 (copy), value (ref), syncExperienceGenreToGameInfo (copy)
				var7.update(value.universeId, p2)
				syncExperienceGenreToGameInfo(value.universeId, nil, p2.genre)
				
				return p2
			end)
		end,
		updateExperienceGenre = var7.update,
		clear = var7.clear,
		dispose = var7.dispose
	}
end