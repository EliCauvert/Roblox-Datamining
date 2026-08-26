local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local friendsMenuModule = require(parent.FriendsMenu)
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local promiseModule = require(parent.Promise)
local UIBloxModule = require(parent.UIBlox)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local coreGui = reactFocusNavigationModule.EngineInterface.CoreGui
local focusNavigationContext = reactFocusNavigationModule.FocusNavigationContext
local focusNavigationService = reactFocusNavigationModule.FocusNavigationService
local focusBehaviorsModule = require(parent.FocusBehaviors)
local dependenciesModule = require(squads.dependencies)
local constantsModule = require(squads.Common.Constants)
local inviteToParentChannelModule = require(squads.Thunks.InviteToParentChannel)
local squadInviteSourceEnumModule = require(squads.Enums.SquadInviteSourceEnum)
local cryo = dependenciesModule.Cryo
local react = dependenciesModule.React
local sharedFlags = dependenciesModule.SharedFlags
local constantsModule_1 = require(parent.SquadsCore.Constants)
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadPromptType = require(parent.SquadsCore.Enums).SquadPromptType
local useDispatch = dependenciesModule.Hooks.useDispatch
local useCurrentSquadSelector = dependenciesModule.Hooks.useCurrentSquadSelector
local useLocalization = dependenciesModule.Hooks.useLocalization
local useStore = dependenciesModule.Hooks.useStore
local useNavigation = dependenciesModule.useNavigation
local useIsInviteButtonDisabledModule = require(squads.Hooks.useIsInviteButtonDisabled)
local friendsMenuFriendsList = friendsMenuModule.FriendsMenuFriendsList
local friendsMenuContextWrapper = friendsMenuModule.FriendsMenuContextWrapper
local friendsMenuSearch = friendsMenuModule.FriendsMenuSearch
local friendMenuType = friendsMenuModule.FriendMenuType
local selectedUsersScroller = friendsMenuModule.SelectedUsersScroller
local selectedUsersContext = friendsMenuModule.SelectedUsersContext
local fFlagEnablePartyQuickStartButton = sharedFlags.FFlagEnablePartyQuickStartButton
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local squadInviteFriendsButtonModule = require(script.Parent.SquadInviteFriendsButton)
local inviteToSquadModule = require(squads.Thunks.inviteToSquad)

local var1 = function() end

local t = {
	buttonText = "Add",
	preselectedUsers = nil,
	preselectedUsersUnremovable = false,
	shouldHideFooterButton = nil,
	onMultiInvite = function(_) end,
	participants = {},
	analyticsInfo = {},
	onRemoveCallback = function() end,
	onSelectedFriendsChanged = function() end
}

local function SelectedFriendsListener(p1)
	-- upvalues: react (ref), selectedUsersContext (ref), fFlagEnablePartyQuickStartButton (ref), useIsInviteButtonDisabledModule (ref)
	local var2 = react.useContext(selectedUsersContext)
	local selectedFriendsSize = var2.selectedFriendsSize
	local selectedFriends = var2.selectedFriends
	local var3 = react.useCallback(function()
		-- upvalues: fFlagEnablePartyQuickStartButton (copy), p1 (ref), selectedFriends (ref)
		if fFlagEnablePartyQuickStartButton and p1.onMultiInvite then
			p1.onMultiInvite(selectedFriends)
			
			return
		end
		p1.fallbackOnMultiInvite(selectedFriends)
	end, {
		p1.onMultiInvite,
		p1.fallbackOnMultiInvite,
		selectedFriends
	})
	local var4 = useIsInviteButtonDisabledModule(selectedFriendsSize, var2.selectedFriends or {}, var2.preselectedUsers or {})
	react.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), var3 (ref)
		p1.onSelectedFriendsChanged(not var4, var3)
	end, { var4, var3, p1.onSelectedFriendsChanged })
	
	return nil
end

