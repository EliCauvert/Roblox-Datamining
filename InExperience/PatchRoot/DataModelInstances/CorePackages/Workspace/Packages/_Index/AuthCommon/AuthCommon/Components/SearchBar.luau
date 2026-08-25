local parent = script:FindFirstAncestor("AuthCommon").Parent
local appFonts = require(parent.Style).AppFonts
local roactModule = require(parent.Roact)
local imageSetLabel = require(parent.UIBlox).Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local loginSearchBar = roactModule.PureComponent:extend("LoginSearchBar")

function loginSearchBar.init(p0)
	p0.state = { longText = false }
	p0.lastInput = 0
	
	function p0.searchTextChanged(p1)
		-- upvalues: p0 (ref)
		local var2 = p1.AbsoluteSize.X < p1.TextBounds.X
		
		if var2 ~= p0.state.longText then
			p1.TextXAlignment = if var2 then Enum.TextXAlignment.Right else Enum.TextXAlignment.Left
			spawn(function()
				-- upvalues: p0 (copy), var2 (ref)
				p0:setState({ longText = var2 })
			end)
		end
		if p0.props.TextChanged then
			p0.lastInput += 1
			local lastInput = p0.lastInput
			wait(0.3)
			
			if lastInput == p0.lastInput then
				p0.props.TextChanged(p1)
			end
		end
	end
end

function loginSearchBar.render(p2)
	-- upvalues: roactModule (ref), imageSetLabel (ref), getImageData (ref), appFonts (ref)
	local offset = p2.props.Size.Y.Offset
	local iconSize = p2.props.IconSize
	local textColor3 = p2.props.TextColor3
	
	return roactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p2.props.Size,
		Position = p2.props.Position,
		Image = getImageData("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
		ImageColor3 = p2.props.ImageColor3,
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
			TextSize = p2.props.TextSize,
			TextColor3 = textColor3,
			PlaceholderText = p2.props.PlaceholderText,
			PlaceholderColor3 = p2.props.PlaceholderColor3,
			Font = appFonts.default:getDefault(),
			TextXAlignment = if p2.state.longText then Enum.TextXAlignment.Right else Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Text = p2.props.Text,
			ClearTextOnFocus = false,
			ClipsDescendants = true,
			[roactModule.Change.Text] = p2.searchTextChanged
		})
	})
end

return loginSearchBar