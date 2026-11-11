local Players = game:GetService("Players")
local UserRelationshipModals = script:FindFirstAncestor("UserRelationshipModals")
local Parent = UserRelationshipModals.Parent
local ReactModule = require(Parent.React)
local UseEffectFunction = ReactModule.useEffect
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UserProfilesModule = require(Parent.UserProfiles)
local MyFriendsNetworkingModule = require(UserRelationshipModals.Networking.myFriendsNetworking)
local FriendshipOriginSourceType = require(Parent.FriendsNetworking).Enums.FriendshipOriginSourceType
local AnalyticsModule = require(UserRelationshipModals.Analytics)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local PromptFriendRequestModalModule = require(script.Parent.PromptFriendRequestModal)

function triggerToast(ToastTitle)
	-- upvalues: NotificationModalsManagerModule (copy)
	NotificationModalsManagerModule.SetUIBloxToast({
		toastTitle = ToastTitle,
		sequenceNumber = DateTime.now().UnixTimestamp
	})
end

local GetResult = UserProfilesModule.Stores.UserProfileStore.get()

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), AnalyticsModule (copy), UseEffectFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), SignalsModule (copy), GetResult (copy), SignalsReactModule (copy), Players (copy), MyFriendsNetworkingModule (copy), FriendshipOriginSourceType (copy), PromptFriendRequestModalModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local FireAnalyticsEventFunction = AnalyticsModule.useUserRelationshipModalAnalytics(AnalyticsModule.RelationshipTypes.Friends, tonumber(UseLocalUserIdResult) or 0, p1.userId).fireAnalyticsEvent
	UseEffectFunction(function()
		-- upvalues: FireAnalyticsEventFunction (copy), AnalyticsModule (upval)
		FireAnalyticsEventFunction(AnalyticsModule.EventNames.ModalSeen)
	end, { FireAnalyticsEventFunction })
	local UseLocalizationResult = UseLocalizationFunction({
		friendRequestSent = "Feature.Friends.Action.FriendRequestSent",
		somethingWentWrong = "CommonUI.Messages.Response.SomethingWentWrong"
	})
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetResult (upval), p1 (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: GetResult (upval), p1 (upval)
			local v1 = GetResult.fetchNamesByUserIds({ (tostring(p1.userId)) })(p2)
			local Entry = v1 and (v1.data and v1.data[1])
			local Names = Entry and Entry.names
			
			return {
				combinedName = if Names then Names.getCombinedName(p2) else "",
				username = if Names then Names.getUsername() else ""
			}
		end)
	end, { p1.userId })))
	
	return ReactModule.createElement(PromptFriendRequestModalModule, {
		userId = p1.userId,
		displayName = UseSignalStateResult.combinedName,
		username = UseSignalStateResult.username,
		onClose = function()
			-- upvalues: FireAnalyticsEventFunction (copy), AnalyticsModule (upval), p1 (copy)
			FireAnalyticsEventFunction(AnalyticsModule.EventNames.ModalClosed)
			p1.onClose()
		end,
		onSendClicked = ReactModule.useCallback(function()
			-- upvalues: FireAnalyticsEventFunction (copy), AnalyticsModule (upval), Players (upval), p1 (copy), UseLocalizationResult (copy), UseDispatchResult (copy), MyFriendsNetworkingModule (upval), UseLocalUserIdResult (copy), FriendshipOriginSourceType (upval)
			FireAnalyticsEventFunction(AnalyticsModule.EventNames.CreateActionPressed)
			local Player = Players:GetPlayerByUserId(p1.userId)
			
			if Players.LocalPlayer == nil or Player == nil then
				UseDispatchResult(MyFriendsNetworkingModule.RequestFriendshipFromUserId.API({
					currentUserId = UseLocalUserIdResult,
					targetUserId = tostring(p1.userId),
					friendshipOriginSourceType = FriendshipOriginSourceType.InGame.rawValue()
				})):andThen(function()
					-- upvalues: UseLocalizationResult (upval)
					triggerToast(UseLocalizationResult.friendRequestSent)
				end):catch(function(_)
					-- upvalues: UseLocalizationResult (upval)
					triggerToast(UseLocalizationResult.somethingWentWrong)
				end)
			else
				local Success, _ = pcall(function()
					-- upvalues: Players (upval), Player (copy)
					Players.LocalPlayer:RequestFriendship(Player)
				end)
				triggerToast(if Success then UseLocalizationResult.friendRequestSent else UseLocalizationResult.somethingWentWrong)
			end
			p1.onClose()
		end, {
			UseLocalUserIdResult, p1.userId, UseDispatchResult, p1.onClose,
			UseLocalizationResult.friendRequestSent,
			UseLocalizationResult.somethingWentWrong, FireAnalyticsEventFunction
		}),
		inputDelay = p1.inputDelay
	})
end