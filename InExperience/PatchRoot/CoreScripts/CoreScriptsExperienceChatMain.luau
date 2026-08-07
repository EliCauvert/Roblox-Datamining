local panelType, UIManagerModule, spatialUIType
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local textChatService = game:GetService("TextChatService")
local starterGuiService = game:GetService("StarterGui")
local robloxGui = coreGuiService.RobloxGui
local fFlagEnableUIManagerPackgify = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableUIManagerPackgify
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local _ = nil
local _ = nil
local _ = nil

if isInExperienceUIVREnabled or fFlagEnableUIManagerPackgify then
	local vrSpatialUiModule = require(corePackagesService.Workspace.Packages.VrSpatialUi)
	panelType = vrSpatialUiModule.Constants.PanelType
	UIManagerModule = vrSpatialUiModule.UIManager
	spatialUIType = vrSpatialUiModule.Constants.SpatialUIType
else
	local UIManager = robloxGui:WaitForChild("Modules"):WaitForChild("UIManager")
	local constantsModule = require(UIManager.Constants)
	panelType = constantsModule.PanelType
	UIManagerModule = require(UIManager.UIManager)
	spatialUIType = constantsModule.SpatialUIType
end
if game:DefineFastFlag("DebugExpChat", false) then
	require(corePackagesService.Workspace.Packages.ExpChatDebug).start()
end
local experienceChat
local _ = game:IsLoaded() or game.Loaded:Wait()
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local gameTranslatorModule = require(robloxGui.Modules.GameTranslator)
local apolloClientModule = require(robloxGui.Modules.ApolloClient)
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local getFFlagAddApolloClientToExperienceChatModule = require(robloxGui.Modules.Flags.getFFlagAddApolloClientToExperienceChat)
local var13 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local isSpatialRobloxGuiEnabledModule = require(robloxGui.Modules.VR.IsSpatialRobloxGuiEnabled)
local getFFlagExpChatAlwaysRunTCS = require(corePackagesService.Workspace.Packages.SharedFlags).getFFlagExpChatAlwaysRunTCS
local getIconVoiceIndicatorModule = require(robloxGui.Modules.VoiceChat.Components.getIconVoiceIndicator)
local onClickedVoiceIndicatorModule = require(robloxGui.Modules.VoiceChat.Components.onClickedVoiceIndicator)
local var17 = if var13 then require(robloxGui.Modules.VoiceChat.Components.getPermissions) else nil
local _ = nil
local var18 = nil

if isSpatialRobloxGuiEnabledModule then
	local t = {
		panelType = panelType.Chat,
		screenGuiProps = {
			Name = "ExperienceChat",
			ResetOnSpawn = false,
			DisplayOrder = -1,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}
	}
	local var21 = UIManagerModule.getInstance():createUI(t)
	experienceChat = var21.panelObject
	var18 = var21
	
	if isInExperienceUIVREnabled then
		local chatSelectorModule = require(coreGuiService.RobloxGui.Modules.ChatSelector)
		local var23 = require(corePackagesService.Workspace.Packages.Observable).ObservableValue.new(chatSelectorModule:GetVisibility())
		chatSelectorModule.VisibilityStateChanged:connect(function(p0) --[[ line: 73 ]]
			-- upvalues: var23 (ref)
			var23:set(p0)
		end)
		UIManagerModule.getInstance():connectPanelVisibility(t.panelType, var23)
	end
else
	experienceChat = Instance.new("ScreenGui")
	experienceChat.Name = "ExperienceChat"
	experienceChat.ResetOnSpawn = false
	experienceChat.DisplayOrder = -1
	experienceChat.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	experienceChat.Parent = coreGuiService
end
local function findTextChannel(p1) --[[ line: 87 ]]
	-- upvalues: textChatService (ref)
	local var26 = textChatService:FindFirstChild(p1, true)
	while not var26 do
		wait()
		var26 = textChatService:FindFirstChild(p1, true)
	end
	return var26
end

starterGuiService.CoreGuiChangedSignal:Connect(function(p2, p3) --[[ line: 97 ]]
	-- upvalues: expChatModule (ref)
	if p2 == Enum.CoreGuiType.All or p2 == Enum.CoreGuiType.Chat then
		expChatModule.Events.SetCoreGuiEnabledChanged(p3)
	end
end)
local _ = nil
local iChatSettings = require(robloxGui.Modules.InGameChat.BubbleChat.Types).IChatSettings
local var25 = if getFFlagExpChatAlwaysRunTCS() then textChatService.CreateDefaultTextChannels else textChatService.ChatVersion == Enum.ChatVersion.TextChatService and textChatService.CreateDefaultTextChannels

if game:GetEngineFeature("TextChatServiceProtectedChatEnabled") and game:DefineFastFlag("ExpChatTextChannelWindow", false) and textChatService:IsProtectedChatEnabled() then
	require(corePackagesService.Workspace.Packages.TextChannelWindow).start()
end
expChatModule.mountClientApp({
	apolloClient = if getFFlagAddApolloClientToExperienceChatModule() then apolloClientModule else nil,
	getIconVoiceIndicator = getIconVoiceIndicatorModule or nil,
	onClickedVoiceIndicator = onClickedVoiceIndicatorModule or nil,
	getPermissions = var17 or nil,
	defaultTargetTextChannel = if var25 then findTextChannel("RBXGeneral") else nil,
	defaultSystemTextChannel = if var25 then findTextChannel("RBXSystem") else nil,
	validateLegacyBubbleChatSettings = iChatSettings or nil,
	translator = robloxTranslatorModule,
	gameTranslator = gameTranslatorModule,
	parent = experienceChat,
	isSpatialUIEnabled = var18 and var18.type == spatialUIType.SpatialUI
})