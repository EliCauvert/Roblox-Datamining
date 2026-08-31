local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local fFlagAppChatExtendConversationListRowDividersModule = require(appChat.Flags.FFlagAppChatExtendConversationListRowDividers)
local fFlagAppChatRemoveConversationListDividerModule = require(appChat.Flags.FFlagAppChatRemoveConversationListDivider)
local useCustomConversationListRowPresentationModule = require(script.Parent.useCustomConversationListRowPresentation)

return reactModule.memo(function(p1)
	-- upvalues: useCustomConversationListRowPresentationModule (ref), foundationModule (ref), reactModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), fFlagAppChatExtendConversationListRowDividersModule (ref), fFlagAppChatRemoveConversationListDividerModule (ref)
	local var1 = useCustomConversationListRowPresentationModule({
		entryHeight = p1.entryHeight,
		onActivated = p1.onActivated
	})
	local var2 = foundationModule.Hooks.useTokens()
	local showBackground = var1.showBackground
	local uDim = UDim.new(0, var1.pagePaddingRight)
	
	return reactModule.createElement(foundationModule.View, {
		BorderSizePixel = 0,
		backgroundStyle = var2.Color.None,
		Size = UDim2.new(1, 0, 0, var1.entryHeight),
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then p1.testId else nil
	}, {
		customCell = reactModule.createElement(foundationModule.View, {
			Name = "customCell",
			Size = if fFlagAppChatExtendConversationListRowDividersModule then nil else UDim2.fromScale(1, 1),
			tag = { ["size-full"] = true, ["bg-surface-0"] = showBackground },
			backgroundStyle = if showBackground then nil else var2.Color.None,
			selection = { Selectable = true },
			onActivated = var1.onActivated,
			stateLayer = if showBackground then {
				affordance = foundationModule.Enums.StateLayerAffordance.Background
			} else nil
		}, {
			content = reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center gap-small size-full",
				Size = if fFlagAppChatExtendConversationListRowDividersModule then nil else UDim2.fromScale(1, 1),
				padding = {
					left = UDim.new(0, var1.pagePaddingLeft),
					right = if fFlagAppChatExtendConversationListRowDividersModule then nil else uDim
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
							name = p1.entryIcon,
							size = foundationModule.Enums.IconSize.Medium,
							style = var2.Color.Content.Emphasis
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
						LayoutOrder = 1,
						padding = if fFlagAppChatExtendConversationListRowDividersModule then { right = uDim } else nil
					}, {
						info = reactModule.createElement(foundationModule.View, {
							tag = "col align-y-center fill gap-xxsmall size-0-full clip",
							LayoutOrder = 1
						}, {
							title = reactModule.createElement(foundationModule.Text, {
								tag = "size-full-0 auto-y text-title-large text-align-x-left text-truncate-end content-default",
								Name = "title",
								LayoutOrder = 1,
								Text = p1.titleText or ""
							}),
							subtitle = reactModule.createElement(foundationModule.Text, {
								tag = "size-full-0 auto-y text-body-small text-align-x-left text-truncate-end content-default",
								Name = "subTitle",
								LayoutOrder = 2,
								Text = p1.subTitleText or ""
							})
						}),
						chevron = reactModule.createElement(foundationModule.View, {
							tag = "row align-x-center align-y-center size-1200-full",
							LayoutOrder = 2
						}, {
							icon = reactModule.createElement(foundationModule.Icon, {
								name = foundationModule.Enums.IconName.ChevronLargeRight,
								size = foundationModule.Enums.IconSize.Medium,
								style = var2.Color.Content.Emphasis
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