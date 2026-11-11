local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetMarketplaceFeeModule = require(Modules.AvatarExperience.Catalog.Actions.SetMarketplaceFee)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch

local function _()
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.GetMarketplaceFeeKey
end

return function(p1)
	-- upvalues: PerformFetch (copy), CatalogConstantsModule (copy), WebApiModule (copy), SetMarketplaceFeeModule (copy), PromiseModule (copy)
	return PerformFetch.Single(CatalogConstantsModule.GetMarketplaceFeeKey, function(p2)
		-- upvalues: WebApiModule (upval), p1 (copy), SetMarketplaceFeeModule (upval), PromiseModule (upval)
		return WebApiModule.GetMarketplaceFee(p1):andThen(function(Result)
			-- upvalues: p2 (copy), SetMarketplaceFeeModule (upval), PromiseModule (upval)
			local ResponseBody = Result and Result.responseBody
			
			if ResponseBody then
				p2:dispatch(SetMarketplaceFeeModule(ResponseBody))
				
				return PromiseModule.resolve()
			else
				return PromiseModule.reject()
			end
		end)
	end)
end