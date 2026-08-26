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

return function(p1)
	-- upvalues: peopleServiceModule (ref), useDeviceOrientation (ref), robloxAppEnumsModule (ref), useLocalization (ref), constantsModule (ref), fFlagConnectionsToFriendsRename (ref), reactModule (ref), playersService (ref), getPlaySessionId (ref), useSignalState (ref), getFFlagAddPeoplePageCardLayout (ref), constants (ref), getFFlagNewPeopleButtonOrder (ref), getFFlagNewPeoplePageIcons (ref), buttonVariant (ref), fFlagStandardizeSafetyIcon (ref), guiService (ref)
	local peopleVoiceChatStore = peopleServiceModule.getService("PeopleVoiceChatStore")
	local peopleReportAbuseMenu = peopleServiceModule.getService("PeopleReportAbuseMenu")
	local peopleAnalyticsManager = peopleServiceModule.getService("PeopleAnalyticsManager")
	local settingsHubService = peopleServiceModule.getService("SettingsHubService")
	local friendStatusStore = peopleServiceModule.getService("FriendStatusStore")
	local peopleBlockStatusStore = peopleServiceModule.getService("PeopleBlockStatusStore")
	local peopleUtility = peopleServiceModule.getService("PeopleUtility")
	local var1 = useDeviceOrientation() == robloxAppEnumsModule.DeviceOrientationMode.Portrait
	local var2 = useLocalization({
		requestSent = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.REQUEST_SENT,
		friend = if fFlagConnectionsToFriendsRename then constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.FRIEND else nil,
		addFriend = if fFlagConnectionsToFriendsRename then constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.ADD_FRIEND else nil,
		connection = if fFlagConnectionsToFriendsRename then nil else constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.CONNECTION,
		addConnection = if fFlagConnectionsToFriendsRename then nil else constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.ADD_CONNECTION,
		unblock = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNBLOCK
	})
	local var3 = reactModule.useMemo(function()
		-- upvalues: fFlagConnectionsToFriendsRename (copy), var2 (ref)
		return {
			isFriend = if fFlagConnectionsToFriendsRename then var2.friend else var2.connection,
			addPerson = if fFlagConnectionsToFriendsRename then var2.addFriend else var2.addConnection,
			requestSent = var2.requestSent
		}
	end, { var2 })
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), playersService (copy)
		return if p1 then playersService:GetPlayerByUserId(p1) else nil
	end, { p1 })
	local var5 = reactModule.useMemo(getPlaySessionId, {})
	local playerMuteState = peopleVoiceChatStore.getPlayerMuteState(p1)
	local playerAnimatedIcon = peopleVoiceChatStore.getPlayerAnimatedIcon(p1)
	local playerIsLocalMuted = peopleVoiceChatStore.getPlayerIsLocalMuted(p1)
	local var6 = useSignalState(peopleVoiceChatStore.getPlayerShouldShowMuteButton(p1))
	local var7 = useSignalState(friendStatusStore.getShouldShowFriendButton(p1, var4))
	local var8 = if getFFlagAddPeoplePageCardLayout() then reactModule.useMemo(function()
		-- upvalues: friendStatusStore (ref), p1 (ref)
		return friendStatusStore.getFriendStatus(p1)
	end, { p1 }) else friendStatusStore.getFriendStatus(p1)
	local var9 = if getFFlagAddPeoplePageCardLayout() then reactModule.useMemo(function()
		-- upvalues: friendStatusStore (ref), p1 (ref), var3 (ref)
		return friendStatusStore.getFriendButtonText(p1, var3)
	end, { p1, var3 }) else friendStatusStore.getFriendButtonText(p1, var3)
	local var10 = if getFFlagAddPeoplePageCardLayout() then reactModule.useMemo(function()
		-- upvalues: friendStatusStore (ref), p1 (ref)
		return friendStatusStore.getFriendButtonVariant(p1)
	end, { p1 }) else friendStatusStore.getFriendButtonVariant(p1)
	local var11 = useSignalState(reactModule.useMemo(function()
		-- upvalues: p1 (ref), peopleBlockStatusStore (ref)
		return if p1 then peopleBlockStatusStore.getPlayerBlockStatus(p1) else nil
	end, { p1 }))
	local var12 = reactModule.useMemo(function()
		-- upvalues: peopleUtility (ref), var4 (ref), p1 (ref)
		return peopleUtility.showPersonButtons(var4, p1)
	end, { p1 })
	
	return reactModule.useMemo(function()
		-- upvalues: constants (copy), playerAnimatedIcon (ref), playerMuteState (ref), var6 (ref), peopleAnalyticsManager (ref), p1 (ref), playerIsLocalMuted (ref), getFFlagAddPeoplePageCardLayout (copy), peopleVoiceChatStore (ref), getFFlagNewPeopleButtonOrder (copy), var11 (ref), var2 (ref), getFFlagNewPeoplePageIcons (copy), constantsModule (copy), var12 (ref), var4 (ref), peopleBlockStatusStore (ref), buttonVariant (copy), var1 (ref), var9 (ref), var8 (ref), var10 (ref), var7 (ref), friendStatusStore (ref), fFlagStandardizeSafetyIcon (copy), peopleReportAbuseMenu (ref), guiService (copy), var5 (ref), settingsHubService (ref)
		local t = {}
		local t_1 = {
			isBuilderIcon = false,
			id = constants.PERSON_BUTTONS.MUTE_PLAYER,
			animatedIcon = playerAnimatedIcon,
			buttonState = playerMuteState,
			shouldShow = function()
				-- upvalues: var6 (copy)
				return var6
			end,
			onActivated = function(p2)
				-- upvalues: peopleAnalyticsManager (copy), p1 (copy), playerIsLocalMuted (copy), getFFlagAddPeoplePageCardLayout (copy), peopleVoiceChatStore (copy)
				peopleAnalyticsManager:trackToggleMutePlayer(p1, playerIsLocalMuted(false), if getFFlagAddPeoplePageCardLayout() then p2 else nil)
				peopleVoiceChatStore.togglePlayerMute(p1)
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
			text = if var11 then var2.unblock else nil,
			onIcon = if var11 then nil elseif getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.BLOCK_NEW else constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.BLOCK_LEGACY,
			shouldShow = function()
				-- upvalues: var12 (copy)
				return var12
			end,
			onActivated = function(p2)
				-- upvalues: var4 (copy), var11 (copy), peopleBlockStatusStore (copy), getFFlagAddPeoplePageCardLayout (copy)
				if var4 then
					if var11 then
						peopleBlockStatusStore.unblockPlayer(var4, if getFFlagAddPeoplePageCardLayout() then p2 else nil)
						
						return
					end
					peopleBlockStatusStore.blockPlayer(var4, if getFFlagAddPeoplePageCardLayout() then p2 else nil)
				end
			end,
			buttonVariant = if var11 then buttonVariant.Subtle else nil,
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
			text = if var1 then nil else var9,
			onIcon = if not var1 then nil elseif getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.ADD_FRIEND_NEW else constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.ADD_FRIEND_LEGACY,
			offIcon = if not var1 then nil elseif getFFlagNewPeoplePageIcons() then constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.FRIEND_NEW else constantsModule.PEOPLEPAGE.PERSON_BUTTONS.ICON.FRIEND_LEGACY,
			buttonState = var8,
			buttonVariant = if var1 then nil else var10,
			shouldShow = function()
				-- upvalues: var7 (copy)
				return var7
			end,
			onActivated = function(p2)
				-- upvalues: peopleAnalyticsManager (copy), getFFlagAddPeoplePageCardLayout (copy), friendStatusStore (copy), var4 (copy)
				peopleAnalyticsManager:trackRequestFriendship(if getFFlagAddPeoplePageCardLayout() then p2 else nil)
				friendStatusStore.sendFriendRequest(var4)
			end,
			isDisabled = friendStatusStore.getIsFriendButtonDisabled(p1),
			isGrayedOut = friendStatusStore.getIsFriendButtonGrayedOut(p1),
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
				-- upvalues: var12 (copy)
				return var12
			end,
			onActivated = function(p2)
				-- upvalues: var4 (copy), peopleReportAbuseMenu (copy), getFFlagAddPeoplePageCardLayout (copy)
				if var4 then
					peopleReportAbuseMenu:ReportPlayer(var4, if getFFlagAddPeoplePageCardLayout() then p2 else "MenuPlayerList")
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
			onActivated = function(p2)
				-- upvalues: var4 (copy), getFFlagAddPeoplePageCardLayout (copy), peopleAnalyticsManager (copy), var5 (copy), guiService (copy), settingsHubService (copy)
				if var4 then
					if getFFlagAddPeoplePageCardLayout() then
						peopleAnalyticsManager:trackInspectButton(game.GameId, var5, p2)
					else
						peopleAnalyticsManager:trackInspectButton(game.GameId, var5)
					end
					guiService:InspectPlayerFromUserIdWithCtx(var4.UserId, "escapeMenu")
					local var13 = settingsHubService.hubRef()
					
					if var13 then
						var13:SetVisibility(false)
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
		var6, var7, var12, var11, var1, var9, var10, var8
	})
end