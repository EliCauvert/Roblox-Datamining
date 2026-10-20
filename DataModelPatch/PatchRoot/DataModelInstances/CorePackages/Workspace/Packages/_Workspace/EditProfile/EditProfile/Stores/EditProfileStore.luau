local Parent = script:FindFirstAncestor("EditProfile").Parent
local _ = require(Parent.Signals)
local DataHydrationModule = require(Parent.DataHydration)
local UpdateUserDescriptionModule = require(script.Parent.Requests.updateUserDescription)
local DataCache = DataHydrationModule.createDataCache()
local DataResolver = DataHydrationModule.createDataResolver({
	supportsMultiGet = false,
	queueProcessDelaySec = 0,
	cache = DataCache,
	fetchFn = require(script.Parent.Requests.fetchUserDescription)
})

return {
	getDescription = function(p1)
		-- upvalues: DataResolver (copy)
		return (DataResolver.getAndFetchItem(p1))
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