local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local Component = require(Parent.PlayerContextualMenu).Component
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ResponsiveModule = require(Parent.Responsive)
local MemoFunction = ReactModule.memo
local ConvertUserPresenceTypeToStringFunction = require(Parent.SocialCommon).Utils.convertUserPresenceTypeToString
local Images = UIBloxModule.App.ImageSet.Images
local Interactable = UIBloxModule.Core.Control.Interactable
local UseEffectFunction = ReactModule.useEffect
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local NewResult = require(AppChat.Logger):new(script.Name)
local NetworkingFriendsModule = require(AppChat.Http.NetworkingFriends)
local _ = require(AppChat.types)
local UseGetFriendshipStatusFunction = require(Parent.FriendsHydrationReact).useGetFriendshipStatus
local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)
local FFlagAppChatMigrateFriendshipStatusesModule = require(AppChat.Flags.FFlagAppChatMigrateFriendshipStatuses)
local FFlagSkipBlockModal = require(Parent.SharedFlags).FFlagSkipBlockModal
local UseGetPresenceByUserId = if FFlagAppChatPresenceStoreMigrationModule then require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil

function PlayerContextualMenuWrapper(p1)
	-- upvalues: UseDispatchFunction (copy), ResponsiveModule (copy), FFlagAppChatPresenceStoreMigrationModule (copy), UseGetPresenceByUserId (copy), UseSelectorFunction (copy), ConvertUserPresenceTypeToStringFunction (copy), FFlagAppChatMigrateFriendshipStatusesModule (copy), UseGetFriendshipStatusFunction (copy), UseEffectFunction (copy), NetworkingFriendsModule (copy), UseIsInExperienceModule (copy), ReactModule (copy), Interactable (copy), Component (copy), NewResult (copy), FFlagSkipBlockModal (copy), Images (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseBreakpointXOrSmallerResult = ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.Keys.Small)
	local Config = nil
	
	if FFlagAppChatPresenceStoreMigrationModule then
		local UseGetPresenceByUserIdResult = UseGetPresenceByUserId(p1.participantId)
		Config = if UseGetPresenceByUserIdResult then {
			locationString = UseGetPresenceByUserIdResult.lastLocation,
			locationPlaceId = if UseGetPresenceByUserIdResult.placeId == "" then nil else UseGetPresenceByUserIdResult.placeId,
			locationRootPlaceId = if UseGetPresenceByUserIdResult.rootPlaceId == "" then nil else UseGetPresenceByUserIdResult.rootPlaceId,
			locationUniverseId = if UseGetPresenceByUserIdResult.universeId == "" then nil else UseGetPresenceByUserIdResult.universeId,
			status = UseGetPresenceByUserIdResult.userPresenceType
		} else nil
	else
		local UseSelectorResultEntry = UseSelectorFunction(function(p2)
			return p2.ChatAppReducer.Presence.byUserId
		end)[p1.participantId]
		Config = if UseSelectorResultEntry then {
			locationString = UseSelectorResultEntry.lastLocation,
			locationPlaceId = UseSelectorResultEntry.placeId,
			locationRootPlaceId = UseSelectorResultEntry.rootPlaceId,
			locationUniverseId = UseSelectorResultEntry.universeId,
			status = ConvertUserPresenceTypeToStringFunction(UseSelectorResultEntry.userPresenceType)
		} else nil
	end
	local UseGetFriendshipStatusResult = nil
	if FFlagAppChatMigrateFriendshipStatusesModule then
		UseGetFriendshipStatusResult = UseGetFriendshipStatusFunction(p1.participantId)
	else
		UseGetFriendshipStatusResult = UseSelectorFunction(function(p2)
			return p2.ChatAppReducer.Friends.friendshipStatus
		end)[p1.participantId]
		UseEffectFunction(function()
			-- upvalues: UseDispatchResult (copy), NetworkingFriendsModule (upval), p1 (copy)
			UseDispatchResult(NetworkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = p1.participantId }))
		end, { p1.participantId })
	end
	return ReactModule.createElement(Interactable, {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		onStateChanged = function() end,
		Selectable = false,
		[ReactModule.Event.Activated] = p1.onDismiss
	}, {
		PCM = ReactModule.createElement(Component, {
			enableExperienceCTAs = not UseIsInExperienceModule(),
			subjectPresence = Config,
			subjectUserId = p1.participantId,
			robloxFriendshipStatus = UseGetFriendshipStatusResult,
			closeCentralOverlayThunk = function() end,
			onReportActivated = p1.openReportUser and function()
				-- upvalues: NewResult (upval), p1 (copy)
				NewResult:info("User activated reportUser | userId: {}, conversationId: {}", p1.participantId, p1.conversationId)
				p1.openReportUser(p1.participantId, p1.conversationId)
			end,
			onBlockActivated = p1.openBlockingModal and function()
				-- upvalues: p1 (copy)
				p1.openBlockingModal(p1.participantId, p1.conversationId)
			end,
			skipBlockModal = FFlagSkipBlockModal,
			additionalButtons = if p1.showRemoveUserButton then {
				{
					icon = Images["icons/actions/leave"],
					text = p1.removeFromGroupText,
					onActivated = function()
						-- upvalues: p1 (copy)
						p1.openRemoveUserDialog(p1.participantId, p1.conversationId)
					end
				}
			} else nil,
			width = UDim.new(0, if UseBreakpointXOrSmallerResult then 300 else 400)
		})
	})
end

return MemoFunction(PlayerContextualMenuWrapper)