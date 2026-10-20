local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ShareGame = RobloxGui.Modules.Settings.Pages.ShareGame
local ConstantsModule = require(ShareGame.Constants)
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local ConversationDetails = ThemeModule.font(Enum.Font.SourceSans, "ConversationDetails")
local WHITE = ConstantsModule.Color.WHITE
local TextSizeResult = ThemeModule.textSize(19)
local ConversationDetails1 = ThemeModule.font(Enum.Font.SourceSans, "ConversationDetails")
local GRAY3 = ConstantsModule.Color.GRAY3
local ConversationDetails2 = ThemeModule.textSize(16, "ConversationDetails")
local ConversationDetails3 = ThemeModule.font(Enum.Font.SourceSans, "ConversationDetails")
local ConversationDetails4 = ThemeModule.textSize(16, "ConversationDetails")
local Translator = require(ShareGame.getTranslator)()
local ConversationDetails5 = RoactModule.PureComponent:extend("ConversationDetails")

function ConversationDetails5.render(p1)
	-- upvalues: RoactModule (copy), ConversationDetails2 (copy), ConversationDetails1 (copy), GRAY3 (copy), ConversationDetails4 (copy), Translator (copy), ConstantsModule (copy), ConversationDetails3 (copy), TextSizeResult (copy), ConversationDetails (copy), WHITE (copy)
	local Subtitle = p1.props.subtitle
	local Presence = p1.props.presence
	local ZIndex = p1.props.zIndex
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.props.size,
		LayoutOrder = p1.props.layoutOrder,
		ZIndex = ZIndex
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 2)
		}),
		Title = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 0,
			Size = UDim2.new(1, 0, 0, TextSizeResult),
			Text = p1.props.title or "",
			Font = ConversationDetails,
			TextColor3 = WHITE,
			TextSize = TextSizeResult,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = ZIndex
		}),
		Subtitle = if Subtitle == nil then nil else RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, ConversationDetails2),
			Text = Subtitle,
			Font = ConversationDetails1,
			TextColor3 = GRAY3,
			TextSize = ConversationDetails2,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = ZIndex
		}),
		Presence = if Presence == nil then nil else RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, ConversationDetails4),
			Text = Translator:FormatByKey(ConstantsModule.PresenceTextKey[Presence]),
			Font = ConversationDetails3,
			TextColor3 = ConstantsModule.PresenceColors[Presence],
			TextSize = ConversationDetails4,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = ZIndex
		})
	})
end

return ConversationDetails5