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

local function _()
	-- upvalues: universalAppPolicyModule (ref)
	return universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections()
end

return function(p1)
	-- upvalues: react (ref), selectedUsersContext (ref), inviteCallbackContext (ref), friendsListContext (ref), squadExternalContractContext (ref), useIsInviteButtonDisabledModule (ref), useLocalization (ref), fFlagEnablePartyQuickStartButton (ref), userModel (ref), t (ref), cryoModule (ref), encodeUserIdsModule (ref), eventNamesModule (ref), squadRootViewType (ref), button (ref), buttonType (ref), universalAppPolicyModule (ref)
	local var1
	local var2 = react.useContext(selectedUsersContext)
	local var3 = react.useContext(inviteCallbackContext)
	local var4 = react.useContext(friendsListContext)
	local var5 = react.useContext(squadExternalContractContext)
	local var6 = useIsInviteButtonDisabledModule(var2.selectedFriendsSize, var2.selectedFriends or {}, var2.preselectedUsers or {})
	local var7 = useLocalization({
		addFriendsText = "Feature.Chat.Label.AddFriends",
		addConnectionsText = "CommonUI.Features.Label.AddConnections"
	})
	local _ = nil
	
	if fFlagEnablePartyQuickStartButton then
		local var8 = var5.useSquadRootView()
		local var9 = react.useRef({})
		local var10 = react.useCallback(function()
			-- upvalues: var4 (ref), userModel (copy), t (copy)
			if var4.isFetchingFriends then
				return {}, {}
			end
			local t_1 = {}
			local t_2 = {}
			
			for i, v in pairs(var4.friends) do
				if v.presence ~= userModel.PresenceType.OFFLINE then
					table.insert(t_1, tonumber(v.id))
					table.insert(t_2, t[v.presence])
				end
			end
			return t_1, t_2
		end, { var4.isFetchingFriends, var4.friends })
		local var11 = react.useCallback(function()
			-- upvalues: var2 (ref), var4 (ref), t (copy)
			local t_1 = {}
			local t_2 = {}
			local t_3 = {}
			
			for i, v in pairs(var2.selectedFriends) do
				t_3[i] = true
			end
			for i_1, v_1 in ipairs(var4.friends) do
				if t_3[v_1.id] then
					table.insert(t_1, tonumber(v_1.id))
					table.insert(t_2, t[v_1.presence])
				end
			end
			return t_1, t_2
		end, { var2.selectedFriends, var4.friends })
		react.useEffect(function()
			-- upvalues: var10 (ref), var11 (ref), var9 (ref)
			local var12, var13 = var10()
			local var14, var15 = var11()
			var9.current = {
				onlineFriendsIds = var12,
				onlineFriendsPresence = var13,
				selectedFriendsIds = var14,
				selectedFriendsPresence = var15,
				numActiveFriends = #var12,
				numSelectedFriends = #var14
			}
		end, { var10, var11 })
		local var12 = react.useCallback(function(p2)
			-- upvalues: var9 (ref), cryoModule (copy), p1 (ref), var5 (ref), encodeUserIdsModule (copy), eventNamesModule (copy)
			local current = var9.current
			var5.fireSquadAnalytics(eventNamesModule.MultiInviteMenuActionStatus, cryoModule.Dictionary.join(p1.analyticsInfo, {
				actionLocation = var5.squadLocation,
				actionType = p2,
				activeFriendsUserIds = encodeUserIdsModule(current.onlineFriendsIds),
				activeFriendsPresences = encodeUserIdsModule(current.onlineFriendsPresence),
				selectedFriendsUserIds = encodeUserIdsModule(current.selectedFriendsIds),
				selectedFriendsPresences = encodeUserIdsModule(current.selectedFriendsPresence),
				numActiveFriends = current.numActiveFriends,
				numSelectedFriends = current.numSelectedFriends,
				clientTimeStamp = os.time()
			}))
		end, {
			var5.squadLocation,
			var5.fireSquadAnalytics,
			p1.analyticsInfo
		})
		react.useEffect(function()
			-- upvalues: p1 (ref), var12 (ref)
			return function()
				-- upvalues: p1 (copy), var12 (copy)
				if p1.partyStartedRef.current then
					var12("multi_invite_attempted")
					
					return
				end
				var12("leave_page")
			end
		end, {})
		react.useEffect(function()
			-- upvalues: var8 (ref), squadRootViewType (copy), var12 (ref)
			if var8 == squadRootViewType.None then
				var12("leave_page")
			end
		end, { var8, var12 })
		var1 = react.useCallback(function()
			-- upvalues: var12 (ref), var3 (ref), var2 (ref)
			var12("multi_invite_button_clicked")
			var3.inviteMultiFriends(var2.selectedFriends)
		end, { var12, var3.inviteMultiFriends, var2.selectedFriends })
	else
		var1 = react.useCallback(function()
			-- upvalues: var3 (ref), var2 (ref)
			var3.inviteMultiFriends(var2.selectedFriends)
		end, { var3.inviteMultiFriends, var2.selectedFriends })
	end
	return react.createElement(button, {
		onActivated = var1,
		buttonTextOverride = { TextWrapped = false },
		buttonType = buttonType.PrimarySystem,
		size = UDim2.new(1, 0, 0, 36),
		text = if fFlagEnablePartyQuickStartButton then p1.buttonText elseif universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then var7.addConnectionsText else var7.addFriendsText,
		isDisabled = var6
	})
end