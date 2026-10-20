local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local FriendsMenuModule = require(Parent.FriendsMenu)
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local PromiseModule = require(Parent.Promise)
local UIBloxModule = require(Parent.UIBlox)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local CoreGui = ReactFocusNavigationModule.EngineInterface.CoreGui
local FocusNavigationContext = ReactFocusNavigationModule.FocusNavigationContext
local FocusNavigationService = ReactFocusNavigationModule.FocusNavigationService
local FocusBehaviorsModule = require(Parent.FocusBehaviors)
local DependenciesModule = require(Squads.dependencies)
local ConstantsModule = require(Squads.Common.Constants)
local InviteToParentChannelModule = require(Squads.Thunks.InviteToParentChannel)
local SquadInviteSourceEnumModule = require(Squads.Enums.SquadInviteSourceEnum)
local Cryo = DependenciesModule.Cryo
local React = DependenciesModule.React
local ConstantsModule1 = require(Parent.SquadsCore.Constants)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadPromptType = require(Parent.SquadsCore.Enums).SquadPromptType
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseCurrentSquadSelectorFunction = DependenciesModule.Hooks.useCurrentSquadSelector
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local UseStoreFunction = DependenciesModule.Hooks.useStore
local UseNavigationFunction = DependenciesModule.useNavigation
local UseIsInviteButtonDisabledModule = require(Squads.Hooks.useIsInviteButtonDisabled)
local FriendsMenuFriendsList = FriendsMenuModule.FriendsMenuFriendsList
local FriendsMenuContextWrapper = FriendsMenuModule.FriendsMenuContextWrapper
local FriendsMenuSearch = FriendsMenuModule.FriendsMenuSearch
local FriendMenuType = FriendsMenuModule.FriendMenuType
local SelectedUsersScroller = FriendsMenuModule.SelectedUsersScroller
local SelectedUsersContext = FriendsMenuModule.SelectedUsersContext
local FFlagEnablePartyQuickStartButton = DependenciesModule.SharedFlags.FFlagEnablePartyQuickStartButton
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local SquadInviteFriendsButtonModule = require(script.Parent.SquadInviteFriendsButton)
local InviteToSquadModule = require(Squads.Thunks.inviteToSquad)

local function InviteSingleFriend() end

