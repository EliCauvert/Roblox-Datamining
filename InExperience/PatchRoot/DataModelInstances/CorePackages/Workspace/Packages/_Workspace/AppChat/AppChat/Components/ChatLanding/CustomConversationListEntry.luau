local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local useTextSizeOffset = UIBloxModule.Core.Style.useTextSizeOffset
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local foundationModule = require(parent.Foundation)
local getBoldTextThemeModule = require(script.Parent.Utils.getBoldTextTheme)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local iconSize = UIBloxModule.App.Constant.IconSize
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local fFlagAppChatRemoveConversationListDividerModule = require(appChat.Flags.FFlagAppChatRemoveConversationListDivider)
local pushRight = images["icons/navigation/pushRight"]

function CustomConversationListEntry(p0) --[[ line: 32 ]]
	-- upvalues: useStyle (ref), getBoldTextThemeModule (ref), useTextSizeOffset (ref), useChatPagePaddingModule (ref), iconSize (ref), foundationModule (ref), reactModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), imageSetLabel (ref), pushRight (ref), fFlagAppChatRemoveConversationListDividerModule (ref)
	local var8 = useStyle()
	local var9 = getBoldTextThemeModule(var8)
	local var10 = useTextSizeOffset()
	local var11 = useChatPagePaddingModule()
	local onActivated = p0.onActivated
	local titleText = p0.titleText
	local font = var9.Font.Header2.Font
	local transparency = var9.Theme.TextEmphasis.Transparency
	local color = var9.Theme.TextEmphasis.Color
	local var12 = var9.Font.Header2.RelativeSize * var9.Font.BaseSize
	local var13 = var12 + var10
	local subTitleText = p0.subTitleText
	local font_1 = var8.Font.CaptionBody.Font
	local transparency_1 = var8.Theme.TextDefault.Transparency
	local color_1 = var8.Theme.TextDefault.Color
	local var14 = var8.Font.CaptionBody.RelativeSize * var8.Font.BaseSize
	local var15 = 60 - (60 - iconSize.Regular) / 2
	
	return reactModule.createElement(foundationModule.View, {
		Size = UDim2.new(1, 0, 0, p0.entryHeight),
		BackgroundColor3 = var8.Theme.BackgroundDefault.Color,
		BackgroundTransparency = var8.Theme.BackgroundDefault.Transparency,
		onActivated = onActivated,
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then p0.testId else nil
	}, {
		leftAlign = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -(iconSize.Regular + 12), 1, 0)
		}, {
			padding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var11.left) }),
			layout = reactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			iconHolder = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(0, var15, 1, 0)
			}, {
				layout = reactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Left
				}),
				icon = reactModule.createElement(imageSetLabel, {
					BorderSizePixel = 0,
					BackgroundColor3 = var9.Theme.BackgroundUIDefault.Color,
					BackgroundTransparency = var9.Theme.BackgroundUIDefault.Transparency,
					Size = UDim2.new(0, iconSize.Regular, 0, iconSize.Regular),
					ScaleType = Enum.ScaleType.Stretch,
					Image = p0.entryIcon,
					ImageColor3 = var8.Theme.IconEmphasis.Color,
					ImageTransparency = var8.Theme.IconEmphasis.Transparency
				}, {
					corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
				})
			}),
			centerContent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, -60, 1, 0)
			}, {
				layout = reactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 2)
				}),
				title = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, var13),
					TextSize = var12,
					TextColor3 = color,
					TextTransparency = transparency,
					Font = font,
					Text = titleText or "",
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				subTitle = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, var14 + var10),
					TextSize = var14,
					TextColor3 = color_1,
					TextTransparency = transparency_1,
					Font = font_1,
					Text = subTitleText,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.AtEnd
				})
			})
		}),
		rightAlign = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			layout = reactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			padding = reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, var11.right) }),
			icon = reactModule.createElement(imageSetLabel, {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, iconSize.Regular, 0, iconSize.Regular),
				ScaleType = Enum.ScaleType.Stretch,
				Image = pushRight,
				ImageColor3 = var8.Theme.IconEmphasis.Color,
				ImageTransparency = var8.Theme.IconEmphasis.Transparency
			})
		}),
		divider = if not fFlagAppChatRemoveConversationListDividerModule then reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			layout = reactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				HorizontalAlignment = Enum.HorizontalAlignment.Right
			}),
			divider = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = var8.Theme.Divider.Transparency,
				BackgroundColor3 = var8.Theme.Divider.Color,
				Size = UDim2.new(1, -var15, 0, 1)
			})
		}) else nil
	})
end

return CustomConversationListEntry