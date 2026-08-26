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

function CustomConversationListEntry(p1)
	-- upvalues: useStyle (ref), getBoldTextThemeModule (ref), useTextSizeOffset (ref), useChatPagePaddingModule (ref), iconSize (ref), foundationModule (ref), reactModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), imageSetLabel (ref), pushRight (ref), fFlagAppChatRemoveConversationListDividerModule (ref)
	local var1 = useStyle()
	local var2 = getBoldTextThemeModule(var1)
	local var3 = useTextSizeOffset()
	local var4 = useChatPagePaddingModule()
	local onActivated = p1.onActivated
	local titleText = p1.titleText
	local font = var2.Font.Header2.Font
	local transparency = var2.Theme.TextEmphasis.Transparency
	local color = var2.Theme.TextEmphasis.Color
	local var5 = var2.Font.Header2.RelativeSize * var2.Font.BaseSize
	local var6 = var5 + var3
	local subTitleText = p1.subTitleText
	local font_1 = var1.Font.CaptionBody.Font
	local transparency_1 = var1.Theme.TextDefault.Transparency
	local color_1 = var1.Theme.TextDefault.Color
	local var7 = var1.Font.CaptionBody.RelativeSize * var1.Font.BaseSize
	local var8 = 60 - (60 - iconSize.Regular) / 2
	
	return reactModule.createElement(foundationModule.View, {
		Size = UDim2.new(1, 0, 0, p1.entryHeight),
		BackgroundColor3 = var1.Theme.BackgroundDefault.Color,
		BackgroundTransparency = var1.Theme.BackgroundDefault.Transparency,
		onActivated = onActivated,
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then p1.testId else nil
	}, {
		leftAlign = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -(iconSize.Regular + 12), 1, 0)
		}, {
			padding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var4.left) }),
			layout = reactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			iconHolder = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(0, var8, 1, 0)
			}, {
				layout = reactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Left
				}),
				icon = reactModule.createElement(imageSetLabel, {
					BorderSizePixel = 0,
					BackgroundColor3 = var2.Theme.BackgroundUIDefault.Color,
					BackgroundTransparency = var2.Theme.BackgroundUIDefault.Transparency,
					Size = UDim2.new(0, iconSize.Regular, 0, iconSize.Regular),
					ScaleType = Enum.ScaleType.Stretch,
					Image = p1.entryIcon,
					ImageColor3 = var1.Theme.IconEmphasis.Color,
					ImageTransparency = var1.Theme.IconEmphasis.Transparency
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
					Size = UDim2.new(1, 0, 0, var6),
					TextSize = var5,
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
					Size = UDim2.new(1, 0, 0, var7 + var3),
					TextSize = var7,
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
			padding = reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, var4.right) }),
			icon = reactModule.createElement(imageSetLabel, {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, iconSize.Regular, 0, iconSize.Regular),
				ScaleType = Enum.ScaleType.Stretch,
				Image = pushRight,
				ImageColor3 = var1.Theme.IconEmphasis.Color,
				ImageTransparency = var1.Theme.IconEmphasis.Transparency
			})
		}),
		divider = if not fFlagAppChatRemoveConversationListDividerModule then reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			layout = reactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				HorizontalAlignment = Enum.HorizontalAlignment.Right
			}),
			divider = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = var1.Theme.Divider.Transparency,
				BackgroundColor3 = var1.Theme.Divider.Color,
				Size = UDim2.new(1, -var8, 0, 1)
			})
		}) else nil
	})
end

return CustomConversationListEntry