local _ = require(script.Parent.ErrorReport)
local _ = script:FindFirstAncestor("ErrorReporters").Parent
local t = {}

local function _(value) --[[ line: 124 | named "toUnsignedInt" ]]
	if value == nil then
		return nil
	end
	local var5 = tonumber(value)
	
	return if var5 == nil then nil elseif var5 < 0 then 0 else math.floor(var5)
end

local function convertErrorStackToSentryFrame(p0) --[[ line: 184 ]]
	local t = { lineno = tonumber(p0.line) or 0 }
	
	if p0.funcName then
		t["function"] = p0.funcName
	end
	if p0.sourceCode then
		t.filename = p0.sourceCode
		t.abs_path = p0.sourceCode
	end
	if p0.column then
		t.colno = tonumber(p0.column)
	end
	if p0.library then
		t.module = p0.library
	end
	if p0.address then
		t.instruction_addr = p0.address
	end
	if p0.guessed_frame == false then
		t.in_app = true
	end
	return t
end

function t.parseThreadsToSentry(value) --[[ line: 286 ]]
	-- upvalues: convertErrorStackToSentryFrame (ref)
	if not value then
		return nil
	end
	local t = {}
	local var8 = 1
	
	for i, v in pairs(value) do
		local t_1 = { id = var8, name = v.name or i }
		
		if i == "main" or v.name == "main" then
			t_1.main = true
		end
		if v.fault == true then
			t_1.crashed = true
		end
		if not v.stack or #v.stack <= 0 then
			table.insert(t, t_1)
			var8 += 1
			continue
		end
		local t_2 = {}
		
		for i_1, v_1 in ipairs(v.stack) do
			table.insert(t_2, convertErrorStackToSentryFrame(v_1))
		end
		local t_3 = {}
		
		for i_1 = #t_2, 1, -1 do
			table.insert(t_3, t_2[i_1])
		end
		t_1.stacktrace = { frames = t_3 }
	end
	return if #t == 0 then nil else { values = t }
end

local function parseAppContext(p1) --[[ line: 371 ]]
	local t = {}
	local attributes = p1.attributes
	
	if attributes.appVersion ~= nil then
		t.app_version = attributes.appVersion
	end
	if attributes.AppInstallationId ~= nil then
		t.device_app_hash = attributes.AppInstallationId
	end
	if attributes.CoreScriptVersion ~= nil then
		t.core_script_version = attributes.CoreScriptVersion
	end
	if attributes.RobloxChannel ~= nil then
		t.roblox_channel = attributes.RobloxChannel
	end
	if attributes.AppRunningTime ~= nil then
		t.app_running_time = attributes.AppRunningTime
	end
	if attributes.UserAgent ~= nil then
		t.user_agent = attributes.UserAgent
	end
	if attributes.BaseUrl ~= nil then
		t.base_url = attributes.BaseUrl
	end
	if attributes.WindowsLaunchType ~= nil then
		t.windows_launch_type = attributes.WindowsLaunchType
	end
	if attributes.CountryCode ~= nil then
		t.country_code = attributes.CountryCode
	end
	return t
end

local _ = function(p2) --[[ line: 436 | named "parseNetworkContext" ]]
	local t = {}
	
	if p2.attributes.networkType ~= nil then
		t.network_type = p2.attributes.networkType
	end
	return t
end

local _ = function(p3) --[[ line: 470 | named "parseOSContext" ]]
	local t = {}
	local attributes = p3.attributes
	
	if attributes.baseOs ~= nil then
		t.name = attributes.baseOs
	end
	if attributes.systemVersion ~= nil then
		t.version = attributes.systemVersion
	end
	if attributes.systemVersion ~= nil then
		t.version = attributes.systemVersion
	end
	return t
end

