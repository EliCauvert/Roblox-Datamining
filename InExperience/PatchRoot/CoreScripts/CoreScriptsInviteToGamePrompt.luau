local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local socialService = game:GetService("SocialService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local modules = coreGuiService:WaitForChild("RobloxGui").Modules
local settings = modules.Settings
local shareGame = settings.Pages.ShareGame
local getFFlagFixSettingshubImportOrderModule = require(modules.Flags.GetFFlagFixSettingshubImportOrder)
local var6 = if not getFFlagFixSettingshubImportOrderModule() then require(settings.SettingsHub) else nil
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

local function _(p0) --[[ line: 57 | named "canSendGameInviteAsync" ]]
	-- upvalues: socialService (ref)
	local ok, status = pcall(function() --[[ line: 58 ]]
		-- upvalues: socialService (copy), p0 (ref)
		return socialService:CanSendGameInviteAsync(p0)
	end)
	
	return ok and status
end

socialService.PromptInviteRequested:Connect(function(p1, p2) --[[ line: 64 ]]
	-- upvalues: getFStringGameInviteMenuLayer (ref), getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule (ref), luaEnableGameInviteModalInvitePromptV2 (ref), IXPServiceWrapper (ref), gameInviteInviteExperimentVariant (write), playersService (ref), getFFlagFixSettingshubImportOrderModule (ref), var6 (write), settings (ref), socialService (ref), gameInviteModalManager (write), getCustomizedInvitePromptTrigger (write), gameInviteConstants (write), gameInviteAnalyticsManager (write), getFFlagEnableNewInviteMenuCustomizationModule (ref), getFFlagEnableInvitePromptLoadingStateModule (ref), modalPrompt (ref), getCustomizedInvitePromptParamsModule (ref), apiGetCanSendAndCanCustomizeInvitesModule (ref)
	local var15 = false
	local var16 = getFStringGameInviteMenuLayer()
	
	if getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() and luaEnableGameInviteModalInvitePromptV2 then
		local var17 = IXPServiceWrapper:GetLayerData(var16)
		IXPServiceWrapper:LogUserLayerExposure(var16)
		var15 = (var17 and (if var17.inExperienceGameInviteUXRefresh2023 ~= gameInviteInviteExperimentVariant.UxRefresh then var17.inExperienceGameInviteUXRefresh2023 == gameInviteInviteExperimentVariant.InviteLimit else true)) == true
	end
	if var15 then
		if p1 ~= playersService.LocalPlayer then return end
		if getFFlagFixSettingshubImportOrderModule() then
			var6 = require(settings.SettingsHub)
		end
		if var6:GetVisibility() then
			if playersService and playersService.LocalPlayer then
				socialService:InvokeGameInvitePromptClosed(playersService.LocalPlayer, {})
			end
			return
		else
			p2 = p2 or nil
			
			if gameInviteModalManager then
				local var19 = getCustomizedInvitePromptTrigger(p2)
				
				if var19 == gameInviteConstants.Triggers.DeveloperMultiple then
					gameInviteAnalyticsManager:withButtonName(gameInviteAnalyticsManager.ButtonName.ModalPrompt)
					gameInviteAnalyticsManager:inputShareGameEntryPoint()
					gameInviteModalManager:openModal({ trigger = var19 }, p2)
					
					return
				elseif getFFlagEnableNewInviteMenuCustomizationModule() then
					if p1 ~= playersService.LocalPlayer then return end
					local var20 = getFFlagEnableInvitePromptLoadingStateModule()
					
					if var20 then
						modalPrompt:show({ isLoading = true })
					end
					local var21 = getCustomizedInvitePromptParamsModule(p2 or nil, apiGetCanSendAndCanCustomizeInvitesModule)
					
					if var21 then
						modalPrompt:show(var21)
						
						return
					elseif var20 then
						modalPrompt:hide()
						
						return
					end
				elseif p1 == playersService.LocalPlayer then
					local ok, status = pcall(function() --[[ line: 58 ]]
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