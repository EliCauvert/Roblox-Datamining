local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local cryoModule = require(parent.Cryo)
local friendsMenuModule = require(parent.FriendsMenu)
local squadExternalContractProviderModule = require(parent.SquadsCore.SquadExternalContractProvider)
local UIBloxModule = require(parent.UIBlox)
local userModel = require(parent.UserLib).Models.UserModel
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local dependenciesModule = require(squads.dependencies)
local useIsInviteButtonDisabledModule = require(squads.Hooks.useIsInviteButtonDisabled)
local react = dependenciesModule.React
local useLocalization = dependenciesModule.Hooks.useLocalization
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local friendsListContext = friendsMenuModule.FriendsListContext
local inviteCallbackContext = friendsMenuModule.InviteCallbackContext
local selectedUsersContext = friendsMenuModule.SelectedUsersContext
local fFlagEnablePartyQuickStartButton = require(parent.SharedFlags).FFlagEnablePartyQuickStartButton
local encodeUserIdsModule = require(parent.SquadsCore.encodeUserIds)
local squadExternalContractContext = squadExternalContractProviderModule.SquadExternalContractContext
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadRootViewType = require(parent.SquadsCore.Enums).SquadRootViewType
local t = {
	[userModel.PresenceType.OFFLINE] = 0,
	[userModel.PresenceType.ONLINE] = 1,
	[userModel.PresenceType.IN_GAME] = 2,
	[userModel.PresenceType.IN_STUDIO] = 3
}

local function _() --[[ line: 46 | named "getFFlagRenameFriendsToConnectionsPartyLobby" ]]
	-- upvalues: universalAppPolicyModule (ref)
	return universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections()
end

return function(p0) --[[ line: 50 | named "SquadInviteFriendsButton" ]]
	-- upvalues: react (ref), selectedUsersContext (ref), inviteCallbackContext (ref), friendsListContext (ref), squadExternalContractContext (ref), useIsInviteButtonDisabledModule (ref), useLocalization (ref), fFlagEnablePartyQuickStartButton (ref), userModel (ref), t (ref), cryoModule (ref), encodeUserIdsModule (ref), eventNamesModule (ref), squadRootViewType (ref), button (ref), buttonType (ref), universalAppPolicyModule (ref)
	local var17
	local var11 = react.useContext(selectedUsersContext)
	local var12 = react.useContext(inviteCallbackContext)
	local var13 = react.useContext(friendsListContext)
	local var14 = react.useContext(squadExternalContractContext)
	local var15 = useIsInviteButtonDisabledModule(var11.selectedFriendsSize, var11.selectedFriends or {}, var11.preselectedUsers or {})
	local var16 = useLocalization({
		addFriendsText = "Feature.Chat.Label.AddFriends",
		addConnectionsText = "CommonUI.Features.Label.AddConnections"
	})
	local _ = nil
	
	if fFlagEnablePartyQuickStartButton then
		local var18 = var14.useSquadRootView()
		local var19 = react.useRef({})
		local var20 = react.useCallback(function() --[[ line: 77 ]]
			-- upvalues: var13 (ref), userModel (copy), t (copy)
			if var13.isFetchingFriends then
				return {}, {}
			end
			local t_1 = {}
			local t_2 = {}
			
			for i, v in pairs(var13.friends) do
				if v.presence ~= userModel.PresenceType.OFFLINE then
					table.insert(t_1, tonumber(v.id))
					table.insert(t_2, t[v.presence])
				end
			end
			return t_1, t_2
		end, { var13.isFetchingFriends, var13.friends })
		local var21 = react.useCallback(function() --[[ line: 94 ]]
			-- upvalues: var11 (ref), var13 (ref), t (copy)
			local t_1 = {}
			local t_2 = {}
			local t_3 = {}
			
			for i, v in pairs(var11.selectedFriends) do
				t_3[i] = true
			end
			for i_1, v_1 in ipairs(var13.friends) do
				if t_3[v_1.id] then
					table.insert(t_1, tonumber(v_1.id))
					table.insert(t_2, t[v_1.presence])
				end
			end
			return t_1, t_2
		end, { var11.selectedFriends, var13.friends })
		react.useEffect(function() --[[ line: 113 ]]
			-- upvalues: var20 (ref), var21 (ref), var19 (ref)
			local var28, var29 = var20()
			local var30, var31 = var21()
			var19.current = {
				onlineFriendsIds = var28,
				onlineFriendsPresence = var29,
				selectedFriendsIds = var30,
				selectedFriendsPresence = var31,
				numActiveFriends = #var28,
				numSelectedFriends = #var30
			}
		end, { var20, var21 })
		local var22 = react.useCallback(function(p1) --[[ line: 127 ]]
			-- upvalues: var19 (ref), cryoModule (copy), p0 (ref), var14 (ref), encodeUserIdsModule (copy), eventNamesModule (copy)
			local current = var19.current
			var14.fireSquadAnalytics(eventNamesModule.MultiInviteMenuActionStatus, cryoModule.Dictionary.join(p0.analyticsInfo, {
				actionLocation = var14.squadLocation,
				actionType = p1,
				activeFriendsUserIds = encodeUserIdsModule(current.onlineFriendsIds),
				activeFriendsPresences = encodeUserIdsModule(current.onlineFriendsPresence),
				selectedFriendsUserIds = encodeUserIdsModule(current.selectedFriendsIds),
				selectedFriendsPresences = encodeUserIdsModule(current.selectedFriendsPresence),
				numActiveFriends = current.numActiveFriends,
				numSelectedFriends = current.numSelectedFriends,
				clientTimeStamp = os.time()
			}))
		end, {
			var14.squadLocation,
			var14.fireSquadAnalytics,
			p0.analyticsInfo
		})
		react.useEffect(function() --[[ line: 146 ]]
			-- upvalues: p0 (ref), var22 (ref)
			return function() --[[ line: 147 ]]
				-- upvalues: p0 (copy), var22 (copy)
				if p0.partyStartedRef.current then
					var22("multi_invite_attempted")
					
					return
				end
				var22("leave_page")
			end
		end, {})
		react.useEffect(function() --[[ line: 158 ]]
			-- upvalues: var18 (ref), squadRootViewType (copy), var22 (ref)
			if var18 == squadRootViewType.None then
				var22("leave_page")
			end
		end, { var18, var22 })
		var17 = react.useCallback(function() --[[ line: 165 ]]
			-- upvalues: var22 (ref), var12 (ref), var11 (ref)
			var22("multi_invite_button_clicked")
			var12.inviteMultiFriends(var11.selectedFriends)
		end, { var22, var12.inviteMultiFriends, var11.selectedFriends })
	else
		var17 = react.useCallback(function() --[[ line: 174 ]]
			-- upvalues: var12 (ref), var11 (ref)
			var12.inviteMultiFriends(var11.selectedFriends)
		end, { var12.inviteMultiFriends, var11.selectedFriends })
	end
	return react.createElement(button, {
		onActivated = var17,
		buttonTextOverride = { TextWrapped = false },
		buttonType = buttonType.PrimarySystem,
		size = UDim2.new(1, 0, 0, 36),
		text = if fFlagEnablePartyQuickStartButton then p0.buttonText elseif universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then var16.addConnectionsText else var16.addFriendsText,
		isDisabled = var15
	})
end