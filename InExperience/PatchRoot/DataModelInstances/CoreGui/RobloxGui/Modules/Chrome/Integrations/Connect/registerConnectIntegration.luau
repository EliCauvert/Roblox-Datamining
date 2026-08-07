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
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagChromeActivatedMappedSignal = sharedFlagsModule.FFlagChromeActivatedMappedSignal
local getFFlagIsSquadEnabled = sharedFlagsModule.GetFFlagIsSquadEnabled
local argoPartyExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local var15 = if fFlagChromeActivatedMappedSignal then mappedSignal.new(inExperienceAppChatModalModule.default.visibilitySignal.Event, function() --[[ line: 38 ]]
	-- upvalues: inExperienceAppChatModalModule (ref)
	return inExperienceAppChatModalModule:getVisible()
end) else nil

return function(p0, p1) --[[ line: 43 ]]
	-- upvalues: getFFlagIsSquadEnabled (ref), serviceModule (ref), sideSheetPlacement (ref), argoPartyExperimentation (ref), universalAppPolicyModule (ref), inExperienceAppChatModalModule (ref), chromeIntegrationUtilsModule (ref), connectIntegrationCheckForDirectionalInput (ref), responsiveModule (ref), focusUtils (ref), localStoreModule (ref), getFStringConnectTooltipLocalStorageKeyModule (ref), fFlagChromeActivatedMappedSignal (ref), var15 (ref), reactModule (ref), connectIconModule (ref), appChatInExpUseUnibarNotification (ref), symbol (ref), mouseIconOverrideService (ref)
	local var16 = p0 == "connect_unibar" and getFFlagIsSquadEnabled()
	local var17 = serviceModule:register({
		id = p0,
		sideSheetPlacement = if p0 == "connect_unibar" then sideSheetPlacement.Unibar else sideSheetPlacement.Vertical,
		label = if argoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Title.FriendsChat" else "Feature.Squads.Label.Party" elseif getFFlagIsSquadEnabled() then "Feature.Squads.Label.Party" else "Feature.Chat.Label.RobloxChat",
		activated = function() --[[ line: 56 ]]
			-- upvalues: inExperienceAppChatModalModule (copy), chromeIntegrationUtilsModule (copy), connectIntegrationCheckForDirectionalInput (copy), responsiveModule (copy), focusUtils (copy), localStoreModule (copy), getFStringConnectTooltipLocalStorageKeyModule (copy)
			if inExperienceAppChatModalModule:getVisible() then
				inExperienceAppChatModalModule.default:setVisible(false)
			else
				chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function() --[[ line: 60 ]]
					-- upvalues: connectIntegrationCheckForDirectionalInput (copy), responsiveModule (copy), focusUtils (copy), inExperienceAppChatModalModule (copy)
					if not connectIntegrationCheckForDirectionalInput then
						focusUtils.FocusOffChrome(function() --[[ line: 68 ]]
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
		isActivated = if fFlagChromeActivatedMappedSignal then var15 else function() --[[ line: 78 ]]
			-- upvalues: inExperienceAppChatModalModule (copy)
			return inExperienceAppChatModalModule:getVisible()
		end,
		components = {
			Icon = function(p2) --[[ line: 82 ]]
				-- upvalues: reactModule (copy), connectIconModule (copy), p0 (ref), appChatInExpUseUnibarNotification (copy), var16 (ref)
				return reactModule.createElement(connectIconModule, {
					integrationId = p0,
					isIconVisible = p2.visible,
					shouldShowCustomBadge = not appChatInExpUseUnibarNotification,
					isSquadIndicatorEnabled = var16
				})
			end
		},
		initialAvailability = p1
	})
	
	if appChatInExpUseUnibarNotification then
		if var16 then
			local function _(p3, p4) --[[ line: 97 | named "updateNotificationBadge" ]]
				-- upvalues: var17 (ref)
				if p3 == 0 or p4 then
					var17.notification:clear()
					
					return
				end
				var17.notification:fireCount(p3)
			end
			
			inExperienceAppChatModalModule.default.currentSquadIdSignal.Event:Connect(function(p5) --[[ line: 106 ]]
				-- upvalues: inExperienceAppChatModalModule (copy), var17 (ref)
				local unreadCount = inExperienceAppChatModalModule.default.unreadCount
				
				if unreadCount == 0 or p5 ~= "" then
					var17.notification:clear()
					
					return
				end
				var17.notification:fireCount(unreadCount)
			end)
			inExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(function(p6) --[[ line: 110 ]]
				-- upvalues: inExperienceAppChatModalModule (copy), var17 (ref)
				if p6 == 0 or inExperienceAppChatModalModule.default.currentSquadId ~= "" then
					var17.notification:clear()
					
					return
				end
				var17.notification:fireCount(p6)
			end)
			local unreadCount = inExperienceAppChatModalModule.default.unreadCount
			
			if unreadCount == 0 or inExperienceAppChatModalModule.default.currentSquadId ~= "" then
				var17.notification:clear()
			else
				var17.notification:fireCount(unreadCount)
			end
		else
			local _ = function(p7) --[[ line: 119 | named "updateUnreadMessageCount" ]]
				-- upvalues: var17 (ref)
				if p7 == 0 then
					var17.notification:clear()
					
					return
				end
				var17.notification:fireCount(p7)
			end
			
			inExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(function(p8) --[[ line: 127 ]]
				-- upvalues: var17 (ref)
				if p8 == 0 then
					var17.notification:clear()
					
					return
				end
				var17.notification:fireCount(p8)
			end)
			local unreadCount = inExperienceAppChatModalModule.default.unreadCount
			
			if unreadCount == 0 then
				var17.notification:clear()
			else
				var17.notification:fireCount(unreadCount)
			end
		end
	end
	local inExperienceRobloxConnect = symbol.named("InExperienceRobloxConnect")
	inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p9) --[[ line: 137 ]]
		-- upvalues: mouseIconOverrideService (copy), inExperienceRobloxConnect (ref)
		if p9 then
			mouseIconOverrideService.push(inExperienceRobloxConnect, Enum.OverrideMouseIconBehavior.ForceShow)
			
			return
		end
		mouseIconOverrideService.pop(inExperienceRobloxConnect)
	end)
	
	return var17
end