local Parent = script.Parent.Parent
local IsDetailsItemPartOfBundleAndOffsaleModule = require(Parent.Selectors.IsDetailsItemPartOfBundleAndOffsale)
local UtilityFunctionsModule = require(Parent.UtilityFunctions)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: IsDetailsItemPartOfBundleAndOffsaleModule (copy), UtilityFunctionsModule (copy)
	local AssetId = p1.detailsInformation.assetId
	
	if not AssetId then
		return false
	end
	local IsDetailsItemPartOfBundleAndOffsaleModule1 = IsDetailsItemPartOfBundleAndOffsaleModule(p1)
	
	if IsDetailsItemPartOfBundleAndOffsaleModule1 == nil then
		return false
	else
		local Asset = p1.assets[AssetId]
		
		return if Asset then if IsDetailsItemPartOfBundleAndOffsaleModule1 then p1.favorites.bundles[UtilityFunctionsModule.getBundleId(Asset)] else p1.favorites.assets[AssetId] else false
	end
end