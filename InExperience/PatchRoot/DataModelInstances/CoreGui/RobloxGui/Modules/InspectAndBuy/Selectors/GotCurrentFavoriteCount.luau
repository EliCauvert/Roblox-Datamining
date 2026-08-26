local retrievalStatus = require(game:GetService("CorePackages").Workspace.Packages.Http).Enum.RetrievalStatus
local parent = script.Parent.Parent
local isDetailsItemPartOfBundleAndOffsaleModule = require(parent.Selectors.IsDetailsItemPartOfBundleAndOffsale)
local utilityFunctionsModule = require(parent.UtilityFunctions)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local var1 = createInspectAndBuyKeyMapperModule("getAssetFavoriteCount")
local var2 = createInspectAndBuyKeyMapperModule("getBundleFavoriteCount")

return function(p1)
	-- upvalues: isDetailsItemPartOfBundleAndOffsaleModule (ref), utilityFunctionsModule (ref), var2 (ref), retrievalStatus (ref), var1 (ref)
	local assetId = p1.detailsInformation.assetId
	
	if not assetId then
		return false
	end
	local var3 = isDetailsItemPartOfBundleAndOffsaleModule(p1)
	
	if var3 == nil then
		return false
	end
	local var4 = p1.assets[assetId]
	
	if not var4 then
		return false
	elseif var3 then
		local var5 = var2(p1.storeId, utilityFunctionsModule.getBundleId(var4))
		
		return if p1.FetchingStatus[var5] ~= retrievalStatus.Fetching then p1.FetchingStatus[var5] == retrievalStatus.Done else true
	end
	local var6 = var1(p1.storeId, assetId)
	
	return if p1.FetchingStatus[var6] ~= retrievalStatus.Fetching then p1.FetchingStatus[var6] == retrievalStatus.Done else true
end