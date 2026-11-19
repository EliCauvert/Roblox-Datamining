local Parent = script.Parent
local DataHydrationModule = require(Parent.Parent.DataHydration)
local CreateDataCacheFunction = DataHydrationModule.createDataCache
local CreateDataResolverFunction = DataHydrationModule.createDataResolver
local GetSchoolInviteCandidatesModule = require(Parent.getSchoolInviteCandidates)
local _ = require(Parent.Types)

return function()
	-- upvalues: CreateDataCacheFunction (copy), CreateDataResolverFunction (copy), GetSchoolInviteCandidatesModule (copy)
	local DataResolver = CreateDataResolverFunction({
		supportsMultiGet = false,
		replaceItems = true,
		queueProcessDelaySec = 0,
		cache = CreateDataCacheFunction(),
		fetchFn = function(_, _)
			-- upvalues: GetSchoolInviteCandidatesModule (upval)
			return GetSchoolInviteCandidatesModule()
		end
	})
	
	return {
		getInviteCandidates = function(p1)
			-- upvalues: DataResolver (copy)
			return DataResolver.getAndFetchItem(p1)
		end,
		clear = DataResolver.clear,
		dispose = DataResolver.dispose
	}
end