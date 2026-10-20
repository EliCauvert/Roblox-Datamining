local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PromiseModule = require(CorePackages.Packages.Promise)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local WebApiModule = require(Modules.AvatarExperience.AvatarEditor.Http.WebApi)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local DebugAvatarDataDelay = game:DefineFastInt("DebugAvatarDataDelay", 0)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow

return function(p1, CheckAssetAvailability)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), ConstantsModule (copy), FFlagAXModeratedItemsFlow (copy), WebApiModule (copy), DebugAvatarDataDelay (copy), UtilsModule (copy), Logging (copy), PromiseModule (copy)
	ArgCheckModule.isType(p1, "function", "GetAvatarData thunk expects networkImpl to be a function")
	
	return PerformFetch.Single(ConstantsModule.GetAvatarDataKey, function(_)
		-- upvalues: FFlagAXModeratedItemsFlow (upval), CheckAssetAvailability (copy), WebApiModule (upval), p1 (copy), DebugAvatarDataDelay (upval), UtilsModule (upval), Logging (upval), PromiseModule (upval)
		return WebApiModule.GetAvatarData(p1, if FFlagAXModeratedItemsFlow then { checkAssetAvailability = CheckAssetAvailability } else nil):andThen(function(Result)
			-- upvalues: DebugAvatarDataDelay (upval), UtilsModule (upval)
			if DebugAvatarDataDelay > 0 then
				task.wait(DebugAvatarDataDelay)
			end
			return UtilsModule.tableToCamelCaseKeys(Result.responseBody)
		end, function(p2)
			-- upvalues: Logging (upval), PromiseModule (upval)
			Logging.warn("WebApi failure in GetAvatarData: " .. tostring(p2))
			
			return PromiseModule.reject(p2)
		end)
	end)
end