local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local SetBundleFavoriteModule = require(Modules.AvatarExperience.Catalog.Actions.SetBundleFavorite)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)

local function _(Text): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.SetFavoriteBundleKey .. Text
end

return function(ItemId, ShouldFavorite)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), PromiseModule (copy), SetBundleFavoriteModule (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule (copy), SetNetworkingErrorToastModule (copy)
	ArgCheckModule.isType(ItemId, "string", "SetBundleFavorite thunk expects assetId")
	ArgCheckModule.isType(ShouldFavorite, "boolean", "SetBundleFavorite thunk expects isFavorited")
	
	return function(p1, p2)
		-- upvalues: PerformFetch (upval), ItemId (copy), CatalogConstantsModule (upval), PromiseModule (upval), ShouldFavorite (copy), SetBundleFavoriteModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), SetNetworkingErrorToastModule (upval)
		local AvatarEditorService = p2.avatarEditorService
		
		return PerformFetch.Single(CatalogConstantsModule.SetFavoriteBundleKey .. ItemId, function(p3)
			-- upvalues: PromiseModule (upval), AvatarEditorService (copy), ItemId (upval), ShouldFavorite (upval), SetBundleFavoriteModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), SetNetworkingErrorToastModule (upval)
			return PromiseModule.new(function(Callback: () -> (), Callback1: () -> ())
				-- upvalues: AvatarEditorService (upval), ItemId (upval), ShouldFavorite (upval), p3 (copy), SetBundleFavoriteModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), SetNetworkingErrorToastModule (upval)
				local NoPromptSetFavoriteResult = AvatarEditorService:NoPromptSetFavorite(ItemId, Enum.AvatarItemType.Bundle, ShouldFavorite)
				while not NoPromptSetFavoriteResult do
					AvatarEditorService.PromptSetFavoriteCompleted:Wait()
					NoPromptSetFavoriteResult = AvatarEditorService:NoPromptSetFavorite(ItemId, Enum.AvatarItemType.Bundle, ShouldFavorite)
				end
				if AvatarEditorService.PromptSetFavoriteCompleted:Wait() == Enum.AvatarPromptResult.Success then
					p3:dispatch(SetBundleFavoriteModule(ItemId, ShouldFavorite))
					Callback()
					
					return
				end
				if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
					ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule.Counter.AvatarEditorServiceErrors.SetBundleFavorite)
				end
				p3:dispatch(SetNetworkingErrorToastModule({ HttpError = Enum.HttpError.OK }))
				Callback1()
			end)
		end)(p1)
	end
end