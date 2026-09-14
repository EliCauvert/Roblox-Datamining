local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = robloxGui:WaitForChild("Modules")
local packages = corePackagesService.Workspace.Packages
require(corePackagesService.Packages.UIBlox).init(require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).UIBloxInGameConfig)
local feedbackModuleEarlyFontInitialization = game:DefineFastFlag("FeedbackModuleEarlyFontInitialization", false)
local fFlagBuildExperienceAssetLibrary = require(packages.SharedFlags).FFlagBuildExperienceAssetLibrary
local var1 = if fFlagBuildExperienceAssetLibrary then require(packages.BuildExperience.CaptureModeProtocol) else nil

if feedbackModuleEarlyFontInitialization then
	local textService = game:GetService("TextService")
	local getTextBoundsParams = Instance.new("GetTextBoundsParams")
	getTextBoundsParams.Text = "random text"
	getTextBoundsParams.Font = Font.fromEnum(Enum.Font.Gotham)
	getTextBoundsParams.Size = 19
	getTextBoundsParams.Width = 0
	local _ = textService:GetTextBoundsAsync(getTextBoundsParams)
end
local messageBusService = game:GetService("MessageBusService")
local captureModeMessageId = messageBusService:GetMessageId("CaptureMode", "sceneSelectionExitReason")
game:GetService("GuiService").NativeClose:Connect(function()
	-- upvalues: fFlagBuildExperienceAssetLibrary (ref), var1 (ref), messageBusService (ref), captureModeMessageId (ref)
	if fFlagBuildExperienceAssetLibrary and var1 ~= nil and var1.getActiveRequest() ~= nil then
		var1.cancelActiveRequest()
	else
		messageBusService:Publish(captureModeMessageId, { reason = "nativeExit" })
	end
	game:GetService("ExperienceStateCaptureService"):ToggleCaptureMode()
end)
game:WaitForChild("SafetyService")
local safetyService = game:GetService("SafetyService")

if fFlagBuildExperienceAssetLibrary and var1 ~= nil and var1.getActiveRequest() ~= nil then
	require(packages.BuildExperience.mountCaptureMode)()
	
	return
elseif safetyService.IsCaptureModeForReport then
	require(packages.InGameAssetReporting).initialize()
	
	return
end
require(robloxGui.Modules.Feedback).initialize()