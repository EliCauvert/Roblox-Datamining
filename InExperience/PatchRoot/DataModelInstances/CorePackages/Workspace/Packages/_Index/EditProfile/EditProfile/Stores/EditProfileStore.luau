local Parent = script:FindFirstAncestor("EditProfile").Parent
local _ = require(Parent.Signals)
local DataHydrationModule = require(Parent.DataHydration)
local CreateDataCacheFunction = DataHydrationModule.createDataCache
local CreateDataResolverFunction = DataHydrationModule.createDataResolver
local UpdateUserDescriptionModule = require(script.Parent.Requests.updateUserDescription)
local DataCache = CreateDataCacheFunction()
local DataResolver = CreateDataResolverFunction({
	supportsMultiGet = false,
	queueProcessDelaySec = 0,
	cache = DataCache,
	fetchFn = require(script.Parent.Requests.fetchUserDescription)
})

local function getDescription(p1)
	-- upvalues: DataResolver (copy)
	return (DataResolver.getAndFetchItem(p1))
end

local DataResolver1 = CreateDataResolverFunction({
	supportsMultiGet = false,
	queueProcessDelaySec = 0,
	cache = CreateDataCacheFunction(),
	fetchFn = require(script.Parent.Requests.fetchUsernameChangePrice)
})

return {
	getDescription = getDescription,
	getUsernameChangePrice = function(p1)
		-- upvalues: DataResolver1 (copy)
		return DataResolver1.getAndFetchItem(p1)
	end,
	updateDescription = function(p1, p2)
		-- upvalues: UpdateUserDescriptionModule (copy), DataCache (copy)
		return UpdateUserDescriptionModule(p2):andThen(function(Result)
			-- upvalues: DataCache (upval), p1 (copy)
			DataCache.replaceItem(p1, Result)
			
			return Result
		end)
	end
}