local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Services.Analytics)
local ThunkModule = require(Parent.Thunk)
local list = { AnalyticsModule }

return function(p1, p2) --[[ Line: 11 | Named "sendEvent" ]]
	-- upvalues: ThunkModule (copy), list (copy), AnalyticsModule (copy)
	return ThunkModule.new(script.Name, list, function(_, p3) --[[ Line: 12 ]]
		-- upvalues: AnalyticsModule (upval), p1 (copy), p2 (copy)
		p3[AnalyticsModule].signalEvent(p1, p2)
	end)
end