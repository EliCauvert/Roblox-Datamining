local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local PromiseModule = require(Modules.LuaApp.Promise)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local RemoveLookModule = require(Modules.AvatarExperience.Common.Actions.RemoveLook)
local config = {
	toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
	isLocalized = false,
	toastType = require(Modules.LuaApp.Enum.ToastType).NetworkingError
}

local function _(Text): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.FetchLookDetailInfoKey .. Text
end

return function(p1, p2)
	-- upvalues: PerformFetch (copy), CatalogConstantsModule (copy), WebApiModule (copy), RemoveLookModule (copy), PromiseModule (copy), SetCurrentToastMessageModule (copy), config (copy)
	return function(p3)
		-- upvalues: PerformFetch (upval), p2 (copy), CatalogConstantsModule (upval), WebApiModule (upval), p1 (copy), RemoveLookModule (upval), PromiseModule (upval), SetCurrentToastMessageModule (upval), config (upval)
		return PerformFetch.Single(CatalogConstantsModule.FetchLookDetailInfoKey .. p2, function(p4)
			-- upvalues: WebApiModule (upval), p1 (upval), p2 (upval), RemoveLookModule (upval), PromiseModule (upval), SetCurrentToastMessageModule (upval), config (upval)
			return WebApiModule.DeleteLook(p1, p2):andThen(function(_)
				-- upvalues: p4 (copy), RemoveLookModule (upval), p2 (upval), PromiseModule (upval)
				p4:dispatch(RemoveLookModule(p2))
				
				return PromiseModule.resolve()
			end):catch(function(Err)
				-- upvalues: p4 (copy), RemoveLookModule (upval), p2 (upval), PromiseModule (upval), SetCurrentToastMessageModule (upval), config (upval)
				local StatusCode = Err and Err.StatusCode
				
				if StatusCode and StatusCode == 404 then
					p4:dispatch(RemoveLookModule(p2))
					
					return PromiseModule.resolve()
				else
					p4:dispatch(SetCurrentToastMessageModule(config))
					
					return PromiseModule.reject(Err)
				end
			end)
		end)(p3)
	end
end