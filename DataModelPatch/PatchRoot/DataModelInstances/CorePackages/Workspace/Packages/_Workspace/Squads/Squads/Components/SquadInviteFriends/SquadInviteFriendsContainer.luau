local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local DependenciesModule = require(Squads.dependencies)
local SquadInviteSourceEnumModule = require(Squads.Enums.SquadInviteSourceEnum)
local InviteToSquadModule = require(Squads.Thunks.inviteToSquad)
local InviteToParentChannelModule = require(Squads.Thunks.InviteToParentChannel)
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local PromiseModule = require(Parent.Promise)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local Cryo = DependenciesModule.Cryo
local React = DependenciesModule.React
local UseCurrentSquadSelectorFunction = DependenciesModule.Hooks.useCurrentSquadSelector
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local ConstantsModule = require(Parent.SquadsCore.Constants)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadPromptType = require(Parent.SquadsCore.Enums).SquadPromptType
local UseNavigationFunction = DependenciesModule.useNavigation
local UseStoreFunction = DependenciesModule.Hooks.useStore
local Images = require(Parent.UIBlox).App.ImageSet.Images
local SquadInviteFriendsModule = require(script.Parent.SquadInviteFriends)

return function(p1)
	-- upvalues: React (copy), SquadExternalContractContext (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), UseStoreFunction (copy), UseLocalizationFunction (copy), UseCurrentSquadSelectorFunction (copy), UseLocalUserIdFunction (copy), UseAppPolicyFunction (copy), Cryo (copy), NotificationModalsManagerModule (copy), Images (copy), SquadInviteSourceEnumModule (copy), EventNamesModule (copy), PromiseModule (copy), InviteToParentChannelModule (copy), InviteToSquadModule (copy), ConstantsModule (copy), SquadPromptType (copy), SquadInviteFriendsModule (copy)
	local UseContextResult = React.useContext(SquadExternalContractContext)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseStoreResult = UseStoreFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		addText = "Feature.Squads.Action.Add",
		user = "Feature.Squads.Description.User",
		youAddedMoreThanTwoToChat = "Feature.Squads.Description.YouAddedMoreThanTwoToChat",
		youAddedToChat = "Feature.Squads.Description.YouAddedToChat",
		youAddedTwoToChat = "Feature.Squads.Description.YouAddedTwoToChat"
	})
	local UseRefResult = React.useRef(false)
	local UseCurrentSquadSelectorResult = UseCurrentSquadSelectorFunction()
	local ParentChannelId = if UseCurrentSquadSelectorResult and UseCurrentSquadSelectorResult.parentChannelId then UseCurrentSquadSelectorResult.parentChannelId else ""
	local UseGetConversationFromIdResult = UseContextResult.useGetConversationFromId(ParentChannelId)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseAppPolicyResult = UseAppPolicyFunction((React.useCallback(function(p2)
		return p2.getCanUsePlatformChat()
	end, {})))
	local UseResult = React.useCallback(function(p2)
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
	local UseResult1 = React.useCallback(function(p2)
		-- upvalues: Cryo (upval), ParentChannelId (copy), SquadInviteSourceEnumModule (upval), UseContextResult (copy), EventNamesModule (upval)
		UseContextResult.fireSquadAnalytics(EventNamesModule.SquadInvite, (Cryo.Dictionary.union({
			parentChannelId = ParentChannelId,
			source = SquadInviteSourceEnumModule.SourceSquadInvitePage
		}, p2)))
	end, { ParentChannelId, UseContextResult.fireSquadAnalytics })
	
	return React.createElement(SquadInviteFriendsModule, {
		participants = p1.participants,
		onMultiInvite = React.useCallback(function(p2)
			-- upvalues: UseCurrentSquadSelectorResult (copy), UseGetConversationFromIdResult (copy), Cryo (upval), UseLocalUserIdResult (copy), UseContextResult (copy), UseDispatchResult (copy), PromiseModule (upval), InviteToParentChannelModule (upval), UseNavigationResult (copy), InviteToSquadModule (upval), UseResult1 (copy), UseResult (copy), ConstantsModule (upval), UseStoreResult (copy), SquadPromptType (upval), UseAppPolicyResult (copy)
			if not UseCurrentSquadSelectorResult or not UseGetConversationFromIdResult then return end
			local KeysResult = Cryo.Dictionary.keys(p2)
			local Set = Cryo.List.toSet(UseGetConversationFromIdResult.participants)
			local FilterResult = Cryo.List.filter(KeysResult, function(p3): boolean
				-- upvalues: Set (copy)
				return Set[p3] == nil
			end)
			
			local function v34()
				-- upvalues: Cryo (upval), UseGetConversationFromIdResult (upval), KeysResult (copy), UseLocalUserIdResult (upval), UseContextResult (upval), UseDispatchResult (upval), PromiseModule (upval), FilterResult (copy), InviteToParentChannelModule (upval), UseNavigationResult (upval), InviteToSquadModule (upval), UseCurrentSquadSelectorResult (upval), UseResult1 (upval), UseResult (upval), p2 (copy)
				local FilterResult1 = Cryo.List.filter(UseGetConversationFromIdResult.participants, function(p3): boolean
					-- upvalues: Cryo (upval), KeysResult (upval), UseLocalUserIdResult (upval)
					return Cryo.List.find(KeysResult, (tostring(p3))) == nil and p3 ~= UseLocalUserIdResult
				end)
				local List = {}
				
				if #FilterResult1 > 0 then
					for _, value in ipairs(FilterResult1) do
						table.insert(List, UseContextResult.removeUserFromParentChannel(UseDispatchResult, UseGetConversationFromIdResult.id, value))
					end
				end
				PromiseModule.all(List):andThen(function()
					-- upvalues: FilterResult (upval), UseDispatchResult (upval), InviteToParentChannelModule (upval), FilterResult1 (copy), UseNavigationResult (upval), UseGetConversationFromIdResult (upval), InviteToSquadModule (upval), UseCurrentSquadSelectorResult (upval), UseLocalUserIdResult (upval), UseResult1 (upval), UseResult (upval), p2 (upval), UseContextResult (upval)
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
								-- upvalues: UseGetConversationFromIdResult (upval), UseDispatchResult (upval), InviteToSquadModule (upval), UseCurrentSquadSelectorResult (upval), UseLocalUserIdResult (upval), FilterResult (upval), UseResult1 (upval), UseResult (upval), p2 (upval), UseNavigationResult (upval)
								UseDispatchResult(InviteToSquadModule(UseCurrentSquadSelectorResult.squadId, Id, UseLocalUserIdResult, FilterResult, UseResult1, Id ~= UseGetConversationFromIdResult.id))
								UseResult(p2)
								UseNavigationResult.pop()
							end,
							parentChannel = UseGetConversationFromIdResult,
							userIds = FilterResult,
							squadExternalContext = UseContextResult
						}))
						
						return
					else
						UseNavigationResult.pop()
					end
				end)
			end
			
			if UseGetConversationFromIdResult.type == ConstantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and UseGetConversationFromIdResult.moderationType == ConstantsModule.TRUSTED_COMM_MODERATION_TYPE then
				UseContextResult.setSquadPrompt(UseStoreResult, {
					hideCancelButton = true,
					promptType = SquadPromptType.CannotExpandToGroupChatActiveParty,
					onConfirm = function()
						-- upvalues: UseNavigationResult (upval)
						UseNavigationResult.pop()
					end
				})
				
				return
			end
			if UseGetConversationFromIdResult.type == ConstantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and UseAppPolicyResult and #FilterResult > 0 then
				UseContextResult.setSquadPrompt(UseStoreResult, {
					hideCancelButton = false,
					promptType = SquadPromptType.ConfirmInviteToSquad,
					onConfirm = function()
						-- upvalues: v34 (copy)
						v34()
					end
				})
				
				return
			else
				v34()
			end
		end, {
			UseCurrentSquadSelectorResult, UseDispatchResult, UseNavigationResult,
			UseGetConversationFromIdResult, UseResult1, UseResult,
			UseContextResult.setSquadPrompt, UseContextResult.inviteToParentChannel,
			UseStoreResult, UseAppPolicyResult, UseLocalUserIdResult, UseContextResult
		}),
		buttonText = UseLocalizationResult.addText,
		analyticsInfo = { selectionPageType = "SquadInvite" },
		partyStartedRef = UseRefResult,
		onRemoveCallback = if UseGetConversationFromIdResult then function(p3, p4)
			-- upvalues: Cryo (upval), UseGetConversationFromIdResult (copy), UseContextResult (copy), UseStoreResult (copy), UseLocalizationResult (copy), SquadPromptType (upval)
			if Cryo.List.find(UseGetConversationFromIdResult.participants, p3) then
				UseContextResult.setSquadPrompt(UseStoreResult, {
					hideCancelButton = true,
					bodyTextLocalizationProps = { displayName = p4 or UseLocalizationResult.user },
					promptType = SquadPromptType.RemoveFromParty
				})
			end
		end else nil,
		preselectedUsers = UseGetConversationFromIdResult and (UseGetConversationFromIdResult.participants and Cryo.List.filter(UseGetConversationFromIdResult.participants, function(p3): boolean
			-- upvalues: UseLocalUserIdResult (copy)
			return p3 ~= UseLocalUserIdResult
		end)),
		preselectedUsersUnremovable = if UseGetConversationFromIdResult then UseGetConversationFromIdResult.type == ConstantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE or UseGetConversationFromIdResult.initiator ~= tostring(UseLocalUserIdResult) else nil,
		onSelectedFriendsChanged = p1.onSelectedFriendsChanged,
		shouldHideFooterButton = p1.shouldHideFooterButton
	})
end