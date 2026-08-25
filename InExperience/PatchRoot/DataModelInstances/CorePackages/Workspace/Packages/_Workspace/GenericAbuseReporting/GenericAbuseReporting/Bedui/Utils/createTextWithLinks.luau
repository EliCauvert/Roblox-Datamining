local _ = require(script:FindFirstAncestor("GenericAbuseReporting").Bedui.Provider.AbuseReportBeduiTypes)

return function(p0, p1)
	if p1 == nil then
		return p0
	end
	local var0 = p0
	
	for i in string.gmatch(p0, "{%S+}") do
		local substring = string.sub(i, 2, #i - 1)
		
		if p1[substring] then
			var0 = string.gsub(var0, i, p1[substring].label)
		end
	end
	return var0
end