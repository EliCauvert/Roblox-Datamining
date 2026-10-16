local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local AnalyticsModule = require(Parent.Services.Analytics)
local GetPurchaseAnalyticsOptionsModule = require(Parent.Selectors.GetPurchaseAnalyticsOptions)
local list = { AnalyticsModule }

return function(p1, p2, p3) --[[ Line: 21 | Named "ReportPurchaseSuccessUnifiedEvent" ]]
	-- upvalues: ThunkModule (copy), list (copy), AnalyticsModule (copy), GetPurchaseAnalyticsOptionsModule (copy)
	return ThunkModule.new(script.Name, list, function(p4, p5) --[[ Line: 22 ]]
		-- upvalues: AnalyticsModule (upval), p2 (copy), p1 (copy), GetPurchaseAnalyticsOptionsModule (upval), p3 (copy)
		p5[AnalyticsModule].reportPurchaseSuccessUnifiedEvent(p2, p1, GetPurchaseAnalyticsOptionsModule(p4:getState(), p1, p2, p3))
	end)
end