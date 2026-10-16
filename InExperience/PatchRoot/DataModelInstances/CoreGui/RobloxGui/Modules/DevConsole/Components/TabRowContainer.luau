local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TextService = game:GetService("TextService")
local SetActiveTabModule = require(script.Parent.Parent.Actions.SetActiveTab)
local TabRowButtonModule = require(script.Parent.TabRowButton)
local DropDownModule = require(script.Parent.DropDown)
local FullScreenDropDownButtonModule = require(script.Parent.FullScreenDropDownButton)
local ConstantsModule = require(script.Parent.Parent.Constants)
local TabDropDownWidth = ConstantsModule.TabRowFormatting.TabDropDownWidth
local TabOverlapThreshold = ConstantsModule.TabRowFormatting.TabOverlapThreshold
local TabRowContainer = RoactModule.Component:extend("TabRowContainer")

local function initTabList(TabList) --[[ Line: 19 ]]
	-- upvalues: TextService (copy), ConstantsModule (copy)
	local t = {}
	local NewX = 0
	local Count = 0
	
	for i, _ in pairs(TabList) do
		local TextSize = TextService:GetTextSize(i, ConstantsModule.DefaultFontSize.TabBar, ConstantsModule.Font.TabBar, Vector2.new(0, 0))
		t[i] = TextSize.X
		NewX += TextSize.X
		Count += 1
	end
	return t, NewX, Count
end

function TabRowContainer.init(p1) --[[ Line: 33 ]]
	-- upvalues: initTabList (copy)
	local InitTabListResult, InitTabListResult2, InitTabListResult3 = initTabList(p1.props.tabList)
	p1.state = {
		currContainerWidth = 0,
		textWidths = InitTabListResult,
		totalTextLength = InitTabListResult2,
		totalTabCount = InitTabListResult3
	}
	
	function p1.onTabButtonClicked(LayoutOrder) --[[ Line: 45 ]]
		-- upvalues: p1 (copy)
		for i, value in pairs(p1.props.tabList) do
			if value.layoutOrder == LayoutOrder then
				p1.props.dispatchSetActiveTab(i, value.hasClientServer)
				break
			end
		end
	end
end

function TabRowContainer.didUpdate(p2, p3, _) --[[ Line: 55 ]]
	-- upvalues: initTabList (copy)
	if p3.tabList ~= p2.props.tabList then
		local InitTabListResult, InitTabListResult2, InitTabListResult3 = initTabList(p2.props.tabList)
		p2:setState({
			textWidths = InitTabListResult,
			totalTextLength = InitTabListResult2,
			totalTabCount = InitTabListResult3
		})
	end
end

function TabRowContainer.render(p2) --[[ Line: 66 ]]
	-- upvalues: TabOverlapThreshold (copy), ConstantsModule (copy), RoactModule (copy), FullScreenDropDownButtonModule (copy), TabDropDownWidth (copy), DropDownModule (copy), TabRowButtonModule (copy)
	local TabList = p2.props.tabList
	local CurrTabIndex = p2.props.currTabIndex
	local WindowWidth: number = p2.props.windowWidth
	local FrameHeight = p2.props.frameHeight
	local LayoutOrder = p2.props.layoutOrder
	local TextWidths = p2.state.textWidths
	local TotalTabCount = p2.state.totalTabCount
	local Elements = {}
	local WindowWidthRatio = (WindowWidth - p2.state.totalTextLength) / TotalTabCount
	local XOffset = WindowWidthRatio % 1 * TotalTabCount / 2
	local IsWindowWidthAbove: boolean = WindowWidthRatio < TabOverlapThreshold and WindowWidth > 0
	local IsFormFactorMatch = p2.props.formFactor == ConstantsModule.FormFactor.Small
	
	if TabList then
		if IsWindowWidthAbove or IsFormFactorMatch then
			local DropDownList = {}
			local LayoutOrder1 = TabList[CurrTabIndex].layoutOrder
			
			for i, value in pairs(TabList) do
				DropDownList[value.layoutOrder] = i
			end
			if IsFormFactorMatch then
				return RoactModule.createElement(FullScreenDropDownButtonModule, {
					buttonSize = UDim2.new(0, TabDropDownWidth, 0, FrameHeight),
					dropDownList = DropDownList,
					selectedIndex = LayoutOrder1,
					onSelection = p2.onTabButtonClicked,
					layoutOrder = LayoutOrder
				})
			end
			if IsWindowWidthAbove then
				return RoactModule.createElement(DropDownModule, {
					buttonSize = UDim2.new(0, TabDropDownWidth, 0, FrameHeight),
					dropDownList = DropDownList,
					selectedIndex = LayoutOrder1,
					onSelection = p2.onTabButtonClicked
				})
			end
		else
			for Name, value1 in pairs(TabList) do
				if TextWidths[Name] then
					Elements[Name] = RoactModule.createElement(TabRowButtonModule, {
						index = value1.layoutOrder,
						name = Name,
						padding = WindowWidthRatio,
						textWidth = IsWindowWidthAbove and TabDropDownWidth or TextWidths[Name],
						isSelected = Name == CurrTabIndex,
						layoutOrder = value1.layoutOrder,
						onTabButtonClicked = p2.onTabButtonClicked
					})
				end
			end
		end
		Elements.UIListLayout = RoactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			FillDirection = Enum.FillDirection.Horizontal
		})
	end
	return RoactModule.createElement("Frame", {
		Transparency = 1,
		Size = UDim2.new(1, 0, 0, FrameHeight),
		Position = UDim2.new(0, XOffset, 0, 0),
		LayoutOrder = LayoutOrder
	}, Elements)
end

return RoactRoduxModule.UNSTABLE_connect2(function(p3, _) --[[ Line: 146 | Named "mapStateToProps" ]]
	return {
		tabList = p3.MainView.tabList,
		currTabIndex = p3.MainView.currTabIndex
	}
end, function(Callback) --[[ Line: 153 | Named "mapDispatchToProps" ]]
	-- upvalues: SetActiveTabModule (copy)
	return {
		dispatchSetActiveTab = function(p3, p4) --[[ Line: 155 ]]
			-- upvalues: Callback (copy), SetActiveTabModule (upval)
			Callback(SetActiveTabModule(p3, p4))
		end
	}
end)(TabRowContainer)