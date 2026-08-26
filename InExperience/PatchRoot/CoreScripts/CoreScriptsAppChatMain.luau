local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local chatEntryPointNames = require(corePackagesService.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames
local apolloClientModule = require(coreGuiService.RobloxGui.Modules.ApolloClient)
local getFFlagFixSettingshubImportOrderModule = require(robloxGui.Modules.Flags.GetFFlagFixSettingshubImportOrder)
local fFlagRemoveLoadingTimeoutModule = require(robloxGui.Modules.Flags.FFlagRemoveLoadingTimeout)
local var1 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()

if getFFlagFixSettingshubImportOrderModule() and (not fFlagRemoveLoadingTimeoutModule or not var1) then
	coreGuiService:WaitForChild("TopBarApp", if fFlagRemoveLoadingTimeoutModule then 1e999 else nil)
end
local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
local parentContainerModule = require(corePackagesService.Workspace.Packages.AppChat.ParentContainer)
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local renderCoreScriptInExperienceAppChatModule = require(corePackagesService.Workspace.Packages.AppChat.renderCoreScriptInExperienceAppChat)
local viewportUtilModule = require(robloxGui.Modules.Chrome.ChromeShared.Service.ViewportUtil)
local chatSelectorModule = require(robloxGui.Modules.ChatSelector)
local playerListManagerModule = require(robloxGui.Modules.PlayerList.PlayerListManager)
local constantsModule = require(robloxGui.Modules.TopBar.Constants)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local getFFlagIsSquadEnabled = sharedFlagsModule.GetFFlagIsSquadEnabled
local var2 = if sharedFlagsModule.FFlagExpChatEnableFriendsTab and var1 then require(robloxGui.Modules.Chrome.Integrations.ExpChat.ChatChromeIntegration) else nil
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local openConversationModule = require(corePackagesService.Workspace.Packages.FriendsChat.openConversation)
local promiseModule = require(corePackagesService.Packages.Promise)
local SSUIMetaLuaEngineFeature = game:GetEngineFeature("SSUIMetaLua")
inExperienceAppChatModalModule.default:initialize(constantsModule.ApplyDisplayScale(constantsModule.TopBarTopMargin), settingsHubModule, viewportUtilModule, chatSelectorModule, playerListManagerModule)

if SSUIMetaLuaEngineFeature then
	pcall(function()
		-- upvalues: inExperienceAppChatModalModule (ref)
		local safetyService = game:GetService("SafetyService")
		inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p1)
			-- upvalues: safetyService (ref)
			if p1 then
				safetyService:ReportPartyChatWindowOpen()
				
				return
			end
			safetyService:ReportPartyChatWindowClose()
		end)
	end)
end
local var3 = if var2 then var2.chatOpenCapability else nil
renderCoreScriptInExperienceAppChatModule(apolloClientModule, {
	getParentContainer = function()
		-- upvalues: inExperienceAppChatModalModule (ref)
		return inExperienceAppChatModalModule.default.frame
	end,
	visibilitySignal = inExperienceAppChatModalModule.default.visibilitySignal.Event,
	getRequestedRoute = function()
		-- upvalues: inExperienceAppChatModalModule (ref)
		return inExperienceAppChatModalModule.default.requestedRoute
	end,
	requestedRouteSignal = inExperienceAppChatModalModule.default.requestedRouteSignal.Event,
	clearRequestedRoute = function()
		-- upvalues: inExperienceAppChatModalModule (ref)
		inExperienceAppChatModalModule.default:clearRequestedRoute()
	end,
	getShouldSetAppChatVisible = function(...)
		-- upvalues: inExperienceAppChatModalModule (ref)
		return inExperienceAppChatModalModule:getVisible()
	end,
	entryPoint = chatEntryPointNames.ChromeDropdown,
	hideParentContainer = function()
		-- upvalues: inExperienceAppChatModalModule (ref)
		inExperienceAppChatModalModule.default:setVisible(false)
	end,
	showParentContainer = function()
		-- upvalues: inExperienceAppChatModalModule (ref)
		inExperienceAppChatModalModule.default:setVisible(true)
	end,
	updateCurrentSquadId = function(p1)
		-- upvalues: getFFlagIsSquadEnabled (ref), inExperienceAppChatModalModule (ref)
		if getFFlagIsSquadEnabled() then
			inExperienceAppChatModalModule:setCurrentSquadId(p1)
		end
	end,
	openFriendsChatConversation = if var3 then parentContainerModule.createOpenFriendsChatConversation({
		isChatAvailable = var3.isAvailable,
		openConversation = openConversationModule,
		requestSelectFriendsTab = expChatModule.requestSelectFriendsTab,
		ensureOpenChat = var3.ensureOpenChat
	}) else function(_)
		-- upvalues: promiseModule (ref)
		return promiseModule.resolve(false)
	end
}, function(p1)
	-- upvalues: inExperienceAppChatModalModule (ref)
	inExperienceAppChatModalModule:setUnreadCount(p1)
end)