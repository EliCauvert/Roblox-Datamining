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
local var13 = mappedSignal.new(inExperienceAppChatModalModule.default.visibilitySignal.Event, function() --[[ line: 34 ]]
	-- upvalues: inExperienceAppChatModalModule (ref)
	return inExperienceAppChatModalModule:getVisible()
end)

return function(p0, p1) --[[ line: 38 ]]
	-- upvalues: getFFlagIsSquadEnabled (ref), serviceModule (ref), sideSheetPlacement (ref), argoPartyExperimentation (ref), universalAppPolicyModule (ref), inExperienceAppChatModalModule (ref), chromeIntegrationUtilsModule (ref), responsiveModule (ref), focusUtils (ref), localStoreModule (ref), getFStringConnectTooltipLocalStorageKeyModule (ref), var13 (ref), reactModule (ref), connectIconModule (ref), appChatInExpUseUnibarNotification (ref), symbol (ref), mouseIconOverrideService (ref)
	local var14 = p0 == "connect_unibar" and getFFlagIsSquadEnabled()
	local var15 = serviceModule:register({
		id = p0,
		sideSheetPlacement = if p0 == "connect_unibar" then sideSheetPlacement.Unibar else sideSheetPlacement.Vertical,
		label = if argoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Title.FriendsChat" else "Feature.Squads.Label.Party" elseif getFFlagIsSquadEnabled() then "Feature.Squads.Label.Party" else "Feature.Chat.Label.RobloxChat",
		activated = function() --[[ line: 51 ]]
			-- upvalues: inExperienceAppChatModalModule (copy), chromeIntegrationUtilsModule (copy), responsiveModule (copy), focusUtils (copy), localStoreModule (copy), getFStringConnectTooltipLocalStorageKeyModule (copy)
			if inExperienceAppChatModalModule:getVisible() then
				inExperienceAppChatModalModule.default:setVisible(false)
			else
				chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function() --[[ line: 55 ]]
					-- upvalues: responsiveModule (copy), focusUtils (copy), inExperienceAppChatModalModule (copy)
					if responsiveModule.GetInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Directional then
						focusUtils.FocusOffChrome()
					end
					inExperienceAppChatModalModule.default:setVisible(true)
				end)
			end
			localStoreModule.storeForLocalPlayer(getFStringConnectTooltipLocalStorageKeyModule(), true)
		end,
		isActivated = var13,
		components = {
			Icon = function(p2) --[[ line: 67 ]]
				-- upvalues: reactModule (copy), connectIconModule (copy), p0 (ref), appChatInExpUseUnibarNotification (copy), var14 (ref)
				return reactModule.createElement(connectIconModule, {
					integrationId = p0,
					isIconVisible = p2.visible,
					shouldShowCustomBadge = not appChatInExpUseUnibarNotification,
					isSquadIndicatorEnabled = var14
				})
			end
		},
		initialAvailability = p1
	})
	
	if appChatInExpUseUnibarNotification then
		if var14 then
			local function _(p3, p4) --[[ line: 82 | named "updateNotificationBadge" ]]
				-- upvalues: var15 (ref)
				if p3 == 0 or p4 then
					var15.notification:clear()
					
					return
				end
				var15.notification:fireCount(p3)
			end
			
			inExperienceAppChatModalModule.default.currentSquadIdSignal.Event:Connect(function(p5) --[[ line: 91 ]]
				-- upvalues: inExperienceAppChatModalModule (copy), var15 (ref)
				local unreadCount = inExperienceAppChatModalModule.default.unreadCount
				
				if unreadCount == 0 or p5 ~= "" then
					var15.notification:clear()
					
					return
				end
				var15.notification:fireCount(unreadCount)
			end)
			inExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(function(p6) --[[ line: 95 ]]
				-- upvalues: inExperienceAppChatModalModule (copy), var15 (ref)
				if p6 == 0 or inExperienceAppChatModalModule.default.currentSquadId ~= "" then
					var15.notification:clear()
					
					return
				end
				var15.notification:fireCount(p6)
			end)
			local unreadCount = inExperienceAppChatModalModule.default.unreadCount
			
			if unreadCount == 0 or inExperienceAppChatModalModule.default.currentSquadId ~= "" then
				var15.notification:clear()
			else
				var15.notification:fireCount(unreadCount)
			end
		else
			local _ = function(p7) --[[ line: 104 | named "updateUnreadMessageCount" ]]
				-- upvalues: var15 (ref)
				if p7 == 0 then
					var15.notification:clear()
					
					return
				end
				var15.notification:fireCount(p7)
			end
			
			inExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(function(p8) --[[ line: 112 ]]
				-- upvalues: var15 (ref)
				if p8 == 0 then
					var15.notification:clear()
					
					return
				end
				var15.notification:fireCount(p8)
			end)
			local unreadCount = inExperienceAppChatModalModule.default.unreadCount
			
			if unreadCount == 0 then
				var15.notification:clear()
			else
				var15.notification:fireCount(unreadCount)
			end
		end
	end
	local inExperienceRobloxConnect = symbol.named("InExperienceRobloxConnect")
	inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p9) --[[ line: 122 ]]
		-- upvalues: mouseIconOverrideService (copy), inExperienceRobloxConnect (ref)
		if p9 then
			mouseIconOverrideService.push(inExperienceRobloxConnect, Enum.OverrideMouseIconBehavior.ForceShow)
			
			return
		end
		mouseIconOverrideService.pop(inExperienceRobloxConnect)
	end)
	
	return var15
end