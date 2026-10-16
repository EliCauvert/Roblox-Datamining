local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local CryoModule = require(Parent.Cryo)
local FriendsMenuModule = require(Parent.FriendsMenu)
local UIBloxModule = require(Parent.UIBlox)
local UserModel = require(Parent.UserLib).Models.UserModel
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local DependenciesModule = require(Squads.dependencies)
local UseIsInviteButtonDisabledModule = require(Squads.Hooks.useIsInviteButtonDisabled)
local React = DependenciesModule.React
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local FriendsListContext = FriendsMenuModule.FriendsListContext
local InviteCallbackContext = FriendsMenuModule.InviteCallbackContext
local SelectedUsersContext = FriendsMenuModule.SelectedUsersContext
local FFlagEnablePartyQuickStartButton = require(Parent.SharedFlags).FFlagEnablePartyQuickStartButton
local EncodeUserIdsModule = require(Parent.SquadsCore.encodeUserIds)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadRootViewType = require(Parent.SquadsCore.Enums).SquadRootViewType
local config = {
	[UserModel.PresenceType.OFFLINE] = 0,
	[UserModel.PresenceType.ONLINE] = 1,
	[UserModel.PresenceType.IN_GAME] = 2,
	[UserModel.PresenceType.IN_STUDIO] = 3
}

local function _() --[[ Line: 46 | Named "getFFlagRenameFriendsToConnectionsPartyLobby" ]]
	-- upvalues: UniversalAppPolicyModule (copy)
	return UniversalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections()
end

