local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local UserTile = require(Parent.UserTile).UserTile
local LayoutMode = require(Parent.UserTile).LayoutMode
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Button = FoundationModule.Button
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local TextKeysModule = require(ProfileQRCode.Common.TextKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseLocalUserInfoModule = require(ProfileQRCode.Utils.useLocalUserInfo)
local UseCombinedUserNameModule = require(ProfileQRCode.Utils.useCombinedUserName)
local UseAnalyticsModule = require(ProfileQRCode.Analytics.useAnalytics)
local EventNamesModule = require(ProfileQRCode.Analytics.EventNames)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagProfileQrCodeDeprecateUserReduxModule = require(ProfileQRCode.Flags.FFlagProfileQrCodeDeprecateUserRedux)

return function(p1) --[[ Line: 39 ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseStyleFunction (copy), UseLocalUserInfoModule (copy), UseCombinedUserNameModule (copy), FFlagProfileQrCodeDeprecateUserReduxModule (copy), UseAnalyticsModule (copy), ReactModule (copy), EventNamesModule (copy), View (copy), UserTile (copy), LayoutMode (copy), FoundationModule (copy), StyledTextLabel (copy), Button (copy), ButtonVariant (copy), InputSize (copy), FillBehavior (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		accept = "CommonUI.Controls.Action.Accept",
		dismiss = "CommonUI.Messages.Action.Dismiss",
		notificationRequest = TextKeysModule.NotificationRequestText
	})
	local UseStyleResult = UseStyleFunction()
	local UseLocalUserInfoModuleResult = UseLocalUserInfoModule(p1.userId)
	local UseCombinedUserNameModuleResult = UseCombinedUserNameModule(p1.userId)
	local DisplayName = if UseCombinedUserNameModuleResult == "" then UseLocalUserInfoModuleResult and (UseLocalUserInfoModuleResult.displayName or UseLocalUserInfoModuleResult.username) or "" else UseCombinedUserNameModuleResult .. " @" .. (UseLocalUserInfoModuleResult.username or (if FFlagProfileQrCodeDeprecateUserReduxModule then "" else nil))
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 57 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, { p1.userId })
	ReactModule.useEffect(function() --[[ Line: 61 ]]
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), p1 (copy)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.QRPageFriendRequestBannerShown, { qrCodeBannerQueueSize = p1.notificationQueueSize })
	end, {
		p1.userId,
		UseAnalyticsModuleResult.fireEvent,
		p1.notificationQueueSize
	})
	
	return ReactModule.createElement(View, {
		ZIndex = 2,
		tag = "col gap-medium size-full-0 auto-y padding-medium stroke-standard stroke-default radius-medium bg-surface-0",
		sizeConstraint = {
			MaxSize = Vector2.new(640, 1e999),
			MinSize = Vector2.new(0, 0)
		}
	}, {
		HeaderRow = ReactModule.createElement(View, {
			tag = "row align-y-top gap-medium size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			AvatarSlot = ReactModule.createElement(View, { tag = "no-flex auto-xy", LayoutOrder = 1 }, {
				UserTile = ReactModule.createElement(UserTile, {
					userId = p1.userId,
					layoutMode = LayoutMode.compact,
					userPresenceType = FoundationModule.Enums.UserPresence.None,
					avatarSize = UDim2.new(0, UseTokensResult.Size.Size_1000, 0, UseTokensResult.Size.Size_1000)
				})
			}),
			ContentColumn = ReactModule.createElement(View, { tag = "col fill gap-xsmall auto-y", LayoutOrder = 2 }, {
				Username = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 1,
					textWrapped = true,
					text = DisplayName,
					fontStyle = UseStyleResult.Font.Header2,
					colorStyle = UseStyleResult.Theme.TextDefault,
					size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_500),
					automaticSize = Enum.AutomaticSize.Y,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center
				}),
				Description = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 2,
					textWrapped = true,
					lineHeight = 1,
					text = UseLocalizationResult.notificationRequest,
					fontStyle = UseStyleResult.Font.Body,
					colorStyle = UseStyleResult.Theme.TextDefault,
					size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_700),
					automaticSize = Enum.AutomaticSize.Y,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center
				}),
				ButtonRow = ReactModule.createElement(View, {
					tag = "row gap-small size-full-0 auto-y padding-top-large",
					LayoutOrder = 3
				}, {
					AcceptSlot = ReactModule.createElement(View, { tag = "fill auto-xy", LayoutOrder = 1 }, {
						AcceptButton = ReactModule.createElement(Button, {
							text = UseLocalizationResult.accept,
							variant = ButtonVariant.Emphasis,
							size = InputSize.Small,
							fillBehavior = FillBehavior.Fill,
							isDisabled = UseStateResult,
							onActivated = function() --[[ Line: 131 ]]
								-- upvalues: UseStateResult2 (copy), p1 (copy)
								UseStateResult2(true)
								p1.onAccept(p1.userId)
							end
						})
					}),
					DismissSlot = ReactModule.createElement(View, { tag = "fill auto-xy", LayoutOrder = 2 }, {
						DismissButton = ReactModule.createElement(Button, {
							text = UseLocalizationResult.dismiss,
							variant = ButtonVariant.Standard,
							size = InputSize.Small,
							fillBehavior = FillBehavior.Fill,
							onActivated = p1.onClose
						})
					})
				})
			})
		})
	})
end