local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local AnalyticsModule = require(Parent.Services.Analytics)
local list = { AnalyticsModule }

return function(p1) --[[ Line: 12 | Named "SendCounter" ]]
	-- upvalues: ThunkModule (copy), list (copy), AnalyticsModule (copy)
	return ThunkModule.new(script.Name, list, function(_, p2) --[[ Line: 13 ]]
		-- upvalues: AnalyticsModule (upval), p1 (copy)
		p2[AnalyticsModule].sendCounter(p1)
	end)
end