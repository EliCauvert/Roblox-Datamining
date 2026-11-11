local RetrievalStatus = require(game:GetService("CorePackages").Workspace.Packages.Http).Enum.RetrievalStatus
local Parent = script.Parent.Parent
local IsDetailsItemPartOfBundleAndOffsaleModule = require(Parent.Selectors.IsDetailsItemPartOfBundleAndOffsale)
local UtilityFunctionsModule = require(Parent.UtilityFunctions)
local CreateInspectAndBuyKeyMapperModule = require(Parent.createInspectAndBuyKeyMapper)
local GetAssetFavoriteCount = CreateInspectAndBuyKeyMapperModule("getAssetFavoriteCount")
local GetBundleFavoriteCount = CreateInspectAndBuyKeyMapperModule("getBundleFavoriteCount")

return function(p1): boolean
	-- upvalues: IsDetailsItemPartOfBundleAndOffsaleModule (copy), UtilityFunctionsModule (copy), GetBundleFavoriteCount (copy), RetrievalStatus (copy), GetAssetFavoriteCount (copy)
	local AssetId = p1.detailsInformation.assetId
	
	if not AssetId then
		return false
	end
	local IsDetailsItemPartOfBundleAndOffsaleModule1 = IsDetailsItemPartOfBundleAndOffsaleModule(p1)
	
	if IsDetailsItemPartOfBundleAndOffsaleModule1 == nil then
		return false
	end
	local Asset = p1.assets[AssetId]
	
	if not Asset then
		return false
	elseif IsDetailsItemPartOfBundleAndOffsaleModule1 then
		local BundleFavoriteCount = GetBundleFavoriteCount(p1.storeId, (UtilityFunctionsModule.getBundleId(Asset)))
		
		return p1.FetchingStatus[BundleFavoriteCount] == RetrievalStatus.Fetching or p1.FetchingStatus[BundleFavoriteCount] == RetrievalStatus.Done
	else
		local AssetFavoriteCount = GetAssetFavoriteCount(p1.storeId, AssetId)
		
		return p1.FetchingStatus[AssetFavoriteCount] == RetrievalStatus.Fetching or p1.FetchingStatus[AssetFavoriteCount] == RetrievalStatus.Done
	end
end