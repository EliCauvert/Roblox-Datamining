local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetAvailableToSellAssetsFromFetchSellDataModule = require(Modules.AvatarExperience.Catalog.Actions.SetAvailableToSellAssetsFromFetchSellData)
local SetCurrentlySellingAssetsFromFetchSellDataModule = require(Modules.AvatarExperience.Catalog.Actions.SetCurrentlySellingAssetsFromFetchSellData)
local SetUserAssetsFromSellPageAndResellersModule = require(Modules.AvatarExperience.Catalog.Actions.SetUserAssetsFromSellPageAndResellers)

local function _(p1): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.GetSellPageDataKey .. tostring(p1)
end

return function(p1, p2, p3)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), WebApiModule (copy), SetUserAssetsFromSellPageAndResellersModule (copy), SetAvailableToSellAssetsFromFetchSellDataModule (copy), SetCurrentlySellingAssetsFromFetchSellDataModule (copy), PromiseModule (copy)
	ArgCheckModule.isType(p2, "string", "FetchSellPageData thunk expects itemId to be a string")
	ArgCheckModule.isType(p3, "string", "FetchSellPageData thunk expects userId to be a string")
	
	return PerformFetch.Single(CatalogConstantsModule.GetSellPageDataKey .. tostring(p2), function(p4)
		-- upvalues: WebApiModule (upval), p1 (copy), p2 (copy), p3 (copy), SetUserAssetsFromSellPageAndResellersModule (upval), SetAvailableToSellAssetsFromFetchSellDataModule (upval), SetCurrentlySellingAssetsFromFetchSellDataModule (upval), PromiseModule (upval)
		return WebApiModule.FetchSellPageData(p1, p2, p3):andThen(function(Result)
			-- upvalues: p4 (copy), SetUserAssetsFromSellPageAndResellersModule (upval), SetAvailableToSellAssetsFromFetchSellDataModule (upval), p2 (upval), SetCurrentlySellingAssetsFromFetchSellDataModule (upval), PromiseModule (upval)
			local Data = Result and (Result.responseBody and Result.responseBody.data)
			
			if not Data then
				return PromiseModule.reject()
			end
			local List = {}
			local List1 = {}
			
			for _, entry in Data do
				local Text = tostring(entry.userAssetId)
				
				if entry.price then
					table.insert(List1, Text)
				else
					table.insert(List, Text)
				end
			end
			p4:dispatch(SetUserAssetsFromSellPageAndResellersModule(Data))
			p4:dispatch(SetAvailableToSellAssetsFromFetchSellDataModule(p2, List))
			p4:dispatch(SetCurrentlySellingAssetsFromFetchSellDataModule(p2, List1))
			
			return PromiseModule.resolve()
		end)
	end)
end