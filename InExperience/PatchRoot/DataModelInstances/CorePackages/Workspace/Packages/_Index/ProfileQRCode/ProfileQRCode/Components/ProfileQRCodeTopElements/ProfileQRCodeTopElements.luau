local IXPService = game:GetService("IXPService")
local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local roactAppExperimentModule = require(parent.RoactAppExperiment)
local localizationModule = require(parent.Localization)
local UIBloxModule = require(parent.UIBlox)
local sharedFlagsModule = require(parent.SharedFlags)
local toast = UIBloxModule.App.Dialog.Toast
local eventNamesModule = require(profileQRCode.Analytics.EventNames)
local profileQRCodeTopBarModule = require(profileQRCode.Components.ProfileQRCodeTopBar)
local QRCodeFriendRequestNotificationModule = require(profileQRCode.Components.QRCodeFriendRequestNotification)
local friendAcceptedSnackbarModule = require(profileQRCode.Components.FriendAcceptedSnackbar)
local textKeysModule = require(profileQRCode.Common.TextKeys)
local useAcceptFriendUrlModule = require(profileQRCode.Networking.useAcceptFriendUrl)
local useAnalyticsModule = require(profileQRCode.Analytics.useAnalytics)
local useGetUsersInfoUrlModule = require(profileQRCode.Networking.useGetUsersInfoUrl)
local useLocalization = localizationModule.Hooks.useLocalization
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local friendsNetworkingModule = require(parent.FriendsNetworking)
local images = UIBloxModule.App.ImageSet.Images
local signalREventsModule = require(profileQRCode.Common.SignalREvents)
local getFStringProfileQRCodeFriendRequestAlertsExperimentKeyModule = require(profileQRCode.Flags.getFStringProfileQRCodeFriendRequestAlertsExperimentKey)
local getFStringProfileQRCodeFriendRequestAlertsLayerModule = require(profileQRCode.Flags.getFStringProfileQRCodeFriendRequestAlertsLayer)
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagQRCodeFriendRequestNotificationV2Module = require(profileQRCode.Flags.FFlagQRCodeFriendRequestNotificationV2)
local friendAdd = images["icons/actions/friends/friendAdd"]

