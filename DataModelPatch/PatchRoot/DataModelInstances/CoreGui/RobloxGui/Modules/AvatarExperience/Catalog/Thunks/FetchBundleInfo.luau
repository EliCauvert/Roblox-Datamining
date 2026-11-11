local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SetAssetInfoFromBundleItemActionModule = require(Modules.AvatarExperience.Catalog.Actions.SetAssetInfoFromBundleItemAction)
local HandleTryOnFailureModule = require(Modules.AvatarExperience.Catalog.Thunks.HandleTryOnFailure)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local SetBundleInfoFromCatalogItemActionModule = require(Modules.AvatarExperience.Catalog.Actions.SetBundleInfoFromCatalogItemAction)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)

local function _(p1): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.FetchBundleInfoKey .. tostring(p1)
end

local _ = function(p1, p2): boolean
	local AssetInfo = p1.AvatarExperience.Common.AssetInfos[p2]
	
	return if AssetInfo and AssetInfo.receivedFromBundleItemData then true else false
end

local function processSuccessfulResult(p1, ItemId, TableToCamelCaseKeysResult)
	-- upvalues: ConstantsModule (copy), SetAssetInfoFromBundleItemActionModule (copy), SetBundleInfoFromCatalogItemActionModule (copy)
	if TableToCamelCaseKeysResult.bundledItems then
		local State = p1:getState()
		local List = {}
		
		for _, bundledItem in TableToCamelCaseKeysResult.bundledItems do
			local Text = tostring(bundledItem.id)
			
			if bundledItem.type == ConstantsModule.ItemType.Asset then
				local AssetInfo = State.AvatarExperience.Common.AssetInfos[Text]
				
				if not (if AssetInfo and AssetInfo.receivedFromBundleItemData then true else false) then
					table.insert(List, bundledItem)
				end
			end
		end
		if #List > 0 then
			p1:dispatch(SetAssetInfoFromBundleItemActionModule(List))
		end
	end
	p1:dispatch(SetBundleInfoFromCatalogItemActionModule(ItemId, TableToCamelCaseKeysResult))
end

return function(ItemId)
	-- upvalues: ArgCheckModule (copy), PromiseModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), UtilsModule (copy), processSuccessfulResult (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule1 (copy), HandleTryOnFailureModule (copy)
	ArgCheckModule.isType(ItemId, "string", "FetchBundleInfo thunk expects bundleId to be a string")
	
	return function(p2, p3)
		-- upvalues: ItemId (copy), PromiseModule (upval), PerformFetch (upval), CatalogConstantsModule (upval), UtilsModule (upval), processSuccessfulResult (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), HandleTryOnFailureModule (upval)
		local AvatarEditorService = p3.avatarEditorService
		local BundleInfo = p2:getState().AvatarExperience.Common.BundleInfos[tostring(ItemId)]
		
		return if BundleInfo == nil or not BundleInfo.receivedCatalogData then PerformFetch.Single(CatalogConstantsModule.FetchBundleInfoKey .. tostring(ItemId), function(p4)
			-- upvalues: PromiseModule (upval), AvatarEditorService (copy), ItemId (upval), UtilsModule (upval), processSuccessfulResult (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), HandleTryOnFailureModule (upval)
			return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
				-- upvalues: AvatarEditorService (upval), ItemId (upval), UtilsModule (upval), processSuccessfulResult (upval), p4 (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), HandleTryOnFailureModule (upval)
				local Success, Result = pcall(function()
					-- upvalues: AvatarEditorService (upval), ItemId (upval)
					return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetItemDetailsAsync(ItemId, Enum.AvatarItemType.Bundle) else AvatarEditorService:GetItemDetails(ItemId, Enum.AvatarItemType.Bundle)
				end)
				
				if Success then
					Result = UtilsModule.tableToCamelCaseKeys(Result)
					processSuccessfulResult(p4, ItemId, Result)
					Callback(Result)
					
					return
				end
				if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
					ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule1.Counter.AvatarEditorServiceErrors.FetchBundleInfo)
				end
				p4:dispatch(HandleTryOnFailureModule(ItemId))
				Callback1(Result)
			end)
		end)(p2) else PromiseModule.resolve("We already have the bundle")
	end
end