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
local constants = require(parent.SwitchServer).Constants
local useSignalBinding = signalsReactModule.useSignalBinding
local useSignalState = signalsReactModule.useSignalState
local switchServerTelemetry = require(parent.SwitchServer).SwitchServerTelemetry
local var13 = false

local function _() --[[ line: 58 | named "sendSwitchServerButtonImpressionOnce" ]]
	-- upvalues: var13 (write), switchServerTelemetry (ref)
	if not var13 then
		var13 = true
		switchServerTelemetry.sendSwitchServerButtonActions({ event_type = "impression" })
	end
end

return function(p0, p1) --[[ line: 67 | named "useCoreButtonConfigs" ]]
	-- upvalues: fFlagShowSwitchServerButton (ref), reactModule (ref), signalsModule (ref), runService (ref), robloxReplicatedStorageService (ref), useSignalState (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), constants (ref), peopleServiceModule (ref), useSignalBinding (ref), fFlagHidePeoplePageInviteFriends (ref), fFlagAddInviteFriendsIntegration (ref), fFlagEnableSideSheet (ref), getFFlagNewPeoplePageIcons (ref), fFlagDebugEnablePioneerUX (ref), playersService (ref), STANDARD_SERVER (ref), fFlagEnablePeoplePageButtonOnMount (ref), var13 (write), switchServerTelemetry (ref)
	local var14 = if fFlagShowSwitchServerButton then reactModule.useMemo(function() --[[ line: 74 ]]
		-- upvalues: signalsModule (copy), runService (copy), robloxReplicatedStorageService (copy)
		local var25, var26 = signalsModule.createSignal(nil)
		
		if not runService:IsStudio() then
			local getServerType = robloxReplicatedStorageService:WaitForChild("GetServerType", 2)
			
			if getServerType then
				local ok, status = pcall(function() --[[ line: 80 ]]
					-- upvalues: getServerType (ref)
					return getServerType:InvokeServer()
				end)
				
				if ok then
					var26(status)
				end
			end
		end
		return var25
	end, {}) else nil
	local var15 = if fFlagShowSwitchServerButton then useSignalState(var14) else nil
	local var16 = useLocalization({
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
	local var20 = useSignalState(peopleVoiceChatStore.voiceUIVisible)
	local allPlayersMuted = peopleVoiceChatStore.allPlayersMuted
	local var21 = useSignalBinding(allPlayersMuted)
	local localMuted = peopleVoiceChatStore.localMuted
	local var22 = useSignalBinding(localMuted)
	local var23 = var21:map(function(p2) --[[ line: 118 ]]
		-- upvalues: var16 (ref)
		return if p2 then var16.unmuteAll else var16.muteAll
	end)
	local var24 = var22:map(function(p3) --[[ line: 122 ]]
		-- upvalues: var16 (ref)
		local unmuteSelf
		if p3 == nil then
			unmuteSelf = var16.muteSelf
		elseif p3 then
			unmuteSelf = var16.unmuteSelf
			
			return unmuteSelf or var16.muteSelf
		end
	end)
	
	return reactModule.useMemo(function() --[[ line: 129 ]]
		-- upvalues: fFlagHidePeoplePageInviteFriends (copy), fFlagAddInviteFriendsIntegration (copy), fFlagEnableSideSheet (copy), var16 (ref), getFFlagNewPeoplePageIcons (copy), constantsModule (copy), fFlagDebugEnablePioneerUX (copy), runService (copy), playersService (copy), settingsHubService (ref), peopleAnalyticsManager (ref), var23 (ref), allPlayersMuted (ref), var20 (ref), var21 (ref), peopleVoiceChatStore (ref), fFlagShowSwitchServerButton (copy), constants (copy), var15 (ref), STANDARD_SERVER (copy), p1 (ref), fFlagEnablePeoplePageButtonOnMount (copy), var13 (copy), switchServerTelemetry (copy), var24 (ref), localMuted (ref), p0 (ref), var22 (ref)
		local t = {}
		
		if not fFlagHidePeoplePageInviteFriends or not fFlagAddInviteFriendsIntegration or not fFlagEnableSideSheet then
			table.insert(t, {
				id = "inviteFriends",
				layoutOrder = 1,
				text = var16.inviteFriends,
				onIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_LEGACY,
				isNewIcon = getFFlagNewPeoplePageIcons(),
				shouldShow = function() --[[ line: 141 ]]
					-- upvalues: fFlagDebugEnablePioneerUX (copy), runService (copy), playersService (copy)
					return not fFlagDebugEnablePioneerUX and (not runService:IsStudio() and (playersService.LocalPlayer ~= nil and playersService.LocalPlayer.UserId > 0))
				end,
				onActivated = function() --[[ line: 147 ]]
					-- upvalues: settingsHubService (copy), peopleAnalyticsManager (copy)
					local var29 = settingsHubService.hubRef()
					
					if var29 then
						peopleAnalyticsManager:trackGameInviteEntryPoint()
						var29:InviteToGame()
					end
				end
			})
		end
		table.insert(t, {
			id = "muteAll",
			layoutOrder = 2,
			text = var23,
			onIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_LEGACY,
			offIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_LEGACY,
			buttonState = allPlayersMuted,
			isNewIcon = getFFlagNewPeoplePageIcons(),
			shouldShow = function() --[[ line: 172 ]]
				-- upvalues: var20 (copy)
				return var20
			end,
			onActivated = function() --[[ line: 175 ]]
				-- upvalues: var21 (copy), peopleAnalyticsManager (copy), peopleVoiceChatStore (copy)
				peopleAnalyticsManager:trackToggleMuteAll(var21:getValue())
				peopleVoiceChatStore.toggleMuteAll()
			end
		})
		
		if fFlagShowSwitchServerButton then
			table.insert(t, {
				id = "switchServer",
				isNewIcon = true,
				layoutOrder = 3,
				text = var16.switchServer,
				onIcon = constants.BUTTON.ICON,
				shouldShow = function() --[[ line: 192 ]]
					-- upvalues: fFlagDebugEnablePioneerUX (copy), var15 (copy), STANDARD_SERVER (copy), playersService (copy)
					return not fFlagDebugEnablePioneerUX and (game:GetEngineFeature("GameIdToExcludeAvailable") and (var15 == STANDARD_SERVER and playersService.MaxPlayers > 1))
				end,
				onActivated = p1[constantsModule.PEOPLEPAGE.BUTTON_ACTIVATED_TABLE_KEYS.SWITCH_SERVER],
				onMount = if fFlagEnablePeoplePageButtonOnMount then function() --[[ line: 201 ]]
					-- upvalues: var13 (copy), switchServerTelemetry (copy)
					if not var13 then
						var13 = true
						switchServerTelemetry.sendSwitchServerButtonActions({ event_type = "impression" })
					end
				end else nil
			})
		end
		table.insert(t, {
			id = "muteSelf",
			isNewIcon = false,
			text = var24,
			onIcon = constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE,
			offIcon = constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE_MUTED,
			animatedIcon = peopleVoiceChatStore.getMuteSelfIcon(),
			buttonState = localMuted,
			shouldShow = function() --[[ line: 217 ]]
				-- upvalues: var20 (copy), p0 (copy)
				return var20 and not p0
			end,
			onActivated = function() --[[ line: 220 ]]
				-- upvalues: var22 (copy), peopleAnalyticsManager (copy), peopleVoiceChatStore (copy)
				peopleAnalyticsManager:trackToggleMuteSelf(var22:getValue() or false)
				peopleVoiceChatStore.toggleMuteSelf()
			end,
			layoutOrder = if fFlagShowSwitchServerButton then 4 else 3
		})
		
		return t
	end, { var20, voiceChatServiceConnected, var14 })
end