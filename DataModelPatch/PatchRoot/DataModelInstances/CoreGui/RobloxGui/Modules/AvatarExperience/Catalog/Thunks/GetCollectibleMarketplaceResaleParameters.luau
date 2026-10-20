local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetCollectibleMarketplaceResaleParametersModule = require(Modules.AvatarExperience.Catalog.Actions.SetCollectibleMarketplaceResaleParameters)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)

local function _(p1): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.GetCollectibleMarketplaceResaleParametersKey .. tostring(p1)
end

return function(p1, p2, p3)
	-- upvalues: PerformFetch (copy), CatalogConstantsModule (copy), WebApiModule (copy), SetCollectibleMarketplaceResaleParametersModule (copy), PromiseModule (copy)
	return PerformFetch.Single(CatalogConstantsModule.GetCollectibleMarketplaceResaleParametersKey .. tostring(p2), function(p4)
		-- upvalues: WebApiModule (upval), p1 (copy), p2 (copy), SetCollectibleMarketplaceResaleParametersModule (upval), p3 (copy), PromiseModule (upval)
		return WebApiModule.GetCollectibleMarketplaceResaleParameters(p1, p2):andThen(function(Result)
			-- upvalues: p4 (copy), SetCollectibleMarketplaceResaleParametersModule (upval), p2 (upval), p3 (upval), PromiseModule (upval)
			local ResponseBody = Result and Result.responseBody
			
			if ResponseBody then
				p4:dispatch(SetCollectibleMarketplaceResaleParametersModule(p2, ResponseBody, p3))
				
				return PromiseModule.resolve()
			else
				return PromiseModule.reject()
			end
		end)
	end)
end