return function(p1)
	-- upvalues: cryo (ref), t (ref), react (ref), focusNavigationContext (ref), squadExternalContractContext (ref), useDispatch (ref), useNavigation (ref), useStore (ref), useStyle (ref), useAppPolicy (ref), useLocalUserId (ref), useCurrentSquadSelector (ref), useLocalization (ref), squadInviteSourceEnumModule (ref), eventNamesModule (ref), notificationModalsManagerModule (ref), images (ref), promiseModule (ref), inviteToParentChannelModule (ref), inviteToSquadModule (ref), constantsModule_1 (ref), squadPromptType (ref), focusBehaviorsModule (ref), focusNavigationService (ref), coreGui (ref), friendsMenuContextWrapper (ref), var1 (ref), fFlagEnablePartyQuickStartButton (ref), constantsModule (ref), SelectedFriendsListener (ref), friendsMenuSearch (ref), selectedUsersScroller (ref), friendsMenuFriendsList (ref), friendMenuType (ref), squadInviteFriendsButtonModule (ref)
	local preselectedUsersUnremovable
	local var2 = cryo.Dictionary.join(t, p1)
	local var3 = react.useContext(focusNavigationContext)
	local var4 = react.useContext(squadExternalContractContext)
	local var5 = useDispatch()
	local var6 = useNavigation()
	local var7 = useStore()
	local theme = useStyle().Theme
	local var8, var9 = react.useState(0)
	local var10 = useAppPolicy(react.useCallback(function(p2)
		return p2.getCanUsePlatformChat()
	end, {}))
	local var11 = react.useRef(nil)
	local var12 = react.useRef(nil)
	local var13 = useLocalUserId()
	local var14 = react.useCallback(function(p2)
		-- upvalues: var9 (ref)
		var9(p2.AbsoluteSize.Y)
	end, { var9 })
	local var15 = useCurrentSquadSelector()
	local var16 = if var15 and var15.parentChannelId then var15.parentChannelId else ""
	local var17 = var4.useGetConversationFromId(var16)
	local var18 = useLocalization({
		user = "Feature.Squads.Description.User",
		youAddedMoreThanTwoToChat = "Feature.Squads.Description.YouAddedMoreThanTwoToChat",
		youAddedToChat = "Feature.Squads.Description.YouAddedToChat",
		youAddedTwoToChat = "Feature.Squads.Description.YouAddedTwoToChat"
	})
	local var19 = react.useCallback(function(p2)
		-- upvalues: cryo (copy), var16 (ref), squadInviteSourceEnumModule (copy), var4 (ref), eventNamesModule (copy)
		var4.fireSquadAnalytics(eventNamesModule.SquadInvite, cryo.Dictionary.union({
			parentChannelId = var16,
			source = squadInviteSourceEnumModule.SourceSquadInvitePage
		}, p2))
	end, { var16, var4.fireSquadAnalytics })
	local var20 = react.useCallback(function(p2)
		-- upvalues: cryo (copy), var18 (ref), notificationModalsManagerModule (copy), images (copy)
		local var21 = cryo.Dictionary.keys(p2)
		local displayName = p2[var21[1]].displayName
		notificationModalsManagerModule.SetUIBloxToast({
			iconImage = images["icons/actions/friends/friendAdd"],
			toastTitle = if #var21 > 2 then var18.youAddedMoreThanTwoToChat:gsub("{(.-)}", {
				username = displayName,
				userCountMinusOne = tostring(#var21 - 1)
			}) elseif #var21 == 2 then var18.youAddedTwoToChat:gsub("{(.-)}", {
				username1 = displayName,
				username2 = p2[var21[2]].displayName
			}) else var18.youAddedToChat:gsub("{(.-)}", { username = displayName })
		})
	end, {
		var18.youAddedMoreThanTwoToChat,
		var18.youAddedToChat,
		var18.youAddedTwoToChat
	})
	local var21 = react.useCallback(function(p2)
		-- upvalues: var15 (ref), var17 (ref), cryo (copy), var13 (ref), var4 (ref), var5 (ref), promiseModule (copy), inviteToParentChannelModule (copy), var6 (ref), inviteToSquadModule (copy), var19 (ref), var20 (ref), constantsModule_1 (copy), var10 (ref), var7 (ref), squadPromptType (copy)
		if not var15 or not var17 then return end
		local var22 = cryo.Dictionary.keys(p2)
		local var23 = cryo.List.toSet(var17.participants)
		local var24 = cryo.List.filter(var22, function(p3)
			-- upvalues: var23 (ref)
			return var23[p3] == nil
		end)
		
		local var25 = function()
			-- upvalues: cryo (copy), var17 (copy), var22 (ref), var13 (copy), var4 (copy), var5 (copy), promiseModule (copy), var24 (ref), inviteToParentChannelModule (copy), var6 (copy), inviteToSquadModule (copy), var15 (copy), var19 (copy), var20 (copy), p2 (ref)
			local var26 = cryo.List.filter(var17.participants, function(p3)
				-- upvalues: cryo (copy), var22 (copy), var13 (copy)
				return cryo.List.find(var22, tostring(p3)) == nil and p3 ~= var13
			end)
			local t = {}
			
			for i, v in ipairs(var26) do
				table.insert(t, var4.removeUserFromParentChannel(var5, var17.id, v))
			end
			promiseModule.all(t):andThen(function()
				-- upvalues: var24 (copy), var5 (copy), inviteToParentChannelModule (copy), var26 (ref), var6 (copy), var17 (copy), inviteToSquadModule (copy), var15 (copy), var13 (copy), var19 (copy), var20 (copy), p2 (copy), var4 (copy)
				if #var24 > 0 then
					var5(inviteToParentChannelModule({
						dispatch = var5,
						onErrorCallback = function()
							-- upvalues: var26 (copy), var6 (copy)
							if #var26 > 0 then
								var6.pop()
							end
						end,
						onSuccessCallback = function(p3)
							-- upvalues: var17 (copy), var5 (copy), inviteToSquadModule (copy), var15 (copy), var13 (copy), var24 (copy), var19 (copy), var20 (copy), p2 (copy), var6 (copy)
							var5(inviteToSquadModule(var15.squadId, p3, var13, var24, var19, p3 ~= var17.id))
							var20(p2)
							var6.pop()
						end,
						parentChannel = var17,
						squadExternalContext = var4,
						userIds = var24
					}))
					
					return
				end
				var6.pop()
			end)
		end
		
		if var17.type == constantsModule_1.CONVERSATION_CHANNEL_GROUP_TYPE and var10 and #var24 > 0 then
			var4.setSquadPrompt(var7, {
				hideCancelButton = false,
				promptType = squadPromptType.ConfirmInviteToSquad,
				onConfirm = function()
					-- upvalues: var25 (ref)
					var25()
				end
			})
			
			return
		end
		var25()
	end, {
		var15, var5, var6, var17, var19, var20, var4.setSquadPrompt,
		var4.inviteToParentChannel, var4.removeUserFromParentChannel, var7, var13
	})
	react.useEffect(function()
		-- upvalues: var3 (ref), var11 (ref), var12 (ref), focusBehaviorsModule (copy), focusNavigationService (copy), coreGui (copy)
		if var3 and var11.current ~= nil and var12.current ~= nil then
			if var3 then
				local var26 = focusBehaviorsModule.default(var12.current)
				local current = var11.current
				var3:registerFocusBehavior(current, var26)
				
				return function()
					-- upvalues: var3 (copy), current (ref), var26 (ref)
					var3:deregisterFocusBehavior(current, var26)
				end
			end
		elseif var11.current ~= nil and var12.current ~= nil then
			focusNavigationService.new(coreGui):registerFocusBehavior(var11.current, focusBehaviorsModule.default(var12.current))
		end
		return function() end
	end, { var3 })
	local createElement = react.createElement
	local t_1 = {
		isLoadingCustomParams = false,
		inviteSingleFriend = var1,
		inviteMultiFriends = if fFlagEnablePartyQuickStartButton then var2.onMultiInvite else var21,
		selectionLimit = constantsModule.SQUAD_PARTICIPANT_LIMIT - 1,
		preselectedUsers = if fFlagEnablePartyQuickStartButton then var2.preselectedUsers else var17 and (var17.participants and cryo.List.filter(var17.participants, function(p3)
			-- upvalues: var13 (ref)
			return p3 ~= var13
		end))
	}
	
	if fFlagEnablePartyQuickStartButton then
		preselectedUsersUnremovable = var2.preselectedUsersUnremovable
	elseif var17 then
		preselectedUsersUnremovable = true
		
		if var17.type ~= constantsModule_1.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE then
			local _ = var17.initiator ~= tostring(var13)
		end
	else
		preselectedUsersUnremovable = nil
	end
	t_1.preselectedUsersUnremovable = preselectedUsersUnremovable
	t_1.onRemoveCallback = if fFlagEnablePartyQuickStartButton then var2.onRemoveCallback elseif var17 then function(p3, p4)
		-- upvalues: cryo (copy), var17 (ref), var4 (ref), var7 (ref), var18 (ref), squadPromptType (copy)
		if cryo.List.find(var17.participants, p3) then
			var4.setSquadPrompt(var7, {
				hideCancelButton = true,
				bodyTextLocalizationProps = { displayName = p4 or var18.user },
				promptType = squadPromptType.RemoveFromParty
			})
		end
	end else nil
	
	return createElement(friendsMenuContextWrapper, t_1, {
		SelectedFriendsListener = react.createElement(SelectedFriendsListener, {
			onMultiInvite = var2.onMultiInvite,
			fallbackOnMultiInvite = var21,
			onSelectedFriendsChanged = var2.onSelectedFriendsChanged
		}),
		ContainerFrame = react.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = if var2.shouldHideFooterButton then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -52),
			BackgroundColor3 = theme.BackgroundDefault.Color,
			ref = var11
		}, {
			VerticalLayout = react.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 16),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			SearchSelectFrame = react.createElement("Frame", {
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				[react.Change.AbsoluteSize] = var14
			}, {
				Padding = react.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24),
					PaddingTop = UDim.new(0, 12)
				}),
				VerticalLayout = react.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 16),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				FriendsMenuSearch = react.createElement(friendsMenuSearch, {
					layoutOrder = 0,
					focusElement = false,
					size = UDim2.new(1, 0, 0, 36),
					ref = var12
				}),
				SelectedUsersScroller = react.createElement(selectedUsersScroller, {
					layoutOrder = 1,
					selectionLimit = constantsModule.SQUAD_PARTICIPANT_LIMIT - 1
				})
			}),
			FriendsList = react.createElement(friendsMenuFriendsList, {
				layoutOrder = 1,
				isFullRowActivatable = true,
				backgroundTransparency = 1,
				disableSelectionParentManagement = true,
				disableListFocus = true,
				size = UDim2.new(1, 0, 1, (-var8) - 16),
				parentComponentName = constantsModule.SQUAD_INVITE_PARENT_COMPONENT,
				menuType = friendMenuType.MultiSelect
			})
		}),
		FriendsListButtonFrame = if var2.shouldHideFooterButton then nil else react.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
			Size = UDim2.new(1, 0, 0, 52),
			BackgroundColor3 = theme.BackgroundContrast.Color
		}, {
			Padding = react.createElement("UIPadding", {
				PaddingRight = UDim.new(0, 12),
				PaddingLeft = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 8),
				PaddingTop = UDim.new(0, 8)
			}),
			Button = react.createElement(squadInviteFriendsButtonModule, {
				buttonText = var2.buttonText,
				analyticsInfo = var2.analyticsInfo,
				partyStartedRef = var2.partyStartedRef
			})
		})
	})
end