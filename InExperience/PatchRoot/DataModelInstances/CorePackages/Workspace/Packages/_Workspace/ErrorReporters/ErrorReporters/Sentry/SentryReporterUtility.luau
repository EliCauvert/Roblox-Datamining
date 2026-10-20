local _ = require(script.Parent.ErrorReport)
local _ = script:FindFirstAncestor("ErrorReporters").Parent
local SentryIncludeRolloutFlagsContext = game:DefineFastFlag("SentryIncludeRolloutFlagsContext", false)
local SentryIncludeIxpEnrolledExperimentsContext = game:DefineFastFlag("SentryIncludeIxpEnrolledExperimentsContext", false)

local function _(p1): boolean
	local ValueType = typeof(p1)
	
	return p1 == nil or ValueType == "string" or ValueType == "boolean" or ValueType == "number" and (p1 == p1 and (p1 ~= 1e999 and p1 ~= -1e999))
end

local _ = function(p1)
	if p1 == nil then
		return nil
	else
		local Number: number? = tonumber(p1)
		
		return if Number == nil then nil elseif Number < 0 then 0 else math.floor(Number)
	end
end

local function convertErrorStackToSentryFrame(p1)
	local config = { lineno = tonumber(p1.line) or 0 }
	
	if p1.funcName then
		config["function"] = p1.funcName
	end
	if p1.sourceCode then
		config.filename = p1.sourceCode
		config.abs_path = p1.sourceCode
	end
	if p1.column then
		config.colno = tonumber(p1.column)
	end
	if p1.library then
		config.module = p1.library
	end
	if p1.address then
		config.instruction_addr = p1.address
	end
	if p1.guessed_frame == false then
		config.in_app = true
	end
	return config
end

local SentryReporterUtilityModule = {
	safeGet = function(Attributes, p1)
		local Success, Result = pcall(function()
			-- upvalues: Attributes (copy), p1 (copy)
			return Attributes[p1]
		end)
		
		if Success then
			local ValueType = typeof(Result)
			local NoResult: boolean = Result == nil or ValueType == "string" or ValueType == "boolean" or ValueType == "number" and Result == Result and (Result ~= 1e999 and Result ~= -1e999)
			
			return if NoResult then Result else "json_incompatible"
		else
			return "unparsable"
		end
	end,
	parseThreadsToSentry = function(List)
		-- upvalues: convertErrorStackToSentryFrame (copy)
		if not List then
			return nil
		end
		local Values = {}
		local Id = 1
		
		for i, value in pairs(List) do
			local config = { id = Id, name = value.name or i }
			
			if i == "main" or value.name == "main" then
				config.main = true
			end
			if value.fault == true then
				config.crashed = true
			end
			if value.stack and #value.stack > 0 then
				local List1 = {}
				
				for _, value1 in ipairs(value.stack) do
					table.insert(List1, (convertErrorStackToSentryFrame(value1)))
				end
				local Frames = {}
				
				for i1 = #List1, 1, -1 do
					table.insert(Frames, List1[i1])
				end
				config.stacktrace = { frames = Frames }
			end
			table.insert(Values, config)
			Id += 1
		end
		return if #Values == 0 then nil else { values = Values }
	end
}

