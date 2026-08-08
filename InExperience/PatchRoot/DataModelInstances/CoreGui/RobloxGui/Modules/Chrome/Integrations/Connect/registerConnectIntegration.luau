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
local connectIntegrationCheckForDirectionalInput = game:DefineFastFlag("ConnectIntegrationCheckForDirectionalInput", false)
local getFFlagIsSquadEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local argoPartyExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local var14 = mappedSignal.new(inExperienceAppChatModalModule.default.visibilitySignal.Event, function() --[[ line: 36 ]]
	-- upvalues: inExperienceAppChatModalModule (ref)
	return inExperienceAppChatModalModule:getVisible()
end)

return function(p0, p1) --[[ line: 40 ]]
	-- upvalues: getFFlagIsSquadEnabled (ref), serviceModule (ref), sideSheetPlacement (ref), argoPartyExperimentation (ref), universalAppPolicyModule (ref), inExperienceAppChatModalModule (ref), chromeIntegrationUtilsModule (ref), connectIntegrationCheckForDirectionalInput (ref), responsiveModule (ref), focusUtils (ref), localStoreModule (ref), getFStringConnectTooltipLocalStorageKeyModule (ref), var14 (ref), reactModule (ref), connectIconModule (ref), appChatInExpUseUnibarNotification (ref), symbol (ref), mouseIconOverrideService (ref)
	local var15 = p0 == "connect_unibar" and getFFlagIsSquadEnabled()
	local var16 = serviceModule:register({
		id = p0,
		sideSheetPlacement = if p0 == "connect_unibar" then sideSheetPlacement.Unibar else sideSheetPlacement.Vertical,
		label = if argoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Title.FriendsChat" else "Feature.Squads.Label.Party" elseif getFFlagIsSquadEnabled() then "Feature.Squads.Label.Party" else "Feature.Chat.Label.RobloxChat",
		activated = function() --[[ line: 53 ]]
			-- upvalues: inExperienceAppChatModalModule (copy), chromeIntegrationUtilsModule (copy), connectIntegrationCheckForDirectionalInput (copy), responsiveModule (copy), focusUtils (copy), localStoreModule (copy), getFStringConnectTooltipLocalStorageKeyModule (copy)
			if inExperienceAppChatModalModule:getVisible() then
				inExperienceAppChatModalModule.default:setVisible(false)
			else
				chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function() --[[ line: 57 ]]
					-- upvalues: connectIntegrationCheckForDirectionalInput (copy), responsiveModule (copy), focusUtils (copy), inExperienceAppChatModalModule (copy)
					if not connectIntegrationCheckForDirectionalInput then
						focusUtils.FocusOffChrome(function() --[[ line: 65 ]]
							-- upvalues: inExperienceAppChatModalModule (copy)
							inExperienceAppChatModalModule.default:setVisible(true)
						end)
						
						return
					elseif responsiveModule.GetInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Directional then
						focusUtils.FocusOffChrome()
					end
					inExperienceAppChatModalModule.default:setVisible(true)
				end)
			end
			localStoreModule.storeForLocalPlayer(getFStringConnectTooltipLocalStorageKeyModule(), true)
		end,
		isActivated = var14,
		components = {
			Icon = function(p2) --[[ line: 75 ]]
				-- upvalues: reactModule (copy), connectIconModule (copy), p0 (ref), appChatInExpUseUnibarNotification (copy), var15 (ref)
				return reactModule.createElement(connectIconModule, {
					integrationId = p0,
					isIconVisible = p2.visible,
					shouldShowCustomBadge = not appChatInExpUseUnibarNotification,
					isSquadIndicatorEnabled = var15
				})
			end
		},
		initialAvailability = p1
	})
	
	if appChatInExpUseUnibarNotification then
		if var15 then
			local function _(p3, p4) --[[ line: 90 | named "updateNotificationBadge" ]]
				-- upvalues: var16 (ref)
				if p3 == 0 or p4 then
					var16.notification:clear()
					
					return
				end
				var16.notification:fireCount(p3)
			end
			
			inExperienceAppChatModalModule.default.currentSquadIdSignal.Event:Connect(function(p5) --[[ line: 99 ]]
				-- upvalues: inExperienceAppChatModalModule (copy), var16 (ref)
				local unreadCount = inExperienceAppChatModalModule.default.unreadCount
				
				if unreadCount == 0 or p5 ~= "" then
					var16.notification:clear()
					
					return
				end
				var16.notification:fireCount(unreadCount)
			end)
			inExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(function(p6) --[[ line: 103 ]]
				-- upvalues: inExperienceAppChatModalModule (copy), var16 (ref)
				if p6 == 0 or inExperienceAppChatModalModule.default.currentSquadId ~= "" then
					var16.notification:clear()
					
					return
				end
				var16.notification:fireCount(p6)
			end)
			local unreadCount = inExperienceAppChatModalModule.default.unreadCount
			
			if unreadCount == 0 or inExperienceAppChatModalModule.default.currentSquadId ~= "" then
				var16.notification:clear()
			else
				var16.notification:fireCount(unreadCount)
			end
		else
			local _ = function(p7) --[[ line: 112 | named "updateUnreadMessageCount" ]]
				-- upvalues: var16 (ref)
				if p7 == 0 then
					var16.notification:clear()
					
					return
				end
				var16.notification:fireCount(p7)
			end
			
			inExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(function(p8) --[[ line: 120 ]]
				-- upvalues: var16 (ref)
				if p8 == 0 then
					var16.notification:clear()
					
					return
				end
				var16.notification:fireCount(p8)
			end)
			local unreadCount = inExperienceAppChatModalModule.default.unreadCount
			
			if unreadCount == 0 then
				var16.notification:clear()
			else
				var16.notification:fireCount(unreadCount)
			end
		end
	end
	local inExperienceRobloxConnect = symbol.named("InExperienceRobloxConnect")
	inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p9) --[[ line: 130 ]]
		-- upvalues: mouseIconOverrideService (copy), inExperienceRobloxConnect (ref)
		if p9 then
			mouseIconOverrideService.push(inExperienceRobloxConnect, Enum.OverrideMouseIconBehavior.ForceShow)
			
			return
		end
		mouseIconOverrideService.pop(inExperienceRobloxConnect)
	end)
	
	return var16
end