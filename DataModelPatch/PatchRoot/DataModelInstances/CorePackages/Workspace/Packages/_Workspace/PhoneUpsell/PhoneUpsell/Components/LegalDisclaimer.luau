local Parent = script:FindFirstAncestor("PhoneUpsell").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Checkbox = require(Parent.Foundation).Checkbox
local LinkButton = UIBloxModule.App.Button.LinkButton
local UseStyleFunction = UIBloxModule.Core.Style.useStyle

return function(Frame)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), Checkbox (copy), LinkButton (copy)
	local UseStyleResult = UseStyleFunction()
	local BaseSize = UseStyleResult.Font.BaseSize
	local RelativeSize = UseStyleResult.Font.CaptionHeader.RelativeSize
	local Size150: number = UseStyleResult.Tokens.Size.Size_150
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = Frame.LayoutOrder
	}, {
		ListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseStyleResult.Tokens.Size.Size_150)
		}),
		LegalTextContainer = if Frame.showLegalText and Frame.showLegalTextCheckbox then ReactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, Size150)
			}),
			LegalCheckbox = ReactModule.createElement(Checkbox, {
				label = "",
				onActivated = Frame.setLegalTextChecked,
				isChecked = Frame.legalTextChecked
			}),
			LegalText = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = Frame.legalText,
				TextSize = BaseSize * RelativeSize,
				TextColor3 = UseStyleResult.Theme.TextDefault.Color,
				TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
				Font = UseStyleResult.Font.Body.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, -(26 + Size150), 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			})
		}) else Frame.showLegalText and ReactModule.createElement("TextLabel", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = Frame.legalText,
			TextSize = BaseSize * RelativeSize,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
			Font = UseStyleResult.Font.Body.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}),
		LegalButtonsContainer = Frame.showLegalButtons and ReactModule.createElement("Frame", {
			LayoutOrder = 4,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 5)
			}),
			TermsOfUseButton = ReactModule.createElement(LinkButton, {
				layoutOrder = 5,
				fontStyle = "CaptionBody",
				text = Frame.termsOfUse,
				onActivated = Frame.onTermsOfUseClick
			}),
			TextButtonDivider = ReactModule.createElement("TextLabel", {
				LayoutOrder = 6,
				BackgroundTransparency = 1,
				Text = "-",
				TextWrapped = true,
				TextSize = BaseSize * RelativeSize,
				TextColor3 = UseStyleResult.Theme.TextDefault.Color,
				TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
				Font = UseStyleResult.Font.Body.Font,
				TextXAlignment = Enum.TextXAlignment.Center,
				AutomaticSize = Enum.AutomaticSize.XY
			}),
			PrivacyPolicyButton = ReactModule.createElement(LinkButton, {
				layoutOrder = 7,
				fontStyle = "CaptionBody",
				text = Frame.privacyPolicy,
				onActivated = Frame.onPrivacyPolicyClick
			})
		})
	})
end