local function parseAppContext(p1)
	-- upvalues: SentryReporterUtilityModule (copy), SentryIncludeRolloutFlagsContext (copy), SentryIncludeIxpEnrolledExperimentsContext (copy)
	local t = {}
	local Attributes = p1.attributes
	local AppVersion = SentryReporterUtilityModule.safeGet(Attributes, "appVersion")
	
	if AppVersion ~= nil then
		t.app_version = AppVersion
	end
	local AppInstallationId = SentryReporterUtilityModule.safeGet(Attributes, "AppInstallationId")
	
	if AppInstallationId ~= nil then
		t.device_app_hash = AppInstallationId
	end
	local CoreScriptVersion = SentryReporterUtilityModule.safeGet(Attributes, "CoreScriptVersion")
	
	if CoreScriptVersion ~= nil then
		t.core_script_version = CoreScriptVersion
	end
	local RobloxChannel = SentryReporterUtilityModule.safeGet(Attributes, "RobloxChannel")
	
	if RobloxChannel ~= nil then
		t.roblox_channel = RobloxChannel
	end
	local AppRunningTime = SentryReporterUtilityModule.safeGet(Attributes, "AppRunningTime")
	
	if AppRunningTime ~= nil then
		t.app_running_time = AppRunningTime
	end
	local UserAgent = SentryReporterUtilityModule.safeGet(Attributes, "UserAgent")
	
	if UserAgent ~= nil then
		t.user_agent = UserAgent
	end
	local BaseUrl = SentryReporterUtilityModule.safeGet(Attributes, "BaseUrl")
	
	if BaseUrl ~= nil then
		t.base_url = BaseUrl
	end
	local WindowsLaunchType = SentryReporterUtilityModule.safeGet(Attributes, "WindowsLaunchType")
	
	if WindowsLaunchType ~= nil then
		t.windows_launch_type = WindowsLaunchType
	end
	local CountryCode = SentryReporterUtilityModule.safeGet(Attributes, "CountryCode")
	
	if CountryCode ~= nil then
		t.country_code = CountryCode
	end
	if SentryIncludeRolloutFlagsContext then
		local RolloutFlagsInControl = SentryReporterUtilityModule.safeGet(Attributes, "RolloutFlagsInControl")
		
		if RolloutFlagsInControl ~= nil then
			t.rollout_flags_in_control = RolloutFlagsInControl
		end
		local RolloutFlagsInVariant = SentryReporterUtilityModule.safeGet(Attributes, "RolloutFlagsInVariant")
		
		if RolloutFlagsInVariant ~= nil then
			t.rollout_flags_in_variant = RolloutFlagsInVariant
		end
	end
	if SentryIncludeIxpEnrolledExperimentsContext then
		local IxpEnrolledExperiments = SentryReporterUtilityModule.safeGet(Attributes, "IxpEnrolledExperiments")
		
		if IxpEnrolledExperiments ~= nil then
			t.ixp_enrolled_experiments = IxpEnrolledExperiments
		end
	end
	return t
end

local _ = function(p1)
	-- upvalues: SentryReporterUtilityModule (copy)
	local t = {}
	local NetworkType = SentryReporterUtilityModule.safeGet(p1.attributes, "networkType")
	
	if NetworkType ~= nil then
		t.network_type = NetworkType
	end
	return t
end

local function parseOSContext(p1)
	-- upvalues: SentryReporterUtilityModule (copy)
	local t = {}
	local Attributes = p1.attributes
	local BaseOs = SentryReporterUtilityModule.safeGet(Attributes, "baseOs")
	
	if BaseOs ~= nil then
		t.name = BaseOs
	end
	local SystemVersion = SentryReporterUtilityModule.safeGet(Attributes, "systemVersion")
	
	if SystemVersion ~= nil then
		t.version = SystemVersion
	end
	return t
end

