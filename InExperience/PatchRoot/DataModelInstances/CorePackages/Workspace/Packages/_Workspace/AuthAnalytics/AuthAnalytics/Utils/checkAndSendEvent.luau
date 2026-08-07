local parent = script.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local var1 = dependenciesModule.Analytics.AnalyticsReporters.EventIngest.new(game:GetService("EventIngestService"))
local logging = dependenciesModule.Logging
local eventStreamConstantsModule = require(parent.Constants.EventStreamConstants)
local fFlagEnableAuthAnalyticsPrintDebuggingDev = require(parent.Parent.SharedFlags).FFlagEnableAuthAnalyticsPrintDebuggingDev

return function(p0, p1, p2) --[[ line: 11 ]]
	-- upvalues: eventStreamConstantsModule (ref), logging (ref), fFlagEnableAuthAnalyticsPrintDebuggingDev (ref), var1 (ref)
	local t = {}
	p2[eventStreamConstantsModule.EventTimingKeys.OsClock] = tostring(os.clock())
	p2[eventStreamConstantsModule.EventTimingKeys.OsTime] = tostring(os.time())
	
	for i, v in pairs(p2) do
		if type(i) ~= "string" then
			logging.warn("Failure logging " .. p1 .. ": Expected " .. i .. " to be a string key but got " .. type(i))
			
			return
		end
		t[i] = v
	end
	if fFlagEnableAuthAnalyticsPrintDebuggingDev then
		local var4 = ""
		
		for i_1, v_1 in pairs(t) do
			var4 ..= i_1 .. ": " .. tostring(v_1) .. ", "
		end
		print("Emitting EventIngest " .. p1 .. ", context " .. p0 .. " with args: " .. string.sub(var4, 1, -3))
	end
	var1:sendEventDeferred(p0, p1, t)
end