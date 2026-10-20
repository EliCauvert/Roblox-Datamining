local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local PromiseModule = require(CorePackages.Packages.Promise)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local WebApiModule = require(Modules.AvatarExperience.AvatarEditor.Http.WebApi)
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)

return function(p1)
	-- upvalues: PerformFetch (copy), ConstantsModule (copy), PromiseModule (copy), WebApiModule (copy), HttpService (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), SendAXCounterV2Function (copy), ConstantsModule1 (copy)
	return PerformFetch.Single("CreateLook", function(p2)
		-- upvalues: ConstantsModule (upval), PromiseModule (upval), WebApiModule (upval), p1 (copy), HttpService (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), SendAXCounterV2Function (upval), ConstantsModule1 (upval)
		local Look = p2:getState().AvatarExperience.AvatarScene.Looks[ConstantsModule.DraftLookId]
		
		if not Look then
			return PromiseModule.reject("Draft look doesn't exist")
		end
		local List = {}
		
		for Id, lookAssetInfo in Look.lookAssetInfos do
			table.insert(List, { id = Id, meta = lookAssetInfo.meta })
		end
		for BundleId, lookBundleInfo in Look.lookBundleInfos do
			for _, value in lookBundleInfo.assetsInBundle do
				if value.isIncluded then
					table.insert(List, { id = value.id, bundleId = BundleId, meta = value.meta })
				end
			end
		end
		return WebApiModule.CreateLook(p1, List, Look):andThen(function(Result)
			return if Result and Result.responseBody then Result.responseBody.id else nil
		end):catch(function(Err)
			-- upvalues: HttpService (upval), p2 (copy), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), ConstantsModule1 (upval)
			warn("Failed to create look", Err)
			local Success, Result = pcall(function()
				-- upvalues: Err (copy), HttpService (upval)
				return Err.Body and (Err.Body ~= "" and HttpService:JSONDecode(Err.Body))
			end)
			
			if Success and Result and Result.errorDescription then
				p2:dispatch(SetCurrentToastMessageModule({
					isLocalized = true,
					toastMessage = Result.errorDescription,
					toastType = ToastTypeModule.InformationMessage
				}))
				SendAXCounterV2Function(ConstantsModule.Counter.LookComposer.CreateLook, { errorCode = Result.errorCode })
				
				return
			end
			if Success and Result and Result.errorCode then
				SendAXCounterV2Function(ConstantsModule.Counter.LookComposer.CreateLook, { errorCode = Result.errorCode })
				p2:dispatch(SetCurrentToastMessageModule({
					isLocalized = false,
					toastMessage = ConstantsModule1.AvatarShareErrorMessagesKeys[Result.errorCode] or "Feature.Avatar.Generic.Error",
					toastType = ToastTypeModule.InformationMessage
				}))
				
				return
			else
				SendAXCounterV2Function(ConstantsModule.Counter.LookComposer.CreateLook, { errorCode = "none" })
			end
		end)
	end)
end