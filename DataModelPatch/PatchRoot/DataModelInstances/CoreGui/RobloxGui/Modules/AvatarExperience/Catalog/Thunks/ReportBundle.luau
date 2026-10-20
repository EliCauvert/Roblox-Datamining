local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local config = {
	toastMessage = "Feature.Catalog.Response.ReportSubmitted",
	isLocalized = false,
	toastType = ToastTypeModule.SuccessConfirmation
}
local config1 = {
	toastMessage = "Feature.ReportAbuse.Message.ErrorSubmitFailure",
	isLocalized = false,
	toastType = ToastTypeModule.NetworkingError
}

return function(p1, p2, Platform, p3)
	-- upvalues: PerformFetch (copy), IsVRAppBuildFunction (copy), WebApiModule (copy), SetCurrentToastMessageModule (copy), config (copy), Logging (copy), config1 (copy)
	return PerformFetch.Single("reportBundleKey", function(p4)
		-- upvalues: IsVRAppBuildFunction (upval), Platform (copy), WebApiModule (upval), p1 (copy), p2 (copy), p3 (copy), SetCurrentToastMessageModule (upval), config (upval), Logging (upval), config1 (upval)
		return WebApiModule.AbuseReportBundle(p1, p4:getState().LocalUserId, p2, if IsVRAppBuildFunction() then "vr" elseif Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX or Platform == Enum.Platform.UWP then "desktop" elseif Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android then "mobile" elseif Platform == Enum.Platform.XBox360 or Platform == Enum.Platform.XBoxOne or Platform == Enum.Platform.PS3 or Platform == Enum.Platform.PS4 or Platform == Enum.Platform.PS5 or Platform == Enum.Platform.WiiU then "console" else "unknown", p3):andThen(function(_)
			-- upvalues: p4 (copy), SetCurrentToastMessageModule (upval), config (upval)
			p4:dispatch(SetCurrentToastMessageModule(config))
		end, function(p5)
			-- upvalues: Logging (upval), p4 (copy), SetCurrentToastMessageModule (upval), config1 (upval)
			Logging.warn("WebApi failure in AbuseReportBundle: " .. tostring(p5))
			p4:dispatch(SetCurrentToastMessageModule(config1))
		end)
	end)
end