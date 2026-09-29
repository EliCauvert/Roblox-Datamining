local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = robloxGui:WaitForChild("Modules")
require(corePackagesService.Packages.UIBlox).init(require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).UIBloxInGameConfig)
local feedbackModuleEarlyFontInitialization = game:DefineFastFlag("FeedbackModuleEarlyFontInitialization", false)
local fFlagBuildExperienceInstanceSelection = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagBuildExperienceInstanceSelection
local var1 = if fFlagBuildExperienceInstanceSelection then require(corePackagesService.Workspace.Packages.BuildExperience.InstanceSelectionProtocol) else nil

local function _()
	-- upvalues: fFlagBuildExperienceInstanceSelection (ref), var1 (ref)
	return fFlagBuildExperienceInstanceSelection and var1.getActiveRequest() ~= nil
end

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
	-- upvalues: fFlagBuildExperienceInstanceSelection (ref), var1 (ref), messageBusService (ref), captureModeMessageId (ref)
	if fFlagBuildExperienceInstanceSelection and var1.getActiveRequest() ~= nil then
		var1.finishSelection({ status = "cancelled" })
		
		return
	end
	messageBusService:Publish(captureModeMessageId, { reason = "nativeExit" })
	game:GetService("ExperienceStateCaptureService"):ToggleCaptureMode()
end)
game:WaitForChild("SafetyService")
local safetyService = game:GetService("SafetyService")

if fFlagBuildExperienceInstanceSelection and var1.getActiveRequest() ~= nil then
	require(corePackagesService.Workspace.Packages.BuildExperience.mountInstanceSelection)()
	
	return
elseif safetyService.IsCaptureModeForReport then
	require(corePackagesService.Workspace.Packages.InGameAssetReporting).initialize()
	
	return
end
require(robloxGui.Modules.Feedback).initialize()