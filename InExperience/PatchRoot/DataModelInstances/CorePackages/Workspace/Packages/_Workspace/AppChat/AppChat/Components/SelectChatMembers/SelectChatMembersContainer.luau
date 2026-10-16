local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local ConstantsModule = require(AppChat.Constants)
local _ = require(AppChat.Models.ConversationChannels)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local View = require(Parent.Foundation).View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseAppChatIsWideModeModule = require(AppChat.Hooks.useAppChatIsWideMode)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local IsUserInConversationModule = require(script.Parent.Utils.isUserInConversation)
local UseFetchPaginatedFriendIdsModule = require(script.Parent.useFetchPaginatedFriendIds)
local SelectChatMembersModule = require(script.Parent.SelectChatMembers)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagFixPaginatedChatMembersCutoffModule = require(AppChat.Flags.FFlagFixPaginatedChatMembersCutoff)
local GetSelectedUsersStoreModule = require(AppChat.Stores.GetSelectedUsersStore)
local config = {
	minSelections = 1,
	canOnlyCreateOneToOneChat = false,
	isDebugEnabled = false,
	maxSelections = ConstantsModule.MIN_PARTICIPANT_COUNT,
	maxConversationSize = ConstantsModule.MAX_PARTICIPANT_COUNT,
	filterPredicate = require(script.Parent.Utils.searchFilterPredicate),
	sortComparator = require(script.Parent.Utils.sortComparator),
	conversation = { participants = {} },
	navigateToToast = function(_) --[[ Line: 64 ]] end,
	selectedUsersChanged = function(_, _) --[[ Line: 65 ]] end
}

