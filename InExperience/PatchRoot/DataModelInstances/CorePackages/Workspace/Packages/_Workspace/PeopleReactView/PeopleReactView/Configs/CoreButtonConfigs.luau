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
local flags = peopleServiceModule.getService("Flags")
local getFFlagNewPeoplePageIcons = flags.GetFFlagNewPeoplePageIcons
local fFlagShowSwitchServerButton = flags.FFlagShowSwitchServerButton
local fFlagEnablePeoplePageButtonOnMount = flags.FFlagEnablePeoplePageButtonOnMount
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagHidePeoplePageInviteFriends = sharedFlagsModule.FFlagHidePeoplePageInviteFriends
local fFlagAddInviteFriendsIntegration = sharedFlagsModule.FFlagAddInviteFriendsIntegration
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagDebugEnablePioneerUX = fFlagEnableSideSheet and sharedFlagsModule.FFlagDebugEnablePioneerUX
local constantsModule = require(peopleReactView.Constants)
local STANDARD_SERVER = coreScriptsCommonModule.Constants.STANDARD_SERVER
local useSignalBinding = signalsReactModule.useSignalBinding
local useSignalState = signalsReactModule.useSignalState
local switchServerTelemetryModule = require(peopleReactView.Telemetry.SwitchServerTelemetry)
local var14 = false

local function _() --[[ line: 57 | named "sendSwitchServerButtonImpressionOnce" ]]
	-- upvalues: var14 (write), switchServerTelemetryModule (ref)
	if not var14 then
		var14 = true
		switchServerTelemetryModule.sendSwitchServerButtonActions({ event_type = "impression" })
	end
end

