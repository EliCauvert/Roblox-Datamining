local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local sduiUsageAnalyticsModule = require(sduiCoreSystem.Analytics.SduiUsageAnalytics)
local fFlagSduiUsageTelemetry = require(sduiCoreSystem.Parent.SharedFlags).FFlagSduiUsageTelemetry
local discoverySduiTypeUsageHundredthsPercent = game:DefineFastInt("DiscoverySduiTypeUsageHundredthsPercent", 0)
local discoverySduiParamUsageHundredthsPercent = game:DefineFastInt("DiscoverySduiParamUsageHundredthsPercent", 0)
local var1 = false
local var2 = false

if fFlagSduiUsageTelemetry then
	var1 = math.random(10000) <= discoverySduiTypeUsageHundredthsPercent
	var2 = math.random(10000) <= discoverySduiParamUsageHundredthsPercent
end
local t = {}
local t_1 = {}

local function getOrCreateAccumulator(p1, p2)
	-- upvalues: t (write)
	local var3 = t[p1]
	
	if not var3 then
		var3 = {}
		t[p1] = var3
	end
	local var4 = var3[p2]
	
	if var4 then
		return var4
	end
	local t_1 = {
		hasRecorded = false,
		types = {},
		props = {},
		actionTypes = {},
		actionParams = {}
	}
	var3[p2] = t_1
	
	return t_1
end

local function getOrCreateGlobalSeen(p1, p2)
	-- upvalues: t_1 (write)
	local var3 = t_1[p1]
	
	if not var3 then
		var3 = {}
		t_1[p1] = var3
	end
	local var4 = var3[p2]
	
	if var4 then
		return var4
	end
	local t = {
		types = {},
		props = {},
		actionTypes = {},
		actionParams = {}
	}
	var3[p2] = t
	
	return t
end

local function deltaAndCommit(p1, p2)
	local t = {}
	
	for i, v in p1 do
		if not p2[i] then
			t[i] = true
			p2[i] = true
		end
	end
	return t
end

local function recordComponentType(p3, p4, p5)
	-- upvalues: var1 (write), getOrCreateAccumulator (ref)
	if not var1 or not p5 then return end
	local var3 = getOrCreateAccumulator(p3, p4)
	
	if not var3.types[p5] then
		var3.types[p5] = true
		var3.hasRecorded = true
	end
end

local function recordProp(p3, p4, p5, p6)
	-- upvalues: var2 (write), getOrCreateAccumulator (ref)
	if not var2 or not p5 or not p6 then return end
	local var3 = getOrCreateAccumulator(p3, p4)
	local var4 = `{p5}.{p6}`
	
	if not var3.props[var4] then
		var3.props[var4] = true
		var3.hasRecorded = true
	end
end

local function recordActionType(p3, p4, p5)
	-- upvalues: var1 (write), getOrCreateAccumulator (ref)
	if not var1 or not p5 then return end
	local var3 = getOrCreateAccumulator(p3, p4)
	
	if not var3.actionTypes[p5] then
		var3.actionTypes[p5] = true
		var3.hasRecorded = true
	end
end

local function recordActionParam(p3, p4, p5, p6)
	-- upvalues: var2 (write), getOrCreateAccumulator (ref)
	if not var2 or not p5 or not p6 then return end
	local var3 = getOrCreateAccumulator(p3, p4)
	local var4 = `{p5}.{p6}`
	
	if not var3.actionParams[var4] then
		var3.actionParams[var4] = true
		var3.hasRecorded = true
	end
end

local function flushPageVersion(p3, p4)
	-- upvalues: t (write), getOrCreateGlobalSeen (ref), deltaAndCommit (ref), sduiUsageAnalyticsModule (ref)
	local var3 = t[p3]
	local var4 = var3 and var3[p4]
	
	if not var4 or not var4.hasRecorded then return end
	local var5 = getOrCreateGlobalSeen(p3, p4)
	local var6 = deltaAndCommit(var4.types, var5.types)
	local var7 = deltaAndCommit(var4.props, var5.props)
	local var8 = deltaAndCommit(var4.actionTypes, var5.actionTypes)
	local var9 = deltaAndCommit(var4.actionParams, var5.actionParams)
	var3[p4] = nil
	
	if next(var3) == nil then
		t[p3] = nil
	end
	if next(var6) ~= nil or next(var8) ~= nil then
		sduiUsageAnalyticsModule.sendTypeUsageEvent({
			page = p3,
			version = p4,
			componentTypes = var6,
			actionTypes = var8
		})
	end
	if next(var7) ~= nil or next(var9) ~= nil then
		sduiUsageAnalyticsModule.sendParamUsageEvent({
			page = p3,
			version = p4,
			props = var7,
			actionParams = var9
		})
	end
end

local function flushAll()
	-- upvalues: t (write), flushPageVersion (ref)
	local t_1 = {}
	
	for i, v in t do
		for i_1, v_1 in v do
			table.insert(t_1, { page = i, version = i_1 })
		end
	end
	for i_1, v_1 in t_1 do
		flushPageVersion(v_1.page, v_1.version)
	end
end

local var3 = 1
local var4 = false

return {
	recordComponentType = recordComponentType,
	recordProp = recordProp,
	recordActionType = recordActionType,
	recordActionParam = recordActionParam,
	scheduleFlush = function()
		-- upvalues: var4 (write), var3 (write), flushAll (ref)
		if var4 then
			return
		end
		var4 = true
		task.delay(var3, function()
			-- upvalues: var4 (copy), flushAll (copy)
			var4 = false
			flushAll()
		end)
	end,
	isTypeSamplingEnabled = function()
		-- upvalues: var1 (write)
		return var1
	end,
	isParamSamplingEnabled = function()
		-- upvalues: var2 (write)
		return var2
	end,
	_flushAllForTesting = flushAll,
	_resetAllForTesting = function()
		-- upvalues: t (write), t_1 (write), var4 (write)
		t = {}
		t_1 = {}
		var4 = false
	end,
	_setSamplingForTesting = function(value, p3)
		-- upvalues: var1 (write), var2 (write)
		var1 = value
		var2 = p3
	end,
	_setFlushDelayForTesting = function(value)
		-- upvalues: var3 (write)
		var3 = value
	end
}