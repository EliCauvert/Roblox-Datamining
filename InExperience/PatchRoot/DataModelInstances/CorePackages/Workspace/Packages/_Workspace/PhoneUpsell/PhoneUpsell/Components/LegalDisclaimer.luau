local parent = script:FindFirstAncestor("PhoneUpsell").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local checkbox = require(parent.Foundation).Checkbox
local linkButton = UIBloxModule.App.Button.LinkButton
local useStyle = UIBloxModule.Core.Style.useStyle

return function(p0) --[[ line: 30 ]]
	-- upvalues: useStyle (ref), reactModule (ref), checkbox (ref), linkButton (ref)
	local var2 = useStyle()
	local baseSize = var2.Font.BaseSize
	local relativeSize = var2.Font.CaptionHeader.RelativeSize
	local size150 = var2.Tokens.Size.Size_150
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p0.LayoutOrder
	}, {
		ListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var2.Tokens.Size.Size_150)
		}),
		LegalTextContainer = if p0.showLegalText and p0.showLegalTextCheckbox then reactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, size150)
			}),
			LegalCheckbox = reactModule.createElement(checkbox, {
				label = "",
				onActivated = p0.setLegalTextChecked,
				isChecked = p0.legalTextChecked
			}),
			LegalText = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = p0.legalText,
				TextSize = baseSize * relativeSize,
				TextColor3 = var2.Theme.TextDefault.Color,
				TextTransparency = var2.Theme.TextDefault.Transparency,
				Font = var2.Font.Body.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, -(26 + size150), 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			})
		}) else p0.showLegalText and reactModule.createElement("TextLabel", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = p0.legalText,
			TextSize = baseSize * relativeSize,
			TextColor3 = var2.Theme.TextDefault.Color,
			TextTransparency = var2.Theme.TextDefault.Transparency,
			Font = var2.Font.Body.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}),
		LegalButtonsContainer = p0.showLegalButtons and reactModule.createElement("Frame", {
			LayoutOrder = 4,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 5)
			}),
			TermsOfUseButton = reactModule.createElement(linkButton, {
				layoutOrder = 5,
				fontStyle = "CaptionBody",
				text = p0.termsOfUse,
				onActivated = p0.onTermsOfUseClick
			}),
			TextButtonDivider = reactModule.createElement("TextLabel", {
				LayoutOrder = 6,
				BackgroundTransparency = 1,
				Text = "-",
				TextWrapped = true,
				TextSize = baseSize * relativeSize,
				TextColor3 = var2.Theme.TextDefault.Color,
				TextTransparency = var2.Theme.TextDefault.Transparency,
				Font = var2.Font.Body.Font,
				TextXAlignment = Enum.TextXAlignment.Center,
				AutomaticSize = Enum.AutomaticSize.XY
			}),
			PrivacyPolicyButton = reactModule.createElement(linkButton, {
				layoutOrder = 7,
				fontStyle = "CaptionBody",
				text = p0.privacyPolicy,
				onActivated = p0.onPrivacyPolicyClick
			})
		})
	})
end