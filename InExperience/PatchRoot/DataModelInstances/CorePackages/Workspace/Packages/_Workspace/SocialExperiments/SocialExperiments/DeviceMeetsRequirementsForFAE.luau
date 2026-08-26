local systemInfoProtocol = require(script:FindFirstAncestor("SocialExperiments").Parent.SystemInfoProtocol).SystemInfoProtocol
local fFlagTestDeviceForFAEUpsellModule = require(script.Parent.FFlagTestDeviceForFAEUpsell)
local FAEUpsellDeviceNamePipeDenyList = game:DefineFastString("FAEUpsellDeviceNamePipeDenyList", "")
local FAEUpsellSystemVersionPipeDenyList = game:DefineFastString("FAEUpsellSystemVersionPipeDenyList", "")
local var1 = nil

return function()
	-- upvalues: fFlagTestDeviceForFAEUpsellModule (ref), var1 (write), systemInfoProtocol (ref), FAEUpsellDeviceNamePipeDenyList (ref), FAEUpsellSystemVersionPipeDenyList (ref)
	if not fFlagTestDeviceForFAEUpsellModule then
		return true
	elseif var1 ~= nil then
		return var1
	end
	local ok, status = pcall(function()
		-- upvalues: systemInfoProtocol (copy), FAEUpsellDeviceNamePipeDenyList (copy), var1 (copy), FAEUpsellSystemVersionPipeDenyList (copy)
		local var2 = systemInfoProtocol.default:getSystemInfo({
			systemInfoProtocol.InfoNames.DEVICE_NAME,
			systemInfoProtocol.InfoNames.SYSTEM_VERSION,
			systemInfoProtocol.InfoNames.BASE_OS
		})
		local deviceName = var2.deviceName or "Unknown"
		
		if typeof(deviceName) == "string" then
			for i in FAEUpsellDeviceNamePipeDenyList:gmatch("([^|]+)") do
				if deviceName:lower():find(i:lower()) then
					var1 = false
					
					return var1
				end
			end
		end
		local text = (var2.baseOs or "UnknownOS") .. ":" .. (var2.systemVersion or "UnknownVersion")
		
		if typeof(text) == "string" then
			for i in FAEUpsellSystemVersionPipeDenyList:gmatch("([^|]+)") do
				if text:lower():find(i:lower()) then
					var1 = false
					
					return var1
				end
			end
		end
		var1 = true
		
		return var1
	end)
	
	return if ok then status else true
end