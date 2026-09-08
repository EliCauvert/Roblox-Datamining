local runService = game:GetService("RunService")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local coreScriptsCommonModule = require(parent.CoreScriptsCommon)
local reactModule = require(parent.React)
local peopleServiceModule = require(parent.PeopleService)
local signalsReactModule = require(parent.SignalsReact)
local signalsModule = require(parent.Signals)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local sharedFlagsModule = require(parent.SharedFlags)
local switchServerModule = require(parent.SwitchServer)
local flags = peopleServiceModule.getService("Flags")
local getFFlagNewPeoplePageIcons = flags.GetFFlagNewPeoplePageIcons
local fFlagEnablePeoplePageButtonOnMount = flags.FFlagEnablePeoplePageButtonOnMount
local fFlagShowSwitchServerButton = sharedFlagsModule.FFlagShowSwitchServerButton
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagHidePeoplePageInviteFriends = sharedFlagsModule.FFlagHidePeoplePageInviteFriends
local fFlagAddInviteFriendsIntegration = sharedFlagsModule.FFlagAddInviteFriendsIntegration
local fFlagPeopleTabUseSwitchServerModule = require(peopleReactView.Flags.FFlagPeopleTabUseSwitchServerModule)
local isSideSheetEnabledModule = require(parent.InExperienceSideSheetUtils.isSideSheetEnabled)
local var1 = require(parent.PioneerUtils).isPioneerLaunch()
local constantsModule = require(peopleReactView.Constants)
local STANDARD_SERVER = coreScriptsCommonModule.Constants.STANDARD_SERVER
local constants = switchServerModule.Constants
local useSignalBinding = signalsReactModule.useSignalBinding
local useSignalState = signalsReactModule.useSignalState
local getSwitchServerStore = switchServerModule.GetSwitchServerStore
local switchServerTelemetry = switchServerModule.SwitchServerTelemetry
local var2 = false

local function _()
	-- upvalues: var2 (write), switchServerTelemetry (ref)
	if not var2 then
		var2 = true
		switchServerTelemetry.sendSwitchServerButtonActions({ event_type = "impression" })
	end
end

