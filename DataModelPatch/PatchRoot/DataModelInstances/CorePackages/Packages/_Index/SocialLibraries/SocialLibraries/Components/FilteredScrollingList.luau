local Roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact
local SortedListModule = require(script.Parent.SortedList)
local CallbackInputBoxWithIconModule = require(script.Parent.CallbackInputBoxWithIcon)
local FilteredScrollingList = Roact.Component:extend("FilteredScrollingList")
FilteredScrollingList.defaultProps = {
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
	filterPredicate = function(_, _): boolean
		return true
	end,
	sortComparator = function(_, _): boolean
		return true
	end
}

function FilteredScrollingList.shouldUpdate(p1, Props, State): boolean
	if State ~= p1.state then
		return true
	end
	if Props == p1.props then
		return false
	end
	for i, prop in pairs(Props) do
		if i == "extraProps" and not p1.props.extraProps then
			return true
		elseif p1.props[i] ~= prop then
			return true
		end
	end
	for i1, prop1 in pairs(p1.props) do
		if i1 ~= "extraProps" then
			if Props[i1] ~= prop1 then
				return true
			end
			continue
		end
		if not Props.extraProps then
			return true
		end
		for i2, value in pairs(prop1) do
			if Props.extraProps[i2] ~= value then
				return true
			end
		end
	end
	return false
end

function FilteredScrollingList.init(p2)
	p2:setState({})
end

function FilteredScrollingList.render(p2)
	-- upvalues: Roact (copy), SortedListModule (copy), CallbackInputBoxWithIconModule (copy)
	local FilterPredicateFunction = p2.props.filterPredicate
	local FilterText = p2.state.filterText
	local Entries = {}
	local Count = 0
	
	for _, entry in pairs(p2.props.entries) do
		if FilterPredicateFunction(FilterText, entry) then
			Count += 1
			table.insert(Entries, entry)
		end
	end
	return Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		layout = Roact.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		dividerTop = Roact.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 1,
			BackgroundColor3 = p2.props.searchDividerColor3,
			BackgroundTransparency = p2.props.searchDividerTransparency,
			Size = UDim2.new(1, 0, 0, p2.props.searchDividerHeight)
		}),
		callbackBoxContainer = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -p2.props.searchBoxBorderThickness * 2, 0, p2.props.searchBoxHeight + p2.props.searchBoxTopPadding + p2.props.searchBoxBottomPadding)
		}, {
			UIPadding = Roact.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, p2.props.searchBoxBottomPadding),
				PaddingLeft = UDim.new(0, p2.props.searchBoxLeftPadding),
				PaddingRight = UDim.new(0, p2.props.searchBoxRightPadding),
				PaddingTop = UDim.new(0, p2.props.searchBoxTopPadding)
			}),
			callbackBox = Roact.createElement(CallbackInputBoxWithIconModule, {
				backgroundTransparency = p2.props.searchBackgroundTransparency,
				backgroundColor3 = p2.props.searchBackgroundColor3,
				borderColor = p2.props.searchBoxBorderColor,
				borderTransparency = p2.props.searchBoxBorderTransparency,
				borderThickness = p2.props.searchBoxBorderThickness,
				cornerRadius = p2.props.searchBoxCornerRadius,
				iconCellWidth = p2.props.searchIconCellWidth,
				iconSize = p2.props.searchIconSize,
				iconColor3 = p2.props.searchIconColor3,
				iconTransparency = p2.props.searchIconTransparency,
				iconImage = p2.props.searchIconImage,
				inputTextFont = p2.props.searchInputTextFont,
				inputTextColor3 = p2.props.searchInputTextColor3,
				inputTextSize = p2.props.searchInputTextSize,
				inputTextTransparency = p2.props.searchInputTextTransparency,
				placeholderTextTransparency = p2.props.searchPlaceholderTextTransparency,
				placeholderTextColor3 = p2.props.searchPlaceholderTextColor3,
				placeholderText = p2.props.searchPlaceholderText,
				clearIconColor3 = p2.props.searchClearIconColor3,
				clearIcon = p2.props.searchClearIcon,
				textChangedCallback = function(FilterText)
					-- upvalues: p2 (copy)
					p2:setState({ filterText = FilterText })
				end
			})
		}),
		dividerBottom = Roact.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 3,
			BackgroundColor3 = p2.props.searchDividerColor3,
			BackgroundTransparency = p2.props.searchDividerTransparency,
			Size = UDim2.new(1, 0, 0, p2.props.searchDividerHeight)
		}),
		entryList = Roact.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, -p2.props.searchBoxHeight - p2.props.searchBoxTopPadding - p2.props.searchBoxBottomPadding - p2.props.searchDividerHeight * 2),
			CanvasSize = UDim2.new(0, 0, 0, Count * p2.props.entryHeight),
			BackgroundTransparency = 1,
			ScrollBarThickness = 5,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarImageTransparency = p2.props.scrollBarImageTransparency,
			ScrollBarImageColor3 = p2.props.scrollBarImageColor3,
			BottomImage = "rbxasset://textures/ui/LuaChat/9-slice/scroll-bar.png",
			MidImage = "rbxasset://textures/ui/LuaChat/9-slice/scroll-bar.png",
			TopImage = "rbxasset://textures/ui/LuaChat/9-slice/scroll-bar.png",
			LayoutOrder = 4,
			[Roact.Change.CanvasPosition] = function(ScrollFrame)
				-- upvalues: p2 (copy)
				local Offset = ScrollFrame.CanvasSize.Y.Offset
				
				if not p2.isTouchingBottom and Offset <= ScrollFrame.CanvasPosition.Y + ScrollFrame.AbsoluteSize.Y then
					p2.isTouchingBottom = true
					
					if p2.props.scrollTouchedBottomCallback then
						p2.props.scrollTouchedBottomCallback()
						
						return
					end
				elseif ScrollFrame.CanvasPosition.Y + ScrollFrame.AbsoluteSize.Y < Offset then
					p2.isTouchingBottom = false
				end
			end
		}, {
			sortedList = Roact.createElement(SortedListModule, {
				entries = Entries,
				renderEntry = p2.props.renderEntry,
				entryHeight = p2.props.entryHeight,
				sortComparator = p2.props.sortComparator
			})
		})
	})
end

return FilteredScrollingList