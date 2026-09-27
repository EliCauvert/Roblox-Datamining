local telemetryService = game:GetService("TelemetryService")
local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local reactModule = require(parent.React)
local loggingProtocolModule = require(parent.LoggingProtocol)
local reportWarning = require(parent.DiscoveryAnalytics).Points.reportWarning
local systemInfoProtocol = require(parent.SystemInfoProtocol).SystemInfoProtocol
local videoBlockingHelpersModule = require(videoUtils.VideoBlockingHelpers)
local videoBlockingTelemetryConfig = videoBlockingHelpersModule.VideoBlockingTelemetryConfig
local var1 = nil

local function getSystemInfoLazy()
	-- upvalues: var1 (write), systemInfoProtocol (ref), reportWarning (ref), loggingProtocolModule (ref)
	if var1 then
		return var1
	end
	local t = { manufacturer = nil, deviceName = nil, maxMemory = nil }
	local ok, status = pcall(function()
		-- upvalues: systemInfoProtocol (copy)
		local var2 = systemInfoProtocol.default:getSystemInfo({
			systemInfoProtocol.InfoNames.MANUFACTURER,
			systemInfoProtocol.InfoNames.DEVICE_NAME,
			systemInfoProtocol.InfoNames.MAX_MEMORY
		})
		
		return {
			manufacturer = var2.manufacturer,
			deviceName = var2.deviceName,
			maxMemory = var2.maxMemory
		}
	end)
	
	if ok then
		t = status
	else
		reportWarning(loggingProtocolModule.default, "EdpVideoPreviewBlocking", `Error retrieving device info for video preview blocking check: {status}`)
	end
	var1 = t
	
	return t
end

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), getSystemInfoLazy (ref), videoBlockingHelpersModule (ref), systemInfoProtocol (ref), reportWarning (ref), loggingProtocolModule (ref), telemetryService (ref), videoBlockingTelemetryConfig (ref)
	local var2 = reactModule.useMemo(function()
		-- upvalues: getSystemInfoLazy (copy)
		return getSystemInfoLazy()
	end, {})
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), videoBlockingHelpersModule (copy), var2 (ref)
		return if p1.enableManufacturerDeny and p1.manufacturerDenyList then videoBlockingHelpersModule.isInPipeDenyList(var2.manufacturer, p1.manufacturerDenyList) else false
	end, {
		p1.enableManufacturerDeny,
		p1.manufacturerDenyList,
		var2.manufacturer
	})
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), videoBlockingHelpersModule (copy), var2 (ref)
		return if p1.enableDeviceDeny and p1.deviceDenyList then videoBlockingHelpersModule.isInPipeDenyList(var2.deviceName, p1.deviceDenyList) else false
	end, { p1.enableDeviceDeny, p1.deviceDenyList, var2.deviceName })
	local var5 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var2 (ref)
		if not p1.enableMaxMemoryDeny then
			return false
		end
		local maxMemoryThresholdMb = p1.maxMemoryThresholdMb or -1
		
		if maxMemoryThresholdMb > 0 and typeof(var2.maxMemory) == "string" then
			local var6 = tonumber(var2.maxMemory:match("(%d+)"))
			
			return var6 and var6 < maxMemoryThresholdMb
		end
	end, {
		p1.enableMaxMemoryDeny,
		p1.maxMemoryThresholdMb,
		var2.maxMemory
	})
	
	return reactModule.useCallback(function()
		-- upvalues: p1 (ref), systemInfoProtocol (copy), reportWarning (copy), loggingProtocolModule (copy), telemetryService (copy), videoBlockingTelemetryConfig (copy), p3 (ref), p2 (ref), var3 (ref), var4 (ref), var5 (ref)
		local var6 = false
		local var7 = nil
		
		if p1.enableAvailableRamDeny and p1.availableRamThresholdMb and p1.availableRamThresholdMb > 0 then
			local ok, status = pcall(function()
				-- upvalues: systemInfoProtocol (copy), var7 (write), p1 (copy)
				local var8 = systemInfoProtocol.default:getSystemInfo({ systemInfoProtocol.InfoNames.AVAIL_RAM })
				
				if typeof(var8.availRAM) == "string" then
					var7 = tonumber(var8.availRAM)
					
					return var7 and var7 < p1.availableRamThresholdMb
				end
			end)
			
			if ok then
				var6 = status
			else
				reportWarning(loggingProtocolModule.default, "EdpVideoPreviewBlocking", `Error retrieving available RAM for video preview blocking check: {status}`)
			end
		end
		telemetryService:LogEvent(videoBlockingTelemetryConfig, {
			standardizedFields = { "addOSInfo", "addSessionInfo" },
			customFields = {
				pageContext = p3,
				universeId = p2,
				isBlockedByManufacturer = if p1.enableManufacturerDeny then var3 else nil,
				isBlockedByDevice = if p1.enableDeviceDeny then var4 else nil,
				isBlockedByMaxMemory = if p1.enableMaxMemoryDeny then var5 else nil,
				isBlockedByAvailableRam = if p1.enableAvailableRamDeny then var6 else nil,
				availableRam = if p1.enableAvailableRamDeny then var7 else nil
			}
		})
		
		return not (if p1.enableManufacturerDeny then var3 elseif p1.enableDeviceDeny then var4 elseif p1.enableMaxMemoryDeny then var5 else p1.enableAvailableRamDeny and var6)
	end, {
		p1.enableManufacturerDeny, p1.enableDeviceDeny, p1.enableMaxMemoryDeny,
		p1.enableAvailableRamDeny, p1.availableRamThresholdMb, var3, var4, var5, p2,
		p3
	})
end