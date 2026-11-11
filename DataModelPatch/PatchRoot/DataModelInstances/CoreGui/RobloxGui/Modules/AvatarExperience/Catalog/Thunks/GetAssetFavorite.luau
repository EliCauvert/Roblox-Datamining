local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local SetAssetFavoriteModule = require(Modules.AvatarExperience.Catalog.Actions.SetAssetFavorite)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)

local function _(Text): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.GetFavoriteAssetKey .. Text
end

return function(ItemId)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), PromiseModule (copy), SetAssetFavoriteModule (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule (copy), Logging (copy)
	ArgCheckModule.isType(ItemId, "string", "GetAssetFavorite thunk expects assetId")
	
	return function(p1, p2)
		-- upvalues: PerformFetch (upval), ItemId (copy), CatalogConstantsModule (upval), PromiseModule (upval), SetAssetFavoriteModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), Logging (upval)
		local AvatarEditorService = p2.avatarEditorService
		
		return PerformFetch.Single(CatalogConstantsModule.GetFavoriteAssetKey .. ItemId, function(p3)
			-- upvalues: PromiseModule (upval), AvatarEditorService (copy), ItemId (upval), SetAssetFavoriteModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), Logging (upval)
			return PromiseModule.new(function(Callback: () -> (), Callback1: () -> ())
				-- upvalues: AvatarEditorService (upval), ItemId (upval), p3 (copy), SetAssetFavoriteModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), Logging (upval)
				local Success, Result = pcall(function()
					-- upvalues: AvatarEditorService (upval), ItemId (upval)
					return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetFavoriteAsync(ItemId, Enum.AvatarItemType.Asset) else AvatarEditorService:GetFavorite(ItemId, Enum.AvatarItemType.Asset)
				end)
				
				if Success then
					p3:dispatch(SetAssetFavoriteModule(ItemId, Result))
					Callback()
					
					return
				end
				if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
					ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule.Counter.AvatarEditorServiceErrors.GetAssetFavorite)
				end
				Logging.warn("GetAssetFavorite failure: " .. tostring(Result))
				Callback1()
			end)
		end)(p1)
	end
end