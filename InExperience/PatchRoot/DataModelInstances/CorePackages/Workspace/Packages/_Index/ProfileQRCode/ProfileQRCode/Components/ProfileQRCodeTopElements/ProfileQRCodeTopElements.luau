local IXPService = game:GetService("IXPService")
local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Toast = UIBloxModule.App.Dialog.Toast
local EventNamesModule = require(ProfileQRCode.Analytics.EventNames)
local ProfileQRCodeTopBarModule = require(ProfileQRCode.Components.ProfileQRCodeTopBar)
local QRCodeFriendRequestNotificationModule = require(ProfileQRCode.Components.QRCodeFriendRequestNotification)
local FriendAcceptedSnackbarModule = require(ProfileQRCode.Components.FriendAcceptedSnackbar)
local TextKeysModule = require(ProfileQRCode.Common.TextKeys)
local UseAcceptFriendUrlModule = require(ProfileQRCode.Networking.useAcceptFriendUrl)
local UseAnalyticsModule = require(ProfileQRCode.Analytics.useAnalytics)
local UseGetUsersInfoUrlModule = require(ProfileQRCode.Networking.useGetUsersInfoUrl)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local FriendsNetworkingModule = require(Parent.FriendsNetworking)
local SignalREventsModule = require(ProfileQRCode.Common.SignalREvents)
local GetFStringProfileQRCodeFriendRequestAlertsExperimentKeyModule = require(ProfileQRCode.Flags.getFStringProfileQRCodeFriendRequestAlertsExperimentKey)
local GetFStringProfileQRCodeFriendRequestAlertsLayerModule = require(ProfileQRCode.Flags.getFStringProfileQRCodeFriendRequestAlertsLayer)
local FFlagQRCodeFriendRequestNotificationV2Module = require(ProfileQRCode.Flags.FFlagQRCodeFriendRequestNotificationV2)
local FFlagQRCodeHideBannerForTrustedFriendRequestModule = require(ProfileQRCode.Flags.FFlagQRCodeHideBannerForTrustedFriendRequest)
local IconsActionsFriendsFriendAdd = UIBloxModule.App.ImageSet.Images["icons/actions/friends/friendAdd"]

