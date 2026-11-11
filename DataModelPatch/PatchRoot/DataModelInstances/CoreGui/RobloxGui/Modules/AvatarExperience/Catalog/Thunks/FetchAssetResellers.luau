local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetAssetResellersListModule = require(Modules.AvatarExperience.Catalog.Actions.SetAssetResellersList)
local SetAssetLowestPriceModule = require(Modules.AvatarExperience.Catalog.Actions.SetAssetLowestPrice)
local SetUserAssetsFromSellPageAndResellersModule = require(Modules.AvatarExperience.Catalog.Actions.SetUserAssetsFromSellPageAndResellers)
local AppendAssetResellersListModule = require(Modules.AvatarExperience.Catalog.Actions.AppendAssetResellersList)
local SetResellerCursorModule = require(Modules.AvatarExperience.Catalog.Actions.SetResellerCursor)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)

local function _(p1): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.GetResellersKey .. tostring(p1)
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), WebApiModule (copy), SetResellerCursorModule (copy), SetUserAssetsFromSellPageAndResellersModule (copy), AppendAssetResellersListModule (copy), SetAssetResellersListModule (copy), SetAssetLowestPriceModule (copy), PromiseModule (copy), SetNetworkingErrorToastModule (copy)
	ArgCheckModule.isType(p2, "string", "GetResellers thunk expects assetId to be a string")
	
	return PerformFetch.Single(CatalogConstantsModule.GetResellersKey .. tostring(p2), function(p6)
		-- upvalues: WebApiModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), SetResellerCursorModule (upval), SetUserAssetsFromSellPageAndResellersModule (upval), AppendAssetResellersListModule (upval), SetAssetResellersListModule (upval), p5 (copy), SetAssetLowestPriceModule (upval), PromiseModule (upval), SetNetworkingErrorToastModule (upval)
		return WebApiModule.FetchAssetResellers(p1, p2, p3, p4):andThen(function(Result)
			-- upvalues: p6 (copy), SetResellerCursorModule (upval), SetUserAssetsFromSellPageAndResellersModule (upval), p3 (upval), AppendAssetResellersListModule (upval), p2 (upval), SetAssetResellersListModule (upval), p5 (upval), SetAssetLowestPriceModule (upval), PromiseModule (upval), SetNetworkingErrorToastModule (upval)
			local Data = Result and (Result.responseBody and Result.responseBody.data)
			
			if not Data then
				p6:dispatch(SetNetworkingErrorToastModule())
				
				return PromiseModule.reject()
			end
			if #Data <= 0 then
				return PromiseModule.resolve()
			end
			p6:dispatch(SetResellerCursorModule(Result.responseBody.nextPageCursor))
			local List = {}
			
			for _, entry in Data do
				table.insert(List, (tostring(entry.userAssetId)))
			end
			p6:dispatch(SetUserAssetsFromSellPageAndResellersModule(Data))
			
			if p3 then
				p6:dispatch(AppendAssetResellersListModule(p2, List))
			else
				p6:dispatch(SetAssetResellersListModule(p2, List))
			end
			if p5 then
				p6:dispatch(SetAssetLowestPriceModule(p2, Data[1].price))
			end
			return PromiseModule.resolve()
		end)
	end)
end