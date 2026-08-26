local IXPService = game:GetService("IXPService")
local parent = script.Parent.Parent
local argCheckModule = require(parent.ArgCheck)
local symbol = require(parent.AppCommonLib).Symbol
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local roactAppExperimentModule = require(parent.RoactAppExperiment)
local useUserExperiment = roactAppExperimentModule.useUserExperiment
local experimentCacheManager = require(parent.ExperimentCacheManager).ExperimentCacheManager
local fFlagAXLegacyIXPExposureLogging = require(parent.SharedFlags).FFlagAXLegacyIXPExposureLogging
local var1 = require(parent.AppDebug).LogTree.logger("ax.ixp")
local nOVALUE = symbol.named("NO_VALUE")
local var2 = IXPService
local connectUserLayer = roactAppExperimentModule.connectUserLayer
local default = experimentCacheManager.default
local t = {
	defineIXPTest = function(p1)
		-- upvalues: fFlagAXLegacyIXPExposureLogging (ref), var1 (ref), nOVALUE (ref)
		local t = {
			name = p1.name,
			layer = p1.layer,
			recordExposure = if p1.recordExposure then p1.recordExposure else false,
			logExposureEnabled = if fFlagAXLegacyIXPExposureLogging then p1.logExposureEnabled else nil,
			getIsUserInExperiment = p1.getIsUserInExperiment,
			isEnabled = function()
				-- upvalues: p1 (ref)
				return p1.getDependentFlagsEnabled() and (p1.getEnabledFlag() or p1.getEnabledForAllFlag())
			end,
			isEnabledForAll = function()
				-- upvalues: p1 (ref)
				return p1.getDependentFlagsEnabled() and p1.getEnabledForAllFlag()
			end
		}
		var1:info("[Define IXP Test] {}, layer: {}, isEnabled: {}, isEnabledForAll: {}", t.name, t.layer, t.isEnabled(), t.isEnabledForAll())
		
		for i, v in p1.variables do
			t[i] = {
				name = i,
				ixpTest = t,
				mapLayerToValue = v,
				lastValue = nOVALUE
			}
		end
		return t
	end
}

local function readLayerVariablesForTest(p2)
	-- upvalues: var2 (write), default (write)
	p2.usedExperimentCacheManager = p2.usedExperimentCacheManager or var2:GetUserStatusForLayer(p2.layer) ~= Enum.IXPLoadingStatus.Initialized
	
	return (if p2.usedExperimentCacheManager then default:getLayerVariables(p2.layer) else var2:GetUserLayerVariables(p2.layer)) or {}
end

local function mapTestVariable(p2, p3)
	-- upvalues: readLayerVariablesForTest (ref), var1 (ref)
	local ixpTest = p2.ixpTest
	
	if not p3 then
		p3 = readLayerVariablesForTest(ixpTest)
	end
	local var3 = p2.mapLayerToValue(p3, ixpTest.isEnabledForAll())
	
	if var3 ~= p2.lastValue then
		var1:info("[Read IXP Variable] {} {} = {}", ixpTest.name, p2.name, var3)
		p2.lastValue = var3
	end
	return var3
end

local function _(p2, p3)
	return if p2.usedExperimentCacheManager then nil else p3[p2.layer]
end

local function doConnectTestVariables(p2, p3, p4)
	-- upvalues: connectUserLayer (write), mapTestVariable (ref)
	return connectUserLayer(p3, function(p5)
		-- upvalues: p2 (ref), mapTestVariable (copy)
		local t = {}
		
		for i, v in p2 do
			local ixpTest = v.ixpTest
			
			if ixpTest.isEnabled() then
				t[i] = mapTestVariable(v, if ixpTest.usedExperimentCacheManager then nil else p5[ixpTest.layer])
			end
		end
		return t
	end, p4)
end

