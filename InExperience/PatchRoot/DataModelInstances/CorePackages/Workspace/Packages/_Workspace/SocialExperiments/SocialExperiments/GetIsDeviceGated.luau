local socialExperiments = script:FindFirstAncestor("SocialExperiments")
local systemInfoProtocol = require(socialExperiments.Parent.SystemInfoProtocol).SystemInfoProtocol
local _ = require(socialExperiments.DeviceGateFeature)
local t = {}
local t_1 = {}

return function(p1)
	-- upvalues: t (ref), t_1 (ref), systemInfoProtocol (ref)
	if t[p1.featureName] == nil then
		t[p1.featureName] = p1.enabled
	end
	if not t[p1.featureName] then
		t_1[p1.featureName] = false
	elseif t_1[p1.featureName] == nil then
		local _, _ = pcall(function()
			-- upvalues: systemInfoProtocol (copy), p1 (ref), t_1 (copy)
			local var1 = systemInfoProtocol.default:getSystemInfo({
				systemInfoProtocol.InfoNames.DEVICE_NAME,
				systemInfoProtocol.InfoNames.SYSTEM_VERSION,
				systemInfoProtocol.InfoNames.BASE_OS
			})
			local deviceName = var1.deviceName or "UnknownDeviceName"
			
			if typeof(deviceName) == "string" then
				for i in p1.deviceNameBlackListString:gmatch("([^|]+)") do
					if deviceName:lower():find(i:lower()) then
						t_1[p1.featureName] = true
						
						return t_1[p1.featureName]
					end
				end
			end
			local baseOs = var1.baseOs or "UnknownOS"
			local systemVersion = var1.systemVersion or "UnknownVersion"
			
			if typeof(baseOs) == "string" and typeof(systemVersion) == "string" then
				local text = baseOs .. ":" .. systemVersion
				
				for i in p1.osVersionBlackListString:gmatch("([^|]+)") do
					if text:lower():find(i:lower()) then
						t_1[p1.featureName] = true
						
						return t_1[p1.featureName]
					end
				end
			end
			t_1[p1.featureName] = false
			
			return t_1[p1.featureName]
		end)
		
		if t_1[p1.featureName] == nil then
			t_1[p1.featureName] = false
		end
	end
	return t_1[p1.featureName]
end