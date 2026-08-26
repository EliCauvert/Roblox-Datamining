local parent = script.Parent.Parent
local isDetailsItemPartOfBundleAndOffsaleModule = require(parent.Selectors.IsDetailsItemPartOfBundleAndOffsale)
local utilityFunctionsModule = require(parent.UtilityFunctions)

return function(p1)
	-- upvalues: isDetailsItemPartOfBundleAndOffsaleModule (ref), utilityFunctionsModule (ref)
	local assetId = p1.detailsInformation.assetId
	
	if not assetId then
		return false
	end
	local var1 = isDetailsItemPartOfBundleAndOffsaleModule(p1)
	
	if var1 == nil then
		return false
	end
	local var2 = p1.assets[assetId]
	
	return if var2 then if var1 then p1.favorites.bundles[utilityFunctionsModule.getBundleId(var2)] else p1.favorites.assets[assetId] else false
end