return (require(Parent.RoactAppExperiment).connectUserLayer({ GetFStringProfileQRCodeFriendRequestAlertsLayerModule() }, function(p1, _)
	-- upvalues: GetFStringProfileQRCodeFriendRequestAlertsLayerModule (copy), GetFStringProfileQRCodeFriendRequestAlertsExperimentKeyModule (copy)
	return {
		profileQRCodeFriendRequestAlertsEnabled = (p1[GetFStringProfileQRCodeFriendRequestAlertsLayerModule()] or {})[GetFStringProfileQRCodeFriendRequestAlertsExperimentKeyModule()]
	}
end, false)(function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), UseAnalyticsModule (copy), ReactModule (copy), FFlagQRCodeFriendRequestNotificationV2Module (copy), IXPService (copy), GetFStringProfileQRCodeFriendRequestAlertsLayerModule (copy), CryoModule (copy), UseLocalUserIdFunction (copy), UseGetUsersInfoUrlModule (copy), UseAcceptFriendUrlModule (copy), FFlagQRCodeHideBannerForTrustedFriendRequestModule (copy), SignalREventsModule (copy), FriendsNetworkingModule (copy), ProfileQRCodeTopBarModule (copy), Toast (copy), IconsActionsFriendsFriendAdd (copy), QRCodeFriendRequestNotificationModule (copy), EventNamesModule (copy), FriendAcceptedSnackbarModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({ friendAdded = TextKeysModule.FriendAdded })
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local ProfileQRCodeFriendRequestAlertsEnabled = p1.profileQRCodeFriendRequestAlertsEnabled
	local RobloxEventReceiver = p1.robloxEventReceiver
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local AcceptedFriendUserId = nil
	local Callback2 = nil
	local NewFriendIsTrusted = nil
	local Callback1 = nil
	local v1 = nil
	local Callback = nil
	local UseResult = nil
	
	if FFlagQRCodeFriendRequestNotificationV2Module then
		AcceptedFriendUserId, Callback2 = ReactModule.useState("")
		NewFriendIsTrusted, Callback1 = ReactModule.useState(false)
		v1, Callback = ReactModule.useState(false)
		UseResult = ReactModule.useCallback(function()
			-- upvalues: Callback (ref), Callback1 (ref)
			Callback(false)
			Callback1(false)
		end, {})
	end
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(function(p2, p3)
		-- upvalues: IXPService (upval), GetFStringProfileQRCodeFriendRequestAlertsLayerModule (upval), CryoModule (upval)
		if p3.type == "addItemToQueue" then
			IXPService:LogUserLayerExposure(GetFStringProfileQRCodeFriendRequestAlertsLayerModule())
			
			return CryoModule.List.join(p2, { p3.newUserId })
		else
			return if p3.type == "removeItemFromQueue" then CryoModule.List.removeIndex(p2, 1) else p2
		end
	end, {})
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseGetUsersInfoUrlModuleResult = UseGetUsersInfoUrlModule()
	local UseAcceptFriendUrlModuleResult = UseAcceptFriendUrlModule()
	local v2 = if FFlagQRCodeFriendRequestNotificationV2Module then function(p2): string
		-- upvalues: UseLocalUserIdResult (copy)
		local Text = tostring(p2.UserId1)
		
		if Text == UseLocalUserIdResult then
			Text = tostring(p2.UserId2)
		end
		return Text
	end else nil
	
	local function friendshipNotificationReceived(p2)
		-- upvalues: FFlagQRCodeHideBannerForTrustedFriendRequestModule (upval), SignalREventsModule (upval), FriendsNetworkingModule (upval), UseLocalUserIdResult (copy), UseGetUsersInfoUrlModuleResult (copy), UseReducerResult2 (copy), FFlagQRCodeFriendRequestNotificationV2Module (upval), v2 (ref), Callback2 (ref), Callback (ref), Callback1 (ref)
		if FFlagQRCodeHideBannerForTrustedFriendRequestModule and p2.Type == SignalREventsModule.FriendshipRequested and p2.EventArgs.TrustedFriendSource == "QrCrossAge" then return end
		if p2.Type == SignalREventsModule.FriendshipRequested and p2.EventArgs.SourceType == FriendsNetworkingModule.Enums.FriendshipOriginSourceType.QrCode.rawValue() then
			local Text = tostring(p2.EventArgs.UserId1)
			
			if Text == UseLocalUserIdResult then
				Text = tostring(p2.EventArgs.UserId2)
			end
			UseGetUsersInfoUrlModuleResult(Text):andThen(function()
				-- upvalues: UseReducerResult2 (upval), Text (ref)
				UseReducerResult2({ type = "addItemToQueue", newUserId = Text })
			end)
			
			return
		else
			local Text = p2.Type
			
			if Text == SignalREventsModule.FriendshipCreated then
				Text = FFlagQRCodeFriendRequestNotificationV2Module
				
				if Text then
					Text = v2
					Text = Text(p2.EventArgs)
					UseGetUsersInfoUrlModuleResult(Text):andThen(function()
						-- upvalues: Callback2 (upval), Text (copy), Callback (upval), Callback1 (upval), p2 (copy)
						Callback2(Text)
						Callback(true)
						Callback1(p2.EventArgs.IsTrustedFriend)
					end)
				end
			end
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: RobloxEventReceiver (copy), SignalREventsModule (upval), friendshipNotificationReceived (copy)
		RobloxEventReceiver:observeEvent(SignalREventsModule.FriendshipNotifications, function(p2)
			-- upvalues: friendshipNotificationReceived (upval)
			friendshipNotificationReceived(p2)
		end)
	end, { RobloxEventReceiver })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 3,
		LayoutOrder = 1,
		Size = if FFlagQRCodeFriendRequestNotificationV2Module then UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, 0, 56)
	}, {
		TopBarWrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 3,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Layout = if FFlagQRCodeFriendRequestNotificationV2Module then nil else ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			TopBar = ReactModule.createElement(ProfileQRCodeTopBarModule, {
				layoutOrder = 1,
				appStorageService = p1.appStorageService,
				onClose = p1.onClose,
				openQrCodeScanner = p1.openQrCodeScanner
			})
		}),
		FriendAcceptToastFrame = if ProfileQRCodeFriendRequestAlertsEnabled and UseStateResult and not FFlagQRCodeFriendRequestNotificationV2Module then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 100,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			FriendAcceptToast = ReactModule.createElement(Toast, {
				duration = 3,
				show = true,
				toastContent = {
					toastTitle = UseLocalizationResult.friendAdded,
					iconImage = IconsActionsFriendsFriendAdd,
					onDismissed = function()
						-- upvalues: UseStateResult2 (copy)
						UseStateResult2(false)
					end
				}
			})
		}) else nil,
		FriendsInviteFrame = if ProfileQRCodeFriendRequestAlertsEnabled and #UseReducerResult > 0 and not UseStateResult then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 100,
			Position = UDim2.new(0, 0, 0, 24),
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingRight = UDim.new(0, 28),
				PaddingLeft = UDim.new(0, 28)
			}),
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			FriendsInvite = ReactModule.createElement(QRCodeFriendRequestNotificationModule, {
				notificationQueueSize = #UseReducerResult,
				onAccept = function(p2)
					-- upvalues: UseAcceptFriendUrlModuleResult (copy), UseLocalUserIdResult (copy), UseReducerResult2 (copy), FFlagQRCodeFriendRequestNotificationV2Module (upval), UseStateResult2 (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseReducerResult (copy)
					UseAcceptFriendUrlModuleResult(UseLocalUserIdResult, p2):andThen(function()
						-- upvalues: UseReducerResult2 (upval), FFlagQRCodeFriendRequestNotificationV2Module (upval), UseStateResult2 (upval)
						UseReducerResult2({ type = "removeItemFromQueue", newUserId = "0" })
						
						if not FFlagQRCodeFriendRequestNotificationV2Module then
							UseStateResult2(true)
						end
					end):catch(function() end)
					UseAnalyticsModuleResult.fireEvent(EventNamesModule.QRPageFriendRequestBannerAccepted, { qrCodeBannerQueueSize = #UseReducerResult })
				end,
				onClose = function()
					-- upvalues: UseReducerResult2 (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseReducerResult (copy)
					UseReducerResult2({ type = "removeItemFromQueue", newUserId = "0" })
					UseAnalyticsModuleResult.fireEvent(EventNamesModule.QRPageFriendRequestBannerDismissed, { qrCodeBannerQueueSize = #UseReducerResult })
				end,
				userId = tostring(UseReducerResult[1])
			})
		}) else nil,
		FriendAcceptedSnackbar = if v1 and FFlagQRCodeFriendRequestNotificationV2Module then ReactModule.createElement(FriendAcceptedSnackbarModule, {
			acceptedFriendUserId = AcceptedFriendUserId,
			newFriendIsTrusted = NewFriendIsTrusted,
			onDismissed = UseResult
		}) else nil
	})
end))