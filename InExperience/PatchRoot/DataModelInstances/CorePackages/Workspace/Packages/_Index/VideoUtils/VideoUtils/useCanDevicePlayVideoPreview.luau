local telemetryService = game:GetService("TelemetryService")
local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local reactModule = require(parent.React)
local loggingProtocolModule = require(parent.LoggingProtocol)
local reportWarning = require(parent.DiscoveryAnalytics).Points.reportWarning
local systemInfoProtocol = require(parent.SystemInfoProtocol).SystemInfoProtocol
local videoBlockingHelpersModule = require(videoUtils.VideoBlockingHelpers)
local fFlagLuaAppShareEdpVideoBlockingConfig = require(parent.SharedFlags).FFlagLuaAppShareEdpVideoBlockingConfig
local var5 = if fFlagLuaAppShareEdpVideoBlockingConfig then videoBlockingHelpersModule.VideoBlockingTelemetryConfig else {
	eventName = "EdpVideoPreviewBlockingStatus",
	description = "Telemetry about whether or not the video is blocked by manufacturer/device/max memory",
	backends = { "Points", "EventIngest" },
	lastUpdated = { 26, 1, 19 },
	throttlingPercentage = game:DefineFastInt("VideoBlockingTelemetryThrottleHundredthsPercent", 10000)
}
local var6 = nil

local function getSystemInfoLazy() --[[ line: 40 ]]
	-- upvalues: var6 (write), systemInfoProtocol (ref), reportWarning (ref), loggingProtocolModule (ref)
	if var6 then
		return var6
	end
	local t = { manufacturer = nil, deviceName = nil, maxMemory = nil }
	local ok, status = pcall(function() --[[ line: 51 ]]
		-- upvalues: systemInfoProtocol (copy)
		local var9 = systemInfoProtocol.default:getSystemInfo({
			systemInfoProtocol.InfoNames.MANUFACTURER,
			systemInfoProtocol.InfoNames.DEVICE_NAME,
			systemInfoProtocol.InfoNames.MAX_MEMORY
		})
		
		return {
			manufacturer = var9.manufacturer,
			deviceName = var9.deviceName,
			maxMemory = var9.maxMemory
		}
	end)
	
	if ok then
		t = status
	else
		reportWarning(loggingProtocolModule.default, "EdpVideoPreviewBlocking", `Error retrieving device info for video preview blocking check: {status}`)
	end
	var6 = t
	
	return t
end

