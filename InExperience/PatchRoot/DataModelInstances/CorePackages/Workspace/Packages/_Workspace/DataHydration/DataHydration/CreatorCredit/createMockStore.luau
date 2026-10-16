local Parent = script:FindFirstAncestor("DataHydration").Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local CreateDataCacheModule = require(script.Parent.Parent.createDataCache)
local _ = require(script.Parent.types)

local function _() --[[ Line: 30 | Named "defaultDailyLimit" ]]
	return {
		additionalUsageEnabled = false,
		dailyLimitSet = true,
		dailyLimit = 100
	}
end

local _ = function() --[[ Line: 38 | Named "defaultQuota" ]]
	return {
		freeTrialDailyAllowance = 100,
		freeTrialRemaining = 72,
		freeTrialPctUsed = 28,
		nextResetEligibleTime = "2026-07-17T00:00:00Z",
		robuxBalance = 500,
		robuxSpentToday = 0,
		limitRemaining = 100,
		freeTrialResetPeriod = "Daily",
		limitSettings = {
			additionalUsageEnabled = false,
			dailyLimitSet = true,
			dailyLimit = 100
		}
	}
end

return function(p1) --[[ Line: 52 | Named "createMockStore" ]]
	-- upvalues: CreateDataCacheModule (copy), LuauPolyfillModule (copy), PromiseModule (copy)
	local P0 = p1 or {}
	local DataCacheModule = CreateDataCacheModule(300, 300)
	local DataCacheModule1 = CreateDataCacheModule(300, 300)
	
	if P0.initialQuota then
		DataCacheModule.replaceItem("current-user", P0.initialQuota)
	end
	if P0.initialDailyLimit then
		DataCacheModule1.replaceItem("current-user", P0.initialDailyLimit)
	end
	local v1 = nil
	local v2 = 0
	
	local function _() --[[ Line: 67 | Named "scheduleAutoPopulate" ]]
		-- upvalues: v1 (ref), v2 (ref), DataCacheModule (copy), LuauPolyfillModule (upval)
		if v1 == nil then return end
		local v3 = v1
		
		if v2 <= 0 then
			DataCacheModule.replaceItem("current-user", v3)
			
			return
		else
			LuauPolyfillModule.setTimeout(function() --[[ Line: 76 ]]
				-- upvalues: DataCacheModule (upval), v3 (copy)
				DataCacheModule.replaceItem("current-user", v3)
			end, v2 * 1000)
		end
	end
	
	return {
		getQuotaSummary = function() --[[ Line: 81 ]]
			-- upvalues: DataCacheModule (copy), v1 (ref), v2 (ref), LuauPolyfillModule (upval)
			local CurrentUserItem, CurrentUserItem2 = DataCacheModule.getItem("current-user")
			
			if CurrentUserItem2 then
				if v1 == nil then
					return CurrentUserItem
				end
				local v3 = v1
				
				if v2 <= 0 then
					DataCacheModule.replaceItem("current-user", v3)
					
					return CurrentUserItem
				end
				LuauPolyfillModule.setTimeout(function() --[[ Line: 76 ]]
					-- upvalues: DataCacheModule (upval), v3 (copy)
					DataCacheModule.replaceItem("current-user", v3)
				end, v2 * 1000)
			end
			return CurrentUserItem
		end,
		getQuotaSummarySignals = function() --[[ Line: 89 ]]
			-- upvalues: DataCacheModule (copy)
			return (DataCacheModule.getItem("current-user"))
		end,
		refreshQuotaSummary = function() --[[ Line: 94 ]]
			-- upvalues: DataCacheModule (copy), v1 (ref), PromiseModule (upval)
			local DataResult = DataCacheModule.getItem("current-user").data(false)
			local V10 = v1 or (DataResult or {
				freeTrialDailyAllowance = 100,
				freeTrialRemaining = 72,
				freeTrialPctUsed = 28,
				nextResetEligibleTime = "2026-07-17T00:00:00Z",
				robuxBalance = 500,
				robuxSpentToday = 0,
				limitRemaining = 100,
				freeTrialResetPeriod = "Daily",
				limitSettings = {
					additionalUsageEnabled = false,
					dailyLimitSet = true,
					dailyLimit = 100
				}
			})
			DataCacheModule.replaceItem("current-user", V10)
			
			return PromiseModule.resolve(V10)
		end,
		getDailyLimit = function() --[[ Line: 101 ]]
			-- upvalues: DataCacheModule1 (copy)
			if DataCacheModule1.getItem("current-user").data(false) == nil then
				DataCacheModule1.replaceItem("current-user", {
					additionalUsageEnabled = false,
					dailyLimitSet = true,
					dailyLimit = 100
				})
			end
			return (DataCacheModule1.getItem("current-user"))
		end,
		getDailyLimitSignals = function() --[[ Line: 109 ]]
			-- upvalues: DataCacheModule1 (copy)
			return (DataCacheModule1.getItem("current-user"))
		end,
		refreshDailyLimit = function() --[[ Line: 114 ]]
			-- upvalues: DataCacheModule1 (copy), PromiseModule (upval)
			local DataResult = DataCacheModule1.getItem("current-user").data(false) or {
				additionalUsageEnabled = false,
				dailyLimitSet = true,
				dailyLimit = 100
			}
			DataCacheModule1.replaceItem("current-user", DataResult)
			
			return PromiseModule.resolve(DataResult)
		end,
		setDailyLimit = function(p2) --[[ Line: 120 ]]
			-- upvalues: DataCacheModule1 (copy), PromiseModule (upval)
			DataCacheModule1.replaceItem("current-user", p2)
			
			return PromiseModule.resolve(p2)
		end,
		clear = function() --[[ Line: 125 ]]
			-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy)
			DataCacheModule.clear()
			DataCacheModule1.clear()
		end,
		dispose = function() --[[ Line: 130 ]]
			-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy)
			DataCacheModule.dispose()
			DataCacheModule1.dispose()
		end,
		_setQuota = function(p2) --[[ Line: 145 ]]
			-- upvalues: DataCacheModule (copy)
			DataCacheModule.replaceItem("current-user", p2)
		end,
		_setDailyLimit = function(p2) --[[ Line: 148 ]]
			-- upvalues: DataCacheModule1 (copy)
			DataCacheModule1.replaceItem("current-user", p2)
		end,
		_setError = function() --[[ Line: 151 ]]
			-- upvalues: DataCacheModule (copy)
			DataCacheModule.markItemsAsFailed({ "current-user" })
		end,
		_setLoading = function() --[[ Line: 154 ]]
			-- upvalues: DataCacheModule (copy)
			DataCacheModule.clear()
		end,
		_setAutoPopulate = function(p2, p3) --[[ Line: 157 ]]
			-- upvalues: v1 (ref), v2 (ref)
			v1 = p2 or {
				freeTrialDailyAllowance = 100,
				freeTrialRemaining = 72,
				freeTrialPctUsed = 28,
				nextResetEligibleTime = "2026-07-17T00:00:00Z",
				robuxBalance = 500,
				robuxSpentToday = 0,
				limitRemaining = 100,
				freeTrialResetPeriod = "Daily",
				limitSettings = {
					additionalUsageEnabled = false,
					dailyLimitSet = true,
					dailyLimit = 100
				}
			}
			v2 = p3 or 0
		end
	}
end