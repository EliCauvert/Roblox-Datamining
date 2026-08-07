local socialExperiments = script:FindFirstAncestor("SocialExperiments")
local systemInfoProtocol = require(socialExperiments.Parent.SystemInfoProtocol).SystemInfoProtocol
local _ = require(socialExperiments.DeviceGateFeature)
local t = {}
local t_1 = {}

return function(p0) --[[ line: 18 ]]
	-- upvalues: t (ref), t_1 (ref), systemInfoProtocol (ref)
	if t[p0.featureName] == nil then
		t[p0.featureName] = p0.enabled
	end
	if not t[p0.featureName] then
		t_1[p0.featureName] = false
	elseif t_1[p0.featureName] == nil then
		local _, _ = pcall(function() --[[ line: 25 ]]
			-- upvalues: systemInfoProtocol (copy), p0 (ref), t_1 (copy)
			local var3 = systemInfoProtocol.default:getSystemInfo({
				systemInfoProtocol.InfoNames.DEVICE_NAME,
				systemInfoProtocol.InfoNames.SYSTEM_VERSION,
				systemInfoProtocol.InfoNames.BASE_OS
			})
			local deviceName = var3.deviceName or "UnknownDeviceName"
			
			if typeof(deviceName) == "string" then
				for i in p0.deviceNameBlackListString:gmatch("([^|]+)") do
					if deviceName:lower():find(i:lower()) then
						t_1[p0.featureName] = true
						
						return t_1[p0.featureName]
					end
				end
			end
			local baseOs = var3.baseOs or "UnknownOS"
			local systemVersion = var3.systemVersion or "UnknownVersion"
			
			if typeof(baseOs) == "string" and typeof(systemVersion) == "string" then
				local text = baseOs .. ":" .. systemVersion
				
				for i in p0.osVersionBlackListString:gmatch("([^|]+)") do
					if text:lower():find(i:lower()) then
						t_1[p0.featureName] = true
						
						return t_1[p0.featureName]
					end
				end
			end
			t_1[p0.featureName] = false
			
			return t_1[p0.featureName]
		end)
		
		if t_1[p0.featureName] == nil then
			t_1[p0.featureName] = false
		end
	end
	return t_1[p0.featureName]
end