function SelectChatMembersContainer(p1) --[[ Line: 70 ]]
	-- upvalues: CryoModule (copy), config (copy), GetSelectedUsersStoreModule (copy), FFlagFixPaginatedChatMembersCutoffModule (copy), UseNavigationFunction (copy), ReactModule (copy), SignalsModule (copy), UseLocalizationFunction (copy), GetFFlagIsSquadEnabledFunction (copy), ConstantsModule (copy), UseFetchPaginatedFriendIdsModule (copy), IsUserInConversationModule (copy), UseIsInExperienceModule (copy), UseAppChatIsWideModeModule (copy), View (copy), SelectChatMembersModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local SelectedUsersStoreModule = GetSelectedUsersStoreModule(false)
	local TopBarHeightScreenProps = if FFlagFixPaginatedChatMembersCutoffModule then UseNavigationFunction().getScreenProps("topBarHeight", 0) else nil
	ReactModule.useEffect(function() --[[ Line: 80 ]]
		-- upvalues: SelectedUsersStoreModule (copy), UnionResult (copy)
		SelectedUsersStoreModule.setMaxSize(UnionResult.maxSelections)
		
		return function() --[[ Line: 82 ]]
			-- upvalues: SelectedUsersStoreModule (upval)
			SelectedUsersStoreModule.clearStore()
		end
	end, { UnionResult.maxSelections })
	ReactModule.useEffect(function() --[[ Line: 87 ]]
		-- upvalues: SignalsModule (upval), SelectedUsersStoreModule (copy), CryoModule (upval), UnionResult (copy)
		local Effect = SignalsModule.createEffect(function(p2) --[[ Line: 88 ]]
			-- upvalues: SelectedUsersStoreModule (upval), CryoModule (upval), UnionResult (upval)
			UnionResult.selectedUsersChanged(CryoModule.List.map(SelectedUsersStoreModule.getSelectedUserIdsArray()(p2), function(Id) --[[ Line: 93 ]]
				return { id = Id }
			end), UnionResult.minSelections)
		end)
		
		return function() --[[ Line: 99 ]]
			-- upvalues: Effect (copy)
			Effect()
		end
	end, { UnionResult.minSelections })
	local UseLocalizationResult = UseLocalizationFunction({
		searchFriendsText = "Feature.Chat.Label.SearchFriends",
		networkErrorText = "Feature.Chat.Response.NetworkError",
		systemButtonText = UnionResult.systemButtonText,
		pageHeaderText = UnionResult.pageHeaderText,
		tooManyFriendsText = {
			if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Message.AddFriendsPartyLimit" else "Feature.Chat.Message.AddFriendsLimit",
			friendNum = ConstantsModule.MAX_PARTICIPANT_COUNT,
			connectionsNum = ConstantsModule.MAX_PARTICIPANT_COUNT
		},
		tooManyFriendsTextSingular = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Message.AddFriendsPartyLimitSingular" else "Feature.Chat.Message.GroupFriendLimitSingular"
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 122 ]]
		-- upvalues: UnionResult (copy), UseLocalizationResult (copy)
		UnionResult.navigateToToast({
			toastProps = {
				toastContent = {
					toastTitle = if UnionResult.canOnlyCreateOneToOneChat then UseLocalizationResult.tooManyFriendsTextSingular else UseLocalizationResult.tooManyFriendsText
				}
			}
		})
	end, {
		UnionResult.canOnlyCreateOneToOneChat,
		UnionResult.navigateToToast,
		UseLocalizationResult
	})
	ReactModule.useEffect(function() --[[ Line: 128 ]]
		-- upvalues: SelectedUsersStoreModule (copy), UseResult (copy)
		local OnMaxSizeExceededResult = SelectedUsersStoreModule.onMaxSizeExceeded(UseResult)
		
		return function() --[[ Line: 130 ]]
			-- upvalues: OnMaxSizeExceededResult (copy)
			OnMaxSizeExceededResult()
		end
	end, { UseResult })
	local UseFetchPaginatedFriendIdsModuleResult, UseFetchPaginatedFriendIdsModuleResult2, UseFetchPaginatedFriendIdsModuleResult3 = UseFetchPaginatedFriendIdsModule()
	
	return ReactModule.createElement(View, {
		Size = UDim2.new(1, 0, 1, if not UseAppChatIsWideModeModule((UseIsInExperienceModule())) then 0 else -(if FFlagFixPaginatedChatMembersCutoffModule then TopBarHeightScreenProps else 56))
	}, {
		SelectMembers = ReactModule.createElement(SelectChatMembersModule, {
			friendIds = ReactModule.useMemo(function() --[[ Line: 137 ]]
				-- upvalues: CryoModule (upval), UseFetchPaginatedFriendIdsModuleResult (copy), IsUserInConversationModule (upval), UnionResult (copy)
				return CryoModule.List.filter(UseFetchPaginatedFriendIdsModuleResult, function(p2): boolean --[[ Line: 138 ]]
					-- upvalues: IsUserInConversationModule (upval), UnionResult (upval)
					return not IsUserInConversationModule(p2, UnionResult.conversation)
				end)
			end, {
				UseFetchPaginatedFriendIdsModuleResult,
				UnionResult.conversation
			}),
			fetchMoreFriends = ReactModule.useCallback(function() --[[ Line: 143 ]]
				-- upvalues: UseFetchPaginatedFriendIdsModuleResult2 (copy), UseFetchPaginatedFriendIdsModuleResult3 (copy)
				if UseFetchPaginatedFriendIdsModuleResult2 and not UseFetchPaginatedFriendIdsModuleResult3 then
					UseFetchPaginatedFriendIdsModuleResult2()
				end
			end, {
				UseFetchPaginatedFriendIdsModuleResult2,
				UseFetchPaginatedFriendIdsModuleResult3
			}),
			searchFriendsText = UseLocalizationResult.searchFriendsText,
			shouldShowSelectChatMembersBar = not UnionResult.canOnlyCreateOneToOneChat,
			conversation = UnionResult.conversation,
			isDebugEnabled = UnionResult.isDebugEnabled
		})
	})
end

return ReactModule.memo(SelectChatMembersContainer)