return function(p1, p2)
	-- upvalues: fFlagShowSwitchServerButton (ref), fFlagPeopleTabUseSwitchServerModule (ref), reactModule (ref), signalsModule (ref), runService (ref), robloxReplicatedStorageService (ref), useSignalState (ref), getSwitchServerStore (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), constants (ref), peopleServiceModule (ref), useSignalBinding (ref), fFlagHidePeoplePageInviteFriends (ref), fFlagAddInviteFriendsIntegration (ref), isSideSheetEnabledModule (ref), getFFlagNewPeoplePageIcons (ref), var1 (ref), playersService (ref), STANDARD_SERVER (ref), fFlagEnablePeoplePageButtonOnMount (ref), var2 (write), switchServerTelemetry (ref)
	local var3 = if fFlagShowSwitchServerButton and not fFlagPeopleTabUseSwitchServerModule then reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), runService (copy), robloxReplicatedStorageService (copy)
		local var4, var5 = signalsModule.createSignal(nil)
		
		if not runService:IsStudio() then
			local getServerType = robloxReplicatedStorageService:WaitForChild("GetServerType", 2)
			
			if getServerType then
				local ok, status = pcall(function()
					-- upvalues: getServerType (ref)
					return getServerType:InvokeServer()
				end)
				
				if ok then
					var5(status)
				end
			end
		end
		return var4
	end, {}) else nil
	local var4 = if fFlagShowSwitchServerButton and not fFlagPeopleTabUseSwitchServerModule then useSignalState(var3) else nil
	local var5 = if fFlagShowSwitchServerButton and fFlagPeopleTabUseSwitchServerModule then useSignalState(getSwitchServerStore(false).shouldEnableSwitchServer) else false
	local var6 = useLocalization({
		inviteFriends = if fFlagConnectionsToFriendsRename then constantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.INVITE_FRIENDS else constantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.INVITE_CONNECTIONS,
		muteAll = constantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.MUTE_ALL,
		unmuteAll = constantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.UNMUTE_ALL,
		switchServer = constants.BUTTON.LABEL,
		muteSelf = constantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.MUTE_SELF,
		unmuteSelf = constantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.UNMUTE_SELF
	})
	local peopleVoiceChatStore = peopleServiceModule.getService("PeopleVoiceChatStore")
	local peopleAnalyticsManager = peopleServiceModule.getService("PeopleAnalyticsManager")
	local settingsHubService = peopleServiceModule.getService("SettingsHubService")
	local voiceChatServiceConnected = peopleVoiceChatStore.voiceChatServiceConnected
	local var7 = useSignalState(peopleVoiceChatStore.voiceUIVisible)
	local allPlayersMuted = peopleVoiceChatStore.allPlayersMuted
	local var8 = useSignalBinding(allPlayersMuted)
	local localMuted = peopleVoiceChatStore.localMuted
	local var9 = useSignalBinding(localMuted)
	local var10 = var8:map(function(p3)
		-- upvalues: var6 (ref)
		return if p3 then var6.unmuteAll else var6.muteAll
	end)
	local var11 = var9:map(function(p3)
		-- upvalues: var6 (ref)
		local unmuteSelf
		if p3 == nil then
			unmuteSelf = var6.muteSelf
		elseif p3 then
			unmuteSelf = var6.unmuteSelf
			
			return unmuteSelf or var6.muteSelf
		end
	end)
	
	return reactModule.useMemo(function()
		-- upvalues: fFlagHidePeoplePageInviteFriends (copy), fFlagAddInviteFriendsIntegration (copy), isSideSheetEnabledModule (copy), var6 (ref), getFFlagNewPeoplePageIcons (copy), constantsModule (copy), var1 (copy), runService (copy), playersService (copy), settingsHubService (ref), peopleAnalyticsManager (ref), var10 (ref), allPlayersMuted (ref), var7 (ref), var8 (ref), peopleVoiceChatStore (ref), fFlagShowSwitchServerButton (copy), constants (copy), fFlagPeopleTabUseSwitchServerModule (copy), var5 (ref), var4 (ref), STANDARD_SERVER (copy), p2 (ref), fFlagEnablePeoplePageButtonOnMount (copy), var2 (copy), switchServerTelemetry (copy), var11 (ref), localMuted (ref), p1 (ref), var9 (ref)
		local t = {}
		
		if not fFlagHidePeoplePageInviteFriends or not fFlagAddInviteFriendsIntegration or not isSideSheetEnabledModule then
			table.insert(t, {
				id = "inviteFriends",
				layoutOrder = 1,
				text = var6.inviteFriends,
				onIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_LEGACY,
				isNewIcon = getFFlagNewPeoplePageIcons(),
				shouldShow = function()
					-- upvalues: var1 (copy), runService (copy), playersService (copy)
					return not var1 and (not runService:IsStudio() and (playersService.LocalPlayer ~= nil and playersService.LocalPlayer.UserId > 0))
				end,
				onActivated = function()
					-- upvalues: settingsHubService (copy), peopleAnalyticsManager (copy)
					local var12 = settingsHubService.hubRef()
					
					if var12 then
						peopleAnalyticsManager:trackGameInviteEntryPoint()
						var12:InviteToGame()
					end
				end
			})
		end
		table.insert(t, {
			id = "muteAll",
			layoutOrder = 2,
			text = var10,
			onIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_LEGACY,
			offIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_LEGACY,
			buttonState = allPlayersMuted,
			isNewIcon = getFFlagNewPeoplePageIcons(),
			shouldShow = function()
				-- upvalues: var7 (copy)
				return var7
			end,
			onActivated = function()
				-- upvalues: var8 (copy), peopleAnalyticsManager (copy), peopleVoiceChatStore (copy)
				peopleAnalyticsManager:trackToggleMuteAll(var8:getValue())
				peopleVoiceChatStore.toggleMuteAll()
			end
		})
		
		if fFlagShowSwitchServerButton and not isSideSheetEnabledModule then
			table.insert(t, {
				id = "switchServer",
				isNewIcon = true,
				layoutOrder = 3,
				text = var6.switchServer,
				onIcon = constants.BUTTON.ICON,
				shouldShow = function()
					-- upvalues: fFlagPeopleTabUseSwitchServerModule (copy), var5 (copy), var4 (copy), STANDARD_SERVER (copy), playersService (copy)
					return if fFlagPeopleTabUseSwitchServerModule then var5 else game:GetEngineFeature("GameIdToExcludeAvailable") and (var4 == STANDARD_SERVER and playersService.MaxPlayers > 1)
				end,
				onActivated = p2[constantsModule.PEOPLEPAGE.BUTTON_ACTIVATED_TABLE_KEYS.SWITCH_SERVER],
				onMount = if fFlagEnablePeoplePageButtonOnMount then function()
					-- upvalues: var2 (copy), switchServerTelemetry (copy)
					if not var2 then
						var2 = true
						switchServerTelemetry.sendSwitchServerButtonActions({ event_type = "impression" })
					end
				end else nil
			})
		end
		table.insert(t, {
			id = "muteSelf",
			isNewIcon = false,
			text = var11,
			onIcon = constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE,
			offIcon = constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE_MUTED,
			animatedIcon = peopleVoiceChatStore.getMuteSelfIcon(),
			buttonState = localMuted,
			shouldShow = function()
				-- upvalues: var7 (copy), p1 (copy)
				return var7 and not p1
			end,
			onActivated = function()
				-- upvalues: var9 (copy), peopleAnalyticsManager (copy), peopleVoiceChatStore (copy)
				peopleAnalyticsManager:trackToggleMuteSelf(var9:getValue() or false)
				peopleVoiceChatStore.toggleMuteSelf()
			end,
			layoutOrder = if fFlagShowSwitchServerButton then 4 else 3
		})
		
		return t
	end, { var7, voiceChatServiceConnected, var3 })
end