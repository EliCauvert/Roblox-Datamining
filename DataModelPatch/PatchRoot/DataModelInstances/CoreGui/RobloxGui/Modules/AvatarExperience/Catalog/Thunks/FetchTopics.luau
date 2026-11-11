local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local DashModule = require(CorePackages.Packages.Dash)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local _ = require(CorePackages.Workspace.Packages.Http)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SetTopicsModule = require(Modules.AvatarExperience.Catalog.Actions.SetTopics)

local function _(p1, p2, p3): string
	-- upvalues: CatalogConstantsModule (copy), CatalogUtilsModule (copy)
	return CatalogConstantsModule.GetTopicsKey .. CatalogUtilsModule.getTopicRequestKey(p1, p2, p3)
end

return function(p1, p2, p3, p4)
	-- upvalues: PerformFetch (copy), CatalogConstantsModule (copy), CatalogUtilsModule (copy), WebApiModule (copy), DashModule (copy), SetTopicsModule (copy), PromiseModule (copy), Logging (copy)
	return PerformFetch.Single(CatalogConstantsModule.GetTopicsKey .. CatalogUtilsModule.getTopicRequestKey(p2, p3, p4), function(p5)
		-- upvalues: p2 (copy), p4 (copy), WebApiModule (upval), p1 (copy), p3 (copy), DashModule (upval), SetTopicsModule (upval), PromiseModule (upval), Logging (upval)
		return (if #p2 == 0 and not p4 then WebApiModule.GetInitialTopics(p1, p3 or {}) else WebApiModule.GetTopics(p1, p2, p4)):andThen(function(Result)
			-- upvalues: DashModule (upval), p5 (copy), SetTopicsModule (upval), p2 (upval), p3 (upval), p4 (upval), PromiseModule (upval)
			local MapResult = DashModule.map((Result.responseBody or {}).topics or {}, function(p6): string
				return string.lower(p6.displayName)
			end)
			p5:dispatch(SetTopicsModule(p2, p3, p4, MapResult))
			
			return PromiseModule.resolve(MapResult)
		end, function(p6)
			-- upvalues: Logging (upval)
			Logging.warn("FetchTopics failure: " .. tostring(p6))
		end)
	end)
end