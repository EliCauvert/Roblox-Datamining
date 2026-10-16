local RetrievalStatus = require(game:GetService("CorePackages").Workspace.Packages.Http).Enum.RetrievalStatus
local Parent = script.Parent.Parent
local IsDetailsItemPartOfBundleAndOffsaleModule = require(Parent.Selectors.IsDetailsItemPartOfBundleAndOffsale)
local UtilityFunctionsModule = require(Parent.UtilityFunctions)
local CreateInspectAndBuyKeyMapperModule = require(Parent.createInspectAndBuyKeyMapper)
local GetFavoriteForAsset = CreateInspectAndBuyKeyMapperModule("getFavoriteForAsset")
local GetFavoriteForBundle = CreateInspectAndBuyKeyMapperModule("getFavoriteForBundle")

return function(p1): boolean --[[ Line: 14 ]]
	-- upvalues: IsDetailsItemPartOfBundleAndOffsaleModule (copy), UtilityFunctionsModule (copy), GetFavoriteForBundle (copy), RetrievalStatus (copy), GetFavoriteForAsset (copy)
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
		local FavoriteForBundle = GetFavoriteForBundle(p1.storeId, (UtilityFunctionsModule.getBundleId(Asset)))
		
		return p1.FetchingStatus[FavoriteForBundle] == RetrievalStatus.Fetching or p1.FetchingStatus[FavoriteForBundle] == RetrievalStatus.Done
	else
		local FavoriteForAsset = GetFavoriteForAsset(p1.storeId, AssetId)
		
		return p1.FetchingStatus[FavoriteForAsset] == RetrievalStatus.Fetching or p1.FetchingStatus[FavoriteForAsset] == RetrievalStatus.Done
	end
end