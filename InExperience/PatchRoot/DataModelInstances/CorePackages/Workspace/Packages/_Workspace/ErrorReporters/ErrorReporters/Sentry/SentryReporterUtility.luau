local _ = require(script.Parent.ErrorReport)
local _ = script:FindFirstAncestor("ErrorReporters").Parent
local t = {
	safeGet = function(p1, p2)
		local ok, status = pcall(function()
			-- upvalues: p1 (ref), p2 (ref)
			return p1[p2]
		end)
		
		if not ok then
			return "unparsable"
		end
		local var1
		local var2 = typeof(status)
		
		if status == nil or var2 == "string" or var2 == "boolean" then
			var1 = true
		elseif var2 == "number" then
			var1 = false
			
			if status == status then
				var1 = false
				
				if status ~= 1e999 then
					local _ = status ~= -1e999
				end
			end
		else
			var1 = false
		end
		return if var1 then status else "json_incompatible"
	end
}
local sentryIncludeRolloutFlagsContext = game:DefineFastFlag("SentryIncludeRolloutFlagsContext", false)

local function _(p1)
	local var1 = typeof(p1)
	
	return p1 == nil or var1 == "string" or var1 == "boolean" or (var1 == "number" and (p1 == p1 and (p1 ~= 1e999 and p1 ~= -1e999)))
end

local _ = function(value)
	if value == nil then
		return nil
	end
	local var1 = tonumber(value)
	
	return if var1 == nil then nil elseif var1 < 0 then 0 else math.floor(var1)
end

local function convertErrorStackToSentryFrame(p1)
	local t = { lineno = tonumber(p1.line) or 0 }
	
	if p1.funcName then
		t["function"] = p1.funcName
	end
	if p1.sourceCode then
		t.filename = p1.sourceCode
		t.abs_path = p1.sourceCode
	end
	if p1.column then
		t.colno = tonumber(p1.column)
	end
	if p1.library then
		t.module = p1.library
	end
	if p1.address then
		t.instruction_addr = p1.address
	end
	if p1.guessed_frame == false then
		t.in_app = true
	end
	return t
end

function t.parseThreadsToSentry(value)
	-- upvalues: convertErrorStackToSentryFrame (ref)
	if not value then
		return nil
	end
	local t = {}
	local var1 = 1
	
	for i, v in pairs(value) do
		local t_1 = { id = var1, name = v.name or i }
		
		if i == "main" or v.name == "main" then
			t_1.main = true
		end
		if v.fault == true then
			t_1.crashed = true
		end
		if not v.stack or #v.stack <= 0 then
			table.insert(t, t_1)
			var1 += 1
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

local function parseAppContext(p1)
	-- upvalues: t (ref), sentryIncludeRolloutFlagsContext (ref)
	local t_1 = {}
	local attributes = p1.attributes
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

local _ = function(p1)
	-- upvalues: t (ref)
	local t_1 = {}
	local networkType = t.safeGet(p1.attributes, "networkType")
	
	if networkType ~= nil then
		t_1.network_type = networkType
	end
	return t_1
end

local function parseOSContext(p1)
	-- upvalues: t (ref)
	local t_1 = {}
	local attributes = p1.attributes
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

local function parseDeviceContext(p1)
	-- upvalues: t (ref)
	local t_1 = {}
	local attributes = p1.attributes
	local deviceName = t.safeGet(attributes, "deviceName")
	
	if deviceName ~= nil then
		t_1.name = deviceName
	end
	local batteryLevel = t.safeGet(attributes, "batteryLevel")
	
	if batteryLevel ~= nil then
		local var2 = tonumber(batteryLevel)
		
		if var2 ~= nil then
			t_1.battery_level = var2
		end
	end
	local manufacturer = t.safeGet(attributes, "manufacturer")
	
	if manufacturer ~= nil then
		t_1.manufacturer = manufacturer
	end
	local maxMemory = t.safeGet(attributes, "maxMemory")
	
	if maxMemory ~= nil then
		local var3
		if maxMemory == nil then
			var3 = nil
		else
			local var4 = tonumber(maxMemory)
			var3 = if var4 == nil then nil elseif var4 < 0 then 0 else math.floor(var4)
		end
		if var3 ~= nil then
			t_1.memory_size = var3
		end
	end
	local availRAM = t.safeGet(attributes, "availRAM")
	
	if availRAM ~= nil then
		local var5
		if availRAM == nil then
			var5 = nil
		else
			local var6 = tonumber(availRAM)
			var5 = if var6 == nil then nil elseif var6 < 0 then 0 else math.floor(var6)
		end
		if var5 ~= nil then
			t_1.free_memory = var5
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
		local var7
		if cpuLogicalCount == nil then
			var7 = nil
		else
			local var8 = tonumber(cpuLogicalCount)
			var7 = if var8 == nil then nil elseif var8 < 0 then 0 else math.floor(var8)
		end
		if var7 ~= nil then
			t_1.processor_count = var7
		end
	end
	local cpuCoreCount = t.safeGet(attributes, "cpuCoreCount")
	
	if cpuCoreCount ~= nil then
		local var9
		if cpuCoreCount == nil then
			var9 = nil
		else
			local var10 = tonumber(cpuCoreCount)
			var9 = if var10 == nil then nil elseif var10 < 0 then 0 else math.floor(var10)
		end
		if var9 ~= nil then
			t_1.cpu_core_count = var9
		end
	end
	local cpuMake = t.safeGet(attributes, "cpuMake")
	
	if cpuMake ~= nil then
		t_1.cpu_description = cpuMake
	end
	local cpuPhysCount = t.safeGet(attributes, "cpuPhysCount")
	
	if cpuPhysCount ~= nil then
		local var11
		if cpuPhysCount == nil then
			var11 = nil
		else
			local var12 = tonumber(cpuPhysCount)
			var11 = if var12 == nil then nil elseif var12 < 0 then 0 else math.floor(var12)
		end
		if var11 ~= nil then
			t_1.cpu_physical_count = var11
		end
	end
	local cpuSpeed = t.safeGet(attributes, "cpuSpeed")
	
	if cpuSpeed ~= nil then
		local var13
		if cpuSpeed == nil then
			var13 = nil
		else
			local var14 = tonumber(cpuSpeed)
			var13 = if var14 == nil then nil elseif var14 < 0 then 0 else math.floor(var14)
		end
		if var13 ~= nil then
			t_1.cpu_speed = var13
		end
	end
	return t_1
end

local function parseCustomMetadataContexts(p1)
	local t = {}
	local customMetadata = p1.customMetadata
	
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

function t.parseErrorToContext(p2)
	-- upvalues: parseAppContext (ref), t (ref), parseOSContext (ref), parseDeviceContext (ref), parseCustomMetadataContexts (ref)
	local t_1 = { app = parseAppContext(p2) }
	local t_2 = {}
	local networkType = t.safeGet(p2.attributes, "networkType")
	
	if networkType ~= nil then
		t_2.network_type = networkType
	end
	t_1.network = t_2
	t_1.os = parseOSContext(p2)
	t_1.device = parseDeviceContext(p2)
	
	for i, v in parseCustomMetadataContexts(p2) do
		t_1[i] = v
	end
	return t_1
end

return t