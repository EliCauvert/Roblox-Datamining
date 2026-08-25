local parent = script:FindFirstAncestor("EditProfile").Parent
local _ = require(parent.Signals)
local dataHydrationModule = require(parent.DataHydration)
local createDataCache = dataHydrationModule.createDataCache
local createDataResolver = dataHydrationModule.createDataResolver
local fetchUserDescriptionModule = require(script.Parent.Requests.fetchUserDescription)
local updateUserDescriptionModule = require(script.Parent.Requests.updateUserDescription)
local var3 = createDataCache()
local var4 = createDataResolver({
	supportsMultiGet = false,
	queueProcessDelaySec = 0,
	cache = var3,
	fetchFn = fetchUserDescriptionModule
})

return {
	getDescription = function(p0)
		-- upvalues: var4 (ref)
		return var4.getAndFetchItem(p0)
	end,
	updateDescription = function(p1, p2)
		-- upvalues: updateUserDescriptionModule (ref), var3 (ref)
		return updateUserDescriptionModule(p2):andThen(function(p3)
			-- upvalues: var3 (copy), p1 (ref)
			var3.replaceItem(p1, p3)
			
			return p3
		end)
	end
}