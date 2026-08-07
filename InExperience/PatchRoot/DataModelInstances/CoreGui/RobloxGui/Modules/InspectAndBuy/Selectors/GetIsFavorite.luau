local parent = script.Parent.Parent
local isDetailsItemPartOfBundleAndOffsaleModule = require(parent.Selectors.IsDetailsItemPartOfBundleAndOffsale)
local utilityFunctionsModule = require(parent.UtilityFunctions)

return function(p0) --[[ line: 8 ]]
	-- upvalues: isDetailsItemPartOfBundleAndOffsaleModule (ref), utilityFunctionsModule (ref)
	local assetId = p0.detailsInformation.assetId
	
	if not assetId then
		return false
	end
	local var2 = isDetailsItemPartOfBundleAndOffsaleModule(p0)
	
	if var2 == nil then
		return false
	end
	local var3 = p0.assets[assetId]
	
	return if var3 then if var2 then p0.favorites.bundles[utilityFunctionsModule.getBundleId(var3)] else p0.favorites.assets[assetId] else false
end