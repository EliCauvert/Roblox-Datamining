local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.MomentsTypes)
local signalsModule = require(parent.Signals)
local localUserIdStore = require(parent.LocalUserIdStore).LocalUserIdStore
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local dataHydrationTypesModule = require(dataHydration.DataHydrationTypes)
local dataHydrationUtilsModule = require(dataHydration.DataHydrationUtils)
local _ = require(script.Parent.MomentsStoreTypes)

return function(p1)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), signalsModule (ref), dataHydrationTypesModule (ref), localUserIdStore (ref), dataHydrationUtilsModule (ref)
	local var1, var2
	local _ = p1 or {}
	local var3 = createDataCacheModule()
	local var4 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var3,
		fetchFn = function(_, _)
			-- upvalues: promiseModule (copy)
			return promiseModule.reject("Moments comments V1 has no get-comment-by-id API")
		end
	})
	local var5 = createDataCacheModule()
	local var6, var7 = signalsModule.createSignal(0)
	
	local function _(p2)
		if p2 == nil or p2 == "" then
			return ""
		end
		local var8 = tostring(p2)
		local var9 = tonumber(var8)
		
		return if var9 == nil or var9 > 0 then var8 else ""
	end
	
	local function getGenerationAwareResult(p2, p3)
		-- upvalues: var6 (ref), dataHydrationTypesModule (copy)
		return {
			data = function(p4)
				-- upvalues: var6 (copy), p3 (ref), p2 (ref)
				return if var6(p4) == p3 then p2.data(p4) else nil
			end,
			status = function(p4)
				-- upvalues: var6 (copy), p3 (ref), dataHydrationTypesModule (copy), p2 (ref)
				return if var6(p4) == p3 then p2.status(p4) else dataHydrationTypesModule.DataStatus.NotReady
			end
		}
	end
	
	local _ = function()
		-- upvalues: var4 (ref), var5 (ref)
		var4.clear()
		var5.clear()
	end
	
	local _ = function()
		-- upvalues: var4 (ref), var5 (ref), var7 (ref), var6 (ref)
		var4.clear()
		var5.clear()
		var7(var6(false) + 1)
	end
	
	local currentUserId = localUserIdStore.getCurrentUserId(false)
	
	if currentUserId == nil or currentUserId == "" then
		var1 = ""
	else
		local var8 = tostring(currentUserId)
		var2 = tonumber(var8)
		var1 = if var2 == nil or var2 > 0 then var8 else ""
	end
	local var9
	local localPlayerUserId = dataHydrationUtilsModule.getLocalPlayerUserId()
	
	if localPlayerUserId == nil or localPlayerUserId == "" then
		currentUserId = ""
	else
		var2 = tostring(localPlayerUserId)
		var9 = tonumber(var2)
		currentUserId = if var9 == nil or var9 > 0 then var2 else ""
	end
	localPlayerUserId = if var1 ~= "" then currentUserId else var1
	var9 = dataHydrationUtilsModule.observeLocalPlayerUserId(function(p2)
		-- upvalues: localPlayerUserId (write), var4 (ref), var5 (ref), var7 (ref), var6 (ref)
		local var10
		if p2 == nil or p2 == "" then
			var10 = ""
		else
			local var11 = tostring(p2)
			local var12 = tonumber(var11)
			var10 = if var12 == nil or var12 > 0 then var11 else ""
		end
		if var10 == localPlayerUserId then
			return
		end
		localPlayerUserId = var10
		var4.clear()
		var5.clear()
		var7(var6(false) + 1)
	end)
	local var10 = var1
	local var11 = signalsModule.createEffect(function(p2)
		-- upvalues: localUserIdStore (copy), var10 (write), localPlayerUserId (write), var4 (ref), var5 (ref), var7 (ref), var6 (ref)
		local var12, var13
		local currentUserId = localUserIdStore.getCurrentUserId(p2)
		
		if currentUserId == nil or currentUserId == "" then
			var12 = ""
		else
			local var14 = tostring(currentUserId)
			var13 = tonumber(var14)
			var12 = if var13 == nil or var13 > 0 then var14 else ""
		end
		if var12 == var10 then return end
		var10 = var12
		
		if var12 == nil or var12 == "" then
			currentUserId = ""
		else
			local var15 = tostring(var12)
			var13 = tonumber(var15)
			currentUserId = if var13 == nil or var13 > 0 then var15 else ""
		end
		if currentUserId == localPlayerUserId then
			return
		end
		localPlayerUserId = currentUserId
		var4.clear()
		var5.clear()
		var7(var6(false) + 1)
	end)
	local var12 = false
	
	return {
		getCachedComment = function(p2)
			-- upvalues: var6 (ref), var4 (ref), getGenerationAwareResult (ref)
			return getGenerationAwareResult(var4.getCachedItem(p2), var6(false))
		end,
		getCachedMomentComments = function(p2)
			-- upvalues: var6 (ref), var5 (ref), getGenerationAwareResult (ref)
			return getGenerationAwareResult(var5.getItem(p2), var6(false))
		end,
		upsertComments = function(p2, p3)
			-- upvalues: var6 (ref), var3 (ref)
			if p3 ~= nil and p3 ~= var6(false) then return end
			local t = {}
			
			for i, v in p2 do
				t[v.commentId] = v
			end
			var3.replaceItems(t)
		end,
		upsertMomentComments = function(p4, p5)
			-- upvalues: var6 (ref), var5 (ref)
			if p5 == nil or p5 == var6(false) then
				var5.replaceItems(p4)
				
				return
			end
		end,
		getOwnerGeneration = var6,
		clear = function()
			-- upvalues: var4 (ref), var5 (ref), var7 (ref), var6 (ref)
			var4.clear()
			var5.clear()
			var7(var6(false) + 1)
		end,
		dispose = function()
			-- upvalues: var12 (write), var9 (ref), var11 (ref), var7 (ref), var6 (ref), var4 (ref), var5 (ref)
			if var12 then
				return
			end
			var12 = true
			var9()
			var11()
			var7(var6(false) + 1)
			var4.dispose()
			var5.dispose()
		end
	}
end