local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetAssetResaleDataModule = require(Modules.AvatarExperience.Catalog.Actions.SetAssetResaleData)

local function _(p1): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.GetAssetResalesDataKey .. tostring(p1)
end

return function(p1, p2)
	-- upvalues: ArgCheckModule (copy), PromiseModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), WebApiModule (copy), SetAssetResaleDataModule (copy)
	return function(p3)
		-- upvalues: ArgCheckModule (upval), p2 (copy), PromiseModule (upval), PerformFetch (upval), CatalogConstantsModule (upval), WebApiModule (upval), p1 (copy), SetAssetResaleDataModule (upval)
		ArgCheckModule.isType(p2, "string", "FetchAssetResaleData thunk expects assetId to be a string")
		local AssetInfo = p3:getState().AvatarExperience.Common.AssetInfos[p2]
		
		return if AssetInfo and AssetInfo.receivedFromResaleData then PromiseModule.resolve("We already have the asset resale data") else PerformFetch.Single(CatalogConstantsModule.GetAssetResalesDataKey .. tostring(p2), function(p4)
			-- upvalues: WebApiModule (upval), p1 (upval), p2 (upval), SetAssetResaleDataModule (upval), PromiseModule (upval)
			return WebApiModule.FetchAssetResaleData(p1, p2):andThen(function(Result)
				-- upvalues: p4 (copy), SetAssetResaleDataModule (upval), p2 (upval), PromiseModule (upval)
				local ResponseBody = Result and Result.responseBody
				
				if ResponseBody then
					p4:dispatch(SetAssetResaleDataModule(p2, ResponseBody))
					
					return PromiseModule.resolve()
				else
					return PromiseModule.reject()
				end
			end)
		end)(p3)
	end
end