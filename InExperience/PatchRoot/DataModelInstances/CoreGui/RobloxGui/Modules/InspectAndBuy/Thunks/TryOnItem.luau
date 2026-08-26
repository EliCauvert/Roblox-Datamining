local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local analyticsModule = require(parent.Services.Analytics)
local setTryingOnInfoModule = require(parent.Actions.SetTryingOnInfo)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { analyticsModule }

return function(p1, p2, p3, p4, p5)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), setTryingOnInfoModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p6, p7)
		-- upvalues: analyticsModule (copy), p4 (ref), p5 (ref), p2 (ref), setTryingOnInfoModule (copy), p1 (ref), p3 (ref), sendCounterModule (copy), constantsModule (copy)
		local var1, var2
		local var3 = p7[analyticsModule]
		local _ = nil
		local _ = nil
		
		if p4 then
			var1 = "Bundle"
			var2 = p5
		else
			var1 = "Asset"
			var2 = p2
		end
		var3.reportTryOnButtonClicked(var1, var2)
		p6:dispatch(setTryingOnInfoModule(p1, p2, p3))
		p6:dispatch(sendCounterModule(constantsModule.Counters.TryOnButtonClicked))
	end)
end