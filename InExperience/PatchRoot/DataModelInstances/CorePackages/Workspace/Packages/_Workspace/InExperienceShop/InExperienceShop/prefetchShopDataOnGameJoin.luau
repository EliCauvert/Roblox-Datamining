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

local function _(p0)
	-- upvalues: constantsModule (ref)
	for i, v in p0 do
		if v.id ~= constantsModule.HOME_CATEGORY_ID then
			return true
		end
	end
	return false
end

local _ = function(p1)
	-- upvalues: getInExperienceShopStoreModule (ref), signalsModule (ref)
	local var19 = getInExperienceShopStoreModule(false)
	local var20 = false
	local var21 = nil
	var21 = signalsModule.createEffect(function(p2)
		-- upvalues: var20 (write), var19 (ref), p1 (ref), var21 (write)
		if var20 then return end
		if var19.getLoading(p2) then
			return
		end
		local categories = var19.getCategories(p2)
		local error = var19.getError(p2)
		var20 = true
		task.spawn(function()
			-- upvalues: p1 (copy), error (ref), categories (ref)
			p1(error, categories)
		end)
		task.defer(function()
			-- upvalues: var21 (copy)
			if var21 then
				var21()
			end
		end)
	end)
end

local function triggerPrefetch(p3, p4)
	-- upvalues: shopDebugLoggerModule (ref), logCounterModule (ref), prefetchOnJoinFiredPrimaryPathCounterModule (ref), prefetchOnJoinFiredFallbackPathCounterModule (ref), getInExperienceShopStoreModule (ref), fFlagEnableShopProductInfoRefreshModule (ref), fFlagShopPrefetchProductInfoModule (ref), fIntShopPrefetchMaxRetriesModule (ref), fIntShopPrefetchRetryBackoffMsModule (ref), constantsModule (ref), prefetchOnJoinRetriedCounterModule (ref), scheduleRetryModule (ref), signalsModule (ref)
	shopDebugLoggerModule.logLazy(function()
		-- upvalues: p3 (ref)
		return "prefetchShopDataOnGameJoin: triggerPrefetch path=" .. p3
	end)
	
	if p3 == "primary" then
		logCounterModule(prefetchOnJoinFiredPrimaryPathCounterModule)
	else
		logCounterModule(prefetchOnJoinFiredFallbackPathCounterModule)
	end
	local var24 = getInExperienceShopStoreModule(false)
	local var25 = shopDebugLoggerModule.startTimer()
	
	local _ = function()
		-- upvalues: fFlagEnableShopProductInfoRefreshModule (copy), fFlagShopPrefetchProductInfoModule (copy), shopDebugLoggerModule (copy), var24 (ref)
		if fFlagEnableShopProductInfoRefreshModule and not fFlagShopPrefetchProductInfoModule then
			shopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting prefetchWidgetsOnly")
			var24.prefetchWidgetsOnly()
			
			return
		end
		shopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting fetchAllShopData")
		var24.fetchAllShopData()
	end
	
	if p4 then
		local var26 = fIntShopPrefetchRetryBackoffMsModule / 1000
		local var27 = fIntShopPrefetchMaxRetriesModule
		
		local function tryFetch()
			-- upvalues: shopDebugLoggerModule (copy), fIntShopPrefetchMaxRetriesModule (ref), var27 (write), fFlagEnableShopProductInfoRefreshModule (copy), fFlagShopPrefetchProductInfoModule (copy), var24 (ref), constantsModule (copy), var26 (ref), logCounterModule (copy), prefetchOnJoinRetriedCounterModule (copy), scheduleRetryModule (copy), tryFetch (ref), var25 (ref), p4 (ref), getInExperienceShopStoreModule (copy), signalsModule (copy)
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: fIntShopPrefetchMaxRetriesModule (copy), var27 (copy)
				return "prefetchShopDataOnGameJoin: attempt=" .. fIntShopPrefetchMaxRetriesModule - var27 + 1 .. " of " .. fIntShopPrefetchMaxRetriesModule + 1
			end)
			
			if fFlagEnableShopProductInfoRefreshModule and not fFlagShopPrefetchProductInfoModule then
				shopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting prefetchWidgetsOnly")
				var24.prefetchWidgetsOnly()
			else
				shopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting fetchAllShopData")
				var24.fetchAllShopData()
			end
			local var29 = function(p5, p6)
				-- upvalues: constantsModule (copy), var27 (copy), shopDebugLoggerModule (copy), var26 (copy), logCounterModule (copy), prefetchOnJoinRetriedCounterModule (copy), scheduleRetryModule (copy), tryFetch (copy), var25 (copy), p4 (copy)
				local var33 = false
				
				if p5 == nil then
					for i, v in p6 do
						if v.id ~= constantsModule.HOME_CATEGORY_ID then
							var33 = true
						end
					end
					var33 = false
				end
				if p5 ~= nil and var27 > 0 then
					var27 -= 1
					shopDebugLoggerModule.logLazy(function()
						-- upvalues: var27 (copy), var26 (copy)
						return "prefetchShopDataOnGameJoin: error, retrying attemptsRemaining=" .. var27 .. " backoffSeconds=" .. var26
					end)
					logCounterModule(prefetchOnJoinRetriedCounterModule)
					scheduleRetryModule(var26, tryFetch)
					
					return
				end
				shopDebugLoggerModule.logElapsedLazy(function()
					-- upvalues: var33 (ref)
					return "prefetchShopDataOnGameJoin: settled hasItems=" .. tostring(var33)
				end, var25)
				p4(var33)
			end
			
			local var30 = getInExperienceShopStoreModule(false)
			local var31 = false
			local var32 = nil
			var32 = signalsModule.createEffect(function(p7)
				-- upvalues: var31 (write), var30 (ref), var29 (ref), var32 (write)
				if var31 then return end
				if var30.getLoading(p7) then
					return
				end
				local categories = var30.getCategories(p7)
				local error = var30.getError(p7)
				var20 = true
				task.spawn(function()
					-- upvalues: var29 (copy), error (ref), categories (ref)
					var29(error, categories)
				end)
				task.defer(function()
					-- upvalues: var32 (copy)
					if var32 then
						var32()
					end
				end)
			end)
		end
		
		tryFetch()
		
		return
	elseif fFlagEnableShopProductInfoRefreshModule and not fFlagShopPrefetchProductInfoModule then
		shopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting prefetchWidgetsOnly")
		var24.prefetchWidgetsOnly()
		
		return
	end
	shopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting fetchAllShopData")
	var24.fetchAllShopData()
end

return function(p8)
	-- upvalues: fFlagEnableShopPrefetchModule (ref), shopDebugLoggerModule (ref), whenJoinSettlesModule (ref), fIntShopPrefetchDelayMsModule (ref), triggerPrefetch (ref), schedulePrefetchDelayModule (ref)
	if fFlagEnableShopPrefetchModule then
		shopDebugLoggerModule.log("prefetchShopDataOnGameJoin: waiting for join to settle")
		whenJoinSettlesModule(function(p9)
			-- upvalues: shopDebugLoggerModule (copy), fIntShopPrefetchDelayMsModule (copy), triggerPrefetch (copy), p8 (ref), schedulePrefetchDelayModule (copy)
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p9 (ref)
				return "prefetchShopDataOnGameJoin: join settled path=" .. p9
			end)
			
			if fIntShopPrefetchDelayMsModule <= 0 then
				triggerPrefetch(p9, p8)
				
				return
			end
			schedulePrefetchDelayModule(fIntShopPrefetchDelayMsModule / 1000, function()
				-- upvalues: triggerPrefetch (copy), p9 (ref), p8 (copy)
				triggerPrefetch(p9, p8)
			end)
		end)
		
		return
	end
end