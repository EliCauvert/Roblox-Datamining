local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local CloseCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay
local AbuseVectorModule = require(CorePackages.Workspace.Packages.GenericAbuseReporting.AbuseVector)
local OpenDynamicAbuseReportModule = require(CorePackages.Workspace.Packages.GenericAbuseReporting.OpenDynamicAbuseReport)
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local PromiseModule = require(CorePackages.Packages.Promise)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local FFlagEnableAbuseReportRevampFlow = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAbuseReportRevampFlow
local EnableAbuseReportRevampLooks = game:DefineFastFlag("EnableAbuseReportRevampLooks", false)
local config = {
	toastMessage = "Feature.Catalog.Response.ReportSubmitted",
	isLocalized = false,
	toastType = ToastTypeModule.SuccessConfirmation
}
local config1 = {
	toastMessage = "Feature.ReportAbuse.Message.ErrorSubmitFailure",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}

return function(p1)
	-- upvalues: PerformFetch (copy), WidgetConstants (copy), CryoModule (copy), PromiseModule (copy), UserInputService (copy), IsVRAppBuildFunction (copy), FFlagEnableAbuseReportRevampFlow (copy), EnableAbuseReportRevampLooks (copy), OpenDynamicAbuseReportModule (copy), AbuseVectorModule (copy), CloseCentralOverlayFunction (copy), WebApiModule (copy), SetCurrentToastMessageModule (copy), config (copy), Logging (copy), config1 (copy)
	return PerformFetch.Single("reportLookKey", function(p2)
		-- upvalues: WidgetConstants (upval), CryoModule (upval), PromiseModule (upval), UserInputService (upval), IsVRAppBuildFunction (upval), FFlagEnableAbuseReportRevampFlow (upval), EnableAbuseReportRevampLooks (upval), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), CloseCentralOverlayFunction (upval), WebApiModule (upval), p1 (copy), SetCurrentToastMessageModule (upval), config (upval), Logging (upval), config1 (upval)
		local State = p2:getState()
		local LocalUserId = State.LocalUserId
		local LookId = State.AvatarExperience.AvatarScene.OutfitTryOn.LookId
		local HydratedWidget = State.AvatarExperience.Common.Widgets.HydratedWidgetData[WidgetConstants.ContentType.Look]
		local HydratedWidgetEntry = if HydratedWidget and LookId then HydratedWidget[LookId] else nil
		local MapResult = if HydratedWidgetEntry then CryoModule.List.map(HydratedWidgetEntry.assets, function(p3): string
			return (tostring(p3.id))
		end) else nil
		
		if not LookId then
			return PromiseModule.reject("Attempt to report a look, but no look is currently displayed")
		end
		local Platform = UserInputService:GetPlatform()
		local IsNotIdMatch: boolean = HydratedWidgetEntry and (HydratedWidgetEntry.curator and HydratedWidgetEntry.curator.id ~= 1)
		local config2 = {
			REPORTED_ABUSE_CATEGORY = "ABUSE_CATEGORY_OTHER",
			REPORTER_COMMENT = "",
			ENTRY_POINT = if IsVRAppBuildFunction() then "vr" elseif Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX then "desktop" elseif Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android or Platform == Enum.Platform.UWP then "mobile" elseif Platform == Enum.Platform.XBox360 or Platform == Enum.Platform.XBoxOne or Platform == Enum.Platform.PS3 or Platform == Enum.Platform.PS4 or Platform == Enum.Platform.PS5 or Platform == Enum.Platform.WiiU then "console" else "unknown",
			REPORTED_ABUSE_VECTOR = if IsNotIdMatch then "COMMUNITY_LOOKS" else "LOOKS",
			SUBMITTER_USER_ID = LocalUserId,
			REPORT_TARGET_LOOK_ID = LookId,
			REPORT_TARGET_LOOK_INCLUDED_ASSET_ID = MapResult
		}
		
		if FFlagEnableAbuseReportRevampFlow and EnableAbuseReportRevampLooks then
			p2:dispatch(OpenDynamicAbuseReportModule({
				abuseVector = if IsNotIdMatch then AbuseVectorModule.CommunityLooks else AbuseVectorModule.Looks,
				targetId = { lookId = LookId, lookAssetsIds = MapResult },
				onClose = function()
					-- upvalues: p2 (copy), CloseCentralOverlayFunction (upval)
					p2:dispatch(CloseCentralOverlayFunction())
				end
			}))
			
			return PromiseModule.resolve()
		else
			return WebApiModule.AbuseReport(p1, config2):andThen(function(_)
				-- upvalues: p2 (copy), SetCurrentToastMessageModule (upval), config (upval)
				p2:dispatch(SetCurrentToastMessageModule(config))
			end, function(p3)
				-- upvalues: Logging (upval), p2 (copy), SetCurrentToastMessageModule (upval), config1 (upval)
				Logging.warn("WebApi failure in AbuseReport: " .. tostring(p3))
				p2:dispatch(SetCurrentToastMessageModule(config1))
			end)
		end
	end)
end