function t.connectTestVariables(p5)
	-- upvalues: dashModule (ref), doConnectTestVariables (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i, v in p5 do
		local ixpTest = v.ixpTest
		
		if ixpTest.recordExposure then
			t_1[ixpTest.layer] = true
			t_3[i] = v
		else
			t[ixpTest.layer] = true
			t_2[i] = v
		end
	end
	local t_4 = {}
	local var3 = dashModule.keys(t)
	
	if #var3 > 0 then
		table.sort(var3)
		table.insert(t_4, doConnectTestVariables(t_2, var3, false))
	end
	local var4 = dashModule.keys(t_1)
	
	if #var4 > 0 then
		table.sort(var4)
		table.insert(t_4, doConnectTestVariables(t_3, var4, true))
	end
	return dashModule.pipe(table.unpack(t_4))
end

function t.useTestVariables(...)
	-- upvalues: argCheckModule (ref), useUserExperiment (ref), mapTestVariable (ref)
	local list = { ... }
	local ixpTest = nil
	
	for i, v in list do
		if ixpTest then
			argCheckModule.assert(v.ixpTest == ixpTest, "All test variables passed to IXPUtils.useTestVariables must belong to same IXP test.")
		else
			ixpTest = v.ixpTest
		end
	end
	return useUserExperiment({ ixpTest.layer }, function(p6)
		-- upvalues: ixpTest (write), list (ref), mapTestVariable (copy)
		local var5 = if ixpTest.usedExperimentCacheManager then nil else p6[ixpTest.layer]
		local t = {}
		
		for i, v in list do
			if ixpTest.isEnabled() then
				t[i] = mapTestVariable(v, var5)
			end
		end
		return table.unpack(t)
	end, ixpTest.recordExposure)
end

local _ = function(p6, p7)
	-- upvalues: mapTestVariable (ref)
	local ixpTest = p6.ixpTest
	
	return if ixpTest.isEnabled() then mapTestVariable(p6, if p7 then p7[ixpTest.layer] else nil) else nil
end

function t.readTestVariable(p6)
	-- upvalues: readLayerVariablesForTest (ref), var1 (ref)
	if not p6.ixpTest.isEnabled() then
		return nil
	end
	local _ = nil
	local ixpTest = p6.ixpTest
	local _ = readLayerVariablesForTest(ixpTest)
	local var5 = p6.mapLayerToValue(u531, ixpTest.isEnabledForAll())
	
	if var5 ~= p6.lastValue then
		var1:info("[Read IXP Variable] {} {} = {}", ixpTest.name, p6.name, var5)
		p6.lastValue = var5
	end
	return var5
end

function t.getFromLayers(p6, p7)
	-- upvalues: mapTestVariable (ref)
	local ixpTest = p7.ixpTest
	
	return if ixpTest.isEnabled() then mapTestVariable(p7, if p6 then p6[ixpTest.layer] else nil) else nil
end

function t.logExposure(p6)
	-- upvalues: var1 (ref), var2 (write)
	var1:debug("LogUserLayerExposure: {}", p6.layer)
	var2:LogUserLayerExposure(p6.layer)
end

function t.logLayerExposure(p6)
	-- upvalues: var1 (ref), var2 (write)
	var1:debug("LogLayerExposure: {}", p6)
	var2:LogUserLayerExposure(p6)
end

function t.logExperimentExposure(p6)
	-- upvalues: var1 (ref), readLayerVariablesForTest (ref), var2 (write)
	var1:debug("LogExperimentExposure: {}", p6.layer)
	
	if p6.isEnabled() and p6.getIsUserInExperiment and p6.getIsUserInExperiment(readLayerVariablesForTest(p6)) then
		var2:LogUserLayerExposure(p6.layer)
		
		return true
	end
	return false
end

function t.useLogExposureOnce(p6)
	-- upvalues: reactModule (ref), t (ref)
	local var5 = reactModule.useRef(false)
	
	return reactModule.useCallback(function()
		-- upvalues: var5 (ref), t (copy), p6 (ref)
		if not var5.current then
			t.logExposure(p6)
			var5.current = true
		end
	end, { p6.layer })
end

function t.setMocksForTesting(value, p6, p7)
	-- upvalues: var2 (write), connectUserLayer (write), default (write)
	var2 = value or var2
	connectUserLayer = p6 or connectUserLayer
	default = p7 or default
end

function t.restoreDefaultsAfterTesting()
	-- upvalues: var2 (write), IXPService (ref), connectUserLayer (write), roactAppExperimentModule (ref), default (write), experimentCacheManager (ref)
	var2 = IXPService
	connectUserLayer = roactAppExperimentModule.connectUserLayer
	default = experimentCacheManager.default
end

return t