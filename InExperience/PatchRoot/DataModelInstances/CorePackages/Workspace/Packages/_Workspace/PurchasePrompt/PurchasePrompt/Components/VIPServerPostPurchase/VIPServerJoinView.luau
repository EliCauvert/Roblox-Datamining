local Parent = script:FindFirstAncestor("PurchasePrompt").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local Button = FoundationModule.Button
local Sheet = FoundationModule.Sheet
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior

return function(p1)
	-- upvalues: ReactModule (copy), Sheet (copy), Text (copy), View (copy), Image (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		testId = "VIPServerJoinView",
		onClose = p1.onClose
	}, {
		Header = ReactModule.createElement(Sheet.Header, nil, {
			Title = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-default",
				Text = p1.locales.title
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			Body = ReactModule.createElement(View, { tag = "col gap-large size-full-0 auto-y" }, {
				Server = ReactModule.createElement(View, {
					tag = "row align-y-center gap-medium size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					Thumbnail = ReactModule.createElement(Image, {
						testId = "--purchase-prompt-image-game-thumbnail",
						tag = "size-2400-2400 radius-medium clip bg-surface-200",
						LayoutOrder = 1,
						Image = p1.thumbnailUrl,
						ScaleType = Enum.ScaleType.Crop
					}),
					Names = ReactModule.createElement(View, { tag = "col fill gap-xsmall auto-y", LayoutOrder = 2 }, {
						ServerName = ReactModule.createElement(Text, {
							testId = "--purchase-prompt-text-server-name",
							tag = "size-full-0 auto-y text-title-large text-align-x-left text-truncate-end content-emphasis",
							LayoutOrder = 1,
							Text = p1.serverName
						}),
						GameName = ReactModule.createElement(Text, {
							testId = "--purchase-prompt-text-game-name",
							tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end content-muted",
							LayoutOrder = 2,
							Text = p1.gameName
						})
					})
				}),
				Error = if p1.hasError then ReactModule.createElement(Text, {
					testId = "--purchase-prompt-text-error",
					tag = "auto-xy text-body-medium content-system-alert",
					LayoutOrder = 2,
					Text = p1.locales.somethingWentWrong
				}) else nil
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			Join = ReactModule.createElement(Button, {
				testId = "--purchase-prompt-button-join",
				text = p1.locales.join,
				variant = ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				onActivated = p1.onJoin,
				isLoading = p1.isJoining
			})
		})
	})
end