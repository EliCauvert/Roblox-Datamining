local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local httpClientModule = require(parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local fetchUserMomentsModule = require(script.Parent.Requests.fetchUserMoments)
local fFlagProfileMomentsOrderingAndReactions = require(parent.SharedFlags).FFlagProfileMomentsOrderingAndReactions

local function _(p0, p1) --[[ line: 28 | named "paramsKey" ]]
	-- upvalues: httpService (ref)
	return httpService:JSONEncode({
		targetUserId = p0,
		hasCursor = p1 ~= nil,
		cursor = p1 or ""
	})
end

return function(p2) --[[ line: 36 | named "createMomentsUserStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), httpClientModule (ref), fetchUserMomentsModule (ref), httpService (ref), fFlagProfileMomentsOrderingAndReactions (ref)
	p2 = p2 or {}
	local t = {}
	local t_1 = {}
	local var10 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		fetchFn = function(p3, _) --[[ line: 46 ]]
			-- upvalues: t (write), promiseModule (copy), httpClientModule (copy), fetchUserMomentsModule (copy), p2 (ref)
			local var11 = t[p3]
			
			return if var11 == nil then promiseModule.reject(`Missing user moments request params for {p3}`) else httpClientModule.asPromise(fetchUserMomentsModule(var11.targetUserId, var11.cursor, p2.network))
		end
	})
	
	local function _(value, p4) --[[ line: 55 | named "setParams" ]]
		-- upvalues: httpService (copy), t (write)
		local var12 = httpService:JSONEncode({
			targetUserId = value,
			hasCursor = p4 ~= nil,
			cursor = p4 or ""
		})
		t[var12] = { targetUserId = value, cursor = p4 }
		
		return var12
	end
	
	return {
		getUserMoments = function(p5, p6) --[[ line: 85 ]]
			-- upvalues: fFlagProfileMomentsOrderingAndReactions (copy), httpClientModule (copy), fetchUserMomentsModule (copy), p2 (ref), httpService (copy), t_1 (write)
			if not fFlagProfileMomentsOrderingAndReactions then
				return httpClientModule.asPromise(fetchUserMomentsModule(p5, p6, p2.network))
			end
			local var13 = httpService:JSONEncode({
				targetUserId = p5,
				hasCursor = p6 ~= nil,
				cursor = p6 or ""
			})
			local var14 = t_1[var13]
			
			if var14 == nil then
				local var15 = httpClientModule.asPromise(fetchUserMomentsModule(p5, p6, p2.network))
				t_1[var13] = var15
				var15:catch(function() --[[ line: 96 ]]
					-- upvalues: t_1 (copy), var13 (ref)
					t_1[var13] = nil
				end)
				
				return var15
			end
			return var14
		end,
		getCachedUserMoments = function(p7, p8) --[[ line: 64 ]]
			-- upvalues: var10 (ref), httpService (copy), t (write)
			local getCachedItem = var10.getCachedItem
			local var16 = httpService:JSONEncode({
				targetUserId = p7,
				hasCursor = p8 ~= nil,
				cursor = p8 or ""
			})
			t[var16] = { targetUserId = p7, cursor = p8 }
			
			return getCachedItem(var16)
		end,
		fetchUserMoments = function(p9, p10) --[[ line: 71 ]]
			-- upvalues: var10 (ref), httpService (copy), t (write)
			local fetchItem = var10.fetchItem
			local var17 = httpService:JSONEncode({
				targetUserId = p9,
				hasCursor = p10 ~= nil,
				cursor = p10 or ""
			})
			t[var17] = { targetUserId = p9, cursor = p10 }
			
			return fetchItem(var17)
		end,
		getAndFetchUserMoments = function(p11, p12) --[[ line: 78 ]]
			-- upvalues: var10 (ref), httpService (copy), t (write)
			local getAndFetchItem = var10.getAndFetchItem
			local var18 = httpService:JSONEncode({
				targetUserId = p11,
				hasCursor = p12 ~= nil,
				cursor = p12 or ""
			})
			t[var18] = { targetUserId = p11, cursor = p12 }
			
			return getAndFetchItem(var18)
		end,
		clear = function() --[[ line: 102 ]]
			-- upvalues: t (write), fFlagProfileMomentsOrderingAndReactions (copy), t_1 (write), var10 (ref)
			t = {}
			
			if fFlagProfileMomentsOrderingAndReactions then
				t_1 = {}
			end
			var10.clear()
		end,
		dispose = function() --[[ line: 110 ]]
			-- upvalues: t (write), fFlagProfileMomentsOrderingAndReactions (copy), t_1 (write), var10 (ref)
			t = {}
			
			if fFlagProfileMomentsOrderingAndReactions then
				t_1 = {}
			end
			var10.dispose()
		end
	}
end