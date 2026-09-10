local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local analyticsModule = require(parent.Services.Analytics)
local getPurchaseAnalyticsOptionsModule = require(parent.Selectors.GetPurchaseAnalyticsOptions)
local list = { analyticsModule }

return function(p1, p2, p3)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), getPurchaseAnalyticsOptionsModule (ref)
	return thunkModule.new(script.Name, list, function(p4, p5)
		-- upvalues: analyticsModule (copy), p2 (ref), p1 (ref), getPurchaseAnalyticsOptionsModule (copy), p3 (ref)
		p5[analyticsModule].reportPurchaseSuccessUnifiedEvent(p2, p1, getPurchaseAnalyticsOptionsModule(p4:getState(), p1, p2, p3))
	end)
end