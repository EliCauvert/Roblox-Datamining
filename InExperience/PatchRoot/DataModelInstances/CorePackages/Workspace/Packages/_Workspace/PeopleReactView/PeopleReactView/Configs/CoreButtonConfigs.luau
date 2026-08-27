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
local var1 = fFlagEnableSideSheet and require(parent.PioneerUtils).isPioneerLaunch()
local constantsModule = require(peopleReactView.Constants)
local STANDARD_SERVER = coreScriptsCommonModule.Constants.STANDARD_SERVER
local constants = require(parent.SwitchServer).Constants
local useSignalBinding = signalsReactModule.useSignalBinding
local useSignalState = signalsReactModule.useSignalState
local switchServerTelemetry = require(parent.SwitchServer).SwitchServerTelemetry
local var2 = false

local function _()
	-- upvalues: var2 (write), switchServerTelemetry (ref)
	if not var2 then
		var2 = true
		switchServerTelemetry.sendSwitchServerButtonActions({ event_type = "impression" })
	end
end

return function(p1, p2)
	-- upvalues: fFlagShowSwitchServerButton (ref), reactModule (ref), signalsModule (ref), runService (ref), robloxReplicatedStorageService (ref), useSignalState (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), constants (ref), peopleServiceModule (ref), useSignalBinding (ref), fFlagHidePeoplePageInviteFriends (ref), fFlagAddInviteFriendsIntegration (ref), fFlagEnableSideSheet (ref), getFFlagNewPeoplePageIcons (ref), var1 (ref), playersService (ref), STANDARD_SERVER (ref), fFlagEnablePeoplePageButtonOnMount (ref), var2 (write), switchServerTelemetry (ref)
	local var3 = if fFlagShowSwitchServerButton then reactModule.useMemo(function()
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
	local var4 = if fFlagShowSwitchServerButton then useSignalState(var3) else nil
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
		-- upvalues: fFlagHidePeoplePageInviteFriends (copy), fFlagAddInviteFriendsIntegration (copy), fFlagEnableSideSheet (copy), var5 (ref), getFFlagNewPeoplePageIcons (copy), constantsModule (copy), var1 (copy), runService (copy), playersService (copy), settingsHubService (ref), peopleAnalyticsManager (ref), var9 (ref), allPlayersMuted (ref), var6 (ref), var7 (ref), peopleVoiceChatStore (ref), fFlagShowSwitchServerButton (copy), constants (copy), var4 (ref), STANDARD_SERVER (copy), p2 (ref), fFlagEnablePeoplePageButtonOnMount (copy), var2 (copy), switchServerTelemetry (copy), var10 (ref), localMuted (ref), p1 (ref), var8 (ref)
		local t = {}
		
		if not fFlagHidePeoplePageInviteFriends or not fFlagAddInviteFriendsIntegration or not fFlagEnableSideSheet then
			table.insert(t, {
				id = "inviteFriends",
				layoutOrder = 1,
				text = var5.inviteFriends,
				onIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_NEW else constantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_LEGACY,
				isNewIcon = getFFlagNewPeoplePageIcons(),
				shouldShow = function()
					-- upvalues: var1 (copy), runService (copy), playersService (copy)
					return not var1 and (not runService:IsStudio() and (playersService.LocalPlayer ~= nil and playersService.LocalPlayer.UserId > 0))
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
		
		if fFlagShowSwitchServerButton then
			table.insert(t, {
				id = "switchServer",
				isNewIcon = true,
				layoutOrder = 3,
				text = var5.switchServer,
				onIcon = constants.BUTTON.ICON,
				shouldShow = function()
					-- upvalues: var1 (copy), var4 (copy), STANDARD_SERVER (copy), playersService (copy)
					return not var1 and (game:GetEngineFeature("GameIdToExcludeAvailable") and (var4 == STANDARD_SERVER and playersService.MaxPlayers > 1))
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
	end, { var6, voiceChatServiceConnected, var3 })
end