local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local CryoModule = require(CorePackages.Packages.Cryo)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SetRecommendedBundlesActionModule = require(Modules.AvatarExperience.Catalog.Actions.SetRecommendedBundlesAction)
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
	return CatalogConstantsModule.RecommendedItemsForBundlesKey .. tostring(p1)
end

return function(BundleId, p1, p2, p3)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), PromiseModule (copy), UtilsModule (copy), ConstantsModule (copy), CryoModule (copy), SetRecommendedBundlesActionModule (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule1 (copy), Logging (copy)
	ArgCheckModule.isType(BundleId, "string", "GetRecommendedBundles thunk expects bundleId to be a string")
	ArgCheckModule.isType(p1, "string", "GetRecommendedBundles thunk expects bundleTypeId to be a string")
	ArgCheckModule.isType(p2, "number", "GetRecommendedBundles thunk expects numItems to be a number")
	ArgCheckModule.isType(p3, "boolean", "GetRecommendedBundles thunk expects details to be a boolean")
	
	return function(p4, p5)
		-- upvalues: PerformFetch (upval), BundleId (copy), CatalogConstantsModule (upval), PromiseModule (upval), UtilsModule (upval), ConstantsModule (upval), CryoModule (upval), SetRecommendedBundlesActionModule (upval), p1 (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), Logging (upval)
		local AvatarEditorService = p5.avatarEditorService
		
		return PerformFetch.Single(CatalogConstantsModule.RecommendedItemsForBundlesKey .. tostring(BundleId), function(p6)
			-- upvalues: BundleId (upval), PromiseModule (upval), AvatarEditorService (copy), UtilsModule (upval), ConstantsModule (upval), CryoModule (upval), SetRecommendedBundlesActionModule (upval), p1 (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), Logging (upval)
			local BundleInfo = p6:getState().AvatarExperience.Common.BundleInfos[BundleId]
			
			return if BundleInfo == nil or not BundleInfo.receivedRecommendedData then PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
				-- upvalues: AvatarEditorService (upval), BundleId (upval), UtilsModule (upval), ConstantsModule (upval), CryoModule (upval), p6 (copy), SetRecommendedBundlesActionModule (upval), p1 (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), Logging (upval)
				local Success, Result = pcall(function()
					-- upvalues: AvatarEditorService (upval), BundleId (upval)
					return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetRecommendedBundlesAsync(BundleId) else AvatarEditorService:GetRecommendedBundles(BundleId)
				end)
				
				if Success then
					Result = UtilsModule.tableToCamelCaseKeys(Result)
					local Range = CryoModule.List.getRange(Result, 1, ConstantsModule.NumRecommendedItems)
					p6:dispatch(SetRecommendedBundlesActionModule(BundleId, p1, Range))
					Callback(Range)
					
					return
				end
				if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
					ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule1.Counter.AvatarEditorServiceErrors.GetRecommendedBundles)
				end
				Logging.warn("GetRecommendedBundles failed: " .. Result)
				Callback1({ HttpError = Enum.HttpError.OK })
			end) else PromiseModule.resolve()
		end)(p4)
	end
end