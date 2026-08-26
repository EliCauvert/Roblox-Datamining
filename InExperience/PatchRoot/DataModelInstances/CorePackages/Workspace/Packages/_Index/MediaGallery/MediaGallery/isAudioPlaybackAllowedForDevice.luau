local parent = script:FindFirstAncestor("MediaGallery").Parent
local systemInfoProtocol = require(parent.SystemInfoProtocol).SystemInfoProtocol
local fStringLuaAppEdpAudioManufacturerDenyList = require(parent.SharedFlags).FStringLuaAppEdpAudioManufacturerDenyList
local var1 = nil

return function()
	-- upvalues: var1 (write), systemInfoProtocol (ref), fStringLuaAppEdpAudioManufacturerDenyList (ref)
	if var1 == nil then
		var1 = true
		pcall(function()
			-- upvalues: systemInfoProtocol (copy), fStringLuaAppEdpAudioManufacturerDenyList (copy), var1 (copy)
			local var2 = systemInfoProtocol.default:getSystemInfo({ systemInfoProtocol.InfoNames.MANUFACTURER })
			
			if typeof(var2.manufacturer) == "string" then
				for i in fStringLuaAppEdpAudioManufacturerDenyList:gmatch("(%w+)") do
					if typeof(i) == "string" and string.lower(i) == string.lower(var2.manufacturer) then
						var1 = false
					end
				end
			end
		end)
		
		return var1
	end
	return var1
end