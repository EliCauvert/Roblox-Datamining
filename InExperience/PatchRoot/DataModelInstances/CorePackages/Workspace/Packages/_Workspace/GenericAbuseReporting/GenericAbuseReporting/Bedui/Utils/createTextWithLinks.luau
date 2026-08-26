local _ = require(script:FindFirstAncestor("GenericAbuseReporting").Bedui.Provider.AbuseReportBeduiTypes)

return function(p1, p2)
	if p2 == nil then
		return p1
	end
	local var1 = p1
	
	for i in string.gmatch(p1, "{%S+}") do
		local substring = string.sub(i, 2, #i - 1)
		
		if p2[substring] then
			var1 = string.gsub(var1, i, p2[substring].label)
		end
	end
	return var1
end