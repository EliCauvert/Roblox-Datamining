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
local var5 = require(parent.AppDebug).LogTree.logger("ax.ixp")
local nOVALUE = symbol.named("NO_VALUE")
local var7 = IXPService
local connectUserLayer = roactAppExperimentModule.connectUserLayer
local default = experimentCacheManager.default
local t = {
	defineIXPTest = function(p0)
		-- upvalues: fFlagAXLegacyIXPExposureLogging (ref), var5 (ref), nOVALUE (ref)
		local t = {
			name = p0.name,
			layer = p0.layer,
			recordExposure = if p0.recordExposure then p0.recordExposure else false,
			logExposureEnabled = if fFlagAXLegacyIXPExposureLogging then p0.logExposureEnabled else nil,
			getIsUserInExperiment = p0.getIsUserInExperiment,
			isEnabled = function()
				-- upvalues: p0 (ref)
				return p0.getDependentFlagsEnabled() and (p0.getEnabledFlag() or p0.getEnabledForAllFlag())
			end,
			isEnabledForAll = function()
				-- upvalues: p0 (ref)
				return p0.getDependentFlagsEnabled() and p0.getEnabledForAllFlag()
			end
		}
		var5:info("[Define IXP Test] {}, layer: {}, isEnabled: {}, isEnabledForAll: {}", t.name, t.layer, t.isEnabled(), t.isEnabledForAll())
		
		for i, v in p0.variables do
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

local function readLayerVariablesForTest(p1)
	-- upvalues: var7 (write), default (write)
	p1.usedExperimentCacheManager = p1.usedExperimentCacheManager or var7:GetUserStatusForLayer(p1.layer) ~= Enum.IXPLoadingStatus.Initialized
	
	return (if p1.usedExperimentCacheManager then default:getLayerVariables(p1.layer) else var7:GetUserLayerVariables(p1.layer)) or {}
end

local function mapTestVariable(p2, p3)
	-- upvalues: readLayerVariablesForTest (ref), var5 (ref)
	local ixpTest = p2.ixpTest
	
	if not p3 then
		p3 = readLayerVariablesForTest(ixpTest)
	end
	local var13 = p2.mapLayerToValue(p3, ixpTest.isEnabledForAll())
	
	if var13 ~= p2.lastValue then
		var5:info("[Read IXP Variable] {} {} = {}", ixpTest.name, p2.name, var13)
		p2.lastValue = var13
	end
	return var13
end

local function _(p4, p5)
	return if p4.usedExperimentCacheManager then nil else p5[p4.layer]
end

local function doConnectTestVariables(p6, p7, p8)
	-- upvalues: connectUserLayer (write), mapTestVariable (ref)
	return connectUserLayer(p7, function(p9)
		-- upvalues: p6 (ref), mapTestVariable (copy)
		local t = {}
		
		for i, v in p6 do
			local ixpTest = v.ixpTest
			
			if ixpTest.isEnabled() then
				t[i] = mapTestVariable(v, if ixpTest.usedExperimentCacheManager then nil else p9[ixpTest.layer])
			end
		end
		return t
	end, p8)
end

function t.connectTestVariables(p10)
	-- upvalues: dashModule (ref), doConnectTestVariables (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i, v in p10 do
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
	local var20 = dashModule.keys(t)
	
	if #var20 > 0 then
		table.sort(var20)
		table.insert(t_4, doConnectTestVariables(t_2, var20, false))
	end
	local var21 = dashModule.keys(t_1)
	
	if #var21 > 0 then
		table.sort(var21)
		table.insert(t_4, doConnectTestVariables(t_3, var21, true))
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
	return useUserExperiment({ ixpTest.layer }, function(p11)
		-- upvalues: ixpTest (write), list (ref), mapTestVariable (copy)
		local var23 = if ixpTest.usedExperimentCacheManager then nil else p11[ixpTest.layer]
		local t = {}
		
		for i, v in list do
			if ixpTest.isEnabled() then
				t[i] = mapTestVariable(v, var23)
			end
		end
		return table.unpack(t)
	end, ixpTest.recordExposure)
end

local _ = function(p12, p13)
	-- upvalues: mapTestVariable (ref)
	local ixpTest = p12.ixpTest
	
	return if ixpTest.isEnabled() then mapTestVariable(p12, if p13 then p13[ixpTest.layer] else nil) else nil
end

function t.readTestVariable(p14)
	-- upvalues: readLayerVariablesForTest (ref), var5 (ref)
	if not p14.ixpTest.isEnabled() then
		return nil
	end
	local _ = nil
	local ixpTest = p14.ixpTest
	local _ = readLayerVariablesForTest(ixpTest)
	local var25 = p14.mapLayerToValue(u531, ixpTest.isEnabledForAll())
	
	if var25 ~= p14.lastValue then
		var5:info("[Read IXP Variable] {} {} = {}", ixpTest.name, p14.name, var25)
		p14.lastValue = var25
	end
	return var25
end

function t.getFromLayers(p15, p16)
	-- upvalues: mapTestVariable (ref)
	local ixpTest = p16.ixpTest
	
	return if ixpTest.isEnabled() then mapTestVariable(p16, if p15 then p15[ixpTest.layer] else nil) else nil
end

function t.logExposure(p17)
	-- upvalues: var5 (ref), var7 (write)
	var5:debug("LogUserLayerExposure: {}", p17.layer)
	var7:LogUserLayerExposure(p17.layer)
end

function t.logLayerExposure(p18)
	-- upvalues: var5 (ref), var7 (write)
	var5:debug("LogLayerExposure: {}", p18)
	var7:LogUserLayerExposure(p18)
end

function t.logExperimentExposure(p19)
	-- upvalues: var5 (ref), readLayerVariablesForTest (ref), var7 (write)
	var5:debug("LogExperimentExposure: {}", p19.layer)
	
	if p19.isEnabled() and p19.getIsUserInExperiment and p19.getIsUserInExperiment(readLayerVariablesForTest(p19)) then
		var7:LogUserLayerExposure(p19.layer)
		
		return true
	end
	return false
end

function t.useLogExposureOnce(p20)
	-- upvalues: reactModule (ref), t (ref)
	local var26 = reactModule.useRef(false)
	
	return reactModule.useCallback(function()
		-- upvalues: var26 (ref), t (copy), p20 (ref)
		if not var26.current then
			t.logExposure(p20)
			var26.current = true
		end
	end, { p20.layer })
end

function t.setMocksForTesting(value, p21, p22)
	-- upvalues: var7 (write), connectUserLayer (write), default (write)
	var7 = value or var7
	connectUserLayer = p21 or connectUserLayer
	default = p22 or default
end

function t.restoreDefaultsAfterTesting()
	-- upvalues: var7 (write), IXPService (ref), connectUserLayer (write), roactAppExperimentModule (ref), default (write), experimentCacheManager (ref)
	var7 = IXPService
	connectUserLayer = roactAppExperimentModule.connectUserLayer
	default = experimentCacheManager.default
end

return t