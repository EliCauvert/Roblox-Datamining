local parent = script:FindFirstAncestor("AuthCommon").Parent
local appFonts = require(parent.Style).AppFonts
local roactModule = require(parent.Roact)
local imageSetLabel = require(parent.UIBlox).Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local loginSearchBar = roactModule.PureComponent:extend("LoginSearchBar")

function loginSearchBar.init(p1)
	p1.state = { longText = false }
	p1.lastInput = 0
	
	function p0.searchTextChanged(p2)
		-- upvalues: p1 (ref)
		local var1 = p2.AbsoluteSize.X < p2.TextBounds.X
		
		if var1 ~= p1.state.longText then
			p2.TextXAlignment = if var1 then Enum.TextXAlignment.Right else Enum.TextXAlignment.Left
			spawn(function()
				-- upvalues: p1 (copy), var1 (ref)
				p1:setState({ longText = var1 })
			end)
		end
		if p1.props.TextChanged then
			p1.lastInput += 1
			local lastInput = p1.lastInput
			wait(0.3)
			
			if lastInput == p1.lastInput then
				p1.props.TextChanged(p2)
			end
		end
	end
end

function loginSearchBar.render(p1)
	-- upvalues: roactModule (ref), imageSetLabel (ref), getImageData (ref), appFonts (ref)
	local offset = p1.props.Size.Y.Offset
	local iconSize = p1.props.IconSize
	local textColor3 = p1.props.TextColor3
	
	return roactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.props.Size,
		Position = p1.props.Position,
		Image = getImageData("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
		ImageColor3 = p1.props.ImageColor3,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(8, 8, 9, 9)
	}, {
		SearchIcon = roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, iconSize, 0, iconSize),
			Position = UDim2.new(0, offset * 0.5, 0, offset * 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = getImageData("LuaApp/icons/ic-search-new") or "LuaApp/icons/ic-search-new",
			ImageColor3 = textColor3
		}),
		SearchInput = roactModule.createElement("TextBox", {
			Size = UDim2.new(1, (-offset) - 10, 1, 0),
			Position = UDim2.new(0, offset, 0, 0),
			TextSize = p1.props.TextSize,
			TextColor3 = textColor3,
			PlaceholderText = p1.props.PlaceholderText,
			PlaceholderColor3 = p1.props.PlaceholderColor3,
			Font = appFonts.default:getDefault(),
			TextXAlignment = if p1.state.longText then Enum.TextXAlignment.Right else Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Text = p1.props.Text,
			ClearTextOnFocus = false,
			ClipsDescendants = true,
			[roactModule.Change.Text] = p1.searchTextChanged
		})
	})
end

return loginSearchBar