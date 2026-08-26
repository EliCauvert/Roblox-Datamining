local roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact
local sortedListModule = require(script.Parent.SortedList)
local callbackInputBoxWithIconModule = require(script.Parent.CallbackInputBoxWithIcon)
local filteredScrollingList = roact.Component:extend("FilteredScrollingList")
filteredScrollingList.defaultProps = {
	searchBoxCornerRadius = 0,
	searchBoxHeight = 48,
	searchBoxTopPadding = 0,
	searchBoxLeftPadding = 0,
	searchBoxRightPadding = 0,
	searchBoxBottomPadding = 0,
	searchBackgroundTransparency = 0,
	searchBackgroundColor3 = Color3.new(1, 0, 1),
	searchBoxBorderThickness = 0,
	searchIconCellWidth = 60,
	searchIconSize = 24,
	searchIconColor3 = Color3.new(1, 0, 1),
	searchIconTransparency = 0,
	searchIconImage = "rbxasset://textures/ui/LuaChat/icons/ic-search.png",
	searchInputTextFont = nil,
	searchInputTextColor3 = nil,
	searchInputTextSize = nil,
	searchInputTextTransparency = nil,
	searchPlaceholderTextTransparency = nil,
	searchPlaceholderTextColor3 = nil,
	searchPlaceholderText = nil,
	searchClearIconColor3 = nil,
	searchClearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-close-white.png",
	searchDividerColor3 = Color3.new(1, 0, 1),
	searchDividerTransparency = 0,
	searchDividerHeight = 1,
	scrollBarImageTransparency = 0,
	scrollBarImageColor3 = Color3.new(1, 0, 1),
	entries = {},
	renderEntry = nil,
	entryHeight = 54,
	scrollTouchedBottomCallback = nil,
	filterPredicate = function(_, _)
		return true
	end,
	sortComparator = function(_, _)
		return true
	end
}

function filteredScrollingList.shouldUpdate(p1, p2, p3)
	if p3 ~= p1.state then
		return true
	elseif p2 == p1.props then
		return false
	end
	for i, v in pairs(p2) do
		if i ~= "extraProps" or p1.props.extraProps then
			if p1.props[i] ~= v then
				return true
			end
		end
		return true
	end
	for i, v in pairs(p1.props) do
		if i ~= "extraProps" then
			if p2[i] ~= v then
				return true
			end
		end
		if p2.extraProps then
			for i_2, v_2 in pairs(v) do
				if p2.extraProps[i_2] ~= v_2 then
					return true
				end
			end
		end
		return true
	end
	return false
end

function filteredScrollingList.init(p4)
	p4:setState({})
end

function filteredScrollingList.render(p4)
	-- upvalues: roact (ref), sortedListModule (ref), callbackInputBoxWithIconModule (ref)
	local filterPredicate = p4.props.filterPredicate
	local filterText = p4.state.filterText
	local t = {}
	local var1 = 0
	
	for i, v in pairs(p4.props.entries) do
		if filterPredicate(filterText, v) then
			var1 += 1
			table.insert(t, v)
		end
	end
	return roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		layout = roact.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		dividerTop = roact.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 1,
			BackgroundColor3 = p4.props.searchDividerColor3,
			BackgroundTransparency = p4.props.searchDividerTransparency,
			Size = UDim2.new(1, 0, 0, p4.props.searchDividerHeight)
		}),
		callbackBoxContainer = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -p4.props.searchBoxBorderThickness * 2, 0, p4.props.searchBoxHeight + p4.props.searchBoxTopPadding + p4.props.searchBoxBottomPadding)
		}, {
			UIPadding = roact.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, p4.props.searchBoxBottomPadding),
				PaddingLeft = UDim.new(0, p4.props.searchBoxLeftPadding),
				PaddingRight = UDim.new(0, p4.props.searchBoxRightPadding),
				PaddingTop = UDim.new(0, p4.props.searchBoxTopPadding)
			}),
			callbackBox = roact.createElement(callbackInputBoxWithIconModule, {
				backgroundTransparency = p4.props.searchBackgroundTransparency,
				backgroundColor3 = p4.props.searchBackgroundColor3,
				borderColor = p4.props.searchBoxBorderColor,
				borderTransparency = p4.props.searchBoxBorderTransparency,
				borderThickness = p4.props.searchBoxBorderThickness,
				cornerRadius = p4.props.searchBoxCornerRadius,
				iconCellWidth = p4.props.searchIconCellWidth,
				iconSize = p4.props.searchIconSize,
				iconColor3 = p4.props.searchIconColor3,
				iconTransparency = p4.props.searchIconTransparency,
				iconImage = p4.props.searchIconImage,
				inputTextFont = p4.props.searchInputTextFont,
				inputTextColor3 = p4.props.searchInputTextColor3,
				inputTextSize = p4.props.searchInputTextSize,
				inputTextTransparency = p4.props.searchInputTextTransparency,
				placeholderTextTransparency = p4.props.searchPlaceholderTextTransparency,
				placeholderTextColor3 = p4.props.searchPlaceholderTextColor3,
				placeholderText = p4.props.searchPlaceholderText,
				clearIconColor3 = p4.props.searchClearIconColor3,
				clearIcon = p4.props.searchClearIcon,
				textChangedCallback = function(p5)
					-- upvalues: p4 (ref)
					p4:setState({ filterText = p5 })
				end
			})
		}),
		dividerBottom = roact.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 3,
			BackgroundColor3 = p4.props.searchDividerColor3,
			BackgroundTransparency = p4.props.searchDividerTransparency,
			Size = UDim2.new(1, 0, 0, p4.props.searchDividerHeight)
		}),
		entryList = roact.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, (-p4.props.searchBoxHeight) - p4.props.searchBoxTopPadding - p4.props.searchBoxBottomPadding - p4.props.searchDividerHeight * 2),
			CanvasSize = UDim2.new(0, 0, 0, var1 * p4.props.entryHeight),
			BackgroundTransparency = 1,
			ScrollBarThickness = 5,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarImageTransparency = p4.props.scrollBarImageTransparency,
			ScrollBarImageColor3 = p4.props.scrollBarImageColor3,
			BottomImage = "rbxasset://textures/ui/LuaChat/9-slice/scroll-bar.png",
			MidImage = "rbxasset://textures/ui/LuaChat/9-slice/scroll-bar.png",
			TopImage = "rbxasset://textures/ui/LuaChat/9-slice/scroll-bar.png",
			LayoutOrder = 4,
			[roact.Change.CanvasPosition] = function(p5)
				-- upvalues: p4 (ref)
				local offset = p5.CanvasSize.Y.Offset
				
				if not p4.isTouchingBottom and offset <= p5.CanvasPosition.Y + p5.AbsoluteSize.Y then
					p4.isTouchingBottom = true
					
					if p4.props.scrollTouchedBottomCallback then
						p4.props.scrollTouchedBottomCallback()
						
						return
					end
				elseif p5.CanvasPosition.Y + p5.AbsoluteSize.Y < offset then
					p4.isTouchingBottom = false
				end
			end
		}, {
			sortedList = roact.createElement(sortedListModule, {
				entries = t,
				renderEntry = p4.props.renderEntry,
				entryHeight = p4.props.entryHeight,
				sortComparator = p4.props.sortComparator
			})
		})
	})
end

return filteredScrollingList