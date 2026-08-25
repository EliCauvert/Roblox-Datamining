local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local peopleServiceModule = require(parent.PeopleService)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.Signals)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local buttonVariant = require(parent.Foundation).Enums.ButtonVariant
local useSignalState = signalsReactModule.useSignalState
local useDeviceOrientation = robloxAppHooksModule.useDeviceOrientation
local constantsModule = require(peopleReactView.Constants)
local constants = peopleServiceModule.getService("Constants")
local flags = peopleServiceModule.getService("Flags")
local getFFlagNewPeopleButtonOrder = flags.GetFFlagNewPeopleButtonOrder
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local getFFlagNewPeoplePageIcons = flags.GetFFlagNewPeoplePageIcons
local getFFlagAddPeoplePageCardLayout = flags.GetFFlagAddPeoplePageCardLayout
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local fFlagStandardizeSafetyIcon = require(parent.SharedFlags).FFlagStandardizeSafetyIcon

local function getPlaySessionId()
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	return if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else ""
end

return function(p0)
	-- upvalues: peopleServiceModule (ref), useDeviceOrientation (ref), robloxAppEnumsModule (ref), useLocalization (ref), constantsModule (ref), fFlagConnectionsToFriendsRename (ref), reactModule (ref), playersService (ref), getPlaySessionId (ref), useSignalState (ref), getFFlagAddPeoplePageCardLayout (ref), constants (ref), getFFlagNewPeopleButtonOrder (ref), getFFlagNewPeoplePageIcons (ref), buttonVariant (ref), fFlagStandardizeSafetyIcon (ref), guiService (ref)
	local peopleVoiceChatStore = peopleServiceModule.getService("PeopleVoiceChatStore")
	local peopleReportAbuseMenu = peopleServiceModule.getService("PeopleReportAbuseMenu")
	local peopleAnalyticsManager = peopleServiceModule.getService("PeopleAnalyticsManager")
	local settingsHubService = peopleServiceModule.getService("SettingsHubService")
	local friendStatusStore = peopleServiceModule.getService("FriendStatusStore")
	local peopleBlockStatusStore = peopleServiceModule.getService("PeopleBlockStatusStore")
	local peopleUtility = peopleServiceModule.getService("PeopleUtility")
	local var21 = useDeviceOrientation() == robloxAppEnumsModule.DeviceOrientationMode.Portrait
	local var22 = useLocalization({
		requestSent = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.REQUEST_SENT,
		friend = if fFlagConnectionsToFriendsRename then constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.FRIEND else nil,
		addFriend = if fFlagConnectionsToFriendsRename then constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.ADD_FRIEND else nil,
		connection = if fFlagConnectionsToFriendsRename then nil else constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.CONNECTION,
		addConnection = if fFlagConnectionsToFriendsRename then nil else constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.ADD_CONNECTION,
		unblock = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNBLOCK
	})
	local var23 = reactModule.useMemo(function()
		-- upvalues: fFlagConnectionsToFriendsRename (copy), var22 (ref)
		return {
			isFriend = if fFlagConnectionsToFriendsRename then var22.friend else var22.connection,
			addPerson = if fFlagConnectionsToFriendsRename then var22.addFriend else var22.addConnection,
			requestSent = var22.requestSent
		}
	end, { var22 })
	local var24 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), playersService (copy)
		return if p0 then playersService:GetPlayerByUserId(p0) else nil
	end, { p0 })
	local var25 = reactModule.useMemo(getPlaySessionId, {})
	local playerMuteState = peopleVoiceChatStore.getPlayerMuteState(p0)
	local playerAnimatedIcon = peopleVoiceChatStore.getPlayerAnimatedIcon(p0)
	local playerIsLocalMuted = peopleVoiceChatStore.getPlayerIsLocalMuted(p0)
	local var29 = useSignalState(peopleVoiceChatStore.getPlayerShouldShowMuteButton(p0))
	local var30 = useSignalState(friendStatusStore.getShouldShowFriendButton(p0, var24))
	local var31 = if getFFlagAddPeoplePageCardLayout() then reactModule.useMemo(function()
		-- upvalues: friendStatusStore (ref), p0 (ref)
		return friendStatusStore.getFriendStatus(p0)
	end, { p0 }) else friendStatusStore.getFriendStatus(p0)
	local var32 = if getFFlagAddPeoplePageCardLayout() then reactModule.useMemo(function()
		-- upvalues: friendStatusStore (ref), p0 (ref), var23 (ref)
		return friendStatusStore.getFriendButtonText(p0, var23)
	end, { p0, var23 }) else friendStatusStore.getFriendButtonText(p0, var23)
	local var33 = if getFFlagAddPeoplePageCardLayout() then reactModule.useMemo(function()
		-- upvalues: friendStatusStore (ref), p0 (ref)
		return friendStatusStore.getFriendButtonVariant(p0)
	end, { p0 }) else friendStatusStore.getFriendButtonVariant(p0)
	local var34 = useSignalState(reactModule.useMemo(function()
		-- upvalues: p0 (ref), peopleBlockStatusStore (ref)
		return if p0 then peopleBlockStatusStore.getPlayerBlockStatus(p0) else nil
	end, { p0 }))
	local var35 = reactModule.useMemo(function()
		-- upvalues: peopleUtility (ref), var24 (ref), p0 (ref)
		return peopleUtility.showPersonButtons(var24, p0)
	end, { p0 })
	
	return reactModule.useMemo(function()
		-- upvalues: constants (copy), playerAnimatedIcon (ref), playerMuteState (ref), var29 (ref), peopleAnalyticsManager (ref), p0 (ref), playerIsLocalMuted (ref), getFFlagAddPeoplePageCardLayout (copy), peopleVoiceChatStore (ref), getFFlagNewPeopleButtonOrder (copy), var34 (ref), var22 (ref), getFFlagNewPeoplePageIcons (copy), constantsModule (copy), var35 (ref), var24 (ref), peopleBlockStatusStore (ref), buttonVariant (copy), var21 (ref), var32 (ref), var31 (ref), var33 (ref), var30 (ref), friendStatusStore (ref), fFlagStandardizeSafetyIcon (copy), peopleReportAbuseMenu (ref), guiService (copy), var25 (ref), settingsHubService (ref)
		local t = {}
		local t_1 = {
			isBuilderIcon = false,
			id = constants.PERSON_BUTTONS.MUTE_PLAYER,
			animatedIcon = playerAnimatedIcon,
			buttonState = playerMuteState,
			shouldShow = function()
				-- upvalues: var29 (copy)
				return var29
			end,
			onActivated = function(p1)
				-- upvalues: peopleAnalyticsManager (copy), p0 (copy), playerIsLocalMuted (copy), getFFlagAddPeoplePageCardLayout (copy), peopleVoiceChatStore (copy)
				peopleAnalyticsManager:trackToggleMutePlayer(p0, playerIsLocalMuted(false), if getFFlagAddPeoplePageCardLayout() then p1 else nil)
				peopleVoiceChatStore.togglePlayerMute(p0)
			end,
			layoutOrder = if getFFlagNewPeopleButtonOrder() then 30 else 10,
			isGrayedOut = playerIsLocalMuted
		}
		
		if getFFlagAddPeoplePageCardLayout() then
			t[constants.PERSON_BUTTONS.MUTE_PLAYER] = t_1
		else
			table.insert(t, t_1)
		end
		local t_2 = {
			id = constants.PERSON_BUTTONS.BLOCK_PLAYER,
			text = if var34 then var22.unblock else nil,
			onIcon = if var34 then nil elseif getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.BLOCK_NEW else constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.BLOCK_LEGACY,
			shouldShow = function()
				-- upvalues: var35 (copy)
				return var35
			end,
			onActivated = function(p2)
				-- upvalues: var24 (copy), var34 (copy), peopleBlockStatusStore (copy), getFFlagAddPeoplePageCardLayout (copy)
				if var24 then
					if var34 then
						peopleBlockStatusStore.unblockPlayer(var24, if getFFlagAddPeoplePageCardLayout() then p2 else nil)
						
						return
					end
					peopleBlockStatusStore.blockPlayer(var24, if getFFlagAddPeoplePageCardLayout() then p2 else nil)
				end
			end,
			buttonVariant = if var34 then buttonVariant.Subtle else nil,
			layoutOrder = if getFFlagNewPeopleButtonOrder() then 10 else 40,
			isBuilderIcon = getFFlagNewPeoplePageIcons()
		}
		
		if getFFlagAddPeoplePageCardLayout() then
			t[constants.PERSON_BUTTONS.BLOCK_PLAYER] = t_2
		else
			table.insert(t, t_2)
		end
		local t_3 = {
			layoutOrder = 60,
			id = constants.PERSON_BUTTONS.ADD_FRIEND,
			text = if var21 then nil else var32,
			onIcon = if not var21 then nil elseif getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.ADD_FRIEND_NEW else constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.ADD_FRIEND_LEGACY,
			offIcon = if not var21 then nil elseif getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.FRIEND_NEW else constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.FRIEND_LEGACY,
			buttonState = var31,
			buttonVariant = if var21 then nil else var33,
			shouldShow = function()
				-- upvalues: var30 (copy)
				return var30
			end,
			onActivated = function(p3)
				-- upvalues: peopleAnalyticsManager (copy), getFFlagAddPeoplePageCardLayout (copy), friendStatusStore (copy), var24 (copy)
				peopleAnalyticsManager:trackRequestFriendship(if getFFlagAddPeoplePageCardLayout() then p3 else nil)
				friendStatusStore.sendFriendRequest(var24)
			end,
			isDisabled = friendStatusStore.getIsFriendButtonDisabled(p0),
			isGrayedOut = friendStatusStore.getIsFriendButtonGrayedOut(p0),
			isBuilderIcon = getFFlagNewPeoplePageIcons()
		}
		
		if getFFlagAddPeoplePageCardLayout() then
			t[constants.PERSON_BUTTONS.ADD_FRIEND] = t_3
		else
			table.insert(t, t_3)
		end
		local t_4 = {
			id = constants.PERSON_BUTTONS.REPORT_PLAYER,
			onIcon = if fFlagStandardizeSafetyIcon then constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.REPORT_PLAYER_FLAG elseif getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.REPORT_PLAYER_NEW else constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.REPORT_PLAYER_LEGACY,
			shouldShow = function()
				-- upvalues: var35 (copy)
				return var35
			end,
			onActivated = function(p4)
				-- upvalues: var24 (copy), peopleReportAbuseMenu (copy), getFFlagAddPeoplePageCardLayout (copy)
				if var24 then
					peopleReportAbuseMenu:ReportPlayer(var24, if getFFlagAddPeoplePageCardLayout() then p4 else "MenuPlayerList")
				end
			end,
			layoutOrder = if getFFlagNewPeopleButtonOrder() then 40 else 30,
			isBuilderIcon = getFFlagNewPeoplePageIcons()
		}
		
		if getFFlagAddPeoplePageCardLayout() then
			t[constants.PERSON_BUTTONS.REPORT_PLAYER] = t_4
		else
			table.insert(t, t_4)
		end
		local t_5 = {
			layoutOrder = 20,
			id = constants.PERSON_BUTTONS.INSPECT,
			onIcon = if getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.INSPECT_NEW else constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.INSPECT_LEGACY,
			shouldShow = function()
				-- upvalues: guiService (copy)
				return guiService:GetInspectMenuEnabled()
			end,
			onActivated = function(p5)
				-- upvalues: var24 (copy), getFFlagAddPeoplePageCardLayout (copy), peopleAnalyticsManager (copy), var25 (copy), guiService (copy), settingsHubService (copy)
				if var24 then
					if getFFlagAddPeoplePageCardLayout() then
						peopleAnalyticsManager:trackInspectButton(game.GameId, var25, p5)
					else
						peopleAnalyticsManager:trackInspectButton(game.GameId, var25)
					end
					guiService:InspectPlayerFromUserIdWithCtx(var24.UserId, "escapeMenu")
					local var42 = settingsHubService.hubRef()
					
					if var42 then
						var42:SetVisibility(false)
					end
				end
			end,
			isBuilderIcon = getFFlagNewPeoplePageIcons()
		}
		
		if getFFlagAddPeoplePageCardLayout() then
			t[constants.PERSON_BUTTONS.INSPECT] = t_5
			
			return t
		end
		table.insert(t, t_5)
		
		return t
	end, {
		var29, var30, var35, var34, var21, var32, var33, var31
	})
end