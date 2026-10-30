local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local FFlagAppChatExtendConversationListRowDividersModule = require(AppChat.Flags.FFlagAppChatExtendConversationListRowDividers)
local FFlagAppChatRemoveConversationListDividerModule = require(AppChat.Flags.FFlagAppChatRemoveConversationListDivider)
local FFlagAppChatAlignCustomConversationListRowChevronModule = require(AppChat.Flags.FFlagAppChatAlignCustomConversationListRowChevron)
local UseCustomConversationListRowPresentationModule = require(script.Parent.useCustomConversationListRowPresentation)

return ReactModule.memo(function(p1)
	-- upvalues: UseCustomConversationListRowPresentationModule (copy), FoundationModule (copy), ReactModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), FFlagAppChatExtendConversationListRowDividersModule (copy), FFlagAppChatAlignCustomConversationListRowChevronModule (copy), FFlagAppChatRemoveConversationListDividerModule (copy)
	local UseCustomConversationListRowPresentationModuleResult = UseCustomConversationListRowPresentationModule({
		entryHeight = p1.entryHeight,
		onActivated = p1.onActivated
	})
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local ShowBackground = UseCustomConversationListRowPresentationModuleResult.showBackground
	local _UDim = UDim.new(0, UseCustomConversationListRowPresentationModuleResult.pagePaddingRight)
	
	return ReactModule.createElement(FoundationModule.View, {
		BorderSizePixel = 0,
		backgroundStyle = UseTokensResult.Color.None,
		Size = UDim2.new(1, 0, 0, UseCustomConversationListRowPresentationModuleResult.entryHeight),
		testId = if FFlagDebugAppChatEnableDomLocatorsModule then p1.testId else nil
	}, {
		customCell = ReactModule.createElement(FoundationModule.View, {
			Name = "customCell",
			Size = if FFlagAppChatExtendConversationListRowDividersModule then nil else UDim2.fromScale(1, 1),
			tag = { ["size-full"] = true, ["bg-surface-0"] = ShowBackground },
			backgroundStyle = if ShowBackground then nil else UseTokensResult.Color.None,
			selection = { Selectable = true },
			onActivated = UseCustomConversationListRowPresentationModuleResult.onActivated,
			stateLayer = if ShowBackground then {
				affordance = FoundationModule.Enums.StateLayerAffordance.Background
			} else nil
		}, {
			content = ReactModule.createElement(FoundationModule.View, {
				tag = "row align-y-center gap-small size-full",
				Size = if FFlagAppChatExtendConversationListRowDividersModule then nil else UDim2.fromScale(1, 1),
				padding = {
					left = UDim.new(0, UseCustomConversationListRowPresentationModuleResult.pagePaddingLeft),
					right = if FFlagAppChatExtendConversationListRowDividersModule then nil else _UDim
				}
			}, {
				icon = ReactModule.createElement(FoundationModule.View, {
					tag = "row align-x-center align-y-center size-1000-1000",
					LayoutOrder = 0
				}, {
					iconTile = ReactModule.createElement(FoundationModule.View, {
						tag = "row align-x-center align-y-center size-900-900 radius-medium bg-surface-100"
					}, {
						icon = ReactModule.createElement(FoundationModule.Icon, {
							name = p1.entryIcon,
							size = FoundationModule.Enums.IconSize.Medium,
							style = UseTokensResult.Color.Content.Emphasis
						})
					})
				}),
				body = ReactModule.createElement(FoundationModule.View, {
					tag = "col fill size-0-full clip",
					Name = "body",
					LayoutOrder = 1
				}, {
					mainContent = ReactModule.createElement(FoundationModule.View, {
						tag = "row align-y-center fill gap-small size-full-0 clip",
						Name = "mainContent",
						LayoutOrder = 1,
						padding = if FFlagAppChatExtendConversationListRowDividersModule then { right = _UDim } else nil
					}, {
						info = ReactModule.createElement(FoundationModule.View, {
							tag = "col align-y-center fill gap-xxsmall size-0-full clip",
							LayoutOrder = 1
						}, {
							title = ReactModule.createElement(FoundationModule.Text, {
								tag = "size-full-0 auto-y text-title-large text-align-x-left text-truncate-end content-default",
								Name = "title",
								LayoutOrder = 1,
								Text = p1.titleText or ""
							}),
							subtitle = ReactModule.createElement(FoundationModule.Text, {
								tag = "size-full-0 auto-y text-body-small text-align-x-left text-truncate-end content-default",
								Name = "subTitle",
								LayoutOrder = 2,
								Text = p1.subTitleText or ""
							})
						}),
						chevron = ReactModule.createElement(FoundationModule.View, {
							LayoutOrder = 2,
							tag = {
								["row align-y-center size-0-full auto-x"] = FFlagAppChatAlignCustomConversationListRowChevronModule,
								["row align-x-center align-y-center size-1200-full"] = not FFlagAppChatAlignCustomConversationListRowChevronModule
							}
						}, {
							icon = ReactModule.createElement(FoundationModule.Icon, {
								name = FoundationModule.Enums.IconName.ChevronLargeRight,
								size = FoundationModule.Enums.IconSize.Medium,
								style = UseTokensResult.Color.Content.Emphasis
							})
						})
					}),
					divider = if FFlagAppChatRemoveConversationListDividerModule then nil else ReactModule.createElement(FoundationModule.View, {
						tag = "size-full-0 auto-y",
						Name = "divider",
						LayoutOrder = 2
					}, {
						line = ReactModule.createElement(FoundationModule.Divider)
					})
				})
			})
		})
	})
end)