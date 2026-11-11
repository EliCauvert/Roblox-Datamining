local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local SetBundleFavoriteModule = require(Modules.AvatarExperience.Catalog.Actions.SetBundleFavorite)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)

local function _(Text): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.GetFavoriteBundleKey .. Text
end

return function(ItemId)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), PromiseModule (copy), SetBundleFavoriteModule (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule (copy), Logging (copy)
	ArgCheckModule.isType(ItemId, "string", "GetBundleFavorite thunk expects bundleId")
	
	return function(p1, p2)
		-- upvalues: PerformFetch (upval), ItemId (copy), CatalogConstantsModule (upval), PromiseModule (upval), SetBundleFavoriteModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), Logging (upval)
		local AvatarEditorService = p2.avatarEditorService
		
		return PerformFetch.Single(CatalogConstantsModule.GetFavoriteBundleKey .. ItemId, function(p3)
			-- upvalues: PromiseModule (upval), AvatarEditorService (copy), ItemId (upval), SetBundleFavoriteModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), Logging (upval)
			return PromiseModule.new(function(Callback: () -> (), Callback1: () -> ())
				-- upvalues: AvatarEditorService (upval), ItemId (upval), p3 (copy), SetBundleFavoriteModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), Logging (upval)
				local Success, Result = pcall(function()
					-- upvalues: AvatarEditorService (upval), ItemId (upval)
					return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetFavoriteAsync(ItemId, Enum.AvatarItemType.Bundle) else AvatarEditorService:GetFavorite(ItemId, Enum.AvatarItemType.Bundle)
				end)
				
				if Success then
					p3:dispatch(SetBundleFavoriteModule(ItemId, Result))
					Callback()
					
					return
				end
				if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
					ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule.Counter.AvatarEditorServiceErrors.GetBundleFavorite)
				end
				Logging.warn("GetBundleFavorite failure: " .. tostring(Result))
				Callback1()
			end)
		end)(p1)
	end
end