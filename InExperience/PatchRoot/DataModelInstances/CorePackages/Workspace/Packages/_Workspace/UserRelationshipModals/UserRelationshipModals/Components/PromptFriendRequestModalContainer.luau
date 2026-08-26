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
local var1 = require(parent.DataHydration).Friends.FriendsStore.get()
local enums = require(parent.DataHydration).Friends.Enums
local analyticsModule = require(userRelationshipModals.Analytics)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local promptFriendRequestModalModule = require(script.Parent.PromptFriendRequestModal)

function triggerToast(p1)
	-- upvalues: notificationModalsManagerModule (ref)
	notificationModalsManagerModule.SetUIBloxToast({
		toastTitle = p1,
		sequenceNumber = DateTime.now().UnixTimestamp
	})
end

local var2 = userProfilesModule.Stores.UserProfileStore.get()

return function(p1)
	-- upvalues: useDispatch (ref), useLocalUserId (ref), analyticsModule (ref), useEffect (ref), useLocalization (ref), reactModule (ref), signalsModule (ref), var2 (ref), signalsReactModule (ref), playersService (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var1 (ref), enums (ref), myFriendsNetworkingModule (ref), friendshipOriginSourceType (ref), promptFriendRequestModalModule (ref)
	local var3 = useDispatch()
	local var4 = useLocalUserId()
	local fireAnalyticsEvent = analyticsModule.useUserRelationshipModalAnalytics(analyticsModule.RelationshipTypes.Friends, tonumber(var4) or 0, p1.userId).fireAnalyticsEvent
	useEffect(function()
		-- upvalues: fireAnalyticsEvent (ref), analyticsModule (copy)
		fireAnalyticsEvent(analyticsModule.EventNames.ModalSeen)
	end, { fireAnalyticsEvent })
	local var5 = useLocalization({
		friendRequestSent = "Feature.Friends.Action.FriendRequestSent",
		somethingWentWrong = "CommonUI.Messages.Response.SomethingWentWrong"
	})
	local var6 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var2 (copy), p1 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var2 (copy), p1 (copy)
			local var7 = var2.fetchNamesByUserIds({ tostring(p1.userId) })(p2)
			local var8 = var7 and (var7.data and var7.data[1])
			local names = var8 and var8.names
			
			return {
				combinedName = if names then names.getCombinedName(p2) else "",
				username = if names then names.getUsername() else ""
			}
		end)
	end, { p1.userId }))
	
	return reactModule.createElement(promptFriendRequestModalModule, {
		userId = p1.userId,
		displayName = var6.combinedName,
		username = var6.username,
		onClose = function()
			-- upvalues: fireAnalyticsEvent (ref), analyticsModule (copy), p1 (ref)
			fireAnalyticsEvent(analyticsModule.EventNames.ModalClosed)
			p1.onClose()
		end,
		onSendClicked = reactModule.useCallback(function()
			-- upvalues: fireAnalyticsEvent (ref), analyticsModule (copy), playersService (copy), p1 (ref), var5 (ref), fFlagMigrateFriendshipStatusesRemainingActions (copy), var1 (copy), enums (copy), var3 (ref), myFriendsNetworkingModule (copy), var4 (ref), friendshipOriginSourceType (copy)
			fireAnalyticsEvent(analyticsModule.EventNames.CreateActionPressed)
			local userIdPlayerByUserId = playersService:GetPlayerByUserId(p1.userId)
			
			if playersService.LocalPlayer == nil or userIdPlayerByUserId == nil then
				(if fFlagMigrateFriendshipStatusesRemainingActions then var1.RequestFriendship(tostring(p1.userId), enums.FriendshipOriginSourceType.InGame) else var3(myFriendsNetworkingModule.RequestFriendshipFromUserId.API({
					currentUserId = var4,
					targetUserId = tostring(p1.userId),
					friendshipOriginSourceType = friendshipOriginSourceType.InGame.rawValue()
				}))):andThen(function()
					-- upvalues: var5 (copy)
					triggerToast(var5.friendRequestSent)
				end):catch(function(_)
					-- upvalues: var5 (copy)
					triggerToast(var5.somethingWentWrong)
				end)
			else
				local ok, _ = pcall(function()
					-- upvalues: playersService (copy), userIdPlayerByUserId (ref)
					playersService.LocalPlayer:RequestFriendship(userIdPlayerByUserId)
				end)
				triggerToast(if ok then var5.friendRequestSent else var5.somethingWentWrong)
			end
			p1.onClose()
		end, {
			var4, p1.userId, var3, p1.onClose, var5.friendRequestSent,
			var5.somethingWentWrong, fireAnalyticsEvent
		}),
		inputDelay = p1.inputDelay
	})
end