local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local NewResult = DependenciesModule.Analytics.AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")))
local Logging = DependenciesModule.Logging
local EventStreamConstantsModule = require(Parent.Constants.EventStreamConstants)
local FFlagEnableAuthAnalyticsPrintDebuggingDev = require(Parent.Parent.SharedFlags).FFlagEnableAuthAnalyticsPrintDebuggingDev

return function(Text1, Text2, List)
	-- upvalues: EventStreamConstantsModule (copy), Logging (copy), FFlagEnableAuthAnalyticsPrintDebuggingDev (copy), NewResult (copy)
	local t = {}
	List[EventStreamConstantsModule.EventTimingKeys.OsClock] = tostring(os.clock())
	List[EventStreamConstantsModule.EventTimingKeys.OsTime] = tostring(os.time())
	
	for i, value in pairs(List) do
		if type(i) ~= "string" then
			Logging.warn("Failure logging " .. Text2 .. ": Expected " .. i .. " to be a string key but got " .. type(i))
			
			return
		end
		t[i] = value
	end
	if FFlagEnableAuthAnalyticsPrintDebuggingDev then
		local Text = ""
		
		for i1, value1 in pairs(t) do
			Text ..= i1 .. ": " .. tostring(value1) .. ", "
		end
		print("Emitting EventIngest " .. Text2 .. ", context " .. Text1 .. " with args: " .. string.sub(Text, 1, -3))
	end
	NewResult:sendEventDeferred(Text1, Text2, t)
end