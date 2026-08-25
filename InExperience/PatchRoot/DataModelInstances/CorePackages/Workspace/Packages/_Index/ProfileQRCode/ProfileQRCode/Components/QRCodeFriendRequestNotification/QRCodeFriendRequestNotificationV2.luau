local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local button = foundationModule.Button
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local textKeysModule = require(profileQRCode.Common.TextKeys)
local useLocalization = localizationModule.Hooks.useLocalization
local useLocalUserInfoModule = require(profileQRCode.Utils.useLocalUserInfo)
local useCombinedUserNameModule = require(profileQRCode.Utils.useCombinedUserName)
local useAnalyticsModule = require(profileQRCode.Analytics.useAnalytics)
local eventNamesModule = require(profileQRCode.Analytics.EventNames)
local useTokens = foundationModule.Hooks.useTokens
local fFlagProfileQrCodeDeprecateUserReduxModule = require(profileQRCode.Flags.FFlagProfileQrCodeDeprecateUserRedux)

return function(p0)
	-- upvalues: useTokens (ref), useLocalization (ref), textKeysModule (ref), useStyle (ref), useLocalUserInfoModule (ref), useCombinedUserNameModule (ref), fFlagProfileQrCodeDeprecateUserReduxModule (ref), useAnalyticsModule (ref), reactModule (ref), eventNamesModule (ref), view (ref), userTile (ref), layoutMode (ref), foundationModule (ref), styledTextLabel (ref), button (ref), buttonVariant (ref), inputSize (ref), fillBehavior (ref)
	local var11 = useTokens()
	local var12 = useLocalization({
		accept = "CommonUI.Controls.Action.Accept",
		dismiss = "CommonUI.Messages.Action.Dismiss",
		notificationRequest = textKeysModule.NotificationRequestText
	})
	local var13 = useStyle()
	local var14 = useLocalUserInfoModule(p0.userId)
	local var15 = useCombinedUserNameModule(p0.userId)
	local var16 = if var15 == "" then if var14 then var14.displayName or (var14.username or "") else "" else var15 .. " @" .. (var14.username or (if fFlagProfileQrCodeDeprecateUserReduxModule then "" else nil))
	local var17 = useAnalyticsModule()
	local var18, var19 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var19 (ref)
		var19(false)
	end, { p0.userId })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), eventNamesModule (copy), p0 (ref)
		var17.fireEvent(eventNamesModule.QRPageFriendRequestBannerShown, { qrCodeBannerQueueSize = p0.notificationQueueSize })
	end, { p0.userId, var17.fireEvent, p0.notificationQueueSize })
	
	return reactModule.createElement(view, {
		ZIndex = 2,
		tag = "col gap-medium size-full-0 auto-y padding-medium stroke-standard stroke-default radius-medium bg-surface-0",
		sizeConstraint = {
			MaxSize = Vector2.new(640, 1e999),
			MinSize = Vector2.new(0, 0)
		}
	}, {
		HeaderRow = reactModule.createElement(view, {
			tag = "row align-y-top gap-medium size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			AvatarSlot = reactModule.createElement(view, { tag = "no-flex auto-xy", LayoutOrder = 1 }, {
				UserTile = reactModule.createElement(userTile, {
					userId = p0.userId,
					layoutMode = layoutMode.compact,
					userPresenceType = foundationModule.Enums.UserPresence.None,
					avatarSize = UDim2.new(0, var11.Size.Size_1000, 0, var11.Size.Size_1000)
				})
			}),
			ContentColumn = reactModule.createElement(view, { tag = "col fill gap-xsmall auto-y", LayoutOrder = 2 }, {
				Username = reactModule.createElement(styledTextLabel, {
					layoutOrder = 1,
					textWrapped = true,
					text = var16,
					fontStyle = var13.Font.Header2,
					colorStyle = var13.Theme.TextDefault,
					size = UDim2.new(1, 0, 0, var11.Size.Size_500),
					automaticSize = Enum.AutomaticSize.Y,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center
				}),
				Description = reactModule.createElement(styledTextLabel, {
					layoutOrder = 2,
					textWrapped = true,
					lineHeight = 1,
					text = var12.notificationRequest,
					fontStyle = var13.Font.Body,
					colorStyle = var13.Theme.TextDefault,
					size = UDim2.new(1, 0, 0, var11.Size.Size_700),
					automaticSize = Enum.AutomaticSize.Y,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center
				}),
				ButtonRow = reactModule.createElement(view, {
					tag = "row gap-small size-full-0 auto-y padding-top-large",
					LayoutOrder = 3
				}, {
					AcceptSlot = reactModule.createElement(view, { tag = "fill auto-xy", LayoutOrder = 1 }, {
						AcceptButton = reactModule.createElement(button, {
							text = var12.accept,
							variant = buttonVariant.Emphasis,
							size = inputSize.Small,
							fillBehavior = fillBehavior.Fill,
							isDisabled = var18,
							onActivated = function()
								-- upvalues: var19 (ref), p0 (ref)
								var19(true)
								p0.onAccept(p0.userId)
							end
						})
					}),
					DismissSlot = reactModule.createElement(view, { tag = "fill auto-xy", LayoutOrder = 2 }, {
						DismissButton = reactModule.createElement(button, {
							text = var12.dismiss,
							variant = buttonVariant.Standard,
							size = inputSize.Small,
							fillBehavior = fillBehavior.Fill,
							onActivated = p0.onClose
						})
					})
				})
			})
		})
	})
end