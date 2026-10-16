local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local AnalyticsModule = require(Parent.Services.Analytics)
local UtilityFunctionsModule = require(Parent.UtilityFunctions)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { AnalyticsModule }

return function(p1) --[[ Line: 18 | Named "ReportOpenDetailsPage" ]]
	-- upvalues: ThunkModule (copy), list (copy), AnalyticsModule (copy), UtilityFunctionsModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3) --[[ Line: 19 ]]
		-- upvalues: AnalyticsModule (upval), p1 (copy), UtilityFunctionsModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p3[AnalyticsModule]
		local v2 = nil
		local BundleId = nil
		
		if p1 and p1.parentBundleId ~= nil then
			v2 = "Bundle"
			BundleId = UtilityFunctionsModule.getBundleId(p1)
		else
			v2 = "Asset"
			BundleId = p1.assetId
		end
		v1.reportItemDetailPageOpened(v2, BundleId)
		p2:dispatch(SendCounterModule(ConstantsModule.Counters.ItemDetailPageOpened))
	end)
end