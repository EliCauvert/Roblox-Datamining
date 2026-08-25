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

local var16 = function() end

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

local function SelectedFriendsListener(p0)
	-- upvalues: react (ref), selectedUsersContext (ref), fFlagEnablePartyQuickStartButton (ref), useIsInviteButtonDisabledModule (ref)
	local var19 = react.useContext(selectedUsersContext)
	local selectedFriendsSize = var19.selectedFriendsSize
	local selectedFriends = var19.selectedFriends
	local var20 = react.useCallback(function()
		-- upvalues: fFlagEnablePartyQuickStartButton (copy), p0 (ref), selectedFriends (ref)
		if fFlagEnablePartyQuickStartButton and p0.onMultiInvite then
			p0.onMultiInvite(selectedFriends)
			
			return
		end
		p0.fallbackOnMultiInvite(selectedFriends)
	end, {
		p0.onMultiInvite,
		p0.fallbackOnMultiInvite,
		selectedFriends
	})
	local var21 = useIsInviteButtonDisabledModule(selectedFriendsSize, var19.selectedFriends or {}, var19.preselectedUsers or {})
	react.useEffect(function()
		-- upvalues: p0 (ref), var21 (ref), var20 (ref)
		p0.onSelectedFriendsChanged(not var21, var20)
	end, { var21, var20, p0.onSelectedFriendsChanged })
	
	return nil
end

