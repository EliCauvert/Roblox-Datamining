local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = RobloxGui:WaitForChild("Modules")
require(CorePackages.Packages.UIBlox).init(require(CorePackages.Workspace.Packages.CoreScriptsInitializer).UIBloxInGameConfig)
local FFlagBuildExperienceInstanceSelection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagBuildExperienceInstanceSelection
local InstanceSelectionProtocolModule = if FFlagBuildExperienceInstanceSelection then require(CorePackages.Workspace.Packages.BuildExperience.InstanceSelectionProtocol) else nil

local function _(): boolean
	-- upvalues: FFlagBuildExperienceInstanceSelection (copy), InstanceSelectionProtocolModule (copy)
	return FFlagBuildExperienceInstanceSelection and InstanceSelectionProtocolModule.getActiveRequest() ~= nil
end

if game:DefineFastFlag("FeedbackModuleEarlyFontInitialization", false) then
	local TextService = game:GetService("TextService")
	local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
	GetTextBoundsParams.Text = "random text"
	GetTextBoundsParams.Font = Font.fromEnum(Enum.Font.Gotham)
	GetTextBoundsParams.Size = 19
	GetTextBoundsParams.Width = 0
	local _ = TextService:GetTextBoundsAsync(GetTextBoundsParams)
end
local MessageBusService = game:GetService("MessageBusService")
local CaptureModeMessageId = MessageBusService:GetMessageId("CaptureMode", "sceneSelectionExitReason")
game:GetService("GuiService").NativeClose:Connect(function()
	-- upvalues: FFlagBuildExperienceInstanceSelection (copy), InstanceSelectionProtocolModule (copy), MessageBusService (copy), CaptureModeMessageId (copy)
	if FFlagBuildExperienceInstanceSelection and InstanceSelectionProtocolModule.getActiveRequest() ~= nil then
		InstanceSelectionProtocolModule.finishSelection({ status = "cancelled" })
		
		return
	else
		MessageBusService:Publish(CaptureModeMessageId, { reason = "nativeExit" })
		game:GetService("ExperienceStateCaptureService"):ToggleCaptureMode()
	end
end)
game:WaitForChild("SafetyService")
local SafetyService = game:GetService("SafetyService")

if FFlagBuildExperienceInstanceSelection and InstanceSelectionProtocolModule.getActiveRequest() ~= nil then
	require(CorePackages.Workspace.Packages.BuildExperience.mountInstanceSelection)()
	
	return
end
if SafetyService.IsCaptureModeForReport then
	require(CorePackages.Workspace.Packages.InGameAssetReporting).initialize()
	
	return
else
	require(RobloxGui.Modules.Feedback).initialize()
end