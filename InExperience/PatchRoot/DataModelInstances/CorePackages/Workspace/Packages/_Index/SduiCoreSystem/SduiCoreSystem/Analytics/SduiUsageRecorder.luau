local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local sduiUsageAnalyticsModule = require(sduiCoreSystem.Analytics.SduiUsageAnalytics)
local fFlagSduiUsageTelemetry = require(sduiCoreSystem.Parent.SharedFlags).FFlagSduiUsageTelemetry
local discoverySduiTypeUsageHundredthsPercent = game:DefineFastInt("DiscoverySduiTypeUsageHundredthsPercent", 0)
local discoverySduiParamUsageHundredthsPercent = game:DefineFastInt("DiscoverySduiParamUsageHundredthsPercent", 0)
local var4 = false
local var5 = false

if fFlagSduiUsageTelemetry then
	var4 = math.random(10000) <= discoverySduiTypeUsageHundredthsPercent
	var5 = math.random(10000) <= discoverySduiParamUsageHundredthsPercent
end
local t = {}
local t_1 = {}

local function getOrCreateAccumulator(p0, p1) --[[ line: 73 ]]
	-- upvalues: t (write)
	local var19 = t[p0]
	
	if not var19 then
		var19 = {}
		t[p0] = var19
	end
	local var20 = var19[p1]
	
	if var20 then
		return var20
	end
	local t_1 = {
		hasRecorded = false,
		types = {},
		props = {},
		actionTypes = {},
		actionParams = {}
	}
	var19[p1] = t_1
	
	return t_1
end

local function getOrCreateGlobalSeen(p2, p3) --[[ line: 94 ]]
	-- upvalues: t_1 (write)
	local var22 = t_1[p2]
	
	if not var22 then
		var22 = {}
		t_1[p2] = var22
	end
	local var23 = var22[p3]
	
	if var23 then
		return var23
	end
	local t = {
		types = {},
		props = {},
		actionTypes = {},
		actionParams = {}
	}
	var22[p3] = t
	
	return t
end

local function deltaAndCommit(p4, p5) --[[ line: 115 ]]
	local t = {}
	
	for i, v in p4 do
		if not p5[i] then
			t[i] = true
			p5[i] = true
		end
	end
	return t
end

local function recordComponentType(p6, p7, p8) --[[ line: 126 ]]
	-- upvalues: var4 (write), getOrCreateAccumulator (ref)
	if not var4 or not p8 then return end
	local var26 = getOrCreateAccumulator(p6, p7)
	
	if not var26.types[p8] then
		var26.types[p8] = true
		var26.hasRecorded = true
	end
end

local function recordProp(p9, p10, p11, p12) --[[ line: 137 ]]
	-- upvalues: var5 (write), getOrCreateAccumulator (ref)
	if not var5 or not p11 or not p12 then return end
	local var27 = getOrCreateAccumulator(p9, p10)
	local var28 = `{p11}.{p12}`
	
	if not var27.props[var28] then
		var27.props[var28] = true
		var27.hasRecorded = true
	end
end

local function recordActionType(p13, p14, p15) --[[ line: 149 ]]
	-- upvalues: var4 (write), getOrCreateAccumulator (ref)
	if not var4 or not p15 then return end
	local var29 = getOrCreateAccumulator(p13, p14)
	
	if not var29.actionTypes[p15] then
		var29.actionTypes[p15] = true
		var29.hasRecorded = true
	end
end

local function recordActionParam(p16, p17, p18, p19) --[[ line: 160 ]]
	-- upvalues: var5 (write), getOrCreateAccumulator (ref)
	if not var5 or not p18 or not p19 then return end
	local var30 = getOrCreateAccumulator(p16, p17)
	local var31 = `{p18}.{p19}`
	
	if not var30.actionParams[var31] then
		var30.actionParams[var31] = true
		var30.hasRecorded = true
	end
end

local function flushPageVersion(p20, p21) --[[ line: 172 ]]
	-- upvalues: t (write), getOrCreateGlobalSeen (ref), deltaAndCommit (ref), sduiUsageAnalyticsModule (ref)
	local var32 = t[p20]
	local var33 = var32 and var32[p21]
	
	if not var33 or not var33.hasRecorded then return end
	local var34 = getOrCreateGlobalSeen(p20, p21)
	local var35 = deltaAndCommit(var33.types, var34.types)
	local var36 = deltaAndCommit(var33.props, var34.props)
	local var37 = deltaAndCommit(var33.actionTypes, var34.actionTypes)
	local var38 = deltaAndCommit(var33.actionParams, var34.actionParams)
	var32[p21] = nil
	
	if next(var32) == nil then
		t[p20] = nil
	end
	if next(var35) ~= nil or next(var37) ~= nil then
		sduiUsageAnalyticsModule.sendTypeUsageEvent({
			page = p20,
			version = p21,
			componentTypes = var35,
			actionTypes = var37
		})
	end
	if next(var36) ~= nil or next(var38) ~= nil then
		sduiUsageAnalyticsModule.sendParamUsageEvent({
			page = p20,
			version = p21,
			props = var36,
			actionParams = var38
		})
	end
end

local function flushAll() --[[ line: 211 ]]
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

local var17 = 1
local var18 = false

return {
	recordComponentType = recordComponentType,
	recordProp = recordProp,
	recordActionType = recordActionType,
	recordActionParam = recordActionParam,
	scheduleFlush = function() --[[ line: 228 ]]
		-- upvalues: var18 (write), var17 (write), flushAll (ref)
		if var18 then
			return
		end
		var18 = true
		task.delay(var17, function() --[[ line: 233 ]]
			-- upvalues: var18 (copy), flushAll (copy)
			var18 = false
			flushAll()
		end)
	end,
	isTypeSamplingEnabled = function() --[[ line: 239 ]]
		-- upvalues: var4 (write)
		return var4
	end,
	isParamSamplingEnabled = function() --[[ line: 243 ]]
		-- upvalues: var5 (write)
		return var5
	end,
	_flushAllForTesting = flushAll,
	_resetAllForTesting = function() --[[ line: 247 ]]
		-- upvalues: t (write), t_1 (write), var18 (write)
		t = {}
		t_1 = {}
		var18 = false
	end,
	_setSamplingForTesting = function(value, p22) --[[ line: 253 ]]
		-- upvalues: var4 (write), var5 (write)
		var4 = value
		var5 = p22
	end,
	_setFlushDelayForTesting = function(value) --[[ line: 258 ]]
		-- upvalues: var17 (write)
		var17 = value
	end
}