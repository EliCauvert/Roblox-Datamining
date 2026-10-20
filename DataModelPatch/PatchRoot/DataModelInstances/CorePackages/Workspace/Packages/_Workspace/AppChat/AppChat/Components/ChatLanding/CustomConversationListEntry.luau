local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local FoundationModule = require(Parent.Foundation)
local GetBoldTextThemeModule = require(script.Parent.Utils.getBoldTextTheme)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconSize = UIBloxModule.App.Constant.IconSize
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local FFlagAppChatRemoveConversationListDividerModule = require(AppChat.Flags.FFlagAppChatRemoveConversationListDivider)
local IconsNavigationPushRight = UIBloxModule.App.ImageSet.Images["icons/navigation/pushRight"]

function CustomConversationListEntry(p1)
	-- upvalues: UseStyleFunction (copy), GetBoldTextThemeModule (copy), UseTextSizeOffsetFunction (copy), UseChatPagePaddingModule (copy), IconSize (copy), FoundationModule (copy), ReactModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), ImageSetLabel (copy), IconsNavigationPushRight (copy), FFlagAppChatRemoveConversationListDividerModule (copy)
	local UseStyleResult = UseStyleFunction()
	local BoldTextThemeModule = GetBoldTextThemeModule(UseStyleResult)
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local ScaledRelativeSize = BoldTextThemeModule.Font.Header2.RelativeSize * BoldTextThemeModule.Font.BaseSize
	local ScaledRelativeSize1 = UseStyleResult.Font.CaptionBody.RelativeSize * UseStyleResult.Font.BaseSize
	local XOffset = 60 - (60 - IconSize.Regular) / 2
	
	return ReactModule.createElement(FoundationModule.View, {
		Size = UDim2.new(1, 0, 0, p1.entryHeight),
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
		onActivated = p1.onActivated,
		testId = if FFlagDebugAppChatEnableDomLocatorsModule then p1.testId else nil
	}, {
		leftAlign = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -(IconSize.Regular + 12), 1, 0)
		}, {
			padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, UseChatPagePaddingModuleResult.left)
			}),
			layout = ReactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			iconHolder = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(0, XOffset, 1, 0)
			}, {
				layout = ReactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Left
				}),
				icon = ReactModule.createElement(ImageSetLabel, {
					BorderSizePixel = 0,
					BackgroundColor3 = BoldTextThemeModule.Theme.BackgroundUIDefault.Color,
					BackgroundTransparency = BoldTextThemeModule.Theme.BackgroundUIDefault.Transparency,
					Size = UDim2.new(0, IconSize.Regular, 0, IconSize.Regular),
					ScaleType = Enum.ScaleType.Stretch,
					Image = p1.entryIcon,
					ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
					ImageTransparency = UseStyleResult.Theme.IconEmphasis.Transparency
				}, {
					corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
				})
			}),
			centerContent = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, -60, 1, 0)
			}, {
				layout = ReactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 2)
				}),
				title = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, ScaledRelativeSize + UseTextSizeOffsetResult),
					TextSize = ScaledRelativeSize,
					TextColor3 = BoldTextThemeModule.Theme.TextEmphasis.Color,
					TextTransparency = BoldTextThemeModule.Theme.TextEmphasis.Transparency,
					Font = BoldTextThemeModule.Font.Header2.Font,
					Text = p1.titleText or "",
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				subTitle = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, ScaledRelativeSize1 + UseTextSizeOffsetResult),
					TextSize = ScaledRelativeSize1,
					TextColor3 = UseStyleResult.Theme.TextDefault.Color,
					TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
					Font = UseStyleResult.Font.CaptionBody.Font,
					Text = p1.subTitleText,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.AtEnd
				})
			})
		}),
		rightAlign = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			layout = ReactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			padding = ReactModule.createElement("UIPadding", {
				PaddingRight = UDim.new(0, UseChatPagePaddingModuleResult.right)
			}),
			icon = ReactModule.createElement(ImageSetLabel, {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, IconSize.Regular, 0, IconSize.Regular),
				ScaleType = Enum.ScaleType.Stretch,
				Image = IconsNavigationPushRight,
				ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
				ImageTransparency = UseStyleResult.Theme.IconEmphasis.Transparency
			})
		}),
		divider = if FFlagAppChatRemoveConversationListDividerModule then nil else ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			layout = ReactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				HorizontalAlignment = Enum.HorizontalAlignment.Right
			}),
			divider = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = UseStyleResult.Theme.Divider.Transparency,
				BackgroundColor3 = UseStyleResult.Theme.Divider.Color,
				Size = UDim2.new(1, -XOffset, 0, 1)
			})
		})
	})
end

return CustomConversationListEntry