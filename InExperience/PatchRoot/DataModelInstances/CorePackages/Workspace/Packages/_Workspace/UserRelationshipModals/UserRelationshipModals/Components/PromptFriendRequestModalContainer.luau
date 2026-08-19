local playersService = game:GetService("Players")
local userRelationshipModals = script:FindFirstAncestor("UserRelationshipModals")
local parent = userRelationshipModals.Parent
local reactModule = require(parent.React)
local useEffect = reactModule.useEffect
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local userProfilesModule = require(parent.UserProfiles)
local myFriendsNetworkingModule = require(userRelationshipModals.Networking.myFriendsNetworking)
local friendshipOriginSourceType = require(parent.FriendsNetworking).Enums.FriendshipOriginSourceType
local fFlagMigrateFriendshipStatusesRemainingActions = require(parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local var7 = require(parent.DataHydration).Friends.FriendsStore.get()
local enums = require(parent.DataHydration).Friends.Enums
local analyticsModule = require(userRelationshipModals.Analytics)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local promptFriendRequestModalModule = require(script.Parent.PromptFriendRequestModal)

function triggerToast(p0) --[[ line: 34 ]]
	-- upvalues: notificationModalsManagerModule (ref)
	notificationModalsManagerModule.SetUIBloxToast({
		toastTitle = p0,
		sequenceNumber = DateTime.now().UnixTimestamp
	})
end

local var11 = userProfilesModule.Stores.UserProfileStore.get()

return function(p1) --[[ line: 49 | named "PromptFriendRequestModalContainer" ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), analyticsModule (ref), useEffect (ref), useLocalization (ref), reactModule (ref), signalsModule (ref), var11 (ref), signalsReactModule (ref), playersService (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var7 (ref), enums (ref), myFriendsNetworkingModule (ref), friendshipOriginSourceType (ref), promptFriendRequestModalModule (ref)
	local var12 = useDispatch()
	local var13 = useLocalUserId()
	local fireAnalyticsEvent = analyticsModule.useUserRelationshipModalAnalytics(analyticsModule.RelationshipTypes.Friends, tonumber(var13) or 0, p1.userId).fireAnalyticsEvent
	useEffect(function() --[[ line: 59 ]]
		-- upvalues: fireAnalyticsEvent (ref), analyticsModule (copy)
		fireAnalyticsEvent(analyticsModule.EventNames.ModalSeen)
	end, { fireAnalyticsEvent })
	local var14 = useLocalization({
		friendRequestSent = "Feature.Friends.Action.FriendRequestSent",
		somethingWentWrong = "CommonUI.Messages.Response.SomethingWentWrong"
	})
	local var15 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 68 ]]
		-- upvalues: signalsModule (copy), var11 (copy), p1 (ref)
		return signalsModule.createComputed(function(p2) --[[ line: 69 ]]
			-- upvalues: var11 (copy), p1 (copy)
			local var16 = var11.fetchNamesByUserIds({ tostring(p1.userId) })(p2)
			local var17 = var16 and (var16.data and var16.data[1])
			local names = var17 and var17.names
			
			return {
				combinedName = if names then names.getCombinedName(p2) else "",
				username = if names then names.getUsername() else ""
			}
		end)
	end, { p1.userId }))
	
	return reactModule.createElement(promptFriendRequestModalModule, {
		userId = p1.userId,
		displayName = var15.combinedName,
		username = var15.username,
		onClose = function() --[[ line: 133 ]]
			-- upvalues: fireAnalyticsEvent (ref), analyticsModule (copy), p1 (ref)
			fireAnalyticsEvent(analyticsModule.EventNames.ModalClosed)
			p1.onClose()
		end,
		onSendClicked = reactModule.useCallback(function() --[[ line: 83 ]]
			-- upvalues: fireAnalyticsEvent (ref), analyticsModule (copy), playersService (copy), p1 (ref), var14 (ref), fFlagMigrateFriendshipStatusesRemainingActions (copy), var7 (copy), enums (copy), var12 (ref), myFriendsNetworkingModule (copy), var13 (ref), friendshipOriginSourceType (copy)
			fireAnalyticsEvent(analyticsModule.EventNames.CreateActionPressed)
			local userIdPlayerByUserId = playersService:GetPlayerByUserId(p1.userId)
			
			if playersService.LocalPlayer == nil or userIdPlayerByUserId == nil then
				(if fFlagMigrateFriendshipStatusesRemainingActions then var7.RequestFriendship(tostring(p1.userId), enums.FriendshipOriginSourceType.InGame) else var12(myFriendsNetworkingModule.RequestFriendshipFromUserId.API({
					currentUserId = var13,
					targetUserId = tostring(p1.userId),
					friendshipOriginSourceType = friendshipOriginSourceType.InGame.rawValue()
				}))):andThen(function() --[[ line: 109 ]]
					-- upvalues: var14 (copy)
					triggerToast(var14.friendRequestSent)
				end):catch(function(_) --[[ line: 112 ]]
					-- upvalues: var14 (copy)
					triggerToast(var14.somethingWentWrong)
				end)
			else
				local ok, _ = pcall(function() --[[ line: 93 ]]
					-- upvalues: playersService (copy), userIdPlayerByUserId (ref)
					playersService.LocalPlayer:RequestFriendship(userIdPlayerByUserId)
				end)
				triggerToast(if ok then var14.friendRequestSent else var14.somethingWentWrong)
			end
			p1.onClose()
		end, {
			var13, p1.userId, var12, p1.onClose, var14.friendRequestSent,
			var14.somethingWentWrong, fireAnalyticsEvent
		}),
		inputDelay = p1.inputDelay
	})
end