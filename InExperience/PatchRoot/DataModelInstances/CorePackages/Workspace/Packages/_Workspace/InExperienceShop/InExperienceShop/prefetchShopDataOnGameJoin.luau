local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local signalsModule = require(inExperienceShop.Parent.Signals)
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)
local fFlagEnableShopPrefetchModule = require(inExperienceShop.Flags.FFlagEnableShopPrefetch)
local fFlagEnableShopProductInfoRefreshModule = require(inExperienceShop.Flags.FFlagEnableShopProductInfoRefresh)
local fFlagShopPrefetchProductInfoModule = require(inExperienceShop.Flags.FFlagShopPrefetchProductInfo)
local fIntShopPrefetchMaxRetriesModule = require(inExperienceShop.Flags.FIntShopPrefetchMaxRetries)
local fIntShopPrefetchRetryBackoffMsModule = require(inExperienceShop.Flags.FIntShopPrefetchRetryBackoffMs)
local fIntShopPrefetchDelayMsModule = require(inExperienceShop.Flags.FIntShopPrefetchDelayMs)
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local whenJoinSettlesModule = require(inExperienceShop.Internal.whenJoinSettles)
local schedulePrefetchDelayModule = require(inExperienceShop.Internal.schedulePrefetchDelay)
local scheduleRetryModule = require(inExperienceShop.Internal.scheduleRetry)
local logCounterModule = require(inExperienceShop.Internal.logCounter)
local shopDebugLoggerModule = require(inExperienceShop.Internal.ShopDebugLogger)
local prefetchOnJoinFiredFallbackPathCounterModule = require(inExperienceShop.Events.PrefetchOnJoinFiredFallbackPathCounter)
local prefetchOnJoinFiredPrimaryPathCounterModule = require(inExperienceShop.Events.PrefetchOnJoinFiredPrimaryPathCounter)
local prefetchOnJoinRetriedCounterModule = require(inExperienceShop.Events.PrefetchOnJoinRetriedCounter)

local function _(p1)
	-- upvalues: constantsModule (ref)
	for i, v in p1 do
		if v.id ~= constantsModule.HOME_CATEGORY_ID then
			return true
		end
	end
	return false
end

local _ = function(p2)
	-- upvalues: getInExperienceShopStoreModule (ref), signalsModule (ref)
	local var1 = getInExperienceShopStoreModule(false)
	local var2 = false
	local var3 = nil
	var3 = signalsModule.createEffect(function(p3)
		-- upvalues: var2 (write), var1 (ref), p2 (ref), var3 (write)
		if var2 then return end
		if var1.getLoading(p3) then
			return
		end
		local categories = var1.getCategories(p3)
		local error = var1.getError(p3)
		var2 = true
		task.spawn(function()
			-- upvalues: p2 (copy), error (ref), categories (ref)
			p2(error, categories)
		end)
		task.defer(function()
			-- upvalues: var3 (copy)
			if var3 then
				var3()
			end
		end)
	end)
end

