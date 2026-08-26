local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local textKeysModule = require(profileQRCode.Common.TextKeys)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local standardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local useLocalUserInfoModule = require(profileQRCode.Utils.useLocalUserInfo)
local useAnalyticsModule = require(profileQRCode.Analytics.useAnalytics)
local eventNamesModule = require(profileQRCode.Analytics.EventNames)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local scanqr = images["icons/menu/scanqr"]
local close = images["icons/navigation/close"]

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), fFlagConnectionsToFriendsRename (ref), useStyle (ref), useLocalUserInfoModule (ref), useAnalyticsModule (ref), reactModule (ref), eventNamesModule (ref), imageSetLabel (ref), scanqr (ref), styledTextLabel (ref), iconButton (ref), close (ref), iconSize (ref), button (ref), buttonType (ref), standardButtonSize (ref)
	local var1 = useLocalization({
		notificationRequest = textKeysModule.NotificationRequestText,
		acceptFriend = if fFlagConnectionsToFriendsRename then textKeysModule.AcceptFriend else textKeysModule.AcceptConnection
	})
	local var2 = useStyle()
	local var3 = useLocalUserInfoModule(p1.userId)
	local var4 = useAnalyticsModule()
	local var5, var6 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), eventNamesModule (copy), p1 (ref)
		var4.fireEvent(eventNamesModule.QRPageFriendRequestBannerShown, { qrCodeBannerQueueSize = p1.notificationQueueSize })
	end, { p1.userId })
	
	return reactModule.createElement("Frame", {
		ZIndex = 2,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundColor3 = var2.Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = var2.Theme.BackgroundUIDefault.Transparency
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 12),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			PaddingTop = UDim.new(0, 12)
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		UIStroke = reactModule.createElement("UIStroke", {
			Thickness = 1,
			Color = var2.Theme.Divider.Color,
			Transparency = var2.Theme.Divider.Transparency
		}),
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(640, 1e999) }),
		UpperFrame = reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIPadding = reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 12) }),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			QRCodeImageFrame = reactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 40, 0, 40)
			}, {
				QRImage = reactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Image = scanqr,
					ImageColor3 = var2.Theme.TextEmphasis.Color,
					Size = UDim2.new(0, 40, 0, 40)
				})
			}),
			TextFrame = reactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, -72, 0, 0)
			}, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 16),
					PaddingRight = UDim.new(0, 16)
				}),
				Layout = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
				Username = reactModule.createElement(styledTextLabel, {
					layoutOrder = 1,
					textWrapped = true,
					text = var3.displayName,
					fontStyle = var2.Font.Header2,
					colorStyle = var2.Theme.TextDefault,
					size = UDim2.new(1, 0, 0, 20),
					automaticSize = Enum.AutomaticSize.Y,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center
				}),
				Spacer1 = reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 5)
				}),
				Description = reactModule.createElement(styledTextLabel, {
					layoutOrder = 3,
					textWrapped = true,
					lineHeight = 1,
					text = var1.notificationRequest,
					fontStyle = var2.Font.Body,
					colorStyle = var2.Theme.TextDefault,
					size = UDim2.new(1, 0, 0, 28),
					automaticSize = Enum.AutomaticSize.Y,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center
				})
			}),
			CloseButtonFrame = reactModule.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 32, 0, 32)
			}, {
				CloseButton = reactModule.createElement(iconButton, {
					icon = close,
					iconSize = iconSize.Medium,
					onActivated = p1.onClose,
					anchorPoint = Vector2.new(0.13, 0.13)
				})
			})
		}),
		AcceptButton = reactModule.createElement(button, {
			layoutOrder = 2,
			buttonType = buttonType.PrimarySystem,
			standardSize = standardButtonSize.Small,
			text = var1.acceptFriend,
			fontStyle = var2.Font.CaptionBody,
			isDisabled = var5,
			onActivated = function()
				-- upvalues: var6 (ref), p1 (ref)
				var6(true)
				p1.onAccept(p1.userId)
			end
		})
	})
end