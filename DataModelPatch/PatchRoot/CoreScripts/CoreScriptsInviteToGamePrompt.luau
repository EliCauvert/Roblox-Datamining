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
local GetFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule = require(Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification)
local LuaEnableGameInviteModalInvitePromptV2 = game:DefineFastFlag("LuaEnableGameInviteModalInvitePromptV2", false)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local Diag = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.Diag
local EventStream = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local GameInviteAnalytics = require(CorePackages.Workspace.Packages.GameInvite).GameInviteAnalytics
local GetFStringGameInviteMenuLayerFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringGameInviteMenuLayer
local GameInviteModalManager = nil
local GameInviteInviteExperimentVariant = nil
local GetCustomizedInvitePromptTriggerFunction = nil
local GameInviteConstants = nil
local GameInviteAnalyticsManager = nil

if GetFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() then
	local GameInviteModule = require(CorePackages.Workspace.Packages.GameInvite)
	GameInviteModalManager = GameInviteModule.GameInviteModalManager
	GameInviteInviteExperimentVariant = GameInviteModule.GameInviteInviteExperimentVariant
	GetCustomizedInvitePromptTriggerFunction = GameInviteModule.GetCustomizedInvitePromptTrigger
	GameInviteConstants = GameInviteModule.GameInviteConstants
	GameInviteAnalyticsManager = GameInviteModule.GameInviteAnalyticsManager
end
local WithAnalyticsResult = require(ShareGame.InviteToGamePrompt).new(CoreGui):withSocialServiceAndLocalPlayer(SocialService, Players.LocalPlayer):withAnalytics((GameInviteAnalytics.new():withEventStream((EventStream.new(RbxAnalyticsService))):withDiag(Diag.new(RbxAnalyticsService)):withButtonName(GameInviteAnalytics.ButtonName.ModalPrompt)))
local ApiGetCanSendAndCanCustomizeInvitesModule = require(ShareGame.Thunks.ApiGetCanSendAndCanCustomizeInvites)
local GetCustomizedInvitePromptParamsModule = require(ShareGame.getCustomizedInvitePromptParams)

local function _(LocalPlayer)
	-- upvalues: SocialService (copy)
	local Success, Result = pcall(function()
		-- upvalues: SocialService (upval), LocalPlayer (copy)
		return SocialService:CanSendGameInviteAsync(LocalPlayer)
	end)
	
	return Success and Result
end

SocialService.PromptInviteRequested:Connect(function(LocalPlayer, ExperienceInviteOptions)
	-- upvalues: GetFStringGameInviteMenuLayerFunction (copy), GetFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule (copy), LuaEnableGameInviteModalInvitePromptV2 (copy), IXPServiceWrapper (copy), GameInviteInviteExperimentVariant (ref), Players (copy), GetFFlagFixSettingshubImportOrderModule (copy), SettingsHubModule (ref), Settings (copy), SocialService (copy), GameInviteModalManager (ref), GetCustomizedInvitePromptTriggerFunction (ref), GameInviteConstants (ref), GameInviteAnalyticsManager (ref), GetFFlagEnableNewInviteMenuCustomizationModule (copy), GetFFlagEnableInvitePromptLoadingStateModule (copy), WithAnalyticsResult (copy), GetCustomizedInvitePromptParamsModule (copy), ApiGetCanSendAndCanCustomizeInvitesModule (copy)
	local v1 = false
	local FStringGameInviteMenuLayer = GetFStringGameInviteMenuLayerFunction()
	
	if GetFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() and LuaEnableGameInviteModalInvitePromptV2 then
		local LayerData = IXPServiceWrapper:GetLayerData(FStringGameInviteMenuLayer)
		IXPServiceWrapper:LogUserLayerExposure(FStringGameInviteMenuLayer)
		v1 = (LayerData and (LayerData.inExperienceGameInviteUXRefresh2023 == GameInviteInviteExperimentVariant.UxRefresh or LayerData.inExperienceGameInviteUXRefresh2023 == GameInviteInviteExperimentVariant.InviteLimit)) == true
	end
	if v1 then
		if LocalPlayer ~= Players.LocalPlayer then return end
		if GetFFlagFixSettingshubImportOrderModule() then
			SettingsHubModule = require(Settings.SettingsHub)
		end
		if not SettingsHubModule:GetVisibility() then
			local ExperienceInviteOptions1 = ExperienceInviteOptions or nil
			
			if GameInviteModalManager then
				local CustomizedInvitePromptTrigger = GetCustomizedInvitePromptTriggerFunction(ExperienceInviteOptions1)
				
				if CustomizedInvitePromptTrigger == GameInviteConstants.Triggers.DeveloperMultiple then
					GameInviteAnalyticsManager:withButtonName(GameInviteAnalyticsManager.ButtonName.ModalPrompt)
					GameInviteAnalyticsManager:inputShareGameEntryPoint()
					GameInviteModalManager:openModal({ trigger = CustomizedInvitePromptTrigger }, ExperienceInviteOptions1)
					
					return
				end
			end
		else
			if Players and Players.LocalPlayer then
				SocialService:InvokeGameInvitePromptClosed(Players.LocalPlayer, {})
			end
			return
		end
	end
	if GetFFlagEnableNewInviteMenuCustomizationModule() then
		if LocalPlayer ~= Players.LocalPlayer then return end
		local FFlagEnableInvitePromptLoadingStateModule = GetFFlagEnableInvitePromptLoadingStateModule()
		
		if FFlagEnableInvitePromptLoadingStateModule then
			WithAnalyticsResult:show({ isLoading = true })
		end
		local CustomizedInvitePromptParamsModule = GetCustomizedInvitePromptParamsModule(ExperienceInviteOptions or nil, ApiGetCanSendAndCanCustomizeInvitesModule)
		
		if CustomizedInvitePromptParamsModule then
			WithAnalyticsResult:show(CustomizedInvitePromptParamsModule)
			
			return
		end
		if FFlagEnableInvitePromptLoadingStateModule then
			WithAnalyticsResult:hide()
			
			return
		end
	elseif LocalPlayer == Players.LocalPlayer then
		local Success, Result = pcall(function()
			-- upvalues: SocialService (upval), LocalPlayer (copy)
			return SocialService:CanSendGameInviteAsync(LocalPlayer)
		end)
		
		if Success and Result then
			WithAnalyticsResult:show()
		end
	end
	return
end)