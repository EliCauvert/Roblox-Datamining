local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local scrollingTextBoxModule = require(script.Parent.ScrollingTextBox)
local constantsModule = require(script.Parent.Parent.Constants)
local searchBar = roactModule.Component:extend("SearchBar")

function searchBar.render(p0)
	-- upvalues: roactModule (ref), constantsModule (ref), scrollingTextBoxModule (ref)
	local size = p0.props.size
	local pos = p0.props.pos
	local frameHeight = p0.props.frameHeight
	local textSize = p0.props.textSize
	local font = p0.props.font
	local searchTerm = p0.props.searchTerm
	local var4 = frameHeight * 0.6
	
	return roactModule.createElement("Frame", {
		Size = size,
		Position = pos,
		BackgroundColor3 = constantsModule.Color.UnselectedGray,
		BorderColor3 = constantsModule.Color.BorderGray,
		Visible = p0.props.visible,
		LayoutOrder = p0.props.layoutOrder
	}, {
		SearchImage = roactModule.createElement("ImageLabel", {
			Name = "SearchIcon",
			BackgroundTransparency = 1,
			Size = UDim2.new(0, var4, 0, var4),
			Position = UDim2.new(0, 10, 0.5, -var4 / 2),
			Image = constantsModule.Image.Search
		}),
		ClearButton = p0.props.showClear and roactModule.createElement("ImageButton", {
			Size = UDim2.new(0, -var4, 0, var4),
			Position = UDim2.new(1, -10, 0.5, -var4 / 2),
			BackgroundTransparency = 1,
			Image = constantsModule.Image.Clear,
			[roactModule.Event.InputEnded] = p0.props.cancelInput
		}),
		InputField = roactModule.createElement(scrollingTextBoxModule, {
			Text = searchTerm or "",
			TextSize = textSize,
			Font = font,
			Size = UDim2.new(1, -(2 * frameHeight), 1, 0),
			Position = UDim2.new(0, 20 + var4, 0, 0),
			ShowNativeInput = true,
			TextColor3 = constantsModule.Color.Text,
			BackgroundTransparency = 1,
			TextXAlignment = 0,
			ClearTextOnFocus = false,
			PlaceholderText = "Search",
			[roactModule.Ref] = p0.props.refForParent,
			TextBoxFocusLost = p0.props.focusLost
		})
	})
end

return searchBar