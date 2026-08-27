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
local var1 = false

local function _()
	-- upvalues: var1 (write), switchServerTelemetry (ref)
	if not var1 then
		var1 = true
		switchServerTelemetry.sendSwitchServerButtonActions({ event_type = "impression" })
	end
end

return function(p1, p2)
	-- upvalues: fFlagShowSwitchServerButton (ref), reactModule (ref), signalsModule (ref), runService (ref), robloxReplicatedStorageService (ref), useSignalState (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), constants (ref), peopleServiceModule (ref), useSignalBinding (ref), fFlagHidePeoplePageInviteFriends (ref), fFlagAddInviteFriendsIntegration (ref), fFlagEnableSideSheet (ref), getFFlagNewPeoplePageIcons (ref), fFlagDebugEnablePioneerUX (ref), playersService (ref), STANDARD_SERVER (ref), fFlagEnablePeoplePageButtonOnMount (ref), var1 (write), switchServerTelemetry (ref)
	local var2 = if fFlagShowSwitchServerButton then reactModule.useMemo(function()
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
	local var3 = if fFlagShowSwitchServerButton then useSignalState(var2) else nil
	local var4 = useLocalization({
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
	local var5 = useSignalState(peopleVoiceChatStore.voiceUIVisible)
	local allPlayersMuted = peopleVoiceChatStore.allPlayersMuted
	local var6 = useSignalBinding(allPlayersMuted)
	local localMuted = peopleVoiceChatStore.localMuted
	local var7 = useSignalBinding(localMuted)
	local var8 = var6:map(function(p3)
		-- upvalues: var4 (ref)
		return if p3 then var4.unmuteAll else var4.muteAll
	end)
	local var9 = var7:map(function(p3)
		-- upvalues: var4 (ref)
		local unmuteSelf
		if p3 == nil then
			unmuteSelf = var4.muteSelf
		elseif p3 then
			unmuteSelf = var4.unmuteSelf
			
			return unmuteSelf or var4.muteSelf
		end
	end)
	
	return reactModule.useMemo(function()
		-- upvalues: fFlagHidePeoplePageInviteFriends (copy), fFlagAddInviteFriendsIntegration (copy), fFlagEnableSideSheet (copy), var4 (ref), getFFlagNewPeoplePageIcons (copy), constantsModule (copy), fFlagDebugEnablePioneerUX (copy), runService (copy), playersService (copy), settingsHubService (ref), peopleAnalyticsManager (ref), var8 (ref), allPlayersMuted (ref), var5 (ref), var6 (ref), peopleVoiceChatStore (ref), fFlagShowSwitchServerButton (copy), constants (copy), var3 (ref), STANDARD_SERVER (copy), p2 (ref), fFlagEnablePeoplePageButtonOnMount (copy), var1 (copy), switchServerTelemetry (copy), var9 (ref), localMuted (ref), p1 (ref), var7 (ref)
		local t = {}
		
		if not fFlagHidePeoplePageInviteFriends or not fFlagAddInviteFriendsIntegration or not fFlagEnableSideSheet then
			table.insert(t, {
				id = "inviteFriends",
				layoutOrder = 1,
				text = var4.inviteFriends,
				onIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_LEGACY,
				isNewIcon = getFFlagNewPeoplePageIcons(),
				shouldShow = function()
					-- upvalues: fFlagDebugEnablePioneerUX (copy), runService (copy), playersService (copy)
					return not fFlagDebugEnablePioneerUX and (not runService:IsStudio() and (playersService.LocalPlayer ~= nil and playersService.LocalPlayer.UserId > 0))
				end,
				onActivated = function()
					-- upvalues: settingsHubService (copy), peopleAnalyticsManager (copy)
					local var10 = settingsHubService.hubRef()
					
					if var10 then
						peopleAnalyticsManager:trackGameInviteEntryPoint()
						var10:InviteToGame()
					end
				end
			})
		end
		table.insert(t, {
			id = "muteAll",
			layoutOrder = 2,
			text = var8,
			onIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_LEGACY,
			offIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_LEGACY,
			buttonState = allPlayersMuted,
			isNewIcon = getFFlagNewPeoplePageIcons(),
			shouldShow = function()
				-- upvalues: var5 (copy)
				return var5
			end,
			onActivated = function()
				-- upvalues: var6 (copy), peopleAnalyticsManager (copy), peopleVoiceChatStore (copy)
				peopleAnalyticsManager:trackToggleMuteAll(var6:getValue())
				peopleVoiceChatStore.toggleMuteAll()
			end
		})
		
		if fFlagShowSwitchServerButton then
			table.insert(t, {
				id = "switchServer",
				isNewIcon = true,
				layoutOrder = 3,
				text = var4.switchServer,
				onIcon = constants.BUTTON.ICON,
				shouldShow = function()
					-- upvalues: fFlagDebugEnablePioneerUX (copy), var3 (copy), STANDARD_SERVER (copy), playersService (copy)
					return not fFlagDebugEnablePioneerUX and (game:GetEngineFeature("GameIdToExcludeAvailable") and (var3 == STANDARD_SERVER and playersService.MaxPlayers > 1))
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
			text = var9,
			onIcon = constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE,
			offIcon = constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE_MUTED,
			animatedIcon = peopleVoiceChatStore.getMuteSelfIcon(),
			buttonState = localMuted,
			shouldShow = function()
				-- upvalues: var5 (copy), p1 (copy)
				return var5 and not p1
			end,
			onActivated = function()
				-- upvalues: var7 (copy), peopleAnalyticsManager (copy), peopleVoiceChatStore (copy)
				peopleAnalyticsManager:trackToggleMuteSelf(var7:getValue() or false)
				peopleVoiceChatStore.toggleMuteSelf()
			end,
			layoutOrder = if fFlagShowSwitchServerButton then 4 else 3
		})
		
		return t
	end, { var5, voiceChatServiceConnected, var2 })
end