return function(p1)
	-- upvalues: cryo (ref), t (ref), react (ref), focusNavigationContext (ref), squadExternalContractContext (ref), useDispatch (ref), useNavigation (ref), useStore (ref), useStyle (ref), useAppPolicy (ref), useLocalUserId (ref), useCurrentSquadSelector (ref), useLocalization (ref), squadInviteSourceEnumModule (ref), eventNamesModule (ref), notificationModalsManagerModule (ref), images (ref), promiseModule (ref), inviteToParentChannelModule (ref), inviteToSquadModule (ref), constantsModule_1 (ref), squadPromptType (ref), focusBehaviorsModule (ref), focusNavigationService (ref), coreGui (ref), friendsMenuContextWrapper (ref), var16 (ref), fFlagEnablePartyQuickStartButton (ref), constantsModule (ref), SelectedFriendsListener (ref), friendsMenuSearch (ref), selectedUsersScroller (ref), friendsMenuFriendsList (ref), friendMenuType (ref), squadInviteFriendsButtonModule (ref)
	local preselectedUsersUnremovable
	local var22 = cryo.Dictionary.join(t, p1)
	local var23 = react.useContext(focusNavigationContext)
	local var24 = react.useContext(squadExternalContractContext)
	local var25 = useDispatch()
	local var26 = useNavigation()
	local var27 = useStore()
	local theme = useStyle().Theme
	local var28, var29 = react.useState(0)
	local var30 = useAppPolicy(react.useCallback(function(p2)
		return p2.getCanUsePlatformChat()
	end, {}))
	local var31 = react.useRef(nil)
	local var32 = react.useRef(nil)
	local var33 = useLocalUserId()
	local var34 = react.useCallback(function(p3)
		-- upvalues: var29 (ref)
		var29(p3.AbsoluteSize.Y)
	end, { var29 })
	local var35 = useCurrentSquadSelector()
	local var36 = if var35 and var35.parentChannelId then var35.parentChannelId else ""
	local var37 = var24.useGetConversationFromId(var36)
	local var38 = useLocalization({
		user = "Feature.Squads.Description.User",
		youAddedMoreThanTwoToChat = "Feature.Squads.Description.YouAddedMoreThanTwoToChat",
		youAddedToChat = "Feature.Squads.Description.YouAddedToChat",
		youAddedTwoToChat = "Feature.Squads.Description.YouAddedTwoToChat"
	})
	local var39 = react.useCallback(function(p4)
		-- upvalues: cryo (copy), var36 (ref), squadInviteSourceEnumModule (copy), var24 (ref), eventNamesModule (copy)
		var24.fireSquadAnalytics(eventNamesModule.SquadInvite, cryo.Dictionary.union({
			parentChannelId = var36,
			source = squadInviteSourceEnumModule.SourceSquadInvitePage
		}, p4))
	end, { var36, var24.fireSquadAnalytics })
	local var40 = react.useCallback(function(p5)
		-- upvalues: cryo (copy), var38 (ref), notificationModalsManagerModule (copy), images (copy)
		local var43 = cryo.Dictionary.keys(p5)
		local displayName = p5[var43[1]].displayName
		notificationModalsManagerModule.SetUIBloxToast({
			iconImage = images["icons/actions/friends/friendAdd"],
			toastTitle = if #var43 > 2 then var38.youAddedMoreThanTwoToChat:gsub("{(.-)}", {
				username = displayName,
				userCountMinusOne = tostring(#var43 - 1)
			}) elseif #var43 == 2 then var38.youAddedTwoToChat:gsub("{(.-)}", {
				username1 = displayName,
				username2 = p5[var43[2]].displayName
			}) else var38.youAddedToChat:gsub("{(.-)}", { username = displayName })
		})
	end, {
		var38.youAddedMoreThanTwoToChat,
		var38.youAddedToChat,
		var38.youAddedTwoToChat
	})
	local var41 = react.useCallback(function(p6)
		-- upvalues: var35 (ref), var37 (ref), cryo (copy), var33 (ref), var24 (ref), var25 (ref), promiseModule (copy), inviteToParentChannelModule (copy), var26 (ref), inviteToSquadModule (copy), var39 (ref), var40 (ref), constantsModule_1 (copy), var30 (ref), var27 (ref), squadPromptType (copy)
		if not var35 or not var37 then return end
		local var44 = cryo.Dictionary.keys(p6)
		local var45 = cryo.List.toSet(var37.participants)
		local var46 = cryo.List.filter(var44, function(p7)
			-- upvalues: var45 (ref)
			return var45[p7] == nil
		end)
		
		local var47 = function()
			-- upvalues: cryo (copy), var37 (copy), var44 (ref), var33 (copy), var24 (copy), var25 (copy), promiseModule (copy), var46 (ref), inviteToParentChannelModule (copy), var26 (copy), inviteToSquadModule (copy), var35 (copy), var39 (copy), var40 (copy), p6 (ref)
			local var48 = cryo.List.filter(var37.participants, function(p8)
				-- upvalues: cryo (copy), var44 (copy), var33 (copy)
				return cryo.List.find(var44, tostring(p8)) == nil and p8 ~= var33
			end)
			local t = {}
			
			for i, v in ipairs(var48) do
				table.insert(t, var24.removeUserFromParentChannel(var25, var37.id, v))
			end
			promiseModule.all(t):andThen(function()
				-- upvalues: var46 (copy), var25 (copy), inviteToParentChannelModule (copy), var48 (ref), var26 (copy), var37 (copy), inviteToSquadModule (copy), var35 (copy), var33 (copy), var39 (copy), var40 (copy), p6 (copy), var24 (copy)
				if #var46 > 0 then
					var25(inviteToParentChannelModule({
						dispatch = var25,
						onErrorCallback = function()
							-- upvalues: var48 (copy), var26 (copy)
							if #var48 > 0 then
								var26.pop()
							end
						end,
						onSuccessCallback = function(p9)
							-- upvalues: var37 (copy), var25 (copy), inviteToSquadModule (copy), var35 (copy), var33 (copy), var46 (copy), var39 (copy), var40 (copy), p6 (copy), var26 (copy)
							var25(inviteToSquadModule(var35.squadId, p9, var33, var46, var39, p9 ~= var37.id))
							var40(p6)
							var26.pop()
						end,
						parentChannel = var37,
						squadExternalContext = var24,
						userIds = var46
					}))
					
					return
				end
				var26.pop()
			end)
		end
		
		if var37.type == constantsModule_1.CONVERSATION_CHANNEL_GROUP_TYPE and var30 and #var46 > 0 then
			var24.setSquadPrompt(var27, {
				hideCancelButton = false,
				promptType = squadPromptType.ConfirmInviteToSquad,
				onConfirm = function()
					-- upvalues: var47 (ref)
					var47()
				end
			})
			
			return
		end
		var47()
	end, {
		var35, var25, var26, var37, var39, var40, var24.setSquadPrompt,
		var24.inviteToParentChannel, var24.removeUserFromParentChannel, var27, var33
	})
	react.useEffect(function()
		-- upvalues: var23 (ref), var31 (ref), var32 (ref), focusBehaviorsModule (copy), focusNavigationService (copy), coreGui (copy)
		if var23 and var31.current ~= nil and var32.current ~= nil then
			if var23 then
				local var50 = focusBehaviorsModule.default(var32.current)
				local current = var31.current
				var23:registerFocusBehavior(current, var50)
				
				return function()
					-- upvalues: var23 (copy), current (ref), var50 (ref)
					var23:deregisterFocusBehavior(current, var50)
				end
			end
		elseif var31.current ~= nil and var32.current ~= nil then
			focusNavigationService.new(coreGui):registerFocusBehavior(var31.current, focusBehaviorsModule.default(var32.current))
		end
		return function() end
	end, { var23 })
	local createElement = react.createElement
	local t_1 = {
		isLoadingCustomParams = false,
		inviteSingleFriend = var16,
		inviteMultiFriends = if fFlagEnablePartyQuickStartButton then var22.onMultiInvite else var41,
		selectionLimit = constantsModule.SQUAD_PARTICIPANT_LIMIT - 1,
		preselectedUsers = if fFlagEnablePartyQuickStartButton then var22.preselectedUsers else var37 and (var37.participants and cryo.List.filter(var37.participants, function(p10)
			-- upvalues: var33 (ref)
			return p10 ~= var33
		end))
	}
	
	if fFlagEnablePartyQuickStartButton then
		preselectedUsersUnremovable = var22.preselectedUsersUnremovable
	elseif var37 then
		preselectedUsersUnremovable = true
		
		if var37.type ~= constantsModule_1.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE then
			local _ = var37.initiator ~= tostring(var33)
		end
	else
		preselectedUsersUnremovable = nil
	end
	t_1.preselectedUsersUnremovable = preselectedUsersUnremovable
	t_1.onRemoveCallback = if fFlagEnablePartyQuickStartButton then var22.onRemoveCallback elseif var37 then function(p11, p12)
		-- upvalues: cryo (copy), var37 (ref), var24 (ref), var27 (ref), var38 (ref), squadPromptType (copy)
		if cryo.List.find(var37.participants, p11) then
			var24.setSquadPrompt(var27, {
				hideCancelButton = true,
				bodyTextLocalizationProps = { displayName = p12 or var38.user },
				promptType = squadPromptType.RemoveFromParty
			})
		end
	end else nil
	
	return createElement(friendsMenuContextWrapper, t_1, {
		SelectedFriendsListener = react.createElement(SelectedFriendsListener, {
			onMultiInvite = var22.onMultiInvite,
			fallbackOnMultiInvite = var41,
			onSelectedFriendsChanged = var22.onSelectedFriendsChanged
		}),
		ContainerFrame = react.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = if var22.shouldHideFooterButton then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -52),
			BackgroundColor3 = theme.BackgroundDefault.Color,
			ref = var31
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
				[react.Change.AbsoluteSize] = var34
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
					ref = var32
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
				size = UDim2.new(1, 0, 1, (-var28) - 16),
				parentComponentName = constantsModule.SQUAD_INVITE_PARENT_COMPONENT,
				menuType = friendMenuType.MultiSelect
			})
		}),
		FriendsListButtonFrame = if var22.shouldHideFooterButton then nil else react.createElement("Frame", {
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
				buttonText = var22.buttonText,
				analyticsInfo = var22.analyticsInfo,
				partyStartedRef = var22.partyStartedRef
			})
		})
	})
end