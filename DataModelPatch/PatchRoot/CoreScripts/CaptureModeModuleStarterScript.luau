local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = RobloxGui:WaitForChild("Modules")
require(CorePackages.Packages.UIBlox).init(require(CorePackages.Workspace.Packages.CoreScriptsInitializer).UIBloxInGameConfig)

if game:DefineFastFlag("FeedbackModuleEarlyFontInitialization", false) then
	local TextService = game:GetService("TextService")
	local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
	GetTextBoundsParams.Text = "random text"
	GetTextBoundsParams.Font = Font.fromEnum(Enum.Font.Gotham)
	GetTextBoundsParams.Size = 19
	GetTextBoundsParams.Width = 0
	local _ = TextService:GetTextBoundsAsync(GetTextBoundsParams)
end
local CaptureModePublishNativeExitReason = game:DefineFastFlag("CaptureModePublishNativeExitReason", false)
local MessageBusService = game:GetService("MessageBusService")
local CaptureModeMessageId = MessageBusService:GetMessageId("CaptureMode", "sceneSelectionExitReason")
game:GetService("GuiService").NativeClose:Connect(function()
	-- upvalues: CaptureModePublishNativeExitReason (copy), MessageBusService (copy), CaptureModeMessageId (copy)
	if CaptureModePublishNativeExitReason then
		MessageBusService:Publish(CaptureModeMessageId, { reason = "nativeExit" })
	end
	game:GetService("ExperienceStateCaptureService"):ToggleCaptureMode()
end)
game:WaitForChild("SafetyService")

if game:GetService("SafetyService").IsCaptureModeForReport then
	require(CorePackages.Workspace.Packages.InGameAssetReporting).initialize()
	
	return
else
	require(RobloxGui.Modules.Feedback).initialize()
end