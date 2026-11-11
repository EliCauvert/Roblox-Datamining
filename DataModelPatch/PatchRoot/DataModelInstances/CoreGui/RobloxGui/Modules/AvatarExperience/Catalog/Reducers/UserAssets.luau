local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UserAssetModelModule = require(Modules.AvatarExperience.Catalog.Models.UserAssetModel)
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetUserAssetsFromSellPageAndResellers).name] = function(p1, p2)
		-- upvalues: UserAssetModelModule (copy), CryoModule (copy)
		local FromSellPageAndResellersResults = {}
		
		for _, userAsset in p2.userAssets do
			local Text = tostring(userAsset.userAssetId)
			local FromSellPageAndResellersResult = UserAssetModelModule.fromSellPageAndResellers(userAsset)
			local v1 = p1[Text]
			
			if v1 then
				FromSellPageAndResellersResults[Text] = CryoModule.Dictionary.join(v1, FromSellPageAndResellersResult)
			else
				FromSellPageAndResellersResults[Text] = FromSellPageAndResellersResult
			end
		end
		return CryoModule.Dictionary.join(p1, FromSellPageAndResellersResults)
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.UpdateUserAssetPrice).name] = function(p3, p4)
		-- upvalues: UserAssetModelModule (copy), CryoModule (copy)
		local Text = tostring(p4.userAssetId)
		local FromPriceInRobuxResult = UserAssetModelModule.fromPriceInRobux(Text, p4.priceInRobux)
		local v2 = p3[Text]
		
		return if v2 then CryoModule.Dictionary.join(p3, {
			[Text] = CryoModule.Dictionary.join(v2, FromPriceInRobuxResult)
		}) else CryoModule.Dictionary.join(p3, { [Text] = FromPriceInRobuxResult })
	end
})