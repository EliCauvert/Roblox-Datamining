local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local CreateDataCacheModule = require(script.Parent.Parent.createDataCache)
local _ = require(script.Parent.types)
local _ = require(DataHydration.DataHydrationTypes)
local FFlagBuildExperienceModelPickerData = require(Parent.SharedFlags).FFlagBuildExperienceModelPickerData

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
		freeTrialResetPeriod = "Daily",
		limitSettings = {
			additionalUsageEnabled = false,
			dailyLimitSet = true,
			dailyLimit = 100
		}
	}
end

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), FFlagBuildExperienceModelPickerData (copy), LuauPolyfillModule (copy), PromiseModule (copy)
	local P0 = p1 or {}
	local DataCacheModule = CreateDataCacheModule(300, 300)
	local DataCacheModule1 = CreateDataCacheModule(300, 300)
	local t = {}
	local Flag = false
	
	local function getTierEntry(Product, Tier)
		-- upvalues: FFlagBuildExperienceModelPickerData (upval), Flag (ref), t (copy), CreateDataCacheModule (upval)
		assert(FFlagBuildExperienceModelPickerData, "Tier quota requires FFlagBuildExperienceModelPickerData")
		assert(not Flag, "Creator Credit tier store is disposed")
		assert(Product == "PRODUCT_BUILD" or Product == "PRODUCT_BUILD_IN_STUDIO", "Invalid quota product")
		assert(Tier == "default" or Tier == "advanced", "Invalid model tier")
		local Text: string = `{Product}:{Tier}`
		
		if t[Text] == nil then
			t[Text] = {
				requested = false,
				cache = CreateDataCacheModule(300, 300),
				product = Product,
				tier = Tier
			}
		end
		return t[Text]
	end
	
	local function setTierQuota(Product, Tier, Tbl)
		-- upvalues: getTierEntry (copy)
		local TierEntry = getTierEntry(Product, Tier)
		TierEntry.quota = Tbl
		TierEntry.error = nil
		TierEntry.cache.replaceItem("current-user", (table.clone(Tbl)))
	end
	
	local function refreshTierQuotaSummary(Product, Tier)
		-- upvalues: getTierEntry (copy)
		local TierEntry = getTierEntry(Product, Tier)
		TierEntry.requested = true
		
		if TierEntry.error == nil and TierEntry.quota ~= nil then
			local Quota = TierEntry.quota
			local TierEntry1 = getTierEntry(Product, Tier)
			TierEntry1.quota = Quota
			TierEntry1.error = nil
			TierEntry1.cache.replaceItem("current-user", (table.clone(Quota)))
			
			return TierEntry.cache.getItem("current-user")
		else
			TierEntry.cache.getItem("current-user")
			TierEntry.cache.markItemsAsFailed({ "current-user" })
			
			return TierEntry.cache.getItem("current-user")
		end
	end
	
	if FFlagBuildExperienceModelPickerData and P0.initialTierQuotas then
		for i, initialTierQuota in P0.initialTierQuotas do
			for i1, Quota in initialTierQuota do
				local TierEntry = getTierEntry(i, i1)
				TierEntry.quota = Quota
				TierEntry.error = nil
				TierEntry.cache.replaceItem("current-user", (table.clone(Quota)))
			end
		end
	end
	if P0.initialQuota then
		DataCacheModule.replaceItem("current-user", P0.initialQuota)
	end
	if P0.initialDailyLimit then
		DataCacheModule1.replaceItem("current-user", P0.initialDailyLimit)
	end
	local v1 = nil
	local v2 = 0
	
	local function _()
		-- upvalues: v1 (ref), v2 (ref), DataCacheModule (copy), LuauPolyfillModule (upval)
		if v1 == nil then return end
		local v3 = v1
		
		if v2 <= 0 then
			DataCacheModule.replaceItem("current-user", v3)
			
			return
		else
			LuauPolyfillModule.setTimeout(function()
				-- upvalues: DataCacheModule (upval), v3 (copy)
				DataCacheModule.replaceItem("current-user", v3)
			end, v2 * 1000)
		end
	end
	
	local config = {
		getQuotaSummary = function()
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
				LuauPolyfillModule.setTimeout(function()
					-- upvalues: DataCacheModule (upval), v3 (copy)
					DataCacheModule.replaceItem("current-user", v3)
				end, v2 * 1000)
			end
			return CurrentUserItem
		end,
		getQuotaSummarySignals = function()
			-- upvalues: DataCacheModule (copy)
			return (DataCacheModule.getItem("current-user"))
		end,
		refreshQuotaSummary = function()
			-- upvalues: DataCacheModule (copy), v1 (ref), PromiseModule (upval)
			local DataResult = DataCacheModule.getItem("current-user").data(false)
			local V19 = v1 or (DataResult or {
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
			DataCacheModule.replaceItem("current-user", V19)
			
			return PromiseModule.resolve(V19)
		end,
		getDailyLimit = function()
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
		getDailyLimitSignals = function()
			-- upvalues: DataCacheModule1 (copy)
			return (DataCacheModule1.getItem("current-user"))
		end,
		refreshDailyLimit = function()
			-- upvalues: DataCacheModule1 (copy), PromiseModule (upval)
			local DataResult = DataCacheModule1.getItem("current-user").data(false) or {
				additionalUsageEnabled = false,
				dailyLimitSet = true,
				dailyLimit = 100
			}
			DataCacheModule1.replaceItem("current-user", DataResult)
			
			return PromiseModule.resolve(DataResult)
		end,
		setDailyLimit = function(p2)
			-- upvalues: DataCacheModule1 (copy), FFlagBuildExperienceModelPickerData (upval), t (copy), refreshTierQuotaSummary (copy), PromiseModule (upval)
			DataCacheModule1.replaceItem("current-user", p2)
			
			if FFlagBuildExperienceModelPickerData then
				for _, value in t do
					value.cache.clear()
					
					if value.requested then
						refreshTierQuotaSummary(value.product, value.tier)
					end
				end
			end
			return PromiseModule.resolve(p2)
		end,
		clear = function()
			-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy), FFlagBuildExperienceModelPickerData (upval), t (copy)
			DataCacheModule.clear()
			DataCacheModule1.clear()
			
			if FFlagBuildExperienceModelPickerData then
				for _, value in t do
					value.cache.clear()
					value.quota = nil
					value.error = nil
				end
			end
		end,
		dispose = function()
			-- upvalues: FFlagBuildExperienceModelPickerData (upval), Flag (ref), DataCacheModule (copy), DataCacheModule1 (copy), t (copy)
			if FFlagBuildExperienceModelPickerData then
				if Flag then return end
				Flag = true
			end
			DataCacheModule.dispose()
			DataCacheModule1.dispose()
			
			if FFlagBuildExperienceModelPickerData then
				for _, value in t do
					value.cache.dispose()
				end
			end
		end,
		_setQuota = function(p3)
			-- upvalues: DataCacheModule (copy)
			DataCacheModule.replaceItem("current-user", p3)
		end,
		_setDailyLimit = function(p3)
			-- upvalues: DataCacheModule1 (copy)
			DataCacheModule1.replaceItem("current-user", p3)
		end,
		_setError = function()
			-- upvalues: DataCacheModule (copy)
			DataCacheModule.markItemsAsFailed({ "current-user" })
		end,
		_setLoading = function()
			-- upvalues: DataCacheModule (copy)
			DataCacheModule.clear()
		end,
		_setAutoPopulate = function(p3, p4)
			-- upvalues: v1 (ref), v2 (ref)
			v1 = p3 or {
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
			v2 = p4 or 0
		end
	}
	
	if FFlagBuildExperienceModelPickerData then
		function config.getTierQuotaSummary(Product, Tier)
			-- upvalues: getTierEntry (copy), refreshTierQuotaSummary (copy)
			local TierEntry = getTierEntry(Product, Tier)
			TierEntry.requested = true
			local CurrentUserItem, CurrentUserItem2 = TierEntry.cache.getItem("current-user")
			
			if CurrentUserItem2 and TierEntry.quota then
				refreshTierQuotaSummary(Product, Tier)
			end
			return CurrentUserItem
		end
		
		function config.getTierQuotaSummarySignals(Product, Tier)
			-- upvalues: getTierEntry (copy)
			return getTierEntry(Product, Tier).cache.getItem("current-user")
		end
		
		config.refreshTierQuotaSummary = refreshTierQuotaSummary
		config._setTierQuota = setTierQuota
		
		function config._setTierError(Product, Tier, p3)
			-- upvalues: getTierEntry (copy)
			local TierEntry = getTierEntry(Product, Tier)
			TierEntry.error = p3 or { errorMessage = "Mock tier quota failed" }
			TierEntry.cache.getItem("current-user")
			TierEntry.cache.markItemsAsFailed({ "current-user" })
		end
		
		function config._setTierLoading(Product, Tier)
			-- upvalues: getTierEntry (copy)
			local TierEntry = getTierEntry(Product, Tier)
			TierEntry.cache.clear()
			TierEntry.quota = nil
			TierEntry.error = nil
		end
		
		function config._setTierRefreshQuota(Product, Tier, Quota)
			-- upvalues: getTierEntry (copy)
			local TierEntry = getTierEntry(Product, Tier)
			TierEntry.quota = Quota
			TierEntry.error = nil
		end
	end
	return config
end