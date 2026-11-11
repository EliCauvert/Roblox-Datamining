local Parent = script:FindFirstAncestor("BugReporting").Parent
local FFlagLuaAppDefaultHttpRetry = require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local HttpRequestModule = require(Parent.HttpRequest)

return {
	bugReporterService = if game:GetEngineFeature("BugReporterProtocol") then game:GetService("BugReporterService") else nil,
	guiService = game:GetService("GuiService"),
	loggingProtocol = require(Parent.LoggingProtocol).default,
	logReporterService = game:GetService("LogReporterService"),
	runService = game:GetService("RunService"),
	safetyService = game:GetService("SafetyService"),
	userInputService = game:GetService("UserInputService"),
	voiceChatService = game:GetService("VoiceChatService"),
	systemInfoProtocol = require(Parent.SystemInfoProtocol).SystemInfoProtocol.default,
	localPlayer = game:GetService("Players").LocalPlayer,
	getPlaceId = function()
		return game.PlaceId
	end,
	networking = HttpRequestModule.config({
		requestFunction = HttpRequestModule.requestFunctions.RequestInternal,
		maxRetryCount = if FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("BugReportingHttpRetryCount", 4) else nil
	}),
	makeLogger = require(script.Parent.analytics.makeBugReporterLogger)
}