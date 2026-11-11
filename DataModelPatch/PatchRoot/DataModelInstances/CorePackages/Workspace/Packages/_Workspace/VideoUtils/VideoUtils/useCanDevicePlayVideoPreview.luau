local TelemetryService = game:GetService("TelemetryService")
local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local ReactModule = require(Parent.React)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local ReportWarningFunction = require(Parent.DiscoveryAnalytics).Points.reportWarning
local SystemInfoProtocol = require(Parent.SystemInfoProtocol).SystemInfoProtocol
local VideoBlockingHelpersModule = require(VideoUtils.VideoBlockingHelpers)
local FFlagLuaAppShareEdpVideoBlockingConfig = require(Parent.SharedFlags).FFlagLuaAppShareEdpVideoBlockingConfig
local VideoBlockingTelemetryConfig = nil
VideoBlockingTelemetryConfig = if FFlagLuaAppShareEdpVideoBlockingConfig then VideoBlockingHelpersModule.VideoBlockingTelemetryConfig else {
	eventName = "EdpVideoPreviewBlockingStatus",
	description = "Telemetry about whether or not the video is blocked by manufacturer/device/max memory",
	backends = { "Points", "EventIngest" },
	lastUpdated = { 26, 1, 19 },
	throttlingPercentage = game:DefineFastInt("VideoBlockingTelemetryThrottleHundredthsPercent", 10000)
}
local v1 = nil

local function getSystemInfoLazy()
	-- upvalues: v1 (ref), SystemInfoProtocol (copy), ReportWarningFunction (copy), LoggingProtocolModule (copy)
	if v1 then
		return v1
	end
	local config = { manufacturer = nil, deviceName = nil, maxMemory = nil }
	local Success, Result = pcall(function()
		-- upvalues: SystemInfoProtocol (upval)
		local SystemInfo = SystemInfoProtocol.default:getSystemInfo({
			SystemInfoProtocol.InfoNames.MANUFACTURER,
			SystemInfoProtocol.InfoNames.DEVICE_NAME,
			SystemInfoProtocol.InfoNames.MAX_MEMORY
		})
		
		return {
			manufacturer = SystemInfo.manufacturer,
			deviceName = SystemInfo.deviceName,
			maxMemory = SystemInfo.maxMemory
		}
	end)
	
	if Success then
		config = Result
	else
		ReportWarningFunction(LoggingProtocolModule.default, "EdpVideoPreviewBlocking", `Error retrieving device info for video preview blocking check: {Result}`)
	end
	v1 = config
	
	return config
end