return roactAppExperimentModule.connectUserLayer({ getFStringProfileQRCodeFriendRequestAlertsLayerModule() }, function(p7, _)
	-- upvalues: getFStringProfileQRCodeFriendRequestAlertsLayerModule (ref), getFStringProfileQRCodeFriendRequestAlertsExperimentKeyModule (ref)
	return {
		profileQRCodeFriendRequestAlertsEnabled = (p7[getFStringProfileQRCodeFriendRequestAlertsLayerModule()] or {})[getFStringProfileQRCodeFriendRequestAlertsExperimentKeyModule()]
	}
end, false)(function(p0)
	-- upvalues: useLocalization (ref), fFlagConnectionsToFriendsRename (ref), textKeysModule (ref), useAnalyticsModule (ref), reactModule (ref), fFlagQRCodeFriendRequestNotificationV2Module (ref), IXPService (ref), getFStringProfileQRCodeFriendRequestAlertsLayerModule (ref), cryoModule (ref), useLocalUserId (ref), useGetUsersInfoUrlModule (ref), useAcceptFriendUrlModule (ref), signalREventsModule (ref), friendsNetworkingModule (ref), profileQRCodeTopBarModule (ref), toast (ref), friendAdd (ref), QRCodeFriendRequestNotificationModule (ref), eventNamesModule (ref), friendAcceptedSnackbarModule (ref)
	local var21 = useLocalization({
		friendAdded = if fFlagConnectionsToFriendsRename then textKeysModule.FriendAdded else textKeysModule.ConnectionAdded
	})
	local var22 = useAnalyticsModule()
	local profileQRCodeFriendRequestAlertsEnabled = p0.profileQRCodeFriendRequestAlertsEnabled
	local robloxEventReceiver = p0.robloxEventReceiver
	local var23, var24 = reactModule.useState(false)
	local var25 = nil
	local var26 = nil
	local var27 = nil
	local var28 = nil
	local var29 = nil
	local var30 = nil
	local var31 = nil
	
	if fFlagQRCodeFriendRequestNotificationV2Module then
		local var32, var33 = reactModule.useState("")
		var25 = var32
		var26 = var33
		local var34, var35 = reactModule.useState(false)
		var27 = var34
		var28 = var35
		local var36, var37 = reactModule.useState(false)
		var29 = var36
		var30 = var37
		var31 = reactModule.useCallback(function()
			-- upvalues: var30 (write), var28 (write)
			var30(false)
			var28(false)
		end, {})
	end
	local var38, var39 = reactModule.useReducer(function(p1, p2)
		-- upvalues: IXPService (copy), getFStringProfileQRCodeFriendRequestAlertsLayerModule (copy), cryoModule (copy)
		if p2.type == "addItemToQueue" then
			IXPService:LogUserLayerExposure(getFStringProfileQRCodeFriendRequestAlertsLayerModule())
			
			return cryoModule.List.join(p1, { p2.newUserId })
		end
		return if p2.type == "removeItemFromQueue" then cryoModule.List.removeIndex(p1, 1) else p1
	end, {})
	local var40 = useLocalUserId()
	local var41 = useGetUsersInfoUrlModule()
	local var42 = useAcceptFriendUrlModule()
	local var43 = if fFlagQRCodeFriendRequestNotificationV2Module then function(p3)
		-- upvalues: var40 (ref)
		local var45 = tostring(p3.UserId1)
		
		if var45 == var40 then
			var45 = tostring(p3.UserId2)
		end
		return var45
	end else nil
	
	local function friendshipNotificationReceived(p4)
		-- upvalues: signalREventsModule (copy), friendsNetworkingModule (copy), var40 (ref), var41 (ref), var39 (ref), fFlagQRCodeFriendRequestNotificationV2Module (copy), var43 (write), var26 (write), var30 (write), var28 (write)
		local var46
		if p4.Type == signalREventsModule.FriendshipRequested and p4.EventArgs.SourceType == friendsNetworkingModule.Enums.FriendshipOriginSourceType.QrCode.rawValue() then
			var46 = tostring(p4.EventArgs.UserId1)
			
			if var46 == var40 then
				var46 = tostring(p4.EventArgs.UserId2)
			end
			var41(var46):andThen(function()
				-- upvalues: var39 (copy), var46 (write)
				var39({ type = "addItemToQueue", newUserId = var46 })
			end)
			
			return
		elseif p4.Type == signalREventsModule.FriendshipCreated and fFlagQRCodeFriendRequestNotificationV2Module then
			var46 = var43(p4.EventArgs)
			var41(var46):andThen(function()
				-- upvalues: var26 (copy), var46 (ref), var30 (copy), var28 (copy), p4 (ref)
				var26(var46)
				var30(true)
				var28(p4.EventArgs.IsTrustedFriend)
			end)
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: robloxEventReceiver (ref), signalREventsModule (copy), friendshipNotificationReceived (ref)
		robloxEventReceiver:observeEvent(signalREventsModule.FriendshipNotifications, function(p5)
			-- upvalues: friendshipNotificationReceived (copy)
			friendshipNotificationReceived(p5)
		end)
	end, { robloxEventReceiver })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 3,
		LayoutOrder = 1,
		Size = if fFlagQRCodeFriendRequestNotificationV2Module then UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, 0, 56)
	}, {
		TopBarWrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 3,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Layout = if not fFlagQRCodeFriendRequestNotificationV2Module then reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}) else nil,
			TopBar = reactModule.createElement(profileQRCodeTopBarModule, {
				layoutOrder = 1,
				appStorageService = p0.appStorageService,
				onClose = p0.onClose,
				openQrCodeScanner = p0.openQrCodeScanner
			})
		}),
		FriendAcceptToastFrame = if profileQRCodeFriendRequestAlertsEnabled and var23 and not fFlagQRCodeFriendRequestNotificationV2Module then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 100,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			FriendAcceptToast = reactModule.createElement(toast, {
				duration = 3,
				show = true,
				toastContent = {
					toastTitle = var21.friendAdded,
					iconImage = friendAdd,
					onDismissed = function()
						-- upvalues: var24 (ref)
						var24(false)
					end
				}
			})
		}) else nil,
		FriendsInviteFrame = if profileQRCodeFriendRequestAlertsEnabled and #var38 > 0 and not var23 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 100,
			Position = UDim2.new(0, 0, 0, 24),
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingRight = UDim.new(0, 28),
				PaddingLeft = UDim.new(0, 28)
			}),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			FriendsInvite = reactModule.createElement(QRCodeFriendRequestNotificationModule, {
				notificationQueueSize = #var38,
				onAccept = function(p6)
					-- upvalues: var42 (ref), var40 (ref), var39 (ref), fFlagQRCodeFriendRequestNotificationV2Module (copy), var24 (ref), var22 (ref), eventNamesModule (copy), var38 (ref)
					var42(var40, p6):andThen(function()
						-- upvalues: var39 (copy), fFlagQRCodeFriendRequestNotificationV2Module (copy), var24 (copy)
						var39({ type = "removeItemFromQueue", newUserId = "0" })
						
						if not fFlagQRCodeFriendRequestNotificationV2Module then
							var24(true)
						end
					end):catch(function() end)
					var22.fireEvent(eventNamesModule.QRPageFriendRequestBannerAccepted, { qrCodeBannerQueueSize = #var38 })
				end,
				onClose = function()
					-- upvalues: var39 (ref), var22 (ref), eventNamesModule (copy), var38 (ref)
					var39({ type = "removeItemFromQueue", newUserId = "0" })
					var22.fireEvent(eventNamesModule.QRPageFriendRequestBannerDismissed, { qrCodeBannerQueueSize = #var38 })
				end,
				userId = tostring(var38[1])
			})
		}) else nil,
		FriendAcceptedSnackbar = if var29 and fFlagQRCodeFriendRequestNotificationV2Module then reactModule.createElement(friendAcceptedSnackbarModule, {
			acceptedFriendUserId = var25,
			newFriendIsTrusted = var27,
			onDismissed = var31
		}) else nil
	})
end)