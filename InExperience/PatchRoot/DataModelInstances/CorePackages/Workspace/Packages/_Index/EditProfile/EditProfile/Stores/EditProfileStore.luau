local parent = script:FindFirstAncestor("EditProfile").Parent
local _ = require(parent.Signals)
local dataHydrationModule = require(parent.DataHydration)
local createDataCache = dataHydrationModule.createDataCache
local createDataResolver = dataHydrationModule.createDataResolver
local fetchUserDescriptionModule = require(script.Parent.Requests.fetchUserDescription)
local updateUserDescriptionModule = require(script.Parent.Requests.updateUserDescription)
local var1 = createDataCache()
local var2 = createDataResolver({
	supportsMultiGet = false,
	queueProcessDelaySec = 0,
	cache = var1,
	fetchFn = fetchUserDescriptionModule
})

return {
	getDescription = function(p1)
		-- upvalues: var2 (ref)
		return var2.getAndFetchItem(p1)
	end,
	updateDescription = function(p1, p2)
		-- upvalues: updateUserDescriptionModule (ref), var1 (ref)
		return updateUserDescriptionModule(p2):andThen(function(p3)
			-- upvalues: var1 (copy), p1 (ref)
			var1.replaceItem(p1, p3)
			
			return p3
		end)
	end
}