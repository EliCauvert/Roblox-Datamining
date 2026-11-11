local CorePackages = game:GetService("CorePackages")
local LuaSocialLibrariesDepsModule = require(CorePackages.Packages.LuaSocialLibrariesDeps)
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local ShareTargetGame = Logger.new(Logger, "ShareTargetGame")
local HttpRequestModule = require(CorePackages.Packages.HttpRequest)

return {
	Diag = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.Diag,
	EventStream = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventStream,
	Roact = require(CorePackages.Packages.Roact),
	Rodux = require(CorePackages.Packages.Rodux),
	RoactRodux = require(CorePackages.Packages.RoactRodux),
	SocialLibraries = LuaSocialLibrariesDepsModule.SocialLibraries.config({}),
	Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text,
	UIBlox = require(CorePackages.Packages.UIBlox),
	User = require(CorePackages.Workspace.Packages.UserLib).Models.UserModel,
	UniversalAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy,
	withLocalization = require(CorePackages.Workspace.Packages.Localization).withLocalization,
	LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider,
	Promise = require(CorePackages.Packages.Promise),
	request = HttpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: ShareTargetGame (copy), HttpRequestModule (copy)
			ShareTargetGame:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		maxRetryCount = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("ShareTargetGameHttpRetryCount", 4) else nil
	}),
	SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags),
	RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices,
	RoactLocalization = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Services.RoactLocalization),
	Mock = LuaSocialLibrariesDepsModule.Mock
}