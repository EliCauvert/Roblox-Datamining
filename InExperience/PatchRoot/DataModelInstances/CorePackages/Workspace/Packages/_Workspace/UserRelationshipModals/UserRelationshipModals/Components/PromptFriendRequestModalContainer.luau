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
local analyticsModule = require(userRelationshipModals.Analytics)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local promptFriendRequestModalModule = require(script.Parent.PromptFriendRequestModal)

function triggerToast(p0) --[[ line: 29 ]]
	-- upvalues: notificationModalsManagerModule (ref)
	notificationModalsManagerModule.SetUIBloxToast({
		toastTitle = p0,
		sequenceNumber = DateTime.now().UnixTimestamp
	})
end

local var10 = userProfilesModule.Stores.UserProfileStore.get()

return function(p1) --[[ line: 44 | named "PromptFriendRequestModalContainer" ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), analyticsModule (ref), useEffect (ref), useLocalization (ref), reactModule (ref), signalsModule (ref), var10 (ref), signalsReactModule (ref), playersService (ref), myFriendsNetworkingModule (ref), friendshipOriginSourceType (ref), promptFriendRequestModalModule (ref)
	local var11 = useDispatch()
	local var12 = useLocalUserId()
	local fireAnalyticsEvent = analyticsModule.useUserRelationshipModalAnalytics(analyticsModule.RelationshipTypes.Friends, tonumber(var12) or 0, p1.userId).fireAnalyticsEvent
	useEffect(function() --[[ line: 54 ]]
		-- upvalues: fireAnalyticsEvent (ref), analyticsModule (copy)
		fireAnalyticsEvent(analyticsModule.EventNames.ModalSeen)
	end, { fireAnalyticsEvent })
	local var13 = useLocalization({
		friendRequestSent = "Feature.Friends.Action.FriendRequestSent",
		somethingWentWrong = "CommonUI.Messages.Response.SomethingWentWrong"
	})
	local var14 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 63 ]]
		-- upvalues: signalsModule (copy), var10 (copy), p1 (ref)
		return signalsModule.createComputed(function(p2) --[[ line: 64 ]]
			-- upvalues: var10 (copy), p1 (copy)
			local var15 = var10.fetchNamesByUserIds({ tostring(p1.userId) })(p2)
			local var16 = var15 and (var15.data and var15.data[1])
			local names = var16 and var16.names
			
			return {
				combinedName = if names then names.getCombinedName(p2) else "",
				username = if names then names.getUsername() else ""
			}
		end)
	end, { p1.userId }))
	
	return reactModule.createElement(promptFriendRequestModalModule, {
		userId = p1.userId,
		displayName = var14.combinedName,
		username = var14.username,
		onClose = function() --[[ line: 122 ]]
			-- upvalues: fireAnalyticsEvent (ref), analyticsModule (copy), p1 (ref)
			fireAnalyticsEvent(analyticsModule.EventNames.ModalClosed)
			p1.onClose()
		end,
		onSendClicked = reactModule.useCallback(function() --[[ line: 78 ]]
			-- upvalues: fireAnalyticsEvent (ref), analyticsModule (copy), playersService (copy), p1 (ref), var13 (ref), var11 (ref), myFriendsNetworkingModule (copy), var12 (ref), friendshipOriginSourceType (copy)
			fireAnalyticsEvent(analyticsModule.EventNames.CreateActionPressed)
			local userIdPlayerByUserId = playersService:GetPlayerByUserId(p1.userId)
			
			if playersService.LocalPlayer == nil or userIdPlayerByUserId == nil then
				var11(myFriendsNetworkingModule.RequestFriendshipFromUserId.API({
					currentUserId = var12,
					targetUserId = tostring(p1.userId),
					friendshipOriginSourceType = friendshipOriginSourceType.InGame.rawValue()
				})):andThen(function() --[[ line: 98 ]]
					-- upvalues: var13 (copy)
					triggerToast(var13.friendRequestSent)
				end):catch(function(_) --[[ line: 101 ]]
					-- upvalues: var13 (copy)
					triggerToast(var13.somethingWentWrong)
				end)
			else
				local ok, _ = pcall(function() --[[ line: 88 ]]
					-- upvalues: playersService (copy), userIdPlayerByUserId (ref)
					playersService.LocalPlayer:RequestFriendship(userIdPlayerByUserId)
				end)
				triggerToast(if ok then var13.friendRequestSent else var13.somethingWentWrong)
			end
			p1.onClose()
		end, {
			var12, p1.userId, var11, p1.onClose, var13.friendRequestSent,
			var13.somethingWentWrong, fireAnalyticsEvent
		}),
		inputDelay = p1.inputDelay
	})
end