local function parseDeviceContext(p1)
	-- upvalues: SentryReporterUtilityModule (copy)
	local t = {}
	local Attributes = p1.attributes
	local DeviceName = SentryReporterUtilityModule.safeGet(Attributes, "deviceName")
	
	if DeviceName ~= nil then
		t.name = DeviceName
	end
	local BatteryLevel = SentryReporterUtilityModule.safeGet(Attributes, "batteryLevel")
	
	if BatteryLevel ~= nil then
		local Number: number? = tonumber(BatteryLevel)
		
		if Number ~= nil then
			t.battery_level = Number
		end
	end
	local Manufacturer = SentryReporterUtilityModule.safeGet(Attributes, "manufacturer")
	
	if Manufacturer ~= nil then
		t.manufacturer = Manufacturer
	end
	local MaxMemory = SentryReporterUtilityModule.safeGet(Attributes, "maxMemory")
	
	if MaxMemory ~= nil then
		local Floored = nil
		if MaxMemory == nil then
			Floored = nil
		else
			local Number: number? = tonumber(MaxMemory)
			Floored = if Number == nil then nil elseif Number < 0 then 0 else math.floor(Number)
		end
		if Floored ~= nil then
			t.memory_size = Floored
		end
	end
	local AvailRAM = SentryReporterUtilityModule.safeGet(Attributes, "availRAM")
	
	if AvailRAM ~= nil then
		local Floored = nil
		if AvailRAM == nil then
			Floored = nil
		else
			local Number: number? = tonumber(AvailRAM)
			Floored = if Number == nil then nil elseif Number < 0 then 0 else math.floor(Number)
		end
		if Floored ~= nil then
			t.free_memory = Floored
		end
	end
	local MaxResolution = SentryReporterUtilityModule.safeGet(Attributes, "maxResolution")
	
	if MaxResolution ~= nil then
		t.screen_resolution = MaxResolution
	end
	local ThermalStatus = SentryReporterUtilityModule.safeGet(Attributes, "thermalStatus")
	
	if ThermalStatus ~= nil then
		t.thermal_status = ThermalStatus
	end
	local CpuLogicalCount = SentryReporterUtilityModule.safeGet(Attributes, "cpuLogicalCount")
	
	if CpuLogicalCount ~= nil then
		local Floored = nil
		if CpuLogicalCount == nil then
			Floored = nil
		else
			local Number: number? = tonumber(CpuLogicalCount)
			Floored = if Number == nil then nil elseif Number < 0 then 0 else math.floor(Number)
		end
		if Floored ~= nil then
			t.processor_count = Floored
		end
	end
	local CpuCoreCount = SentryReporterUtilityModule.safeGet(Attributes, "cpuCoreCount")
	
	if CpuCoreCount ~= nil then
		local Floored = nil
		if CpuCoreCount == nil then
			Floored = nil
		else
			local Number: number? = tonumber(CpuCoreCount)
			Floored = if Number == nil then nil elseif Number < 0 then 0 else math.floor(Number)
		end
		if Floored ~= nil then
			t.cpu_core_count = Floored
		end
	end
	local CpuMake = SentryReporterUtilityModule.safeGet(Attributes, "cpuMake")
	
	if CpuMake ~= nil then
		t.cpu_description = CpuMake
	end
	local CpuPhysCount = SentryReporterUtilityModule.safeGet(Attributes, "cpuPhysCount")
	
	if CpuPhysCount ~= nil then
		local Floored = nil
		if CpuPhysCount == nil then
			Floored = nil
		else
			local Number: number? = tonumber(CpuPhysCount)
			Floored = if Number == nil then nil elseif Number < 0 then 0 else math.floor(Number)
		end
		if Floored ~= nil then
			t.cpu_physical_count = Floored
		end
	end
	local CpuSpeed = SentryReporterUtilityModule.safeGet(Attributes, "cpuSpeed")
	
	if CpuSpeed ~= nil then
		local Floored1 = nil
		if CpuSpeed == nil then
			Floored1 = nil
		else
			local Number: number? = tonumber(CpuSpeed)
			Floored1 = if Number == nil then nil elseif Number < 0 then 0 else math.floor(Number)
		end
		if Floored1 ~= nil then
			t.cpu_speed = Floored1
		end
	end
	return t
end

local function parseCustomMetadataContexts(p1)
	local t = {}
	local CustomMetadata = p1.customMetadata
	
	if type(CustomMetadata) ~= "table" then
		return t
	end
	for i, value in CustomMetadata do
		if type(value) == "table" and next(value) ~= nil then
			t[i] = value
		end
	end
	return t
end

function SentryReporterUtilityModule.parseErrorToContext(p2)
	-- upvalues: parseAppContext (copy), SentryReporterUtilityModule (copy), parseOSContext (copy), parseDeviceContext (copy), parseCustomMetadataContexts (copy)
	local config = { app = parseAppContext(p2) }
	local Network = {}
	local NetworkType = SentryReporterUtilityModule.safeGet(p2.attributes, "networkType")
	
	if NetworkType ~= nil then
		Network.network_type = NetworkType
	end
	config.network = Network
	config.os = parseOSContext(p2)
	config.device = parseDeviceContext(p2)
	
	for i, value in parseCustomMetadataContexts(p2) do
		config[i] = value
	end
	return config
end

return SentryReporterUtilityModule