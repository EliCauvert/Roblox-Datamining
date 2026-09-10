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
local constantsModule = require(peopleReactView.Constants)
local STANDARD_SERVER = coreScriptsCommonModule.Constants.STANDARD_SERVER
local constants = switchServerModule.Constants
local useSignalBinding = signalsReactModule.useSignalBinding
local useSignalState = signalsReactModule.useSignalState
local getSwitchServerStore = switchServerModule.GetSwitchServerStore
local switchServerTelemetry = switchServerModule.SwitchServerTelemetry
local var1 = false

local function _()
	-- upvalues: var1 (write), switchServerTelemetry (ref)
	if not var1 then
		var1 = true
		switchServerTelemetry.sendSwitchServerButtonActions({ event_type = "impression" })
	end
end

return function(p1, p2)
	-- upvalues: fFlagShowSwitchServerButton (ref), fFlagPeopleTabUseSwitchServerModule (ref), reactModule (ref), signalsModule (ref), runService (ref), robloxReplicatedStorageService (ref), useSignalState (ref), getSwitchServerStore (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), constants (ref), peopleServiceModule (ref), useSignalBinding (ref), fFlagHidePeoplePageInviteFriends (ref), fFlagAddInviteFriendsIntegration (ref), isSideSheetEnabledModule (ref), getFFlagNewPeoplePageIcons (ref), playersService (ref), STANDARD_SERVER (ref), fFlagEnablePeoplePageButtonOnMount (ref), var1 (write), switchServerTelemetry (ref)
	local var2 = if fFlagShowSwitchServerButton and not fFlagPeopleTabUseSwitchServerModule then reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), runService (copy), robloxReplicatedStorageService (copy)
		local var3, var4 = signalsModule.createSignal(nil)
		
		if not runService:IsStudio() then
			local getServerType = robloxReplicatedStorageService:WaitForChild("GetServerType", 2)
			
			if getServerType then
				local ok, status = pcall(function()
					-- upvalues: getServerType (ref)
					return getServerType:InvokeServer()
				end)
				
				if ok then
					var4(status)
				end
			end
		end
		return var3
	end, {}) else nil
	local var3 = if fFlagShowSwitchServerButton and not fFlagPeopleTabUseSwitchServerModule then useSignalState(var2) else nil
	local var4 = if fFlagShowSwitchServerButton and fFlagPeopleTabUseSwitchServerModule then useSignalState(getSwitchServerStore(false).shouldEnableSwitchServer) else false
	local var5 = useLocalization({
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
	local var6 = useSignalState(peopleVoiceChatStore.voiceUIVisible)
	local allPlayersMuted = peopleVoiceChatStore.allPlayersMuted
	local var7 = useSignalBinding(allPlayersMuted)
	local localMuted = peopleVoiceChatStore.localMuted
	local var8 = useSignalBinding(localMuted)
	local var9 = var7:map(function(p3)
		-- upvalues: var5 (ref)
		return if p3 then var5.unmuteAll else var5.muteAll
	end)
	local var10 = var8:map(function(p3)
		-- upvalues: var5 (ref)
		local unmuteSelf
		if p3 == nil then
			unmuteSelf = var5.muteSelf
		elseif p3 then
			unmuteSelf = var5.unmuteSelf
			
			return unmuteSelf or var5.muteSelf
		end
	end)
	
	return reactModule.useMemo(function()
		-- upvalues: fFlagHidePeoplePageInviteFriends (copy), fFlagAddInviteFriendsIntegration (copy), isSideSheetEnabledModule (copy), var5 (ref), getFFlagNewPeoplePageIcons (copy), constantsModule (copy), runService (copy), playersService (copy), settingsHubService (ref), peopleAnalyticsManager (ref), var9 (ref), allPlayersMuted (ref), var6 (ref), var7 (ref), peopleVoiceChatStore (ref), fFlagShowSwitchServerButton (copy), constants (copy), fFlagPeopleTabUseSwitchServerModule (copy), var4 (ref), var3 (ref), STANDARD_SERVER (copy), p2 (ref), fFlagEnablePeoplePageButtonOnMount (copy), var1 (copy), switchServerTelemetry (copy), var10 (ref), localMuted (ref), p1 (ref), var8 (ref)
		local t = {}
		
		if not fFlagHidePeoplePageInviteFriends or not fFlagAddInviteFriendsIntegration or not isSideSheetEnabledModule then
			table.insert(t, {
				id = "inviteFriends",
				layoutOrder = 1,
				text = var5.inviteFriends,
				onIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_LEGACY,
				isNewIcon = getFFlagNewPeoplePageIcons(),
				shouldShow = function()
					-- upvalues: runService (copy), playersService (copy)
					return not runService:IsStudio() and (playersService.LocalPlayer ~= nil and playersService.LocalPlayer.UserId > 0)
				end,
				onActivated = function()
					-- upvalues: settingsHubService (copy), peopleAnalyticsManager (copy)
					local var11 = settingsHubService.hubRef()
					
					if var11 then
						peopleAnalyticsManager:trackGameInviteEntryPoint()
						var11:InviteToGame()
					end
				end
			})
		end
		table.insert(t, {
			id = "muteAll",
			layoutOrder = 2,
			text = var9,
			onIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_LEGACY,
			offIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_LEGACY,
			buttonState = allPlayersMuted,
			isNewIcon = getFFlagNewPeoplePageIcons(),
			shouldShow = function()
				-- upvalues: var6 (copy)
				return var6
			end,
			onActivated = function()
				-- upvalues: var7 (copy), peopleAnalyticsManager (copy), peopleVoiceChatStore (copy)
				peopleAnalyticsManager:trackToggleMuteAll(var7:getValue())
				peopleVoiceChatStore.toggleMuteAll()
			end
		})
		
		if fFlagShowSwitchServerButton and not isSideSheetEnabledModule then
			table.insert(t, {
				id = "switchServer",
				isNewIcon = true,
				layoutOrder = 3,
				text = var5.switchServer,
				onIcon = constants.BUTTON.ICON,
				shouldShow = function()
					-- upvalues: fFlagPeopleTabUseSwitchServerModule (copy), var4 (copy), var3 (copy), STANDARD_SERVER (copy), playersService (copy)
					return if fFlagPeopleTabUseSwitchServerModule then var4 else game:GetEngineFeature("GameIdToExcludeAvailable") and (var3 == STANDARD_SERVER and playersService.MaxPlayers > 1)
				end,
				onActivated = p2[constantsModule.PEOPLEPAGE.BUTTON_ACTIVATED_TABLE_KEYS.SWITCH_SERVER],
				onMount = if fFlagEnablePeoplePageButtonOnMount then function()
					-- upvalues: var1 (copy), switchServerTelemetry (copy)
					if not var1 then
						var1 = true
						switchServerTelemetry.sendSwitchServerButtonActions({ event_type = "impression" })
					end
				end else nil
			})
		end
		table.insert(t, {
			id = "muteSelf",
			isNewIcon = false,
			text = var10,
			onIcon = constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE,
			offIcon = constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE_MUTED,
			animatedIcon = peopleVoiceChatStore.getMuteSelfIcon(),
			buttonState = localMuted,
			shouldShow = function()
				-- upvalues: var6 (copy), p1 (copy)
				return var6 and not p1
			end,
			onActivated = function()
				-- upvalues: var8 (copy), peopleAnalyticsManager (copy), peopleVoiceChatStore (copy)
				peopleAnalyticsManager:trackToggleMuteSelf(var8:getValue() or false)
				peopleVoiceChatStore.toggleMuteSelf()
			end,
			layoutOrder = if fFlagShowSwitchServerButton then 4 else 3
		})
		
		return t
	end, { var6, voiceChatServiceConnected, var2 })
end