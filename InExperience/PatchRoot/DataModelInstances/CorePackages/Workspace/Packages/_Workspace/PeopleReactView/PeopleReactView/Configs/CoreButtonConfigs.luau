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
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagHidePeoplePageInviteFriends = sharedFlagsModule.FFlagHidePeoplePageInviteFriends
local fFlagAddInviteFriendsIntegration = sharedFlagsModule.FFlagAddInviteFriendsIntegration
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local constantsModule = require(peopleReactView.Constants)
local STANDARD_SERVER = coreScriptsCommonModule.Constants.STANDARD_SERVER
local useSignalBinding = signalsReactModule.useSignalBinding
local useSignalState = signalsReactModule.useSignalState

return function(p0, p1) --[[ line: 49 | named "useCoreButtonConfigs" ]]
	-- upvalues: fFlagShowSwitchServerButton (ref), reactModule (ref), signalsModule (ref), runService (ref), robloxReplicatedStorageService (ref), useSignalState (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), peopleServiceModule (ref), useSignalBinding (ref), fFlagHidePeoplePageInviteFriends (ref), fFlagAddInviteFriendsIntegration (ref), fFlagEnableSideSheet (ref), getFFlagNewPeoplePageIcons (ref), playersService (ref), STANDARD_SERVER (ref)
	local var12 = if fFlagShowSwitchServerButton then reactModule.useMemo(function() --[[ line: 55 ]]
		-- upvalues: signalsModule (copy), runService (copy), robloxReplicatedStorageService (copy)
		local var23, var24 = signalsModule.createSignal(nil)
		
		if not runService:IsStudio() then
			local getServerType = robloxReplicatedStorageService:WaitForChild("GetServerType", 2)
			
			if getServerType then
				local ok, status = pcall(function() --[[ line: 61 ]]
					-- upvalues: getServerType (ref)
					return getServerType:InvokeServer()
				end)
				
				if ok then
					var24(status)
				end
			end
		end
		return var23
	end, {}) else nil
	local var13 = if fFlagShowSwitchServerButton then useSignalState(var12) else nil
	local var14 = useLocalization({
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
	local var18 = useSignalState(peopleVoiceChatStore.voiceUIVisible)
	local allPlayersMuted = peopleVoiceChatStore.allPlayersMuted
	local var19 = useSignalBinding(allPlayersMuted)
	local localMuted = peopleVoiceChatStore.localMuted
	local var20 = useSignalBinding(localMuted)
	local var21 = var19:map(function(p2) --[[ line: 99 ]]
		-- upvalues: var14 (ref)
		return if p2 then var14.unmuteAll else var14.muteAll
	end)
	local var22 = var20:map(function(p3) --[[ line: 103 ]]
		-- upvalues: var14 (ref)
		local unmuteSelf
		if p3 == nil then
			unmuteSelf = var14.muteSelf
		elseif p3 then
			unmuteSelf = var14.unmuteSelf
			
			return unmuteSelf or var14.muteSelf
		end
	end)
	
	return reactModule.useMemo(function() --[[ line: 110 ]]
		-- upvalues: fFlagHidePeoplePageInviteFriends (copy), fFlagAddInviteFriendsIntegration (copy), fFlagEnableSideSheet (copy), var14 (ref), getFFlagNewPeoplePageIcons (copy), constantsModule (copy), runService (copy), playersService (copy), settingsHubService (ref), peopleAnalyticsManager (ref), var21 (ref), allPlayersMuted (ref), var18 (ref), var19 (ref), peopleVoiceChatStore (ref), fFlagShowSwitchServerButton (copy), var13 (ref), STANDARD_SERVER (copy), p1 (ref), var22 (ref), localMuted (ref), p0 (ref), var20 (ref)
		local t = {}
		
		if not fFlagHidePeoplePageInviteFriends or not fFlagAddInviteFriendsIntegration or not fFlagEnableSideSheet then
			table.insert(t, {
				id = "inviteFriends",
				layoutOrder = 1,
				text = var14.inviteFriends,
				onIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_LEGACY,
				isNewIcon = getFFlagNewPeoplePageIcons(),
				shouldShow = function() --[[ line: 122 ]]
					-- upvalues: runService (copy), playersService (copy)
					return not runService:IsStudio() and (playersService.LocalPlayer ~= nil and playersService.LocalPlayer.UserId > 0)
				end,
				onActivated = function() --[[ line: 125 ]]
					-- upvalues: settingsHubService (copy), peopleAnalyticsManager (copy)
					local var27 = settingsHubService.hubRef()
					
					if var27 then
						peopleAnalyticsManager:trackGameInviteEntryPoint()
						var27:InviteToGame()
					end
				end
			})
		end
		table.insert(t, {
			id = "muteAll",
			layoutOrder = 2,
			text = var21,
			onIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_LEGACY,
			offIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_LEGACY,
			buttonState = allPlayersMuted,
			isNewIcon = getFFlagNewPeoplePageIcons(),
			shouldShow = function() --[[ line: 150 ]]
				-- upvalues: var18 (copy)
				return var18
			end,
			onActivated = function() --[[ line: 153 ]]
				-- upvalues: var19 (copy), peopleAnalyticsManager (copy), peopleVoiceChatStore (copy)
				peopleAnalyticsManager:trackToggleMuteAll(var19:getValue())
				peopleVoiceChatStore.toggleMuteAll()
			end
		})
		
		if fFlagShowSwitchServerButton then
			table.insert(t, {
				id = "switchServer",
				isNewIcon = true,
				layoutOrder = 3,
				text = var14.switchServer,
				onIcon = constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.SWITCH_SERVER,
				shouldShow = function() --[[ line: 170 ]]
					-- upvalues: var13 (copy), STANDARD_SERVER (copy), playersService (copy)
					return game:GetEngineFeature("GameIdToExcludeAvailable") and (var13 == STANDARD_SERVER and playersService.MaxPlayers > 1)
				end,
				onActivated = p1[constantsModule.PEOPLEPAGE.BUTTON_ACTIVATED_TABLE_KEYS.SWITCH_SERVER]
			})
		end
		table.insert(t, {
			id = "muteSelf",
			isNewIcon = false,
			text = var22,
			onIcon = constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE,
			offIcon = constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE_MUTED,
			animatedIcon = peopleVoiceChatStore.getMuteSelfIcon(),
			buttonState = localMuted,
			shouldShow = function() --[[ line: 189 ]]
				-- upvalues: var18 (copy), p0 (copy)
				return var18 and not p0
			end,
			onActivated = function() --[[ line: 192 ]]
				-- upvalues: var20 (copy), peopleAnalyticsManager (copy), peopleVoiceChatStore (copy)
				peopleAnalyticsManager:trackToggleMuteSelf(var20:getValue() or false)
				peopleVoiceChatStore.toggleMuteSelf()
			end,
			layoutOrder = if fFlagShowSwitchServerButton then 4 else 3
		})
		
		return t
	end, { var18, voiceChatServiceConnected, var12 })
end