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
local var1 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local isSpatialRobloxGuiEnabledModule = require(robloxGui.Modules.VR.IsSpatialRobloxGuiEnabled)
local getFFlagExpChatAlwaysRunTCS = require(corePackagesService.Workspace.Packages.SharedFlags).getFFlagExpChatAlwaysRunTCS
local getIconVoiceIndicatorModule = require(robloxGui.Modules.VoiceChat.Components.getIconVoiceIndicator)
local onClickedVoiceIndicatorModule = require(robloxGui.Modules.VoiceChat.Components.onClickedVoiceIndicator)
local var2 = if var1 then require(robloxGui.Modules.VoiceChat.Components.getPermissions) else nil
local _ = nil
local var3 = nil

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
	local var4 = UIManagerModule.getInstance():createUI(t)
	experienceChat = var4.panelObject
	var3 = var4
	
	if isInExperienceUIVREnabled then
		local chatSelectorModule = require(coreGuiService.RobloxGui.Modules.ChatSelector)
		local var5 = require(corePackagesService.Workspace.Packages.Observable).ObservableValue.new(chatSelectorModule:GetVisibility())
		chatSelectorModule.VisibilityStateChanged:connect(function(p1)
			-- upvalues: var5 (ref)
			var5:set(p1)
		end)
		UIManagerModule.getInstance():connectPanelVisibility(t.panelType, var5)
	end
else
	experienceChat = Instance.new("ScreenGui")
	experienceChat.Name = "ExperienceChat"
	experienceChat.ResetOnSpawn = false
	experienceChat.DisplayOrder = -1
	experienceChat.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	experienceChat.Parent = coreGuiService
end
local function findTextChannel(p1)
	-- upvalues: textChatService (ref)
	local var6 = textChatService:FindFirstChild(p1, true)
	while not var6 do
		wait()
		var6 = textChatService:FindFirstChild(p1, true)
	end
	return var6
end

starterGuiService.CoreGuiChangedSignal:Connect(function(p2, p3)
	-- upvalues: expChatModule (ref)
	if p2 == Enum.CoreGuiType.All or p2 == Enum.CoreGuiType.Chat then
		expChatModule.Events.SetCoreGuiEnabledChanged(p3)
	end
end)
local _ = nil
local iChatSettings = require(robloxGui.Modules.InGameChat.BubbleChat.Types).IChatSettings
local var7 = if getFFlagExpChatAlwaysRunTCS() then textChatService.CreateDefaultTextChannels else textChatService.ChatVersion == Enum.ChatVersion.TextChatService and textChatService.CreateDefaultTextChannels

if game:GetEngineFeature("TextChatServiceProtectedChatEnabled") and game:DefineFastFlag("ExpChatTextChannelWindow", false) and textChatService:IsProtectedChatEnabled() then
	require(corePackagesService.Workspace.Packages.TextChannelWindow).start()
end
expChatModule.mountClientApp({
	apolloClient = if getFFlagAddApolloClientToExperienceChatModule() then apolloClientModule else nil,
	getIconVoiceIndicator = getIconVoiceIndicatorModule or nil,
	onClickedVoiceIndicator = onClickedVoiceIndicatorModule or nil,
	getPermissions = var2 or nil,
	defaultTargetTextChannel = if var7 then findTextChannel("RBXGeneral") else nil,
	defaultSystemTextChannel = if var7 then findTextChannel("RBXSystem") else nil,
	validateLegacyBubbleChatSettings = iChatSettings or nil,
	translator = robloxTranslatorModule,
	gameTranslator = gameTranslatorModule,
	parent = experienceChat,
	isSpatialUIEnabled = var3 and var3.type == spatialUIType.SpatialUI
})