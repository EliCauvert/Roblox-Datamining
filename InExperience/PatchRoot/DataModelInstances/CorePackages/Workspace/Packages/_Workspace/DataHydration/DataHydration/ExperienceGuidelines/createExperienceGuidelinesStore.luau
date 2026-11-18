local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FFlagExperienceGuidelinesRatingDisplayStoreModule = require(DataHydration.Flags.FFlagExperienceGuidelinesRatingDisplayStore)
local CreateRatingDisplayResolverModule = require(script.Parent.createRatingDisplayResolver)
local FetchExperienceGuidelinesModule = require(script.Parent.fetchExperienceGuidelines)
local SyncGuidelinesAgeToGameStoresFunction = require(script.Parent.syncGuidelinesAgeToGameStores).syncGuidelinesAgeToGameStores
local _ = require(script.Parent.ExperienceGuidelinesStoreTypes)

return function(p1)
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchExperienceGuidelinesModule (copy), SyncGuidelinesAgeToGameStoresFunction (copy), FFlagExperienceGuidelinesRatingDisplayStoreModule (copy), CreateRatingDisplayResolverModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2)
		-- upvalues: FetchExperienceGuidelinesModule (upval), config (copy), SyncGuidelinesAgeToGameStoresFunction (upval)
		return FetchExperienceGuidelinesModule.fetchDetailedGuidelines(p2, config):andThen(function(Result)
			-- upvalues: SyncGuidelinesAgeToGameStoresFunction (upval), p2 (copy)
			SyncGuidelinesAgeToGameStoresFunction(p2, Result)
			
			return Result
		end)
	end)
	local RatingDisplayResolverModule = if FFlagExperienceGuidelinesRatingDisplayStoreModule then CreateRatingDisplayResolverModule(config) else nil
	
	return {
		getDetailedGuidelines = SingleEntityResolverModule.get,
		fetchDetailedGuidelines = SingleEntityResolverModule.fetch,
		refreshDetailedGuidelines = function(p2)
			-- upvalues: FetchExperienceGuidelinesModule (upval), config (copy), SingleEntityResolverModule (copy), SyncGuidelinesAgeToGameStoresFunction (upval)
			return FetchExperienceGuidelinesModule.fetchDetailedGuidelines(p2, config):andThen(function(Result)
				-- upvalues: SingleEntityResolverModule (upval), p2 (copy), SyncGuidelinesAgeToGameStoresFunction (upval)
				SingleEntityResolverModule.cache.replaceItem(tostring(p2), Result)
				SyncGuidelinesAgeToGameStoresFunction(p2, Result)
				
				return Result
			end)
		end,
		getAndFetchDetailedGuidelines = SingleEntityResolverModule.getAndFetch,
		updateDetailedGuidelines = function(p2, p3)
			-- upvalues: SingleEntityResolverModule (copy), SyncGuidelinesAgeToGameStoresFunction (upval)
			SingleEntityResolverModule.update(p2, p3)
			SyncGuidelinesAgeToGameStoresFunction(p2, p3)
		end,
		getRatingDisplay = if FFlagExperienceGuidelinesRatingDisplayStoreModule then RatingDisplayResolverModule.getRatingDisplay else nil,
		getAndFetchRatingDisplay = if FFlagExperienceGuidelinesRatingDisplayStoreModule then RatingDisplayResolverModule.getAndFetchRatingDisplay else nil,
		getAndFetchRatingDisplays = if FFlagExperienceGuidelinesRatingDisplayStoreModule then RatingDisplayResolverModule.getAndFetchRatingDisplays else nil,
		fetchRatingDisplay = if FFlagExperienceGuidelinesRatingDisplayStoreModule then RatingDisplayResolverModule.fetchRatingDisplay else nil,
		clear = if FFlagExperienceGuidelinesRatingDisplayStoreModule then function()
			-- upvalues: SingleEntityResolverModule (copy), RatingDisplayResolverModule (copy)
			SingleEntityResolverModule.clear()
			RatingDisplayResolverModule.clear()
		end else SingleEntityResolverModule.clear,
		dispose = if FFlagExperienceGuidelinesRatingDisplayStoreModule then function()
			-- upvalues: SingleEntityResolverModule (copy), RatingDisplayResolverModule (copy)
			SingleEntityResolverModule.dispose()
			RatingDisplayResolverModule.dispose()
		end else SingleEntityResolverModule.dispose
	}
end