local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local SignalsModule = require(InExperienceShop.Parent.Signals)
local ConstantsModule = require(InExperienceShop.Constants)
local _ = require(InExperienceShop.Types)
local FFlagEnableShopPrefetchModule = require(InExperienceShop.Flags.FFlagEnableShopPrefetch)
local FFlagEnableShopProductInfoRefreshModule = require(InExperienceShop.Flags.FFlagEnableShopProductInfoRefresh)
local FFlagShopPrefetchProductInfoModule = require(InExperienceShop.Flags.FFlagShopPrefetchProductInfo)
local FIntShopPrefetchMaxRetriesModule = require(InExperienceShop.Flags.FIntShopPrefetchMaxRetries)
local FIntShopPrefetchRetryBackoffMsModule = require(InExperienceShop.Flags.FIntShopPrefetchRetryBackoffMs)
local FIntShopPrefetchDelayMsModule = require(InExperienceShop.Flags.FIntShopPrefetchDelayMs)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local WhenJoinSettlesModule = require(InExperienceShop.Internal.whenJoinSettles)
local SchedulePrefetchDelayModule = require(InExperienceShop.Internal.schedulePrefetchDelay)
local ScheduleRetryModule = require(InExperienceShop.Internal.scheduleRetry)
local LogCounterModule = require(InExperienceShop.Internal.logCounter)
local ShopDebugLoggerModule = require(InExperienceShop.Internal.ShopDebugLogger)
local PrefetchOnJoinFiredFallbackPathCounterModule = require(InExperienceShop.Events.PrefetchOnJoinFiredFallbackPathCounter)
local PrefetchOnJoinFiredPrimaryPathCounterModule = require(InExperienceShop.Events.PrefetchOnJoinFiredPrimaryPathCounter)
local PrefetchOnJoinRetriedCounterModule = require(InExperienceShop.Events.PrefetchOnJoinRetriedCounter)

local function _(List): boolean
	-- upvalues: ConstantsModule (copy)
	for _, value in List do
		if value.id ~= ConstantsModule.HOME_CATEGORY_ID then
			return true
		end
	end
	return false
end

local _ = function(p1)
	-- upvalues: GetInExperienceShopStoreModule (copy), SignalsModule (copy)
	local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
	local v1 = false
	local Effect = nil
	Effect = SignalsModule.createEffect(function(p2)
		-- upvalues: v1 (ref), InExperienceShopStoreModule (copy), p1 (copy), Effect (ref)
		if v1 then return end
		if not InExperienceShopStoreModule.getLoading(p2) then
			local Categories = InExperienceShopStoreModule.getCategories(p2)
			local Error = InExperienceShopStoreModule.getError(p2)
			v1 = true
			task.spawn(function()
				-- upvalues: p1 (upval), Error (copy), Categories (copy)
				p1(Error, Categories)
			end)
			task.defer(function()
				-- upvalues: Effect (upval)
				if Effect then
					Effect()
				end
			end)
			
			return
		end
	end)
end

