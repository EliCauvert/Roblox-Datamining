local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FetchExperienceGenreModule = require(script.Parent.fetchExperienceGenre)
local SyncExperienceGenreToGameInfoFunction = require(script.Parent.syncExperienceGenreToGameInfo).syncExperienceGenreToGameInfo
local _ = require(script.Parent.ExperienceGenreStoreTypes)
local config = {
	includeGenreTaxonomyVersion = true,
	includeUpdateLockExpirationTime = true,
	includeVerificationState = true,
	includeAppealState = true,
	includeCreatorSelectedGenre = true,
	includeNotifyGenreChange = true
}

return function(p1)
	-- upvalues: config (copy), CreateSingleEntityResolverModule (copy), FetchExperienceGenreModule (copy), SyncExperienceGenreToGameInfoFunction (copy)
	local P0 = p1 or {}
	local config1 = { network = P0.network, baseUrl = P0.baseUrl }
	local DefaultGetOptions = P0.defaultGetOptions or config
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2)
		-- upvalues: FetchExperienceGenreModule (upval), DefaultGetOptions (copy), config1 (copy)
		return FetchExperienceGenreModule.fetchExperienceGenre(p2, DefaultGetOptions, config1)
	end)
	
	return {
		getExperienceGenre = SingleEntityResolverModule.get,
		fetchExperienceGenre = SingleEntityResolverModule.fetch,
		getAndFetchExperienceGenre = SingleEntityResolverModule.getAndFetch,
		setExperienceGenre = function(p2)
			-- upvalues: FetchExperienceGenreModule (upval), config1 (copy), SingleEntityResolverModule (copy), SyncExperienceGenreToGameInfoFunction (upval)
			return FetchExperienceGenreModule.setExperienceGenre(p2, config1):andThen(function(Result)
				-- upvalues: SingleEntityResolverModule (upval), p2 (copy), SyncExperienceGenreToGameInfoFunction (upval)
				SingleEntityResolverModule.update(p2.universeId, Result)
				SyncExperienceGenreToGameInfoFunction(p2.universeId, nil, Result.genre)
				
				return Result
			end)
		end,
		updateExperienceGenre = SingleEntityResolverModule.update,
		clear = SingleEntityResolverModule.clear,
		dispose = SingleEntityResolverModule.dispose
	}
end