local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetCatalogMetadataModule = require(Modules.AvatarExperience.Catalog.Actions.SetCatalogMetadata)

return function(p1)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), WebApiModule (copy), SetCatalogMetadataModule (copy), Logging (copy), PromiseModule (copy)
	ArgCheckModule.isType(p1, "function", "GetCatalogMetadata thunk expects networkImpl to be a function")
	
	return PerformFetch.Single("catalog.getcatalogmetadata", function(p2)
		-- upvalues: WebApiModule (upval), p1 (copy), SetCatalogMetadataModule (upval), Logging (upval), PromiseModule (upval)
		return WebApiModule.GetCatalogMetadata(p1):andThen(function(Result)
			-- upvalues: p2 (copy), SetCatalogMetadataModule (upval)
			local ResponseBody = Result.responseBody
			
			if ResponseBody then
				p2:dispatch(SetCatalogMetadataModule(ResponseBody))
			end
			return ResponseBody
		end, function(p3)
			-- upvalues: Logging (upval), p2 (copy), SetCatalogMetadataModule (upval), PromiseModule (upval)
			Logging.warn("WebApi failure in GetCatalogMetadata")
			p2:dispatch(SetCatalogMetadataModule({}))
			PromiseModule.reject(p3)
		end)
	end)
end