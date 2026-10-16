local Parent = script:FindFirstAncestor("AuthCommon").Parent
local AppFonts = require(Parent.Style).AppFonts
local RoactModule = require(Parent.Roact)
local ImageSetLabel = require(Parent.UIBlox).Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local LoginSearchBar = RoactModule.PureComponent:extend("LoginSearchBar")

function LoginSearchBar.init(p1) --[[ Line: 18 ]]
	p1.state = { longText = false }
	p1.lastInput = 0
	
	function p1.searchTextChanged(Frame) --[[ Line: 25 ]]
		-- upvalues: p1 (copy)
		local IsXAbove = Frame.TextBounds.X > Frame.AbsoluteSize.X
		
		if IsXAbove ~= p1.state.longText then
			Frame.TextXAlignment = IsXAbove and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left
			spawn(function() --[[ Line: 29 ]]
				-- upvalues: p1 (upval), IsXAbove (copy)
				p1:setState({ longText = IsXAbove })
			end)
		end
		if p1.props.TextChanged then
			p1.lastInput += 1
			local LastInput = p1.lastInput
			wait(0.3)
			
			if LastInput == p1.lastInput then
				p1.props.TextChanged(Frame)
			end
		end
	end
end

function LoginSearchBar.render(p1) --[[ Line: 47 ]]
	-- upvalues: RoactModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy), AppFonts (copy)
	local Offset: number = p1.props.Size.Y.Offset
	local IconSize = p1.props.IconSize
	local TextColor3 = p1.props.TextColor3
	
	return RoactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.props.Size,
		Position = p1.props.Position,
		Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
		ImageColor3 = p1.props.ImageColor3,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(8, 8, 9, 9)
	}, {
		SearchIcon = RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, IconSize, 0, IconSize),
			Position = UDim2.new(0, Offset * 0.5, 0, Offset * 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = GetImageDataFunction("LuaApp/icons/ic-search-new") or "LuaApp/icons/ic-search-new",
			ImageColor3 = TextColor3
		}),
		SearchInput = RoactModule.createElement("TextBox", {
			Size = UDim2.new(1, -Offset - 10, 1, 0),
			Position = UDim2.new(0, Offset, 0, 0),
			TextSize = p1.props.TextSize,
			TextColor3 = TextColor3,
			PlaceholderText = p1.props.PlaceholderText,
			PlaceholderColor3 = p1.props.PlaceholderColor3,
			Font = AppFonts.default:getDefault(),
			TextXAlignment = p1.state.longText and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Text = p1.props.Text,
			ClearTextOnFocus = false,
			ClipsDescendants = true,
			[RoactModule.Change.Text] = p1.searchTextChanged
		})
	})
end

return LoginSearchBar