local function triggerPrefetch(p2, p3)
	-- upvalues: shopDebugLoggerModule (ref), logCounterModule (ref), prefetchOnJoinFiredPrimaryPathCounterModule (ref), prefetchOnJoinFiredFallbackPathCounterModule (ref), getInExperienceShopStoreModule (ref), fFlagEnableShopProductInfoRefreshModule (ref), fFlagShopPrefetchProductInfoModule (ref), fIntShopPrefetchMaxRetriesModule (ref), fIntShopPrefetchRetryBackoffMsModule (ref), constantsModule (ref), prefetchOnJoinRetriedCounterModule (ref), scheduleRetryModule (ref), signalsModule (ref)
	shopDebugLoggerModule.logLazy(function()
		-- upvalues: p2 (ref)
		return "prefetchShopDataOnGameJoin: triggerPrefetch path=" .. p3
	end)
	
	if p2 == "primary" then
		logCounterModule(prefetchOnJoinFiredPrimaryPathCounterModule)
	else
		logCounterModule(prefetchOnJoinFiredFallbackPathCounterModule)
	end
	local var1 = getInExperienceShopStoreModule(false)
	local var2 = shopDebugLoggerModule.startTimer()
	
	local _ = function()
		-- upvalues: fFlagEnableShopProductInfoRefreshModule (copy), fFlagShopPrefetchProductInfoModule (copy), shopDebugLoggerModule (copy), var1 (ref)
		if fFlagEnableShopProductInfoRefreshModule and not fFlagShopPrefetchProductInfoModule then
			shopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting prefetchWidgetsOnly")
			var1.prefetchWidgetsOnly()
			
			return
		end
		shopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting fetchAllShopData")
		var1.fetchAllShopData()
	end
	
	if p3 then
		local var3 = fIntShopPrefetchRetryBackoffMsModule / 1000
		local var4 = fIntShopPrefetchMaxRetriesModule
		
		local function tryFetch()
			-- upvalues: shopDebugLoggerModule (copy), fIntShopPrefetchMaxRetriesModule (ref), var4 (write), fFlagEnableShopProductInfoRefreshModule (copy), fFlagShopPrefetchProductInfoModule (copy), var1 (ref), constantsModule (copy), var3 (ref), logCounterModule (copy), prefetchOnJoinRetriedCounterModule (copy), scheduleRetryModule (copy), tryFetch (ref), var2 (ref), p3 (ref), getInExperienceShopStoreModule (copy), signalsModule (copy)
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: fIntShopPrefetchMaxRetriesModule (copy), var4 (copy)
				return "prefetchShopDataOnGameJoin: attempt=" .. fIntShopPrefetchMaxRetriesModule - var4 + 1 .. " of " .. fIntShopPrefetchMaxRetriesModule + 1
			end)
			
			if fFlagEnableShopProductInfoRefreshModule and not fFlagShopPrefetchProductInfoModule then
				shopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting prefetchWidgetsOnly")
				var1.prefetchWidgetsOnly()
			else
				shopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting fetchAllShopData")
				var1.fetchAllShopData()
			end
			local var5 = function(p4, p5)
				-- upvalues: constantsModule (copy), var4 (copy), shopDebugLoggerModule (copy), var3 (copy), logCounterModule (copy), prefetchOnJoinRetriedCounterModule (copy), scheduleRetryModule (copy), tryFetch (copy), var2 (copy), p3 (copy)
				local var6 = false
				
				if p4 == nil then
					for i, v in p5 do
						if v.id ~= constantsModule.HOME_CATEGORY_ID then
							var6 = true
						end
					end
					var6 = false
				end
				if p4 ~= nil and var4 > 0 then
					var4 -= 1
					shopDebugLoggerModule.logLazy(function()
						-- upvalues: var4 (copy), var3 (copy)
						return "prefetchShopDataOnGameJoin: error, retrying attemptsRemaining=" .. var27 .. " backoffSeconds=" .. var26
					end)
					logCounterModule(prefetchOnJoinRetriedCounterModule)
					scheduleRetryModule(var3, tryFetch)
					
					return
				end
				shopDebugLoggerModule.logElapsedLazy(function()
					-- upvalues: var6 (ref)
					return "prefetchShopDataOnGameJoin: settled hasItems=" .. tostring(var6)
				end, var2)
				p3(var6)
			end
			
			local var7 = getInExperienceShopStoreModule(false)
			local var8 = false
			local var9 = nil
			var9 = signalsModule.createEffect(function(p6)
				-- upvalues: var8 (write), var7 (ref), var5 (ref), var9 (write)
				if var8 then return end
				if var7.getLoading(p6) then
					return
				end
				local categories = var7.getCategories(p6)
				local error = var7.getError(p6)
				var20 = true
				task.spawn(function()
					-- upvalues: var5 (copy), error (ref), categories (ref)
					var5(error, categories)
				end)
				task.defer(function()
					-- upvalues: var9 (copy)
					if var9 then
						var9()
					end
				end)
			end)
		end
		
		tryFetch()
		
		return
	elseif fFlagEnableShopProductInfoRefreshModule and not fFlagShopPrefetchProductInfoModule then
		shopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting prefetchWidgetsOnly")
		var1.prefetchWidgetsOnly()
		
		return
	end
	shopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting fetchAllShopData")
	var1.fetchAllShopData()
end

return function(p4)
	-- upvalues: fFlagEnableShopPrefetchModule (ref), shopDebugLoggerModule (ref), whenJoinSettlesModule (ref), fIntShopPrefetchDelayMsModule (ref), triggerPrefetch (ref), schedulePrefetchDelayModule (ref)
	if fFlagEnableShopPrefetchModule then
		shopDebugLoggerModule.log("prefetchShopDataOnGameJoin: waiting for join to settle")
		whenJoinSettlesModule(function(p5)
			-- upvalues: shopDebugLoggerModule (copy), fIntShopPrefetchDelayMsModule (copy), triggerPrefetch (copy), p4 (ref), schedulePrefetchDelayModule (copy)
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p5 (ref)
				return "prefetchShopDataOnGameJoin: join settled path=" .. p9
			end)
			
			if fIntShopPrefetchDelayMsModule <= 0 then
				triggerPrefetch(p5, p4)
				
				return
			end
			schedulePrefetchDelayModule(fIntShopPrefetchDelayMsModule / 1000, function()
				-- upvalues: triggerPrefetch (copy), p5 (ref), p4 (copy)
				triggerPrefetch(p5, p4)
			end)
		end)
		
		return
	end
end