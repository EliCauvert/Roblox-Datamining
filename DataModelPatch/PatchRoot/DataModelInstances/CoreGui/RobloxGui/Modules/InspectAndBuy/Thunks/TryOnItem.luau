local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local AnalyticsModule = require(Parent.Services.Analytics)
local SetTryingOnInfoModule = require(Parent.Actions.SetTryingOnInfo)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { AnalyticsModule }

return function(p1, p2, p3, p4, p5)
	-- upvalues: ThunkModule (copy), list (copy), AnalyticsModule (copy), SetTryingOnInfoModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p6, p7)
		-- upvalues: AnalyticsModule (upval), p4 (copy), p5 (copy), p2 (copy), SetTryingOnInfoModule (upval), p1 (copy), p3 (copy), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p7[AnalyticsModule]
		local v2 = nil
		local v3 = nil
		
		if p4 then
			v2 = "Bundle"
			v3 = p5
		else
			v2 = "Asset"
			v3 = p2
		end
		v1.reportTryOnButtonClicked(v2, v3)
		p6:dispatch(SetTryingOnInfoModule(p1, p2, p3))
		p6:dispatch(SendCounterModule(ConstantsModule.Counters.TryOnButtonClicked))
	end)
end