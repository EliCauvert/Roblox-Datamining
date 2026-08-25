local systemInfoProtocol = require(script:FindFirstAncestor("SocialExperiments").Parent.SystemInfoProtocol).SystemInfoProtocol
local fFlagTestDeviceForFAEUpsellModule = require(script.Parent.FFlagTestDeviceForFAEUpsell)
local FAEUpsellDeviceNamePipeDenyList = game:DefineFastString("FAEUpsellDeviceNamePipeDenyList", "")
local FAEUpsellSystemVersionPipeDenyList = game:DefineFastString("FAEUpsellSystemVersionPipeDenyList", "")
local var3 = nil

return function()
	-- upvalues: fFlagTestDeviceForFAEUpsellModule (ref), var3 (write), systemInfoProtocol (ref), FAEUpsellDeviceNamePipeDenyList (ref), FAEUpsellSystemVersionPipeDenyList (ref)
	if not fFlagTestDeviceForFAEUpsellModule then
		return true
	elseif var3 ~= nil then
		return var3
	end
	local ok, status = pcall(function()
		-- upvalues: systemInfoProtocol (copy), FAEUpsellDeviceNamePipeDenyList (copy), var3 (copy), FAEUpsellSystemVersionPipeDenyList (copy)
		local var4 = systemInfoProtocol.default:getSystemInfo({
			systemInfoProtocol.InfoNames.DEVICE_NAME,
			systemInfoProtocol.InfoNames.SYSTEM_VERSION,
			systemInfoProtocol.InfoNames.BASE_OS
		})
		local deviceName = var4.deviceName or "Unknown"
		
		if typeof(deviceName) == "string" then
			for i in FAEUpsellDeviceNamePipeDenyList:gmatch("([^|]+)") do
				if deviceName:lower():find(i:lower()) then
					var3 = false
					
					return var3
				end
			end
		end
		local text = (var4.baseOs or "UnknownOS") .. ":" .. (var4.systemVersion or "UnknownVersion")
		
		if typeof(text) == "string" then
			for i in FAEUpsellSystemVersionPipeDenyList:gmatch("([^|]+)") do
				if text:lower():find(i:lower()) then
					var3 = false
					
					return var3
				end
			end
		end
		var3 = true
		
		return var3
	end)
	
	return if ok then status else true
end