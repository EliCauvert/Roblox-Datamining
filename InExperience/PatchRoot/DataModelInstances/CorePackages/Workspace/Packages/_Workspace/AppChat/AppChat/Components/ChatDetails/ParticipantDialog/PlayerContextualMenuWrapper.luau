local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local component = require(parent.PlayerContextualMenu).Component
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local socialCommonModule = require(parent.SocialCommon)
local UIBloxModule = require(parent.UIBlox)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local responsiveModule = require(parent.Responsive)
local memo = reactModule.memo
local convertUserPresenceTypeToString = socialCommonModule.Utils.convertUserPresenceTypeToString
local images = UIBloxModule.App.ImageSet.Images
local interactable = UIBloxModule.Core.Control.Interactable
local useEffect = reactModule.useEffect
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local name = require(appChat.Logger):new(script.Name)
local networkingFriendsModule = require(appChat.Http.NetworkingFriends)
local _ = require(appChat.types)
local useGetFriendshipStatus = require(parent.FriendsHydrationReact).useGetFriendshipStatus
local appChatDisablePCMExperienceCTAs = game:DefineFastFlag("AppChatDisablePCMExperienceCTAs", false)
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local fFlagAppChatMigrateFriendshipStatusesModule = require(appChat.Flags.FFlagAppChatMigrateFriendshipStatuses)
local fFlagSkipBlockModal = sharedFlagsModule.FFlagSkipBlockModal
local var1 = if fFlagAppChatPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil

function PlayerContextualMenuWrapper(p1)
	-- upvalues: useDispatch (ref), responsiveModule (ref), fFlagAppChatPresenceStoreMigrationModule (ref), var1 (ref), useSelector (ref), convertUserPresenceTypeToString (ref), fFlagAppChatMigrateFriendshipStatusesModule (ref), useGetFriendshipStatus (ref), useEffect (ref), networkingFriendsModule (ref), useIsInExperienceModule (ref), appChatDisablePCMExperienceCTAs (ref), reactModule (ref), interactable (ref), component (ref), name (ref), fFlagSkipBlockModal (ref), images (ref)
	local var2
	local var3 = useDispatch()
	local var4 = responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	local _ = nil
	
	if fFlagAppChatPresenceStoreMigrationModule then
		local var5 = var1(p1.participantId)
		var2 = if var5 then {
			locationString = var5.lastLocation,
			locationPlaceId = if var5.placeId ~= "" then nil else var5.placeId,
			locationRootPlaceId = if var5.rootPlaceId ~= "" then nil else var5.rootPlaceId,
			locationUniverseId = if var5.universeId ~= "" then nil else var5.universeId,
			status = var5.userPresenceType
		} else nil
	else
		local participantId = useSelector(function(p2)
			return p2.ChatAppReducer.Presence.byUserId
		end)[p1.participantId]
		var2 = if participantId then {
			locationString = participantId.lastLocation,
			locationPlaceId = participantId.placeId,
			locationRootPlaceId = participantId.rootPlaceId,
			locationUniverseId = participantId.universeId,
			status = convertUserPresenceTypeToString(participantId.userPresenceType)
		} else nil
	end
	local var6
	local _ = nil
	
	if fFlagAppChatMigrateFriendshipStatusesModule then
		var6 = useGetFriendshipStatus(p1.participantId)
	else
		var6 = useSelector(function(p2)
			return p2.ChatAppReducer.Friends.friendshipStatus
		end)[p1.participantId]
		useEffect(function()
			-- upvalues: var3 (ref), networkingFriendsModule (copy), p1 (ref)
			var3(networkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = p1.participantId }))
		end, { p1.participantId })
	end
	return reactModule.createElement(interactable, {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		onStateChanged = function() end,
		Selectable = false,
		[reactModule.Event.Activated] = p1.onDismiss
	}, {
		PCM = reactModule.createElement(component, {
			enableExperienceCTAs = if appChatDisablePCMExperienceCTAs then false elseif useIsInExperienceModule() then false else true,
			subjectPresence = var2,
			subjectUserId = p1.participantId,
			robloxFriendshipStatus = var6,
			closeCentralOverlayThunk = function() end,
			onReportActivated = p1.openReportUser and function()
				-- upvalues: name (copy), p1 (ref)
				name:info("User activated reportUser | userId: {}, conversationId: {}", p1.participantId, p1.conversationId)
				p1.openReportUser(p1.participantId, p1.conversationId)
			end,
			onBlockActivated = p1.openBlockingModal and function()
				-- upvalues: p1 (ref)
				p1.openBlockingModal(p1.participantId, p1.conversationId)
			end,
			skipBlockModal = fFlagSkipBlockModal,
			additionalButtons = if p1.showRemoveUserButton then {
				{
					icon = images["icons/actions/leave"],
					text = p1.removeFromGroupText,
					onActivated = function()
						-- upvalues: p1 (ref)
						p1.openRemoveUserDialog(p1.participantId, p1.conversationId)
					end
				}
			} else nil,
			width = UDim.new(0, if var4 then 300 else 400)
		})
	})
end

return memo(PlayerContextualMenuWrapper)