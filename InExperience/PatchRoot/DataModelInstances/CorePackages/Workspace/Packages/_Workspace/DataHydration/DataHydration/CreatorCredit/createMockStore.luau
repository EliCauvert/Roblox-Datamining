local parent = script:FindFirstAncestor("DataHydration").Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local promiseModule = require(parent.Promise)
local createDataCacheModule = require(script.Parent.Parent.createDataCache)
local _ = require(script.Parent.types)

local function _()
	return {
		additionalUsageEnabled = false,
		dailyLimitSet = true,
		dailyLimit = 100
	}
end

local _ = function()
	return {
		freeTrialDailyAllowance = 100,
		freeTrialRemaining = 72,
		freeTrialPctUsed = 28,
		nextResetEligibleTime = "2026-07-17T00:00:00Z",
		robuxBalance = 500,
		robuxSpentToday = 0,
		limitRemaining = 100,
		limitSettings = {
			additionalUsageEnabled = false,
			dailyLimitSet = true,
			dailyLimit = 100
		}
	}
end

return function(p0)
	-- upvalues: createDataCacheModule (ref), luauPolyfillModule (ref), promiseModule (ref)
	p0 = p0 or {}
	local var4 = createDataCacheModule(300, 300)
	local var5 = createDataCacheModule(300, 300)
	
	if p0.initialQuota then
		var4.replaceItem("current-user", p0.initialQuota)
	end
	if p0.initialDailyLimit then
		var5.replaceItem("current-user", p0.initialDailyLimit)
	end
	local var6 = nil
	local var7 = 0
	
	local function _()
		-- upvalues: var6 (write), var7 (write), var4 (ref), luauPolyfillModule (copy)
		if var6 == nil then return end
		if var7 <= 0 then
			var4.replaceItem("current-user", var6)
			
			return
		end
		luauPolyfillModule.setTimeout(function()
			-- upvalues: var4 (copy), var6 (ref)
			var4.replaceItem("current-user", var6)
		end, var7 * 1000)
	end
	
	return {
		getQuotaSummary = function()
			-- upvalues: var4 (ref), var6 (write), var7 (write), luauPolyfillModule (copy)
			local item, item_1 = var4.getItem("current-user")
			
			if item_1 then
				if var6 == nil then
					return item
				end
				local var10 = var6
				
				if var7 <= 0 then
					var4.replaceItem("current-user", var10)
					
					return item
				end
				luauPolyfillModule.setTimeout(function()
					-- upvalues: var4 (copy), var10 (ref)
					var4.replaceItem("current-user", var10)
				end, var7 * 1000)
			end
			return item
		end,
		getQuotaSummarySignals = function()
			-- upvalues: var4 (ref)
			return var4.getItem("current-user")
		end,
		refreshQuotaSummary = function()
			-- upvalues: var4 (ref), var6 (write), promiseModule (copy)
			local var6_1 = var6 or (var4.getItem("current-user").data(false) or {
				freeTrialDailyAllowance = 100,
				freeTrialRemaining = 72,
				freeTrialPctUsed = 28,
				nextResetEligibleTime = "2026-07-17T00:00:00Z",
				robuxBalance = 500,
				robuxSpentToday = 0,
				limitRemaining = 100,
				limitSettings = {
					additionalUsageEnabled = false,
					dailyLimitSet = true,
					dailyLimit = 100
				}
			})
			var4.replaceItem("current-user", var6_1)
			
			return promiseModule.resolve(var6_1)
		end,
		getDailyLimit = function()
			-- upvalues: var5 (ref)
			if var5.getItem("current-user").data(false) == nil then
				var5.replaceItem("current-user", {
					additionalUsageEnabled = false,
					dailyLimitSet = true,
					dailyLimit = 100
				})
			end
			return var5.getItem("current-user")
		end,
		getDailyLimitSignals = function()
			-- upvalues: var5 (ref)
			return var5.getItem("current-user")
		end,
		refreshDailyLimit = function()
			-- upvalues: var5 (ref), promiseModule (copy)
			local var12 = var5.getItem("current-user").data(false) or {
				additionalUsageEnabled = false,
				dailyLimitSet = true,
				dailyLimit = 100
			}
			var5.replaceItem("current-user", var12)
			
			return promiseModule.resolve(var12)
		end,
		setDailyLimit = function(value)
			-- upvalues: var5 (ref), promiseModule (copy)
			var5.replaceItem("current-user", value)
			
			return promiseModule.resolve(value)
		end,
		clear = function()
			-- upvalues: var4 (ref), var5 (ref)
			var4.clear()
			var5.clear()
		end,
		dispose = function()
			-- upvalues: var4 (ref), var5 (ref)
			var4.dispose()
			var5.dispose()
		end,
		_setQuota = function(value)
			-- upvalues: var4 (ref)
			var4.replaceItem("current-user", value)
		end,
		_setDailyLimit = function(value)
			-- upvalues: var5 (ref)
			var5.replaceItem("current-user", value)
		end,
		_setError = function()
			-- upvalues: var4 (ref)
			var4.markItemsAsFailed({ "current-user" })
		end,
		_setLoading = function()
			-- upvalues: var4 (ref)
			var4.clear()
		end,
		_setAutoPopulate = function(value, p1)
			-- upvalues: var6 (write), var7 (write)
			var6 = value or {
				freeTrialDailyAllowance = 100,
				freeTrialRemaining = 72,
				freeTrialPctUsed = 28,
				nextResetEligibleTime = "2026-07-17T00:00:00Z",
				robuxBalance = 500,
				robuxSpentToday = 0,
				limitRemaining = 100,
				limitSettings = {
					additionalUsageEnabled = false,
					dailyLimitSet = true,
					dailyLimit = 100
				}
			}
			var7 = p1 or 0
		end
	}
end