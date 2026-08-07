local retrievalStatus = require(game:GetService("CorePackages").Workspace.Packages.Http).Enum.RetrievalStatus
local parent = script.Parent.Parent
local isDetailsItemPartOfBundleAndOffsaleModule = require(parent.Selectors.IsDetailsItemPartOfBundleAndOffsale)
local utilityFunctionsModule = require(parent.UtilityFunctions)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local var3 = createInspectAndBuyKeyMapperModule("getAssetFavoriteCount")
local var4 = createInspectAndBuyKeyMapperModule("getBundleFavoriteCount")

return function(p0) --[[ line: 14 ]]
	-- upvalues: isDetailsItemPartOfBundleAndOffsaleModule (ref), utilityFunctionsModule (ref), var4 (ref), retrievalStatus (ref), var3 (ref)
	local assetId = p0.detailsInformation.assetId
	
	if not assetId then
		return false
	end
	local var5 = isDetailsItemPartOfBundleAndOffsaleModule(p0)
	
	if var5 == nil then
		return false
	end
	local var6 = p0.assets[assetId]
	
	if not var6 then
		return false
	elseif var5 then
		local var7 = var4(p0.storeId, utilityFunctionsModule.getBundleId(var6))
		
		return if p0.FetchingStatus[var7] ~= retrievalStatus.Fetching then p0.FetchingStatus[var7] == retrievalStatus.Done else true
	end
	local var8 = var3(p0.storeId, assetId)
	
	return if p0.FetchingStatus[var8] ~= retrievalStatus.Fetching then p0.FetchingStatus[var8] == retrievalStatus.Done else true
end