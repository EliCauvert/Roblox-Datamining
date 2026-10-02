local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local httpClientModule = require(parent.HttpClient)
local signalsModule = require(parent.Signals)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local fetchUserMomentsModule = require(script.Parent.Requests.fetchUserMoments)
local fFlagProfileMomentsOrderingAndReactions = require(parent.SharedFlags).FFlagProfileMomentsOrderingAndReactions

local function _(p1, p2)
	-- upvalues: httpService (ref)
	return httpService:JSONEncode({
		targetUserId = p1,
		hasCursor = p2 ~= nil,
		cursor = p2 or ""
	})
end

return function(p1)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), httpClientModule (ref), fetchUserMomentsModule (ref), httpService (ref), fFlagProfileMomentsOrderingAndReactions (ref), signalsModule (ref)
	p1 = p1 or {}
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var1 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		fetchFn = function(p2, _)
			-- upvalues: t (write), promiseModule (copy), httpClientModule (copy), fetchUserMomentsModule (copy), p1 (ref)
			local var2 = t[p2]
			
			return if var2 == nil then promiseModule.reject(`Missing user moments request params for {p2}`) else httpClientModule.asPromise(fetchUserMomentsModule(var2.targetUserId, var2.cursor, p1.network))
		end
	})
	
	local function _(value, p3)
		-- upvalues: httpService (copy), t (write)
		local var3 = httpService:JSONEncode({
			targetUserId = value,
			hasCursor = p3 ~= nil,
			cursor = p3 or ""
		})
		t[var3] = { targetUserId = value, cursor = p3 }
		
		return var3
	end
	
	local function getCachedUserMoments(p3, p4)
		-- upvalues: var1 (ref), httpService (copy), t (write)
		local getCachedItem = var1.getCachedItem
		local var3 = httpService:JSONEncode({
			targetUserId = p3,
			hasCursor = p4 ~= nil,
			cursor = p4 or ""
		})
		t[var3] = { targetUserId = p3, cursor = p4 }
		
		return getCachedItem(var3)
	end
	
	local function fetchUserMomentsItem(p3, p4)
		-- upvalues: var1 (ref), httpService (copy), t (write)
		local fetchItem = var1.fetchItem
		local var3 = httpService:JSONEncode({
			targetUserId = p3,
			hasCursor = p4 ~= nil,
			cursor = p4 or ""
		})
		t[var3] = { targetUserId = p3, cursor = p4 }
		
		return fetchItem(var3)
	end
	
	local function getAndFetchUserMoments(p3, p4)
		-- upvalues: var1 (ref), httpService (copy), t (write)
		local getAndFetchItem = var1.getAndFetchItem
		local var3 = httpService:JSONEncode({
			targetUserId = p3,
			hasCursor = p4 ~= nil,
			cursor = p4 or ""
		})
		t[var3] = { targetUserId = p3, cursor = p4 }
		
		return getAndFetchItem(var3)
	end
	
	local function getUserMoments(p3, p4)
		-- upvalues: fFlagProfileMomentsOrderingAndReactions (copy), httpClientModule (copy), fetchUserMomentsModule (copy), p1 (ref), httpService (copy), t_1 (write), t_2 (write)
		if not fFlagProfileMomentsOrderingAndReactions then
			return httpClientModule.asPromise(fetchUserMomentsModule(p3, p4, p1.network))
		end
		local var3 = httpService:JSONEncode({
			targetUserId = p3,
			hasCursor = p4 ~= nil,
			cursor = p4 or ""
		})
		local var4 = t_1[var3]
		
		if var4 == nil then
			local var5 = httpClientModule.asPromise(fetchUserMomentsModule(p3, p4, p1.network))
			t_1[var3] = var5
			t_2[var3] = p3
			var5:catch(function()
				-- upvalues: t_1 (copy), var3 (ref), t_2 (copy)
				t_1[var3] = nil
				t_2[var3] = nil
			end)
			
			return var5
		end
		return var4
	end
	
	local function getFreshUserMoments(p3, p4)
		-- upvalues: httpClientModule (copy), fetchUserMomentsModule (copy), p1 (ref)
		return httpClientModule.asPromise(fetchUserMomentsModule(p3, p4, p1.network))
	end
	
	local var3, var4 = signalsModule.createSignal(0)
	local var5, var6 = signalsModule.createSignal({})
	
	return {
		getUserMoments = getUserMoments,
		getFreshUserMoments = getFreshUserMoments,
		getCachedUserMoments = getCachedUserMoments,
		fetchUserMoments = fetchUserMomentsItem,
		getAndFetchUserMoments = getAndFetchUserMoments,
		evictUserMoments = function(p3)
			-- upvalues: t_2 (write), t_1 (write)
			for i, v in t_2 do
				if v == p3 then
					t_1[i] = nil
					t_2[i] = nil
				end
			end
		end,
		invalidateUser = function(p4)
			-- upvalues: t_2 (write), t_1 (write), var4 (ref), var3 (ref)
			for i, v in t_2 do
				if v == p4 then
					t_1[i] = nil
					t_2[i] = nil
				end
			end
			var4(var3(false) + 1)
		end,
		getUserMomentsVersion = var3,
		getPendingUserMoments = var5,
		prependPendingUserMoment = function(p5, p6)
			-- upvalues: var5 (ref), var6 (ref)
			local cloned = table.clone(var5(false))
			local cloned_1 = table.clone(cloned[p5] or {})
			table.insert(cloned_1, 1, { moment = p6 })
			cloned[p5] = cloned_1
			var6(cloned)
		end,
		removePendingUserMoment = function(p5, p6)
			-- upvalues: var5 (ref), var6 (ref)
			local cloned = table.clone(var5(false))
			local var7 = cloned[p5]
			
			if var7 == nil then return end
			local t = {}
			
			for i, v in var7 do
				if v.moment.momentId ~= p6 then
					table.insert(t, v)
				end
			end
			cloned[p5] = if #t > 0 then t else nil
			var6(cloned)
		end,
		resolvePendingUserMoment = function(p7, p8, p9)
			-- upvalues: var5 (ref), var6 (ref)
			local cloned = table.clone(var5(false))
			local var8 = cloned[p7] or {}
			local var9 = nil
			local feedItemId = p9.recommendationMetadata.feedItemId
			
			for i, v in var8 do
				if v.moment.momentId == p8 then
					var9 = i
				elseif v.publishedMoment ~= nil then
					local publishedMoment = v.publishedMoment
					
					if publishedMoment.momentId == p9.momentId or feedItemId ~= nil and feedItemId ~= "" and publishedMoment.recommendationMetadata.feedItemId == feedItemId then
						return false
					end
				end
			end
			if var9 == nil then
				return false
			end
			local cloned_1 = table.clone(var8)
			cloned_1[var9] = { moment = var8[var9].moment, publishedMoment = p9 }
			cloned[p7] = cloned_1
			var6(cloned)
			
			return true
		end,
		clear = function()
			-- upvalues: var6 (ref), t (write), fFlagProfileMomentsOrderingAndReactions (copy), t_1 (write), t_2 (write), var1 (ref)
			var6({})
			t = {}
			
			if fFlagProfileMomentsOrderingAndReactions then
				t_1 = {}
				t_2 = {}
			end
			var1.clear()
		end,
		dispose = function()
			-- upvalues: var6 (ref), t (write), fFlagProfileMomentsOrderingAndReactions (copy), t_1 (write), t_2 (write), var1 (ref)
			var6({})
			t = {}
			
			if fFlagProfileMomentsOrderingAndReactions then
				t_1 = {}
				t_2 = {}
			end
			var1.dispose()
		end
	}
end