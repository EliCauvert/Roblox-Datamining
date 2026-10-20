local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local ChatEntryPointNames = require(CorePackages.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames
local ApolloClientModule = require(CoreGui.RobloxGui.Modules.ApolloClient)
local FFlagRemoveLoadingTimeoutModule = require(RobloxGui.Modules.Flags.FFlagRemoveLoadingTimeout)
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()

if require(RobloxGui.Modules.Flags.GetFFlagFixSettingshubImportOrder)() and (not FFlagRemoveLoadingTimeoutModule or not EnabledResult) then
	CoreGui:WaitForChild("TopBarApp", if FFlagRemoveLoadingTimeoutModule then 1e999 else nil)
end
local _ = require(CorePackages.Workspace.Packages.AppChat.ParentContainer)
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local RenderCoreScriptInExperienceAppChatModule: (any, any, any) -> () = require(CorePackages.Workspace.Packages.AppChat.renderCoreScriptInExperienceAppChat)
local ConstantsModule = require(RobloxGui.Modules.TopBar.Constants)
local GetFFlagIsSquadEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local SSUIMetaLuaEngineFeature = game:GetEngineFeature("SSUIMetaLua")
InExperienceAppChatModalModule.default:initialize(ConstantsModule.ApplyDisplayScale(ConstantsModule.TopBarTopMargin), require(RobloxGui.Modules.Settings.SettingsHub), require(RobloxGui.Modules.Chrome.ChromeShared.Service.ViewportUtil), require(RobloxGui.Modules.ChatSelector), (require(RobloxGui.Modules.PlayerList.PlayerListManager)))

if SSUIMetaLuaEngineFeature then
	pcall(function()
		-- upvalues: InExperienceAppChatModalModule (copy)
		local SafetyService = game:GetService("SafetyService")
		InExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p1)
			-- upvalues: SafetyService (copy)
			if p1 then
				SafetyService:ReportPartyChatWindowOpen()
				
				return
			else
				SafetyService:ReportPartyChatWindowClose()
			end
		end)
	end)
end
RenderCoreScriptInExperienceAppChatModule(ApolloClientModule, {
	getParentContainer = function()
		-- upvalues: InExperienceAppChatModalModule (copy)
		return InExperienceAppChatModalModule.default.frame
	end,
	visibilitySignal = InExperienceAppChatModalModule.default.visibilitySignal.Event,
	getRequestedRoute = function()
		-- upvalues: InExperienceAppChatModalModule (copy)
		return InExperienceAppChatModalModule.default.requestedRoute
	end,
	requestedRouteSignal = InExperienceAppChatModalModule.default.requestedRouteSignal.Event,
	clearRequestedRoute = function()
		-- upvalues: InExperienceAppChatModalModule (copy)
		InExperienceAppChatModalModule.default:clearRequestedRoute()
	end,
	getShouldSetAppChatVisible = function(...)
		-- upvalues: InExperienceAppChatModalModule (copy)
		return InExperienceAppChatModalModule:getVisible()
	end,
	entryPoint = ChatEntryPointNames.ChromeDropdown,
	hideParentContainer = function()
		-- upvalues: InExperienceAppChatModalModule (copy)
		InExperienceAppChatModalModule.default:setVisible(false)
	end,
	showParentContainer = function()
		-- upvalues: InExperienceAppChatModalModule (copy)
		InExperienceAppChatModalModule.default:setVisible(true)
	end,
	updateCurrentSquadId = function(p1)
		-- upvalues: GetFFlagIsSquadEnabledFunction (copy), InExperienceAppChatModalModule (copy)
		if GetFFlagIsSquadEnabledFunction() then
			InExperienceAppChatModalModule:setCurrentSquadId(p1)
		end
	end
}, function(p1)
	-- upvalues: InExperienceAppChatModalModule (copy)
	InExperienceAppChatModalModule:setUnreadCount(p1)
end)