return function(p0, p1) --[[ line: 66 | named "useCoreButtonConfigs" ]]
	-- upvalues: fFlagShowSwitchServerButton (ref), reactModule (ref), signalsModule (ref), runService (ref), robloxReplicatedStorageService (ref), useSignalState (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), peopleServiceModule (ref), useSignalBinding (ref), fFlagHidePeoplePageInviteFriends (ref), fFlagAddInviteFriendsIntegration (ref), fFlagEnableSideSheet (ref), getFFlagNewPeoplePageIcons (ref), fFlagDebugEnablePioneerUX (ref), playersService (ref), STANDARD_SERVER (ref), fFlagEnablePeoplePageButtonOnMount (ref), var14 (write), switchServerTelemetryModule (ref)
	local var15 = if fFlagShowSwitchServerButton then reactModule.useMemo(function() --[[ line: 72 ]]
		-- upvalues: signalsModule (copy), runService (copy), robloxReplicatedStorageService (copy)
		local var26, var27 = signalsModule.createSignal(nil)
		
		if not runService:IsStudio() then
			local getServerType = robloxReplicatedStorageService:WaitForChild("GetServerType", 2)
			
			if getServerType then
				local ok, status = pcall(function() --[[ line: 78 ]]
					-- upvalues: getServerType (ref)
					return getServerType:InvokeServer()
				end)
				
				if ok then
					var27(status)
				end
			end
		end
		return var26
	end, {}) else nil
	local var16 = if fFlagShowSwitchServerButton then useSignalState(var15) else nil
	local var17 = useLocalization({
		inviteFriends = if fFlagConnectionsToFriendsRename then constantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.INVITE_FRIENDS else constantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.INVITE_CONNECTIONS,
		muteAll = constantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.MUTE_ALL,
		unmuteAll = constantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.UNMUTE_ALL,
		switchServer = constantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.SWITCH_SERVER,
		muteSelf = constantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.MUTE_SELF,
		unmuteSelf = constantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.UNMUTE_SELF
	})
	local peopleVoiceChatStore = peopleServiceModule.getService("PeopleVoiceChatStore")
	local peopleAnalyticsManager = peopleServiceModule.getService("PeopleAnalyticsManager")
	local settingsHubService = peopleServiceModule.getService("SettingsHubService")
	local voiceChatServiceConnected = peopleVoiceChatStore.voiceChatServiceConnected
	local var21 = useSignalState(peopleVoiceChatStore.voiceUIVisible)
	local allPlayersMuted = peopleVoiceChatStore.allPlayersMuted
	local var22 = useSignalBinding(allPlayersMuted)
	local localMuted = peopleVoiceChatStore.localMuted
	local var23 = useSignalBinding(localMuted)
	local var24 = var22:map(function(p2) --[[ line: 116 ]]
		-- upvalues: var17 (ref)
		return if p2 then var17.unmuteAll else var17.muteAll
	end)
	local var25 = var23:map(function(p3) --[[ line: 120 ]]
		-- upvalues: var17 (ref)
		local unmuteSelf
		if p3 == nil then
			unmuteSelf = var17.muteSelf
		elseif p3 then
			unmuteSelf = var17.unmuteSelf
			
			return unmuteSelf or var17.muteSelf
		end
	end)
	
	return reactModule.useMemo(function() --[[ line: 127 ]]
		-- upvalues: fFlagHidePeoplePageInviteFriends (copy), fFlagAddInviteFriendsIntegration (copy), fFlagEnableSideSheet (copy), var17 (ref), getFFlagNewPeoplePageIcons (copy), constantsModule (copy), fFlagDebugEnablePioneerUX (copy), runService (copy), playersService (copy), settingsHubService (ref), peopleAnalyticsManager (ref), var24 (ref), allPlayersMuted (ref), var21 (ref), var22 (ref), peopleVoiceChatStore (ref), fFlagShowSwitchServerButton (copy), var16 (ref), STANDARD_SERVER (copy), p1 (ref), fFlagEnablePeoplePageButtonOnMount (copy), var14 (copy), switchServerTelemetryModule (copy), var25 (ref), localMuted (ref), p0 (ref), var23 (ref)
		local t = {}
		
		if not fFlagHidePeoplePageInviteFriends or not fFlagAddInviteFriendsIntegration or not fFlagEnableSideSheet then
			table.insert(t, {
				id = "inviteFriends",
				layoutOrder = 1,
				text = var17.inviteFriends,
				onIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_LEGACY,
				isNewIcon = getFFlagNewPeoplePageIcons(),
				shouldShow = function() --[[ line: 139 ]]
					-- upvalues: fFlagDebugEnablePioneerUX (copy), runService (copy), playersService (copy)
					return not fFlagDebugEnablePioneerUX and (not runService:IsStudio() and (playersService.LocalPlayer ~= nil and playersService.LocalPlayer.UserId > 0))
				end,
				onActivated = function() --[[ line: 145 ]]
					-- upvalues: settingsHubService (copy), peopleAnalyticsManager (copy)
					local var30 = settingsHubService.hubRef()
					
					if var30 then
						peopleAnalyticsManager:trackGameInviteEntryPoint()
						var30:InviteToGame()
					end
				end
			})
		end
		table.insert(t, {
			id = "muteAll",
			layoutOrder = 2,
			text = var24,
			onIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_LEGACY,
			offIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_LEGACY,
			buttonState = allPlayersMuted,
			isNewIcon = getFFlagNewPeoplePageIcons(),
			shouldShow = function() --[[ line: 170 ]]
				-- upvalues: var21 (copy)
				return var21
			end,
			onActivated = function() --[[ line: 173 ]]
				-- upvalues: var22 (copy), peopleAnalyticsManager (copy), peopleVoiceChatStore (copy)
				peopleAnalyticsManager:trackToggleMuteAll(var22:getValue())
				peopleVoiceChatStore.toggleMuteAll()
			end
		})
		
		if fFlagShowSwitchServerButton then
			table.insert(t, {
				id = "switchServer",
				isNewIcon = true,
				layoutOrder = 3,
				text = var17.switchServer,
				onIcon = constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.SWITCH_SERVER,
				shouldShow = function() --[[ line: 190 ]]
					-- upvalues: fFlagDebugEnablePioneerUX (copy), var16 (copy), STANDARD_SERVER (copy), playersService (copy)
					return not fFlagDebugEnablePioneerUX and (game:GetEngineFeature("GameIdToExcludeAvailable") and (var16 == STANDARD_SERVER and playersService.MaxPlayers > 1))
				end,
				onActivated = p1[constantsModule.PEOPLEPAGE.BUTTON_ACTIVATED_TABLE_KEYS.SWITCH_SERVER],
				onMount = if fFlagEnablePeoplePageButtonOnMount then function() --[[ line: 199 ]]
					-- upvalues: var14 (copy), switchServerTelemetryModule (copy)
					if not var14 then
						var14 = true
						switchServerTelemetryModule.sendSwitchServerButtonActions({ event_type = "impression" })
					end
				end else nil
			})
		end
		table.insert(t, {
			id = "muteSelf",
			isNewIcon = false,
			text = var25,
			onIcon = constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE,
			offIcon = constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE_MUTED,
			animatedIcon = peopleVoiceChatStore.getMuteSelfIcon(),
			buttonState = localMuted,
			shouldShow = function() --[[ line: 215 ]]
				-- upvalues: var21 (copy), p0 (copy)
				return var21 and not p0
			end,
			onActivated = function() --[[ line: 218 ]]
				-- upvalues: var23 (copy), peopleAnalyticsManager (copy), peopleVoiceChatStore (copy)
				peopleAnalyticsManager:trackToggleMuteSelf(var23:getValue() or false)
				peopleVoiceChatStore.toggleMuteSelf()
			end,
			layoutOrder = if fFlagShowSwitchServerButton then 4 else 3
		})
		
		return t
	end, { var21, voiceChatServiceConnected, var15 })
end