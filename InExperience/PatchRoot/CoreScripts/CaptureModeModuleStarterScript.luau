local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = robloxGui:WaitForChild("Modules")
require(corePackagesService.Packages.UIBlox).init(require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).UIBloxInGameConfig)

if game:DefineFastFlag("FeedbackModuleEarlyFontInitialization", false) then
	local textService = game:GetService("TextService")
	local getTextBoundsParams = Instance.new("GetTextBoundsParams")
	getTextBoundsParams.Text = "random text"
	getTextBoundsParams.Font = Font.fromEnum(Enum.Font.Gotham)
	getTextBoundsParams.Size = 19
	getTextBoundsParams.Width = 0
	local _ = textService:GetTextBoundsAsync(getTextBoundsParams)
end
local captureModePublishNativeExitReason = game:DefineFastFlag("CaptureModePublishNativeExitReason", false)
local messageBusService = game:GetService("MessageBusService")
local captureModeMessageId = messageBusService:GetMessageId("CaptureMode", "sceneSelectionExitReason")
game:GetService("GuiService").NativeClose:Connect(function() --[[ line: 30 | named "handleNativeExit" ]]
	-- upvalues: captureModePublishNativeExitReason (ref), messageBusService (ref), captureModeMessageId (ref)
	if captureModePublishNativeExitReason then
		messageBusService:Publish(captureModeMessageId, { reason = "nativeExit" })
	end
	game:GetService("ExperienceStateCaptureService"):ToggleCaptureMode()
end)
game:WaitForChild("SafetyService")

if game:GetService("SafetyService").IsCaptureModeForReport then
	require(corePackagesService.Workspace.Packages.InGameAssetReporting).initialize()
	
	return
end
require(robloxGui.Modules.Feedback).initialize()