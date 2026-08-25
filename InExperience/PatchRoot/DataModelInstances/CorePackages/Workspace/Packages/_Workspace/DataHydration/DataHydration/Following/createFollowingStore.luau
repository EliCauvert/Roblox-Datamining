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

local _ = function(p0)
	return if p0 == nil then nil else tostring(p0)
end

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (ref), cryoModule (ref), requestsModule (ref)
	local var5 = createDataCacheModule()
	local var6 = createDataResolverModule({
		requestBatchSize = 100,
		cache = var5,
		queueProcessDelaySec = game:GetFastInt("FollowingStoreProcessDelaySec"),
		supportsMutations = fFlagLuaAppDataHydrationOptimisticMutationLayer,
		fetchFn = function(p1)
			-- upvalues: cryoModule (copy), requestsModule (copy)
			local var7 = cryoModule.Dictionary.keys(p1)
			
			return requestsModule.GetFollowingExists(var7):andThen(function(p2)
				-- upvalues: var7 (ref)
				local t = {}
				
				for i, v in if p2 and p2.followings then p2.followings else {} do
					local userId = v.userId
					local var9 = if userId == nil then nil else tostring(userId)
					
					if var9 then
						t[var9] = {
							isFollowing = v.isFollowing == true,
							isFollowed = v.isFollowed == true
						}
					end
				end
				for i, v_1 in var7 do
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
			-- upvalues: fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var6 (ref)
			return if fFlagLuaAppDataHydrationOptimisticMutationLayer then if p4 and p4.skipFetch then var6.getOptimisticCachedItem(p3) else var6.getOptimisticAndFetchItem(p3) elseif p4 and p4.skipFetch then var6.getCachedItem(p3) else var6.getAndFetchItem(p3)
		end,
		UpdateFollowingStatus = function(p5, p6)
			-- upvalues: fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var6 (ref), var5 (ref)
			if fFlagLuaAppDataHydrationOptimisticMutationLayer then
				var6.setMutation(p5, p6)
				var6.commitMutation(p5)
				
				return
			end
			var5.replaceItem(p5, p6)
		end,
		clear = function()
			-- upvalues: var6 (ref)
			var6.clear()
		end,
		dispose = function()
			-- upvalues: var6 (ref)
			var6.dispose()
		end
	}
end