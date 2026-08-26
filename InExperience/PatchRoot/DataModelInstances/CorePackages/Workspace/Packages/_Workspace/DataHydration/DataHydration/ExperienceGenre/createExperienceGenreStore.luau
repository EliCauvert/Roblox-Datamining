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

return function(p1)
	-- upvalues: t (ref), createSingleEntityResolverModule (ref), fetchExperienceGenreModule (ref), syncExperienceGenreToGameInfo (ref)
	p1 = p1 or {}
	local t_1 = { network = p1.network, baseUrl = p1.baseUrl }
	local defaultGetOptions = p1.defaultGetOptions or t
	local var1 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchExperienceGenreModule (copy), defaultGetOptions (ref), t_1 (ref)
		return fetchExperienceGenreModule.fetchExperienceGenre(p2, defaultGetOptions, t_1)
	end)
	
	return {
		getExperienceGenre = var1.get,
		fetchExperienceGenre = var1.fetch,
		getAndFetchExperienceGenre = var1.getAndFetch,
		setExperienceGenre = function(value)
			-- upvalues: fetchExperienceGenreModule (copy), t_1 (ref), var1 (ref), syncExperienceGenreToGameInfo (copy)
			return fetchExperienceGenreModule.setExperienceGenre(value, t_1):andThen(function(p2)
				-- upvalues: var1 (copy), value (ref), syncExperienceGenreToGameInfo (copy)
				var1.update(value.universeId, p2)
				syncExperienceGenreToGameInfo(value.universeId, nil, p2.genre)
				
				return p2
			end)
		end,
		updateExperienceGenre = var1.update,
		clear = var1.clear,
		dispose = var1.dispose
	}
end