return function(p1, UniverseId, PageContext)
	-- upvalues: ReactModule (copy), getSystemInfoLazy (copy), FFlagLuaAppShareEdpVideoBlockingConfig (copy), VideoBlockingHelpersModule (copy), SystemInfoProtocol (copy), ReportWarningFunction (copy), LoggingProtocolModule (copy), TelemetryService (copy), VideoBlockingTelemetryConfig (ref)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: getSystemInfoLazy (upval)
		return (getSystemInfoLazy())
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), FFlagLuaAppShareEdpVideoBlockingConfig (upval), VideoBlockingHelpersModule (upval), UseMemoResult (copy)
		if not p1.enableManufacturerDeny or not p1.manufacturerDenyList then
			return false
		end
		if FFlagLuaAppShareEdpVideoBlockingConfig then
			return VideoBlockingHelpersModule.isInPipeDenyList(UseMemoResult.manufacturer, p1.manufacturerDenyList)
		end
		if typeof(UseMemoResult.manufacturer) == "string" then
			for i in p1.manufacturerDenyList:gmatch("([^|]+)") do
				if typeof(i) == "string" and string.lower(i) == string.lower(UseMemoResult.manufacturer) then
					return true
				end
			end
		end
		return false
	end, {
		p1.enableManufacturerDeny,
		p1.manufacturerDenyList,
		UseMemoResult.manufacturer
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), FFlagLuaAppShareEdpVideoBlockingConfig (upval), VideoBlockingHelpersModule (upval), UseMemoResult (copy)
		if not p1.enableDeviceDeny or not p1.deviceDenyList then
			return false
		end
		if FFlagLuaAppShareEdpVideoBlockingConfig then
			return VideoBlockingHelpersModule.isInPipeDenyList(UseMemoResult.deviceName, p1.deviceDenyList)
		end
		if typeof(UseMemoResult.deviceName) == "string" then
			for i in p1.deviceDenyList:gmatch("([^|]+)") do
				if typeof(i) == "string" and string.lower(i) == string.lower(UseMemoResult.deviceName) then
					return true
				end
			end
		end
		return false
	end, {
		p1.enableDeviceDeny,
		p1.deviceDenyList,
		UseMemoResult.deviceName
	})
	local UseMemoResult3 = ReactModule.useMemo(function(): boolean
		-- upvalues: p1 (copy), UseMemoResult (copy)
		if not p1.enableMaxMemoryDeny then
			return false
		end
		local MaxMemoryThresholdMb = p1.maxMemoryThresholdMb or -1
		
		if MaxMemoryThresholdMb > 0 and typeof(UseMemoResult.maxMemory) == "string" then
			local Number: number? = tonumber(UseMemoResult.maxMemory:match("(%d+)"))
			
			if Number and Number < MaxMemoryThresholdMb then
				return true
			end
		end
		return false
	end, {
		p1.enableMaxMemoryDeny,
		p1.maxMemoryThresholdMb,
		UseMemoResult.maxMemory
	})
	
	return (ReactModule.useCallback(function(): boolean
		-- upvalues: p1 (copy), SystemInfoProtocol (upval), ReportWarningFunction (upval), LoggingProtocolModule (upval), TelemetryService (upval), VideoBlockingTelemetryConfig (upval), PageContext (copy), UniverseId (copy), UseMemoResult1 (copy), UseMemoResult2 (copy), UseMemoResult3 (copy)
		local v2 = false
		local Number = nil
		
		if p1.enableAvailableRamDeny and p1.availableRamThresholdMb and p1.availableRamThresholdMb > 0 then
			local Success, Result = pcall(function(): boolean
				-- upvalues: SystemInfoProtocol (upval), Number (ref), p1 (upval)
				local SystemInfo = SystemInfoProtocol.default:getSystemInfo({ SystemInfoProtocol.InfoNames.AVAIL_RAM })
				
				if typeof(SystemInfo.availRAM) == "string" then
					Number = tonumber(SystemInfo.availRAM)
					
					if Number and Number < p1.availableRamThresholdMb then
						return true
					end
				end
				return false
			end)
			
			if Success then
				v2 = Result
			else
				ReportWarningFunction(LoggingProtocolModule.default, "EdpVideoPreviewBlocking", `Error retrieving available RAM for video preview blocking check: {Result}`)
			end
		end
		TelemetryService:LogEvent(VideoBlockingTelemetryConfig, {
			standardizedFields = { "addOSInfo", "addSessionInfo" },
			customFields = {
				pageContext = PageContext,
				universeId = UniverseId,
				isBlockedByManufacturer = if p1.enableManufacturerDeny then UseMemoResult1 else nil,
				isBlockedByDevice = if p1.enableDeviceDeny then UseMemoResult2 else nil,
				isBlockedByMaxMemory = if p1.enableMaxMemoryDeny then UseMemoResult3 else nil,
				isBlockedByAvailableRam = if p1.enableAvailableRamDeny then v2 else nil,
				availableRam = if p1.enableAvailableRamDeny then Number else nil
			}
		})
		
		return not (p1.enableManufacturerDeny and UseMemoResult1 or (p1.enableDeviceDeny and UseMemoResult2 or (p1.enableMaxMemoryDeny and UseMemoResult3 or p1.enableAvailableRamDeny and v2)))
	end, {
		p1.enableManufacturerDeny, p1.enableDeviceDeny, p1.enableMaxMemoryDeny,
		p1.enableAvailableRamDeny, p1.availableRamThresholdMb, UseMemoResult1,
		UseMemoResult2, UseMemoResult3, UniverseId, PageContext
	}))
end