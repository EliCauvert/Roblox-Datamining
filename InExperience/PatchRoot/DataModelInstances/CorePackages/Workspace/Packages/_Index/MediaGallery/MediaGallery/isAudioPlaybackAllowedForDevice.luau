local parent = script:FindFirstAncestor("MediaGallery").Parent
local systemInfoProtocol = require(parent.SystemInfoProtocol).SystemInfoProtocol
local fStringLuaAppEdpAudioManufacturerDenyList = require(parent.SharedFlags).FStringLuaAppEdpAudioManufacturerDenyList
local var0 = nil

return function() --[[ line: 11 | named "isAudioPlaybackAllowedForDevice" ]]
	-- upvalues: var0 (write), systemInfoProtocol (ref), fStringLuaAppEdpAudioManufacturerDenyList (ref)
	if var0 == nil then
		var0 = true
		pcall(function() --[[ line: 18 ]]
			-- upvalues: systemInfoProtocol (copy), fStringLuaAppEdpAudioManufacturerDenyList (copy), var0 (copy)
			local var1 = systemInfoProtocol.default:getSystemInfo({ systemInfoProtocol.InfoNames.MANUFACTURER })
			
			if typeof(var1.manufacturer) == "string" then
				for i in fStringLuaAppEdpAudioManufacturerDenyList:gmatch("(%w+)") do
					if typeof(i) == "string" and string.lower(i) == string.lower(var1.manufacturer) then
						var0 = false
					end
				end
			end
		end)
		
		return var0
	end
	return var0
end