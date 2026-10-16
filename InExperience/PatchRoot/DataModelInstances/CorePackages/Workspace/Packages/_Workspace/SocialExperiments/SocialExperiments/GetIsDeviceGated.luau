local SocialExperiments = script:FindFirstAncestor("SocialExperiments")
local SystemInfoProtocol = require(SocialExperiments.Parent.SystemInfoProtocol).SystemInfoProtocol
local _ = require(SocialExperiments.DeviceGateFeature)
local t = {}
local t1 = {}

return function(p1) --[[ Line: 18 ]]
	-- upvalues: t (copy), t1 (copy), SystemInfoProtocol (copy)
	if t[p1.featureName] == nil then
		t[p1.featureName] = p1.enabled
	end
	if t[p1.featureName] then
		if t1[p1.featureName] == nil then
			local _, _ = pcall(function() --[[ Line: 25 ]]
				-- upvalues: SystemInfoProtocol (upval), p1 (copy), t1 (upval)
				local SystemInfo = SystemInfoProtocol.default:getSystemInfo({
					SystemInfoProtocol.InfoNames.DEVICE_NAME,
					SystemInfoProtocol.InfoNames.SYSTEM_VERSION,
					SystemInfoProtocol.InfoNames.BASE_OS
				})
				local DeviceName = SystemInfo.deviceName or "UnknownDeviceName"
				
				if typeof(DeviceName) == "string" then
					for Text in p1.deviceNameBlackListString:gmatch("([^|]+)") do
						if DeviceName:lower():find(Text:lower()) then
							t1[p1.featureName] = true
							
							return t1[p1.featureName]
						end
					end
				end
				local BaseOs = SystemInfo.baseOs or "UnknownOS"
				local SystemVersion = SystemInfo.systemVersion or "UnknownVersion"
				
				if typeof(BaseOs) == "string" and typeof(SystemVersion) == "string" then
					local Text1 = BaseOs .. ":" .. SystemVersion
					
					for Text2 in p1.osVersionBlackListString:gmatch("([^|]+)") do
						if Text1:lower():find(Text2:lower()) then
							t1[p1.featureName] = true
							
							return t1[p1.featureName]
						end
					end
				end
				t1[p1.featureName] = false
				
				return t1[p1.featureName]
			end)
			
			if t1[p1.featureName] == nil then
				t1[p1.featureName] = false
			end
		end
	else
		t1[p1.featureName] = false
	end
	return t1[p1.featureName]
end