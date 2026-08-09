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

return function(p0) --[[ line: 37 ]]
	-- upvalues: useTokens (ref), useLocalization (ref), textKeysModule (ref), useStyle (ref), useLocalUserInfoModule (ref), useCombinedUserNameModule (ref), useAnalyticsModule (ref), reactModule (ref), eventNamesModule (ref), view (ref), userTile (ref), layoutMode (ref), foundationModule (ref), styledTextLabel (ref), button (ref), buttonVariant (ref), inputSize (ref), fillBehavior (ref)
	local var10 = useTokens()
	local var11 = useLocalization({
		accept = "CommonUI.Controls.Action.Accept",
		dismiss = "CommonUI.Messages.Action.Dismiss",
		notificationRequest = textKeysModule.NotificationRequestText
	})
	local var12 = useStyle()
	local var13 = useLocalUserInfoModule(p0.userId)
	local var14 = useCombinedUserNameModule(p0.userId)
	local var15 = if var14 ~= "" then if var13 then var13.displayName or (var13.username or "") else "" else var14 .. " @" .. var13.username
	local var16 = useAnalyticsModule()
	local var17, var18 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 55 ]]
		-- upvalues: var18 (ref)
		var18(false)
	end, { p0.userId })
	reactModule.useEffect(function() --[[ line: 59 ]]
		-- upvalues: var16 (ref), eventNamesModule (copy), p0 (ref)
		var16.fireEvent(eventNamesModule.QRPageFriendRequestBannerShown, { qrCodeBannerQueueSize = p0.notificationQueueSize })
	end, { p0.userId, var16.fireEvent, p0.notificationQueueSize })
	
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
					avatarSize = UDim2.new(0, var10.Size.Size_1000, 0, var10.Size.Size_1000)
				})
			}),
			ContentColumn = reactModule.createElement(view, { tag = "col fill gap-xsmall auto-y", LayoutOrder = 2 }, {
				Username = reactModule.createElement(styledTextLabel, {
					layoutOrder = 1,
					textWrapped = true,
					text = var15,
					fontStyle = var12.Font.Header2,
					colorStyle = var12.Theme.TextDefault,
					size = UDim2.new(1, 0, 0, var10.Size.Size_500),
					automaticSize = Enum.AutomaticSize.Y,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center
				}),
				Description = reactModule.createElement(styledTextLabel, {
					layoutOrder = 2,
					textWrapped = true,
					lineHeight = 1,
					text = var11.notificationRequest,
					fontStyle = var12.Font.Body,
					colorStyle = var12.Theme.TextDefault,
					size = UDim2.new(1, 0, 0, var10.Size.Size_700),
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
							text = var11.accept,
							variant = buttonVariant.Emphasis,
							size = inputSize.Small,
							fillBehavior = fillBehavior.Fill,
							isDisabled = var17,
							onActivated = function() --[[ line: 129 ]]
								-- upvalues: var18 (ref), p0 (ref)
								var18(true)
								p0.onAccept(p0.userId)
							end
						})
					}),
					DismissSlot = reactModule.createElement(view, { tag = "fill auto-xy", LayoutOrder = 2 }, {
						DismissButton = reactModule.createElement(button, {
							text = var11.dismiss,
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