local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local cryoModule = require(parent.Cryo)
local fFlagLuaAppDataHydrationOptimisticMutationLayer = require(parent.SharedFlags).FFlagLuaAppDataHydrationOptimisticMutationLayer
local requestsModule = require(script.Parent.Requests)
local _ = require(script.Parent.FollowingStoreTypes)
game:DefineFastInt("FollowingStoreProcessDelaySec", 1)

local function _()
	return game:GetFastInt("FollowingStoreProcessDelaySec")
end

local _ = function(p1)
	return if p1 == nil then nil else tostring(p1)
end

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (ref), cryoModule (ref), requestsModule (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		requestBatchSize = 100,
		cache = var1,
		queueProcessDelaySec = game:GetFastInt("FollowingStoreProcessDelaySec"),
		supportsMutations = fFlagLuaAppDataHydrationOptimisticMutationLayer,
		fetchFn = function(p1)
			-- upvalues: cryoModule (copy), requestsModule (copy)
			local var3 = cryoModule.Dictionary.keys(p1)
			
			return requestsModule.GetFollowingExists(var3):andThen(function(p2)
				-- upvalues: var3 (ref)
				local t = {}
				
				for i, v in if p2 and p2.followings then p2.followings else {} do
					local userId = v.userId
					local var4 = if userId == nil then nil else tostring(userId)
					
					if var4 then
						t[var4] = {
							isFollowing = v.isFollowing == true,
							isFollowed = v.isFollowed == true
						}
					end
				end
				for i, v_1 in var3 do
					if t[v_1] == nil then
						t[v_1] = { isFollowing = false, isFollowed = false }
					end
				end
				return t
			end)
		end
	})
	
	return {
		GetFollowingStatus = function(p3, p4)
			-- upvalues: fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var2 (ref)
			return if fFlagLuaAppDataHydrationOptimisticMutationLayer then if p4 and p4.skipFetch then var2.getOptimisticCachedItem(p3) else var2.getOptimisticAndFetchItem(p3) elseif p4 and p4.skipFetch then var2.getCachedItem(p3) else var2.getAndFetchItem(p3)
		end,
		UpdateFollowingStatus = function(p3, p4)
			-- upvalues: fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var2 (ref), var1 (ref)
			if fFlagLuaAppDataHydrationOptimisticMutationLayer then
				var2.setMutation(p3, p4)
				var2.commitMutation(p3)
				
				return
			end
			var1.replaceItem(p3, p4)
		end,
		clear = function()
			-- upvalues: var2 (ref)
			var2.clear()
		end,
		dispose = function()
			-- upvalues: var2 (ref)
			var2.dispose()
		end
	}
end