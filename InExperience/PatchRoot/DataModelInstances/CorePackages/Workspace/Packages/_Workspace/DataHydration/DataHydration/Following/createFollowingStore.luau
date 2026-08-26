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
	-- upvalues: createDataCacheModule (ref), requestsModule (ref), createDataResolverModule (ref), cryoModule (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataCacheModule()
	
	local function _(p1)
		-- upvalues: requestsModule (copy)
		return requestsModule.GetFollowingExists(p1):andThen(function(p2)
			-- upvalues: p1 (ref)
			local var3 = if p2 and p2.followings then p2.followings else {}
			local t = {}
			local t_1 = {}
			
			for i, v in var3 do
				local userId = v.userId
				local var4 = if userId == nil then nil else tostring(userId)
				
				if var4 then
					t[var4] = v.isFollowing == true
					t_1[var4] = v.isFollowed == true
				end
			end
			for i, v_1 in p1 do
				if t[v_1] == nil then
					t[v_1] = false
				end
				if t_1[v_1] == nil then
					t_1[v_1] = false
				end
			end
			return { isFollowing = t, isFollowed = t_1 }
		end)
	end
	
	local var5 = createDataResolverModule({
		requestBatchSize = 100,
		cache = var1,
		queueProcessDelaySec = game:GetFastInt("FollowingStoreProcessDelaySec"),
		fetchFn = function(p3)
			-- upvalues: cryoModule (copy), requestsModule (copy), var2 (ref)
			local var6 = cryoModule.Dictionary.keys(p3)
			
			return requestsModule.GetFollowingExists(var6):andThen(function(p4)
				-- upvalues: var6 (ref)
				local var7 = if p4 and p4.followings then p4.followings else {}
				local t = {}
				local t_1 = {}
				
				for i, v in var7 do
					local userId = v.userId
					local var8 = if userId == nil then nil else tostring(userId)
					
					if var8 then
						t[var8] = v.isFollowing == true
						t_1[var8] = v.isFollowed == true
					end
				end
				for i, v_1 in var6 do
					if t[v_1] == nil then
						t[v_1] = false
					end
					if t_1[v_1] == nil then
						t_1[v_1] = false
					end
				end
				return { isFollowing = t, isFollowed = t_1 }
			end):andThen(function(p5)
				-- upvalues: var2 (copy)
				var2.replaceItems(p5.isFollowed)
				
				return p5.isFollowing
			end)
		end,
		supportsMutations = fFlagLuaAppDataHydrationOptimisticMutationLayer
	})
	local var9 = createDataResolverModule({
		requestBatchSize = 100,
		cache = var2,
		queueProcessDelaySec = game:GetFastInt("FollowingStoreProcessDelaySec"),
		fetchFn = function(p5)
			-- upvalues: cryoModule (copy), requestsModule (copy), var1 (ref)
			local var10 = cryoModule.Dictionary.keys(p5)
			
			return requestsModule.GetFollowingExists(var10):andThen(function(p6)
				-- upvalues: var10 (ref)
				local var11 = if p6 and p6.followings then p6.followings else {}
				local t = {}
				local t_1 = {}
				
				for i, v in var11 do
					local userId = v.userId
					local var12 = if userId == nil then nil else tostring(userId)
					
					if var12 then
						t[var12] = v.isFollowing == true
						t_1[var12] = v.isFollowed == true
					end
				end
				for i, v_1 in var10 do
					if t[v_1] == nil then
						t[v_1] = false
					end
					if t_1[v_1] == nil then
						t_1[v_1] = false
					end
				end
				return { isFollowing = t, isFollowed = t_1 }
			end):andThen(function(p7)
				-- upvalues: var1 (copy)
				var1.replaceItems(p7.isFollowing)
				
				return p7.isFollowed
			end)
		end,
		supportsMutations = fFlagLuaAppDataHydrationOptimisticMutationLayer
	})
	local var13 = if fFlagLuaAppDataHydrationOptimisticMutationLayer then var5.getOptimisticCachedItem else var5.getCachedItem
	local var14 = if fFlagLuaAppDataHydrationOptimisticMutationLayer then var5.getOptimisticAndFetchItem else var5.getAndFetchItem
	local var15 = if fFlagLuaAppDataHydrationOptimisticMutationLayer then var9.getOptimisticCachedItem else var9.getCachedItem
	local var16 = if fFlagLuaAppDataHydrationOptimisticMutationLayer then var9.getOptimisticAndFetchItem else var9.getAndFetchItem
	
	return {
		GetIsFollowing = function(p7, p8)
			-- upvalues: var13 (ref), var9 (ref), var14 (ref)
			return if p8 and p8.skipFetch then var13(p7) elseif var9.isRequestInQueueOrInFlight(p7) then var13(p7) else var14(p7)
		end,
		GetIsFollowed = function(p7, p8)
			-- upvalues: var15 (ref), var5 (ref), var16 (ref)
			return if p8 and p8.skipFetch then var15(p7) elseif var5.isRequestInQueueOrInFlight(p7) then var15(p7) else var16(p7)
		end,
		clear = function()
			-- upvalues: var5 (ref), var9 (ref)
			var5.clear()
			var9.clear()
		end,
		dispose = function()
			-- upvalues: var5 (ref), var9 (ref)
			var5.dispose()
			var9.dispose()
		end
	}
end