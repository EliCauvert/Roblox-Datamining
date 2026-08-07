local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local cryoModule = require(corePackagesService.Packages.Cryo)
local useStyle = require(corePackagesService.Packages.UIBlox).Core.Style.useStyle
local nameTextBoxModule = require(script.Parent.NameTextBox)
local t = { textBoxHeight = 30, topPadding = 0 }

return function(p0) --[[ line: 43 | named "LabeledTextBox" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), reactModule (ref), nameTextBoxModule (ref)
	local var5 = cryoModule.Dictionary.join(t, p0)
	local var6 = useStyle()
	local font = var6.Font
	local captionHeader = font.CaptionHeader
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 19 + var5.textBoxHeight + var5.topPadding),
		LayoutOrder = var5.LayoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 4)
		}),
		UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var5.topPadding) }),
		TextboxLabel = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 15),
			Font = captionHeader.Font,
			Text = var5.labelText,
			TextSize = font.BaseSize * captionHeader.RelativeSize,
			TextColor3 = var6.Theme.TextDefault.Color,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Textbox = reactModule.createElement(nameTextBoxModule, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, var5.textBoxHeight),
			maxLength = var5.maxLength,
			onNameUpdated = var5.onTextUpdated,
			defaultName = var5.defaultText,
			centerText = var5.centerText,
			nameTextBoxRef = var5.textBoxRef,
			invalidInputText = var5.invalidInputText
		})
	})
end