local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local NameTextBoxModule = require(script.Parent.NameTextBox)
local config = { textBoxHeight = 30, topPadding = 0 }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), ReactModule (copy), NameTextBoxModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local CaptionHeader = UseStyleResultFont.CaptionHeader
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 19 + JoinResult.textBoxHeight + JoinResult.topPadding),
		LayoutOrder = JoinResult.LayoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 4)
		}),
		UIPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, JoinResult.topPadding) }),
		TextboxLabel = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 15),
			Font = CaptionHeader.Font,
			Text = JoinResult.labelText,
			TextSize = UseStyleResultFont.BaseSize * CaptionHeader.RelativeSize,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Textbox = ReactModule.createElement(NameTextBoxModule, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, JoinResult.textBoxHeight),
			maxLength = JoinResult.maxLength,
			onNameUpdated = JoinResult.onTextUpdated,
			defaultName = JoinResult.defaultText,
			centerText = JoinResult.centerText,
			nameTextBoxRef = JoinResult.textBoxRef,
			invalidInputText = JoinResult.invalidInputText
		})
	})
end