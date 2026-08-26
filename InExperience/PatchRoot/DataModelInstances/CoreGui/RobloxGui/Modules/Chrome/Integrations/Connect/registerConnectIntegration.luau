local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local serviceModule = require(chrome.Service)
local chromeUtilsModule = require(chrome.ChromeShared.Service.ChromeUtils)
local connectIconModule = require(script.Parent.ConnectIcon)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local chromeIntegrationUtilsModule = require(chrome.Integrations.ChromeIntegrationUtils)
local localStoreModule = require(chrome.ChromeShared.Service.LocalStore)
local mappedSignal = chromeUtilsModule.MappedSignal
local getFStringConnectTooltipLocalStorageKeyModule = require(chrome.Flags.GetFStringConnectTooltipLocalStorageKey)
local mouseIconOverrideService = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local symbol = require(corePackagesService.Workspace.Packages.AppCommonLib).Symbol
local focusUtils = require(corePackagesService.Workspace.Packages.Chrome).FocusUtils
local universalAppPolicyModule = require(corePackagesService.Workspace.Packages.UniversalAppPolicy)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local appChatInExpUseUnibarNotification = game:DefineFastFlag("AppChatInExpUseUnibarNotification", false)
local getFFlagIsSquadEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local argoPartyExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local var1 = mappedSignal.new(inExperienceAppChatModalModule.default.visibilitySignal.Event, function()
	-- upvalues: inExperienceAppChatModalModule (ref)
	return inExperienceAppChatModalModule:getVisible()
end)

return function(p1, p2)
	-- upvalues: getFFlagIsSquadEnabled (ref), serviceModule (ref), sideSheetPlacement (ref), argoPartyExperimentation (ref), universalAppPolicyModule (ref), inExperienceAppChatModalModule (ref), chromeIntegrationUtilsModule (ref), responsiveModule (ref), focusUtils (ref), localStoreModule (ref), getFStringConnectTooltipLocalStorageKeyModule (ref), var1 (ref), reactModule (ref), connectIconModule (ref), appChatInExpUseUnibarNotification (ref), symbol (ref), mouseIconOverrideService (ref)
	local var2 = p1 == "connect_unibar" and getFFlagIsSquadEnabled()
	local var3 = serviceModule:register({
		id = p1,
		sideSheetPlacement = if p1 == "connect_unibar" then sideSheetPlacement.Unibar else sideSheetPlacement.Vertical,
		label = if argoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Title.FriendsChat" else "Feature.Squads.Label.Party" elseif getFFlagIsSquadEnabled() then "Feature.Squads.Label.Party" else "Feature.Chat.Label.RobloxChat",
		activated = function()
			-- upvalues: inExperienceAppChatModalModule (copy), chromeIntegrationUtilsModule (copy), responsiveModule (copy), focusUtils (copy), localStoreModule (copy), getFStringConnectTooltipLocalStorageKeyModule (copy)
			if inExperienceAppChatModalModule:getVisible() then
				inExperienceAppChatModalModule.default:setVisible(false)
			else
				chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
					-- upvalues: responsiveModule (copy), focusUtils (copy), inExperienceAppChatModalModule (copy)
					if responsiveModule.GetInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Directional then
						focusUtils.FocusOffChrome()
					end
					inExperienceAppChatModalModule.default:setVisible(true)
				end)
			end
			localStoreModule.storeForLocalPlayer(getFStringConnectTooltipLocalStorageKeyModule(), true)
		end,
		isActivated = var1,
		components = {
			Icon = function(p3)
				-- upvalues: reactModule (copy), connectIconModule (copy), p1 (ref), appChatInExpUseUnibarNotification (copy), var2 (ref)
				return reactModule.createElement(connectIconModule, {
					integrationId = p1,
					isIconVisible = p3.visible,
					shouldShowCustomBadge = not appChatInExpUseUnibarNotification,
					isSquadIndicatorEnabled = var2
				})
			end
		},
		initialAvailability = p2
	})
	
	if appChatInExpUseUnibarNotification then
		if var2 then
			local function _(p3, p4)
				-- upvalues: var3 (ref)
				if p3 == 0 or p4 then
					var3.notification:clear()
					
					return
				end
				var3.notification:fireCount(p3)
			end
			
			inExperienceAppChatModalModule.default.currentSquadIdSignal.Event:Connect(function(p3)
				-- upvalues: inExperienceAppChatModalModule (copy), var3 (ref)
				local unreadCount = inExperienceAppChatModalModule.default.unreadCount
				
				if unreadCount == 0 or p3 ~= "" then
					var3.notification:clear()
					
					return
				end
				var3.notification:fireCount(unreadCount)
			end)
			inExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(function(p3)
				-- upvalues: inExperienceAppChatModalModule (copy), var3 (ref)
				if p3 == 0 or inExperienceAppChatModalModule.default.currentSquadId ~= "" then
					var3.notification:clear()
					
					return
				end
				var3.notification:fireCount(p3)
			end)
			local unreadCount = inExperienceAppChatModalModule.default.unreadCount
			
			if unreadCount == 0 or inExperienceAppChatModalModule.default.currentSquadId ~= "" then
				var3.notification:clear()
			else
				var3.notification:fireCount(unreadCount)
			end
		else
			local _ = function(p3)
				-- upvalues: var3 (ref)
				if p3 == 0 then
					var3.notification:clear()
					
					return
				end
				var3.notification:fireCount(p3)
			end
			
			inExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(function(p3)
				-- upvalues: var3 (ref)
				if p3 == 0 then
					var3.notification:clear()
					
					return
				end
				var3.notification:fireCount(p3)
			end)
			local unreadCount = inExperienceAppChatModalModule.default.unreadCount
			
			if unreadCount == 0 then
				var3.notification:clear()
			else
				var3.notification:fireCount(unreadCount)
			end
		end
	end
	local inExperienceRobloxConnect = symbol.named("InExperienceRobloxConnect")
	inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p3)
		-- upvalues: mouseIconOverrideService (copy), inExperienceRobloxConnect (ref)
		if p3 then
			mouseIconOverrideService.push(inExperienceRobloxConnect, Enum.OverrideMouseIconBehavior.ForceShow)
			
			return
		end
		mouseIconOverrideService.pop(inExperienceRobloxConnect)
	end)
	
	return var3
end