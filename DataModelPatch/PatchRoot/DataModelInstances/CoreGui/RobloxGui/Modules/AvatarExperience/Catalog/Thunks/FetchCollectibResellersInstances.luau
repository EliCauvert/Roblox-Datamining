local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetCollectibleResellersInstancesModule = require(Modules.AvatarExperience.Catalog.Actions.SetCollectibleResellersInstances)
local AppendCollectibleResellersInstancesModule = require(Modules.AvatarExperience.Catalog.Actions.AppendCollectibleResellersInstances)
local SetResellerCursorModule = require(Modules.AvatarExperience.Catalog.Actions.SetResellerCursor)

local function _(p1): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.GetResellersKey .. tostring(p1)
end

return function(p1, p2, p3, p4)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), WebApiModule (copy), SetResellerCursorModule (copy), AppendCollectibleResellersInstancesModule (copy), SetCollectibleResellersInstancesModule (copy), PromiseModule (copy)
	ArgCheckModule.isType(p2, "string", "FetchCollectibResellersInstances thunk expects collectibleItemId")
	
	return PerformFetch.Single(CatalogConstantsModule.GetResellersKey .. tostring(p2), function(p5)
		-- upvalues: WebApiModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), SetResellerCursorModule (upval), AppendCollectibleResellersInstancesModule (upval), SetCollectibleResellersInstancesModule (upval), PromiseModule (upval)
		return WebApiModule.GetCollectibleResellers(p1, p2, p3, p4):andThen(function(Result)
			-- upvalues: p5 (copy), SetResellerCursorModule (upval), p3 (upval), AppendCollectibleResellersInstancesModule (upval), p2 (upval), SetCollectibleResellersInstancesModule (upval), PromiseModule (upval)
			local Data = Result and (Result.responseBody and Result.responseBody.data)
			
			if not Data then
				return PromiseModule.reject()
			end
			local NextPageCursor = Result.responseBody.nextPageCursor
			
			if NextPageCursor and NextPageCursor == "" then
				NextPageCursor = nil
			end
			p5:dispatch(SetResellerCursorModule(NextPageCursor))
			
			if p3 then
				p5:dispatch(AppendCollectibleResellersInstancesModule(p2, Data))
			else
				p5:dispatch(SetCollectibleResellersInstancesModule(p2, Data))
			end
			return PromiseModule.resolve()
		end)
	end)
end