local function parseDeviceContext(p4) --[[ line: 541 ]]
	local t = {}
	local attributes = p4.attributes
	
	if attributes.deviceName ~= nil then
		t.name = attributes.deviceName
	end
	if attributes.batteryLevel ~= nil then
		local var16 = tonumber(attributes.batteryLevel)
		
		if var16 ~= nil then
			t.battery_level = var16
		end
	end
	if attributes.manufacturer ~= nil then
		t.manufacturer = attributes.manufacturer
	end
	if attributes.maxMemory ~= nil then
		local var17
		local maxMemory = attributes.maxMemory
		
		if maxMemory == nil then
			var17 = nil
		else
			local var18 = tonumber(maxMemory)
			var17 = if var18 == nil then nil elseif var18 < 0 then 0 else math.floor(var18)
		end
		if var17 ~= nil then
			t.memory_size = var17
		end
	end
	if attributes.availRAM ~= nil then
		local var19
		local availRAM = attributes.availRAM
		
		if availRAM == nil then
			var19 = nil
		else
			local var20 = tonumber(availRAM)
			var19 = if var20 == nil then nil elseif var20 < 0 then 0 else math.floor(var20)
		end
		if var19 ~= nil then
			t.free_memory = var19
		end
	end
	if attributes.maxResolution ~= nil then
		t.screen_resolution = attributes.maxResolution
	end
	if attributes.thermalStatus ~= nil then
		t.thermal_status = attributes.thermalStatus
	end
	if attributes.cpuLogicalCount ~= nil then
		local var21
		local cpuLogicalCount = attributes.cpuLogicalCount
		
		if cpuLogicalCount == nil then
			var21 = nil
		else
			local var22 = tonumber(cpuLogicalCount)
			var21 = if var22 == nil then nil elseif var22 < 0 then 0 else math.floor(var22)
		end
		if var21 ~= nil then
			t.processor_count = var21
		end
	end
	if attributes.cpuCoreCount ~= nil then
		local var23
		local cpuCoreCount = attributes.cpuCoreCount
		
		if cpuCoreCount == nil then
			var23 = nil
		else
			local var24 = tonumber(cpuCoreCount)
			var23 = if var24 == nil then nil elseif var24 < 0 then 0 else math.floor(var24)
		end
		if var23 ~= nil then
			t.cpu_core_count = var23
		end
	end
	if attributes.cpuMake ~= nil then
		t.cpu_description = attributes.cpuMake
	end
	if attributes.cpuPhysCount ~= nil then
		local var25
		local cpuPhysCount = attributes.cpuPhysCount
		
		if cpuPhysCount == nil then
			var25 = nil
		else
			local var26 = tonumber(cpuPhysCount)
			var25 = if var26 == nil then nil elseif var26 < 0 then 0 else math.floor(var26)
		end
		if var25 ~= nil then
			t.cpu_physical_count = var25
		end
	end
	if attributes.cpuSpeed ~= nil then
		local var27
		local cpuSpeed = attributes.cpuSpeed
		
		if cpuSpeed == nil then
			var27 = nil
		else
			local var28 = tonumber(cpuSpeed)
			var27 = if var28 == nil then nil elseif var28 < 0 then 0 else math.floor(var28)
		end
		if var27 ~= nil then
			t.cpu_speed = var27
		end
	end
	return t
end

local function parseCustomMetadataContexts(p5) --[[ line: 628 ]]
	local t = {}
	local customMetadata = p5.customMetadata
	
	if type(customMetadata) ~= "table" then
		return t
	end
	for i, v in customMetadata do
		if type(v) == "table" and next(v) ~= nil then
			t[i] = v
		end
	end
	return t
end

function t.parseErrorToContext(p6) --[[ line: 692 ]]
	-- upvalues: parseAppContext (ref), parseDeviceContext (ref), parseCustomMetadataContexts (ref)
	local t = { app = parseAppContext(p6) }
	local t_1 = {}
	
	if p6.attributes.networkType ~= nil then
		t_1.network_type = p6.attributes.networkType
	end
	t.network = t_1
	local t_2 = {}
	local attributes = p6.attributes
	
	if attributes.baseOs ~= nil then
		t_2.name = attributes.baseOs
	end
	if attributes.systemVersion ~= nil then
		t_2.version = attributes.systemVersion
	end
	if attributes.systemVersion ~= nil then
		t_2.version = attributes.systemVersion
	end
	t.os = t_2
	t.device = parseDeviceContext(p6)
	
	for i, v in parseCustomMetadataContexts(p6) do
		t[i] = v
	end
	return t
end

return t