local function triggerPrefetch(p1, Callback)
	-- upvalues: ShopDebugLoggerModule (copy), LogCounterModule (copy), PrefetchOnJoinFiredPrimaryPathCounterModule (copy), PrefetchOnJoinFiredFallbackPathCounterModule (copy), GetInExperienceShopStoreModule (copy), FFlagEnableShopProductInfoRefreshModule (copy), FFlagShopPrefetchProductInfoModule (copy), FIntShopPrefetchMaxRetriesModule (copy), FIntShopPrefetchRetryBackoffMsModule (copy), ConstantsModule (copy), PrefetchOnJoinRetriedCounterModule (copy), ScheduleRetryModule (copy), SignalsModule (copy)
	ShopDebugLoggerModule.logLazy(function(): string
		-- upvalues: p1 (copy)
		return "prefetchShopDataOnGameJoin: triggerPrefetch path=" .. p1
	end)
	
	if p1 == "primary" then
		LogCounterModule(PrefetchOnJoinFiredPrimaryPathCounterModule)
	else
		LogCounterModule(PrefetchOnJoinFiredFallbackPathCounterModule)
	end
	local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
	local StartTimerResult = ShopDebugLoggerModule.startTimer()
	
	local function _()
		-- upvalues: FFlagEnableShopProductInfoRefreshModule (upval), FFlagShopPrefetchProductInfoModule (upval), ShopDebugLoggerModule (upval), InExperienceShopStoreModule (copy)
		if FFlagEnableShopProductInfoRefreshModule and not FFlagShopPrefetchProductInfoModule then
			ShopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting prefetchWidgetsOnly")
			InExperienceShopStoreModule.prefetchWidgetsOnly()
			
			return
		else
			ShopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting fetchAllShopData")
			InExperienceShopStoreModule.fetchAllShopData()
		end
	end
	
	if Callback then
		local FIntShopPrefetchRetryBackoffMsModuleRatio = FIntShopPrefetchRetryBackoffMsModule / 1000
		local Count = FIntShopPrefetchMaxRetriesModule
		
		local function tryFetch()
			-- upvalues: ShopDebugLoggerModule (upval), FIntShopPrefetchMaxRetriesModule (copy), Count (ref), FFlagEnableShopProductInfoRefreshModule (upval), FFlagShopPrefetchProductInfoModule (upval), InExperienceShopStoreModule (copy), ConstantsModule (upval), FIntShopPrefetchRetryBackoffMsModuleRatio (copy), LogCounterModule (upval), PrefetchOnJoinRetriedCounterModule (upval), ScheduleRetryModule (upval), tryFetch (copy), StartTimerResult (copy), Callback (copy), GetInExperienceShopStoreModule (upval), SignalsModule (upval)
			ShopDebugLoggerModule.logLazy(function(): string
				-- upvalues: FIntShopPrefetchMaxRetriesModule (upval), Count (upval)
				return "prefetchShopDataOnGameJoin: attempt=" .. FIntShopPrefetchMaxRetriesModule - Count + 1 .. " of " .. FIntShopPrefetchMaxRetriesModule + 1
			end)
			
			if FFlagEnableShopProductInfoRefreshModule and not FFlagShopPrefetchProductInfoModule then
				ShopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting prefetchWidgetsOnly")
				InExperienceShopStoreModule.prefetchWidgetsOnly()
			else
				ShopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting fetchAllShopData")
				InExperienceShopStoreModule.fetchAllShopData()
			end
			local function v33(Error, Categories)
				-- upvalues: ConstantsModule (upval), Count (upval), ShopDebugLoggerModule (upval), FIntShopPrefetchRetryBackoffMsModuleRatio (upval), LogCounterModule (upval), PrefetchOnJoinRetriedCounterModule (upval), ScheduleRetryModule (upval), tryFetch (upval), StartTimerResult (upval), Callback (upval)
				local Flag = false
				
				if Error == nil then
					Flag = false
					
					for _, category in Categories do
						if category.id ~= ConstantsModule.HOME_CATEGORY_ID then
							Flag = true
							break
						end
					end
				end
				if Error ~= nil and Count > 0 then
					Count -= 1
					ShopDebugLoggerModule.logLazy(function(): string
						-- upvalues: Count (upval), FIntShopPrefetchRetryBackoffMsModuleRatio (upval)
						return "prefetchShopDataOnGameJoin: error, retrying attemptsRemaining=" .. Count .. " backoffSeconds=" .. FIntShopPrefetchRetryBackoffMsModuleRatio
					end)
					LogCounterModule(PrefetchOnJoinRetriedCounterModule)
					ScheduleRetryModule(FIntShopPrefetchRetryBackoffMsModuleRatio, tryFetch)
					
					return
				else
					ShopDebugLoggerModule.logElapsedLazy(function(): string
						-- upvalues: Flag (copy)
						return "prefetchShopDataOnGameJoin: settled hasItems=" .. tostring(Flag)
					end, StartTimerResult)
					Callback(Flag)
				end
			end
			
			local InExperienceShopStoreModule1 = GetInExperienceShopStoreModule(false)
			local v1 = false
			local Callback1 = nil
			Callback1 = SignalsModule.createEffect(function(p2)
				-- upvalues: v1 (ref), InExperienceShopStoreModule1 (copy), v33 (copy), Callback1 (ref)
				if v1 then return end
				if not InExperienceShopStoreModule1.getLoading(p2) then
					local Categories = InExperienceShopStoreModule1.getCategories(p2)
					local Error = InExperienceShopStoreModule1.getError(p2)
					v1 = true
					task.spawn(function()
						-- upvalues: v33 (upval), Error (copy), Categories (copy)
						v33(Error, Categories)
					end)
					task.defer(function()
						-- upvalues: Callback1 (upval)
						if Callback1 then
							Callback1()
						end
					end)
					
					return
				end
			end)
		end
		
		tryFetch()
		
		return
	end
	if FFlagEnableShopProductInfoRefreshModule and not FFlagShopPrefetchProductInfoModule then
		ShopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting prefetchWidgetsOnly")
		InExperienceShopStoreModule.prefetchWidgetsOnly()
		
		return
	else
		ShopDebugLoggerModule.log("prefetchShopDataOnGameJoin: starting fetchAllShopData")
		InExperienceShopStoreModule.fetchAllShopData()
	end
end

return function(p2)
	-- upvalues: FFlagEnableShopPrefetchModule (copy), ShopDebugLoggerModule (copy), WhenJoinSettlesModule (copy), FIntShopPrefetchDelayMsModule (copy), triggerPrefetch (copy), SchedulePrefetchDelayModule (copy)
	if FFlagEnableShopPrefetchModule then
		ShopDebugLoggerModule.log("prefetchShopDataOnGameJoin: waiting for join to settle")
		WhenJoinSettlesModule(function(p3)
			-- upvalues: ShopDebugLoggerModule (upval), FIntShopPrefetchDelayMsModule (upval), triggerPrefetch (upval), p2 (copy), SchedulePrefetchDelayModule (upval)
			ShopDebugLoggerModule.logLazy(function(): string
				-- upvalues: p3 (copy)
				return "prefetchShopDataOnGameJoin: join settled path=" .. p3
			end)
			
			if FIntShopPrefetchDelayMsModule <= 0 then
				triggerPrefetch(p3, p2)
				
				return
			else
				SchedulePrefetchDelayModule(FIntShopPrefetchDelayMsModule / 1000, function()
					-- upvalues: triggerPrefetch (upval), p3 (copy), p2 (upval)
					triggerPrefetch(p3, p2)
				end)
			end
		end)
		
		return
	end
end