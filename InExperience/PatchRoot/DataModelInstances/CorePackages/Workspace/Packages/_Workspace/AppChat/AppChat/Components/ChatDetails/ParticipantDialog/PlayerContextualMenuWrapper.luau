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
local appChatDisablePCMExperienceCTAs = game:DefineFastFlag("AppChatDisablePCMExperienceCTAs", false)
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local fFlagSkipBlockModal = sharedFlagsModule.FFlagSkipBlockModal
local var11 = if fFlagAppChatPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil

function PlayerContextualMenuWrapper(p0) --[[ line: 46 ]]
	-- upvalues: useDispatch (ref), responsiveModule (ref), fFlagAppChatPresenceStoreMigrationModule (ref), var11 (ref), useSelector (ref), convertUserPresenceTypeToString (ref), useEffect (ref), networkingFriendsModule (ref), useIsInExperienceModule (ref), appChatDisablePCMExperienceCTAs (ref), reactModule (ref), interactable (ref), component (ref), name (ref), fFlagSkipBlockModal (ref), images (ref)
	local var15
	local var12 = useDispatch()
	local var13 = responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	local _ = nil
	
	if fFlagAppChatPresenceStoreMigrationModule then
		local var14 = var11(p0.participantId)
		var15 = if var14 then {
			locationString = var14.lastLocation,
			locationPlaceId = if var14.placeId ~= "" then nil else var14.placeId,
			locationRootPlaceId = if var14.rootPlaceId ~= "" then nil else var14.rootPlaceId,
			locationUniverseId = if var14.universeId ~= "" then nil else var14.universeId,
			status = var14.userPresenceType
		} else nil
	else
		local participantId = useSelector(function(p1) --[[ line: 66 ]]
			return p1.ChatAppReducer.Presence.byUserId
		end)[p0.participantId]
		var15 = if participantId then {
			locationString = participantId.lastLocation,
			locationPlaceId = participantId.placeId,
			locationRootPlaceId = participantId.rootPlaceId,
			locationUniverseId = participantId.universeId,
			status = convertUserPresenceTypeToString(participantId.userPresenceType)
		} else nil
	end
	local participantId = useSelector(function(p2) --[[ line: 82 ]]
		return p2.ChatAppReducer.Friends.friendshipStatus
	end)[p0.participantId]
	useEffect(function() --[[ line: 87 ]]
		-- upvalues: var12 (ref), networkingFriendsModule (copy), p0 (ref)
		var12(networkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = p0.participantId }))
	end, { p0.participantId })
	
	return reactModule.createElement(interactable, {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		onStateChanged = function() --[[ line: 101 ]] end,
		Selectable = false,
		[reactModule.Event.Activated] = p0.onDismiss
	}, {
		PCM = reactModule.createElement(component, {
			enableExperienceCTAs = if appChatDisablePCMExperienceCTAs then false elseif useIsInExperienceModule() then false else true,
			subjectPresence = var15,
			subjectUserId = p0.participantId,
			robloxFriendshipStatus = participantId,
			closeCentralOverlayThunk = function() --[[ line: 110 ]] end,
			onReportActivated = p0.openReportUser and function() --[[ line: 111 ]]
				-- upvalues: name (copy), p0 (ref)
				name:info("User activated reportUser | userId: {}, conversationId: {}", p0.participantId, p0.conversationId)
				p0.openReportUser(p0.participantId, p0.conversationId)
			end,
			onBlockActivated = p0.openBlockingModal and function() --[[ line: 120 ]]
				-- upvalues: p0 (ref)
				p0.openBlockingModal(p0.participantId, p0.conversationId)
			end,
			skipBlockModal = fFlagSkipBlockModal,
			additionalButtons = if p0.showRemoveUserButton then {
				{
					icon = images["icons/actions/leave"],
					text = p0.removeFromGroupText,
					onActivated = function() --[[ line: 131 ]]
						-- upvalues: p0 (ref)
						p0.openRemoveUserDialog(p0.participantId, p0.conversationId)
					end
				}
			} else nil,
			width = UDim.new(0, if var13 then 300 else 400)
		})
	})
end

return memo(PlayerContextualMenuWrapper)