local _ = require(script.Parent.ErrorReport)
local _ = script:FindFirstAncestor("ErrorReporters").Parent
local t = {
	safeGet = function(p0, p1) --[[ line: 160 ]]
		local ok, status = pcall(function() --[[ line: 161 ]]
			-- upvalues: p0 (ref), p1 (ref)
			return p0[p1]
		end)
		
		if not ok then
			return "unparsable"
		end
		local var8
		local var7 = typeof(status)
		
		if status == nil or var7 == "string" or var7 == "boolean" then
			var8 = true
		elseif var7 == "number" then
			var8 = false
			
			if status == status then
				var8 = false
				
				if status ~= 1e999 then
					local _ = status ~= -1e999
				end
			end
		else
			var8 = false
		end
		return if var8 then status else "json_incompatible"
	end
}
local sentryIncludeRolloutFlagsContext = game:DefineFastFlag("SentryIncludeRolloutFlagsContext", false)

local function _(p2) --[[ line: 126 | named "isJsonCompatible" ]]
	local var9 = typeof(p2)
	
	return p2 == nil or var9 == "string" or var9 == "boolean" or (var9 == "number" and (p2 == p2 and (p2 ~= 1e999 and p2 ~= -1e999)))
end

local _ = function(value) --[[ line: 192 | named "toUnsignedInt" ]]
	if value == nil then
		return nil
	end
	local var10 = tonumber(value)
	
	return if var10 == nil then nil elseif var10 < 0 then 0 else math.floor(var10)
end

local function convertErrorStackToSentryFrame(p3) --[[ line: 252 ]]
	local t = { lineno = tonumber(p3.line) or 0 }
	
	if p3.funcName then
		t["function"] = p3.funcName
	end
	if p3.sourceCode then
		t.filename = p3.sourceCode
		t.abs_path = p3.sourceCode
	end
	if p3.column then
		t.colno = tonumber(p3.column)
	end
	if p3.library then
		t.module = p3.library
	end
	if p3.address then
		t.instruction_addr = p3.address
	end
	if p3.guessed_frame == false then
		t.in_app = true
	end
	return t
end

function t.parseThreadsToSentry(value) --[[ line: 354 ]]
	-- upvalues: convertErrorStackToSentryFrame (ref)
	if not value then
		return nil
	end
	local t = {}
	local var13 = 1
	
	for i, v in pairs(value) do
		local t_1 = { id = var13, name = v.name or i }
		
		if i == "main" or v.name == "main" then
			t_1.main = true
		end
		if v.fault == true then
			t_1.crashed = true
		end
		if not v.stack or #v.stack <= 0 then
			table.insert(t, t_1)
			var13 += 1
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

local function parseAppContext(p4) --[[ line: 439 ]]
	-- upvalues: t (ref), sentryIncludeRolloutFlagsContext (ref)
	local t_1 = {}
	local attributes = p4.attributes
	local appVersion = t.safeGet(attributes, "appVersion")
	
	if appVersion ~= nil then
		t_1.app_version = appVersion
	end
	local appInstallationId = t.safeGet(attributes, "AppInstallationId")
	
	if appInstallationId ~= nil then
		t_1.device_app_hash = appInstallationId
	end
	local coreScriptVersion = t.safeGet(attributes, "CoreScriptVersion")
	
	if coreScriptVersion ~= nil then
		t_1.core_script_version = coreScriptVersion
	end
	local robloxChannel = t.safeGet(attributes, "RobloxChannel")
	
	if robloxChannel ~= nil then
		t_1.roblox_channel = robloxChannel
	end
	local appRunningTime = t.safeGet(attributes, "AppRunningTime")
	
	if appRunningTime ~= nil then
		t_1.app_running_time = appRunningTime
	end
	local userAgent = t.safeGet(attributes, "UserAgent")
	
	if userAgent ~= nil then
		t_1.user_agent = userAgent
	end
	local baseUrl = t.safeGet(attributes, "BaseUrl")
	
	if baseUrl ~= nil then
		t_1.base_url = baseUrl
	end
	local windowsLaunchType = t.safeGet(attributes, "WindowsLaunchType")
	
	if windowsLaunchType ~= nil then
		t_1.windows_launch_type = windowsLaunchType
	end
	local countryCode = t.safeGet(attributes, "CountryCode")
	
	if countryCode ~= nil then
		t_1.country_code = countryCode
	end
	if sentryIncludeRolloutFlagsContext then
		local rolloutFlagsInControl = t.safeGet(attributes, "RolloutFlagsInControl")
		
		if rolloutFlagsInControl ~= nil then
			t_1.rollout_flags_in_control = rolloutFlagsInControl
		end
		local rolloutFlagsInVariant = t.safeGet(attributes, "RolloutFlagsInVariant")
		
		if rolloutFlagsInVariant ~= nil then
			t_1.rollout_flags_in_variant = rolloutFlagsInVariant
		end
	end
	return t_1
end

local _ = function(p5) --[[ line: 525 | named "parseNetworkContext" ]]
	-- upvalues: t (ref)
	local t_1 = {}
	local networkType = t.safeGet(p5.attributes, "networkType")
	
	if networkType ~= nil then
		t_1.network_type = networkType
	end
	return t_1
