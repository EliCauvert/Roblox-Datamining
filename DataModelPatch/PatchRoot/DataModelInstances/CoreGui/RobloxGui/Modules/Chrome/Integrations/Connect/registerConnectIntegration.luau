local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ServiceModule = require(Chrome.Service)
local ConnectIconModule = require(script.Parent.ConnectIcon)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local ChromeIntegrationUtilsModule = require(Chrome.Integrations.ChromeIntegrationUtils)
local LocalStoreModule = require(Chrome.ChromeShared.Service.LocalStore)
local MappedSignal = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local GetFStringConnectTooltipLocalStorageKeyModule = require(Chrome.Flags.GetFStringConnectTooltipLocalStorageKey)
local MouseIconOverrideService = require(CorePackages.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local Symbol = require(CorePackages.Workspace.Packages.AppCommonLib).Symbol
local FocusUtils = require(CorePackages.Workspace.Packages.Chrome).FocusUtils
local UniversalAppPolicyModule = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local AppChatInExpUseUnibarNotification = game:DefineFastFlag("AppChatInExpUseUnibarNotification", false)
local ConnectIntegrationCheckForDirectionalInput = game:DefineFastFlag("ConnectIntegrationCheckForDirectionalInput", false)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagChromeActivatedMappedSignal = SharedFlagsModule.FFlagChromeActivatedMappedSignal
local GetFFlagIsSquadEnabledFunction = SharedFlagsModule.GetFFlagIsSquadEnabled
local ArgoPartyExperimentation = require(CorePackages.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local NewMappedSignal = if FFlagChromeActivatedMappedSignal then MappedSignal.new(InExperienceAppChatModalModule.default.visibilitySignal.Event, function()
	-- upvalues: InExperienceAppChatModalModule (copy)
	return InExperienceAppChatModalModule:getVisible()
end) else nil

return function(Id, InitialAvailability)
	-- upvalues: GetFFlagIsSquadEnabledFunction (copy), ServiceModule (copy), SideSheetPlacement (copy), ArgoPartyExperimentation (copy), UniversalAppPolicyModule (copy), InExperienceAppChatModalModule (copy), ChromeIntegrationUtilsModule (copy), ConnectIntegrationCheckForDirectionalInput (copy), ResponsiveModule (copy), FocusUtils (copy), LocalStoreModule (copy), GetFStringConnectTooltipLocalStorageKeyModule (copy), FFlagChromeActivatedMappedSignal (copy), NewMappedSignal (copy), ReactModule (copy), ConnectIconModule (copy), AppChatInExpUseUnibarNotification (copy), Symbol (copy), MouseIconOverrideService (copy)
	local FFlagIsSquadEnabled = Id == "connect_unibar" and GetFFlagIsSquadEnabledFunction()
	local RegisterResult = ServiceModule:register({
		id = Id,
		sideSheetPlacement = if Id == "connect_unibar" then SideSheetPlacement.Unibar else SideSheetPlacement.Vertical,
		label = if ArgoPartyExperimentation.getIsRenameEnabled() then if UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Title.FriendsChat" else "Feature.Squads.Label.Party" elseif GetFFlagIsSquadEnabledFunction() then "Feature.Squads.Label.Party" else "Feature.Chat.Label.RobloxChat",
		activated = function()
			-- upvalues: InExperienceAppChatModalModule (upval), ChromeIntegrationUtilsModule (upval), ConnectIntegrationCheckForDirectionalInput (upval), ResponsiveModule (upval), FocusUtils (upval), LocalStoreModule (upval), GetFStringConnectTooltipLocalStorageKeyModule (upval)
			if InExperienceAppChatModalModule:getVisible() then
				InExperienceAppChatModalModule.default:setVisible(false)
			else
				ChromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
					-- upvalues: ConnectIntegrationCheckForDirectionalInput (upval), ResponsiveModule (upval), FocusUtils (upval), InExperienceAppChatModalModule (upval)
					if not ConnectIntegrationCheckForDirectionalInput then
						FocusUtils.FocusOffChrome(function()
							-- upvalues: InExperienceAppChatModalModule (upval)
							InExperienceAppChatModalModule.default:setVisible(true)
						end)
						
						return
					end
					if ResponsiveModule.GetInputModeStore(false).getLastInputType(false) == ResponsiveModule.Input.Directional then
						FocusUtils.FocusOffChrome()
					end
					InExperienceAppChatModalModule.default:setVisible(true)
				end)
			end
			LocalStoreModule.storeForLocalPlayer(GetFStringConnectTooltipLocalStorageKeyModule(), true)
		end,
		isActivated = if FFlagChromeActivatedMappedSignal then NewMappedSignal else function()
			-- upvalues: InExperienceAppChatModalModule (upval)
			return InExperienceAppChatModalModule:getVisible()
		end,
		components = {
			Icon = function(p1)
				-- upvalues: ReactModule (upval), ConnectIconModule (upval), Id (copy), AppChatInExpUseUnibarNotification (upval), FFlagIsSquadEnabled (copy)
				return ReactModule.createElement(ConnectIconModule, {
					integrationId = Id,
					isIconVisible = p1.visible,
					shouldShowCustomBadge = not AppChatInExpUseUnibarNotification,
					isSquadIndicatorEnabled = FFlagIsSquadEnabled
				})
			end
		},
		initialAvailability = InitialAvailability
	})
	
	if AppChatInExpUseUnibarNotification then
		if FFlagIsSquadEnabled then
			local function _(p1, p2)
				-- upvalues: RegisterResult (copy)
				if p1 == 0 or p2 then
					RegisterResult.notification:clear()
					
					return
				else
					RegisterResult.notification:fireCount(p1)
				end
			end
			
			InExperienceAppChatModalModule.default.currentSquadIdSignal.Event:Connect(function(p1)
				-- upvalues: InExperienceAppChatModalModule (upval), RegisterResult (copy)
				local UnreadCount = InExperienceAppChatModalModule.default.unreadCount
				
				if UnreadCount == 0 or p1 ~= "" then
					RegisterResult.notification:clear()
					
					return
				else
					RegisterResult.notification:fireCount(UnreadCount)
				end
			end)
			InExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(function(p1)
				-- upvalues: InExperienceAppChatModalModule (upval), RegisterResult (copy)
				local IsNotCurrentSquadIdMatch = InExperienceAppChatModalModule.default.currentSquadId ~= ""
				
				if p1 == 0 or IsNotCurrentSquadIdMatch then
					RegisterResult.notification:clear()
					
					return
				else
					RegisterResult.notification:fireCount(p1)
				end
			end)
			local UnreadCount = InExperienceAppChatModalModule.default.unreadCount
			local IsNotCurrentSquadIdMatch = InExperienceAppChatModalModule.default.currentSquadId ~= ""
			
			if UnreadCount == 0 or IsNotCurrentSquadIdMatch then
				RegisterResult.notification:clear()
			else
				RegisterResult.notification:fireCount(UnreadCount)
			end
		else
			local _ = function(p1)
				-- upvalues: RegisterResult (copy)
				if p1 == 0 then
					RegisterResult.notification:clear()
					
					return
				else
					RegisterResult.notification:fireCount(p1)
				end
			end
			
			InExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(function(p1)
				-- upvalues: RegisterResult (copy)
				if p1 == 0 then
					RegisterResult.notification:clear()
					
					return
				else
					RegisterResult.notification:fireCount(p1)
				end
			end)
			local UnreadCount1 = InExperienceAppChatModalModule.default.unreadCount
			
			if UnreadCount1 == 0 then
				RegisterResult.notification:clear()
			else
				RegisterResult.notification:fireCount(UnreadCount1)
			end
		end
	end
	local InExperienceRobloxConnect = Symbol.named("InExperienceRobloxConnect")
	InExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p1)
		-- upvalues: MouseIconOverrideService (upval), InExperienceRobloxConnect (copy)
		if p1 then
			MouseIconOverrideService.push(InExperienceRobloxConnect, Enum.OverrideMouseIconBehavior.ForceShow)
			
			return
		else
			MouseIconOverrideService.pop(InExperienceRobloxConnect)
		end
	end)
	
	return RegisterResult
end