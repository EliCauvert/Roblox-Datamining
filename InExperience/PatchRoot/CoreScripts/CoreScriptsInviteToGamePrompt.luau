local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local socialService = game:GetService("SocialService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local modules = coreGuiService:WaitForChild("RobloxGui").Modules
local settings = modules.Settings
local shareGame = settings.Pages.ShareGame
local getFFlagFixSettingshubImportOrderModule = require(modules.Flags.GetFFlagFixSettingshubImportOrder)
local var1 = if not getFFlagFixSettingshubImportOrderModule() then require(settings.SettingsHub) else nil
local getFFlagEnableNewInviteMenuCustomizationModule = require(modules.Flags.GetFFlagEnableNewInviteMenuCustomization)
local getFFlagEnableInvitePromptLoadingStateModule = require(modules.Flags.GetFFlagEnableInvitePromptLoadingState)
local getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule = require(modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification)
local luaEnableGameInviteModalInvitePromptV2 = game:DefineFastFlag("LuaEnableGameInviteModalInvitePromptV2", false)
local IXPServiceWrapper = require(corePackagesService.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local diag = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.Diag
local eventStream = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local gameInviteAnalytics = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteAnalytics
local getFStringGameInviteMenuLayer = require(corePackagesService.Workspace.Packages.SharedFlags).GetFStringGameInviteMenuLayer
local _ = nil
local gameInviteModalManager = nil
local gameInviteInviteExperimentVariant = nil
local getCustomizedInvitePromptTrigger = nil
local gameInviteConstants = nil
local gameInviteAnalyticsManager = nil

if getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() then
	local gameInviteModule = require(corePackagesService.Workspace.Packages.GameInvite)
	gameInviteModalManager = gameInviteModule.GameInviteModalManager
	gameInviteInviteExperimentVariant = gameInviteModule.GameInviteInviteExperimentVariant
	getCustomizedInvitePromptTrigger = gameInviteModule.GetCustomizedInvitePromptTrigger
	gameInviteConstants = gameInviteModule.GameInviteConstants
	gameInviteAnalyticsManager = gameInviteModule.GameInviteAnalyticsManager
end
local modalPrompt = require(shareGame.InviteToGamePrompt).new(coreGuiService):withSocialServiceAndLocalPlayer(socialService, playersService.LocalPlayer):withAnalytics(gameInviteAnalytics.new():withEventStream(eventStream.new(rbxAnalyticsService)):withDiag(diag.new(rbxAnalyticsService)):withButtonName(gameInviteAnalytics.ButtonName.ModalPrompt))
local apiGetCanSendAndCanCustomizeInvitesModule = require(shareGame.Thunks.ApiGetCanSendAndCanCustomizeInvites)
local getCustomizedInvitePromptParamsModule = require(shareGame.getCustomizedInvitePromptParams)

local function _(p1)
	-- upvalues: socialService (ref)
	local ok, status = pcall(function()
		-- upvalues: socialService (copy), p1 (ref)
		return socialService:CanSendGameInviteAsync(p1)
	end)
	
	return ok and status
end

socialService.PromptInviteRequested:Connect(function(p1, p2)
	-- upvalues: getFStringGameInviteMenuLayer (ref), getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule (ref), luaEnableGameInviteModalInvitePromptV2 (ref), IXPServiceWrapper (ref), gameInviteInviteExperimentVariant (write), playersService (ref), getFFlagFixSettingshubImportOrderModule (ref), var1 (write), settings (ref), socialService (ref), gameInviteModalManager (write), getCustomizedInvitePromptTrigger (write), gameInviteConstants (write), gameInviteAnalyticsManager (write), getFFlagEnableNewInviteMenuCustomizationModule (ref), getFFlagEnableInvitePromptLoadingStateModule (ref), modalPrompt (ref), getCustomizedInvitePromptParamsModule (ref), apiGetCanSendAndCanCustomizeInvitesModule (ref)
	local var2 = false
	local var3 = getFStringGameInviteMenuLayer()
	
	if getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() and luaEnableGameInviteModalInvitePromptV2 then
		local var4 = IXPServiceWrapper:GetLayerData(var3)
		IXPServiceWrapper:LogUserLayerExposure(var3)
		var2 = (var4 and (if var4.inExperienceGameInviteUXRefresh2023 ~= gameInviteInviteExperimentVariant.UxRefresh then var4.inExperienceGameInviteUXRefresh2023 == gameInviteInviteExperimentVariant.InviteLimit else true)) == true
	end
	if var2 then
		if p1 ~= playersService.LocalPlayer then return end
		if getFFlagFixSettingshubImportOrderModule() then
			var1 = require(settings.SettingsHub)
		end
		if var1:GetVisibility() then
			if playersService and playersService.LocalPlayer then
				socialService:InvokeGameInvitePromptClosed(playersService.LocalPlayer, {})
			end
			return
		else
			p2 = p2 or nil
			
			if gameInviteModalManager then
				local var5 = getCustomizedInvitePromptTrigger(p2)
				
				if var5 == gameInviteConstants.Triggers.DeveloperMultiple then
					gameInviteAnalyticsManager:withButtonName(gameInviteAnalyticsManager.ButtonName.ModalPrompt)
					gameInviteAnalyticsManager:inputShareGameEntryPoint()
					gameInviteModalManager:openModal({ trigger = var5 }, p2)
					
					return
				elseif getFFlagEnableNewInviteMenuCustomizationModule() then
					if p1 ~= playersService.LocalPlayer then return end
					local var6 = getFFlagEnableInvitePromptLoadingStateModule()
					
					if var6 then
						modalPrompt:show({ isLoading = true })
					end
					local var7 = getCustomizedInvitePromptParamsModule(p2 or nil, apiGetCanSendAndCanCustomizeInvitesModule)
					
					if var7 then
						modalPrompt:show(var7)
						
						return
					elseif var6 then
						modalPrompt:hide()
						
						return
					end
				elseif p1 == playersService.LocalPlayer then
					local ok, status = pcall(function()
						-- upvalues: socialService (copy), p1 (ref)
						return socialService:CanSendGameInviteAsync(p1)
					end)
					
					if not ok or not status then return end
					modalPrompt:show()
				end
			end
		end
	end
end)