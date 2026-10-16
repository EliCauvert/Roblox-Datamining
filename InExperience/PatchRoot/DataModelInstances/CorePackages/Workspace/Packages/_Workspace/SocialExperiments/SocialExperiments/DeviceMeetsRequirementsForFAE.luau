local SystemInfoProtocol = require(script:FindFirstAncestor("SocialExperiments").Parent.SystemInfoProtocol).SystemInfoProtocol
local FFlagTestDeviceForFAEUpsellModule = require(script.Parent.FFlagTestDeviceForFAEUpsell)
local FAEUpsellDeviceNamePipeDenyList = game:DefineFastString("FAEUpsellDeviceNamePipeDenyList", "")
local FAEUpsellSystemVersionPipeDenyList = game:DefineFastString("FAEUpsellSystemVersionPipeDenyList", "")
local Flag = nil

return function() --[[ Line: 9 | Named "deviceMeetsRequirementsForFAE" ]]
	-- upvalues: FFlagTestDeviceForFAEUpsellModule (copy), Flag (ref), SystemInfoProtocol (copy), FAEUpsellDeviceNamePipeDenyList (copy), FAEUpsellSystemVersionPipeDenyList (copy)
	if not FFlagTestDeviceForFAEUpsellModule then
		return true
	elseif Flag == nil then
		local Success, Result = pcall(function(): boolean --[[ Line: 16 ]]
			-- upvalues: SystemInfoProtocol (upval), FAEUpsellDeviceNamePipeDenyList (upval), Flag (upval), FAEUpsellSystemVersionPipeDenyList (upval)
			local SystemInfo = SystemInfoProtocol.default:getSystemInfo({
				SystemInfoProtocol.InfoNames.DEVICE_NAME,
				SystemInfoProtocol.InfoNames.SYSTEM_VERSION,
				SystemInfoProtocol.InfoNames.BASE_OS
			})
			local DeviceName = SystemInfo.deviceName or "Unknown"
			
			if typeof(DeviceName) == "string" then
				for Text1 in FAEUpsellDeviceNamePipeDenyList:gmatch("([^|]+)") do
					if DeviceName:lower():find(Text1:lower()) then
						Flag = false
						
						return Flag
					end
				end
			end
			local Text = (SystemInfo.baseOs or "UnknownOS") .. ":" .. (SystemInfo.systemVersion or "UnknownVersion")
			
			if typeof(Text) == "string" then
				for Text2 in FAEUpsellSystemVersionPipeDenyList:gmatch("([^|]+)") do
					if Text:lower():find(Text2:lower()) then
						Flag = false
						
						return Flag
					end
				end
			end
			Flag = true
			
			return Flag
		end)
		
		return not Success or Result
	else
		return Flag
	end
end