end

local function parseOSContext(p6) --[[ line: 560 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	local attributes = p6.attributes
	local baseOs = t.safeGet(attributes, "baseOs")
	
	if baseOs ~= nil then
		t_1.name = baseOs
	end
	local systemVersion = t.safeGet(attributes, "systemVersion")
	
	if systemVersion ~= nil then
		t_1.version = systemVersion
	end
	return t_1
end

local function parseDeviceContext(p7) --[[ line: 629 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	local attributes = p7.attributes
	local deviceName = t.safeGet(attributes, "deviceName")
	
	if deviceName ~= nil then
		t_1.name = deviceName
	end
	local batteryLevel = t.safeGet(attributes, "batteryLevel")
	
	if batteryLevel ~= nil then
		local var37 = tonumber(batteryLevel)
		
		if var37 ~= nil then
			t_1.battery_level = var37
		end
	end
	local manufacturer = t.safeGet(attributes, "manufacturer")
	
	if manufacturer ~= nil then
		t_1.manufacturer = manufacturer
	end
	local maxMemory = t.safeGet(attributes, "maxMemory")
	
	if maxMemory ~= nil then
		local var40
		if maxMemory == nil then
			var40 = nil
		else
			local var41 = tonumber(maxMemory)
			var40 = if var41 == nil then nil elseif var41 < 0 then 0 else math.floor(var41)
		end
		if var40 ~= nil then
			t_1.memory_size = var40
		end
	end
	local availRAM = t.safeGet(attributes, "availRAM")
	
	if availRAM ~= nil then
		local var43
		if availRAM == nil then
			var43 = nil
		else
			local var44 = tonumber(availRAM)
			var43 = if var44 == nil then nil elseif var44 < 0 then 0 else math.floor(var44)
		end
		if var43 ~= nil then
			t_1.free_memory = var43
		end
	end
	local maxResolution = t.safeGet(attributes, "maxResolution")
	
	if maxResolution ~= nil then
		t_1.screen_resolution = maxResolution
	end
	local thermalStatus = t.safeGet(attributes, "thermalStatus")
	
	if thermalStatus ~= nil then
		t_1.thermal_status = thermalStatus
	end
	local cpuLogicalCount = t.safeGet(attributes, "cpuLogicalCount")
	
	if cpuLogicalCount ~= nil then
		local var48
		if cpuLogicalCount == nil then
			var48 = nil
		else
			local var49 = tonumber(cpuLogicalCount)
			var48 = if var49 == nil then nil elseif var49 < 0 then 0 else math.floor(var49)
		end
		if var48 ~= nil then
			t_1.processor_count = var48
		end
	end
	local cpuCoreCount = t.safeGet(attributes, "cpuCoreCount")
	
	if cpuCoreCount ~= nil then
		local var51
		if cpuCoreCount == nil then
			var51 = nil
		else
			local var52 = tonumber(cpuCoreCount)
			var51 = if var52 == nil then nil elseif var52 < 0 then 0 else math.floor(var52)
		end
		if var51 ~= nil then
			t_1.cpu_core_count = var51
		end
	end
	local cpuMake = t.safeGet(attributes, "cpuMake")
	
	if cpuMake ~= nil then
		t_1.cpu_description = cpuMake
	end
	local cpuPhysCount = t.safeGet(attributes, "cpuPhysCount")
	
	if cpuPhysCount ~= nil then
		local var55
		if cpuPhysCount == nil then
			var55 = nil
		else
			local var56 = tonumber(cpuPhysCount)
			var55 = if var56 == nil then nil elseif var56 < 0 then 0 else math.floor(var56)
		end
		if var55 ~= nil then
			t_1.cpu_physical_count = var55
		end
	end
	local cpuSpeed = t.safeGet(attributes, "cpuSpeed")
	
	if cpuSpeed ~= nil then
		local var58
		if cpuSpeed == nil then
			var58 = nil
		else
			local var59 = tonumber(cpuSpeed)
			var58 = if var59 == nil then nil elseif var59 < 0 then 0 else math.floor(var59)
		end
		if var58 ~= nil then
			t_1.cpu_speed = var58
		end
	end
	return t_1
end

local function parseCustomMetadataContexts(p8) --[[ line: 728 ]]
	local t = {}
	local customMetadata = p8.customMetadata
	
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

function t.parseErrorToContext(p9) --[[ line: 792 ]]
	-- upvalues: parseAppContext (ref), t (ref), parseOSContext (ref), parseDeviceContext (ref), parseCustomMetadataContexts (ref)
	local t_1 = { app = parseAppContext(p9) }
	local t_2 = {}
	local networkType = t.safeGet(p9.attributes, "networkType")
	
	if networkType ~= nil then
		t_2.network_type = networkType
	end
	t_1.network = t_2
	t_1.os = parseOSContext(p9)
	t_1.device = parseDeviceContext(p9)
	
	for i, v in parseCustomMetadataContexts(p9) do
		t_1[i] = v
	end
	return t_1
end

return t