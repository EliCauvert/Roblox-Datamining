local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local fFlagAppChatRemoveConversationListDividerModule = require(appChat.Flags.FFlagAppChatRemoveConversationListDivider)
local useCustomConversationListRowPresentationModule = require(script.useCustomConversationListRowPresentation)

return reactModule.memo(function(p0)
	-- upvalues: useCustomConversationListRowPresentationModule (ref), foundationModule (ref), reactModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), fFlagAppChatRemoveConversationListDividerModule (ref)
	local var6 = useCustomConversationListRowPresentationModule({
		entryHeight = p0.entryHeight,
		onActivated = p0.onActivated
	})
	local var7 = foundationModule.Hooks.useTokens()
	
	return reactModule.createElement(foundationModule.View, {
		BorderSizePixel = 0,
		backgroundStyle = var7.Color.None,
		Size = UDim2.new(1, 0, 0, var6.entryHeight),
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then p0.testId else nil
	}, {
		customCell = reactModule.createElement(foundationModule.View, {
			Name = "customCell",
			tag = "size-full bg-surface-0",
			Size = UDim2.fromScale(1, 1),
			selection = { Selectable = true },
			onActivated = var6.onActivated,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.Background
			}
		}, {
			content = reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center gap-small size-full",
				Size = UDim2.fromScale(1, 1),
				padding = {
					left = UDim.new(0, var6.pagePaddingLeft),
					right = UDim.new(0, var6.pagePaddingRight)
				}
			}, {
				icon = reactModule.createElement(foundationModule.View, {
					tag = "row align-x-center align-y-center size-1000-1000",
					LayoutOrder = 0
				}, {
					iconTile = reactModule.createElement(foundationModule.View, {
						tag = "row align-x-center align-y-center size-900-900 radius-medium bg-surface-100"
					}, {
						icon = reactModule.createElement(foundationModule.Icon, {
							name = p0.entryIcon,
							size = foundationModule.Enums.IconSize.Medium,
							style = var7.Color.Content.Emphasis
						})
					})
				}),
				body = reactModule.createElement(foundationModule.View, {
					tag = "col fill size-0-full clip",
					Name = "body",
					LayoutOrder = 1
				}, {
					mainContent = reactModule.createElement(foundationModule.View, {
						tag = "row align-y-center fill gap-small size-full-0 clip",
						Name = "mainContent",
						LayoutOrder = 1
					}, {
						info = reactModule.createElement(foundationModule.View, {
							tag = "col align-y-center fill gap-xxsmall size-0-full clip",
							LayoutOrder = 1
						}, {
							title = reactModule.createElement(foundationModule.Text, {
								tag = "size-full-0 auto-y text-title-large text-align-x-left text-truncate-end content-default",
								Name = "title",
								LayoutOrder = 1,
								Text = p0.titleText or ""
							}),
							subtitle = reactModule.createElement(foundationModule.Text, {
								tag = "size-full-0 auto-y text-body-small text-align-x-left text-truncate-end content-default",
								Name = "subTitle",
								LayoutOrder = 2,
								Text = p0.subTitleText or ""
							})
						}),
						chevron = reactModule.createElement(foundationModule.View, {
							tag = "row align-x-center align-y-center size-1200-full",
							LayoutOrder = 2
						}, {
							icon = reactModule.createElement(foundationModule.Icon, {
								name = foundationModule.Enums.IconName.ChevronLargeRight,
								size = foundationModule.Enums.IconSize.Medium,
								style = var7.Color.Content.Emphasis
							})
						})
					}),
					divider = if not fFlagAppChatRemoveConversationListDividerModule then reactModule.createElement(foundationModule.View, {
						tag = "size-full-0 auto-y",
						Name = "divider",
						LayoutOrder = 2
					}, {
						line = reactModule.createElement(foundationModule.Divider)
					}) else nil
				})
			})
		})
	})
end)