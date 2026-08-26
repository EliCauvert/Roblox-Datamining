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

return roactAppExperimentModule.connectUserLayer({ getFStringProfileQRCodeFriendRequestAlertsLayerModule() }, function(p1, _)
	-- upvalues: getFStringProfileQRCodeFriendRequestAlertsLayerModule (ref), getFStringProfileQRCodeFriendRequestAlertsExperimentKeyModule (ref)
	return {
		profileQRCodeFriendRequestAlertsEnabled = (p1[getFStringProfileQRCodeFriendRequestAlertsLayerModule()] or {})[getFStringProfileQRCodeFriendRequestAlertsExperimentKeyModule()]
	}
end, false)(function(p1)
	-- upvalues: useLocalization (ref), fFlagConnectionsToFriendsRename (ref), textKeysModule (ref), useAnalyticsModule (ref), reactModule (ref), fFlagQRCodeFriendRequestNotificationV2Module (ref), IXPService (ref), getFStringProfileQRCodeFriendRequestAlertsLayerModule (ref), cryoModule (ref), useLocalUserId (ref), useGetUsersInfoUrlModule (ref), useAcceptFriendUrlModule (ref), signalREventsModule (ref), friendsNetworkingModule (ref), profileQRCodeTopBarModule (ref), toast (ref), friendAdd (ref), QRCodeFriendRequestNotificationModule (ref), eventNamesModule (ref), friendAcceptedSnackbarModule (ref)
	local var1 = useLocalization({
		friendAdded = if fFlagConnectionsToFriendsRename then textKeysModule.FriendAdded else textKeysModule.ConnectionAdded
	})
	local var2 = useAnalyticsModule()
	local profileQRCodeFriendRequestAlertsEnabled = p1.profileQRCodeFriendRequestAlertsEnabled
	local robloxEventReceiver = p1.robloxEventReceiver
	local var3, var4 = reactModule.useState(false)
	local var5 = nil
	local var6 = nil
	local var7 = nil
	local var8 = nil
	local var9 = nil
	local var10 = nil
	local var11 = nil
	
	if fFlagQRCodeFriendRequestNotificationV2Module then
		local var12, var13 = reactModule.useState("")
		var5 = var12
		var6 = var13
		local var14, var15 = reactModule.useState(false)
		var7 = var14
		var8 = var15
		local var16, var17 = reactModule.useState(false)
		var9 = var16
		var10 = var17
		var11 = reactModule.useCallback(function()
			-- upvalues: var10 (write), var8 (write)
			var10(false)
			var8(false)
		end, {})
	end
	local var18, var19 = reactModule.useReducer(function(p2, p3)
		-- upvalues: IXPService (copy), getFStringProfileQRCodeFriendRequestAlertsLayerModule (copy), cryoModule (copy)
		if p3.type == "addItemToQueue" then
			IXPService:LogUserLayerExposure(getFStringProfileQRCodeFriendRequestAlertsLayerModule())
			
			return cryoModule.List.join(p2, { p3.newUserId })
		end
		return if p3.type == "removeItemFromQueue" then cryoModule.List.removeIndex(p2, 1) else p2
	end, {})
	local var20 = useLocalUserId()
	local var21 = useGetUsersInfoUrlModule()
	local var22 = useAcceptFriendUrlModule()
	local var23 = if fFlagQRCodeFriendRequestNotificationV2Module then function(p2)
		-- upvalues: var20 (ref)
		local var24 = tostring(p2.UserId1)
		
		if var24 == var20 then
			var24 = tostring(p2.UserId2)
		end
		return var24
	end else nil
	
	local function friendshipNotificationReceived(p2)
		-- upvalues: signalREventsModule (copy), friendsNetworkingModule (copy), var20 (ref), var21 (ref), var19 (ref), fFlagQRCodeFriendRequestNotificationV2Module (copy), var23 (write), var6 (write), var10 (write), var8 (write)
		local var24
		if p2.Type == signalREventsModule.FriendshipRequested and p2.EventArgs.SourceType == friendsNetworkingModule.Enums.FriendshipOriginSourceType.QrCode.rawValue() then
			var24 = tostring(p2.EventArgs.UserId1)
			
			if var24 == var20 then
				var24 = tostring(p2.EventArgs.UserId2)
			end
			var21(var24):andThen(function()
				-- upvalues: var19 (copy), var24 (write)
				var19({ type = "addItemToQueue", newUserId = var24 })
			end)
			
			return
		elseif p2.Type == signalREventsModule.FriendshipCreated and fFlagQRCodeFriendRequestNotificationV2Module then
			var24 = var23(p2.EventArgs)
			var21(var24):andThen(function()
				-- upvalues: var6 (copy), var24 (ref), var10 (copy), var8 (copy), p2 (ref)
				var6(var24)
				var10(true)
				var8(p2.EventArgs.IsTrustedFriend)
			end)
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: robloxEventReceiver (ref), signalREventsModule (copy), friendshipNotificationReceived (ref)
		robloxEventReceiver:observeEvent(signalREventsModule.FriendshipNotifications, function(p2)
			-- upvalues: friendshipNotificationReceived (copy)
			friendshipNotificationReceived(p2)
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
				appStorageService = p1.appStorageService,
				onClose = p1.onClose,
				openQrCodeScanner = p1.openQrCodeScanner
			})
		}),
		FriendAcceptToastFrame = if profileQRCodeFriendRequestAlertsEnabled and var3 and not fFlagQRCodeFriendRequestNotificationV2Module then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 100,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			FriendAcceptToast = reactModule.createElement(toast, {
				duration = 3,
				show = true,
				toastContent = {
					toastTitle = var1.friendAdded,
					iconImage = friendAdd,
					onDismissed = function()
						-- upvalues: var4 (ref)
						var4(false)
					end
				}
			})
		}) else nil,
		FriendsInviteFrame = if profileQRCodeFriendRequestAlertsEnabled and #var18 > 0 and not var3 then reactModule.createElement("Frame", {
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
				notificationQueueSize = #var18,
				onAccept = function(p2)
					-- upvalues: var22 (ref), var20 (ref), var19 (ref), fFlagQRCodeFriendRequestNotificationV2Module (copy), var4 (ref), var2 (ref), eventNamesModule (copy), var18 (ref)
					var22(var20, p2):andThen(function()
						-- upvalues: var19 (copy), fFlagQRCodeFriendRequestNotificationV2Module (copy), var4 (copy)
						var19({ type = "removeItemFromQueue", newUserId = "0" })
						
						if not fFlagQRCodeFriendRequestNotificationV2Module then
							var4(true)
						end
					end):catch(function() end)
					var2.fireEvent(eventNamesModule.QRPageFriendRequestBannerAccepted, { qrCodeBannerQueueSize = #var18 })
				end,
				onClose = function()
					-- upvalues: var19 (ref), var2 (ref), eventNamesModule (copy), var18 (ref)
					var19({ type = "removeItemFromQueue", newUserId = "0" })
					var2.fireEvent(eventNamesModule.QRPageFriendRequestBannerDismissed, { qrCodeBannerQueueSize = #var18 })
				end,
				userId = tostring(var18[1])
			})
		}) else nil,
		FriendAcceptedSnackbar = if var9 and fFlagQRCodeFriendRequestNotificationV2Module then reactModule.createElement(friendAcceptedSnackbarModule, {
			acceptedFriendUserId = var5,
			newFriendIsTrusted = var7,
			onDismissed = var11
		}) else nil
	})
end)