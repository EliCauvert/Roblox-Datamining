local IXPService = game:GetService("IXPService")
local Parent = script.Parent.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local UseUserExperimentFunction = RoactAppExperimentModule.useUserExperiment
local ExperimentCacheManager = require(Parent.ExperimentCacheManager).ExperimentCacheManager
local FFlagAXLegacyIXPExposureLogging = require(Parent.SharedFlags).FFlagAXLegacyIXPExposureLogging
local AxIxp = require(Parent.AppDebug).LogTree.logger("ax.ixp")
local NOVALUE = require(Parent.AppCommonLib).Symbol.named("NO_VALUE")
local IXPService1 = IXPService
local ConnectUserLayerFunction = RoactAppExperimentModule.connectUserLayer
local Default = ExperimentCacheManager.default

local function readLayerVariablesForTest(IxpTest)
	-- upvalues: IXPService1 (ref), Default (ref)
	IxpTest.usedExperimentCacheManager = IxpTest.usedExperimentCacheManager or IXPService1:GetUserStatusForLayer(IxpTest.layer) ~= Enum.IXPLoadingStatus.Initialized
	
	return (if IxpTest.usedExperimentCacheManager then Default:getLayerVariables(IxpTest.layer) else IXPService1:GetUserLayerVariables(IxpTest.layer)) or {}
end

local function mapTestVariable(IxpTest, p1)
	-- upvalues: readLayerVariablesForTest (copy), AxIxp (copy)
	local IxpTest1 = IxpTest.ixpTest
	
	if not p1 then
		p1 = readLayerVariablesForTest(IxpTest1)
	end
	local MapLayerToValueResult = IxpTest.mapLayerToValue(p1, IxpTest1.isEnabledForAll())
	
	if MapLayerToValueResult ~= IxpTest.lastValue then
		AxIxp:info("[Read IXP Variable] {} {} = {}", IxpTest1.name, IxpTest.name, MapLayerToValueResult)
		IxpTest.lastValue = MapLayerToValueResult
	end
	return MapLayerToValueResult
end

local function _(IxpTest, p1)
	return if IxpTest.usedExperimentCacheManager then nil else p1[IxpTest.layer]
end

local function doConnectTestVariables(p1, KeysResult, p2)
	-- upvalues: ConnectUserLayerFunction (ref), mapTestVariable (copy)
	return ConnectUserLayerFunction(KeysResult, function(p3)
		-- upvalues: p1 (copy), mapTestVariable (upval)
		local t = {}
		
		for i, value in p1 do
			local IxpTest = value.ixpTest
			
			if IxpTest.isEnabled() then
				t[i] = mapTestVariable(value, if IxpTest.usedExperimentCacheManager then nil else p3[IxpTest.layer])
			end
		end
		return t
	end, p2)
end

local _ = function(p3, p4)
	-- upvalues: mapTestVariable (copy)
	local IxpTest = p3.ixpTest
	
	return if IxpTest.isEnabled() then mapTestVariable(p3, if p4 then p4[IxpTest.layer] else nil) else nil
end

