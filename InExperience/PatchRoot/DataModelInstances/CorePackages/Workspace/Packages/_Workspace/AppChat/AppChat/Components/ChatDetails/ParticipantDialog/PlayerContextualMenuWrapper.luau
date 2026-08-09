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
local fFlagSkipBlockModal = sharedFlagsModule.FFlagSkipBlockModal

function PlayerContextualMenuWrapper(p0) --[[ line: 41 ]]
	-- upvalues: useDispatch (ref), responsiveModule (ref), useSelector (ref), useEffect (ref), networkingFriendsModule (ref), useIsInExperienceModule (ref), appChatDisablePCMExperienceCTAs (ref), reactModule (ref), interactable (ref), component (ref), convertUserPresenceTypeToString (ref), name (ref), fFlagSkipBlockModal (ref), images (ref)
	local var10 = useDispatch()
	local var11 = responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	local participantId = useSelector(function(p1) --[[ line: 45 ]]
		return p1.ChatAppReducer.Presence.byUserId
	end)[p0.participantId]
	local participantId_1 = useSelector(function(p2) --[[ line: 50 ]]
		return p2.ChatAppReducer.Friends.friendshipStatus
	end)[p0.participantId]
	useEffect(function() --[[ line: 55 ]]
		-- upvalues: var10 (ref), networkingFriendsModule (copy), p0 (ref)
		var10(networkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = p0.participantId }))
	end, { p0.participantId })
	
	return reactModule.createElement(interactable, {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		onStateChanged = function() --[[ line: 69 ]] end,
		Selectable = false,
		[reactModule.Event.Activated] = p0.onDismiss
	}, {
		PCM = reactModule.createElement(component, {
			enableExperienceCTAs = if appChatDisablePCMExperienceCTAs then false elseif useIsInExperienceModule() then false else true,
			subjectPresence = if participantId then {
				locationString = participantId.lastLocation,
				locationPlaceId = participantId.placeId,
				locationRootPlaceId = participantId.rootPlaceId,
				locationUniverseId = participantId.universeId,
				status = convertUserPresenceTypeToString(participantId.userPresenceType)
			} else nil,
			subjectUserId = p0.participantId,
			robloxFriendshipStatus = participantId_1,
			closeCentralOverlayThunk = function() --[[ line: 86 ]] end,
			onReportActivated = p0.openReportUser and function() --[[ line: 87 ]]
				-- upvalues: name (copy), p0 (ref)
				name:info("User activated reportUser | userId: {}, conversationId: {}", p0.participantId, p0.conversationId)
				p0.openReportUser(p0.participantId, p0.conversationId)
			end,
			onBlockActivated = p0.openBlockingModal and function() --[[ line: 96 ]]
				-- upvalues: p0 (ref)
				p0.openBlockingModal(p0.participantId, p0.conversationId)
			end,
			skipBlockModal = fFlagSkipBlockModal,
			additionalButtons = if p0.showRemoveUserButton then {
				{
					icon = images["icons/actions/leave"],
					text = p0.removeFromGroupText,
					onActivated = function() --[[ line: 107 ]]
						-- upvalues: p0 (ref)
						p0.openRemoveUserDialog(p0.participantId, p0.conversationId)
					end
				}
			} else nil,
			width = UDim.new(0, if var11 then 300 else 400)
		})
	})
end

return memo(PlayerContextualMenuWrapper)