return function(p0, p1, p2) --[[ line: 93 | named "useCanDevicePlayVideoPreview" ]]
	-- upvalues: reactModule (ref), getSystemInfoLazy (ref), fFlagLuaAppShareEdpVideoBlockingConfig (ref), videoBlockingHelpersModule (ref), systemInfoProtocol (ref), reportWarning (ref), loggingProtocolModule (ref), telemetryService (ref), var5 (write)
	local var10 = reactModule.useMemo(function() --[[ line: 99 ]]
		-- upvalues: getSystemInfoLazy (copy)
		return getSystemInfoLazy()
	end, {})
	local var11 = reactModule.useMemo(function() --[[ line: 103 ]]
		-- upvalues: p0 (ref), fFlagLuaAppShareEdpVideoBlockingConfig (copy), videoBlockingHelpersModule (copy), var10 (ref)
		if not p0.enableManufacturerDeny or not p0.manufacturerDenyList then
			return false
		elseif fFlagLuaAppShareEdpVideoBlockingConfig then
			return videoBlockingHelpersModule.isInPipeDenyList(var10.manufacturer, p0.manufacturerDenyList)
		elseif typeof(var10.manufacturer) == "string" then
			for i in p0.manufacturerDenyList:gmatch("([^|]+)") do
				if typeof(i) == "string" and string.lower(i) == string.lower(var10.manufacturer) then
					return true
				end
			end
		end
		return false
	end, {
		p0.enableManufacturerDeny,
		p0.manufacturerDenyList,
		var10.manufacturer
	})
	local var12 = reactModule.useMemo(function() --[[ line: 123 ]]
		-- upvalues: p0 (ref), fFlagLuaAppShareEdpVideoBlockingConfig (copy), videoBlockingHelpersModule (copy), var10 (ref)
		if not p0.enableDeviceDeny or not p0.deviceDenyList then
			return false
		elseif fFlagLuaAppShareEdpVideoBlockingConfig then
			return videoBlockingHelpersModule.isInPipeDenyList(var10.deviceName, p0.deviceDenyList)
		elseif typeof(var10.deviceName) == "string" then
			for i in p0.deviceDenyList:gmatch("([^|]+)") do
				if typeof(i) == "string" and string.lower(i) == string.lower(var10.deviceName) then
					return true
				end
			end
		end
		return false
	end, { p0.enableDeviceDeny, p0.deviceDenyList, var10.deviceName })
	local var13 = reactModule.useMemo(function() --[[ line: 143 ]]
		-- upvalues: p0 (ref), var10 (ref)
		if not p0.enableMaxMemoryDeny then
			return false
		end
		local maxMemoryThresholdMb = p0.maxMemoryThresholdMb or -1
		
		if maxMemoryThresholdMb > 0 and typeof(var10.maxMemory) == "string" then
			local var15 = tonumber(var10.maxMemory:match("(%d+)"))
			
			return var15 and var15 < maxMemoryThresholdMb
		end
	end, {
		p0.enableMaxMemoryDeny,
		p0.maxMemoryThresholdMb,
		var10.maxMemory
	})
	
	return reactModule.useCallback(function() --[[ line: 160 ]]
		-- upvalues: p0 (ref), systemInfoProtocol (copy), reportWarning (copy), loggingProtocolModule (copy), telemetryService (copy), var5 (copy), p2 (ref), p1 (ref), var11 (ref), var12 (ref), var13 (ref)
		local var16 = false
		local var17 = nil
		
		if p0.enableAvailableRamDeny and p0.availableRamThresholdMb and p0.availableRamThresholdMb > 0 then
			local ok, status = pcall(function() --[[ line: 169 ]]
				-- upvalues: systemInfoProtocol (copy), var17 (write), p0 (copy)
				local var18 = systemInfoProtocol.default:getSystemInfo({ systemInfoProtocol.InfoNames.AVAIL_RAM })
				
				if typeof(var18.availRAM) == "string" then
					var17 = tonumber(var18.availRAM)
					
					return var17 and var17 < p0.availableRamThresholdMb
				end
			end)
			
			if ok then
				var16 = status
			else
				reportWarning(loggingProtocolModule.default, "EdpVideoPreviewBlocking", `Error retrieving available RAM for video preview blocking check: {status}`)
			end
		end
		telemetryService:LogEvent(var5, {
			standardizedFields = { "addOSInfo", "addSessionInfo" },
			customFields = {
				pageContext = p2,
				universeId = p1,
				isBlockedByManufacturer = if p0.enableManufacturerDeny then var11 else nil,
				isBlockedByDevice = if p0.enableDeviceDeny then var12 else nil,
				isBlockedByMaxMemory = if p0.enableMaxMemoryDeny then var13 else nil,
				isBlockedByAvailableRam = if p0.enableAvailableRamDeny then var16 else nil,
				availableRam = if p0.enableAvailableRamDeny then var17 else nil
			}
		})
		
		return not (if p0.enableManufacturerDeny then var11 elseif p0.enableDeviceDeny then var12 elseif p0.enableMaxMemoryDeny then var13 else p0.enableAvailableRamDeny and var16)
	end, {
		p0.enableManufacturerDeny, p0.enableDeviceDeny, p0.enableMaxMemoryDeny,
		p0.enableAvailableRamDeny, p0.availableRamThresholdMb, var11, var12, var13, p1,
		p2
	})
end