local config = {
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
	-- upvalues: React (copy), SelectedUsersContext (copy), FFlagEnablePartyQuickStartButton (copy), UseIsInviteButtonDisabledModule (copy)
	local UseContextResult = React.useContext(SelectedUsersContext)
	local SelectedFriends = UseContextResult.selectedFriends
	local UseResult = React.useCallback(function()
		-- upvalues: FFlagEnablePartyQuickStartButton (upval), p1 (copy), SelectedFriends (copy)
		if FFlagEnablePartyQuickStartButton and p1.onMultiInvite then
			p1.onMultiInvite(SelectedFriends)
			
			return
		else
			p1.fallbackOnMultiInvite(SelectedFriends)
		end
	end, {
		p1.onMultiInvite,
		p1.fallbackOnMultiInvite,
		SelectedFriends
	})
	local UseIsInviteButtonDisabledModuleResult = UseIsInviteButtonDisabledModule(UseContextResult.selectedFriendsSize, UseContextResult.selectedFriends or {}, UseContextResult.preselectedUsers or {})
	React.useEffect(function()
		-- upvalues: p1 (copy), UseIsInviteButtonDisabledModuleResult (copy), UseResult (copy)
		p1.onSelectedFriendsChanged(not UseIsInviteButtonDisabledModuleResult, UseResult)
	end, {
		UseIsInviteButtonDisabledModuleResult,
		UseResult,
		p1.onSelectedFriendsChanged
	})
	
	return nil
end

return function(p1)
	-- upvalues: Cryo (copy), config (copy), React (copy), FocusNavigationContext (copy), SquadExternalContractContext (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), UseStoreFunction (copy), UseStyleFunction (copy), UseAppPolicyFunction (copy), UseLocalUserIdFunction (copy), UseCurrentSquadSelectorFunction (copy), UseLocalizationFunction (copy), SquadInviteSourceEnumModule (copy), EventNamesModule (copy), NotificationModalsManagerModule (copy), Images (copy), PromiseModule (copy), InviteToParentChannelModule (copy), InviteToSquadModule (copy), ConstantsModule1 (copy), SquadPromptType (copy), FocusBehaviorsModule (copy), FocusNavigationService (copy), CoreGui (copy), FriendsMenuContextWrapper (copy), InviteSingleFriend (copy), FFlagEnablePartyQuickStartButton (copy), ConstantsModule (copy), SelectedFriendsListener (copy), FriendsMenuSearch (copy), SelectedUsersScroller (copy), FriendsMenuFriendsList (copy), FriendMenuType (copy), SquadInviteFriendsButtonModule (copy)
	local JoinResult = Cryo.Dictionary.join(config, p1)
	local UseContextResult = React.useContext(FocusNavigationContext)
	local UseContextResult1 = React.useContext(SquadExternalContractContext)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseStoreResult = UseStoreFunction()
	local Theme = UseStyleFunction().Theme
	local UseStateResult, UseStateResult2 = React.useState(0)
	local UseAppPolicyResult = UseAppPolicyFunction((React.useCallback(function(p2)
		return p2.getCanUsePlatformChat()
	end, {})))
	local UseRefResult = React.useRef(nil)
	local UseRefResult1 = React.useRef(nil)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseResult = React.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.Y)
	end, { UseStateResult2 })
	local UseCurrentSquadSelectorResult = UseCurrentSquadSelectorFunction()
	local ParentChannelId = if UseCurrentSquadSelectorResult and UseCurrentSquadSelectorResult.parentChannelId then UseCurrentSquadSelectorResult.parentChannelId else ""
	local UseGetConversationFromIdResult = UseContextResult1.useGetConversationFromId(ParentChannelId)
	local UseLocalizationResult = UseLocalizationFunction({
		user = "Feature.Squads.Description.User",
		youAddedMoreThanTwoToChat = "Feature.Squads.Description.YouAddedMoreThanTwoToChat",
		youAddedToChat = "Feature.Squads.Description.YouAddedToChat",
		youAddedTwoToChat = "Feature.Squads.Description.YouAddedTwoToChat"
	})
	local UseResult1 = React.useCallback(function(p2)
		-- upvalues: Cryo (upval), ParentChannelId (copy), SquadInviteSourceEnumModule (upval), UseContextResult1 (copy), EventNamesModule (upval)
		UseContextResult1.fireSquadAnalytics(EventNamesModule.SquadInvite, (Cryo.Dictionary.union({
			parentChannelId = ParentChannelId,
			source = SquadInviteSourceEnumModule.SourceSquadInvitePage
		}, p2)))
	end, { ParentChannelId, UseContextResult1.fireSquadAnalytics })
	local UseResult2 = React.useCallback(function(p2)
		-- upvalues: Cryo (upval), UseLocalizationResult (copy), NotificationModalsManagerModule (upval), Images (upval)
		local KeysResult = Cryo.Dictionary.keys(p2)
		local DisplayName = p2[KeysResult[1]].displayName
		NotificationModalsManagerModule.SetUIBloxToast({
			iconImage = Images["icons/actions/friends/friendAdd"],
			toastTitle = if #KeysResult > 2 then UseLocalizationResult.youAddedMoreThanTwoToChat:gsub("{(.-)}", {
				username = DisplayName,
				userCountMinusOne = tostring(#KeysResult - 1)
			}) elseif #KeysResult == 2 then UseLocalizationResult.youAddedTwoToChat:gsub("{(.-)}", {
				username1 = DisplayName,
				username2 = p2[KeysResult[2]].displayName
			}) else UseLocalizationResult.youAddedToChat:gsub("{(.-)}", { username = DisplayName })
		})
	end, {
		UseLocalizationResult.youAddedMoreThanTwoToChat,
		UseLocalizationResult.youAddedToChat,
		UseLocalizationResult.youAddedTwoToChat
	})
	local UseResult3 = React.useCallback(function(p2)
		-- upvalues: UseCurrentSquadSelectorResult (copy), UseGetConversationFromIdResult (copy), Cryo (upval), UseLocalUserIdResult (copy), UseContextResult1 (copy), UseDispatchResult (copy), PromiseModule (upval), InviteToParentChannelModule (upval), UseNavigationResult (copy), InviteToSquadModule (upval), UseResult1 (copy), UseResult2 (copy), ConstantsModule1 (upval), UseAppPolicyResult (copy), UseStoreResult (copy), SquadPromptType (upval)
		if not UseCurrentSquadSelectorResult or not UseGetConversationFromIdResult then return end
		local KeysResult = Cryo.Dictionary.keys(p2)
		local Set = Cryo.List.toSet(UseGetConversationFromIdResult.participants)
		local FilterResult = Cryo.List.filter(KeysResult, function(p3): boolean
			-- upvalues: Set (copy)
			return Set[p3] == nil
		end)
		
		local function v65()
			-- upvalues: Cryo (upval), UseGetConversationFromIdResult (upval), KeysResult (copy), UseLocalUserIdResult (upval), UseContextResult1 (upval), UseDispatchResult (upval), PromiseModule (upval), FilterResult (copy), InviteToParentChannelModule (upval), UseNavigationResult (upval), InviteToSquadModule (upval), UseCurrentSquadSelectorResult (upval), UseResult1 (upval), UseResult2 (upval), p2 (copy)
			local FilterResult1 = Cryo.List.filter(UseGetConversationFromIdResult.participants, function(p3): boolean
				-- upvalues: Cryo (upval), KeysResult (upval), UseLocalUserIdResult (upval)
				return Cryo.List.find(KeysResult, (tostring(p3))) == nil and p3 ~= UseLocalUserIdResult
			end)
			local List = {}
			
			for _, value in ipairs(FilterResult1) do
				table.insert(List, UseContextResult1.removeUserFromParentChannel(UseDispatchResult, UseGetConversationFromIdResult.id, value))
			end
			PromiseModule.all(List):andThen(function()
				-- upvalues: FilterResult (upval), UseDispatchResult (upval), InviteToParentChannelModule (upval), FilterResult1 (copy), UseNavigationResult (upval), UseGetConversationFromIdResult (upval), InviteToSquadModule (upval), UseCurrentSquadSelectorResult (upval), UseLocalUserIdResult (upval), UseResult1 (upval), UseResult2 (upval), p2 (upval), UseContextResult1 (upval)
				if #FilterResult > 0 then
					UseDispatchResult(InviteToParentChannelModule({
						dispatch = UseDispatchResult,
						onErrorCallback = function()
							-- upvalues: FilterResult1 (upval), UseNavigationResult (upval)
							if #FilterResult1 > 0 then
								UseNavigationResult.pop()
							end
						end,
						onSuccessCallback = function(Id)
							-- upvalues: UseGetConversationFromIdResult (upval), UseDispatchResult (upval), InviteToSquadModule (upval), UseCurrentSquadSelectorResult (upval), UseLocalUserIdResult (upval), FilterResult (upval), UseResult1 (upval), UseResult2 (upval), p2 (upval), UseNavigationResult (upval)
							UseDispatchResult(InviteToSquadModule(UseCurrentSquadSelectorResult.squadId, Id, UseLocalUserIdResult, FilterResult, UseResult1, Id ~= UseGetConversationFromIdResult.id))
							UseResult2(p2)
							UseNavigationResult.pop()
						end,
						parentChannel = UseGetConversationFromIdResult,
						squadExternalContext = UseContextResult1,
						userIds = FilterResult
					}))
					
					return
				else
					UseNavigationResult.pop()
				end
			end)
		end
		
		if UseGetConversationFromIdResult.type == ConstantsModule1.CONVERSATION_CHANNEL_GROUP_TYPE and UseAppPolicyResult and #FilterResult > 0 then
			UseContextResult1.setSquadPrompt(UseStoreResult, {
				hideCancelButton = false,
				promptType = SquadPromptType.ConfirmInviteToSquad,
				onConfirm = function()
					-- upvalues: v65 (copy)
					v65()
				end
			})
			
			return
		else
			v65()
		end
	end, {
		UseCurrentSquadSelectorResult, UseDispatchResult, UseNavigationResult,
		UseGetConversationFromIdResult, UseResult1, UseResult2,
		UseContextResult1.setSquadPrompt, UseContextResult1.inviteToParentChannel,
		UseContextResult1.removeUserFromParentChannel, UseStoreResult,
		UseLocalUserIdResult
	})
	React.useEffect(function()
		-- upvalues: UseContextResult (copy), UseRefResult (copy), UseRefResult1 (copy), FocusBehaviorsModule (upval), FocusNavigationService (upval), CoreGui (upval)
		if not UseContextResult or UseRefResult.current == nil or UseRefResult1.current == nil then
			if UseRefResult.current ~= nil and UseRefResult1.current ~= nil then
				FocusNavigationService.new(CoreGui):registerFocusBehavior(UseRefResult.current, FocusBehaviorsModule.default(UseRefResult1.current))
			end
		elseif UseContextResult then
			local DefaultResult = FocusBehaviorsModule.default(UseRefResult1.current)
			local Current = UseRefResult.current
			UseContextResult:registerFocusBehavior(Current, DefaultResult)
			
			return function()
				-- upvalues: UseContextResult (upval), Current (copy), DefaultResult (copy)
				UseContextResult:deregisterFocusBehavior(Current, DefaultResult)
			end
		end
		return function() end
	end, { UseContextResult })
	
	return React.createElement(FriendsMenuContextWrapper, {
		isLoadingCustomParams = false,
		inviteSingleFriend = InviteSingleFriend,
		inviteMultiFriends = if FFlagEnablePartyQuickStartButton then JoinResult.onMultiInvite else UseResult3,
		selectionLimit = ConstantsModule.SQUAD_PARTICIPANT_LIMIT - 1,
		preselectedUsers = if FFlagEnablePartyQuickStartButton then JoinResult.preselectedUsers else UseGetConversationFromIdResult and (UseGetConversationFromIdResult.participants and Cryo.List.filter(UseGetConversationFromIdResult.participants, function(p3): boolean
			-- upvalues: UseLocalUserIdResult (copy)
			return p3 ~= UseLocalUserIdResult
		end)),
		preselectedUsersUnremovable = if FFlagEnablePartyQuickStartButton then JoinResult.preselectedUsersUnremovable elseif UseGetConversationFromIdResult then UseGetConversationFromIdResult.type == ConstantsModule1.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE or UseGetConversationFromIdResult.initiator ~= tostring(UseLocalUserIdResult) else nil,
		onRemoveCallback = if FFlagEnablePartyQuickStartButton then JoinResult.onRemoveCallback elseif UseGetConversationFromIdResult then function(p3, p4)
			-- upvalues: Cryo (upval), UseGetConversationFromIdResult (copy), UseContextResult1 (copy), UseStoreResult (copy), UseLocalizationResult (copy), SquadPromptType (upval)
			if Cryo.List.find(UseGetConversationFromIdResult.participants, p3) then
				UseContextResult1.setSquadPrompt(UseStoreResult, {
					hideCancelButton = true,
					bodyTextLocalizationProps = { displayName = p4 or UseLocalizationResult.user },
					promptType = SquadPromptType.RemoveFromParty
				})
			end
		end else nil
	}, {
		SelectedFriendsListener = React.createElement(SelectedFriendsListener, {
			onMultiInvite = JoinResult.onMultiInvite,
			fallbackOnMultiInvite = UseResult3,
			onSelectedFriendsChanged = JoinResult.onSelectedFriendsChanged
		}),
		ContainerFrame = React.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = if JoinResult.shouldHideFooterButton then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -52),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			ref = UseRefResult
		}, {
			VerticalLayout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 16),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			SearchSelectFrame = React.createElement("Frame", {
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				[React.Change.AbsoluteSize] = UseResult
			}, {
				Padding = React.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24),
					PaddingTop = UDim.new(0, 12)
				}),
				VerticalLayout = React.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 16),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				FriendsMenuSearch = React.createElement(FriendsMenuSearch, {
					layoutOrder = 0,
					focusElement = false,
					size = UDim2.new(1, 0, 0, 36),
					ref = UseRefResult1
				}),
				SelectedUsersScroller = React.createElement(SelectedUsersScroller, {
					layoutOrder = 1,
					selectionLimit = ConstantsModule.SQUAD_PARTICIPANT_LIMIT - 1
				})
			}),
			FriendsList = React.createElement(FriendsMenuFriendsList, {
				layoutOrder = 1,
				isFullRowActivatable = true,
				backgroundTransparency = 1,
				disableSelectionParentManagement = true,
				disableListFocus = true,
				size = UDim2.new(1, 0, 1, -UseStateResult - 16),
				parentComponentName = ConstantsModule.SQUAD_INVITE_PARENT_COMPONENT,
				menuType = FriendMenuType.MultiSelect
			})
		}),
		FriendsListButtonFrame = if JoinResult.shouldHideFooterButton then nil else React.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
			Size = UDim2.new(1, 0, 0, 52),
			BackgroundColor3 = Theme.BackgroundContrast.Color
		}, {
			Padding = React.createElement("UIPadding", {
				PaddingRight = UDim.new(0, 12),
				PaddingLeft = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 8),
				PaddingTop = UDim.new(0, 8)
			}),
			Button = React.createElement(SquadInviteFriendsButtonModule, {
				buttonText = JoinResult.buttonText,
				analyticsInfo = JoinResult.analyticsInfo,
				partyStartedRef = JoinResult.partyStartedRef
			})
		})
	})
end