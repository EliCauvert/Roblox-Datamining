local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local PeopleServiceModule = require(Parent.PeopleService)
local SignalsReactModule = require(Parent.SignalsReact)
local SignalsModule = require(Parent.Signals)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SharedFlagsModule = require(Parent.SharedFlags)
local SwitchServerModule = require(Parent.SwitchServer)
local FlagsService = PeopleServiceModule.getService("Flags")
local GetFFlagNewPeoplePageIconsFunction = FlagsService.GetFFlagNewPeoplePageIcons
local FFlagEnablePeoplePageButtonOnMount = FlagsService.FFlagEnablePeoplePageButtonOnMount
local FFlagShowSwitchServerButton = SharedFlagsModule.FFlagShowSwitchServerButton
local FFlagHidePeoplePageInviteFriends = SharedFlagsModule.FFlagHidePeoplePageInviteFriends
local FFlagAddInviteFriendsIntegration = SharedFlagsModule.FFlagAddInviteFriendsIntegration
local FFlagPeopleTabUseSwitchServerModule = require(PeopleReactView.Flags.FFlagPeopleTabUseSwitchServerModule)
local IsSideSheetEnabledModule = require(Parent.InExperienceSideSheetUtils.isSideSheetEnabled)
local ConstantsModule = require(PeopleReactView.Constants)
local STANDARDSERVER = require(Parent.CoreScriptsCommon).Constants.STANDARD_SERVER
local Constants = SwitchServerModule.Constants
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local UseSignalStateFunction = SignalsReactModule.useSignalState
local GetSwitchServerStoreFunction = SwitchServerModule.GetSwitchServerStore
local SwitchServerTelemetry = SwitchServerModule.SwitchServerTelemetry
local Flag = false

local function _()
	-- upvalues: Flag (ref), SwitchServerTelemetry (copy)
	if not Flag then
		Flag = true
		SwitchServerTelemetry.sendSwitchServerButtonActions({ event_type = "impression" })
	end
end

