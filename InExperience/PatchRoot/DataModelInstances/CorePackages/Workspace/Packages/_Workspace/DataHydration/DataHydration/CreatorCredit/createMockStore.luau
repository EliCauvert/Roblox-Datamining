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

return function(p1)
	-- upvalues: createDataCacheModule (ref), luauPolyfillModule (ref), promiseModule (ref)
	p1 = p1 or {}
	local var1 = createDataCacheModule(300, 300)
	local var2 = createDataCacheModule(300, 300)
	
	if p1.initialQuota then
		var1.replaceItem("current-user", p1.initialQuota)
	end
	if p1.initialDailyLimit then
		var2.replaceItem("current-user", p1.initialDailyLimit)
	end
	local var3 = nil
	local var4 = 0
	
	local function _()
		-- upvalues: var3 (write), var4 (write), var1 (ref), luauPolyfillModule (copy)
		if var3 == nil then return end
		if var4 <= 0 then
			var1.replaceItem("current-user", var3)
			
			return
		end
		luauPolyfillModule.setTimeout(function()
			-- upvalues: var1 (copy), var3 (ref)
			var1.replaceItem("current-user", var3)
		end, var4 * 1000)
	end
	
	return {
		getQuotaSummary = function()
			-- upvalues: var1 (ref), var3 (write), var4 (write), luauPolyfillModule (copy)
			local item, item_1 = var1.getItem("current-user")
			
			if item_1 then
				if var3 == nil then
					return item
				end
				local var5 = var3
				
				if var4 <= 0 then
					var1.replaceItem("current-user", var5)
					
					return item
				end
				luauPolyfillModule.setTimeout(function()
					-- upvalues: var1 (copy), var5 (ref)
					var1.replaceItem("current-user", var5)
				end, var4 * 1000)
			end
			return item
		end,
		getQuotaSummarySignals = function()
			-- upvalues: var1 (ref)
			return var1.getItem("current-user")
		end,
		refreshQuotaSummary = function()
			-- upvalues: var1 (ref), var3 (write), promiseModule (copy)
			local var5 = var3 or (var1.getItem("current-user").data(false) or {
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
			var1.replaceItem("current-user", var5)
			
			return promiseModule.resolve(var5)
		end,
		getDailyLimit = function()
			-- upvalues: var2 (ref)
			if var2.getItem("current-user").data(false) == nil then
				var2.replaceItem("current-user", {
					additionalUsageEnabled = false,
					dailyLimitSet = true,
					dailyLimit = 100
				})
			end
			return var2.getItem("current-user")
		end,
		getDailyLimitSignals = function()
			-- upvalues: var2 (ref)
			return var2.getItem("current-user")
		end,
		refreshDailyLimit = function()
			-- upvalues: var2 (ref), promiseModule (copy)
			local var5 = var2.getItem("current-user").data(false) or {
				additionalUsageEnabled = false,
				dailyLimitSet = true,
				dailyLimit = 100
			}
			var2.replaceItem("current-user", var5)
			
			return promiseModule.resolve(var5)
		end,
		setDailyLimit = function(value)
			-- upvalues: var2 (ref), promiseModule (copy)
			var2.replaceItem("current-user", value)
			
			return promiseModule.resolve(value)
		end,
		clear = function()
			-- upvalues: var1 (ref), var2 (ref)
			var1.clear()
			var2.clear()
		end,
		dispose = function()
			-- upvalues: var1 (ref), var2 (ref)
			var1.dispose()
			var2.dispose()
		end,
		_setQuota = function(value)
			-- upvalues: var1 (ref)
			var1.replaceItem("current-user", value)
		end,
		_setDailyLimit = function(value)
			-- upvalues: var2 (ref)
			var2.replaceItem("current-user", value)
		end,
		_setError = function()
			-- upvalues: var1 (ref)
			var1.markItemsAsFailed({ "current-user" })
		end,
		_setLoading = function()
			-- upvalues: var1 (ref)
			var1.clear()
		end,
		_setAutoPopulate = function(value, p2)
			-- upvalues: var3 (write), var4 (write)
			var3 = value or {
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
			var4 = p2 or 0
		end
	}
end