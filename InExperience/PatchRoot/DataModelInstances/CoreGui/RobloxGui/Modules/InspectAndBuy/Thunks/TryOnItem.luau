local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local analyticsModule = require(parent.Services.Analytics)
local setTryingOnInfoModule = require(parent.Actions.SetTryingOnInfo)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { analyticsModule }

return function(p0, p1, p2, p3, p4) --[[ line: 18 | named "TryOnItem" ]]
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), setTryingOnInfoModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p5, p6) --[[ line: 19 ]]
		-- upvalues: analyticsModule (copy), p3 (ref), p4 (ref), p1 (ref), setTryingOnInfoModule (copy), p0 (ref), p2 (ref), sendCounterModule (copy), constantsModule (copy)
		local var7, var8
		local var6 = p6[analyticsModule]
		local _ = nil
		local _ = nil
		
		if p3 then
			var7 = "Bundle"
			var8 = p4
		else
			var7 = "Asset"
			var8 = p1
		end
		var6.reportTryOnButtonClicked(var7, var8)
		p5:dispatch(setTryingOnInfoModule(p0, p1, p2))
		p5:dispatch(sendCounterModule(constantsModule.Counters.TryOnButtonClicked))
	end)
end