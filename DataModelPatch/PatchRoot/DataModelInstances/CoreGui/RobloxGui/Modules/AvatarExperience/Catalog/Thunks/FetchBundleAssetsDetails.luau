local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local SetAssetInfoFromCatalogItemActionModule = require(Modules.AvatarExperience.Catalog.Actions.SetAssetInfoFromCatalogItemAction)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local FetchAssetResellersModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetResellers)
local AssetInfoModule = require(Modules.AvatarExperience.Common.Models.AssetInfo)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ReceivedBundleInfoForTryOnFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ReceivedBundleInfoForTryOn
local HandleTryOnFailureModule = require(Modules.AvatarExperience.Catalog.Thunks.HandleTryOnFailure)
local UpdateSortOrderDueToLCBundleLoadedModule = require(Modules.AvatarExperience.Catalog.Thunks.UpdateSortOrderDueToLCBundleLoaded)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local GetTryOnItemReducerKeyFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getTryOnItemReducerKey

local function _(p1)
	-- upvalues: CatalogUtilsModule (copy)
	return CatalogUtilsModule.GetBatchItemDetailsKey(p1)
end

local function processSuccessfulResult(p1, p2, _, p3, TableToCamelCaseKeysResult)
	-- upvalues: SetAssetInfoFromCatalogItemActionModule (copy), AssetInfoModule (copy), CatalogUtilsModule (copy), FetchAssetResellersModule (copy), CatalogConstantsModule (copy), GetTryOnItemReducerKeyFunction (copy), ConstantsModule1 (copy), ReceivedBundleInfoForTryOnFunction (copy), UpdateSortOrderDueToLCBundleLoadedModule (copy)
	local State = p3:getState()
	
	for _, value in TableToCamelCaseKeysResult do
		local Text = tostring(value.id)
		p3:dispatch(SetAssetInfoFromCatalogItemActionModule(Text, value))
		
		if CatalogUtilsModule.IsResellable((AssetInfoModule.fromGetCatalogItemData(value))) then
			p3:dispatch(FetchAssetResellersModule(p1, Text, nil, CatalogConstantsModule.MaxResellersPerPage))
		end
	end
	if State.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems[GetTryOnItemReducerKeyFunction(p2, ConstantsModule1.ItemType.Bundle)] then
		p3:dispatch(ReceivedBundleInfoForTryOnFunction(p2))
		p3:dispatch(UpdateSortOrderDueToLCBundleLoadedModule(p2))
	end
end

return function(p4, p5, ItemIds)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), CatalogUtilsModule (copy), PromiseModule (copy), UtilsModule (copy), processSuccessfulResult (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule (copy), Logging (copy), HandleTryOnFailureModule (copy)
	ArgCheckModule.isType(ItemIds, "table", "FetchBundleAssetsDetails request expects itemIds")
	
	return function(p6, p7)
		-- upvalues: PerformFetch (upval), ItemIds (copy), CatalogUtilsModule (upval), PromiseModule (upval), UtilsModule (upval), processSuccessfulResult (upval), p4 (copy), p5 (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), Logging (upval), HandleTryOnFailureModule (upval)
		local AvatarEditorService = p7.avatarEditorService
		
		return PerformFetch.Single(CatalogUtilsModule.GetBatchItemDetailsKey(ItemIds), function(p8)
			-- upvalues: PromiseModule (upval), AvatarEditorService (copy), ItemIds (upval), UtilsModule (upval), processSuccessfulResult (upval), p4 (upval), p5 (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), Logging (upval), HandleTryOnFailureModule (upval)
			return PromiseModule.new(function(Callback: (any) -> (), Callback1: () -> ())
				-- upvalues: AvatarEditorService (upval), ItemIds (upval), UtilsModule (upval), processSuccessfulResult (upval), p4 (upval), p5 (upval), p8 (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), Logging (upval), HandleTryOnFailureModule (upval)
				local Success, Result = pcall(function()
					-- upvalues: AvatarEditorService (upval), ItemIds (upval)
					return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetBatchItemDetailsAsync(ItemIds, Enum.AvatarItemType.Asset) else AvatarEditorService:GetBatchItemDetails(ItemIds, Enum.AvatarItemType.Asset)
				end)
				
				if Success then
					Result = UtilsModule.tableToCamelCaseKeys(Result)
					processSuccessfulResult(p4, p5, ItemIds, p8, Result)
					Callback(Result)
					
					return
				end
				if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
					ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule.Counter.AvatarEditorServiceErrors.GetBatchItemDetails)
				end
				Logging.warn("FetchBundleAssetsDetails failure: " .. tostring(Result))
				p8:dispatch(HandleTryOnFailureModule(p5))
				Callback1()
			end)
		end)(p6)
	end
end