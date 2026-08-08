local _ = require(script.Parent.ErrorReport)
local _ = script:FindFirstAncestor("ErrorReporters").Parent
local t = {}
local sentryIncludeRolloutFlagsContext = game:DefineFastFlag("SentryIncludeRolloutFlagsContext", false)

local function _(value) --[[ line: 126 | named "toUnsignedInt" ]]
	if value == nil then
		return nil
	end
	local var6 = tonumber(value)
	
	return if var6 == nil then nil elseif var6 < 0 then 0 else math.floor(var6)
end

local function convertErrorStackToSentryFrame(p0) --[[ line: 186 ]]
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

function t.parseThreadsToSentry(value) --[[ line: 288 ]]
	-- upvalues: convertErrorStackToSentryFrame (ref)
	if not value then
		return nil
	end
	local t = {}
	local var9 = 1
	
	for i, v in pairs(value) do
		local t_1 = { id = var9, name = v.name or i }
		
		if i == "main" or v.name == "main" then
			t_1.main = true
		end
		if v.fault == true then
			t_1.crashed = true
		end
		if not v.stack or #v.stack <= 0 then
			table.insert(t, t_1)
			var9 += 1
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

local function parseAppContext(p1) --[[ line: 373 ]]
	-- upvalues: sentryIncludeRolloutFlagsContext (ref)
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
	if sentryIncludeRolloutFlagsContext then
		if attributes.RolloutFlagsInControl ~= nil then
			t.rollout_flags_in_control = attributes.RolloutFlagsInControl
		end
		if attributes.RolloutFlagsInVariant ~= nil then
			t.rollout_flags_in_variant = attributes.RolloutFlagsInVariant
		end
	end
	return t
end

local _ = function(p2) --[[ line: 448 | named "parseNetworkContext" ]]
	local t = {}
	
	if p2.attributes.networkType ~= nil then
		t.network_type = p2.attributes.networkType
	end
	return t
end

local _ = function(p3) --[[ line: 482 | named "parseOSContext" ]]
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

local function parseDeviceContext(p4) --[[ line: 553 ]]
	local t = {}
	local attributes = p4.attributes
	
	if attributes.deviceName ~= nil then
		t.name = attributes.deviceName
	end
	if attributes.batteryLevel ~= nil then
		local var17 = tonumber(attributes.batteryLevel)
		
		if var17 ~= nil then
			t.battery_level = var17
		end
	end
	if attributes.manufacturer ~= nil then
		t.manufacturer = attributes.manufacturer
	end
	if attributes.maxMemory ~= nil then
		local var18
		local maxMemory = attributes.maxMemory
		
		if maxMemory == nil then
			var18 = nil
		else
			local var19 = tonumber(maxMemory)
			var18 = if var19 == nil then nil elseif var19 < 0 then 0 else math.floor(var19)
		end
		if var18 ~= nil then
			t.memory_size = var18
		end
	end
	if attributes.availRAM ~= nil then
		local var20
		local availRAM = attributes.availRAM
		
		if availRAM == nil then
			var20 = nil
		else
			local var21 = tonumber(availRAM)
			var20 = if var21 == nil then nil elseif var21 < 0 then 0 else math.floor(var21)
		end
		if var20 ~= nil then
			t.free_memory = var20
		end
	end
	if attributes.maxResolution ~= nil then
		t.screen_resolution = attributes.maxResolution
	end
	if attributes.thermalStatus ~= nil then
		t.thermal_status = attributes.thermalStatus
	end
	if attributes.cpuLogicalCount ~= nil then
		local var22
		local cpuLogicalCount = attributes.cpuLogicalCount
		
		if cpuLogicalCount == nil then
			var22 = nil
		else
			local var23 = tonumber(cpuLogicalCount)
			var22 = if var23 == nil then nil elseif var23 < 0 then 0 else math.floor(var23)
		end
		if var22 ~= nil then
			t.processor_count = var22
		end
	end
	if attributes.cpuCoreCount ~= nil then
		local var24
		local cpuCoreCount = attributes.cpuCoreCount
		
		if cpuCoreCount == nil then
			var24 = nil
		else
			local var25 = tonumber(cpuCoreCount)
			var24 = if var25 == nil then nil elseif var25 < 0 then 0 else math.floor(var25)
		end
		if var24 ~= nil then
			t.cpu_core_count = var24
		end
	end
	if attributes.cpuMake ~= nil then
		t.cpu_description = attributes.cpuMake
	end
	if attributes.cpuPhysCount ~= nil then
		local var26
		local cpuPhysCount = attributes.cpuPhysCount
		
		if cpuPhysCount == nil then
			var26 = nil
		else
			local var27 = tonumber(cpuPhysCount)
			var26 = if var27 == nil then nil elseif var27 < 0 then 0 else math.floor(var27)
		end
		if var26 ~= nil then
			t.cpu_physical_count = var26
		end
	end
	if attributes.cpuSpeed ~= nil then
		local var28
		local cpuSpeed = attributes.cpuSpeed
		
		if cpuSpeed == nil then
			var28 = nil
		else
			local var29 = tonumber(cpuSpeed)
			var28 = if var29 == nil then nil elseif var29 < 0 then 0 else math.floor(var29)
		end
		if var28 ~= nil then
			t.cpu_speed = var28
		end
	end
	return t
end

local function parseCustomMetadataContexts(p5) --[[ line: 640 ]]
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

function t.parseErrorToContext(p6) --[[ line: 704 ]]
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