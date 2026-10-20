local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local CryoModule = require(CorePackages.Packages.Cryo)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.AvatarExperience.Common.Types)
local ReceivedAvatarDataModule = require(Modules.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData)
local SetRangesAndSliderValuesFromBodyColor3sModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetRangesAndSliderValuesFromBodyColor3s)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local WebApiModule = require(Modules.AvatarExperience.AvatarEditor.Http.WebApi)

return function(p1, CheckAssetAvailability)
	-- upvalues: ArgCheckModule (copy), WebApiModule (copy), UtilsModule (copy), CryoModule (copy), ReceivedAvatarDataModule (copy), SetRangesAndSliderValuesFromBodyColor3sModule (copy), Logging (copy), PromiseModule (copy)
	ArgCheckModule.isType(p1, "function", "RefetchAvatarData thunk expects networkImpl to be a function")
	
	return function(p2, _)
		-- upvalues: WebApiModule (upval), p1 (copy), CheckAssetAvailability (copy), UtilsModule (upval), CryoModule (upval), ReceivedAvatarDataModule (upval), SetRangesAndSliderValuesFromBodyColor3sModule (upval), Logging (upval), PromiseModule (upval)
		return WebApiModule.GetAvatarData(p1, { checkAssetAvailability = CheckAssetAvailability }):andThen(function(Result)
			-- upvalues: UtilsModule (upval), CryoModule (upval), p2 (copy), ReceivedAvatarDataModule (upval), SetRangesAndSliderValuesFromBodyColor3sModule (upval)
			local TableToCamelCaseKeysResult = UtilsModule.tableToCamelCaseKeys(Result.responseBody)
			
			if not TableToCamelCaseKeysResult then return end
			local ConvertBodyColor3HexesToColor3sResult = UtilsModule.convertBodyColor3HexesToColor3s(TableToCamelCaseKeysResult.bodyColor3s or {})
			p2:dispatch(ReceivedAvatarDataModule((CryoModule.Dictionary.join(TableToCamelCaseKeysResult, { bodyColor3s = ConvertBodyColor3HexesToColor3sResult }))))
			local DefaultBodyColorRanges = p2:getState().AvatarExperience.AvatarEditor.DefaultBodyColorRanges
			
			if DefaultBodyColorRanges and #DefaultBodyColorRanges > 0 then
				p2:dispatch(SetRangesAndSliderValuesFromBodyColor3sModule(ConvertBodyColor3HexesToColor3sResult))
			end
		end):catch(function(Err)
			-- upvalues: Logging (upval), PromiseModule (upval)
			Logging.warn("WebApi failure in RefetchAvatarData: " .. tostring(Err))
			
			return PromiseModule.reject(Err)
		end)
	end
end