local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetCollectibleResellableInstancesModule = require(Modules.AvatarExperience.Catalog.Actions.SetCollectibleResellableInstances)

local function _(p1): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.FetchCollectibleResellableInstancesKey .. tostring(p1)
end

return function(p1, p2, p3)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), WebApiModule (copy), SetCollectibleResellableInstancesModule (copy), PromiseModule (copy)
	ArgCheckModule.isType(p2, "string", "FetchCollectibleResellableInstances thunk expects collectibleItemId")
	ArgCheckModule.isType(p3, "string", "FetchCollectibleResellableInstances thunk expects userId")
	
	return PerformFetch.Single(CatalogConstantsModule.FetchCollectibleResellableInstancesKey .. tostring(p2), function(p4)
		-- upvalues: WebApiModule (upval), p1 (copy), p2 (copy), p3 (copy), SetCollectibleResellableInstancesModule (upval), PromiseModule (upval)
		return WebApiModule.FetchCollectibleResellableInstances(p1, p2, p3):andThen(function(Result)
			-- upvalues: p4 (copy), SetCollectibleResellableInstancesModule (upval), p2 (upval), PromiseModule (upval)
			local ItemInstances = Result and (Result.responseBody and Result.responseBody.itemInstances)
			
			if ItemInstances then
				p4:dispatch(SetCollectibleResellableInstancesModule(p2, ItemInstances))
				
				return PromiseModule.resolve()
			else
				return PromiseModule.reject()
			end
		end)
	end)
end