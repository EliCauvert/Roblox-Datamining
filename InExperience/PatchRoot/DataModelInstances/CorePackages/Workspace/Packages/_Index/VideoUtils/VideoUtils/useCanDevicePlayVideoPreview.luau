local telemetryService = game:GetService("TelemetryService")
local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local reactModule = require(parent.React)
local loggingProtocolModule = require(parent.LoggingProtocol)
local reportWarning = require(parent.DiscoveryAnalytics).Points.reportWarning
local systemInfoProtocol = require(parent.SystemInfoProtocol).SystemInfoProtocol
local videoBlockingHelpersModule = require(videoUtils.VideoBlockingHelpers)
local fFlagLuaAppShareEdpVideoBlockingConfig = require(parent.SharedFlags).FFlagLuaAppShareEdpVideoBlockingConfig
local var1 = if fFlagLuaAppShareEdpVideoBlockingConfig then videoBlockingHelpersModule.VideoBlockingTelemetryConfig else {
	eventName = "EdpVideoPreviewBlockingStatus",
	description = "Telemetry about whether or not the video is blocked by manufacturer/device/max memory",
	backends = { "Points", "EventIngest" },
	lastUpdated = { 26, 1, 19 },
	throttlingPercentage = game:DefineFastInt("VideoBlockingTelemetryThrottleHundredthsPercent", 10000)
}
local var2 = nil

local function getSystemInfoLazy()
	-- upvalues: var2 (write), systemInfoProtocol (ref), reportWarning (ref), loggingProtocolModule (ref)
	if var2 then
		return var2
	end
	local t = { manufacturer = nil, deviceName = nil, maxMemory = nil }
	local ok, status = pcall(function()
		-- upvalues: systemInfoProtocol (copy)
		local var3 = systemInfoProtocol.default:getSystemInfo({
			systemInfoProtocol.InfoNames.MANUFACTURER,
			systemInfoProtocol.InfoNames.DEVICE_NAME,
			systemInfoProtocol.InfoNames.MAX_MEMORY
		})
		
		return {
			manufacturer = var3.manufacturer,
			deviceName = var3.deviceName,
			maxMemory = var3.maxMemory
		}
	end)
	
	if ok then
		t = status
	else
		reportWarning(loggingProtocolModule.default, "EdpVideoPreviewBlocking", `Error retrieving device info for video preview blocking check: {status}`)
	end
	var2 = t
	
	return t
end

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), getSystemInfoLazy (ref), fFlagLuaAppShareEdpVideoBlockingConfig (ref), videoBlockingHelpersModule (ref), systemInfoProtocol (ref), reportWarning (ref), loggingProtocolModule (ref), telemetryService (ref), var1 (write)
	local var3 = reactModule.useMemo(function()
		-- upvalues: getSystemInfoLazy (copy)
		return getSystemInfoLazy()
	end, {})
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), fFlagLuaAppShareEdpVideoBlockingConfig (copy), videoBlockingHelpersModule (copy), var3 (ref)
		if not p1.enableManufacturerDeny or not p1.manufacturerDenyList then
			return false
		elseif fFlagLuaAppShareEdpVideoBlockingConfig then
			return videoBlockingHelpersModule.isInPipeDenyList(var3.manufacturer, p1.manufacturerDenyList)
		elseif typeof(var3.manufacturer) == "string" then
			for i in p1.manufacturerDenyList:gmatch("([^|]+)") do
				if typeof(i) == "string" and string.lower(i) == string.lower(var3.manufacturer) then
					return true
				end
			end
		end
		return false
	end, {
		p1.enableManufacturerDeny,
		p1.manufacturerDenyList,
		var3.manufacturer
	})
	local var5 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), fFlagLuaAppShareEdpVideoBlockingConfig (copy), videoBlockingHelpersModule (copy), var3 (ref)
		if not p1.enableDeviceDeny or not p1.deviceDenyList then
			return false
		elseif fFlagLuaAppShareEdpVideoBlockingConfig then
			return videoBlockingHelpersModule.isInPipeDenyList(var3.deviceName, p1.deviceDenyList)
		elseif typeof(var3.deviceName) == "string" then
			for i in p1.deviceDenyList:gmatch("([^|]+)") do
				if typeof(i) == "string" and string.lower(i) == string.lower(var3.deviceName) then
					return true
				end
			end
		end
		return false
	end, { p1.enableDeviceDeny, p1.deviceDenyList, var3.deviceName })
	local var6 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var3 (ref)
		if not p1.enableMaxMemoryDeny then
			return false
		end
		local maxMemoryThresholdMb = p1.maxMemoryThresholdMb or -1
		
		if maxMemoryThresholdMb > 0 and typeof(var3.maxMemory) == "string" then
			local var7 = tonumber(var3.maxMemory:match("(%d+)"))
			
			return var7 and var7 < maxMemoryThresholdMb
		end
	end, {
		p1.enableMaxMemoryDeny,
		p1.maxMemoryThresholdMb,
		var3.maxMemory
	})
	
	return reactModule.useCallback(function()
		-- upvalues: p1 (ref), systemInfoProtocol (copy), reportWarning (copy), loggingProtocolModule (copy), telemetryService (copy), var1 (copy), p3 (ref), p2 (ref), var4 (ref), var5 (ref), var6 (ref)
		local var7 = false
		local var8 = nil
		
		if p1.enableAvailableRamDeny and p1.availableRamThresholdMb and p1.availableRamThresholdMb > 0 then
			local ok, status = pcall(function()
				-- upvalues: systemInfoProtocol (copy), var8 (write), p1 (copy)
				local var9 = systemInfoProtocol.default:getSystemInfo({ systemInfoProtocol.InfoNames.AVAIL_RAM })
				
				if typeof(var9.availRAM) == "string" then
					var8 = tonumber(var9.availRAM)
					
					return var8 and var8 < p1.availableRamThresholdMb
				end
			end)
			
			if ok then
				var7 = status
			else
				reportWarning(loggingProtocolModule.default, "EdpVideoPreviewBlocking", `Error retrieving available RAM for video preview blocking check: {status}`)
			end
		end
		telemetryService:LogEvent(var1, {
			standardizedFields = { "addOSInfo", "addSessionInfo" },
			customFields = {
				pageContext = p3,
				universeId = p2,
				isBlockedByManufacturer = if p1.enableManufacturerDeny then var4 else nil,
				isBlockedByDevice = if p1.enableDeviceDeny then var5 else nil,
				isBlockedByMaxMemory = if p1.enableMaxMemoryDeny then var6 else nil,
				isBlockedByAvailableRam = if p1.enableAvailableRamDeny then var7 else nil,
				availableRam = if p1.enableAvailableRamDeny then var8 else nil
			}
		})
		
		return not (if p1.enableManufacturerDeny then var4 elseif p1.enableDeviceDeny then var5 elseif p1.enableMaxMemoryDeny then var6 else p1.enableAvailableRamDeny and var7)
	end, {
		p1.enableManufacturerDeny, p1.enableDeviceDeny, p1.enableMaxMemoryDeny,
		p1.enableAvailableRamDeny, p1.availableRamThresholdMb, var4, var5, var6, p2,
		p3
	})
end