return function(p1) --[[ Line: 50 | Named "SquadInviteFriendsButton" ]]
	-- upvalues: React (copy), SelectedUsersContext (copy), InviteCallbackContext (copy), FriendsListContext (copy), SquadExternalContractContext (copy), UseIsInviteButtonDisabledModule (copy), UseLocalizationFunction (copy), FFlagEnablePartyQuickStartButton (copy), UserModel (copy), config (copy), CryoModule (copy), EncodeUserIdsModule (copy), EventNamesModule (copy), SquadRootViewType (copy), Button (copy), ButtonType (copy), UniversalAppPolicyModule (copy)
	local UseContextResult = React.useContext(SelectedUsersContext)
	local UseContextResult1 = React.useContext(InviteCallbackContext)
	local UseContextResult2 = React.useContext(FriendsListContext)
	local UseContextResult3 = React.useContext(SquadExternalContractContext)
	local UseIsInviteButtonDisabledModuleResult = UseIsInviteButtonDisabledModule(UseContextResult.selectedFriendsSize, UseContextResult.selectedFriends or {}, UseContextResult.preselectedUsers or {})
	local UseLocalizationResult = UseLocalizationFunction({
		addFriendsText = "Feature.Chat.Label.AddFriends",
		addConnectionsText = "CommonUI.Features.Label.AddConnections"
	})
	local UseResult3 = nil
	
	if FFlagEnablePartyQuickStartButton then
		local UseSquadRootViewResult = UseContextResult3.useSquadRootView()
		local UseRefResult = React.useRef({})
		local UseResult = React.useCallback(function() --[[ Line: 77 ]]
			-- upvalues: UseContextResult2 (copy), UserModel (upval), config (upval)
			if UseContextResult2.isFetchingFriends then
				return {}, {}
			end
			local List = {}
			local List1 = {}
			
			for _, friend in pairs(UseContextResult2.friends) do
				if friend.presence ~= UserModel.PresenceType.OFFLINE then
					table.insert(List, (tonumber(friend.id)))
					table.insert(List1, config[friend.presence])
				end
			end
			return List, List1
		end, {
			UseContextResult2.isFetchingFriends,
			UseContextResult2.friends
		})
		local UseResult1 = React.useCallback(function() --[[ Line: 94 ]]
			-- upvalues: UseContextResult (copy), UseContextResult2 (copy), config (upval)
			local List = {}
			local List1 = {}
			local t = {}
			
			for i, selectedFriend in pairs(UseContextResult.selectedFriends) do
				t[i] = true
			end
			for _, selectedFriend in ipairs(UseContextResult2.friends) do
				if t[selectedFriend.id] then
					table.insert(List, (tonumber(selectedFriend.id)))
					table.insert(List1, config[selectedFriend.presence])
				end
			end
			return List, List1
		end, {
			UseContextResult.selectedFriends,
			UseContextResult2.friends
		})
		React.useEffect(function() --[[ Line: 113 ]]
			-- upvalues: UseResult (copy), UseResult1 (copy), UseRefResult (copy)
			local UseResultResult, UseResultResult2 = UseResult()
			local UseResultResult1, UseResultResult2_1 = UseResult1()
			UseRefResult.current = {
				onlineFriendsIds = UseResultResult,
				onlineFriendsPresence = UseResultResult2,
				selectedFriendsIds = UseResultResult1,
				selectedFriendsPresence = UseResultResult2_1,
				numActiveFriends = #UseResultResult,
				numSelectedFriends = #UseResultResult1
			}
		end, { UseResult, UseResult1 })
		local UseResult2 = React.useCallback(function(ActionType) --[[ Line: 127 ]]
			-- upvalues: UseRefResult (copy), CryoModule (upval), p1 (copy), UseContextResult3 (copy), EncodeUserIdsModule (upval), EventNamesModule (upval)
			local Current = UseRefResult.current
			UseContextResult3.fireSquadAnalytics(EventNamesModule.MultiInviteMenuActionStatus, (CryoModule.Dictionary.join(p1.analyticsInfo, {
				actionLocation = UseContextResult3.squadLocation,
				actionType = ActionType,
				activeFriendsUserIds = EncodeUserIdsModule(Current.onlineFriendsIds),
				activeFriendsPresences = EncodeUserIdsModule(Current.onlineFriendsPresence),
				selectedFriendsUserIds = EncodeUserIdsModule(Current.selectedFriendsIds),
				selectedFriendsPresences = EncodeUserIdsModule(Current.selectedFriendsPresence),
				numActiveFriends = Current.numActiveFriends,
				numSelectedFriends = Current.numSelectedFriends,
				clientTimeStamp = os.time()
			})))
		end, {
			UseContextResult3.squadLocation,
			UseContextResult3.fireSquadAnalytics,
			p1.analyticsInfo
		})
		React.useEffect(function() --[[ Line: 146 ]]
			-- upvalues: p1 (copy), UseResult2 (copy)
			return function() --[[ Line: 147 ]]
				-- upvalues: p1 (upval), UseResult2 (upval)
				if p1.partyStartedRef.current then
					UseResult2("multi_invite_attempted")
					
					return
				else
					UseResult2("leave_page")
				end
			end
		end, {})
		React.useEffect(function() --[[ Line: 158 ]]
			-- upvalues: UseSquadRootViewResult (copy), SquadRootViewType (upval), UseResult2 (copy)
			if UseSquadRootViewResult == SquadRootViewType.None then
				UseResult2("leave_page")
			end
		end, { UseSquadRootViewResult, UseResult2 })
		UseResult3 = React.useCallback(function() --[[ Line: 165 ]]
			-- upvalues: UseResult2 (copy), UseContextResult1 (copy), UseContextResult (copy)
			UseResult2("multi_invite_button_clicked")
			UseContextResult1.inviteMultiFriends(UseContextResult.selectedFriends)
		end, {
			UseResult2,
			UseContextResult1.inviteMultiFriends,
			UseContextResult.selectedFriends
		})
	else
		UseResult3 = React.useCallback(function() --[[ Line: 174 ]]
			-- upvalues: UseContextResult1 (copy), UseContextResult (copy)
			UseContextResult1.inviteMultiFriends(UseContextResult.selectedFriends)
		end, {
			UseContextResult1.inviteMultiFriends,
			UseContextResult.selectedFriends
		})
	end
	return React.createElement(Button, {
		onActivated = UseResult3,
		buttonTextOverride = { TextWrapped = false },
		buttonType = ButtonType.PrimarySystem,
		size = UDim2.new(1, 0, 0, 36),
		text = if FFlagEnablePartyQuickStartButton then p1.buttonText elseif UniversalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then UseLocalizationResult.addConnectionsText else UseLocalizationResult.addFriendsText,
		isDisabled = UseIsInviteButtonDisabledModuleResult
	})
end