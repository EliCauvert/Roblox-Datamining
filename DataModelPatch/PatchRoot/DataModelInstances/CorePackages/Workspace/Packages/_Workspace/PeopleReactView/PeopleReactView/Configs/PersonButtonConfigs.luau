local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local PeopleServiceModule = require(Parent.PeopleService)
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseDeviceOrientationFunction = require(Parent.RobloxAppHooks).useDeviceOrientation
local ConstantsModule = require(PeopleReactView.Constants)
local ConstantsService = PeopleServiceModule.getService("Constants")
local FlagsService = PeopleServiceModule.getService("Flags")
local GetFFlagNewPeopleButtonOrderFunction = FlagsService.GetFFlagNewPeopleButtonOrder
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local GetFFlagNewPeoplePageIconsFunction = FlagsService.GetFFlagNewPeoplePageIcons
local GetFFlagAddPeoplePageCardLayoutFunction = FlagsService.GetFFlagAddPeoplePageCardLayout
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local FFlagStandardizeSafetyIcon = require(Parent.SharedFlags).FFlagStandardizeSafetyIcon

local function getPlaySessionId()
	-- upvalues: RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy)
	return if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else ""
end

return function(UserId)
	-- upvalues: PeopleServiceModule (copy), UseDeviceOrientationFunction (copy), RobloxAppEnumsModule (copy), UseLocalizationFunction (copy), ConstantsModule (copy), FFlagConnectionsToFriendsRename (copy), ReactModule (copy), Players (copy), getPlaySessionId (copy), UseSignalStateFunction (copy), GetFFlagAddPeoplePageCardLayoutFunction (copy), ConstantsService (copy), GetFFlagNewPeopleButtonOrderFunction (copy), GetFFlagNewPeoplePageIconsFunction (copy), ButtonVariant (copy), FFlagStandardizeSafetyIcon (copy), GuiService (copy)
	local PeopleVoiceChatStoreService = PeopleServiceModule.getService("PeopleVoiceChatStore")
	local PeopleReportAbuseMenuService = PeopleServiceModule.getService("PeopleReportAbuseMenu")
	local PeopleAnalyticsManagerService = PeopleServiceModule.getService("PeopleAnalyticsManager")
	local SettingsHubService = PeopleServiceModule.getService("SettingsHubService")
	local FriendStatusStoreService = PeopleServiceModule.getService("FriendStatusStore")
	local PeopleBlockStatusStoreService = PeopleServiceModule.getService("PeopleBlockStatusStore")
	local PeopleUtilityService = PeopleServiceModule.getService("PeopleUtility")
	local IsUseDeviceOrientationResultMatch = UseDeviceOrientationFunction() == RobloxAppEnumsModule.DeviceOrientationMode.Portrait
	local UseLocalizationResult = UseLocalizationFunction({
		requestSent = ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.REQUEST_SENT,
		friend = if FFlagConnectionsToFriendsRename then ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.FRIEND else nil,
		addFriend = if FFlagConnectionsToFriendsRename then ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.ADD_FRIEND else nil,
		connection = if FFlagConnectionsToFriendsRename then nil else ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.CONNECTION,
		addConnection = if FFlagConnectionsToFriendsRename then nil else ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.ADD_CONNECTION,
		unblock = ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNBLOCK
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagConnectionsToFriendsRename (upval), UseLocalizationResult (copy)
		return {
			isFriend = if FFlagConnectionsToFriendsRename then UseLocalizationResult.friend else UseLocalizationResult.connection,
			addPerson = if FFlagConnectionsToFriendsRename then UseLocalizationResult.addFriend else UseLocalizationResult.addConnection,
			requestSent = UseLocalizationResult.requestSent
		}
	end, { UseLocalizationResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UserId (copy), Players (upval)
		return if UserId then Players:GetPlayerByUserId(UserId) else nil
	end, { UserId })
	local UseMemoResult2 = ReactModule.useMemo(getPlaySessionId, {})
	local PlayerMuteState = PeopleVoiceChatStoreService.getPlayerMuteState(UserId)
	local PlayerAnimatedIcon = PeopleVoiceChatStoreService.getPlayerAnimatedIcon(UserId)
	local PlayerIsLocalMuted = PeopleVoiceChatStoreService.getPlayerIsLocalMuted(UserId)
	local UseSignalStateResult = UseSignalStateFunction(PeopleVoiceChatStoreService.getPlayerShouldShowMuteButton(UserId))
	local UseSignalStateResult1 = UseSignalStateFunction(FriendStatusStoreService.getShouldShowFriendButton(UserId, UseMemoResult1))
	local UseMemoResult3 = if GetFFlagAddPeoplePageCardLayoutFunction() then ReactModule.useMemo(function()
		-- upvalues: FriendStatusStoreService (copy), UserId (copy)
		return FriendStatusStoreService.getFriendStatus(UserId)
	end, { UserId }) else FriendStatusStoreService.getFriendStatus(UserId)
	local UseMemoResult4 = if GetFFlagAddPeoplePageCardLayoutFunction() then ReactModule.useMemo(function()
		-- upvalues: FriendStatusStoreService (copy), UserId (copy), UseMemoResult (copy)
		return FriendStatusStoreService.getFriendButtonText(UserId, UseMemoResult)
	end, { UserId, UseMemoResult }) else FriendStatusStoreService.getFriendButtonText(UserId, UseMemoResult)
	local UseMemoResult5 = if GetFFlagAddPeoplePageCardLayoutFunction() then ReactModule.useMemo(function()
		-- upvalues: FriendStatusStoreService (copy), UserId (copy)
		return FriendStatusStoreService.getFriendButtonVariant(UserId)
	end, { UserId }) else FriendStatusStoreService.getFriendButtonVariant(UserId)
	local UseSignalStateResult2 = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: UserId (copy), PeopleBlockStatusStoreService (copy)
		return if UserId then PeopleBlockStatusStoreService.getPlayerBlockStatus(UserId) else nil
	end, { UserId })))
	local UseMemoResult6 = ReactModule.useMemo(function()
		-- upvalues: PeopleUtilityService (copy), UseMemoResult1 (copy), UserId (copy)
		return PeopleUtilityService.showPersonButtons(UseMemoResult1, UserId)
	end, { UserId })
	
	return (ReactModule.useMemo(function()
		-- upvalues: ConstantsService (upval), PlayerAnimatedIcon (copy), PlayerMuteState (copy), UseSignalStateResult (copy), PeopleAnalyticsManagerService (copy), UserId (copy), PlayerIsLocalMuted (copy), GetFFlagAddPeoplePageCardLayoutFunction (upval), PeopleVoiceChatStoreService (copy), GetFFlagNewPeopleButtonOrderFunction (upval), UseSignalStateResult2 (copy), UseLocalizationResult (copy), GetFFlagNewPeoplePageIconsFunction (upval), ConstantsModule (upval), UseMemoResult6 (copy), UseMemoResult1 (copy), PeopleBlockStatusStoreService (copy), ButtonVariant (upval), IsUseDeviceOrientationResultMatch (copy), UseMemoResult4 (copy), UseMemoResult3 (copy), UseMemoResult5 (copy), UseSignalStateResult1 (copy), FriendStatusStoreService (copy), FFlagStandardizeSafetyIcon (upval), PeopleReportAbuseMenuService (copy), GuiService (upval), UseMemoResult2 (copy), SettingsHubService (copy)
		local List = {}
		local config = {
			isBuilderIcon = false,
			id = ConstantsService.PERSON_BUTTONS.MUTE_PLAYER,
			animatedIcon = PlayerAnimatedIcon,
			buttonState = PlayerMuteState,
			shouldShow = function()
				-- upvalues: UseSignalStateResult (upval)
				return UseSignalStateResult
			end,
			onActivated = function(p1)
				-- upvalues: PeopleAnalyticsManagerService (upval), UserId (upval), PlayerIsLocalMuted (upval), GetFFlagAddPeoplePageCardLayoutFunction (upval), PeopleVoiceChatStoreService (upval)
				PeopleAnalyticsManagerService:trackToggleMutePlayer(UserId, PlayerIsLocalMuted(false), if GetFFlagAddPeoplePageCardLayoutFunction() then p1 else nil)
				PeopleVoiceChatStoreService.togglePlayerMute(UserId)
			end,
			layoutOrder = if GetFFlagNewPeopleButtonOrderFunction() then 30 else 10,
			isGrayedOut = PlayerIsLocalMuted
		}
		
		if GetFFlagAddPeoplePageCardLayoutFunction() then
			List[ConstantsService.PERSON_BUTTONS.MUTE_PLAYER] = config
		else
			table.insert(List, config)
		end
		local config1 = {
			id = ConstantsService.PERSON_BUTTONS.BLOCK_PLAYER,
			text = if UseSignalStateResult2 then UseLocalizationResult.unblock else nil,
			onIcon = if UseSignalStateResult2 then nil elseif GetFFlagNewPeoplePageIconsFunction() then ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.BLOCK_NEW else ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.BLOCK_LEGACY,
			shouldShow = function()
				-- upvalues: UseMemoResult6 (upval)
				return UseMemoResult6
			end,
			onActivated = function(p1)
				-- upvalues: UseMemoResult1 (upval), UseSignalStateResult2 (upval), PeopleBlockStatusStoreService (upval), GetFFlagAddPeoplePageCardLayoutFunction (upval)
				if UseMemoResult1 then
					if UseSignalStateResult2 then
						PeopleBlockStatusStoreService.unblockPlayer(UseMemoResult1, if GetFFlagAddPeoplePageCardLayoutFunction() then p1 else nil)
						
						return
					end
					PeopleBlockStatusStoreService.blockPlayer(UseMemoResult1, if GetFFlagAddPeoplePageCardLayoutFunction() then p1 else nil)
				end
			end,
			buttonVariant = if UseSignalStateResult2 then ButtonVariant.Subtle else nil,
			layoutOrder = if GetFFlagNewPeopleButtonOrderFunction() then 10 else 40,
			isBuilderIcon = GetFFlagNewPeoplePageIconsFunction()
		}
		
		if GetFFlagAddPeoplePageCardLayoutFunction() then
			List[ConstantsService.PERSON_BUTTONS.BLOCK_PLAYER] = config1
		else
			table.insert(List, config1)
		end
		local config2 = {
			layoutOrder = 60,
			id = ConstantsService.PERSON_BUTTONS.ADD_FRIEND,
			text = if IsUseDeviceOrientationResultMatch then nil else UseMemoResult4,
			onIcon = if IsUseDeviceOrientationResultMatch then if GetFFlagNewPeoplePageIconsFunction() then ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.ADD_FRIEND_NEW else ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.ADD_FRIEND_LEGACY else nil,
			offIcon = if IsUseDeviceOrientationResultMatch then if GetFFlagNewPeoplePageIconsFunction() then ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.FRIEND_NEW else ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.FRIEND_LEGACY else nil,
			buttonState = UseMemoResult3,
			buttonVariant = if IsUseDeviceOrientationResultMatch then nil else UseMemoResult5,
			shouldShow = function()
				-- upvalues: UseSignalStateResult1 (upval)
				return UseSignalStateResult1
			end,
			onActivated = function(p1)
				-- upvalues: PeopleAnalyticsManagerService (upval), GetFFlagAddPeoplePageCardLayoutFunction (upval), FriendStatusStoreService (upval), UseMemoResult1 (upval)
				PeopleAnalyticsManagerService:trackRequestFriendship(if GetFFlagAddPeoplePageCardLayoutFunction() then p1 else nil)
				FriendStatusStoreService.sendFriendRequest(UseMemoResult1)
			end,
			isDisabled = FriendStatusStoreService.getIsFriendButtonDisabled(UserId),
			isGrayedOut = FriendStatusStoreService.getIsFriendButtonGrayedOut(UserId),
			isBuilderIcon = GetFFlagNewPeoplePageIconsFunction()
		}
		
		if GetFFlagAddPeoplePageCardLayoutFunction() then
			List[ConstantsService.PERSON_BUTTONS.ADD_FRIEND] = config2
		else
			table.insert(List, config2)
		end
		local config21 = {
			id = ConstantsService.PERSON_BUTTONS.REPORT_PLAYER,
			onIcon = if FFlagStandardizeSafetyIcon then ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.REPORT_PLAYER_FLAG elseif GetFFlagNewPeoplePageIconsFunction() then ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.REPORT_PLAYER_NEW else ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.REPORT_PLAYER_LEGACY,
			shouldShow = function()
				-- upvalues: UseMemoResult6 (upval)
				return UseMemoResult6
			end,
			onActivated = function(p1)
				-- upvalues: UseMemoResult1 (upval), PeopleReportAbuseMenuService (upval), GetFFlagAddPeoplePageCardLayoutFunction (upval)
				if UseMemoResult1 then
					PeopleReportAbuseMenuService:ReportPlayer(UseMemoResult1, if GetFFlagAddPeoplePageCardLayoutFunction() then p1 else "MenuPlayerList")
				end
			end,
			layoutOrder = if GetFFlagNewPeopleButtonOrderFunction() then 40 else 30,
			isBuilderIcon = GetFFlagNewPeoplePageIconsFunction()
		}
		
		if GetFFlagAddPeoplePageCardLayoutFunction() then
			List[ConstantsService.PERSON_BUTTONS.REPORT_PLAYER] = config21
		else
			table.insert(List, config21)
		end
		local config11 = {
			layoutOrder = 20,
			id = ConstantsService.PERSON_BUTTONS.INSPECT,
			onIcon = if GetFFlagNewPeoplePageIconsFunction() then ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.INSPECT_NEW else ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.INSPECT_LEGACY,
			shouldShow = function()
				-- upvalues: GuiService (upval)
				return GuiService:GetInspectMenuEnabled()
			end,
			onActivated = function(p1)
				-- upvalues: UseMemoResult1 (upval), GetFFlagAddPeoplePageCardLayoutFunction (upval), PeopleAnalyticsManagerService (upval), UseMemoResult2 (upval), GuiService (upval), SettingsHubService (upval)
				if UseMemoResult1 then
					if GetFFlagAddPeoplePageCardLayoutFunction() then
						PeopleAnalyticsManagerService:trackInspectButton(game.GameId, UseMemoResult2, p1)
					else
						PeopleAnalyticsManagerService:trackInspectButton(game.GameId, UseMemoResult2)
					end
					GuiService:InspectPlayerFromUserIdWithCtx(UseMemoResult1.UserId, "escapeMenu")
					local HubRefResult = SettingsHubService.hubRef()
					
					if HubRefResult then
						HubRefResult:SetVisibility(false)
					end
				end
			end,
			isBuilderIcon = GetFFlagNewPeoplePageIconsFunction()
		}
		
		if GetFFlagAddPeoplePageCardLayoutFunction() then
			List[ConstantsService.PERSON_BUTTONS.INSPECT] = config11
			
			return List
		else
			table.insert(List, config11)
			
			return List
		end
	end, {
		UseSignalStateResult, UseSignalStateResult1, UseMemoResult6,
		UseSignalStateResult2, IsUseDeviceOrientationResultMatch, UseMemoResult4,
		UseMemoResult5, UseMemoResult3
	}))
end