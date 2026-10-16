local _ = require(script:FindFirstAncestor("GenericAbuseReporting").Bedui.Provider.AbuseReportBeduiTypes)

return function(Text: string, p1): string --[[ Line: 20 ]]
	if p1 == nil then
		return Text
	end
	local Text1: string = Text
	
	for i in string.gmatch(Text, "{%S+}") do
		local Segment = string.sub(i, 2, #i - 1)
		
		if p1[Segment] then
			Text1 = string.gsub(Text1, i, p1[Segment].label)
		end
	end
	return Text1
end