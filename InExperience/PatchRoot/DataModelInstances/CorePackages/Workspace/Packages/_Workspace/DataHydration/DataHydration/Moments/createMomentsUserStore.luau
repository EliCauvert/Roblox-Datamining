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

local function _(p0, p1)
	-- upvalues: httpService (ref)
	return httpService:JSONEncode({
		targetUserId = p0,
		hasCursor = p1 ~= nil,
		cursor = p1 or ""
	})
end

return function(p2)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), httpClientModule (ref), fetchUserMomentsModule (ref), httpService (ref), fFlagProfileMomentsOrderingAndReactions (ref), signalsModule (ref)
	p2 = p2 or {}
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var12 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		fetchFn = function(p3, _)
			-- upvalues: t (write), promiseModule (copy), httpClientModule (copy), fetchUserMomentsModule (copy), p2 (ref)
			local var19 = t[p3]
			
			return if var19 == nil then promiseModule.reject(`Missing user moments request params for {p3}`) else httpClientModule.asPromise(fetchUserMomentsModule(var19.targetUserId, var19.cursor, p2.network))
		end
	})
	
	local function _(value, p4)
		-- upvalues: httpService (copy), t (write)
		local var20 = httpService:JSONEncode({
			targetUserId = value,
			hasCursor = p4 ~= nil,
			cursor = p4 or ""
		})
		t[var20] = { targetUserId = value, cursor = p4 }
		
		return var20
	end
	
	local function getCachedUserMoments(p5, p6)
		-- upvalues: var12 (ref), httpService (copy), t (write)
		local getCachedItem = var12.getCachedItem
		local var21 = httpService:JSONEncode({
			targetUserId = p5,
			hasCursor = p6 ~= nil,
			cursor = p6 or ""
		})
		t[var21] = { targetUserId = p5, cursor = p6 }
		
		return getCachedItem(var21)
	end
	
	local function fetchUserMomentsItem(p7, p8)
		-- upvalues: var12 (ref), httpService (copy), t (write)
		local fetchItem = var12.fetchItem
		local var22 = httpService:JSONEncode({
			targetUserId = p7,
			hasCursor = p8 ~= nil,
			cursor = p8 or ""
		})
		t[var22] = { targetUserId = p7, cursor = p8 }
		
		return fetchItem(var22)
	end
	
	local function getAndFetchUserMoments(p9, p10)
		-- upvalues: var12 (ref), httpService (copy), t (write)
		local getAndFetchItem = var12.getAndFetchItem
		local var23 = httpService:JSONEncode({
			targetUserId = p9,
			hasCursor = p10 ~= nil,
			cursor = p10 or ""
		})
		t[var23] = { targetUserId = p9, cursor = p10 }
		
		return getAndFetchItem(var23)
	end
	
	local function getUserMoments(p11, p12)
		-- upvalues: fFlagProfileMomentsOrderingAndReactions (copy), httpClientModule (copy), fetchUserMomentsModule (copy), p2 (ref), httpService (copy), t_1 (write), t_2 (write)
		if not fFlagProfileMomentsOrderingAndReactions then
			return httpClientModule.asPromise(fetchUserMomentsModule(p11, p12, p2.network))
		end
		local var24 = httpService:JSONEncode({
			targetUserId = p11,
			hasCursor = p12 ~= nil,
			cursor = p12 or ""
		})
		local var25 = t_1[var24]
		
		if var25 == nil then
			local var26 = httpClientModule.asPromise(fetchUserMomentsModule(p11, p12, p2.network))
			t_1[var24] = var26
			t_2[var24] = p11
			var26:catch(function()
				-- upvalues: t_1 (copy), var24 (ref), t_2 (copy)
				t_1[var24] = nil
				t_2[var24] = nil
			end)
			
			return var26
		end
		return var25
	end
	
	local var17, var18 = signalsModule.createSignal(0)
	
	return {
		getUserMoments = getUserMoments,
		getCachedUserMoments = getCachedUserMoments,
		fetchUserMoments = fetchUserMomentsItem,
		getAndFetchUserMoments = getAndFetchUserMoments,
		invalidateUser = function(p13)
			-- upvalues: t_2 (write), t_1 (write), var18 (ref), var17 (ref)
			for i, v in t_2 do
				if v == p13 then
					t_1[i] = nil
					t_2[i] = nil
				end
			end
			var18(var17(false) + 1)
		end,
		getUserMomentsVersion = var17,
		clear = function()
			-- upvalues: t (write), fFlagProfileMomentsOrderingAndReactions (copy), t_1 (write), t_2 (write), var12 (ref)
			t = {}
			
			if fFlagProfileMomentsOrderingAndReactions then
				t_1 = {}
				t_2 = {}
			end
			var12.clear()
		end,
		dispose = function()
			-- upvalues: t (write), fFlagProfileMomentsOrderingAndReactions (copy), t_1 (write), t_2 (write), var12 (ref)
			t = {}
			
			if fFlagProfileMomentsOrderingAndReactions then
				t_1 = {}
				t_2 = {}
			end
			var12.dispose()
		end
	}
end