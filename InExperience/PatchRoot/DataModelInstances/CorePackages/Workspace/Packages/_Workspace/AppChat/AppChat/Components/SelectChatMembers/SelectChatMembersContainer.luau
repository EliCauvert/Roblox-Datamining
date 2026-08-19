local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local constantsModule = require(appChat.Constants)
local _ = require(appChat.Models.ConversationChannels)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local view = require(parent.Foundation).View
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useNavigation = require(parent.Navigation).useNavigation
local useAppChatIsWideModeModule = require(appChat.Hooks.useAppChatIsWideMode)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local isUserInConversationModule = require(script.Parent.Utils.isUserInConversation)
local searchFilterPredicateModule = require(script.Parent.Utils.searchFilterPredicate)
local sortComparatorModule = require(script.Parent.Utils.sortComparator)
local useFetchPaginatedFriendIdsModule = require(script.Parent.useFetchPaginatedFriendIds)
local selectChatMembersModule = require(script.Parent.SelectChatMembers)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local fFlagFixPaginatedChatMembersCutoffModule = require(appChat.Flags.FFlagFixPaginatedChatMembersCutoff)
local getSelectedUsersStoreModule = require(appChat.Stores.GetSelectedUsersStore)
local t = {
	minSelections = 1,
	canOnlyCreateOneToOneChat = false,
	isDebugEnabled = false,
	maxSelections = constantsModule.MIN_PARTICIPANT_COUNT,
	maxConversationSize = constantsModule.MAX_PARTICIPANT_COUNT,
	filterPredicate = searchFilterPredicateModule,
	sortComparator = sortComparatorModule,
	conversation = { participants = {} },
	navigateToToast = function(_) --[[ line: 65 ]] end,
	selectedUsersChanged = function(_, _) --[[ line: 66 ]] end
}

function SelectChatMembersContainer(p0) --[[ line: 71 ]]
	-- upvalues: cryoModule (ref), t (ref), getSelectedUsersStoreModule (ref), fFlagFixPaginatedChatMembersCutoffModule (ref), useNavigation (ref), reactModule (ref), signalsModule (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), getFFlagIsSquadEnabled (ref), constantsModule (ref), useFetchPaginatedFriendIdsModule (ref), isUserInConversationModule (ref), useIsInExperienceModule (ref), useAppChatIsWideModeModule (ref), view (ref), selectChatMembersModule (ref)
	local var15 = cryoModule.Dictionary.union(t, p0)
	local var16 = getSelectedUsersStoreModule(false)
	local var17 = if fFlagFixPaginatedChatMembersCutoffModule then useNavigation().getScreenProps("topBarHeight", 0) else nil
	reactModule.useEffect(function() --[[ line: 81 ]]
		-- upvalues: var16 (ref), var15 (ref)
		var16.setMaxSize(var15.maxSelections)
		
		return function() --[[ line: 83 ]]
			-- upvalues: var16 (copy)
			var16.clearStore()
		end
	end, { var15.maxSelections })
	reactModule.useEffect(function() --[[ line: 88 ]]
		-- upvalues: signalsModule (copy), var16 (ref), cryoModule (copy), var15 (ref)
		local var23 = signalsModule.createEffect(function(p1) --[[ line: 89 ]]
			-- upvalues: var16 (copy), cryoModule (copy), var15 (copy)
			var15.selectedUsersChanged(cryoModule.List.map(var16.getSelectedUserIdsArray()(p1), function(p2) --[[ line: 94 ]]
				return { id = p2 }
			end), var15.minSelections)
		end)
		
		return function() --[[ line: 100 ]]
			-- upvalues: var23 (ref)
			var23()
		end
	end, { var15.minSelections })
	local var18 = useLocalization({
		networkErrorText = "Feature.Chat.Response.NetworkError",
		systemButtonText = var15.systemButtonText,
		pageHeaderText = var15.pageHeaderText,
		searchFriendsText = if fFlagConnectionsToFriendsRename then "Feature.Chat.Label.SearchFriends" else "Feature.Chat.Label.SearchConnections",
		tooManyFriendsText = {
			if getFFlagIsSquadEnabled() then if fFlagConnectionsToFriendsRename then "Feature.Chat.Message.AddFriendsPartyLimit" else "Feature.Chat.Message.AddConnectionsPartyLimit" elseif fFlagConnectionsToFriendsRename then "Feature.Chat.Message.AddFriendsLimit" else "Feature.Chat.Message.AddConnectionsLimit",
			friendNum = constantsModule.MAX_PARTICIPANT_COUNT,
			connectionsNum = constantsModule.MAX_PARTICIPANT_COUNT
		},
		tooManyFriendsTextSingular = if getFFlagIsSquadEnabled() then if fFlagConnectionsToFriendsRename then "Feature.Chat.Message.AddFriendsPartyLimitSingular" else "Feature.Chat.Message.AddConnectionsPartyLimitSingular" elseif fFlagConnectionsToFriendsRename then "Feature.Chat.Message.GroupFriendLimitSingular" else "Feature.Chat.Message.GroupConnectionLimitSingular"
	})
	local var19 = reactModule.useCallback(function() --[[ line: 133 ]]
		-- upvalues: var15 (ref), var18 (ref)
		var15.navigateToToast({
			toastProps = {
				toastContent = {
					toastTitle = if var15.canOnlyCreateOneToOneChat then var18.tooManyFriendsTextSingular else var18.tooManyFriendsText
				}
			}
		})
	end, {
		var15.canOnlyCreateOneToOneChat,
		var15.navigateToToast,
		var18
	})
	reactModule.useEffect(function() --[[ line: 139 ]]
		-- upvalues: var16 (ref), var19 (ref)
		local var24 = var16.onMaxSizeExceeded(var19)
		
		return function() --[[ line: 141 ]]
			-- upvalues: var24 (ref)
			var24()
		end
	end, { var19 })
	local var20, var21, var22 = useFetchPaginatedFriendIdsModule()
	
	return reactModule.createElement(view, {
		Size = UDim2.new(1, 0, 1, if not useAppChatIsWideModeModule(useIsInExperienceModule()) then 0 else -(if fFlagFixPaginatedChatMembersCutoffModule then var17 else 56))
	}, {
		SelectMembers = reactModule.createElement(selectChatMembersModule, {
			friendIds = reactModule.useMemo(function() --[[ line: 148 ]]
				-- upvalues: cryoModule (copy), var20 (ref), isUserInConversationModule (copy), var15 (ref)
				return cryoModule.List.filter(var20, function(p3) --[[ line: 149 ]]
					-- upvalues: isUserInConversationModule (copy), var15 (copy)
					return not isUserInConversationModule(p3, var15.conversation)
				end)
			end, { var20, var15.conversation }),
			fetchMoreFriends = reactModule.useCallback(function() --[[ line: 154 ]]
				-- upvalues: var21 (ref), var22 (ref)
				if var21 and not var22 then
					var21()
				end
			end, { var21, var22 }),
			searchFriendsText = var18.searchFriendsText,
			shouldShowSelectChatMembersBar = not var15.canOnlyCreateOneToOneChat,
			conversation = var15.conversation,
			isDebugEnabled = var15.isDebugEnabled
		})
	})
end

return reactModule.memo(SelectChatMembersContainer)