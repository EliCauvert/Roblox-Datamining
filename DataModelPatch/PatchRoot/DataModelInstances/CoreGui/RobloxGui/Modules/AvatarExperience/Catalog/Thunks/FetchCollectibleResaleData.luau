local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetCollectibleResaleDataModule = require(Modules.AvatarExperience.Catalog.Actions.SetCollectibleResaleData)

local function _(p1): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.FetchCollectibleResaleDataKey .. tostring(p1)
end

return function(p1, p2)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), WebApiModule (copy), SetCollectibleResaleDataModule (copy), PromiseModule (copy)
	ArgCheckModule.isType(p2, "string", "FetchCollectibleResaleData thunk expects collectibleItemId")
	
	return PerformFetch.Single(CatalogConstantsModule.FetchCollectibleResaleDataKey .. tostring(p2), function(p3)
		-- upvalues: WebApiModule (upval), p1 (copy), p2 (copy), SetCollectibleResaleDataModule (upval), PromiseModule (upval)
		return WebApiModule.FetchCollectibleResaleData(p1, p2):andThen(function(Result)
			-- upvalues: p3 (copy), SetCollectibleResaleDataModule (upval), p2 (upval), PromiseModule (upval)
			local ResponseBody = Result and Result.responseBody
			
			if ResponseBody then
				p3:dispatch(SetCollectibleResaleDataModule(p2, ResponseBody))
				
				return PromiseModule.resolve()
			else
				return PromiseModule.reject()
			end
		end)
	end)
end