return function(p1, p2)
	-- upvalues: FFlagShowSwitchServerButton (copy), FFlagPeopleTabUseSwitchServerModule (copy), ReactModule (copy), SignalsModule (copy), RunService (copy), RobloxReplicatedStorage (copy), UseSignalStateFunction (copy), GetSwitchServerStoreFunction (copy), UseLocalizationFunction (copy), ConstantsModule (copy), Constants (copy), PeopleServiceModule (copy), UseSignalBindingFunction (copy), FFlagHidePeoplePageInviteFriends (copy), FFlagAddInviteFriendsIntegration (copy), IsSideSheetEnabledModule (copy), GetFFlagNewPeoplePageIconsFunction (copy), Players (copy), STANDARDSERVER (copy), FFlagEnablePeoplePageButtonOnMount (copy), Flag (ref), SwitchServerTelemetry (copy)
	local UseMemoResult = if FFlagShowSwitchServerButton and not FFlagPeopleTabUseSwitchServerModule then ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), RunService (upval), RobloxReplicatedStorage (upval)
		local Signal, Signal2 = SignalsModule.createSignal(nil)
		
		if not RunService:IsStudio() then
			local GetServerType = RobloxReplicatedStorage:WaitForChild("GetServerType", 2)
			
			if GetServerType then
				local Success, Result = pcall(function()
					-- upvalues: GetServerType (copy)
					return GetServerType:InvokeServer()
				end)
				
				if Success then
					Signal2(Result)
				end
			end
		end
		return Signal
	end, {}) else nil
	local UseSignalStateResult = if FFlagShowSwitchServerButton and not FFlagPeopleTabUseSwitchServerModule then UseSignalStateFunction(UseMemoResult) else nil
	local UseSignalStateResult1 = if FFlagShowSwitchServerButton and FFlagPeopleTabUseSwitchServerModule then UseSignalStateFunction(GetSwitchServerStoreFunction(false).shouldEnableSwitchServer) else false
	local UseLocalizationResult = UseLocalizationFunction({
		inviteFriends = ConstantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.INVITE_FRIENDS,
		muteAll = ConstantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.MUTE_ALL,
		unmuteAll = ConstantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.UNMUTE_ALL,
		switchServer = Constants.BUTTON.LABEL,
		muteSelf = ConstantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.MUTE_SELF,
		unmuteSelf = ConstantsModule.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.UNMUTE_SELF
	})
	local PeopleVoiceChatStoreService = PeopleServiceModule.getService("PeopleVoiceChatStore")
	local PeopleAnalyticsManagerService = PeopleServiceModule.getService("PeopleAnalyticsManager")
	local SettingsHubService = PeopleServiceModule.getService("SettingsHubService")
	local VoiceChatServiceConnected = PeopleVoiceChatStoreService.voiceChatServiceConnected
	local UseSignalStateResult2 = UseSignalStateFunction(PeopleVoiceChatStoreService.voiceUIVisible)
	local AllPlayersMuted = PeopleVoiceChatStoreService.allPlayersMuted
	local UseSignalBindingResult = UseSignalBindingFunction(AllPlayersMuted)
	local LocalMuted = PeopleVoiceChatStoreService.localMuted
	local UseSignalBindingResult1 = UseSignalBindingFunction(LocalMuted)
	local MapResult = UseSignalBindingResult:map(function(p3)
		-- upvalues: UseLocalizationResult (copy)
		return p3 and UseLocalizationResult.unmuteAll or UseLocalizationResult.muteAll
	end)
	local MapResult1 = UseSignalBindingResult1:map(function(p3)
		-- upvalues: UseLocalizationResult (copy)
		local MuteSelf = nil
		repeat
			if p3 ~= nil then
				if p3 then
					MuteSelf = UseLocalizationResult.unmuteSelf
					
					if MuteSelf then break end
				end
				return UseLocalizationResult.muteSelf
			end
			MuteSelf = UseLocalizationResult.muteSelf
		until true
		return MuteSelf
	end)
	
	return (ReactModule.useMemo(function()
		-- upvalues: FFlagHidePeoplePageInviteFriends (upval), FFlagAddInviteFriendsIntegration (upval), IsSideSheetEnabledModule (upval), UseLocalizationResult (copy), GetFFlagNewPeoplePageIconsFunction (upval), ConstantsModule (upval), RunService (upval), Players (upval), SettingsHubService (copy), PeopleAnalyticsManagerService (copy), MapResult (copy), AllPlayersMuted (copy), UseSignalStateResult2 (copy), UseSignalBindingResult (copy), PeopleVoiceChatStoreService (copy), FFlagShowSwitchServerButton (upval), Constants (upval), FFlagPeopleTabUseSwitchServerModule (upval), UseSignalStateResult1 (copy), UseSignalStateResult (copy), STANDARDSERVER (upval), p2 (copy), FFlagEnablePeoplePageButtonOnMount (upval), Flag (upval), SwitchServerTelemetry (upval), MapResult1 (copy), LocalMuted (copy), p1 (copy), UseSignalBindingResult1 (copy)
		local List = {}
		
		if not FFlagHidePeoplePageInviteFriends or not FFlagAddInviteFriendsIntegration or not IsSideSheetEnabledModule then
			table.insert(List, {
				id = "inviteFriends",
				layoutOrder = 1,
				text = UseLocalizationResult.inviteFriends,
				onIcon = if GetFFlagNewPeoplePageIconsFunction() then ConstantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_NEW else ConstantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_LEGACY,
				isNewIcon = GetFFlagNewPeoplePageIconsFunction(),
				shouldShow = function(): boolean
					-- upvalues: RunService (upval), Players (upval)
					return not RunService:IsStudio() and (Players.LocalPlayer ~= nil and Players.LocalPlayer.UserId > 0)
				end,
				onActivated = function()
					-- upvalues: SettingsHubService (upval), PeopleAnalyticsManagerService (upval)
					local HubRefResult = SettingsHubService.hubRef()
					
					if HubRefResult then
						PeopleAnalyticsManagerService:trackGameInviteEntryPoint()
						HubRefResult:InviteToGame()
					end
				end
			})
		end
		table.insert(List, {
			id = "muteAll",
			layoutOrder = 2,
			text = MapResult,
			onIcon = if GetFFlagNewPeoplePageIconsFunction() then ConstantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_NEW else ConstantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_LEGACY,
			offIcon = if GetFFlagNewPeoplePageIconsFunction() then ConstantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_NEW else ConstantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_LEGACY,
			buttonState = AllPlayersMuted,
			isNewIcon = GetFFlagNewPeoplePageIconsFunction(),
			shouldShow = function()
				-- upvalues: UseSignalStateResult2 (upval)
				return UseSignalStateResult2
			end,
			onActivated = function()
				-- upvalues: UseSignalBindingResult (upval), PeopleAnalyticsManagerService (upval), PeopleVoiceChatStoreService (upval)
				PeopleAnalyticsManagerService:trackToggleMuteAll((UseSignalBindingResult:getValue()))
				PeopleVoiceChatStoreService.toggleMuteAll()
			end
		})
		
		if FFlagShowSwitchServerButton and not IsSideSheetEnabledModule then
			table.insert(List, {
				id = "switchServer",
				isNewIcon = true,
				layoutOrder = 3,
				text = UseLocalizationResult.switchServer,
				onIcon = Constants.BUTTON.ICON,
				shouldShow = function()
					-- upvalues: FFlagPeopleTabUseSwitchServerModule (upval), UseSignalStateResult1 (upval), UseSignalStateResult (upval), STANDARDSERVER (upval), Players (upval)
					return if FFlagPeopleTabUseSwitchServerModule then UseSignalStateResult1 else game:GetEngineFeature("GameIdToExcludeAvailable") and (UseSignalStateResult == STANDARDSERVER and Players.MaxPlayers > 1)
				end,
				onActivated = p2[ConstantsModule.PEOPLEPAGE.BUTTON_ACTIVATED_TABLE_KEYS.SWITCH_SERVER],
				onMount = if FFlagEnablePeoplePageButtonOnMount then function()
					-- upvalues: Flag (upval), SwitchServerTelemetry (upval)
					if not Flag then
						Flag = true
						SwitchServerTelemetry.sendSwitchServerButtonActions({ event_type = "impression" })
					end
				end else nil
			})
		end
		table.insert(List, {
			id = "muteSelf",
			isNewIcon = false,
			text = MapResult1,
			onIcon = ConstantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE,
			offIcon = ConstantsModule.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE_MUTED,
			animatedIcon = PeopleVoiceChatStoreService.getMuteSelfIcon(),
			buttonState = LocalMuted,
			shouldShow = function(): boolean
				-- upvalues: UseSignalStateResult2 (upval), p1 (upval)
				return UseSignalStateResult2 and not p1
			end,
			onActivated = function()
				-- upvalues: UseSignalBindingResult1 (upval), PeopleAnalyticsManagerService (upval), PeopleVoiceChatStoreService (upval)
				PeopleAnalyticsManagerService:trackToggleMuteSelf(UseSignalBindingResult1:getValue() or false)
				PeopleVoiceChatStoreService.toggleMuteSelf()
			end,
			layoutOrder = if FFlagShowSwitchServerButton then 4 else 3
		})
		
		return List
	end, {
		UseSignalStateResult2,
		VoiceChatServiceConnected,
		UseMemoResult
	}))
end