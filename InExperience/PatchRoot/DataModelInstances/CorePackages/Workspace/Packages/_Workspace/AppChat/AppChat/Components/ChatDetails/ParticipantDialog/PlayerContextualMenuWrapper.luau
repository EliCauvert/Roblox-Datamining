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
local var12 = if fFlagAppChatPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil

function PlayerContextualMenuWrapper(p0)
	-- upvalues: useDispatch (ref), responsiveModule (ref), fFlagAppChatPresenceStoreMigrationModule (ref), var12 (ref), useSelector (ref), convertUserPresenceTypeToString (ref), fFlagAppChatMigrateFriendshipStatusesModule (ref), useGetFriendshipStatus (ref), useEffect (ref), networkingFriendsModule (ref), useIsInExperienceModule (ref), appChatDisablePCMExperienceCTAs (ref), reactModule (ref), interactable (ref), component (ref), name (ref), fFlagSkipBlockModal (ref), images (ref)
	local var16
	local var13 = useDispatch()
	local var14 = responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	local _ = nil
	
	if fFlagAppChatPresenceStoreMigrationModule then
		local var15 = var12(p0.participantId)
		var16 = if var15 then {
			locationString = var15.lastLocation,
			locationPlaceId = if var15.placeId ~= "" then nil else var15.placeId,
			locationRootPlaceId = if var15.rootPlaceId ~= "" then nil else var15.rootPlaceId,
			locationUniverseId = if var15.universeId ~= "" then nil else var15.universeId,
			status = var15.userPresenceType
		} else nil
	else
		local participantId = useSelector(function(p1)
			return p1.ChatAppReducer.Presence.byUserId
		end)[p0.participantId]
		var16 = if participantId then {
			locationString = participantId.lastLocation,
			locationPlaceId = participantId.placeId,
			locationRootPlaceId = participantId.rootPlaceId,
			locationUniverseId = participantId.universeId,
			status = convertUserPresenceTypeToString(participantId.userPresenceType)
		} else nil
	end
	local var17
	local _ = nil
	
	if fFlagAppChatMigrateFriendshipStatusesModule then
		var17 = useGetFriendshipStatus(p0.participantId)
	else
		var17 = useSelector(function(p2)
			return p2.ChatAppReducer.Friends.friendshipStatus
		end)[p0.participantId]
		useEffect(function()
			-- upvalues: var13 (ref), networkingFriendsModule (copy), p0 (ref)
			var13(networkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = p0.participantId }))
		end, { p0.participantId })
	end
	return reactModule.createElement(interactable, {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		onStateChanged = function() end,
		Selectable = false,
		[reactModule.Event.Activated] = p0.onDismiss
	}, {
		PCM = reactModule.createElement(component, {
			enableExperienceCTAs = if appChatDisablePCMExperienceCTAs then false elseif useIsInExperienceModule() then false else true,
			subjectPresence = var16,
			subjectUserId = p0.participantId,
			robloxFriendshipStatus = var17,
			closeCentralOverlayThunk = function() end,
			onReportActivated = p0.openReportUser and function()
				-- upvalues: name (copy), p0 (ref)
				name:info("User activated reportUser | userId: {}, conversationId: {}", p0.participantId, p0.conversationId)
				p0.openReportUser(p0.participantId, p0.conversationId)
			end,
			onBlockActivated = p0.openBlockingModal and function()
				-- upvalues: p0 (ref)
				p0.openBlockingModal(p0.participantId, p0.conversationId)
			end,
			skipBlockModal = fFlagSkipBlockModal,
			additionalButtons = if p0.showRemoveUserButton then {
				{
					icon = images["icons/actions/leave"],
					text = p0.removeFromGroupText,
					onActivated = function()
						-- upvalues: p0 (ref)
						p0.openRemoveUserDialog(p0.participantId, p0.conversationId)
					end
				}
			} else nil,
			width = UDim.new(0, if var14 then 300 else 400)
		})
	})
end

return memo(PlayerContextualMenuWrapper)