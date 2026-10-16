local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local TextChatService = game:GetService("TextChatService")
local StarterGui = game:GetService("StarterGui")
local RobloxGui = CoreGui.RobloxGui
local FFlagEnableUIManagerPackgify = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableUIManagerPackgify
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local PanelType = nil
local UIManager = nil
local SpatialUIType = nil

if IsInExperienceUIVREnabled or FFlagEnableUIManagerPackgify then
	local VrSpatialUiModule = require(CorePackages.Workspace.Packages.VrSpatialUi)
	PanelType = VrSpatialUiModule.Constants.PanelType
	UIManager = VrSpatialUiModule.UIManager
	SpatialUIType = VrSpatialUiModule.Constants.SpatialUIType
else
	local UIManager1 = RobloxGui:WaitForChild("Modules"):WaitForChild("UIManager")
	local ConstantsModule = require(UIManager1.Constants)
	PanelType = ConstantsModule.PanelType
	UIManager = require(UIManager1.UIManager)
	SpatialUIType = ConstantsModule.SpatialUIType
end
if game:DefineFastFlag("DebugExpChat", false) then
	require(CorePackages.Workspace.Packages.ExpChatDebug).start()
end
if not game:IsLoaded() then
	local _ = game.Loaded:Wait()
end
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local GameTranslatorModule = require(RobloxGui.Modules.GameTranslator)
local ApolloClientModule = require(RobloxGui.Modules.ApolloClient)
local ExpChatModule = require(CorePackages.Workspace.Packages.ExpChat)
local GetFFlagAddApolloClientToExperienceChatModule = require(RobloxGui.Modules.Flags.getFFlagAddApolloClientToExperienceChat)
local GetFFlagExpChatAlwaysRunTCSFunction = require(CorePackages.Workspace.Packages.SharedFlags).getFFlagExpChatAlwaysRunTCS
local GetIconVoiceIndicatorModule = require(RobloxGui.Modules.VoiceChat.Components.getIconVoiceIndicator)
local OnClickedVoiceIndicatorModule = require(RobloxGui.Modules.VoiceChat.Components.onClickedVoiceIndicator)
local GetPermissionsModule = if require(CorePackages.Workspace.Packages.Chrome).Enabled() then require(RobloxGui.Modules.VoiceChat.Components.getPermissions) else nil
local v1 = nil
local ExperienceChat = nil

if require(RobloxGui.Modules.VR.IsSpatialRobloxGuiEnabled) then
	local config = {
		panelType = PanelType.Chat,
		screenGuiProps = {
			Name = "ExperienceChat",
			ResetOnSpawn = false,
			DisplayOrder = -1,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}
	}
	local UI = UIManager.getInstance():createUI(config)
	ExperienceChat = UI.panelObject
	v1 = UI
	
	if IsInExperienceUIVREnabled then
		local ChatSelectorModule = require(CoreGui.RobloxGui.Modules.ChatSelector)
		local NewResult = require(CorePackages.Workspace.Packages.Observable).ObservableValue.new(ChatSelectorModule:GetVisibility())
		ChatSelectorModule.VisibilityStateChanged:connect(function(p1) --[[ Line: 73 ]]
			-- upvalues: NewResult (copy)
			NewResult:set(p1)
		end)
		UIManager.getInstance():connectPanelVisibility(config.panelType, NewResult)
	end
else
	ExperienceChat = Instance.new("ScreenGui")
	ExperienceChat.Name = "ExperienceChat"
	ExperienceChat.ResetOnSpawn = false
	ExperienceChat.DisplayOrder = -1
	ExperienceChat.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ExperienceChat.Parent = CoreGui
end
local function findTextChannel(ChildName) --[[ Line: 87 ]]
	-- upvalues: TextChatService (copy)
	local ChildName1 = TextChatService:FindFirstChild(ChildName, true)
	while not ChildName1 do
		wait()
		ChildName1 = TextChatService:FindFirstChild(ChildName, true)
	end
	return ChildName1
end

StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, Enabled) --[[ Line: 97 ]]
	-- upvalues: ExpChatModule (copy)
	if CoreGuiType == Enum.CoreGuiType.All or CoreGuiType == Enum.CoreGuiType.Chat then
		ExpChatModule.Events.SetCoreGuiEnabledChanged(Enabled)
	end
end)
local IChatSettings = require(RobloxGui.Modules.InGameChat.BubbleChat.Types).IChatSettings
local CreateDefaultTextChannels = if GetFFlagExpChatAlwaysRunTCSFunction() then TextChatService.CreateDefaultTextChannels else TextChatService.ChatVersion == Enum.ChatVersion.TextChatService and TextChatService.CreateDefaultTextChannels

if game:GetEngineFeature("TextChatServiceProtectedChatEnabled") and game:DefineFastFlag("ExpChatTextChannelWindow", false) and TextChatService:IsProtectedChatEnabled() then
	require(CorePackages.Workspace.Packages.TextChannelWindow).start()
end
ExpChatModule.mountClientApp({
	apolloClient = if GetFFlagAddApolloClientToExperienceChatModule() then ApolloClientModule else nil,
	getIconVoiceIndicator = GetIconVoiceIndicatorModule or nil,
	onClickedVoiceIndicator = OnClickedVoiceIndicatorModule or nil,
	getPermissions = GetPermissionsModule or nil,
	defaultTargetTextChannel = if CreateDefaultTextChannels then findTextChannel("RBXGeneral") else nil,
	defaultSystemTextChannel = if CreateDefaultTextChannels then findTextChannel("RBXSystem") else nil,
	validateLegacyBubbleChatSettings = IChatSettings or nil,
	translator = RobloxTranslatorModule,
	gameTranslator = GameTranslatorModule,
	parent = ExperienceChat,
	isSpatialUIEnabled = v1 and v1.type == SpatialUIType.SpatialUI
})