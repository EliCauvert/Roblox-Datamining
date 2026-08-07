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
local useAppChatIsWideModeModule = require(appChat.Hooks.useAppChatIsWideMode)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local isUserInConversationModule = require(script.Parent.Utils.isUserInConversation)
local searchFilterPredicateModule = require(script.Parent.Utils.searchFilterPredicate)
local sortComparatorModule = require(script.Parent.Utils.sortComparator)
local useFetchPaginatedFriendIdsModule = require(script.Parent.useFetchPaginatedFriendIds)
local selectChatMembersModule = require(script.Parent.SelectChatMembers)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
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
	navigateToToast = function(_) --[[ line: 63 ]] end,
	selectedUsersChanged = function(_, _) --[[ line: 64 ]] end
}

function SelectChatMembersContainer(p0) --[[ line: 69 ]]
	-- upvalues: cryoModule (ref), t (ref), getSelectedUsersStoreModule (ref), reactModule (ref), signalsModule (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), getFFlagIsSquadEnabled (ref), constantsModule (ref), useFetchPaginatedFriendIdsModule (ref), isUserInConversationModule (ref), useIsInExperienceModule (ref), useAppChatIsWideModeModule (ref), view (ref), selectChatMembersModule (ref)
	local var14 = cryoModule.Dictionary.union(t, p0)
	local var15 = getSelectedUsersStoreModule(false)
	reactModule.useEffect(function() --[[ line: 73 ]]
		-- upvalues: var15 (ref), var14 (ref)
		var15.setMaxSize(var14.maxSelections)
		
		return function() --[[ line: 75 ]]
			-- upvalues: var15 (copy)
			var15.clearStore()
		end
	end, { var14.maxSelections })
	reactModule.useEffect(function() --[[ line: 80 ]]
		-- upvalues: signalsModule (copy), var15 (ref), cryoModule (copy), var14 (ref)
		local var21 = signalsModule.createEffect(function(p1) --[[ line: 81 ]]
			-- upvalues: var15 (copy), cryoModule (copy), var14 (copy)
			var14.selectedUsersChanged(cryoModule.List.map(var15.getSelectedUserIdsArray()(p1), function(p2) --[[ line: 86 ]]
				return { id = p2 }
			end), var14.minSelections)
		end)
		
		return function() --[[ line: 92 ]]
			-- upvalues: var21 (ref)
			var21()
		end
	end, { var14.minSelections })
	local var16 = useLocalization({
		networkErrorText = "Feature.Chat.Response.NetworkError",
		systemButtonText = var14.systemButtonText,
		pageHeaderText = var14.pageHeaderText,
		searchFriendsText = if fFlagConnectionsToFriendsRename then "Feature.Chat.Label.SearchFriends" else "Feature.Chat.Label.SearchConnections",
		tooManyFriendsText = {
			if getFFlagIsSquadEnabled() then if fFlagConnectionsToFriendsRename then "Feature.Chat.Message.AddFriendsPartyLimit" else "Feature.Chat.Message.AddConnectionsPartyLimit" elseif fFlagConnectionsToFriendsRename then "Feature.Chat.Message.AddFriendsLimit" else "Feature.Chat.Message.AddConnectionsLimit",
			friendNum = constantsModule.MAX_PARTICIPANT_COUNT,
			connectionsNum = constantsModule.MAX_PARTICIPANT_COUNT
		},
		tooManyFriendsTextSingular = if getFFlagIsSquadEnabled() then if fFlagConnectionsToFriendsRename then "Feature.Chat.Message.AddFriendsPartyLimitSingular" else "Feature.Chat.Message.AddConnectionsPartyLimitSingular" elseif fFlagConnectionsToFriendsRename then "Feature.Chat.Message.GroupFriendLimitSingular" else "Feature.Chat.Message.GroupConnectionLimitSingular"
	})
	local var17 = reactModule.useCallback(function() --[[ line: 125 ]]
		-- upvalues: var14 (ref), var16 (ref)
		var14.navigateToToast({
			toastProps = {
				toastContent = {
					toastTitle = if var14.canOnlyCreateOneToOneChat then var16.tooManyFriendsTextSingular else var16.tooManyFriendsText
				}
			}
		})
	end, {
		var14.canOnlyCreateOneToOneChat,
		var14.navigateToToast,
		var16
	})
	reactModule.useEffect(function() --[[ line: 131 ]]
		-- upvalues: var15 (ref), var17 (ref)
		local var22 = var15.onMaxSizeExceeded(var17)
		
		return function() --[[ line: 133 ]]
			-- upvalues: var22 (ref)
			var22()
		end
	end, { var17 })
	local var18, var19, var20 = useFetchPaginatedFriendIdsModule()
	
	return reactModule.createElement(view, {
		Size = UDim2.new(1, 0, 1, if not useAppChatIsWideModeModule(useIsInExperienceModule()) then 0 else -56)
	}, {
		SelectMembers = reactModule.createElement(selectChatMembersModule, {
			friendIds = reactModule.useMemo(function() --[[ line: 140 ]]
				-- upvalues: cryoModule (copy), var18 (ref), isUserInConversationModule (copy), var14 (ref)
				return cryoModule.List.filter(var18, function(p3) --[[ line: 141 ]]
					-- upvalues: isUserInConversationModule (copy), var14 (copy)
					return not isUserInConversationModule(p3, var14.conversation)
				end)
			end, { var18, var14.conversation }),
			fetchMoreFriends = reactModule.useCallback(function() --[[ line: 146 ]]
				-- upvalues: var19 (ref), var20 (ref)
				if var19 and not var20 then
					var19()
				end
			end, { var19, var20 }),
			searchFriendsText = var16.searchFriendsText,
			shouldShowSelectChatMembersBar = not var14.canOnlyCreateOneToOneChat,
			conversation = var14.conversation,
			isDebugEnabled = var14.isDebugEnabled
		})
	})
end

return reactModule.memo(SelectChatMembersContainer)