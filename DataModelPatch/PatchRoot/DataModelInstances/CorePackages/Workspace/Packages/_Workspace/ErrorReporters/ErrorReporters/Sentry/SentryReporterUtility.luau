local _ = require(script.Parent.ErrorReport)
local _ = script:FindFirstAncestor("ErrorReporters").Parent

local function _(p1)
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

local function parseAppContext(p1)
	local t = {}
	local Attributes = p1.attributes
	
	if Attributes.appVersion ~= nil then
		t.app_version = Attributes.appVersion
	end
	if Attributes.AppInstallationId ~= nil then
		t.device_app_hash = Attributes.AppInstallationId
	end
	if Attributes.CoreScriptVersion ~= nil then
		t.core_script_version = Attributes.CoreScriptVersion
	end
	if Attributes.RobloxChannel ~= nil then
		t.roblox_channel = Attributes.RobloxChannel
	end
	if Attributes.AppRunningTime ~= nil then
		t.app_running_time = Attributes.AppRunningTime
	end
	if Attributes.UserAgent ~= nil then
		t.user_agent = Attributes.UserAgent
	end
	if Attributes.BaseUrl ~= nil then
		t.base_url = Attributes.BaseUrl
	end
	if Attributes.WindowsLaunchType ~= nil then
		t.windows_launch_type = Attributes.WindowsLaunchType
	end
	if Attributes.CountryCode ~= nil then
		t.country_code = Attributes.CountryCode
	end
	return t
end

local _ = function(p1)
	local t = {}
	
	if p1.attributes.networkType ~= nil then
		t.network_type = p1.attributes.networkType
	end
	return t
end

local _ = function(p1)
	local t = {}
	local Attributes = p1.attributes
	
	if Attributes.baseOs ~= nil then
		t.name = Attributes.baseOs
	end
	if Attributes.systemVersion ~= nil then
		t.version = Attributes.systemVersion
	end
	if Attributes.systemVersion ~= nil then
		t.version = Attributes.systemVersion
	end
	return t
end

local function parseDeviceContext(p1)
	local t = {}
	local Attributes = p1.attributes
	
	if Attributes.deviceName ~= nil then
		t.name = Attributes.deviceName
	end
	if Attributes.batteryLevel ~= nil then
		local Number: number? = tonumber(Attributes.batteryLevel)
		
		if Number ~= nil then
			t.battery_level = Number
		end
	end
	if Attributes.manufacturer ~= nil then
		t.manufacturer = Attributes.manufacturer
	end
	if Attributes.maxMemory ~= nil then
		local MaxMemory = Attributes.maxMemory
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
	if Attributes.availRAM ~= nil then
		local AvailRAM = Attributes.availRAM
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
	if Attributes.maxResolution ~= nil then
		t.screen_resolution = Attributes.maxResolution
	end
	if Attributes.thermalStatus ~= nil then
		t.thermal_status = Attributes.thermalStatus
	end
	if Attributes.cpuLogicalCount ~= nil then
		local CpuLogicalCount = Attributes.cpuLogicalCount
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
	if Attributes.cpuCoreCount ~= nil then
		local CpuCoreCount = Attributes.cpuCoreCount
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
	if Attributes.cpuMake ~= nil then
		t.cpu_description = Attributes.cpuMake
	end
	if Attributes.cpuPhysCount ~= nil then
		local CpuPhysCount = Attributes.cpuPhysCount
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
	if Attributes.cpuSpeed ~= nil then
		local CpuSpeed = Attributes.cpuSpeed
		local Floored = nil
		
		if CpuSpeed == nil then
			Floored = nil
		else
			local Number: number? = tonumber(CpuSpeed)
			Floored = if Number == nil then nil elseif Number < 0 then 0 else math.floor(Number)
		end
		if Floored ~= nil then
			t.cpu_speed = Floored
		end
	end
	return t
end

return {
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
	end,
	parseErrorToContext = function(p1)
		-- upvalues: parseAppContext (copy), parseDeviceContext (copy)
		local config = { app = parseAppContext(p1) }
		local Network = {}
		
		if p1.attributes.networkType ~= nil then
			Network.network_type = p1.attributes.networkType
		end
		config.network = Network
		local t = {}
		local Attributes = p1.attributes
		
		if Attributes.baseOs ~= nil then
			t.name = Attributes.baseOs
		end
		if Attributes.systemVersion ~= nil then
			t.version = Attributes.systemVersion
		end
		if Attributes.systemVersion ~= nil then
			t.version = Attributes.systemVersion
		end
		config.os = t
		config.device = parseDeviceContext(p1)
		
		return config
	end
}