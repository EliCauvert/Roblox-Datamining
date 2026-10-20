local MessageBusService = game:GetService("MessageBusService")
local CorePackages = game:GetService("CorePackages")
local NotificationModalsManagerModule = require(CorePackages.Workspace.Packages.NotificationModalsManager)
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local GetResult = require(CorePackages.Workspace.Packages.DataHydration).TrustedConnections.TrustedConnectionsStore.get()
local Analytics = require(CorePackages.Workspace.Packages.TrustedContacts).Analytics
local UseTCAnalyticsFunction = Analytics.useTCAnalytics
local EventNames = Analytics.EventNames
local ToastNotificationsMessageId = MessageBusService:GetMessageId("ToastNotifications", "TrustedConnectionRequestReceived")

return function()
	-- upvalues: UseTCAnalyticsFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), MessageBusService (copy), ToastNotificationsMessageId (copy), GetResult (copy), EventNames (copy), NotificationModalsManagerModule (copy)
	local FireAnalyticsEventFunction = UseTCAnalyticsFunction().fireAnalyticsEvent
	local UseLocalizationResult = UseLocalizationFunction({
		somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong",
		isATrustedFriendNowToast = "Feature.Friends.TrustedFriend.Toast.IsATrustedFriendNow"
	})
	ReactModule.useEffect(function()
		-- upvalues: MessageBusService (upval), ToastNotificationsMessageId (upval), GetResult (upval), FireAnalyticsEventFunction (copy), EventNames (upval), NotificationModalsManagerModule (upval), UseLocalizationResult (copy)
		local SubscribeResult = MessageBusService:Subscribe(ToastNotificationsMessageId, function(p1)
			-- upvalues: GetResult (upval), FireAnalyticsEventFunction (upval), EventNames (upval), NotificationModalsManagerModule (upval), UseLocalizationResult (upval)
			GetResult.acceptTrustedConnectionRequest(p1.senderUserId):andThen(function()
				-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), p1 (copy), NotificationModalsManagerModule (upval), UseLocalizationResult (upval)
				FireAnalyticsEventFunction(EventNames.TCToastNotificationAcceptClicked, { friendId = p1.senderUserId })
				NotificationModalsManagerModule.SetUIBloxToast({
					sequenceNumber = DateTime.now().UnixTimestamp,
					toastTitle = string.gsub(UseLocalizationResult.isATrustedFriendNowToast, "{name}", p1.senderName)
				})
			end):catch(function(_)
				-- upvalues: NotificationModalsManagerModule (upval), UseLocalizationResult (upval)
				NotificationModalsManagerModule.SetUIBloxToast({
					sequenceNumber = DateTime.now().UnixTimestamp,
					toastTitle = UseLocalizationResult.somethingIsWrongToast
				})
			end)
		end, false, true)
		
		return function()
			-- upvalues: SubscribeResult (copy)
			if SubscribeResult then
				SubscribeResult:Disconnect()
			end
		end
	end, {
		UseLocalizationResult.somethingIsWrongToast,
		FireAnalyticsEventFunction,
		UseLocalizationResult.isATrustedFriendNowToast
	})
end