local IXPUtils = {
	defineIXPTest = function(IxpTest)
		-- upvalues: FFlagAXLegacyIXPExposureLogging (copy), AxIxp (copy), NOVALUE (copy)
		local IxpTest1 = {
			name = IxpTest.name,
			layer = IxpTest.layer,
			recordExposure = if IxpTest.recordExposure then IxpTest.recordExposure else false,
			logExposureEnabled = if FFlagAXLegacyIXPExposureLogging then IxpTest.logExposureEnabled else nil,
			getIsUserInExperiment = IxpTest.getIsUserInExperiment,
			isEnabled = function()
				-- upvalues: IxpTest (copy)
				return IxpTest.getDependentFlagsEnabled() and (IxpTest.getEnabledFlag() or IxpTest.getEnabledForAllFlag())
			end,
			isEnabledForAll = function()
				-- upvalues: IxpTest (copy)
				return IxpTest.getDependentFlagsEnabled() and IxpTest.getEnabledForAllFlag()
			end
		}
		AxIxp:info("[Define IXP Test] {}, layer: {}, isEnabled: {}, isEnabledForAll: {}", IxpTest1.name, IxpTest1.layer, IxpTest1.isEnabled(), IxpTest1.isEnabledForAll())
		
		for Name, variable in IxpTest.variables do
			IxpTest1[Name] = {
				name = Name,
				ixpTest = IxpTest1,
				mapLayerToValue = variable,
				lastValue = NOVALUE
			}
		end
		return IxpTest1
	end,
	connectTestVariables = function(List)
		-- upvalues: DashModule (copy), doConnectTestVariables (copy)
		local t = {}
		local t1 = {}
		local t2 = {}
		local t3 = {}
		
		for i, value in List do
			local IxpTest = value.ixpTest
			
			if IxpTest.recordExposure then
				t1[IxpTest.layer] = true
				t3[i] = value
			else
				t[IxpTest.layer] = true
				t2[i] = value
			end
		end
		local List1 = {}
		local KeysResult = DashModule.keys(t)
		
		if #KeysResult > 0 then
			table.sort(KeysResult)
			table.insert(List1, doConnectTestVariables(t2, KeysResult, false))
		end
		local KeysResult1 = DashModule.keys(t1)
		
		if #KeysResult1 > 0 then
			table.sort(KeysResult1)
			table.insert(List1, doConnectTestVariables(t3, KeysResult1, true))
		end
		return DashModule.pipe(table.unpack(List1))
	end,
	useTestVariables = function(...)
		-- upvalues: ArgCheckModule (copy), UseUserExperimentFunction (copy), mapTestVariable (copy)
		local list = { ... }
		local IxpTest = nil
		
		for _, value in list do
			if IxpTest then
				ArgCheckModule.assert(value.ixpTest == IxpTest, "All test variables passed to IXPUtils.useTestVariables must belong to same IXP test.")
			else
				IxpTest = value.ixpTest
			end
		end
		return UseUserExperimentFunction({ IxpTest.layer }, function(p3)
			-- upvalues: IxpTest (ref), list (copy), mapTestVariable (upval)
			local IxpTest1 = IxpTest
			local v1 = if IxpTest1.usedExperimentCacheManager then nil else p3[IxpTest1.layer]
			local t = {}
			
			for i, value in list do
				if IxpTest.isEnabled() then
					t[i] = mapTestVariable(value, v1)
				end
			end
			return table.unpack(t)
		end, IxpTest.recordExposure)
	end,
	readTestVariable = function(IxpTest)
		-- upvalues: readLayerVariablesForTest (copy), AxIxp (copy)
		if not IxpTest.ixpTest.isEnabled() then
			return nil
		end
		local v1 = nil
		local IxpTest1 = IxpTest.ixpTest
		
		if not v1 then
			v1 = readLayerVariablesForTest(IxpTest1)
		end
		local MapLayerToValueResult = IxpTest.mapLayerToValue(v1, IxpTest1.isEnabledForAll())
		
		if MapLayerToValueResult ~= IxpTest.lastValue then
			AxIxp:info("[Read IXP Variable] {} {} = {}", IxpTest1.name, IxpTest.name, MapLayerToValueResult)
			IxpTest.lastValue = MapLayerToValueResult
		end
		return MapLayerToValueResult
	end,
	getFromLayers = function(p3, p4)
		-- upvalues: mapTestVariable (copy)
		local IxpTest = p4.ixpTest
		
		return if IxpTest.isEnabled() then mapTestVariable(p4, if p3 then p3[IxpTest.layer] else nil) else nil
	end,
	logExposure = function(p3)
		-- upvalues: AxIxp (copy), IXPService1 (ref)
		AxIxp:debug("LogUserLayerExposure: {}", p3.layer)
		IXPService1:LogUserLayerExposure(p3.layer)
	end,
	logLayerExposure = function(LayerName)
		-- upvalues: AxIxp (copy), IXPService1 (ref)
		AxIxp:debug("LogLayerExposure: {}", LayerName)
		IXPService1:LogUserLayerExposure(LayerName)
	end,
	logExperimentExposure = function(IxpTest): boolean
		-- upvalues: AxIxp (copy), readLayerVariablesForTest (copy), IXPService1 (ref)
		AxIxp:debug("LogExperimentExposure: {}", IxpTest.layer)
		
		if IxpTest.isEnabled() and IxpTest.getIsUserInExperiment and IxpTest.getIsUserInExperiment((readLayerVariablesForTest(IxpTest))) then
			IXPService1:LogUserLayerExposure(IxpTest.layer)
			
			return true
		else
			return false
		end
	end
}

function IXPUtils.useLogExposureOnce(p3)
	-- upvalues: ReactModule (copy), IXPUtils (copy)
	local UseRefResult = ReactModule.useRef(false)
	
	return ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), IXPUtils (upval), p3 (copy)
		if not UseRefResult.current then
			IXPUtils.logExposure(p3)
			UseRefResult.current = true
		end
	end, { p3.layer })
end

function IXPUtils.setMocksForTesting(p3, p4, p5)
	-- upvalues: IXPService1 (ref), ConnectUserLayerFunction (ref), Default (ref)
	IXPService1 = p3 or IXPService1
	ConnectUserLayerFunction = p4 or ConnectUserLayerFunction
	Default = p5 or Default
end

function IXPUtils.restoreDefaultsAfterTesting()
	-- upvalues: IXPService1 (ref), IXPService (copy), ConnectUserLayerFunction (ref), RoactAppExperimentModule (copy), Default (ref), ExperimentCacheManager (copy)
	IXPService1 = IXPService
	ConnectUserLayerFunction = RoactAppExperimentModule.connectUserLayer
	Default = ExperimentCacheManager.default
end

return IXPUtils