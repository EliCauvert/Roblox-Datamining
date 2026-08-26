local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local cryoModule = require(corePackagesService.Packages.Cryo)
local useStyle = require(corePackagesService.Packages.UIBlox).Core.Style.useStyle
local nameTextBoxModule = require(script.Parent.NameTextBox)
local t = { textBoxHeight = 30, topPadding = 0 }

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), reactModule (ref), nameTextBoxModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useStyle()
	local font = var2.Font
	local captionHeader = font.CaptionHeader
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 19 + var1.textBoxHeight + var1.topPadding),
		LayoutOrder = var1.LayoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 4)
		}),
		UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var1.topPadding) }),
		TextboxLabel = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 15),
			Font = captionHeader.Font,
			Text = var1.labelText,
			TextSize = font.BaseSize * captionHeader.RelativeSize,
			TextColor3 = var2.Theme.TextDefault.Color,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Textbox = reactModule.createElement(nameTextBoxModule, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, var1.textBoxHeight),
			maxLength = var1.maxLength,
			onNameUpdated = var1.onTextUpdated,
			defaultName = var1.defaultText,
			centerText = var1.centerText,
			nameTextBoxRef = var1.textBoxRef,
			invalidInputText = var1.invalidInputText
		})
	})
end