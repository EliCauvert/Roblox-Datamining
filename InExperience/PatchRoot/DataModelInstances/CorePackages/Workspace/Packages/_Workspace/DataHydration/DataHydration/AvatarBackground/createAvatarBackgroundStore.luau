local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(Parent.Signals)
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.HttpClient)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local DataStatus = require(DataHydration.DataHydrationTypes).DataStatus
local FetchAvatarBackgroundModule = require(script.Parent.fetchAvatarBackground)
local GetAvatarBackgroundImageUrlModule = require(script.Parent.getAvatarBackgroundImageUrl)
local _ = require(script.Parent.AvatarBackgroundStoreTypes)

return function(p1)
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchAvatarBackgroundModule (copy), GetAvatarBackgroundImageUrlModule (copy), DataStatus (copy), PromiseModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2)
		-- upvalues: FetchAvatarBackgroundModule (upval), config (copy)
		return FetchAvatarBackgroundModule(p2, config)
	end, {
		cache = { ttlSeconds = P0.ttlSeconds },
		resolver = { replaceItems = true }
	})
	
	return {
		getAndFetchAvatarBackground = function(p2)
			-- upvalues: SingleEntityResolverModule (copy)
			return (SingleEntityResolverModule.getAndFetch((tonumber(p2))))
		end,
		getAndFetchAvatarBackgroundImageUrl = function(p2, p3)
			-- upvalues: SingleEntityResolverModule (copy), GetAvatarBackgroundImageUrlModule (upval)
			local DataResult = SingleEntityResolverModule.getAndFetch((tonumber(p2))).data(p3)
			local AssetId = DataResult and DataResult.assetId
			
			return if AssetId then GetAvatarBackgroundImageUrlModule(AssetId) else nil
		end,
		awaitAvatarBackground = function(p2)
			-- upvalues: SingleEntityResolverModule (copy), DataStatus (upval), PromiseModule (upval), FetchAvatarBackgroundModule (upval), config (copy)
			local Number: number? = tonumber(p2)
			local GetResult = SingleEntityResolverModule.get(Number)
			
			return if GetResult.status(false) == DataStatus.Ready then PromiseModule.resolve(GetResult.data(false)) else FetchAvatarBackgroundModule(Number, config)
		end,
		clear = SingleEntityResolverModule.clear,
		dispose = SingleEntityResolverModule.dispose
	}
end