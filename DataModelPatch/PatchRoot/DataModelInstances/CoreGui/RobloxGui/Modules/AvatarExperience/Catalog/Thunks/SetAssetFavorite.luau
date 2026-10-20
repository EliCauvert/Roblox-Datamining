local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local SetAssetFavoriteModule = require(Modules.AvatarExperience.Catalog.Actions.SetAssetFavorite)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)

local function _(Text): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.SetFavoriteAssetKey .. Text
end

return function(ItemId, ShouldFavorite)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), PromiseModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule (copy), SetAssetFavoriteModule (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), SetNetworkingErrorToastModule (copy)
	ArgCheckModule.isType(ItemId, "string", "SetAssetFavorite thunk expects assetId")
	ArgCheckModule.isType(ShouldFavorite, "boolean", "SetAssetFavorite thunk expects isFavorited")
	
	return function(p1, p2)
		-- upvalues: PerformFetch (upval), ItemId (copy), CatalogConstantsModule (upval), PromiseModule (upval), ShouldFavorite (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), SetAssetFavoriteModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), SetNetworkingErrorToastModule (upval)
		local AvatarEditorService = p2.avatarEditorService
		
		return PerformFetch.Single(CatalogConstantsModule.SetFavoriteAssetKey .. ItemId, function(p3)
			-- upvalues: PromiseModule (upval), AvatarEditorService (copy), ItemId (upval), ShouldFavorite (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), SetAssetFavoriteModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), SetNetworkingErrorToastModule (upval)
			return PromiseModule.new(function(Callback: () -> (), Callback1: () -> ())
				-- upvalues: AvatarEditorService (upval), ItemId (upval), ShouldFavorite (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), p3 (copy), SetAssetFavoriteModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), SetNetworkingErrorToastModule (upval)
				local NoPromptSetFavoriteResult = AvatarEditorService:NoPromptSetFavorite(ItemId, Enum.AvatarItemType.Asset, ShouldFavorite)
				while not NoPromptSetFavoriteResult do
					AvatarEditorService.PromptSetFavoriteCompleted:Wait()
					NoPromptSetFavoriteResult = AvatarEditorService:NoPromptSetFavorite(ItemId, Enum.AvatarItemType.Asset, ShouldFavorite)
					ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule.Counter.AvatarEditorServiceErrors.NoPromptSetFavorite)
				end
				if AvatarEditorService.PromptSetFavoriteCompleted:Wait() == Enum.AvatarPromptResult.Success then
					p3:dispatch(SetAssetFavoriteModule(ItemId, ShouldFavorite))
					Callback()
					
					return
				end
				if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
					ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule.Counter.AvatarEditorServiceErrors.SetAssetFavorite)
				end
				p3:dispatch(SetNetworkingErrorToastModule({ HttpError = Enum.HttpError.OK }))
				Callback1()
			end)
		end)(p1)
	end
end