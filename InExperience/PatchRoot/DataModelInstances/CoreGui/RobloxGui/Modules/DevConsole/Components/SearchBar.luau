local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ScrollingTextBoxModule = require(script.Parent.ScrollingTextBox)
local ConstantsModule = require(script.Parent.Parent.Constants)
local SearchBar = RoactModule.Component:extend("SearchBar")

function SearchBar.render(p1)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), ScrollingTextBoxModule (copy)
	local FrameHeight: number = p1.props.frameHeight
	local SearchTerm = p1.props.searchTerm
	local XOffset = FrameHeight * 0.6
	
	return RoactModule.createElement("Frame", {
		Size = p1.props.size,
		Position = p1.props.pos,
		BackgroundColor3 = ConstantsModule.Color.UnselectedGray,
		BorderColor3 = ConstantsModule.Color.BorderGray,
		Visible = p1.props.visible,
		LayoutOrder = p1.props.layoutOrder
	}, {
		SearchImage = RoactModule.createElement("ImageLabel", {
			Name = "SearchIcon",
			BackgroundTransparency = 1,
			Size = UDim2.new(0, XOffset, 0, XOffset),
			Position = UDim2.new(0, 10, 0.5, -XOffset / 2),
			Image = ConstantsModule.Image.Search
		}),
		ClearButton = p1.props.showClear and RoactModule.createElement("ImageButton", {
			Size = UDim2.new(0, -XOffset, 0, XOffset),
			Position = UDim2.new(1, -10, 0.5, -XOffset / 2),
			BackgroundTransparency = 1,
			Image = ConstantsModule.Image.Clear,
			[RoactModule.Event.InputEnded] = p1.props.cancelInput
		}),
		InputField = RoactModule.createElement(ScrollingTextBoxModule, {
			Text = SearchTerm and SearchTerm or "",
			TextSize = p1.props.textSize,
			Font = p1.props.font,
			Size = UDim2.new(1, -(2 * FrameHeight), 1, 0),
			Position = UDim2.new(0, 20 + XOffset, 0, 0),
			ShowNativeInput = true,
			TextColor3 = ConstantsModule.Color.Text,
			BackgroundTransparency = 1,
			TextXAlignment = 0,
			ClearTextOnFocus = false,
			PlaceholderText = "Search",
			[RoactModule.Ref] = p1.props.refForParent,
			TextBoxFocusLost = p1.props.focusLost
		})
	})
end

return SearchBar