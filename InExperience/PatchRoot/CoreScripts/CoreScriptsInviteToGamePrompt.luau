local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local SocialService = game:GetService("SocialService")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local Modules = CoreGui:WaitForChild("RobloxGui").Modules
local Settings = Modules.Settings
local ShareGame = Settings.Pages.ShareGame
local GetFFlagFixSettingshubImportOrderModule = require(Modules.Flags.GetFFlagFixSettingshubImportOrder)
local SettingsHubModule = if GetFFlagFixSettingshubImportOrderModule() then nil else require(Settings.SettingsHub)
local GetFFlagEnableNewInviteMenuCustomizationModule = require(Modules.Flags.GetFFlagEnableNewInviteMenuCustomization)
local GetFFlagEnableInvitePromptLoadingStateModule = require(Modules.Flags.GetFFlagEnableInvitePromptLoadingState)
local Diag = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.Diag
local EventStream = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local GameInviteAnalytics = require(CorePackages.Workspace.Packages.GameInvite).GameInviteAnalytics
local GameInviteModule = require(CorePackages.Workspace.Packages.GameInvite)
local GameInviteModalManager = GameInviteModule.GameInviteModalManager
local GetCustomizedInvitePromptTriggerFunction = GameInviteModule.GetCustomizedInvitePromptTrigger
local GameInviteConstants = GameInviteModule.GameInviteConstants
local GameInviteAnalyticsManager = GameInviteModule.GameInviteAnalyticsManager
local WithAnalyticsResult = require(ShareGame.InviteToGamePrompt).new(CoreGui):withSocialServiceAndLocalPlayer(SocialService, Players.LocalPlayer):withAnalytics((GameInviteAnalytics.new():withEventStream((EventStream.new(RbxAnalyticsService))):withDiag(Diag.new(RbxAnalyticsService)):withButtonName(GameInviteAnalytics.ButtonName.ModalPrompt)))
local ApiGetCanSendAndCanCustomizeInvitesModule = require(ShareGame.Thunks.ApiGetCanSendAndCanCustomizeInvites)
local GetCustomizedInvitePromptParamsModule = require(ShareGame.getCustomizedInvitePromptParams)

local function _(p1)
	-- upvalues: SocialService (copy)
	local Success, Result = pcall(function()
		-- upvalues: SocialService (upval), p1 (copy)
		return SocialService:CanSendGameInviteAsync(p1)
	end)
	
	return Success and Result
end

SocialService.PromptInviteRequested:Connect(function(Player, ExperienceInviteOptions)
	-- upvalues: Players (copy), GetFFlagFixSettingshubImportOrderModule (copy), SettingsHubModule (ref), Settings (copy), SocialService (copy), GetCustomizedInvitePromptTriggerFunction (copy), GameInviteConstants (copy), GameInviteAnalyticsManager (copy), GameInviteModalManager (copy), GetFFlagEnableNewInviteMenuCustomizationModule (copy), GetFFlagEnableInvitePromptLoadingStateModule (copy), WithAnalyticsResult (copy), GetCustomizedInvitePromptParamsModule (copy), ApiGetCanSendAndCanCustomizeInvitesModule (copy)
	if Player ~= Players.LocalPlayer then return end
	if GetFFlagFixSettingshubImportOrderModule() then
		SettingsHubModule = require(Settings.SettingsHub)
	end
	if not SettingsHubModule:GetVisibility() then
		local ExperienceInviteOptions1 = ExperienceInviteOptions or nil
		local CustomizedInvitePromptTrigger = GetCustomizedInvitePromptTriggerFunction(ExperienceInviteOptions1)
		
		if CustomizedInvitePromptTrigger == GameInviteConstants.Triggers.DeveloperMultiple then
			GameInviteAnalyticsManager:withButtonName(GameInviteAnalyticsManager.ButtonName.ModalPrompt)
			GameInviteAnalyticsManager:inputShareGameEntryPoint()
			GameInviteModalManager:openModal({ trigger = CustomizedInvitePromptTrigger }, ExperienceInviteOptions1)
			
			return
		end
		if GetFFlagEnableNewInviteMenuCustomizationModule() then
			local FFlagEnableInvitePromptLoadingStateModule = GetFFlagEnableInvitePromptLoadingStateModule()
			
			if FFlagEnableInvitePromptLoadingStateModule then
				WithAnalyticsResult:show({ isLoading = true })
			end
			local CustomizedInvitePromptParamsModule = GetCustomizedInvitePromptParamsModule(ExperienceInviteOptions1, ApiGetCanSendAndCanCustomizeInvitesModule)
			
			if CustomizedInvitePromptParamsModule then
				WithAnalyticsResult:show(CustomizedInvitePromptParamsModule)
				
				return
			end
			if FFlagEnableInvitePromptLoadingStateModule then
				WithAnalyticsResult:hide()
				
				return
			end
		else
			local Success, Result = pcall(function()
				-- upvalues: SocialService (upval), Player (copy)
				return SocialService:CanSendGameInviteAsync(Player)
			end)
			
			if not Success or not Result then return end
			WithAnalyticsResult:show()
		end
		return
	elseif Players and Players.LocalPlayer then
		SocialService:InvokeGameInvitePromptClosed(Players.LocalPlayer, {})
	end
end)