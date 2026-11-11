local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetLookFavoriteModule = require(Modules.AvatarExperience.Catalog.Actions.SetLookFavorite)

return if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport then function(p1, p2, p3, p4)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), WebApiModule (copy), SetLookFavoriteModule (copy), PromiseModule (copy), Logging (copy)
	ArgCheckModule.isType(p1, "function", "SetLookFavorite thunk expects networkImpl to be a function")
	ArgCheckModule.isType(p2, "string", "SetLookFavorite thunk expects lookId to be a string")
	ArgCheckModule.isType(p3, "boolean", "SetLookFavorite thunk expects isFavorited to be a boolean")
	
	return PerformFetch.Single("look.setlookfavorite", function(p5)
		-- upvalues: p3 (copy), WebApiModule (upval), p1 (copy), p2 (copy), p4 (copy), SetLookFavoriteModule (upval), PromiseModule (upval), Logging (upval)
		return if p3 then WebApiModule.FavoriteLookV2(p1, p2, p4):andThen(function(Result)
			-- upvalues: p5 (copy), SetLookFavoriteModule (upval), p2 (upval), PromiseModule (upval)
			if Result.responseBody then
				p5:dispatch(SetLookFavoriteModule(p2, true))
			end
			return PromiseModule.resolve()
		end, function(p6)
			-- upvalues: Logging (upval), PromiseModule (upval)
			Logging.warn("WebApi failure in SetLookFavorite")
			
			return PromiseModule.reject(p6)
		end) else WebApiModule.UnfavoriteLookV2(p1, p2, p4):andThen(function(Result)
			-- upvalues: p5 (copy), SetLookFavoriteModule (upval), p2 (upval), PromiseModule (upval)
			if Result.responseBody then
				p5:dispatch(SetLookFavoriteModule(p2, false))
			end
			return PromiseModule.resolve()
		end, function(p6)
			-- upvalues: Logging (upval), p5 (copy), SetLookFavoriteModule (upval), PromiseModule (upval)
			Logging.warn("WebApi failure in SetLookFavorite")
			p5:dispatch(SetLookFavoriteModule({}))
			
			return PromiseModule.reject(p6)
		end)
	end)
end else function(p1, p2, p3)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), WebApiModule (copy), SetLookFavoriteModule (copy), PromiseModule (copy), Logging (copy)
	ArgCheckModule.isType(p1, "function", "SetLookFavorite thunk expects networkImpl to be a function")
	ArgCheckModule.isType(p2, "string", "SetLookFavorite thunk expects lookId to be a string")
	ArgCheckModule.isType(p3, "boolean", "SetLookFavorite thunk expects isFavorited to be a boolean")
	
	return PerformFetch.Single("look.setlookfavorite", function(p4)
		-- upvalues: p3 (copy), WebApiModule (upval), p1 (copy), p2 (copy), SetLookFavoriteModule (upval), PromiseModule (upval), Logging (upval)
		return if p3 then WebApiModule.FavoriteLook(p1, p2):andThen(function(Result)
			-- upvalues: p4 (copy), SetLookFavoriteModule (upval), p2 (upval), PromiseModule (upval)
			if Result.responseBody then
				p4:dispatch(SetLookFavoriteModule(p2, true))
			end
			return PromiseModule.resolve()
		end, function(p5)
			-- upvalues: Logging (upval), PromiseModule (upval)
			Logging.warn("WebApi failure in SetLookFavorite")
			
			return PromiseModule.reject(p5)
		end) else WebApiModule.UnfavoriteLook(p1, p2):andThen(function(Result)
			-- upvalues: p4 (copy), SetLookFavoriteModule (upval), p2 (upval), PromiseModule (upval)
			if Result.responseBody then
				p4:dispatch(SetLookFavoriteModule(p2, false))
			end
			return PromiseModule.resolve()
		end, function(p5)
			-- upvalues: Logging (upval), p4 (copy), SetLookFavoriteModule (upval), PromiseModule (upval)
			Logging.warn("WebApi failure in SetLookFavorite")
			p4:dispatch(SetLookFavoriteModule({}))
			
			return PromiseModule.reject(p5)
		end)
	end)
end