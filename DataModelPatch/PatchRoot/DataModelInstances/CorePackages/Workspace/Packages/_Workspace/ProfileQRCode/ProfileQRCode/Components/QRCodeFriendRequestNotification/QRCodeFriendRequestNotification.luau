local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local TextKeysModule = require(ProfileQRCode.Common.TextKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local UseLocalUserInfoModule = require(ProfileQRCode.Utils.useLocalUserInfo)
local UseAnalyticsModule = require(ProfileQRCode.Analytics.useAnalytics)
local EventNamesModule = require(ProfileQRCode.Analytics.EventNames)
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local IconsMenuScanqr = Images["icons/menu/scanqr"]
local IconsNavigationClose = Images["icons/navigation/close"]

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), FFlagConnectionsToFriendsRename (copy), UseStyleFunction (copy), UseLocalUserInfoModule (copy), UseAnalyticsModule (copy), ReactModule (copy), EventNamesModule (copy), ImageSetLabel (copy), IconsMenuScanqr (copy), StyledTextLabel (copy), IconButton (copy), IconsNavigationClose (copy), IconSize (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		notificationRequest = TextKeysModule.NotificationRequestText,
		acceptFriend = if FFlagConnectionsToFriendsRename then TextKeysModule.AcceptFriend else TextKeysModule.AcceptConnection
	})
	local UseStyleResult = UseStyleFunction()
	local UseLocalUserInfoModuleResult = UseLocalUserInfoModule(p1.userId)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), p1 (copy)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.QRPageFriendRequestBannerShown, { qrCodeBannerQueueSize = p1.notificationQueueSize })
	end, { p1.userId })
	
	return ReactModule.createElement("Frame", {
		ZIndex = 2,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundUIDefault.Transparency
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 12),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			PaddingTop = UDim.new(0, 12)
		}),
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		UIStroke = ReactModule.createElement("UIStroke", {
			Thickness = 1,
			Color = UseStyleResult.Theme.Divider.Color,
			Transparency = UseStyleResult.Theme.Divider.Transparency
		}),
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(640, 1e999) }),
		UpperFrame = ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIPadding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 12) }),
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			QRCodeImageFrame = ReactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 40, 0, 40)
			}, {
				QRImage = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Image = IconsMenuScanqr,
					ImageColor3 = UseStyleResult.Theme.TextEmphasis.Color,
					Size = UDim2.new(0, 40, 0, 40)
				})
			}),
			TextFrame = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, -72, 0, 0)
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 16),
					PaddingRight = UDim.new(0, 16)
				}),
				Layout = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
				Username = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 1,
					textWrapped = true,
					text = UseLocalUserInfoModuleResult.displayName,
					fontStyle = UseStyleResult.Font.Header2,
					colorStyle = UseStyleResult.Theme.TextDefault,
					size = UDim2.new(1, 0, 0, 20),
					automaticSize = Enum.AutomaticSize.Y,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center
				}),
				Spacer1 = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 5)
				}),
				Description = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 3,
					textWrapped = true,
					lineHeight = 1,
					text = UseLocalizationResult.notificationRequest,
					fontStyle = UseStyleResult.Font.Body,
					colorStyle = UseStyleResult.Theme.TextDefault,
					size = UDim2.new(1, 0, 0, 28),
					automaticSize = Enum.AutomaticSize.Y,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center
				})
			}),
			CloseButtonFrame = ReactModule.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 32, 0, 32)
			}, {
				CloseButton = ReactModule.createElement(IconButton, {
					icon = IconsNavigationClose,
					iconSize = IconSize.Medium,
					onActivated = p1.onClose,
					anchorPoint = Vector2.new(0.13, 0.13)
				})
			})
		}),
		AcceptButton = ReactModule.createElement(Button, {
			layoutOrder = 2,
			buttonType = ButtonType.PrimarySystem,
			standardSize = StandardButtonSize.Small,
			text = UseLocalizationResult.acceptFriend,
			fontStyle = UseStyleResult.Font.CaptionBody,
			isDisabled = UseStateResult,
			onActivated = function()
				-- upvalues: UseStateResult2 (copy), p1 (copy)
				UseStateResult2(true)
				p1.onAccept(p1.userId)
			end
		})
	})
end