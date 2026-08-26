local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local analyticsModule = require(parent.Services.Analytics)
local utilityFunctionsModule = require(parent.UtilityFunctions)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { analyticsModule }

return function(p1)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), utilityFunctionsModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: analyticsModule (copy), p1 (ref), utilityFunctionsModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var1, assetId
		local var2 = p3[analyticsModule]
		local var3 = p1 and p1.parentBundleId ~= nil
		local _ = nil
		local _ = nil
		
		if var3 then
			var1 = "Bundle"
			assetId = utilityFunctionsModule.getBundleId(p1)
		else
			var1 = "Asset"
			assetId = p1.assetId
		end
		var2.reportItemDetailPageOpened(var1, assetId)
		p2:dispatch(sendCounterModule(constantsModule.Counters.ItemDetailPageOpened))
	end)
end