local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local analyticsModule = require(parent.Services.Analytics)
local utilityFunctionsModule = require(parent.UtilityFunctions)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { analyticsModule }

return function(p0)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), utilityFunctionsModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: analyticsModule (copy), p0 (ref), utilityFunctionsModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var8, assetId
		local var6 = p2[analyticsModule]
		local var7 = p0 and p0.parentBundleId ~= nil
		local _ = nil
		local _ = nil
		
		if var7 then
			var8 = "Bundle"
			assetId = utilityFunctionsModule.getBundleId(p0)
		else
			var8 = "Asset"
			assetId = p0.assetId
		end
		var6.reportItemDetailPageOpened(var8, assetId)
		p1:dispatch(sendCounterModule(constantsModule.Counters.ItemDetailPageOpened))
	end)
end