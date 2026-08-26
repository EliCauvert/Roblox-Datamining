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
	navigateToToast = function(_) end,
	selectedUsersChanged = function(_, _) end
}

function SelectChatMembersContainer(p1)
	-- upvalues: cryoModule (ref), t (ref), getSelectedUsersStoreModule (ref), fFlagFixPaginatedChatMembersCutoffModule (ref), useNavigation (ref), reactModule (ref), signalsModule (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), getFFlagIsSquadEnabled (ref), constantsModule (ref), useFetchPaginatedFriendIdsModule (ref), isUserInConversationModule (ref), useIsInExperienceModule (ref), useAppChatIsWideModeModule (ref), view (ref), selectChatMembersModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = getSelectedUsersStoreModule(false)
	local var3 = if fFlagFixPaginatedChatMembersCutoffModule then useNavigation().getScreenProps("topBarHeight", 0) else nil
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var1 (ref)
		var2.setMaxSize(var1.maxSelections)
		
		return function()
			-- upvalues: var2 (copy)
			var2.clearStore()
		end
	end, { var1.maxSelections })
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var2 (ref), cryoModule (copy), var1 (ref)
		local var4 = signalsModule.createEffect(function(p2)
			-- upvalues: var2 (copy), cryoModule (copy), var1 (copy)
			var1.selectedUsersChanged(cryoModule.List.map(var2.getSelectedUserIdsArray()(p2), function(p3)
				return { id = p3 }
			end), var1.minSelections)
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4()
		end
	end, { var1.minSelections })
	local var4 = useLocalization({
		networkErrorText = "Feature.Chat.Response.NetworkError",
		systemButtonText = var1.systemButtonText,
		pageHeaderText = var1.pageHeaderText,
		searchFriendsText = if fFlagConnectionsToFriendsRename then "Feature.Chat.Label.SearchFriends" else "Feature.Chat.Label.SearchConnections",
		tooManyFriendsText = {
			if getFFlagIsSquadEnabled() then if fFlagConnectionsToFriendsRename then "Feature.Chat.Message.AddFriendsPartyLimit" else "Feature.Chat.Message.AddConnectionsPartyLimit" elseif fFlagConnectionsToFriendsRename then "Feature.Chat.Message.AddFriendsLimit" else "Feature.Chat.Message.AddConnectionsLimit",
			friendNum = constantsModule.MAX_PARTICIPANT_COUNT,
			connectionsNum = constantsModule.MAX_PARTICIPANT_COUNT
		},
		tooManyFriendsTextSingular = if getFFlagIsSquadEnabled() then if fFlagConnectionsToFriendsRename then "Feature.Chat.Message.AddFriendsPartyLimitSingular" else "Feature.Chat.Message.AddConnectionsPartyLimitSingular" elseif fFlagConnectionsToFriendsRename then "Feature.Chat.Message.GroupFriendLimitSingular" else "Feature.Chat.Message.GroupConnectionLimitSingular"
	})
	local var5 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), var4 (ref)
		var1.navigateToToast({
			toastProps = {
				toastContent = {
					toastTitle = if var1.canOnlyCreateOneToOneChat then var4.tooManyFriendsTextSingular else var4.tooManyFriendsText
				}
			}
		})
	end, {
		var1.canOnlyCreateOneToOneChat,
		var1.navigateToToast,
		var4
	})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var5 (ref)
		local var6 = var2.onMaxSizeExceeded(var5)
		
		return function()
			-- upvalues: var6 (ref)
			var6()
		end
	end, { var5 })
	local var6, var7, var8 = useFetchPaginatedFriendIdsModule()
	
	return reactModule.createElement(view, {
		Size = UDim2.new(1, 0, 1, if not useAppChatIsWideModeModule(useIsInExperienceModule()) then 0 else -(if fFlagFixPaginatedChatMembersCutoffModule then var3 else 56))
	}, {
		SelectMembers = reactModule.createElement(selectChatMembersModule, {
			friendIds = reactModule.useMemo(function()
				-- upvalues: cryoModule (copy), var6 (ref), isUserInConversationModule (copy), var1 (ref)
				return cryoModule.List.filter(var6, function(p2)
					-- upvalues: isUserInConversationModule (copy), var1 (copy)
					return not isUserInConversationModule(p2, var1.conversation)
				end)
			end, { var6, var1.conversation }),
			fetchMoreFriends = reactModule.useCallback(function()
				-- upvalues: var7 (ref), var8 (ref)
				if var7 and not var8 then
					var7()
				end
			end, { var7, var8 }),
			searchFriendsText = var4.searchFriendsText,
			shouldShowSelectChatMembersBar = not var1.canOnlyCreateOneToOneChat,
			conversation = var1.conversation,
			isDebugEnabled = var1.isDebugEnabled
		})
	})
end

return reactModule.memo(SelectChatMembersContainer)