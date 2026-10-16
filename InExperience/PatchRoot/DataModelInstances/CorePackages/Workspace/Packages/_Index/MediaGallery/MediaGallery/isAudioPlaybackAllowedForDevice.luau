local Parent = script:FindFirstAncestor("MediaGallery").Parent
local SystemInfoProtocol = require(Parent.SystemInfoProtocol).SystemInfoProtocol
local FStringLuaAppEdpAudioManufacturerDenyList = require(Parent.SharedFlags).FStringLuaAppEdpAudioManufacturerDenyList
local Flag = nil

return function(): boolean --[[ Line: 11 | Named "isAudioPlaybackAllowedForDevice" ]]
	-- upvalues: Flag (ref), SystemInfoProtocol (copy), FStringLuaAppEdpAudioManufacturerDenyList (copy)
	if Flag == nil then
		Flag = true
		pcall(function() --[[ Line: 18 ]]
			-- upvalues: SystemInfoProtocol (upval), FStringLuaAppEdpAudioManufacturerDenyList (upval), Flag (upval)
			local SystemInfo = SystemInfoProtocol.default:getSystemInfo({ SystemInfoProtocol.InfoNames.MANUFACTURER })
			
			if typeof(SystemInfo.manufacturer) == "string" then
				for i in FStringLuaAppEdpAudioManufacturerDenyList:gmatch("(%w+)") do
					if typeof(i) == "string" and string.lower(i) == string.lower(SystemInfo.manufacturer) then
						Flag = false
					end
				end
			end
		end)
		
		return Flag
	else
		return Flag
	end
end