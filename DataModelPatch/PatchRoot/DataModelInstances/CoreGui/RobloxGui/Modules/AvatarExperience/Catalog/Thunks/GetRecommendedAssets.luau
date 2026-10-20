local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local CryoModule = require(CorePackages.Packages.Cryo)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SetRecommendedAssetsActionModule = require(Modules.AvatarExperience.Catalog.Actions.SetRecommendedAssetsAction)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)

local function _(p1): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.RecommendedItemsForAssetsKey .. tostring(p1)
end

return function(ContextAssetId, p1, p2, p3)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), PromiseModule (copy), UtilsModule (copy), ConstantsModule (copy), CryoModule (copy), SetRecommendedAssetsActionModule (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule1 (copy), Logging (copy)
	ArgCheckModule.isType(ContextAssetId, "string", "GetRecommendedAssets thunk expects assetId to be a string")
	ArgCheckModule.isType(p1, "string", "GetRecommendedAssets thunk expects assetTypeId to be a string")
	ArgCheckModule.isType(p2, "number", "GetRecommendedAssets thunk expects numItems to be a number")
	ArgCheckModule.isType(p3, "boolean", "GetRecommendedAssets thunk expects details to be a boolean")
	
	return function(p4, p5)
		-- upvalues: PerformFetch (upval), ContextAssetId (copy), CatalogConstantsModule (upval), PromiseModule (upval), UtilsModule (upval), p1 (copy), p2 (copy), p3 (copy), ConstantsModule (upval), CryoModule (upval), SetRecommendedAssetsActionModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), Logging (upval)
		local AvatarEditorService = p5.avatarEditorService
		
		return PerformFetch.Single(CatalogConstantsModule.RecommendedItemsForAssetsKey .. tostring(ContextAssetId), function(p6)
			-- upvalues: ContextAssetId (upval), PromiseModule (upval), AvatarEditorService (copy), UtilsModule (upval), p1 (upval), p2 (upval), p3 (upval), ConstantsModule (upval), CryoModule (upval), SetRecommendedAssetsActionModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), Logging (upval)
			local AssetInfo = p6:getState().AvatarExperience.Common.AssetInfos[ContextAssetId]
			
			return if AssetInfo == nil or not AssetInfo.receivedRecommendedData then PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
				-- upvalues: AvatarEditorService (upval), UtilsModule (upval), p1 (upval), ContextAssetId (upval), p2 (upval), p3 (upval), ConstantsModule (upval), CryoModule (upval), p6 (copy), SetRecommendedAssetsActionModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), Logging (upval)
				local Success, Result = pcall(function()
					-- upvalues: AvatarEditorService (upval), UtilsModule (upval), p1 (upval), ContextAssetId (upval), p2 (upval), p3 (upval)
					return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetRecommendedAssetsAsync(UtilsModule.AssetTypeIdStringToEnumValue(p1), ContextAssetId, p2, p3) else AvatarEditorService:GetRecommendedAssets(UtilsModule.AssetTypeIdStringToEnumValue(p1), ContextAssetId, p2, p3)
				end)
				
				if Success then
					Result = UtilsModule.tableToCamelCaseKeys(Result)
					local Range = CryoModule.List.getRange(Result, 1, ConstantsModule.NumRecommendedItems)
					p6:dispatch(SetRecommendedAssetsActionModule(ContextAssetId, p1, Range))
					Callback(Range)
					
					return
				end
				if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
					ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule1.Counter.AvatarEditorServiceErrors.GetRecommendedAssets)
				end
				Logging.warn("GetRecommendedAssets failed: " .. Result)
				Callback1({ HttpError = Enum.HttpError.OK })
			end) else PromiseModule.resolve()
		end)(p4)
	end
end