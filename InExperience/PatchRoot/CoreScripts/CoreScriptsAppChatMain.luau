local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local chatEntryPointNames = require(corePackagesService.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames
local apolloClientModule = require(coreGuiService.RobloxGui.Modules.ApolloClient)
local fFlagRemoveLoadingTimeoutModule = require(robloxGui.Modules.Flags.FFlagRemoveLoadingTimeout)

if require(robloxGui.Modules.Flags.GetFFlagFixSettingshubImportOrder)() and (not fFlagRemoveLoadingTimeoutModule or not require(corePackagesService.Workspace.Packages.Chrome).Enabled()) then
	coreGuiService:WaitForChild("TopBarApp", if fFlagRemoveLoadingTimeoutModule then 1e999 else nil)
end
local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
local _ = require(corePackagesService.Workspace.Packages.AppChat.ParentContainer)
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local renderCoreScriptInExperienceAppChatModule = require(corePackagesService.Workspace.Packages.AppChat.renderCoreScriptInExperienceAppChat)
local viewportUtilModule = require(robloxGui.Modules.Chrome.ChromeShared.Service.ViewportUtil)
local chatSelectorModule = require(robloxGui.Modules.ChatSelector)
local playerListManagerModule = require(robloxGui.Modules.PlayerList.PlayerListManager)
local constantsModule = require(robloxGui.Modules.TopBar.Constants)
local getFFlagIsSquadEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local SSUIMetaLuaEngineFeature = game:GetEngineFeature("SSUIMetaLua")
inExperienceAppChatModalModule.default:initialize(constantsModule.ApplyDisplayScale(constantsModule.TopBarTopMargin), settingsHubModule, viewportUtilModule, chatSelectorModule, playerListManagerModule)

if SSUIMetaLuaEngineFeature then
	pcall(function() --[[ line: 37 ]]
		-- upvalues: inExperienceAppChatModalModule (ref)
		local safetyService = game:GetService("SafetyService")
		inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p0) --[[ line: 39 ]]
			-- upvalues: safetyService (ref)
			if p0 then
				safetyService:ReportPartyChatWindowOpen()
				
				return
			end
			safetyService:ReportPartyChatWindowClose()
		end)
	end)
end
renderCoreScriptInExperienceAppChatModule(apolloClientModule, {
	getParentContainer = function() --[[ line: 54 ]]
		-- upvalues: inExperienceAppChatModalModule (ref)
		return inExperienceAppChatModalModule.default.frame
	end,
	visibilitySignal = inExperienceAppChatModalModule.default.visibilitySignal.Event,
	getShouldSetAppChatVisible = function(...) --[[ line: 58 ]]
		-- upvalues: inExperienceAppChatModalModule (ref)
		return inExperienceAppChatModalModule:getVisible()
	end,
	entryPoint = chatEntryPointNames.ChromeDropdown,
	hideParentContainer = function() --[[ line: 64 ]]
		-- upvalues: inExperienceAppChatModalModule (ref)
		inExperienceAppChatModalModule.default:setVisible(false)
	end,
	showParentContainer = function() --[[ line: 67 ]]
		-- upvalues: inExperienceAppChatModalModule (ref)
		inExperienceAppChatModalModule.default:setVisible(true)
	end,
	updateCurrentSquadId = function(p1) --[[ line: 70 ]]
		-- upvalues: getFFlagIsSquadEnabled (ref), inExperienceAppChatModalModule (ref)
		if getFFlagIsSquadEnabled() then
			inExperienceAppChatModalModule:setCurrentSquadId(p1)
		end
	end
}, function(p2) --[[ line: 49 ]]
	-- upvalues: inExperienceAppChatModalModule (ref)
	inExperienceAppChatModalModule:setUnreadCount(p2)
end)